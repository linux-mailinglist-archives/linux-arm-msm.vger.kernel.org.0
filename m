Return-Path: <linux-arm-msm+bounces-71703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0C4B41149
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 02:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68FFD1A88254
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 00:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A021465B4;
	Wed,  3 Sep 2025 00:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pIkmBkHF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6A818A6B0
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 00:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858993; cv=none; b=X6NjdXIcw/j7IVo5jaNmgTqejgS94brNemFgFNJpdkQh0GIj0F+lOFueXGCZaqzy8pevy+sHdBdsfrzpeDM4ocEp0oL1qZ6cok3IaLbHWqEUsnb73ORY4lfF/cn97zKyq75XO1kBQEOHfEDmpqS3IHWH4UbqfaTHj50x8xprzkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858993; c=relaxed/simple;
	bh=90ob9/t3YxVrWZvOIbki9BV2MSu7FtEbIVyu2FmbVI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHjlvBrROfQBmG62thXaTucfPyj0IhhhuWQfY4qvRFZKC55woppRtY4alXNc+QD1Sawdehh6xu27Nlvix7SeZeeFddPgjndp2o8oqct/zlZSJYFC7Wy41G1nQeD/Wa68M7X2loeXfqp9ibCCJ+1U5igVJscBqOmvSptyFKIBI+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pIkmBkHF; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5607f21c62dso283017e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 17:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756858990; x=1757463790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2USbe6RBvGLraWIOuZ7Kl2anITPV7/ZWi53dlFPxg4=;
        b=pIkmBkHFc0eTVtx66RHNLK7dOc40ExYTy3iGswcpqe0e/wGyxNI2v8U9GKl40a5eqn
         amyx3AmMqQv7gIg869xqgdhRau5ZGzHIezCNjxy6Q65A+lyGdsCe5dyq/adIDAiwBkZu
         MkOriEYIpqlmn5B+D3871gqpUFSY6EdFsKIwS6jZTKO9eeO0Vt6HzOwp8xwFk65kHPeU
         C1pJnHIlDwa2r5GKnYfk8lSeZIP8izUu1edSqkiMkC3/oNgLzQgvYQ0qfUchoto27tGZ
         i6gUxSz0Zbj853C3DzT6zu0vb7+ROHHVgFD9xF9v6+OrrBOab4bD1/hz+8c2pbvRXyFY
         bbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858990; x=1757463790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2USbe6RBvGLraWIOuZ7Kl2anITPV7/ZWi53dlFPxg4=;
        b=xJFGu0gWGfurzoAAqNNv3v6bVUw9AEUCbXf2g73iv7vfJOWd0s8HMSwKnogq7+I+c4
         4fF0uTXMZLG2oa4L7cNQSmpLZtzbwqvwT1kiY6WVsjNR4a93dGICubXKjE1cpM7L+PU1
         +zR22pwleeDFx1LkLY6koQMJF4MpUMvPzAJuZLsqDZYoYKIz8JsKgr9tm4I9VjpThJoD
         z+I/xqHtzb4ysBSS6OvLdVU1+/6CggqqxyXBDUIGknRZxa1s6Bdp+LzrIfDgysoXf8MO
         kCX77Ml+MKuoHm1hISFJPdK2q1Ntf8xh+xh+L6hgiBhGoJlcAyp0PFTO6B7GlpYOlMkE
         7s8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmzrxzTHjer6koIwV4W3aarNS4zO2hAUh2JnVyQzdHhJ5uJS8Paj9jPdBkL4Qz+ZrJWzfdDe1VDnx0i1Di@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc9NJl+JWFRfEMsxMswqDX2ROf2VZqTL660CZTRnxIuwHG1dZ4
	qncV0WFPTmQmPHs1oekBIHcer6koeiDPlJXRJqKN+TakVbLzEaCvHyVC2W2WYQbPA2w=
X-Gm-Gg: ASbGncucHWSKDVaEDe/idmrKeSbQCJDMghif1goJ7Ug29uq9qgWKUWAjxsy5NtragnA
	tvoi7PRvvz08D0fJJGNGFb+jfgRqUuBMFA87pB3m+HAMRtnM36xdE75uZuMUXFNgB5g5D/IVNB9
	Cue/RnYKjW06NyNo42zPGIxbW41yVjjM3Hr9PgDa66a/gW44YQtlZGX/M/nEbkn5PY/PBWcXjyg
	qPt6qSD98UMAFh5URvdXvxd35yY72ThuiqESgnX1daijtLT8476kIYHDrumOxPAi5LFxKzKhLpP
	HI5EYWk0hHVsf2bH6pAwg3I9FgeHTLLeWACR4VSZOkdt2X4n3Dv3GJ8KOku0Nz/I0EA3fMV9S8C
	UcOxSAIu4ekJsZndB4AGa61TGRKIB2Y3gnrxTyqbFd4CmI1SGsbqtJFW52I8vgxs/2crLn5w=
