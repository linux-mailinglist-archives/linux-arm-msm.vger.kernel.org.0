Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB32970DCAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 14:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236905AbjEWMfT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 08:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjEWMfS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 08:35:18 -0400
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BFE2119
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:35:16 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f122ff663eso7922290e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684845255; x=1687437255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VStAuEVhC2bCRmusIaySDz/SK/sdnCdNupplahYT9Q=;
        b=ItC/HSLvWJai35Wq6AoHYCugrh1LBbE8UpOeF0LZVCgHMMuV5hMMYIbe1zYqapEzZJ
         y9qiz4LK4kmoGWJlYxkUa0Bt3qeSeOjduzxYdl39PYg/ylqDgH5jlzcd7WxnO4VPT5N0
         Z8qQqeEaK8cnIBjgmvP9V2x6KX2NW+Se1BArQFKRgVP3VjpxjzMBFLpoz/Gtqqv1yQTl
         7NiNVG/oCUfyV83xI602JFpSScw6flnFy1/MnxZOscieb2m4ZROMysYBStgB/NAsMR9w
         GaAhdPaHN2y7KutWw6dLQfLLxSMco1Rm3sRDnifsOgwIlTNWluqVqLd0iA4C01+H+PSm
         IXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684845255; x=1687437255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5VStAuEVhC2bCRmusIaySDz/SK/sdnCdNupplahYT9Q=;
        b=T9WYaf3tnyhkdwQJzIUUEtpkqkWx08yh0XP7g3mSnxwp7KZGiCwYymhydwffFTjnkN
         EEbfME1z8iREd6o6X0Ncj9tUVQgupNP25/gmfIJMiqGtxUeZXJMANiQEqhwHqRIR/5Ld
         JuNFu7v5mX7c9tQ83X7ljTlVZu/k1Ay3QvFfxYV77hrMGPwq0UFWQoZ7IQ6ercGjM26T
         DHWHVU2fdjPF0304VgZFNmemX29li2aGdtabPqQi637o+5lvI2vfqJgMKfAv/4tztqSW
         N0gqKBE/Kx9hKlU4R2DYLQs/xP162qdSWgUfiZadbeTcNPLA99yQVoMuFsNkKlbgW6QS
         Wxcw==
X-Gm-Message-State: AC+VfDzCcizCH4GlurTPJgDpexO9Ijrc9KwY3nVWnla4konFEPLt2Jr1
        uIF5lfdRKjTX9p5FnARwQoXpKg==
X-Google-Smtp-Source: ACHHUZ6mRNSCPuwh1780ZJPAelP5liz4bXxJaS2j4Brr3xJN1o0gnDBB9N1MkO7iAWK5UecFSO/ybg==
X-Received: by 2002:a19:f610:0:b0:4f4:b3e2:ff5a with SMTP id x16-20020a19f610000000b004f4b3e2ff5amr1176411lfe.50.1684845254928;
        Tue, 23 May 2023 05:34:14 -0700 (PDT)
Received: from [10.10.15.175] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m11-20020a19520b000000b004f13f4ec267sm1312723lfb.186.2023.05.23.05.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 05:34:14 -0700 (PDT)
Message-ID: <16c5ddb7-f5a4-d70b-ce0c-32aa6674fc98@linaro.org>
Date:   Tue, 23 May 2023 15:34:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4] drm/msm/dp: enable HDP plugin/unplugged interrupts at
 hpd_enable/disable
Content-Language: en-GB
To:     Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
        airlied@gmail.com, agross@kernel.org,
        marijn.suijten@somainline.org, quic_abhinavk@quicinc.com,
        quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1684796565-17138-1-git-send-email-quic_khsieh@quicinc.com>
 <20230523123504.3xjssy6ktgrsdewi@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230523123504.3xjssy6ktgrsdewi@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/05/2023 15:35, Bjorn Andersson wrote:
> On Mon, May 22, 2023 at 04:02:45PM -0700, Kuogee Hsieh wrote:
>> The internal_hpd flag is set to true by dp_bridge_hpd_enable() and set to
>> false by dp_bridge_hpd_disable() to handle GPIO pinmuxed into DP controller
>> case. HDP related interrupts can not be enabled until internal_hpd is set
>> to true. At current implementation dp_display_config_hpd() will initialize
>> DP host controller first followed by enabling HDP related interrupts if
>> internal_hpd was true at that time. Enable HDP related interrupts depends on
>> internal_hpd status may leave system with DP driver host is in running state
>> but without HDP related interrupts being enabled. This will prevent external
>> display from being detected. Eliminated this dependency by moving HDP related
>> interrupts enable/disable be done at dp_bridge_hpd_enable/disable() directly
>> regardless of internal_hpd status.
>>
>> Changes in V3:
>> -- dp_catalog_ctrl_hpd_enable() and dp_catalog_ctrl_hpd_disable()
>> -- rewording ocmmit text
>>
>> Changes in V4:
>> -- replace dp_display_config_hpd() with dp_display_host_start()
>> -- move enable_irq() at dp_display_host_start();
> 
> I think what Dmitry was asking for was that you remove the disable_irq()
> from dp_display_request_irq(), but perhaps I missed some argumentation
> for why that can't/shouldn't be done?
> 

Yes, I was asking to get it removed. Kuogee, is there any reason for 
keeping the enable_irq() / disable_irq() calls?

-- 
With best wishes
Dmitry

