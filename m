Return-Path: <linux-arm-msm+bounces-26656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95735937D30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 22:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 529DE281FAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 20:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08AE1487DF;
	Fri, 19 Jul 2024 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BOnoWbJX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005AF12B169
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 20:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721420211; cv=none; b=HHckl5zguTXmu4ZGBNgTxH23wUIDSu/Rhd/ERif18xn5jSe0YTw6cSGXWBmNF50chfFUFSGy56ehi9NFiIZv4fROVSdYuoF8As3yST4n4Qlec6usJB0eeZYVYA759sKMwrJpK1kK3Q8Y4Pt2YnEp0PbJy+k7Nd1w7/kqOgBlV58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721420211; c=relaxed/simple;
	bh=6Ep5Eh95oEtiJ9dGPzkROTBHO/Fj2MksWUgLjyCTjj8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eL1g5YCj+gthndwvMeT8t4Ljm86dk1yMnqEWuqK/cugJadoC49ONKPqsECbCO4F2LaJEK591JB8qrvH/n+Uqzla/DuOCYxIaJsogzmwVnf6sx4rH8+LN3nMWhRlB5WyIjryDhf63fCrxoHP//ov9pJ3KfiOCgr+zvGx1qioIdso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BOnoWbJX; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eecd2c6432so35906781fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 13:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721420208; x=1722025008; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tj3pbaM3Bp6ECZfeKLVwMuqmXQLFLWkJ9K5YKhSksnY=;
        b=BOnoWbJXeOds/MXCf8jKgmVREEoPHKEcfyh43vPuAvn+pqwUtYp2dzf+ozncXumhQi
         hVfCMO/EMpiolBQy8lbBiqhGGQux441gFTT3LKImdmOon9zQyF2QDYnKiqHSU0Lu7pJI
         RfEttmhF++FOl7VWvUOKV6JvRBw0BPIXyYz0QtiRmn9W/46VPCkhBVEH3qmfCEhbVI4M
         ZVfyQKmHkgXhsWikmH8taSjsD299FMdmiRGZ5WE/6nHA6RTW5G/VEL7JuORlspm81HKp
         Khj+FkW/YPrpp8pX542ILmpfC/yejhFso6iulG6HQpUr6WF05D+3E0cNvsKqRJUrlCL7
         spXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721420208; x=1722025008;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tj3pbaM3Bp6ECZfeKLVwMuqmXQLFLWkJ9K5YKhSksnY=;
        b=OO3gnRSB9+WYEzq0+tcMexvbF+IwpEnY+onszCdaxcf1CLCroUS3Po0cqm80bT2/eZ
         RLvQo9AXsVyBnHEm+vusa/8YD9TYmM5F2vIRs1u4pwMe4RLnZoCgrc6A+eu7WW/LeSmY
         tercMAewckSTRMUdM5OfxU6ProDtn3/1o+QGjZ3jayQKeMyySRNMlWnHxTx3mm3tbSiz
         hBl8vUnDZPitDG8+CVP5EnaLiXAKQeMtKrcBctwfng9rQ8CkBvXF4trebLyIKyHuFy4Q
         yGy7TDnmfMVhXfvf8DMUEdYh2ZKS0gar41uA3NectKFDhMM5gF9k5HrLqE9pCNFurWGW
         K7/g==
X-Forwarded-Encrypted: i=1; AJvYcCU3Nmz6GLASryURglApoE5O9Aoib0l7dCwbMbIRbb1/Iu8uj/31o9sTaAACwFS21R+CbZn63Hda0u6fH8hsBWHchdcXlk1mkR55zOqzWg==
X-Gm-Message-State: AOJu0Yy+hQIyB59I/pInuuEb7ht/VcVp+uZBGdxhJr4fgHE7Ir9UofZa
	jBuSHiR3CEfTcy/vy4pvk58BIksHOnOFjkEoORYTlt/HWuObWz1Fk2bd+Y6HqX8=
X-Google-Smtp-Source: AGHT+IGmhDEAuzeZy9PshTtTNQy3yNIfPVgPaNvhnDFetXscXSUQX0rZLnVBkPkviRu0nYgP6BGPpQ==
X-Received: by 2002:a2e:bea4:0:b0:2ef:1c0f:a0f3 with SMTP id 38308e7fff4ca-2ef1c0fa26dmr210531fa.6.1721420207834;
        Fri, 19 Jul 2024 13:16:47 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c922b6asm72332266b.172.2024.07.19.13.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 13:16:47 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/3] ThinkPad T14s Gen 6 support
Date: Fri, 19 Jul 2024 22:16:35 +0200
Message-Id: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKTJmmYC/x3MQQqAIBBA0avErBPUiqirRISMU82iEsciiO6et
 HyL/x8QikwCffFApIuFjz3DlAXg6vaFFPtssNrWujWdSkdgVMnUMp1BUiS3KWqqGb1G9NZBLkO
 kme//Oozv+wHTftFwZQAAAA==
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721420206; l=933;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6Ep5Eh95oEtiJ9dGPzkROTBHO/Fj2MksWUgLjyCTjj8=;
 b=1x8U23Ffz66m6qfocXm6DoW5a5GcIeTeeFAgddxqY4GMTuItUThqLYvP68apl43+iQ3MluIi3
 wZvQ5XM5HM9AMrD1KWsAcblUFEKu0YBnrSCU1soteXFdCxnNfWn5MDG
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

As good as the other X1 laptops

See this page for more hw info:

https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/lenovo-thinkpad-t14s-gen-6-(14-inch-snapdragon)/len101t0099

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (3):
      dt-bindings: arm: qcom: Add Lenovo ThinkPad T14s Gen 6
      firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s
      arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 792 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 4 files changed, 800 insertions(+)
---
base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
change-id: 20240719-topic-t14s_upstream-e53fcd0ccd2a

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


