Return-Path: <linux-arm-msm+bounces-23288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A8790F787
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 22:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4F801F223FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B54776413;
	Wed, 19 Jun 2024 20:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bbqkDsYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2864158D62
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 20:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718829227; cv=none; b=IwQcgcPFqvP/takmMvh7BjLFy6lsDfs/PW/gbWQyamYIuaE5YXT6BIBgfcbvgjcJSLWmxd4Fn6wChbjmBVvXkdeGrSGv8Lo7Q4OMWhu1uQyoLaj75/3vBuv+2jcnG5NeW6qf1vEKYsIx8kJYKQdZZWgw7OpawEpXzrMWC9wtySo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718829227; c=relaxed/simple;
	bh=f67QJdbycqA6m6cnskiDGAXKC6TlZi9aPjOguev0G+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ao33jf8VtF7dSAoZQvvSz5nRRJeaAnpSCKOIgCEI3vQ3l04pykPIWA8RJTlebFtv5Z1R2sH0CufjVGj1w9qpRYMFq+xMZ6W9yrDTFJW57a+BSIyckgwcfLh4o72OBtpph4iCOvpvByHU5YsCNaGjzZKNnmewiJwBUNfCDHaK1FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bbqkDsYv; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cc5d5179aso289556e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 13:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718829224; x=1719434024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpjhB/J8xgo/XgOi5i1CrseMMYrRbkPzbmxro5VFmF8=;
        b=bbqkDsYvnmFm2qNcRvD1oVWsNFksJ4m0jJyzSvNYXy9vrnQplZNYis5zhIU2MAX+z1
         wFQ7+gVlwDNUcCmkkziF3Fi9JiqZbaRF5wA3kD/p+FlsPUedA4Fvc4Acfxn62HOby0/p
         Ncp/sd6YvW/rQqXZwzRuhW4AgoOxWl0V7a3qd4uK6tWlPEowtw500AAt+ShVFy+JttdR
         24Ki7jPHkxru0S5xapq6G3nYwpDGJSF9lu+uisOhd21I3ZpS6MBjvUURyhndFRn1EDys
         KcrP02r0SetLHNdM7YYsg6bwQZYmCpgeYLV+hKxwsZlkGA1u3FVJxJiiRq/i5/riWwOl
         d6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718829224; x=1719434024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CpjhB/J8xgo/XgOi5i1CrseMMYrRbkPzbmxro5VFmF8=;
        b=tR9jk7ZdeMwH0auj/NHKKgRWx8657J1SJyXrA0ountGiX2VwkO70nDPlP23qPmJyJd
         9vz5tNjpTI/cMelF/ijm2cdayCpVP+lqToJLWpv4Wnk0aDhue9NMv01D50SCysJkY6Zk
         szudjqNO66uyYDUq08k6xYjOfcMoEjLkrTG9OJWCS528Q765LLP39gl22hGHGbuS8BRx
         H2MEBdBJzidTYiAf4W7d12sZpmnbtxhm8bs1Yx8GptUxJYTDnkPRq2Iua7t87ArBOWja
         9nveXu9J0RtkwRIo5j1ffVhhBn3BjpmgTP/ItCsfGsU9uc4STh9Z8Bf8NYJ47AVye6MH
         tj9A==
X-Forwarded-Encrypted: i=1; AJvYcCVpcD351qcs3QOVnMrLodNt/jADYmXneUmeo4Wd1GkPi6njp8qBabmhI52YuhY8xIAHoJtaI+9G92lAQjtJgNQ64okMrshpwg8x/oBIQg==
X-Gm-Message-State: AOJu0YwTkyY9eved1nkxKC30ypCKrJyShDVafOB+CumGziWXkW6FuuGD
	sED8U1J27DFFcV1Jym/Pr5Ikck1HNWLnMpPE22h7Fgj9JapWfQGvySbzcG6929c=
X-Google-Smtp-Source: AGHT+IE63pZOGKhE+EYN8PeXRBqv7Y1lpn5RQo8SG9SKyzuvZkyzQ1N8bFAW4oFlRd3cPuE9+P36UQ==
X-Received: by 2002:a05:6512:2087:b0:52c:8f56:3fcb with SMTP id 2adb3069b0e04-52ccaa2c886mr2151569e87.5.1718829223815;
        Wed, 19 Jun 2024 13:33:43 -0700 (PDT)
Received: from [192.168.0.113] ([2a02:8109:aa0d:be00::ebdd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56db5c3dsm696864866b.55.2024.06.19.13.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 13:33:43 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Wed, 19 Jun 2024 22:33:39 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: set
 role-switch-default-mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-rb2-fixes-v1-2-1d2b1d711969@linaro.org>
References: <20240619-rb2-fixes-v1-0-1d2b1d711969@linaro.org>
In-Reply-To: <20240619-rb2-fixes-v1-0-1d2b1d711969@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=683;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=f67QJdbycqA6m6cnskiDGAXKC6TlZi9aPjOguev0G+k=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmc0Ck7QMt0pQEkDQiC5Xe14HyxG6DS5lnn0VMY
 2QPDWUlRwiJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZnNApAAKCRAFgzErGV9k
 tp1pD/4y1U2IC4rfByl5kB/aRorRbUgCFj6DBZONlBoroyEC3X53gysSVeOD71iFNLb+wfpDKvi
 mMi5uPo+yXsgnkytSN+LcYghQ0Ogwr+PpVLQEjX/HSQzll9XyFVVFvtq9nvpug2Txgk7htF/1x8
 Dp+sYurTX5ygzOuZtGsrcjZBtk66IY/5TB6eJ5LkpU24RKw6Y9Yge/mxCcYHtZ0tYVNJupH7xNx
 apHNtLrxhuy7mauA66iNbEKCsUF8/XPMSkPSo+U7If2FYRQRSh2+2Yw6kyahWL3UcEruzlvkUrI
 VJ/b0tN2Dy4oFmC4kPGUPz6JfrUhbkIJbEYpjKCkmuglxpH93QzDxnoR+9hAsEHvfOXj7EelSqk
 4AOEJ8nWrzPCqEx9X3GWsGfo0H0VZEt9amzNGYHXyATg1Mx6YehchAVAT3BbQvsvJB8U6DdMVuB
 8wNWjoyqz/OCYRotRRZ0cw/jRCrqphjpJUHBKN2MkdUfgydKsbdCkZ+TG88ez+GaL8vAb4deBZX
 Dm3qg1V1JgYBXamANLKkD6r49gLrgVU0yXWEKm4CXyP03yeWH1oWeUPD6lF80mEGjxRkffFLbOB
 59Cv2mKwyJLpzV12cZUWfLPdAoavV10ZyQ1s3CTzMY3TiGLZouj+4OtdW54CJYeujujDUW5ukUL
 ZhoJRFWJegjz3jA==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

Give a hint to the OS which role we prefer. Host mode generally makes
the most sense.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 2c39bb1b97db..e9a63956b8b7 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -648,8 +648,12 @@ &uart4 {
 &usb {
 	status = "okay";
 };
 
+&usb_dwc3 {
+	role-switch-default-mode = "host";
+};
+
 &usb_dwc3_hs {
 	remote-endpoint = <&pmi632_hs_in>;
 };
 

-- 
2.45.0


