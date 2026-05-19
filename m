Return-Path: <linux-arm-msm+bounces-108536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qANPLY98DGoSiQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:06:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B258119C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9452E30566C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4F931E107;
	Tue, 19 May 2026 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fkx2MItX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jp+XkmGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C403631B114
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202050; cv=none; b=BJRUVNxEk/Do4Yk2CGMQO/IMkjmLAtCOVUYS4ugE96Ay0kVsZL6z/1lO242G26m7f2ClovO8jkvLYA6UVNzrs+RpRfx9Bc/qCxsUMeOF0K2QXPU7J2Qdn3ZJl5SAxiQ841eeJNkE/LhAvaGSu58Dpm6kyBl3WXRXJp70fvUsHBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202050; c=relaxed/simple;
	bh=PORub1hmmDtALj9TsT0FLTOqyO3DlyPnRlea3Zn+bsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fgWR+gbT+0iOLZVbyWh68yO3tPW3zRBxIYwzQYx1FbaPxzGZG2VsYaxLQwDvrHhpblD69h8yih2NaS00OfuKdPxCd9UgnJw5o+IaDECPrqmdVtWOFtfKkaZgNVP9xpC6lpZCWkOg/usO/ujFii/eqgPs455ljOg1ytYkiRaGV5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fkx2MItX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jp+XkmGt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779202046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ac46A5tx5N3WaVtwsY4RrFV9ou6PtDA5opWWhwSNYcE=;
	b=fkx2MItXRTIF7PG5bAvWk1cRcgWfZooHRtbkB2yKliUnC5o8N9uTXFuRDsHd8M9ZGzrztf
	mZGxrkiJu7cAnbzowEz6acmRv6B+33qqKitimztWfd6WtL//JGpdUajeINEcZtG+qkRjMQ
	mHMr+Gl2Unq7iTNDA4Ylgfyugd4GSA8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-FGEBsDByP2ibbr0yo_30kA-1; Tue, 19 May 2026 10:47:24 -0400
X-MC-Unique: FGEBsDByP2ibbr0yo_30kA-1
X-Mimecast-MFC-AGG-ID: FGEBsDByP2ibbr0yo_30kA_1779202043
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48a589c7879so30830085e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779202043; x=1779806843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ac46A5tx5N3WaVtwsY4RrFV9ou6PtDA5opWWhwSNYcE=;
        b=jp+XkmGtvoELYnFYovxmiq7PbZZfE3ANaOTX2Za5mNQobTxUKeEp4AYvJmAZhj3N9U
         zGznC7nW7KuweRNpY2FGwKOyG/2La2h5b2lyhTfDIqTsEamo8FIKi2yJbmqI+XpgN/Rv
         hy33saGZEWigcdklHvrZpUa78WGnR7LQdFZx7GwZBrWsasvWKaTAbJSh9G/oWQNnNnMY
         0KprP+pRH/y15Oj2sZmHy2Hil6dYh39L3sVuqpsTcOifJrjDDsM4D5XGnv/uwsQ4o3OP
         wySEY+O+a8NtpJpnlBb6+Y9Bs7si72Q1vsna66PdftaWUQVasAGSOZ+fkYWwSAnHyP9c
         Sihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202043; x=1779806843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac46A5tx5N3WaVtwsY4RrFV9ou6PtDA5opWWhwSNYcE=;
        b=BO/j7tApTz7v3u7Vk+jtfjozAcf5F7m1uartzXnM36LiQpn0Q+4edZOZGvbhcXb4MG
         qkwSPpuWj/SJbTUGzu+033Z91QLTsLfId0QSGpBR8pZmAow/3IBDShul2lCuVpWx58j9
         SqDyP4lkH5HxzpSu/4uN+H6M14ATZmS6/TJNZCiCYG/V8uh4ezqHIQoeiijE9+VlufYM
         9kBotPMc/SRRw9w7RGgx/hxE8vWcRq59WXSXRdujpPcdzgiFeRoW21qIGEm75TTCthkW
         M8Kfybuvy64CnN58XkxFbevnv+25IqRVMao1kP6fB6aw72SgPxkImv4yg+Lps0w9ldLD
         gPKw==
