Return-Path: <linux-arm-msm+bounces-98024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM1bDLBWuGmKcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 20:14:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 972B029F9F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 20:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D89CE308DCE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775BB3A0E95;
	Mon, 16 Mar 2026 19:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRQOn5Tv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dq5xrIMH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF37033A708
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773688202; cv=none; b=a+NaaVsgHV69MaZU15xwLXevARwdq+6dQknukk8DGWmGjF0o4OFnNe0xp1vMzAxC1NNyg6+/VvqLbG/SPdOC6oTW0gj/OJ+aBHfX9MWRdkkBWZEr1SaZ2/38dp81uBOrekMRShKAfEZPCRcgRYDa29dUKegGe9YrDAfxZo9qIeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773688202; c=relaxed/simple;
	bh=QsQtLlJSPOv1sKnZGmwXwyxc7PrF81ZKaJHGphJBf7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YMoHO+jk4WsI59FRLJyB5cFlBtZExEiEsmeL9xcK9NnDTE153oh/f8DqaXTrCPUcmAw8QCvoRfxAeurz7QrGm37fnDJX4UK53oWjzsGNrEX7NO39EXsKGZ6D3ajxNKvRFd+5WKLg3KE+Dh6anUrH1hhoVwfhzlwMJpuKeNIK6kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRQOn5Tv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dq5xrIMH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GG6RdD4022277
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iINkHIXCR3qm35NgNPkuCJlD/4LRUdoaYUjB1EAMwpE=; b=QRQOn5Tv4QVMq21C
	E2o3vcu34oDJ0XQHyNdzmlUF9EgUpDVTGsxyNNjzwtV4qbZU/mubNEyWLKKe1QQB
	Zr/P0kZMEgvq1IGf03wyA02aq5GvnR8eZwdrVQOl5wPrCeBRCjtF4rVmBMeqZarj
	kjTi6ZMgHaxhKeQMbVWguaTWrAOIBTVZPJvOWtjeHdV485+pMIp5JbFUrfyu8RPy
	d6BC74fF3yujrSydJLrehuw1MPTlvyJUM93dH5OOcMs6P+GZn2duFeUYSXabxPSI
	dQpqXxv6usL0oc6gUV0Gc9JvyBumXzLrua80/ZNYvDHB2EWufDTvzP+OqiQrfn+U
	rsPMXg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fgmv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:09:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdd327d970so15682eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773688198; x=1774292998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iINkHIXCR3qm35NgNPkuCJlD/4LRUdoaYUjB1EAMwpE=;
        b=Dq5xrIMHgSfICC67VvR2lqgKFG03Ec/A5jW2fBetWWREe6uXsSqMAMC233idzVw4US
         k/75mgf69R8zoyhRVARGVExsRpMHUiAi+qnbttOo+ZJE+MsZ2LUB44HKkLAZrviNrsMq
         It6zs6YQ2nChGXm98hqYP3ykBFpdFiJ4fjYwM23ZP2B2WhmHLMqb/qiF1FtzeN4le5j+
         goeT5w1Gte6lNOVu3ZMQ5Ho4xOWGuKXSFv2d90i9JUYZwzxcyjKpwc0gOHjRmKx7mX24
         ZxKA6cdbpXMx5gWdZy6XXCR7D4eYmW959ESJvF2KebsTfFAopEePp/xxEgqMo8xsen3p
         EGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773688198; x=1774292998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iINkHIXCR3qm35NgNPkuCJlD/4LRUdoaYUjB1EAMwpE=;
        b=AZkggPq1iFj30vHCvf1PO+yswIrqkv0TVIo0jOXT7unsnDS64Ho8iJghxmn/y1rwOf
         kiN10tDKA7LGyE+te3xtrz1m+q/utYmfJQddGEwi203nL6KRscb3jbw37z+pcYgMyLn8
         TUfPzDu71wxipiW9aIeUyTJOnzJgJidDfNUOGMvLkZ89LItcm8QoYUslUJqwP5oNBy+p
         BvGefbczo5Imei68a+OLfpvHrpF+7CQFCRUG6NdrXeei2PfyDtqnkYROpfxN3mEXLmQk
         tk8CD2xT2TlCn21QNJ9O/ODZ1VjPQiC3lm0QJfUN5pJ3vJf3gIaf/tapMPqNj9VnEhXP
         hS5A==
X-Gm-Message-State: AOJu0YwIXUBWq+EQFQgedBDHyJGAAa/a/cEXiJimFAk5QRDQngZwke2e
	BJ1XAgppaTdq5oi3oize079wOBLOeBrjZ788fTxcnaQjk5N3rPesNBt4fb//Mom5T7rvLXQ5ooW
	ZBBNYA32Uir5kWH0zD+h+IsnHqC6fhj3aASw2GXTMfKaRfGVNki37zhiqvahLt5yvI8Dj
X-Gm-Gg: ATEYQzx0nd2Y5DA8XDWHfen0S2n+M52J1KoLrWd4xbORYsNIqYSD2WFY6XZyGPHzmQO
	whhABrGK4qN7b5lsceJSaRc9G837CsCUq73vjmC1po+U+jIRzbVO0hCDIf7ZgLxgW7LHy1RJkRp
	0FQBZKT4MmSzAqPLTn8ldwMwKaMg4U9BoJuOn99cvsdCpgk5X7GAgoFbmgPFfnNDEQTeYT23HxL
	CJw0vg7JvkX6dbrzf0OmCpYqjOSWdVpWreE8j7Ff7uAXnPt8SpyA8Ahf4qVnG83wy9DiF5rXZHS
	IeYzFm5PWk8rb04G4+MeZDeFnGyDMb96BG5BPqEZn71n0lDi6xscs8QHR4FQ9KBFoHek2Vv2V9Y
	bB8VEjaKIy/+udTaIfV7OWr+fZHD4UJK0+IiyFn3uXJowGDtTM+nBCIAGd/xsWaIxRshKmEscJg
	OBsQ==
