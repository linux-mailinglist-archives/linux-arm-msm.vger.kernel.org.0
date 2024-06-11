Return-Path: <linux-arm-msm+bounces-22320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 687C6903EA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 16:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3A0C282374
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 14:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBC817DE0A;
	Tue, 11 Jun 2024 14:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6MykOi4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B19117D8A4
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718115962; cv=none; b=Yg5/zuUslnw1QfoH3/3o+wm1J1KEo2tnaXZwVq9Fs2rDBl3EkMKeCVnS5hPuDan6tvhEIBPZxlnVo8ZijqwYb67nGl0QhSMUzSPsakPXgTaSFIurtYU+wRvWsemxmiQzOIOfUzpWvmLYi1jB/T+vZWs2B/zBiZEWNgWB2fiZRjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718115962; c=relaxed/simple;
	bh=d546c3opKrRNj71ZDNGKC8sFuxRUiIOvbLvsU0IMqgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dn/woACw9CrvQHCAm08/Ltok/JF6XAI8SJETlJErZy++emtt3Ifq9SfnxG2MdmTo16/lJq96lAm7T2nzaCmJcbCfxFFxMM/7GHnKvi6nK8T1d36WZWK/kokPVENbRGNgRbbaOSJNJZVmAxfvMBAFtzASDGli2wShx++6h6e0XqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I6MykOi4; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57c72d6d5f3so3969375a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 07:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718115959; x=1718720759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lGYTsubStoiFq5pGx2o4ZQKhOTe8oq0dKZ0Pe/wUyLM=;
        b=I6MykOi4k8CNTcRU4vEOo+FL1KSrCPYUFz4tamo2wvwtofeWpLIgEmiwLdd7BDr69T
         uBugM5NWtXFbeJJ6azgtqNlEkVy1oAeIo1ueX/Ok0GCFsQUtB0XCaLIthceAVWxt4yw8
         dMyXQ7lpCMw/e9YPoovi9Z6fN3lrtxhkHnrM0w2MaQDwd9elLhb8+kIj4D1oUvRWKbp7
         B7qHMTCWzc0GDI1Gpht4ZxlCdDmdbaKQKrLukolmBymdpa7DkzzPWZDzZVphmm+low8I
         sxA8gTMTe4QFR1YxxbMWFlXQNllhEAQm8FYzPCFMyfMatYNp89R80fd4QJmT6hHzzoJO
         LJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718115959; x=1718720759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGYTsubStoiFq5pGx2o4ZQKhOTe8oq0dKZ0Pe/wUyLM=;
        b=UluJqgHWVnkkdQaa7qWmVVMkCRy/jObkVq7CXr2dyozxyOuctPEoUP/D/kYCINOJTP
         jaka+EHHcIApeMlxiQ8OJs85WzFa5XQE8eyMJsRnC8OPgnkrN1kp01Cl8zwbYG3EVTHf
         w25GUXwePu3Imvp+yPxNsPwXIYhrjvalxcnTCtu3TOptqfAIY5pU+DiDfMv0Jk7i3jUE
         6daRydPwmmvzZg043gep/8RnQpAMbZphIV1QoVGBmOsP5h760tfNv8gy7gvXtT1bC9Hy
         RA0ukJMxhEwNAXb096SpqQ2c5BPi4Gbv57BSZtK5iwCtx3MkV3f2Z955mnB1rA0giA67
         nMPg==
X-Forwarded-Encrypted: i=1; AJvYcCXMpuR8mYP8JYiWwqBaakVrRZBKyE4tditV9x85QMz/8/dmna7MAmMVwN7knkVjlTwz//hM0UVGxy8419DT7cq/P7kgMzmrUi2flUhEdA==
X-Gm-Message-State: AOJu0YwBeYEt71B/B3h30w5kNoW16/lJV3NDPJunluZv3CpV7oxdV9D3
	OEmJIGW6R8vJScvCCZEjQkrXszB3PytmFFLPXkHAPqhj3J/TOEan6il9RiDp6pY=
X-Google-Smtp-Source: AGHT+IFdCz+fE/0FZVc84bckExGWQ1DVAinZgGpdwgau42Oo14DKl74W1P1qxoZhEJUqZWHnDFPzKA==
X-Received: by 2002:a17:906:e0cc:b0:a6f:1872:4e1f with SMTP id a640c23a62f3a-a6f18724f43mr346135966b.77.1718115958517;
        Tue, 11 Jun 2024 07:25:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6ef83ac0c4sm518070666b.74.2024.06.11.07.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 07:25:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: fix WCD audio codec TX port mapping
Date: Tue, 11 Jun 2024 16:25:54 +0200
Message-ID: <20240611142555.994675-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting with the LPASS v11 (SM8550 also X1E80100), there is an
additional output port on SWR2 Soundwire instance, thus WCD9385 audio
codec TX port mapping should be shifted by one.  This is a necessary fix
for proper audio recording via analogue microphones connected to WCD9385
codec (e.g. headset AMIC2).

Fixes: 229c9ce0fd11 ("arm64: dts: qcom: x1e80100-crd: add WCD9385 Audio Codec")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index f19d89d3d6e1..12a4c4637baf 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -775,7 +775,7 @@ &swr2 {
 	wcd_tx: codec@0,3 {
 		compatible = "sdw20217010d00";
 		reg = <0 3>;
-		qcom,tx-port-mapping = <1 1 2 3>;
+		qcom,tx-port-mapping = <2 2 3 4>;
 	};
 };
 
-- 
2.43.0


