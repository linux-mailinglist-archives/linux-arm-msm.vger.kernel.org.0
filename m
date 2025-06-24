Return-Path: <linux-arm-msm+bounces-62182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9319AE610F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E53F1790B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 09:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB73F27C879;
	Tue, 24 Jun 2025 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GbnLvBGB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A601425A349
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758188; cv=none; b=HPDXLxJnDQ+hdNE//nLMMYgL5y3+OvM/CofPLcLlpW2YBdP7W15PBpXI1GArx5Gj7Ni6ICC0tqoD9WeYhyj0sOO1Gj28Dd66b4VwY09Vzx+pW88iZDXRpprXdBSZ6x3d+CNyK2c6vNvxhVZKoqy9nlKvrPo5f28VikSB2uxRTMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758188; c=relaxed/simple;
	bh=aKVHs9BNm/mooH2PzEQj6OMW28srDvk9sw6OOEomA0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bacwWnj5Mc+6Cxeettq8KgcnbGfQpeud1zS+5UABX6WadWYlTO2R6sDDbtK/uicQsVkwkwkRv7DvMdjwNkbQldSUIMH4UnRsJKYAtJxbWOhTEEezvsWEoWaN7D8Ppd1CPnO2fyg1RUBqH+T7VyM2fbvMBw50mRW2BdH7NNS9Bvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GbnLvBGB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553b9d85706so701256e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750758184; x=1751362984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JRW6Y0n90vxkzJFGPiB+J4F9Eeo807Rauzaf+xKHkvQ=;
        b=GbnLvBGBUBr+olgx6m4XhoB9P19Laqkpz+OsvjbelfYAjfdrbedjuBXFY6kdIo7M6E
         G4WKm0HELQDdU2ZoS4923Z66mPh5UYW5uJFovx2dkyIKg1PVPoGpewqVg3EZNMHjV/Fe
         KzsskYdS0WeF5/3l8/lPsmNhbMasMRLfH3UOn92EMd4HvFDAdWZa3yKJPPzMY9qG3+C0
         409vEmWlwK3GLQbXVcMpGoR0ELTyAh3eo3kOdVYkXoIRrwZrCna2RMEpjb4Jem4QUXJw
         C6bUPRbueuLBQAJmqVfL0FygozRFX7mPwQEr0Ry//GzQDSupyXcab3v19R0Mq12JDuuI
         1Qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750758184; x=1751362984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRW6Y0n90vxkzJFGPiB+J4F9Eeo807Rauzaf+xKHkvQ=;
        b=wyzuxdC+JXEnsN30tXpFMgdPIifuDYF0pUdSMY/PXsF6crrnULMPXIK//gqgZ45E1u
         mQM8GWlCARX+KQjmm2nD3hwN9rf5fjaFe+u3e5T+cYac8VKFd7N8DlKgrIrFWtDo2MtN
         H/sadQ3igvZzpnaeHX6DLnzBKv6AxXldaZT4Zl0bFRIMhMxMCOaYA2SQ4QWqo+qceO/l
         J5JqPWTP6X1Ll24k0vEaR6L/cZhq9jWlEBKQem5BYmMwsUqTPdBhddHog/FVQnmD+HOe
         L5lLQyBHEAQjqMv24dOd/gi9GTibqPWXM2NyiH0DB3Bg1H97Wl4fGVcWVSDJzKJYweN0
         x8Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVpI1r7gOONUqo8NSqLo46PTmi+f/RInrfTAVkGs3xuALaDqYYc3j7LEMzMD1EFOJ4t6gaBV8YPuf4/tB0b@vger.kernel.org
X-Gm-Message-State: AOJu0YxmdmLaMN6dOwahlOvG/CZt2hoU/bbNBkHxPioWBL2v8IIC1wVe
	uZuAgaFQ39dNj/9MCmkoasKIQbZVckzB6FerG4tBdmYMD7CzVjiYKkYQEX1HJErb9gU=
X-Gm-Gg: ASbGncsbBLqPkI9lHBpoE90t2Q7Yh4NjuyRD9V+Ef0lWFgqAIg78ur7yENVeTFK1Mhv
	ZD0Ynf5Jc8looY1ce8zNbng/NR8sefH6LF8GWaF2GBMwcbqNOWe+UPvg2XVRLIeIwTxFo8Caypc
	CVcfXOj/WJ8UUC9S3aOJXOspkBm1zIbvwY56RL1SgLxieLS5/j9dzWcPphvMdyED+ygmqdbJaCp
	5NqCp+zxrr9RD3B+GtiG2/7B3gY4yAWT/D39ZwzQASxNrAufHemswYIJn21MfVg6aJ8oLoALrfB
	Am5TjzAeUhZHlleMzgrvT6pfXnyf+0bePQQ3ZnDai7q86+1G6hbkzIF1KXelGXwFJyO/LRMAv2F
	cbceLtAM3PdSbjH439jJHhbXTDwzok+r9NvT9dHsAGxNU2er9uVKpm6Y8xOamYw==
X-Google-Smtp-Source: AGHT+IEcjSc5H18Vb1fNysRQizg1q9F6o3XBgWlbmq5FEa2B9vx64nrRzhnJbuDe5ORvipHHhEkPtA==
X-Received: by 2002:a05:6512:3e04:b0:553:cf10:e424 with SMTP id 2adb3069b0e04-553e3ba74aamr1549856e87.2.1750758183755;
        Tue, 24 Jun 2025 02:43:03 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414445asm1745793e87.12.2025.06.24.02.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:43:03 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] dt-bindings: media: qcom,x1e80100-camss: two minor changes
Date: Tue, 24 Jun 2025 12:42:51 +0300
Message-ID: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series contains a couple of minor improvements to qcom,x1e80100-camss
device tree binding scheme.

Changes from v1 to v2:
* removed Fixes tag from both changes per discussion (Bryan, Dmitry),
* added a note to 1/2 commit message that is an ABI change (Dmitry),
* added Bryan's Reviewed-by tag to 2/2 change.

Links to v1:
* 1/2 https://lore.kernel.org/all/20250610083318.2773727-1-vladimir.zapolskiy@linaro.org/
* 2/2 https://lore.kernel.org/all/20250610083318.2773727-2-vladimir.zapolskiy@linaro.org/

Vladimir Zapolskiy (2):
  dt-bindings: media: qcom,x1e80100-camss: Sort interconnects alphabetically
  dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address

 .../bindings/media/qcom,x1e80100-camss.yaml          | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.49.0


