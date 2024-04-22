Return-Path: <linux-arm-msm+bounces-18155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EE68ACA55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 12:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93C4A1C21066
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 10:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C8313E3ED;
	Mon, 22 Apr 2024 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="swo5jUli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CBE13E3F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713780690; cv=none; b=oCUVFOu/dW1qYKuxM/VOaS5Ei6zfO6aHOmZWlDkWaHc1SsSFQJOF5arCvnrlU7LUENPNHgxo93/0etXOFzesEIYk2jzY1e5zUMXgEDY0KiKaPKIm8C5+rWdfGYPRDqeF9pEFjgfX7db6B9tRnTgTQdOiNkv5jQ51JWrzjZB58Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713780690; c=relaxed/simple;
	bh=fvMToiiNdTZTq3/y+FkrPuwl0NqwcqEAFZtgK2uk0Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfot2YW5ViJhdNuxbyoJilblFgN6ccvahMQYnD9fmxrPKIAloaPOULybx2gCkihGGWCtiKhGLTimojx1H3nW3syiyHfHtsnv0XBJLBgzFrjwp+K2DpbqqmOzyvLbB5nEBaw65GMD/ubHmJPATGEMk6rEFUbIUZ7eBFy1a2U0kzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=swo5jUli; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a5557e3ebcaso692111666b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 03:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713780687; x=1714385487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKIDfr5zIf6Ah4i9hZjm4f94DXkgUa1CksRrZAM9u2Y=;
        b=swo5jUliGIO6vZrxHoRs+ARL4bBOmCE3YMo79+cfjXuewQ2AG8EPSkh3fJWUzTj4fP
         bnQXQiEbrIFGd4jL8LNoQHo5v2Y0cwMs7JfJuQly6MFwTs2A7ZRsEDIlgdnHfQtk76hr
         Xypuugi6szAVS5vhaDQ1rloowtHd3k7QkmHbSotgzWQWaEomxlH+1G0HZ0brj45/FPX7
         9NDBChch4WdaPjTcV2hRu/zUXnT9xSpL9DV0H+eYfmql4U3wGwqKFNz0N/lTbwegmP7j
         1qhUZ9E0k8aFmMPtbNk/NFCFm0qSKSSWeBJx6BmeMOJ1oBHGYs4p4epWCZncsTTUxOmp
         TTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713780687; x=1714385487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKIDfr5zIf6Ah4i9hZjm4f94DXkgUa1CksRrZAM9u2Y=;
        b=G6eXXdxzt2Um2W7uDCtBzETR7Ocs5NfzFRItbFqzTmBy0Z5Lto6v2mr7SCIebSdSmK
         p8f5R4V5UlZ3VkBNAayoRJ+M6bJP5kwfMPfcEI/8j2Xa7MFlcU/OAsM6WCUNgCeMmIxj
         yRB225leuU2FFl07uQNjnVK5RjXUlpFXWcd7AN6JV1/Tt7P3lq9BeGhK2FFBxZMKDh2K
         nxq274VRBMeNM178zjpIgMrHezmeMGJ/pWj6LexgLMiMtqv95xz00+E8d3Qei06wuq1o
         uABk+DrxLYwlsHDJRdntN8f1a9hq2OF6X4Kpe9ktMlO6MttMb+29Rm6phHi076QyLKfl
         7EVQ==
X-Gm-Message-State: AOJu0YzSX9ozplbyzjgZzUM/v3ERNHHUUnW1DwgLtObknAqsb82VhmEV
	Aajp/pYykaNts+fYt+WshvSnAKA11X32SPiy4i4it7ux5Z9YhM1P3AqlhMCF2uGhMpULhhV2Rbt
	T
X-Google-Smtp-Source: AGHT+IF2oy3YaoKeosjJOBtUncMzGrDON3cPy9AOOJCN6bXr9HvZWcGGBT1QP8SJgeA6GzWn4LWGFw==
X-Received: by 2002:a17:906:6a17:b0:a55:b785:7b47 with SMTP id qw23-20020a1709066a1700b00a55b7857b47mr2567674ejc.7.1713780687316;
        Mon, 22 Apr 2024 03:11:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b00a525609ae30sm5576339ejb.169.2024.04.22.03.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:11:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 Apr 2024 13:11:19 +0300
Subject: [PATCH v6 4/6] soc: qcom: qmi: add a way to remove running service
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240422-qcom-pd-mapper-v6-4-f96957d01207@linaro.org>
References: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org>
In-Reply-To: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fvMToiiNdTZTq3/y+FkrPuwl0NqwcqEAFZtgK2uk0Fw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmJjfKq4gvD1AInwbfa9FgIBDhESpg1JGgAgLjz
 0M9YIPLrA2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiY3ygAKCRCLPIo+Aiko
 1bvtCACznClTbWa70686e0t1cBBTeJAgSlUh7Mju8oBnjWk2G/puUNq61rFW8EaQM7X2u4O0EyW
 bB5o8t1LOSgOXIjnW+YWnC0zMijrm54cXCXem2RZZVnmM8TSgSdDTmO/oWOscUiQwxouYz7lgvc
 Wh/IOYpD/foOAozLx4XCjCIrepORgqTj5Uxw5i89Jhb1IrPgh7C6EWaz0z8zqleqKILNCnmC6bz
 UO206MzrtSKhH2sTArh4M9tE0whPzc4OUVh1vqbG0DBoTGthHDT42yC2qqcN7981nBVSHUUuAjs
 mxsXB2hYv4ZFr6Kl8Hu/Ij9JZ21LNdMtKtljoZpszmVhM9aN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add qmi_del_server(), a pair to qmi_add_server(), a way to remove
running server from the QMI socket. This is e.g. necessary for
pd-mapper, which needs to readd a server each time the DSP is started or
stopped.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
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


