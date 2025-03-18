Return-Path: <linux-arm-msm+bounces-51760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62341A67795
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01D1D19A3A16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E2520E309;
	Tue, 18 Mar 2025 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hn6/kt0p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BC920E004
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742310947; cv=none; b=FdMwwQ6t+zetEEE20UBnEqQgTDfZ+OZueOdvzSKpc9OLg993CCXMAt24JMNa1sWOzgqxshn9u2EUa/0OTKQPHOIyfYyS04W3u4iKnK2E8sLDu5N3y3TaxRJqrD9BC1SyOh+LToFapdUkVKIFkdnGkHFSFtjsbBnu3/gTmXi9cwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742310947; c=relaxed/simple;
	bh=fgXbCRcr4nJjHuNPsXc54RP+jPfsRrPjWrKCJPX6Xas=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VZtPZdIO8zIY19CKktOCNYa6VUmmKe6BLMS2FoVUtHsDQ9km/nW0qAiK90RCq9+Kd9IwWi3D/exx9h872iRX+3Hibz3tcCXrFt4WcPoFAayFYz6ei0fTPIL7FduMAFr0xg+/cpwEmdrYymvIwm0GCxLH1smKqKBjSSxGtB+hOLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hn6/kt0p; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3913d129c1aso4629516f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742310944; x=1742915744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMAu6MQINuflXuKN4gs2ELPnPkzz6J51pp9nuweT/JU=;
        b=hn6/kt0pEXG2rkl2eswfJkeq+AAGVwB954CHegzZ6eSMOnAaAASDe5k0HwNCeAgzAM
         y4+y1zG80oD5mo5PaJvObdHAzcoiXcInT0NSnvhpYC402+i53gzZR5rzN9FQxNkO3Y+T
         rIeuPX0z2l1lFVttNZt+9VkoBCm2CCo5H/4He8/AlLhjtKQvUtjvNJu3DPnQWXTfczn8
         3UGxF0PIT+oJ1HELbS8vb7BkDfXvPHvI+ws6rgzPl5SaHldi3bY/3uox/RYqj0P+LlM1
         yG+JO1c1BrH8RHg/Hd/gQCk4T0iWVoJDzZ6ROAGmx1roRQ2b8xBbb4lUzpr+HWI0UBde
         ozXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742310944; x=1742915744;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nMAu6MQINuflXuKN4gs2ELPnPkzz6J51pp9nuweT/JU=;
        b=LuMKTw5pDRZEmmEX3kHU090KKOTroMk3GC3yQj2XNPBaLZKVY+j+I/3ciOE8C4Qy5o
         CSLozVgnI1BxXEMvIo6zDkzSkwnfGfuc8P7QuIvXcCikvKE4+pf/0vlnBPcPBSmRenGU
         lJzJD4I81OkuIp215jgjugnEDrjcFyliyj+E6MDMh4akcXbvW8k5JkF4IHIKOHrxwEKx
         Hfm7bh+FACbBma8aNVuXGOCDt33iOITvUSSVH8KXo2yVHw6MuXm7pfuRwRSy+YXw2ogO
         fW5ih97YOGH2Z4npGlF1UxyyDWjmS2+Q/28mDjvCz4cztfEGynjMs1yBacnhoC5tb5Wa
         6HoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF26lpkWEyNSKQTsCePcTaQsWjRSS7DJ5AoYtK+W8zd8tMWszxMh97WP/LMrtviBk9Ss8LVoqL50+xVG2o@vger.kernel.org
X-Gm-Message-State: AOJu0YzfDIHMtd1PNJ1OP2ETDURBaMuhCIobPdh31bjkS1ywk2PCFFtK
	B7JJw94Hfqio+v0XPlyPRDe7Mz5J7+U3mEQ0r8H1TAsGnVHVzrr3wIGx6y+2qSk=
