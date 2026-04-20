Return-Path: <linux-arm-msm+bounces-103740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOpmD9UI5mkjqwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:07:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E9429C54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44A8330E570A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F29539B962;
	Mon, 20 Apr 2026 11:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wZRLo91Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874C339C00C;
	Mon, 20 Apr 2026 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682930; cv=none; b=o8+drhaBqY0Rf+eSYsVkcw/znX0yEY3pplMqkmCQdMhs3d0O1IIKrX3IPWBltcIiP7Mdneja5I43dr6CiDKi6rthCQfB2XH6dtHRl5Ghbqszt2FpCmpLUpcklDlDffaBJbPehfj3L360d8rjF2GTOr9OB61Q5mHJe7dfSwXJNug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682930; c=relaxed/simple;
	bh=3GoDVjcVfcMdyNd/4s5GQU45wo7ysjQ0yDXPdAnGTVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJ35bsPdwrBs6/bTlNFk/c2oiNx1FkMjHTN1TgNsc2m89KnWo+QxYorp/mKiBR7OsigYzv+6aRUupxhjw+zv2OHQbG8BvkYj/FEukDncb7pAFpIB08hdAoIvS5X1DjCWyrdcuIwqk+eiikNXB8nagJCTZ2X+B79soJ0/uUMlX9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wZRLo91Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61711E45;
	Mon, 20 Apr 2026 13:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776682826;
	bh=3GoDVjcVfcMdyNd/4s5GQU45wo7ysjQ0yDXPdAnGTVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wZRLo91Yw4q2iLo7Jpebvtoz34atXay7MgSGlDzNv5NZVZHMvk/k71YVcMfV3/ohH
	 2QZCeKuMvVhNlNgoEBaLNUG1SEYNKvpF9tLlomfvYAxYy2+RkkHymazLhbC6O8mkYf
	 SSaJvybVWgwoS54+ar342tLiLzBET4kE7euo+MqA=
Message-ID: <f74ecd0a-3ff3-45b4-935e-44b89cd0c92d@ideasonboard.com>
Date: Mon, 20 Apr 2026 14:01:57 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
 Nikita Travkin <nikita@trvn.ru>, Yongxing Mou <yongxing.mou@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
 <20260416-hpd-irq-events-v1-1-1ab1f1cfb2b2@oss.qualcomm.com>
 <51b7c44e-36c9-461f-983a-eaa86eeb8cfd@ideasonboard.com>
 <6z572fdjkvjqvedifwvotgdy4lcrifiqvkjpnutousjqc6764r@zepfzkqy2kbu>
 <a2e60e74-a1be-469d-8f4d-ecce1f30b517@ideasonboard.com>
 <3vrqk67oivkgo26xdc3r774rvj3jn3t6sfydhlytyrfiftubhg@cipain7xxcjz>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <3vrqk67oivkgo26xdc3r774rvj3jn3t6sfydhlytyrfiftubhg@cipain7xxcjz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.infradead.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-103740-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[42];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 968E9429C54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 20/04/2026 12:50, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 07:50:46AM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 18/04/2026 01:32, Dmitry Baryshkov wrote:
