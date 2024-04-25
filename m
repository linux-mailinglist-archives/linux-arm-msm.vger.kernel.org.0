Return-Path: <linux-arm-msm+bounces-18640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 974468B2D20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 00:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 501AC281E44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 22:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5190D17BB9;
	Thu, 25 Apr 2024 22:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mvf1CTPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A639B2599
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 22:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714084301; cv=none; b=rFs31Xo4I5Cfdtn2l5cm/dAqKt70qgHaQySyegpowu63x81UL0dpUSk9M1gnGtOdmtFWY+9YqoeW5KQw4ubfE8VQUNfk7RA/YxoY4Am9YZAoGEqpel/QAFU+PT4+SNNPOh8kvK0aeh7hitROL0C/S8MYFk2k81xIK/xQl+cX9Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714084301; c=relaxed/simple;
	bh=gksQjALYYBV7m5YVoxumNd3IEta5GfPli9GAbRgn46s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOvCUc7zNtJwhev5dA5kX/eLDwcoes0+h/epEh8YVP37iSKhSMHZH0BGXX4HYg9MoXBrYnzKmCTVf/TWuuriNNgSlGIojZkCUBsx22ZDkSO/89w28z3C8kwWmcdA3e1he/qnhk3bkQx0lTqo9y4S0vECpJTI0jlwPzydDxnYWP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mvf1CTPa; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34a32ba1962so1252624f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 15:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714084298; x=1714689098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQymZcJrX7eM2hkF98kCr3YSKPUK5K901cXvsq0BsxE=;
        b=Mvf1CTPamT2TsWc5tOif02xLAcuSJR2zWA/lu5Fs6P3sExnb6WL9VLX6p7ocdX6jOd
         E2dsTWwIOInI3jKq9KuRNY4XPyncnX856hmJyfSkPZnrBrzunBvPoHf0B7OHLbyPcMlV
         UhHbC+RV5b3SkMTXPEdHT7Adiq8IUVStyZ0kNlU/sk5emfOrX28JaKmQUNOo6772d+kT
         YCqH5b7s4pVNtUPrluDr/HgHEAnuT5UuBC95AOeTolhAoa+MHClt/VFzY6iMQi7LEYgn
         3rVBAWE2mIPzMI2X/KPNlMQKS1er30PtWoBkfNGnbtbQjLzXkm2C4v9S11aMtURDR78l
         nOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714084298; x=1714689098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQymZcJrX7eM2hkF98kCr3YSKPUK5K901cXvsq0BsxE=;
        b=n0AVKWvepG+qS0ysyDUVt6K9bqfxQKhb7XxN02mX5rUFgmIS3cehM22PVFW7imjEyG
         Kq7hhHl6JFWrg8KoSYHW6hMLU414b+fbKRzNsDt7ivqDMttOrxnWOlOThJEqczCKj7fW
         /Wdx80d1MrieyZmJuNfBmQNHG01OAVwmTfxaFnrB4Ir/WvfYyPXPeZdMm+LY+ZhOLvTs
         aM98m/5ay1yW+4xxiiaCwIT9QzYOQbxe+3kFN80aKM8/PZyt3XDJKKrtGTKp2RyM/FBi
         TB+u64yirYLG5wWAlRVQwSULDr2AXB4z0Z8bwnR6iNvvpnTbOaAHfYV4DUafMK7VRnoN
         fz6g==
X-Gm-Message-State: AOJu0YwwX7JdqPXHEPZ6bIb+M1xjL9pQDuENTRCVxGPSuuDT97kCdQVk
	T6E1Oi0NyLXXO/X43RYd9Z0rg9t8NUU3UbzateHxzNpkOeBPK4ZZdlO7LKwiUUw=
X-Google-Smtp-Source: AGHT+IHkzZ2SICsUYMinEqYHpIjtdhmu4Brlj8n2BvJPkf4bejlYroHN08Te5mq9YQm641G0dBzS/A==
X-Received: by 2002:a5d:5348:0:b0:33e:cf4d:c581 with SMTP id t8-20020a5d5348000000b0033ecf4dc581mr533294wrv.41.1714084298056;
        Thu, 25 Apr 2024 15:31:38 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id t11-20020a05600001cb00b0034a21842accsm20211737wrx.86.2024.04.25.15.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 15:31:37 -0700 (PDT)
Message-ID: <6f8d7ea1-a3cd-46c4-ac7b-e220b7ee74aa@linaro.org>
Date: Thu, 25 Apr 2024 23:31:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <c325691e-1cbe-4589-87fc-b67a41e93294@freebox.fr>
 <22628ff2-6128-4ac9-89e3-d978f57be378@linaro.org>
 <2394efa5-713a-421d-84cf-f6c1b2ad26ac@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2394efa5-713a-421d-84cf-f6c1b2ad26ac@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2024 12:25, Marc Gonzalez wrote:
>> I'd expect 0x1028/venus core to be absolutely necessary fwiw
> Considering the absence of public documentation, these register offsets
> mostly boil down to cargo-cult programming.
> 
> Thus, using different code on 8996 and 8998 risks provoking the wrath
> of the embedded gods. Better, safer to cast the same incantations.

If you are concerned this isn't right, motivated and able to do so, you 
could always build a kernel module for the downstream 8998 kernel - read 
back the new addresses and verify the bits that have been set.

My guess is that something in the boot chain prior to Linux has set the 
bits in the GDSC - lk for 8998, it'd pretty much have to be the case.

---
bod

