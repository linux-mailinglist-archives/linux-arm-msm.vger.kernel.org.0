Return-Path: <linux-arm-msm+bounces-4102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6358880B769
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Dec 2023 00:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3BA5B20A2B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 23:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CA21E515;
	Sat,  9 Dec 2023 23:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ibkzo2NF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB4212E
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Dec 2023 15:21:35 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c9f72176cfso39933691fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Dec 2023 15:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164093; x=1702768893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmjCJiespktfDpoHlO6IxPKfMmv43AjbntGQXxXslGE=;
        b=ibkzo2NFGjUb5JZp8ibWsXazxD4VmVjeMEJmx7augH99KVKo1T4dJ6oB8bqK8kA9zV
         TKDhtgqiq9EX1RmEGHB0Btexw/N8Cznf1yRPMmxiw3co4VlUt28yRwAAzAfkNKB4CQfN
         byzGEE4XPIa3nbbbuzR7X/UJuSRW7Yu3HTTrqp8TNaUHjPCxW3uhwuG9M7pgt84cPJ00
         yKcGHUil3p+fiKSms+pcJh06IS1dqaE/aE0LPtA/2u5aoed5BjWJjeXmi78Ay+Qr5TAX
         Nlv61k8a2DTdWxcg4cnKuYdqAB5LJiBdDxDnX55ZDrGmN4SN//cZQxUQhCkVt4KOlQIC
         ZsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164093; x=1702768893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmjCJiespktfDpoHlO6IxPKfMmv43AjbntGQXxXslGE=;
        b=MQh9BGq8sr7ZpkZu+Ab5HhwF4fuzyd+38mKd3tcnhZaGj+G16qqwL/sBfmIaMmuvGB
         0A5qiJsgGaxeDMa42GisaWd+jv1b0ifxg9F2UPIRJOZz0L+HfQbgVPPn9t290nxr3qaL
         i+VsIxY9okrz0bHGpQYY5tBzcQYz3mHm4odYGJPQ+ElCSML+L1tECWhYbkzoivOpJFgx
         mbqcbJRqqP7Uxb6JxDNGqFKdlGl6KW432DURgGBOfraK2zDr7UQ68LNupj+HPbMiFruU
         L89bcAg9VJdKNnqgX9KWmLlLDMwpgp1q5XuWzRmo3L1HcLT5rPxXw1a6jSZ3CrBvYYtI
         KT9A==
X-Gm-Message-State: AOJu0YwGBkHabtLuckbFwakA8SPpdsGflP8/mAC4ZAQY8HtSLjDZUTd6
	Py4nochTpvNt6d4ciTQG7RqFgw==
X-Google-Smtp-Source: AGHT+IGGq2lLBGaUklgidwDghWHWXSX4KmawDyQTinlUpnhVtTR24EqdEW5gXak3WOlH/CMagOvxjA==
X-Received: by 2002:a2e:9012:0:b0:2c9:f427:9e52 with SMTP id h18-20020a2e9012000000b002c9f4279e52mr351296ljg.134.1702164093633;
        Sat, 09 Dec 2023 15:21:33 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:21:33 -0800 (PST)
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
Subject: [PATCH 0/9] arm64: dts: qcom: sm8150-hdk: enable display output
Date: Sun, 10 Dec 2023 02:21:23 +0300
Message-Id: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable display output on the SM8150 HDK device. This includes HDMI
output through the onboard DSI-HDMI bridge and DP output on the USB-C
port.

Dmitry Baryshkov (9):
  dt-bindings: display: msm: dp: declare compatible string for sm8150
  arm64: dts: qcom: sm8150: use SoC-specific compat for RPMh stats
  arm64: dts: qcom: sm8150: make dispcc cast minimal vote on MMCX
  arm64: dts: qcom: sm8150-hdk: enable HDMI output
  arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
  arm64: dts: qcom: sm8150: add DisplayPort controller
  arm64: dts: qcom: sm8150: add USB-C ports to the USB+DP QMP PHY
  arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB host
  arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode

 .../bindings/display/msm/dp-controller.yaml   |   1 +
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts       | 264 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 132 ++++++++-
 3 files changed, 386 insertions(+), 11 deletions(-)

-- 
2.39.2


