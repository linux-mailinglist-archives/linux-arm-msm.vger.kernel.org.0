Return-Path: <linux-arm-msm+bounces-11666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BE085A34D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 879AEB221B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521682E85D;
	Mon, 19 Feb 2024 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i1+OfYRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C4B2E852
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345848; cv=none; b=Kgxf5d5NBZFkUDMOKaqgiAOu5dakrztgRyjMqqkNf0DEh7iqqIClmBTPkVC/9dt3X1eJfDzoySk/YvDgkpX3AHe0l2qHNud7Q/7rHqQXKDn5UGrN63GMl8sddPa/A7usGeekJRbfnzK0GRM/aobY0I/cQGwSVEShunYyx7bR45c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345848; c=relaxed/simple;
	bh=6SSJUaw0nKKP3ZKsGMyfMQFocs8b5O1NPgxcoNxhRVk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q+0M8DWLvTA4xpebSxMRS8v7cBOo+da2sRrIgtUbodHRO7TOdR7pUztiEzCvql9igiAcky4k4jeWJvO3QERz4Usnbmc4F66xrEhECByr/aQ7SYUNF23JqmehVH6H+ySeJ+rH2HZodqTTjiAFyy8kcBSAORrflTrqOSoRNzhgxFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i1+OfYRO; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-512b700c8ebso835252e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345844; x=1708950644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7cz6IUziBIbxMgivwszuy8eOIkjtw8gK8yFchWpzBU=;
        b=i1+OfYROEjEYnJsKSPdC/CMVppRT001BAfBoejGxH2+o0s7GXoEhYOhHYbCMsoUbV2
         pfCEsaZiL6EHvQ4Hy3kVdMw45c3bSIhK3a8bnmvnjEwYH9N3XX7xoX8WvrGH/Z1Ez0NH
         SJiobKuOP5vhNFejuNo8yPVN2OEEUWdzwmVT7g+oDQTsulQfdh1u4W2hfZb6A2gQLNyx
         5JeAU+cFmob8Htnqyg0Z65BGjUInXE2J8vd8HLk3fZ+oIdQ2Fps3K4QXdhMXVxAbhjwh
         /bjwgEFKutFdRECayY9Y9BFHkVrRR/BHbtPmOG9AwnD6L1cI1taoKzQH6LQpXUoRVANh
         36sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345844; x=1708950644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7cz6IUziBIbxMgivwszuy8eOIkjtw8gK8yFchWpzBU=;
        b=rDn7WyrfzUxjhHrVCfhHDtwSJfb6rR3xR+zxIFwEvfGo4lPo9pZCZTQ6m5ZyMDy3JM
         zmQyuveL8IUzXyD98GzPj6nmCPCYCGDs2BA/gyga18iLB/ABX5OYB10O+B3Jek+pRQet
         dfOLNeXoeffo1xOxlSZA/GY3DYpL73M8jnx80JdP1C+hiM+pXCVZxrOLUQm1ZeUfcTO1
         N6c5mjmapuB5lSKm/iLyQ8Zh7qr94MAHUZxeNAbHQ3Hx3Ioyxaz/KwLapP6LF7OkY5k8
         zk86MUsCjS/neNyLwN3w5SPeUCDnvB3dxXnQgaZRFBZJ/6sM7Jg6A7eFPPE+yE/o+E69
         N97A==
X-Forwarded-Encrypted: i=1; AJvYcCXdxYCzpQd8Ms/cDP2iUD2sjpYcPdEmuRlo3F2XPQQdxplRrYOYyMa3cbdF8FwEz0veDlQeXAdwIzhR5jwMMY17upWIlhzyVUhRziJHPQ==
X-Gm-Message-State: AOJu0YwQs8FuK+g+kO0WSNZ4NEjAizC/iKwKn4nVRXWR8bvglg/pL8e3
	opbrS/SdqitjIYzw32fzyBTb/aMbTBP0D5LVzUHpAwSg0/dv/QlPpCfQqVpUypY=
X-Google-Smtp-Source: AGHT+IGoP4Kc9T7+0vrUb3lFQohpsZ0w3oy4cAILJsX2XN0cHTj8EK4Nqbp0ilMeo3oHJesO9tXkfA==
X-Received: by 2002:ac2:5e8d:0:b0:512:912f:4bb with SMTP id b13-20020ac25e8d000000b00512912f04bbmr5296326lfq.68.1708345844597;
        Mon, 19 Feb 2024 04:30:44 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:30:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] MSM8976 MDSS/GPU/WCNSS support
Date: Mon, 19 Feb 2024 14:30:30 +0200
Message-Id: <170834569497.2610898.8605974222285085772.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240121194221.13513-1-a39.skl@gmail.com>
References: <20240121194221.13513-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 21 Jan 2024 20:40:58 +0100, Adam Skladowski wrote:
> This patch series provide support for display subsystem, gpu
> and also adds wireless connectivity subsystem support.
> 
> Adam Skladowski (8):
>   arm64: dts: qcom: msm8976: Add IOMMU nodes
>   dt-bindings: dsi-controller-main: Document missing msm8976 compatible
>   dt-bindings: msm: qcom,mdss: Include ommited fam-b compatible
>   arm64: dts: qcom: msm8976: Add MDSS nodes
>   dt-bindings: drm/msm/gpu: Document AON clock for A506/A510
>   arm64: dts: qcom: msm8976: Add Adreno GPU
>   arm64: dts: qcom: msm8976: Declare and wire SDC pins
>   arm64: dts: qcom: msm8976: Add WCNSS node
> 
> [...]

Applied, thanks!

[2/8] dt-bindings: dsi-controller-main: Document missing msm8976 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/db36595c6889
[3/8] dt-bindings: msm: qcom,mdss: Include ommited fam-b compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3b63880de42b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

