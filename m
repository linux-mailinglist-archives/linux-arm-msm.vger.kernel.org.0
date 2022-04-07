Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C91B04F86E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Apr 2022 20:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244690AbiDGSIp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 14:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240520AbiDGSIo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 14:08:44 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4291E8CCE
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 11:06:44 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id c2so5593233pga.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 11:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zsMzuXd+r/gGNu25Y2YqB8KwP80W1Nu0q91qDYpe8G8=;
        b=EsZrsDrKDDnH2WosGK6v464NbIxx8Do5CMKlCNXQE/QXA386Xrzpt+4hqdy8gO/viE
         Wb5DTVPupHc2/bvEbty2T9hFk5MlVsPxDUK+L7Xwxgo6sDLvTTz9gSdWWUXX/QrvEmfk
         v+FQXq0mnnW4PD8xC3bTIfJQ7oKm1nccD+OhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zsMzuXd+r/gGNu25Y2YqB8KwP80W1Nu0q91qDYpe8G8=;
        b=ozuyuU71VlYDNteT5nPBoE5wDIiJEzst8CwczgtUhqdevdH/86/TSfQJfRyWLK9mrp
         wj++QwAID+u7gZSDzCTHezPVxxWZKpug9LWrcX+//ZaJ2b7V56W9t2Hq0jYig7GzujgR
         w3Toe0P+zzqWMvwMhou9H79bIpA8Y6ftK6ousnEpYKJWSTCAx1f41m5DTlug+TYiBJPI
         ZajjW8pyrvththy2qBOCz9DiP60lrnftb5ZlrLaLOPbeziJ0aRm9FCdk2YYXqgVbWY98
         QTcbezs5SjX6IZXzkxuvo2ySj8hSLESujAYkOK0AFeslwNWj4jzZcoFvz1uWw7gCeVEl
         CzhA==
X-Gm-Message-State: AOAM5320CxRRdhPvqwH8fg56WpKXocE+4Sf4eThBzXH5MF7CILDs0pzb
        DGBrz5imIt4USY2WHbhr7Cg8VA==
X-Google-Smtp-Source: ABdhPJygNkNjwnBFdsduVzGuUGdmQn/+8t2Hpw8qCogNXLLlj0/CsjD/AY2ipAum3jC39PZtDfML4w==
X-Received: by 2002:a63:f4e:0:b0:382:1e31:79e8 with SMTP id 14-20020a630f4e000000b003821e3179e8mr12532181pgp.167.1649354803124;
        Thu, 07 Apr 2022 11:06:43 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:693e:9ca0:42a0:6bf7])
        by smtp.gmail.com with UTF8SMTPSA id n19-20020a62e513000000b005048eef5827sm3940718pff.142.2022.04.07.11.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 11:06:42 -0700 (PDT)
Date:   Thu, 7 Apr 2022 11:06:40 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_kriskura@quicinc.com, quic_vpulyala@quicinc.com
Subject: Re: [PATCH v12 6/6] arm64: dts: qcom: sc7280: Add wakeup-source
 property for USB node
Message-ID: <Yk8oMI3zifzFpJmW@google.com>
References: <1649321104-31322-1-git-send-email-quic_c_sanm@quicinc.com>
 <1649321104-31322-7-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1649321104-31322-7-git-send-email-quic_c_sanm@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 07, 2022 at 02:15:04PM +0530, Sandeep Maheswaram wrote:
> Adding wakeup-source property for USB controller in SC7280.
> This property is added to inform that the USB controller is
> wake up capable and to conditionally power down the phy during
> system suspend.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index f0b64be..046262a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2916,6 +2916,7 @@
>  				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>  				phy-names = "usb2-phy", "usb3-phy";
>  				maximum-speed = "super-speed";
> +				wakeup-source;
>  			};
>  		};

Not all SC7280 boards may want to enable wakeup from USB, so this is
probably best configured on a per-board basis.
