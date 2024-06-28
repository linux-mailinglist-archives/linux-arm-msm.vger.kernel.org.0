Return-Path: <linux-arm-msm+bounces-24607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D299591BBB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 11:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B7E81F21C8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B99A1552FF;
	Fri, 28 Jun 2024 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kqnCYgHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D202154448
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719567692; cv=none; b=CRWAfFvzfeTKl0psvucbtg9eo3DlgMBbRj7/nQPuU4IJBhfhciF8ju19gJXp6SNsu4XX0BkNR0UKgD79KpYkaEJr6ICFpJLAvajq558z8dJVs34p1MSmVExCs6wsu3Nm+Rukz2yr3Hc/D2qfP/kgBCxumKPCh5X6jebGzdzPazw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719567692; c=relaxed/simple;
	bh=tVEgmpllYVknMfJoknc4RL0kqVdAzaKIv/+L42tFl3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/IPM1Qq9n5afQc1qoGmz8p7zYC0ZNE5nuz+A5r9OzpqGZmTEl+jEOBmSdlPvwUHIFD8DS36OAhHNufolq/3gPH9sRs3m4yDtefG1HIQRaGmlXXqCjp4b4BuGTRdQI0QjQQ9eV7A9xwtQ6lf/guV4xsY3h/Lre/kqXTsz0E1BwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kqnCYgHL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-36743a79dceso951624f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 02:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719567690; x=1720172490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tVEgmpllYVknMfJoknc4RL0kqVdAzaKIv/+L42tFl3M=;
        b=kqnCYgHLtrA+wfcXS5LIzuLl073kIzp+5DLtUsQMKBuejxoJfkdQhIOe8KuhcCMAds
         j58QpBqzWC9GfzobhI2zgiBrUVi//xEGZP3jz9PaQ8g6Zp0Nq+4CpIIYRcR9vz63K0OX
         HI4g5SSgBGhnc7HmUuT4JbfVvpWiIqC4arj2n6sJVo1bS1oNrQV50bE21V7xH8W0/TVW
         PcuwOXu344SeIUsmeaP1Pj39fAMReYMpzf/9SCAa2LT8BwURxdX/bIdIhQpI53Yanb/E
         WHZsfhgvzUIQlNh8p9b2LNYFr8DZGOrsLeQOf3cEeDXAuHE9JfpGdexF/3vzovNQhBDl
         Pk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719567690; x=1720172490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tVEgmpllYVknMfJoknc4RL0kqVdAzaKIv/+L42tFl3M=;
        b=BoZbCzdVBRpPdrI6+siE7tr1wPKEp7TZJscoo7xOr7gR7eW8kn0Q2cLTSvaebYR+LE
         f3J/v2YJR5q9P7sIeshFFEBgB86d8Rcv0JlTCYlk9zKGudh9JbZ7das1PmhNVRnBqw4F
         sLVC8xMA56NndvzxGfOpaTh+MZ1K6i7t2mHSdhejND36sJWOiCDfBPJ7LEp0uZNOy7wX
         9BR3F6ROuxJcZ3c1ARZUroeJCAFTwy8Axc4aPOtZNDVSWRW3m37iqVA+BEUPWM7/b3Iu
         uXF98CylEGz64A5OYeJCNRhJHc+TCD2hLUn73FKGMyWZ+CuLPH5vrZnci0e57gw3dtle
         EYiA==
X-Forwarded-Encrypted: i=1; AJvYcCUh1dc+sk+EyCfIPLNNf7DzdoDqfxL6ECo7HqXs97Jq4jEfUYlr74DE7n4GPY4Axb9QB8mMIiENlvGnjHzHmajwCC6tz5Jdd8UrKFflaA==
X-Gm-Message-State: AOJu0YwjK+NBdcj0fz9qyZjhDTxYvBEY+F9BVehsDG4gVis+6Z7h9PuG
	+wnJl0WL6lmmgBB/mtxM7AqBP+RC1XcA9dP/G3GRufgpwOZdybTsaAkjC8RhDwo=
X-Google-Smtp-Source: AGHT+IHbI/TgEs3+bVgph0HaYhgOP7yCzLVzQ4yGSROGza3QUnuTQHGw7yvZ+TECrn6gMliVeuqtEA==
X-Received: by 2002:a5d:410c:0:b0:362:70f6:697d with SMTP id ffacd0b85a97d-36760a7e2ffmr1001841f8f.16.1719567689950;
        Fri, 28 Jun 2024 02:41:29 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba2dsm1716761f8f.73.2024.06.28.02.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 02:41:29 -0700 (PDT)
Message-ID: <25c3e788-1551-4779-9178-393d2a26e147@linaro.org>
Date: Fri, 28 Jun 2024 10:41:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 2/5] media: camss: csiphy-3ph: Add Gen2 v1.2.2
 two-phase MIPI CSI-2 DPHY init
To: gchan9527@gmail.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-2-89ece6471431@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240624-b4-sc7180-camss-v3-2-89ece6471431@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2024 13:13, George Chan via B4 Relay wrote:
> +/* GEN2 1.2.2 2PH */
> +struct
> +csiphy_reg_t lane_regs_sc7180[5][23] = {

Small nit

static const struct
csiphy_reg_t

not

struct
csiphy_reg_t

e.g.

/* GEN2 1.0 2PH */
static const struct
csiphy_lane_regs lane_regs_sdm845

---
bod

