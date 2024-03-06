Return-Path: <linux-arm-msm+bounces-13433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E904087307A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 09:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26A201C20B35
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 08:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC33D5D904;
	Wed,  6 Mar 2024 08:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V8Xw7+SB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4D45D8FB
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 08:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709713017; cv=none; b=GqCODLSgyz+w+RTH3i0B+EVTct4BpLBORjhfmMRvRQK9H0z6164ivA+oMUd2b/v35HJ/8DgESN4S+k1SuXzFBO2gjObnpw58P1nW6DIvfCj/6FokseURwt3P6Oc95mgda51buz5RoVU5NxvGHKoWMLZy1q03e6Y+4tZIz0sAqVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709713017; c=relaxed/simple;
	bh=IO0G01fjeFoKQavHxljn+OxdA/fMRHWzmgJlyEYmCss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M3u0TP+52CsEcjRJbANdQ5Vy9Y8RHZY4oLF4RIZc7Di8ksq4YC5ajS2P8/mPlZNXGVXGR+h2S6N6dzdYccOx4Szo16flBuUgIrMgBnjKiihXKTmxL+MykT7Xn3aGWRjb1Syt/hXbwzREga0Xwo38T9CjWhfWXOtyDa1muFik0QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V8Xw7+SB; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51326436876so752684e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 00:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709713013; x=1710317813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUMpyp+aBvT4jutLW9xk5zk3hii55n3wtwwHJLBpTrY=;
        b=V8Xw7+SB23pJyKpCdTZAeRVql212f62nSwBHuLQh3ydXJY7VxfHp2CLmcIBfSjJbrG
         bzSKA6PouLSg9mYQ1ccNbWABwOlYnvjLeVB2QkStlICts6r61j/ClorgUS764TrFVsN+
         dgpibjqM47ORFx7AU7auk575kgaWyw79KKoqxoY6+1jB1RmTpgk306ko8ewiQCAnvmO+
         bt0SMkEhwUbX6zZl2StvyJg+WnOfqGyc5quxq9nV4STDIRmWGy+JCf5kw2sODaOod0nf
         My9Lf3/4Mh3Rl2nxY3W7WOmqKz5nyp6bbnY8liuNKJ6QjIsJVreaigiT2qyq+IWi8Ey1
         6trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713013; x=1710317813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUMpyp+aBvT4jutLW9xk5zk3hii55n3wtwwHJLBpTrY=;
        b=EoZeyrMb1r4SvUNhagwwQCKkIDjwWf+ZTPp1z0b8YSaGPcqmatQUUQ20rmXaXoB/3K
         fop0ir+2v9XDnhXBettAYI4R2l/oImr13eO7gcHNbfkrJZEj5md2GTxPwO+GX7JKPijb
         F2LuSi6GUK0NlhUHq1NqR0vEhkfLfJnsyIF6mCkJ2WVyk0pjtsv0L7EupU790oOuQuvg
         4wYgwG229iAMirPJ+v8wDYIjQLKRIRuq++fdAeKo1lkrwTFltvKoEDqLuU3tvEnlRYzr
         zjCdt1X+VQlWzM/5SctkCdB+TmNd3N52ic8kKuKqpK9g+ESM1QGdbue34/jZNA+2Csd7
         azKA==
X-Forwarded-Encrypted: i=1; AJvYcCXP9Ju26u7K3tc45kvYvj9DpncGqysL3S9R7/dBS6wTX0FHefRuComm+Q5888Qw0UsPMFGIi1smXxQj9yyDeyWbzPNgtufwqqyzjWZsXA==
X-Gm-Message-State: AOJu0YyX3p+tEm3winscDG14/3NW9arX3treF6o1P+7mWY1QxHEbtFvb
	w3onZ3GX1V+xMcEuONQWuQRfntGkTAM+zxTCNBIAS9alfLJvlNSnlNge3BJreQo=
X-Google-Smtp-Source: AGHT+IHbn0SM7E/lVjSCZHRZwzRi0PDead5ffXoCFKJOGbm2VuIzaa+JgNKuc9Hp6zth2I1J6rcUHg==
X-Received: by 2002:ac2:5e64:0:b0:513:4b90:aeaa with SMTP id a4-20020ac25e64000000b005134b90aeaamr2501286lfr.51.1709713013133;
        Wed, 06 Mar 2024 00:16:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b00512dc23bedcsm2162366lfo.99.2024.03.06.00.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 00:16:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 06 Mar 2024 10:16:48 +0200
Subject: [PATCH RFC v2 4/4] arm64: dts: qcom: qrb4210-rb1: add
 firmware-name qualifier to WiFi node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-wcn3990-firmware-path-v2-4-f89e98e71a57@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=788;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=IO0G01fjeFoKQavHxljn+OxdA/fMRHWzmgJlyEYmCss=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6CZvOTjBZtoSgh4NQNDNl/WX7IZ1W1x6/faq7
 hbuBSPc+SqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZegmbwAKCRCLPIo+Aiko
 1Ym/B/9ldUzS41jpPNUz625gZyscZqqwqmBt0uegSJU0zgfAndVYwH6MtJnzQoIibGDzAZm2fIH
 tpv7wOX+cp/LpxjYrpgSGgzENGZGSpZCqt3mBNpyOP/ViRa6Sr/LtaiyFIw+0HuXRsTSr8BdtPE
 ZpM613MAZjUpi23Cy+nVIEzjIo7A5i9euFCcr2mYOte34axrup9IpqSR/3L4RRRNhbedY+jQIKA
 KSjMbF1IWUXXEvrxHCp513J/jI6oUqS+UrPM03AsvSCS0NrteHdt/RslRVRHZtscgW6sbrpWo4n
 W+ETw/zQGAvUBdCg3FrWC/RSBr+3wHuXUCJRrf7mQMsYG3GT
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add firmware-name property to the WiFi device tree node to specify
board-specific lookup directory.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 7c19f874fa71..cf1d8d6f1546 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -632,6 +632,7 @@ &wifi {
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l23a_3p3>;
 	qcom,ath10k-calibration-variant = "Thundercomm_RB2";
+	firmware-name = "qrb4210";
 
 	status = "okay";
 };

-- 
2.39.2


