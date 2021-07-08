Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39423C1BA5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 01:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhGHXHf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 19:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbhGHXHe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 19:07:34 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8939DC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 16:04:52 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id j10-20020a05683015cab02904b568e08dccso1350780otr.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 16:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=dXlhvqLqeesC0V9Ud3A6Hb+9uMtm23VDqYomKJ4kiMo=;
        b=KjK2DfuIawxaKf5cNWtZqEpy5YsTzJPZzEMxA3F1Wac7TiFBC1WaU9LyfzPL1pEYba
         L5miusR+y5Kw9ZyPQYhheJvQyrIjoG93pL1BXQTqC2+nT90rkZCF3PMoK5JdjMIcXf68
         xe4ovI39dOIqWfqyKlL2lC08ZN0rpKl8UYWR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=dXlhvqLqeesC0V9Ud3A6Hb+9uMtm23VDqYomKJ4kiMo=;
        b=MW3IDeQW24n6a6xCR0lEt1kGYOwTy4qeKj0SIsY2JW/o04mZrgApzTdbt0cZ1a3ClR
         jnt+ib8bDUCEoNJlRa388WxNrrTcNOgJFvMNIvfYZpVlrF9oMXnUDZWn+9J0OomriVJ3
         wCuqdXzDa0iJFDc+/oJ7ZZDZHSt0iSFJ4fiRCOKnUU35vJ7ide1XndVbY82pkcccP+Qh
         ZOBn1u+Bf1rqaNnHX+B63yLNBomtQVbYyYrqaR5hemXbikVHtCwTMFpGxtJM2K5Y4eUr
         FDHYjiOzJANrl752F3d9CGWpO6c+H8A64T6Z9UkIkYUbJBW2swt9QJMoimmpiKGNWpyV
         MxgQ==
X-Gm-Message-State: AOAM532RSqRZyn+ChP00Ww9HrAwNBiu2OLiG1UaKcQPAICCSxV2yYVGW
        1LdQ/rIe5KY62mvpqBQup2FDhXxfb1z5iM+qtdkEXQ==
X-Google-Smtp-Source: ABdhPJzQhxGAjOGE9PXbxeTBzmNHSu8sTbztwVFR1Qu05dto6fm1iVJ7+yGW4nD7WJ/Larke5f6IrsaQzkuiij9sJfI=
X-Received: by 2002:a05:6830:1353:: with SMTP id r19mr25979929otq.233.1625785491904;
 Thu, 08 Jul 2021 16:04:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 23:04:51 +0000
MIME-Version: 1.0
In-Reply-To: <1624015734-16778-4-git-send-email-okukatla@codeaurora.org>
References: <1624015734-16778-1-git-send-email-okukatla@codeaurora.org> <1624015734-16778-4-git-send-email-okukatla@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 8 Jul 2021 23:04:51 +0000
Message-ID: <CAE-0n52XPJ7COZc7Zy=721-FGPX9D=vSFR_qccL86UXuABuy9Q@mail.gmail.com>
Subject: Re: [V4 3/3] arm64: dts: qcom: sc7280: Add EPSS L3 interconnect provider
To:     Andy Gross <agross@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, evgreen@google.com,
        georgi.djakov@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     seansw@qti.qualcomm.com, elder@linaro.org,
        linux-pm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Odelu Kukatla (2021-06-18 04:28:54)
> Add Epoch Subsystem (EPSS) L3 interconnect provider node on SC7280
> SoCs.
>
> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 38a7f55..7690d7e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1153,6 +1153,15 @@
>                         };
>                 };
>
> +               epss_l3: interconnect@18590000 {
> +                       compatible = "qcom,sc7280-epss-l3";
> +                       reg = <0 0x18590000 0 1000>, <0 0x18591000 0 0x100>,
> +                               <0 0x18592000 0 0x100>, <0 0x18593000 0 0x100>;
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
> +                       clock-names = "xo", "alternate";
> +                       #interconnect-cells = <1>;
> +               };

Is this inside the soc node? Because it should be but then the next node
is called 'interconnect' and has no address so that is probably outside
the soc node. Please put nodes with a reg property like this into the
soc node.

> +
>                 clk_virt: interconnect {
>                         compatible = "qcom,sc7280-clk-virt";
>                         #interconnect-cells = <2>;
