Return-Path: <linux-arm-msm+bounces-4104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA9680B771
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Dec 2023 00:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E03FE280F5E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 23:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215641F93F;
	Sat,  9 Dec 2023 23:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6YLULaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054801A1
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Dec 2023 15:21:37 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50bfa7f7093so4238730e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Dec 2023 15:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164095; x=1702768895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iqjo5dHisDRwrhKSHqJTPFQ5wOEs+diDPVCxtZ4wynw=;
        b=h6YLULaQcXtjU++ZPyGCwzVs7VT48iCmuB0+MT29/pvlFvUQ10+y3098GCfryqaVF2
         pU2G38r2zKunaM2x7tLSs23wfvsNgivhW2KC0BKbzQHXCAmq4ffPyvPjrn4xpexb7q2x
         DfK2i78mY+mu4mX8uFyJl7PFPnKi2SVAP2pKzTM2AWaz50xshYvgXGkEw7NvHXeq/v0t
         YkDhq6O1sBYeUt3mZM72D00XZ/j5BjK5degkVy3VPaVzKtOtQj3uqESgu8Ah47iMAmu6
         oVohvhKq8UMwE7JGDhvm8UV4ZggjfWKgxLObdDgp10Efpf5zA/oDnADwnWz4hEbdkSHE
         r1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164095; x=1702768895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iqjo5dHisDRwrhKSHqJTPFQ5wOEs+diDPVCxtZ4wynw=;
        b=r9rXk5BVEsrsbnPjR2Ohvzvbv/Ggtl2mBSt7XCLU5kUUULHdf1ec+u5PdodklIFfNw
         9Nt2lR0T1zCFOrR8RtYaJInzEDDgSF44hFdYaVRT/Oyu0rmBNmqvM3v09ysjABwAD6bj
         hplJzh7kyOQvxYxg8IMZsO4/G5rH+cYkvWBardxhmGsDBdmu0hqNVXovd+3BcZwNdV5+
         CR3vpXKxlkdKT5oXJCczMZmjfCdZbtBoabclc+C6vZwDXGT+4YFQeEQnDdJOlkpTZqGs
         1DqxxVdEWs93eqnc3JNDx1i7Id1sD22CUjoNhwVB7nHwm4wj0ItYSJChZHlpfBNS6EN8
         bVGg==
X-Gm-Message-State: AOJu0Yw5FJQlAqBV0G2tX8ZiX52YbifXZeCo8zaB98grCz161AdN8d/H
	G15IavtOEEHb+eT4eWrkmapO/Q==
X-Google-Smtp-Source: AGHT+IGjlkOAdxRdEwuOXcdWZKXok3jGpK1DX0l0Bpjd6yJvBkJ2iYlPDjshubK+uz0Rkd6Z2bFwFA==
X-Received: by 2002:a2e:94c6:0:b0:2c9:f6af:300a with SMTP id r6-20020a2e94c6000000b002c9f6af300amr895710ljh.39.1702164095380;
        Sat, 09 Dec 2023 15:21:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:21:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 2/9] arm64: dts: qcom: sm8150: use SoC-specific compat for RPMh stats
Date: Sun, 10 Dec 2023 02:21:25 +0300
Message-Id: <20231209232132.3580045-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SM8150 platform doesn't support DDR sleep stats, so it needs
SoC-specific compat string for the RPMh stats data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 3cba87e00123..fb41f91cefc6 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3950,7 +3950,7 @@ aoss_qmp: power-management@c300000 {
 		};
 
 		sram@c3f0000 {
-			compatible = "qcom,rpmh-stats";
+			compatible = "qcom,sm8150-rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
 		};
 
-- 
2.39.2


