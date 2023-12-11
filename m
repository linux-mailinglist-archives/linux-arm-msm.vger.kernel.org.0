Return-Path: <linux-arm-msm+bounces-4231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6724E80CFE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 16:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 590F8B21517
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 15:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7144BAA1;
	Mon, 11 Dec 2023 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="umOCXOcr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64A0BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:48 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bffb64178so5419084e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702309487; x=1702914287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hdsbz8sb9Hj8XgnhSW7DmZ4IXqWL9DwyDiWpjOSfMt8=;
        b=umOCXOcrob+TsBOOUbh1d+pG+0c0wboi2GLffGzQ1dGELD0jZD3kdWBASV1HKo9WV+
         Ea1GkpAr1G/6DwgBlKevGDqEuG39ZNkDpmuCn6cf928OPDSnna7CZv05pETsJQxg3hJ2
         gvezWjBNYkLTAEOoO0Jm3C8VkvXz4bTP3+Cl3shbhw1kp+3H7NunFJr0hc7iEqekfkMn
         wjN8+lZqZSqa0awciAyguLFYqCx5MukWpaddFhwf6nH1DfED/IWjjKccXoUDQhZ36OJD
         TLzND6/gtosFClrvkkSCUqy53Lh1PXZd5aSuaHeIjxz2K1YdsmpUHacXKuC/68HCWOVp
         3ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309487; x=1702914287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hdsbz8sb9Hj8XgnhSW7DmZ4IXqWL9DwyDiWpjOSfMt8=;
        b=IP3NSPcAosHY9VP/04mu6FnrXSyoenq1ogzNofJE677YmCslepWkysYZh9R6MB85bm
         GuEpezqLzwEkU2Df6jqmOaww9gMnbS4za646llQ8FWJTzG3KrCbxe5WKb52m4KRw9Wtj
         q57sBqlf525ChZkl1XFR/ErpFYLnbJurTwpkmFur2vkOBqUetzQhGTJ9iPtBeDJ/AJri
         +G3VKfN2/iBmmIjQmXTbFn/+0KCkCowh/OVHVFFF9EHVqG5C8Y445378tSXfpEWrxuqb
         oqenvPRRJzOcCTBilT2wiYh8r6XaE4vl9je4D4TBZzr8JDV8wIiE8eA1eeWxqJOGIwZS
         ndmw==
X-Gm-Message-State: AOJu0YxcYeBygYnwWOPiwzujXzfWfnxrb79Wf236aJxBOHyzBLZnyLDH
	m+lPXXMmZEgc//EaMYXQCDg47Q==
X-Google-Smtp-Source: AGHT+IHxCoL+l7KSHEGd7xaqHpmuKdHomR8emcbB6urk0ah7wnrXlsfrXB4VbFDvVisb924E6PSOAg==
X-Received: by 2002:a05:6512:1329:b0:50d:f93b:97a9 with SMTP id x41-20020a056512132900b0050df93b97a9mr1464713lfu.1.1702309486926;
        Mon, 11 Dec 2023 07:44:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:44:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/8] arm64: dts: qcom: sm8150-hdk: enable display output
Date: Mon, 11 Dec 2023 18:44:37 +0300
Message-Id: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
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

Changes since v1
- Dropped irrelevant stats patch
- Fixed endpoint stye (Konrad)
- Changed SVID from u32 to 16-bits value (Konrad)

Dmitry Baryshkov (8):
  dt-bindings: display: msm: dp: declare compatible string for sm8150
  arm64: dts: qcom: sm8150: make dispcc cast minimal vote on MMCX
  arm64: dts: qcom: sm8150-hdk: enable HDMI output
  arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
  arm64: dts: qcom: sm8150: add DisplayPort controller
  arm64: dts: qcom: sm8150: add USB-C ports to the USB+DP QMP PHY
  arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB host
  arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode

 .../bindings/display/msm/dp-controller.yaml   |   1 +
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts       | 264 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 133 +++++++++
 3 files changed, 388 insertions(+), 10 deletions(-)

-- 
2.39.2


