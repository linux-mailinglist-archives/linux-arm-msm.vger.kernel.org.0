Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9E31EE379
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 13:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbgFDLfz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 07:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgFDLfz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 07:35:55 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A2DC03E96E
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2020 04:35:55 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id h95so1077700pje.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2020 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2/5pgxdYWNKoFMQB5tFjRe8QXVDoLfZYvOGb/VDGPXQ=;
        b=Fp873ZWWKlblpHBlTb8a76VCFNAqzDrHSuSDlvXhYfl8lNpavHb0DQgAuJjqGXbGJx
         cLuRtp7sLGyWvsHKOEDzdet2nZdeCtboINChzUjyysHsUdoLdqUZH6Z9jEAjBE/uZdgl
         dQNIB7UE5BdduzwSXRA2AXDkRREVpkvvyW0IVYGthUNhFY4TNhxD0FNWaDzQg6e7mBzN
         sd0EXjHJCf4aq1CWEu2VC6hV4UPYXQtRz4itzTjoEGKPx+6id1lexfDgR0H9NfCcwBQc
         +Cin9eoplkhZ3ICsrswkkLyTXQ808dTldBY+GTvGREefRsbmL0vaVaaOsuv8TV0r7AM2
         yw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2/5pgxdYWNKoFMQB5tFjRe8QXVDoLfZYvOGb/VDGPXQ=;
        b=VnVMKtzgqlYwpVzdl4ywOyLsyJK3wHH7TUkP7IOwsPqnQnzgZgJIGLux+HgL5brRFq
         eUNMEx0oxwCdZPiZ2cX27VJ1kQ+kbqInQuAKBBfWLKS//SPomJrKuzdmQmtzXV48V4B1
         BloIo9zIL81KlZkGS/HYMS8VjjrhXh02VLwF+UmiBAnp7UwXjwDYuysiAfFS/LAFBACa
         EyUhYJvLe/qc8JZRACnq4ZkG/dGKGlr14wIEicrbzHFTBYjvdLVA2NofLPOPU9qjohY0
         xzg1i7wIgkAJx4SIv5P3OqhQgiCbjzdnzsMRTZHRwzbqYJR858dFWs9unLIn9SVzZH0W
         ED0A==
X-Gm-Message-State: AOAM531dbAMrAlIVEVV6rxH2QfSfXFMlH1gsI7S8jOxt15InrVxnrkJo
        PpjvD1+6cWOs7ufZukW+fdc+
X-Google-Smtp-Source: ABdhPJx8u7qUJeAdXimdHYtidCoRkYmL7tVHb2ahcRtCsw1VS1CpKaE3DbHwL4NxtGu+EfkCJqYjrQ==
X-Received: by 2002:a17:90a:ce18:: with SMTP id f24mr558639pju.97.1591270554704;
        Thu, 04 Jun 2020 04:35:54 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e19:fffb:c404:4d38:8396:d1ee])
        by smtp.gmail.com with ESMTPSA id l14sm5466794pjh.50.2020.06.04.04.35.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 04:35:53 -0700 (PDT)
Date:   Thu, 4 Jun 2020 17:05:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org,
        devicetree-owner@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8250: add watchdog device
Message-ID: <20200604113544.GF16719@Mani-XPS-13-9360>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-7-dmitry.baryshkov@linaro.org>
 <1a23cf8a6386e8b78c52199bdcde9b5e@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a23cf8a6386e8b78c52199bdcde9b5e@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 04, 2020 at 04:37:01PM +0530, Sai Prakash Ranjan wrote:
> On 2020-06-04 06:13, Dmitry Baryshkov wrote:
> > Add on-SoC watchdog device node.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 972d8e04c8a2..f1641c6fe203 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -1662,6 +1662,12 @@ config {
> >  			};
> >  		};
> > 
> > +		watchdog@17c10000 {
> > +			compatible = "qcom,apss-wdt-sm8250", "qcom,kpss-wdt";
> 
> Need to add this compatible to bindings.
> 

I did look into this but the binding says,
"compatible : shall contain only one of the following"

So clearly the fallback is not going to work and there is no need to add a
dedicated compatible in the driver. The binding is not in the YAML format to
be validated but still... Other option is to convert the binding to YAML and
make the compatibles listed as 'enum' and 'const' elements appropriately.

Thanks,
Mani

> Thanks,
> Sai
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
