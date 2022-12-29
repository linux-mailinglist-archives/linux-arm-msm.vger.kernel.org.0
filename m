Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8E06659005
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 18:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233290AbiL2Rx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 12:53:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiL2Rx6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 12:53:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FAF1112;
        Thu, 29 Dec 2022 09:53:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 011FE618C5;
        Thu, 29 Dec 2022 17:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63366C433EF;
        Thu, 29 Dec 2022 17:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672336436;
        bh=ayTVFPv8VuZpGvaOQ0MSBEsIvGgD+9LIYrBq/0NdOEk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=prqWLcRXvjhWOh7PDzmUDxoTHWjnSs/RS1IuLrM2gmGLX70CJBxW4th4R6zt9XlQS
         6r9aUq5eAbzjbpaiTRXC2WOqTpS2e1Gmg7lUKNK6zFIChHpuQf3tDPb33sJBB0imU2
         5A2T3jYJmYUTE4YHR0V5SNb28GTDFRmbnCr2iCYERrEV12fuSQqM2GADT8SX2a717/
         e90HfOHqLJX8O8GULtXlNFtOHl89PosM0oWpWnnA4gh/uKtSFv7D/MbiTTYl36hSNr
         2Kl/dKp8c2Ji8wHBLZ91Y3/hMvjyXzLymY31VPEspn69UzddojPBlfKBjxTX613kQI
         uPgF+3u7341Mw==
Date:   Thu, 29 Dec 2022 11:53:53 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/2] soc: qcom: apr: Make qcom,protection-domain optional
 again
Message-ID: <20221229175353.msas6w2eaunv4gt4@builder.lan>
References: <20221229151648.19839-1-stephan@gerhold.net>
 <20221229151648.19839-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229151648.19839-3-stephan@gerhold.net>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 29, 2022 at 04:16:48PM +0100, Stephan Gerhold wrote:
> APR should not fail if the service device tree node does not have
> the qcom,protection-domain property, since this functionality does
> not exist on older platforms such as MSM8916 and MSM8996.
> 

Forgot that when I reviewed 6d7860f5750d, but you're right. Sorry about
that.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Ignore -EINVAL (returned when the property does not exist) to fix
> a regression on 6.2-rc1 that prevents audio from working:
> 
>   qcom,apr remoteproc0:smd-edge.apr_audio_svc.-1.-1:
>     Failed to read second value of qcom,protection-domain
>   qcom,apr remoteproc0:smd-edge.apr_audio_svc.-1.-1:
>     Failed to add apr 3 svc
> 
> Fixes: 6d7860f5750d ("soc: qcom: apr: Add check for idr_alloc and of_property_read_string_index")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/soc/qcom/apr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index cd44f17dad3d..d51abb462ae5 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -461,9 +461,10 @@ static int apr_add_device(struct device *dev, struct device_node *np,
>  		goto out;
>  	}
>  
> +	/* Protection domain is optional, it does not exist on older platforms */
>  	ret = of_property_read_string_index(np, "qcom,protection-domain",
>  					    1, &adev->service_path);
> -	if (ret < 0) {
> +	if (ret < 0 && ret != -EINVAL) {
>  		dev_err(dev, "Failed to read second value of qcom,protection-domain\n");
>  		goto out;
>  	}
> -- 
> 2.39.0
> 
