Return-Path: <linux-arm-msm+bounces-68394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4844DB20D0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 17:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1E584202D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 15:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93AE23ED5B;
	Mon, 11 Aug 2025 15:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jL8L+J30"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2A63B29E
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924654; cv=none; b=PLX5uKyEeLp856Ujy9y4FY2YVYfAl0fBXo81ntEmdB5H7SRATAO8YjYN0AgDCVBaSKLM0ofEQ3vS5CR0udHSCt5PW4/hFvO89kD3u4WTwHktnjkmgrCMmq88S/zXqOhNhzUuDL10Llys+nQ6p+jko4FyiIEQyr1V17U8CpZgQiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924654; c=relaxed/simple;
	bh=go1LK2KwIv9bOBtJoPVqpan3/GxOSDQsRCCrqOTX41I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kavPTCve5fZYGNCpUEaEbSKhOCPTz+K7CkCi5eMWg4tKgaXcKU8cfuXJ2QMWGxnuXRUs8SHseu8dtAmT6mD+lwx0e7NAFYBXiENa2Q+rXcTfX5PJCcKMWvjFuUYHqPXC8cgMxuPTCVTWkzZGOCHxgdId7p1VX9hqycOhLdPH0F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jL8L+J30; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b79bddd604so2597591f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 08:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924652; x=1755529452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5RlVEC+aTLY5+N9Mh6FGBCNE6f9ARS3XfPyHyJ93cc4=;
        b=jL8L+J30UIefYSD7OQpysfjUoXmu+NW6vsSl4+tQBD+Uz0OLVOmVa1/eYtAQ1ciyc2
         D/75x5tD4VP4MuRF3gSPtCArjhreVrNkkziUY5iAkHA+66TD6gnpb+UGWdHPCQnJFQWb
         BvoPDrRFnKU39JhJHA03vRf3TtfMd+6hyF0tiUBEFsBaN+LKpsszf2jF/708/YArooPG
         u2ce4kYMzXJrhuIQkPdW4bBoXjFjI6vcSkDtXcWvLXmLB4kL4Kl6l+DvwrQqKsMoVK94
         xmizRMU6r1FNVAbX6fSdfYfOmPtRrf8NGFD+tdzo0Qd0sO+8XFu5Fj6P+Ih76pk6Omez
         FSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924652; x=1755529452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RlVEC+aTLY5+N9Mh6FGBCNE6f9ARS3XfPyHyJ93cc4=;
        b=Ly1XAXtESEuBQmjT3SW/tfSqbNaq17zUmj4IFL0YNM5Rr+HKtdmYBNYiS1U2eTxysj
         d+x+r7/oBhQKAqLf56da4EMDiM5CjdfdYJNXWGzwFutVc51v2OQrMM51w1iSMbJ9vZcd
         fJE9WBO3rWoOekx07+oZoe0UYNSYCmdU+nT8L31lFpkJTCP38Bl7hiADdvSMONTmLWRn
         taldRTIQd9oAC50OY+AnbZH0Ud40fO7fNPVlyDeBl6jF9Hws6wsnK6D6bsvM5lYk2MAw
         +ZDXSS3PLHtDC4Z78KobD8XABQm2dNWY7/EslhFvZqnbjmh9PmpgvhRONxMd0Ff9Cv+8
         pViw==
X-Forwarded-Encrypted: i=1; AJvYcCUvctH1go2NokvkSf5VQSA4FZ84fqL9/3aYsH8kz3/AwbdQTForKKuPmRhb7ekgnDWX9f/gniQ907evJyNK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh52kmC1xUyekWB2kMWErA4jZ9YYws/BbnBJF5JRny1pUwRYOu
	61OMiHsNRLoGia442SDWTsasXV62mMP2v1paIXD53IFMPBXGATLIkNZtCZpjnCkwBh8=
X-Gm-Gg: ASbGnctMwtzp5SPYUUt/85u4Re227BGr3HJGi8DQYMv9qdxZQNlynZJ5C8jmGYTDQ7u
	avq+KdQm1xQhnW1tculU50ea8Ef/o90kNMOsF0fxvH5vGSTUJO0quelS4ld2ZEDiFdh1yGjSxg9
	npquAfpZNQsQIakV1Qo+yseTlHYzZ03yCnCwTiIojhxv/Ghkj3l8s5DvYog0/xtH0KIijbh8oqQ
	7zZlcxLl5C2GI2RLQkfwfYzLTUvisF14NuYZucuWeg1fj8igTzRIeR/Eef3hYpybDNDFBjjT1Bz
	+enSwdgDm2FZoP6z7OTD3qCCfZZCFrue3VdKagIyKLFSTBPRNlBx82Y6C5hN1IUksAx9EZgzhNm
	uz1/g18UZ/tZl65CWqxAEi/VV
X-Google-Smtp-Source: AGHT+IErrHO1m9HgaSb9y76gv3JeAANqPlGpoK5F8aU4R+7lrtTdLrB7aKC4QbEySQ2hh4TjE9oVHw==
X-Received: by 2002:a05:6000:4312:b0:3b7:97c8:daad with SMTP id ffacd0b85a97d-3b91101718fmr36718f8f.55.1754924651630;
        Mon, 11 Aug 2025 08:04:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf956sm41850591f8f.24.2025.08.11.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:04:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: Shuai Zhang <quic_shuaz@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [RESEND PATCH] MAINTAINERS: add a sub-entry for the Qualcomm bluetooth driver
Date: Mon, 11 Aug 2025 17:04:00 +0200
Message-ID: <20250811150400.86926-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches modifying drivers/bluetooth/hci_qca.c should be Cc'ed to the
linux-arm-msm mailing list so that Qualcomm maintainers and reviewers
can get notified about proposed changes to it. Add a sub-entry that adds
the mailing list to the list of addresses returned by get_maintainer.pl.

Acked-by: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Resending as this never went anywhere. Rebased on top of v6.17-rc1.

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa45..4663146de10a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20641,6 +20641,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
 F:	drivers/net/wwan/qcom_bam_dmux.c
 
+QUALCOMM BLUETOOTH DRIVER
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/bluetooth/btqca.[ch]
+F:	drivers/bluetooth/btqcomsmd.c
+F:	drivers/bluetooth/hci_qca.c
+
 QUALCOMM CAMERA SUBSYSTEM DRIVER
 M:	Robert Foss <rfoss@kernel.org>
 M:	Todor Tomov <todor.too@gmail.com>
-- 
2.48.1


