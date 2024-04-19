Return-Path: <linux-arm-msm+bounces-17953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E248AAFF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 16:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B71EB1C22235
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 14:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EB912D1F9;
	Fri, 19 Apr 2024 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WDJ0HhW4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7646212CDBF
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713535247; cv=none; b=sL18VpIkVuiLh3/uJwsbUkvNd0YTAI0hUS6aNXp6QXJmbbZiDW5PhO5NaBm3fcjdqnybgf/xi2FYvpC8jQ06vSOPPrMfuxc4RluQ22hfBVQfnHHQF+8owDMdiYyCj+wAuAei71kXFzTalcsQU/kToNc8MrkqfL9kFZMZkrcwl7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713535247; c=relaxed/simple;
	bh=fvMToiiNdTZTq3/y+FkrPuwl0NqwcqEAFZtgK2uk0Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YMt2fSxVcRVm/o40XC3HdGxUhYzpSEy6xd9yTy8/JTRGfL+DomXx5oErRFIXknBYNsO8BNaZaS6Mvy3F8RYkHY8dLUbN8LoFNgXXZJlKjNfoli53psjPXAS+k5dwm0Qt2UCRWXqwskloxE3GY05kw2bb1xS27lQURtRLORyZb4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WDJ0HhW4; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a44f2d894b7so201194866b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 07:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713535243; x=1714140043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKIDfr5zIf6Ah4i9hZjm4f94DXkgUa1CksRrZAM9u2Y=;
        b=WDJ0HhW4rdTZ+v5amiMrmTNWl8qSQe8XJWuqKdSpKTQQARI+M3WPO/OoNIsWsac9/o
         UAH6/1zTzaPlctSzB67hFDOfbcgUJR8NmL0v1Hl/wdKV9JQYLMSDVdDyl/9ZSkXrNDfm
         5FG1IUuiQ0/8jzOnM5JZdICL7rl6yfLGGuI5oF6SCQkIqtSdpo/u+6b8lOqELxzrG3/w
         +iIUJIfU/kQ0e7U7dtjTVrlPiJeYQBBcqtLaY95xA8OYttEeyljI3rMYDkxdw7tyqRln
         EiFBMX/h58v6yA5IpkozATP8nYhlpm6rhxtqri9DqSce4nxV8ej9LinfalTK6u7H8y86
         1URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535243; x=1714140043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKIDfr5zIf6Ah4i9hZjm4f94DXkgUa1CksRrZAM9u2Y=;
        b=gbrP/5+/4Fej7BA78toPD7Q9DzmoUIOvmQ/mJRjbAKaVq9BDr896SQ8q+zycKEOY5D
         Z+OKIGoEZeZUWtKRFajEH9rdYM9mbgf7HddxMbqYdjI1AIL64Rx5JNXrgox7w47Rd4js
         eYKHHIXL32mI5x8LU1wPOIdmhZbnlJDB35UQokZCvq0cNM55SYRbRpC+qSr3CxwoKNq+
         KxWB4n8vuF39518263KkzNKjFDor24J8ogd7J47yNec8SlCoMd+TeGXH9E0OOfewjlLW
         gA8/0HoEW71tvq6tKFvpNSLi3pe1W456hDsOVhiyXf1dDamKZc/CKD0txG0ZlDsH+zyZ
         qT/Q==
X-Gm-Message-State: AOJu0YwPcRy0mRzUvwhBmdbPb5W6FssIdPEG27eMGX32Bb+qqDfNPtqN
	035fAc71AipmCEyQNjG2MjCacMIEziXUrmxwBgw5vabyPWXZjWmX9vf+TGhlO7H4mJewQhbGYqU
	R
X-Google-Smtp-Source: AGHT+IEVjc8u/6CMXCh18nlEV2IsAlwDSWNsebqrey3ZuyUIfGppuT2uwNQtKyyywCatA0iGfyjYig==
X-Received: by 2002:a17:906:300a:b0:a52:30d3:41dd with SMTP id 10-20020a170906300a00b00a5230d341ddmr1780096ejz.41.1713535243514;
        Fri, 19 Apr 2024 07:00:43 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id qy1-20020a170907688100b00a558be8bc03sm532390ejc.150.2024.04.19.07.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 07:00:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Apr 2024 17:00:32 +0300
Subject: [PATCH v5 4/6] soc: qcom: qmi: add a way to remove running service
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-qcom-pd-mapper-v5-4-e35b6f847e99@linaro.org>
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
In-Reply-To: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmInkFJ52tJrxGxLCfkxdChR+qIeim1zAqR8x7M
 Abc0mo0VYWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiJ5BQAKCRCLPIo+Aiko
 1dEkB/4onCYk6FRNy5bu8tLnMbjVnpIUvtSEIGwHXUDlO3vByHQlmrCtgUXaFDIaCCjJpEjGoo5
 CqgD8qzyryAptkBR1D771qV26n7RsxqpvtXujYLslQ2gXeFIizyteTrD7IvSTkSG6wo3WpkaOXN
 0M8HfjRBpaFtNFJKm57ElGwrzWJmAouWC42yd/CZ8IvMbS90P5jYLUeZwSIMxcpGMqwiisU4WIl
 hDVR7OihbXw+XBxl6HURZWKBXlLCKStc8GXtA1tJHTHgvgw9sNetYUqgHziK9UVkozufre+Xk81
 DO08H96Yuf/0s762bmTXQ5unZjE4FUoZ5SnB7c9bKoWB3JmB
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


