Return-Path: <linux-arm-msm+bounces-70189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DABB2FB59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B941AE3D5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8694D21B8E7;
	Thu, 21 Aug 2025 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZtgsXTS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0621C8621
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783941; cv=none; b=TaJp+M1plj1pBQgmXC1B/jGlZJXCcI5EkHDrvDDmOO5hEOVB2PEK5lGbGBnL//JGplm5Kxa/bC5FujExgQ781yd1Ovw6SHdH9ZduEBIzTT/i2a86vYe/5ux1XVxRayKvM287XEk3z0Wu7zvFsJyEu8C430dHP3fG6PKU7pJoV0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783941; c=relaxed/simple;
	bh=W5OpRpgQZSAYng9DpP2P+lhbg+Ejeokss/8tz9pCB5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUfW83FaxESc8Mep1mNRy1kvsF7zZ9p251Rzmkz/M5DnHmHnKpCVtZwaLc7M5GSrokE/s8kQWg9G/EgqOf2c5MqyB6LBfmwuAo76qOSx5QHRqzR93z6mE357GS3TIvhxEeKC9aW2/FzB7/Vu92uqbCatLXF1L6scm8pPk7XWwgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZtgsXTS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b9d41bea3cso734378f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783937; x=1756388737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2htF7UYkLJf9Z7CPGicbBUD/Z2w4PEBts+j2YgNwTZo=;
        b=kZtgsXTS6BBRX0H/XH68AeKv692CNdEZ246xQpqaRjdlSCXkNT+7pv6AsdyoldwkIT
         t4CsLnIyheKK8BJfMNB1XJCd//CtMvDdTVOkZuOTdWOJy9HiMva5TwTC4mStiz6jgZAV
         NRQx1Pjz9fnwKrHnbETV6/zyfbkl+BOGypV3HdkA5EaKoBceVOPbsdnw9IJcez5s7FsD
         AGqjp3omZg27KFX/q6VXccfw1C7p9lNo+p+iQtC7mKBebtcz0YbE4CNgutnSlZYqbsVO
         OIPHzlDZ7a3ZijkXoaE44qWgfuJ7UpOLqe3iPRmfFBtF0ZdOwe6HtU5mqiYVyZjUKWyp
         Y3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783937; x=1756388737;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2htF7UYkLJf9Z7CPGicbBUD/Z2w4PEBts+j2YgNwTZo=;
        b=OtMdKI13o1TUmAQ3XCDOmHS5kPlV4wMmDy1rGHPA85IyQf4fCef3SLhRZTKdGeuctf
         3J4zB9weSR3sUd3u1fquo20hB8MY6cK8z/KMwn08daXZZmuKmYUj5GBg19hZa75NRac7
         VTuarifjbTwsGD0cHyxNS1ahfW3EWSrQq7BfWOt9p8FHax12/IMLkcXSRxMe3GPNEU4t
         PtS+Y/sXXKhzRrY2BIOBmvHANkpVS4WBw3Pbb1IVTSQZz6ryOCStbVFvm/EOwGZMgbsK
         PgQcNpm+h045MvGFnh54WAfNH+Rl33cDMxAzEiX58urQWjkDItn8ygRqntE3b0F5vh1O
         ZpVg==
X-Forwarded-Encrypted: i=1; AJvYcCXwTRakFiquHwaguvBMTW+kcFbWs6nYxReCtUfjIdQaAzDhhimEoG58rrSRHKF01YnHh6BYkw4cRcA4k+Me@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu1RjR+fs3KzhAjxMY780IR2CiaoPYSG/mt3HwXdF+cENsZjd0
	jg3xhinRFtSzU34yB7VI/ifSUxfElaaINnUr9MomHYmrbL4bycNcYad1KUxiQ4ZkkLI=
