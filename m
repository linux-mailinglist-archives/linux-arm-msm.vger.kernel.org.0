Return-Path: <linux-arm-msm+bounces-56374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B03AA6011
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 16:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DC081BA79D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 14:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88471F1513;
	Thu,  1 May 2025 14:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUy7c6o1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EC219CC1C
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 May 2025 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746110017; cv=none; b=r1xp/DZMnN4teIDbyvzsNzbmtvMwIDPGs2x7Z/aIC9ZY3OVLlrPUqba0fUkYt2W2AdLYxXnLQlqaFx7Nvwn+lbQgAbA0Wd4zTLg+xuBzKF9bl5UAPqWp3xZgqqVq69HVw9X1Rr7E8roX99Ru5te0ucimzjar17mx+3mpCPNoAGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746110017; c=relaxed/simple;
	bh=bT3tXssg6ljHTYZOaPjPGNc1RzAsrRKhBsBNi8I09cM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=trWYjMUlpNJwZ2wkcxLjUER8DzAGuI3YplCn1Nl7vjQ0/KPjw1r5KvDR/Lj7mzWJ2QusHf6exrzMg8YrQ11AQG8r4n48VmJiUI6RHIEnL/xbeQzmw9Wvmn6CLASkzKMOTYUX2qEc2ahIHIru8j4kFjZuSPgx25jHIGpG+7Kgu2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUy7c6o1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso1323995e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 07:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746110013; x=1746714813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g65zjmvJFausBkB6nJxIUNRj97LVqw2lVuraVtSlztM=;
        b=bUy7c6o18T2Nv8DiCTEqMwrnwAne6+mwwRh+jq4jL1uLgIqzSOMFoh2PWQWNbDuivG
         qnPcOEg+4jsQ3ayt2WexdnW5I7gMRzmkmT2KXTPtHrw++HaapchayObgwQDHf3uzzkcc
         NS9LRZf4JlC9R/APCWbAQ6BLWwltsFA1lgqbSEKLfR3KPN1O8CjWtQfAt4S/6hnkLGcd
         5Gpzltk4Ax3giaqfLGWprR6tK+sHr9C7BhcRlIEdSWEJBcyp7W0w7MiBxoB5td4NZ0Ws
         ILvfnlyRG1eemZHSQofn/AwYAEY8z9rACfPpORLcioWrb8JqIOfP2G/KB7BcW5s4pRUc
         ALMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746110013; x=1746714813;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g65zjmvJFausBkB6nJxIUNRj97LVqw2lVuraVtSlztM=;
        b=vACDgiXsBl6YyoDifX//3etBVCrQZJpfUqk49W1AgPxrwfzkKaPHPuzWbIHIwIOQrG
         94usk4JgTCg49Hb/q7tuodtK0E6TpUI3Kys10+HnXhcggvl+55jUP7Cn4jiOzIqF7hzQ
         6nmTQMn2AJ/4fpOvkTVkVS7NfrzvJAk25KestE2QoFwTSTqFsilzgqjoo+cxOeM1Jizr
         SraMAshJkW7c7/+K/sfysVOOB9mfWhTHQh4EQdD87ddrLpCVVvFl9GfwJVc804a1MnUM
         WxeL8fjre6+EAfxmNiWp0LlWvlq9pOcE+BYTKsdpXl9da83V5qAsW8ik67rmSXnrDj73
         QSPg==
X-Forwarded-Encrypted: i=1; AJvYcCVKs4gpHiHxw8qj9qtI1F0bzIiMGnEBlFwaZ+JG7KPKJe//12W7azxijcYLjzjaxBvGNTXRxosjg2ZIJe12@vger.kernel.org
X-Gm-Message-State: AOJu0YydVSnUJNb4D1tgL6wxm4OkxyAVZHARe3TDf62k3NWNedI4MUpO
	/g6+m8SyaUj/ETpuUs6E+JLOxLpIoyEHxdzckP1ny1xbNhErVGK0E2NAeBqREk8=
X-Gm-Gg: ASbGncud36+tyTuR0XiR/ZWoEa+cwJtEMUiJwMWCYPOQ3g4J4WOuHeShPFNfYyaCR3I
	qnAhX7+lsx5q++sRAOn7rWpRdeg1boTGqG9pd22pVv/meqZfJNdwqqAAfhz3LfP0kUO+RVojZLP
	FCpXFgxz4WNXGQJqBDXq+tIXmMAKFN16joqCr2V0Ab6spB/uPAXfviTxYN37E43gsfvq5nwII6v
	BVpgRV8xszpDEnMq4V7OsbeKm2gHUEu55atkTlttEqK7pZXLqA9DBt9UbWUE7+JMKpIZyikT0ai
	fVMj2s4eyh2QFVHbVDrGWnU4t4Y39xSiKkHbJQZ/57oXPsjL4ILq1hpi4os=
