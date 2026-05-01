Return-Path: <linux-arm-msm+bounces-105456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNz6MaRw9GmKBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:21:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 263E94AB467
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4026B302593F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 09:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9C6381AF7;
	Fri,  1 May 2026 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RHYd+TXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB773806D0
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 09:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627119; cv=none; b=Gijk6tRnb5MpQ2RliVHBrPBO7pgV7I7tgvIr2ddOqi2eBswSXvmV+PvkwpTyUnOvneb+ecSuiPuhqpSw0DSoNOBVTRWgfEhgFr3b5frIqBEqURMY3YMnAN6XllcC6rtkfbhCwEGlbn+vlO8tAqjiJ63cln+30o208Lw5ccPlJRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627119; c=relaxed/simple;
	bh=h6Sc8ib7tRtd6w/326yX/61ibb/uDm234KS+EP440os=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hY4uHC6pet3Wy4tnoHy4Wz8j2ixiHTBjkFkSLN9+VIslLqZ3m/XnnzdH0fmytu95sb+godo47kG5SYMTmFtbqJE8oagFJwLbP61RCRlMg8+LDF1j0aM3mrQJW0QsgSB7j+XfTmMz3tIMVXw5mVIZy2gk80xE8O/oEU++sgl7Jx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RHYd+TXz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso12757015e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627116; x=1778231916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSd831WLWoomwvW5VsvsxASYGj8v1cMtz1VOawQMGgc=;
        b=RHYd+TXzjCAeXC0lyBCO0gGa/ei7QEV1J/8RsPZ9b1x/4iQMQgMhkvyHoL+4r84TSv
         /Xl43Yb0J2dMVW/1XdGwLv5EX07Hyt+H2fGBbLTy+W3PLB9+j/NP5DEKKEzgrOrkVcMF
         mbQ0sn1jOJZwAZS/9dtca/6JgUctm51LrhxxC50qTfTheU3CcIjW94bJ5dPU7W1PJ/N4
         ybAfBYh3iNN6nj38GAcQKvCFQedWDDyY+vmbHQc8rjBretjZQ5UVbjvHzHRpP9TD5ZYf
         8fDXaZYxtWORnihFV7WKicOVM89V7ZxG5lm0b6RnLgTZ0qhorSBgzjFBdDpJSIclj63S
         Rugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627116; x=1778231916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fSd831WLWoomwvW5VsvsxASYGj8v1cMtz1VOawQMGgc=;
        b=Vt38wrT1qLua+saSfa2q7C//K8RBAakRybvkA8NTo8plUohqHxukL6EKDE5hfBKVyq
         MjtGV+UUcxSIO1035PItiuSYgcvcltqThQsi3mkAF9dEtVkGQOzjYHDHanw5c2VuKpMX
         kMk0t+TP6Fv1LNxfNh/Z/8Kw9hZdfZld/TSK+jzN8OVaUCuNKNvYnV8B0OQSlQJ1NKXg
         o4SiR3V2P3Mx61wtwABnXEycQsy7Sz/SRRYszcWhaozfKKViN7GFM69/tuTL4o04maIc
         DQG32AhRG1KCWaoS+MsnQqCyLwdhW7tOK+xgDd1Wz2u/rIgH6z39p7YQlY2IwmBP5Nnw
         R7cA==
X-Forwarded-Encrypted: i=1; AFNElJ//DxUU9OvqarBBVlUdj3QVQpr8esr4XotWlrLLyNhvjAklJLIm+Rf0uRoexVyDAmOoORr16HULM1cVkOGk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp1ktSdLjSDEhFqF6WLW1L25UECYYYlr997bnIr6/B4tidukrQ
	GTdCOPxGcDDtnmzmisMs3wnfcOMm3NmSevFzccW9Tf9JK0WM51gYj/99wPBkjfxyHKeZThO22AT
	L6WWcXxE=
