Return-Path: <linux-arm-msm+bounces-25622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C430E92B92F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22F6EB22C74
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464C415B552;
	Tue,  9 Jul 2024 12:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m2zmY/Vf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61FD158DA2
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720527537; cv=none; b=jfgBjY7HgqSzaaiu+Lq0TDTu8tuwiZ6OAKhJdXIZDsp5rOVd24ZZdsZVDtgB6YIixuiAOdaIprbSo5iS9oXD4Tpy4KjXb0BM0/T4s7nT680hzYjbFqz7IGZI4xkT7oxTMQOaPqVWd7HyRixz7lgGjZqeKQTnEJ66A/vvT7XtGqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720527537; c=relaxed/simple;
	bh=2y7nb7ol5yHvIHYnEo8Rlt1vj2/K7xBwxKBJztod+d4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aAYjCKOmZea+fPXHB0NqLwxtim2oMJnaA6HL/Rj/SRoeKp9sV8xWrGXp4hQkGu3lDxrOepjT0wnzG5RdWr1MQ8XrVrlKEg7nc0WVy0N5vkpgGHSSz6UGhN43nmuqcOo3C3chxwXEOqg6lQA2/HWK14RUcTpHG14vOgtwptPEOPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m2zmY/Vf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-36798779d75so4467218f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 05:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720527534; x=1721132334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+dtNPqMpO1JSuQuP+EiUeVQ86+1hBOBnH1yWFrsboA=;
        b=m2zmY/VfbQb8Da632sYuUKUceRoCFEHGX5DH7rCXI2OvW3ecX8A0rHGu9szD+vbatR
         nMpJXuGUPUnlyFDc8D7HsPOlNzA1TqEoF6du542Y8VSD7oBX+ixN8MXCCsYfX0a+vGMO
         WkwFnGGbFH8AjIh+UM8cYAUEhFJH0GeCsLl2hzP7Yw89h6VXs58iM8/xE1uUcJ/qSkL9
         6K3rO07AE3gaePVmIuKAksvAJnfLt/w41n/1O97h2hGOETpGM6hbnXqn5d9qA3wbS7mN
         PO6bA51x2pcsO8NRpERb64HfFHOrsafd1cXw1aTwoxplXXZP+ZUz5TeHm+jd1bwggLkB
         53Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720527534; x=1721132334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+dtNPqMpO1JSuQuP+EiUeVQ86+1hBOBnH1yWFrsboA=;
        b=qaGQEqCzGk9N5E5GCYlXdKOiwUchCA0V2KY92jc0FGdfW0RgPmXUZM0uK32usINoHK
         dEuUtyA3rQUMRCc3GXOzSOO6lYdWSPHffC1xZAnAcJeuSUNASDyizWxd56Ct0cJ7VVYp
         3iSr9gwiz7qeSwI3QaooN27cE+qTiXWL3+FJmnhNKv5y8ppvug/5Lb8paaJVInx5gT8Q
         5DVPJNvdIf9ph849DEq9HhHBd8K/DnhEX8ggd+gKEuN4mYBqSUpnjiscVYxgO5cMIinC
         ufVBDs5lBr5ENecgAyMLNBSbBxSuIB35PcZLH6verVE3TE5YUy7dJUSlkIiNQKRiViz7
         nidw==
X-Forwarded-Encrypted: i=1; AJvYcCXSlypb8qGW9YAXIyZ4tdduhp9LaG2sDvGiXCfqsX0gStL6cvgKJtZhpr7qqKCDmvBnrH2mQY391ygQMrBw4DqEZRdS/yrSLwAROogznQ==
X-Gm-Message-State: AOJu0Yxc4CUXjaInjuAq2zyG/EbdHgCGu1X2kUurTIElwHnu5LQaP9ZX
	vEnV2cBq87JESV2n01e+ImWTp4hy7WJb+agSGLrKEQIEsJYnOvz48h9iI2LV3BM=
