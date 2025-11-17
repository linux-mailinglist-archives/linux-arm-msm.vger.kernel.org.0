Return-Path: <linux-arm-msm+bounces-82122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA82C64966
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 02A2D34656F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E40323ABBE;
	Mon, 17 Nov 2025 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MS1vdrOy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtSGREMY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A4721D3CC
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763388402; cv=none; b=cYu4XeVj0gyD9raOzM4wf6fhqAhza0Zqh+c6RDhInjNnmmhCFZJbE9mwvm2FHsvSmn22LlSU/euJUyjFWOoYwCL6EcMPHatPfxKCIPqDFIYqOEvBpGYr3JhSCud9+pizD1UvJDfgyTCV3Qp59YLygxJHw3fuRIuQ2GGvqIXO948=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763388402; c=relaxed/simple;
	bh=tRJbOSrz4ei3IyLmuvn5RLHdF9Mi5x9i84yq0agPmEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ci/qLnqnp07ub3TSW9lve9JPHoRWumuR4fQTw6wceG0w3pKbQVwXBAShfPgJnUsATNQsB7MaGPJtApPAyKg4OepK+RCrb/K5y6ESGIc9bga7C7jo6evQ/gKOTVWRGLKrtNbGQb4uhsX0cdEnSltNhHWEGcf3KZqau9hf3ixr85M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MS1vdrOy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtSGREMY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB0JtX2792283
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDq+mw+HRp2398SoTeGOlaLqDC78hVLUFcq/9QZ+fWM=; b=MS1vdrOy+Oy8cfz+
	4ZwEhGqMOTwdrAe5cxWzUtNCsTNKX1riWifIs6ssyofVIuMJo4Jt1EnM6NynNi0P
	ZPgH10fRFhFnzTVvml57WpBIOix/bYcQLPTqPjBt5AU+LsrabkfDORwaEtARWzEe
	kpA6rNV8Uyp7aNewdnthP/Yi659y5buh7LTpdSZJ20j7XkHtNcw2J2528/3QVLfx
	RnyeSXp4pu/weMDF9CpkXpelZqyXR/Cu2c5cqFOLGggAgqtshtWZXo9IcJPXANFE
	2nYLuhPHak5VbJ3KWxcKtaRuchxf+4KX0AZwXJbkuO4A2cMXuZ3Ly/up/cvxpGcl
	cRvowQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bhu56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:06:40 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5dbd1b84432so637385137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763388399; x=1763993199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDq+mw+HRp2398SoTeGOlaLqDC78hVLUFcq/9QZ+fWM=;
        b=QtSGREMYcQi+lW9WY6GE+doTjHaKxlflriiMzCwDDIyT9uFVmhWEVUYGbRgA99MqB6
         whghshHwMk+RzR2IxrnNWH4Kb5puARHOn7S5FPqUn5P9ggTnM04W1ZEAIE3ODG5ucVRK
         zqO7JlxeyLlA2MpeFSvF0qgYnw5k4oJdej06UKAaH6TkcB9Fpudc539QQWaZ4qWgw9j6
         fk35UVxozWBZ8ekOitqP3EqNzyNtYGx5uTbcECWMv/C+aTVEHDWhe5KL1+7uasGIvoVa
         3JeydS9VyxozlpEF+qqscj4y+gK5BEl4HtjxISfeqnAQkqsBMl9wO/FIERX3Zmuhc3HG
         MFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388399; x=1763993199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDq+mw+HRp2398SoTeGOlaLqDC78hVLUFcq/9QZ+fWM=;
        b=Sr4nK9wu0+1BW0I8Q28EuJPQrZnTWJ6Bf6JwKic39OI9N33gTlAit0fgsJdPACyA8m
         HErBUgM34nuVxzIRIXzNVIMIVTtooQt4yakpFK/C3REjtVOG2pHlzA8a4tl+6p54fvvF
         kJkqrOgkyobLGE2tXxPkuGA63//3nkvSv4bwCntdSZz4B3db5BokTi8FgQ9yviI7Dt4H
         Z9p9xYQhpklzrNY0cZNLkwSX/jLof+HdtuiBtTvXPcmi1W5k4jjc4OT2FhwhADUlszcO
         PwZ5XQZl0YuYpggCW242oGIE8Yp0FVsFW1QgI8yBquJR/8YIe4cyoF6FM2UGE7XojYFE
         OlCQ==
