Return-Path: <linux-arm-msm+bounces-78231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E15F2BF9451
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 01:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A3C93A9C51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 23:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C967136349;
	Tue, 21 Oct 2025 23:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uArbDuZd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B918BBAE
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090318; cv=none; b=s3raCjb9gHWWRz97G/EmJ8IPvLE5g54niMBYReCkH96G9D90i88Nhz9tCII8fgcOsk1rHW+pY51TEcG9jSnlVIMv0M59w/cGPbIQeE37+vldxSOBvzO9k7sUOkVGjvZ+gXMvdouUYKZfIQl/NlHWH9nP/UbpM+5Yks4ic3/5ZKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090318; c=relaxed/simple;
	bh=CG2fj2agGiYEv+VKfbErKVJafcLsg0MfoHn5vJsFu0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XlxjTWWGaL2H00d5z01MNjzX8PrHcoTT6R7khEIIHP+IXOhXB3UUNMjaWSxnNHda7Oe5KR8xDO/oRFGNJHQBwilmOMPSN8+kI3ebywAwXPjHJcXMQa5Ld4bac/W8jorntnbKfONNbEc8sYVQAZ1gENp/DirWNO508nT4CQpXG+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uArbDuZd; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-592ed2ff7fbso81471e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 16:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090314; x=1761695114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXNzqEwyvYqnZn04rAmeK03nKv9T3yBVcqRQH6EexXc=;
        b=uArbDuZdQaOAn9hQA2Iw6mo9Ds6W/whgOIVBqZa1phnQydfk3MwDFNYtRsfJeAyNNh
         +PJfYdWHY+mJrVQzXxxXZfujOiQMSlQO7s74RVXc4b6MgpL1PvDIXwM7HXeFwNgTSyO3
         2TuE/jTb5EN2YGwNakYB0yzcGWn0OxsHttIQZ8B2b36LpJZkP3rkNWjHuGFEutrs2bjH
         zHiajdW2nU9z0kxvjK8NXwUdkM7WoMKw1QMfxUwgrtiJmgrz9WUWsat+uSoyB+pfqwij
         BinDBKnwm/c1PIx5q+cnIS/ER+YAVsPquNGpzB1T+mTrrKSDdCHx75OBizjESpC1+N1b
         Y76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090314; x=1761695114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXNzqEwyvYqnZn04rAmeK03nKv9T3yBVcqRQH6EexXc=;
        b=Bi/fZVRhMMVRtcF8SC2GTF4iRIVPszfZ8rG11N4dkN56KU/8emOZ2PKABDq3uZnyU9
         x21V7+TeOT63PMiCLbj61MqQBpXi2QLKGcWKQSgG9Sa2vA29ramjd6riSgoS2bfzf6j6
         JY/5m6bSBS4V7F3gsTVrLS9dnKGzkxEwJWLH9diADFlUNQ2c7daRjkgD7Qy2B/tZhVSR
         goDHpWH1WnT6eAERFXvpbsdUHsV3mRugEbG+M1K5xQSv0ukn3LtpGrr6b5tkUZmGqbl5
         RzH4rX46ztN6CafunBM7ETdMseuqp0CAWcs04UZnL74egzlSdMesFx53X/6DkO05RVC4
         a3ag==
X-Forwarded-Encrypted: i=1; AJvYcCXJYVjwz9LUf5cWtcHi6XLWE2g+z0/xjdvfufQdiqrSlgGNR1DWqbqypqdUAeX5bvM+Yfjn3KHLhhKregFl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx38ZW8mCf4P7bLC6rdKuWhGRbI+BknWr6rN3bfM01o78FQ049h
	bAQwWjxkXj+nFU2A0QG7dgrDQxP0ZOuhlLdDlVtKbNVu+AvfqIsjookcn46UwhdRi3o=
X-Gm-Gg: ASbGnctnuhs/ubnmlDMcxKi/mIzpJVJy7A5a9Uwd9n+4iZEh7WEJjXSsnIon2XtBHxA
	BNU8BG1BghNAUQtJYMi+uxODUrUZYfrj/u+6EuqGSVBVibrXcFLEQhb4CVhjkqYEtQhdjIw3qsh
	HBNNElN+o9goGZsjrfRYByIBk1Bvyn0cm9CIrvPMY7EJL9I6ymtULNhBLKg7UrU1PzAn9GWsSmJ
	e6rmCKEM/zUbGotb5DKbcPLr8mAgfn7vDo6VT5iYTdHSuBgQxi9F5AvUrKvexoyLAqYDLv+cOLY
	PKaWuVUm8nFTXbclSEGaneIKwN4pSMBTm9AM/L4tqC7GwOJhBBf3eNXIFzUSBcq9e+IhDQhCACi
	GgiyAJauw/b7I0OKd+HY61t39rh9Ecwc7/fVWyxLZRH4MYaoO8ooXkgN2UmBjW3fiZYJVV7z1nP
	VObXICe4e2f1ol2kmiPd6YRmcDpXb8WhljuaARZ+iw3x8=
X-Google-Smtp-Source: AGHT+IGnZwmTxu8wfMbgMZ/9IeVP05UhNFnptgFg9AIRjzkpILf4FE8wwl4LMnFdSkeVEZgUJgYRcA==
X-Received: by 2002:a05:6512:308d:b0:55f:6637:78f with SMTP id 2adb3069b0e04-591ea31cd1cmr815372e87.9.1761090313555;
        Tue, 21 Oct 2025 16:45:13 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def160cfsm4076397e87.76.2025.10.21.16.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:12 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/6] clk: qcom: camcc: Specify Titan GDSC power domain as a parent to other ones
Date: Wed, 22 Oct 2025 02:44:44 +0300
Message-ID: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a consumer turns on/off a power domain dependent on another power
domain in hardware, the parent power domain shall be turned on/off by
the power domain provider as well, and to get it the power domain hardware
hierarchy shall be described in the CAMCC driver.

Establish the power domain hierarchy with a Titan GDSC set as a parent of
other GDSC power domains provided by the SDM845 camera clock controller.

Changes from v1 to v2:
* updated commit messages per ask from Bjorn,
* added all collected Reviewed-by tags (Konrad, Imran, Bryan),
* Fixes tag is set only to the changes, which are functional fixes in upstream.

Link to v1:
* https://lore.kernel.org/linux-clk/20250911011218.861322-1-vladimir.zapolskiy@linaro.org/

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


