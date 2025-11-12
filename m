Return-Path: <linux-arm-msm+bounces-81376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1267C51A7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB51C1884B1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74239305058;
	Wed, 12 Nov 2025 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbO2yc3l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4E83043A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943350; cv=none; b=s/k57bVN7A6NU+Ppj+hOkAUsZdqjEX2CV2c2wcB96FOroJlN3mvTrWmHi94KELEChbgCPDGh0+pbNfwn6L0q4Up7ElZh9RFUd888mDtnZDTHfi5Xc4FzA0F3Jx3VaPV/XZUicP/hsrhn31GLEmNH07IwOvTHbLLSlKYbQhKEmhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943350; c=relaxed/simple;
	bh=5+dyAstf0xhbGIWyYKa5+nXexFcqNXdclmhKrec/Eu0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b96Xd21gwlX/VWPG97r3wXHYbCoNrDHROWgn/PhxXeB03a2wIwYklppam54uApJVL6wwhvUpTtPEhFLetiVkV9LLEL4+zLDia4mRCY3w8KvIKpaI78aZbrZFoFvyy4zed58hmEQTMjfzkjwz1FQtqimcBDZKkFrnrHxK15wQUqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbO2yc3l; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3298502cso62101f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 02:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943344; x=1763548144; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8EF6cBHJBO/Q2isSVRmRC/bblG4Ra8gNeer+nZltPQ=;
        b=WbO2yc3lRp8/JDbrD2HGJpgCLlIrPZ3DBPgY9pPDNxeuHBUFc2KovA/0uTkI4zV4q8
         ZSG1ewVlWw3JWbmFJmbgMWk+dq9FLscTBZL+gJq3ujQyIri/7aP92OffImO7Ab8zSlLw
         i+aeWXXYavknBSb2A+mnWwTaaE0FC546rxmEdb8nFRM/iByjW3K+rC4iskxM/0RApC+W
         49E1Ka9zKeYD3gLf65WfPePi7+woAlLSNn2PwHI6883i/n+vFqvSa5ofPQwIqwYP7N4x
         rTzIuXIl1FZMA5S+bGos//7+ZFVYztQ6ckF0xLFflYfdEs2IFA3Q1IUXuqfhpViLcyT1
         8dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943344; x=1763548144;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8EF6cBHJBO/Q2isSVRmRC/bblG4Ra8gNeer+nZltPQ=;
        b=e+57cu1U2R0tlrNfN5ccgDWUzq8NXiOrYo3QIVXoYUcMRfudLKA4T/zUMfNXAhk4bb
         ZPt0mWMmQDl9NHZfbH+Wl/ZNK41DfqRw0j7I0ZzniDY1XfeVLQpAwu3Z/KvIYkiTOqao
         eN94YkcrYmwi4IDf5aUm0TWZNe+WYqkBlyaKv7iBPK3NVWXrGVNhjfw/DsyaB1OAPYmk
         lqipRbg/uWL4dXRci8tdrfCenKa6AwI6yXdLaUGEV8r/+w3/4OgJFjEOhMJEEkiYWPBS
         2JUVxX70+ImN3+iLGX1xKu7peebIbyANzyGGKVxOdsQ9onmgZOle7Qyo3/u2Rj0h0EVo
         9zLw==
X-Forwarded-Encrypted: i=1; AJvYcCUn7d5jdCUYP2N2kQp0JSVxRCRN68940vRQ65Q5tpLfYkec8pmmgQZ71CEzsJqZi5xrOphQ6zMRwb4ov2Wr@vger.kernel.org
X-Gm-Message-State: AOJu0YwfmOhsbnAEkdW+sLrvUp+QXOfLkcDrhGSkw7PepFoNQU2OAWTk
	4XsJPvEuUlzjWAeeLutAUSePDI+DaVzDcwjrhalTlFeL5NIOcVNvNARv4U7L+va++SY=
X-Gm-Gg: ASbGncv4yw2n1D6vOFcy0090Gejk2e2PmrBv1cwkcP+vzxpQ8HdIONRLnzPnGCnun0/
	XyddAvUKOx8qsrZA1wi3r6FKY9lQIJzg0B/xVZDDf4s8AkJPXWB47RmN8IHZzDnLNTnHbHs/yyU
	UsR4keqtxniMWxGh7pFfiIp//kFL0xewipVo+oSp9wktQf2hSftBjl8X3pP9ao4ygE+uJ0nYnV7
	AUPNbdvZG105/i7h7ypag77KveQFBobSc9RBHtg5Y80k6dvW32KYiY8wCdyrMbfeoH/dN7uug3a
	yj0rggHQsZH66ZVAtLR8Wmg5GlIq22Wcffd67sPpwjBqmmEo9x2pFaYlBvzOyTtt7JDuTqeK+rI
	BOwyEyx9WL6cpajjLuGaocfWfpYtCIW6gdRNtk2sMMB9VL5nNZu4OK15tlCzIQ35MsGjlnzp93F
	VYMeDk0py5ytsdZ0Xh
X-Google-Smtp-Source: AGHT+IEMmjHlZdR4rkkkBtikr3kREAJzYe3gVzEQY2F/CPNjTW6FIV3Gq5nMQMHGsI7EpVQgzvavzw==
X-Received: by 2002:a05:6000:230e:b0:42b:3746:3b83 with SMTP id ffacd0b85a97d-42b4bdb73bbmr1049650f8f.8.1762943344377;
        Wed, 12 Nov 2025 02:29:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/11] of: Add wrappers to match root node with OF
 device ID tables
