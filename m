Return-Path: <linux-arm-msm+bounces-17792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 022158A9357
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 08:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 958D41F21D45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 06:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A052A2E651;
	Thu, 18 Apr 2024 06:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHt5zH5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBCB2C86A
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422668; cv=none; b=gFlC2KJB+cafRdz8brnSgl+wbkba76b6xzilPVtyKqyBT9wvB8RY6TykkaP+tcttix5hBs617QAwMEoZFtHsxEFsEJ5iDldWCPgbUUQ0jtenYPYXXEaQSFdInDjhOw1CRf7vBKAipvzUN47LHXAJyn06YKDGut6t3HaExasiXEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422668; c=relaxed/simple;
	bh=hdEH/Fe73Y1Z2k1PnvnUuv0NQRWQaeztwdNOG/90Ct0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DDcM4QggqB8uEm9d4YkkpvEox5TrWFLkKLvpD2r8N6kXUFZnT5vvJN8jVbW0yPBmngw2cDyzSejJZClfBQy3lQV2tCdPXRPy/ZciDJ2ZOBu0738Mv3Q4RFbfhJX9kNm1pd3FYP3oq5cSMrX/IioIT6nhYinRGVO/1p+5138/gl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHt5zH5X; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516d68d7a8bso523986e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713422665; x=1714027465; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7gs1jZdJh2QwYUQgFAsiDQJNMfuWxG9hc2xVIqNWLZg=;
        b=HHt5zH5XVAW9PcAeav3JWCtbkdmzls+3NZHVwhVacOn7+oLa+6DXy+ci+hVcbutZ9o
         HoH+8iBj64oekBDkerHPjEMECydQ7jp/R35pI5AV4obkwYRc1EhLbmvffUcHIixEzmfK
         oOYNhAj4+O23r7DkhckwgjBvo1AQ3VEb7hDIi8bSzqXrEF/ojP5lRHeFmaDC37XHqrqV
         X1QSn4vWb8WNTC4qtkFlAG37CwqqAptqb1hhf2c9yUyVzaXjzr0NV5fIGSu2865r4BkO
         7TGa2J0oMk9o7Nz2pSSWG6wiCKTG8lwDWlTa63okZwTgpJu0kIsohv1AkEh0JzvQ8wYR
         CoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713422665; x=1714027465;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gs1jZdJh2QwYUQgFAsiDQJNMfuWxG9hc2xVIqNWLZg=;
        b=COEN4w6kdF3Fn7yIq6UhZDzVsDMC+UABsjDxpTGCyxpE2BUjvUbugK4B/2ASnRy7wN
         oCCmD+yLPzYmwfGPdU0LJIkq67z32OUeSDgC+xygxY34IeqVecMdqOogxRibXtCFBbvB
         jp2mz+AukYC5E+3+4+X5biYGOsgUmhudCAeZpQi/rNn6b/BxNnnlxOVnocCT4pYvjzrm
         kN90bzKouKlpCYvf1DPK+iwnhZJYv8QLm5MqcxIT0h0mebS1FY7CrOtBFt1lhA4EqNSl
         V2JZoe+/jX1fGVADt00KICz7dg+c0pUFRSq+bEkyzvMZH12YrDkxjuaPlPa2BCvi9QHI
         ZsgQ==
X-Gm-Message-State: AOJu0YxBYBUkf700LQ/AIOwKhiLsxk8mVV2RULgXS8ejQwjwZ27aAbC8
	OoH5Q4WmI1gtEFwWSNl+kbdVHJ+faahOCplWkImBGfFcPa9cWCPf0o4iSeqlMbkPPSsYKG2+O1p
	K
X-Google-Smtp-Source: AGHT+IFrdxc/lLEwBCZQ7Rolp67iry0wBi+hhA/3S6Pg/WnCRvzvikSFua7uqfDF8vPMw8o/XRtodA==
X-Received: by 2002:a05:6512:39d0:b0:516:c3b2:d65c with SMTP id k16-20020a05651239d000b00516c3b2d65cmr502436lfu.7.1713422664889;
        Wed, 17 Apr 2024 23:44:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020a0565120b8900b0051898448680sm122122lfv.261.2024.04.17.23.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 23:44:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: msm8996: enable fastrpc and
 glink-edge
Date: Thu, 18 Apr 2024 09:44:19 +0300
Message-Id: <20240418-msm8996-remoteproc-v2-0-b9ae852bf6bc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEPBIGYC/22NQQ6CMBBFr0JmbU07VgFX3sOwKHUKkwglU0I0h
 LtbcevyveS/v0IiYUpwLVYQWjhxHDPgoQDfu7EjxY/MgBqtPqFWQxqqur4ooSHONEn0Knjfemz
 PlpyBPJyEAr/26L3J3HOao7z3j8V87S9ntfmXW4zSKmh0rS2DL7G6PXl0Eo9ROmi2bfsA6aDEG
 rUAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hdEH/Fe73Y1Z2k1PnvnUuv0NQRWQaeztwdNOG/90Ct0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIMFHQfI0/L2fbaqcaTXTIu+YKSKFyWRW+ma+M
 59QKxd1CMaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiDBRwAKCRCLPIo+Aiko
 1WwLB/44Kc27SIXQCwVYNxcpvA+gtvl7kH8fA190ucZQl3x02NNa52DFQoFVyjeEFpCaVzaJ/EO
 akuPHwIVSGFfrGwTuPpfqyLsLPWv1UPEggKqaTpmZCLqHphOA6lvnpaos0pPRKqlNn0Nc/L1Ts3
 CT+/2toE/00FJDC5uOxnuagRIZK9W0aN7Fts52JebY6Edm8tLDK+8dnoLYhQeNtWbSOb4cXjn3I
 F4aCCD9XppPodQBh93hLCnFjlElwbO0HUELurYZQfHpuI7EgVZzhIDsv/HiMXXvd+cVQQXf/rtu
 xYQQtQzrgd5rb0apuegnFP9eO8sovm8pzzBJHw82ULc8+89B
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable the FastRPC and glink-edge nodes on MSM8996 platform. Tested on
APQ8096 Dragonboard820c.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed order of compute nodes (Konrad)
- Link to v1: https://lore.kernel.org/r/20240401-msm8996-remoteproc-v1-0-f02ab47fc728@linaro.org

---
Dmitry Baryshkov (2):
      dt-bindings: remoteproc: qcom,msm8996-mss-pil: allow glink-edge on msm8996
      arm64: dts: qcom: msm8996: add glink-edge nodes

Srinivas Kandagatla (1):
      arm64: dts: msm8996: add fastrpc nodes

 .../bindings/remoteproc/qcom,msm8996-mss-pil.yaml  |  1 -
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 79 ++++++++++++++++++++++
 2 files changed, 79 insertions(+), 1 deletion(-)
---
base-commit: 4eab358930711bbeb85bf5ee267d0d42d3394c2c
change-id: 20240320-msm8996-remoteproc-fccbc2b54ea1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


