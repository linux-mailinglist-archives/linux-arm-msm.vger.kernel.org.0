Return-Path: <linux-arm-msm+bounces-30404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF9F968A8A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 17:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2398FB20299
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A0E1CB520;
	Mon,  2 Sep 2024 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="toNQvgNX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6861CB502
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Sep 2024 15:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725289315; cv=none; b=o1sU3N1IR0IEQofF1+VxJwp/jq8jzR+ye2SdJ16fs8eWXMgcOQiGPRsFCv0ZeRj6kggs0LUOgo3a3P8aTFbUS+PJlKaZWd11kwQgrVbu91eHig/zTjhWHQM0yjETgCIeO2rH7XZv1FdBQHBn11id43niN0PsvFm2FZEu0C5yMNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725289315; c=relaxed/simple;
	bh=a5A8lrDqI7aFR/XW1zOdLm52l4YORaA4kyHAIIBduoM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T80e9iSYcmtOcfZF7UCMIYWR5qVMfOxNv5IEyXAJlLJ7/JX4+UjF/NHx63AzASHheespuorbJL3V9JkB4ORl3PJDVv5HgFpQ/krizulCW4WMu5BCinjcU6BUYIiFY7QGOeWgEe028Cn8EcZVzL4TDdy5c0IffDutPwsUVjJWw3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=toNQvgNX; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-533488ffaf7so5898060e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 08:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725289311; x=1725894111; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cO1TeBbYIYHALWkaQ6znvGEY3FTlPVW1y1SlK7fzBG0=;
        b=toNQvgNX3crI7QSbypTQmCvCVDoMPIgy8TBJgqX8I+M/TtiavQvK2bvIm7dhD8tQCh
         7PY4Jd7gccNyxbURiEvQUxK8fsmHDxrlYslfaiFq68GU+WOKXQ5l9agn1gTi1B4p+Wk/
         3omrzmoJcpD1aJwZ422Adgav0VOH943sqOOBBhzVtXZbB6TLVQVrZS2LVLc/ST96UxeM
         ZD/J6uZNYnFBP+rfCyPIs0enVgDNPNAEq862zPIq+VI4ET+lr6sD4JLuEuWB7B6KzzTg
         CoeIz9v8Z0VRpDt7U0kOAW3IjFPDypm9YWqKBdda1qxt9TCfEeusfhftzu1e8Gif25SV
         9IYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725289311; x=1725894111;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cO1TeBbYIYHALWkaQ6znvGEY3FTlPVW1y1SlK7fzBG0=;
        b=o1UsEQzEKoIYX9J8pY8UCEWxKP2VptduA10YPFIszOOwKRdJ4nF90XM+Za2vF6jHNq
         aMwSgt1QkbLt4wbMZewcpodXgqWFnbpSPCdaczhVKPj3QoNyBhdtot2hVpwUWaQd5R8r
         qG9Yin4Vv6vI2V+Gnv1MRnF5m/cYe8+eOYhjY7kERs1BFcpMPa1z94WEm5LHkB4wzrRt
         fW3WjoAXv2jg9IuDU3CH4Lqx941eEoa9fI+VAiK/9fHIK3fLiygkyJoDCscjAMe/rfhc
         iT7HWBanMyeQMGhmT6dBATdSQfgXAiRyowni4H+esjUBaGStxWk/mttkIoL19pQ/Zg0Q
         CVRg==
X-Forwarded-Encrypted: i=1; AJvYcCVq83Ch7jjhTzmTCqYN8zXpRld8Axfp41QDRo892QQklXkHdcnr9k0hAOdZrHVQyLk7f8e+CnxLWqGqAigx@vger.kernel.org
X-Gm-Message-State: AOJu0YzVRWGdOfddU39JQsYvfXHzFLHt0fsxHr254O3xStryKGFthmkU
	F4sN5XC5mdBvRq0U8hUFzUGZIrjz84zCCrvjbpfTQtfAKa/HzVzlB6iVkNtlilw=
