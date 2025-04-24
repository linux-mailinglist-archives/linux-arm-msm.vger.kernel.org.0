Return-Path: <linux-arm-msm+bounces-55353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA40A9A8D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 535517B5119
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC82F228CB5;
	Thu, 24 Apr 2025 09:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JH7mhBgp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EFE227EA0
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487666; cv=none; b=gKuQchhw27n6M617+uDgm6VTNjK2mJPbah1U9Ebvw+St3LUXjCR6JLGBQ03sTC3ZW+StX8anu5fVH8+urLA2n5kzH8FV9NGIEsK1s2IgoNozG+rjdF8pUA2ZGaIBM7WdLatUt5ltWQnDLhfevnQdkacboj1ChVeLYjMrqwD8cqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487666; c=relaxed/simple;
	bh=SlgEdGDb/DKWCOuA4W5dZrzXGJJOrqjhh0pU26wetQE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QAgrtkzOKN/BgWGy0vd9dofaNzFXNREjjIfjQLSsOonPNnLtTB9jIDP4VS/iYV20YuPDH90EcWbrD8+6P+l/PaumE0crg5ukGWrAPeMUDvyzi/EV5pVnIeUVYmgovq9mhm8PJxRlMN8tUNJWJxS5jWfy2cWZ4t+BCv2xO9K2hcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JH7mhBgp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43f106a3591so1005555e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745487663; x=1746092463; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ+2XPxe7PcUywYmBjNxkwdoBQCPKKKmxzqhiPsfSo8=;
        b=JH7mhBgpdkIiIs5QotxDvLbArt6+RlBcFlpuBtWokXbuZwEK3ZIe1sL87xBihMyfB/
         PS1WmXrTVQn6VWnEZkr0rcfoWHKilehcx+ROtOTB/pdRj0ljJgdMUmR+Y17VtUu22vC7
         B9YeT+VeagwweovGVsN1wBmem6aF/M4iwu2fkvluF0rD7jO5xHRVHb0BHwcr1oehjIw4
         ZiejLMXRoGeuFpHkrM9547ovQG+pHMzyrCi6cxO04++krKdzIumJISUSgHxOCYqfMn0z
         dsuDc+c5ymP7FC63FZm+HEVfT2Mp7S+MkarjyYPef2xDJ8LecWq1GNlWSl093NQgCB8V
         sSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487663; x=1746092463;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQ+2XPxe7PcUywYmBjNxkwdoBQCPKKKmxzqhiPsfSo8=;
        b=j1mQvC9BsHqMGvEMlYcKW2zbSf3k0DItcKMYG2Z5YDQ8q1dPqKFpgT4ubP77MVdy+y
         v//NPxm0ATTq4CBgNVZgAi74ei6+XTG9rPNBDpNZEw5ZlgJlrMXF+u1zZfRnnS+KOj0O
         ndhSvyik75QKbpU6HA9bxEdYDJMLZoU1LRUtbLfNiY9z6cEtwoWi0G4znjTWhRY3u9Bf
         k1uS/JglWa1t9eV6+2dYH+hAywtZu3Q/GCTtFUI2gzUvTYIxcS9Ocv+kl+xP52I/k+7I
         xSYL3qGc5ys06vv6QR8E239yEgIYzUahmLlNAoMsWLrcftnQg3hFF8URMzK0Uv5bSa1Y
         WMcA==
X-Gm-Message-State: AOJu0YzUzPbEDqiFk9NOaCdDnYwudsA2VWKuzjmSg2jqEdUywV+7r/9r
	uwU45LR0lTqHoC/5hOhLJTA7KeCTJ16sCgaXUC9vTyZytxCy/h9GYvTZ09rvuMA=
