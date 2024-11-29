Return-Path: <linux-arm-msm+bounces-39583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8B79DE6F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 14:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7007928113E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 13:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA29419D898;
	Fri, 29 Nov 2024 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jprYZFwh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E7519D8A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 13:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732885679; cv=none; b=KfJ0Ah70YxtVFbYM7ohKeBF20MqvuH5esRRpsWD8gEw4Qejk/H/22DGRMQcYGyVqhyh53oa+ZsnxTfCKhPiU0hbGgv80ZM/xOIjut28BTHDE/jjz91fUyonbWQkyd8iKp7LdmGLa3PfEED1PKSxk7KaLEeEH9anYeCVZNNkGTBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732885679; c=relaxed/simple;
	bh=BCcVhjXqM/11poMT/N4HvI5IzpguMzkE/XgunRZ0xcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J2mH3o7SU+8M6S1A/e1Yt3XkjITuh3fI6cGzZFpo6rbZFcwQWBklzDvBPqZWDkyRdhOyY4/MuAfcVVar+SVlKEhTtlI+c2eW5norck3VSQbTM2W5jDeg/2FhySIeXRM9Vy3B2EEswl4iQGaT3G676BRkVkHnAclb1IsY2zUCenQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jprYZFwh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso16890665e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 05:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732885676; x=1733490476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3Aq0nsQUak92jzQ+dzMHRTGJEDpjujxd82cAU7SdLo=;
        b=jprYZFwhnJqyckqOskpGO7CG5Sghfpah2uSOWzQ82l8SDHTbkUQ0ZWLx+lQJAzR12q
         jdj7/TVADr4wNrJ6gRN21PuvYORVwmKloFEuh/n1cbg5wTLVxc8WtsTeUX4A6R9F/prp
         FHcy46F3vDcXdo0fR6aAUUB2omnOpvLEk75VAZwO1RKmmCZyZ6g5FLNvDVN06Ia8rLsu
         inNg8+xQJshgbhvupRGuBTnzqkMF5+1JA8ygMx3a0tWreSX4SHCywrsOIF6rI0T3xMch
         PpVIdx3ZuRtsGnENfrLIuyVF+ZV9QHsjMTIYqUktbxdD3Zv84ympFe7Q+M7gLqNwPYPl
         KxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732885676; x=1733490476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3Aq0nsQUak92jzQ+dzMHRTGJEDpjujxd82cAU7SdLo=;
        b=ohkZTlLnfKBTdRUZNP+S1FKAr32c9reKVRrepdeFfYQS0nE/47S0VvCakNWTRtCcRh
         nv7ejf28h0IiE/uQybV1EQLccnpWyMQjcScoJteTK5ugvhYZEMN/PQj8iGxkjTE7+fBS
         3aNuHLbNlKBcxQdX9gUs5E3M+gZl4Nb6IloswBeAZEW8KvFl4qY72qx4Ddg4k+Ld9N23
         gO/5t0+qhi9LR/77PN9+1ct9SqDPnV5ef7brLiif0a/4MXFl6+lr8BEteSu8IhCPhbQ2
         tafACU+7w7cdDjj4EGMcLBTf+9/YsBjQN7GEAxnVra+fLvDZqRginXqp5goeA048tu+j
         HJAw==
X-Gm-Message-State: AOJu0Yw1PahGIjgLdHU8VhtWxXKGUBqby5JPuBDyU9Nz4s2GHDhHqWtR
	4CzO6huMZYy9ju0VchQMTcUkRZrotXGSCEmrg4z3Q49nkx2P/AVCUFCGEVYF9fyIG8Fl3FOyURe
	XFWQ=
X-Gm-Gg: ASbGncuMIAl2G0raF4BgKuOttC0qIDjyHtHe8+Mg1OEpCKra+S7sn30HFusod22J8Sy
	7/jlrDt/BQknvnugTLB9rQJUoaUmp7TG+kODnmTx8PTZCegvZ8H9fk2YLqm11XFptXX581K++lr
	zyCAnQldvHrNOCzlre7ATaOOZr6RX+UDCI61bvVx9FxIbhpUac8iIa7geWKh+1kzw9H1figOUOT
	dL1UguUIyx9j6YsAcYzfn39wFfKZlp35BhilUDERmO4cYmNOtz5ycNDuDk=
X-Google-Smtp-Source: AGHT+IEPEkoTPvIO2wDF7R7vcKE+vmysjyb1Ux8gO6F0UH8ZweTsBFFeO3yV0dgiqmcp49wUdMKE/Q==
X-Received: by 2002:a05:600c:314a:b0:434:9f0d:3839 with SMTP id 5b1f17b1804b1-434a9dc3d2emr103688195e9.8.1732885662133;
        Fri, 29 Nov 2024 05:07:42 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa77d01esm86228395e9.22.2024.11.29.05.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 05:07:41 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 29 Nov 2024 13:06:48 +0000
Subject: [PATCH v6 2/3] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-2-24486a608b86@linaro.org>
References: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-0-24486a608b86@linaro.org>
In-Reply-To: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-0-24486a608b86@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

Right now we support one power-domain per clock controller.
These single power-domains are switched on by the driver platform logic.

However when we have multiple power-domains attached to a clock-controller
that list of power-domains must be handled outside of driver platform
logic.

Use devm_pm_domain_attach_list() to automatically hook the list of given
power-domains in the dtsi for the clock-controller driver.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d1f875a193aea0552902268dc8716..b79e6a73b53a4113ca324d102d7be5504a9fe85e 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -22,6 +22,7 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct dev_pm_domain_list *pd_list;
 };
 
 const
@@ -299,6 +300,10 @@ int qcom_cc_really_probe(struct device *dev,
 	if (!cc)
 		return -ENOMEM;
 
+	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
+	if (ret < 0 && ret != -EEXIST)
+		return ret;
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;

-- 
2.45.2


