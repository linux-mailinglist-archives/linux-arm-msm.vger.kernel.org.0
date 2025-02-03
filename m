Return-Path: <linux-arm-msm+bounces-46729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55889A25798
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 11:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE6D33A838F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 10:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D212036F9;
	Mon,  3 Feb 2025 10:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDyDYXVN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DE1202F97
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 10:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580311; cv=none; b=le/DNigR2R8nOKISYvdlixBPFF1zInVUifD4CSsmTk6JJmAuk49Yk1fLlUje19aECk0r4/K8qTyujo/VR29ffkmHwIW9PGYCCN799G9RrGqLrGjaM6xe5SU0aT9C0GkMG7JzC+peFO+3ut0AG+GfO2L3HZFKF0lB5aZs8qxGVv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580311; c=relaxed/simple;
	bh=Jh+EL4p/6JSMFadATMQ/dMawzZEL4l2MOkq/1iyumns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pd2aWmfzIA23jy07wZHKtKl9stFLsh/PFD4cz0kTElugtIw7/ghQ2FsFju0r9awo0LiNMz7SQOm2ToQ/IGUnn7F2+QmFw6yB6IeO1n0nr89bhMfvT/t2t4R1evrKLCV9OEnxtVjouweG4dz4AQteBNvtjvbnMRDs1QDnQAyONOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sDyDYXVN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4368a293339so49773175e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 02:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738580308; x=1739185108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YU2toixtghG/UIHIgDfi+TrJAb+KbxkNuLjUS/jgDXM=;
        b=sDyDYXVNFP+iewVdmnRCOTGbB8y1zrIccusyVzUPSBbgkIsQB7aC0cfik+PBycS4Am
         J+TwWKqOqbdXe1UgHVTSwOl4LM8Ey4NRML6gfy4YXr1gZFLyQzqt7tpA30BeLx+aTP5G
         8+vtiNJtmtQV+wzh/u7f4CWan+VhimqYarzI974NqFmvKOMuVNcdKRXwuhLSX/VXdhOm
         tE+YNG1fMr0Sh7d6wMCGGfA4YiIpFNjjc4E6r7VSb/0B4IP8ufzC3DtYVAFiX22R289n
         +LB2hE03iFXO56yimOiujIdS+SJXsgbdweOshpYRFeWQfaAB+TVUsct+xsH5KOKxXpXl
         01QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738580308; x=1739185108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YU2toixtghG/UIHIgDfi+TrJAb+KbxkNuLjUS/jgDXM=;
        b=i25lXnt6gk+ZehTiWpw1KsttUTC2LvUKmoQxGnHshnZP53GHsT23ubk3/rwYucW0+M
         eJTCVZqqhZ8KE4CON/LkwxitkbzJBaYPK5Wse1HPdG/3/tucOep0YBQ8lafaWk2yX1rL
         15Ir55G2wN6KLpPd6Wzxq235IFzGe9sAMAyUIvFI5bccVjYZxh0pb3eoBFV0EfYpV3/p
         euBfptX2anu5RQyRZwFEsEOQ7j/6v0PFAdzr417ldvpx2Dec8CkTFGmhZt19yt/cos98
         1ToMCCmWM3/3iLIHmWtBQjrunuZm3YLNaAIYZqOWYhTVYckT6duZClf5blEsmZDkD0EY
         WlIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh2ntTCXYHIcWrB+L0wqUvZ2faDvhFFgS9nfaFHOjtoy0qKuWJ+dwpobPm/+aH0tp9Nnku2yK9codVmCom@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf17g5WC8fbRbh09xzIDxIyRHDSQxEP6uXynPslesLXKdS/1e8
	KkSdpRMRWM1osvfanhrzrPFcLqtzjtkVzB01OqFkZuw8ZKUOLU47OwFyQifh5TE=
X-Gm-Gg: ASbGncsXR3U+UyMgqO4qHV+UUhaDsVNlMxU2W+aQjPBPIesvDcKz/8dDgEAJV2GcR9z
	gIEeo/kbojAx0bbKym7wIcD6Gi3iVrDnSw5ecgczb3UXE8LVXIL4FK3LwnVn51BKePvZpc76t7I
	df7A75rhMeMguH0tBeW5rob3HmL/DFpFF75lsMBXT9xMhh7eTP3E3gedVXjDoio03816ZgMqHLF
	KXdTClXYCvCJywNZ5pz7/FruAmG+9kce/gcX4XAxP/K/CB8dV4qGJApKu/NiwNmPXKcaCtKG7Ed
	iouIayKl9dNdOl0=
