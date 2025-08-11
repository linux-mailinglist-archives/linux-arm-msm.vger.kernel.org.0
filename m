Return-Path: <linux-arm-msm+bounces-68265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0738B20173
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B23A0189E12B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 08:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32CE2DA769;
	Mon, 11 Aug 2025 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TAMuUoOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910502DAFAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754899904; cv=none; b=PycqLHtj6XvzMO42PGR7/gOgqJ9Uh3HGXlhuCIKyMt9u/W3axBVbp6C6IioxUufIlwcqzc2ALfSsOrrrmoUCw/FxpbIPJpCHsHefJqMbel4ZvBi7oRL5M+8LglBolUlN33QZrA++TLmdsIRYygCn0lydFexNaT4OQ6ecW/EbSD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754899904; c=relaxed/simple;
	bh=P23Stlr4keHU7Raxkl8z5iyyQmIO+NGHaLRZnTC9L9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFG5cX6JAsqgjxbY2ZfuJ0ufTgWCYfd5JpiA65Np6PqqiWq2SUZx6Fw2MiZ6WVC7XVNvwPY6NT9hg0cSWI1Ad7jebUvwyKLn4yllJcd+Lr3uwuMar8D1MUFSyMnYXS3Qp9QHsVszwUQtKsrGgs/RF744DXuod0tsqDN/fDRRuQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TAMuUoOd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b78a034f17so3127948f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754899901; x=1755504701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tkUesVl4jAFyoCBTmpuUr52QiKCqi3HcGLBzpIiqDk=;
        b=TAMuUoOdWKxhoiOTg0rXVzIYoibrgMkCCoGE+dFDfi+LHTbcz8IRsjRypw/0gqXcZY
         XEV1gXUPhMknUbBcQHMMhf/J2xqPTEdZT6XjqJF3ukaVGapQlaTZUi/24OLr3tpQbHRr
         4XdjVg0T/lEne4HSMHYuWsobiHRmNr2JTLjNWEGutiBDEJF19syyzRyVMDu4L3BkdcVq
         f7PcbtAmlarvSJwolBa1ce/kLzt1eVilIecO56HuezujO+b7rDyUVJOoT4BoFkDy7Lsm
         vZM/xFCMAFR6XDRBmTYjYveuGq7gzVGeX2QF602wvJDJR4cz28RYW23w/EnbVekbcXMX
         TTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754899901; x=1755504701;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tkUesVl4jAFyoCBTmpuUr52QiKCqi3HcGLBzpIiqDk=;
        b=hnsCMozVgD7KbxcI4kRsBQxkNhHXzo1zkOr+xALTBz1DfzBXsTozZs1ou6WHvdULLS
         HZBpU45ixuTnZvS2cxRO+fotrc4MqLxOsIDyKIoXTgAAmcdpQp3gBEHGBnuZPC4UxwPo
         UHMp5GeHPw0wMgFhStWWw0R6w8EjTzbMJ4Mb800QIFvzQYLYXQ42qB3V8XpyOd85Nfb2
         erkOdamQ+Kd0YmU+0XN/R4uXIgSZ8x1SDCkdZrXo/1kIk8gk0FYaIroiQQIfNl6M6wHT
         ca3EgpMLErwG4g5mKiXfvqD6dYFh7CpTxldn3e1hdjOqyKl/v1bXclNrQu6sC2slaov2
         sBnA==
X-Forwarded-Encrypted: i=1; AJvYcCUeKgXHLR033IyuW7FJla/pLHJZUMvkDrLpXZwa2rVNH+U+7eVLHON10TsXHfI5m6ZXXdDc3IpKCRVvgWzB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwi0kXtd+nRQKVsRVZnRM3wnuuCfVQHq0Cyn3wEY4K3ADQhkKW
	GeN5qk0VhhwqM65EYEA8fd6Iudh6TCOsFUIMnoJSwckFpQ0bwbQsCV1cFEB9rC+h2cQ=
