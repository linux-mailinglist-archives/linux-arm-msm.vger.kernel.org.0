Return-Path: <linux-arm-msm+bounces-57713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12696AB5700
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 16:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA0FE189AB27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 14:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3252BE0E1;
	Tue, 13 May 2025 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fA0/DqK1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB4B2BE113
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146255; cv=none; b=ss7n5anasWGWxG2SxjIVreukNksTyTtqR/dyFDf8GatuotNPpYUqX8C1kOViJ9Mlt7kGynzBH1OGWmJKnP5ehedZJirL0p9UUixEAnF3Qe2NSYccnKrTlUjUCKo7loAavSwkRYeUuOrlS4dANFdm0S1LG3oRlvkqsVertTsDc9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146255; c=relaxed/simple;
	bh=XdEO4KmhdzkmFgTppxOTLqYmKKiZ4V91Zop709Tv7QM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqtfK0ObjiWNTZXEJFL4M5jQ+bQEagk0uSF8jVuf99aN3kU/EkvCCC0ek/sDvZPSMr0cs511pnBjxY8QLsgpmJMcAOrlrJWk3yezqr5J2NRHCj864TtxQ2+cva+jEcc4+c8h5ohrYHcOG16zoHczCKCG8C5WF3cb6j5JPkj7F8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fA0/DqK1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54fbf721fd7so752561e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146252; x=1747751052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkvIXboeSQ7DpFMEdb2LOpzhdD+Ul3bkMffg79IGGvk=;
        b=fA0/DqK1u1AHapDtBP7DbQ1EE7NbFRf5SZIFkfVDBavvYxzDxcFJSJBCR11orhq/LQ
         RivDUbg5JZJCZOhdRRY/rx94p/6tw93fI6SjJqE3ELjv6qmKP5e6yRAiabjVl2AnIfSa
         LhXjQ7X9DV9j2Q0liUibRkfqEtzGqYCnHs1Kz+3c0jqN3yx711uJXol1mQwN9iF+/VSc
         MmsC9G4NsNmxApGYRL6WOpllJLPudkrzi/t25K/dISF3/aveuCp9L58uxp+vOzu1FcBC
         lM07mqOHSojQALWDsw5F6THJcZt7advAgdzAf5HTeVTwU8yav51TZVzwWNz9TsxPwLOD
         fUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146252; x=1747751052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkvIXboeSQ7DpFMEdb2LOpzhdD+Ul3bkMffg79IGGvk=;
        b=dh6xtwsGvYQTbUKWlsKf20Y//SECoRnIEwiitE58v0IjLCBxDYUXZVzHqxRIc49VrZ
         Br8gXO51W/QTcIF7+XfvT2GdtRKikNJmDVI5vto3BraI2lIGmdL17jnANmrXpNdNIJ1X
         E/yXpOxnhS/z6Iwv/yD380GbVBNn+yikWrrrTFofT5UnTyHx4Z8DIEALG7umCFnD+S+X
         6+x9WfPFowmaaM3gtDd7RykgneoELtmrQIqaAiSfM3ikNGYGrSLxxPhrDjy194M6y27I
         WaITwbKohwwL6rWeRX4Uqf4/p9WkTwg13uoK8M4msuoxvywhLfKThViDrIQz5vFkJf24
         fc1A==
X-Forwarded-Encrypted: i=1; AJvYcCUMbR61Yrhk2AHFvmkc85olr/jUwFhZzMBYABgeiKYkwPGp+s396MJRogqjecgLC5FZxo+iiWnMRDC7PHeE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2LKpXFqObQExjYpuChBjkgINqo4m7yEk+dbgKUCa9dSzlOCJ6
	qsh48oxMJXrYH9SUrWwcoXVh1Td2y9JGt8KMopMMtvHf0N9coRGnkcC5CZknMFE=
X-Gm-Gg: ASbGnctiwh92cV24Q+ql28qtUye6yNGk5e5tGxzp4FPosgNd3NAVl/rGEO61nzLO0lt
	pIc4X/UQHKXLN5anwJo40vtR5tH+ma+K8C3IW1G6MGn2bauZnsujtTUvQfqcyD0x5ljYOrAGVlH
	arTaLe52OXRZsCUCwFWujv6HkoTTYGVYbnScXhp4AJ89NqykMm7+EFoV51vElvVK70D7yD5Rstv
	hpQu2lam8F158nINsRn7KpNmMEw8xA/bLRTEMaoBKqpAVz8wjAGCCpxT3iWmAy+7hV29bD4lptd
	7ftQT2pDrCLPHbQLpL42D/QFPDxRA5YqNl1i974a6Dc+pECXxtTUW32LJzD3eswXkZGudkyrstw
	egXTD22elYnrLtfFvGgwIvpp6DWs0WQpPmId83TNC3+iKEStoy3Y=
X-Google-Smtp-Source: AGHT+IGQvf2B9ZgZKrTjzA36UsxZkfwbIxpb/CDy+kO+0v3DXVBuJa/bdlFuqAoJspo3OGr97iZJ5A==
X-Received: by 2002:a05:6512:3d28:b0:54c:a7c:cbda with SMTP id 2adb3069b0e04-54fc67d30e8mr2165049e87.15.1747146251725;
        Tue, 13 May 2025 07:24:11 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:11 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 8/9] media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function
Date: Tue, 13 May 2025 17:23:52 +0300
Message-ID: <20250513142353.2572563-9-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One more code simplification makes parsing of remote endpoints easy.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d4745fb21152..0d05f52a6e92 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3038,18 +3038,9 @@ static int camss_parse_ports(struct camss *camss)
 
 	fwnode_graph_for_each_endpoint(fwnode, ep) {
 		struct camss_async_subdev *csd;
-		struct fwnode_handle *remote;
 
-		remote = fwnode_graph_get_remote_port_parent(ep);
-		if (!remote) {
-			dev_err(dev, "Cannot get remote parent\n");
-			ret = -EINVAL;
-			goto err_cleanup;
-		}
-
-		csd = v4l2_async_nf_add_fwnode(&camss->notifier, remote,
-					       struct camss_async_subdev);
-		fwnode_handle_put(remote);
+		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
+						struct camss_async_subdev);
 		if (IS_ERR(csd)) {
 			ret = PTR_ERR(csd);
 			goto err_cleanup;
-- 
2.45.2


