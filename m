Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A045283D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 14:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbiEPMF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 08:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiEPMFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 08:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 57C972253C
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 05:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652702753;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vG/ZLIgl/6sRfeOy7UnubeHdfQCIjGvrLP2A/YOFXi0=;
        b=VhTygivKNjbu1PQFjj58mwgy1eDopNGWtMEp4DswvYY9k7O0SDzKcaiZC1FsDC3/P+LKuf
        I/1RBEDPd0pSht9SxxOvqbmV6dZT+Ewog8BrzszT7Oxn/TJppqAtg6DMoVmBEWqfgs+QF1
        nnD3EInc1hQDiXdy4qJ4K06Y2AkFx0A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-5KGI4r1UNmi48MTe4bIi1w-1; Mon, 16 May 2022 08:05:52 -0400
X-MC-Unique: 5KGI4r1UNmi48MTe4bIi1w-1
Received: by mail-ej1-f69.google.com with SMTP id gn26-20020a1709070d1a00b006f453043956so5694569ejc.15
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 05:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vG/ZLIgl/6sRfeOy7UnubeHdfQCIjGvrLP2A/YOFXi0=;
        b=szBy6tIFd3iQdrP4rfFbw+noZnxPzqLih7rTLrriU6R2j47VNJJSEWgvlfBkDCH6Z2
         8dXdcutl8uAJEdjUX0eZ5MZBSEqfGiAwJf7wfO8xbl62uTisye7jmflG/Ok6spye4paT
         kbcKbaLvBCs19WnODw7QcvgFBPDHEbv+8ajq64rt3Lvp+DGOga8w8q+AT8Vu2cqXE0Du
         z1zXWL37ul7wZV/S8dFJ8P8LTL3srEg0kTFigFMb2oRLwL4GV0/Fagdpn+tuGr25zdq8
         ZKNxT8Y6CAlaz1XMLqg79NySNXH3svssjQIz8ONBRrBR1X/Vd5tYcmrakUX3eLPH+2wc
         0txg==
X-Gm-Message-State: AOAM530/uEdZv3dyh7I+swshLJ7CNjyRAJi/PbDTpitkK7P6JQHOToto
        IezPEIhPHqnwFUG45Z1uBNKSpYPDYiyffd7/7ISnMK6wt3QBg1wznoMOXiQj+fNOThI8OXUpnm2
        +8NoTnZFc8d3REd/Ku2sLBLoPBA==
X-Received: by 2002:a05:6402:b8f:b0:42a:be5d:7a94 with SMTP id cf15-20020a0564020b8f00b0042abe5d7a94mr769290edb.150.1652702750684;
        Mon, 16 May 2022 05:05:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAN7T+5N/B7gyP+ujGejIQ5hVeT1KxXFDW1cynVLgUOmc51xLNbcUysPS1+TQF7PAajXo6tA==
X-Received: by 2002:a05:6402:b8f:b0:42a:be5d:7a94 with SMTP id cf15-20020a0564020b8f00b0042abe5d7a94mr769267edb.150.1652702750470;
        Mon, 16 May 2022 05:05:50 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id jl6-20020a17090775c600b006fd6f7b3c84sm3646784ejc.46.2022.05.16.05.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 05:05:49 -0700 (PDT)
Message-ID: <63a9c130-a302-3fec-fcbc-e18c3918ae75@redhat.com>
Date:   Mon, 16 May 2022 14:05:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 2/5] drm: Add HPD state to
 drm_connector_oob_hotplug_event()
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org
References: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
 <20220502165316.4167199-3-bjorn.andersson@linaro.org>
 <YoI0wx/LPK4ZrUFf@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YoI0wx/LPK4ZrUFf@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 5/16/22 13:25, Heikki Krogerus wrote:
> +Hans
> 
> Hans, do you have any comments?

