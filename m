Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08291202952
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 09:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbgFUHZC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 03:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729388AbgFUHZB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 03:25:01 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87482C061794
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 00:25:01 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id s14so2002111plq.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 00:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t8DfxJQgsCB49aGfdQiob3v0fXxUaFZwxnv8u/wZF/o=;
        b=KQR3QdwrumXa62xgL+DVytV1CTh7/7+K7UWVQw+wq4Xw96YtBusVtgLr48eeF+tFuQ
         OWXhrt9WOLh/OpeX3oe+7UsSWerjF+K9IxLgXwKKaZrOzJgdGAFnLsQFMiK8WlEx1KQe
         s97MKMkCDslPjdT0c49KVqoqxEil1HM4YYHXpmLJi9ADTuQDOG4jegROfNiaV87XxtQM
         LXbnWYQcdRCxFrLUWBY9bmfM3z+TfISg3PO5PpPFu1GVcj00PREZ1ei4fTs4YHYz/4Y4
         XwRz//QTB6GGC/+iIeYPT9UWYS8gAntsDzOP9hVKpIN8gNjBvU73eBGiIG904dnJCnCc
         Sugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t8DfxJQgsCB49aGfdQiob3v0fXxUaFZwxnv8u/wZF/o=;
        b=DnfxP9fLs/QoedkWhfAKsWAxEKvw9gf6pdvd6fEMpV4MhwlcSofY77vi5TFYIK3O2v
         zAh6gs11uk7k3fXSdeTQtgcqZtL4tvvOTRUOY/7la5QcpYXEQi9k1ssYUG2pRtbXwsMF
         JLNN+3y6SUMERKSzBY+EaNbeo3cXURPoBYPB6dth6iUe3eg9s+/MSioIUhrU1YsGUm5r
         t6BEokdytAd5y/H1LWwYymZWlPuuYZIqz/rgkSgfS6uFsC3BWleFpoZ/QzFUf3QytYes
         XUvsJsqEBZfsZ7hTV+OnxG+AnQeh1Z/wRK/X5L8lA5zg3kjVTDPGBGnHUjAFjegjv0C7
         wwkw==
X-Gm-Message-State: AOAM53073LG/niURTDA/4+O/tMuG3FZzJsaVFtNX+rCVvEHGoClCGOTy
        ZM6ooz4SDCdlNZ1yhhuBOaJAOg==
X-Google-Smtp-Source: ABdhPJzdfufl/2D2MnrN1ggslh+BlG+1XHrUvCJ0m6IM55MOOhIMmKkvsm/pMCewTxbEWp4a5dJCgw==
X-Received: by 2002:a17:90b:3793:: with SMTP id mz19mr11685376pjb.12.1592724300915;
        Sun, 21 Jun 2020 00:25:00 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c194sm10037877pfc.212.2020.06.21.00.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 00:25:00 -0700 (PDT)
Date:   Sun, 21 Jun 2020 00:22:13 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        mike.leach@linaro.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7180: Add iommus property to ETR
Message-ID: <20200621072213.GG128451@builder.lan>
References: <cover.1591708204.git.saiprakash.ranjan@codeaurora.org>
 <2312c9a10e7251d69e31e4f51c0f1d70e6f2f2f5.1591708204.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2312c9a10e7251d69e31e4f51c0f1d70e6f2f2f5.1591708204.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 09 Jun 06:30 PDT 2020, Sai Prakash Ranjan wrote:

> Define iommus property for Coresight ETR component in
> SC7180 SoC with the SID and mask to enable SMMU
> translation for this master.
> 

We don't have &apps_smmu in linux-next, as we've yet to figure out how
to disable the boot splash or support the stream mapping handover.

So I'm not able to apply this.

Regards,
Bjorn

> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index f684a0b87848..9b38867740ca 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1711,6 +1711,7 @@
>  		etr@6048000 {
>  			compatible = "arm,coresight-tmc", "arm,primecell";
>  			reg = <0 0x06048000 0 0x1000>;
> +			iommus = <&apps_smmu 0x04a0 0x20>;
>  
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
