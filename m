Return-Path: <linux-arm-msm+bounces-69416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA4B28833
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 00:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCDA91CC4301
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 22:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FFA248891;
	Fri, 15 Aug 2025 22:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kW83flYO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF5628399
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755295915; cv=none; b=FapGhARLH6rhAtNuIYyk5mm/q1KeyzA7EXPxJzPbg4Sz5f5jkH0KVWwQXmiyD8XnAJgN105ylFpByiMTXWCf2bPlzhEUY+b+X/7gZSg6mSph+Sr0tBRn7fVk9CvLEoqmq92Lz+tZOiO7KzbZ165596Q2uWZKsvfMHoiD4HZTx5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755295915; c=relaxed/simple;
	bh=f+UKnnSodDZgqonVwt9+xswBGG14TU8cblfKES3nCm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bw3pgclcfmEgLHeIqbho/L+sooFps5kDDGfXsJCSj9od2jh817OlXA+mpX3rOm+3kplua7Vpda//85fSobc4tvvp45OlmbieyAbTXRAnTfbzhjXc2HFH1b9C3WjDJDTgcFYslD+jfSdbub+Hd/fqQ65c3nkVZJIByJSbkjqjLas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kW83flYO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIrb2027635
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5zM8IHcV3H7gOoelJ/+z7CJ
	/41CkydC6cvDm/kl5Xg=; b=kW83flYO9wLl1Grkz7IRoSfW7jFiDVuHUaG8briE
	O79Z/pyF2XrLqjis7GA/l/wOiSas7jkcYF79tem2ZXVDi6y+D7Q+a4whV7WfvTqQ
	txVAoVEKoVgkMUBVNMbPCQ/7raC9ICkeq4nYI9Z7VO5dbv3BLvksC1ZX12y4nkZj
	3cdNswY098BE69vYOtsNgcI/7kWxoE2W3IqWBT5Xu/4gyzFL/3xs8feZ1fgfpPIa
	H1yWdFP3afcnfZtE9qQ/hSOfwAGs+eMayZw8Bd2Db8JFIwnbu6yscn2IrMfLm/py
	+heQ/omcnxSGSPJCzQn3Pb/tqEMt86aDTM4Epg/sP/P8Jw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhk04kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:11:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109bccebaso60697761cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 15:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755295912; x=1755900712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5zM8IHcV3H7gOoelJ/+z7CJ/41CkydC6cvDm/kl5Xg=;
        b=KfRxMrGSxvezuFTV3MHtfuhPOlPVJswtTEF00RAEZZ8yR/bdBW9QMGpc00o7sDyrG8
         IawXZQnHvV6hwbLMt107cBiFk9bP/z/5+kqfyk4FIz/xemBSQRGhM46xXKPqOYqnP4V3
         zBnBj0nnu5bAsIqRSIfxRlxeCm6SA1oqXH0qEOsKtt11jIew8Mz2QZq0az5u6CTdwQjm
         P7aAe/t0Facy3IWH63owH88XYK+T0IBrRiy1tvFgLkpv+my/VzT2y6EkxljTCg8ION4t
         VH1ZH9kuu8raxIly7XYRvk81P6GtgE8DD5lGBOtzRbiD2wf1k7S4UwYEbGXb5HJ7p84K
         U7bw==
X-Forwarded-Encrypted: i=1; AJvYcCX4IbDHWo9S+cPyZBd/EuZCETGZd5rnLUFOBeeiD/YSYkNsVuNMCxcheI4m20QtMTQyfIvYU25WbxF/2IBS@vger.kernel.org
X-Gm-Message-State: AOJu0YzB1xkpvk5Z+Qdxab6IeI14t0IDywsljTJTqRRE55AvvdOFFIPr
	vh/Bqkbf185VhMCTXMPef4sYSvoCOExYWUCqYZNI9/LNRVLTSsEPSgRvTnpwKC+FiH+ip4+ZsOf
	KrHm/5rMGQbUunZ+qoxozfylphijbaU8CAw1W1n9BMSo7fSw579vt7EMzzYvnVcTYsuSe
