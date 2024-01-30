Return-Path: <linux-arm-msm+bounces-9089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 866E5842D23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 20:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 410D22866A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 19:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC6269E1D;
	Tue, 30 Jan 2024 19:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mqDgpYJ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467F72D05C
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 19:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706643779; cv=none; b=lAduJL65mSmrLAh/jCMyuG5O28BBiWf9f2EpXsgXs/7a8OUdthJ1xPyk6GztONTL7uyWQDJMJNQSzcqoPpLfGie8CE24j5S1kgyuAt5GxCnNRZdW0a1eae9StsSl1GDj5Mt1n/EppxKKn4peB3t9mMYURaH5IUsPSYTxxNvVDyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706643779; c=relaxed/simple;
	bh=qw+048jjcUHQZCX3Cdioc35/zqqYBBdx6N8Q0A+AM3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tZzNAFAc64gp8+nUaNSsueivlRz27ff9RBNZU0UEYXpSybLSKN4sLNfuyGKmQSqvW/XY5NQ8sI7n4oVbbXMHAFrrTdmbNR3Xd8dCSH3xgOymvFkqF/QSNMgXk9tOLLpn6cjjC3YMPMZKlME2fmAJsh1WgZCAaJiHINZS6uocOlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mqDgpYJ5; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50eac018059so5121126e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 11:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706643775; x=1707248575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJ6MdukGRNj/Nnis7GdOSvmn6hBFpS2Qtes36t4P95w=;
        b=mqDgpYJ5qLpsu9uRTw92Eg0Jld2c98LpOP2EVoWG/Eh1G58vwO+YShfXdezxmKEYvf
         eS8/mxtoZvprsUtHearNi8J/eE3vc8eaByTKz9+Ap3o8NGGkmf+tw6cPZ7vOM/Xry8Nx
         oiJssWcqVGrS6aJpEWBAOWj4ek7djS3UUtje8Iwf22Mcqugt9dOA2A9V3TOAyNn8Y3xu
         w0H7I4Mfy88SkFXjeUTUfYaA5nR4vLTpXIymyUE3Y82+JwiARhDJsjlMiDNj0fIkglXZ
         dVJjg4B/aFCiDEmFpNeh1EQKH/IjzB5JMA8N2xJAISqIK9axc/v0Av91LYGzRImOjmCp
         bYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706643775; x=1707248575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJ6MdukGRNj/Nnis7GdOSvmn6hBFpS2Qtes36t4P95w=;
        b=WWGMaSYWEP3LQKhkrIbkdc9YN3x+VGipaKNoECZVoZXbKfZ3wM9RD6rMSzDD5PBAxo
         bloK41XY2w/zMWqIqHrwz1C9QPc+c3UzRvZUqHN22PDkov+oEza6zHt0pyTXPQLKoTXX
         h3kZr1Y0hjZB5z7BseuBKB/b2/xlcoJijNWWLP9f9Hm/tTv9xrQlpDdS2ZICzw9CJ6sP
         nOQv1kkXfWvz5QF/9ABaX0jmdFq+B6PM+ReBCIAcI3oEiHIOzAl27QP0aGXFf0xD5tZK
         nzZEAMhXL0Bm3zFEHE63QknKCxBcRkQqIOV9iknRa0hmvtRQDFpZbSrQWACpkrwRgB3p
         cL7w==
X-Gm-Message-State: AOJu0YzsyTPO7sGoxZKmBlQsq6vooff9HPeDL008GvdLp6VjMxWyBlLo
	NjWfAe9VYESFHngAALe7T5F7p9ZYyk4uI8mpBIm7BIguizlc4pnPJx6Im464G2M=
X-Google-Smtp-Source: AGHT+IFOgB+HqMDz9bBH2Pzxy1J/XTH3w5MKZj75n33PMPrv7+Hj8nrdyV6w8RbiNOAuhy9uhfV2Tg==
X-Received: by 2002:a05:6512:5c6:b0:511:83e:87f with SMTP id o6-20020a05651205c600b00511083e087fmr4966853lfo.19.1706643775210;
        Tue, 30 Jan 2024 11:42:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW7pRHqGqa8Hqpevq+epGWl93ONrvPToEYo2yzduIa8KbUOCz2vcVgCBDcqj4/a8GxZY6Gc6VgvMVLIy8ghggYuqai73QtfC4Zo2w3RKi2XfitvRlSDZBNgQPzRo8yhf8ZWybKMPlhNGkvFTCdetBI+OEBXZaiWtZSQ1w92FuSD8irzBtuKpFu83vZ8X25twsqpgLVpGAUrY1GEHCOML9l94bbprm3TMyBH/hIzY0ncqCEdbCTa2ENIaoGU6owRVM0biBHe+qhKJwnsRHqlk4NSemOtZNKWiMLCh8mSdToYWVN+r4xo5vEd/JrUGWLfodboMZGY+HcuQyX8/GDVcc1r5Cfh/0q9r+TyVRuYOkB9wPpfnWLcf2ww+UieFCGJtwY2WZ8BObKOu9ilvbkQgBiVDvyamCKokF3tztgGFGLygGPAHX3W
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j16-20020ac253b0000000b0051021a9febdsm1552145lfh.153.2024.01.30.11.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:42:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 21:42:52 +0200
Subject: [PATCH 1/4] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 support for PM4125
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-pm4125-typec-v1-1-e8d0097e2991@linaro.org>
References: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
In-Reply-To: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qw+048jjcUHQZCX3Cdioc35/zqqYBBdx6N8Q0A+AM3o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluVE8gx4Xn91rrxGfPfvMU+Qno5S1aJHT6lj2P
 xV5DW8day+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZblRPAAKCRCLPIo+Aiko
 1c6GCACNORwnaYyyNjqzL+Cv9u+EarUQw+8B0cs7R9+niqXsujZvYv0XKpdp0dTZhAfvBkPXuu/
 6BEbNk6SO3Q7UMeok1OktFAs5uIIWHlfy46mYg7rC1OsfGhAAULeFlzV+Htk3uFbSQc8elealIa
 MNvTHd7gNTAUts1DqaepAZ2U3+DV5tiNhb4ZML/UDFn07V78xh1K/JwwHy5LiVuvBchClH67DYm
 JSd2Se+F9fha4+RxMuTNbig43/co0BWIfJp/+mZq4GuhpitxHpjfd7EZMzJL7qdlhy6cb/QcNYr
 PaR1z+b3oM+pQaNBcH6pt2Wta4Aic9yrybh6LFfbPZdb406w
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The VBUS register block on the PM4125 PMIC shares the design with the
PM8150B one. Define corresponding compatible string, having the
qcom,pm8150b-vbus-reg as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index 66dcd5ce03e6..3cd489326267 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,pm8150b-vbus-reg
       - items:
           - enum:
+              - qcom,pm4125-vbus-reg
               - qcom,pmi632-vbus-reg
           - const: qcom,pm8150b-vbus-reg
 

-- 
2.39.2


