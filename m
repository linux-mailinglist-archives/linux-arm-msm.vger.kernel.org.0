Return-Path: <linux-arm-msm+bounces-55523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D95A9B996
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 23:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC2021B68221
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 21:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197E3215060;
	Thu, 24 Apr 2025 21:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxbk79Cv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A91F14E2E2;
	Thu, 24 Apr 2025 21:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745529151; cv=none; b=MGthlM0hKI+S6vvYvU1hNB4Dv8xvaN2uIilf8YbOyzLhfYH7PQjLY76gZhzF2jDhMU4Dswycj7O1JfNynMIaN7mLYS7dwcWoPXF6KYRm+9KJiZu/huPqzuJFMctz6pJ9DsXLN1k115ZCx8kfd/LiMrrwPyAhV4fZaPbF8QxVU2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745529151; c=relaxed/simple;
	bh=VgnxegN+AiUdHNvx/OGE0VJqyEaMhxw5IosVNS2ul8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTccxUgaZip4oZqx/C5OHnpykQs1SecsbA8U/t+xOyDLKgN+fjqJHj+krXju1WFHfnDwBrws2md4QCaW4B3Sm3IOa5H2lbwRrmr1is3rQZTJeJMr+D0HozX9KFKQfiaFvF5LEF4H+Rz0g7ZBhhb20/1oTkq4RgNFWxQ/8XNZpKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxbk79Cv; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d589ed2b47so4645625ab.2;
        Thu, 24 Apr 2025 14:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745529148; x=1746133948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jecia6s2JNR2xEO3HrUkYsvVoWooMAU8KQ0rtFmv/c=;
        b=bxbk79CvnOEj0VaIzpp2RX8We98u+wWdZBl11XhqHe7s+/plBbsu3OAk7xgvICkpdH
         C9HxGxtRHQqY3kTp1x4VxDN6/bCmAdT9I1j284ALDwZYdDboCPctEMTnhx/sexEmx3c0
         wE2VU6kzMIwEa1XQ+Zt/OeDRu/oBZXH1eAlAIMDOPQXfN41L/BGhFPJWU6/sFLH8M9lg
         6Rb6f7C59JsU/KMj4FaDrtRtiwpnNYlByr0zBeP0zuMDI4kJEc0hYANev4kYWIGeLG2g
         zRrkI5j+pu74ASqqpKygfRh5jEMHWCXExwcpeCvTL4PKSMy/6gHc0vRI2A4I0lJu+oMd
         2nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745529148; x=1746133948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jecia6s2JNR2xEO3HrUkYsvVoWooMAU8KQ0rtFmv/c=;
        b=vRmjsIPVOZ2QTLnjglDwbG92DHowA0wJeqjuZqGB5Z58hJHwXzoo0DcO7GxiIKyAqq
         iFlYiQnsN3TES2tZGqAtLduI8+gtUvkw0hNiXj8sxBtTgbYqVWt9OhpIQ5i5OfJqsaV+
         7Q+Oa9PY/xNilzzf7wcONrKhZZpmr+CuvW79mhUK7uEBDozF8gNHWiZAPhdlgk91Mw31
         VDoxPGJUc/UeqeCagLlWNGyzMsLNPb8VcBYLOgvH+WNl9OBMt4PPqPOpTjQ52G6036GB
         PnxpnLliX5QpL51dfeszVbOnk6gQJy+KA6IuC5AZ9vIv9118ZyjqQ7z0jZiA+hvH9OtN
         tEOA==
X-Forwarded-Encrypted: i=1; AJvYcCWCYHd/t2mZoEf+MibdAaS7JevI4pOF23Di35ybhdy6+HqxnsoxYxM26AfGRJUP9AUZNa+09+t8tvXjrVFZ@vger.kernel.org, AJvYcCWrAzNBMA1OFKgfz0gFYqA6AdJzVEXKRK8woDcmk/xSU/XNn0V4Euv15R6Cn7Yox4ZgmUgjje4+KS5CuiX6@vger.kernel.org
X-Gm-Message-State: AOJu0YwTetSN7PsllBvpmrwyrnl7u7AzMhYc5NIY8M7kaKdCtzMwwqLW
	AOlP3TRRiORVBfgH5LORAEJOfkjuKWq2IdYTYLDlI7uPvy8bt6CR0Gxxhiv9Y5+JeV7KwXOgxon
	3t8j88T98mqWbqovYfD3wv3hzf04=
X-Gm-Gg: ASbGnctTP8o23tHpfDdpTNGhzmluWeE0yVUcXbTFBzi5SlkmZSetB/Q7Q7W8Aq/AeGM
	8486fjYra8Wvbi0HfA7zRoz70KbUPVdVXeJbVIGpM8hghtIsCd45DJm63Cz3yIo/jiSXeFH0auA
	O3IsD/VehDvF/cSCrdaXztlpT4OeWGrlp/a+D72QPi9s+CUj8T3B/ous1P
X-Google-Smtp-Source: AGHT+IGwg57PbGCAJtcA1b9fqEb8SXvQsj9ID0gfQZuJ29n4nfIKh+iiGOC7fjlxHKkpbrZ6VyFzhutJKQUYzyyRRFU=
X-Received: by 2002:a05:6e02:188f:b0:3d6:cbed:330c with SMTP id
 e9e14a558f8ab-3d9303b7774mr45553075ab.11.1745529148486; Thu, 24 Apr 2025
 14:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
