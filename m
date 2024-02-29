Return-Path: <linux-arm-msm+bounces-13037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC586D732
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 00:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77CA31F24816
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 23:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BB977639;
	Thu, 29 Feb 2024 23:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r4rqsMaa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B274F1EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 23:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709247637; cv=none; b=KXtmix0kzpEzxW8QPZ/9SmQE7U7+rAb0gb4NKc5BaK1XYa1VVV9crQu9XmoaeVskmPptQogMcvDFEJqBObPrkekwUPKbJYlfOId/0yIiCl8TMbSR8YsAVLPnVAysPjRPBUODu7gDHkrnUfRauCRxKLPYwaFVQkFBUqLMf0l38lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709247637; c=relaxed/simple;
	bh=+T5+H0U5dzjLispNcIuGF+noXB9m/To2YuAnBJYDNUM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gg0qHrTQuPIWn7bsFHuSopCv/aWS9+8+rA/IWnvZbcwQgkBZ7REnn/1RoqcEGU/fVWPEX8qwhYtgZ6M3fkt62qB5QIors7JC3aLxpmCoIlVAZGhUFVc+WfQ5fQ3g/3CVnWeyjRP/qkavUOFeWhf6klUWdoEKSvcEYHtkRw385OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r4rqsMaa; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-512bde3d197so1443656e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 15:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709247632; x=1709852432; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JEIpRk0LC/c4ywAm8vFYSwlqzlbtnoXQp2uEJM7f74k=;
        b=r4rqsMaaXjT2YRmsDJLFuIGSAHnsXs4DnLL1CLseQGYSnxgMMQoACIhC3p1wpvy4vk
         rpxTuS543qMfyQ/wWVZ1uUa2xa5TIRWUF3Jjb8Kst8tbtFFkwSjdfZ3PHFAMFwYEmZwX
         Oa9frG1wUAUOnL34N7p3G49nT5k5w9uUbogje0UOVqa+JZwU3qluHkDaRgtg9j3LZfIW
         tvAXnnFe51xtXNep0E3o2ckQiESWik5xzDF3KWienoMQJqSRzLgXrH1R4jvoQCqDIROn
         QhKSui36QGr4qx1YEdijkw0V5+bMDN5QvY4OPI6s6ZXOL4hIbauwnHyokP94JMNCXYUD
         x5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709247632; x=1709852432;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEIpRk0LC/c4ywAm8vFYSwlqzlbtnoXQp2uEJM7f74k=;
        b=qBgRUJzZ+4uWx+TBdQclWfi58FtEmPLNQ+ud494vLxHemIGPfQ0I2BwtttF4MBIyO/
         RQsqm/lx+dnZ4r2HAdQF16Q7Z4qRIOsKLKwnMiz6+1Qezh0ClOVbP2GcGSblQ8beTDxY
         UKSYVrsFOKdmzRhuaf8l7uChCZY/3Mwqs3QbUbK6aNoUqE09WKlNBTvBqqNWDdnrcBli
         59vDrdti1g8XGNTLjrPldyAggulozwicenfkfxlVRAjGxXDnqIEWZYz43UunvfCvllMz
         n6m/E386VXLeG6Rq2src58iHTqjaG/LoLPy6QfeMEc3F24dDvfzoTFlgoPpX1iXoo45B
         X54Q==
X-Gm-Message-State: AOJu0YzeMU47tfgOQAzbMX/PzwgRjYiug8D3MngvHG6Ppu4jHFX0EM71
	qIjyM95wjYOqXQfqVIVlWBNneSTkCryVoL+3Kpy6ixYIJpf82SmlicQsEu92M0w=
X-Google-Smtp-Source: AGHT+IHthEQuAHP/Yz5PlgdBFz2RKl7blXptTH2C9jKARlqsQ7uOIGZV6KrNY3oUJF35Vyyz3UogHw==
X-Received: by 2002:a05:6512:10c7:b0:513:29a5:7306 with SMTP id k7-20020a05651210c700b0051329a57306mr2030563lfg.64.1709247632307;
        Thu, 29 Feb 2024 15:00:32 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id s26-20020a19771a000000b00512ed2cf297sm408455lfc.151.2024.02.29.15.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:00:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC v2 0/5] soc: qcom: add in-kernel pd-mapper
 implementation
