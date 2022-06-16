Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5484354EBB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 22:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232016AbiFPU6v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 16:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378920AbiFPU6p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 16:58:45 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A66D2A40D
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 13:58:45 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 129so2297880pgc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 13:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=i/ID+pDiSzzMuJuiQpKwiHmsa9j1VcPIYRxj1Z2pw9I=;
        b=u/1l0Eoiz4R0iMnssEAD/HtH1dCWVB0z0UAaSkzRk9jPWafYOFWXfmo/obB+39E8/E
         lUv4bVzuvdkm6ytXHLa05IQuuXILc5gZDC6wrp5thffAuTNIym/2zKmQWxgPcFq2YvSg
         A3uLcEhjJ3cpaIuIdoz5XxO62xsLQHVXEuB61bmwvDs0MiUgqs+L3pX57ZVq/S5b9SLV
         7n75wErkeo/kNk5/yxk0hZz6odF45+7Mw1G4TnKQiSaKvbeylZfyhagqmJqJ50iqE294
         +zkBwvZ9EnwaT/ajH/waktJHPWoten4mouaS/nLmcsmKsUbgCDp78LrS96G1P44b/A6K
         maXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=i/ID+pDiSzzMuJuiQpKwiHmsa9j1VcPIYRxj1Z2pw9I=;
        b=Jwr6HhMey4AwPkmqp8UGjKDsn1dFVmyHNgKabRWXNrDvS+/sSnW6n1uVPmP0rUuBxJ
         ngB6/clTgHtt973B4BzFXqObWztxDmNkxqXJPsiDHqAqY9kQdE0CsawVoX/4J+/n7A4d
         24Uun1JjlYZl/vOD0lTXsVhyODnGd3BXbgHzBqhocyOn4oFvMhxWUy91wetq2gj8pEXW
         9LyxcHtV6nFFrJpw6UWW+ExUgRdBRKgW99C82nUVPMCnpCl/8iWDrk64M3Va6+yKW7eo
         c0GSPsPQ4EXrFHDBIAlN+5LwQ/wXdqNPIfT1hJNyE1LoMOfryESUvbc0jHUe03yQ5tm2
         efpA==
X-Gm-Message-State: AJIora/uxSiNZezlu7KSYrgYyKctfpwOx65/utjzf/6Lso0WOZZ4qEC/
        Bq08EQAMEjgLYesT9cKoo7cy0w==
X-Google-Smtp-Source: AGRyM1vOz2Afkti6mlOah/khUmgMyLaPLcgaTVa4kk2bxbz2YytR62NITJ+OJBzf1zpxhYbXtZiOmg==
X-Received: by 2002:a63:8642:0:b0:3fd:a160:6724 with SMTP id x63-20020a638642000000b003fda1606724mr6041960pgd.506.1655413124744;
        Thu, 16 Jun 2022 13:58:44 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id cp17-20020a170902e79100b0015e8d4eb1d5sm2082190plb.31.2022.06.16.13.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:58:44 -0700 (PDT)
Date:   Thu, 16 Jun 2022 21:58:37 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Subject: Re: [PATCH V15 3/9] dt-bindings: mfd: pm8008: Add regulators for
 pm8008
Message-ID: <YquZfQ3HRQ1FLBkt@google.com>
References: <1655200111-18357-1-git-send-email-quic_c_skakit@quicinc.com>
 <1655200111-18357-4-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1655200111-18357-4-git-send-email-quic_c_skakit@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Jun 2022, Satya Priya wrote:

> Add regulators and their parent supplies along with example.
> 
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes in V15:
>  - None.
> 
> Changes in V14:
>  - None.
> 
> Changes in V13:
>  - None.
> 
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
