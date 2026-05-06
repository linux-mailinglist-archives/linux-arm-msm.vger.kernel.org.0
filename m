Return-Path: <linux-arm-msm+bounces-106040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHxGMQKR+mk4PwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 02:53:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D84D516B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 02:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E154B3096221
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 00:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C379267B89;
	Wed,  6 May 2026 00:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hPn0Ivdd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PBl1zMyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F94C253B73
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 00:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028651; cv=none; b=NP14Z0J4y1m3o7/JyVXy/tg9LdJDTuNY+KoRp+7vozPxzGwsaQWTM79YK81IlKBzaLZSWzB4uTUoncE4+CUb92XrM7A79W5SE2hwQTw3AhR+F2qnHc5XHjZRWAYEltVi1d98cQyyjfjtX3ljPsUgIzoeeIPn0FVlE10KhGUH5rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028651; c=relaxed/simple;
	bh=2EubRrqz1CKes9tst1i0puGvx//nmPwjXrkFr3IeEQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NSQp2MeIV4fAv7ioo1Nq9vZsqwOfoXW5lI1fgDoIRNOLu5TDDbNfZIw5HPIJHMNrUbFEpa/nmIwwUbgfgMF+dcUvQnmdvDnSCxJNYIJainE/7zwfuF7KVAbEtkhxbS0zidboS+MrlPtfMqOyS6OabHD6436Z7dlpvBEqIgI1X8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hPn0Ivdd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PBl1zMyZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nW3YRTxYaf40CWp5RWfv7O0bvYI8K52/dUN9PIKVl70=;
	b=hPn0Ivdd2EZO/TZ8VHrz65YVIs9qP1ZuEWZ/1hix95Thf+fUTjbJJyXG6Xh+FN1myoEpmJ
	blzzYQjJKz2EtgFmQrJGvSdMAUG+PITWs8eI18Otiw6KCfcQE+mhvNMec2VXmKV01akItp
	wXmFcaQtsZdIfmFFSJfG4JJUmXWKysM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-g0m4KniDPtSPFe75MgzgSg-1; Tue, 05 May 2026 20:50:46 -0400
X-MC-Unique: g0m4KniDPtSPFe75MgzgSg-1
X-Mimecast-MFC-AGG-ID: g0m4KniDPtSPFe75MgzgSg_1778028646
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b5f089a5c3so129845286d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 17:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028646; x=1778633446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nW3YRTxYaf40CWp5RWfv7O0bvYI8K52/dUN9PIKVl70=;
        b=PBl1zMyZd9SnTUr8R1FK5JGAyKjspxDL9pS5IMLuTGZQjorMLDhKoWFdGpkNjSVMVb
         mSEAZSK3DigzTZesyvjS0XxWnAdROyZ4ldr/dE/C6ve5kCT3+pZzD7tr6hKR6LKgTRDG
         5eoAmxL8RdMgr7EI06ojLg3923/wiaHb5bukZl5TwS1CsJOwL6Ypwh31ShMm+JDT1atL
         G2EUDV7C2dVVHo3pbgMSVkGTGS8ldCjqsShP56KSs7rViOUwM/njg1agk+VFG8R4oxEs
         fTvWY8UOyi4SZTSDa056PCvw7GE0YMAVYcxo0YWafC6CyoVpCqdbtx5LBVAtVXDKApZq
         He9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028646; x=1778633446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nW3YRTxYaf40CWp5RWfv7O0bvYI8K52/dUN9PIKVl70=;
        b=BaomQXskX5PaJTCI7tAfNDwDBQpTqJkN6dr3YHbl1M/4TnkTRIlpnwieTuGAu+77j0
         5ewQNeazifpbsiw7OV/XPhnYsIHet/pRnSd8A18rpYDxvfbRT0AN2RebrAXLhlTOHIJl
         B1m8+Qd72TN+YwB8EURFesvpNk12al5mLPD4yrOwzdM5kd3pxjVIK20chY8e7mLB5oSj
         /AnA2wyx6lijKP8FG8H3Om/NI89QFmy6Y0Sq6rba1Bg2QjgF4KTBTNFMOfSVell6OA1B
         RYM3D9nxBR0+2Eb0WS/Qy2/DUO2c51CrKLQNeWArOxwKExGIa7OXW3QU4gcacue5eOO/
         BxfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bB5usFxGBKWE1bKU5zLsBvbAyuCae0NqBSCc9v/yafNVIeUDW7SciFHRWWNVqEu15DSHNH2Ikh/HKomGY@vger.kernel.org
