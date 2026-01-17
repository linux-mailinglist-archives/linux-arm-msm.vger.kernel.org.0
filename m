Return-Path: <linux-arm-msm+bounces-89525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A06AD3911E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 22:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC7163013C55
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 21:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AED2EB872;
	Sat, 17 Jan 2026 21:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EOQeWH8t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF9B2E8B8F
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 21:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768685375; cv=none; b=G9f4fSiRtE9L3stTLXcItdgFVtMED0QyCpecUo58zOzm+kYl3VSQQHlq7jefFFjbzK4ID+1qJftHrtnobJH1eTV+jwMTYu3+qtXVre5JYUfBru64Mdf1YU8nKnQ8YE00a+HL6HY8Ng4AvWAEDgX/Zgql94VvOp7+NUBojO9ScVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768685375; c=relaxed/simple;
	bh=+F8doHC+R3TqmCSMzKBhj25i6waFCtZIFSnjx/GJfFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amdy3MDgBz8tfztVyE1c5m6/P/tArvTrtOLjPnuivhc3naUkjFsNJJ+W0PCrT6XkAwlUgu6b2ZE+6bS3Ic/LPY1cXOdv0r3RD2c7m4jS4zZWDUysh15Dgsa5FQXPxtzCQNvtmbJMD7Bl6GMc4zmRUwbpEjbAHwLzOGfQaXiBM48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EOQeWH8t; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801bc32725so14316635e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 13:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768685371; x=1769290171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUZkLJCYosO47GkqiURTbkox3qlRh5JiUOfRD1pS/eA=;
        b=EOQeWH8t6++fSCL5s+4bYK66hju4QyqLzCl+uesRvBJAihsFtn+gW7lr+5Zo0IHCTf
         BxKjrfhccthYWiVfwFz40SKRX9xQuy5sAX7Kq2yNBpFcif7N/wAbLXq3Np2dn6RAhyqw
         ne/Jv+5jS1YakqSX5Sp8y6fDTwa0xmuFjqP3mr3lZtqeiSE0iNgtG86W4E9iH8wmJJ4U
         pCwyJg+0u5bptYkEojuYJIZQLLh/rc1frC3ZrxSxLLWg/fcqL6OkI7gvP677SJNDsWqO
         qdoFFW4OKigRPfsZCjAh0oI6Pi4bzYzDIyoCYNI6z59J9L4dd4PG28ZfO1DsBphYew8K
         en8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768685371; x=1769290171;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUZkLJCYosO47GkqiURTbkox3qlRh5JiUOfRD1pS/eA=;
        b=TQfm9QkFbpQNTI1rfSAfjx1lbTndTOd7ITLfgJTWg1zFvh7JlEqj8xfz9uDXNMEKd2
         H0DCJYkKHZ9w5lAbMf2ur1a5X0jaGduOnglTu4e7DhCldj2XIy2RBOGuUi+FgbS0gJl+
         ZBvJobWNUBNvUsGv/HsnYDTyxxgoxKN+eENX4d+5ZQFd8taSp+9prkRVKcYx/VyfbVMc
         c7E3cgjAZs+LsZia/ccp6ngdgi1sS1ImcgOHV096IAJ/RkvfifX0TbsXYE4Aw5JmdAxM
         zBBnF353sRb5UoI5E7fqjeHUNO+69OFjZZ7nnkALimHvHjXeVwKi9Z6aB1vleb4dG8SR
         R5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXObtXpYgHkMwWa092B9VDTZFxtqdCgXfXmvZrkQ0RVgWxQr4RmIcnlCGdZv0nO2Aenwv2idq/pi/3tclpX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw+zz9t7/2eDRrloGb5J0H1woDltgScMmied99K3S2POPK0lkn
	CNPjOjfUJ3oyWNG/BXbHJrAsOtxeXWnMxip/OCF4k60rzkBHWlSuqB9KieNPW6B4aQI=
X-Gm-Gg: AY/fxX43NRurGxgM9DDKtvT70qJEcMKGcMTZHxvd9FYLtlmGtHF+ddmAB+wN7CHTS33
	GjWc3F5nUk1v+eJzPCYntjiOlEl/S/u+3N9h41JMwF1gh/7IkhTG5ldUTooKQmOVSQ5FYOHb8gF
	ka9iPfXSwMWqvQc465jeMD7EC61ptt/Z6gNbEygnrBWFXXjMruamqn013BKKurp2ynbJlTIWft6
	azhJBbXv4dlFa4IFsv2KerIKZzdccTUIPe3QDaQP+bGbL7J4TZF+bisNp3/lsAKaLm/vsoK09x4
	LkI+ze9jMZpefac1nrR4kC6PB0hdb8pfp60bnNVk9Wm2Z55CQcz6e+dWx+giEDjOe0p+NWtIca9
	WjYuwffGlYutr5DiLr5q46ob+A/y+Hj8kBiGHO1Jig54opkWdI/e/SDH3Paybxh7EKhHjB0CVtM
	YbVqwI5GhvYcnfchz2eTjsi6jzvcddnscPqP7iMY8mxpWZqhF2abbE
X-Received: by 2002:a05:600c:8106:b0:480:1c2f:b003 with SMTP id 5b1f17b1804b1-4801eb09208mr70457285e9.20.1768685371142;
        Sat, 17 Jan 2026 13:29:31 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fd3bcd2sm51156465e9.1.2026.01.17.13.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:29:29 -0800 (PST)
Message-ID: <1d4531c3-c73a-4990-8752-d9b4190c9c8c@linaro.org>
Date: Sat, 17 Jan 2026 21:29:26 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] media: qcom: camss: csiphy: Introduce PHY
 configuration
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-1-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-1-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> +	if (lncfg->phy_cfg != V4L2_MBUS_CSI2_CPHY) {
> +		lncfg->clk.pos = mipi_csi2->clock_lane;
> +		lncfg->clk.pol = mipi_csi2->lane_polarities[0];
> +	}

Just wondering as I look at this code; is it possible to set clock_lane 
to say 0xff in DT ?

---
bod

