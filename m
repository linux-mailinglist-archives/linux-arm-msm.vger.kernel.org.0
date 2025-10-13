Return-Path: <linux-arm-msm+bounces-76958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 885B3BD254F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 11:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6419B4EF35D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 09:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806002FDC3B;
	Mon, 13 Oct 2025 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzRKij5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9FD26290
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760348388; cv=none; b=bDTx0P1nvbdU1w9TaPOJImpHdLGWVdAdwywUhCpv4AVKt3JLikPUk4TigqHv4ys09ctsU6dGdgE4S3tNuZ1HxhD1d9iS/eVZzuGXoSy4BZuRIotIX56kdow+i5KZ80tmN/82OUtVfFj+OVA/yHc0LI2W2lHq7WZ4tWCQIOEpmLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760348388; c=relaxed/simple;
	bh=q62qPK2IJ3ohVM5LL7rI6hahFz9XXHlcjnl3rDVnSTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cw/xPpCZBtuzH9wuWD0QUi9UaxfYTBJ4yI71ev/nywP6y5EJlfuwU4Jyg0QKB4L7V9jTi+FVgEotTpWQjhcc10Q3CHgGbBQgH4CjNUKZX5sakhj/CHR5Ais1qwrdLxjtJJBRcC+LNk4MDDcjcwzDLbSiRpUgnQMfSaCqs2FGPFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzRKij5x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D4popc020634
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 09:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ki9AQgeDXinhOnoOYGE+AX4oW0J7Rlumps/zQJrNlB4=; b=TzRKij5xeqn+/NlA
	nekBdq1Q7d0MtPY721CSvhlSbUBNCsvRqeVXsYhh2Zfo92aBIyphy0KikGMIrL79
	iyJk8QdkZqsOJaaesucDhuIkqf+gcr23TbZJL9Mz+iWG10IfTMaTcCsFxMHSorqY
	waAOjxpufMQP/fTnZiMYcwbh+EKP7UvcHXi9DjZ/0ldm7EKBMhPywNL7D+ZAmuFz
	JtnC7JGd3NRXcHdFIzJ96e9qcQaxZv4+CZwasPWjSs9g4EtrMjlYX3/zLb3iqOCj
	Cuu6D/uaCRrjMVlRgU//trSm+yvRTctbBABIcDFKOebxryPKt8kElidMzCLiQH+c
	FCG1kg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt0ubn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 09:39:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8635d475556so1055288685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760348385; x=1760953185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ki9AQgeDXinhOnoOYGE+AX4oW0J7Rlumps/zQJrNlB4=;
        b=bG25Wzf+eHFrhGUEJzCyQn/kE7zaeGZnWn0OwoPJPnQ9NHuTQsNtD+lQUtMJArOr4Z
         ZfAUanLVSqt+ihW5eoAzvIIRS//feuMQYuQnDjnVhizun8bwIuzZNNchmfe47BTwO9tA
         61FUeqEfuH4NbVwLgKbF/NHJjVQlBTrBMc+UOiUK/IfrnXF1T/kWhlGcEqysnky+xvu6
         ccl/ciHH/Pc3Vb4s/VXKRJkeAyrb1M+8ak7DU+jOAY8FdTLGdxEwe54o17RnBeZ4eKfF
         s/fJWIZFrn0iPx2l4ZS7yNCB0uqDwRiwXDeef+etHDJ5+uH986Gx55A0+z8cddlNJQEe
         cV1w==
X-Forwarded-Encrypted: i=1; AJvYcCXVFH+lMsF29N1+/NklT4L17BbBEPpdmR6ZNOCwAwn9N8o06am9usU2t6VLcWpzSsrnYOS48/JF9cbjl/FC@vger.kernel.org
X-Gm-Message-State: AOJu0YyzXX5sLUYDO+aKhe0WIMyWAzN4FTcLyBxezozokYXLyiB8c3ZA
	SoQD+95n/I4/ZH+44XE2ZBV4J8NZC5zlyGqOVNURnFdbzCzm6FSL3AcuLuBPAaDkjCYVUXyrJlw
	siLeGtamkZ9Wv9ANq8aHEz7Jw/de6Bnz63CW7qA6HuSBu0Dao6qB8rDPJ9Xy0FrpNDTOS
X-Gm-Gg: ASbGncsY9i1V25PHJXeyj29AGggYsnalhVS10sxvkkM5/reAAqWMDv8B+Qk6DwXzdy3
	60EbS9BgAdw4mK0KT35lsg3uzhzCUAb45QaqXKweP1R1S/pcomuiGPkMlm2++CsxyI54g8WGQvX
	kcL26pds3EJx8szDx4ooukzQxDLldcufnmnKmkVU1OXO6Hs6Qgw4BEQbc8Si0T2yRqQPP6X2mv7
	dwNUQQzmt7SDLqbz4WRy0sjE7G61teRXwGPiYLQ+UmDoG7UK6rZDo7rm+N4Vj6Bzt88Zhw1GrvH
	iMAqYtq2zXcmyetd+1JfhvYWeJl+y1DHtW0n2t1Vlk/cjeUMPfE8DrMDtdDV4QW5jiN6Vypvji+
	gBqw3NFzN/QPAHzBe56Cwx2d6s9coJnKqCn7W2pb2wH/m3IrRajtJeqK9Z/BQnaEjLMixZANvuZ
	na05t9Q1SJklpt+qKa3Q==
