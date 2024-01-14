Return-Path: <linux-arm-msm+bounces-7233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E98DD82D14E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jan 2024 16:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F15A281FA9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jan 2024 15:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97D233D8;
	Sun, 14 Jan 2024 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mo1VXpok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE447E
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jan 2024 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33674f60184so7869621f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jan 2024 07:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705247512; x=1705852312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxmhpra+z46feXbyp+J4UkK+Oy6gkOf3UFSq7vBQdQQ=;
        b=Mo1VXpoka7hy7AlWhIhlLXafVAlQjIp79qPnvyy0yKLFupOg6SPkHQsbybnqsd/Knh
         YzCxYkeVNoZZtlE0Zp1uyJACd7whIRGEh71y4eaq8kj4tRrc9/UyyNGWsMIu94qo4Ldx
         051AaPJAMtTEZulwpZpWU/cslhjYQBN5bghkrQLtsrc22F3LoJsRbK2L+cOjC+oc5Bgr
         UFD/+3naCQvCdLU2zNTYwjJXxnXgj6KK9N9T1YdNGyr6Ge6YSsylVb+mKgzLoeQ6E04H
         DU76X3UzWht+B4z2uyarBJZzfDXXg6nAlVUdO8PuiTkLo6xdE8Eaw7KdrnPDW4HUlC3/
         RQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705247512; x=1705852312;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxmhpra+z46feXbyp+J4UkK+Oy6gkOf3UFSq7vBQdQQ=;
        b=jIt7OD8PvU1o91eszK0l0uKT299VSyqim2YVisd+rpDJxCItfA0D5m8qLE4p9IrS+f
         cKm52w+Pd6xb1v2Kd1mSEEV6cEZQ0IPCqmSp3jAOH2OR47XMViWSP8wwcSkHLnb1+G+L
         XtlnSBph7QYne9BUxh5Df/gyNe5AFWY1AS7ylr1gBIs9j25IHT8l75vHlE3Tjdr0LOIV
         GImZnmS21vhaTVGiI3/Py1AnEvU89/aKS8nNO+htwDA2oDV3/6LbgCykZVIcVTSrrgBW
         GxQ12NU6ioMcsgVkUNFp/7KOsUsktLoJK2tOs22XlJ/TMKi/WJieK+IkHSoS/0S5u0tP
         LJMQ==
X-Gm-Message-State: AOJu0Yx8EyOybToqRk3TYYQa0gyxVyqlroyyie+2XMugfGVDhpmrzqk/
	4qyM0RgFDZPOSdeVrlHkfEustezFlXNHrg==
X-Google-Smtp-Source: AGHT+IE7nTdFmHRLF2VThBmfOU2nxXNBRY0FXby8fwY2Ac5wx5PqE+UjvwRurxXT8qnAkKNt6W0jew==
X-Received: by 2002:adf:f012:0:b0:336:4bc8:f6a7 with SMTP id j18-20020adff012000000b003364bc8f6a7mr1958839wro.114.1705247512395;
        Sun, 14 Jan 2024 07:51:52 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id q5-20020adf9dc5000000b003376dbc75e9sm9394700wre.14.2024.01.14.07.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 07:51:51 -0800 (PST)
Message-ID: <84b69277-36df-4844-afbe-38b7999f9a13@linaro.org>
Date: Sun, 14 Jan 2024 15:51:50 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] usb: typec: qcom-pmic-typec: fix arguments of
 qcom_pmic_typec_pdphy_set_roles
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-6-182d9aa0a5b3@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-6-182d9aa0a5b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/01/2024 20:55, Dmitry Baryshkov wrote:
> The function qcom_pmic_typec_set_roles() passes enum values as boolean
> values to qcom_pmic_typec_pdphy_set_roles(), which then interprets them
> as bit values. Be more explicit about it, pass enum values directly and
> compute corresponding bit masks in qcom_pmic_typec_pdphy_set_roles().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c       | 2 +-
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 8 +++++---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h | 3 ++-
>   3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 1a2b4bddaa97..a243648abb4a 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -123,7 +123,7 @@ static int qcom_pmic_typec_set_roles(struct tcpc_dev *tcpc, bool attached,
>   	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>   
>   	return qcom_pmic_typec_pdphy_set_roles(tcpm->pmic_typec_pdphy,
> -					       data_role, power_role);
> +					       power_role, data_role);
>   }
>   
>   static int qcom_pmic_typec_set_pd_rx(struct tcpc_dev *tcpc, bool on)
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 52c81378e36e..44d8342ed0ad 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -354,7 +354,8 @@ int qcom_pmic_typec_pdphy_set_pd_rx(struct pmic_typec_pdphy *pmic_typec_pdphy, b
>   }
>   
>   int qcom_pmic_typec_pdphy_set_roles(struct pmic_typec_pdphy *pmic_typec_pdphy,
> -				    bool data_role_host, bool power_role_src)
> +				    enum typec_role power_role,
> +				    enum typec_data_role data_role)
>   {
>   	struct device *dev = pmic_typec_pdphy->dev;
>   	unsigned long flags;
> @@ -366,12 +367,13 @@ int qcom_pmic_typec_pdphy_set_roles(struct pmic_typec_pdphy *pmic_typec_pdphy,
>   				 pmic_typec_pdphy->base + USB_PDPHY_MSG_CONFIG_REG,
>   				 MSG_CONFIG_PORT_DATA_ROLE |
>   				 MSG_CONFIG_PORT_POWER_ROLE,
> -				 data_role_host << 3 | power_role_src << 2);
> +				 (data_role == TYPEC_HOST ? MSG_CONFIG_PORT_DATA_ROLE : 0) |
> +				 (power_role == TYPEC_SOURCE ? MSG_CONFIG_PORT_POWER_ROLE : 0));
>   
>   	spin_unlock_irqrestore(&pmic_typec_pdphy->lock, flags);
>   
>   	dev_dbg(dev, "pdphy_set_roles: data_role_host=%d power_role_src=%d\n",
> -		data_role_host, power_role_src);
> +		data_role, power_role);
>   
>   	return ret;
>   }
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
> index e67954e31b14..070822dc6f17 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
> @@ -107,7 +107,8 @@ int qcom_pmic_typec_pdphy_start(struct pmic_typec_pdphy *pmic_typec_pdphy,
>   void qcom_pmic_typec_pdphy_stop(struct pmic_typec_pdphy *pmic_typec_pdphy);
>   
>   int qcom_pmic_typec_pdphy_set_roles(struct pmic_typec_pdphy *pmic_typec_pdphy,
> -				    bool power_role_src, bool data_role_host);
> +				    enum typec_role power_role,
> +				    enum typec_data_role data_role);
>   
>   int qcom_pmic_typec_pdphy_set_pd_rx(struct pmic_typec_pdphy *pmic_typec_pdphy, bool on);
>   
> 
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