Thanks for the ping, this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
> On Mon, May 02, 2022 at 09:53:13AM -0700, Bjorn Andersson wrote:
>> In some implementations, such as the Qualcomm platforms, the display
>> driver has no way to query the current HPD state and as such it's
>> impossible to distinguish between disconnect and attention events.
>>
>> Add a parameter to drm_connector_oob_hotplug_event() to pass the HPD
>> state.
>>
>> Also push the test for unchanged state in the displayport altmode driver
>> into the i915 driver, to allow other drivers to act upon each update.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>
>> Changes since v3:
>> - Transition to drm_connector_status instead of custom hpd_state 
>>
>>  drivers/gpu/drm/drm_connector.c          |  6 ++++--
>>  drivers/gpu/drm/i915/display/intel_dp.c  | 17 ++++++++++++++---
>>  drivers/gpu/drm/i915/i915_drv.h          |  3 +++
>>  drivers/usb/typec/altmodes/displayport.c | 10 +++-------
>>  include/drm/drm_connector.h              |  6 ++++--
>>  5 files changed, 28 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index 1c48d162c77e..e86c69f0640f 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -2794,6 +2794,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>>  /**
>>   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>>   * @connector_fwnode: fwnode_handle to report the event on
>> + * @status: hot plug detect logical state
>>   *
>>   * On some hardware a hotplug event notification may come from outside the display
>>   * driver / device. An example of this is some USB Type-C setups where the hardware
>> @@ -2803,7 +2804,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>>   * This function can be used to report these out-of-band events after obtaining
>>   * a drm_connector reference through calling drm_connector_find_by_fwnode().
>>   */
>> -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
>> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
>> +				     enum drm_connector_status status)
>>  {
>>  	struct drm_connector *connector;
>>  
>> @@ -2812,7 +2814,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
>>  		return;
>>  
>>  	if (connector->funcs->oob_hotplug_event)
>> -		connector->funcs->oob_hotplug_event(connector);
>> +		connector->funcs->oob_hotplug_event(connector, status);
>>  
>>  	drm_connector_put(connector);
>>  }
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index e4a79c11fd25..56cc023f7bbd 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -4951,15 +4951,26 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
>>  	return intel_modeset_synced_crtcs(state, conn);
>>  }
>>  
>> -static void intel_dp_oob_hotplug_event(struct drm_connector *connector)
>> +static void intel_dp_oob_hotplug_event(struct drm_connector *connector,
>> +				       enum drm_connector_status hpd_state)
>>  {
>>  	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
>>  	struct drm_i915_private *i915 = to_i915(connector->dev);
>> +	bool hpd_high = hpd_state == connector_status_connected;
>> +	unsigned int hpd_pin = encoder->hpd_pin;
>> +	bool need_work = false;
>>  
>>  	spin_lock_irq(&i915->irq_lock);
>> -	i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
>> +	if (hpd_high != test_bit(hpd_pin, &i915->hotplug.oob_hotplug_last_state)) {
>> +		i915->hotplug.event_bits |= BIT(hpd_pin);
>> +
>> +		__assign_bit(hpd_pin, &i915->hotplug.oob_hotplug_last_state, hpd_high);
>> +		need_work = true;
>> +	}
>>  	spin_unlock_irq(&i915->irq_lock);
>> -	queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
>> +
>> +	if (need_work)
>> +		queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
>>  }
>>  
>>  static const struct drm_connector_funcs intel_dp_connector_funcs = {
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index 24111bf42ce0..96c088bb5522 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -135,6 +135,9 @@ struct i915_hotplug {
>>  	/* Whether or not to count short HPD IRQs in HPD storms */
>>  	u8 hpd_short_storm_enabled;
>>  
>> +	/* Last state reported by oob_hotplug_event for each encoder */
>> +	unsigned long oob_hotplug_last_state;
>> +
>>  	/*
>>  	 * if we get a HPD irq from DP and a HPD irq from non-DP
>>  	 * the non-DP HPD could block the workqueue on a mode config
>> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
>> index c1d8c23baa39..9360ca177c7d 100644
>> --- a/drivers/usb/typec/altmodes/displayport.c
>> +++ b/drivers/usb/typec/altmodes/displayport.c
>> @@ -59,7 +59,6 @@ struct dp_altmode {
>>  	struct typec_displayport_data data;
>>  
>>  	enum dp_state state;
>> -	bool hpd;
>>  
>>  	struct mutex lock; /* device lock */
>>  	struct work_struct work;
>> @@ -143,10 +142,8 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>>  		if (!ret)
>>  			dp->state = DP_STATE_CONFIGURE;
>>  	} else {
>> -		if (dp->hpd != hpd) {
>> -			drm_connector_oob_hotplug_event(dp->connector_fwnode);
>> -			dp->hpd = hpd;
>> -		}
>> +		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>> +						hpd ? connector_status_connected : connector_status_disconnected);
>>  	}
>>  
>>  	return ret;
>> @@ -573,8 +570,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
>>  	cancel_work_sync(&dp->work);
>>  
>>  	if (dp->connector_fwnode) {
>> -		if (dp->hpd)
>> -			drm_connector_oob_hotplug_event(dp->connector_fwnode);
>> +		drm_connector_oob_hotplug_event(dp->connector_fwnode, connector_status_disconnected);
>>  
>>  		fwnode_handle_put(dp->connector_fwnode);
>>  	}
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 3ac4bf87f257..886aa1861ed9 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -1141,7 +1141,8 @@ struct drm_connector_funcs {
>>  	 * This will get called when a hotplug-event for a drm-connector
>>  	 * has been received from a source outside the display driver / device.
>>  	 */
>> -	void (*oob_hotplug_event)(struct drm_connector *connector);
>> +	void (*oob_hotplug_event)(struct drm_connector *connector,
>> +				  enum drm_connector_status status);
>>  
>>  	/**
>>  	 * @debugfs_init:
>> @@ -1749,7 +1750,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
>>  		DRM_CONNECTOR_UNREGISTERED;
>>  }
>>  
>> -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode);
>> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
>> +				     enum drm_connector_status status);
>>  const char *drm_get_connector_type_name(unsigned int connector_type);
>>  const char *drm_get_connector_status_name(enum drm_connector_status status);
>>  const char *drm_get_subpixel_order_name(enum subpixel_order order);
>> -- 
>> 2.35.1
> 

