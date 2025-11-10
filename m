Return-Path: <linux-arm-msm+bounces-81145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5CBC49383
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 21:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BFBBB4E3130
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 20:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2482EBDFB;
	Mon, 10 Nov 2025 20:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mts42I+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D6D28000B
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 20:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762806245; cv=none; b=K7q5fOi/9sGRIxnAIu5j51qZbmuh/HEU5aVLcH8wbsdQzSj5Rj3V33lHWEK+bgqioNMNDVQnP7rF6HUUB79M5hQjGMOEb0HfaNkxw0Q15MQpoj7kbV44jmuE4he7CSYTM86w1WVLD/4GHeRUWHRk45c8p5NQH8eP3FBC5XCP/cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762806245; c=relaxed/simple;
	bh=avENlQ35BzgI6tLMYtHuimKSX5F3uSHgrD8IvoL218c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DI87Dr2EWYQgpWtGP2XW7thZvSnlnxkENo3Zyo8Hn6jdPYrAKM1JwDfrlNKerUykAHe8gWhuDVXrGukmhLXFYRRWqQu8agjO2rxdHdkX3NbZz/5MMNpHuTjJAf4bLECa1egSLyLBWERL23n1iHxfQFLtyhlPXAgp08lVUxOhQE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mts42I+x; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59426dc96f2so397481e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 12:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762806242; x=1763411042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaNjgHiC4lYNLgJR1dvbSFLh/5KALMDQ9SZCFN88ta8=;
        b=mts42I+xAsgv8eZE4+D5iwBfrt6505Gw+8ie43Jwc4Uzp8+eVtfzmeMalW/SBDv1pl
         qyxEiUxi3qo6goc42iJ9vLKPEh6hGdcH3tBlkI7vnceyhz5Q9jAENVhhDY+FTgRkUw6k
         DhVBDZ+ZwRtwyOu21RIMMBAtv3DuMV6FPLuMq5HjKfCW77HLhO8WycCrjy6f1exvn8EE
         N9Hf0poSaaHl8rIusXBOvtFAL5YGqInPg9XbMI0C/vtNP8NOYUgF80uvujHE8T0CFuq7
         ogybdERSxRHTkOOK3JaOCB/1r9uZp7+gHGIruaO0e5nfH9R0D81R9NuZqv5oyGRDf/iU
         ERMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762806242; x=1763411042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GaNjgHiC4lYNLgJR1dvbSFLh/5KALMDQ9SZCFN88ta8=;
        b=iBKHDGJZvd7G7AwFZT3CtucRtQfvOEMBL7WMiZpKUiap2FJfK1/kDDBEk8JTIzh3Ie
         1pVa5u3ansN2z0Z4f80P69Msfa1HSQ+81piWguV9R7+TvID7eI+Dpt4nBLwx8HCS5hUS
         5lzdU4Zi2SmcJxyAuIx/ovH31yPeQckyypod2WMbIzwevlYhHb88oIEs+0ads0gkrY1N
         TH3r1CNiy6VF6Y260b8Eg5ejjfbWgjXFUk9M/8GyKa+UmrabwZ8kbfAOotJlcKBKko6v
         +NJpNXPwpo6gdRsfuRwDl0DzIGu9NorBmpCMZ7rQf32tuQ/Zht5jnx5aJyORRImLg/Nj
         WzWA==
X-Forwarded-Encrypted: i=1; AJvYcCUlfJQ1QH8mo0KIVgdlaxCKFzBBpKSDQ6/1Km5PgTjRfo1FWuEyyvy/RDyuAnbWI407J07gfk4tub9h57hs@vger.kernel.org
X-Gm-Message-State: AOJu0YytXsNmO9v0Utcofm8WEiQ9PVsPzlLBPGiWVwPsgfUB6v6I0mUG
	EjWAvHeh+8ERLYQRdRVS33z3UkuxM7l++NXjS9K3/bMNioKEYa7Xyr65lRwP8WSAgZ0=
X-Gm-Gg: ASbGnctF2HDwrRnSjOAdI6i1AXynGlciUP/7/2AV3jKP1XaO9MXLWFvhquoKmEIFz0F
	IDhcS/EM+kGUR7pxWIWZtrGHJEqssJEfbwR6q+qahZigtKF8RZRKteYs2H549fTJK4/Zybgcpx/
	+gjbsAAXtPmyvrsKv7mkw6RYo3g/yWrK6AeMub+yhMLWeQVSSNEJVZk8uF6TtIE2Di1SIexwuRM
	51wCw9ftxpcOatV///Rx8eoFEEy04nbq9EQipwc2CTmwKyp9xwy4S1Zxzo/TlS8l5ibxYHt313v
	s2naR9r73giM2iaE2v4G/mnGnZtaioQlTRzQ8tXdmqIR3zULkG0SJ/zzfqZVjlgeXfecs1U3LfZ
	/OuNsyxycKuRYi3F0i8aCmQyUdkUiGBNEy7PqKOXEujO//AXO2Ie5s0SvBPSp3uJa4KEz26zbTc
	X/JrxpPHJ7ub58vOjQE73+r6nm1XaFvwUdBxzCDboPbx6wsUl8hx13jIE=
X-Google-Smtp-Source: AGHT+IH8eu2yFwyQ/7LEhVqdgKoEtPLjRlteAv+Gq5Xpiwbyk2U8UW/TW9k1sGKDpmscx/ao2kCmVA==
X-Received: by 2002:a05:6512:3c8c:b0:594:2d0d:a3dc with SMTP id 2adb3069b0e04-5945f1dc4f9mr1551360e87.6.1762806242080;
        Mon, 10 Nov 2025 12:24:02 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594549b4cd1sm3681566e87.8.2025.11.10.12.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 12:24:01 -0800 (PST)
Message-ID: <df209178-2871-4317-bfb6-d6605fb9f19b@linaro.org>
Date: Mon, 10 Nov 2025 22:23:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1
 MIPI CSI-2 CPHY init
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-1-165f7e79b0e1@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251109-qcom-cphy-v1-1-165f7e79b0e1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/25 11:39, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
> Gen 2 version 1.1 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports three-phase C-PHY mode.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 64 ++++++++++++++++++++++
>   1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 619abbf607813..f28c32d1a4ec5 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -144,6 +144,7 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
>   };
>   
>   /* GEN2 1.0 2PH */
> +/* 5 entries: clock + 4 lanes */
>   static const struct
>   csiphy_lane_regs lane_regs_sdm845[] = {
>   	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> @@ -218,6 +219,69 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>   	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
>   
> +/* GEN2 1.0 3PH */
> +/* 3 entries: 3 lanes (C-PHY) */
> +static const struct
> +csiphy_lane_regs lane_regs_sdm845_3ph[] = {
> +	{0x015C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0168, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x016C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x010C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0114, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0150, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0118, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x011C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0120, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0124, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0128, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x012C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0144, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0160, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x01CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x01DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x035C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0368, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x036C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x030C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0314, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0350, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0318, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x031C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0320, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0324, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0328, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x032C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0344, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0360, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x03CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x03DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x055C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},

You may find it be more structured, if the array is split between
0x01zz, 0x03zz and 0x05zz blocks by new lines, each of those three
blocks is a configuration of one of three lanes in total.

> +	{0x0568, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x056C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x050C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0514, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0550, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0518, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x051C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0520, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0524, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0528, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x052C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0544, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0560, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x05CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0564, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x05DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   /* GEN2 1.1 2PH */
>   static const struct
>   csiphy_lane_regs lane_regs_sc8280xp[] = {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

