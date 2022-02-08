Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDD44AD8EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 14:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349844AbiBHNQH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 08:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357695AbiBHMfj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 07:35:39 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FB6C03FECE
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 04:35:38 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id f11-20020a4abb0b000000b002e9abf6bcbcso17374120oop.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 04:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TibP6ie0mJ0/x/QbIt21htQ4eMNZGXf+QIIH3Lwii8M=;
        b=ELjNWqAAw36iAjwGcykP/O5E9o6Sr3VD2lcXqWUmwJ/tc7cOcMB7Qld0H5PRI9TIxx
         JXO07ztlGnyGWZhZ/sj82/DTLoiXL7bD3Ko9lrH8Din1wGfHER/z7TCXPIalLs2voVto
         tXQD1CcvONKj2bjnolF302VkJiyqtpUXnrbEWYHmuvHrNmej5gEvC044L2eh+X+3DC0T
         6YTle+j1xNDzwqyp20JpmmeboLB1CPLfSCh7GnM1d3q4lWz02sCtzftB/sDpDMZrxtDN
         0Ud85klN73qhmujwAImq6cIjWTEXDozm4zStJ7h5+3OlQmFCepQB1lL28LomwWfHK0ks
         5mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TibP6ie0mJ0/x/QbIt21htQ4eMNZGXf+QIIH3Lwii8M=;
        b=CqeTLzCJxLccmmEcE/BxMufP4+z2BzCZMXBwd8L2vHF1MPB+2YDsnSnyUi0LLRmtOG
         CGmVcbSc3AJJTDdNLDuiFHZrBJfe0sWcTD8W38lCv6W4a7HZA42rfrfWB/tO8AgmOvlr
         O4YRWHQ51U9rRP8ct2pKiK4Y+L+VjiCbeGrbqA22ta0URRf+FL2dNB65FBFRW8O0nb/4
         YSP+mQ5Bud1vtNaJ/62jRZRlIgEFgL/k3pAw5sxell5y2ekZ4gRhFvCPflYDK6ewOX3l
         BixQjh9XGpgn+0wAHf1+6F1j+HKJW0xazhbWnEQQugglqQeKeZKiSGXiEFfOeKpHsPLS
         Ia8g==
X-Gm-Message-State: AOAM531w0ZgKv9hDruPX+wZ3Ilds/nipULshYtMzC56NO3/bz6vmS/3p
        j7u7WPibmSjhYQ4oYnJP+kY0kKHN1X2a4w==
X-Google-Smtp-Source: ABdhPJwxy3nlHmLtPKWVPWEwDZFjz82rjVAuDsY6yy6xrZXojf6s8g60+PrtEYvpCh0StlXMn9aDiw==
X-Received: by 2002:a4a:4344:: with SMTP id l4mr1643290ooj.14.1644323737531;
        Tue, 08 Feb 2022 04:35:37 -0800 (PST)
Received: from [192.168.11.51] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id t16sm5138950otc.29.2022.02.08.04.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 04:35:37 -0800 (PST)
Message-ID: <f64782c3-b249-f381-9f1f-203fb0aac5d7@kali.org>
Date:   Tue, 8 Feb 2022 06:35:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 2/2] arm64: dts: qcom: c630: Move panel to aux-bus
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220208041606.144039-1-bjorn.andersson@linaro.org>
 <20220208041606.144039-2-bjorn.andersson@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220208041606.144039-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/7/22 10:16 PM, Bjorn Andersson wrote:
> With the newly introduced aux-bus under the TI SN65DSI86 the panel
> node should be described as a child instead of a standalone node, move
> it there.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 27 +++++++++----------
>   1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index 55fb7302245b..fd1261901ab5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -56,20 +56,6 @@ mode {
>   		};
>   	};
>   
> -	panel {
> -		compatible = "boe,nv133fhm-n61";
> -		no-hpd;
> -		backlight = <&backlight>;
> -
> -		ports {
> -			port {
> -				panel_in_edp: endpoint {
> -					remote-endpoint = <&sn65dsi86_out>;
> -				};
> -			};
> -		};
> -	};
> -
>   	/* Reserved memory changes for IPA */
>   	reserved-memory {
>   		wlan_msa_mem: memory@8c400000 {
> @@ -446,6 +432,19 @@ sn65dsi86_out: endpoint {
>   				};
>   			};
>   		};
> +
> +		aux-bus {
> +			panel: panel {
> +				compatible = "boe,nv133fhm-n61";
> +				backlight = <&backlight>;
> +
> +				port {
> +					panel_in_edp: endpoint {
> +						remote-endpoint = <&sn65dsi86_out>;
> +					};
> +				};
> +			};
> +		};
>   	};
>   };
>   
Tested-by: Steev Klimaszewski <steev@kali.org>