X-Google-Smtp-Source: AGHT+IGiMwCsPJVRnPOnuT9nr3mjkXhzYlZtUEKo3aB0gvr9Pv4s+D2qCg2ZzwsgCWjqxYje4WJRQQ==
X-Received: by 2002:a05:6000:1ac5:b0:39c:cc7:3d3b with SMTP id ffacd0b85a97d-3a08ff7ef08mr1745229f8f.8.1746110013205;
        Thu, 01 May 2025 07:33:33 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a8ef66sm957636f8f.88.2025.05.01.07.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 07:33:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] extcon: Fix wakeup source leaks on device unbind
Date: Thu, 01 May 2025 16:33:20 +0200
Message-Id: <20250501-device-wakeup-leak-extcon-v2-0-7af77802cbea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADCGE2gC/42NTQ6CMBCFr0Jm7ZhSy4+svIdhUdsRJpCWtIgYw
 t2tnMDl9/Le9zaIFJgiNNkGgRaO7F0CecrA9Np1hGwTgxSyEEqUaFPJEL71QK8JR9ID0job79C
 a3Colr1o+FKT9FOjJ6+G+t4l7jrMPn+NqyX/pP9YlR4F1XV3I6KJSZXEb2engzz500O77/gVeQ
 elZwwAAAA==
X-Change-ID: 20250406-device-wakeup-leak-extcon-dc1d4429a2b4
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bT3tXssg6ljHTYZOaPjPGNc1RzAsrRKhBsBNi8I09cM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4YzXLDQ806r8BrZZ6oTVp5DEGxyZxK94s8Or
 fFSmvo31kCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOGMwAKCRDBN2bmhouD
 14FzD/9jFWKh+0fxXBvM221H/9dCIn+AtI0nCMu/87ca1znxj/ccajg7bZbc5nJ6r4bFduhXPZh
 EdfcxQg41owUOKuP9sShCy+KLpe4CqV/bPrTUUwc75rPW0otZKxmJHmV4RY+D1OzozQ1j8saBlQ
 /Hgws/ExCRJycOyfPlYXKpcNMq5trAdUA9GiRExd0kcdVFTbEs835DttItiQwm9cwYfdlxeOd5V
 rl3cvxAGaeG5wrhiKKTnDaeR40ULKRqRNiaweGZ5j4YlawMI8vr4mseO+Ap7E2kFNnVr7HtORBx
 YFTuTrLo1HqF1HnVY8HP2TyMmbjZo0Ac+R2Tg3JTH3ld076ai0y2p0ga3nkZ8D0YbhrCzJpcQ/O
 8kyWbFbaXd2DnWO0+b5PUaQsLWILt1IZfFWvxeXmWbDTrKpEtnH6zAr1n7vwlt5x15y9V350rtA
 zIHbpSdP9rL1XZJWTuHyspTZeABWhVzaxBPDJ1U4HkwhOd5guQshVq7zrK5ZVhnAUkuIRea/SyB
 VxWZ+cKioRw37guNjXSrsOXC2f1i00FjEcO55a2Zn2Oz8+q2OwKwux8A2XvW2Xej1E+c8byT/tD
 nvCjSdLkL0GtUXQO878Itdpmi57VCR4Yfcg8Bl0HO9hkrXL4hzT2Bo3CN+1AK5zfvr29gGbMBjC
 NNljIatd1u0qliA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Patch #1: 0->false, extend commit msg
- Add Rb/Acks
- Link to v1: https://lore.kernel.org/r/20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org

Device can be unbound, so driver must also release memory for the wakeup
source.  Use devm for driver already having devm interface and manually
disable wakeup for drivers still having remove() callback to keep
consistent ordering of cleanups.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      extcon: adc-jack: Fix wakeup source leaks on device unbind
      extcon: axp288: Fix wakeup source leaks on device unbind
      extcon: fsa9480: Fix wakeup source leaks on device unbind
      extcon: qcom-spmi-misc: Fix wakeup source leaks on device unbind

 drivers/extcon/extcon-adc-jack.c       | 1 +
 drivers/extcon/extcon-axp288.c         | 2 +-
 drivers/extcon/extcon-fsa9480.c        | 2 +-
 drivers/extcon/extcon-qcom-spmi-misc.c | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250406-device-wakeup-leak-extcon-dc1d4429a2b4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


