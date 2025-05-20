Return-Path: <linux-arm-msm+bounces-58748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9A1ABE0F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 18:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD3FC8A59A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD57D27055C;
	Tue, 20 May 2025 16:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/FHzbIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B67248F46;
	Tue, 20 May 2025 16:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759492; cv=none; b=itZdPzwqVDKwZBXTty81f1ztG9JbixOWhhquf9lu3/optSlZ0EEn7pFBFAF+TGgri0XVtts+wk94g5eQYzYqF95N4sx3bXleZZpR7XWwntD2oh6ic7DFLLOJWWLVPR+IeB2bwme1ETPp66nwbHbsAkYX3TT6ADUoYdpwhGjUJNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759492; c=relaxed/simple;
	bh=xWCsQzdrdiPokZKnGHhLi0nzidYVTPQvwDy4E6Ruzrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZCtfsk019pY7irAg9u/dOezRm+l/lO24rUISapwXhxb+JNBUfIEuSmsW9+s2tLuEQbrmGxRAskRWf+ao+dkD6/rKLWrWUK4z+SFTmitQpaIWXlZra2RfPlMxynS8ZI9LoH0P5ZCssmcGeZHdXyWkS07Rfd74PiQn+oxLBBcjMbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/FHzbIR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-233b1e4376fso789215ad.0;
        Tue, 20 May 2025 09:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747759490; x=1748364290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=raaMPey0rkHKajk8tyVYlWOb4mxfJ4ZQ+4vrv9/8SeA=;
        b=B/FHzbIRlmLqUfp0Wgm7eYyKx0xWOtTNo0KaQxRKucEi499VEYvzDCD4AhHd+JfV9y
         APOqpp/g/DiofdzI546kBqRcSs9DDGcHE22aybZmYbLjPz3ndGbndr9vbBqTaUmIu46X
         z54LNcYWn3cJ+eFhVtdFb41/t9Rge5PcKOqc9dMs7G5vNBXDcUrG0tmeE3Tfir+/bG4W
         +KHhvc44AfbTDimw1NsXc3+o3QzKUUyp312zQOLZMes94etIvBzlzDN2BJu4Asp3cUhR
         /x8rauEdJ3YIcpDytcBeWkBRBISYMzs0FBBJ82JY+zHbDsHdFqAiT6fAY1uNc1LO/HmY
         jI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759490; x=1748364290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raaMPey0rkHKajk8tyVYlWOb4mxfJ4ZQ+4vrv9/8SeA=;
        b=WSACu6KnFUyBFAUgsAobWrLL3aEeQrfMGsqUIGdssTrAs7/uNYgRZXGCy50Ou6Ivrt
         CkrVdmJR35p7OgVWwvYcjLQoHvSe1+wloh6B+8/aQejvhTSCS7EkylcOdQ0aT2xhGbww
         Y+A5JLwe2xfETpiH2bDRsoS/Rs4Xk5hg+qzXSF3L4oalQLsMo1dk2tP50XUhw28IHWGA
         O3i0jfLHaKTJkUwry4FcIeDihGQdGd2pVXWhTIrq6MU5RzU3JzzkMYG6hDM8Ysze+5Tx
         +4KeLTTjLb9AfT0YlW4HIf0IKj5jHwfsFVrNL+YYWGEKIVoo7A7JhPetfUHPXjOVGmkf
         nB3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmQVtuoMlHjxB9vtlwW8oF9npLC2BLXywW3OIaZv1N8RzBx+JzxaCgAwmMbHwdJ4PVI7gqfQ+7izT1iCB6@vger.kernel.org, AJvYcCXOBemq+7inQYZl/ioBjq//EefoFvgQwQTlbtVpY8FV3pAkNgIl+upf4Ff+an3pfN+4WAJNKQ6HM0s6@vger.kernel.org
X-Gm-Message-State: AOJu0YwlEamF15Yl9dymDKfrrdmCohf3rBu0v1pXPwINkzn+UIdMK+qr
	fr4yLf0R67HvNugi5hA1AeZESW2yl62VbF8+62X3MAeVk9hEqedZejKQ
X-Gm-Gg: ASbGncvhlFvVatsde4a3zZ1UgvWPnJNyxER4Qcvtj40hIOFndH8bgshfLYR1P79Kna8
	tCTtNFc92neA5rSJuhdtvk9wxNQfrE3KqwE3B3sHZr1ksLiBdPGAr81GmsI9MUEcjVrN2ZDL7+5
	Gbh2UYuly37fUDfbPKgONQtjB21wZ+YZxh7fY4pY9dYCSHn8dG06fXoTt5VAeorHvCxz4+4AXbx
	LsRS3rFcJKJzLHgwj0UYCfZI3uuKT+6J69yDjnU7rAZxj6mKoPbZdd4fKXdbAC5ppPXvXzX/+Vj
	80843b/GsJO1ylbJiRmEcVtTHYkGHC++vV889i0ihZF4NZ48Aw==
X-Google-Smtp-Source: AGHT+IHNEJ2zAnt6MeP+t81APpuG8oTNngDxsuW7MvC7FQ43V9hR2igZnzg4OfilzwLB4OwAIV00xw==
X-Received: by 2002:a17:902:e803:b0:22e:50f6:b95b with SMTP id d9443c01a7336-231d438b517mr258326255ad.11.1747759490279;
        Tue, 20 May 2025 09:44:50 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233abb99a06sm3548205ad.254.2025.05.20.09.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 09:44:49 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Introduce Oneplus Pad Pro
Date: Wed, 21 May 2025 00:42:06 +0800
Message-ID: <20250520164208.516675-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
platform. Its device codename is "caihong". These patches adds an
initial devicetree for basic functionality.

Pengyu Luo (2):
  dt-bindings: arm: qcom: Add Oneplus Pad Pro (caihong)
  arm64: dts: qcom: sm8650: Add support for Oneplus Pad Pro (caihong)

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../boot/dts/qcom/sm8650-oneplus-caihong.dts  | 960 ++++++++++++++++++
 2 files changed, 961 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts

-- 
2.49.0


