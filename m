Return-Path: <linux-arm-msm+bounces-97869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLm0MwbIt2kRVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:06:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4CF296AD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A10E9301C543
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76BA383C8E;
	Mon, 16 Mar 2026 09:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XzN5Wves";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWoeMhsa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE5E374171
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651838; cv=none; b=laAu6CtobsSf51QUg2U/TE5AXReXQqGoZdbxQeTihpb5gxUc6uO4g2zdNu3qqxuzw/qnGh/g87x9/uE9ErvZ+aZKAkykQFqFJjVvLgFhJr520DimyN1vS15iv12TJ3pJm14+DywJyLNgePad1DHfvckVJto33KsP/udVzGn4Hig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651838; c=relaxed/simple;
	bh=NTcvsuGdFFCNDl1LmYf5IJqXK3/yowkel0MRzCFjEA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EvM+R+cqSP/XMKtm38AU+5789gfVaIYjrHyw4M3MQ8bJd52bMB05y9H14xdxCSx2Id/Re7Tm973Wae0Yoeg/AaAUUCIZwErDlDjVB+Oaa6+aHnL00sdsymeRyxhmA+QmccIJ7sVgEbnKPabon+yHzX0eZjQ+KWJx9WEkVgBxbWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XzN5Wves; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWoeMhsa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64hJD1724716
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxIt5bFyOn21UFobDspTNyIJUK1VFpOCpDcq0kigCmw=; b=XzN5WvesKeTofC7H
	71emGR6akr7BAIw18eRTDtKaDaPpG4SL6Ck8aNqNq7Y2ZflWiNhCemEsvK1w51iL
	Xa9Ku6lFxoPG/NnY5uwxJ9Md7InPysX4iR9VriRB3qy71IdwNN0GC9EDurBQJrVe
	lYNSmNpk0PpxQoaUoyqba0fkh98NeAAaN2Z+WqSFu1FpYHNldZTIZDBagaUSA/ez
	sP9OgmnPTocO8fAHA+fIz4AT4Ec/vvXzDtoFgcvwnLH5Wl015FYC6DNHBKNbKBl3
	DygEddJowzNJj6wGGGO7sYZI84rsvmX3PYMfDcMOZ2B1kOGInE59FU2eFCTqvI/s
	4hLFzw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udmtw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:03:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a2bd628d4so9364136b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773651830; x=1774256630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uxIt5bFyOn21UFobDspTNyIJUK1VFpOCpDcq0kigCmw=;
        b=bWoeMhsa9riDiUmH8NWPJRvIEorscO8cwUAocO9VGmZJnwNT6t/tvt50HImUP0ov80
         IH7IoYvspWlHJOgqLEy6oYEsvy36NTyY0kKewzVawkNT2lRmsBNhRd96XTg68BfuATUG
         k/VNfRHaaDFF4HsAEJwCUF5geqkZr5oky32d03o4Oa5Ncg275XgfWKFVI9fYjtUaVR43
         dmVONu2zDl9GO/U4AGeOs86b99Npp2jF2TWKuYxm1NTKuBuLnfe+SzRODFniz6vSqxmG
         WoPc48nJ2efba7hwF4oeAvZpCQkNEtpPYmMqCto3bXLNW3DSUiw3MXmFMY7w59VMIPpN
         oDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651830; x=1774256630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxIt5bFyOn21UFobDspTNyIJUK1VFpOCpDcq0kigCmw=;
        b=gy7/c0GKkyqQzXNAg0B5IOh99fkQFJLix4QhXYzaAMww3Qx7xPDyo5JVCwNzVmE040
         a2OQJt5WYyEAWyIrs4dnQ0t6cgsiQMahQTEAzqSMjAWdfq7prOhlP2Hoc3j6eHqsgR59
         unRfvGTZ9et5tbm6tXpKkrdHdP2wRtHxZfScmzHsiGd0RdNrnLlTap+L2eVSuHr86PIL
         3RuSd18DwnEAbqcR4r18c3YMbcFmDlfGgqAkhFE+eS7GROUY5Gza9tr6/FRU3b1xl4/a
         7JambZmo/pqdGfY+cImfnl3VE+ovxjA6bNZeoSYL61hzPC7xljC+w5o/glnrBIxwTa3K
         CfLQ==
X-Gm-Message-State: AOJu0YxM8Zh4Aqp96E2ptZvcbMVGLAzBFozqtVR5TJOEqt/dEPRalkkQ
	SUAPDksEVZRx2SkuPQuZ6KAuasxsIeCphCqC79h4s6fuj/YOqvhs9Havd3PHI5U30mLN0xj/zt6
	0YWxefKXKdLcFzpYsbjyMaKMz6xE9oqH3o3qJFLH5Gu0eJ1z6jcKqZWudun6upYKDhGuc
X-Gm-Gg: ATEYQzzKP9GaSTAH1M7ieXUHLJK0j4TF9eKSL4BbY4SIH1B9MChaOXoRLnw+J7Sl2tJ
	SIEa34oyUpy/qHjQbtsxbED2Z3E9ELWhUjC0J212ogzGZY/HfGIA9Bm+IWnUfsFUl512ITJR2hV
	8ao5VB2k5LOvg0dgVQhUuUbog7lYWvdH27Ihr6kBRBAtX/AR/1uOqd8A3H4lfp9fwSNu7PGA9lh
	sU4UyIwTLiKsKC7mXT21t2ImmhAUQ8OCpSeA9tbcEt9I9q6B+l+Ad0HH4ScU6rskM7e4FOYs3h9
	d67welpbes2qJf1fp0tj0db47PyM0qQzL3yhqMNPCqDiKU1+wJjKGPINtpXpzmUB4p/ViDn94SW
	4trFEYc2LQGMgvVnJBlW3YUP7dziRW0+rKHcrJKWpm+nIPKbr4g2oRLcHmCfBpSVeWQ==
