Return-Path: <linux-arm-msm+bounces-106038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCsDAdeQ+mk4PwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 02:52:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 610144D5137
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 02:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2969E307CEC2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 00:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83D3262FF8;
	Wed,  6 May 2026 00:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="flplZaOe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BuYAquAL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DCC23C503
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 00:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028645; cv=none; b=Ci1KmJRqI3LcyJYHyd5dzjq62PfV03iK/yx2/OPPqkxfadpR32KPEZICrhmq/HRMGFf2T9WRPB6YrXuySAqzr8bo++hrNHAOtzkXb/INPvvOp+tVP151+ZCyGIpeugs0EZT/oLokJdAq0U3v2kXpofCFeARRrjFkuEjIVECqdO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028645; c=relaxed/simple;
	bh=PD3f6GsDvZWDfVLwGVYg0tTAVyKMk7bCEAdc762fhFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YplHMZCKrs80yKqI/tueHobQlD/1BALCG2dGYhEckL59XIY6CgmpWMP9mLllRIH7xqy4ZtCx4dbIoGInpEZ8WVSxVGtrszIT27wHEgsthCuhWvQVdViwLJRAgtI6BRVSa4BqgT83tPS3DPmfKdTpllhm9DPsIKwzoFbZVqXMswA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=flplZaOe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BuYAquAL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHzfnN2CwgbOFP/2lca/gpcRHdEHuCwhiDF4slnOm1Y=;
	b=flplZaOeG/6OULyklUeaxQqen4QyqUvgySIJOVUHrkDlHGiJ8WhS0HXpFPKBiwdGWwMqPn
	qUFoB4H+IhCpvMOqU0yDARgXd4OAgx26J5EzjVydZUKZnSKBmNdeLeUYQwgKOZcqlKQ1SN
	1NyyRanIturZ1JACLanjF5kpg/J2xv0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-lo0FhtrPMOWoqr1bqterNQ-1; Tue, 05 May 2026 20:50:42 -0400
X-MC-Unique: lo0FhtrPMOWoqr1bqterNQ-1
X-Mimecast-MFC-AGG-ID: lo0FhtrPMOWoqr1bqterNQ_1778028641
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eb55e55394so1264183185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 17:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028641; x=1778633441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHzfnN2CwgbOFP/2lca/gpcRHdEHuCwhiDF4slnOm1Y=;
        b=BuYAquALPPxS7YXgVcGGsQeyAMkvDHi1czIZLr3yUvRpMASan2krr5LQFjNtbvNJJi
         J7V7wEFyiYqPq7yuQ6m6h19EIG2JrtPsCx/beRbU78S+NWnVNDYSB77fWSmS6cIzPzLX
         k24xDos+eghDsyWn4FuwY0MgCReZxZEwfMjugger3WJt9m4ghszsint8xtay2C9ip7YN
         0su+PcV0JCL4WcTIhxPN0BmxJyP4SHgGYrIsEcaVeRS2gyr/sAHclckDid0c0fAaVclX
         s5sXcjzjCc9FWcOEuLPTECzC3g0Qc43YRKr3Vg1NVnFWSIeFHFB4IdUsJo5jE8Jwdis9
         NOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028641; x=1778633441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iHzfnN2CwgbOFP/2lca/gpcRHdEHuCwhiDF4slnOm1Y=;
        b=mI7cGfMmKLZxL8LY4Sm9oe/Ix/u6snr8aRNGhv9jsT8cFBLruWDEaAzXiD9Vmrn6c8
         3Y7QvoFY9Zgiid2u83xLQXZD6LIg9uE1tL/SRN884b8LL7hDYwOSFv0VP0NKXDb2rLaU
         TX1lftY2rSr2kOdoR9Hz67XCvL98IBrea/gRNShelNZLavw9jyO1R1oIh9OdM/0Fu60J
         jvMy2txbslS+AJMpH3fIAoiKUl40Uf2nRZU30mFde/E0k7JVUV6yw6kN5ihgTm3mgga9
         6qL1LKU+BgjS9Pn1X4+dDvTKWp2Cs9WiboJv8Li+Rdqo1Oa2Ex/thuOA3uYA18H9agSN
         JVVg==
