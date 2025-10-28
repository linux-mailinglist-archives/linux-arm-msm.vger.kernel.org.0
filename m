Return-Path: <linux-arm-msm+bounces-79224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B74C15A84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1CC1A547010
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E2D344041;
	Tue, 28 Oct 2025 15:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UxxlHrae"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1479934321D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666811; cv=none; b=XWmXWSJwYzc7rDoJJ1v2HpTUdZxD9VjtHEOyWQ/x/CNhc55NwwH02HQVDTWqja3n4Fv8lOxJRIGT6Iy7WdOTm6cFJCR+ggpShtU7oQiLZUrqeuC6ZDKuOxk854o+bMUv7CgnOf08nj+naHzps2LLYVoaMFZ7Mvs6hEcmWwPRRjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666811; c=relaxed/simple;
	bh=AobRNxgST8zQe+P/0s/nrftHbBH4Gr6BiCzGVmdCIbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XPMehVcFgqznCns+XBnV9mkrw4glMMwZVbYg41ihJX1XzXo9wrdpUYZXcJzePgDa8J1OuK+FYqibtnZfuHP0546ev3fKlFZ5M+hoReweCybr4L+MWx+vY5HFaks14lY7rpmOd8R1K6WxtDI/8PfbASVNF1tPMlhn/JQyc3CEG+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UxxlHrae; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-40d0c517f90so501598f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761666804; x=1762271604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXDC7M6kaxSAFbWMJYcixkWhlLJArFQmLx6hgFHXx14=;
        b=UxxlHraeHchuNuVy083vve6bfyMYIr9qwmjxJTL+3hspt7P4GdTajQSJ/JgMFT+ZrC
         uTCp3oabe9prNEurPYfixSOYHIMZQDXJpeCvGkxYBmBaGBtKRwl7uTgCAAniMX3XL5bP
         Lus/FdaAND+k71d/g61nMZWIVPkfRo5/+Vb18EeYe+80npNQ0S85E+MC0wFRHEz3BD8r
         t03oQZ2g6taYX/upmiSJtlYqRU0u0Oy+/BegpXFJl6MjNVQLoWJk2MHUjk/AMaSYm2fW
         w+hnMlNOukQy6vni9H5uy1tsC8RMcN15pOZ2Fhe2gRBkqMnIvzBqKvVxQOqsLA5gjWIJ
         yPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666804; x=1762271604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXDC7M6kaxSAFbWMJYcixkWhlLJArFQmLx6hgFHXx14=;
        b=MHe+aaCI5NDiLBecSNIuxhtUn+eTuyJaNGHyMetbRocQWk7wqztxlMirX3D1U2r/H6
         0sdqztWoIwhBtOJZ2IgW9vAj4D7RUsP2iO8EloZBFnvbMFVLai9AcJqA7025MCuLy3pO
         V5JoGEPXd1pwDynG3M5GGYgZiOj4SHLgTH+95CZb/HT0kOPAWuvAS/uRgwhaoLHvOCdb
         Uyn/XOjmZ5UvUDjNapRyNsOQFlH3haPmJ0wwd6SnlGqdOcG8FHawrwWuORJvGH2ate28
         kWs3j8Eh8+ghX79Is5xnORQNMOQa9fuFilU5dKID950f6Ru01JjcXZJaIkozXnGB2pMT
         h9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXroMCLea1swg3arDGYWtMIEuUabHUnwYWdMZ2M6cH5weJ8djK/Br5Gx4zB396OdqxiWoypqEhfgvpoOFLK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe1mjSGrpB6wwMmmP0Yhct//GiQSMRc+0BdpbGIvU2S267/IDJ
	sAwXL3mi2Jkp/YEWN6IqpNB6hUIhCsPsZttS85oHdkwqkuxYhMFPdl0a/sW1nz+gRvk=
X-Gm-Gg: ASbGncsxJZ7GMd8FcYf70T/qQ457mHc6kvyK2RwhxZcUpyS288JN0KnlU+18CQq+zVW
	Rmymzo9qdtReUdmwx+kru1yD8e7l+HaYIgO6Xq2Klj/lnboQWtUXr8/wRJGG3Kxy58PlJLQzvf9
	DTJTijGdjyIijxq3OoFEGEGCk6yIjMH7Dbm6+BPXc0Ni/5irIuHWQsq/yUuf0ku5oF5Rc8KSmcS
	VWUPVp9wmkIB1BsjQtVUkZpSGkK3VhjbYxbQVxl4u2dajcfvHD+mblxpjcB91qbfaqWwe7gXD5M
	MB0UcFkpyrNhX7y8x7vMfjfoFI7zbVuUyCqh3trFHZevZGYaz/lJik289l4TIap3tGKuHykYixY
	ZQSnuAkCM3BxWcSxL19EGsnhUVcIGvpyYjsN3jpTQbAYZO00fHDtgUujZFfKCEZegupGXBLYmZ/
	Mueb3uLIhN5GQ=
X-Google-Smtp-Source: AGHT+IH41j4JtLznpnUlgn2fs08an0M9cSbhtKiZFIJBMeH8gjS49gF30paXeW6FuOaAsnvR2KptlQ==
X-Received: by 2002:a05:6000:4287:b0:3ea:4a1d:b542 with SMTP id ffacd0b85a97d-429a7e79ec0mr1797115f8f.3.1761666804285;
        Tue, 28 Oct 2025 08:53:24 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b79cbsm20717047f8f.4.2025.10.28.08.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:53:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] Bluetooth: MAINTAINERS: Add Bartosz Golaszewski as Qualcomm hci_qca maintainer
Date: Tue, 28 Oct 2025 16:53:21 +0100
Message-ID: <20251028155320.135347-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no dedicated maintainers of Qualcomm hci_qca Bluetooth
drivers, but there should be, because these are actively used on many
old and new platforms.  Bartosz Golaszewski agreed to take care of this
code.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marcel Holtmann <marcel@holtmann.org>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Link: https://lore.kernel.org/r/CAMRc=MdqAATOcDPhd=u0vOb8nLxSRd7N8rLGLO8F5Ywq3+=JCw@mail.gmail.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
Don't orphan, add Bartosz.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8abdc0e50699..8a2c5fb0ba55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21145,6 +21145,7 @@ F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
 F:	drivers/net/wwan/qcom_bam_dmux.c
 
 QUALCOMM BLUETOOTH DRIVER
+M:	Bartosz Golaszewski <brgl@bgdev.pl>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	drivers/bluetooth/btqca.[ch]
-- 
2.48.1


