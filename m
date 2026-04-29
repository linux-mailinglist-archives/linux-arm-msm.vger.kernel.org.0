Return-Path: <linux-arm-msm+bounces-105095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKpcF/F+8Wk2hQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 05:45:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C4648EB7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 05:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 864D83011D0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 03:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2171BD9D0;
	Wed, 29 Apr 2026 03:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxD+YDod";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8DquPV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F238F7D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434342; cv=none; b=ts4rv/sEM44bd7HvFdevzZpi4cZYUWcu2IK0uFVHANAoVFRF1nyPz/mcFHtXNopjAFMDo7tbWqTtzB9s9LQoqLLGctZhR9tR6tmgiLQmDNLE0QnT1x1Ny1CoouhU14zOhIbeUtByfwpi1OkEXNOZj0aumoSVFXgASo4CjOaNzAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434342; c=relaxed/simple;
	bh=wbTQJeDm0ersU6wMu6P47zsx+mFfkeoRq8XwtWhXcNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jlPhwYrI8Qo2VwTISP29Wdi5WGkQskkBmECnC0GkgBYWPokjCntK19N/nwRh6MotoMlHGmODgE0FExuQeGwXjnwJRnqz3aQZ3jNOKuotYdG++4OMn6x9lC16GW6TYxnCzv3KDr4pnIyOfPRBFjEmeiVEG/mfLG6bhmqT+o+O980=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxD+YDod; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8DquPV+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3BNuo2984405
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gNT4rzTgg6PTtm2cSdeMVfAs3gh6lbBElOgnRLEOjpM=; b=JxD+YDodv9t/5pZw
	deuztASi8PevLk+eqPKsItdDx7So2bzcKvkOElD2Zu/hBG0OZmDF5prFkpOMHCGw
	pPTyiQztylcvqEJkLIlQbo8ooEcOy1e/QFsCxOg9ThmDicZdmBy3bOPrHgUTlR2B
	apbF0SgLKqX4f3Ggmbapt2o2Mh1bCHSG2LGnY4+d0mxW5aUQkE6Rla/gLSGIdSTc
	z8hU1VLDzbbxVjKTBS+uK2mP0pwR60Ds5V8txoWP5bhHQmBkl8i85TisWAwxnc/+
	9TqzVY0wiY3jqEmtvWhrdAvPAc1yDS5f8zZeo3hKGayjIV6tOcnPW792zdG/0gcX
	4iukog==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1swup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:45:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso18193208a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777434340; x=1778039140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gNT4rzTgg6PTtm2cSdeMVfAs3gh6lbBElOgnRLEOjpM=;
        b=g8DquPV+1WuN6ajJt8hdV0KWVfEXnNeHU5AvDZzzr+RR0cl7/Iop9MNnH30l+ZpvbF
         sy+whxkhZ3BABwrjc0TUNC4cyv8Q9D+EKLnqetsbiiD5LVCGv4q/hI8Q1/Pl3CEXeMHL
         T/jZbFsWiQiuBmexe1yOpY2mLmN28n0zjIvO09XL8T08AB2zgF8w7mMdSEIOYIzGATDo
         5Q+cviURhRqGfXnAQ3yJmR07evIkZLg+Y5H8Y8w6xU2W4v9gTyS0xoruWWLXn+RviUEv
         EBLkn76kGMpi//S209NQjzzZ2bwrxWxhosbmsoBRusYMOnu+a/6UFfGDv6e1BMyTnr0+
         g88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777434340; x=1778039140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNT4rzTgg6PTtm2cSdeMVfAs3gh6lbBElOgnRLEOjpM=;
        b=KzGbI3Wr2uyBHX1lDNL++j3k+6WQV1Rd+SiEq4i7JBIuauN2T3pveqUtterHvXbkDM
         IjY0kCmynD8ls1L0qrfbHTChZFkjbu4ja5P0DvvGXtZzthf58f6uWSAsF1Y0LiaELBvg
         DE3MfAV35kpvzD4yW9n5mfXXHa+RKQg4kRJrmBLV8nDOssJJL165jgRwENwiQ/cnAlBy
         5yiS6ruNGscX/Od2PTm2UAkHfpBHEkaEI10zZDTjX5vzoaRFkG/CiVzGBR0LDtROIRVt
         MDPea3Yyk7tDHCBnM6qmw2GV5HhGOFnUKPAaMrOd5U5S4DOjduPIq50yzI5wqXabCeoT
         hETg==
