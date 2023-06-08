Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7187285D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 18:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235875AbjFHQzT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 12:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233787AbjFHQzS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 12:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D181FE9
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 09:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686243269;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=C7Gzsm4c5VDydfTjmb7wRGtHYG5sGvTAth2UOQdT5as=;
        b=CIMZNxFQaz/jn79ylRC5/8Yb6huGhJ+L+fUalP9b8nio/p4dHmGJD4nPDifF6nbngUFAtu
        2qoyS04z8ah29GZsvR+MJX70UF5cmkZc4sxp9aphVBzWWxwvz5Kz3/5cDJxyuW4B+XrnEB
        +mBjARgMrlDLw5/CqsrgsOFDBEpVmxE=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-dHg1V2XQPVaGpZ9ekivTdg-1; Thu, 08 Jun 2023 12:54:27 -0400
X-MC-Unique: dHg1V2XQPVaGpZ9ekivTdg-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-558af72a3e2so685490eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 09:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686243267; x=1688835267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7Gzsm4c5VDydfTjmb7wRGtHYG5sGvTAth2UOQdT5as=;
        b=hrOI4CeId/YkbiOd0YqDuHWlC5JfM1PTx2X6DPjjn6ui7pmGSfVWIENiV1nN9wTq17
         dpwU2vUg4rDW/OhcFJzQjumULP9T+jzZvG8dI3gz3tNPfiAHb9ZrY8tCIFirVrKEvMt+
         CenuQolWcJIuVsWEBdkT60qSa9wKrLMsHcWx1mr4uyuwzk/8ISr0m8orAewgPm47ZyR2
         dtf0a6N3TGTD+rRAR7r9u1F3019d5Cc1GXU4Yr9bwYniaQmkuQMAx4jnLCTtaYmpJZkt
         daI301jZ7UDwmxC33uxlE4cJqZ+GrFLIrvmYKyxpRpKVBFbcGZN0YqBXrQFbwnkSwuNl
         bzTQ==
X-Gm-Message-State: AC+VfDxegI8zEah5DLRtKQGPCxMzrma3NDP5XMS01TedXqueBFRkte2e
        DBOs8HXoeIeAnhhEvzQO6yNYjLAuadtbhQR7SQRAewVaXtiewHheQIel94OX57hFdfMOTnBmHqV
        7SxX/uwDgo99yLj0FrDnW9iIOSA==
X-Received: by 2002:a4a:d8c2:0:b0:558:fd2b:8232 with SMTP id c2-20020a4ad8c2000000b00558fd2b8232mr177815oov.9.1686243266856;
        Thu, 08 Jun 2023 09:54:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6JTBAHmdb92kjvDywymq4EZWiP3V+16ZVHXuhLLjDlkHPWSSDhtIhwSdfuR/7p2MS+ahpNvw==
X-Received: by 2002:a4a:d8c2:0:b0:558:fd2b:8232 with SMTP id c2-20020a4ad8c2000000b00558fd2b8232mr177798oov.9.1686243266617;
        Thu, 08 Jun 2023 09:54:26 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id z2-20020aca3302000000b0038ee0c3b38esm599397oiz.44.2023.06.08.09.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 09:54:25 -0700 (PDT)
Date:   Thu, 8 Jun 2023 11:54:23 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Fix an error handling path in
 dwc3_qcom_probe()
Message-ID: <20230608165423.gvcwvmgiojuvjahv@halaney-x13s>
References: <b69fa8dd68d816e7d24c88d3eda776ceb28c5dc5.1685890571.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b69fa8dd68d816e7d24c88d3eda776ceb28c5dc5.1685890571.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 04, 2023 at 04:56:34PM +0200, Christophe JAILLET wrote:
> If dwc3_qcom_create_urs_usb_platdev() fails, some resources still need to
> be released, as already done in the other error handling path of the
> probe.
> 
> Fixes: c25c210f590e ("usb: dwc3: qcom: add URS Host support for sdm845 ACPI boot")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 822735814050..aa96c473f839 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -856,9 +856,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  			if (IS_ERR_OR_NULL(qcom->urs_usb)) {
>  				dev_err(dev, "failed to create URS USB platdev\n");
>  				if (!qcom->urs_usb)
> -					return -ENODEV;
> +					ret = -ENODEV;
>  				else
> -					return PTR_ERR(qcom->urs_usb);
> +					ret = PTR_ERR(qcom->urs_usb);
> +				goto clk_disable;
>  			}
>  		}
>  	}
> -- 
> 2.34.1
> 

