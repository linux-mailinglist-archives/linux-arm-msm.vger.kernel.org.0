Return-Path: <linux-arm-msm+bounces-113480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IUvWCz68MWp4pgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:12:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1FD6955EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:12:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=QxWJ0UwE;
	dkim=pass header.d=redhat.com header.s=google header.b=hrjVw4mL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113480-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113480-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10D86321B90C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4003A785D;
	Tue, 16 Jun 2026 21:10:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5236F3A7F62
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:10:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644241; cv=none; b=g7G3UtoVsWoTstHpx2Dw/KltI5vPeRHy0anw6+DbVW2Z0I0Tp+1hHyHnh8i8ou15zURzg4rgVIghEfu27IvMuUsWYAYM4OlGIV16cVl4EI9LgmNNGY5fSZjf6GTxmJeCBTkZLhSkpaQSf1qZ0oPqtWirVA8s86M+qy959dGTRNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644241; c=relaxed/simple;
	bh=vS5ftJZDKf6E1PZnZjiyEQIZ58HjzX2wleY4q85f/58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lv8TdrYGSj7afTwfnEUFPBUfmz9qEHvAasfYXA9f2rtBxOh89bqRAumvr1lJuAcYy7ef/TEpEqqR+rOtl522o3EZE+S08U5vVpJPSGU+MstAx8j/ri1VU+fmKHDoo68lPkPVMlslJpmILrTfHebGlbdbbRULrCXpLz8kRnb92ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QxWJ0UwE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hrjVw4mL; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLe0UWTylRBmrJ/zLt1bU6XgdiHEOMnFeXVlgbQ83d8=;
	b=QxWJ0UwEeIUpnYg3HM2kNF7f1xGQMAEmTLFd8nFLGTfYa1N8e4bb+CggNMfzYPODVEnkgV
	YXK2yZeGg2IA+Mt2Ic8mzhmb7qUINOzqMWBzEBQZD9s6G8zOIITsvTWpjl1XMCQpnANPI3
	2talvdrHRfqFi6bHhOu/clYezzO7gxw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-AbFozHQjO_ab7GUeAj0C-A-1; Tue, 16 Jun 2026 17:10:31 -0400
X-MC-Unique: AbFozHQjO_ab7GUeAj0C-A-1
X-Mimecast-MFC-AGG-ID: AbFozHQjO_ab7GUeAj0C-A_1781644230
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517787172b0so59307151cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644230; x=1782249030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLe0UWTylRBmrJ/zLt1bU6XgdiHEOMnFeXVlgbQ83d8=;
        b=hrjVw4mLwc80NhdXCPnBfXlzbRhYGmNQ+Z/x5XoRPVEKU9CdefWGJDyA5gFNnF0K7N
         N4cLmmrBamqoMzGkAddg/TSKkRBxLr4d3uercREp0uvrn0UYVb4cWfirbOSaOv4gEskh
         FIDMfyXb2lWYuiTPi9hHOshJNGnqYQVyoGWhn2QvK0fY7nNtNo0ElwJhA0UPRLL4Tbf1
         OCIIkuMAXEJV4yJyyR0MmI+BDvsv57hA3shy/AT3VefIK7u5ioYZo8npqnfa1OVg+4IR
         I/jKEYevt/lDu/2pNcbcApE96frmo3tcCPCbE52F2OkedZ8mYbpa1XCazaZzJvMsIA4A
         WQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644230; x=1782249030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pLe0UWTylRBmrJ/zLt1bU6XgdiHEOMnFeXVlgbQ83d8=;
        b=mkhAFik5Ha+8VFSyJu/JVX/xesYlhkz9Umlr2eda/ZwviauiMG+7qjslWJrzfe/59g
         coyz71QTnewiUCeRK9XhdjuP/v4DTQyEZIqRbl+fSEql8dIy89zNxdEpR8pxQ0f6arOK
         +AoR9yp1jKLBzZPR+WB2kMVY7yDcoFVrOKmI55PjMnCTfEUPeP1y2QM0BwOVucKB+AWX
         reeB5BEg4uLkephx2U0CX5GbFFopmhhV4mLr7dpPPkoDGDo9yiywdZxWxnlY/ZGkbS5S
         pjFo6wOay7zoTlSD+9wLPRVl0LLjVIKg0vvNiWglzVkM5snkQ9ZG1+iSA9ifaOzpOMxT
         2Bew==
