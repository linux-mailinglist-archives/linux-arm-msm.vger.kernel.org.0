Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 741F56F318B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 15:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbjEANbU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 09:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjEANbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 09:31:19 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FEF019F;
        Mon,  1 May 2023 06:31:18 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64115eef620so26732872b3a.1;
        Mon, 01 May 2023 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682947878; x=1685539878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbvE8ZpCJPBCKMm9p4IOoIg+xSy1Zu3YjZzWHLjkQw4=;
        b=U3vEk/KYmYFuOZ2OmJJtk7K8lEFcEU8/Kc/T1FUqtlqM4++wLdz96vcXVY945yKwYx
         /H9ei5qwGhtm573RNTyfjTvK77zCGGnoMHGphltehmppCVdMZYxSJMcRo1SFCxx6jmyr
         iBf6O/X2WnIvbrDrapp2bs/b3j7vXuP81YfuLPiqw8ksINQrLB6fAlwx9Ha8gTPla7ex
         ADIQreBbnk3PwqbXNlSvPk106qLsqBELjRJUt59imVYoQtA1YjQxiBmeBd4P7KsBSqjS
         VO6OvqaTmL559UE5h2fAnNk585orojrl31otUZxJy43rS+hWi7t14SIIhU7hw8DfoUK8
         E0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682947878; x=1685539878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbvE8ZpCJPBCKMm9p4IOoIg+xSy1Zu3YjZzWHLjkQw4=;
        b=QxrZNPK7Nr/sl2stON2gF7cE4KUadDS3ywafnWrit7ArcYsLCxDJPNRmzmoqe/FTCc
         fNvl71b6fyXtHPiMaD6rWHmaNWWxkA1zciEKHBHQOI0g0yCoOcIsPWKtPgiHtzGLTQiJ
         7StqotvrgRkiLKKWcqLtaZyOJigVXUtMRRv7bsuyvC+YjHw6/V3p82gtAVNK+AG9W7+0
         0JzNyzRuNYIaReeoLIzR6EMfFDF5nvpNZyURkYg0ReFHlckbFVelED3K3EuZsagTGqWh
         D+FoqlB8My1fyjR9uYavnSGvBr9TjajjX/h4K+ablb+w69dzg8Qhk9Urlqn2KmC7+Vle
         EZ1A==
X-Gm-Message-State: AC+VfDwe0LpAFd4gB9qJ5FMvnO8CUMpOEYoHIZg7rk2o38SOAdLdxFWG
        HbtbEgxteRqQAO7YU6jqj8c=
X-Google-Smtp-Source: ACHHUZ6M1EMxkoKfhhNY5Agpi1DUaiuT8jFmk1iwZEGSphgKETD4Wo37AiZlJiMzkuGKvKF4a002Qg==
X-Received: by 2002:a17:902:ecc2:b0:1a5:1842:f7da with SMTP id a2-20020a170902ecc200b001a51842f7damr22250237plh.6.1682947877722;
        Mon, 01 May 2023 06:31:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902d30500b001aae64e9b36sm3117080plc.114.2023.05.01.06.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 06:31:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 1 May 2023 06:31:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: Re: [PATCH v6 07/13] usb: typec: qcom: Add Qualcomm PMIC Type-C
 driver
Message-ID: <a427a2b7-49da-49c4-a877-f1987676a07e@roeck-us.net>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-8-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501121111.1058190-8-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 01, 2023 at 01:11:05PM +0100, Bryan O'Donoghue wrote:
> This commit adds a QCOM PMIC TCPM driver with an initial pm8150b
> block.
> 
> The driver is layered as follows:
> 
> qcom_pmic_typec.c : Responsible for registering with TCPM and arbitrates
>                     access to the Type-C and PDPHY hardware blocks in one
>                     place.  This presents a single TCPM device to device to
>                     the Linux TCPM layer.
> 
> qcom_pmic_typec_pdphy.c: Responsible for interfacing with the PDPHY hardware and
>                          processing power-delivery related calls from TCPM.
>                          This hardware binding can be extended to
>                          facilitate similar hardware in different PMICs.
> 
> qcom_pmic_typec_port.c: Responsible for notifying and processing Type-C
>                         related calls from TCPM. Similar to the pdphy this
>                         layer can be extended to handle the specifics of
>                         different Qualcomm PMIC Type-C port managers.
> 
> This code provides all of the same functionality as the existing
> qcom typec driver plus power-delivery as well.
> 
> As a result commit 6c8cf3695176 ("usb: typec: Add QCOM PMIC typec detection
> driver") can be deleted entirely.
> 
> References code from Jonathan Marek, Jack Pham, Wesley Cheng, Hemant Kumar,
> Guru Das Srinagesh and Ashay Jaiswal.
> 
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Couple of nits below.

[ ... ]
> +
> +static void qcom_pmic_typec_pdphy_pd_receive(struct pmic_typec_pdphy *pmic_typec_pdphy)
> +{
> +	struct device *dev = pmic_typec_pdphy->dev;
> +	struct pd_message msg;
> +	unsigned int size, rx_status;
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&pmic_typec_pdphy->lock, flags);
> +
> +	ret = regmap_read(pmic_typec_pdphy->regmap,
> +			  pmic_typec_pdphy->base + USB_PDPHY_RX_SIZE_REG, &size);
> +	if (ret)
> +		goto done;
> +
> +	/* Hardware requires +1 of the real read value to be passed */
> +	if ((size < 1 || size > (sizeof(msg.payload) + 1))) {

	if (size < 1 || size > sizeof(msg.payload) + 1) {

would have been sufficient.

[...]

> +int qcom_pmic_typec_port_get_cc(struct pmic_typec_port *pmic_typec_port,
> +				enum typec_cc_status *cc1,
> +				enum typec_cc_status *cc2)
> +{
> +	struct device *dev = pmic_typec_port->dev;
> +	unsigned int misc, val;
> +	bool attached;
> +	int ret = 0;
> +
> +	ret = regmap_read(pmic_typec_port->regmap,
> +			  pmic_typec_port->base + TYPEC_MISC_STATUS_REG, &misc);
> +	if (ret)
> +		goto done;
> +
> +	attached = !!(misc & CC_ATTACHED);
> +
> +	if (pmic_typec_port->debouncing_cc) {
> +		ret = -EBUSY;
> +		goto done;
> +	}
> +
> +	*cc1 = TYPEC_CC_OPEN;
> +	*cc2 = TYPEC_CC_OPEN;
> +
> +	if (!(attached))
> +		goto done;

Excess () around attached

Guenter
