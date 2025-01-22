Return-Path: <linux-arm-msm+bounces-45753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC455A188F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 01:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AE4416759D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 00:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA3F15AF6;
	Wed, 22 Jan 2025 00:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZC03cXb9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE9438384
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 00:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737505758; cv=none; b=KmDQa4odMucKVQgN/YcWgVm+0JCuoHYPf81EW6s2HpzFjg1wcsLpnIOg5HY0chhNa9YHw31vOa0lFm8IJNmkBOvT4qV1I5fCsJ0NuBUrFBa7HQXdONV5y03OxqCajbwCZuS/Ob8OdXWHtWQc0GZhSTHr7P53VObbRT7Vf68JeIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737505758; c=relaxed/simple;
	bh=bcwXAskIqGr1StGwxVlB9b7rUxJv3MdpM1sJzy34Ca0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mi1Vb49N5G26pOeQB03sGVdgbf94xHUMczOcPXcD2CUI0wZie5uVFhXJq+O6ZUVaTB7g6p601MK8pXKCB8+ZPRSTWF/Do0SZoC2hN6jbZCJ9ZTGIGc0k0WbinLN8BWN7/YBqFl5250FxMNyPFfKmMthm1p2f2zqUow8UVuXBSF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZC03cXb9; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-302217866b5so4902971fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 16:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737505753; x=1738110553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0CCcgB3VhUvKOT2h2jpUk2KSrzV7zZ3MNXEHDhSA4U4=;
        b=ZC03cXb9ODy7l4b8l8cIhqtIrUGk0JoK67qth5jlbAac0GEhazaN+tapt/Pmt7EmdZ
         VHvGwPtCN6rK5dQlrpD9ubHohdM02DxrgdZhNuSysSc8R64i5mYkAJctsm24Cdiag1uM
         JpAXD3suKRxYs9FQJ6oDF8nRwFzM5PgJ1slfgPd9VCHOM4MbVtp8V2tICjNm52kvdO2M
         6wUvhKJtey+CFa+TUU/BjD0wnTZnAM5osds5FExkZ59V5nRDPGBVZQJ+9+4m63yBxfbz
         D0fTnXLWeKlUhdv2OWo+Y1y7hxcprbweowh2VZnmqGn65Lr31b2vp78CCZ5Anf9VIUsh
         XFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737505753; x=1738110553;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0CCcgB3VhUvKOT2h2jpUk2KSrzV7zZ3MNXEHDhSA4U4=;
        b=a33JoLCqL9PLZPGFoKd9at3L9yJ/2XCZ4cs9TBYM3UxbeaeSHUs2ubz58aixFlBeJY
         igqFJzo4IxwReghTmSDGJAm67MaOAwBOocz5rrRLn9cALsFMrvpD1NxUBu9aKt8BTTTM
         jMeJYI4elnS03zbFhTCtD5Gun3H256kJpCpR+ecN2HNe0qpjdR05MxPv4uZQsO0hzQPP
         aMqkTom8XN6EE/f7FAiekX/gLG7W+lGFp5kI0Zb6qNoqX+fTkVtAhSR/Dxmae9XqFUs5
         sLFuHIJ9eIcGI1b8V/6XxWzzD56tEK4Nh8NbKaiJ7UL4rx9QgqmOH2NmxfBlZl9oY2VW
         fS4g==
X-Forwarded-Encrypted: i=1; AJvYcCV5v401e+wuxwLfzwzMBjuJLMl/Yil8WqPxhS7+NfE6/uu7E/MLLQ4WNseOXEcc3yPyVnMRIB2oRw9K4ebg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3iM9IGrAXnlvUvNuza7KiQo570+kARFFW1azs9HOKAcJSwapN
	ytHU6l0Eb4H1GLxRk2cV8WMhimARV7x124QXzcOMOp2uwn1KcYhDp1+BY69qMxM=