X-Received: by 2002:a05:6a00:761b:b0:829:8e63:fca1 with SMTP id d2e1a72fcca58-82a198d4ccamr8653982b3a.33.1773651829981;
        Mon, 16 Mar 2026 02:03:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:761b:b0:829:8e63:fca1 with SMTP id d2e1a72fcca58-82a198d4ccamr8653948b3a.33.1773651829361;
        Mon, 16 Mar 2026 02:03:49 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07244071sm13207421b3a.6.2026.03.16.02.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:03:48 -0700 (PDT)
Message-ID: <84f1407d-62c6-4ec2-8976-eabe66c74728@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 14:33:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-8-fe857d68d698@oss.qualcomm.com>
 <6e33daf1-bb90-47d8-955c-12ccdd30ebce@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <6e33daf1-bb90-47d8-955c-12ccdd30ebce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7c776 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dbLGCUDwb5mCwCoKLG4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: zir_nWbgGKVubpagTStvvziU2bWNRwSg
X-Proofpoint-ORIG-GUID: zir_nWbgGKVubpagTStvvziU2bWNRwSg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2OCBTYWx0ZWRfX0nqkd7lmd+mR
 8dzXUngUVxi/QU8S3Gkvy9k57L+q341+fLle+HdhDY7bfEU7AwJKuK/7+SSxkenkfmtHmQHdYQP
 gwYXcUSzdnIxBYLPVJJO1rqMlo2BPkC0eIuWECunxVA64XDfNZ/FjQbRqjApMBn/nQaj4nHvq6q
 dW2sackFnVwmO7aDCPyOgo4O2Z4WiTtnMRETBdRDY5NnWfw/ogfiJxh3+Rsz3tOoRfdjzb/acWz
 jKPeJAXYWGYCG4DqD2gepyN86VWAy9Gi77RljFZodEZfEjEDIJBOJCCxUwNnULYDovPPavq1Bse
 U2rUhV2lOMMi/DSzNCVE5pa++cMlo7u2jXf5Cmor6OVjCGuOXXu5heWyzcUQw167fHcvnt8atSA
 +0XFx+lO0TWTnfpJcDSHG73MngrvQKZH57jGBctkSI4vDXi0lWY5X1k0u463DEcl41rglE+9BVF
 7H/PJA7T1lOsxlMqpNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97869-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,1a84000:email,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,1ac0000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E4CF296AD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 6:18 PM, Konrad Dybcio wrote:
> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
>> Add initial device tree support for the Qualcomm IPQ5210 SoC and
>> rdp504 board.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile           |   1 +
>>   arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  93 +++++++++
>>   arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 304 ++++++++++++++++++++++++++++
>>   3 files changed, 398 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 02921a495b2cbabcbacc74fbbb99eafe1f6478ac..e7748af640cccffa5c83ec82c37aa441444c2b13 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -22,6 +22,7 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
>>   dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3d95939785bc5bd4f510e2f992f0a1e80848c8de
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
>> @@ -0,0 +1,93 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "ipq5210.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
>> +	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
>> +
>> +	aliases {
>> +		serial0 = &uart1;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0";
>> +	};
>> +
>> +	soc@0 {
>> +		qupv3: geniqup@1ac0000 {
>> +			status = "okay";
>> +
>> +			uart1: serial@1a84000 {
> Please define this in the SoC DTSI and enable it via a &uart1 {} reference
> from the board DT

Ack.

>
> [...]
>
>> +		xo: xo {
> "xo_board" is the convention in other DTs

Ack.

>
> [...]
>
>> +		L2_0: l2-cache {
> labels must apparently be lowercase nowadays

Ack.

>
>> +			compatible = "cache";
>> +			cache-level = <0x2>;
> = <2>

Ack.

>
>
>> +			cache-unified;
>> +		};
>> +	};
>> +
>> +	firmware {
>> +		optee {
>> +			compatible = "linaro,optee-tz";
>> +			method = "smc";
>> +		};
>> +
>> +		scm {
>> +			compatible = "qcom,scm-ipq5210", "qcom,scm";
>> +		};
> OP-TEE *and* SCM? What does the former do?

For OP-TEE, we have use cases like getting the random numbers, 
remoteproc PAS and few others.

For SCM, setting the download mode is one typical example where OP-TEE 
doesn't come into picture.

Please let me know if this helps.

>
> [...]
>
>> +	soc@0 {
>> +		compatible = "simple-bus";
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges = <0 0 0 0 0x10 0>;
> should dma-ranges also be 36-bit?

Ack.

>
> [...]
>
>> +		qupv3: geniqup@1ac0000 {
>> +			compatible = "qcom,geni-se-qup";
>> +			reg = <0x0 0x01ac0000 0x0 0x2000>;
>> +			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
>> +				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
>> +			clock-names = "m-ahb", "s-ahb";
>> +			ranges;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +
>> +			status = "disabled";
> I see there's only a single QUP wrapper - therefore I'm going to assume
> there will never be a SoC where this needs to be disabled

Ack.

>
> [...]
>
>> +
>> +			uart1: serial@1a84000 {
>> +				compatible = "qcom,geni-debug-uart";
>> +				reg = <0x0 0x01a84000 0x0 0x4000>;
>> +				clocks = <&gcc GCC_QUPV3_WRAP_SE1_CLK>;
>> +				clock-names = "se";
>> +				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
>> +				status = "disabled";
> Please uniformly keep a \n before status, file-wide

Ack.

>
> Konrad

