Return-Path: <linux-arm-msm+bounces-94340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ+xMBWToGllkwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 19:38:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F3C1ADC8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 19:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1685A3161035
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1478D426D07;
	Thu, 26 Feb 2026 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dQEQGnW2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XlSKv96b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF5C425CFB
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 18:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129885; cv=none; b=Ic9KFgvmxF5SqC9G1/QYA/8H+7yOF3yN7CmCHZ1PyazUhDQQBVCU78eP2hPFRaLATJCDGswN9UWUQUFgw67COz4yAvWPnkfpt67K37KwtfJjwG4MjaHPMVHySkFFEUKB7GYHjxsoeybm0zYC6A/VTzhuz0kRGpIn44Q1vptaAwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129885; c=relaxed/simple;
	bh=363u1/C5GJNNagKFfPNFsGzCCRZzZnwaJnG3/9KHzOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qI91zI56d6fT2BPEbfRcBtqT963ICRniA4uHemzGYfQgwv9Uy74Mh6vvz5Jn29yQ6eCCX4XJzSRa0KZ9FzqWvhHv6kCer1h0Y1OOspqGWMOE6RDMrLkUtvyZCjVyjqhqAeeK6nGgiSc7dtIvBURBNWkLuU2MVCw2yNTCzfseOz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dQEQGnW2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XlSKv96b; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrGP3ZwfQG02ZPKLOCP6keCAvG84uonAYWUbTlHA1+o=;
	b=dQEQGnW2M8AdJJPsvcTEh67OmBDHrj/a+n6aqqrDgj113D4XpJ4o9tUggStstfmtOVnUu4
	ogI0xCtAFuZx1Wjr/oJnbHEeWo8Ax1xQx1ZLvmHH5V5KgtVNR61Ao84WXRxI4OslCMJQ3W
	fVAr/vA35xvbK5myU82tAViJ1kdZ1ug=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-HH41Ztq-NC-6d6t-PRhTFw-1; Thu, 26 Feb 2026 13:18:01 -0500
X-MC-Unique: HH41Ztq-NC-6d6t-PRhTFw-1
X-Mimecast-MFC-AGG-ID: HH41Ztq-NC-6d6t-PRhTFw_1772129881
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cbb8040f48so990162485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129881; x=1772734681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrGP3ZwfQG02ZPKLOCP6keCAvG84uonAYWUbTlHA1+o=;
        b=XlSKv96bkt0NY5PXxvIL7acQTbusEt2L6ZuROuDRWgi8+E6sUzJqM2q0ZXtBlIMDus
         vBvbOiA0MgobcccKsZ3K0e2b0UF0XfBkYVun7EMFNbXeCk+ChGgIXLjsNtJ9SU2u/hR3
         1Wnukq+hm8bNpwoCso6VEwbc5LjFZbNxWC/W96QcmCqBfo9dbEh1g6JepZdChNObc+zf
         sh2LJAK1kW0feIJSWKW0jjYP+fqo52SdFMhMy6gO/nTuxkdSYH476iJiAcrvF4AlQKE/
         oV3Xp4BlLK5oqruVHsvgPJeadjcQd+YQZRzPo7DinJB4LCk07PxLzSYZxEvmfY/4yiJ7
         KFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129881; x=1772734681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TrGP3ZwfQG02ZPKLOCP6keCAvG84uonAYWUbTlHA1+o=;
        b=ooktOt5tpkEj9a5Su3Z3ssdLFsa6OEkl+svIimnGJrTwGdDDWgjzYn3X58zQ6mFDcP
         ppcgQCcWPk+JYrwSsiAnyVzv88e59SPbnoxOOBqwGG/dTjqeMSq8FhiojeSZPFxCmtRk
         5TRyoe6Ige78ZO7yETzK9ySxfosic6ik9TJTTA2jAk77D46japvdcmFsD9I7dODE9Xg8
         dhH6ovMXo0Xrg7x/7Yx6/t5t7RjK46vdAkUbDoyZIKPXceAGpQk/jpo3rQOqO2nK6CqL
         pjRBSoGyz1h22LjhG6V2PyXCQtoPbTFfQ2JpxHSyAwhX8Cy1lEqkwOpIohNB3kB0LJ3E
         kgYw==
