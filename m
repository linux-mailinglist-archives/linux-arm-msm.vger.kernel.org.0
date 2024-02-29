Return-Path: <linux-arm-msm+bounces-12964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 180B686C9B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 14:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 473AA1C20DB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 13:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADF97E11A;
	Thu, 29 Feb 2024 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BzdI+pvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56696F52A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709212035; cv=none; b=ps5cx3bLqZkEFZjgrQjAMddbxyqIgCKL28iQ+aUfixkhPEQC/+Ei+udoEt7gwhCHea9K1YUHYIug0oYSXFOq2oSKqhkVol+tpbGEzr16wWglYBY5T6babXNKqTbtXawgqOPk0Fvk9prcaQV74SbzXB4u2O6GaaW8rMelzRuUoWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709212035; c=relaxed/simple;
	bh=gUhmXpw+40NNDKZNzyOCoORFZuCEOLT0lZh0KAJVHT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qzr+zbf7L5iGdlkun/VQAIH6ZGWn6NLSuI9IUM9R+gGMQ7BFFGWARniPcRlQYtTYHaGceFTbUh5CWqwngssABXMDWLZUmMX0/jfhwC5l36bADMFeVfFSifc5KozUUrXR+UXsjRZ5veuOPfB50m7yW/5OwO4rELAt2cxsY/99BAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BzdI+pvJ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d27fef509eso10680931fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 05:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709212032; x=1709816832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YT8Y/OHXUcXm+kdXDY4DIbb1yI62HJpje5eqK4s6t4U=;
        b=BzdI+pvJHJqtqNkMytd3tkzUePhdhZhPQV6fx37Iva18TGKJ2zVUmItvJ1KWYj6Ydi
         bLZqllFPcJzH8zgDfUSgqn0ivbQl/FUeZ9ynRRmEBnNd9tcHryRVEIOfICjbS1tewIoD
         YPpIjgHgqKh8JWlrWXl9mVx59djfjwKqSkMGvaRXJ0uUb0hZz/JWRHKatZ2jy+K32ZY9
         7p6YYD+U0L2NeO49pMQTsSaCekyxEt/uihLfYPSJrDB+lcbzv0RIEBLARJWsK62CQt0X
         46xZaaU+g9G2LXQWeMDJt99SyzqtsRK9yfvUT4t2EK32IKRBaQ5CsdzD3jpp1Tl0P/EY
         aRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709212032; x=1709816832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YT8Y/OHXUcXm+kdXDY4DIbb1yI62HJpje5eqK4s6t4U=;
        b=AqBCQ09U3NUBit83751A8Vh1Te/1w85vOsrZ2eJxtFQUt6veVYMvPxpuiVTsxirxMB
         Un+kd8WFV6P0olmvdASm/nMjIO1xan94BPxl4ztPnQV8u2mBvWley8jQdSnQS/oRjo2t
         ZXgxm2tf5zvgjmF/LmDQqgZlmRBgyeb9/FZPY0z8RiMuT7c26kaFncDJRN29jZ1b/FGD
         A+d8iTPTFeXaNQuAVB2w0P2HG0JWxn4JrPIZwMA3GM5IENiNKk0kq7i8Gv300KZyFCr+
         75EmH5SY+CjgRcaCxjEdCr9G+rIpRpGBo2hg8KRtEn0Z5CAdBvNqRYiACONlmI87RYkm
         k0Jg==
X-Gm-Message-State: AOJu0YzlqKxOfT/F8tY2MUL3r+ihL8x9EK2jGsp2o0xyAHXtPet6bK+n
	bnRiKM1PT6KTaJyZ873MLcw5G0Gdwx+5XaiDKwDlN+n5VE8604y/TtyTPdd/dqN4/0Dh7QYN157
	fPhw=
X-Google-Smtp-Source: AGHT+IGI0oRvCFt0+el7beJ3sqJpYurlpJRXVhgZ8B7Fm1nl0mXZqOm336eD0Jk9r0hr/gWwN+UFVg==
X-Received: by 2002:ac2:5f7a:0:b0:513:1a44:9a47 with SMTP id c26-20020ac25f7a000000b005131a449a47mr1225576lfc.21.1709212031850;
        Thu, 29 Feb 2024 05:07:11 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c198700b00412a38e732csm2071473wmq.35.2024.02.29.05.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 05:07:11 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 29 Feb 2024 14:07:01 +0100
Subject: [PATCH RFT 1/7] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Add
 mode-switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-1-07e24a231840@linaro.org>
References: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
In-Reply-To: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gUhmXpw+40NNDKZNzyOCoORFZuCEOLT0lZh0KAJVHT0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl4IF7kYVKYuwXLg3gaQZ28Ht2PLc+SXmc7J18PML8
 11ZSL6iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZeCBewAKCRB33NvayMhJ0YGcD/
 kBQWdidfAXzh48Vrdai5QHAlUStkyw45ln9BSqmR0P6Wb00UqLymCONEjPKSgM8Hg2jxxUUpdUfNv6
 75ZPLweTyFFPjVzqmY5SnhbFryhkkYAyyHjRfO8XvILuHpBxW/cdom8FiU/dNrticUc7LhkjBIPqmr
 x/nCDnb4kOgXl1lZBiSQgNrySA3FZ15Fw57yTS3QOer7+cpnJv1yR+ZNUBZzVTDPIBCmOzWdWIxE35
 D2VkUz3BddkAWIq/pgmAhRdvzSrExJxFaX+fOEWzn+licnmR0k2F7+JCCQgjRFUX096rWbrPfkS9dn
 H0OC/uNZGMsEdngZYO7E9gf60oYqIOy+JtdyURs7x8WviFuf4tmjbzfEKRPo49+JYs9juh6WcuMA5v
 EB4OZaD96YUJ7QkGHzuT2H7GogusWJUp87dVFhKJkcmqQ28pUttZ75fOGZ1DJ5P9zHWQbDXNs/Sg4Y
 eKesY4z3/n7bIcbJ/80u5hJ3VYQUa0k8fOyfhXJUuWage4DB+blWUjKhom2FFftWLGBl44WI+gbFP0
 HwO5ut9YFkIPvZpBAtkCv8IuF16O5JNxih7+jVJgwYj4v2TBDS8bXrvFLnHAQ/9Q/4MYuZGo9xVxvo
 dwucpiW4w5+FRfn9UZUmhgkPXf8Dc7IB0ekRVrTX/aE7YP0XTcQ22PluEFog==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The QMP USB3/DP Combo PHY can work in 3 modes:
- DisplayPort Only
- USB3 Only
- USB3 + DisplayPort Combo mode

In order to switch between those modes, the PHY needs to receive
Type-C events, allow marking to the phy with the mode-switch
property in order to allow the PHY to Type-C events.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 2d0d7e9e6431..49c6539b9df0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -71,6 +71,11 @@ properties:
     description:
       See include/dt-bindings/phy/phy-qcom-qmp.h
 
+  mode-switch:
+    description:
+      Flag the PHY as possible handler of USB Type-C altmode switching
+    type: boolean
+
   orientation-switch:
     description:
       Flag the PHY as possible handler of USB Type-C orientation switching

-- 
2.34.1


