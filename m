Return-Path: <linux-arm-msm+bounces-61972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6CFAE302F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 15:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47CFC18909D4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 13:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05BC1E1A05;
	Sun, 22 Jun 2025 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoIS3GA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E011DE3D9;
	Sun, 22 Jun 2025 13:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750599788; cv=none; b=aQICsTaeIuYxen3c+iI/ZKwrMzo/u5/Amr/SWwo7hVolqocee/MlxvaRcJdRyMr+P88LYdWB9/Tbbu8Xiluwujvd35wTJtRH7FzkUqumIhNS6wleLpkf/8mj/RXNw0+sQbGn1SaGdbG17iaLq/KAtCSQh/39C6FIBoePY4ts5fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750599788; c=relaxed/simple;
	bh=Mi7EbXJYwTfH182hrH2FJtHRM03mQEHRNxZoyWO337U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bSCAdJzT+FnlvZBPKnpvh6e/gmZHwLEN2zbNTssM2HjV5EzgUmRL6JvenBlQtz57eiSzkBlCzeizLdRGxIh3aE73Z3hsZuv4NjikbEL/ZguA5k2wDWsl0dwAawCNnVtQFBeJ/mDQNUJYpA13XlKt+rcGSn+0M7Qq2kGFt309BCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoIS3GA1; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo6338765a12.3;
        Sun, 22 Jun 2025 06:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750599785; x=1751204585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WZj5o7l4DsZDoAa+GaV62W37tm18RdoNakKUCj7Ro8M=;
        b=BoIS3GA1Vl+zS+UjNK90pT3HmQBQ8eI+uTl/OhYrj4gbUs/gBNeB115hDBDvnmUCMf
         TvDX+hadVgJeB416CHRNLYP/Qq/PihBEu3plR/UaWdLYOi0w1UapVEsLP4tOW89nOK8I
         CCQlUojNcns4Yy8DvgxLXt+0PVoprYR6IwgE7m82ZeHLnq7dLp69/AdQIiQ00mac3Gdv
         jkQ5uZMj14FDJYOgkgDdKf6w2bntwqNFHksrNSwl9X3wPrfxmHG1mVEDzFLtzLf4y74Q
         2viKatfmCHjyJ0qKNYNLnfiCsRZpfvpuNmTa7dXE2zsgVZCibRyuelYlvgVXpbAUmqXJ
         yC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750599785; x=1751204585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZj5o7l4DsZDoAa+GaV62W37tm18RdoNakKUCj7Ro8M=;
        b=qHVgGmPAzdJJf5l4HPWSag44tmrEN2jYDeNyLSw1rUeXga4jZton6oRyKeq4eslbmA
         UaKHVMktTjJ1r5l9Dlzi4tHtJNoh7sLSbO6oAD2NjzAdt8updcngIX2oL60nTST13IiQ
         57f2nQstTPTY/sHo7/JtJZHt6zzobt2imcDb1rSB51Dx+j5ybgQsZx2usN5rJd9+rRHr
         bRGMj6v1rkqZr5QfNB70xietg/UOjLhUC0HEVxSkbsKbrqlLv1BXHradoGgZBL8WqZyo
         QguklqsiOw6tW0RnN+Ald5rnhMo7k+qE8DNv5xlx/EXSgzguQBkg003hjv1/KJZiEoZb
         DIvg==
X-Forwarded-Encrypted: i=1; AJvYcCVElmE4q45nfuBb5x/6Tyx5gD6FLbREVOeVeRgMKu1huAOdiRD6ZPkUIJaa5F6lRyjxN5e9PKkjbW/1@vger.kernel.org, AJvYcCWY02IHTwaTd0dEjkv9IjPZdeW4/+8LlpRfucNRlQBYqbhDcNb8nt2rO3yLa22Y70lIDvIeubEkHpPPXecoRw==@vger.kernel.org, AJvYcCWYpyKpORRHHnSXP9d7f8nSXKEIXpnhQfumXDKZ4GZID/vDNB8IjThh9sqfuwcr1hDqKx2d8S8K+7yelWup@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx3ziO9hsjsj7CuLbGjbRqhk03L6Zifs+HajDwG44BnWbajLgm
	OvkZNG1FkgrYj9i7+0T59O8sZTuDMnf+KmcC0WiGCTyud/jujbU5c6Y=
X-Gm-Gg: ASbGncv3/9dmbsMOqSD98EaX1wqM4UUVBVukmbfuscw2rXgjvZoJkuv4zQEHsNplODM
	fCqiQetXPIe/usHBR5157MyWTj2CPyhKEoscNpmUcWWGNrOfZtw6mz9LXrvisgoyWdVtpo78UKF
	jxu/GcWQNjNJvt7VPOaC8w9QEAFIuEmDCwehnjGfc72oqoebArz/PbBGXnD3cJezhyDzy6QoF2s
	4Bjykq2wEM8IG+UtGekaEZn/H6/RFIBdGMrfVVjV8RvoPYyNyZIt3VDcsUPBw4unRUPp9hyFbFk
	9WvcRdYZIx4UgPYO75Yk2S8LgLe5ixDazUlje0G7qlR7VeXbfJP6ZZDb5nx3vRpM1yFWMxblU86
	FhAM=
X-Google-Smtp-Source: AGHT+IEgfGyHvmCU634nEZQA9Y91tsbXZK1bPtGknigRwAMNLAh6lnz3IVeeuN4PtLNR45cQzJO4SA==
X-Received: by 2002:a05:6402:5207:b0:601:31e6:698d with SMTP id 4fb4d7f45d1cf-60a1d18e136mr6698120a12.23.1750599784894;
        Sun, 22 Jun 2025 06:43:04 -0700 (PDT)
Received: from alex-x1.localdomain ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cb9e5dsm4654457a12.53.2025.06.22.06.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 06:43:04 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 0/2] Asus Zenbook A14 improvements
Date: Sun, 22 Jun 2025 15:39:59 +0200
Message-ID: <20250622134301.10403-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First round of improvements for Asus Zenbook A14 which has just landed
to linux-next.

* First patch updates DTs from v5 to v7 that was mailed earlier. Fixes
  GPU enable and mistake in firmware path for Purwa/X1P
* Second patch adds audio support. Audioreach topology and Alsa UCM
  configs were already merged [1],[2].

[1] https://github.com/linux-msm/audioreach-topology/commit/952d16b16c4ee23578c001c97a31540c61315a0c
[2] https://github.com/alsa-project/alsa-ucm-conf/commit/87a48b90213106f6e310dd611590e6a608ae6596

Aleksandrs Vinarskis (2):
  arm64: dts: qcom: x1-asus-zenbook: fixup GPU nodes
  arm64: dts: qcom: x1-asus-zenbook: support sound

 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 198 +++++++++++++++++-
 .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   4 +
 .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |   6 +-
 3 files changed, 203 insertions(+), 5 deletions(-)

-- 
2.45.2


