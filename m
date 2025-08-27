Return-Path: <linux-arm-msm+bounces-71012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A03B38283
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 14:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 041BE1B603C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 12:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D39731283E;
	Wed, 27 Aug 2025 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HP6Pd2lg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0803B312819
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 12:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298167; cv=none; b=lS2X0E9f1R4NGy5uurl+55/RIgk4Nczbq4ll5D4aC2C67rh8nU/2fdNHPsxo4+kF/VnUR6+RbkJZlFJ7dFXKrjwGAI9bgwBgcVLNZt9NB2mPXkTwSE2Ej3cPVmMdszeOwcqSXCaosikAE1c0iYal+0BS9WpnrPsW46TiFsp3O64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298167; c=relaxed/simple;
	bh=OtfwXx5I64xIHGxuZSb4288v4TGZmcJgnGcUoChVAhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTgD9FHER0mkemJXw0rx7OfPVrqol2GftlelUNI+g+DgCowt63P5Wr/FNJTN+6LzsPGIpqtq/s8DsCi6yAQiRiJ9LmtNTXat+Tno3vHuAafFbKL5fe1yXlf9rhltF9ivERzI+0eNl/4vsxXmTCGlS3HMVspfPzFTmSob9r86upM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HP6Pd2lg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kg4e003981
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 12:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aE8zBC2r3Q0RIEhAPiMKgJEgO09ak2j9Srq2WGlHICA=; b=HP6Pd2lgIf3+Ff91
	zdA15rB7L979ZlVWxyvt9V+gX7l8lhk/YtxeUULsYWP+dZWXurOIURgs04oH4KNS
	Z/bgwUxV6lP20vVPOCcyPix+DqDw1Ox8eNXjp8japbIeEbJAqF1m5yaEtb6t0pFq
	fLCElBTU0sSvJTulxTPPQFvFPl1AHiiJ+FntF7mfCQ19RAeDtrdAaTniSVlS9Cnq
	66JB+bFkO4VQmM28jkAjxofCz6ha4w3eI1nXmdkrVPrxpjZw/Kv/scqkwPqZ1n2W
	gSild69dNrPSBcFjVEieZb6WT0hQ7IyrUWWLvmtqWNTMcfjWjZ/W8Ynk3LGGEApY
	ehvgsg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x8cq1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 12:36:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-248c171ad6aso175225ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 05:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298160; x=1756902960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aE8zBC2r3Q0RIEhAPiMKgJEgO09ak2j9Srq2WGlHICA=;
        b=I0TuqENDfxfYTmsRhD/LU0ZuLQMRRj5OyrepcEMlhOWsUwrcW16HjQvmiijdLHCOcB
         iIfkHgwy9wZ6hgPjIdVavX5diGTpjuCBALdk7NvDgymekdu7Xru1lbJ/s/rpY320A9t/
         hMgRWKleU4rqaJsQbef2s0tYZ5gr7H5+iRT2zpEK2xy/HBb1Bw0Y5PPbxP+cD4h7Nrm/
         SjamrtQZyCA8hqiWVLSxkXPCHCHYBciYmW72fceZ709l7H2zcxBwa+mukhAmst12d2lo
         zs4Q/8IXYubWmpEDn/uEKD+tCe6xHVjKs4QQKOVEnYvpLumKNOrs6GyUt7QUAaZWGFXt
         iBYA==
X-Forwarded-Encrypted: i=1; AJvYcCXD7dewJn5GIgprKs5TPLqyqGtp8t6o2KJbTv4dN0xF2Vsz9GK3qsV7FKoqs3lBgf33egodlc5z1Le6jpvO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpj6ahmdBPprcM/0W9vM601HO4ij1fPBRMovLonaBUWlPhcGsC
	VpaNwIzcLy0390HgJCf6Q8kudmE/72H4NMc1cCMRRB5T1PcNd8OYohAFOovAzvae4nlMWaZLP7j
	0H3PfBNpJU6hCTBmY6BeBERK39fpuknwtQDVEbzJW4HSBgCCcO0RMbevZhBtQI+KunX2X
