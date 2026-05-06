Return-Path: <linux-arm-msm+bounces-106039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGO9BgKR+mk4PwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 02:53:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7136F4D5164
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 02:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5278309565F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 00:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B496259C9C;
	Wed,  6 May 2026 00:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N6hPkMO/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZARwYA02"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A580526ED3C
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 00:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028651; cv=none; b=XMA2mzUCmJ/hg9tAimem19NGzECf5mDx9Lqj6srtMtW5+kow2Y42ujJmwP3f9c5EDf9NGhck3THRdjojFnGNrzJM9/RYj10JiuAeRVBJuNK/aKVXLq5WmaAQ1aFw5JYyGA16S0Ke9EyvcCz9+6U0o+mqeS3IixzC8D0KQAB0Kgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028651; c=relaxed/simple;
	bh=ZuwtT1UEtxCzGN9LoNJtI0urdfnTEDmvH2lW5lXk/Fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCIU4C2aV404T6tFStSiqjWhsHzhHbVye2D65bOWoEk9dW46l/FnVOw7oV2r+lHhX11xFC3TZxUAnyKVo7GHBV3LDgvlxb7AtR9Mq1kMfLQoDTFPqhWasGnXuHqB1iEIy3Z9aRmqj9A02DMqLx2ylc2uEIHdVeJ1FfRJdvtHGeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N6hPkMO/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZARwYA02; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wHIZA/2rEhLJ2L3md6M1z/O0eTBApe1DK1hZwoZhMRQ=;
	b=N6hPkMO/h1aNExuEQg5neOsZXERVkwfr12gFHsoyW0wFdwXnP3dSF3oZezQJuOdTyfbEOA
	dhixs6KsV9VvXwuM9TkytTr5giCynuM9xmWdIMM8baNRq9FvtN2JUBQvFzcH+5zeqRz2FV
	Q/GMcZHPD/++lS2AyrVD9/Z9trEW0Aw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-nbINf9HGP6OSsjjbv0eJKg-1; Tue, 05 May 2026 20:50:44 -0400
X-MC-Unique: nbINf9HGP6OSsjjbv0eJKg-1
X-Mimecast-MFC-AGG-ID: nbINf9HGP6OSsjjbv0eJKg_1778028644
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ee454b1b8cso674566785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 17:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028644; x=1778633444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHIZA/2rEhLJ2L3md6M1z/O0eTBApe1DK1hZwoZhMRQ=;
        b=ZARwYA02pA1VA+xwvvLKEgPsNwG6xQY0P0xG+VIhslqaR0A7drZ2HdieZlLK2+QW/v
         Ag6gkjEpD+TwoduPG9N1Se5xcrDol4w7R/HNsAlmVW8bSBfgyPAZ6ZWWUUwNY9DR2qO+
         xlHTb3lC3O0Wdshc+fJmzQ+YDC8Xvj6Sb8hbXYl78Cunl8fJaITpaK7mBwQvy9RHhL0p
         h4LHHBi9ycBra0huPaxeKOUzIp7guV6bdM6/kawJJgnim7pB6EEyQ5waiBbUy14haoA+
         Yirsf8MRCpkA4rhMEBOa4Dqosv+4xOh9qZbuHzjEVDZZnZcGsC1NeIp9HkwPfOxh93Wk
         rxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028644; x=1778633444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wHIZA/2rEhLJ2L3md6M1z/O0eTBApe1DK1hZwoZhMRQ=;
        b=Y4Lm7n0a8Wm+pK59HPONkI7P0b7vucDsj/DBltbPEmjPkjMNwv8irOWafoJxLSe4Ez
         P5EtzqLcUKsvT4W0QAQrsTgw2qQXZdtNNtbY85lL9HLV+m746eiSpbcx4PPZmwHINZcM
         R175rYr0B6pSuyMy2+hXnPrgHzYU7gdh2FIM+GKsdLuBjbsMJbjrvMKU6ud90QSJQWRu
         HjbVnm3l+M7SzkYLUID39duWS+0+KbOXOkzTNt8JkzksL09AyvOTYJStZb8V7BnGjTVM
         +UHZi/RRUrGGRiENNG6pSAh52PQJVgNRCMjPd5casiJ5dr32LXqyybAgfcO1RsL6VJE7
         n/pQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3iFOE0tw0TGpH6ydMz/RQWxPafFtodnMyRTkbGowTA3Qipqo5G5SvYWUFYUlRP2vJojVv0YXg5S3dzS7J@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb1S7YppYs7PrbZcu3lHkuSIcW7z0m5hAywJttthhfcTBHOOQa
	tCj/muovGXdECWC1CLF7pO2T1G6/PfFM5QpfXVVakb4HDDjIh9XTe5SSZEUl3S5SNuo0usxXpSU
	adhPZXHSA6tyhWbS/M0YgG76UMNJ7rExVm2P0cP6gMFQY7vfcZQKF1J1/Y/kqAsp/cJA=