X-Gm-Message-State: AOJu0YxQbQcLnyKunjGUBJVVPcj4VK5tuwRvK4ebz7G66OmY3faxEV4x
	kjoTgimk5sNUpzpCtko6DU1BpZARmqdRxitiV1mnrUeWI8w6WAigTWgam8CgtdTuWX+pGTz+QtA
	RFUCYssONERLYIZlTVATzLjlYhalXvvOKvwqV8eYACa0fHfvbg5zcsLdRglwDFs9Und0=
X-Gm-Gg: AeBDievVypRJGcf8bs94k7GwoIFLsw5ytGp9ckL8iQsZ6mwVT7S4rN6bKUM4H9PqNLw
	Vwt8SucIBdoSRLsdCMDLPDGApnQebMuErKtZ8gnxjr1yJqS1Y9xuFtdPRL02iGsZkCC+mTaUlSY
	0XWkxV3Po0deSWmFXLUh8EtmzDROGi8CyOGK5JsfLvslzWbqpXvaQvIf4VQ8OA5F252IYizFEJB
	gwWs47IYiZhMm/bO8YhFjRZWltT8YIUc3+t45KMxw0P3J9+LOV1dg3vJSt8CG7sK3sw6mVt0Zu3
	sJLlNOKFdN4fkV+ajkjczA396jaO8mhy/pLkhGDIoJJG8ylJI6x5g362ubDn7vSy3NWd5Ozi/6D
	IN3OSEvdn3TiR0o4Tq70pu2VvRhv+YGR/S08f62KinTnyC8d4DlresANBzKvtI0mX9CNMSX3R
X-Received: by 2002:a05:620a:4714:b0:8e3:5bd3:c8ac with SMTP id af79cd13be357-904d5ffdf15mr223472785a.34.1778028645740;
        Tue, 05 May 2026 17:50:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4714:b0:8e3:5bd3:c8ac with SMTP id af79cd13be357-904d5ffdf15mr223470285a.34.1778028645339;
        Tue, 05 May 2026 17:50:45 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:03 -0400
Subject: [PATCH v3 07/15] clk: qcom: smd-rpm: use clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-7-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=2EubRrqz1CKes9tst1i0puGvx//nmPwjXrkFr3IeEQw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfAqFKo5vvPDtI1/chxT42/qMM+MlvzSuK90YYu24
 z8pSWGTjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaipMHwP4XjZpXapzN3jWZ5
 avR+idea8G2RRHy09MPS62+nFd19ep6R4b/651Uz+yvvldc0v+4yfqdx++icBgke2fCNm/0fi7K
 u4AcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Queue-Id: 5C7D84D516B
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
	TAGGED_FROM(0.00)[bounces-106040-lists,linux-arm-msm=lfdr.de];
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
 drivers/clk/qcom/clk-smd-rpm.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b..f28cf9646cb9 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -370,17 +370,6 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static int clk_smd_rpm_determine_rate(struct clk_hw *hw,
-				      struct clk_rate_request *req)
-{
-	/*
-	 * RPM handles rate rounding and we don't have a way to
-	 * know what the rate will be, so just return whatever
-	 * rate is requested.
-	 */
-	return 0;
-}
-
 static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
@@ -427,7 +416,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
 	.set_rate	= clk_smd_rpm_set_rate,
-	.determine_rate = clk_smd_rpm_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 

-- 
2.54.0