Date: Fri, 01 Mar 2024 01:00:26 +0200
Message-Id: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIoM4WUC/zWMQQrCMBAAv1L2bEqyiRU8CYIP8CoeYrNtgzaJm
 1IspX83CB5nYGaFTOwpw7FagWn22cdQAHcVtIMNPQnvCgNKNFJLJd5tHEVyYrQpEQtS6BpEZ6y
 TUKLE1PnPb3iD6+UM9yI7Ls00MNn/SyvERkptzKHW0hjd7IUSbvQTL/XD8pKHZ5xPLx8sxzpyD
 9v2BeTOVU+sAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3344;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+T5+H0U5dzjLispNcIuGF+noXB9m/To2YuAnBJYDNUM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl4QyOP1pUxSIa060vc13+jRXPdT21F6O6n2CGn
 /YudwtM7/mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeEMjgAKCRCLPIo+Aiko
 1a2MCACrIG9+9+1lYLJqVrkPo7Sy+Cu6SASaYqc8OqtwctVfd/6mkdP39o5A7XHQDGRtJpyHASB
 ht9NyVJuMtaDsR3gUkJNQU8nbiEe7cm2JDXoeYPa2ZuS4Ftn++mjslyWccX4b/wJbDIMw0iA74Z
 uue++ypuamPAE8S6evudvuvw5kKhJZNXZaOAfujUvv71/GvxI7l9fs86xSd6wBWHNpSUenQGOXu
 R/3AM2EzBSX9fRSRf14yMWLf+lFxwhNjWCc4u742aDteFsqdeugEqhINx23drKAoUezE+I8Pk+r
 d249LE79jpfE4E5WPw5ikK243KBX0NSL62DVcXB+H7ssvMW7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Protection domain mapper is a QMI service providing mapping between
'protection domains' and services supported / allowed in these domains.
For example such mapping is required for loading of the WiFi firmware or
for properly starting up the UCSI / altmode / battery manager support.

The existing userspace implementation has several issue. It doesn't play
well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
firmware location is changed (or if the firmware was not available at
the time pd-mapper was started but the corresponding directory is
mounted later), etc.

However this configuration is largely static and common between
different platforms. Provide in-kernel service implementing static
per-platform data.

NOTE: this is an RFC / RFC, the domain mapping data might be inaccurate
(especially for SM6xxx and SC7xxx platforms), which is reflected by
several TODO and FIXME comments in the code.

Changes since RFC v1:
- Swapped num_domains / domains (Konrad)
- Fixed an issue with battery not working on sc8280xp
- Added missing configuration for QCS404

Dmitry Baryshkov (5):
  soc: qcom: add pd-mapper implementation
  remoteproc: qcom: pas: correct data indentation
  remoteproc: qcom: adsp: add configuration for in-kernel pdm
  remoteproc: qcom: mss: add configuration for in-kernel pdm
  remoteproc: qcom: pas: add configuration for in-kernel pdm

 drivers/remoteproc/Kconfig          |   3 +
 drivers/remoteproc/qcom_q6v5_adsp.c |  67 +++++
 drivers/remoteproc/qcom_q6v5_mss.c  |  84 ++++++
 drivers/remoteproc/qcom_q6v5_pas.c  | 418 +++++++++++++++++++++++-----
 drivers/soc/qcom/Kconfig            |  10 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/qcom_pdm.c         | 302 ++++++++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.c     | 189 +++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.h     |  66 +++++
 include/linux/soc/qcom/pd_mapper.h  |  35 +++
 10 files changed, 1108 insertions(+), 68 deletions(-)
 create mode 100644 drivers/soc/qcom/qcom_pdm.c
 create mode 100644 drivers/soc/qcom/qcom_pdm_msg.c
 create mode 100644 drivers/soc/qcom/qcom_pdm_msg.h
 create mode 100644 include/linux/soc/qcom/pd_mapper.h

--
2.39.2

---
Dmitry Baryshkov (5):
      soc: qcom: add pd-mapper implementation
      remoteproc: qcom: pas: correct data indentation
      remoteproc: qcom: adsp: add configuration for in-kernel pdm
      remoteproc: qcom: mss: add configuration for in-kernel pdm
      remoteproc: qcom: pas: add configuration for in-kernel pdm

 drivers/remoteproc/Kconfig          |   3 +
 drivers/remoteproc/qcom_q6v5_adsp.c |  87 ++++++-
 drivers/remoteproc/qcom_q6v5_mss.c  |  84 +++++++
 drivers/remoteproc/qcom_q6v5_pas.c  | 483 ++++++++++++++++++++++++++++++------
 drivers/soc/qcom/Kconfig            |  10 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/qcom_pdm.c         | 300 ++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.c     | 188 ++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.h     |  66 +++++
 include/linux/soc/qcom/pd_mapper.h  |  35 +++
 10 files changed, 1176 insertions(+), 82 deletions(-)
---
base-commit: 20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
change-id: 20240301-qcom-pd-mapper-e12d622d4ad0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


