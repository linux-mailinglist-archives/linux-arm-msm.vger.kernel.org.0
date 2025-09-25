Return-Path: <linux-arm-msm+bounces-75029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E305B9E35D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CDBA1BC2FF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20D62D9EED;
	Thu, 25 Sep 2025 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pcpo4Dcm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442AC2877CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758791415; cv=none; b=h1jR7M25dE4A4IU78yxEjOVLQS64D1EqYm9eFs9rVi6ZCpjHwSxFW5mIfOJ97yL8ENal8bVZGOX7NbXWvf0Y/TQTlb4qUCs3ick3puNp9lFtpXfM8h2NzHoihuendfdcyRZfac/BQBBZdt3DV0z1bx7eJDTcRis+kKbvOEoYZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758791415; c=relaxed/simple;
	bh=VaO3i7T1b7yOwRkFlMNKwsdMGDTOTdR9OM8uKc1xL/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QmsxsnxWNI7oguCsJmWmTBbD41gQhcg0M3meempyPO0nDrEKu/U82l994KZmL+ocjf2LS33hHLetZ0//xAlszmp5w3nGQkRrdwgg+ls66ZO+RgKka7PGQdefiGmX+giQN/eYmZRBCw4yvrTFRKToaxkkPZxclMOtJClO9EHe+5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pcpo4Dcm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0VeEW025075
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eYZzVW9nVW8KA6tqECyGN+RNlHNLZrOF+4bwFfwCiLE=; b=Pcpo4DcmW+oDY+r+
	rZDyKMfWtqOYmhDD+enL9K3uf+OTqlFyAXN/08CmPZ3ClsBOpmOvqZYc2iq9jzh+
	ZNZfVXyO3GFnzRhVce+wuD/Vi7/nu1KcCHDXjAU4+T+Mp2XXuEpf/CV+ajux7p3D
	/nQW/mMp7q7mXkLksJUAlDZncJak4r6Vf/neAeWxxctL6Jx6VRqBRgMGxgWTd4V7
	r8P2lldig94Y5NjiLSbYD6CxB49v2JzmeKngy8C9KKJD11te01a4oMGirqXLoir7
	8sWfk/7Zs8ZAcisVSWptv7S0ItJSbiOGBVD7kesJwCflFdYvGBABAZ0s3aKQHwzb
	D0F46w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeyu61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:10:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-853f011da26so28295385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758791412; x=1759396212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYZzVW9nVW8KA6tqECyGN+RNlHNLZrOF+4bwFfwCiLE=;
        b=VZQQEGggG5HmW2T3gqiDDwySPheEC2rjkk2HDOUHlUctCwtc3PCOm1aDoa22qZS/nD
         sEBA5BEH97H0uzOKo5FC5V2aSWRndIMs55o054uR8DU2tY16rJMprOixHsSdqnXmYysY
         s+HSTNpa1kwRap46lTn9d3TAYEzuMHVyT8P37Y19FQTVJ3Ary/G/6UkOxkdHgsE8spQb
         DuuFATBWvtEK3bZBgTMuRCNVhinyWM3KtyjO8pJ5g3DfbqNkz/jI0sJ0d2WIoM1DuoUX
         KxA3mDMOJ2qfgnxemYWU2xtxv0Exu2ZYIJTTaBUYnIabddZ0j7G7gPuCG8JFqjtdZe5P
         NybA==
X-Gm-Message-State: AOJu0YywkDfJdjFhEL4WX8Uk2fsN8wl38C09JT2xt7OrxuIJ9NxEZrUO
	ivuM+xqvPwPihvlmPEV2LhjOkNeZN2nJDZCc4RwTEMnEzo3cR12v5WqQWzvgPbRFdhnNbXnz22z
	5L44LB9Qjie//ILw8lrUDQ9xik0sIYWwESssgMQik+9U9z0522tTEOC6Q/zazmy3nFRoK
