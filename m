Return-Path: <linux-arm-msm+bounces-32256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3B1984310
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBB731C22719
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D693158DD9;
	Tue, 24 Sep 2024 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rtyffViO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEDD175D4B
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172386; cv=none; b=CkT9cqDlxxdGqFHfycz3jQ/Opc1PMMl0sl0ool9zEfizy8OpbI0HEEH3NnaeVK3w1FL/0UoOdB61yOjUGGwsSbK/ep+MIiYGu5T6nRB4VS1jj+Hbznm7z08s23SAs4A6vK4EPQQ0SvNRhNTvycVSHn6H0XVRcbT+DwdZRQIjB30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172386; c=relaxed/simple;
	bh=I8bnCAjFEgDx/nnzV3s/VVgMlRimIbCLgE5ObIXJwqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDWoSxZ5OliYsEZ3QJeULMYLka+2OuqlK9OhzpzW4WUhhyNC43jTLnP/A6DYCjwYvVp+gBuWVcyPAcRA4oVt3+FkVUnzbtPKZL8YszGPTxkFld0JtwqY+LJQq5Wu1fKtkdlgbFv2D2GwRv9LAMSFYKcevf2fSImJaretXEP2JJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rtyffViO; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53652c3bffdso778033e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727172383; x=1727777183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQYDgDj318Zcuv6w/7GHC4cQwXdEYc6OOV+sqh26C3I=;
        b=rtyffViOhdheilW8G2cIMMRYSiMFMjw7RJp2m8U+kdQbQbDQ7kN2IKQeoqTDC15iGi
         h2kmWUuz143wHZxGSDY3CQkVFLsEiFapfHTYaRAQmIhtYSJE3AVRhvz+KgWEUBAFvSSR
         gcKDD5pikYu8ut9l3TVRmLpREXYmF0KmjZvJD83Yc2Wq0XB0qLwNJV6+fW0jIqU4zIdE
         OKwLNKIkidslTl1m9uCYzkU6qCDrJXRXHbkjgmTx56e81ilN5iAYq94UNeL1wQ5vYIBa
         fK1ACPKYcslKO/Kn+CFUiXGEfmbrJEhnYW3re2q8mrMVo5Mgnz2zH/RBrIYmtKX7+DxO
         Sifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727172383; x=1727777183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQYDgDj318Zcuv6w/7GHC4cQwXdEYc6OOV+sqh26C3I=;
        b=wJmTgpLHSbKIKN8aZjXZUMcznkDib2078Nq0dTFAKPu9WVQEmT89EWZ1HWLms1Plpw
         AVd2fu2P4DlFxsH8CYqqq1oYjn2KUecGQwcIJc1fsKi+/X4V5t/MvfUUxB2iqW4S4NSq
         v5YFECeOCZ069Tz67JlTks1yhECyU08qJy7xdqy8U7cmDZDij3yBOLT038SrF8VvuAAm
         lbJCrHU0pZ4Z2W0SS7Iwa1nbwM4BaYO5ZJ6LvVKlnc0h476BPpn5XvbaYJ2nah1QdbZB
         R6usE+gbKhDWFjoUY14Jf+2P94Uk+kBjGqqFbkuCSkBpCx/jh3w+5AMaEqC61LB1Bhl7
         bE4w==
X-Forwarded-Encrypted: i=1; AJvYcCXxmglGJqT42+IUuNec1xxRRGjhr2qeM5txf8Pj7dmTTZ8b/+NP4UZlSWBn/s8JHsruAm/XS1E9IqWZ6u6h@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkr039bzxS+ieJ3QpUxHM9CvJ2eF/s7oqtTkmN3VfWSgtV63XF
	R+eVxSNaEJ/2cIGZJNkKdocDbMGYoC6JbXfM66sMcY+t6DKX2FHVI/HiKzx7UMA=
X-Google-Smtp-Source: AGHT+IEwgVPZ34CvAV8kbvCPO3RRq9CnOBURw+NZjRavXbHUn92YOK9SdG/etv9W2Ypz6Hc8JCbZ1Q==
X-Received: by 2002:a05:6512:e88:b0:52f:413:30de with SMTP id 2adb3069b0e04-537a780b55bmr314558e87.7.1727172382695;
        Tue, 24 Sep 2024 03:06:22 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d937sm156713e87.273.2024.09.24.03.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:06:22 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: qcom: sm8450-hdk: remove status property from dispcc device tree node
Date: Tue, 24 Sep 2024 13:05:58 +0300
Message-ID: <20240924100602.3813725-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
References: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a change enabling display clock controller for all Qualcomm SM8450
powered board by default there is no more need to set a status property
of dispcc on SM8450-HDK board.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index a754b8fe9167..67443822653d 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -575,10 +575,6 @@ vreg_l7e_2p8: ldo7 {
 	};
 };
 
-&dispcc {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 
-- 
2.45.2


