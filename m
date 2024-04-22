Return-Path: <linux-arm-msm+bounces-18151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DD8ACA4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 12:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2BF0283386
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 10:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB5483CDF;
	Mon, 22 Apr 2024 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y3rzCT3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD4313B7A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713780687; cv=none; b=uiwiQyMehSSRwOJIDFShCy+VDVQMM2HR4S6mXBX40hFZ4k4ZPJq2PPdbMF6VqPbCtnMbL9q9tFs0VM0arr5t2qytTkl+ARJ9EbLvd0J5VS3uuw0XYGu/RPL21nDDp0yVfSDQMk3bXJt8QmIJBXSTviQJbc0ARBwyHGkCzYloF7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713780687; c=relaxed/simple;
	bh=tBpi40/zB5GxFBlNNNsb9NVLwpxRzapyur7krJNrANw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A6jAuayiieH4b++6j219Pb5sNHWMiYmOLqMwcu07Dcbaw6TwLWkx52D0f6bFAE3cdoysaIN5sAVcOhq/kWeOB5LSZFMAFUcp6AfI0ZGKXLaYYvRIu/NxuseHWzl1/rfOjNKxmJi70CZY5WWLZEY8yL1XS37+V8IGMqtK98r/oOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y3rzCT3O; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-571c22d9de4so5467112a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713780684; x=1714385484; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7V/ShmXk7/p6SXAN3Z2PaUcTmaFz1OajveTK4GbFWGY=;
        b=y3rzCT3OUNXCoPJtVKYvahG5Uyqn3gT6cfcZDtq427OShnTsMqfpD5p1170qbW2ERR
         vPZJWwEJ/MYY5xa5p/jQ4fw2TohPuW8qfExhx0mxZcbabPeNdwL+Itjv4D80SrW3xDjd
         nckcZ7QqMWroUYNEJbmPMTph4xkISW5rF1usiN/eT4j8n5Tlb3wrgqM6g6RXeVN2pt+y
         WrBe2CFbtnpDbT50WzLJbxUtT5BMzukSuyja4BS0+ExwvbWLZtUMcazV+F44lONifRef
         WQCKIVVwTFVEGPySsz+l/5PHDDQSpxFq7H+EL3cgnJ2c9rd2kpLZrlz1r4AmoBkXiwRZ
         KBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713780684; x=1714385484;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7V/ShmXk7/p6SXAN3Z2PaUcTmaFz1OajveTK4GbFWGY=;
        b=RnuIl8xkH6wsN4DYo+kmPynzROEqX6AOuz+Mjt3PyG5jT6Ir92oNlxZWUtzLk3U/+5
         YRsi2iLLYlo/ddTHSApbDtA0k56dHKS/nFCDhpIKVPJEdNxwljwLi+Vq/YuZ3Zdounhp
         W9jXnaMjiN0lu+khS3rCYTmzWDlM52q54nqGGlyOyqasVZ6h1ha6Xc15YW9tAPS7Etgx
         E+rtkJ/MzKIw9rQSH18fFHoaEP3fGCAATEIf93xwrzCzze2u4BVP796NPDTrCSm7lNly
         tb1fG6/nth6d+zCxLLLP95ScDrxHLTIMJeUjdN4Fk4vYEMi1dHHNL5RiwyPiSX90zLOx
         PTsA==
X-Gm-Message-State: AOJu0YwGrCmYC11Y2jtc7QOz8dB67fYfHFDYQXjIItl367JQbDHZnvRO
	rvhLQEzmqmQ6TBhus4FARIG2g+uqw2ihppDEpnqUWQoE5cFSzdeEXWa+cZCI6iM=
X-Google-Smtp-Source: AGHT+IFvUxvG3qgOiGLQ/SWeR+itOkvSCwTMQCSbJ0W3DbcMi1M5rvlE47NfA7GOAYc8yjwRZzsvlQ==
X-Received: by 2002:a17:906:e091:b0:a57:c758:738f with SMTP id gh17-20020a170906e09100b00a57c758738fmr255771ejb.0.1713780683584;
        Mon, 22 Apr 2024 03:11:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b00a525609ae30sm5576339ejb.169.2024.04.22.03.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:11:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 0/6] soc: qcom: add in-kernel pd-mapper implementation
