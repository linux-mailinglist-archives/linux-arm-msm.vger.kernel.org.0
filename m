Return-Path: <linux-arm-msm+bounces-37987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAAB9CDC63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 11:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94468280A9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 10:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B161B3922;
	Fri, 15 Nov 2024 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gml0ap7A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952951898E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 10:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731666062; cv=none; b=DTVugG9c3/d0oQROZ6rem1bKj/WI6aIgi87twa9AMiSQDizcZ1oINMvjPpx7Xq5gUoC78KoY4XM1X0D/f2tjGY4ChU45KiAILpGlGga3t+2W50FpkTiDYU52jYALrAoj/0Nrt2c8WD8S0Ql/GhG0DW5XbFyFB78yxSThm+lMTxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731666062; c=relaxed/simple;
	bh=Sry1eci9vOFpDyEkQTfYzaAEbOwPhc8e98R6BvOXPCA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dw9zM6CxQyXzblG5Htvi43H6pVj0fXony1jfesXuEOq7eQc38tBzC0WQlUQ/zPr32pjNvIanqKhpPqG0un8dEDr2FGA7v2Zl6KlFbKdEH+ua4zpNLWDRLYDWavj6rUbSGxMCreqMmhhSAV213CsV+lDAuPZjUtiFQfiVvLuRves=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gml0ap7A; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso13725325e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 02:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731666059; x=1732270859; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVPoezCL82p4Jd7gvA1mM05GiLeD2sJWZNuvEyNACp0=;
        b=Gml0ap7AHa6YQ0T9LnRd8SsLxPddWB5Ob3iv8acv5z9EqAKoIEUecUBys2xsNM7lrm
         2+wg/3S8g9NviitRasmV7iPIFMvicW6HFRrhPu+Tm5eRjum9R7ePGA/dzqit3DGvVnxT
         E7jHXBjtILuyTDmr0nXvWJQnl2iTMIEwi0E/iQayWl34ZU5TVSEMxRbTr8hXjdEC8+oD
         zROZE4WumTjbCSB6ksfdWVQOK7BtCqQGu4pOFi5cQG0qYRnlZO5MS7J/cqZ1bJaC8GJ2
         F5UScX2JvCTIrVMkhtU28UpfS3uskFrbFBBc0+oOOuIQUKSjQZUIE6oSnjsIy/v4E7jh
         kgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731666059; x=1732270859;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVPoezCL82p4Jd7gvA1mM05GiLeD2sJWZNuvEyNACp0=;
        b=PJn4ZT1t09pUxvPHCpV3pLt6rlwuLremvUTnvMlmAERaf3kutvVuwLN5VastBNN8b9
         thG0nv3w9tQcUuxeJNjs7CWVK5cYXSRSNv+I22iCqL7KQbVF0BCweBvDcD5ukcmTc0Gd
         9YWc5lM5AjPc5aSFM/KUmb0G21rywMmNK+2QddtGMf1ZP69airiM/UEZb+G/acT9+ngg
         xFw2PHdXi4bRLxnqkubHS/XUuyhvrwNPA8dpadgejRfbuwmUfIeVPLTHfCeLwKRUg3b9
         d5LibBy1TcSccSX2rHdaSKzvsxfTLghs+bWr1cyAPrQ3BsN+N4JxohPBdUZkj0ux4GXr
         TxAw==
X-Gm-Message-State: AOJu0Yz8IgP1aen6eI4BKu4owhKqQifYtHdbBHvpMKLFTURuOIbhC2oL
	cTpbs0zZhYONjR/bQ9zf3dHyfpxMcWH+UlqHnR6GbTwjZeeJFH1GQfpYPAiQSrsEZrihgAFQvI8
	y
X-Google-Smtp-Source: AGHT+IF4S5LpG2M1gk4mPasJkhDU1+HEf2nyx4nf298wfc3kNyQOg63uE543BuT2Baw0R1ptm8+q2g==
X-Received: by 2002:a05:600c:1d0b:b0:42e:d4a2:ce67 with SMTP id 5b1f17b1804b1-432df74f0c9mr18281345e9.17.1731666059001;
        Fri, 15 Nov 2024 02:20:59 -0800 (PST)
