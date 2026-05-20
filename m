Return-Path: <linux-arm-msm+bounces-108783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBhdKUrODWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:07:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C50590833
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11CC53007ACA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996843ED3C9;
	Wed, 20 May 2026 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eaY+fPti";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DpPmc8vb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FA03A4505
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288274; cv=none; b=pvgQGyqlyNn38+VsmC5a27fXyXsVNno5Xfw8ac0Htn5EAWbJyuFcBzBZM8ss5jYU01wPJLs56G7NcJ4Zpuur/MPwCgsor7n7YfyPIXrLsak5MCqzCA116B9apjU4nWVjBazUummgKNos1dXYakr06wLbxGuDMiq8US6l/5PY3c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288274; c=relaxed/simple;
	bh=/keM7vjYSsPU5nag3X4BSRNwEW2W3vDx27MfrzaIiWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=huuPOCnnXw0wzL7u8HE+pgwuZbCpkCkF6EpT9cSaTFHYm0q+mJ2kmzRUCLOiPHRalGkMXefLnNOBWRCR02xY0RtFfAaM5Ax9moWmTtX1Iaqbz3Z7qgDW3wMnIKl1m9MaXdYQWYcyvoWZ+TBCgyO/SVVy1/GETVYcwQ8qg/LOUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eaY+fPti; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DpPmc8vb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779288271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rBONYP+S2lSO7lzzc2ExLTPJBMyi8jCEBbTq/shG5lA=;
	b=eaY+fPtio4U/qH381mS4Uu6XSXEzthUiV1aCBXz/H+OEWKpEyL7ERHI8GMrOtq+BaLM4c8
	gP9fF8Q/5xHMTbjx0s97aT6lh6JGIMw0y4/k1HnLjVUU0S/nQ24I7jBjJCk7wcccSpUOaV
	SCaw3CSug6HXotWE2KvgJea3ljCE/P0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-5N1BMJ_SP-iAQbHzwn7znA-1; Wed, 20 May 2026 10:44:30 -0400
X-MC-Unique: 5N1BMJ_SP-iAQbHzwn7znA-1
X-Mimecast-MFC-AGG-ID: 5N1BMJ_SP-iAQbHzwn7znA_1779288269
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-44b186b715aso3138520f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779288269; x=1779893069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rBONYP+S2lSO7lzzc2ExLTPJBMyi8jCEBbTq/shG5lA=;
        b=DpPmc8vbtPQYBkNUbXpb9fMTa+RLnB9W+TzE0mWmn/zudfQ39r4sQWK0mKr1BMqSUt
         oUpNTLXXsAR4MnmtXenPVSEWR2FJDSSlhEy2VD9gkUL+DlcDyYV2qmoo1WSXJ8HpkQZy
         DhCK4aYMClR62aaNeGknzXJ/dS1+TMTqYD4SAcGTNoqoPjcBVIUWbGERjaD/FGJtY16t
         J8ADI0/+jZiPp8mV32/25m1yh9U2aIalpQiqFhJJODqRE4E4jOKp83Yt30b5EeW0qUIC
         jJZMm+mVczMZRL79/wiprcc4aQHvbpENoV6eD2vStFfbBZ2bcV2V315OLz3/vvLCKLW3
         0MiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288269; x=1779893069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBONYP+S2lSO7lzzc2ExLTPJBMyi8jCEBbTq/shG5lA=;
        b=ekdi0i3DSHSsuXmkAMdsmF8BvOiI2eU+0Pgy3IstqH6ybEhRixBlJFgBQ7NFhcRWSG
         KaBJ3iJwWir6ZrM0BFdhd0xAMmEXLMFRIdd9BaQQgqem6Mbhh6jIOoPwevTY808Q4JqX
         QgIoKeQu/tkXenmVHYR/e33jcKf0ceMvtuUw2u2XgaevY41FM84Z514UFaEU/0V8hzva
         OofyTfFBquINHa6bPPyYIKfFQmtOKtUePcGgEMx8ww181KgqNdVlfsnekdhNo0PyxGSZ
         tsEQtlnqj3LI1x64k0mkIm7VnMWmhFFbsROs/vUt0ODu1zg78BwxqVwxBu+r+GwwTf1p
         kASQ==
X-Forwarded-Encrypted: i=1; AFNElJ+T2WetzbB0bWJ4xCDaMt0U5Qf46x9aX4w7hy1YW8fRGvCmNrU4YAnGDlADs0bwq6db+s41P/uqXfVPzx4P@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6nXWBSK/JKz6LYD8BMtMWr7dcUAeDlbDACwVWAR6qYvrs7nwJ
	4P2+O7tjbFJXx5SLxcyf3tsJmdWzjPPWPf8tmd7PZ/oKg12okyvplSloF3ApPrzR1fsw5TKKBHg
	3BUiRikevS7B2+NfLyLEjYmXMI2x3gpLpR48Q4SZpMJyiQAWOGyDWLgbg0IQrBOhct/k=
