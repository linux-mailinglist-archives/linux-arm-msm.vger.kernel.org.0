Return-Path: <linux-arm-msm+bounces-16003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C83894995
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 04:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71AA82864D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 02:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF487111A3;
	Tue,  2 Apr 2024 02:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JqCrpq+M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF1212E6C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 02:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712026309; cv=none; b=Rs7oRlLe1db/ut1JljJgaVgZHND3atCEep49wT0TfAvMe4X1WlaTj0EJ4MEUmjM0QCacx0BHsYAcEfeUhdgVzn+oeUvM0ylXUYJ75rG+yGBJnU9ZB0Jq3r1Gy8/LZH9US6kLZIGGU3JFaQkC1yGl3C5O3DbN3lXASKh/Y5j7YZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712026309; c=relaxed/simple;
	bh=mipBzLhXme/edDDsNRRaHmAV/zjI88iNQMd61g5M1kU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jM5LHHk9eDcD5I15wP7hvMMzYzX5giIPJKnnwGGQERNaI2OsNhVsyWr5QpSP7vgxJpHYdrSOj5OPvjLP5GoCv5bfJ+ny2mh8iy8w+PsnBj0hBWh28pbP4IiknoHgBzF0YUfAPF9KubYyhWTpnxfe5d1/gEPREhfOmcO+bV+QruI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JqCrpq+M; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513d23be0b6so5076891e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 19:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712026306; x=1712631106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOfJ3g/to7EyTLgt+Fv+Z4h7uzKPNiClRQu90BLeUVg=;
        b=JqCrpq+Mxd6iLearKaHr1U+PGvWJAjRt9azj0E7riF5mJ/lyBXxgPS7dUbI93g9i6/
         WShdrPcjbFDs4wOrYVhAemnsosMTqr7OkPTK+BM9MpMSxUyM4HGSaGCt3xoyvnNY4UC8
         r4mfApl4e31q+Axa4Fr/dha20l+oN0WRf0pHz+3ZJKDICpO5dAC/hf2Qq3ERIqmZi2oN
         MGvar5tGpfAbNCCMKplFi8/jLn91Uw/xan0EEhooZIPzEY39GidRaYmF3XzUOjHC67co
         MypVIoDz5hXkX/OgoVcXk2tdtdDBlN7Aq5lvXdqg7845aNvBUOM0QvxrfFeBub7hk4zQ
         a+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712026306; x=1712631106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOfJ3g/to7EyTLgt+Fv+Z4h7uzKPNiClRQu90BLeUVg=;
        b=bsISvp+jlUbqLjeYsCmxRw5RGYbrur8gL4I5ySvmLbE3xOfQW9GNYrGeZpM+8/8XbA
         whS5qhQ1Xvsk4CQRsQSpBZP7eGAgSsxuc4Pi5JX0u52vVBBjIna/w+5afYlcqcB6q0Ys
         b24q6DgC+HmjfKbYzvmJI6wrrL5fr+MNliKjVYVWxEdtWmFStPVG0FBhjj7Xgez1Ywzd
         7PR+BstOmNdIobHba4wneJJUSTwJAxf6M/9jzlNPYhtBr48sBUNJ0eK5QB1SzE0hFavM
         bLrJPRFX4LogwoPMHQgTPo+S8j+v1G9QKXUoXkgUtq0L3pY9b9Rgxn+Oxcq3BVeke6GM
         WzTg==
X-Gm-Message-State: AOJu0Yy2K0HNlYvQUcA1awvDtMNpfXbRuv4ZgK6PyrsnooGVDq+HLoxD
	x2zDDNkEG3rgODbwyMF4A6oV1a7vslmdvtrZPD2SdVhov2HYDO+UyS4Dmfzk5Rw=
X-Google-Smtp-Source: AGHT+IHNUvGeXt87CyX5BTmaYHcEFwZghtzCXxveGiaB51yrxkZpJLWdYcOya03zz/NEhrSjzF5R0A==
X-Received: by 2002:a19:3801:0:b0:515:d5dc:d32b with SMTP id f1-20020a193801000000b00515d5dcd32bmr6257098lfa.25.1712026306505;
        Mon, 01 Apr 2024 19:51:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h26-20020ac24dba000000b00516a1e2a6fcsm738824lfe.256.2024.04.01.19.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 19:51:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 05:51:44 +0300
Subject: [PATCH v2 2/4] arm64: dts: qcom: sc8180x: drop legacy property
 #stream-id-cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-fd-fix-schema-v2-2-39bf90051d83@linaro.org>
References: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
In-Reply-To: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=807;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mipBzLhXme/edDDsNRRaHmAV/zjI88iNQMd61g5M1kU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3K/9tLaaKflxdYIwpCBLpwR7Rr00FbdzyH1u
 rioPNQYRrWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtyvwAKCRCLPIo+Aiko
 1VwFCACTFvbQU+Q4PmKNdSn8Gpct+tMjw2VxhIicMc83/UknCX70PYqne35++283QFaMq9OWMFP
 uusglJLuCVVOYBjn+Z0YmePgt0BLfuLPTyUqM6gjfe3Fl0saLj+EGzf5Okkcs64+h2SWnHNZg5v
 5h5T3lUOCzF3bePwAwWWErrrDVV0EcSMdnQw+PSV/JvyhFiRbjiBnP1s1Hsg7nFFpqd2xSJQ7EV
 pRgh9r3lY3bRj7sIN8uEjBPw/YRrqUeqzEjL1u7ESkKI58akpAsSFtuZKSkPlNaoH4mzdQQwAOl
 5UMjyMP29KXrvRn7+SSQtzpeJOOsgUsyrVSJfh+U0IPdYb/P
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The property #stream-id-cells is legacy, it is not documented as valid
for the GPU. Drop it now.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 32afc78d5b76..99462b42cfc5 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2225,7 +2225,6 @@ tcsr_mutex: hwlock@1f40000 {
 
 		gpu: gpu@2c00000 {
 			compatible = "qcom,adreno-680.1", "qcom,adreno";
-			#stream-id-cells = <16>;
 
 			reg = <0 0x02c00000 0 0x40000>;
 			reg-names = "kgsl_3d0_reg_memory";

-- 
2.39.2


