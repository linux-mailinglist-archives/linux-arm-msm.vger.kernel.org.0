Return-Path: <linux-arm-msm+bounces-36650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C39B29B884C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 02:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75CB02829C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 01:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EE444C77;
	Fri,  1 Nov 2024 01:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BbF74Irk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C98B28DD0
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 01:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730424178; cv=none; b=J3NBXg1czUnKawC/aQH7bEDbzT7f28VtjcvWhJPqpdjD5IXseG4geFIowUJ1LS9fmft+38j9V677MyGxKdPmPJ4zcYGBpwArdyVgM0D3pG0ZBuDaRV3ijanWl7BrxBPaAB92PW9poczoxMV7Kl928mw8KCKaB8sG5rytxEb1+/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730424178; c=relaxed/simple;
	bh=y3W0QlF0pHUhgxWrrr5HTFUY6Bau3zJlqfQaSdHHzJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SeHy6Gtz0Kh8tNsXOBgpIcKgQrklU2fEAaydeLWm1Up1skylobjqbXrofDt4MXKlVx0S93AQnmWn4vIdFbYjall3kFfThhBbp7/v8ICnrus3qVu3ZSlRr5+wO5XtQRMI+ruAmtE2ZMs0FsTE4I/yHZccaeT80lIfbDxKY/fcDtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BbF74Irk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso16533245e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 18:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730424169; x=1731028969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn4kry6m/4mklH5IfU4CmPkq9g/NGwiE8SJ27fMIJ2k=;
        b=BbF74IrkReJAHDw/0zZBwj8V17ANBg4V7puDhrKw7i3LaTQ0zasANVfFYNPvqyY7Dm
         86qmFC3qn6Z0NPKE+wsELDnvz+Cip3HzhT/9XXIYoXJ1cxEOf6Kluq0a+vW/oHCYS9Pj
         j1WwobR664sztxNx2uhKxfczJ1csVKyEx3/afYCxX0PQ1HLuIz7rhuOabwtNcpRMfDD2
         F6zbP5YvQ0pLgoRbMrWrGeACmkm13ENrfi2Uvd9HbWnfPg90a6pqZKSkvH/MOdl3akRW
         JLLXvWM70bU8Lumz9LqmQdLXsIh7YWF6dyAXkAJqd2V0ZmJTA/LjzAdOqnt5E095maJc
         IzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730424169; x=1731028969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rn4kry6m/4mklH5IfU4CmPkq9g/NGwiE8SJ27fMIJ2k=;
        b=NUW0iEL2St96QABLvAhMy0781Ef4DTEB3eAf0V86Pbt1uCWsN+rXyoCsqSv/4Eyoqx
         3EBau5pHfg8JsCk3mXmKsMH56FkYTYS0DaHUpFNJrRgL43xvnWlxbXQ8XxDJhmKQW6Cj
         Q6XLkhaiEgEkGy0E+F12FMFvm6iSOha5eyJS/yxHO/500elaNe9fSV1N1PRv2zIUo4y0
         eYzQYKG566X9ikFzDPDJTAIdoia4AwV2SvDPA+XMf1vnxn+LUWF+6C8irFznwnoBZgP/
         gc76UntCOxo5/lRXS9F+iRDCNfLAU3kq8vZsjwQusEVErahEN82vfsE0CJP7QbliOD3E
         bWdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4kfxkHwf3ZOPEzu97Ytt5m0A5zfdyGsRc7NzrAngD6dwRkYdttp4UdTzLkvz8cSEiT8glJMM6T0H4nV4/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0F3TAfuXsybFSpAcnFxX2XknfTMteiDExEXa30mfzaRG1PitF
	DG8Rnosf319w1Yg6D4AbATr3dkvndycCsQup/hu8pKCUdvbjzvf6sYU8KxfYhrY=
X-Google-Smtp-Source: AGHT+IEd3p8ING9n6nUBlO8Ke9VQAg3GlSiKlwo36+DVc7pK/fktIh4uuK1JDCaWsyMf+QwtDc/8UA==
X-Received: by 2002:a05:600c:5121:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-43283295905mr16252715e9.32.1730424169610;
        Thu, 31 Oct 2024 18:22:49 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116ad3fsm3501622f8f.95.2024.10.31.18.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 18:22:48 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org
Subject: [PATCH v2 0/2] Qualcomm sm6115 LPASS clock controller
Date: Fri,  1 Nov 2024 01:22:45 +0000
Message-ID: <20241101012247.216825-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is one of the required dependencies for audio support on sm6115 and
its derivatives SoCs. This was written by Konrad Dybcio, however his linaro
email is already invalid. Konrad suggested sending it as-is and keeping
him in c/c. Some updates may be still required, for instance the
maintainers line in DT bindings file.

This was tested on QRB4210 (Qualcomm RB2 board). The only changes from my
side were fixing compilation errors and small changes in commit messages.

This is second attempt and v2 as suggested.

Changes in v2:
 -- added Reviewed-by tag to first patch;
 -- removed the second example as suggested by Krzysztof in the first patch;
 -- dropped patch "clk: qcom: reset: Increase max reset delay", the change
 already landed.

URL to initial series by Konrad:
https://lore.kernel.org/linux-clk/20230825-topic-6115_lpasscc-v1-0-d4857be298e3@linaro.org/
URL to failed attempt to send it recently:
https://lore.kernel.org/linux-clk/20241017005800.1175419-1-alexey.klimov@linaro.org/

Konrad Dybcio (2):
  dt-bindings: clock: Add Qualcomm SM6115 LPASS clock controller
  clk: qcom: Add SM6115 LPASSCC

 .../bindings/clock/qcom,sm6115-lpasscc.yaml   | 46 ++++++++++
 drivers/clk/qcom/Kconfig                      |  9 ++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-sm6115.c             | 85 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sm6115-lpasscc.h   | 15 ++++
 5 files changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-sm6115.c
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-lpasscc.h

-- 
2.45.2


