Return-Path: <linux-arm-msm+bounces-111005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cFagIQo7IGq/ywAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:32:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D25016389F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:32:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=T9lWjzkC;
	dkim=pass header.d=redhat.com header.s=google header.b=AyKXxIs6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111005-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111005-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08D3B321C209
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8252481256;
	Wed,  3 Jun 2026 14:22:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0B73C768B
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:22:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496545; cv=none; b=RTrsZ2WWYOEOjnPhLQ7EUTqEYrbHb9aCLXsydq77IYoUFvWV5kQgN4Tv2sqti8VsYhsB1f+jxySVEHDuqfTawjeEhLQihS3hJhSxTjRn199N7pmuPK+Bg6Y4FrriZ88lxfNbz/m//xHVxQ24V+vIO+pyv2WZzBOs0x+AxlPOO78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496545; c=relaxed/simple;
	bh=l+2P1dBX81vgw2nho/fHdP1mCD8SVFm15hd0JusVrc0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dG3PEoV38oD+3qKr4ZqazgRm8/hseTB2wK1rr91WTBznXf3w0bp0Eh3Qupo9KRZEP/DooXdHkkBMYCsjH5PNYznGslYSNsiIJszc8d+6KedQ5TGe1JuTBQKZyrAAfkOoZRGWGWs8CvpXkGB95epjoXkXmfL2J5SwMoIcMN8/9bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T9lWjzkC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AyKXxIs6; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780496543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sFo0mY51Ge3AQT1ROXDKNVoMAp8XWclqz2ImP5QKGYM=;
	b=T9lWjzkCLs710Md3v5+Sfv9WP59JQy/HD69l+YsIulMsu1o4XF3XvrUYyhir43XY6K86wK
	7Q+XfhMI+6YTuW/nbHYrf+95X0axMsJGPN1WGBL/dmLwpMaui+Qz7Mz+jy9wYedavzRDUF
	lUGr6ktOs+G7lPI3+6fiyoFwVZJlIKw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-B7-kOMVkOrWmvEi9qsSIew-1; Wed, 03 Jun 2026 10:22:20 -0400
X-MC-Unique: B7-kOMVkOrWmvEi9qsSIew-1
X-Mimecast-MFC-AGG-ID: B7-kOMVkOrWmvEi9qsSIew_1780496540
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51774fd6d51so25521091cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780496540; x=1781101340; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFo0mY51Ge3AQT1ROXDKNVoMAp8XWclqz2ImP5QKGYM=;
        b=AyKXxIs6Abdm5hWvDl/oc78IY2SvWL1KLRj5In1EGftlGp/23KJwavhfGkOFNbhvWt
         B5mm+2/i7eoSKO4Q3EGO+/Ls/Tj1ta59LsGl8RGBZtH5HBpcvsfr4rSfiODf3z8N7ePu
         MZ5X8s0HbjedLwGAGVFX6BVsqFdTE/vAPNKy9y77hvADdwZd8UVQoqSONkbrdagfM7aR
         QMuv/XxgRTF7vNyo0T1v/bu3vIgSXauvVc931PsvMpVqSMoYw/7qNLF8BUH1/XlTfLBv
         7Wqr5I+4qP7DhpQBgDnI+M+R7LLoMwV63Xybb99Cm1z7jka4y3NFSqDVyTOkQ+ZgQ3EK
         hU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496540; x=1781101340;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFo0mY51Ge3AQT1ROXDKNVoMAp8XWclqz2ImP5QKGYM=;
        b=nhPZm3GKsb+tgmCbrhFuO0Pfb5zMJvzChr7ffBPx6AoDkKqq7AbgeKjty/fX+2Lbr1
         p/UdlAvbe3IhxW2jyvuQjLBoMV1jha/6ZdFhAjaBhKif2RbCxXi0vo9oONR3+QFuPrtm
         lKcFS7JTGcPs5e1opgmsAPV6R09LnhzV78tDnVxhD+cAemKqn5p96csCOJXdpv1mPSXm
         NfvLxx9Ftf3r17FMHlAr5Fc1NoZ6s+4zZxCLdo9IeK4PQi+j/YbIOYsSfpWvugvtM/1n
         uhxUegvTmZ+kJtsX/eFVI4vu6v4yxBbV72FqiMBBxVkdTbBh0/I21UxNkUK1qT6taEFL
         yoWA==
X-Forwarded-Encrypted: i=1; AFNElJ/CqvoIqtbqnhV69AjRYJlznsUdbNuRttdPXGNue9yrj1DHWPDNx/gSVLxPe4f4vyyB4GrjDt2bGpESQaNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxRExWZ58P2bvV3EQAKlQWTzV+Tqu0c5+DsQt2H4mguOjaEA56N
	617t9VHxjhz9b0z4NmT/QmBmgW7f+q2oP5xfzDCOC9HHHBCBh+nSPPIkT/RV1TBsOlVIOI1lbpu
	Tf6fTMQ5pi5eVk4ybHw0G7IfBtjeg1AB+nTJ7vL2/fBFAMg8FNvfgs0/J8JRZnCWBZtM=
