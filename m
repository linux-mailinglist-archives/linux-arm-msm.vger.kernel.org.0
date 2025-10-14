Return-Path: <linux-arm-msm+bounces-77187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B26CBD92F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AA951892777
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C75B310762;
	Tue, 14 Oct 2025 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7GSFaR7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C953412E1E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443263; cv=none; b=NooCq+a1xcYfhvhflrTM7Nk4T/wPLZ4ALQd0pVdPh/p0QbXDN2Jf51nHWOFCNuII6AKA7iKfjZ+/pJs+8BksKiF4uLIAUMEEUjhhdNGIRmQpWnmhSA7IVhaKUexHfGbNI49kTFTu+lhXoPmQikTC2VWR9XxWBGiRpmbdThtdsUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443263; c=relaxed/simple;
	bh=uN3j84qVqwGAIGTb9j/2yqr2sDVtx6YN0tEWF9Jvojk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VP5Bo3nEIUZy3XDimgmmCEgXFzvrr98MusW61LUcp6iq0FsaMv0w8EouOayfCcCjmDAfi2Eb2jrsNVPWnRFmvu9QEkXqmJ/I9g++0P71VkntxqCaZA7Fi4Z1c6ou7fcZhgRsHQmpmyx3RFWhOzml4iWRapJfJaZfBhHLhbT/2c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7GSFaR7; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b57d93ae3b0so3138970a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760443260; x=1761048060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HfQvU/Mw0ZJ9zXdFjFYOYgKDAzyRq42k4wpeXF58tTM=;
        b=L7GSFaR7gb2OfJkDA4xvLXhiIiGssUh0nasehM97C95R4TgbacdTuVpoAI4cZe2+6o
         JlgP4LsZK61xHmz+b5AceeZ158wFnrk0TcNQ8JIxk8JEypC+aH3MKE5aoMLQSn5d7DZH
         fLGTvp6e4npV7Xk+ks/GwCnstlMR9WY9lCmUUJEEHx4y6WmuLhYx2Ck3sfaxMTq/E5EJ
         ws4vlvptrvMPnxt+VRp8s2ZUaydYI3Waq0ZrOuFLjEj8jVfuwORqe4T8g4N5U+sJM3uN
         oMhpEnacke0EttimPpYTTj0pxIJJMcabm3U/WPZjlJ0FtvqMNiol5QAyKuKKsxQDjgdU
         lbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443260; x=1761048060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfQvU/Mw0ZJ9zXdFjFYOYgKDAzyRq42k4wpeXF58tTM=;
        b=UuDXyzH0nqALybJFDtIU6Qfh5ZcvO1e2kkNeEc76oWmdp3vO/1uY+z0eaYh1W4GDdg
         Fv3T38ZOe/GpigFji/uPJAV1UDpfZvuBKeFZAIT2Wz94IgLPd+Fffu4ZfuBYRsVSXztV
         ooF/GCdDJVteJ6UxbNZITkh2B48iIOARCJkGgUzt2SRo/52tLLEjyCrjJ3DO5kwpNj6U
         4AyBu4FLfLNx0CYbSFaLTtf2TL22UYX/G6uuPPHiuIDAE57vWdur8SIyTWO+/xqCx6cd
         iH9u5YhyBp+LbjPdQJk/9FnfazScVZ/KfA6hI16dS1G6sQMgZObTfOgFYbNA5QqQPRob
         goPA==
X-Forwarded-Encrypted: i=1; AJvYcCXX4Wz7VUw0WndhCNrQIVMnT847mU7de9lYaQ7gN1OwuZPPGrlFBZ8aNM17QbUj+OH7lkPrJ5v4c//kDv6t@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6haanwO8nBu4vtUU8DXnbjIyylgKsWywfvhAlqkaePxvr6FGq
	uy+apt/LAMcoNrIuDVG11jOObHHAzWzXcquJDxXjFop2oPVJJESo9IWx
X-Gm-Gg: ASbGncvgF0QhffLS9+h3jTqIjib5o9SBJpa96uln4VZ/KNvkYmToz+qoUNc0fsdM4Vp
	6Q5dTQY/4hFNDZvtLc4E1H4m64YVNSAdu7q/p5RBa28LEYlgfeWa+HIQ9Uyp9btqiD3nuO/ghEH
	rvZNl3I4rR7cr6XvL3pZPGn38V3M8zfm//sMU4USAL7kU7LsBQsirFVUvnsYHCxYrAwS0DT9qlt
	RNFu/F6FxI4IaWrJmLe5KQfF//X+cVJahMUwHs/ezctEXdQyM9w2HikHznQFafasb5liljZhT2q
	jCw9afgzyiYnD0xikY08X6NM5d+BvKTiPIXWnBvs12YmEhGz2DcEULxOrNZ5R1UiL6QhOAFNvXQ
	bocW/s+/Kc7XzNpZlvjJHfME0xJMd1Ln+3gnos7E1th/uf0zXO//TIbZ0JjBBi0ce8kUGEjlvMI
	JzQA==
X-Google-Smtp-Source: AGHT+IH486qcRovkqj8k+jx5/8Be1KR6VJnxAwKeZA3VTvXsZl4TixfjYjdYR8UW/lEQ03HUbeQrEA==
X-Received: by 2002:a17:902:cecb:b0:268:baa6:94ba with SMTP id d9443c01a7336-290272ff553mr358576505ad.53.1760443258985;
        Tue, 14 Oct 2025 05:00:58 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e39727sm161651525ad.51.2025.10.14.05.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:00:58 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tessolveupstream@gmail.com
Subject: [PATCH v3 0/2] arm64: dts: qcom: Add support for QCS615 Talos EVK platform
Date: Tue, 14 Oct 2025 17:30:47 +0530
Message-Id: <20251014120047.1914756-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This patch series adds initial device tree and binding support for the
QCS615-based Talos EVK SMARC platform.

The Talos EVK is based on the QCS615 SoC and follows the SMARC
standard, consisting of a SoM and a carrier board. The SoM integrates
the SoC, PMIC, and GPIO interfaces, while the carrier board provides
peripherals such as UART, USB, and CAN for evaluation and development.

---

### Changes in v3:
 - Addressed comments from Dmitry regarding USB1 `dr_mode` and added a DTS comment.
 - No functional change in bindings file.

### Changes in v2:
 - Renamed compatible to "qcom,talos-evk" (suggested by Dmitry/Bjorn)
 - Merged enum entry with existing `qcs615-ride` block (suggested by Krzysztof)
 - Fixed subject and commit message to use imperative mood.

---

### Patch summary:
1. **dt-bindings: arm: qcom: Add Talos EVK SMARC platform**
2. **arm64: dts: qcom: Add support for QCS615 Talos EVK board**

---

Best regards,  
Sudarshan Shetty  
Tessolve  

---

**[PATCH v3 1/2]** — `dt-bindings: arm: qcom: Add Talos EVK SMARC platform`  
**[PATCH v3 2/2]** — `arm64: dts: qcom: Add support for QCS615 Talos EVK board`