X-Gm-Gg: ASbGnct8Bl+jPOoAj4KnIX0fhAilN6s0xdilGtD4kNZoLZo3Xj0bqAlHUX5e5XCNuxU
	dV7LUFM3ojBYvhx548kP0qoLt5E6mqGYe/wMBtNn/6aOqf85RPrbGHx6OQrMXSsASY00/dyWAwJ
	PkVABo9F64nq9Ic3Ez4pS7vi/sAEYIExG0LSMsiRzkU2Rf6H93lOrxmkxP5c5BdSJuc7TM6nZga
	DyLjBp64Bc4fSnstr9ew3p5a3kx35o3elfnw3awRKyj+bhiJzLw+SkYz70b21NidYz3M499H8/T
	Hka8+Yrr+IEGeXcV+2U3xYLLVtlSH+bphwcUR94fkrUI3z1i2YvxeQFy62Iq+4WSkOkK8hRT/Z0
	vzkUvb+KxA/Abh/a90jvNJYYc90BAYKV9JWwgJSFlrk9V/J/x9RnwT42bSjiuQ3U=
X-Google-Smtp-Source: AGHT+IFZSCjB3EVVWN3j0xhyey0yOaCa7AbOuPwgJ7S7qfnZ/4InAfD2fBXGQz+A2XuMrW9cqBbDJA==
X-Received: by 2002:a05:6000:2c04:b0:3b7:99cb:16e5 with SMTP id ffacd0b85a97d-3b900b750edmr10135158f8f.28.1754899900689;
        Mon, 11 Aug 2025 01:11:40 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459dc2647f6sm161537245e9.2.2025.08.11.01.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 01:11:40 -0700 (PDT)