X-Gm-Gg: ASbGncty0CwaszBo9KEkBggxJwZQWc1gMi2l5T/kyulBBrcdZzATP0BrZTwR0NVOhrR
	C3ou+3TpJQPa2YjoO2gfZDYecR4NNqBDo2UGjWqAc0wcx3YvX/hmNDWqS0SfqW6Bzlwvq33OIZf
	W3atfyYMZ2DMqvv0eAhldtbs7hQWysJPBlwgGLdXpTA2UtsHwro1zCBLIRnX5tvPOs5SWsFVKID
	TrRournZ9d59DJZjcx77KXP3xcqgzUngqcYiryOHWTmDPJIoMrBy8/mA2fzPzy9YyUSFgAOrlg3
	xH/rw3AdhlImSm6Tch0tqeYafkdg4VTM3g0FrV4VwCZhJDtqnCcVO3yZ+GBiYq/N9u6igJOp15Q
	NupaiGf6M84zAHygytRFQtQ==
X-Received: by 2002:a05:620a:1a0f:b0:827:52b2:42be with SMTP id af79cd13be357-85adf5d2741mr246323285a.1.1758791412020;
        Thu, 25 Sep 2025 02:10:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGADNWi8FxPoW2rbFkEpU+q5ie6LXLacUuiyEXFSNUKEa5yYt7K4AF5EOvbsvCoObZuswbrig==
X-Received: by 2002:a05:620a:1a0f:b0:827:52b2:42be with SMTP id af79cd13be357-85adf5d2741mr246319685a.1.1758791411237;
        Thu, 25 Sep 2025 02:10:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353fa65a62sm126307366b.47.2025.09.25.02.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:10:10 -0700 (PDT)
Message-ID: <ab28a715-6b5e-4adc-8889-f47ee2e18d5c@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:10:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] media: iris: Move vpu register defines to common
 header file
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YEgTyS_E9Q9plOaq8aWBBeY5s4w7pAD4
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d506f5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=-FEiAWMsPlssRVfEe-4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXxWP/dWRx97Pj
 LEUqeoDBQQyVJcdne0qSu5vwEQWn1t05OZc5JRgMGKNNcwP7LRRkjNAH1AOmofxtlQxmDgrIvyA
 KuXdqBxIwRRzvlKtPSmobkoxkFWFMspS0F5GPOqvEZ2Y+bglfMmunUmeev979ldTmyIyZpVCePG
 bwhPvnwTaCEgPOtCyY0FFei5TAP0jqUQH+3a4Hzes4wA/EXcKxboIMAF/uY3vVdNwvgHlW3l9qs
 qktLPzFRVLBfels2NRk5jBDLV7peIfVuK/QoRcxwAmIcKdZO0GOiQO75oaaNdpeKKnZCFWWBK2m
 Iaxjs7Mv38XFm9OcHyjMnZCkFLt4v/7beAuuwmplSKxZILaiTQMj2iLQsGgMpQrf7UKBa2VFAzr
 VWvfWACp
X-Proofpoint-ORIG-GUID: YEgTyS_E9Q9plOaq8aWBBeY5s4w7pAD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On 9/25/25 1:14 AM, Vikash Garodia wrote:
> Some of vpu4 register defines are common with vpu3x. Move those into the
> common register defines header. This is done to reuse the defines for
> vpu4 in subsequent patch which enables the power sequence for vpu4.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 36 ----------------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 --------------
>  .../platform/qcom/iris/iris_vpu_register_defines.h | 29 +++++++++++++++++

This is a slippery slope. I think it's better if you explicitly say
the header file contains the register map of VPU3 instead, as let's say
VPU5 may add a random register in the middle (pushing some existing ones
+0x4 down). Such changes are annoying to debug, and we've unfortunately
been there on Adreno..

Because you're using this for a single common function that is both acting
upon the same registers and performing the same operations on them across
VPU35 and VPU4, it's okay to de-static-ize the function from iris_vpu3.c and
refer to it from vpu4 ops, keeping the register map private to the former
file which I think will end up less error-prone for the future.

Konrad

