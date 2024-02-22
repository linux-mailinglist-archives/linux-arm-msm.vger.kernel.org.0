Return-Path: <linux-arm-msm+bounces-12172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5038985F914
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 14:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 050CB286E30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 13:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA99D132470;
	Thu, 22 Feb 2024 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mF8b9PpX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1312412EBCC
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708606913; cv=none; b=vGnGeQsq7CYVMvRX9TQThw1AjKeGnzgJISwIZdm7PNjut2Q8VfY2q8Q9sqTWDXR++Idl+rKlJ9e7lD+su3mX+0ublbdlfqZ32BMe7vczha8R7bXRexTpB5/un/029Zgzgpy4tJuPz5dCPVwmM5WNLE3M5aq8/tEignaV+bUGV2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708606913; c=relaxed/simple;
	bh=9zC3a/lUBBoHG92n62uz1igUDeqMpK/0eJHMsRGQvwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JvMGjegd3hx1aCcKYvwdxbm4eVIPNjtudSPTFbcQccEzsFq9I7GnLdSvMRkdlNFjJP7pSXB2ANJTMZ0jAHZTfX5NtWM+tyaUaugcNCrYfzMzkyq+l+SkhyF+A+q7HGdckI5Ot3zxIvRYy16+sYEjoz613lebho87L0Y2yAi4L94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mF8b9PpX; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5129cdae3c6so2191689e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 05:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708606910; x=1709211710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7Z26rH0nxtWAPBPvE/KxZ0NHjlwRm5O/7QOSN2/Ky0=;
        b=mF8b9PpXDpthGYHQOPyBJgfTwj/UQtTrU1m0/EVniS7hxHKaKMMd9yw1W2eLqJoA6e
         lTnhz0ZRyZVpjgUvKZ4N6a7BGC8Nz/vUP70MyR8KRkuceXY+cFe4DreBnws6hU5Jhy3C
         QISH21uoUuRdR0bmZVQU5ogw9bwI3UtU/oYZvs5JtnT86jKNcnTRZpRF3XswhONGofq9
         ZXXVZtsRvmFKWzPkZx+1/+a69Pqr2rdxtQxDrqJ5fsH2FBvW9FrDixqMlHEG+BQ1nd/B
         LR0tLFnCDUESdUD3Tx+Wpy1gdOBwPmNbGd1bZE/XqreNyGAqQgroxBIMzoLmfVlmDiAu
         AgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708606910; x=1709211710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7Z26rH0nxtWAPBPvE/KxZ0NHjlwRm5O/7QOSN2/Ky0=;
        b=JLSdgRCgVamvidym6Dp4vQDC/oj68HFcN2ptSrcv1lops/g3ZkceiwcehgtlrOGqmQ
         o//LlWzL/fjl9jdEj+E575c/W0vbAqKlAoCB1Ej7sbFj1xTIZX9Y6M11Rxad+zTsxD8q
         jiISreLsDGv8IMQiBVTfbbavDrBTM3X34FGrjF7BKTPXUl+wq80quZi/d/jPh9qQMUBk
         XhuiHGgq9jI8Bmss7FFJpP/AzOjzEN/GfPjpv1+4Z1DrJe5HtIKrZzWsnpLaRYJI1TWn
         2pgY93fiCoW47io/rZwWEyXPQqv19suBaiE8DaJcy1J8puW27dv3rZWaVdrVwcCzorro
         X15Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXD1ek9+WyNVZ8nZboHRpgUs0GKX8ebX83C8/5nQbPFKdF7yzZZWNkk0P9XErwAOFXx/lMtW6LDihGngDl+Rud7Z9v4I5Cj9LxiKuwCQ==
X-Gm-Message-State: AOJu0YxBJ6+7kfOVrSOocNlrgg0vdyAEAQSkUKAW8bp+HvlI0oa8zCis
	crWlknnXjf/fjKdXbelETJEstcQbzyV1hr3q9P0iGmjp48pH0z+M2gZOtq2GwBU=
X-Google-Smtp-Source: AGHT+IGkf5An0FRhTN8uAcXotjLH9vOh29NQ0tafltetUlELSWRNWwvu9X3GqAFXb4b17ycZtwCaOQ==
X-Received: by 2002:a05:6512:3a88:b0:512:ba3a:5368 with SMTP id q8-20020a0565123a8800b00512ba3a5368mr9141098lfu.48.1708606910048;
        Thu, 22 Feb 2024 05:01:50 -0800 (PST)
Received: from [172.30.204.125] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id o6-20020ac24e86000000b0051186931619sm2055814lfr.146.2024.02.22.05.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 05:01:49 -0800 (PST)
Message-ID: <54b8c58a-6288-4ae6-9ed7-aa7b212e63da@linaro.org>
Date: Thu, 22 Feb 2024 14:01:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: dwmac-qcom-ethqos: Update link
 clock rate only for RGMII
Content-Language: en-US
To: Sarosh Hasan <quic_sarohasa@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney
 <ahalaney@redhat.com>, Rob Herring <robh@kernel.org>
Cc: kernel@quicinc.com, Sneh Shah <quic_snehshah@quicinc.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>
References: <20240222125517.3356-1-quic_sarohasa@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240222125517.3356-1-quic_sarohasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/22/24 13:55, Sarosh Hasan wrote:
> Updating link clock rate for different speeds is only needed when
> using RGMII, as that mode requires changing clock speed when the link
> speed changes. Let's restrict updating the link clock speed in
> ethqos_update_link_clk() to just RGMII. Other modes such as SGMII
> only need to enable the link clock (which is already done in probe).
> 
> Signed-off-by: Sarosh Hasan <quic_sarohasa@quicinc.com>
> ---
>   .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 26 ++++++++++---------
>   1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 31631e3f89d0..9cd144fb3005 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -169,21 +169,23 @@ static void rgmii_dump(void *priv)
>   static void
>   ethqos_update_link_clk(struct qcom_ethqos *ethqos, unsigned int speed)
>   {
> -	switch (speed) {
> -	case SPEED_1000:
> -		ethqos->link_clk_rate =  RGMII_1000_NOM_CLK_FREQ;
> -		break;
> +	if (phy_interface_mode_is_rgmii(ethqos->phy_mode)) {
> +		switch (speed) {
> +		case SPEED_1000:
> +			ethqos->link_clk_rate =  RGMII_1000_NOM_CLK_FREQ;
> +			break;
>   
> -	case SPEED_100:
> -		ethqos->link_clk_rate =  RGMII_ID_MODE_100_LOW_SVS_CLK_FREQ;
> -		break;
> +		case SPEED_100:
> +			ethqos->link_clk_rate =  RGMII_ID_MODE_100_LOW_SVS_CLK_FREQ;
> +			break;
>   
> -	case SPEED_10:
> -		ethqos->link_clk_rate =  RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ;
> -		break;
> -	}
> +		case SPEED_10:
> +			ethqos->link_clk_rate =  RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ;
> +			break;
> +		}
>   
> -	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
> +		clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
> +	}
>   }

if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
	return 0;

[leave the rest unchanged]

?

Konrad

