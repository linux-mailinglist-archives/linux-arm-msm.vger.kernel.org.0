Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC84910ED07
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2019 17:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727669AbfLBQVw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 11:21:52 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33570 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727665AbfLBQVm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 11:21:42 -0500
Received: by mail-wr1-f67.google.com with SMTP id b6so15435368wrq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2019 08:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2/SckE1LuT5fuB6gss91UGfXQhSyW3IG3sRJlwZdSOU=;
        b=PZM1GdGn1/lJzFG0LD8rQni//3m1CWgT7LLmGrYxuS/5/QeSaDoIaSQjYpklGZKqB2
         4cScoPDEGJ5ZfZzy6zWXDd24NvW4N9lYnA1aWs2YcOBwqcIR7fCxU+pEhWNUQkJeJ8SH
         vUMYNenjhtW6fQk/+MPzR7K8du0wQfZM5EtI+AMRJRui1Yzow8b6vCR4XR8c/5Z9AckG
         bxBATOzvVxQwXm6kN3BRCWp7/JvS8vVtyKt6cK/X08si8eZPsboW+LDN6zryizMlz2I7
         tg8Z+BNQR6eP9vFLaIkX7PH03CHNFOLyXUnvl5ZHms5haEdE+bYON0NIRuUP7tjJi0MV
         V0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2/SckE1LuT5fuB6gss91UGfXQhSyW3IG3sRJlwZdSOU=;
        b=RsQ3sTu1JPOQD/bfZwyZgoedCIzp2xWF7M8SCvE6gxjKHRCnZfiZ6Lwoav/lZiSSzK
         LmrcbLcLXK/A835UdF6YTD+5Yhl09VQP+zbtQ16x6pbtooYPPb3xjvcExKbWPDRF0kfe
         yza1ST2cM+iq1GJIP+O6jxzKY2ptR0Nfn3SRPQ051uGVQgq2JVsygR01f2MX5r3/3wo7
         LknI/ZzycmnDkM2X8sjWkm4L79G42ZWGHDHj3nbCW5XFaUYe/jEZNrlfSQbRyzRj9EMI
         iYmESA932J4gjolg0AJCNNyFRqQpvf+H5PGj9Uf/ENgZ6+EjHUu8zlHQvAvRZkMnzd+k
         HSqw==
X-Gm-Message-State: APjAAAX+eJ6oVA0esU+PVVDT+MyxPMAxPWF7lOZacWJbKzQgv5ZhQwQk
        BjmXqFc0qxvOk1x66wk7lyDL4A==
X-Google-Smtp-Source: APXvYqy3xNpF3ciZicnpb/URmHtBw2s4159FTTCD7YGG1YzSJr97Sd0KRl//oaQ50TNWjJBjWYNbTw==
X-Received: by 2002:a5d:6305:: with SMTP id i5mr8541802wru.119.1575303700457;
        Mon, 02 Dec 2019 08:21:40 -0800 (PST)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id i9sm39204516wrb.2.2019.12.02.08.21.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 02 Dec 2019 08:21:39 -0800 (PST)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, digetx@gmail.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        masneyb@onstation.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        georgi.djakov@linaro.org
Subject: [PATCH v2 4/5] interconnect: Add a common helper for removing all nodes
Date:   Mon,  2 Dec 2019 18:21:32 +0200
Message-Id: <20191202162133.7089-4-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191202162133.7089-1-georgi.djakov@linaro.org>
References: <20191202162133.7089-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The removal of all nodes from a provider seem to be a common functionality
for all existing users and it would make sense to factor out this into a
a common helper function.

Suggested-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/interconnect/core.c           | 22 ++++++++++++++++++++++
 include/linux/interconnect-provider.h |  6 ++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 8605c3e05b5e..2633fd223875 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -745,6 +745,28 @@ void icc_node_del(struct icc_node *node)
 }
 EXPORT_SYMBOL_GPL(icc_node_del);
 
+/**
+ * icc_nodes_remove() - remove all previously added nodes from provider
+ * @provider: the interconnect provider we are removing nodes from
+ *
+ * Return: 0 on success, or an error code otherwise
+ */
+int icc_nodes_remove(struct icc_provider *provider)
+{
+	struct icc_node *n, *tmp;
+
+	if (WARN_ON(IS_ERR_OR_NULL(provider)))
+		return -EINVAL;
+
+	list_for_each_entry_safe_reverse(n, tmp, &provider->nodes, node_list) {
+		icc_node_del(n);
+		icc_node_destroy(n->id);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(icc_nodes_remove);
+
 /**
  * icc_provider_add() - add a new interconnect provider
  * @provider: the interconnect provider that will be added into topology
diff --git a/include/linux/interconnect-provider.h b/include/linux/interconnect-provider.h
index 61dfb0beb409..0c494534b4d3 100644
--- a/include/linux/interconnect-provider.h
+++ b/include/linux/interconnect-provider.h
@@ -100,6 +100,7 @@ int icc_link_create(struct icc_node *node, const int dst_id);
 int icc_link_destroy(struct icc_node *src, struct icc_node *dst);
 void icc_node_add(struct icc_node *node, struct icc_provider *provider);
 void icc_node_del(struct icc_node *node);
+int icc_nodes_remove(struct icc_provider *provider);
 int icc_provider_add(struct icc_provider *provider);
 int icc_provider_del(struct icc_provider *provider);
 
@@ -138,6 +139,11 @@ void icc_node_del(struct icc_node *node)
 {
 }
 
+static inline int icc_nodes_remove(struct icc_provider *provider)
+{
+	return -ENOTSUPP;
+}
+
 static inline int icc_provider_add(struct icc_provider *provider)
 {
 	return -ENOTSUPP;
