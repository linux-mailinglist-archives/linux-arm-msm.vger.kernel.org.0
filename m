Return-Path: <linux-arm-msm+bounces-21734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A1F8FC70E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 10:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1315528388D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 08:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF02418F2CA;
	Wed,  5 Jun 2024 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nEsET9M1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCBA1946AD
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717577766; cv=none; b=gy2ASpeMEc2PJ9njNvVBPR+ktbAJ0xyRMYODahhLoIXRI0Q0nTnwEGnevuUvLtR683qAbjwGP94CYEcNiRN7hg+zHAdIoHR7/COvSlkMqnlR7hE4tEv20Y8Y9neqFmYo8RjyVJtp5IT9HprzzI1V0/oG/YnuKzUmBynv+iGcaqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717577766; c=relaxed/simple;
	bh=xOYeUtw/UrZkiwEhcQuZluKYKEI9dexCcW4rGGwOeHc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mK99WlOuOBmf3qaLv5rWxHzumSBUe6Kuq5hXLWrpO1azyeIqR2WfhqdyO8lQ5efntsSLAKsUyVBppZnSqeWJia8Qy/KY+inrQL+zncSR+x/FOehXMF9JH96zGIYtQypNy0Uok0rZqgObiRCqJLccU4/fsjrvI6nXf3rTHwbCLSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nEsET9M1; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52b87e8ba1eso7056521e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 01:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717577763; x=1718182563; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHLl/hCHdDCG5NBFj737FnwNcxJ7NpWDQhOF9GIyiOU=;
        b=nEsET9M1JQtWU9yjdArPwN4rxULHKjCfJsFAlk1T2gbXpo6g8SPqAmK6gOD8XNhhOH
         vmGBJjda6ilMX5jfb8bvhzijQ7Hr9p6TQgG+a72MrhmUPtnAUY8zlNrOBC9wTJaaOWU3
         tzvKi2FECxwchGuS9AfXvdhSy3uP6UzFUV1o1lIgOvG7B4ekgBO7BlR1z53eiAX7aq3o
         CmqF/uqQmXrlwZOiGAIC0IAowkCA8uX9mpiCuY73lIvQahCywv3txpQN8btKsn6JXon6
         3oRDsEAUirkqAe8okDhHwSKgr1Fw6WZRo7QCCO+iCUxFstWyqfvMbegvrniPTrMAyFyF
         tqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717577763; x=1718182563;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHLl/hCHdDCG5NBFj737FnwNcxJ7NpWDQhOF9GIyiOU=;
        b=Q/eHp5C28Ma8uDSnPSjlYnSLwKP3ntmBhz1tOqZg3yzVSf5Wn4uHiUg/RPEt4EVmA8
         brsHdFJGVhychSa54d1KZRGkVlyVqbiqBJJnJ4azZWja9kT3qPyYyeHSWhZPBHD1yMZI
         twrKhoB4ICjZ3pqaca6pj+d2/OkrBvwBlcwT6H1xdiDlT5G+JsCKlFrvn5lIz1i/WV8E
         DAlIBd/IcT7ngCPt35F8FLXwgeTeKB4a0K/7uHIVH8wQzQlD4rzPhvdhkjRsIMtvv6yS
         fHMk2hE7AagQCMr2ridPR4q3wNCgE6/vj1LHT8RaPinSxolpbNZflhEaAvTe9Hk8h7Gy
         QIjg==
X-Forwarded-Encrypted: i=1; AJvYcCXJEvC1dHxhpq6rv4TzEA9r+5AtywIi8nuos1o5iYp6J45yC+VSBFN8pKuP1r33z3HfhwSZR2pO51qK2WF6YlSOhTk0lPksSjDUrsfP1g==
X-Gm-Message-State: AOJu0YwbOYId1EHRCqY/UL+p6ecz61oRIJo1HFuDSEJIAJEQLk5P7xwm
	uiP9Fmr9lfpAa0cz2RW7ZQudvE+LxY0ZpZFbHzKeFcYXeF3AyRnvyUkMQKLEIJs=
X-Google-Smtp-Source: AGHT+IE1f5FanRJ1v9H2+kc+wOL32amVvO+x7fFrCJfbkzPiFrWWTdUh3tLFQ9ZbmhFVgr9EQfgPOQ==
X-Received: by 2002:ac2:5227:0:b0:521:e967:4e77 with SMTP id 2adb3069b0e04-52bab4e8b99mr1318178e87.28.1717577763183;
        Wed, 05 Jun 2024 01:56:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f55dsm1715321e87.72.2024.06.05.01.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:56:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: switch RB1 and RB2 platforms to
 i2c2-gpio
Date: Wed, 05 Jun 2024 11:55:55 +0300
Message-Id: <20240605-rb12-i2c2g-pio-v2-0-946f5d6b6948@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABsoYGYC/3XMQQ6CMBCF4auQWTtmOiAIK+9hWCC0ZRJDydQ0G
 sLdrexd/i953wbRqtgIXbGB2iRRwpKDTwWM87B4izLlBiauqKYK9WEYhUf2uEpAV1N5ccPVEjP
 k06rWyfsA733uWeIr6Ofwk/mtf6lkkNCVXLbUmKad2ttTlkHDOaiHft/3Lyn4F/utAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xOYeUtw/UrZkiwEhcQuZluKYKEI9dexCcW4rGGwOeHc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYCgiB/VtaFHXC/qtLOr4Qw/YA9dgjSlyStAZl
 fsirDvhCFWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmAoIgAKCRCLPIo+Aiko
 1SUbCAClRploP4ik86pltL/NkWfnLhFLBydG4je7rHAnCrj7FalYpiGDzOCGVUZ5NblS8jPCnDT
 QMW3qy9LwM3m38bf/ZiNKL7rvH6JqoBymyl1vl8We4zFJOhfto4S8zbLocIhlI8+Dm6bbfakAES
 7oF0CY7DV0WQD+0Oz/Cxg6qkfxEeSjn8+B4taXF7TY88QNU66WbH96+w4juBheovolOeHC/yR8v
 IW+JDB+1j/Rptvd1BhbHgF5XShrXpvL8JqSWrDGKyG6ryRuubRRobl0NQmh+xJHXnDpgXJ516r1
 mLFejs5CeviJaMvgrBU+E5IB2WATMpCxrbWipw86WLrkspVv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On the Qualcomm RB1 and RB2 platforms the I2C bus connected to the
LT9611UXC bridge under some circumstances can go into a state when all
transfers timeout. This causes both issues with fetching of EDID and
with updating of the bridge's firmware.

While we are debugging the issue, switch corresponding I2C bus to use
i2c-gpio driver. While using i2c-gpio no communication issues are
observed.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed i2c node names to fix DT validation issues (Rob)
- Link to v1: https://lore.kernel.org/r/20240604-rb12-i2c2g-pio-v1-0-f323907179d9@linaro.org

---
Dmitry Baryshkov (2):
      arm64: dts: qcom: qrb2210-rb1: switch I2C2 to i2c-gpio
      arm64: dts: qcom: qrb4210-rb2: switch I2C2 to i2c-gpio

 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 13 ++++++++++++-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 13 ++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)
---
base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
change-id: 20240604-rb12-i2c2g-pio-f6035fa8e022

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


