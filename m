Return-Path: <linux-arm-msm+bounces-97319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKs8HIWvs2lYZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:32:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E5C27E2C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E483D3063770
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 06:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E35E31F9B3;
	Fri, 13 Mar 2026 06:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCFouf3f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RicL4aX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E397D10E3
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773383482; cv=none; b=fhwr5TOa7UtX3UfzHw15twtFWX73PLLfOjC0p2ZI2+SpAmAH0CESwBJjYFuG79U1LuEoeqdt5umoX5R5oq2uDdH1kjcCiBE+VNt9ZpkGTCs2EjhRnTNEiPJ1fpYmDq0UZbpOdVmZvJZerTYeiBNzjNljclCgRIySxA88lXhBS6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773383482; c=relaxed/simple;
	bh=anabEuuOT3tVsiOcbbjdp9tYBN05pad2f3l5LDim7eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVYqgeZ+quHY8zfa8UHVaReG9s4qn6sP2Sw1D+PLae6NKutMsBC1SYRGG5lgV0ZNjFrQp8jUctufzizXM6YxBduuSWynbnDg7CiZKVb0DcKQ1u5Av2pn54LRTUtotGBvfkP4z8t225KV5pjhpkazoc3hF4day5PH0ENtFOtmUYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCFouf3f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RicL4aX0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tffx3844283
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrXDjCWOQjWYr4XEZYtwLT4SxLXc14L5Y4zKKdMD3Og=; b=FCFouf3fvsSExgGD
	+nwuxwhoLmDkRakxTWOD2gbjZBm4l1DydouzYB2RQuZN8eOfYyhDacLFNKVBGFZe
	btl1QJAWZYacjNQ0ni/psBXSU8DtNY5h05fjHVH7liftwIOUCRocl7TUrV+merBj
	DJHJMlmbe/8/x6I3AqRmhW6PePUL+Tcjsg4ypA4XqsGmlme9XSdZwU15lDnl/PdJ
	vBlGRusK8WK3mN8sJ2PzPaN5v/fSO+2OjdFZ95o9REGX1kCKjeC5JZ7DOArTLOzQ
	sJkmZ0/mvx0JaU8oEdqzuJDMkCuLyGoc90lY0DYA7NDE43PSl2ThDixB0nwpGioU
	zBixUw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54vrcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:31:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c44bf176so1739688a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 23:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773383479; x=1773988279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WrXDjCWOQjWYr4XEZYtwLT4SxLXc14L5Y4zKKdMD3Og=;
        b=RicL4aX0sJg/wNlfIyY68tsWhlzgc08g0mnvTS32nt5i2c1mSwtz8jO2uBgg1ugZ94
         2rp+GvzsT7YWbB/e+187RBYqlfZBHRFrH4Htp1pqSvHY+BcK2he3CCGLZI/6vzn6cOAn
         obrJxYCvSAzz6pmf07xPJFGxaY7zhB0nd0H+2Kvw5OqzTcYDTcdd99IQO47hm3Jr1ptb
         XnKzwoo8e2m6cAhJUAiry51sRaMBdoEYGyaMStvOz1XkiHdj0W5FTdxAOqy1ix29lnzL
         Rx9dU4Xd6VXXGakALv/b9o2xGNPNg2mGdSWpbv1s0IR7bMdeSnl6j2Qsmnsn0YxHM7wQ
         e9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773383479; x=1773988279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrXDjCWOQjWYr4XEZYtwLT4SxLXc14L5Y4zKKdMD3Og=;
        b=YUhj787PpPkuma0EEbLfq6M03VtnDajdr3bctdf5br1qy8HaHs6rQLNjmbwqi5C++l
         wfrgPqmxIhdY555CC7ZhnRfJsOv+JAdsBd1OwNiWY5B1C9YigAJLTRsb2bp3osfmiBIL
         uoVQ8Efk7SLR8iDnxb0Q5pa1RI5xlmeDqPzNgB7wtzV/n8a5Vinz+sMfMLUW61uS5Lgy
         VTlOkkzkc1g+LNatSpoz7XQLp3/iyWQjs1JplfLgN9gO7VP6aAD1YKHLLoGr+wQ9gBGO
         yQo9AOCpT2MzAE2K5NXbwZaoCFTol6E0aAdkFCqnrdFhR2NwNrjTPYwmxUsUI5hXDbY2
         gjag==
X-Forwarded-Encrypted: i=1; AJvYcCXvFhOZDTl8Ee8e7bYENQKqico6S3/LpfZxweJhjvYOdcIUM1i8MwTX4oaRMsZfZid6g0nX1ii3jzu1boPC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0VxCx4r2U4HuiIIVy8Uj8VKABtScyMuFzaW1vk8I1NI3I6hsn
	RaeXK3j1+Hajv7zrHocYvVrdx1xv78PytTlP0U+7y5lmg/FLKB1Y8G7HQuiJP7ccAefDI/zR+39
	Fjp58ftbqdp2cN8GhnU3PPLd0vwBCKtiLuMZnClOtg2QpeVfk3Qj/JpTxJThnwy6peH7xYBeFVe
	+a
