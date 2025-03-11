Return-Path: <linux-arm-msm+bounces-50937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A904A5BCE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 10:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E289188B353
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B41C231A24;
	Tue, 11 Mar 2025 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VA6iOq6K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EE0230BD4
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686894; cv=none; b=mIUD7xhqvDRLV0FPAev47qE6YmMCFNB8BY6FdfgORqAmlWl2ZcEMtDvGaMgPM30EYGlNFlud3VII6rX7ANPM6iMEhmjMAFC6avuMfXjZkReM5zN6B24zYx/OtnxtGebitXx9FQBcOzi059rtSNps5qM95fclnWIyS3+z0lCLD50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686894; c=relaxed/simple;
	bh=zIMXX8m/RgonXr24DzqiYSlGa7YPlTxmBQW7NDrORqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aSIk7Ej4Ysv1/HhKUsGc/2NnADIvkR1bdRBrn+uf0deuNycJZgQ/SqK4F3DidmatV7ovr94yJmJAA0NXkBuAf/PvtZtCzMMDKR6WhRxadxHazxZdP5hB8X3qgY0R9fGknQ414S5a8QHkqKQw0F3qGeACY1YZ429TWt7kTfA5fmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VA6iOq6K; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so10169149a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741686891; x=1742291691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jm03UvuT8W5Rpxcu5rSdy8m6+zk+AKlN8ozqhEmUZCQ=;
        b=VA6iOq6KkVUEuTEI6l544PWha2pWoSFgIjGk4FxPJk9JViKnSF6UTh9fYr+xPESYI4
         +TFbDpGQSsR7IKkOwHR0ZxTNMGNiFQslNRI0ec6/BQFO+j3KNu0gGJqD6L6d5vA2I2YK
         e3Ze+IpwqgXaf7Hej7TCkjjH6QGrz8n+41eTMgXmYTTtx/W26ihe2CZQEWFV6ZVJGKDg
         15M2bTSV72R0JR/IrEcCEaCVkSg8JOdpsW5ejtIOfCzEgYDYvFAk6P++27rCV+Xy/bKc
         1HguzxEGHSuWIIbaitULEWHqBau7B8jYrLi8mlRP+4vJma0PIsR3aFHNEEH/+ni5WsSs
         81Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686891; x=1742291691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jm03UvuT8W5Rpxcu5rSdy8m6+zk+AKlN8ozqhEmUZCQ=;
        b=VXkbWmerLijzaWTo+WDWpS6gcAVSBQNXNG0/8n94q7IP6W44tHEMxNBY5kW/FyGo1A
         mttz7aExynQE3HG9AQVLGwEHaf6CWuRbWk16AlGfUk1P9khT8BybhIOucZb/lA9vyT/X
         qbB86GAZd+ivsuCBcKDAyoBioRv9d31jTNQrgkrECav/vqAb0uu8qWa1qlg6wpceO2o5
         gYgryduKr0e0szSuptovR92Yk4JQdYvTZ+sEOJ0Iv3mznjdKucOT4fhGPLiCDh36eJ/6
         nP60cPhEWSEJpLhyqoCipJy6XL52Sf6rqZ44l5g4Vga9mTvpVaK6wRZEJl3XUEuOIjlk
         aDpg==
X-Forwarded-Encrypted: i=1; AJvYcCWiH8xEV4AJwNQ35QTLBu5ISun8DOLrb3rKHzVsaGyT5YfcwPDg2D4MA8cbj67G+Rvvhf/uqdni2MY5glpf@vger.kernel.org
X-Gm-Message-State: AOJu0YySlP6ImcbtMtLIcwOR9r+NaQZeU49vZ2SB7rScDcV7CaISJee+
	g/2H3N7thaWLsL2EnKpMbxY3j2AxePAv8nluZETmmUcuYwJdMHdBcz6KNue3xg0=
X-Gm-Gg: ASbGncvYP7/ne+v9ZNdhBzXRYDYIWMR7nZF+otuDdYEiFPm78nrvAnpb5a+YWvyzv9f
	D99HIEdOdiDy1iVhW3W1Ohv8YHPzbpPvXGM77iIp9GRnHgcpcPNzfvJictUifWcNDVzUYAj5u79
	YeenwzxPYEwdNC5SllQ0VYWsteZv0PCW5mvKxfE+qoUEreNaVQUbaZCWvmuYYlZuztVfgiwISgz
	TyG+OHErksG0feTnOwV5zW2oGYs1Jt3fOgo2wuLDrXFK3hGJxZgWImibyt7PjoloKlCbwIlDNzT
	YLGHQQX91X1alvVRVmUQURwyM6jYI2PGBi/6R3QCU4i5uyz7+jjP5bQQJooN9YtzCFPoHztGfzw
	nsS/mr5uk7Q==
X-Google-Smtp-Source: AGHT+IGKxxOWPNeiHoUYs+NA4pDEtcYz0NGKwKD5GEdsLIcqat9tyNzB39oWArbJ16F0FMw7l3A1xw==
X-Received: by 2002:a05:6402:43cd:b0:5e0:4276:c39e with SMTP id 4fb4d7f45d1cf-5e5e251190cmr21540775a12.30.1741686891372;
        Tue, 11 Mar 2025 02:54:51 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c7472128sm8062047a12.23.2025.03.11.02.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 02:54:51 -0700 (PDT)
Message-ID: <7a5518ad-b470-4c5b-99f0-9b4952d332ba@linaro.org>
Date: Tue, 11 Mar 2025 09:54:49 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] clk: qcom: videocc-sm8450: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <kUTndZWoRvG2gR8cIApkGInFovnNrSc1iN3-UjzJs6kRXeDesVooOLe7ifOFUBsFkixyW_IJ35V8ng4ydqQvGQ==@protonmail.internalid>
 <20250306-videocc-pll-multi-pd-voting-v2-4-0cd00612bc0e@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250306-videocc-pll-multi-pd-voting-v2-4-0cd00612bc0e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2025 08:55, Jagadeesh Kona wrote:
> +
> +static struct qcom_clk_cfg video_cc_sm8450_clocks_cfg[] = {
> +	{ .offset = 0x80e4, .mask = BIT(0) }, /* VIDEO_CC_AHB_CLK */
> +	{ .offset = 0x8114, .mask = BIT(0) }, /* VIDEO_CC_XO_CLK */
> +	{ .offset = 0x8130, .mask = BIT(0) }, /* VIDEO_CC_SLEEP_CLK */
> +};

> 
> -	/* Keep some clocks always-on */
> -	qcom_branch_set_clk_en(regmap, 0x80e4); /* VIDEO_CC_AHB_CLK */
> -	qcom_branch_set_clk_en(regmap, 0x8130); /* VIDEO_CC_SLEEP_CLK */
> -	qcom_branch_set_clk_en(regmap, 0x8114); /* VIDEO_CC_XO_CLK */

Dmitry already said this but, this change feels like a loss of fidelity.

Please find a way to use the existing helper functions.

---
bod