X-Gm-Gg: ASbGncvoRTh3+UdNxA6je1fHbRd0We7/MSnU/xhuRD3aJR3jWmsxUoUmSUrGN6bTU5r
	GMnKTEpe6+LkcrX2QzEJfMFTSM6afUMUWtkt1g9zalFpd2gAp8RqtnGzhXVM1bYr3ZIss3hmZ3C
	NKCWdSKHjvz6bUYqQKH4zaUAgr0Iq9vEey9HjQFZM0ujtnxj/Mz1peOoa4mmr0+6g+rl+EIFFsf
	8M3mT6dkDCaFC0ZsV1HJAt0mkqjxygKztGtZgcp47kr96baBGMS6Fm5MMz5A18Ni7J4gMyvV56N
	S/YSO6Hc7kGn989pdEYaH2NFcA8Xf+7mIQc8QGxrspUjhhkO
X-Google-Smtp-Source: AGHT+IF7mcEikAAqzQurIt0klgWl/Kv3joNL8utk6/DOwSEAOdrnD4QmUkP3MnIQQmIPhmc2Hja2aA==
X-Received: by 2002:a2e:be9c:0:b0:302:27c6:fc98 with SMTP id 38308e7fff4ca-3072ca8c496mr21689281fa.4.1737505752745;
        Tue, 21 Jan 2025 16:29:12 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a33092asm24397481fa.2.2025.01.21.16.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 16:29:11 -0800 (PST)
Message-ID: <00989990-85dd-46d7-a100-c986fc1fb066@linaro.org>
Date: Wed, 22 Jan 2025 02:29:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] media: qcom: camss: csiphy-3ph: Add 4nm CSIPHY 2ph
 5Gbps DPHY v2.1.2 init sequence
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-6-44c62a0edcd2@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-6-44c62a0edcd2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 1/20/25 17:47, Bryan O'Donoghue wrote:
> For various SoC skews at 4nm CSIPHY 2.1.2 is used. Add in the init sequence
> with base control reg offset of 0x1000.
> 
> This initial version will support X1E80100. Take the silicon verification
> PHY init parameters as a first/best guess pass.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 126 +++++++++++++++++++++
>   1 file changed, 126 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index b44939686e4bb..fc624a3da1c43 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -55,6 +55,7 @@
>   #define CSIPHY_DNP_PARAMS		4
>   #define CSIPHY_2PH_REGS			5
>   #define CSIPHY_3PH_REGS			6
> +#define CSIPHY_SKEW_CAL			7

This one is not needed, having CSIPHY_DNP_PARAMS only is good enough.

>   
>   struct csiphy_lane_regs {
>   	s32 reg_addr;
> @@ -423,6 +424,130 @@ csiphy_lane_regs lane_regs_sm8550[] = {
>   	{0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
>   
> +/* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
> +static const struct
> +csiphy_lane_regs lane_regs_x1e80100[] = {
> +	/* Power up lanes 2ph mode */
> +	{0x1014, 0xD5, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x101C, 0x7A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x1018, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0090, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0094, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x005C, 0x00, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0060, 0xBD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},

Double write record, which is anyway ignored, but one should
be enough.

> +
> +	{0x0E94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0EA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},

Writing the same value to a register 4 times in a row, apparently
it's not needed, one time write is sufficient.

> +
> +	{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0490, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0494, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0400, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0494, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x045C, 0x00, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0460, 0xBD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},

Two equal "ignored" writes.

> +
> +	{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0890, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0894, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0808, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0894, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x085C, 0x00, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0860, 0xBD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},

Two equal "ignored" writes.

> +
> +	{0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C00, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C94, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C5C, 0x00, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C60, 0xBD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},

Two equal "ignored" writes.

> +};
> +
>   static void csiphy_hw_version_read(struct csiphy_device *csiphy,
>   				   struct device *dev)
>   {
> @@ -594,6 +719,7 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   			val = settle_cnt & 0xff;
>   			break;
>   		case CSIPHY_DNP_PARAMS:
> +		case CSIPHY_SKEW_CAL:

Having CSIPHY_DNP_PARAMS is good enough, no need to add another
"dummy" write type.

>   			continue;
>   		default:
>   			val = r->reg_data;
> 

--
Best wishes,
Vladimir

