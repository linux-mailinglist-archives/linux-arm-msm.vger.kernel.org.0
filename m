Return-Path: <linux-arm-msm+bounces-37144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B359BF203
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 16:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 876E4B24473
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 15:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86997204932;
	Wed,  6 Nov 2024 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tTguHRgE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A592040BC
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Nov 2024 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730907969; cv=none; b=YzhX0NsHelNTEwT/E2BEHvgCkyQ4axTVYpK5pCuBLO+VFk/obM6zcyRlo3FtIPq3HlVbyQHlZJ+pBgjW6koQ8d3Hy2hIo2tsQ589gJmByXxE5QZ86pDVexJrKew7lO7tVjSlbhcPfiSxZYmYxBsIF0VfMIREJ90ElQza/4dWaIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730907969; c=relaxed/simple;
	bh=Q49gOcM+mbJ/X0FzkUv6ZaqCBSB1WkTEYzQp4xtHpmI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EmE/USrndNJ7QpR9tfS/2Gw42oTmPJPJpUKMUbc6bU49DFzBGKz0L8FroiDDRXHmLbwCwjwaRHmmbNc8D86UrWxJas8DykWaRM+cpTz3t31a8AgB66t7akVT3UG3A/S8YmgYYBAtMIBHTSXlKv088G3cmsJ5cvL3vN54jIWkenw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tTguHRgE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso6183731e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2024 07:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730907966; x=1731512766; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPNYTRPf8ptxBHF8ylH/q3ROnS54WebHSzeYDR0rcWA=;
        b=tTguHRgEsfCkcqN6t384GEC3zdht21+Lgdaiavo0QU5BSK3D0s3Kcc/9ULfCO3beV6
         ll+TwIHVbzpC1IYyOWYq7c9WHLXzRUBomLnteR+GlRGf9vbo+iAZzDGW4akHzvD6E0Q+
         WGVHyYAYDYxAPjiHTRPjLOpf8uo+SO4Kr/ZRHinEwnFiFrYtgFS8s1/hqDtO77BnvfUy
         shUoyWrwwzWTtykWeamoYaepyBM4HVePMJt+VDZeS4hLI6TUrvdK4mB+0Cg37CysYPWO
         EKveAyZElC9kcZ3s69c0YuzA5Tp5W1ui2FRJZFPfBq4JUKwCwNq+LUcE6vmAkfc7z3k3
         e+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730907966; x=1731512766;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPNYTRPf8ptxBHF8ylH/q3ROnS54WebHSzeYDR0rcWA=;
        b=K3x+54MrWVj4tbng4KpiYWXRPCE0Xx1KDLJxA6zzcSY2oCvnsiIWoG52LtI5rq0/L8
         WANH++cTLqi3VuLc2oL4wIPqmdJjG+37HIghWNKeBblPP+NoTp/PN07cvlhGyh1H802Q
         KIeN+i2GRENHCyIGPm0bqm4K/vdjphMoiBP4U/+CLuHgZBtQ2DwoZlzh8oMFGf8bYFY4
         IDqR1YpY1m00cal9MbLVeTQke9xOZMWjDMTwz7+NvgtRgKEfW0BJe547PAN7YIUBthhm
         KNHqrGYuq66dUjHu2cVii+o1U2FkqXOHctoCZukyptZ2g2JEC3BNvogKh94vsD3x1j/N
         A0OA==
X-Forwarded-Encrypted: i=1; AJvYcCViMAhhz5+4NrLU2gaBSIi16CpJW9xrND38w0ZnNrYRCIGwlbv9c1WedA6aW6bxRJtUnNzFDqGAUNlAYhef@vger.kernel.org
X-Gm-Message-State: AOJu0YzPgn23YHRpqdBzorB09VZfaYourTJTgPmKl15igaQjf0FjEPib
	hqaSjGk3Fsqd6lS+r2Int0asi/tRYvcESgDn62SJ5OxamhFR1VS1Sox2kbsI2cw=
X-Google-Smtp-Source: AGHT+IEje9ZCjPgnwh2eoFubhHb7G/8/Iew+6zmeklBYZyJn3+HazClQLCGTRuOTDb2bq/nr2kD8gA==
X-Received: by 2002:a05:6512:3d16:b0:539:f763:789d with SMTP id 2adb3069b0e04-53c79e91262mr12180687e87.43.1730907965746;
        Wed, 06 Nov 2024 07:46:05 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9598dsm2536626e87.22.2024.11.06.07.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 07:46:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] usb: typec: ucsi: glink: fix and improve orientation
 handling
Date: Wed, 06 Nov 2024 17:45:53 +0200
Message-Id: <20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGPK2cC/x3L0QpAQBBG4VfRXJvaHXLhVeRirR9TQjuRkne3u
 fw6nYcMSWHUFg8lXGq6bxm+LCguYZvBOmaTOKm9dw2f0ZTn9QRPesM4iIMMEhyqQPk6Ev6Qp65
 /3w98cUCoYQAAAA==
X-Change-ID: 20241106-ucsi-glue-fixes-a20e2b2a0e3a
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogeurs@linux.intel.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=718;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Q49gOcM+mbJ/X0FzkUv6ZaqCBSB1WkTEYzQp4xtHpmI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnK487VXuui0ptL/OP97jyLJzCJD1cVnh5S8z94
 gHmkVJOihiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyuPOwAKCRCLPIo+Aiko
 1aBGCACgjxYYqsd9fF9EKZaWCqCJdjJIrN9pbh0eugxHPXCawg+Lg1in+flKfjZkyorPArG/5t3
 EOsYX9MTpgY9ZVdpOrmGFXRjANaFCVBC0MUu7r2sGkhMhyqHrJsTcwPg04/Ip9PYYXzy7JpWp2Q
 UXvFd+ZrdRf3c+cKiwXWdx3Cm+MNkEDYgWdosK5f4zfy1ldWmZIl67L0z1vInoUH6CRmvgEK3QD
 V5fKYj4NKebHvovzlnoZGn0XZ164ld6Wxg6zGpOG83VayqCxxD7nhpEwn5x2xP1ca7wrYTfdtW+
 VH8F8qx6Zi6R2HMY3sBiUuSbRPECq69cMP14Wbi1q2KPhUXk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix an off-by-one issue which resulted in USB-C connector #2 orientation
being reported as unknown. While we are at it, correct the way we set
orientation_aware flag for the USB-C connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      usb: typec: ucsi: glink: fix off-by-one in connector_status
      usb: typec: ucsi: glink: be more precise on orientation-aware ports

 drivers/usb/typec/ucsi/ucsi_glink.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 0a2598971f04649933bd38f5db241b3bf23c04ec
change-id: 20241106-ucsi-glue-fixes-a20e2b2a0e3a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


