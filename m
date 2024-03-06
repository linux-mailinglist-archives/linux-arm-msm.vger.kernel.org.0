Return-Path: <linux-arm-msm+bounces-13432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 066A4873074
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 09:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37DA91C2188A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 08:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954A95D913;
	Wed,  6 Mar 2024 08:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jrs5i+4R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E325D75E
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 08:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709713015; cv=none; b=VNPL7yXSljRBmPj2WU/PdRrVE4k1OzEpkLrLsmCTRIVU3UA7OdqaQtYvCdORKzSLCm0EfEqPSoe8ENrS7Q9UCK+QiUoA0ivHm+dbeMGb6JUDF+cuVUmBmfAUxUW7Dyqs0aLkXKqFICjcszec0SfeP3/ha8pLwJYxuTscJBeYLtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709713015; c=relaxed/simple;
	bh=9uiYDBpJ8s46sR33Y+BMEdKtwAlaQcnmoofd3iM8ghU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uSJpwznDc7rxZ7P/ass8u8nfOzg1yw6KI3gFln5wCPeGxIJr6CCHNhEiJvHSiWpdTx6/avbAgg0uYs0xv5d6xE5ERmCOOWNV8vR1PmNjWEPCQ8vGGoJ2b8Glf7KV/KwXh425damjJrCprUdUoEOJbwxaj7VepUDDNgia+TZTbqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jrs5i+4R; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5135540c40dso1774838e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 00:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709713012; x=1710317812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YkceKDYceYDeQ4XBB8A4mSK+rDJiaduuPabI+Vyi2Q=;
        b=Jrs5i+4RcW+q4TcOX6HGJyawHLe4Ka0HJX4B09o9y4xYuBWCld9AA1csg28n/kDE34
         TVsYDbN82C8bdQuRYszI3E+KcF7FLo5kGP8zlq0nkSWAIOufZiCm5c8sWVl0u7tZhvdF
         vReAZKM0ozrNW6ty6bn2R5GTWUXtpK80tGFxqlbTNax1UAoYPRXiIIXptjY6p2ORrDht
         W/xCsC4sFgy/IF/js2G8LoMR2Jctv9n0m85aE9s7m9nrrdaMrcmoaO2tHyQ+fECMLUfI
         uuIQ5zUMG6mXJ+ks5/kMmpTaVmkRCGPVYE3OVSE5gM1r3fYPlJtte9IZyv6r4YGKqu06
         3S9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713012; x=1710317812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YkceKDYceYDeQ4XBB8A4mSK+rDJiaduuPabI+Vyi2Q=;
        b=tT81ofsLkZHoZJqyL0MmIXHyrIBe82E56Gho2tWkCez511DhV+l3eCbwusaJIyyYYn
         3Uf36ZXhNlljCIJT34yJt8tOdKj+w6c9eT0Mvi7Q3Whmj/ofTeGU4SK5VjoDsPx42Cj4
         4vL9iXdvNrELDRgA0CGxivUl7wM6DkA3k/8ziVkkBK2e4l+4viJSH18EgapPAj9k1YDd
         SyyKd6KliygR1vDSWYzYqe3IruuzCC9izdlyvEKLF0TrMRppvsaRQ+lQ2XW4QBcea1ip
         vtO+Ov8oZ3H6dzMrb8VJfVESj3fdKtLviZw4+caylhre57Co9ZLwGWVOAfKAe3Jzxe8g
         wtYA==
X-Forwarded-Encrypted: i=1; AJvYcCVxNqWzyjsGEWECZLoOu/WED7F72Sps+SKMtyvQrZr2wWXHT/wK3BcY+HeJcC4ob+XN5wqs0hbS6jZ5oDuJS08ITBtU+QKocEp2uoZCNA==
X-Gm-Message-State: AOJu0YzrK6blKKJSJ4coqtHGMmx9JuCOyK+IcVsVdZngEedUOyOZwwBa
	dP96YCj2PuBhNTdhsZu8MLyWYHRzywzk7OeW9n2nzPgdbxqhKPnWLDAzpfWwiRY=
X-Google-Smtp-Source: AGHT+IF+ClwuDShqfVljL8ffyjGyZsSrmz6wYNutDFQ/n+Qm8+lFOu5G4vbxasQpzp/6IC/gQvAotA==
X-Received: by 2002:a05:6512:48b:b0:513:2047:c9b4 with SMTP id v11-20020a056512048b00b005132047c9b4mr2641290lfq.39.1709713012085;
        Wed, 06 Mar 2024 00:16:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b00512dc23bedcsm2162366lfo.99.2024.03.06.00.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 00:16:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 06 Mar 2024 10:16:47 +0200
Subject: [PATCH RFC v2 3/4] arm64: dts: qcom: qrb2210-rb1: add
 firmware-name qualifier to WiFi node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-wcn3990-firmware-path-v2-3-f89e98e71a57@linaro.org>
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
In-Reply-To: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9uiYDBpJ8s46sR33Y+BMEdKtwAlaQcnmoofd3iM8ghU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6CZv+iVyo1wfbrypxaHKx3SnslwDEkjXP9nVJ
 FnW1xP38nWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZegmbwAKCRCLPIo+Aiko
 1fZdB/9HYHeIyWpnh+TKnqzHb6FoB5f0awNGnVx6mfHM9PJzzMCvJL7aCczg/cRSASw8TIbpjWi
 BiBX9XdC+nMAuMbPm/xbHXq3PF/wFp+ZLR0OyaQGUG914jPkzI2rfdlSb6y+aG+CqjgqqjnUq9/
 gdcEiwmViO18zRvxlC5tbu2wniHhJmWDHgTdKMhFg6q1EHk50P+jBHboDUcJKgH0lrIz1Kolb/V
 BDbUMIShGQMt2tSyQXqKWZ+/aQ2fDTFzhGIqPUp8stbBrYG1gZH5HF45enNZoSMTOsakdsjI/Dr
 iPQ+PxfGxurrtSPUEJ3j3TE+/BRg+5oNwHEL68LHAlRyDAS8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add firmware-name property to the WiFi device tree node to specify
board-specific lookup directory.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 64b2ab286279..338a12f98bfe 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -540,6 +540,7 @@ &wifi {
 	vdd-1.3-rfa-supply = <&pm4125_l10>;
 	vdd-3.3-ch0-supply = <&pm4125_l22>;
 	qcom,ath10k-calibration-variant = "Thundercomm_RB1";
+	firmware-name = "qcm2290";
 	status = "okay";
 };
 

-- 
2.39.2