X-Forwarded-Encrypted: i=1; AFNElJ+0JOg3Iex2xSrMvYx6t7usEa/emNmp7pFQFX9uyEaP4Wi913wLI/b6ANN8VVt/JlcGCMgXNXjVFx/E/YvU@vger.kernel.org
X-Gm-Message-State: AOJu0YzZx+ADSSGZgSBKcHXoqpdY0ueAQ1T7aqtqhQ8Q4YtUaUoNuD+M
	R3SGc3e5UmuDKRjtFgJyJTvCyQYAxyqHs2+A5czPBQruOU0Jxt2JK6AIhznb/sIEybIuaMEOD7j
	iM0Jy7Gc1jwnfckAwHsNOxZITfa2Vf1Q/KgzCiz9axmBYB8YEGqjH10JqPEs7oE7pI94=
X-Gm-Gg: AeBDieub7PeTY/ADFE8YKSZyvBv46gGxnirT/2x9F/QwyO/VczwOn8b3T9TKOkpAyK4
	L74Kgzfyg6WsklwKp39s3PK9zmyqWQgMuULA6vtp49XsTkcZ9pWvLg6y2QVT5qwvS77+/aj9b71
	BeynSjDYaXaFMX81BNmU8PcQDLrLVzF6cngO3c9DTc0p6YE/s73+tXjR1iCbkzwmYx6IoEVbJU9
	g4U/1/4f36qjY8GnJm0drZYNdwVzkUi+H58m+34X+rv63MTTyg6lJMkNkcitoO5yHYt/f+0Rprd
	4EuJfgQ/6A5MvN+idn87wR6yiKe8fWPnQLt2WpHEacRl9Ao43Kd3wpGRCUvVaPh/Q2dS2hZeIow
	D2p0Czf3hrWiwqncJlOGuSfPM7bYMcQxNdeTpszRSEAgWnT5HNeGHtMR2SvPdl2bAem82veQR
X-Received: by 2002:a05:620a:29cf:b0:8ee:1371:4f7c with SMTP id af79cd13be357-904d4d52ea5mr212186085a.24.1778028641425;
        Tue, 05 May 2026 17:50:41 -0700 (PDT)
X-Received: by 2002:a05:620a:29cf:b0:8ee:1371:4f7c with SMTP id af79cd13be357-904d4d52ea5mr212184285a.24.1778028640931;
        Tue, 05 May 2026 17:50:40 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:01 -0400
Subject: [PATCH v3 05/15] clk: qcom: rpm: use clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-5-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=PD3f6GsDvZWDfVLwGVYg0tTAVyKMk7bCEAdc762fhFM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfDQPTw3I6zOhv+1wiqzR/9M1d60qj/+sDeV/6aV2
 MyoWxa7OkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI33MMf2XYlH1fL9Ocxh/Y
 yano4WMg1S1+WPnJ7FMWNzzFNpw4tJLhn/VFS0mdSq4g28Ipihp9M46ckeesOrmw03FWmn5uwCl
 PNgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Queue-Id: 610144D5137
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-106038-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:email]

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/qcom/clk-rpm.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index be0145631197..74f569b58017 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -351,17 +351,6 @@ static int clk_rpm_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static int clk_rpm_determine_rate(struct clk_hw *hw,
-				  struct clk_rate_request *req)
-{
-	/*
-	 * RPM handles rate rounding and we don't have a way to
-	 * know what the rate will be, so just return whatever
-	 * rate is requested.
-	 */
-	return 0;
-}
-
 static unsigned long clk_rpm_recalc_rate(struct clk_hw *hw,
 					 unsigned long parent_rate)
 {
@@ -383,7 +372,7 @@ static const struct clk_ops clk_rpm_xo_ops = {
 static const struct clk_ops clk_rpm_fixed_ops = {
 	.prepare	= clk_rpm_fixed_prepare,
 	.unprepare	= clk_rpm_fixed_unprepare,
-	.determine_rate = clk_rpm_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 
@@ -391,7 +380,7 @@ static const struct clk_ops clk_rpm_ops = {
 	.prepare	= clk_rpm_prepare,
 	.unprepare	= clk_rpm_unprepare,
 	.set_rate	= clk_rpm_set_rate,
-	.determine_rate = clk_rpm_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 

-- 
2.54.0


