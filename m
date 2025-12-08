Return-Path: <linux-arm-msm+bounces-84684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B03CCAD84A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 16:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F24803028DA4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 14:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E355B2E8DFC;
	Mon,  8 Dec 2025 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SApP0M4F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC33283FE5
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 14:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765205968; cv=none; b=MuMtyJnon7UQaV26g2BszYGO1PZzXNdlCg0IOSPkss+WrZd/zkZ1NzpMCsvVaLdX8EAdv7f/yWIiMSkfFpA2FdchegzCEhqFMPrDlfraeqGTLSt7cpUfrr99TjTdcja4kzw+fTTJ7hAFO9KMFnlM3EHimK7pBvx3GM/sv8wWXJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765205968; c=relaxed/simple;
	bh=uLmS3zFAWWg3rczbGlkXkOenTYGyS9ffx9/wMN82yG4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YXukecTRuBtk7wmyQ4k7jxYE91RIZgg1vFNEiThE+e7hLrga2bu2qU5yCddH1Z2NGNQitnVTJXMglCey3XaKQ29+Oy8OtPEPtLvcgf2wL8pkI68r84/jIgCzmETud+x9L37jGEQq6rQ0BJn/smCPN+T+87SuaIYtASHplEyYdFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SApP0M4F; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so7984895a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 06:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765205965; x=1765810765; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J+to6IujjR5asOSoIClqkwi7ZpRp9+FoGFEMQuOxiZM=;
        b=SApP0M4Fpk10OVuWcZRcpAOxCQttP+51l5UUJr2rxfeLJyEoyYxtb8AwD4TRqPzs0Z
         fapRi5gg8MxEc7HUxgI8iiJF2FR8pvysOnfH1HaN4wja9LvX1Ee0goIsXXOjeG+JjWIw
         1ttuyF4X9wjan4gQNRh2a491r5/gQ/UGhbRquYp26VRNwY7VZiRF8e9kDCYfiRnSW8BO
         RkQQ3xQW8sTZmBQWdvrt4IsZ+92t3jommuuFZoh78io4+bNUTVRGg9iUSwvoxrKzRzNY
         bRijg3LdmN/CoLUlG4uEvXEg8WebBhWAT/WjWLBe0FCkbbqR+DsiWxERRRcuBPmB9VVI
         8LtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765205965; x=1765810765;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+to6IujjR5asOSoIClqkwi7ZpRp9+FoGFEMQuOxiZM=;
        b=e6wzXM3B1ZP9z3yM+qISsB6tDbQwl5N6CsVCylC1FoXLLZxWbqHd5mJSQO6MikjHh+
         Z0EdJ/h5ST2kuSnU8cU01Zzl+TuCr1ONCr5+CYGQ2yyYJcnZkRT+VnkF1IJX7cHWksNZ
         q4SM1PVq+3GZB4wcA2vJq2RZpSIiMuOFEHXyuIYid2a3Z5ePQ6qb7kX0qgEymDjXCuy9
         88oGfFxtPCQqYwadKNeJomZ4uKS9QLE1pqUbwX3CSd085I2emqIVljd6/kBFdGlHgbZe
         /WYK4zBqqNzzlmIeN9J3cjV3yj+3CvarcAIlvXZIzpUw2E6kIXeC2daplN0NRi3g+ZpZ
         9e6g==
X-Gm-Message-State: AOJu0Ywi3SNdqOI32pQLocfdSQk/vtLSSL+B/XKNhgsZwuf6TrfzpnQ7
	vNow2fCTxTNWi3FINWJWNuSKVPlICdoBkhfIDllI1ggI6JhDz63zdayC
X-Gm-Gg: ASbGncu/BYIud/dJEgMmazYyi/kMEY07YWoWtX7y9AvivZG5/3gev5gSO0bN0BRieHn
	XpLywURCkzkCnFyRwMzK5PKY7WvY5fKh/h2nH+HU6F3jCPU2U3CfvWFc/x4eyQNvyOcEGA9i25u
	Y5AZfhAliRzycNsdcGvBUNQNfZ/F+j3y2TAYLDMwOa6eKBXnj4mMRdFtQfQYsCvHwUDFjT/r8PV
	KM3FmgljLjzDa7TKURTI1xQ+lTnmsjhSqgpAT9TFGs0DkicxjYm/VOLhTeVakIRyJOeXYjazx7Z
	At6WlQfFbTjMbFnC2kJrCOHD58I9DXKY3lgnBOCLmCmluNFjtutdTGqTcNMBgeNYeY5vZHPVttL
	Lvt2zrSB1Jt11jPSLqT3ssDJXzebvJFnu/Bw+XtVoF2+ICUhUSHC49e7wx811iai6BYFINqXWS4
	Thl84YhqMLro6yoA==
X-Google-Smtp-Source: AGHT+IG8rQqpJ2MB89ONVLWQ+Cg3vkFpX8w8CxK5GGu4BMGraZvYfazZZrEiZpBRcHA5m5CivZzELQ==
X-Received: by 2002:a05:6402:1d4e:b0:640:9c99:bfac with SMTP id 4fb4d7f45d1cf-6491a3f3b54mr7570377a12.13.1765205965464;
        Mon, 08 Dec 2025 06:59:25 -0800 (PST)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec300esm11365556a12.1.2025.12.08.06.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:59:25 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v3 0/2] Asus ZenFone 2 Laser/Selfie includes a battery
 measured by voltage mode BMS and a simple GPIO hall effect sensor. The
 following commits include support for these components.
Date: Mon, 08 Dec 2025 16:59:19 +0200
Message-Id: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMfnNmkC/12Pyw6CMBBFf4V0bU1nAKmu/A/jorQDNOGhBRsJ4
 d8t4AJd3knOuXcm1pOz1LNLNDFH3va2a0OIDxHTlWpL4taEzFBgCigkzxOeq2EgN/JK1TXXmcg
 UCSOVSVigHo4K+16Nt3vIle2Hzo1rgYflurkA0l+RBy44pPKEMjaQ6exaNsrWR901bBF53MEIf
 zAG2OCZhERZICR7eN5mOXq+wn/Dd9s8fwDTozhg/QAAAA==
X-Change-ID: 20251208-b4-battery-hall-c707ae0d8ad4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v3:
- Added multiple temperature points for ocv-capacity-celsius
- Added capacity tables for every temperature point
- Link to v2: https://lore.kernel.org/r/20251121-battery-hall-v2-0-d29e0828f214@gmail.com

Changes in v2:
- Reworded the battery commit to include a link to the downstream code
  on which it was based.
- Separated hall sensor pin configuration from gpio-keys.
- Link to v1: https://lore.kernel.org/r/20251115-battery-hall-v1-0-1586283d17c7@gmail.com

---
Erikas Bitovtas (2):
      arm64: dts: qcom: msm8939-asus-z00t: add battery
      arm64: dts: qcom: msm8939-asus-z00t: add hall sensor

 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 79 +++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)
---
base-commit: 82bcd04d124a4d84580ea4a8ba6b120db5f512e7
change-id: 20251208-b4-battery-hall-c707ae0d8ad4

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>