X-Gm-Gg: AeBDiesVNqc7wx1ExBc1OchYga8Jn3Zkag2xM7HVTlaVEmVSNJU2NQ7hRvoJ11MmW5z
	f0z9rFgCqFX+8fit66FFkB7NhLRR91AjyMsXgwJbS1K+yKEdM16hE4kU88tSshSO49Eofgajlsi
	G1n8Ff+Dp2Q0AciJwz+DK23q8WD/9NMBPpTDY8JT//7CWuP+3VvC4arMjlXn5yVTFfEPJcLosvg
	AMtGFAZxYHTeZB4uGdOIZ98uF2ls5bWQ0mUkMlg+DLo1HofkbVgsIWZV6rxio4hmE1NDBMaVt7f
	LbVd0cS6DS8B7h1eedAiOQtzQ3DanZjqPvu2sGxU6JVcOIkig5OSFdp9Lz3pO1w3bLPMnHWbYpD
	TPMlg75Q9HaaQ8FSB3iGpngmh62gJT+VdNekReVguA7ly7VIKFKwf4HbI0ldtwGWz56Zpkir5
X-Received: by 2002:a05:620a:d89:b0:8cf:d3ca:535c with SMTP id af79cd13be357-904d3fa3d53mr249543885a.4.1778028643696;
        Tue, 05 May 2026 17:50:43 -0700 (PDT)
X-Received: by 2002:a05:620a:d89:b0:8cf:d3ca:535c with SMTP id af79cd13be357-904d3fa3d53mr249540385a.4.1778028643231;
        Tue, 05 May 2026 17:50:43 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:02 -0400
Subject: [PATCH v3 06/15] clk: qcom: rpmh: use clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-6-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ZuwtT1UEtxCzGN9LoNJtI0urdfnTEDmvH2lW5lXk/Fs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfDcYMYy+WLK93ovp6M6Hom7uHiFXmnF8L9Q143bV
 6iwLOpFRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOpNWZkeG23tKv1QIdP3vcT
 IpP0rRRLv9odPLKJWVPNROCOhuq1Cwz/VN0n/d97I/j+CW3/z4ebSytqVFW/OAZmBzJpZsxfIKT
 OAAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Queue-Id: 7136F4D5164
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-106039-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
 drivers/clk/qcom/clk-rpmh.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 339a6bbcdc4c..d19346509cb7 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -321,12 +321,6 @@ static int clk_rpmh_bcm_set_rate(struct clk_hw *hw, unsigned long rate,
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
@@ -339,7 +333,7 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 	.prepare	= clk_rpmh_bcm_prepare,
 	.unprepare	= clk_rpmh_bcm_unprepare,
 	.set_rate	= clk_rpmh_bcm_set_rate,
-	.determine_rate = clk_rpmh_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.recalc_rate	= clk_rpmh_bcm_recalc_rate,
 };
 

-- 
2.54.0