X-Forwarded-Encrypted: i=1; AJvYcCUNwRkRG9XNzK8oSqIE7pExKu+WlseBRoMBGhrrcwAe4SozsCXkNWHdEp2SXvbfMZrWoW09XNR2A/M21KpG@vger.kernel.org
X-Gm-Message-State: AOJu0YwXIdldCHfjgvDq5B84DY3W2w0LkSshK5Xlbt+WnDZvAf3riJwH
	Z81U66GzmrkgA40O/TsXK/yYOXTBB7LGi3ag5PwtcprrLYZ/ITAChwhZvOq24rGPiHH3vqSSQQ7
	2q3uBEMRHf9uOfHb1khT0CmVFMO6w6XUOvveeiMxDt6IrvBkfdT05YwnrqSTTa0aBS/g=
X-Gm-Gg: ATEYQzyjCkXCsLUIZKrFvYp9cMWZE7h0YYfiuWj9FdmzNuny0wnJ5bxUqqa+4WIP/Ej
	JMVgKHQXG6NYSm9/guKqA3WSZzwX5ESG2S/mDg87uEOd0cSbPv589RE0f6pCM5igvjf0v8fm+hZ
	bWk25pB4YuDRt/NCQowyW6cnzaviRx5kbmD9xZ0Wo2yU1SazC9yepTJJlwzZcYZ84YRjaACU5ps
	vD1upQRkIqgRCsTG5LVjxn87wOeJAikGa89O81nxdtFSZJcLLNCpFJIpVrYSQb9KlAFuE2sQHc0
	5+WxzedFsYxAe4App8aR+3bKbC0A23LrZvQ0kjO4U19Y1BLGQzYxzVs5Uvcqnt5gUXx83JeizyA
	4jbm0Sedo9vvRwE2aqGsB8Sl64KK3lAkKbvXc732TSn46OlOzdiVPiLS7NTG4
X-Received: by 2002:a05:620a:708d:b0:8ca:3d7c:e74c with SMTP id af79cd13be357-8cbc11d2edcmr379560485a.69.1772129880845;
        Thu, 26 Feb 2026 10:18:00 -0800 (PST)
X-Received: by 2002:a05:620a:708d:b0:8ca:3d7c:e74c with SMTP id af79cd13be357-8cbc11d2edcmr379556385a.69.1772129880351;
        Thu, 26 Feb 2026 10:18:00 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:59 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:53 -0500
Subject: [PATCH 09/13] clk: qcom: rpmh: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-9-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=363u1/C5GJNNagKFfPNFsGzCCRZzZnwaJnG3/9KHzOg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9Bnd6C9YlLRWYWnhxIcxDyzvLsnW/ZSxteSIzmnpR
 GkG45UlHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwk6zIjQ4PTnXOLvH0SbtqI
 9VhvuLFAQ4PhVi+LkV1ZkKy7dNEKJYb/Mek2NmG3hW+o8v/ff1HWyaLGQcd7/bzZIn5Jxrmn/z3
 gBQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94340-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 42F3C1ADC8A
X-Rspamd-Action: no action

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/qcom/clk-rpmh.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee01cf28c11ee8c4bd2f36d7536e6d..18fc94e6b98713e6aaf20a6d6144234f435d07a4 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -129,6 +129,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 		.hw.init = &(struct clk_init_data){			\
 			.ops = &clk_rpmh_bcm_ops,			\
 			.name = #_name,					\
+			.flags = CLK_ROUNDING_FW_MANAGED,		\
 		},							\
 	}
 
@@ -321,12 +322,6 @@ static int clk_rpmh_bcm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static int clk_rpmh_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
 					unsigned long prate)
 {
@@ -339,7 +334,6 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 	.prepare	= clk_rpmh_bcm_prepare,
 	.unprepare	= clk_rpmh_bcm_unprepare,
 	.set_rate	= clk_rpmh_bcm_set_rate,
-	.determine_rate = clk_rpmh_determine_rate,
 	.recalc_rate	= clk_rpmh_bcm_recalc_rate,
 };
 

-- 
2.53.0


