Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91D8F751716
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 06:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233779AbjGMEBy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 00:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233762AbjGMEBt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 00:01:49 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D9D2113
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 21:01:46 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-51452556acdso215502a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 21:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689220905; x=1691812905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=abCHUQktP5MJunGBbFxiEtMxCTOfDURCs+9p52JRh/8=;
        b=HjK9iHX7wfTwt0WHdtpjWucYj2hidccMYbEbfsz2HaytzyZOvXzt78mua0lgl5IlIa
         4n8pR0Ervv3ZNPQW0aiaotNEgrc8G9P7ubFkK2w6+uaoh03we3rfB9S9ynz9zWoOuOEz
         lHkjkcidb1S9n5aecE1dD3vQEn9ynCHjjzLt0qGaEmQIz7BNLbOBxS0+eHcqJmGfAjN+
         4x7A3nxiUvKyReshFuNjqmmRv5Pt09QZeyl8M7Jk6c4UzSh5ofl0w0VS8yDOH9hcFT0g
         qHkL9jM9Syo7TkgngMA20/WvY1YNhHhCK6Px0eOGJ6rLaX45fFjBLShWD0A8YzBmFN+x
         uHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689220905; x=1691812905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abCHUQktP5MJunGBbFxiEtMxCTOfDURCs+9p52JRh/8=;
        b=iO+79nFhmg1GX5WjMqWr4VirZ27wKdqk0q5rd02N+ZU5u+CvPc7ZGQmycvypfbqwVL
         4ZnoiVeGAKkchB2Lfs+M7zVmp+IfoWCU+3kkFTarXwuYziwb8JjOL35ffmUIpeI6ccaB
         dSPYfZSn3fNhdqhE/17SYEgJ1ARh7zwmsrfi3XdkscU1tXaU8itnlFZlPeD8spYznKAc
         FAIjXKi6uZCB4wDVO0DwltmZwRlQW4pXg8YBWzlznfBFAd9g3iXkkV6OE0wjD8vYvk/j
         Y5eOKEYVJHP0h6hD3a2E3dLr5w+dmAT7RPeuWMqWCC0Km976ZZrHxSZh9p/b3ewLVL73
         MHDA==
X-Gm-Message-State: ABy/qLY9DLu5xGWNjsBOEEEU3sNF9JVoEd/g34AXQWUnuIFvvoLZZfKx
        d3NO4pNS1kyjced/YNajywzK1g==
X-Google-Smtp-Source: APBJJlFilkt4vdM3RaaiQYzF3nbBwT8MsRIDTapNiyPOosqYEeusiwuW4IQKRXYE04xw400mySQ6pg==
X-Received: by 2002:a17:902:c40c:b0:1b9:f7dc:b4f6 with SMTP id k12-20020a170902c40c00b001b9f7dcb4f6mr395931plk.44.1689220905312;
        Wed, 12 Jul 2023 21:01:45 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902cb0f00b001ae469ca0c0sm4771592ply.245.2023.07.12.21.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 21:01:44 -0700 (PDT)
Date:   Thu, 13 Jul 2023 09:31:42 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        quic_nitirawa@quicinc.com, quic_narepall@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_richardp@quicinc.com,
        quic_nguyenb@quicinc.com, quic_ziqichen@quicinc.com,
        bmasney@redhat.com, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH 10/14] scsi: ufs: core: Add OPP support for scaling
 clocks and regulators
Message-ID: <20230713040142.3nsrzezvi2hsp52e@vireshk-i7>
References: <20230712103213.101770-1-manivannan.sadhasivam@linaro.org>
 <20230712103213.101770-11-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712103213.101770-11-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-07-23, 16:02, Manivannan Sadhasivam wrote:
> +static int ufshcd_opp_set_rate(struct ufs_hba *hba, unsigned long freq)
> +{
> +	struct dev_pm_opp *opp;
> +
> +	opp = dev_pm_opp_find_freq_floor_indexed(hba->dev,
> +						 &freq, 0);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	dev_pm_opp_put(opp);

You can't free the OPP while you are still using it :)

> +
> +	return dev_pm_opp_set_opp(hba->dev, opp);
> +}

-- 
viresh
