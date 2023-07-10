Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52A6B74D82B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 15:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjGJNwJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 09:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjGJNwI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 09:52:08 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20818B6;
        Mon, 10 Jul 2023 06:52:08 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-666e64e97e2so2216906b3a.1;
        Mon, 10 Jul 2023 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688997127; x=1691589127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NqVRY9Lv4h2Yaj//p+gxZVAGyy0PxX7TqXhdVtp8Qc=;
        b=SbpgYp0s6nT5lQ2vJ5fzZ1ZcoJ1IgKaususIuvd+7RXfnOlt7rqkaE40WYfbe6+AoK
         tTdg+6W0ezt1nxg/YFErNWJNqaBjfxnb3DGPwQFpHnO7wAMsjqW08hJV1CKQO0NCbWyo
         qhyEHPp4bDskqKQ0KLwy1sakzug9DuMgvmR28jLlYNWDt61hkKQZQKflvDmWMHSGPKnD
         S0w28OqiU8YfFIY0SrXFNSlOio+ib+aLD6KBlSc7B3MCNac2yFsCP4pazXypUxEtUZMk
         axXUJsqBv4CrHhULNtMh5O8VD5SOXgTpF/Blfx6p40VcSqOyOKWYH8qwlS+C+Iz/bRhF
         IlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688997127; x=1691589127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NqVRY9Lv4h2Yaj//p+gxZVAGyy0PxX7TqXhdVtp8Qc=;
        b=JM8cmzbY8uvI3SZgYd6ZxsR0zYnGcFO8TiwYI89D3EiIsVeAM1DBuBxsMIaSP6Dk7K
         I26FEo7ZV5C/iyKimM3GU48Vv8tVIwzyyqOoQaeONfzlmxen2ymd2NakguOU/zkVpqpT
         M3vt20R17kzR6TijZD71GAOT1GyfsBfhqGplgz/uBLm5l7dBk589ytwd+xO9WtYeTTE0
         LX6jFOyV4nkKb7M7w/I48hygRs00pughAnJnJJ2w0mU5RmxMDT+VWjcrnYNDySJC81tn
         BEvJecUgGPf5ZEXQ0z1ENGzIeVeBdTJG7uLhQWlUA4a0gss7aATGyq78ZlR6D/1PNcYJ
         TMgg==
X-Gm-Message-State: ABy/qLY+2yXRChJReeZhJcDhqQxgqA75bOwKKQ1fOkfPWP+Lo892mApO
        friBUl0sXkuiWGm/rKbQVSQ=
X-Google-Smtp-Source: APBJJlF+XOQqgmjPPIwVhfCYcq84QCNRGgBoqmqds78CmUnbwvZFQK1GTB/SGO6c0iCx7Rvs2hGr5g==
X-Received: by 2002:a05:6a00:80f:b0:67f:e74a:d309 with SMTP id m15-20020a056a00080f00b0067fe74ad309mr12877862pfk.30.1688997127510;
        Mon, 10 Jul 2023 06:52:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v17-20020aa78091000000b006827d86ca0csm7159832pff.55.2023.07.10.06.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 06:52:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 10 Jul 2023 06:52:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: qcom: properly detect Audio Accessory
 mode  peripherals
Message-ID: <bb5c75fd-0550-483e-8c84-f294adb82b18@roeck-us.net>
References: <20230709200235.265674-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230709200235.265674-1-dmitry.baryshkov@linaro.org>
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

On Sun, Jul 09, 2023 at 11:02:35PM +0300, Dmitry Baryshkov wrote:
> Detect and report if the Audio Accessory device has been attached to the
> corresponding USB-C port.
> 
> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes since v1:
> - Fixed typo in commit subject (Bjorn)
> - Removed 'the' in the commit message (Sergei)
> 
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 94285f64b67d..56df04af2d2b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -214,6 +214,11 @@ int qcom_pmic_typec_port_get_cc(struct pmic_typec_port *pmic_typec_port,
>  		if (ret)
>  			goto done;
>  		switch (val & DETECTED_SRC_TYPE_MASK) {
> +		case AUDIO_ACCESS_RA_RA:
> +			val = TYPEC_CC_RA;
> +			*cc1 = TYPEC_CC_RA;
> +			*cc2 = TYPEC_CC_RA;
> +			break;
>  		case SRC_RD_OPEN:
>  			val = TYPEC_CC_RD;
>  			break;
> -- 
> 2.39.2
> 
