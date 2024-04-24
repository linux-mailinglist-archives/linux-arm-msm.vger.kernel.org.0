Return-Path: <linux-arm-msm+bounces-18414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FFA8B0602
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 11:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FE81B23F1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 09:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C2B1591FE;
	Wed, 24 Apr 2024 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XoVFoPZo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA797158DBA
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713950885; cv=none; b=d+8BJTpGQOEVUYAKmPVN2UEkGn8LQ8FPzZ0RQia4hkcLqM3gM8yORMJkcZDnQhiSlr5Bx84GTZH/3f0q3z2tPT75GbL+Phcrr7tHYZ5t2z66Yesa1m614UmVSaDiT4wzuNNmCrhjtDvfot8SL8cLEbzVRcC2WI2gCa1ydtDKCqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713950885; c=relaxed/simple;
	bh=fvMToiiNdTZTq3/y+FkrPuwl0NqwcqEAFZtgK2uk0Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VV/0vzmkdYRofWXxLrTC2xRQoKqLnS/tEC4jaFYc4dyBfoGh0VXxOwqcEpFd49vITHm5oJ4vgFJWNJGScxDhINMbhvJ/vamcCeEzcWOY//zYv8B4HyUDhf1JVsbKQMmFSbqAZjcBUHFSvzkxdhDqoB4zbofGdYitz9ZGao83UlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XoVFoPZo; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2db101c11feso5326291fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713950882; x=1714555682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKIDfr5zIf6Ah4i9hZjm4f94DXkgUa1CksRrZAM9u2Y=;
        b=XoVFoPZoeqy5o3elJP283O6pj87b+pEe15vykP9b7+wtJhP5HzJRdn8Zmvb1uOoW7i
         Y0lqqzzFwVFGeYpsEZB7XWbq2nevB1Vhbiv0G/HpFsu6dBIK781JGJvzw0jk5NEzzBsy
         HzDJM/zPNI5xUA4B4AyWl81mPr35xT7yllF/P7bncmpxqqjxLMseXdn82/OLvqbTRrAX
         iL5fvk3Z7LJNPv3qntDrFviA5QzStX24Tyo/axbnnqG3deU4Nv3nAkwP0PNHsCtBx+zS
         iYeeNZWf8otxK50aFGvfiumZobcPrVImFJ8Bt9jVEeO0pd3qPYyw2ZjpIMQXIUx+7Sn4
         4vCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713950882; x=1714555682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKIDfr5zIf6Ah4i9hZjm4f94DXkgUa1CksRrZAM9u2Y=;
        b=O/3hsFzsjtttL+YN5GVMpuLGB+JsZW7SA3RfGXFEaKHwtSRrqyNZqtYKa/6wZbXPbo
         iCTCCxQsbBpD0Wg0y4307JwA0yfFfC2V9/wiVo+Rbi1EIQkXXezx/OzTinz6PObX3lf+
         rwTRhG9m51zHeSeWTVnteg6O7eJesgyUxv4saI/ri2Gx3UxkkN4e2FHjwnrhC0Xo55CT
         hZKZGTvfnPyrUz7izv2v8y2VvNoDy/GgFW8WmTGCm1lAAh/f98LVvVada6v7yZuz+5nl
         NPdSzJ08aZQ+dATn6HHk92WNMo3NbRCGxB9rFBMAFGdSOOexdKr/hDj0GhxLe9gj/pT0
         z6VQ==
X-Gm-Message-State: AOJu0YzVIaO3WMp81nQ3WmMUKm9FhVz5KvTSUqlDYHUnFjRcNQNxd2oO
	1mBsZ+7INChPAXkZsV9Ay/VwzS4xu62zDd2jaW+gHDjNsRcf3qlYQKNnqYHhIZU=
X-Google-Smtp-Source: AGHT+IHebM75drxdOnrxsgY5l4bNvlEn1Sev4Za7ABMcDvjoldc82tcuIYbgC9vqcExAIbiS4tnQoQ==
X-Received: by 2002:a2e:a162:0:b0:2da:7932:435c with SMTP id u2-20020a2ea162000000b002da7932435cmr1669436ljl.10.1713950882166;
        Wed, 24 Apr 2024 02:28:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a2e8442000000b002d8744903ebsm1916849ljh.68.2024.04.24.02.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 02:28:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 12:28:00 +0300
Subject: [PATCH v7 4/6] soc: qcom: qmi: add a way to remove running service
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-qcom-pd-mapper-v7-4-05f7fc646e0f@linaro.org>
References: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
In-Reply-To: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fvMToiiNdTZTq3/y+FkrPuwl0NqwcqEAFZtgK2uk0Fw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmKNCdpQLEwZxPfgyslqbii/uZUTzYjcRAKy4JN
 hOMIlXpie2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZijQnQAKCRCLPIo+Aiko
 1eVVCACD4gAYfHo1HZS2t0ulf3VsZtOrCvAC6LXJrVC4ifoQ1XwH/qiCi6yS8APzGyPRMzWs6C8
 PlBfdjpMAnuFEshPh5B6/LzDIwspXNcNR7zZxoP33KBuszyatGdoWJzC8zjCjZ5Z4Fvvjo/Ncm+
 JvwXZDhzXyL5ujA+yGFKvgnwKhLBTdjzvnnwzqOHhLjwIB+HU88SdJjLDJcqziNsouxj+UH9pa4
 Jbj6josUrnKkgzY6tMUU9qRUgZEBNaxBl45NpfpcXTCyY7bBO35ir48eyEJ4VscDHwF+SmXPY+e
 X/FVuibkg0H9XO4kkvvLNkaHm31vcU7bCvrDHBcv3HH4/xDz
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


