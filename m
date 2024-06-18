Return-Path: <linux-arm-msm+bounces-23013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A090CB05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 937731C2082F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 12:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFA613C667;
	Tue, 18 Jun 2024 12:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H+GjLnDP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5719B13C3CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712098; cv=none; b=e94YztA/o9+8A4iM5dAcpCEhSUL0Jt1X3U8qabJxYAQOphEm0TN2CzrfAAEAPKpMIFACn4arLC1dR6kgQyPP1l6Ce7T7aUYvH+9NWTeyw9UQqDjh1Nr+cZ8m6HiFJsEg+3O5b1G+aP3U4cO5LLouwSojqLQjEERepkO+5rS8qbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712098; c=relaxed/simple;
	bh=E+n29sN8P5AtkOG7yLFIflLhEA6KBCE5a7tUsSeMhLQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DgGcqWKK8Cj/5xugGO3VCcHjGAMMbzaP00CKsyyygG57v5WQaK0HDwBdqS5oq4jwwCqPxfA0q3laWbk6UrO20OFRwiYDkhmmGTjOfKxR/D/rQSd22baqqrTgPkVqGIwU6QPOFD4wFWLGE4VZ/Za5EljomN5ZOMPcBxJAtVKbOCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H+GjLnDP; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57c714a1e24so6042315a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 05:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718712094; x=1719316894; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MsU2v0wJVmYuApk1E+Da8U3hDf+aDRCuqM6AXndVSqc=;
        b=H+GjLnDP4Ehx0V56t+KeGWNx6E2TG/0BoMXTEqnns7PLRPkSolmtzsVmqWeRZAnwnX
         W3FaPCDUWkSuGkxGh9RHO7NCETIr50Sy5ZJmyPBK20TdenqlRpyXDraOThy/tvAkjd7E
         iPeR6U/i5RhONf9fHVYoH331HV9nL4inJDAahVKbDY5JR0D8lu2NqaxL25/KPsrt/Qwu
         gG7DH3YRhIdaxwBJRmBc6zP82jMLHqozVwntQ8Bt6oXGpQ1K/LmOpZkm0siBK9q7oRVu
         A4R1eR0lV3pZGxr7dfdHeJxpqPgLwzP0TMgVazh6yVrnRbS5eNOBtL4DliNrO8SNOvE3
         4F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718712094; x=1719316894;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsU2v0wJVmYuApk1E+Da8U3hDf+aDRCuqM6AXndVSqc=;
        b=CiRgS2F0VyW5bYlcPTjRH9SvjlxpaYhRrG53V4siSkgHaH/JzuqqkQpQCLhduWkjRA
         0Y8YjrM65Uh1EHrYRFHEF2zbIsdfk6kuvSkF1i9e1jtSoZbTTbtq+mVR8TvRKoLqJghD
         2zSNl6UbKKMA5v/YwKSfVNcyM/YrBwRT4SE6jW+YWDSZpdq/EPLt6u+PayQ5duuhAGQ3
         IprLSm21lfc0WJxo2tjB6f2U1/e2Kkm+T8Q/VJis4B7RhzAAJOyeuU1xOWq7p70sLHzT
         MASl0R0QYfFsCSHBVyji9tLUAwbKjPsTZHFyThaxJWkQk6DihffIzMJtdmNq/ExXAcdj
         HyQQ==
X-Gm-Message-State: AOJu0YzKPvB4dcg5K9msyMoKnUtZh/N5jBT5GWDf3kf+AqlO+jOVOOaq
	DDdvkgcThZbvGVdwtTiMZ7a+NEI95A69MoAWagOoZtpLHNqrS4tmJTeISlMZgT8=
X-Google-Smtp-Source: AGHT+IH0b8oA5xMFYhzt6HAcQqpSKpHgFsl2/nwBFkxeCKNkT7og4BH3dETMqQIucEPQvIDcNeEx2A==
X-Received: by 2002:a50:8d4c:0:b0:57c:bd49:9969 with SMTP id 4fb4d7f45d1cf-57cbd8e73f4mr8093550a12.39.1718712094559;
        Tue, 18 Jun 2024 05:01:34 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cbbb5576csm7062638a12.89.2024.06.18.05.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 05:01:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/2] pinctrl: qcom: add sm4250 lpi pinctrl
Date: Tue, 18 Jun 2024 13:01:23 +0100
Message-Id: <20240612-sm4250-lpi-v3-0-a8dce28f20a2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABN3cWYC/22NQQrCMBBFr1JmbSSZtAVdeQ/pIonTdqAmMpGgl
 N7dtGuX/30eb4VMwpTh2qwgVDhzinXYUwNhdnEixY+6ATW2ujeo8rPFTqvlxcob57H31utOQxW
 8y6S8uBjmXRGPO30Jjfw5EncoCENlM+d3ku9RLeZ4/gWKUVqN5hKsJRNCT7eFo5N0TjLBsG3bD
 1YRQry/AAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alexey.klimov@linaro.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=913;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=E+n29sN8P5AtkOG7yLFIflLhEA6KBCE5a7tUsSeMhLQ=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcXcdNw6jct0B3z1KZuCHHH0cAnrZAiaogX0dX
 pSQmtRK5OSJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnF3HQAKCRB6of1ZxzRV
 N0iOB/sHC+Kaxf5HYXWOMmSear72SxkWL7t2ACKmlj7q2swijawD++MkwR226FHcnApAUYdynMi
 ovZOaUZzcJEMPayKV+eM16IEuYHTZllUgBxX6UEsPp/LzrUQBwcxepLDHx8TzJoJhCOeoR7syNF
 ZAyDgQ7cKBzpm6z3/u2yZVH6hC92kqff+LE/IeSJiOa/Mirch85MZ6/oMs5tfIcwypw9Evr9fer
 maehiD8PHTcTKE2cRTylwzWCE458vKAYaDSjAwHEZBpliJuz2Yvjt/zSG4iNldc9qPaomiAX2T8
 2IXUqt2bXDUDrmRa/X088DfK9/4vBw0uCUrXZB123I1l8PNE
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Add support for sm4250 lpi pinctrl.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes in v3:
- updated dt bindings with suggestions from Krzysztof
- Link to v2: https://lore.kernel.org/r/20240612-sm4250-lpi-v1-0-f19c33e1cc6e@linaro.org

---
Srinivas Kandagatla (2):
      dt-bindings: pinctrl: qcom: Add SM4250 pinctrl
      pinctrl: qcom: Introduce SM4250 LPI pinctrl driver

 .../pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml     | 121 +++++++++++
 drivers/pinctrl/qcom/Kconfig                       |   9 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c    | 236 +++++++++++++++++++++
 4 files changed, 367 insertions(+)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240612-sm4250-lpi-b1ab26b3b050

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


