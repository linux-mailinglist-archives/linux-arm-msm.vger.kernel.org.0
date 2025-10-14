Return-Path: <linux-arm-msm+bounces-77188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF7BD9319
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5A432352B89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446E1306497;
	Tue, 14 Oct 2025 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yyz2y6Wk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED0C2F8BDF
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443354; cv=none; b=g/02zgJkkyL46FHQ5/mZ1y8p3Ts1Zh8EyWb5aEKXbBVD+nlbBy+FSbOYuAqan8aQiy+evKKxP5Zu3J9i3MKgzk6c6uHcUV49wDGwxrHHAZG/pjiVakSqUQirTxVbBHhowveRUXRz+QEnRUcCZmz/mH8HYuflOoXCfCU4mgFs1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443354; c=relaxed/simple;
	bh=uN3j84qVqwGAIGTb9j/2yqr2sDVtx6YN0tEWF9Jvojk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=g9WeytgEUnyZMwjvhsFVLeZSEfPj99C7kqgUeHLP1POcXxb661/NHM2a9nE65ULetFWcrbcuy47qKjJGiRnVVSGdEgqfgZwzkN8wk4c/8Dafb2qlFkZpHBw3Tz1TiPtyEg9kFeLSf1jWWjUIaUGY1Tjqm2zp6MilTPeWRM4Bm0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yyz2y6Wk; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so5066717b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760443352; x=1761048152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HfQvU/Mw0ZJ9zXdFjFYOYgKDAzyRq42k4wpeXF58tTM=;
        b=Yyz2y6WkUisS1FglFUS2w4LGJKOckdS69kkSQKvFVoaJhIggn9HYWDyK7HZFLoRY2N
         LngQbLPBZUzucnKo3AeHenk4s85c7seV/NeF12ssi6njgcD9P9bHkD+CIWcP/5BPnLLx
         Exc9mw2VBuevG6/kiJkJHRfhF7ccR7h8MdYmB4gnFdF9X2bbVrqHKrAhYdSZeYjEHL4x
         fe2BEQMxxBAPZKnZOpOGCR3qJi82VAyQk61Yd8ib/4SwktWr622qgahOJ9RlM4QNAMrE
         WZgsOdP9zMmd/CX2RO0MleVMF9bqgl15lFWzveP/DykPQlV8Gy5WPEFzD8nT00Ks/zkF
         TELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443352; x=1761048152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfQvU/Mw0ZJ9zXdFjFYOYgKDAzyRq42k4wpeXF58tTM=;
        b=m+A/wQ3+W0JBbZff8M9nrWKjpi1lDewoFQ6DwwdFyqONhCqLSz951X7kkvQqJxje+i
         4M8tQidVaN+b2lInm1OPOu1nHsNM7VZkndSjmnSSgJnVcClBXaCY6sKHrKsAm1tBajqi
         7Wwih3f//4gCzi6mlxpwPTVfqF+ayavBxPMVEXiQXNGFV21O0/MCoNHFOM2ApkhG3fTo
         CGtB54VnFIduE1Rz0kgCOG8SEQ33iqnRYJpAytBQcN1mhZyvs7QUIe/Qe+j9Mb+cIVxr
         MF3AFhdNmfJ/8LZ68b+5swgBBVthPoXe1NqqHCEfc8zdg3yiIjzSB29l1DcbmpNUSWIz
         bNwg==
X-Forwarded-Encrypted: i=1; AJvYcCXHN4+A210kKCdYbW1bJtpTg3++macEoJx7yAlD0DqjsmWMiNB01iw3Q/zOiOvnuWzfqFSmHAmB4kDgqaUa@vger.kernel.org
X-Gm-Message-State: AOJu0YxKzxHcPTceo90WBpmMcWiN0ZtpX9Wcc2eEFvTH3SmLgusb6Ciu
	B16Ovlehox2u1h7VUsDRBOdXVpx0rrR6ncBN7jXwO2Qw0Y7NpXAVXYz/
X-Gm-Gg: ASbGncsuNoRsMpODnNI+435Fom+qlHKT6gRggwhsdd1nIoX9sldOlJqWao+IW3bJYyU
	wGCoeiZMbH71Fafb4b6OeJSHkuTPWm6Vz6sqZdB38rChLq4W2OfqdCU5S6Ojw2G2Y+T7V/MZ/lZ
	ehXzy5Rz1KVa90P1DM0T3EgGpasJXNem91zNhHqEp0lKakx8CEXCpR9VyA1ojCXSUbh18Lqz9Wv
	BzrxHa+M3BUCxbY8nu1ID4Bvupb0yocdcmvQmAq3+Faub8WDrbgXOyiexXYRGlohl9GF7uPrumK
	Vwha6BVn21RqtzIUoOvt9LisGeq0/RZO2JHvy+JIMJ7CupTFWHxNLwoSNqTuqcAlcsJiEqwace2
	6ujcgZxV9zvO84S9rGUjaBzHF/DY1Q2lz7tD/lm53syzk1c8SjEwRFPM/81IcaVdG6Zv4vq8Hjo
	FOVw==
X-Google-Smtp-Source: AGHT+IGxnJZuqD7D8HRrQsKpq2YeyVBl1nCR/ZYNgjF/OZAth0ma7f0ryzIGkzZOdXOx788KjLPmyA==
X-Received: by 2002:a17:902:f641:b0:269:8ace:cd63 with SMTP id d9443c01a7336-29027f43af0mr304373745ad.30.1760443351952;
        Tue, 14 Oct 2025 05:02:31 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f941a5sm162808455ad.127.2025.10.14.05.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:02:31 -0700 (PDT)
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
Date: Tue, 14 Oct 2025 17:32:21 +0530
Message-Id: <20251014120223.1914790-1-tessolveupstream@gmail.com>
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


