Return-Path: <linux-arm-msm+bounces-84443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 76740CA72CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 11:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16A92300879D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B682131AF06;
	Fri,  5 Dec 2025 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SBrWa9c9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812A72FD69E
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764930829; cv=none; b=maCQ675gUhVFYfB2Ic28AxRewXbl16S7czsWgVy58QezIBSEv0dgedZyJpUJJ/XaQYA56hkn2T1ygUJcMLLahP9KW3aSkXWveXM6dTkMunK04etlTP9CPTeN+c62wboKGrX7MOeXII6zB47H51778NZ1DU8HXoddd22m6FRIARE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764930829; c=relaxed/simple;
	bh=2zQVkXy8AVVI1kFEAu+O+ca58FKkvPeE77EeUvuPheI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/7oA4Ck8MJJE5Tnqa3Gv5xT98Prk/Hg2z4rraq4gGL1eHdRuWCjSP0dFEY9R2HRFnhHFJSGE7ZjRs5nFS7H9N9liI1Ho9ZlzNR694AopSyI9pvN3wNnz5K5CAQGXfF16ikiuK5kN/+/MhASA4mf0NYAbXVL8BoBKVek01bSAUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SBrWa9c9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b38de7940so1067928f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 02:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764930820; x=1765535620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vAzLPSLG7AtJee+XVA0Hp+yvy+eodAcCDH7vUMbwv0A=;
        b=SBrWa9c9PfRq+QJukl83WM5I5bvPCk1IpTqyzG82YdE/4+pKsE35ZtWmdqbFu0Im0e
         7euHmSXiPj6JbVfW9lb39KiU/7htBPusriEciZsOkAQu2D8Ggtc5IbVQI++38WB7JpfL
         uyiJAvzaf3cxXDA0XDnqKaU2Eaaf4065OAK8YL19dkvFFoVC03/eB48mUA8b2SEYo2EW
         KB7ljuC8MOHuw9Q6YB1Mkhm7uRCNx49Teou4vNF00fToikZHTQuHV4SA+lwCzVrZJxaY
         32JQAhlm7SkcKUxXgbEWjeVIeg0nhGz7VveOgLbposWYD1ZnVlHX9VvrMUKJzqZVqkH4
         s/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764930820; x=1765535620;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAzLPSLG7AtJee+XVA0Hp+yvy+eodAcCDH7vUMbwv0A=;
        b=DNemKDazXvEhGpoozse/2qiKEVIxkyD3AZp6O0dVA6lTfujm3pvqgEkkC2sCmQ1ml5
         KsLjtajjFui/+4U/9SzQzH8DVs82aaOIfkigxbbZ6QGAl/UwvRSRzDCJ+Za9O/iTIaex
         hWo8RfPnapa7H5BpYlDuSrZ2M9jpqnlsZ5Vlt/CF3k/m2mEhKTHsCPyLzKHGKk4WIRpL
         k5pZVwNNY/0EJyXHdBPWj9S0bsYppAHuzBLFdNvN/l6Tnb2gFcap9108yblehdFe/ehT
         2y3Mu6ZDjE2VaB+0kieUNNnJh+bMFRkI6PJXsFHzaHHD6FPpy4cZNBGziADiQxiQ/5WT
         4cMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfyAJCgQYJkUriXcmC7LPNM1iDakiYqkpPzQNiUnr07VQpIJJN9HMffiVmxUiNqgH8bVobAXHmDrnH55Ej@vger.kernel.org
X-Gm-Message-State: AOJu0YwR0n9wpgwbItnS5IvvLNr2mtpn8A8WIG4waDB0yBh5IT/SWwJq
	QzYmGmSJtLe/qzBKV2sE0VIFhZUH9Jdy6xFq/R9jKX6zNPZMjQ9n47LFwrlTGt0rPN8=
X-Gm-Gg: ASbGnctLai9dEE2SkhWt6SK2s7SqalLWt1VQZaOMceizpa6XzmmDqPX4O/pMIIfJakr
	0bV0pDgiSAv1udlRAQvs8uAykRiYmJdOS0VNq5r8D3p7qYYb/wFud3ZoOlxQmCvEC/E0MlIXear
	o1eq+nnwpl1c96m6wYVFeqj9tqXum60NRN5/7PVS9c06e1DeQeFZMFq5esWIlTsXJCxXcVlPmBd
	ERX+fI6c+Po1p/SDfQDpdirSgzJF0S2JS3kxjWNs4A7d46lds3hef0kCPeTWeYIuIjArflyBFCi
	z2+aSXNnNYDyjdAshq1RkPV4sjZbuX7BFtsdmUR1vmhBBwrOfeKbqj5gedwTXuPqpXh17K6DDO9
	uEjVUE1kZGx9Kuzxd5KUTHz7JvFlb49LbCyaYpq/nvvGMstftat/GRo8lk0jpulqF9MPiMu/CdL
	Izq5NxVvMTvaw6kcRX0h+vmgjtwRoV84DMjMX0ldBLDKKUJEMVFGWN
X-Google-Smtp-Source: AGHT+IGmr8vG9r+BJjkWvvjU7SasEQlgu0FAyDtwLcxQqvgN22qOU1pGX5mKZsJ2hiueUbXQHUz4hw==
X-Received: by 2002:a05:6000:1449:b0:429:d170:b3d1 with SMTP id ffacd0b85a97d-42f7320bea0mr9668770f8f.59.1764930820250;
        Fri, 05 Dec 2025 02:33:40 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfee50sm8133308f8f.14.2025.12.05.02.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:33:39 -0800 (PST)
Message-ID: <f76aef3b-5886-43d8-b15e-6513abf8e58e@linaro.org>
Date: Fri, 5 Dec 2025 10:33:37 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 2/8] media: qcom: camss: csiphy-3ph: Use odd bits
 for configuring C-PHY lanes
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-2-6b35ef8b071e@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251204-qcom-cphy-v2-2-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2025 16:32, David Heidelberg via B4 Relay wrote:
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= (1 << lane_cfg->data[i].pos) + 1;
> +		break;

What does the DTS configuration for this lane mask look like ?

---
bod

