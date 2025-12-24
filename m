Return-Path: <linux-arm-msm+bounces-86523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5750DCDBCC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 928643040A56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8193632E724;
	Wed, 24 Dec 2025 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQMYHzf4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ICI4PxVo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5D032F75F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766568477; cv=none; b=s523781b5BmKz0KVo6ZWvFef+BAxRTPfFRP/s1SyXHg82IgEUQlq83+VqUag9rJq3xbwN/8VAfknEUIUVyB35Z0lXakDV4QwrNA6zG5iqpDF20p4iYH41XlcdE1W2tZKzKQWPWbCVHRaEdHo0StCDL+BjtVtEaG1xX7nqCR9b2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766568477; c=relaxed/simple;
	bh=2d/d3UkMcKgYAS4pyf365qytba5VFzL1d2/K634cmwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YaKY6MUJ2VP5WmJaCiIepucSX1JzYhDPV/6GsgmKKF1Iqj3MWdyzlkFBsXd7rpvTRfhKZCFbdmUjuCUWeVaHDLkmzU5crLN3xIasZ18PMbpglQuhX18e3P8G9qEMwyBfXeqVQpyKsNglfl+rpt8LIZC0YWmCYCD4at2AIE1tMTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQMYHzf4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICI4PxVo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3wN5H3796691
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PfxdrY7WqYbZASbFOwI5uE4yEzq7Mc2W1yXQBpvwJSI=; b=hQMYHzf4JOv1CKdJ
	0PkY4AGsTJ/zJYleVuzwO+3xJTc5DHzo3vMv5YzCCTPDBtCDAkAMlMPT/gJ2JRb+
	QgS6VSfvBhVDI/2bZ1yN0cW5EN8xxLRxQAbIJkxo7hGfcOcy54sCEFq1EQY3KXCK
	aMrtyKRj3KztyTyMzFaqqGN/daAZumCnhDNw2hbFY7N0Qsw+YQefmv4PFDRYz/qY
	U/5ALh7zHlwXWAgLF94/uHuRXa6R/cEOyJeNW+KXeHV4IGutyduzj34Gjr4T4kbd
	yRjNafVMB4J+J4wH3XgFyrzgIB0qmfNmdGMJZKQ4/UpKqbv4i192+8yI/8g+bm+v
	aO3EWQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r68s0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f183e4cc7bso103359141cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766568473; x=1767173273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfxdrY7WqYbZASbFOwI5uE4yEzq7Mc2W1yXQBpvwJSI=;
        b=ICI4PxVoMbE0KfditSIP3iBJhJIt0vrsGMIf0LA9TZscIYcN6l14Gq3TCMy5LPlw3f
         3xhPUZZgvqB5LROd0+fo/FuYhzYqnX3MQXRSd6m7z6jHEcsMjMfVhqOCPk8+8jxco68A
         svzONTB2TOK5GjwKB3Zyisf0O54F9OwFC8lvPwcxt2jnFFlWYdYCB5FjmyGIKnOQ2hFC
         NlwOb0X+BXAZTZ/xh3LRll7yWDlWa0zl6tp5vY7JMn766kgNYnazH3C++0Zwg7z14D15
         qy2PoHBNs9wm5g13j4+v6vPwR5oOYyY9+KdQ23/F5ZTJ5q163r9311UTDDLYCqdtX9tk
         jKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766568473; x=1767173273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfxdrY7WqYbZASbFOwI5uE4yEzq7Mc2W1yXQBpvwJSI=;
        b=Qi/ro1YG331KpRLuZHG5ryz6oYF/Qsv1BhQe4rMAaIUksiuaYbDa8D5er3hjPDmc5p
         UTOdcrsfOlqSlP8j6YqFDR7OI4sT7Ln2C6lrCnKPnx89JFJcwlZg7KoHf7HZfT/QVRqn
         mEEG91NykhrjnroKy80Gv/hikwADOzxSLMNOkOQI2FlLSBVIDVlxyOX6E3UzuX7/YXZT
         U57e1IsWshGkhztLAFkeFktKJISKY6o9lAPC2+6OMQdDPwyTyGqiSLH0uhMtX/67/x6l
         PkGbbFvriwPM9YVjtQFC2wVe2cl72GVgV5XXE3OWw98LO80PFhyKdHG7GuRBrXdWwegW
         OaQw==
X-Forwarded-Encrypted: i=1; AJvYcCV4HidMBhGxAen8gm8ip/Bfp+749Eadnxs1KqlJGo9f2bIwP9pHpztGi0PR1B4UHJUHSPIU1pRmUvn4rLry@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh/zxLxmgLhvx6LJ2WprSMAVqw0lF2R/8p3luyfReJJ+I7Wz9U
	E0/DCx2d4o5M5JQvtwbuSNvVn+JVkL6JW1m1dJVRMclBKT5z8brtQlm/7RQfUVOYn1tmI4AScqG
	ynOwcCGmTkVBbmUCDi5kPeBuQGSXUD/iYXr9qA9nea3P3iW4YfAF62ysLC8TOax+bjV8U0NUd/4
	5d