X-Gm-Gg: AeBDievyMSyiQV9WLpVgM8pTOosSw4RJKX3jgP+NIwW94HcqDQEYpiPYw/tzb+FB6kI
	iyfCODeHQV4rpDcJ1ps25dBqWlSvBu6M5Nxe1QSWmlbLIJiBioMCGNkwxhM+8F+vEAO+DHsSRfI
	dIgm2BddHCSegO62jGKFpWQ4838DHu8xhEE+41q3Cx1igXFRrLuJO5RmUYvMTzmtqMDfc+cymaB
	1tHVuZugdr3deWR1AhpXFsfemtLuE2VU24w5oOx0GBlBoQZ/c/yomaYaLDd/frnstEaJQEg/nkC
	RC7rGU87pXEo1+pgRegX1IOIv/mChlFZLWRomlFPaQ6goQNA7UsWh4evERJYurxinp9S1eHVQ9p
	fIhVDmZJR0PDrtCpcirlac5kqT9zgoxxkw9va/5UUrH2UKO9vbML4ykgbdlpFGt4b9ZWt+spSeq
	U3qEGEI9SyS6KrXQ4lVrs7akXbrVnZFQ4qkXbC2ZUXZm1oe6IO2+Z/vpDBeiVnwxY9jM4rVMfmm
	81q/czj
X-Received: by 2002:a05:600c:6994:b0:488:a916:14a8 with SMTP id 5b1f17b1804b1-48a844ebae7mr99326285e9.10.1777627116383;
        Fri, 01 May 2026 02:18:36 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 11:18:29 +0200
Subject: [PATCH v2 1/5] interconnect: Add devm_of_icc_get_by_index() as
 exported API for users
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-camcc-icc-v2-1-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=2340;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=h6Sc8ib7tRtd6w/326yX/61ibb/uDm234KS+EP440os=;
 b=EkStrO4AgPi/QOnRLNXv0FW3BxXmJs0IsGB/Ss3Vm8o1Bu7DHupW/HkJYypIrV4+9V/F3WscB
 BHOpdj2kPn+D+jrj3Khz4feDFEWrY4W1mc/sEASIxpRrmw4vgb44cSl
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 263E94AB467
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105456-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

Users can use devm version of of_icc_get_by_index() to benefit from
automatic resource release.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/interconnect/core.c  | 20 ++++++++++++++++++++
 include/linux/interconnect.h |  6 ++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 8569b78a1851..bc2e416dbcb2 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -443,6 +443,26 @@ struct icc_path *devm_of_icc_get(struct device *dev, const char *name)
 }
 EXPORT_SYMBOL_GPL(devm_of_icc_get);
 
+struct icc_path *devm_of_icc_get_by_index(struct device *dev, int idx)
+{
+	struct icc_path **ptr, *path;
+
+	ptr = devres_alloc(devm_icc_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	path = of_icc_get_by_index(dev, idx);
+	if (!IS_ERR(path)) {
+		*ptr = path;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return path;
+}
+EXPORT_SYMBOL_GPL(devm_of_icc_get_by_index);
+
 /**
  * of_icc_get_by_index() - get a path handle from a DT node based on index
  * @dev: device pointer for the consumer device
diff --git a/include/linux/interconnect.h b/include/linux/interconnect.h
index 4b12821528a6..75a32ad0482e 100644
--- a/include/linux/interconnect.h
+++ b/include/linux/interconnect.h
@@ -47,6 +47,7 @@ struct icc_path *of_icc_get(struct device *dev, const char *name);
 struct icc_path *devm_of_icc_get(struct device *dev, const char *name);
 int devm_of_icc_bulk_get(struct device *dev, int num_paths, struct icc_bulk_data *paths);
 struct icc_path *of_icc_get_by_index(struct device *dev, int idx);
+struct icc_path *devm_of_icc_get_by_index(struct device *dev, int idx);
 void icc_put(struct icc_path *path);
 int icc_enable(struct icc_path *path);
 int icc_disable(struct icc_path *path);
@@ -79,6 +80,11 @@ static inline struct icc_path *of_icc_get_by_index(struct device *dev, int idx)
 	return NULL;
 }
 
+static inline struct icc_path *devm_of_icc_get_by_index(struct device *dev, int idx)
+{
+	return NULL;
+}
+
 static inline void icc_put(struct icc_path *path)
 {
 }

-- 
2.54.0