X-Gm-Gg: ASbGncsJz/tJKltVll7bVHiQRnspwGoXRwi1txUXI9sRxtUqvh9fE9dpUGeNr5CxP8A
	/PQL0aFgSNAJ+/A5GCk/BrbZlI3BuzoQ9C/aCZR5As7EBMy1njFeZ/f6J9NGqGIyO3e3F7oxwLW
	m2LT9nkmLU+l4+mV4ZVf6kq0wscsap0UvOEtr67ibYZ8KR6kM3u//8Cj9Aud4E6Gw2KrRNHsyXc
	dZQyXHrG/J7nFp8hmNZKE/PUIwbml0QhHIHLrTD7ydXiATCHpr7z9eydm62BmU+Di5UmzRBELbm
	lRNTE54eVeYGCRj7DRNDB59Z/epN5c7ByMNpDFRIn6nqiEQQaiJtjTsPznWqIlgVc4oiQPvYF0u
	e3mtqCBdD1XAcvH1L0VuM/8q6MqW0X1v5ioHx5OuTt0M/s65Gdrsd
X-Received: by 2002:ac8:594d:0:b0:4b0:7989:13db with SMTP id d75a77b69052e-4b11e2ca210mr52381751cf.58.1755295911620;
        Fri, 15 Aug 2025 15:11:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrQWvY1JLzgvTKFhi3lkvOceh7xXj0igfHgQCFQG8XwNnsUGy125Fd59SjzF+Z00CJp0H2qw==
X-Received: by 2002:ac8:594d:0:b0:4b0:7989:13db with SMTP id d75a77b69052e-4b11e2ca210mr52381311cf.58.1755295911092;
        Fri, 15 Aug 2025 15:11:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cc6a3sm519733e87.102.2025.08.15.15.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 15:11:50 -0700 (PDT)
Date: Sat, 16 Aug 2025 01:11:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        johan@kernel.org, linux-arm-msm@vger.kernel.org,
        Christopher Obbard <christopher.obbard@linaro.org>,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH v7] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <b3h3anmvna2p37gkio7xh7dgl4h7cz7weimu33mwhfk5rtytb2@wvhoskaiwhm4>
References: <20250814-topic-x1e80100-t14s-oled-dp-brightness-v7-1-b3d7b4dfe8c5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-topic-x1e80100-t14s-oled-dp-brightness-v7-1-b3d7b4dfe8c5@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX5tvqDYWgZqew
 Hg5ar6o4bAKX+MEpEepUwBizCtRMAm3if9SORxtpeXMG7gArpMSbZS9+w+V5aivNM0OHScztNfS
 K7vcg05EXJqevORFxYC5ACfHkrMEoAg17EYB2R8uwW6mUitfBI3spOxPLzOhTLq7DbVxkWSo2nU
 OqXPR+QZXmUAMbaDp5dWIQdqAwvV3EnWBKmNYMz6CK+f9mVkq7NEPTHmql5OvKgWJBudgzQN+qa
 PpveO4SgNQ1Vtc+8Bebg6Z6M3sIiWPJh+Xt+xmDk++XPd8ZDG2etfayR7ZDE/Bbqk8E0N3kiOaO
 oLD9lpiyb39PCjpap4T3Jde9xouBvg269pwG5F1mlkEIc1qxvvZxr9d0ReS+3rqRxWnspgm4afc
 XX4V+nLB
X-Proofpoint-GUID: zKOevBo4e1YO3ML9tpXjvS8--GeVzPQb
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689fb0a8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=YrjviDGP2Rj_hCM7jl4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zKOevBo4e1YO3ML9tpXjvS8--GeVzPQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

On Thu, Aug 14, 2025 at 04:16:09PM +0200, Neil Armstrong wrote:
> From: Christopher Obbard <christopher.obbard@linaro.org>
> 
> According to the eDP specification (VESA Embedded DisplayPort Standard
> v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> the MIN value as the effective PWM bit count.
> 
> This commit updates the logic to clamp the reported
> DP_EDP_PWMGEN_BIT_COUNT to the range defined by _CAP_MIN and _CAP_MAX.
> 
> As part of this change, the behavior is modified such that reading both
> _CAP_MIN and _CAP_MAX registers is now required to succeed, otherwise
> bl->max value could end up being not set although
> drm_edp_backlight_probe_max() returned success.
> 
> This ensures correct handling of eDP panels that report a zero PWM
> bit count but still provide valid non-zero MIN and MAX capability
> values. Without this clamping, brightness values may be interpreted
> incorrectly, leading to a dim or non-functional backlight.
> 
> For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> supports AUX backlight control and declares a valid 11-bit range.
> Clamping ensures brightness scaling works as intended on such panels.
> 
> Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v7:
> - Take in account invalid bit_count
> - Write bit_count back if clamped within BIT_COUNT_CAP_MIN & BIT_COUNT_CAP_MAX 
> - Link to v6: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org 
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