X-Gm-Gg: ASbGnctcEudQocewDPi0B7bfXoNRoledQqKeNEPtb7rU+EMM2eBRW3pDLKEixB289b3
	2BwRBTRZd8+L99UAvVVd6G9K3Q195HHF51ZCEbPhm/0xPgq96hm4/bWmsdHuvx13RxorTAEKwjJ
	vE/UJGfFnBykK298+GSbhw6RwbVQ49uY3/bkoIhozazGT7EtikHF7146nhc4oz/MaEchEvSb38D
	/dGxq11PzoQMJFZ/a+kU9jj/+pO5sGstDdlW/AZV2RNCJbcPpUDrNHZBjJ3LMgCs7nTsEVIZ3oi
	W+Czo8woh+hFSe2NoXLrcHIP+ekn4P17dDWH7wZRP1XTGW40XNNFIte9VpjJH1+iJigKiKk10hm
	r0JmWZAfSXCHD6+546JbCcahhrUoZwb3IjTZEb/2D+UefqRATcMZrwlYYxD0Q2EZt
X-Google-Smtp-Source: AGHT+IGrfdqa8HYNFWMTlms4ECBMzRvLwkRwupDy9hYePkEXxbabsC2NpkM7F7VGAfJ6CBe0qSalDw==
X-Received: by 2002:a05:6000:40dd:b0:3b4:9721:2b2b with SMTP id ffacd0b85a97d-3c494fc7fe2mr2403420f8f.12.1755783936977;
        Thu, 21 Aug 2025 06:45:36 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm14683405e9.2.2025.08.21.06.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 06:45:36 -0700 (PDT)
Message-ID: <30e1e803-0218-4841-a73b-5c19d8bf48cb@linaro.org>
Date: Thu, 21 Aug 2025 14:45:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: iris: vpu3x: Add MNoC low power handshake
 during hardware power-off
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20250821-sm8650-power-sequence-fix-v3-1-645816ba3826@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250821-sm8650-power-sequence-fix-v3-1-645816ba3826@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/08/2025 11:54, Dikshita Agarwal wrote:
> Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
> reading the LPI status register. Introduce a handshake loop to ensure
> MNoC enters low power mode reliably during VPU3 hardware power-off with
> timeout handling.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Changes in v3:
> - Fixed the loop to capture the  success of the last power-on command (Bryan)
> - Link to v2: https://lore.kernel.org/r/20250813-sm8650-power-sequence-fix-v2-1-9ed0fc2c45cb@quicinc.com
> 
> Changes in v2:
> - Restructured loop for readability (Jorge)
> - Used defines for bits (Konrad, Jorge)
> - Used udelay for short waits (Konrad)
> - Link to v1: https://lore.kernel.org/r/20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com
> ---
>   drivers/media/platform/qcom/iris/iris_vpu3x.c | 32 +++++++++++++++++++++++++--
>   1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a..bfc52eb04ed0e1c88efe74a8d27bb95e8a0ca331 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -19,6 +19,9 @@
>   #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>   #define REQ_POWER_DOWN_PREP			BIT(0)
>   #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> +#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
> +#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
> +#define NOC_LPI_STATUS_ACTIVE		BIT(2) /* Indicates the NOC is active */
>   #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>   #define CORE_CLK_RUN				0x0
>   
> @@ -109,7 +112,9 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>   
>   static void iris_vpu33_power_off_hardware(struct iris_core *core)
>   {
> +	bool handshake_done = false, handshake_busy = false;
>   	u32 reg_val = 0, value, i;
> +	u32 count = 0;
>   	int ret;
>   
>   	if (iris_vpu3x_hw_power_collapsed(core))
> @@ -128,13 +133,36 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>   			goto disable_power;
>   	}
>   
> +	/* Retry up to 1000 times as recommended by hardware documentation */
> +	do {
> +		/* set MNoC to low power */
> +		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +		udelay(15);
> +
> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +
> +		handshake_done = value & NOC_LPI_STATUS_DONE;
> +		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
> +
> +		if (handshake_done || !handshake_busy)
> +			break;
> +
> +		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +		udelay(15);
> +
> +	} while (++count < 1000);
> +
> +	if (!handshake_done && handshake_busy)
> +		dev_err(core->dev, "LPI handshake timeout\n");
> +
>   	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>   				 reg_val, reg_val & BIT(0), 200, 2000);
>   	if (ret)
>   		goto disable_power;
>   
> -	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
> -	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>   
>   	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
>   	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> 
> ---
> base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> change-id: 20250812-sm8650-power-sequence-fix-ba9a92098233
> 
> Best regards,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

