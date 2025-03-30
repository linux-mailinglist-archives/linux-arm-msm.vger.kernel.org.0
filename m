Return-Path: <linux-arm-msm+bounces-52842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1871A75B80
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 19:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04F04188B49B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 17:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5B51DC991;
	Sun, 30 Mar 2025 17:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDhq2GNz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF791AF0B4
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743356751; cv=none; b=jE0YZ1HPTPvpRq51nYdlyaCBn/ttOJbU1bq0AmoPOkbzaNdy/7/A95oXUMovM98U+MdQBv5UgE6B7iHWth4Vi2Qo57k8cK0CcKDHQFUVrnYS35HrQ/8PVTO5p0zso0owbypUVB3p5iu3ktmTh7C8mtL3hBE+R32XdSH9GqNqTeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743356751; c=relaxed/simple;
	bh=IR6/8SSTGr5dd4jqowLzLiWRJEQJjEmVlxEJ67xVVJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QpGCCubWrNcQL8ZA12svb559amdHme6zN6J3ijWBN7HoaXQ2zkyB0o9meoIx3++lOLU0EPZImoSJ2oknP5MX6VWk3WQwnPh6bwTGMl6r+WNQsA33/FJz1DkpY4SBgPHm40vOBRObyxFalewpuCzbdSMkmryGBmipzJa34iMzTcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDhq2GNz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDaEVh011721
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 17:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P0ftvHk0zJxR+Mo9YakIO8lA
	GLmBp6+lxXZh/431vDE=; b=TDhq2GNzt/fRJfMUjDvMGmdE/nhpzlbrEASJKHI4
	7bteB2zxTFP4fUDuGKRIt3Y3l6blSuZe6NietQKkAEPMab5Sl6KqUjGF6t0ezvQ4
	A8G+V0/0BUlvDzJAeGtOrEN9gVzMzZr3f4xQAQBv0D5WvuUSvb+cSGfOmqdsmNRO
	qiSdlIB3pPiEmXVOgB8oIe0lTSBN5oFMzFMcIA1a5N7xNbFj6AzET+MTNtnb0yMK
	LHZO4Rp4GvbeUv9me51DeKMFDpTuBEbFosfplg3rk3LuRTfBdbiKLB9SvUsfN7o4
	fj90Mrk0QTKtC3OogN9OK9Q8T1V1aP/2hCGQwI7uyqeqNQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7v8apqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 17:45:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff62f96b10so7191605a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 10:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743356729; x=1743961529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0ftvHk0zJxR+Mo9YakIO8lAGLmBp6+lxXZh/431vDE=;
        b=xCZTZoYj1WcWP7X7tFHtVj8tX+c12W01LMpIy4LYAgdclmSS/zz5W5TPsdHDSf/hsK
         jqIxkqe/giH4J3V6U/HIkY3thFB62VSzrKKp4UntfVtFsR1WahYVJnCajv0qOqFsW1Ov
         MkNz6nFx9aIfbGxGAkoXDVi/wF6T3WYsfBBsDj5np+5PjP5u3466RFu5vcfDAmYbLBHz
         ZaAwmtkPlNWptZ7FzXfsp1elHlRKenDRfA/GjzHvz26SXtwpQvFyT0wrVwhsyZIV5/pH
         Z5l9W83g954EtAynF6P6cK+s5PRQSWtjhqx+qzNEI8rXqzxeMYqZsMXyKTwavHzxPGbW
         paDg==