X-Gm-Gg: Acq92OEsQaPNrc+9a74wap7ibT6FFIoUES/igB6q2n4by4HcBMki9IOKgvh9HzrOusx
	ifQ24353hYrMhgkxlAjcikjT/01r6R25wha3xA5deoEFf3EDkHV7Bg5zTZUuTxCkBcXRltDG3i7
	7XMunXacTHuTrTz4iNDdGi+dAOZn7eCmvf+eesqW2IO3jfAGJQ/F9dyQf2ia5KLJwcSGg3XIzTL
	3/Y4ci7rnay8YTlDJU4qtWeF1a5A50a/M6UVOFkU1JpTf3M5MunC7/gJ6ZfB2GzLbDTrJ0UwAJt
	Pq/RLLW+ebnDQpr2o3yx7QN2S4VN7MC8v25gDQIxm9iVugWIpAyvkHOzpRLdRrl0IzlMZRxnc1C
	tj4V0ZvJPPdNIeE73OlfKxf6t4gFdW9aerBoN+IcDeBvzY1RGwJMXh/FPNQ==
X-Received: by 2002:a5d:64e4:0:b0:43e:b0f8:66f1 with SMTP id ffacd0b85a97d-45e5c5aebdcmr40650623f8f.43.1779288269061;
        Wed, 20 May 2026 07:44:29 -0700 (PDT)
X-Received: by 2002:a5d:64e4:0:b0:43e:b0f8:66f1 with SMTP id ffacd0b85a97d-45e5c5aebdcmr40650545f8f.43.1779288268562;
        Wed, 20 May 2026 07:44:28 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm55752127f8f.36.2026.05.20.07.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:44:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Daniel Stone <daniels@collabora.com>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jani Nikula <jani.nikula@intel.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Sean Paul <sean@poorly.run>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/8] hdmi: Add common TMDS character rate constants
Date: Wed, 20 May 2026 16:43:36 +0200
Message-ID: <20260520144424.1633354-1-javierm@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linux.dev,foss.st.com,intel.com,rock-chips.com,kernel.org,hotmail.com,collabora.com,gmail.com,oss.qualcomm.com,sntech.de,kwiboo.se,ideasonboard.com,nxp.com,bootlin.com,linux.intel.com,somainline.org,linaro.org,sholland.org,poorly.run,ffwll.ch,suse.de,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	TAGGED_FROM(0.00)[bounces-108783-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 37C50590833
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Several DRM drivers define their own local macros or use magic numbers for
the standard HDMI TMDS character rate limits. Maxime Ripard suggested that
instead these common rate constants could be included to a shared header.

This series introduces these constants to the <linux/hdmi.h> header and
replaces the local defined constants or magic numbers in drivers.

I split the changes as one patch per driver, so that these can be reviewed
individually and merged at their own pace.

This is a version 2 that addresses issues pointed out by Maxime Ripard and
Dmitry Baryshkov.

Changes in v2:
- Change naming convention to HDMI_$SPEC_TMDS_CHAR_RATE_MAX_HZ (Maxime).
- Define the constants in <linux/hdmi.h> (Dmitry).

Javier Martinez Canillas (8):
  video/hdmi: Add common TMDS character rate constants
  drm/bridge: dw-hdmi: Use the common TMDS char rate constant
  drm/bridge: dw-hdmi-qp: Use the common TMDS char rate constant
  drm/bridge: inno-hdmi: Use the common TMDS char rate constant
  drm/sti: hdmi: Use the common TMDS char rate constants
  drm/sun4i: hdmi: Use the common TMDS char rate constant
  drm/msm/hdmi: Use the common TMDS char rate constants in 8996 PHY
  drm/msm/hdmi: Use the common TMDS char rate constants in 8998 PHY

 drivers/gpu/drm/bridge/inno-hdmi.c           |  4 +---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c |  6 ++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c    | 10 ++++------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c     |  6 ++----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c     |  6 ++----
 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c   |  6 ++++--
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c       |  4 ++--
 include/linux/hdmi.h                         |  6 ++++++
 8 files changed, 23 insertions(+), 25 deletions(-)

-- 
2.54.0

base-commit: 88658ff0e4e7f46dbf8179af1280f2cb295fb0cb
branch: add-common-tmds-rates-v2