X-Google-Smtp-Source: AGHT+IH2YT7rJocKs0+uuQx+mqu6cGEnnz9isj+MTJuPQadaagNcOFaopjl/zwMkyPz6WYXDJbToMg==
X-Received: by 2002:a05:6512:68c:b0:52c:d76f:7f61 with SMTP id 2adb3069b0e04-53546bb4d04mr5408823e87.56.1725289310903;
        Mon, 02 Sep 2024 08:01:50 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6deb1ebsm140726115e9.3.2024.09.02.08.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 08:01:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: x1e80100: Add external DP support to
 CRD and T14s
Date: Mon, 02 Sep 2024 18:01:34 +0300
Message-Id: <20240902-x1e80100-crd-dts-add-external-dp-support-v1-0-899c264c0eb7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE7T1WYC/x3NwQrCMAyA4VcZORtIu02qryIeypJpQLqSdlIYe
 3eLx+/y/wcUMZUC9+EAk68W3VKHuwywvGN6CSp3gyc/UfA3bE4COSJcjJFrwciM0qpYih/kjGX
 PebOKgeM6xtldgx+h57LJqu2/ejzP8wfZ7JmHegAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=a5A8lrDqI7aFR/XW1zOdLm52l4YORaA4kyHAIIBduoM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBm1dNWNFqyXrRXAxBH/1HLx31mMJe3qk7v4lBMz
 vO/YuiJIM6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZtXTVgAKCRAbX0TJAJUV
 VvuVD/9BEYvrzyVbSQUpZUdk/y94RgWp7nAR6xAEoyNUR8/iXABZrEJieqRGVUC5fuUKoCNftr4
 kZO3lOlWWHqD26C6BHCWTSHhyniHxlKqYWvRr4aA1Ke3n+d4J/SICJg5mjAYjO6Dn1NRl2ZX5Ds
 nr3z+oSyGGarAzJa07rNnUxKlkoZUKyqpN6HoYH+dBySJ3YoxZwNSO2QZQtyLBOn6XvPTOTDH/r
 DzhHZpz8LoQ4Eo2xkJ6TE9nGhXPPIETZzv5wRn6GRIMBuPLrjmN/uecoKRvUaKVMSmP0RLoXLyf
 X2BnL6GVkz76Y69NUAgikn9gq/wuL/sayWc4KnJ3Cin2H3up6pd2dxsfXXLuteSlnpiE+6lAULW
 kcuC5LbhaREcdX8PTv23Mca3kWKVYbtzXW1Jcth7BVbbEVH/RoeX/T0KSo6eT5FBQgtm0k2ebo7
 KnBdW01Ky0k3Zrml5beMMV12GUM7ydMs6K8sHmeN9c2SSMOzMfjjHzxBqhE5Zlx7aIOtn/nCAFR
 TU7UWdPmeRkTZsitYHQjxRAokNeebLYkIdfx8GwK2vCftU8PzFWRBl6I9SHAzVSxVt+D51HVhK0
 JgL8IfxoATyWBsV2S9ivgNJ9krWbknbB/kF2U10ilPZxaorbCywTt7VUE/6lGmy5/eioH6iCi3k
 w2tRiGtDKhmf5nQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Both the CRD and T14s support altmode for external DisplayPort over the
USB Type-C connectors. The CRD has 3 such connectors while the T14s has
only 2.

Enabling DP altmode requires the support for the Parade PS8830 USB Type-C
retimer. [1]

Currently, only the DP 4lanes and USB3 modes have been successfully
tested on both CRD and T14s. The DP 2lanes + USB3 mode seems to suggest
that changes are further needed in the QMP PHY driver.

[1]
https://lore.kernel.org/all/20240829-x1e80100-ps8830-v1-0-bcc4790b1d45@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (2):
      arm64: dts: qcom: x1e80100-crd: Enable external DP support
      arm64: dts: qcom: x1e80100-t14s: Add external DP support

 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 278 +++++++++++++-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 414 ++++++++++++++++++++-
 2 files changed, 682 insertions(+), 10 deletions(-)
---
base-commit: ecc768a84f0b8e631986f9ade3118fa37852fef0
change-id: 20240829-x1e80100-crd-dts-add-external-dp-support-8daf3a516823

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


