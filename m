Return-Path: <linux-arm-msm+bounces-1221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E46A57F1CFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 19:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91759281F55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 18:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEDF6D19;
	Mon, 20 Nov 2023 18:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nNQC3xNu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80CEC9
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 10:56:29 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50aaaf6e58fso2419396e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 10:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700506588; x=1701111388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ujELrVFY4be6CUqKjNRUfHmySKN0sInkgu1RJGqy2s=;
        b=nNQC3xNuCqSNUX0YNlBSs1tFk8utgux8aIvTLJCjHzbJkBqbB053Nlc2OJ+dlVZLMe
         Mr/bIPiHVN++ViaXsuatzZo6O0pqmjcfJ3JNpIFb7HzJNpRF6GkVrgKrj89VqfHK9MX6
         PzO34hwm4kibjGnnUfYDvx9drqx7qMNntKScZnqyLHzBf7c+jVIok2Uqe9qkW/xh8DhS
         164XwRKOqTKeENbrGUkniy36xrNizFEK8FmIDNDPPgVT6KAWJE0UTzx1eyn6J2cNYSYw
         DSvWo3rqMGgRX2ktjkYXJHE+n6ueFRLsk9YFqEykMFO78pK5XRnU9z9hMLlgUBylWLey
         zfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700506588; x=1701111388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ujELrVFY4be6CUqKjNRUfHmySKN0sInkgu1RJGqy2s=;
        b=xBYjqwW85qOERDE+KvkthDJHchpE7R/l7suUPSkrU9i57pw4WhcYujdzrZZsJ46Zd7
         m9BQqbh8POz5i7d2hYL4r57NEKLefe0hMXsPzclr8inn103HRu/vJKV1cBnW8rfu2YNJ
         Z6LSyCHgIeLwfvEhkTSjYEmRjzpKLBfv6AOg60dTnVuoazRvURVSDn0oK8kXFSGeIxZB
         FwnQknDqbouzXQlqwI/HTuZie4kOKrvGQ0wkJs8mXExcjxU+vO0Mb5ljGJUlkJ+p43jQ
         oaYi8e9Mq78nVtPKi1UD/46TWSIf8EIeqRr90lJo/nHxs/4j78MTmi1GBzJZmiRl8CwD
         S2Ow==
X-Gm-Message-State: AOJu0Yy2nkGxfWKyrdPjcoaKFFGliKRimxcmtPJvTJQTafPFeIQtebAT
	mlBu5c6a9/Xjp5xfXrYqexzFww==
X-Google-Smtp-Source: AGHT+IFWrMIJTDr7hYj1W0XiATUl7zuhTf4gh9X6ymwQzjZQ8RX9HAXJSPQR+7zZ3Kac/ke905vXiQ==
X-Received: by 2002:ac2:5159:0:b0:509:38df:1e77 with SMTP id q25-20020ac25159000000b0050938df1e77mr5924245lfd.10.1700506588031;
        Mon, 20 Nov 2023 10:56:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id k26-20020aa7c05a000000b005485282a520sm3412520edo.75.2023.11.20.10.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 10:56:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] firmware: qcom: qcm: fix unused qcom_scm_qseecom_allowlist
Date: Mon, 20 Nov 2023 19:56:23 +0100
Message-Id: <20231120185623.338608-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For !OF builds, the qcom_scm_qseecom_allowlist is unused:

  drivers/firmware/qcom/qcom_scm.c:1652:34: error: ‘qcom_scm_qseecom_allowlist’ defined but not used [-Werror=unused-const-variable=]

Fixes: 00b1248606ba ("firmware: qcom_scm: Add support for Qualcomm Secure Execution Environment SCM interface")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311191654.S4wlVUrz-lkp@intel.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 520de9b5633a..ecdb367dc9b8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1649,7 +1649,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  * We do not yet support re-entrant calls via the qseecom interface. To prevent
  + any potential issues with this, only allow validated machines for now.
  */
-static const struct of_device_id qcom_scm_qseecom_allowlist[] = {
+static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ }
 };
-- 
2.34.1


