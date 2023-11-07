Return-Path: <linux-arm-msm+bounces-53-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ACA7E39E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F599280E9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 10:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2886D2C84A;
	Tue,  7 Nov 2023 10:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NYnry1xq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFBB29422
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 10:35:49 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC2AB0
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 02:35:48 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso9424883a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 02:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699353347; x=1699958147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26JQZMgRH2ZGdJDQnKgOHoSyK6KV/nQ1pLxO9+hyeDo=;
        b=NYnry1xqjVFMdWuxJrKQyWq/wMATuAX65QFhcJMqfvK6jvHVXGu+aVNlwqz/ToJRE2
         aES8MnxIvaGrN5CejLgju5bFy+izvrNzxH/NHX+tVwtjjokdmbGRopKCCmNdAj1Yxwa5
         GADHb1U5eapmxcGeD/4fNIb1sFZujcK8w2+TKkTtUpNDlor7CBuylah+9dqUkpCP5nZb
         pKTI18RU31309J57VQbwl/ske+oMghMGVicL1xbBILPwlBgrZNl7FMT5hODHVBjhxTT0
         kXhv1gKZnhWWvokzDREIg+pdeLxVTt1ulInJqG9/kbu/BtuQnppXi1K9AtIrMblag1XD
         9JkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699353347; x=1699958147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26JQZMgRH2ZGdJDQnKgOHoSyK6KV/nQ1pLxO9+hyeDo=;
        b=lTq36pwNtCRUBSNLKU9W6rIB2BMi6SeWOOryMDC3UmRDj98AlEGnMc2wmRwbBJwhkF
         n3j0s0SjTJAtkp4yJ/2fHLpZ85uPVLIDoSnbxht18i+2rNT0cqUtc6JRijUoenI9oOMf
         q2MPfPKO/UQJJyapQalkesYMipCiYvzrIB7P/SkHTdh4+0ODtGvU7in0vIYf8bOi45CO
         If9XkxZh5meG9xRbB/nZzbT+PzO6LeayeQaJC6Oy+YDCr9yhOKadkwPYlCkFWP53XFnr
         MNBqQyX3SYwKW8t8N5RTmAufJb/dVEaUmypMpRAOHqsASvAP0+Ef0rfIV2LFaBvNrtLW
         TAJA==
X-Gm-Message-State: AOJu0Yz2Kx/2HR86a6GU67mWDAsiXnWhCdUdItVXFHhh6/gpkJlsnWa0
	Vmg49OzzPnb+8qBi0LTlZ+wLmA==
X-Google-Smtp-Source: AGHT+IFM91hR/JF1VyPRwL2ZrJUOHYjdQ4TGbHkDJ82JFtmJGsnTKGsxINtiAdXd+0dxILOd8po6ug==
X-Received: by 2002:a17:906:9c82:b0:9ae:961a:de81 with SMTP id fj2-20020a1709069c8200b009ae961ade81mr14748645ejc.27.1699353346746;
        Tue, 07 Nov 2023 02:35:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u21-20020a17090626d500b0099bd86f9248sm882998ejc.63.2023.11.07.02.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:35:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sc8280xp-x13s: drop sound-dai-cells from eDisplayPort
Date: Tue,  7 Nov 2023 11:35:39 +0100
Message-Id: <20231107103540.27353-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107103540.27353-1-krzysztof.kozlowski@linaro.org>
References: <20231107103540.27353-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm MDSS Embedded DisplayPort bindings do not allow
sound-dai-cells:

  sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@aea0000: #sound-dai-cells: False schema does not allow [[0]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index f2055899ae7a..def3976bd5bb 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -573,6 +573,7 @@ &mdss0_dp1_out {
 
 &mdss0_dp3 {
 	compatible = "qcom,sc8280xp-edp";
+	/delete-property/ #sound-dai-cells;
 
 	data-lanes = <0 1 2 3>;
 
-- 
2.34.1