Received: from [127.0.1.1] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da28bc11sm52109995e9.31.2024.11.15.02.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 02:20:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sdm450-lenovo-tbx605f: add panel
 nodes
Date: Fri, 15 Nov 2024 11:20:52 +0100
Message-Id: <20241115-topic-sdm450-upstream-lab-ibb-v1-0-8a8e74befbfe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIQgN2cC/x3MwQqDMAwA0F+RnBcwYsbmr8gObY1bYGppqgjiv
 1s8vss7wCSpGHTVAUk2NV3mAnpUEH5u/grqUAxN3bRExJiXqAFtmFqucY2Wk7gJ/86jeo/sgsj
 7RczPAOWISUbd77//nOcFgPZgkm8AAAA=
X-Change-ID: 20241115-topic-sdm450-upstream-lab-ibb-5acee981556c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=965;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Sry1eci9vOFpDyEkQTfYzaAEbOwPhc8e98R6BvOXPCA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnNyCGd019DtfevtV/hIj+1O+GxHTpML1Xmw64L
 HF2BpqR4LeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzcghgAKCRB33NvayMhJ
 0TLREACG9MH+k3bwQmBGGrrZBGQ95F7crdiEpBuVwWQwySAr8rghS5mH+ETPpcL1IgjFPc38A9X
 MFSxHc2rzd3sMc2oQhg63rn538pd04Ciui/tm4CNhub1puwAG77XW1UEfmLCG8mYnXQIzK2o92h
 4DUxxmNz0+ryNy/ZB8o8pTQ2oGtIA/TY4Px3TYGLULQau55+0r9lyhOAZftZMPKJPYmM7qE0JV0
 kWKtXSvgR03Mep5Y0L7I4d4EXLcPgIwlITWjq2nYbg520t7rcfKSPql+3D+bsVjORj/fR5H3jqM
 GnmKvMn93Lkq5l1mchps+7f0yBsVT0WRWAPnZ2JaXaA5/hXR1u9utJcF9RpuImW/2TbK+ZHQZFC
 QrxELUmAc8zGUHUtilQZqknQJY3/5VloYTgQLTix+Xxj7UQrXH3KmkwvdqnR1cXW+viiC5G45VJ
 vTZaFW3ZG4Gdy6Rcb/nLgNKzBrsu7lIqlCEjva+M5cAwZ1KocBuM2qXO/1egxEuKfebPdoJov34
 XxVJgV4DIgVieb3Cv4R9fIaBGdjKJSKCi8dxfaG2DzIMYDxffEfnCtavKoDYRxUS4IV09Y4bFoY
 2nV7SzhsLUknq0Bm33bKiGW+S+rYwm+aWpjI3tPTKNJcEttNItojZcAdLsfOrlg6KlxcuYDDkgH
 ptF8WhmsxhKkCSg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to enable the DSI Panel on the Lenovo
Lenovo Smart Tab M10.

The panel is already upstream with:
https://lore.kernel.org/all/20240828-topic-sdm450-upstream-tbx605f-panel-v3-0-b792f93e1d6b@linaro.org/

And the LAB-IBB bindings changes was sent at:
https://lore.kernel.org/all/20241115-topic-sdm450-upstream-lab-ibb-bindings-v1-1-1f4bff4583b0@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      arm64: dts: qcom: pmi8950: add LAB-IBB nodes
      arm64: dts: qcom: sdm450-lenovo-tbx605f: add DSI panel nodes

 arch/arm64/boot/dts/qcom/pmi8950.dtsi              | 17 ++++
 arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts | 97 ++++++++++++++++++++++
 2 files changed, 114 insertions(+)
---
base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
change-id: 20241115-topic-sdm450-upstream-lab-ibb-5acee981556c

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


