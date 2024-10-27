Return-Path: <linux-arm-msm+bounces-36063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F394C9B1BB4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 02:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04FC81C20C3E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 01:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5383BBF0;
	Sun, 27 Oct 2024 01:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uTpOFdRY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E8D27466
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Oct 2024 01:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992300; cv=none; b=kL07VxzkX8RzaBCTug5L/ziAsCqHliMVpQRSpLK5YmLWbvPBWMQIn6TbxzgfDoZGw2BpIEMDAR+Jbm7tZqBKiZ2DtPjK+KOqeyVA2lbqAzkMW8Fp9bOon9ySaghziNyvrm98ZXaZNaYswxJlj/pReynoaufrHgz0ZMw2aOfbXFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992300; c=relaxed/simple;
	bh=mHXA679fTLSBfLWh8pBmR4AEa9V2nbcklgPIdka6VnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1vPh+fNJXFezf+tKm+Y1u8yLfcRhgM7yAziKPwRYqtCRlIkGswX1WxJ58rY64BSS7cC1f/MNegsvpstj0iqUnRuBVvP2WB9rwAorG42PttoNLObTrYlFKjbrvN4fwsud9qI3PsVjwqXs4KyXz643GEUj4l330GkuKcAGjYiEOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uTpOFdRY; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539fe76e802so3922189e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 18:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729992296; x=1730597096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yljl+967ibX2I7aSbp1Ln8dspkbFoWgzBqO671H8u2g=;
        b=uTpOFdRYqqF+JFWV9jPIjF8cNlwr0Ou8bS5wxAX5lTovGPlvgc3bdnId7xPqaardlw
         YY7F1ls+AjbDhDAhdkyrnj4qqXFCu2sTUv7Ns4+lBRgIcJIFbVQPha6EhcVn6xBfp2MD
         DUinEjb8zOMJGF1jY2ceA8ykIdDtFQEKiu6wgUnYuSzlc6QHsiktpGmRXKhlYjJVfbCH
         A90HXQajFOgQuexwrPzxTqBUSwukA9O1we8d4g1aX1z6rJqUpIXKHi0vhC415gwlPs4u
         YQu4eLfA5d4GOtMg+fi8J3BCJOu8tESA8kxs8ruKjcZnFJQhMfRS2sN4YcYGAMXDn6i9
         H8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729992296; x=1730597096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yljl+967ibX2I7aSbp1Ln8dspkbFoWgzBqO671H8u2g=;
        b=dZNjlmzW0XCuGO86NuIBvaTBUzOOsYpkFiGbH9qXynThrJX+n4ST8XHrc/ytl8pO+L
         7Pl3wzdmN0q04+cM3y8GiYWXBHFJuSxNnPeckA4M6XCE2mdw/plac8vzOmLCq0ZbzSmG
         e7SA30nvg4mKDLjMugxlayz0p+M1tl8peiCaodIPSW2i83B7gKZMiNpYFQGYvOZ0Zzsu
         JaUgrX0EbxFymrhnx770PS4xqi3QhPsMhVH4cAT+8wQHDVOQw31p3LF8eC+6y67j7ioA
         dmgiZnrQR4ln/57fZBFVwedGk5xI/9umj7Ayj9dzEQfCOO4NR68O0rmn9SlMfk0avCa9
         fPEQ==
X-Gm-Message-State: AOJu0YwZ9XgSVqXEYNE/b10eHndw7BkqEJsvVc6FZq8aq24SmIfBF/2R
	leMqK3kNomzC/ccaJsZmqRsP0Wcoaxc81epB2Jo8ShW5zN/k9hk28+KoX3gEtIc=
X-Google-Smtp-Source: AGHT+IG5qxpixZdbrmL55PeDyndO61JTDRo1J7bAnVb1TfaDnpj9URUSeTa7CLl3XlloJUOri2ZX4A==
X-Received: by 2002:a05:6512:1106:b0:539:a039:9bb6 with SMTP id 2adb3069b0e04-53b34a3509dmr1563148e87.56.1729992296186;
        Sat, 26 Oct 2024 18:24:56 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c901esm642356e87.219.2024.10.26.18.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 18:24:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 03:24:42 +0200
Subject: [PATCH v5 03/11] dt-bindings: clock: qcom,sm8550-tcsr: Add
 SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-clocks-v5-3-ecad2a1432ba@linaro.org>
References: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
In-Reply-To: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=992;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mHXA679fTLSBfLWh8pBmR4AEa9V2nbcklgPIdka6VnY=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHZZfDiIjPMt0BkVDgLLZAGlvr/AqKeyI4nJYZ
 oYvxg3rboyJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx2WXwAKCRAU23LtvoBl
 uLRcD/9Nst3tmI3jbh5wLxlDL9O0dn7nSEkjnaLDntTJls5RFGqF8RWsLOl4MsH6/hIrMaq9zgE
 eByeDjr+irXDBEfs0n/utKHgTx3q2DhjIHJbVXuIRrBLeoeyabvNGrZCC5Z5rNr829bJ2ljCNTq
 q8uK3DshYTwWuxIsSI3HM/DYqgj6r5xtZanlFoxyOq5dqP1uqGoZ2pkDfnPcwGIP3cUOTA/gEUn
 CPQmnrHgzgElrZx0jvZS2YjSf4G6GcykgJZQaAUJGWdzzo03ZGtoOLPc38If3KDSBHT+NVWbUJm
 u5GpYSNToUz0wuHWj798OJJWHdTKvVd2yzgRR+ij+ni2ESCUeThy/TJSanYAqkwXfGFl6KqHNzw
 u23ZLNKbAybI+4PQPG17XUSEKG7+Zs56GL++SZrT05nz9AHc4UTFfV5ZGa1VX3gw18IDd9mJ2sS
 qvZ82C1mzxX4GPrxitg31HxQiriEN9DlqICM0I/oEbfjBMD3p7F5XfYjorAx8lkDizKtPyaMxFg
 acFAGnzxiXMzaeXubl+FbNn1i9PJuzseJSFZKxEX8+bUoA39VXfNfEEQQw5AHzXE3SpZmSZTJRc
 T20z62acOBiPnOxzPgMUAfiPhA50As9j2KN5gz/mlKj/pMMRC/TziOUjDDWagDCnkjj2e5Tlht0
 7Mj4jtqlv45nAhA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the TCSR Clock Controller on SAR2130P platform.
It is mostly compatible with the SM8550, except that it doesn't provide
UFS clocks.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 48fdd562d7439424ebf4cc7ff43cc0c381bde524..3b546deb514af2ffe35d80337335509e8f6a559d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
           - qcom,x1e80100-tcsr

-- 
2.39.5


