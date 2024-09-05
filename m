Return-Path: <linux-arm-msm+bounces-30829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C465396CD58
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 05:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03A0D1C223AE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 03:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8C8153838;
	Thu,  5 Sep 2024 03:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u7hP0Q24"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9776D14A4F5
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 03:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725507226; cv=none; b=SDtIhPXbOD2MQtOQaeVcVar/Rl09T0URGm97okNC4B7IGYWRPtpISth2JRE0jFKbq4N96GTY+gfjC+yEhk+rHA81HOD73Mp4KmcRQsTqpvWTHwcQcWllX4yHebWiuez7rHddMbrDVlnpuwYGnxZaMj95im6sg6z76giyDoGLVCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725507226; c=relaxed/simple;
	bh=0Xscc7W52Ng2WjLBWxkIOJyZm9I/N2cPcyQy74enodg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Us+jXf5Stxrbb6HXxmYgi2+dxq6r6Mo/SGG3rEx3FXXb0gnNepQRjgR3Z2cLnubCvwtbdvR8LDKsum51iVwgWTrbXQPZKu0Q7LxkNaZYmEYeIkNTDklgRnCGxicry44t3EXTg74Q6n7hixiTsf8nyNyTNATrCJSdxHtGDA4JqbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u7hP0Q24; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53567b4c3f4so211602e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 20:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725507223; x=1726112023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGI49nIoainLFaa1TPUEgnROODaXfiT1w+95Y7KXH0A=;
        b=u7hP0Q24aJImNJvblX3xJmDh42bwbyPiXPSngBVA37dmWvvh79vg5uG+dZm+ppUq2o
         vBG5Y4IccxgL5EPaVVYR5u/LXC1tueFFQ6bEUs5iLigeTKiyrykWFneOfUZZk8ONJN/W
         a5F7EhryauH5kvOezFZsQZscViF21IqnV5Z81/wHNZK1UXWhd5h+ExyHt3sbiOKEvKim
         jpCoPrO2Kyi/y2bjs2Lrl5YnpNul2IGECYRChh8I5NlHxcWVtiKO/VArsHtSrnHsTcmp
         13b7KDCYZIAmiYxVGb2DfidUJurukxjnAT2sKvhYl3hc5NFGFNQB6/S0mtYIoYVaP8bw
         S8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725507223; x=1726112023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGI49nIoainLFaa1TPUEgnROODaXfiT1w+95Y7KXH0A=;
        b=oLTUcWZIMtozK7ZYSA9mJHZkNDD9eoCUJg+q1z2iHIvIA63Ybk7/+oS30qq1vZ5ygj
         NdY6r0bmDuGycZQceTTI5HA5V92txqMFim2qg5+M6hczsAkHENuw0NGPdD3qaAVyCsOS
         8hIydQcurSWhPl7OOGeyxSLkotpPq2paMqC4iQ8pR2eMt+ZxQhxBPeme7Rlg+sRxxv7K
         pe930lDTPZU8cu1imjBWmtlafJBwFg2uGQ9rEJiBKD5hIFfF4xh/tpZI+6CsHh8cJ4uw
         LBbkrMiqcJcBrwn5KLHLGKQ/xjZPXpoGdkYZAH390Pj36jyWnaB58k/Yo2bfgwSmVy+q
         c4pg==
X-Gm-Message-State: AOJu0YyeY1j27JscqWW62A2otzqjgg4mQf/d+gguDXD62Ybz3FO0wK8u
	+bNYIWu708v0wc2w+4k6mDkGKT1ACdiJNi2xFyxALYXTV+uMpa1/NMrQtmq/Dns=
X-Google-Smtp-Source: AGHT+IGI1ThGNwiYzgjZpB38Gzh3Kii8Shn3E44t5s6JycEWNTDgK8ZwOGUE8abD1/FHADwkhMcSXg==
X-Received: by 2002:a05:6512:6d2:b0:533:44c6:1ef1 with SMTP id 2adb3069b0e04-53546baacc4mr12832555e87.56.1725507222640;
        Wed, 04 Sep 2024 20:33:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 20:33:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Marc Gonzalez <mgonzalez@freebox.fr>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Arnaud Vrac <avrac@freebox.fr>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 0/6] HDMI TX support in msm8998
Date: Thu,  5 Sep 2024 06:33:36 +0300
Message-Id: <172550712143.3299484.1580127137460046609.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
References: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Jul 2024 17:01:33 +0200, Marc Gonzalez wrote:
> DT bits required for HDMI TX support in qcom APQ8098 (MSM8998 cousin)
> 

Applied, thanks!

[1/6] dt-bindings: phy: add qcom,hdmi-phy-8998
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8886def25eef
[2/6] dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
      https://gitlab.freedesktop.org/lumag/msm/-/commit/656810411b1d
[3/6] drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a61eb17f40e8
[4/6] drm/msm: add msm8998 hdmi phy/pll support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/caedbf17c48d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

