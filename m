Return-Path: <linux-arm-msm+bounces-71704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A4EB4114F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 02:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B72345604D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 00:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BEC1552FD;
	Wed,  3 Sep 2025 00:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YIJDUWiy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB3A18DB37
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 00:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858995; cv=none; b=dB/3rKvHRUWPJRwS/DUqxZ+8k4HUVgWs4jZhlpmLB6i6rCYv2FWMuH6g7KbvuRYl6T64wDBAo9ussEvis00auzi2Ai1wC18nRue2mtnLpFDKYOsnJv8nFRDgWzz+qDWYISK4UVHjexucHKv5qJLZ+uku3Skly5bFxXSSERNsDHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858995; c=relaxed/simple;
	bh=HXpgPu/a2Jt75gUXVdVQWC0VO5DmFfrSNs8BUD7mYzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1YzEp0c6aMPsq95kzKzoCHXqpZfdnAGXCezDVUSrFLlfiDRD4cp43vaA1eDDv9eU05uUslxlRsD5VGDL5YezxpZmmRIqqOmUcfdik3cBLXphhv2B9NdFVazDd2iPkZ+lj7ESr1GKgbdKj/Zzt3h1jBk8I+Oih15xRDOkVUxcsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YIJDUWiy; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f7c8b38a0so195730e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 17:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756858992; x=1757463792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xKoUT4rPMoDqHpwaPvfJeO96eIskSMd6qu4FEjIHTY=;
        b=YIJDUWiyY7U9gQqUC4pM1pthCjjHitybKnfUvzN4ScYktR3fAtHO+TM6xcNMpu9OuC
         TdLw5MoCKTHKV4SmKoifjuzgVXDK+v7xfOFzgGYbf04clBGtiozDYWuXb4l73O4CtVgI
         R+MkzsaRwJb/yAUg5A55ysPIO/nx5RNiaeXRhwFr6lIo5sW7bwg8x3ipax6NLBfa7G2I
         HMhk2DoK5FX1hpeC6CrflAd9QNK1fU1VoXFt4aqbhUyECdsaoGgXVH2XOaCAKdsCs4Ef
         kTdZDXIkRfBpupqcb7zEFKhRncRaREU8eGAr0bnI5qVvIoT2R3NM89UGykH1Hp5yqLAk
         xKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858992; x=1757463792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xKoUT4rPMoDqHpwaPvfJeO96eIskSMd6qu4FEjIHTY=;
        b=kmnyNuk15lJ3F2BZ1oreNNwShpT4MtVLAGLT/KyN+Lqa6UMEB24GnDXM1mPGShgqtO
         Jr9o4aiZlXQF5iUWfPSFWra+7oIQrzh3UmtDE8tPepWjqSny+EaHRqd4V8+vcAtA7JtC
         P/sewVcnLJ1Cech8Z0LsBCwKdi7906nOtu2NxUtrqYETs4bipdHJY/StmlkANhlgNpIa
         fEn/T+EB3SeRm6NFTwVU7NKJigemZP+jBoOS6AgCEkL9y3Qv3unehIKtOnE24mNkugnU
         9BxQFF8bNJ7CxyBR9exDA+BOfzgeC8dXuQa69gzAkm4j4Oy7yMjpTKOgnOmOILb/jGBJ
         QU1w==
X-Forwarded-Encrypted: i=1; AJvYcCVuNocxV2lFonSuRAknWULYzNIgXrra0t1zuyRGWUgrO9JeaXXgdZoiNNN21uzyIEfxzpodQdJg+hla0ZmO@vger.kernel.org
X-Gm-Message-State: AOJu0YwGed14amB41EqWdza+ffL43yH4I/lIjcKYGmCbyy2b/p1iyQh9
	l1CGeYKrwHT6LhovYSwpQSzN9uM8DBoQubcaZQP2zhjyqattJtZuNa0vNnd6MGpXLv2nRB+VR6p
	ghJ7Y
X-Gm-Gg: ASbGncu1QNiQeuy7gsm0Pra0iiR1GvicqpwbmIbPRUTbZR400pDF6qyueqNTg0PKKC4
	h6pXPuPPbD7u13aZfVEQU0BaTO+FtWrFdTHJiKLmJN5yWjvrskVv5dFokP0oFOJES+7IzyoSb12
	MoUp2SqX7WlJZTelQXy9DgvRcjV3bavZc3xL1pTRwrtg9W/zekBL4jMeWX3i+n0rD3wuFs/wco8
	0jFxPcfQi63a1c+/PscOp5Q9GlQv2lzhi6xqM4isaR0oiI2bmC98Hpw2EQlL/Z8eW/zP85q3zWl
	i/fsWyY3DzPHhNeAxQIRHKHwoNr5pX5jDo5Tu+C3Yh0Fg7bTs13+8sCkT00S9Rm+VM9Mu+mXjZI
	8Wnz8V46DaM/j3kd6hJkVA416sP8GbpKKxQI6PNt6glbLwmIi2Zq/fEi/rKvqFz0nrtC7Eqc=
X-Google-Smtp-Source: AGHT+IFhSByOxqvqV01hLV3SBNaE/x4C8qcHC9XYIwvmLFzIJ1LeItyUy+Z9LdwhrZdKL+aH+tXfog==
X-Received: by 2002:a19:641d:0:b0:55f:7243:ade1 with SMTP id 2adb3069b0e04-55f7243b04dmr1344569e87.2.1756858991811;
        Tue, 02 Sep 2025 17:23:11 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm129649e87.99.2025.09.02.17.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 17:23:11 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 5/5] media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function
Date: Wed,  3 Sep 2025 03:22:55 +0300
Message-ID: <20250903002255.346026-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another code simplification makes parsing of remote endpoints easy.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be1c62d27e2b..4909dbdef1ea 100644
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
+						      typeof(*csd));
 		if (IS_ERR(csd)) {
 			ret = PTR_ERR(csd);
 			goto err_cleanup;
-- 
2.49.0