X-Gm-Gg: ASbGncvKcMAVWIDI8NP2nANf1MF17hyvZwpgKf7cD95quN0orGcfIXp1f7XcYO1EbK+
	aliTyOfYAbke/nlYnTtNbNLAiSX7dakG7qfD+myKAuBjR7DsGBBBCmfPG3Cv+vhVcFPkuue9HYK
	QjY9JCB9AoUEdHYakhjvsSzYWKwzwgvIbqAuii4LlPe31VMZZejGQkOdmgZLbG2lY1hX9SOZqnb
	RD04SyI4D0J9/5y+LHQCvg/rDykABQNkqA06hOZv69CwZhwlZYoEIwcfyLyo84qYdwYt/9/XDc7
	TajHFpeoBdqctqzF4uKCd2Nnf5QiVqWzYrSzl8rh9eDetoM8u1aCECg/sXleSprgly61f2Uj5Vg
	IEjOsDr10qqe2yfmbrpXQtEJVgc3k0Q==
X-Received: by 2002:a17:902:c951:b0:248:9afa:7bc3 with SMTP id d9443c01a7336-2489b09c5damr16498815ad.8.1756298160302;
        Wed, 27 Aug 2025 05:36:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYZ+xD3z7w+wdaYRdOi1NqLqGkN8knb7naudF58SoA0hWReYupg5b3LgtyFq8V+9Sa/QcFuQ==
X-Received: by 2002:a17:902:c951:b0:248:9afa:7bc3 with SMTP id d9443c01a7336-2489b09c5damr16498445ad.8.1756298159732;
        Wed, 27 Aug 2025 05:35:59 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-248787e1bb2sm37647865ad.96.2025.08.27.05.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 05:35:59 -0700 (PDT)
Message-ID: <521fc2c7-d58f-4051-89b4-4c5a5a29d798@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 20:35:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] drm/msm/dp: Add support for lane mapping
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-14-a43bd25ec39c@oss.qualcomm.com>
 <wwn24kjpwexl66hd3wufa53lkqojb2bkpdogtxwr3uqotjpf3u@hclfgsv64ajn>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <wwn24kjpwexl66hd3wufa53lkqojb2bkpdogtxwr3uqotjpf3u@hclfgsv64ajn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z_8FG2xZkZ1vLNbBYmkvaWgeFoT6JSvR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX0dkd0cnuDgxW
 tIZGwxed1odYx97TVRYX2FqMAm8ViCLqyJjGP4lUb2orwGG9VYMQTNqbzXPocUToV/x0jmSrrkP
 dWe423AXlbaJCEb/m7OgV2BF5LDCopkMsKegTh0Hj88E9etGmYzes7sFHF11nu+7Q3qLev/eEFD
 GRU5t6vQqbP2FphG84cUi6LHMsWM6XSp9O6GOB85gUHiu5pIFak4zBf91rWtaHNpryBx0yfMn3D
 oO3Ug2VGmWUk5/hOviEltj/6h4zDzWoEe+vdQ1buElJZzc8+I1I+eYfKqjOuahTCZHDRA6g9tkC
 KjB7sFzunB3xiiFgpUCbDWKkGitGK9j9/ad0peNmBO/0LtplQi6k5PPbZBcMWko80SSBiRYV/V4
 kUXW/ms1
X-Proofpoint-GUID: z_8FG2xZkZ1vLNbBYmkvaWgeFoT6JSvR
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68aefbb1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=o8qHn1sYNikkEtO5ub0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_03,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044


On 8/20/2025 7:49 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:56PM +0800, Xiangxu Yin wrote:
>> Since max_dp_lanes and max_dp_link_rate are link-specific parameters,
>> move their parsing from dp_panel to dp_link for better separation
>> of concerns.
>>
>> Add lane mapping configuration for the DisplayPort (DP) controller on
>> the QCS615 platform.
> Separate patch


Ok. will separate in next patch.


>> QCS615 platform requires non-default logical-to-physical lane mapping
>> due to its unique hardware routing. Unlike the standard mapping sequence
>> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
>> configuration via the data-lanes property in the device tree. This
>> ensures correct signal routing between the DP controller and PHY.
>>
>> The DP PHY supports polarity inversion (PN swap) but does not support
>> lane swapping. Therefore, lane mapping should be handled in the DP
>> controller domain using REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c  | 10 ++---
>>  drivers/gpu/drm/msm/dp/dp_link.c  | 71 +++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_link.h  |  5 +++
>>  drivers/gpu/drm/msm/dp/dp_panel.c | 78 +++++----------------------------------
>>  drivers/gpu/drm/msm/dp/dp_panel.h |  3 --
>>  5 files changed, 90 insertions(+), 77 deletions(-)
>>