X-Forwarded-Encrypted: i=1; AFNElJ/EZJFuMkD+H/5UkZVjNKCkDN9v8V6EAvOGI+YORBbkBzGE6B/mrKe43nTRInsARfHpdzjlh52nrTpIim+O@vger.kernel.org
X-Gm-Message-State: AOJu0YxUYIIgCtlBJpVArql18NBS6brbrnRiZff/zqUxxceV7VT/Fr4C
	TZ0MCk1WM90NlFj0m7NXxYy+wrYLINENB9ujYFNP6R073hjtebPPzuOLGU73u7hX6C4Ue5Zni5M
	IYqIJxFmykeoAB8HqDcfa0/mscwbsnga8ifjyHvGXjcTglX6PzQSaa5SZiI4KmzGS0+E=
X-Gm-Gg: Acq92OHnjjX7Zm2yne+ZhcKoDtxGC8peRZxmI5zus3RbtBGuKCCgFVtXhS5AVXLyLRM
	8yulddsx9zoB5WDerYsRWWG6I/Me4G6Xcz/EnTbe7IspVWd9qt9qfk12YDZz7nhPhw3XJ67TBax
	BociOpNntCAllM4NMfmOALRg/s/5PIQZoN3wSsrjF+LWYULgIO4sOn9UrkcTBd9oF5C1/v1l1eQ
	ZIpAO9tkvBOYyw86+xmJ+d7f+Ykq9L6nZ0BE1zrx/X5sDW88dDk6UXzEYce3rTrPFz4659HUdBS
	QPyUc6qvGM5n15Z2PuiUcjcmaA/hz0tdZwUaHfkpb+W5sq0nfyCd9fbQAcT2Bpesf5kiR0YKX05
	Hy1yhiYHgT48s74wrYxF9vIcalTpbSHCoMqN8v+6FOsfVwG46/6WeovHiYxOCSg==
X-Received: by 2002:a05:622a:828d:b0:519:8a4c:d32 with SMTP id d75a77b69052e-519a8e5dbc6mr16378221cf.30.1781644230499;
        Tue, 16 Jun 2026 14:10:30 -0700 (PDT)
X-Received: by 2002:a05:622a:828d:b0:519:8a4c:d32 with SMTP id d75a77b69052e-519a8e5dbc6mr16377891cf.30.1781644230110;
        Tue, 16 Jun 2026 14:10:30 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f122b21bsm43742846d6.4.2026.06.16.14.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:10:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 16 Jun 2026 17:09:46 -0400
Subject: [PATCH v2 4/5] clk: qcom: cbf-8996: add clk_sync_state() call
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-clk-sync-state-v2-4-15f82c64d95c@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
In-Reply-To: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=vS5ftJZDKf6E1PZnZjiyEQIZ58HjzX2wleY4q85f/58=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIMd+9OtU4P+222rLs1LSVaSoQt6Ybvo/15xfsT7SKUq
 ++WWM7uKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCIx/Qw/GXcpXGf+n5Yi+fVL
 vsfsqi2M0b0vLJvkn9yQLrq08IJYFSPDdB09oe9L1+39YH/6B/OLd5c+7ZBffi2yv8RwX55XwJV
 5bAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113480-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bmasney@redhat.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E1FD6955EB

This driver doesn't use qcom_cc_probe() in qcom/common.c, so it
shouldn't use the newly introduced qcom_cc_sync_state(). Let's go ahead
and add a driver-specific sync state call.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-cbf-8996.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
index 0b40ed601f9a..020d511072e2 100644
--- a/drivers/clk/qcom/clk-cbf-8996.c
+++ b/drivers/clk/qcom/clk-cbf-8996.c
@@ -249,7 +249,11 @@ static void qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
 
 	icc_clk_unregister(provider);
 }
-#define qcom_msm8996_cbf_icc_sync_state icc_sync_state
+static void qcom_msm8996_cbf_icc_sync_state(struct device *dev)
+{
+	icc_sync_state(dev);
+	clk_sync_state(dev);
+}
 #else
 static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev,  struct clk_hw *cbf_hw)
 {
@@ -258,7 +262,7 @@ static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev,  struct c
 	return 0;
 }
 #define qcom_msm8996_cbf_icc_remove(pdev) { }
-#define qcom_msm8996_cbf_icc_sync_state NULL
+#define qcom_msm8996_cbf_icc_sync_state clk_sync_state
 #endif
 
 static int qcom_msm8996_cbf_probe(struct platform_device *pdev)

-- 
2.54.0


