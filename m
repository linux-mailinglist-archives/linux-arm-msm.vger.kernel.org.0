Return-Path: <linux-arm-msm+bounces-100657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GOeFsT/yWl64AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:44:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A5F355597
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5C8C3005AF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E733909AE;
	Mon, 30 Mar 2026 04:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X00b5A9c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZzKGuhMq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F1137CD22
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774845889; cv=none; b=RaPrck9gSiHcHw9GuIkFKxJqNx9MYc/A1EO/l5AvyWic52o4oLChsBaxph6uBp/+wcBnSLqO1Jpfxe5mRKTZATbXAUfniWYLuwfbGZJGpRHhMiEwxMVd/fkakMMe9tYDbjMM5Jp71rBnmhZh9hXAvhmlsYJRwKwt2BmY87Ec630=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774845889; c=relaxed/simple;
	bh=OmgR+A5aBUyQQzCcbcUrE1vjUaKlJ7rD8ByB17WnhBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=myDKMiwU9r++YXqDu26bL9e7gnSVqZo+yiaLZmloNZMYPfey5fhuiJokDb4HPsQh14n812Og42SwJJAhA/FHaph1Vls+/nfxo6MIhXAv0kVV5OOwOwmi1k8s+gseSHf2nHrj0zyi1snlt1AqjbwNOhsNZNueOqu13NEIeqA7xVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X00b5A9c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzKGuhMq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhYOj201408
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gQZ545nZTJlyfVvOJC8d3yTp0OQR2nViDIMcw9VvpJM=; b=X00b5A9cYIPWiUzr
	4Os1MaGeiCeHZ0ef1GKbuuGWqLse+K7crzI8NDw5dZa3jl1+MdHW8uZBr9FKafde
	WKy6AvFfMAsq0N75eaLO1CYNHrkr7s8oIHOqscV9NB8b88lFhp5nNVxZTC27G0hH
	5wiTzqij+3kjE2xorDd2zDlA9T6+t7r2LnqNtKGyRskQ63vyAnr1hGN4E3F+2gaJ
	MruKYx+MZ18mOxajo+le+KjEfO0Yvte/lxTJCulUllvUyxf2KyUX1KpmVmu1EVh9
	OMv+7l0GR76c7uae+PBqTRAedewxaXM2ApT7FIWo9ecvS4SHcoC7z5aEXay3frtl
	xqpnzQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwmg4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:44:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b241be0126so69884125ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 21:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774845886; x=1775450686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQZ545nZTJlyfVvOJC8d3yTp0OQR2nViDIMcw9VvpJM=;
        b=ZzKGuhMqI7zk1LTG6Ccpf3x4Mq2m1fvzSWN7Ln3MgMgSXuMpnGBh4BOeCWVb6byEul
         qw1kW9/ie2oXDJRMH9fC9m6pHwfQf5WJEZhRtbu6kLhOtM1vxrNUab1J69JHb3ZLqyxP
         OsUL0M+baGPXyY+KxbefQCA9wmqRlbBvpHI/uwuehY2arrsa2PyswPgjNp/R18fojwYI
         sO/C67pTxIc9MfnK3go1IU4IwWc+OydJP+Rz7cZ0ER7jPWWjfq2M36y9T1X2abpUzlDf
         tzC6bRv7Tcf1uBJRmF7L9zJECG+XGKXRKM+hnr1QdJHymRjWNNdlbrXO1IIiD5VkFAcF
         Cd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774845886; x=1775450686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQZ545nZTJlyfVvOJC8d3yTp0OQR2nViDIMcw9VvpJM=;
        b=X7AjXx9DJ9xR0XwInp7ZvkH25OJu7t+qpThtlaX6KlC8J+k7xq1cejM0dX4mVj/ywk
         9nqoZzn9MDwHx7b2dNKVnGOnW/9VFSorLpYHgQiCuIOi0s0z50pLk+aEwAgNByRoU/rN
         oZY6N/sMBi19j/8lV6DXCwhhwKDOZmUdw57jog7sNsk6WwF4CObeT0gVw5e/HrIDKv1U
         9zIQfy6X0gsco+XrJ+/epMz9PIP//es5WGTV5OdSfKO2Tf9ziEoTyHIFHeOCINMNcfoG
         5AbAR0TNxicIvtG++TW79o77VglXE6P1YXe6UV7ATZN00w9BL1GQ/n1lpaHAs72Lhjkf
         futg==
X-Forwarded-Encrypted: i=1; AJvYcCVCPp23aMYGZWGFX2dKst0MAV5Xi54k4kc0mKKoGUzGupZaIzgJPGul9PnPTujto7kqinLZCYFM6G0o5ksz@vger.kernel.org
X-Gm-Message-State: AOJu0YxPyk50G8jVaGS1+I3D7X9PD9kk5y5LzNVUmZ33s+xeXgPxpt1K
	qZlLGwPv2bK/zwmHqBgoC1wO+R5JW1mYdeU/2xmCEPL3cpTu1lq1X8e4yAiqnpNDW4rMVKUzMBd
	yeWkRgDwLp9BHsUg97AA4klJCeUoZmAzaJ6maS+wPcidBeXBtD9jrgNcz7sK1npfhI1TX