X-Received: by 2002:ac8:7d43:0:b0:4cc:1ef6:9c07 with SMTP id d75a77b69052e-4e6f5119a40mr214016211cf.60.1760348384673;
        Mon, 13 Oct 2025 02:39:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4qJbiYUTKZIv9sgbRJV/j0WU8jqQvzg61vG6N3jHMvsEi0Vl1Fk4PGWY1LSWVGJDhtbnwHg==
X-Received: by 2002:ac8:7d43:0:b0:4cc:1ef6:9c07 with SMTP id d75a77b69052e-4e6f5119a40mr214015911cf.60.1760348384172;
        Mon, 13 Oct 2025 02:39:44 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c8:f7c7:f006:1de6:d998:8e01? (2001-14bb-c8-f7c7-f006-1de6-d998-8e01.rev.dnainternet.fi. [2001:14bb:c8:f7c7:f006:1de6:d998:8e01])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e7f7f7fsm29981001fa.27.2025.10.13.02.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:39:43 -0700 (PDT)
Message-ID: <9cafccd5-35d4-46c5-aa57-1b0b8ec116e8@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 12:39:41 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: =?UTF-8?B?5pu55L+K5p2w?= <caojunjie650@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
        Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
 <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
 <CAK6c68jBwykcWZm3ckm3nwab-X9Are4rD-eauE4rXA2+XvuX1w@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAK6c68jBwykcWZm3ckm3nwab-X9Are4rD-eauE4rXA2+XvuX1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uGrwtQqIkkvTww30VmPaPQosgzrcYNqv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX+AtSgOXL3MKY
 0nTyUUl5TeVMeds90Zm329zP+UXfBpqbptddnoZR1rOGtSeBjhteLy/qORPc3NZnkvWP6MZRI+l
 tl0zj6DUPa+il3Namc2Z5MX0jLJGFGeAKjNi9HVDdnlgRbJDKEy4zNbW4VQyKwvcV0E2iuMYhfQ
 hywJCGzwRHTVwYkKW5H8nJ20okgbRtBQh7/u/+ZquoofdIvGWG7dR3F5kgGH00sjXa75VQinqVD
 FcqatC2pTSzOKe+vNaK4aCnrZWrFyc/tIEyelrxRFF/8ZnN2FdnOV/zz0H81CmE/3QAFT0Enr0T
 ukrxUu25iomPOn36Qfe/4gdB1YK57WVpayOmGLy7K8DTUItcTuTMFXT8hI4ODnFU1VxTzos7Qjo
 MjhyoOlmKLQxGpL1W/bTfV+HPh99SA==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ecc8e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=RAbU-raeAAAA:8
 a=pGLkceISAAAA:8 a=tclqJqCaU1NudMZwD7AA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-GUID: uGrwtQqIkkvTww30VmPaPQosgzrcYNqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 13/10/2025 04:52, 曹俊杰 wrote:
>  >Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com 
> <mailto:dmitry.baryshkov@oss.qualcomm.com>> 于2025年10月2日周四 10:04写道：
>  >On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
>  >> From: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.org>>
>  >>
>  >> Some panels support multiple slice to be sent in a single DSC 
> packet. And
>  >> this feature is a must for specific panels, such as JDI LPM026M648C. 
> Add a
>  >> dsc_slice_per_pkt member into struct mipi_dsi_device and support the
>  >> feature in msm mdss driver.
>  >>
>  >> Co-developed-by: Jonathan Marek <jonathan@marek.ca 
> <mailto:jonathan@marek.ca>>
>  >> Signed-off-by: Jonathan Marek <jonathan@marek.ca 
> <mailto:jonathan@marek.ca>>
>  >> Signed-off-by: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.org>>
>  >> Signed-off-by: Junjie Cao <caojunjie650@gmail.com 
> <mailto:caojunjie650@gmail.com>>
>  >> ---
>  >>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>  >>  include/drm/drm_mipi_dsi.h         |  2 ++
>  >>  2 files changed, 12 insertions(+), 15 deletions(-)
>  >
>  >Please extract the generic part, so that it can be merged through a
>  >generic tree.
>  >
> 
> Sorry, I don't get it.  The generic part, generic tree? Do you mean
> the drm tree? `slice_per_pkt >= 2` is seen on the panels of these
> tablets that are equipped with qcom chips. I don't know if these
> panels are used on other platforms, and if it is necessary to do it
> in drm.

There are two changes here:
- MIPI DSI header change
- msm DSI driver

I've asked to split it to those two commits so that he change for 
drm_mipi_dsi.h is more obvious for reviewers and so that it can be 
merged through a drm-misc tree (or through drm-msm tree provided it gets 
a necessary ack).


-- 
With best wishes
Dmitry