X-Google-Smtp-Source: AGHT+IG3sxZoF1BxKwDs6D8yKh85vjYaq2CGCwZLuA4JBiE6X/IAqNanFP9ag+j0VZ8Qqg5mgek9bg==
X-Received: by 2002:a05:600c:35d1:b0:436:1971:2a4 with SMTP id 5b1f17b1804b1-438dc3cc9f1mr185238805e9.17.1738580307609;
        Mon, 03 Feb 2025 02:58:27 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c13a0efsm12555083f8f.60.2025.02.03.02.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 02:58:27 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 03 Feb 2025 12:57:59 +0200
Subject: [PATCH v5 4/4] drm/msm/dp: Add support for LTTPR handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-4-c865d0e56d6e@linaro.org>
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
In-Reply-To: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3226; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Jh+EL4p/6JSMFadATMQ/dMawzZEL4l2MOkq/1iyumns=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnoKFIouFywSlDaZiCw4jErWqSRIqEpI3epr4AW
 pUfu6e93kKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6ChSAAKCRAbX0TJAJUV
 VkinEADM92QE1zN3OdqwoLmwOoyxpCMwh545d6+dM1Jydy6p2+/Kc4BB1xjuxNF1HNo5rtoqH07
 ym9dN4Q2Qq7XF1KIk/3CrsDT4I6xsQyH+dZXcInkRjCUYzr92gP/vw1kR3ZEqKR0MhGKoby+vee
 AMNZ73KL9sbyxqDOSvYlfU64YT+4M3Y0RjyunUFlc8d0B77KoL9D1lf+9S/cf/VIG5xt10eHvCI
 Y/7TVphY3czZAV8pnzwIf8rvKl8ovXxM1wuxLd5rbHSICbG9xkbeuPm9Gk0ayUP21CpdlnMwnrO
 ZgiMbd646uADECWUTsnLP+vy/yGmYdZk+wxCNssoiv8Uwdn5ZBIDrTreTRLOTRfs0yrkWKw+2Rr
 nvsWS9eg48JbmcR2ZEUHO9TK8fTbA7zOnb/X1M9Xm6dTObpCTrH/1WvFKyJHOT+F8lkUhOhWYM5
 FHml27aV+44Peh/GLto6Qzz4d2+f92sCsBH9ywrCKadg7S/0e9kxiYCsVG5CPv74tlxnI1MJTIk
 38joR4PETewNrhxKk1ppq87XoZJCSGrVxk/IZsbYHALamKacJUTrn6kJ91yS/mNIU23LtyOTkdh
 M2PhJ+2wRSHuQtQv19TyrWt+d38PCVc5NM4iGWqb0J4QbPzEgPwhp1xeCLwRcvp1mk/vM6udNFY
 hRWMZsNaZcQlw7w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
1.4a specification. As the name suggests, these PHY repeaters are
capable of adjusting their output for link training purposes.

According to the DisplayPort standard, LTTPRs have two operating
modes:
 - non-transparent - it replies to DPCD LTTPR field specific AUX
   requests, while passes through all other AUX requests
 - transparent - it passes through all AUX requests.

Switching between these two modes is done by the DPTX by issuing
an AUX write to the DPCD PHY_REPEATER_MODE register.

The msm DP driver is currently lacking any handling of LTTPRs.
This means that if at least one LTTPR is found between DPTX and DPRX,
the link training would fail if that LTTPR was not already configured
in transparent mode.

The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
that before link training with the LTTPR is started, the DPTX may place
the LTTPR in non-transparent mode by first switching to transparent mode
and then to non-transparent mode. This operation seems to be needed only
on first link training and doesn't need to be done again until device is
unplugged.

It has been observed on a few X Elite-based platforms which have
such LTTPRs in their board design that the DPTX needs to follow the
procedure described above in order for the link training to be successful.

So add support for reading the LTTPR DPCD caps to figure out the number
of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
at least one such an LTTPR, set its operation mode to transparent mode
first and then to non-transparent, just like the mentioned section of
the specification mandates.

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 24dd37f1682bf5016bb0efbeb44489061deff060..1dd8f94e27475ae5b5b25d80f758968e6818f6cc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -367,6 +367,19 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
+static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
+{
+	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
+	int rc;
+
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd, lttpr_caps))
+		return;
+
+	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(lttpr_caps));
+	if (rc)
+		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
@@ -377,6 +390,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
+	msm_dp_display_lttpr_init(dp);
+
 	msm_dp_link_process_request(dp->link);
 
 	if (!dp->msm_dp_display.is_edp)

-- 
2.34.1


