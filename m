Return-Path: <linux-arm-msm+bounces-13831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2108783DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 16:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE8091C218C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 15:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDA846521;
	Mon, 11 Mar 2024 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gipoMze8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AD645C0B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 15:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171250; cv=none; b=X6/bJeWUsFdhdPAdMRWhnTFnd9uhmgE029Cl6DPpYkdlUrhQLL3cdE9Bt817bKq70Lz0HPSsjpqwpLXCWE9T2g1D0ycCNQFIIfOkePrwTJz1WmibH5tiby3uVk2dQzood/GYtPSueMHUltrqyMAz3SZbPgVgZE0XcLH1n7iiDZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171250; c=relaxed/simple;
	bh=csXLAeosHLzaDT1emhK9UjK0flIW3eHZEn7ZeKWaD8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S6jRV+fd4tfQNPH0snvZ7tloLvG/7WxSTRCAB2B63MEQAKANdwxWU9krckpOlqzxIqYGqXFXvwe/E0OVy8+mALx+irVvChG4jmph/RcAjxL3faOgzC/nVbp1ejrn2ggR62j54+riR9UUv3ETGT757mqxYueb/n17hJwOnaRsauc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gipoMze8; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so61796981fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 08:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710171247; x=1710776047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqmPdjghu8YQzANGIWFKy+g9UopAwMWqD3Z+KAznsUw=;
        b=gipoMze8CtMAft2+u71gcJUXZiJBqVKrFvnIaQDyJTx+lYqQBJWtW7MkQiH+NpDSJv
         53tyM/JN6x5TMeQYTZVWI7KApwROT8kGyMP7kKaWo64FDE5pkjSA869TDH0wf5bjckV1
         /7YPvV8C1BnGzjzjQc9DFUCtyGsvsc99w15WlujxufBGKGz6H3hSxYdaQWjLoqukQviO
         6k5WIxDPm4acwHPEioDM3656tp3M9IZCmxuyh0fVluwlt0AXausjjP1hOdhFQSBJWxu2
         O4RvC9//RJKQhkjziuIbJrL2R7XHFzBcK1BbMuuZdnwlIppE4wJAHEzH45gVVcn7FUYi
         M/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710171247; x=1710776047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqmPdjghu8YQzANGIWFKy+g9UopAwMWqD3Z+KAznsUw=;
        b=auxAIgKy4xqMdHoDvyxSDRisKoZl6DG4MwmvCUEug9F9vC1zTo54Rl2+EGuZnUTGnk
         oKGZhnuEAk6808XeR9dIMxtXzsQd8/wbdJSC9UX5N5Nm11vn2S0UecK+y/bECIfEu+wo
         0nLGvlXHOaABaWJJpVk/btum7MArSBF8LdooNDgi4ll2fsTKWT1JlB4Fr8JnfPdZfh2w
         icUCetcD3JRyaFqZqTbxSht2pPRq7Y1ToKpv4EGNDKnAsUo6dga36Bh5DJu0rTdQWJzc
         fQLB70qPzW8OdLaTEUu7LwaGJEiaf8qcZSVhN1lLl5GFyCJ/8qZXUpm82sEvsXcBrZ//
         c+DQ==
X-Gm-Message-State: AOJu0YwvbzWX2/RKNxtdleEreLQj+38uQ7SAvIlXRBb+UoCvF8RQ0/R2
	TWePMCgeBjHKPBws1jUkTYBX2PKHkGqhFjZqExJGq7w/4mfquoYktUFvJJfkvCQ=
X-Google-Smtp-Source: AGHT+IHLen5haH/KIDqXSBnm6njMDNQd6Suv70/wZOBLhQ1RXfBDBeyRpILDckTG4uROvoPSav0/6A==
X-Received: by 2002:a2e:8509:0:b0:2d2:cb43:bc86 with SMTP id j9-20020a2e8509000000b002d2cb43bc86mr3844123lji.45.1710171246715;
        Mon, 11 Mar 2024 08:34:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q19-20020a2e9153000000b002d449f736ddsm119294ljg.0.2024.03.11.08.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 08:34:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 17:34:02 +0200