>>> On Thu, Apr 16, 2026 at 11:10:03AM +0300, Tomi Valkeinen wrote:
>>>> Hi,
>>>>
>>>> On 16/04/2026 02:22, Dmitry Baryshkov wrote:
>>>>> The DisplayPort standard defines a special kind of events called IRQ.
>>>>> These events are used to notify DP Source about the events on the Sink
>>>>> side. It is extremely important for DP MST handling, where the MST
>>>>> events are reported through this IRQ.
>>>>>
>>>>> In case of the USB-C DP AltMode there is no actual HPD pulse, but the
>>>>> events are ported through the bits in the AltMode VDOs.
>>>>>
>>>>> Extend the drm_connector_oob_hotplug_event() interface and report IRQ
>>>>> events to the DisplayPort Sink drivers.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> ---
>>>>>     drivers/gpu/drm/drm_connector.c          |  4 +++-
>>>>>     drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
>>>>>     include/drm/drm_connector.h              |  3 ++-
>>>>>     3 files changed, 13 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>>>>> index 47dc53c4a738..5fdacbd84bd7 100644
>>>>> --- a/drivers/gpu/drm/drm_connector.c
>>>>> +++ b/drivers/gpu/drm/drm_connector.c
>>>>> @@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>>>>>      * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>>>>>      * @connector_fwnode: fwnode_handle to report the event on
>>>>>      * @status: hot plug detect logical state
>>>>> + * @irq_hpd: HPD pulse detected
>>>>>      *
>>>>>      * On some hardware a hotplug event notification may come from outside the display
>>>>>      * driver / device. An example of this is some USB Type-C setups where the hardware
>>>>> @@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>>>>>      * a drm_connector reference through calling drm_connector_find_by_fwnode().
>>>>>      */
>>>>>     void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
>>>>> -				     enum drm_connector_status status)
>>>>> +				     enum drm_connector_status status,
>>>>> +				     bool irq_hpd)
>>>> I find the "IRQ HPD" naming always confusing, even if I'm somewhat familiar
>>>> with DP, but if someone has mainly worked on HDMI, I'm sure it's even worse.
>>>>
>>>> Can we define this a bit more precisely? Is 'irq_hpd' only for displayport?
>>>> If so, perhaps 'dp_irq_hpd' or 'displayport_irq_hpd'. I might even call it
>>>> 'dp_hpd_pulse', but maybe that's not good as the spec talks about HPD pulse
>>>> for both short and long ones (although in the kernel doc you just write "HPD
>>>> pulse")... The kernel doc could be expanded a bit to make it clear what this
>>>> flag indicates.
>>>
>>> I attempted to stay away from defining a DP-specific flag, keeping it
>>> generic enough. HDMI is pretty close (IMO) to requiring separate flag in
>>
>> If it's not specifically the DP IRQ HPD, then we need to define what it
>> means. I tried to think what it would mean with HDMI, but I didn't come up
>> with anything.
> 
> I might be mistaken, but I had someting like HEAC HPD / EDID status
> changes in mind (or HDCP-triggered HPD status changes). But here I
> admit, I hadn't checked if it is actually applicable or not.

Possibly, I'm not familiar with those.

> Anyway, for e.g. DVI or VGA that means nothing. But, my point really is
> to abstain from defining someting as DP-only in the top-level API.

I'm fine with that, but then it really has to be defined =).

>>> Linux. Likewise I'd rather not use "pulse". The DP AltMode defines a bit
>>> in the VDO rather than a pulse.
>>>
>>> Anyway, if irq_hpd doesn't sound precise enough, what about "bool
>>> extra_irq"? This would convey that this is the extra hpd-related IRQ,
>>> but it would also be obvious that it's not related to the HPD pin
>>> itself.
>> We'd still need to define what exactly it means. I think it might be better
>> to just define it as the DP IRQ HPD, as then the meaning is clear.
>>
>> Also, would an enum flags parameter be better than a bool parameter?
> 
> Maybe not enum, but u32 param. Then it can become:
> 
> @extra_status: additional type-specific information provided by the sink
> without changing the HPD state
> 
> void drm_connector_oob_hotplug_event(..., u32 extra_status);
> 
> /* DP short HPD pulse or corresponding AltMode flag */
> #define DRM_CONNECTOR_OOB_DP_IRQ_HPD BIT(0)
> /* DP long HPD pulse, debounced XXX: do we need this? */
> #define DRM_CONNECTOR_OOB_DP_REPLUG BIT(1)

Why is u32 better than enum? So that we could e.g. pass short values 
inside the extra_status?

> For HDMI we might want to define:
> 
> /* HDMI 1.4b 8.5, HPD pulse */
> #define DRM_CONNECTOR_OOB_HDMI_REPLUG BIT(0)
> 
> Or might not, 100ms is long enough for all debouncers.

As I read the spec, there's no usable HPD pulse in HDMI as such. It just 
means that if HPD is low less than 100ms, it should be ignored, and if 
it's low more than 100ms, it should be handled. In other words, from 
spec perspective there's no difference between HPD being low 105ms or 
five days, there's no upper limit for the "pulse".

Still, we probably want to handle the case where the HPD is low only for 
a short period, so that we don't do a full disable/enable-cycle. We can 
interpret it as the same monitor still being connected, we just need to 
check the EDID again.

But isn't that just a drm_connector_hotplug_event with 
drm_connector_status staying connected? The callee can see that the 
connector was connected before, it's connected now, but we got an event, 
so let's read the EDID again.

  Tomi


