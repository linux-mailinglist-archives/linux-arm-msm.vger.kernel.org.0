Return-Path: <linux-arm-msm+bounces-73031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE2B52590
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46B45460483
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 01:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8413C1EE02F;
	Thu, 11 Sep 2025 01:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEQFzSJE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EE34A04
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 01:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553146; cv=none; b=iwqZg2BsEFxK7JPeBOsq70fG6RRdPasQc/fC/k+jftX9ZWl6XBCBi65UHFDikwuJ24QU2MWe23ur1c9av79dUzNlmCXBIOToXL4CzrgfFielmj1Y3DHy78j86OisEP3OyOOHVvLlsMtvA3PMJvrElRqOcbk07zxV/R31UrhUctg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553146; c=relaxed/simple;
	bh=jRIu0W1JuXkE/BIb2o38vY5micOCt0sjxd4/0huHplY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L59JnEmEX8Vsgr6a6c1zMfMGc3E1bl/NPOpZAj8rdWiCRnZGz5kpxBdtAzWYy46v+HbBFB1JMM8c3n+I3BMACMFYkswTVJBqPn4i4JhMcpkUf2Um55fRNN3pck2OomN4NR8jq9g61XsVqcas3+/5fiYWlWWGA6tl4WlnlN4sj58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEQFzSJE; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3381af2736dso399571fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 18:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757553143; x=1758157943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T+o6r5L1XUbiBxCB1fojD2F0CMjkyCBE1OL+/oMjXBI=;
        b=iEQFzSJEKMepG3aAUbfnunbfMFi2C1grULp4zUadbSAtbRctsjKyPLcycwXlSU/j1v
         PgPk1yuGDEzMNrli6Zr1AwzQvpWF6S+UUHdpaH+w4GRi1uQMcs0WMdE6V3rE2LIlOpWW
         NVQB7IMRgtFd7yvHhdd7vUHkkizWDA20LIteUJ/Def6B90ktLlXYCteqdsUSq/Vuf4eo
         y9Nmp327zX2XaXT9i2e/fvBh+OWN/DjkyOXDpNH4msuAZXvhR2IgCXgYjQ96uSV2Ry3j
         bSKEVbxBG9+VimS9rzma0j+YrowpIssOwdpTuyOUq+F6iMiIdoR7mmLvvzfw/1N5KtqG
         HSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757553143; x=1758157943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+o6r5L1XUbiBxCB1fojD2F0CMjkyCBE1OL+/oMjXBI=;
        b=DH0q4jZmxCbQZ7/LiOSpvRqw2KRqOwRo6yQ6ITdlidDgLkGX+XStPo8G1nMigeemKy
         I1uORuKwQJKDuJjvMdfKgnmBz+zw2wzvhz+QBJ9MMnqdtD6A+McEPE8OePiMcgP5SgnF
         RaazoKzorLMmUTj6Yc6MkaN9dRlKpm33gIu9wP13wz9CwFUqw2Lx8VfmqKxeIO+ekSw6
         YXqnpnRJLE9FIJl67oq/y4R7F9lQXpbWjxLSvxpCntZBZfOSna0IvOhDFgrhgDPejso4
         NfDJ9DtU7cvvV1SlHyBlSWYGse4zWGckWx7HEM7X922XiWlZtq9NaaBk+NOT2qhYsVlh
         VIcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsylB7zBBq3i25YimKC+mSgv4hsmuAjEygiEm5B45DgackQ3Xq/wbpGit6GW3GiJHvP2GHOQPgnfPSsfR6@vger.kernel.org
X-Gm-Message-State: AOJu0YyKuztc/nTltKG5SmaJTQT1hBDWn+Vt9g2U33KvyQHpx81j8LDu
	ywpkHLOSNYdpgz6Zpw+8ex4r4Y5KWWU71SlRtb/NUHHkhPBYRP9cIy/RMOUX7u33BVY=
X-Gm-Gg: ASbGncseLXdLSM+XbVBpyCgdLgfESbNFFw3TD8o8uNYj6PQh2gTJOxP1WrH/0YgNmBb
	/O0KR8jtAN1psQpT/0LNvfWm2BcbziZyPOOviEFkZtP687xP2lvxIaXLKRZnqMAr1ucDb2Kihjg
	Jfepo1xdrgT/89rDO2jB4LQg+1/kZcpy787OmY+PaKr4hCQbyXEtP84vASsZZZopi/3U9qTMK32
	7co5Wh1NPIsOMqBKyEnX1tZaDKr9wnYCI9UeS/U2V/Vm7BzXSYy5e8emaRP/KMKe4Wsvzu/dFs3
	xzj63DvKIMZL+q3fdbeJ8dpOlX42eK4QONnbJu0CwDfRhuJqK224xesp/ibsypL/1HgTNpWgQKh
	lyc1jGEFibcoAdUGGcQa52GNFSx+QwvfWLDCVpRfcUXSdl2FUu8tNZ+8+jWy27buaLTs5KSZHiJ
	B7eV+dMg==
X-Google-Smtp-Source: AGHT+IFVdqTcDiCzur0w1bVAWzy/bLKra6iG62K6s8w3CEbwZmYv0G51c/W/3EcnWcWyujF0k+gzZg==
X-Received: by 2002:a05:6512:3a96:b0:55f:7066:ce87 with SMTP id 2adb3069b0e04-5626058cd0dmr3089123e87.1.1757553142729;
        Wed, 10 Sep 2025 18:12:22 -0700 (PDT)
Received: from thyme.local (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63f3esm45786e87.67.2025.09.10.18.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:12:21 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/6] Specify Titan GDSC power domain as a parent to other
Date: Thu, 11 Sep 2025 04:12:12 +0300
Message-ID: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make Titan GDSC power domain as a parent of all other GDSC power domains
provided by the Qualcomm camera clock controller to enforce a correct
sequence of enabling and disabling power domains by the consumers.

Only two Fixes tags are given, because so far there is no any consumers
of IPEx, BPS or SBI GDSC power domains, however the changes of making
an explicit PD hierarchy with Titan on the top will be helpful in future.

Vladimir Zapolskiy (6):
  clk: qcom: camcc-sm8550: Specify Titan GDSC power domain as a parent to other
  clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
  clk: qcom: camcc-sdm845: Specify Titan GDSC power domain as a parent to other
  clk: qcom: camcc-sm7150: Specify Titan GDSC power domain as a parent to IPEx and BPS
  clk: qcom: camcc-sm8250: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI
  clk: qcom: camcc-sm8450: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI

 drivers/clk/qcom/camcc-sdm845.c |  3 +++
 drivers/clk/qcom/camcc-sm6350.c |  7 +++++++
 drivers/clk/qcom/camcc-sm7150.c |  3 +++
 drivers/clk/qcom/camcc-sm8250.c |  3 +++
 drivers/clk/qcom/camcc-sm8450.c |  3 +++
 drivers/clk/qcom/camcc-sm8550.c | 10 ++++++++++
 6 files changed, 29 insertions(+)

-- 
2.49.0


