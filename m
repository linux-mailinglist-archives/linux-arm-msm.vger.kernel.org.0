Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47FB33B064
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 10:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388538AbfFJIRH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 04:17:07 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38212 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387904AbfFJIRH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 04:17:07 -0400
Received: by mail-lj1-f194.google.com with SMTP id o13so7062511lji.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2019 01:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8pL4Nb1/9ZlimGeO+8nNRwwsw7KQDrO0bIiM5MijaHc=;
        b=xSRPJR4uipKtcDFNkoGLAFNDSWpur+y8M24zd3LBMhsJYqFp5+eEkZJfeJ+mUfA3dP
         AOCXEMkGnfQuGJ/8GlSeSupXJiRgFsrpX5P2P8bKbiNdUjiKo4WlyhCtuSvw6Fu3yuSp
         JlvmWIg3qvk3YA8rP6ziRd3ISQI+W5g/+ujJ6HXbRxdsFHJtT2251n7emGu/ehyLDchW
         orY44h5Uq6uCpZAKQTXbUabYUv0SFU0BU35hUEowS0A8IT+z44mEQpi7FOqyMObTxHXH
         J1IZmwmz0qzlrtkOKVn+2r1ULZjLMdlZ4gxp72cwNG0SGpQVHYzj40UB6i/K8uRaz/6v
         Oapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8pL4Nb1/9ZlimGeO+8nNRwwsw7KQDrO0bIiM5MijaHc=;
        b=HWVqnhIj6eLYEHjqpD/nE2Al1qxMrMhl9xlHxzpHifkJwag/5mi3uU1l/bqRbDK7Fi
         slB3VU4kY1c3kaWHKEnlFRdm9jcfPueVbIenoHZuKKn7JoakR5+hdVragx3DQadTgv7u
         2Qce/4YIkIG/Dsgzo3QpHasljw0LOv+Ihiv/pcEJsg8x0//t4EQl7CHG4hhgQFs2rF50
         wRIPA8xDtjlcDfC7/m3hWJIJGBTm+YbfwrDM7HzHbIdjqd2klbfCIJQ/RfVziqOVOp4c
         ESs14xCNbCuHbBZq68SWvKdxR36bIIJvTi6y3z8/LD4zSVTNEtYkJ8wwfw1WkqREs+ka
         btoQ==
X-Gm-Message-State: APjAAAXrYilGUyYpgeTA1ge4Ay20cpho8DL2rtg7f5VrduQoABCJcrAK
        MPjMN5mRC2C+bWzkK8qsJMZ48A==
X-Google-Smtp-Source: APXvYqxdRKjHKNFtdU1RuLDegwe0z+Q9hzFQQCcTB/Mo0B6oh4MMv2rJa2+CBzMU9qD3w+1XRSlP9Q==
X-Received: by 2002:a05:651c:87:: with SMTP id 7mr18288402ljq.184.1560154624975;
        Mon, 10 Jun 2019 01:17:04 -0700 (PDT)
Received: from centauri (m83-185-80-163.cust.tele2.se. [83.185.80.163])
        by smtp.gmail.com with ESMTPSA id c1sm1892791lfh.13.2019.06.10.01.17.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 10 Jun 2019 01:17:04 -0700 (PDT)
Date:   Mon, 10 Jun 2019 10:17:01 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>, arm@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: qcom: qcs404: Add reset-cells to GCC node
Message-ID: <20190610081701.GA3152@centauri>
References: <1560053972-32273-1-git-send-email-agross@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560053972-32273-1-git-send-email-agross@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 08, 2019 at 11:19:32PM -0500, Andy Gross wrote:
> This patch adds a reset-cells property to the gcc controller on the QCS404.
> Without this in place, we get warnings like the following if nodes reference
> a gcc reset:
> 
> arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_property):
> /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node
> /soc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
>   also defined at arch/arm64/boot/dts/qcom/qcs404-evb.dtsi:82.18-84.3
>   DTC     arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb
> arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_property):
> /soc@0/remoteproc@b00000: Missing property '#reset-cells' in node
> /soc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
>   also defined at arch/arm64/boot/dts/qcom/qcs404-evb.dtsi:82.18-84.3
> 
> Signed-off-by: Andy Gross <agross@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 342788a..086cadb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -426,6 +426,7 @@
>  			compatible = "qcom,gcc-qcs404";
>  			reg = <0x01800000 0x80000>;
>  			#clock-cells = <1>;
> +			#reset-cells = <1>;
>  
>  			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
>  			assigned-clock-rates = <19200000>;
> -- 
> 2.7.4
> 

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