Message-ID: <90553ae1-8c40-4aa0-9cc3-f4e5f7cce15a@linaro.org>
Date: Mon, 11 Aug 2025 09:11:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: Add support for regulator
 init_load_uA in CSIPHY
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/07/2025 08:24, Wenmeng Liu wrote:
> Some Qualcomm regulators are configured with initial mode as
> HPM (High Power Mode), which may lead to higher power consumption.
> To reduce power usage, it's preferable to set the initial mode
> to LPM (Low Power Mode).
> 
> To ensure the regulator can switch from LPM to HPM when needed,
> this patch adds current load configuration for CAMSS CSIPHY.
> This allows the regulator framework to scale the mode dynamically
> based on the load requirement.
> 
> The current default value for current is uninitialized or random.
> To address this, initial current values are added for the
> following platforms:
> SDM670, SM8250, SC7280, SM8550, and X1E80100.
> 
> For SDM670, the value is set to -1, indicating that no default
> current value is configured, the other values are derived
> from the power grid.
> 
> ---
> Changes in v2:
> - Change the source of the current value from DTS to CAMSS resource
> - Link to v1: https://lore.kernel.org/all/20250620040736.3032667-1-quic_wenmliu@quicinc.com/
> ---
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.c |  4 +++-
>   drivers/media/platform/qcom/camss/camss.c        | 26 ++++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h        |  1 +
>   3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..7a2d80a03dbd0884b614451b55cd27dce94af637 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -707,8 +707,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
>   			return -ENOMEM;
>   	}
>   
> -	for (i = 0; i < csiphy->num_supplies; i++)
> +	for (i = 0; i < csiphy->num_supplies; i++) {
>   		csiphy->supplies[i].supply = res->regulators[i];
> +		csiphy->supplies[i].init_load_uA = res->regulators_current[i];
> +	}
>   
>   	ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
>   				      csiphy->supplies);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index e08e70b93824baa5714b3a736bc1d05405253aaa..daf21c944c2b4818b1656efc255e817551788658 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -750,6 +750,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
>   	/* CSIPHY0 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { -1, -1 },
>   		.clock = { "soc_ahb", "cpas_ahb",
>   			   "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 0 },
> @@ -768,6 +769,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
>   	/* CSIPHY1 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { -1, -1 },
>   		.clock = { "soc_ahb", "cpas_ahb",
>   			   "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 0 },
> @@ -786,6 +788,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
>   	/* CSIPHY2 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { -1, -1 },
>   		.clock = { "soc_ahb", "cpas_ahb",
>   			   "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 0 },
> @@ -1188,6 +1191,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY0 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 17500, 10000 },
>   		.clock = { "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1202,6 +1206,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY1 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 17500, 10000 },
>   		.clock = { "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1216,6 +1221,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY2 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 17500, 10000 },
>   		.clock = { "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1230,6 +1236,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY3 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 17500, 10000 },
>   		.clock = { "csiphy3", "csiphy3_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1244,6 +1251,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY4 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 17500, 10000 },
>   		.clock = { "csiphy4", "csiphy4_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1258,6 +1266,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY5 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 17500, 10000 },
>   		.clock = { "csiphy5", "csiphy5_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1472,6 +1481,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	/* CSIPHY0 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 16100, 9000 },
>   
>   		.clock = { "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -1487,6 +1497,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	/* CSIPHY1 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 16100, 9000 },
>   
>   		.clock = { "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -1502,6 +1513,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	/* CSIPHY2 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 16100, 9000 },
>   
>   		.clock = { "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -1517,6 +1529,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	/* CSIPHY3 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 16100, 9000 },
>   
>   		.clock = { "csiphy3", "csiphy3_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -1532,6 +1545,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	/* CSIPHY4 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 16100, 9000 },
>   
>   		.clock = { "csiphy4", "csiphy4_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -2158,6 +2172,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY0 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2172,6 +2187,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY1 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2186,6 +2202,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY2 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2200,6 +2217,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY3 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy3", "csiphy3_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2214,6 +2232,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY4 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy4", "csiphy4_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2228,6 +2247,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY5 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy5", "csiphy5_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2242,6 +2262,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY6 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy6", "csiphy6_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2256,6 +2277,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY7 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy7", "csiphy7_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2488,6 +2510,7 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	{
>   		.regulators = { "vdd-csiphy-0p8",
>   				"vdd-csiphy-1p2" },
> +		.regulators_current = { 105000, 58900 },
>   		.clock = { "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 300000000, 400000000, 480000000 },
>   				{ 266666667, 400000000 } },
> @@ -2503,6 +2526,7 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	{
>   		.regulators = { "vdd-csiphy-0p8",
>   				"vdd-csiphy-1p2" },
> +		.regulators_current = { 105000, 58900 },
>   		.clock = { "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 300000000, 400000000, 480000000 },
>   				{ 266666667, 400000000 } },
> @@ -2518,6 +2542,7 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	{
>   		.regulators = { "vdd-csiphy-0p8",
>   				"vdd-csiphy-1p2" },
> +		.regulators_current = { 105000, 58900 },
>   		.clock = { "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 300000000, 400000000, 480000000 },
>   				{ 266666667, 400000000 } },
> @@ -2533,6 +2558,7 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	{
>   		.regulators = { "vdd-csiphy-0p8",
>   				"vdd-csiphy-1p2" },
> +		.regulators_current = { 105000, 58900 },
>   		.clock = { "csiphy4", "csiphy4_timer" },
>   		.clock_rate = { { 300000000, 400000000, 480000000 },
>   				{ 266666667, 400000000 } },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 63c0afee154a02194820016ccf554620d6521c8b..b46e92b10e096ca8e082ea2bb0b20032135e05b9 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -44,6 +44,7 @@
>   
>   struct camss_subdev_resources {
>   	char *regulators[CAMSS_RES_MAX];
> +	int  regulators_current[CAMSS_RES_MAX];
>   	char *clock[CAMSS_RES_MAX];
>   	char *clock_for_reset[CAMSS_RES_MAX];
>   	u32 clock_rate[CAMSS_RES_MAX][CAMSS_RES_MAX];
> 
> ---
> base-commit: 0b90c3b6d76ea512dc3dac8fb30215e175b0019a
> change-id: 20250729-camss_csiphy_current-7793c2fab66f
> 
> Best regards,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

