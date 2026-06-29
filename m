Return-Path: <linux-arm-msm+bounces-114968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tbd9DUtFQmpr3QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:13:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EEF6D8C09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:13:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hpLmwOtb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="C2fRX//1";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114968-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114968-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2EA2301CFF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4BD3FBB5B;
	Mon, 29 Jun 2026 10:09:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B02F3FC5B1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:09:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727768; cv=none; b=kAgrgZi3WuSjftQtXdx7BfVVXQx9iS1ozCvkqumiU9qwqXjqCcIuxdujVFhjJZyVTU7myqaEv0Ygs3NJHKTtVCCq6T2pihqiSajYF8xu5IT5JnLmmzXQLNm7Kmx0k9HFLdfg7SbvF0RBDV0RuYNaZhoA9oF6cuoU2N5JlrgfgPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727768; c=relaxed/simple;
	bh=BpftG47GSJlTBcPaa5FgiPfJt3EnSg5w2B8NanQnBRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1JcXOReJpt7IwBaGoHnlvFcDEBvafnti4D5o0vRf/qpSOg+4jMWtFzC5OkR6CbmdaK6aSbJ6f3LudWgGgvu/hHGs0HxTbufa1NSDji7Vs21uITACJvGIQTAqfib3lsq5h/nAXALbXw3wFB8Og9VNuoiqqEWgPhmmOarIFyJEQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpLmwOtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2fRX//1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xg2m2431950
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bfgHJcmfjiF24CciQQgoWa9Sss9/fYHUQe8KWaMsEq0=; b=hpLmwOtb1BtB4e6i
	hT2DuPKyFu/UFeiczG5ALH+BsMB3E0jJYPRHFE/+piAxyu9RXr6HZMsWdlnNQKPF
	5g3lmx9L2UA332Fjr33PPPlNT0U3TjPY1DrLdigcA/NYr5xTc1iUqNpyyFu5CVvb
	aaiXpTaCN8zWh3CbrqHfLb4+gNVHqDNQrWE56rwNMHLONhuTmBW+5pwy3pyNnJYU
	ZrlueZGqTy0hg7/HCQ2sV269R9pYPS+KNXwoksD7EuUxioGJ9TzdxbqgNl61wO3i
	tcMmaMU+PXk3rSyFJAbJAMKsgsmb5wOW5bk10YDP3hccwvYQuEiiopv7FGCMlQBe
	+gvYOA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3npera3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:09:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fcaf3fe72so1653004a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727763; x=1783332563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfgHJcmfjiF24CciQQgoWa9Sss9/fYHUQe8KWaMsEq0=;
        b=C2fRX//1DEVNCwoWqxig1J6CigkpeCKYjs58Nfs9PebL+roSdsAlda7Iu35H+8dFPm
         Y09WF61DSMRs72UCWF+O2erRyR6Mwhb/Bxq/jLDmaAgWRorZMVkLfMUoG6+w4zL3tP5t
         2cOE9t2Zu8RGpiNUzU4+57qLvcuTKEOlFiursDvRLkgTSYcGvm1DtLeOGTLO7rGgRfXJ
         hJ6X20wd9ahh9cZy852P5f7NbIK0qeecGq0y3piFNErqEUogSLT8Wolaxwk7FMEUuMZV
         9ukytLo+Vb4zjzv86qAZYBKPjPTre70RkpvDeiEPJU+cw9PmuRnwzApcrjiweQX/SWnX
         R39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727763; x=1783332563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfgHJcmfjiF24CciQQgoWa9Sss9/fYHUQe8KWaMsEq0=;
        b=i+oIgCx6luYgoHrHcSB0iC/XFPQMi1izKmFslBBvViVYz1X8b7gYUqD2xqZr0YRSV2
         qKtCVaizW1nlQ8DWUFFN/Hfqg/VvHaID4pwlvcSQyUKyMwMt3dt7uNMi7Tz3aRldO6mr
         qJqpGUAmANszqjRGRSmZBo+1XnvFJvcLQ5y3vVZWTsaP5kBW4bnh6yjvKyFIS6GVxkQm
         ZYn+DqEloKDCNrCMMgIAUp0y1vdCHHgJMfMfl00g0iMGaLMYiJ5q89/4F3wggBIk6Jad
         O1NK3wgPUICAtgD+CPBbXXpxr13E7u7vFBTp5Qh+M3zjwBl6Cf+xK4hXeG86UhHuT5gF
         W87w==
X-Forwarded-Encrypted: i=1; AHgh+Rr2FW14RKxZl1qbrU8NIjnSFPqlsCUeKBMLv4Yzw4CuoJn6nJHZVLsSUVpZKERQ9ddLpE0xZQp4vbpr7JUE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Np66yAcaezhBSVcK/Y7Bt2gT1LI/4G+arMH5DGduzmKZQO9x
	zCdo74ZwQZeG52vxkiTmzM9DmFzf2wUEpylWBIRZ2/jFN9QpERs2YOm3QyXmrvEfYZiQV2Kh5TA
	dwLVRLPyVrz2lp3ZSfzSOMq/RJaVuKFECYEgUV4TJ+JhhzxdvEhj7sp8vUTXX6Ryd+1D7
X-Gm-Gg: AfdE7cnftxN0YSVyzqVaH4SM5lqEUgGCFfrhAW/2J1UoSiIq3jxrjOH5XnIFePiLDxa
	C3OZWwk4UAQqbUZPewIODgdpe2+hMoZu7kjki30L7MVr4w4OyebefqhD7NOlKdTRrShK4Mft5kY
	1YzDY1XjruL7wqAxyT9NmSzoQX/jfSArzn2HxyGNgFiulAgNdIB83edidwVD9INoAAv0QlIR/m6
	+tQhQC/TqTi6DPfq0AE24R6yTA3Coa6XrxIf4WFjftEl3zwTyrIoIR/kSx6movrd2RKz1CiyibS
	Aokrjal4l5dLcLvWS4APbVNpBvoK3darw6tSigQvMpo7buKQd4ziJpogwat115ghV6lKsJMkHkD
	i8fgyzXYNRJ4tQ1yHYTfwk95R9KoeeHIE44ddHPw=
