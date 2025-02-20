Return-Path: <linux-arm-msm+bounces-48752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C69A3E2C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 18:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA21C17B908
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08E52135A2;
	Thu, 20 Feb 2025 17:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="STjaQMZD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3B2206F0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740073373; cv=none; b=O87KTkj0GpS5Mq9BHddbME1jbV48PAzA2QhhcmTzgCgpPp53oKA3VMxMHE9R6a70qAuqqIu9vVfGQWW0wHDiireSqxSwO51G96hNSBHUOHKf0JTlSOLZIpQhfeDTIy0kxH2MFaYTXle/ucLryYNgAzRadCWLLRhINp8FQK+x5ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740073373; c=relaxed/simple;
	bh=yv+7nS4jmbOfp98rdkRLKvJ23EP9E+LK1yT+sD3pURQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kzj599O9f+swlX0TzamJqphWGUCYqh8JWTjvRRRgcg2kOGQgMLEUVoKL7wTQ33AB98w3PZMUZukVYxQGxvyWdx4ci+f04fhxQdUNirEQV954dQTgK37jGxLhDRXzLAFFR8h9bN0Yns/Sb0EEiadCoxWKrCbOQxkjvXGNfZ8rAZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=STjaQMZD; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so1758517a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 09:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740073370; x=1740678170; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WY6MGz2rquwJRcV5RL2GgHgNIJy7CNe31ZrnCOkUQzE=;
        b=STjaQMZDaP0gxXlhEQhead+XTFRSQo0x23SwBBoLE6IshHqXv+AwEmcYCjTpfBcf9f
         xo6KL8usy0EvtG87oqDH8gVv8frvgm9kcd3ZsCWg5KPOvRtWZmnKZ58uFgqJVHGzPGxR
         DVkYp69atUkphUS9gvmN7qOeu5K8CYJZnY0fCkkN4STzyxVDcEcUIKGrlUyGtjrbAdiS
         3PZSSqrq6qGpxQSBhVRlkZriiCikCMFNrxgyGAME9dGVBJw1YfNYTeO3W07ySim+W/I3
         ivelXkAEjOAF/J+bEm86mUvg1trEbtJawCQOQ/b9/+dXlyQjk9/9NSO1QyNJnaZ4aU5u
         NXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740073370; x=1740678170;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WY6MGz2rquwJRcV5RL2GgHgNIJy7CNe31ZrnCOkUQzE=;
        b=K7TqAmSDgyU2KMqFAy+3t81P2VuPhBWgU1yYcJVQGQ00mc/IUizwPtuHUzs2tatiCS
         o+qt6beuuJFkK+GmNe6UFh9n26qJm55k7yF9P0TyrxsrXG7HV2MRrBhM2+cZQTT1ROJo
         tFVP/rSktXlAPvt+HhvI3/3FcWFfyxxx0RotEnv4LK1qEfgyvlvWa4RoX0UNdfeSz/Bj
         eYGcgogS09AfR+Fki1ODY+C9f3fPhx4tAiUugC9Htx5kZm7roysgaEAEL8F/N3lKXYig
         KTYy4Fh576n5P4hk7wF7+M5Gn/PFGhZrUeM4nQe9an/neMOt1Hmg5Fe+ES+xib0eP2En
         ywUA==
X-Forwarded-Encrypted: i=1; AJvYcCVCw6CejwcVfP8+5Gvou0KUgsOsUOl/kt8AI4cIZ8skGxAcJXLKRhezT+JdhAiRo5VmrhvhJn5801KfT/xP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj0N5YRACJiBqXRX8KyzCU/pOrQGB7WHlSyTmWE7btbY7EJXiK
	eNP6vWOvQA/a+9dnrNGjsTe88DM8W530s7GyTBlpSpMf8w7vajHbJqQNO9+oc5E=
X-Gm-Gg: ASbGncucvHnsSZXSM+1AV1QDcZtAgyMcfSgpFslWmr1STzpWA5X8ZfZEKYwL3/PjNlO
	K/j5TnhkR/JFAZbq057UOnHNXJvMzlxOVZzre0SPr5BlG4Xb5iUse+yBvfDVztViK4I24sE/Loy
	FXSgNj7s/MrPRhxeIijwRCkyyRAqPSzSnw4BGwQVmQfsCj31bWuiAdi9C3debpy3ie6C4cuDi6K
	QOaOWb6GYSIBOzbXTdKquBb9rDzhtwaF8AuoxnF/OrVAqTtftvDjCn/wn1mo8TI119sHqesiAkQ
	tjImbWQd13iEYg==
