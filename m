Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9461A65EAB3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 13:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbjAEMdb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 07:33:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbjAEMdb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 07:33:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EFA32EA0
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 04:33:28 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B03D49C;
        Thu,  5 Jan 2023 13:33:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672922005;
        bh=CT5uq3pz9N7Yk3nn0qDtAnoKb4PaVCXp5xAQURGaX80=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JgXNxtZX9lSUiFKZp8uukTswkZXP5kXtoZSedtGhpPSImVluin+Xe3nI//E/fKlnd
         S09r0paSGSBvPJeU1q+EgF3MbOYVXYSKmTwOijPKNXOCxAOGjiThb6IPJhYTj98sIs
         bJ33zllbzEG1XoIIFcSmswlz1+/M69ClGaDNaAX0=
Message-ID: <97ec36e8-620b-d6ed-70c7-caa289adb3e3@ideasonboard.com>
Date:   Thu, 5 Jan 2023 14:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        neil.armstrong@linaro.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <362452c5-8858-9ac5-e0ca-8ff993e966b7@linaro.org>
 <baa8df6b-ecd4-6df8-9fb5-6a3a39e1a04f@ideasonboard.com>
 <37e48125-072d-e55d-d997-67fd3796a779@linaro.org>
 <64c66b81-b347-f659-1038-c104eb5c5468@linaro.org>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <64c66b81-b347-f659-1038-c104eb5c5468@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/01/2023 14:31, Dmitry Baryshkov wrote:
> On 04/01/2023 11:05, Neil Armstrong wrote:
>> On 04/01/2023 08:29, Tomi Valkeinen wrote:
>>> On 28/12/2022 23:58, Dmitry Baryshkov wrote:
>>>> On 02/11/2022 20:06, Dmitry Baryshkov wrote:
>>>>>  From all the drivers using drm_bridge_connector only iMX/dcss and 
>>>>> OMAP
>>>>> DRM driver do a proper work of calling
>>>>> drm_bridge_connector_en/disable_hpd() in right places. Rather than
>>>>> teaching each and every driver how to properly handle
>>>>> drm_bridge_connector's HPD, make that automatic.
>>>>>
>>>>> Add two additional drm_connector helper funcs: enable_hpd() and
>>>>> disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
>>>>> is the time where the drm_bridge_connector's functions are called 
>>>>> by the
>>>>> drivers too).
>>>>
>>>> Since we are at the beginning of the development window, gracious 
>>>> ping for this patchset.
>>>>
>>>> It would be nice to finally handle the bridge_connector's hpd 
>>>> properly. Calling drm_bridge_connector_enable_hpd() from 
>>>> drm_bridge_connector_init() is not a proper way to do this. It 
>>>> results in calling bridge->funcs->hpd_enable() before the rest of 
>>>> the pipeline was set up properly.
>>>
>>> For the series:
>>>
>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>
>>> I've been using this series in my local branch for quite a while to 
>>> fix the HPD issues. Works for me.
> 
> Thanks!
> 
>>>
>>> I still think the "fix" aspect should be highlighted more here, as 
>>> the current upstream triggers a WARN for "Hot plug detection already 
>>> enabled" (at least) on OMAP.
>>
>> LGTM then !
>>
>> Tomi, Dmitry, I can push the whole serie via drm-misc-next or -fixes 
>> then, as you wish.
> 
> 
> I'm fine either way. We have been living with the warning for some time, 
> so I don't think there is any urgency to get rid of it immediately.

Yes, drm-misc-next is fine for me too.

  Tomi

