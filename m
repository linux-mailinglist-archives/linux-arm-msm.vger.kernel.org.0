Return-Path: <linux-arm-msm+bounces-61402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BCAADAB60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36DC23AE3AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 09:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE421A7253;
	Mon, 16 Jun 2025 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvKJ1OX2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEDF19AD5C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064577; cv=none; b=SrVmLpGf4T3UERyNPe8Fdd4/diIzHCJtymjwMyBV1CwRIcH0qQ/yjRaYksHzhFlUKeioc/xzr4oHjAKG1fVJjERLzXFB543wI0NMW8vu+7li2MXYHl/KfkIOwAWK0iUY4fPKjDf+KFbo+CY+JxcuhvAsaU16zyxrdC0cqfCHpdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064577; c=relaxed/simple;
	bh=UwsxL1aUM6Mq/Nn7cHE33JximgrwfYiALv5ltiyWp9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b1AvpwHSKj4+Ym9xn7Pqpj4v0Snvl9kzZ3oDZMKOHKLIeMdrIGkySEL3Z3IBKydzjdO/gUrjh918VKEjPBuvtfHPNrr7ryT2VVhzRM5kQL/aAJOB2AwGHeIfOyqEokRv3xtAau2wR7jO87XnNmD01qYrX/m1a8aDn6HvU6XoJOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvKJ1OX2; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b2fc93728b2so3352576a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750064575; x=1750669375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l7lynWEm2yiF3vVL7de15JUkvsY7sKVMsw2kq7kei3c=;
        b=YvKJ1OX2LEsOXfLcPGGL5GpcgPSItm68q7yuHfpFu1SC2F7HFFwNdJ8lqu9r5LPdvc
         mwNe3lZGxRIujRTBNs5CpnvV6hEfpEp1V1uvizuT/SNz6LGsknrWMHAFQou/nWHjjGwt
         JBkC8waCBm6KpEhALQLfAigabnIIxOdhhUQDed7ll/9lu2jNLCnq2sZq4VY9dKr0xoXj
         dZlvAMe0uAh5dGURiof/AphrY6KW5knSpHjyNZuLNnZq6eaZN3spE87T4S3akf+TtaO4
         mXIu+/c6yI2BfFlsKEw+yLMt/XVehKhDN65cA+h045uIZvrHk9JCpyZtBoKaa8T/LTqY
         Ye3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750064575; x=1750669375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7lynWEm2yiF3vVL7de15JUkvsY7sKVMsw2kq7kei3c=;
        b=mY/VOy2PXN1TMXqaP1+7AUAMWWUQ3ssi5wATfap95bW+CzBNE1cA1It52M4khqDS4N
         Lv0xXZs+o0hOaXi1LdWqt47NTB0m5wktpZzz07OXCW2RW0YyE6FvMXzZ1vvy09WahLaS
         GnF1qjP9kDb5jqqQ8FU768zGJGPO7rtLPjlAwUYfRcjSKoBrIYXLNzsxpOWhudRkQhHd
         TMeLiGXg3wOBhGtD9aAW5HhOiLVVafVqFu8DtQjqDJLNia+ELZfIiTEZxOQ4tGEitl/h
         1goGFyHipst9fXKBmAsVwN96PmjBi370BWKCWy6VxBxIfkvSoM486WDE+kBMmL69ioLL
         ckOA==
X-Gm-Message-State: AOJu0YyLcvtplHXk3nqY4YDBqXfZiTAngPqdzexCRHerZQik+ICJ02sM
	fRlXq46iA4sppHPytRXyQY5VZz50FFjC/cKscsK1lnhuILNPJOfX4B6H8BMZZZ83
X-Gm-Gg: ASbGncsvIXH1qYLmuzritoKiDGJ6mjc83s0OI+Xdpm9otADQLw3UDgRkL1mH8iXJb44
	7maPH7mMKe6AmMU0MrvRVzHtCoHyPoOzEyCWDYn2N6RkZ0EPhVpxCzoVEJuZFm8QXEeUAPN/e2m
	X9ZHoqsUzJUui7P8pqoNoyEccAG3T10cuoQ3x8k5fL3WXjHdjYg9HDA9Lr1p0I9856LVQBZ3Z6B
	mzKcxf1TXjCZ1xdFwycDrrBbJrPuqTAK3dAdYbrm4T5zkXNlYxYR0soKEOChtQGIrwbzB75yXDR
	UP1FiUahaDEJUE68xFKBO4t3nIbf4O86DRZUoKwDCSKjglwRq687WcO5MAO0P1IbjdiOUlNHV8H
	o
X-Google-Smtp-Source: AGHT+IEb4wLophcQi6etKY0zR9MIlqBvkCbCJuNXLuWpCizX3FpqK3qUOVN19JiA5wqQs8iqjdWwTw==
X-Received: by 2002:a17:90b:1b49:b0:312:ec3b:82c0 with SMTP id 98e67ed59e1d1-313f1cf8c3dmr12511354a91.29.1750064575512;
        Mon, 16 Jun 2025 02:02:55 -0700 (PDT)
Received: from localhost.localdomain ([191.193.166.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c4e4cbsm8032258a91.27.2025.06.16.02.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:02:55 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: konradybcio@kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH v5 0/2] arm64: dts: qcom: add initial support for Samsung Galaxy S22
Date: Mon, 16 Jun 2025 09:02:48 +0000
Message-ID: <20250616090250.36605-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v5:
- Properly format the thread

Changes in v4:
- Try to properly format the thread

Changes in v3:
- Removed unnecessary initrd start and end addresses
- Make sure r0q is in right order on Makefile
- Properly format memory addresses
- Set r0q to the correct, alphabetical order in documents

I'm sorry for my mistakes, this is my first patch and I got
a bit confused on how the whole patch system works. 
I hope that is cleared up.

Eric Gonçalves (2):
  dt-bindings: arm: qcom: document r0q board binding
  arm64: dts: qcom: add initial support for Samsung Galaxy S22

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 363 ++++++++++++++++++
 3 files changed, 365 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts

-- 
2.49.0