X-Gm-Message-State: AOJu0YzPRFco5TRJuzfLfYAdolPl8hSisOE0MT4Ofctzw5zIRitDFxgQ
	HVu4SxOi5GmlQmlFsVOz4i8wPVr1HnC8nsALfe5pMf/ApiaNDCqmAQhvWpksmBMBssUyl34DjlM
	F0ZzB0uBmE8xk0ztAo+07mJQlPyUi4iL+cOchQLQto0p8+wNskALG1XlHyG7+TcEj9I0B
X-Gm-Gg: ASbGncvNM9KeURx1fRMwqCWAo1L0EkQiPNmmR1zN4Tyfk9KwOm9Lgmi5qH0rYaO4g5V
	EP3gonKElXPHW/Hr1c7s/TfAcnRr5c0LDh70ZZGAY0pPsmeAyi6R0RK8yGlHGNIf94glBbTWui+
	hVH56jQbBqxJXy0olmpZFSJfyXyqyMxxDFqasLu/dk/MNjiMc2YoVE86H9xAlEclzpFWEMo8zGE
	BtmEGwBJvkfEeclB6NrCCVQL84pEtuIu94SXYMuSA16klfXL3pmT+oUxpfrpi+SPctzacHtrxzz
	eCPr9BknG4u1ZQS1CmdoRfNstmQnbiS64VRYPsDTiU/bMYZu798MjK+Vn6CKsZjkCkyXLcafzaJ
	7qpPbsNDYmz2hP0b4HaPf7Gnll5ZCnZCtqCgZP+sD/oDFAscLcNbUxZXi
X-Received: by 2002:a05:6102:5107:b0:5df:b081:4a2c with SMTP id ada2fe7eead31-5dfc85e072emr1619587137.7.1763388399328;
        Mon, 17 Nov 2025 06:06:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKNiYRBfXeh/2aXn0HQPLKudUqGsF5V2HxhMggV6/QVJT/a/O/XTnuPbHT42rAwrh0e9Rc+w==
X-Received: by 2002:a05:6102:5107:b0:5df:b081:4a2c with SMTP id ada2fe7eead31-5dfc85e072emr1619547137.7.1763388398836;
        Mon, 17 Nov 2025 06:06:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81172sm1079373866b.15.2025.11.17.06.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:06:38 -0800 (PST)
Message-ID: <60fb9b8c-86ac-4c4d-aebc-2c9c2f558fcb@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:06:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/20] drm/msm/a8xx: Add support for Adreno X2-85 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-17-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-17-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gcogHfgFDu9q0ri8SQSN7rbgcnl4mcNF
X-Proofpoint-ORIG-GUID: gcogHfgFDu9q0ri8SQSN7rbgcnl4mcNF
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691b2bf0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KNdfcIBsQoTh3yukQZwA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMCBTYWx0ZWRfX5G+7/VYV6Xgx
 OsZ8IQzeTLh3UWVdyT+85kT13wkwMV0vV8u8uipE3eHKBv5PwYsxmqoHOtJOVzxs8wFLrAuK5Hf
 geG0l+GYpRdrWue+S8PLFo7zARZZHlUOA1MgACoE8qUCo+qXMQZIkTUo9vXBcrhtbqhb2lBQ/yG
 r74pKJCWWCJrrZH8PzKDSJVvKsYUddjnF6LOlQqwS3SxqhYGat1RxSQfELLwdsnT4X53nDToFQT
 HKciH4QEcUOZ0zyOGp3Rwb6KRWY+FfhwU+J3M/w71Nao7dVzdY/ARCYcBermDbaFnJ0cDhNY3P2
 aJEe6q+Pth1PdLrItj3S9jewN2e5l6WIo/kFo7Ljxetmd+pkIrP+X9ariO+wkbcsCIIydbMwjyg
 zadxqrEmCj6aFFNg0fYHRh0ENSj7Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170120

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> Adreno X2-85 GPU is found in the next generation of Qualcomm's compute
> series chipset called Snapdragon X2 Elite (a.k.a Glymur). It is based
> on the new A8x slice architecture and features up to 4 slices. Due to
> the wider 12 channel DDR support, there is higher DDR bandwidth available
> than previous generation to improve performance.
> 
> Add a new entry in the catalog along with the necessary register
> configurations to enable support for it.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