X-Gm-Gg: ASbGncsFVW5Y/KPL/yknI725skBOZVyf4oUMBVni6zzNIT6YSz0bnWsQKSIWzM+VLPz
	XC1NrtXCoidMvfuYrkjxIySRiYlX36sPF0RK3q5cVIXxsaIrjecJlqANA0mPIMoR8JpWOfhkIRx
	jBvsB2Z4Uzwmp22dj+TahnOODBzwx0ww+jCQqzAc+JbgDR6La6Yh7vmO51E8NEwK5yFv95hf9X5
	M4Zq/qGr+whJHMLp9wqttjvu1ZwUWKEAAV7Pf5h5V2DvSJ08T9ubeRmBf/CL0k5IeihLeW2ieJ3
	oUEAxpufgq8PVEynXs/AGoTODXk8Z9OgQCB72haCQzDJ1PX/ii/uJKGEZfF7+CpkK+WHeHoeLy+
	3GXn+KEZr3SeIc6HWW0qcoQ==
X-Google-Smtp-Source: AGHT+IEdAuoBBa6rqdfXyXVPdfsyoNBKCU13VR5rdKO1AHzkVgoZcyHxlV5xdWf54kCgyzIi1YY4cg==
X-Received: by 2002:a5d:5f93:0:b0:390:ec6e:43ea with SMTP id ffacd0b85a97d-3996bb51f57mr3474100f8f.15.1742310943702;
        Tue, 18 Mar 2025 08:15:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff? ([2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a96sm18690639f8f.69.2025.03.18.08.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 08:15:43 -0700 (PDT)
Message-ID: <73dd1253-1b73-436f-af1b-94c724b2069e@linaro.org>
Date: Tue, 18 Mar 2025 16:15:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 4/6] phy: qcom-qmp-ufs: Refactor qmp_ufs_exit callback.
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, manivannan.sadhasivam@linaro.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
 <20250318144944.19749-5-quic_nitirawa@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250318144944.19749-5-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2025 15:49, Nitin Rawat wrote:
> Rename qmp_ufs_disable to qmp_ufs_power_off and refactor
> the code to move all the power off sequence to qmp_ufs_power_off.
> 
> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 41 ++-----------------------
>   1 file changed, 3 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 3a80c2c110d2..675fef106d3b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1757,19 +1757,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
>   	qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>   }
> 
> -static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
> -{
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
> -
> -	reset_control_assert(qmp->ufs_reset);
> -
> -	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> -
> -	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> -
> -	return 0;
> -}
> -
>   static int qmp_ufs_power_on(struct phy *phy)
>   {
>   	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> @@ -1839,39 +1826,17 @@ static int qmp_ufs_power_off(struct phy *phy)
>   	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
> 
> -	/* PHY reset */
> -	if (!cfg->no_pcs_sw_reset)
> -		qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> -
> -	/* stop SerDes */
> -	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL], SERDES_START);
> -
>   	/* Put PHY into POWER DOWN state: active low */
>   	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>   			SW_PWRDN);

So where goes this code ? I think it should go in a new exit PHY op.

> 
> -	return 0;
> -}
> -
> -static int qmp_ufs_exit(struct phy *phy)
> -{
> -	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> +	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> 
> -	qmp_ufs_com_exit(qmp);
> +	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> 
>   	return 0;
>   }
> 
> -static int qmp_ufs_disable(struct phy *phy)
> -{
> -	int ret;
> -
> -	ret = qmp_ufs_power_off(phy);
> -	if (ret)
> -		return ret;
> -	return qmp_ufs_exit(phy);
> -}
> -
>   static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
>   {
>   	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> @@ -1890,7 +1855,7 @@ static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> 
>   static const struct phy_ops qcom_qmp_ufs_phy_ops = {
>   	.power_on	= qmp_ufs_power_on,
> -	.power_off	= qmp_ufs_disable,
> +	.power_off	= qmp_ufs_power_off,
>   	.calibrate	= qmp_ufs_phy_calibrate,
>   	.set_mode	= qmp_ufs_set_mode,
>   	.owner		= THIS_MODULE,
> --
> 2.48.1
> 
> 