Date: Mon, 22 Apr 2024 13:11:15 +0300
Message-Id: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQ3JmYC/3XO0W6EIBAF0F/Z8FwMDANqn/ofTR9YwJW0ih2Nq
 dn478VNmtqQPt5kzp17Z3OgGGb2fLkzCmucYxpzME8X5no73gKPPmcGAlAoIfmnSwOfPB/sNAX
 iQYI3AB6tFyyjiUIXvx6Fr285d5TPl56C/alREsAIoRDrSglEZTSX3A9xoa26Wtrm/j2tLx9xt
 JSqRLejto/zkmh7zFzhKP930QpccO0lWNFI33p5rjomrerssfAqe9PoprPSOumawuPJy/I/Zg9
 o6tY5qx1g4fWvR9kWXmcflL6arsE6tO0fv+/7NzIhezO0AQAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4190;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tBpi40/zB5GxFBlNNNsb9NVLwpxRzapyur7krJNrANw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmJjfJ9KXx53A8ro8IPqJGL192PsQc0e8IYYzF5
 i8GiT0/tsWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiY3yQAKCRCLPIo+Aiko
 1QLyB/oD2C1PDQAYdttcA+eW0hQpbGnUxH9k0MDFq2AOlp8XbC+n0BbsOT/YujiDzTHnCf4Oi7v
 ahpVjTOtlsa1H0lW0TwqfwnjXbnuPbAQBVuz1MPKsB6wPg/sp4IyIrpuIy7HWKDFN5D9HxMMj7A
 y4/92w8ZVl5/HX7G351dqdf5C8hhrxMBamc/S+jxH6KAaqQaIt0owj4N+pF58twdletsuU2ZyIN
 2a2PvjttIy3Ge/sdCAsiWXMSMFrLr6PSwBcMnfkroAM17XB/hi8DNIHnqsH3+iYMzs9RsfmuNtT
 F26mi438aU58m2MocyPxrrp5eXiBZADxNydKfizAZ2Q5uzP9
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

Unlike previous revisions of the patchset, this iteration uses static
configuration per platform, rather than building it dynamically from the
list of DSPs being started.

--
2.39.2

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: Johan Hovold <johan+linaro@kernel.org>
Cc: Xilin Wu <wuxilin123@gmail.com>

Changes in v6:
- Reworked mutex to fix lockdep issue on deregistration
- Fixed dependencies between PD-mapper and remoteproc to fix modular
  builds (Krzysztof)
- Added EXPORT_SYMBOL_GPL to fix modular builds (Krzysztof)
- Fixed kerneldocs (Krzysztof)
- Removed extra pr_debug messages (Krzysztof)
- Fixed wcss build (Krzysztof)
- Added platforms which do not require protection domain mapping to
  silence the notice on those platforms
- Link to v5: https://lore.kernel.org/r/20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org

Changes in v5:
- pdr: drop lock in pdr_register_listener, list_lock is already held (Chris Lew)
- pd_mapper: reworked to provide static configuration per platform
  (Bjorn)
- Link to v4: https://lore.kernel.org/r/20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org

Changes in v4:
- Fixed missing chunk, reenabled kfree in qmi_del_server (Konrad)
- Added configuration for sm6350 (Thanks to Luca)
- Removed RFC tag (Konrad)
- Link to v3: https://lore.kernel.org/r/20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org

Changes in RFC v3:
- Send start / stop notifications when PD-mapper domain list is changed
- Reworked the way PD-mapper treats protection domains, register all of
  them in a single batch
- Added SC7180 domains configuration based on TCL Book 14 GO
- Link to v2: https://lore.kernel.org/r/20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org

Changes in RFC v2:
- Swapped num_domains / domains (Konrad)
- Fixed an issue with battery not working on sc8280xp
- Added missing configuration for QCS404

---
Dmitry Baryshkov (6):
      soc: qcom: pdr: protect locator_addr with the main mutex
      soc: qcom: pdr: fix parsing of domains lists
      soc: qcom: pdr: extract PDR message marshalling data
      soc: qcom: qmi: add a way to remove running service
      soc: qcom: add pd-mapper implementation
      remoteproc: qcom: enable in-kernel PD mapper

 drivers/remoteproc/Kconfig          |   4 +
 drivers/remoteproc/qcom_q6v5_adsp.c |  11 +-
 drivers/remoteproc/qcom_q6v5_mss.c  |  10 +-
 drivers/remoteproc/qcom_q6v5_pas.c  |  12 +-
 drivers/remoteproc/qcom_q6v5_wcss.c |  12 +-
 drivers/soc/qcom/Kconfig            |  14 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/pdr_interface.c    |   6 +-
 drivers/soc/qcom/pdr_internal.h     | 318 ++---------------
 drivers/soc/qcom/qcom_pd_mapper.c   | 656 ++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdr_msg.c     | 349 +++++++++++++++++++
 drivers/soc/qcom/qmi_interface.c    |  67 ++++
 include/linux/soc/qcom/pd_mapper.h  |  28 ++
 include/linux/soc/qcom/qmi.h        |   2 +
 14 files changed, 1189 insertions(+), 302 deletions(-)
---
base-commit: a35e92ef04c07bd473404b9b73d489aea19a60a8
change-id: 20240301-qcom-pd-mapper-e12d622d4ad0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