X-Received: by 2002:a05:7300:fd0d:b0:2c0:c1e0:2449 with SMTP id 5a478bee46e88-2c0d50937f2mr291706eec.2.1773688197804;
        Mon, 16 Mar 2026 12:09:57 -0700 (PDT)
X-Received: by 2002:a05:7300:fd0d:b0:2c0:c1e0:2449 with SMTP id 5a478bee46e88-2c0d50937f2mr291677eec.2.1773688197201;
        Mon, 16 Mar 2026 12:09:57 -0700 (PDT)
Received: from [10.71.185.57] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab55541fsm19033473eec.24.2026.03.16.12.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 12:09:56 -0700 (PDT)
Message-ID: <5761930a-6023-4340-ab84-6f29b710b6fc@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:08:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Introduce sa8255p SoC
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com>
 <20260304-b4-scmi-upstream-v5-2-f8fc763d8da0@oss.qualcomm.com>
 <CAMRc=MdWSU82R-tGor5uP=UqosoV6Hjmpn03XdqAgVzhprSGpw@mail.gmail.com>
Content-Language: en-US
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdWSU82R-tGor5uP=UqosoV6Hjmpn03XdqAgVzhprSGpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b85586 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=sPLWTQPP7WlI8Cf4OggA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: utLIb7PA5rm20q4UqcyXw_pG9Q8VQXdt
X-Proofpoint-ORIG-GUID: utLIb7PA5rm20q4UqcyXw_pG9Q8VQXdt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1MiBTYWx0ZWRfX+6d/v64cJ3ol
 ogw5m9D9gb9fL89jd5hgEACez0qKudf+mH/R8FqETQNTQ96DVjh/rJ11JsTu6zBjyLMkpfjwJu2
 kHL932kR0JO/p5Q7oHQC38PXaEjsae1wa8YAcRJE34zZ9TtcMJIHE5Ab+X3w08sqjs3Hdimddd3
 tcJfNVHh3WEx6UrA7ycfQ7M/V7S52blTRo1YUZf9B/3CEualNUiQOx6jg7g+BdV0LdJJkKKU2SQ
 mPOhiEEptCtXKna9JRGKXgAQhcm3ydKkeiEZHrSH1i0DlkzdFy8vcnSQM2RLkFG5wzo5f1h2eaT
 7UTR9kqAv4QnSNUcx/z9nRH5yO5q2zs8A7gXniM2AyFvq9KpUXSTbGdU1zuZ5YBmB1KKyqIrbUq
 QHbjVP2TxJ3XrHidQS/RzXUO3D/l/2xJG+OBBYboSQeUGRnKpvhHp1znRR9yyLRP94eyVc+BpXO
 A4nT6gholzebCpHZu9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98024-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,linaro.org:url,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepti.jaggi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 972B029F9F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/11/2026 6:31 AM, Bartosz Golaszewski wrote:
> On Thu, 5 Mar 2026 05:28:29 +0100, Deepti Jaggi
> <deepti.jaggi@oss.qualcomm.com> said:
>> From: Nikunj Kela <quic_nkela@quicinc.com>
>>
>> Introduce base device tree support for sa8255p Qualcomm's automotive
>> infotainment SoC. The base dt file describes core SoC components- CPUs,
>> CPU map, ipcc, QUP,  geni UART, interrupt controller, TLMM, reserved
>> memory, SMMU, firmware scm, scmi, watchdog, SRAM, PSCI, ufs, pcie, pmu
>> nodes and enable booting to shell with ramdisk.
>>
>> The Qualcomm automotive sa8255p SoC utilizes firmware to configure
>> platform resources such as clocks, interconnects, and TLMM. Device drivers
>> request these resources through the SCMI power,reset and performance
>> protocols. Assign each device driver a dedicated SCMI channel and Tx/Rx
>> doorbells to support parallel resource requests and aggregation in the
>> SCMI platform server. Operate the SCMI server stack in an SMP-enabled VM,
>> using the Qualcomm SMC/HVC transport driver for communication.
>>
>> Group resource operations to improve abstraction and reduce the number of
>> SCMI requests. Follow the SCMI-based resource management approach
>> demonstrated by Qualcomm at LinaroConnect 2024.[1]
>>
>> Limit initial support to basic platform resources, serial console, ufs
>> and pcie.Defer enabling USB, and Ethernet to subsequent updates.
>>
>> [1]: https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
>>
>> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> ---
> Just some nits, looks good to me.

Thanks for reviewing the series.

>
>>  arch/arm64/boot/dts/qcom/sa8255p.dtsi | 4861 +++++++++++++++++++++++++++++++++
>>  1 file changed, 4861 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8255p.dtsi b/arch/arm64/boot/dts/qcom/sa8255p.dtsi
>> new file mode 100644
>> index 000000000000..4f8529db70f6
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sa8255p.dtsi
>> @@ -0,0 +1,4861 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/mailbox/qcom-ipcc.h>
>> +
>> +/ {
>> +	interrupt-parent = <&intc>;
>> +
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	clocks {
> Stray newline.

Ack

>> +
>> +		bi_tcxo_div2: bi-tcxo-div2-clk {
>> +			compatible = "fixed-factor-clock";
>> +			clocks = <&xo_board_clk>;
>> +			clock-mult = <1>;
>> +			clock-div = <2>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +
> [snip]
>
>> +	firmware: firmware {
> You never use this label.

Ack, will drop the label 

> [snip]
>
> Stray newline? Same elsewhere.

Ack , will fix all the stray newlines.

>
> With that:
>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Thanks,
Deepti