X-Google-Smtp-Source: AGHT+IGGCic5H8dbKxllODGuwh59PT6wMRxRiuH3+9PPFnm4mmjjx1fUWv6zjRIrF0o/8TynlHUNZg==
X-Received: by 2002:a05:6402:4404:b0:5e0:9250:435a with SMTP id 4fb4d7f45d1cf-5e09250445bmr16398290a12.20.1740073369800;
        Thu, 20 Feb 2025 09:42:49 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8190d1b6sm1014496166b.36.2025.02.20.09.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 09:42:48 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RESEND v5 0/4] arm64: dts: qcom: x1e80100: crd/t14s: Enable
 Parade Type-C retimers
Date: Thu, 20 Feb 2025 19:42:29 +0200
Message-Id: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVpt2cC/x3NsQrCMBCA4VcpN3twiYaqs10ddBSHJjn1QGO5C
 1IpfXeL47f8/wTGKmywbyZQ/ojJuywIqwbSoy93RsmLwZMP5D3h6HhLjghzNUyasbqNIZc+Phn
 rd+CEylVerIZrH1KObaRdm2EpDso3Gf+3C5y6c3c8wHWefw2WZsuFAAAA
X-Change-ID: 20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-325cdb7b097d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=yv+7nS4jmbOfp98rdkRLKvJ23EP9E+LK1yT+sD3pURQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnt2mMUW7zhiHHheV4wQHmQqEaccDmsUdljcjOc
 OxvyCUlbPuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ7dpjAAKCRAbX0TJAJUV
 Vqy3EACHbgUqlVCCkn6PxP6fiSw8onlGk47j7VfN6KnhNPKg30UsWWiGfWUbgkNxoovu0DG6gJ7
 SjMl4PAMOakT+fqvP4EsVGjGKfbKviYA0exxLMRZUBEMrip4HXRUjdIK10/UgyUr4ed7Lj6BpHL
 kIUA06RB86xQAW6beOEtHqqx/4jjd1suSk5WJ9AJ/r/3WY2IjDss9ueHRj/Rjpc3b+FARZBj3m6
 ttP4OzGMFSb2Z8GXIio3FL+fdaHKEitxs6avl4223Y+RRm53pFX3PlPUdoByjM7WdpwiyKfKCUV
 wPK1fhtqacVkoVvWAAqFrvYOLmhzhqNglS2gy6P5TE3karUT3SuN2UufsYdWLqPF/vwObORNLx+
 pb/5G6S2f0kaL4GatlTlHMF2a3gLAgviwZD71InXSJDdktLDMoFHUQGWAtjaaoCKbW/9P4wiHBa
 IMrwbODrzCPpN7t1L5qMgpPzO4dkpEogATd+Zu1TExGql3fWdjLvXZmhqPOMN92Mn6UTrd2XxSN
 nP1Oj1zsY5bLgyUW4LfIoWbeOP/5YQzEYlVnnbZ1G3GcMwDkqWj10kxWTbmFwmDmb08/Oi+ubyL
 HEmCexvsH0B9Rm26BI7ThYCFYO7rzOsFp4y0A0WbAekj9mAdFh61xGa2xhz9iEpeBBojfc1zAo5
 RaKTp+St6KnyG9g==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Since the driver and dt-bindings have been alread merged, it has been
agreed offline that there is no point of holding on to these DT patches
even though there are some issues with plug/unplug during suspend in
both pmic-glink-altmode and ucsi-glink. These issues are being worked on
meanwhile. Merging these means that even though this will provide external DP
and USB orientation, plug/unplug during suspend will give some splats
and render both the USB orientation and DP broken. But then, other
X Elite boards already have these nodes described, so lets bring the crd
and t14s to the same level.

These patches are just a resend of the ones found in v5 and dropped in the v6
patchset of the driver and dt-bindings.

Link to v5: https://lore.kernel.org/all/20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (4):
      arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
      arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support
      arm64: dts: qcom: x1e80100-t14s: Describe the Parade PS8830 retimers
      arm64: dts: qcom: x1e80100-t14s: Enable external DisplayPort support

 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 321 +++++++++++++-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 474 ++++++++++++++++++++-
 2 files changed, 785 insertions(+), 10 deletions(-)
---
base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
change-id: 20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-325cdb7b097d

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


