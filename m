Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCA72067CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 01:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387981AbgFWXBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 19:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387774AbgFWXBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 19:01:37 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F4DC061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:01:36 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d12so130519ply.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SUKYA/zx+5E8AfDw1a6xG4cepErgkB5iNhcXF52h2ZE=;
        b=CjRRJpp7O4KrJBdChXmFiWMm9EG6yH/eap519k/lQPjDkL7zy/FrkSIRCr1qyPBV5W
         csuHCIvUQAygk7FdSASPC++PgXKy6aAVjHkFwKqW446qbCde6rXaDT9dKWJEAfY01Lru
         GLIAQYX0rSyFwpz0swDlJXEFomHt6iTgJ9iZV5ZJKh8REKH6hpGu2LEm+ZF86Sd9JCKn
         4YdrpUjSZUKoO3ATN5vL4adWFhFNf6+HA14FhjfssQdPhKUx5PR5J2mB7KqKo3PRlBZH
         8hKnocdyoaAI5Fdjl3Q8ovP06z0ZAXn8PEQuC2B0IbkzMK7evUilC0A5f71fLvl/HZS5
         6SyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SUKYA/zx+5E8AfDw1a6xG4cepErgkB5iNhcXF52h2ZE=;
        b=p47jRh+Y2Mh4tc/Vsc9uE2VZPmF0zOJp97Ke4QqmGmrC4KDYIsg/TR3UciyqqXyeuq
         bGwSeiD9mDMCUdagwrmIkSqh6OqtTvYw7zaxWpMJpyDop0T/N/4/trzTZBvzXlhxFe0f
         1GKJnpipHL59uysfFT4x1FOcI7ILCPaARPL/Je/TT0VPooUsnGjmO0JLulSXZhRVF5Ph
         Cc71N7Ac6GegBC3q1SKeDPpV0zXegaWLFrJovxVJTkTxxwSA2VNOtX4WyB4wI730HU0X
         w7SV6jJpeyCwbvVEB48seK1cl6x0CtHFz8PMiPRf3QREYpZ9fCAI879gqTNWDHSCIZlc
         U2EA==
X-Gm-Message-State: AOAM532KtGxeh98wYMG3w0NyjTNeXQKCirjNlr1LFo9wmiNFcvuSvHSd
        hp9npSFEUEpjrOTn7Qp96IVoHQ==
X-Google-Smtp-Source: ABdhPJzgybR8vzFqX5nxfCrcmfJGlJ4QJ2rFl/bsaxFeggSSpxVo+uVXdeAJm0Uv3jij0Amg8K3HFg==
X-Received: by 2002:a17:902:74c6:: with SMTP id f6mr26218114plt.121.1592953296227;
        Tue, 23 Jun 2020 16:01:36 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s1sm3238410pjp.14.2020.06.23.16.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 16:01:35 -0700 (PDT)
Date:   Tue, 23 Jun 2020 15:58:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] soc: qcom: smd-rpm: Add msm8994 compatible
Message-ID: <20200623225853.GF128451@builder.lan>
References: <20200602200407.320908-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602200407.320908-1-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 02 Jun 13:04 PDT 2020, Konrad Dybcio wrote:

> Add the compatible for the RPM in msm8994.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Applied

Thanks,
Bjorn

> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
>  drivers/soc/qcom/smd-rpm.c                                  | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
> index 616fddcd09fd..25541a475ead 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
> @@ -23,6 +23,7 @@ resources.
>  		    "qcom,rpm-msm8916"
>  		    "qcom,rpm-msm8974"
>  		    "qcom,rpm-msm8976"
> +		    "qcom,rpm-msm8994"
>  		    "qcom,rpm-msm8998"
>  		    "qcom,rpm-sdm660"
>  		    "qcom,rpm-qcs404"
> diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
> index 005dd30c58fa..54eb5cbc05fd 100644
> --- a/drivers/soc/qcom/smd-rpm.c
> +++ b/drivers/soc/qcom/smd-rpm.c
> @@ -233,6 +233,7 @@ static const struct of_device_id qcom_smd_rpm_of_match[] = {
>  	{ .compatible = "qcom,rpm-msm8916" },
>  	{ .compatible = "qcom,rpm-msm8974" },
>  	{ .compatible = "qcom,rpm-msm8976" },
> +	{ .compatible = "qcom,rpm-msm8994" },
>  	{ .compatible = "qcom,rpm-msm8996" },
>  	{ .compatible = "qcom,rpm-msm8998" },
>  	{ .compatible = "qcom,rpm-sdm660" },
> -- 
> 2.26.2
> 
