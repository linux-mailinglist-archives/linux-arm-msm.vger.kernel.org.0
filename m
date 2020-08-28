Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F83255D41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 17:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgH1PC1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 11:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbgH1PCU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 11:02:20 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D696C061264
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 08:01:50 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id j15so876384lfg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 08:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6ORqEBn3MQVjfqHgaJlncWKBp1Osp1LWkDwguAMB8RA=;
        b=mPq8tCUi0dIQrdG29c8UfphLhSnIkHJhnkkcnjJZQTUl1LuDWx8KtEV7yDOFPU0fqF
         v4l3EpgDsjbMJSPRoOfnHSABi3bcSMiNB/F9T/MaqQfy+xjPIgrQJ1dmVDcCckOevHC6
         92RmMRrF042iFBqI0RRphUWLHmL+aCBuX0IrbiS/W8vyU9t6sGXKCOiCthIIOw7JQrRH
         m8j0NOwTLnJAoNeMb5SwN6LkYliy95h0wMuagQARSqxorOE2zuCzmvqg4+pRvRi3P0dh
         T8rOURl5TTQgFQwFfBKgxbM8o8qmawR0iFN2LbmeKNP93nxNp3+JjB93inct7yc/5c6c
         YmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ORqEBn3MQVjfqHgaJlncWKBp1Osp1LWkDwguAMB8RA=;
        b=NjB8rzyxmNqT6Taw9UWRRSpUNAjDg/R77THytiYJnGbZcaBNo4qsGQzcVW9hozkYV5
         UBH85nWdvVXq8h/J42QTZU2YXwGjmDJVtN9YCIdt2nWtNNdlGoqbZDDg3FhG7JlbbjGP
         U2XvoXk2D+anHqvA4TkjQiLrmoqSP2Fyb7bwchE0Zssze7RPuNeivE+zI4FJgfkZMczb
         wDxbpLaTpPiupIH9R+CIdZjKGk6tyPZrNHGYvweeeL4CytSdHvUZCsWmV1xxApL0a5nU
         zqelblZyOt0qKXsiqxm/ovfcnvrF3Y9QpJY2E1Z/ABhJyNOAOaedRnA7WEHVMwFkGeeY
         dR+g==
X-Gm-Message-State: AOAM531M9+XKHwqk1+iim/1H0gEaykRR4kl3NqeL7+V/zXO72B9TQuy/
        S90W9544xV10b8fhUBtE0RCpiw==
X-Google-Smtp-Source: ABdhPJzZj4EU+C53WrVm3puMlke4NYSKHE83tyvJQxfUAoQwWK/xY6ai+1okc7Ccixt5ZD0X8L3Q9A==
X-Received: by 2002:a19:ae0a:: with SMTP id f10mr999042lfc.100.1598626908397;
        Fri, 28 Aug 2020 08:01:48 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.62])
        by smtp.gmail.com with ESMTPSA id s127sm246691lja.119.2020.08.28.08.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 08:01:47 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] drm: bridge: add support for lontium LT9611UXC
 bridge
To:     Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
 <20200828120431.1636402-3-dmitry.baryshkov@linaro.org>
 <20200828141848.GX2639@vkoul-mobl>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d2afbd86-eb53-e273-6de6-dfae64624b37@linaro.org>
Date:   Fri, 28 Aug 2020 18:01:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828141848.GX2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/08/2020 17:18, Vinod Koul wrote:
> On 28-08-20, 15:04, Dmitry Baryshkov wrote:
>> +static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
>> +				enum drm_bridge_attach_flags flags)
>> +{
>> +	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
>> +	int ret;
>> +
>> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
>> +		dev_err(lt9611uxc->dev, "Fix bridge driver to make connector optional!");
> 
> Can we support both modes as I have done in lt9611, that way once the
> conversion is done we can drop the init part and support conversion.
> 
> I have patch for msm driver to set DRM_BRIDGE_ATTACH_NO_CONNECTOR, you
> can use that to test

Probably the message text is misleading. The driver as is does not work 
w/o DRM_BRIDGE_ATTACH_NO_CONNECTOR. Do you plan to push that patch into 
upstream tree?

>> +static int lt9611uxc_hdmi_hw_params(struct device *dev, void *data,
>> +				 struct hdmi_codec_daifmt *fmt,
>> +				 struct hdmi_codec_params *hparms)
>> +{
>> +	/*
>> +	 * LT9611UXC will automatically detect rate and sample size, so no need
>> +	 * to setup anything here.
>> +	 */
>> +	return 0;
>> +}
> 
> Do we need dummy function?

Yes, this callback is mandatory (and audio_shutdown).


-- 
With best wishes
Dmitry
