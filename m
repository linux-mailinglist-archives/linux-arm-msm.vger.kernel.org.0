Return-Path: <linux-arm-msm+bounces-32028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A079297CCD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 19:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D31F81C219A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 17:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72CB1A01DF;
	Thu, 19 Sep 2024 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ek5fr3fT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CFF19F479;
	Thu, 19 Sep 2024 17:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726765266; cv=none; b=mzGzA9eOo5G+ZEUAIge/QzYOcqQS2g4JejlJTKdDMXP5rtkmvIGiToIYNMQwObLtcteMhxmQTwTUc7II2JKh17nkbfPkyqkf7QWiIm+Jy7SAXwQLaeW7KpNV2PUkuBK7gz0or06BGWGghEGCklvnD1g/pJx0IT2CmHKbV6QLKbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726765266; c=relaxed/simple;
	bh=86lNDti98B3FtBNrJ8VtcyWjNgvm4qSYF5NMuXt4o7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PzyUaKbU6lO2KNUX1GX8UYRorCK2uoPCZRX26rqrslLEnOT0JnofHWiiymlN9m9TdpEa+fvQNDJ5zS5jgWygmhBXK5keyl4F8ha/07CWSuUVk6tWvQmCsnvUpBRYyOD12a5o1kTnplluWh2LNqEe5lWREDvJkqEaxE9ikohnYYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ek5fr3fT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374c8cef906so805447f8f.2;
        Thu, 19 Sep 2024 10:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726765263; x=1727370063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wbVzVuP2EQRXllLbnpIyUhNHn2iGNIIzJzj2vDJt+E=;
        b=ek5fr3fTlQ/6N0NBS6p2C/Q0cWckFnpttwBXz9iT3g91gvn+m5dee3M+lEq2Ji6MDl
         B/g85ekFhlKU8K+VYCPzPXProUd2BM7sHbFbiodSHOxl3/XWIJRAoq+hAv9t4V4dLVHZ
         2KI/SOZi3Fa5zqJxuPfz+l9qbieOfxI2kCr8142Ue5Q+Iq5kXRxMCdULCULOV1c+NdfD
         b7PGiuotvADSpVT9uhMnoxGaxGENooal2i0n6eX+yV4fYkqo8zaW6I2JdlUhap8+YBU0
         CYwcdR6CBjfr1DZ6sTP66oR2haPbo3YXyjRqx0XfDksyKrrE8lMv59WbOixQSQMrbwh5
         bgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726765263; x=1727370063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wbVzVuP2EQRXllLbnpIyUhNHn2iGNIIzJzj2vDJt+E=;
        b=e5A23CQylCxjSoGjBx1Wtk/fTa251VsCyXZtGQYxeGUMWx/ywRjsEseHyMf0UHKY/C
         RCc8E1uOuYkW2GgZyoO/DQab1zg1UoK7NyzvjjPZeIB3eHex84srKLZJawysLPxEYIdf
         bocx0FAOPD+j/bdj9Vm1S5PafyUcpXrS274U7D4Fk5ipseE6+VQmypOzE8kBUoZXZzHg
         q0V5ybQ4yBFLEdqA3hZkJ/J07LbWlvHYOUhcpFkllFhYS+82fsA/69m9Ayhzsv8vXJZZ
         qLN63u7iDrlEQH1E7/ukeP1hKYUAj2jfLj9mLwwemSBcIt4saAnXMRqPpe7Of+BtNRf2
         Uqpg==
X-Forwarded-Encrypted: i=1; AJvYcCWTC6hGYQteTROckdWnpkC8SmpSHuzFvz0MUanUZfcygFWgR4zGQtlAnAlFmbKm2JGwtDLIDzlFYw8r@vger.kernel.org, AJvYcCX0TWJpm3nX0GH8VO6302BFkLW5q+j3yfYXAG2KNbreMaJxswvW1jZcemni+OPN5h7amUzWe/3c1u371VXX@vger.kernel.org, AJvYcCX1zXMUXPmPHxqp/y4cmTJpWevT4mI9rQFJWeGYQmLVeM041bvRI0z8+UM0OX9FXA8JojezwFS/jrdNvamgKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4UJpegh87rHH/+KPc1iYLonDcEmLS3TT/O9IfnbwIL0ZzcFB5
	GChDsdxGZH0fPpwVgygSmX+eJgbVMuT3cj3xyAc9fMSgrwSCXiYqze3LUMCI14125EE=
X-Google-Smtp-Source: AGHT+IGBRrcCyd5ZtNnCNeiu5QuJnml2odfbcrl1k9UTjOBFCK508r0zqaUMGUg77GNESKiavT4vdQ==
X-Received: by 2002:adf:efcb:0:b0:374:c515:4441 with SMTP id ffacd0b85a97d-378c2d728d1mr15219972f8f.56.1726765263099;
        Thu, 19 Sep 2024 10:01:03 -0700 (PDT)
Received: from localhost.localdomain (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780dcf1sm15469282f8f.114.2024.09.19.10.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 10:01:02 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 2/3] firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345
Date: Thu, 19 Sep 2024 18:59:33 +0200
Message-ID: <20240919170018.13672-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240919170018.13672-1-alex.vinarskis@gmail.com>
References: <20240919170018.13672-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..5d8afdb3b6c9 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1731,6 +1731,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "dell,tributo-13" },
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
-- 
2.43.0


