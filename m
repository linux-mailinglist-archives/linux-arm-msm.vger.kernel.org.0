Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1CB83A2022
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 00:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhFIWg6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 18:36:58 -0400
Received: from mail-qk1-f170.google.com ([209.85.222.170]:39900 "EHLO
        mail-qk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhFIWg5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 18:36:57 -0400
Received: by mail-qk1-f170.google.com with SMTP id j184so25406495qkd.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 15:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h4YIin9nc0Zhzp3oLI4rfG0duyRcR0Z0PNgbrlky0wk=;
        b=lLJONwKFq63Tm8D6sZ33y32elvuZEf1fRY5wmO0RsNFP8PF98lRxqaJGetLG7TddUA
         WRLdwyDIaUd2iJSycBMY7XidFZgz6kitqpKtqUdTVRTT0kMUH5K4xFoCuBpToxaWpOcP
         RPa3kK1WFQwb0jEx2vFfl0rVhuRkxgzNhfRIfeS82IEZjzc+JWsC0U0LL0Yn5TyL85Ro
         jVtgKpH10oYYgUdHf+jlOBBpfIL3Ymo+3rIp5phg12740/sOlyqVy92QXq87zPsCTWel
         11RGNx3lCoGDCzVcdDf8T4p+rOu95sYEd6pRxRybJNCUd6nU2bPIiZ7J4uUW8XqcD0VI
         pG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h4YIin9nc0Zhzp3oLI4rfG0duyRcR0Z0PNgbrlky0wk=;
        b=rnoxF2UO4fslTadlh+4KBBlAT3v/s+NNUY/lF0HYkXT9FwlSBl6UEO3udCMOppz/wn
         RKLJe0w6Gm7s5ljxc4Svd6yyozP2IEPbxlcpBQVQuJIzSrLmpgCWN0pU0v1AwbLMR0WG
         T4Gum7b+h5sb5BE1TLp/y/Z6o/0zr7aUKGemrg603w/zGhDAnQ3I3ROzvdr79reTFGcv
         P9JpqUhoMTSY/CmP3HZMMHo99mGMw4Jxlbv3c8xr2n21fQB5rIm/sICOB+tPTwsqL+SG
         9n0IGahLxdkQFcUlOdGcEpjMbr9pqPk5pZL5LaABIxDbcXmx600tbxfhP9/w/LNJ6ZGT
         /zYA==
X-Gm-Message-State: AOAM533DbSIwI8ReH/nw4s9U3jkIaE5XePh+el7IecN9fAp93FWfP6E4
        voyYdBTE4DHKoshHXRUHhpjPDA==
X-Google-Smtp-Source: ABdhPJwtArpBD1ZM+4Odq67v5cly6Y8fhr0FO7NO62M2Wc4b3Mx4N9cvSdz3PhLRv3vc9jLvY1mdZA==
X-Received: by 2002:a37:b6c1:: with SMTP id g184mr1922300qkf.270.1623278042419;
        Wed, 09 Jun 2021 15:34:02 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g19sm983133qtg.36.2021.06.09.15.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 15:34:01 -0700 (PDT)
Subject: Re: [PATCH 17/17] media: dt-bindings: media: camss: Add
 qcom,sm8250-camss binding
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        andrey.konovalov@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210608223513.23193-1-jonathan@marek.ca>
 <20210608223513.23193-18-jonathan@marek.ca>
 <20210609221055.GA171974@robh.at.kernel.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <df0750af-74a9-9bc3-a7ec-96efba248aa1@marek.ca>
Date:   Wed, 9 Jun 2021 18:32:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20210609221055.GA171974@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/9/21 6:10 PM, Rob Herring wrote:
> On Tue, Jun 08, 2021 at 06:35:06PM -0400, Jonathan Marek wrote:
>> Add bindings for qcom,sm8250-camss in order to support the camera
>> subsystem for SM8250.

...

>> +    items:
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
> 
> Should be separate phy nodes? Same/similar DPHY or CPHY as QCom DSI PHY?
> 

This is not a new driver, this series only adds support for a new SoC - 
the design has already been decided (and this binding is similar to 
qcom,sdm845-camss.yaml).

The hardware supports D-PHY and C-PHY, but the driver isn't aware of 
this and assumes D-PHY. sdm845 and msm8996 hardware also support C-PHY, 
so it isn't a problem specific to this series.

>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +

