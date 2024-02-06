Return-Path: <linux-arm-msm+bounces-9978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4780084BD1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 19:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB7BD1F25A37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 18:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356431426E;
	Tue,  6 Feb 2024 18:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JDcZZaPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809EC13FF0
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245026; cv=none; b=MCw90EEra4M/6SuXf6uTqKY6mgDpfgOqXQUCUoca+XjPz4BWHFWYKNfErNBwoOAic6m8c1JEXZD53A+i1R//NaGD4tF938h2a+lk0rqCQbQ6/mXYI8yWxatLt0ohDXXYT2XOrmhM+C7ND3Q5PIUKIlFvQT7G8oJ0D0j2RQjf+pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245026; c=relaxed/simple;
	bh=JX51EYp5JFQZ08l/6cPLk6AJNuyWClVT+Ndq0orY4H0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N6eZgf6Jmeo+X5oGBmbtiZidMZvMf74BLwKeG22UQoic3zlqfLS9Q8qwXTDB8QvkavyanyMxP7yU4petpQkwOI96VOcBLStHCHig/dovcf/Kr5upZJFDKcMgfHgWZRHkhB3ueMNSvlGv9dFRGjBYelFzSMysY0n6XO4QsCmIAtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JDcZZaPl; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55f50cf2021so7590570a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 10:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245021; x=1707849821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blk0TwokTQ2HtT8cgpJRO0PrfE8+QaeuA8KuyhDefVY=;
        b=JDcZZaPlQUjLlzr8/Nw4yL3SRuUFA+6ry6FGxPR4rQxnnAPNM1LfAiFtAsyjajO1Wt
         AxY+gQzwm5DGF/Bs+3R471zOxrRvV2SMYKumGynttydSboIBTGRJV6SJqTPzQAcFnTvR
         YXpdmoOyh7RLvfomxkRsF6gH1iOeL10WOjTlkTnJxW11k7LbB8iPTNFbdbu6zsDIJcVt
         gOxqLbWFk28GoDHyIgpTEZ2Ln0KfnkKvl9vQIuzu+qcdWplmHJj8Hy6P7VDp9pxc4JOO
         ZFLknmhI73GNUttMf/JbWbNqKW4ci4tuQMNUSIfVGRWPgsH2C8o+wrLrDAjwZQEZAGPk
         4oKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245021; x=1707849821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blk0TwokTQ2HtT8cgpJRO0PrfE8+QaeuA8KuyhDefVY=;
        b=BTc0AoZKst5xCfSqkWSeIh6dEnR5PPkVQTPVa2kNAw6hCipLyLEAhF/iqwAqeS/9S+
         mu4OhovtS8EA3JPuj0kHYXwsP+PHu9leT2DYYYxxP/ujvl7PDUT7lo1znoTgd3aHBm1b
         HW0ivCNJDOxOzQ9fNzcBxLS/cDYSiJ9T2swSrKH3GfQdr1RM1UHGHpaEW5spfHAT9J82
         eC6Wjc88gy8KEZ2mG7RHzNU55Exe9QPIIWIDweyNGqZKdf2qv+8mdoyf3ynThwkqilq5
         n3srCw5OODohL/daj4eH34/zp+q9s6YgP43EszdQve5tzvog6ZvSRL2bRvnVEHxg3ByK
         sABw==
X-Gm-Message-State: AOJu0YyjBF+o1Yi8UcVGbs64MNLXerqIj/z3gZ0j8PKGwI15LHY6seXS
	f40lQjtvt7IAIOK77ZeLNb8DsaHcC6sEAXqKwNaBgsJA/zb4Ozma6ETYYDjNUWY=
X-Google-Smtp-Source: AGHT+IEr82lAacnBfHt8DRfg9966ZPB9/VZ880Oe3p92rouzBTCWOB2Wi761RUCK6+EumG0D0uKuBA==
X-Received: by 2002:a17:906:a38b:b0:a35:80f1:2ad2 with SMTP id k11-20020a170906a38b00b00a3580f12ad2mr2572332ejz.57.1707245020870;
        Tue, 06 Feb 2024 10:43:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUJg3LkowpnDdk5wwkdLC12A3iAU0UQTFwHAS1GfzgF3sgrKSsi4VAJKEH16+kmjcBb4EVmr0prx6/arJRLLczSq0sRwgTLtcPw7sCb11JXnZDci6mh30BEa+g+ACCwvDHeNBCpe5luurHDPGp0GJ9IKjbc4sIiWaO+cpn+qDkslbniyuIsTXXq4+KF5xH7AwD5OU+djP5iR3W9eS8HpOmOBOhUa3/13og7LR1JKXVnKhv7VA5G9GC2EvOPBVFMsImjjKIypsWKNef8TD5LiKyZQwqyvU2/pTJkjL1sBvXjigotJHFK3bkPo75FdW022zrHsT4t9p5UkIsyVmN7sMN+sioVANhNBsLnyG9rP0e2XGhP1YwK+GqLdiHzA8/Wcv99TQW64YEZNvF6lD3NrnnAECuJT94H9vv6087yzgftDMUo3Iq6Y4nBvS4kVBViEGZcbFL4WfOl
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:43:40 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:34 +0100
Subject: [PATCH v2 01/18] clk: qcom: reset: Increase max reset delay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-1-c37eba13b5ce@linaro.org>
References: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=566;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=JX51EYp5JFQZ08l/6cPLk6AJNuyWClVT+Ndq0orY4H0=;
 b=6+OEJKDDzZm/iZUobMp4jbZAc54oYJ1CoK3iwFokuzcx4v8X5vWLaxpMdP3du43t3h0ci3XgM
 MH4LiFNU4e9CxIKpsFuxWufYshNfVrKcILJgI5cRcn9Z3cGRtK9tX0N
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

u8 limits us to 255 microseconds of delay. Promote the delay variable to
u16 to hold bigger values.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/reset.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/reset.h b/drivers/clk/qcom/reset.h
index 9a47c838d9b1..fe0561bf53d4 100644
--- a/drivers/clk/qcom/reset.h
+++ b/drivers/clk/qcom/reset.h
@@ -11,7 +11,7 @@
 struct qcom_reset_map {
 	unsigned int reg;
 	u8 bit;
-	u8 udelay;
+	u16 udelay;
 	u32 bitmask;
 };
 

-- 
2.43.0