X-Gm-Gg: Acq92OGzJaVqzmqJRBDW1jhjKh7fMQ7W95PP9KwsW+ObJ01ni7zVlYTe4c3PrjhL56w
	n7NhqH3AaZ0uPP5atlcohn+OJLv8OAL8zLBQZJzL3d8BKYVh5BBvTJlisI0KKIl7a2UGaTQllmh
	wVO+YlTNlRMi++KxoDY5usZhT04SVFWMViNp3KyqHYo/yDL5tc5Q7pWq82wdrzO7FlZ95jZBMp9
	4QEHslZRH6NBBdaxqN/Hwtcra1afGYoZEC83kRon+2qboNizebiasv0ZPDS1+UI/7I4/YSWFE07
	uyS7B+ICEbPZhVHxScKEgwUm9vh4EGAPvPY4Ck6Ufzssn78t8WkLBfSkepKFYxLxTJSmk/QtfpM
	BrgVbbnWp5F2p5NYliQikWbTmW3IsNCErGLMGLWu4SzF2+xdkiJTcwpuwqmEIdTG95rVlDIA=
X-Received: by 2002:a05:620a:25cf:b0:914:e3dd:17e3 with SMTP id af79cd13be357-9158a6569acmr532114785a.4.1780496539654;
        Wed, 03 Jun 2026 07:22:19 -0700 (PDT)
X-Received: by 2002:a05:620a:25cf:b0:914:e3dd:17e3 with SMTP id af79cd13be357-9158a6569acmr532106585a.4.1780496538968;
        Wed, 03 Jun 2026 07:22:18 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a238f8esm255611585a.15.2026.06.03.07.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:22:18 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/4] clk: implement sync_state support
Date: Wed, 03 Jun 2026 10:21:45 -0400
Message-Id: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwMj3eScbN3iyrxk3eKSxJJU3WQDU2PLZFNTY4M0EyWgpoKi1LTMCrC
 B0bG1tQAOf4WIYAAAAA==
X-Change-ID: 20260602-clk-sync-state-c0539c5530f4
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=l+2P1dBX81vgw2nho/fHdP1mCD8SVFm15hd0JusVrc0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIULPqCEpY906rdvy+Ot13s6IFilaDQtN88/D7LI5Sdr
 3hzzvncUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwESO72L4Z/Cu5ufB8FVBv87P
 MK+rup90UOfNxyNZT6VE0v9XH/ZOPc3IsCLq23YFf+d5W7PjxGZcvbv3fWa/nG6Yvbbd2WnLkxl
 VmAE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111005-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bmasney@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D25016389F7

The existing support for disabling unused clks runs in the late initcall
stage, and it has been known for a long time that this is broken since
it runs too early in the boot up process. It doesn't work for kernel
modules, and it also doesn't work if all of the consumers haven't fully
probed yet. Folks have long recommended to boot certain platforms with
clk_ignore_unused to work around issues with disabling unused clks.

This series:
- Adds a generic clk_sync_state() callback that's initially empty.
- Adds a generic qcom_cc_sync_state() for qcom SoCs that need to
  interact with the Interconnect framework.
- Converts the 7 qcom drivers from using icc_sync_state() to
  qcom_cc_sync_state().
- Implement the framework-level sync state via clk_sync_state().

This approach maintains bisectability.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      clk: introduce stub clk_sync_state()
      clk: qcom: common: introduce qcom_cc_sync_state()
      clk: qcom: convert from icc_sync_state() to qcom_cc_sync_state()
      clk: implement sync_state support

 drivers/clk/clk.c                | 75 +++++++++++++++++++++++++++++++++-------
 drivers/clk/qcom/apss-ipq5424.c  |  3 +-
 drivers/clk/qcom/clk-cbf-8996.c  |  5 ++-
 drivers/clk/qcom/common.c        |  9 +++++
 drivers/clk/qcom/common.h        |  1 +
 drivers/clk/qcom/gcc-ipq5332.c   |  3 +-
 drivers/clk/qcom/gcc-ipq5424.c   |  3 +-
 drivers/clk/qcom/gcc-ipq9574.c   |  3 +-
 drivers/clk/qcom/nsscc-ipq5424.c |  3 +-
 drivers/clk/qcom/nsscc-ipq9574.c |  3 +-
 include/linux/clk.h              | 14 ++++++++
 11 files changed, 95 insertions(+), 27 deletions(-)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-clk-sync-state-c0539c5530f4

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