X-Gm-Gg: AY/fxX5TEeQdYrNQJuhCAXBydWAjVUA26Bevt49OjaE2SXjWydGRxu3tNpLyU7BeIG9
	2FwvsUhxRWiYcgYfqXkiSny1p7bntyEuUCwrg6AJDTrRKmF+uSz5R/Txx2lnpXU95VwuyypCIfk
	vBDXDEt0pTc/eVxkOTU+H4BUplTxT6QchkJ4OTBK4B0P6Cmud4xnlDJHfrdYQWkfwFjxqQPn9sS
	aDGeVKwA+wV0S7HpvEupqmRxY8YjDWXzTwYrmDyPQ+DpqBjpzS32siYzA4Atec2zWuJfcmRWV3g
	59o6Qg1krkIdmGXHIvKHP/y/yGEK9Y9Y3w+1ap4fhrFOy8iXCYKYNGO54Q6VSCdgAbxLbvGXvaQ
	K2V2mEiIFYypcE2NJRrtFPZPH4ClyEMiqBxGSVzwazg8JiCQ/hr0ulGqVt5WLbegshGD4K7N4OL
	1MIyRFZsc87j8m8KbxN9dg58Q=
X-Received: by 2002:ac8:5989:0:b0:4eb:9d04:bc4b with SMTP id d75a77b69052e-4f4abcf2ad4mr267189371cf.31.1766568473475;
        Wed, 24 Dec 2025 01:27:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWCe9o6mSqXsfmrcr72/W6OEYW5Jn/Q617I8QOXG3eK+SCpaxmHlH6oOWFFKcZXbD25f2gHQ==
X-Received: by 2002:ac8:5989:0:b0:4eb:9d04:bc4b with SMTP id d75a77b69052e-4f4abcf2ad4mr267189221cf.31.1766568473058;
        Wed, 24 Dec 2025 01:27:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:27:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/19] drm/msm: correct/add a load of kernel-doc comments
Date: Wed, 24 Dec 2025 11:27:45 +0200
Message-ID: <176656845706.3796981.9787556236263245313.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SQSNL8wLdpVrLS76gLwhgf72SC3mdhZ3
X-Proofpoint-ORIG-GUID: SQSNL8wLdpVrLS76gLwhgf72SC3mdhZ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfXwIFGPldsmh/J
 4PbHx78RsulNBL5axnHXcBTxhxGcc95eMJSJyZv8my9iXe/T19/C93bRvI8KwrNrzN7PqTV8IhJ
 irXz+JTeBhqqh9NeT5nG6YW9TeZCb48DQHrqoE6QpRvStSqCNu/38kybJorxIDehcuUneh0O87P
 aNfbNhXzgN66hqQtUtZ+NF9OPRZutBnOwZW5WNGaZRl7zgyy3mz+A/4Yi0+RWY/190fL0i4qZsh
 SS+eUP++5DQv9LutcajjKjDCBU8KWPdPTfg5gao2CAYDCc0LLLHs+UBoPht4Iv7TyNMdIE8TBs4
 2AujRSDHDCZdnH5MvGMpkIRtVQ1ArgGQwrDxyiZKOZpw7qlnWDuWkr3mzpDaKAhjX5eFhWDZjJy
 ggHcTTZau4Dnd9OtgKxcpTuog+sOSHpaYXY44TaLkWVsHXuGeb6d8NLzEN4tgmYtEiaNlkMbkbJ
 Zw7aRZOBih4dX3iHx7Q==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694bb21a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=WE_5KjwR_mefeVNbiCoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240080

On Fri, 19 Dec 2025 10:46:19 -0800, Randy Dunlap wrote:
> Correct a bunch of kernel-doc comments in drm/msm/.
> 
> [PATCH 01/19] drm/msm/disp: mdp_format: fix all kernel-doc warnings
> [PATCH 02/19] drm/msm/dp: fix all kernel-doc warnings
> [PATCH 03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
> [PATCH 04/19] drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
> [PATCH 05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
> [PATCH 06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
> [PATCH 07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
> [PATCH 08/19] drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
> [PATCH 09/19] drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
> [PATCH 10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
> [PATCH 11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
> [PATCH 12/19] drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
> [PATCH 13/19] drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
> [PATCH 14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
> [PATCH 15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
> [PATCH 16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
> [PATCH 17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
> [PATCH 18/19] drm/msm: msm_gpu.h: fix all kernel-doc warnings
> [PATCH 19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings
> 
> [...]

Applied to msm-fixes, thanks!

[01/19] drm/msm/disp: mdp_format: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a50d8777159a
[02/19] drm/msm/dp: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/23bee889e33d
[03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ce26953807ee
[04/19] drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/686f6aafd39f
[05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/70e66a0c5b1b
[06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9d22d53ecb15
[07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/399f4345f07a
[08/19] drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f6d754552b55
[09/19] drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7ce9dd5eca99
[10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/847c12befab4
[11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/abc287a76e1c
[12/19] drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f5a7145d0fb1
[13/19] drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6e945d518a57
[14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3091c572fefd
[15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a6ccad66048a
[16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4fc510e57161
[17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/010c98df53ce
[18/19] drm/msm: msm_gpu.h: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cd5697865258
[19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7c85da6f63b1

Best regards,
-- 
With best wishes
Dmitry



