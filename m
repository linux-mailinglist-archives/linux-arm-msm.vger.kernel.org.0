Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B50612D0F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 15:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbfL3OoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 09:44:18 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33109 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727584AbfL3OoR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 09:44:17 -0500
Received: by mail-lj1-f193.google.com with SMTP id y6so25494614lji.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2019 06:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2SSEC2vfb168IYWIDWdargmVpZp+vFDhT4s2aSCvbsQ=;
        b=cy2p709JggRMYRuxWxFdSksTT9ddyA6a1dDrdu8q9fW1P86WFtSDw9ag8hPz6ZKNOQ
         kDbXHnK228dLnG1KkaVAm6OI3xR1KKNURB+OdJgoUO+EiSNZF9dXv9l9daoRmOzkGs2T
         00+SgiucRmVEWbLY4IJz3gvwOyuL+S4e/7NiYFsWBMHBQDyjcT3EK2SkrWpoLwFdaPEg
         nBYjSUKXhhEzxyGYCZqZGc1kKT070puW5yjAnE/b9zsWciGHXcg8kN8xdQ5cmJzfHNmh
         R1vZZc3iISEj4NHiP3JQ70DFnvqLZX4hOO/+R8BfI/n3NfeJoC1NKuqgI8O5xUoMKVij
         T5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2SSEC2vfb168IYWIDWdargmVpZp+vFDhT4s2aSCvbsQ=;
        b=srABPkLlKLm5h3qB3eP0btQw6r/x9IwV7cAqPo1Q8Kzuk6BBXyDQfwviHr2Gaea/Gn
         uinEosqDStDv1b4ri/7HgMLG17x8ILpSgJkAMxdm4ncf4/F3yHEivdXL5miFkuoz7N9t
         OPUIFFpjQYNwPo1HiHTLFfuty/jpgznT5KX0AV8N0JD0SvBCujxTW9YzfyBRfGZbZLZr
         s/W9/06bCAnH91a9+PNisTDXD/d6pjAAk+b61AfXKWGV86n5G/m47q5+gyzGFyMSPrHk
         GJd9USarqcCwypB6XOG0Kb8xevmaDI4tb0N8mSrglL5nQCF5j09ef+Se/1+E3HF9Uswq
         EdqA==
X-Gm-Message-State: APjAAAV0tWGRYrDuy1YVI8x8DKkZoAuuDymxVsQyz3o6q32iRNZ9jF8V
        nOssK97JHcO2zbg0gBY8br5pJw==
X-Google-Smtp-Source: APXvYqwKhyGXfftma4hgJ9/As4lgMAp1G9DT6skACgdPUdlDaDw5umtQpzwwdtRkeXNe5nNxtRZmUQ==
X-Received: by 2002:a2e:88c4:: with SMTP id a4mr10783373ljk.174.1577717055205;
        Mon, 30 Dec 2019 06:44:15 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id a21sm18744931lfg.44.2019.12.30.06.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 06:44:14 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Lina Iyer <lina.iyer@linaro.org>
Subject: [PATCH v5 04/15] of: base: Add of_get_cpu_state_node() to get idle states for a CPU node
Date:   Mon, 30 Dec 2019 15:43:51 +0100
Message-Id: <20191230144402.30195-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230144402.30195-1-ulf.hansson@linaro.org>
References: <20191230144402.30195-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The CPU's idle state nodes are currently parsed at the common cpuidle DT
library, but also when initializing data for specific CPU idle operations,
as in the PSCI cpuidle driver case and qcom-spm cpuidle case.

To avoid open-coding, let's introduce of_get_cpu_state_node(), which takes
the device node for the CPU and the index to the requested idle state node,
as in-parameters. In case a corresponding idle state node is found, it
returns the node with the refcount incremented for it, else it returns
NULL.

Moreover, for PSCI there are two options to describe the CPU's idle states
[1], either via a flattened description or a hierarchical layout. Hence,
let's take both options into account.

[1] Documentation/devicetree/bindings/arm/psci.yaml

Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
Co-developed-by: Lina Iyer <lina.iyer@linaro.org>
Signed-off-by: Lina Iyer <lina.iyer@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---

Changes in v5:
	- None.

---
 drivers/of/base.c  | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/of.h |  8 ++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index db7fbc0c0893..614f0c674995 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -489,6 +489,42 @@ int of_cpu_node_to_id(struct device_node *cpu_node)
 }
 EXPORT_SYMBOL(of_cpu_node_to_id);
 
+/**
+ * of_get_cpu_state_node - Get CPU's idle state node at the given index
+ *
+ * @cpu_node: The device node for the CPU
+ * @index: The index in the list of the idle states
+ *
+ * Two generic methods can be used to describe a CPU's idle states, either via
+ * a flattened description through the "cpu-idle-states" binding or via the
+ * hierarchical layout, using the "power-domains" and the "domain-idle-states"
+ * bindings. This function check for both and returns the idle state node for
+ * the requested index.
+ *
+ * In case an idle state node is found at @index, the refcount is incremented
+ * for it, so call of_node_put() on it when done. Returns NULL if not found.
+ */
+struct device_node *of_get_cpu_state_node(struct device_node *cpu_node,
+					  int index)
+{
+	struct of_phandle_args args;
+	int err;
+
+	err = of_parse_phandle_with_args(cpu_node, "power-domains",
+					"#power-domain-cells", 0, &args);
+	if (!err) {
+		struct device_node *state_node =
+			of_parse_phandle(args.np, "domain-idle-states", index);
+
+		of_node_put(args.np);
+		if (state_node)
+			return state_node;
+	}
+
+	return of_parse_phandle(cpu_node, "cpu-idle-states", index);
+}
+EXPORT_SYMBOL(of_get_cpu_state_node);
+
 /**
  * __of_device_is_compatible() - Check if the node matches given constraints
  * @device: pointer to node
diff --git a/include/linux/of.h b/include/linux/of.h
index 844f89e1b039..c669c0a4732f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -351,6 +351,8 @@ extern const void *of_get_property(const struct device_node *node,
 				int *lenp);
 extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread);
 extern struct device_node *of_get_next_cpu_node(struct device_node *prev);
+extern struct device_node *of_get_cpu_state_node(struct device_node *cpu_node,
+						 int index);
 
 #define for_each_property_of_node(dn, pp) \
 	for (pp = dn->properties; pp != NULL; pp = pp->next)
@@ -765,6 +767,12 @@ static inline struct device_node *of_get_next_cpu_node(struct device_node *prev)
 	return NULL;
 }
 
+static inline struct device_node *of_get_cpu_state_node(struct device_node *cpu_node,
+					int index)
+{
+	return NULL;
+}
+
 static inline int of_n_addr_cells(struct device_node *np)
 {
 	return 0;
-- 
2.17.1