X-Forwarded-Encrypted: i=1; AFNElJ+sBpqzxMsgb47sw9yY5zwHrhs7YMik3GEYLI3Bw3UHBFwheImha5+NKSGe2EV+sj63JkfdmtvgyXNYErPX@vger.kernel.org
X-Gm-Message-State: AOJu0YxjWygQ/8xucy7oRR4GhrgsAmbkZteCWtfxNelidjyw51+xyvFP
	O7U8Wn3aCFem1y3QjWk11h0JxmZETmzYYf82dPvrFBqYYUCwOLFMw1IoJIjFy7qO9LWjJj9VAfW
	fYdtsuV/Tua3UdC1oBcS6usPEdOfnljg4A3/pmhv9IWkDzG5vzhf/JCFOyxlIPXQkHTc=
X-Gm-Gg: Acq92OGKsaNYX48y50qHBkzHPLq30JJ1HLLfOb2BGbYsdqS1QUGqUWYnEcGb+ZUSid+
	HTsgBkWyYOG6ogjiYNJRzm2pyVZuhrDNYMqFt+2sDdiyBIcvPKznGu/83cWqGV93MNHiPCBogqk
	Qljf3aUAudce3kIQpF/z0anWUfXHfXaX1Pe+m9qbakPryxLaSI0KFwRntET6ermOq6rGyXbjyGp
	9VKCp/Vp8TlC5wEn5M/9ibwLOhcPvNSMXAAoz7dkMrOCoBdjwYpEhzHT5W1Mu5gTTpE4rfrEai7
	5oG2jNSWnepNlRwAfcdY27jxstB2/ip/xkKg1u+hn1TCw1+ZcSJtfeMr5deUyZSwmCc+LiKmc09
	WhSJq890dF5gbC7b2yhZ2e2bKxrkvfOPaewZZCCOGvlLWxD5MLp2uVuGD8Q==
X-Received: by 2002:a05:600d:8:b0:48f:e044:927d with SMTP id 5b1f17b1804b1-48fe537fa84mr260382085e9.10.1779202043378;
        Tue, 19 May 2026 07:47:23 -0700 (PDT)
X-Received: by 2002:a05:600d:8:b0:48f:e044:927d with SMTP id 5b1f17b1804b1-48fe537fa84mr260381215e9.10.1779202042898;
        Tue, 19 May 2026 07:47:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53767ecsm298800115e9.10.2026.05.19.07.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:47:22 -0700 (PDT)
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
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Sean Paul <sean@poorly.run>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/8] drm/display: hdmi: Add common TMDS character rate constants
Date: Tue, 19 May 2026 16:46:56 +0200
Message-ID: <20260519144712.1418302-1-javierm@redhat.com>
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
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linux.dev,foss.st.com,intel.com,rock-chips.com,kernel.org,hotmail.com,collabora.com,gmail.com,oss.qualcomm.com,sntech.de,kwiboo.se,ideasonboard.com,nxp.com,bootlin.com,linux.intel.com,somainline.org,linaro.org,sholland.org,poorly.run,ffwll.ch,suse.de,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108536-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1F4B258119C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Several DRM drivers define their own local macros or use magic numbers for
the standard HDMI TMDS character rate limits. Maxime Ripard suggested that
instead these common rate constants could be included to a shared header.

This series introduces these constants to the <drm/display/drm_hdmi_helper.h>
header and replaces the local defined constants or magic numbers in drivers.

I split the changes as one patch per driver, so that these can be reviewed
individually and merged at their own pace.


Javier Martinez Canillas (8):
  drm/display: hdmi: Add common TMDS character rate constants
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
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c     |  9 +++++----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c     |  9 +++++----
 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c   |  5 +++--
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c       |  4 ++--
 include/drm/display/drm_hdmi_helper.h        |  6 ++++++
 8 files changed, 28 insertions(+), 25 deletions(-)

-- 
2.54.0

base-commit: fa81649af168a4d6d5260ed0fa9bbb5f6db3f11c
branch: add-common-tmds-rates