Subject: [PATCH v4 2/7] soc: qcom: qmi: add a way to remove running service
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-qcom-pd-mapper-v4-2-24679cca5c24@linaro.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
In-Reply-To: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3503;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=csXLAeosHLzaDT1emhK9UjK0flIW3eHZEn7ZeKWaD8Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7yRrL2prbFbuK79vS0F2a8GlhPfZVbWN/E6Xq
 duLqVwXa2+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe8kawAKCRCLPIo+Aiko
 1S5aCACkUyHCPrxn6erHvTNwfIoJijqSsCqC/Prmkilc3akRz38BugzlciQCplu3XeWeJbLUaza
 tDOiStmcgGIcWJ9QHsDArodLBUH3KpeL8UNIzQ+/o0POQ1qV8U+O+XjyH9MTiuF9e/2dIvsP2ZY
 cScmZLGdodIoXBP+BDPHh6orDFXci6uiZc1gztQb3dAbaB1K8b7tj1NNtz9lx5ijJIsHhZyjiqX
 jchwmM1nsB2obc9LCrQ40p+FGPIQA516usn/oxuBkw9hMLaMayyEa/4jlTp1ypBlPFbA8NWhghd
 cPtk0/KlgsgxiXBsgHhltaWNzWx+Tksu+1rX6Q1pxGjCdYrp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add qmi_del_server(), a pair to qmi_add_server(), a way to remove
running server from the QMI socket. This is e.g. necessary for
pd-mapper, which needs to readd a server each time the DSP is started or
stopped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/qmi_interface.c | 67 ++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/qmi.h     |  2 ++
 2 files changed, 69 insertions(+)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index bb98b06e87f8..18ff2015c682 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -289,6 +289,73 @@ int qmi_add_server(struct qmi_handle *qmi, unsigned int service,
 }
 EXPORT_SYMBOL_GPL(qmi_add_server);
 
+static void qmi_send_del_server(struct qmi_handle *qmi, struct qmi_service *svc)
+{
+	struct qrtr_ctrl_pkt pkt;
+	struct sockaddr_qrtr sq;
+	struct msghdr msg = { };
+	struct kvec iv = { &pkt, sizeof(pkt) };
+	int ret;
+
+	memset(&pkt, 0, sizeof(pkt));
+	pkt.cmd = cpu_to_le32(QRTR_TYPE_DEL_SERVER);
+	pkt.server.service = cpu_to_le32(svc->service);
+	pkt.server.instance = cpu_to_le32(svc->version | svc->instance << 8);
+	pkt.server.node = cpu_to_le32(qmi->sq.sq_node);
+	pkt.server.port = cpu_to_le32(qmi->sq.sq_port);
+
+	sq.sq_family = qmi->sq.sq_family;
+	sq.sq_node = qmi->sq.sq_node;
+	sq.sq_port = QRTR_PORT_CTRL;
+
+	msg.msg_name = &sq;
+	msg.msg_namelen = sizeof(sq);
+
+	mutex_lock(&qmi->sock_lock);
+	if (qmi->sock) {
+		ret = kernel_sendmsg(qmi->sock, &msg, &iv, 1, sizeof(pkt));
+		if (ret < 0)
+			pr_err("send service deregistration failed: %d\n", ret);
+	}
+	mutex_unlock(&qmi->sock_lock);
+}
+
+/**
+ * qmi_del_server() - register a service with the name service
+ * @qmi:	qmi handle
+ * @service:	type of the service
+ * @instance:	instance of the service
+ * @version:	version of the service
+ *
+ * Remove registration of the service with the name service. This notifies
+ * clients that they should no longer send messages to the client associated
+ * with @qmi.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qmi_del_server(struct qmi_handle *qmi, unsigned int service,
+		   unsigned int version, unsigned int instance)
+{
+	struct qmi_service *svc;
+	struct qmi_service *tmp;
+
+	list_for_each_entry_safe(svc, tmp, &qmi->services, list_node) {
+		if (svc->service != service ||
+		    svc->version != version ||
+		    svc->instance != instance)
+			continue;
+
+		qmi_send_del_server(qmi, svc);
+		list_del(&svc->list_node);
+		kfree(svc);
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(qmi_del_server);
+
 /**
  * qmi_txn_init() - allocate transaction id within the given QMI handle
  * @qmi:	QMI handle
diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index 469e02d2aa0d..5039c30e4bdc 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -241,6 +241,8 @@ int qmi_add_lookup(struct qmi_handle *qmi, unsigned int service,
 		   unsigned int version, unsigned int instance);
 int qmi_add_server(struct qmi_handle *qmi, unsigned int service,
 		   unsigned int version, unsigned int instance);
+int qmi_del_server(struct qmi_handle *qmi, unsigned int service,
+		   unsigned int version, unsigned int instance);
 
 int qmi_handle_init(struct qmi_handle *qmi, size_t max_msg_len,
 		    const struct qmi_ops *ops,

-- 
2.39.2