X-Forwarded-Encrypted: i=1; AFNElJ/LoIeLfJqELwaUmtJqh/tYFoloEsvpgDpTA8VgzTVdD2FFl0HR1yrnnSX5zC6g+p6PEpsHbN3RCAn+esuF@vger.kernel.org
X-Gm-Message-State: AOJu0YwgwEU4U7T6ErVFcezLCEAX0kDLOrycxrnfF6oahpE2qVPRujAa
	PkwrGeUeIuzD7N3Fw+OiuPZHIZKyXsnaeWGGUpNbFgHdcNwk/emHsYugfZO9I0BBUC93kGl3fOv
	U7JVWq0wqBNndiJn8MZo+zCKeuWyBTznW623ottnIqgRCIZ+Y3Xs2X74EM6RRPgQRKpB7
X-Gm-Gg: AeBDies5MqKRhXd/oqq/G6Tqsx4xDcbfjKkAQ1Pzv3sar4WGlsvnnZiuf/p6dwvOWAN
	d09DUUwyzYl/8MTxL3izDzBi7pvrC+6z6AcDCIC/e/Bp0V6d/cX3/BnOAmCVb4y5PMIEbHuNsMZ
	FtcC9L6AsIJ3Wxxz1sjGnrrdXTGHkvfpiqT1eGlb63vaXm15i/BM/RO89GwAZT+tToY9YM4dcuh
	CuyRxRND++mxXlw37xcZDk1sf298cPazhcijKaHQfXHomFblh1b3LsYqmQDyguL7HsuInn6Xh9O
	5pIULg0Wvwn/f+ro+aOM/XMMSaP5ldA+5wbozHiGlOuw0k+AkhANjGXUGvVi4IE/WgVQ2L5/4xp
	h1jU9KtEYZCf3NdJGs+5UfR4fMYk9WZNgsRB/CPQxV3EMqRtV/NZNuCmy9iatJhGT
X-Received: by 2002:a17:903:1b67:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b987359abamr20791315ad.2.1777434340394;
        Tue, 28 Apr 2026 20:45:40 -0700 (PDT)
X-Received: by 2002:a17:903:1b67:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b987359abamr20791055ad.2.1777434339943;
        Tue, 28 Apr 2026 20:45:39 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887734d6sm7084525ad.1.2026.04.28.20.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 20:45:39 -0700 (PDT)
Message-ID: <3217c494-aa6b-4060-9487-2d5b57c2db18@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:15:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: glymur: Add camera clock controller
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
 <20260402-glymur_camcc-v1-3-e8da05a21da7@oss.qualcomm.com>
 <6eeb24a9-e2ee-4727-af25-5dfbb95bad59@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <6eeb24a9-e2ee-4727-af25-5dfbb95bad59@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p53oB5_GoUm7ZiifgqiH64AbS3m0PbvO
X-Proofpoint-ORIG-GUID: p53oB5_GoUm7ZiifgqiH64AbS3m0PbvO
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f17ee5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VcKEMVW0aYsEEJBu7dsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzMSBTYWx0ZWRfX13qMfDn4gqyg
 xXFMypPJDwZg6ih1hHf8hTlsmIS0AzsdmHlbjIQUVr7JmNjS8WrLhOQwzIZs1kVnj7ocx7VDwij
 KwsJjI6QfBboeuZzkwRt3dT+UEyM2b5ef1PoDrrMx26OChU2XcZcfZF/ikOMCtcrHfPlt4aGBzF
 vxPDgm589sFHg5BYaDCbE8pgE3mmxeid732hyRePrxMp1/fdBnHTlVfZ82bdVW4x9g0usKOL93f
 tSkmnt2gpe5G6FU7DUhg2BPtNcBP0uqiZvcVfG9ETHNuqOCGot+ajO9H82K8fKsltuRWPpa37fa
 8E4GChJJGJ0ukQKIEGogFslt8Flt+HaBhi3TdirIS4tGA+3YDsXionKwfPLgKVrA+6uxQCiILbv
 ZDY5/PAiTJTLJD2EjZkrPxAl88j/vLVIpzE9bVz3+ebGAl1+pWcvwZiJDS2dfQ9rR99gfVviwLO
 1RXUo2MdqxjHQvlojVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290031
X-Rspamd-Queue-Id: 89C4648EB7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105095-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/2/2026 11:48 PM, Krzysztof Kozlowski wrote:
> On 02/04/2026 08:15, Jagadeesh Kona wrote:
>> Add support for camera clock controller for camera clients to
>> be able to request for camera clocks on Glymur SoC's.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..c32f0b84db2f38ec567485e36e8e50529e886775 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -4163,6 +4163,22 @@ usb_mp: usb@a400000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		camcc: clock-controller@ade0000 {
>> +			compatible = "qcom,glymur-camcc";
>> +			reg = <0 0x0ade0000 0 0x20000>;
> 
> Please use hex, also for '0'.
> 

Yes, will fix this in v2.

Thanks,
Jagadeesh