X-Forwarded-Encrypted: i=1; AJvYcCV+ip9EseLUmpdr6nkAW57fPiDPzsZFXKU88xDczakzSdODhkLGR4Jju9ReMXLXsFGTLCC4GdQtQ9ucgJDU@vger.kernel.org
X-Gm-Message-State: AOJu0YxRyi+Fo4BkOeAQSeS1v29OyJsUXlg+pj8T9GZ4+IOo858/wTvp
	H10vB/aZMMa+Ub2kZaMLjKqGVmoMm+g9jhqXpmctSthc+0hDgQ2rn8XGabPIFC2eMA+v/0i4ve/
	P4Yi/bNVzCRsOTM+CWulWg8EP1D8eaSwdZeSts8U/Pib9UEr1k0VqVxc6+F7NPmkPuV3ox89xij
	moCn5zfckHvnZ2IZ+m1jSLLmdlE0OdTcIR9q8dpIA=
X-Gm-Gg: ASbGncv7B5LDCiQrcATr4TumdJj0k4pNFfEVjXqj9LkPGULr3ipN1u0cwEKLBsTj9Rh
	PD3+VM5VyHZNBKb8n8GiE7AID6zflAW0+JG6HbErYN6BZpwI9muAilwxzpXWMDD0aOJrfMkmj
X-Received: by 2002:a17:90b:1f81:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-3053189a552mr11204820a91.8.1743356728876;
        Sun, 30 Mar 2025 10:45:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGME7jRI2sFfJsehCQt4lsWUfCyjJVKWW/oli3FcGjjzFgJjhd9tuzlvDwqRmfcOc8OJA++VOev6W9P/jn0J8E=
X-Received: by 2002:a17:90b:1f81:b0:2ee:8cbb:de28 with SMTP id
 98e67ed59e1d1-3053189a552mr11204793a91.8.1743356728513; Sun, 30 Mar 2025
 10:45:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v4-1-85ef0991bdf8@linaro.org>
In-Reply-To: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v4-1-85ef0991bdf8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 30 Mar 2025 20:45:16 +0300
X-Gm-Features: AQ5f1JpjYWSUXvbaxiHPEpdW5pr9qFF-4jMf2vNXngE7irr28wNVcYOn4zBVpxQ
Message-ID: <CAO9ioeUhx96EYXuMZL0LHBb=Z-prkwX0mPETMvsj-c1qddPtXg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/dp: clamp PWM bit count to advertised MIN and MAX capabilities
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: b5xIC51fpdYAG4dAkovLKwQXsC3y1tRt
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=67e9834c cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Nx99i8uyAvHPRi5pis4A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: b5xIC51fpdYAG4dAkovLKwQXsC3y1tRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300124

On Sun, 30 Mar 2025 at 20:31, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> According to the eDP specification (VESA Embedded DisplayPort Standard
> v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> the MIN value as the effective PWM bit count.
>
> This commit updates the logic to clamp the reported
> DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. As part of this change,
> the behavior is modified such that reading _CAP_MIN and _CAP_MAX
> registers is now required to succeed. Before reading these registers
> was optional.
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
> ---
> Changes in v4:
> - Remove unrelated whitespace changes.
> - Remove unrelated commit change.
> - Add note to commit message about changing read of PWMGEN_BIT_COUNT_CAP_MIN
>   and _CAP__MAX from optional to required.
> - Link to v3: https://lore.kernel.org/r/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org
>
> Changes in v3:
> - Properly rebase patch on top of latest version of drm-misc-next.
> - Make patch more generic by clamping PWM bit count to advertised MIN
>   and MAX capabilities (suggested by Dmitry).
> - Link to v2: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org
>
> Changes in v2:
> - Split backlight brightness patch from T14s OLED enablement series.
> - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> - Rework commit message to reference eDP spec.
> - Rebase on drm-misc-next.
> - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 42 +++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index e2439c8a7fefe116b04aaa689b557e2387b05540..b5c8a75d036b5d65262417de363409e3ff3f4560 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -28,6 +28,7 @@
>  #include <linux/init.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/sched.h>
>  #include <linux/seq_file.h>
> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>         }
>
>         pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +       ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> +       if (ret != 1) {

NAK. See previous discussion.

> +               drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> +                           aux->name, ret);
> +               return -ENODEV;
> +       }
> +       pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;


-- 
With best wishes
Dmitry