X-Gm-Gg: ATEYQzzGN4RSURQvv7seD2q2rMNNfHAHj/fL18JWUfDjZFcrtsOkLbWePKEkmGSd6Tj
	LrFClpX6RLk/yj9GYUvmfE8U/5REzbuXVyYhlfwgTKok+oCbQNtwsyyh+0Mid9Y66tugfPqeC7U
	419G47qHJjzCnQ+rZFVhXlvy4P091Q1cSottbUWSV/mY32xeSn8qFy1EoOhZprE0D7niuODOZTy
	QuiW5eROeLHooiLX8B01P3pL7vEC4wC9f8FwBhlJswj4EW+JVnXEYs7KI9v9t46ciZhGkyaQkuX
	HlmhigOiR78OvnfE0a5Wxj3t4y/50vjNHwZ0YhL+ypH4o4XQlItQ5UtziGmSQp0HpFuRxa7kIu9
	i7Mug3HLQMG94xUktuaiS3cxpjpxhB1qXNIqNknELPIWz0LsMPqBtaTbGwU0yeIv6J30OgZmC/f
	Wd4FFICTc6B29zL31Szx/x5iQxqF1Z7hm5RYRuQFYo6v7RUdk=
X-Received: by 2002:a17:90b:3d8a:b0:356:22b5:704f with SMTP id 98e67ed59e1d1-35a21ea9ff6mr2016727a91.15.1773383478752;
        Thu, 12 Mar 2026 23:31:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8a:b0:356:22b5:704f with SMTP id 98e67ed59e1d1-35a21ea9ff6mr2016709a91.15.1773383478246;
        Thu, 12 Mar 2026 23:31:18 -0700 (PDT)
Received: from [10.79.138.73] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb76cc1sm922053a12.27.2026.03.12.23.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:31:17 -0700 (PDT)
Message-ID: <b32b550f-0c2d-45a4-b1ef-28966522b13d@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:01:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Commonize Glymur CRD DTSI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20260310054947.2114445-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20260310054947.2114445-3-gopikrishna.garmidi@oss.qualcomm.com>
 <rdnz6fc3jfypy7yh6lkswvacarketkcepi3zfaq6pxlsljilbp@yzsyuirax2oy>
 <0330abfa-7932-404f-b3e3-f43251db2e0f@oss.qualcomm.com>
 <ke6nnmlvy5wszwhzwv3cs2aqbexjos6rbu247yad3t63plq6zs@ntwgtpc7b6pu>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <ke6nnmlvy5wszwhzwv3cs2aqbexjos6rbu247yad3t63plq6zs@ntwgtpc7b6pu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qZzvkuYROaRKNHor0HKA-7ckEEmlM-Yn
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b3af37 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-8Pc67Heu0UItCGYessA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: qZzvkuYROaRKNHor0HKA-7ckEEmlM-Yn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1MCBTYWx0ZWRfXxCImMmOkCk4B
 z8jp0Aa3gF81gdccfJ9cO05n8sdpXcNPFv8aw9Wn2m205+4TRixmkSsY196zdVcJfRGq0zrIayG
 goJEpHqgWjOUy4snaD7kZnFSUNV0Z56fsAsE7g4fMlfmMtgs3D/mJsG8fQRvsglY9DLF9LbyTZS
 1hln+lEKG31+yy9xlVxYhrOce+3f/NwI4M5kWxA7I9Q/TBVNKW5ViHOBRif0DrzMdNxieLZcRVc
 cSe3owwfA7VE67DSRRP4GlLmLaF1976XUUuxdojZD0//xRgkJXvyHB4aEq42OgUA1lLX4pBCrLf
 AiWKGMKkRQPMpZTQLdikp68rUyOKNXX0/Vylezf1+NuaOwz3+Xsk9IOypj39HGy0sqAVv9nnMhg
 f9k6r+wqX7ia+163zdKgNhmNz/r7B0TjcqyluSHoAcYlw7E/q4LtpMSf4RZgyBfakx/UXrJ6gbP
 tf82fr6jXOSxm71A/Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130050
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-97319-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10E5C27E2C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/12/2026 8:48 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 12, 2026 at 02:10:32PM +0530, Gopikrishna Garmidi wrote:
>> Hi Dmitry Baryshkov,
>>>> Commonize the existing Glymur DTSI to allow reuse across the different
>>>> Glymur SKUs.
>>>
>>> Is Mahua a Glymur SKU?
>> Yes, Mahua is a variant of Glymur SoC with the same silicon but with the
>> third CPU cluster disabled.
> 
> Your next patch points out that there are more differences than just a
> disablement of the CPU cluster. I'd assume that Mahua is a sister
> architecture, but not the same silicon. Please rephrase your commit
> message without making assumptions and being more explicit that it is
> going to be shared with Mahua, a different SoC.
> 

Hi Dmitry,
Thanks for taking time to review the series :)

Will fix this in the next revision of the patch series.


>>>>
>>>> Also leave PCIe3b nodes disabled until the PCIe3b PHY init sequence
>>>> support gets added, since it's disabled at the UEFI level by default.
>>>>
>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/glymur-crd.dts       | 586 +-----------------
>>>>    .../qcom/{glymur-crd.dts => glymur-crd.dtsi}  |   7 -
>>>>    2 files changed, 1 insertion(+), 592 deletions(-)
>>>>    copy arch/arm64/boot/dts/qcom/{glymur-crd.dts => glymur-crd.dtsi} (99%)
>>>>
>>>
>>
> 
Best regards,
Gopikrishna Garmidi.

