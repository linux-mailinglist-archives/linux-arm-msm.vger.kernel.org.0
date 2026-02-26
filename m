Return-Path: <linux-arm-msm+bounces-94341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PKgBWmRoGllkwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 19:31:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B65821ADACF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 19:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D737130A1D7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD33426EC4;
	Thu, 26 Feb 2026 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TdW1JXMo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rCbgaQbD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA22426D22
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129889; cv=none; b=WKsKnxHOCGDt1FMtTggxbku16zjX5rBSuSij7Zu5h+2lA0louZnX/Hxcn63lYk21SxmHLZzhJYVMEwIrDXdBPEBkQL79uw/Ikr2Kwypx/jmb60emP5c+AVTGmcw1qZ9sthgS59KYQQlb1PxBjcHMn0w81oqFodA+kTKYbcl3Lrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129889; c=relaxed/simple;
	bh=+NML6hp6/SZdlNV0n5JD+pA8hAvR/oSkGS4hBF1OYmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rje9iSIybn4oOOr1aj6PrQeZ+QoTMSwNkMaBVrba4RIdNxlSJZSwthkGYxkbszlzra32Z1XhT0gtXmJ+WcydBqb/5amqdojof1RGfBSR3CQ0yzAjKQP++86Jj9xhHeWFyzd1IMjSDWwWFgnck5ewcFPU5B4wmImHAS+2BlENEt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TdW1JXMo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rCbgaQbD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jBi9B2WSL8r/6ledYBjWi1ZZVo712Gw19OuWCebmMy4=;
	b=TdW1JXMoHdkvJa1DSrEJbqgkCvZmGvmC8bCoRamlnx0XVdOIW6Z8zGR5YHEZ7l7T8fzXmQ
	QxHh0UgOOB+AHsGJH7WMD4w0YzAzwy75J6ONpGF3vr/XAPxRIU7O3E02rpdqNNArjmiTeZ
	x2puauv06yjaQ8qOnO/UVryqEEg9TTU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-7Io1WrO7OMWGLolqaysTOQ-1; Thu, 26 Feb 2026 13:18:03 -0500
X-MC-Unique: 7Io1WrO7OMWGLolqaysTOQ-1
X-Mimecast-MFC-AGG-ID: 7Io1WrO7OMWGLolqaysTOQ_1772129883
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a129cd2so1344897785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129883; x=1772734683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBi9B2WSL8r/6ledYBjWi1ZZVo712Gw19OuWCebmMy4=;
        b=rCbgaQbDr11InPKRFEJ6zMDvs0jgGoGLDPy6EhuZW752d1+BdYJkeravBjVtv8gX6p
         4N3doaCk525SdKaHjHifQ/QzZk/bBfH7SBC1a44FvhoUTRQfqgfqCpdTv0MG3TGYXt78
         FevVuQjTQ3fOPd79VhQ4YzFj7PyqibiWpmb2IK8/ohjA9s+RTpTwnFnAhM43MzKv6fNJ
         eo20H7Xn8Y+HQMHigr9lLhOY2e1JoZMqxU/b67xSM8CE95WrHH4hlj+5f4wfWB/HwVVl
         qpnFA59LLyYtAp5+kWhVwLVvROjsCPSorDssqwWrSp50oh3RkzSOIYaDmwbIeGuJty1f
         A/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129883; x=1772734683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jBi9B2WSL8r/6ledYBjWi1ZZVo712Gw19OuWCebmMy4=;
        b=Vy95x1R4FdAl7MAWOLE95Y62+w8duIjHEpPKk4k7wp/jNf10HRpvF6JEeX+hCS54n+
         8NGWcWW519mvOHIFEaWeFqq52YwT7G4H7v3UU4SL5AfuOIUffn0KL5Fdsw+S+z5gWaM7
         RSHXKU5lkq8Q3jCUdCvWq9KXbKslLYfADgxaKnValDiq9/RV67xEIwRM8lSJN2aQaMlK
         Qcv+YslDutwDnYlnK+yXCLlkcQ9pQAx5oqMFIMHeetwNixaKnFNrw0DydBtxxqJzy5RP
         snuZ3xXqAafuzMDu0uguQErZvHm5I2gXwMrnBnjeFa0SZ+WFz/6nA7/SqZB7tHGkMofp
         RJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4FwkMJ7EqmVlHCoLmA4KhozM6rOoek7B/+ufqUTNinglWps4AHPWGNFE+ewinYFTe0HPj9lsyd8+BPLtQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyA1/bW3anjwrKwYssCdp/wml472L41+7tCGpet9JxverwT5miK
	F6e7zvbRI46B8gq4AsPpaojkHeZ6a7Y/IRXazsBxyIZqTC55MV8uZj+V7tgHzU4yd3BsrEgbByB
	G2ajkfj8QQ3OtxFLuVK0FNED816zsC9snUippcjLViUyjp2DmXFG6QQ6vIK5QEQokmco=
