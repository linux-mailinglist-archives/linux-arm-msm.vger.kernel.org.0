Return-Path: <linux-arm-msm+bounces-95479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFjpGWjPqGlIxgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:33:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB42209744
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A16C305A4B1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 00:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34121F12E0;
	Thu,  5 Mar 2026 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7mebY2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EBA1DC985
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 00:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670810; cv=none; b=h7x+2D7SAkOLCvXLknCIqs3YhcHPiE/CjlDkIdWGPF0aPtp5seoqclJQpeUx6cg9DUvh4a+AMjh80wc7abU4BKFnfBkfFskI5b2faa9CtjymuVnxq3J7jxDYkykliXcMEYg5f92iXChKT4mXboAtZc1ucnBm9r7ZryQbehRa4rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670810; c=relaxed/simple;
	bh=sNoUdxnKeLRM+2caoT7p7YZBgyoQATSkzyG0/fc18xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSVcXj66ZnluFC50saNxTnuqboWVsto2AK0Gttow92x+1iOE5FDXK35uUuWb2M2z2hUAMslcF/wyNiVlWxQzK8thlb3tK98dbY7LzkHDqVNXUyrj5TXcLFnFfp2mSW5JdpnZoyg1QGPWcXINOYJ8x9H0WZzqVY8vI5OfSq3/kso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7mebY2x; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d4b9c839b1so3920019a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 16:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772670809; x=1773275609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyyY/6iGZZjBC2RyXoGvRk3mOb2L5V65kz2wmEzA5hs=;
        b=A7mebY2xhqZFx1wR192sAQFmo0+zRAlPeJApUDFnyrk7IPe6gQ8amTgXVYhIBdQazi
         DzN8/Th0sjYYj4E3u91UJyN0C1BCE1Ou6M+5UWtsQ2MhSK2Upk0OGT9sNSOz1A9LylM6
         tTKt4nHQN8yhppIrh+smGSp0QtB5clO+y3+6X4LXZq0av9uT6xy8g59CTNpzbfdQfWR+
         f7vPDTKEwPpLZrFJ0sE80AQThuv28hGnwlpkoiiqz95X0/ieajgXVtY3ERRL/q/WBq9p
         Ezs0kXEJDQReyXZMPgc+ro7JAYXFDLa1UHGrQzdDcqYKPp11i7iajSx1S9ce/k99CRMw
         g7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772670809; x=1773275609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PyyY/6iGZZjBC2RyXoGvRk3mOb2L5V65kz2wmEzA5hs=;
        b=ZO5LgICw+2PBLUG2n2VRHBzjytB2yPQK6c/KEXsCMuH3PEJg5czrv0AKfvUh9fy1kE
         xztRoK6eh5L0dfYn+rCvNnh2y3e99qfvJnZ6MaiJ7D/RBPuIMZmgTXrt/HwlOWPWwi83
         RKcUNhmvEN5xK6r6QpkbKsUQV1R5IKZIqQU55tBX7vV5qQuDWJClP/lNQZRgK/uLTHx1
         ClDLe7ZCQ4X6smf8wy0VTtz+BQ0ws3TWK1MZiGoBOrZJlarl8ZJCDFeC9YIVIZWdWW0I
         qoS2OEWPUVqMPG2vNmvMQD829u/WXDx3dfVlziKiPM391Med3/IcZlxDq3BNpu/OULax
         Nilw==
X-Forwarded-Encrypted: i=1; AJvYcCUfrX4cs2yf/Ej53vs53T6SelcJeqC44XxQGJ+zXJ/fKBz3yxJ6VWajv51p6ASYOoTWteVDWvhQVfWNVCPf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/iKL6+I9aYerN7PfgXgqiBzQDT6nsPJLechcoUoslfqbnKHVn
	nGUZyz8no4H6WBo2Niqs3JfIeVWCQ2CcuQcMLS9RJ9bjMp8IXtVPStsk
X-Gm-Gg: ATEYQzyJJIEkcvkl9JEd5bjVd7dYXTZ+xemnRVzpKh5Cr7O2dRzbtiEd6qtnYAVhWRa
	WoBSiv82t0+69Vys41+SFKKTCDB9uT6lNAqBAheVXl+R0ChIjDg2VOnLfWuuugw/QZwHVIrhrER
	O34qLbbBIrz4HaFDkDu7ytKESlOCyGMW+HnjGzxq408mYbOW5mG9MzW85Yn5ObTZNB3Oyj0pqmQ
	86L6ZbQtQsxvlqGxwmrowttiAl1/jwX9wLc5kUqkeaLgYTnlY9dP1AWBqjTOqyFEAJrnBJgpOb1
	Lzg6iqh6+EpOqhVkg1bXMB8nkI43UXijMiLSPBg9kStiPEPJACOWebMr35haiPd0GY/OP+e/a4H
	98+9tKm2tAnfVbYZNKiIlW8JvcizszcIKKfRfOkIdFsgzbjm/DFznjGWWlxO5svcHS22qN28tuk
	jtaTrp7NrzZKxX0KO1NRy7TzlycWB675Xx9xd01WZN1hffiLy9GWoQQkth89QYcpIZuwSPMxnKJ
	OEimXuV4q9k+FPQw+waweQ6RsTG2S6addnLiSXh6A==
X-Received: by 2002:a05:6830:2112:b0:7c7:58e9:8e16 with SMTP id 46e09a7af769-7d6d1253d7dmr2441794a34.14.1772670808874;
        Wed, 04 Mar 2026 16:33:28 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:2aa4:4aff:fed7:9b19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58644dd17sm16633834a34.5.2026.03.04.16.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:33:28 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,wcnss-pil: add WCN3610 compatible
Date: Wed,  4 Mar 2026 18:32:51 -0600
Message-ID: <20260305003253.1022386-2-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305003253.1022386-1-kerigancreighton@gmail.com>
References: <20260305003253.1022386-1-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1CB42209744
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lists.infradead.org,kernel.org,linaro.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-95479-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kerigancreighton@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Document the qcom,wcn3610 compatible string for use with
the qcom_wcnss_iris remoteproc driver.

Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
---
Changes in v2:
 - Move the Documentation patch to the beginning of the patch set.
---
 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
index 117fb4d0c4..018cdf5177 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
@@ -109,6 +109,7 @@ properties:
     properties:
       compatible:
         enum:
+          - qcom,wcn3610
           - qcom,wcn3620
           - qcom,wcn3660
           - qcom,wcn3660b
-- 
2.53.0