X-Google-Smtp-Source: AGHT+IHxyPJiIG+anKFUoqMZr3UQwx3Pl95ntx8DnT78HDmC1kF1GQhOBB2E5YfC8IZ7m4SyaJKkFg==
X-Received: by 2002:a05:6512:108e:b0:55f:3ebc:132c with SMTP id 2adb3069b0e04-55f6af04c8bmr2776306e87.0.1756858990026;
        Tue, 02 Sep 2025 17:23:10 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm129649e87.99.2025.09.02.17.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 17:23:08 -0700 (PDT)
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
Subject: [PATCH v2 4/5] media: qcom: camss: change internals of endpoint parsing to fwnode handling
Date: Wed,  3 Sep 2025 03:22:54 +0300
Message-ID: <20250903002255.346026-5-vladimir.zapolskiy@linaro.org>
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

Since a few called V4L2 functions operate with fwnode arguments the change
from OF device nodes to fwnodes brings a simplification to the code.

The camss_parse_endpoint_node() function is called once by camss_probe(),
and there is no use of knowing a number of asynchronously registered
remote devices, so it makes sense to remove the related computation from
the function.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 49 +++++++++++------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 42f392f6f3a8..be1c62d27e2b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2973,16 +2973,16 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
 };
 
 /*
- * camss_of_parse_endpoint_node - Parse port endpoint node
- * @dev: Device
- * @node: Device node to be parsed
+ * camss_parse_endpoint_node - Parse port endpoint node
+ * @dev: CAMSS device
+ * @ep: Device endpoint to be parsed
  * @csd: Parsed data from port endpoint node
  *
  * Return 0 on success or a negative error code on failure
  */
-static int camss_of_parse_endpoint_node(struct device *dev,
-					struct device_node *node,
-					struct camss_async_subdev *csd)
+static int camss_parse_endpoint_node(struct device *dev,
+				     struct fwnode_handle *ep,
+				     struct camss_async_subdev *csd)
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
@@ -2990,7 +2990,7 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 	unsigned int i;
 	int ret;
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &vep);
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
 		return ret;
 
@@ -3025,49 +3025,46 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 }
 
 /*
- * camss_of_parse_ports - Parse ports node
- * @dev: Device
- * @notifier: v4l2_device notifier data
+ * camss_parse_ports - Parse ports node
+ * @dev: CAMSS device
  *
- * Return number of "port" nodes found in "ports" node
+ * Return 0 on success or a negative error code on failure
  */
-static int camss_of_parse_ports(struct camss *camss)
+static int camss_parse_ports(struct camss *camss)
 {
 	struct device *dev = camss->dev;
-	struct device_node *node = NULL;
-	struct device_node *remote = NULL;
-	int ret, num_subdevs = 0;
+	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	int ret;
 
-	for_each_endpoint_of_node(dev->of_node, node) {
+	fwnode_graph_for_each_endpoint(fwnode, ep) {
 		struct camss_async_subdev *csd;
+		struct fwnode_handle *remote;
 
-		remote = of_graph_get_remote_port_parent(node);
+		remote = fwnode_graph_get_remote_port_parent(ep);
 		if (!remote) {
 			dev_err(dev, "Cannot get remote parent\n");
 			ret = -EINVAL;
 			goto err_cleanup;
 		}
 
-		csd = v4l2_async_nf_add_fwnode(&camss->notifier,
-					       of_fwnode_handle(remote),
+		csd = v4l2_async_nf_add_fwnode(&camss->notifier, remote,
 					       struct camss_async_subdev);
-		of_node_put(remote);
+		fwnode_handle_put(remote);
 		if (IS_ERR(csd)) {
 			ret = PTR_ERR(csd);
 			goto err_cleanup;
 		}
 
-		ret = camss_of_parse_endpoint_node(dev, node, csd);
+		ret = camss_parse_endpoint_node(dev, ep, csd);
 		if (ret < 0)
 			goto err_cleanup;
-
-		num_subdevs++;
 	}
 
-	return num_subdevs;
+	return 0;
 
 err_cleanup:
-	of_node_put(node);
+	fwnode_handle_put(ep);
+
 	return ret;
 }
 
@@ -3623,7 +3620,7 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	ret = camss_of_parse_ports(camss);
+	ret = camss_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
 
-- 
2.49.0


