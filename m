Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1E334DF3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 05:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbhC3DYK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 23:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbhC3DX4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 23:23:56 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879AAC061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:23:56 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id m13so15106570oiw.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 20:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XJ+II/5N1Hvyz6uuWXUQ+m2jul22u5rdFG3d3xmYGQ8=;
        b=XZ+lX/K9m/+z8BBmBTImdTLIfNIzicQmjr8dApFMHb34CaUpGb+6UaShh/SsxI8NMV
         wy7NjhxmVtzhIFO1S7zFnavjcN9SOIa0DrRY75lCrqO8QKOI37fA6M8pwsbOeoRryyPX
         cfbNpSAaErtz6Hw1KJzd5RsjFHW56cnetudVdLeQXyrFKQ+gsoCZhdjHhllX8QjhFJyJ
         ToJMwGn1k0R1CI4TfQepIQYuIyloIZR7td0va/lJMndsgJ+w88BePemr6NbL02O/lgBw
         YjdvQ2+ZtdOgRxY8wInf4vVEMvqqJ7j7dfJnqcShb/ECNnOlHzzocuhE588fspEYpuFr
         h4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XJ+II/5N1Hvyz6uuWXUQ+m2jul22u5rdFG3d3xmYGQ8=;
        b=YD6cJwQfkqBKvGwA5yLsIQQSr8VgP3KvxhvQyz0o1BBUTcgm9QNsIXyqtUBnWN4yJZ
         gbDqk5BTytlk7GrTarTD9mbicLPq/5/BDUA9eqSX+N3z6KyFzpeWn6b3voKBHx4Z/s1s
         pWJfA/fIgwutbeYUA5Pp5PDjCQkuZ0x/jg/QqsYx59hJDFJE4KF6el5VPErMFb10dLAC
         XTFZ3VqJDeCGMibzaM8hZTZUk3BV4beBQzUvLeYuXpp6NxEdeXvqDh1XsqOBfu2UrhrB
         wdwjzNdMySFcKhlP6FxOOYi5MPLvySdXeTNv3mpC1QMyiHR2MPsaz4uIYmkvMMNZpGoo
         LaMA==
X-Gm-Message-State: AOAM532Vt5bIO6813Wvm2AHXeYn2gRtfrQTH8H0jgPRPs+8C7Ojf3F24
        4LCVy6y7GFbKEan8zDzPcQ/+7r+0pmqgwg==
X-Google-Smtp-Source: ABdhPJxSeYNl2vFSLyTptFO+41Pe1NYsTjHnY8kt49eeWG8rQvjgKMnfTIdXVMS4Fynhf0gv023U8g==
X-Received: by 2002:aca:db85:: with SMTP id s127mr1639701oig.142.1617074635948;
        Mon, 29 Mar 2021 20:23:55 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w2sm4196653oov.23.2021.03.29.20.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 20:23:55 -0700 (PDT)
Date:   Mon, 29 Mar 2021 22:23:53 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Eric Anholt <eric@anholt.net>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: msm8996: Mark the GPU's SMMU as an
 adreno one.
Message-ID: <YGKZybLYu5xQW9Yn@builder.lan>
References: <20210326231303.3071950-1-eric@anholt.net>
 <20210326231303.3071950-2-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326231303.3071950-2-eric@anholt.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 26 Mar 18:13 CDT 2021, Eric Anholt wrote:

> This enables the adreno-specific SMMU path that sets HUPCF so
> (user-managed) page faults don't wedge the GPU.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

@Will, can you pick this together with the driver patch? (So that they
land in order)

Regards,
Bjorn

> ---
> 
> We've been seeing a flaky test per day or so in Mesa CI where the
> kernel gets wedged after an iommu fault turns into CP errors.  With
> this patch, the CI isn't throwing the string of CP errors on the
> faults in any of the ~10 jobs I've run so far.
> 
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 6de136e3add9..432b87ec9c5e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1127,7 +1127,7 @@ cci_i2c1: i2c-bus@1 {
>  		};
>  
>  		adreno_smmu: iommu@b40000 {
> -			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
> +			compatible = "qcom,msm8996-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
>  			reg = <0x00b40000 0x10000>;
>  
>  			#global-interrupts = <1>;
> -- 
> 2.31.0
> 
