Return-Path: <linux-arm-msm+bounces-38546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 589C59D4144
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 18:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5777B3DE61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 16:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7BB14EC55;
	Wed, 20 Nov 2024 16:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qP7zuNWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F96C14D28C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 16:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732121348; cv=none; b=eU76iQLlrZFG3Xi/sg/mBKD/6lbTwzyR333aPqsSFlLTsp/MOqF+ipwHekDw639gjM4QBsk3uhxOmwovBx5+BVDcB4aw6WB5r9XzaUx5WZJc+jQD99DdpPEBzIP6e+cHpMwy6u1mtw6+Zgxb72cYDu2GT8RmxRgccnDboTpi9rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732121348; c=relaxed/simple;
	bh=srZ9SCWdJyh8yNz8se0UPXWlQVN0xpkVWoSbiXEFNo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M9ybEj/+UMhAWwFDytMA9HqBh3aYAiQ+YdhTO/HMefgl+REi+GbA5+HFlSJ7L46iD/sIZosJ0OhLcW49f8mQUHMd/j+7cBbP7rwGDZqOk+bINhqohXUAJ2U099dhpLuSnMYr5+dlsoJx9EyVL9wDTzKD1KH+K6XBdstZY3zZ5oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qP7zuNWt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4319399a411so21575575e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 08:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732121345; x=1732726145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8UgD457K+Hay4DWV5Dre9+UIqq+Qp9AxidcbC+nUoA=;
        b=qP7zuNWtmbmNY6/Qi2gVNSUNaF+3no5dhPMr9qonH+113/6pPyfnzepN+6zjFO2hnj
         CwANPHr8q/AuAgGrOri2Bx/SAVQV5uXSaQdJr90wt1IZhb1iHOXu9qRLY9hi7H2jvywI
         7+kOI2BsZP1zv1C0v22/0bGgv7coNp4yOkvAE8jJuR5lpuUSS5X/jey1wnniTGcWxcr3
         ObgJ+47x7wmhVu+SB5ZCHPNHDAv1QoDWL/dZCAzn1XTSNwybEHafDL3QdP1Vo0v4nVOx
         sX77QbLDBp/TeyOV9PfGgS5sD5Skei8HSIhibL5eF7xgLv5wmAE9cdiOc61nTEdlZnGh
         nTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732121345; x=1732726145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8UgD457K+Hay4DWV5Dre9+UIqq+Qp9AxidcbC+nUoA=;
        b=A5j/yWLFZR7dZBRCtKF9E5M0Y+k9noslBMXzrWeN95aBnHGOYJ4yUKf0tcUdsEdH1M
         XvLU5tVTS6W57ng6TN1rhTnuTkfUG87I3y8mMXvMePQaHnCOYUqzZbzl27L8fUj2cxex
         KU1SGEaVk/ZwF6Hiayp6cXdwZzi+qvYRHr2cGZ3jn8N3D/mX5zQlUkIplvWsq+smL1fS
         CRUEN6oKbhCxa/otpLKw/4QyKWby/eeyZAsN33mD85RdNygb12g4VYSDQnmVIGZeKLlu
         2WGSxTGOOEjvuN9v5w/GZECpQQ7Yx+JA3EpmDgEKXyx3jd0NhwZPHZIvu1gsNtgcdWk/
         KP+g==
X-Forwarded-Encrypted: i=1; AJvYcCW2/0cAHt3oxUsJqgmHt+gmPW8K97cD60ohzoTgmfDSBfJkeyo4930NKGenFkYgTOfR6D6nkNbJboqQG1Bc@vger.kernel.org
X-Gm-Message-State: AOJu0YysWfiPJLNzQZtKZ9df35S3TqSz7rO08+fR7nrow0OW7n5NWCV4
	XpZ21CdKA/AeTwn+5XG1CkAtiMdkY2OmtPqP64q3yeQlNb5NI3s9uX1dpcKO4Ls=
X-Google-Smtp-Source: AGHT+IHo9WhI3mbF3lCYmgsOy4+wAwOTVXhU5u9vhGfivrKQbhnhnyedHmi0kYrH9tI43DWFsRMBOQ==
X-Received: by 2002:a05:600c:3ca9:b0:42e:75a6:bb60 with SMTP id 5b1f17b1804b1-433489d6886mr28109325e9.19.1732121345508;
        Wed, 20 Nov 2024 08:49:05 -0800 (PST)
Received: from [192.168.0.200] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b463aba6sm24821125e9.34.2024.11.20.08.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 08:49:05 -0800 (PST)
Message-ID: <587de15d-06c8-4f12-8986-f60a80fe5ad8@linaro.org>
Date: Wed, 20 Nov 2024 16:49:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: common: Add support for power-domain
 attachment
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>
 <u6azgqlmncadcwiz42pk36q7rehwajnftvwfjh4aoawskdwkof@ao2imoy34k4y>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <u6azgqlmncadcwiz42pk36q7rehwajnftvwfjh4aoawskdwkof@ao2imoy34k4y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2024 15:41, Bjorn Andersson wrote:
audience what exactly you mean with "singleton" and "core logic".
> 
>> Use dev_pm_domain_attach_list() to automatically hook the list of given
>> power-domains in the dtsi for the clock being registered in
>> qcom_cc_really_probe().
>>
> Do we need to power on/off all the associated power-domains every time
> we access registers in the clock controller etc, or only in relation to
> operating these GDSCs?

Its a good question.

No I don't believe these PDs are required for the regs themselves i.e. 
we can write and read - I checked the regs in the clock's probe with the 
GDSCs off

         /* Keep clocks always enabled */
         qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
         qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */

only inside the probe where we actually try to switch the clock on, do 
we need the PD.

         ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_x1e80100_desc, 
regmap);

Which means the registers themselves don't need the PD. The clock 
remains "stuck" unless the GDSC is on which to me means that the PLL 
isn't powered until the GDSC is switched on.

So no, the regs are fine but the PLL won't budge without juice from the PD.

---
bod