X-Received: by 2002:a17:90b:2d87:b0:37f:eeb0:693 with SMTP id 98e67ed59e1d1-37feeb00860mr2948843a91.23.1782727762574;
        Mon, 29 Jun 2026 03:09:22 -0700 (PDT)
X-Received: by 2002:a17:90b:2d87:b0:37f:eeb0:693 with SMTP id 98e67ed59e1d1-37feeb00860mr2948829a91.23.1782727762130;
        Mon, 29 Jun 2026 03:09:22 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e20583f05sm2965180a91.0.2026.06.29.03.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:09:21 -0700 (PDT)
Message-ID: <22be7d60-309f-4a12-a11c-11ae99bcaddb@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:39:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: qcom: dts: Add display support for Shikra
Content-Language: en-GB
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <pm44eparuibjnei5okhvfmbbeonq3rssyic4yjmhqx54ahk73w@2x7k2vgmtujo>
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <pm44eparuibjnei5okhvfmbbeonq3rssyic4yjmhqx54ahk73w@2x7k2vgmtujo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfX2GGfF2CXJ/4O
 kGBFfj8bGdgAg5JYr59Dnbv4Nr6Ov96rwH3WVtm3coV26j4vOAsCjtJsp4fsn98XkMPmv47Yc5p
 q+JLqoovfIMtEi2P5oWX5USjqoyziU8Bxq7AgWvYAgMBF2S4XxDsPNMo/DgQ6itxw0A8GQVVrUA
 T5uQg3AI7R8Q/dUvC2/IkabsOxv7fq78i+5HehHmNlQ+TONQPSFsBOo8oU68E39dUhA8keU3Ghe
 56mIkhRcdAu7pdecXNQbsREByy63nAU2JFYIq0t1rqiLbE0u4RrqEDGhENN3f1ZZRllH1BDfgJ2
 LeQRpWTQhl5GFOHz7vpHaWHdeNfUXg2vXafw73UnJDBlNNMIwtsz3HhdLGNY2p9Smk1a7ngVEbe
 NF4Vzk6OQihmBQlfLV0CDC2rH4t0RplT7G3ngPM2DGOF4bo7YqhC+Sft2thEOrQm2gCJNEIvpVE
 7PaD2X3NJZwFVqMLs2Q==
X-Proofpoint-ORIG-GUID: VutEj5Fbk9txJsWtpbZpXgS1IvhcLD2K
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a424453 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WtsUV9w0aFqfNevCzgoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfXx+6g4AfXvBCQ
 Yj2yhFAG/GeWHczhSA+kltT3/syzbz48//uMvc7SZZC1Ap/M+SB/Jr3b7rC3RMFLQLGZ1auPINK
 Z40UmNB1UUP4PS7nqTxpHzifZRw7F6w=
X-Proofpoint-GUID: VutEj5Fbk9txJsWtpbZpXgS1IvhcLD2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114968-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6EEF6D8C09


On 6/28/2026 5:54 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 27, 2026 at 03:31:34PM +0530, Nabige Aala wrote:
>> This series adds display support for the Qualcomm Shikra platform.
>>
>> It introduces the Shikra MDSS display subsystem support at the SoC
>> level, and enables display on the Shikra CQS EVK, CQM EVK and IQS
>> EVK  boards with the required DSI panel nodes. It also adds LT9611UXD
>> support for HDMI output.
>>
>> Nabige Aala (5):
>>      arm64: dts: qcom: shikra: Add MDSS display subsystem
>>      arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
>>      arm64: defconfig: Enable ILI7807S DSI panel driver
>>      arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
>>      arm64: dts: qcom: Shikra LT9611UXD support
>>
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts 		| 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts 		| 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts 		| 124 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra.dtsi        		| 203 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>>   arch/arm64/configs/defconfig                		| 1 +
>>   5 files changed, 534 insertions(+), 2 deletions(-)
>>
>>
>> Signed-off-by: arpit.saini@oss.qualcomm.com
>> Signed-off-by: mohit.dsor@oss.qualcomm.com
> Unnamed people? This is not a valid SoB tag, FWIW.

Right, I missed adding the name.

I will include the developers name in the next revision.

>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>> Arpit Saini (3):
>>        arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
>>        arm64: defconfig: Enable ILI7807S DSI panel driver
>>        arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
>>
>> Mohit Dsor (1):
>>        arm64: dts: qcom: Shikra LT9611UXD support
>>
>> Nabige Aala (1):
>>        arm64: dts: qcom: shikra: Add MDSS display subsystem
> Huh? Suddently a different set of authors for the patches. Please clean
> up your cover letter.

Thanks for pointing out,

I will fix the author name and clean the cover letter.

>
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 104 ++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 104 ++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 122 +++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 203 +++++++++++++++++++++++++++-
>>   arch/arm64/configs/defconfig                |   1 +
>>   5 files changed, 532 insertions(+), 2 deletions(-)
>> ---
>> base-commit: f28fb4ff0d25819c58341fec6e3953f1ebb1fc2e
>> change-id: 20260626-shikra-dt-changes-8d127be951d5
>>
>> Best regards,
>> --
>> Nabige Aala <nabige.aala@oss.qualcomm.com>
>>

