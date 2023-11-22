Return-Path: <linux-arm-msm+bounces-1598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6657F538C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 23:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 889CD1C2086B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 22:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D2F1C285;
	Wed, 22 Nov 2023 22:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tTXLEysy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FEE1A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 14:43:57 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3574297c79eso989695ab.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 14:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700693037; x=1701297837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/uQWLtXvGOw3ykzrrU4k8v24BV7qfGLjUcROVaGJI+0=;
        b=tTXLEysy7dHrGxlhqbekOvGqQR03prQlWP+0xXIVauxfzUVRc+rMX7usSl2YyhJBCR
         WQSIiiQgOu8IWfoX7v4jHgYoXAWHPS8hOS6z59BoHDHn1Xn3DjVljAVo1gRoK+viT1me
         uNROZu+JY0hGynMvjvKK6Lq45bgYv7ITh+ITdtrBTkq6T+PeOu6Cq7Njis1QYO5+eDiJ
         47iN1QXga9nBHLMVPK/5WnDiLNwexprvmC7lpDlpe4pjF5Ax1RrbfWg5FXC9YszyEhnp
         US/SyPxKlbT53Ik9GwMqiRpdRa6D7JXqLgQ1mNFy1fiZSXu9Kh1xLcTGvG7iji0gkggg
         Ss2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700693037; x=1701297837;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/uQWLtXvGOw3ykzrrU4k8v24BV7qfGLjUcROVaGJI+0=;
        b=BKDD8u/ULrOraRe3hhcpuk142p7Okw8LCItI9R/XDtII/aIif8Tj+atlD71ECc5mg/
         xpck65X2f+yLh/WeStD3dUCRzPMxHLZ+9kZwpLQu6xYDG5rgs7wyyhPSzLPfIBAniUMM
         pnXNebWL6oR7nCM/NYnK2qOA4qZjm6YIk/Mi64jbQ773ryw8sGt9dchl9oYVc0cs4GGS
         Wdf9DdyaWGlDlJQngxnBrqP+hHbIUuqg/z43Ax0SVn9XFBch5KejmQi5hXOVPRklxgaY
         0rddnT8yb6jE6TfcHgLp88cPW5PGzwjxR0E/CRKSNyv90e8k2VxwS6QxRozzl1OEcFBG
         mYiQ==
X-Gm-Message-State: AOJu0YyYzOvVtKI1iRrNi7VZl8YrRyOgeqwzcRDHA8muIkC5VXHOTQmf
	Fju6oDnWY8zuRW3C7ddWXb0Vyw==
X-Google-Smtp-Source: AGHT+IFOPvtZpcwPXuq8eUu58wUK/6nPgwmjHf3787rZ+5lhZhoC3jeRFLZhZtUkV1G97+aBxx5dbA==
X-Received: by 2002:a92:c56f:0:b0:351:5acb:281 with SMTP id b15-20020a92c56f000000b003515acb0281mr4482037ilj.31.1700693036861;
        Wed, 22 Nov 2023 14:43:56 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.gmail.com with ESMTPSA id eq25-20020a0566384e3900b0041e328a2084sm101532jab.79.2023.11.22.14.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 14:43:56 -0800 (PST)
Message-ID: <90d55f78-c31b-4764-958e-4ad88374518b@linaro.org>
Date: Wed, 22 Nov 2023 16:43:55 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ipa: fix one GSI register field width
Content-Language: en-US
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com
Cc: mka@chromium.org, andersson@kernel.org, quic_cpratapa@quicinc.com,
 quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
 quic_subashab@quicinc.com, elder@kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231122212504.714276-1-elder@linaro.org>
In-Reply-To: <20231122212504.714276-1-elder@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/23 3:25 PM, Alex Elder wrote:
> The width of the R_LENGTH field of the EV_CH_E_CNTXT_1 GSI register
> is 24 bits (not 20 bits) starting with IPA v5.0.  Fix this.
> 
> Fixes: 627659d542c5 ("net: ipa: add IPA v5.0 GSI register definitions")

All is well on this, but I put the wrong commit hash on the
"Fixes" tag.  I'll send an update soon.  The correct hash is
faf0678ec8a0.

					-Alex

> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>   drivers/net/ipa/reg/gsi_reg-v5.0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/reg/gsi_reg-v5.0.c b/drivers/net/ipa/reg/gsi_reg-v5.0.c
> index d7b81a36d673b..145eb0bd096d6 100644
> --- a/drivers/net/ipa/reg/gsi_reg-v5.0.c
> +++ b/drivers/net/ipa/reg/gsi_reg-v5.0.c
> @@ -78,7 +78,7 @@ REG_STRIDE_FIELDS(EV_CH_E_CNTXT_0, ev_ch_e_cntxt_0,
>   		  0x0001c000 + 0x12000 * GSI_EE_AP, 0x80);
>   
>   static const u32 reg_ev_ch_e_cntxt_1_fmask[] = {
> -	[R_LENGTH]					= GENMASK(19, 0),
> +	[R_LENGTH]					= GENMASK(23, 0),
>   };
>   
>   REG_STRIDE_FIELDS(EV_CH_E_CNTXT_1, ev_ch_e_cntxt_1,