X-Google-Smtp-Source: AGHT+IFweA1issX/4HQiTqhohofCoOEZBVGTbbhnNOb+nxx592TLdaUnqZj+a67Ky6K+2Dl2ZpPX3g==
X-Received: by 2002:a5d:664a:0:b0:367:9c0b:374a with SMTP id ffacd0b85a97d-367ceadc925mr2014606f8f.65.1720527534081;
        Tue, 09 Jul 2024 05:18:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c270:70c:8581:7be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa06d3sm2390574f8f.75.2024.07.09.05.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:18:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Jul 2024 14:18:33 +0200
Subject: [PATCH v3 2/6] Bluetooth: hci_qca: schedule a devm action for
 disabling the clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-hci_qca_refactor-v3-2-5f48ca001fed@linaro.org>
References: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
In-Reply-To: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=y4oPN0IOC//w7yzibHNZfMLbBW/mUsBkavbOtcL9zSQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmjSqpJCae7x7FrVb9GKhCI8aiIZDqi6smv/2Oy
 TCnRJhiqvCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZo0qqQAKCRARpy6gFHHX
 cn2YEADO+QDT3FIWf4bzh+JPwSy0rMQN4XWAUz37lis0Ug0ZO6xI7H8vZUipwOWWYPZWNtVVY6h
 lzMS8dQ177QIiwrQ7GutREK8L2R34RJ54q8WxNp44UR0DwByxg8TGXPQPlXmIZiFcSUnfASKXIe
 G6bVpTwZ+YQ9T6GTkWhxP4AAIlpq++B4mJOugt2sTo3OAJ/aPCeElG0Z21F3yFHSc4KLKMityxj
 BimREouOxh87iddSK8y9iTxwcoYKfgvjPU0OvHHz4SJTAuwJywGUByvBmF0oa0bNHGHGDgfdm0U
 Fw4gUoiMhyKzO3Xe1k3el0LwV19VwoPjCjiSNfpcAs0UvhgCBEsmMoXQseb4ZUcpiYuaikPXc6I
 VBrO3TiEg76J1XkdyWMEwCEfUBw/6gYKXR/gBxlHKv/x0yfsfma9QOnYSlxUVn4XhdrcXTiC+u3
 Vd4B2NNfgnvEpOkRzoI2WP1ZbeNqoxjCITI0MvxkGloLMIvlc9epbCMm0XRYoqHAcPsBKlHuSYt
 k5dzq2UNXt8W1gtKcUo5ieMZf13yCK5dqYnbEuR8Q8s2Hok3FV2Ifwc6eoZAUVOEFjYV/xWkpGq
 zBPIGlKwZ1lzT2wJ9NHTAQ/RzT1lsrPCaacCAaCVmMLiTXhHT606QL+qQ9U7cI858JMjnwweneC
 r1X2H6DXfBNPTow==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for unduplicating the hci_uart registration code,
schedule a devres action for disabling the SUSCLK rather than doing it
manually.

We cannot really use devm_clk_get_enabled() as we also set the rate
before enabling the clock. While this should in theory work, I don't
want to risk breaking existing users. One solution for the future is to
add devm_clk_get_enabled_with_rate() to the clock framework.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index bc6a49ba26f9..ace920261aa4 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2295,6 +2295,13 @@ static int qca_init_regulators(struct qca_power *qca,
 	return 0;
 }
 
+static void qca_clk_disable_unprepare(void *data)
+{
+	struct clk *clk = data;
+
+	clk_disable_unprepare(clk);
+}
+
 static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
@@ -2434,10 +2441,15 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		if (err)
 			return err;
 
+		err = devm_add_action_or_reset(&serdev->dev,
+					       qca_clk_disable_unprepare,
+					       qcadev->susclk);
+		if (err)
+			return err;
+
 		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 		if (err) {
 			BT_ERR("Rome serdev registration failed");
-			clk_disable_unprepare(qcadev->susclk);
 			return err;
 		}
 	}
@@ -2477,15 +2489,10 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		if (power->vregs_on) {
+		if (power->vregs_on)
 			qca_power_shutdown(&qcadev->serdev_hu);
-			break;
-		}
-		fallthrough;
-
+		break;
 	default:
-		if (qcadev->susclk)
-			clk_disable_unprepare(qcadev->susclk);
 	}
 
 	hci_uart_unregister_device(&qcadev->serdev_hu);

-- 
2.43.0