X-Gm-Gg: ASbGncvvNmqv4v5OdomLSADb28nwLh+q1+wG8WSs4vZgyTZqs2CYu42uspFTPcZRkj7
	1NdrTPq8js/ovmqi0p7if3wv0wn5upk9JDgI+WF+Qm0kJu/f3D6n4UDbJBZne8gsCC/C6tRW+M9
	VKfph8z9eGKV0Q9vHGCCvgERhTzSCEI4oPbP47GN2wH6xKaAC1uRclA1vNhqr/QrREGmR3tSvAc
	wCuPK4J3hkJYnf0iDFP5zNjuZmROJl1YD8jTCtZYpFsVCwAL6aBUSDowGKY2FAEeF5P9N01nm3E
	YUv4cgJGAaF0KulQQycRnJyFH5TtMnsnt2bdAa7kL4v4aV1xvbv0/01l05c=
X-Google-Smtp-Source: AGHT+IH6QjibDV6FMB7BupWJ4Rz4BI5NVCaaysKCD+vN41xLRxC6QExKkQh4znHdZzlbXnjaZqcX9w==
X-Received: by 2002:a05:600c:4707:b0:439:9b3f:2dd9 with SMTP id 5b1f17b1804b1-4409bd8c327mr6387265e9.7.1745487663119;
        Thu, 24 Apr 2025 02:41:03 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c8b0ea0sm41526975e9.2.2025.04.24.02.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:41:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sm8750: Add sound
Date: Thu, 24 Apr 2025 11:40:51 +0200
Message-Id: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMHCmgC/y3MQQqDMBCF4avIrB1IRiXaq4iLYKbtLKp2oqUQv
 LtBXX4P3p8gsgpHeBQJlH8SZZ4ybFnA+PbTi1FCNpCh2loijJ/WNQb9FmTGxeuKhF1dkXOhbSp
 DkJ+L8lP+Z7UfLit/txxf73HfD8cfh4J6AAAA
X-Change-ID: 20241122-sm8750-audio-part-2-943277d85302
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=800;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=SlgEdGDb/DKWCOuA4W5dZrzXGJJOrqjhh0pU26wetQE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCgcn6//8BzPKJ5ntOP4kIjJna/umo7zZXjkJw
 YPNlvQwV/+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAoHJwAKCRDBN2bmhouD
 1wMQD/9x8PW9l3kJPQY/9L14kgJnatrwjcxMjYYZqePCWUYug4mPdT/q9/688blJHqEH51qjqzy
 Mz57BAxH05nRbTSAzxVj2lSU6itcet2HNgllGIua+DxrpwM9VX8z3NztpLfrXCSS627TI1tz8Yv
 /p35DOoGHdRX+yRan7s0JY21a6w+mPidbPCbWqrXCB333j6wZDxJ1JMQkOTM1wZ+TTQu/BIcEeh
 HXCCiARfIVlNjw4u2yqO4uaV6JEZkgLcUu/Hg/srVVaG0W/dvsncpGyoDAjY23Kv76Q87wiCzKj
 cATqvwNT7H1BHK0EF0jzNyApWl2oice+fucYMIbmKyEwIsn/30tXKDrpoyt1l/1jk7M0rk0kLE2
 9PHULtjz0cAg4QBR3ZSVVtcTZRkh82QUlb8UQH9ZPqKpdZIYdnEUwH5ty4kKbdZ3F3nQY7+FN6U
 jtKDb9tfqB5GiNuwsGjo6Cq9bzwk1d7Tm1F63OOIsQxg6GtJPmtU98MnxAToTPyNobeikvPr4X9
 De/NC0Hkxpxr6gaVntcqsg9Ebc+LzHh0pE5LGQvRa4jDtAf1zJFYDfPaDysaXNLiQ2vGsh+eMLw
 H+noh3CcVqUGb5FjgXUc58ohCPgUDUs57UakEtljVYgmBH+2EvNUePbrXLeNQB0RAmZ3cB7nC6e
 /rO7ubk+5n2JKMg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Dependencies were merged, so this brings the necessary sound on SM8750
MTP.  I have patches work-in-progress for QRD and also USB headset, but
this have dependencies and need some cleanup. I will be posting these
separately.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      arm64: dts: qcom: sm8750: Add Soundwire nodes
      arm64: dts: qcom: sm8750-mtp: Add sound (speakers, headset codec, dmics)

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 214 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 122 ++++++++++++++++++
 2 files changed, 336 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20241122-sm8750-audio-part-2-943277d85302

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