X-Gm-Gg: ATEYQzzXaP6YtvxAJc7uoRMp0EQtdHyE98NAWEchX0/iuzZ3p/vv8gkEhugze+pmCZ1
	zW+oke6CCxQeW55orCbWsq0+w4pG/aD5aL5gZ6ORokK00hWbxvlyuxSmC3Ud33tQr2BYMl3xLsG
	agrJGIbbj7vjFCZ1KkAEQWYtf30BJ/QUr7CP3m/cl4tBlTC6BObeoo8gDJkK30vwSKazVXeXmlv
	R7b3sXSIfA7tEQW/GHdSBWn4v+t+3pWW4GGPUkaXZMb/HubfY1PUBXXYYDB569HJQAR/uAR3elk
	xuaOdEzJOEJsk7f5lee3PamJ/MigW6OAKoJ/4YQM1FhFzZxIlLAv/kaF3bXLeBYEsW4L3kzu+aj
	CyoX6e/OgduEMWlz4Hpd7cPlVhZWVYP3Cqooxfr/pFBrUFKZC33PWuVQlhzp/
X-Received: by 2002:a05:620a:25d0:b0:8c9:e989:9da0 with SMTP id af79cd13be357-8cbbf35e123mr433968885a.7.1772129882651;
        Thu, 26 Feb 2026 10:18:02 -0800 (PST)
X-Received: by 2002:a05:620a:25d0:b0:8c9:e989:9da0 with SMTP id af79cd13be357-8cbbf35e123mr433964085a.7.1772129882105;
        Thu, 26 Feb 2026 10:18:02 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:18:01 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:54 -0500
Subject: [PATCH 10/13] clk: qcom: smd-rpm: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-10-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2081; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+NML6hp6/SZdlNV0n5JD+pA8hAvR/oSkGS4hBF1OYmg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9BmXHeJwYbbXuPfisWOlz2zpbtlPD9hb7e5Vfvr80
 Gzyx5kvO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhIXhQjw1K7Yosim/qq+b3R
 HplT/rYdnlciwXDhXP/JIsml0/8YJTD8M9GyzHxyqtbMILM3yjM6V+/Ee52+F6J8WwJvGLcfPsT
 DCgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94341-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B65821ADACF
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
 drivers/clk/qcom/clk-smd-rpm.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b950bd33fba668a292be46af6326e..96af781195a23d8b56e2b977811a3304a452e1cb 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -35,6 +35,7 @@
 					.name = "xo_board",		      \
 			},						      \
 			.num_parents = 1,				      \
+			.flags = CLK_ROUNDING_FW_MANAGED,		      \
 		},							      \
 	};								      \
 	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active = {	      \
@@ -52,7 +53,7 @@
 					.name = "xo_board",		      \
 			},						      \
 			.num_parents = 1,				      \
-			.flags = (ao_flags),				      \
+			.flags = (CLK_ROUNDING_FW_MANAGED | (ao_flags)),      \
 		},							      \
 	}
 
@@ -370,17 +371,6 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
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
@@ -427,7 +417,6 @@ static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
 	.set_rate	= clk_smd_rpm_set_rate,
-	.determine_rate = clk_smd_rpm_determine_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 

-- 
2.53.0


