Return-Path: <linux-arm-msm+bounces-18844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C9A8B5EDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 18:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C52B1283F0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 16:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15728595F;
	Mon, 29 Apr 2024 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="y6lw+iVL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C1F84FCE
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714407678; cv=none; b=Xutdre+Q8zbgUl7Ik5a6KYZYrLxg8M7wD4CdGPJGSNlHyyh/amSPSElC6UXoVOwcqTkF7WE75cyT024f2eFFITLTX+9RP6SW5FNs+toPMNkRgg3c3YTVR9mJw8ykDuq0Nnso1hmLbc+zHvftq4zh5pl2mWdYvsY2zUFoP8EpIrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714407678; c=relaxed/simple;
	bh=nIrks+Ns9HxaEjV9ZLnzMist9Es01w3yeYlb5qgeX8g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=lWmci2nK3P6WPsRz22yp3j9h7yr8+M3ai/I4j/zbk3EsOK7BvaLgzYnzSXjQ1Z3BnzCOCMVgcOR2SbblsHBfm3g75e8xTtU/tl8jwODbzqPXjTj5zAtgtqW0c2HUeIi0hCb+5kJ5W7MUVbct+/ZZZyxuCk2ZUYFQyEbELK8+sTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=y6lw+iVL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41bab13ca80so20838335e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714407674; x=1715012474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2BcbVArzY6zw+uR+A3Mh0nCmPdKwCyYyWXxfmv6vto=;
        b=y6lw+iVLEwMuEagpIVpueRehXZHrPMz1tklE5ZY8xI/rEtmF1YR8Aos58O2vS1egcv
         o9D3m9r+SRm5xB3s5FvnMBVTJYqN3qwk0KThKUpZt39LjSMm6BZsCnDXRLeUN6RylxlJ
         5VjiEgL9MUoTWurO5RAOva9g9kaWFiihFaru9vCA0oh5K5vOczAZNvWBfvG8WUiRTw8Z
         zr4YaVW43QZJyubmz63qoF5l4FRjXobTJOwql86JTlbx07NZP7zTA/2QZZXfaqX91/GS
         iL1yuKv37RfRq3RZYx53gWdvGQOimY7+C/Waz9zznY6WbgpQrwod29SCGTEVj4ue643l
         H0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714407674; x=1715012474;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+2BcbVArzY6zw+uR+A3Mh0nCmPdKwCyYyWXxfmv6vto=;
        b=iwkd8kbTOWZ/TAWB6mcyj4fe8/GdgA8yBgrUNRl7U4SAlww1b9puJ1PKajVwQBpOFK
         EIEdnmin4BwpGqbViQmOCMdAj5Bp3MZ5L4dTZrMaabyZczC2hRaUiEjH7GyxDx7aZr5L
         XSVIpSCELQMZSM6F888leeFgh18hFbpBY1wj6KHc00eTWoSJ5ZL7qkTghq8Bq3FB9mjW
         zITxerzeYi2f2Cm4lBSrDsqBwBmapZ6lrHXTSKk5M0E097WcIQSFikzUxWwYGA9N4FCo
         nY5ZuQw2qsjsymNJ+lqJVyAN5faShaxWnlyfaE1hQkwCx5nk1Caulq9fd9hrqGMxDxFv
         FHcw==
X-Gm-Message-State: AOJu0YzyHJa83s4QN0+mSZkck1z/18PkFe24OPtaa4B/LAbrcVMs6QJ+
	D9YAR6h50q75Oz9VleHPYfQJUQVuPaMUilisBowS3FcgLNtvMdap052Zi+Oxnrg=
X-Google-Smtp-Source: AGHT+IFqURGq1IifXOfFAqZ8zQVNwljEvclvzb6xxbOaGp93XZh555vs3Sufcn/4UG9y855eUXTbkw==
X-Received: by 2002:a05:600c:4f47:b0:41a:f936:5326 with SMTP id m7-20020a05600c4f4700b0041af9365326mr9975883wmq.15.1714407673735;
        Mon, 29 Apr 2024 09:21:13 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b0041c012ca327sm7469761wmq.45.2024.04.29.09.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 09:21:13 -0700 (PDT)
Message-ID: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
Date: Mon, 29 Apr 2024 18:14:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v1 0/3] Add support for qcom msm8998-venus (HW vdec / venc)
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Nothing to declare.

Marc Gonzalez (3):
  dt-bindings: media: add qcom,msm8998-venus
  arm64: dts: qcom: msm8998: add venus node
  media: venus: add MSM8998 support

 Documentation/devicetree/bindings/media/qcom,msm8998-venus.yaml | 155 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi                           |  48 +++++++++
 drivers/media/platform/qcom/venus/core.c                        |  42 ++++++++
 3 files changed, 245 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8998-venus.yaml

-- 
2.34.1


