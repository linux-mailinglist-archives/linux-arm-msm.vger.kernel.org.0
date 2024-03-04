Return-Path: <linux-arm-msm+bounces-13272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A7C8707E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 18:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70D1D2813C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 17:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE15C5FDDA;
	Mon,  4 Mar 2024 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SopRv0JW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27E55FB9C
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709571821; cv=none; b=lsA+VeOo6U5wg6K58unuE2F4G1arA/hh7a6qgtEdrSH+y21JUjZ3QonQcmJkRDBCK3WltQQmXZU8IYN5ynC9ckYRiIu1S+C7EMwNwqIYslE7S9ih5ZH5IU7F9Zq7nbq6VZTpKPT4M5ddbQDJucKOeZ0i80Rx53OjYEMfRYgHazg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709571821; c=relaxed/simple;
	bh=G6zAQ1bsCSXFf0EVej2R6ZEBaHoQXG+GW9a1DIOFcCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9PfrT3dd11jfvVXP5a6gVg9xH/V6LaVBPI0E6RlGZLRE5+ht84J33llfhaKDy7YqtVJGR+aP4v4cFDvjE9nWkZ7/0r4Ex3x1wIdJISVF9IyTTxm1KlMk0rw63LJV9sh/SlW3TCi1j3ldB7Ha/A33KqOJIqlAgv7EJFvitJfGSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SopRv0JW; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51323dfce59so4034761e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 09:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709571818; x=1710176618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InVEZ2I87RqyH2r+8KE86HypPxzd7FCC5tSze9PDOTU=;
        b=SopRv0JWUPOfyYV8/nNnADwBeRPm1F21Ac2YoRiQag2E8VOq6pFM8ebujdKTodHqJj
         UfyN2VAaYDIybq9X0G490uxEGM2Bvim3P7MAGAlI3skB59a9jnXy7WnqX303NuxV79xa
         QafGGpotTKN1jScjPgUzNyVKiEvGAr2z7NnErqTmtjcK78muM2GXy+p6Uz0BByBIKgUa
         k3T1/YdsUo1wPrUe8oZH/sDXCkx5BdEZ5cKGc6nJ/yAC2o8zmgQwG/a+u+YdnsX5/HB5
         81Ecr/FzR4dwRl4SHfkh/7unVtm7+fCsOut+5e6+NuFOzPi00waTusTnKLH+BQqTbjgV
         VK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709571818; x=1710176618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InVEZ2I87RqyH2r+8KE86HypPxzd7FCC5tSze9PDOTU=;
        b=eylIeJb7WBCxv1m/1UI/9ao0jt72GgmgZ6r4PPo8rCUD+KuIjr2/UyZpFvDVsq4TdE
         dzBwSBMEU+8e6U4OGdbS4MO9I8bOiRPtqGdYD2llq8Z2hQD5b0IeMwbxd++OVihy4XMI
         nakIixKxQKGZKXd115Jc0uwPZEHdMnkNK10i7Xor9gmrMicv+IE+Ysace9udDQcy4sf1
         Rkdt+0xIaIh6cMAVFTEo2AJbigWHGDfYxeVe634oj28aojQAFd+9d2QjvcVIEGfLSHVn
         b0udHA33hsZclp5/0FKYJXvVlFG/U/5Vn3fcBjlqXJeO9J9DNy2OGQOvSmKnt7dWjghl
         O33A==
X-Gm-Message-State: AOJu0YzXhDaNrfFFLgvp64fU4JBfZWnr/0jsIgNTgaAKODU7YcWtRG2g
	C3tMgHPnvnF89puaOnRDiSwsDD0jtncv9aaNiAuiheV70jPAhwb6FMUTgLpnC4g=
X-Google-Smtp-Source: AGHT+IGPAWRar8b0d7XvA0k0zYMCSZaPpA/QhWvGKZx5SilxymtI9m6vK8ZmUvWXce7PzUw+Rdgf3g==
X-Received: by 2002:ac2:4c2f:0:b0:513:2643:873d with SMTP id u15-20020ac24c2f000000b005132643873dmr5478931lfq.36.1709571818094;
        Mon, 04 Mar 2024 09:03:38 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id dx12-20020a0565122c0c00b005132441e07fsm1809151lfb.0.2024.03.04.09.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 09:03:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 04 Mar 2024 19:03:32 +0200
Subject: [PATCH RFC v3 2/7] soc: qcom: qmi: add a way to remove running
 service
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-qcom-pd-mapper-v3-2-6858fa1ac1c8@linaro.org>
References: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
In-Reply-To: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3506;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=G6zAQ1bsCSXFf0EVej2R6ZEBaHoQXG+GW9a1DIOFcCY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl5f7mBL75JQpiVhYB6AF+J+omwUQ/AB9syE9Uf
 cbTvmq9bYyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeX+5gAKCRCLPIo+Aiko
 1axWCACeYLKhDs0f1or13A2Otw6NfkU13T6Ecarl0WFcoM1lqS20458T1popRc2odi1/6gMRaSZ
 nvV7y1mYoQf+pCGCkUPlv4atiLkLfqQoE1XBLlHK8GU2X7QxxcBtKeLWu9MHAsRIlvedbWvk1YX
 8saIdVkqdnD0cuc6XxT231x8lv2MykCCOBgCiog5YzE5nJp0soIU14Qzj/CfKh/ya4ywkcXteN+
 c9JJL6CbWHfU38s14MPz8dvGA87zFw6TSAy9nYui08C/bFQCstcDNzCL2LAdsfN8nSVW/L571E8
 STy48rF2Vo5pu6c+6H5XkmsoElN/G8ed20ZNk0StgtynZXp2
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
index bb98b06e87f8..9c5dda28ec74 100644
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
+		//list_del(&vc->list_node);
+		//kfree(svc);
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


