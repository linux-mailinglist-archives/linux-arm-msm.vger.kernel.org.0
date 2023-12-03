Return-Path: <linux-arm-msm+bounces-3119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 065CC8022D4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 378C01C208DA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B774EBE7D;
	Sun,  3 Dec 2023 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tibY4AF/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1ED11A
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:41 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50be0f13aa6so1490332e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602800; x=1702207600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsGJkEMgYOnC7T1jGA9amysHXRjV1SP4w3jzP2mqKYo=;
        b=tibY4AF/1Z6bYVl8z6gEBAosBiYSbvkh0k7E0Xv+NjaOSVejHXPcF/HgFNsIV3AkYr
         28+k9+5ZvYB9emOWqELHwgjQ5ej9QGwIc9znFMHKv4B2KGq+s1KF7MMl7flioI/jPtvL
         gw4Ad0eOo85V5m1hW6hw32loecQ3nmN4ROaqpp9Ncpzt/Y4DhukQ5uG90thcph6WPCwd
         UbjTPPDV453LLW8qllRJEq9R2tnb4txPldeMZph87hoeS+QYNq62bbbPE4+DDpG8vVFL
         4NLUlPT3+7ss0qj7tzoEgAM23tWMQLCbMR32PLlRmN9z969oKsvaCWvU+mJkI+qLJygV
         NAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602800; x=1702207600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsGJkEMgYOnC7T1jGA9amysHXRjV1SP4w3jzP2mqKYo=;
        b=WQiKGLRbSQ7BUDLv+X7og2koAbvsFIfFX/L39coNueF6c79aAFjpu6Kqk11gZcTpBJ
         ozv4t+W3Xnw/hdut9c2qD0kiGMe9amoS2TzZdgzTmx9IaAoZfjuULO7eGDVyL+HP5OIs
         RZJ6Lu/EGhSK9sw508sbnMV0f0fbA9y9zGSXC/WKvRCvieS7NUWl5h7MRRgqD9ynchA6
         DpofbUXEYK2jx3wcP/fgm5jqs2dwyfYhrAcODMNekkboaZ2ZL3PpZ2Owh4E8OCITvTNi
         7JEfOweJVqX1WD+skIew5AOAQXpNl8spZ+10SnGHvBqPc86/Vs9gMGIKo3frxXs3zJKV
         aJqw==
X-Gm-Message-State: AOJu0YwirTWWjb1o/poW2Ko6ZWwQ/w9DlqrjntagKu9n9RidZqav1KNV
	A2oQT41bOHOJ6Aj0zGy+oUAXEw==
X-Google-Smtp-Source: AGHT+IGTXjNHVOlRK83VPte/bws5CiHwW/uyqVkiKfSIsKv+KpW+bT01/1EwXLC4NivAlf5yAF6gaQ==
X-Received: by 2002:a05:6512:2c8b:b0:4fe:2815:8ba7 with SMTP id dw11-20020a0565122c8b00b004fe28158ba7mr2247401lfb.25.1701602800000;
        Sun, 03 Dec 2023 03:26:40 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,sm8150-mdss: correct DSI PHY compatible
Date: Sun,  3 Dec 2023 14:26:24 +0300
Message-Id: <170160265545.1305159.12554929694574480322.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231111142017.51922-1-krzysztof.kozlowski@linaro.org>
References: <20231111142017.51922-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Nov 2023 15:20:17 +0100, Krzysztof Kozlowski wrote:
> Qualcomm SM8150 MDSS comes with a bit different 7nm DSI PHY with its own
> compatible.  DTS already use it:
> 
>   sa8155p-adp.dtb: display-subsystem@ae00000: phy@ae94400:compatible:0: 'qcom,dsi-phy-7nm' was expected
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: qcom,sm8150-mdss: correct DSI PHY compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1cd83dfe9a58

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