Date: Wed, 12 Nov 2025 11:28:45 +0100
Message-Id: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF5hFGkC/42NQQrCMBBFr1Jm7UgSYiyuvId0MW0n7YAmkpSgl
 N7dWC/g5sP78N9fIXMSznBpVkhcJEsMFcyhgWGmMDHKWBmMMietlcPeYvT4oGWYfymBcaSF0JK
 zvVfWtdpC3T8Te3nt7ltXeZa8xPTer4r+tv9Yi0aF47lVTLrmYK53CZTiMaYJum3bPr5NAz/DA
 AAA
X-Change-ID: 20251106-b4-of-match-matchine-data-4a64bf046814
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3319;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5+dyAstf0xhbGIWyYKa5+nXexFcqNXdclmhKrec/Eu0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFgkKzLKPJ79bhNkhzUMxTf7Rq0m0OFEmF4q
 dnv57GH9wqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhYAAKCRDBN2bmhouD
 18J1EACLN9dO8VHBUsLifJcqZjQO60hgIzWj+1YfL7nCpzD4o/V3Zb9fmbppxoW4A8qBWHFp+9z
 bla89lZvHQZo5Io3ja8lW7quIu9nzOFwt9GGBLMYb+Y4ukJpyT7gnUqW8MSni+LVw0fGpJwzl4c
 khYK2MI/R/M9d8wpqyfT9qS9+54jhVEmCX7oAcfw6fUOJghJ82AjVlioaejmfFriDfgq1AqC7Tt
 tLYC/FxWxmwChwzttO5J6CuIWkPJQQoqWoFeMjSJqgz0In8mhbWxhp1F6NyiLwj1BL9z6dGyTRX
 L7/11go/X9B2H+c37Dx4RMwFJb5p53L1RfJ+cc5Ub1MMcEhPFlxWk7LVM0QTk1T1sIszZNTiSch
 rRf7xEqCdXvr9Fpd+TIK7K7Wm11BCoErJWT6hj0bsWLVtyC3N+y5Pfk/nekv4/4e2hbWTQg3cQf
 MCAmbLzployqG0E87eyUpzn8cC9Zyu9YZs2rc1Mrc4ZHC7AJlaWEAPmoNfpCZVFKErcfVMjy0a8
 PPMvUe1+u/lpKCkXWSD8JfOk+mFkqB8gR2Kh+tMtX6hJHj8J05MZAWwknwQKHYYwAY6QKdUnk3g
 zOhsW95VFgRYFLBwwC+Cz0wjXr5kwLh4U2ZhwY0tRVnLtCw0DWHx6zGGwKRTG/YKbYQjDuv2t7S
 KoMdrL+EsQdcY+Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Drop cpufreq/ti change: not correct.
- Drop soc/qcom/qcom_pd_mapper.c - objections from Dmitry and I think
  better to drop the patch in such case.
- I did not implement feedback for first patch to make the
  of_machine_compatible_match() matching machines in arbitrary nodes,
  because there is no such use case possible and no arguments were provided.
  I also did not use cleanup.h in first patch because existing code
  of_device_get_match_data() does not use it and I prefer uniformity.

- Add Ack/Rb tags.
- Link to v1: https://patch.msgid.link/20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org

Dependency/merging
==================
All patches depend on the first patch, thus everything could go via
Rob's tree with people's acks.

Description
===========
Several drivers duplicate same code for getting reference to the root
node, matching it against 'struct of_device_id' table and getting out
the match data from the table entry.

There is a of_machine_compatible_match() wrapper but it takes array of
strings, which is not suitable for many drivers since they want the
driver data associated with each compatible.

Add two wrappers, similar to existing of_device_get_match_data():
1. of_machine_device_match() doing only matching against 'struct
   of_device_id' and returning bool.
2. of_machine_get_match_data() doing the matching and returning
   associated driver data for found compatible.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      of: Add wrappers to match root node with OF device ID tables
      cpufreq: dt-platdev: Simplify with of_machine_get_match_data()
      cpufreq: mediatek: Simplify with of_machine_get_match_data()
      cpufreq: sun50i: Simplify with of_machine_device_match()
      cpuidle: big_little: Simplify with of_machine_device_match()
      firmware: qcom: scm: Simplify with of_machine_device_match()
      irqchip/atmel-aic: Simplify with of_machine_get_match_data()
      platform: surface: Simplify with of_machine_get_match_data()
      powercap: dtpm: Simplify with of_machine_get_match_data()
      soc: qcom: ubwc: Simplify with of_machine_get_match_data()
      soc: tegra: Simplify with of_machine_device_match()

 drivers/cpufreq/cpufreq-dt-platdev.c               | 15 ++-----
 drivers/cpufreq/mediatek-cpufreq.c                 | 12 +-----
 drivers/cpufreq/sun50i-cpufreq-nvmem.c             | 11 +----
 drivers/cpuidle/cpuidle-big_little.c               | 11 +----
 drivers/firmware/qcom/qcom_scm.c                   | 17 +-------
 drivers/irqchip/irq-atmel-aic-common.c             | 15 ++-----
 drivers/of/base.c                                  | 47 ++++++++++++++++++++++
 .../platform/surface/surface_aggregator_registry.c | 13 +-----
 drivers/powercap/dtpm.c                            | 16 +-------
 drivers/soc/qcom/ubwc_config.c                     | 14 ++-----
 drivers/soc/tegra/common.c                         | 12 +-----
 include/linux/of.h                                 | 13 ++++++
 12 files changed, 79 insertions(+), 117 deletions(-)
---
base-commit: a4ebba34e722123f1c09ce3282e26f052fc8b27f
change-id: 20251106-b4-of-match-matchine-data-4a64bf046814

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


