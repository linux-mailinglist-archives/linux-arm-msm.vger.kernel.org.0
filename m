Return-Path: <linux-arm-msm+bounces-3311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C31803831
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 16:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EA48B20B5F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 15:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6C628E36;
	Mon,  4 Dec 2023 15:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fMljk2gZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6F11FF1
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 07:01:50 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c0e7b8a9bso6343365e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 07:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701702109; x=1702306909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWbBa0ReExpsmict7ITA3I0VpWyJPT/FlFWn3p8tlj8=;
        b=fMljk2gZIiEJPnwyghFxlV/bHbzcrZdigbexLl/pce7kNV5G6XHgLT5Lf04jttzyLx
         J9ezBhCw7LXPe2P+XMa3vTsv4aZMFz7LpY585+demXELPoiMZdM3+TWOuCucigNm++Mx
         hlhNdQGUroGjDBDnj3DREmXioK/4QAuUTGpPeji4hdcEJMtd10XManr+lBt4kj//pzZa
         67+xBfYNTuSMJlDKlBocTLuui7SprC7Ab3XaG7ltyjF9PEgBN6b5lNLfj3L8mzM+4BX/
         PrAT0s/pRwMJnQT7+DRua0hgy66q07aw5AuDiw7dwSbMAHdj574Ir53LCMxSzBfjvntr
         hGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701702109; x=1702306909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWbBa0ReExpsmict7ITA3I0VpWyJPT/FlFWn3p8tlj8=;
        b=oDwcnVVMzeyMzB2xG6SCy9FEv2d0Zpc2eyyCCEwQAmHY9e3iY5W6Mix2cLHI4F6wB6
         cyXHZmBV7qTKB0tcz3aYVumSAJ25bThg9WG4lHigs/6Z8Z5/4ezWvTG3Ty0vgdeSVCDr
         b1qIEHIjfm31Xs4nVuwlGk/W7Hp2FMAP/id+LJOMczwRcIHGle6fiK0FdDFTeOCoMHRC
         S0R5S2FtFcVUHUinwSkROpIFEovka2E1NkETIxMMkfA7X0AunAIZyqaG7aHOVAsgKIca
         DiKMOjF3V7a+t5UBC9l/nFMAWE18C6/2Mn/tyCipekgdmPbyVSVs8a4exkBp2AMabJ8o
         oZhg==
X-Gm-Message-State: AOJu0YwD98YKRJpcn7xxpCEELUrTcE70mozq42u93ml4lBbu1AfJ0Lxt
	ewUyV4j+GM9VZFKGOGgXwwK8WQ==
X-Google-Smtp-Source: AGHT+IEwIC6vXXbVTi6NK36/kTonsFMuP+PTB+A5z3rkJnjXjI/eyj+SgZJE0cNKSIYyAqdKtGIFrQ==
X-Received: by 2002:a05:600c:3151:b0:405:95ae:4a94 with SMTP id h17-20020a05600c315100b0040595ae4a94mr2718520wmo.5.1701702108849;
        Mon, 04 Dec 2023 07:01:48 -0800 (PST)
Received: from [127.0.1.1] ([82.77.85.67])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c501000b00407b93d8085sm19041661wmr.27.2023.12.04.07.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:01:48 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 04 Dec 2023 17:01:36 +0200
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom-edp: Add X1E80100 PHY
 compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-edp-x1e80100-v2-1-114e789f0195@linaro.org>
References: <20231122-phy-qualcomm-edp-x1e80100-v2-0-114e789f0195@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-edp-x1e80100-v2-0-114e789f0195@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=863; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=/RKolC0eaD6D7ihdm0f3OOPC0biviJAmJxDn3g8AQXg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlbenXaUhKXlXxblIx2B61hGtqjMC+izDudMYTC
 UUgtIVeY2yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZW3p1wAKCRAbX0TJAJUV
 Vu5sD/0QmzEbI3WInenNh97jUg2XOrwlIB3t1sYhODV9W8lUTFZrIypkRVNOFnY1JkR6ML/iQLs
 Btg4efQQ8Yk5DCqZhhUmkG1L1r++Fylj9E2dbWSHfxE8p4hxyc+lq6ijjcqd1XJpr9/NmlHV6Vd
 m/Mt5vYng8Ik3PMewU87dFZll4iGyDwagUWAZI6JKwbbuKKF5jwJrdp0A01w6vHQ5PhK/BxMmJ3
 Q5qtYNjXjLzmmVfWt8X1bdUj990Z1wUMSwerkyu1K+zkBdU/hTnmEbFeD5nAgoFcrGiqTQRiHYB
 0zTdJV9aPp3crrrjcpUsDVQpZ63mesLMMXxDMztk/OOI03GuACIlFqBJrSQt7f4Dzcwx6LAWwuO
 MsunekMcDPT+ZZBCZRT8UzUd+kZJzoAyfO/wJIQnXQfXdWdj5Xc4jPmobODcqR6W6Ui3I0WD6Vc
 HPVfeNO6Dch3Jqi6KaMl3OAWSwVpuHTYUHtqWREzOrDLuBiz9HE5oOaYgIpEXmD+g4LGu4rx70l
 ZQfmUrg8MffjzHY0vgC+HFqPLiYITTtfMwdtQZnrZtyLtGuymNllQmajOrlGSi2dE9r4NqZbzMi
 fVm5S9L+tbLc/RBj3HwRs6lXXD5EgkOwv8sy7hACsLy6CQOxYQk7/9Ps2wUVSK0/NF3y/9CjODs
 jzJGLgj88qQ6V9A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Qualcomm X1E80100 platform has multiple PHYs that can work in both eDP
or DP mode, add compatibles for these.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 6566353f1a02..190f61c1d0f9 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -21,6 +21,8 @@ properties:
       - qcom,sc8180x-edp-phy
       - qcom,sc8280xp-dp-phy
       - qcom,sc8280xp-edp-phy
+      - qcom,x1e80100-dp-phy
+      - qcom,x1e80100-edp-phy
 
   reg:
     items:

-- 
2.34.1