In-Reply-To: <20250417021349.148911-1-alex.vinarskis@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 24 Apr 2025 14:12:15 -0700
X-Gm-Features: ATxdqUHz6DZ9blgWAq2Iad4ekg_aVkIGiDF4KqqZFyT1Q27qjUmJcTIdj9Q8vng
Message-ID: <CAF6AEGs5Sw76kVS6_GaK6=VZ3jWPuqN9bc+7UvVU=jfaBBTLDQ@mail.gmail.com>
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, laurentiu.tudor1@dell.com, abel.vesa@linaro.org, 
	johan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 7:13=E2=80=AFPM Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> to non-transparent mode to enable video output on X1E-based devices
> that come with LTTPR on the motherboards. However, video would not work
> if additional LTTPR(s) are present between sink and source, which is
> the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
>
> First, take into account LTTPR capabilities when computing max link
> rate, number of lanes. Take into account previous discussion on the
> lists - exit early if reading DPCD caps failed. This also fixes
> "*ERROR* panel edid read failed" on some monitors which seems to be
> caused by msm_dp_panel_read_sink_caps running before LTTPR(s) are
> initialized.
>
> Finally, implement link training per-segment. Pass lttpr_count to all
> required helpers.
> This seems to also partially improve UI (Wayland) hanging when
> changing external display's link parameters (resolution, framerate):
> * Prior to this series, via direct USB Type-C to display connection,
>   attempt to change resolution or framerate hangs the UI, setting does
>   not stick. Some back and forth replugging finally sets desired
>   parameters.
> * With this series, via direct USB Type-C to display connection,
>   changing parameters works most of the time, without UI freezing. Via
>   docking station/multiple LTTPRs the setting again does not stick.
> * On Xorg changing link paramaters works in all combinations.
>
> These appear to be mainlink initialization related, as in all cases LT
> passes successfully.
>
> Test matrix:
> * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland (myself)
>         * Left USB Type-C, Right USB Type-C
>         * Direct monitor connection, Dell WD19TB, Dell WD22TB4, USB
>           Type-C to HDMI dongle, USB Type-C to DP dongle
>         * Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
>           monitor per USB Type-C connector)
> * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland (myself)
>         * Left USB Type-C, Right USB Type-C
>         * Direct monitor connection
>         * Samsung S34BG85 (USB Type-C), Dell U2725QE (universal
>           Thunderbolt/USB Type-C, probes with an LTTPR when in USB
>           Type-C/DP Alt mode)
> * Dell XPS 9345, Debian trixie/sid, Gnome 48, Wayland (Stefan Schmidt)
>         * Left USB Type-C, Right USB Type-C
>         * Dell WD15 Dock with DisplayPort connected
>         * Dell HD22Q dock with HDMI connected
>         * USB Type-C to HDMI dongle
>         * Dell U3417W

For the series,

Tested-by: Rob Clark <robdclark@gmail.com>  # yoga slim 7x

patch 4/4 had a number of conflicting hunks, you might need to rebase
on msm-next

BR,
-R

> In both cases, "Thunderbot Support"/"USB4 PCIE Tunneling" was disabled
> in UEFI to force universal Thunderbolt/USB Type-C devices to work in
> DP Alt mode.
> In both cases laptops had HBR3 patches applied [1], resulting in
> maximum successful link at 3440x1440@100hz and 4k@60hz respectively.
> When using Dell WD22TB4/U2725QE, USB Type-C pin assigment D got enabled
> and USB3.0 devices were working in parallel to video ouput.
>
> Known issues:
> * As mentioned above, it appears that on Gnome+Wayland framerate and
>   resolution parameter adjustment is not stable.
>
> Due to lack of access to the official DisplayPort specfication, changes
> were primarily inspired by/reverse engineered from Intel's i915 driver.
>
> [1] https://lore.kernel.org/all/20250226231436.16138-2-alex.vinarskis@gma=
il.com/
>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
>
> ---
>
> Changes in v3:
> - Split 1st patch into 3
> - Simplified handling of max_lttpr_lanes/max_lttpr_rate
> - Moved lttpr_common_caps to msm_dp_link (not msm_dp_panel, as LTTPRs
>   are link related, not panel related)
> - Picked Stefan's T-b tag (last patch only, as 1st one is getting split)
> - Droped Abel's R-b tags from 1st patch that got split due to high diff
> - Fixed alignment issues, initialization of variables, debug prints
> - Moved lttpr_count to avoid ugly pointer
> - Link to v2: https://lore.kernel.org/all/20250311234109.136510-1-alex.vi=
narskis@gmail.com/
>
> Changes in v2:
> - Picked up Abel's R-b tags
> - Fixed typo as per Abel, fixed readability as per Johan
> - Updated cover and commit message on mailink issue which appears to be
>   specific to Gnome+Wayland. No problems on Xorg.
> - Link to v1: https://lore.kernel.org/all/20250310211039.29843-1-alex.vin=
arskis@gmail.com/
>
> Aleksandrs Vinarskis (4):
>   drm/msm/dp: Fix support of LTTPR initialization
>   drm/msm/dp: Account for LTTPRs capabilities
>   drm/msm/dp: Prepare for link training per-segment for LTTPRs
>   drm/msm/dp: Introduce link training per-segment for LTTPRs
>
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 126 ++++++++++++++++++++--------
>  drivers/gpu/drm/msm/dp/dp_display.c |  27 ++++--
>  drivers/gpu/drm/msm/dp/dp_link.h    |   4 +
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  12 ++-
>  4 files changed, 122 insertions(+), 47 deletions(-)
>
> --
> 2.45.2
>