X-Gm-Gg: ATEYQzzlrlvWjCqa+zjHMi0TqTrEfqhVm9FA8vnNKOD1tlL7/BgO636ywEmkdLBQ1xY
	ebO2eRbUPPAlXEd3tcylic4DJ3rQ8ja9EP9XVt+Gs+8PI13TDuqNoRk2hVV7+lYNRmsgmw5m6s7
	+EAk54529X7vyZxC7xfaN4nmpd5hf9WBPbJgcCMK+8op+j7oBqLcilz9CaDLUQ720YHsblXZspW
	NuVWADqlw9LxxReFXz4Zp53R7T3ilKgBUEwvLAr+JIh0LE7HBefhOaAKZmnt+CtMmB2flCoxoQH
	O6YIDDiPPSQz7f2x22WeJye5pDyXpDlhN6025UaZvywgKDdmsYaNweHarwQ2kb2Z8Xieaz2lKHK
	Ze6Z6CFPBJwHrFecpWVQ1FR2Mx0QOI7uVmi9j3iSTIBML79t7dyD5Ug==
X-Received: by 2002:a17:902:c946:b0:2ae:a8a8:92f3 with SMTP id d9443c01a7336-2b0cdcfa1d8mr123676605ad.44.1774845886328;
        Sun, 29 Mar 2026 21:44:46 -0700 (PDT)
X-Received: by 2002:a17:902:c946:b0:2ae:a8a8:92f3 with SMTP id d9443c01a7336-2b0cdcfa1d8mr123676315ad.44.1774845885832;
        Sun, 29 Mar 2026 21:44:45 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264256asm64599685ad.13.2026.03.29.21.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:44:45 -0700 (PDT)
Message-ID: <f0098f5b-1ce5-474a-9249-bb399be46a55@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:14:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-6-3efe59c1c119@oss.qualcomm.com>
 <xxylp75rlr2r62ehqxs5x7f2gy6gezbkuil3scrql6x5o5uowm@myb3riehntmu>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <xxylp75rlr2r62ehqxs5x7f2gy6gezbkuil3scrql6x5o5uowm@myb3riehntmu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69c9ffbf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GBELfx7eKJZFaBSPsRQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: iDJmNJykZMzZhM_l7k47qg3L8IG9NY2L
X-Proofpoint-ORIG-GUID: iDJmNJykZMzZhM_l7k47qg3L8IG9NY2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzMyBTYWx0ZWRfX5xDNRpmZLiTL
 Tp9WPrgGTi2yeQVnoBZBtt/vNG2faee7yT39HlwqmRp9vGMtXylBgA656bAnlZ2w3dZF9smXrNF
 YFLpIcQee8xFcw1d4rebbH9b7yyIdUfHWjdiseIs7ZCPGR/31vKJTBoIMShCCSvPhO04jY7yGIa
 UdERZke6lcFIJx8oTkV5PaT/OPpIMceoBVBDSLJsqI53bZGcGT+C4+sVmFt4wx7TMzI6aWPvo6L
 KupBxMPrq8hj3FeNC0Q+H3VKSkP//b4cYynjzNV6VSKBaZF4RDfmhu5sCQfW8PXdRFyK6nbbXAl
 lVql9zvlLtUnad649Kp6Pr79hvjG4HbmBxh9L+TjeJHn3+TUAflCbIiSgle+kMNQoGHyZQNeVci
 Tvc5sC6z90Z5gLmLVB1luJbqLhI5jiWfixsTtIfwwP+y1Q5rZa4lgBf6lde8T9fm0H8qFrbHdmn
 shvrArI/tGoL4hKBIOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300033
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100657-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5A5F355597
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/2026 2:24 AM, Dmitry Baryshkov wrote:
> On Tue, Mar 24, 2026 at 06:43:23PM +0530, Viken Dadhaniya wrote:
>> Add the missing QSPI-to-memory interconnect path alongside the existing
>> configuration path. Without this path, the interconnect framework cannot
>> correctly vote for the bandwidth required by QSPI DMA data transfers.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 45b9864e3304..7093b39e1509 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -2864,9 +2864,10 @@ qspi: spi@88dc000 {
>>  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>>  				 <&gcc GCC_QSPI_CORE_CLK>;
>>  			clock-names = "iface", "core";
>> -			interconnects = <&gem_noc MASTER_APPSS_PROC 0
>> -					&config_noc SLAVE_QSPI_0 0>;
>> -			interconnect-names = "qspi-config";
>> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QSPI_0 0>,
>> +					<&aggre1_noc MASTER_QSPI 0 &mc_virt SLAVE_EBI1 0>;
> 
> The same, please use QCOM_ICC_TAGs

Sure, I will add it in v2.

> 
>> +			interconnect-names = "qspi-config",
>> +					     "qspi-memory";
>>  			power-domains = <&rpmhpd SC7180_CX>;
>>  			operating-points-v2 = <&qspi_opp_table>;
>>  			status = "disabled";
>>
>> -- 
>> 2.34.1
>>
> 


