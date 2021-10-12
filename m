Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA0342B052
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 01:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235991AbhJLXij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 19:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236054AbhJLXii (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 19:38:38 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1BFC061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 16:36:36 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so1330646otb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 16:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AKtjnoi14KbYsp2b4AsV44DlnxqjPoofzGyFVUKZsXk=;
        b=qADfwZeTHj6SvdlF+UJnx4Otd0Sojk7hyI+S7+sZU1F46fG9/1hUtgJSj/Nf+RnhOj
         CTM+feW7IvbUJUq8riIsf7GFnWONyyZq0jO2DoTZOPApLEdI8wJ1+uZAh4R6HJBmOK12
         qCnXptFOToXQAfYngUWL56yAJtftFgfti/usSKuMyF2A8RLokbl1WzHJh9aWRnsNWlDZ
         Cqc8ANCOecuG9CPx1zn7gGe5IPEVlekRzkFarLIPN/Ck9MyIJe5YShB0xaXHJ0EkCNig
         +4DUD19uD8d6QW6F2kj1EYPb4k9ZYmoryuG9YFa5EXCVMUBqQxIVNpqgLI0Wo7FkbI0O
         mC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AKtjnoi14KbYsp2b4AsV44DlnxqjPoofzGyFVUKZsXk=;
        b=tf8sehUHfruTK0jZHFO5yxXm4p+c1KVDqVz4axMDxldZuVw7nuBUBO2jsA8A8rCOJa
         TOrAiQ3SEOInUOwkQ/SY13SDLNIe75phDxMiZBM6MVh988ZGwl9I5ZiXEiFpb6FsQ7uV
         f0+31AZAf5N0XOalmvXxKvBauXqKbOUbwB9xxnenbNs24f52xH1H8QnMMAI069Zgt403
         H+rSu6y/324yYp//MN3uCnYtyMKg5HNy8rCI7OvMqZPNUe+naIMdGvTv5209VvFJd576
         UmO3Wrt6F1SUH85He7bH210FmZqn55pM8k6deWnhVaJsIfsWqS/OG3hPLhSog1XsjRK1
         Lj4A==
X-Gm-Message-State: AOAM532iSuKZ1+xfLOProHj6jLlj2VszgudZ0ZIxpAq1/C0eyGK9hXwW
        qg3ZwcA3m6Ty8TpV6VD/b9AiqA==
X-Google-Smtp-Source: ABdhPJzNHEmyAERLK8Q9bksHdOc1tnQqViYMal0w/hgiqj1Yumw/8ZTJWKpfNczS/O1gc4aElQiN+A==
X-Received: by 2002:a05:6830:3190:: with SMTP id p16mr27854254ots.85.1634081795483;
        Tue, 12 Oct 2021 16:36:35 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id bn18sm1491706oib.43.2021.10.12.16.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 16:36:35 -0700 (PDT)
Date:   Tue, 12 Oct 2021 16:38:07 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     abhinavk@codeaurora.org
Cc:     Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: Use the connector passed to dp_debug_get()
Message-ID: <YWYcXxZzjU8gLNf5@ripper>
References: <20211010030435.4000642-1-bjorn.andersson@linaro.org>
 <50925d684962690e42b2eb8ab8479835@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50925d684962690e42b2eb8ab8479835@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 12 Oct 16:03 PDT 2021, abhinavk@codeaurora.org wrote:

> On 2021-10-09 20:04, Bjorn Andersson wrote:
> > The debugfs code is provided an array of a single drm_connector. Then to
> > access the connector, the list of all connectors of the DRM device is
> > traversed and all non-DisplayPort connectors are skipped, to find the
> > one and only DisplayPort connector.
> > 
> > But as we move to support multiple DisplayPort controllers this will now
> > find multiple connectors and has no way to distinguish them.
> > 
> > Pass the single connector to dp_debug_get() and use this in the debugfs
> > functions instead, both to simplify the code and the support the
> > multiple instances.
> > 
> Change itself is fine, hence
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> 

Thanks.

> What has to be checked now is now to create multiple DP nodes for multi-DP
> cases.
> Today, the debug node will be created only once :
> 
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c#L206
> 
> This also needs to be expanded for multi-DP to make the solution complete.
> 

In my multi-DP support patch I end up invoking msm_dp_debugfs_init() for
each of the DP/eDP instances and in its current form the first one gets
registered and any others will fail because of the resulting name
collision.

This patch came as a byproduct of the effort of addressing that problem.

Regards,
Bjorn

> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_debug.c   | 131 ++++++++++------------------
> >  drivers/gpu/drm/msm/dp/dp_debug.h   |   2 +-
> >  drivers/gpu/drm/msm/dp/dp_display.c |   2 +-
> >  3 files changed, 46 insertions(+), 89 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
> > b/drivers/gpu/drm/msm/dp/dp_debug.c
> > index af709d93bb9f..da4323556ef3 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> > @@ -24,7 +24,7 @@ struct dp_debug_private {
> >  	struct dp_usbpd *usbpd;
> >  	struct dp_link *link;
> >  	struct dp_panel *panel;
> > -	struct drm_connector **connector;
> > +	struct drm_connector *connector;
> >  	struct device *dev;
> >  	struct drm_device *drm_dev;
> > 
> > @@ -97,59 +97,35 @@ DEFINE_SHOW_ATTRIBUTE(dp_debug);
> > 
> >  static int dp_test_data_show(struct seq_file *m, void *data)
> >  {
> > -	struct drm_device *dev;
> > -	struct dp_debug_private *debug;
> > -	struct drm_connector *connector;
> > -	struct drm_connector_list_iter conn_iter;
> > +	const struct dp_debug_private *debug = m->private;
> > +	const struct drm_connector *connector = debug->connector;
> >  	u32 bpc;
> > 
> > -	debug = m->private;
> > -	dev = debug->drm_dev;
> > -	drm_connector_list_iter_begin(dev, &conn_iter);
> > -	drm_for_each_connector_iter(connector, &conn_iter) {
> > -
> > -		if (connector->connector_type !=
> > -			DRM_MODE_CONNECTOR_DisplayPort)
> > -			continue;
> > -
> > -		if (connector->status == connector_status_connected) {
> > -			bpc = debug->link->test_video.test_bit_depth;
> > -			seq_printf(m, "hdisplay: %d\n",
> > -					debug->link->test_video.test_h_width);
> > -			seq_printf(m, "vdisplay: %d\n",
> > -					debug->link->test_video.test_v_height);
> > -			seq_printf(m, "bpc: %u\n",
> > -					dp_link_bit_depth_to_bpc(bpc));
> > -		} else
> > -			seq_puts(m, "0");
> > +	if (connector->status == connector_status_connected) {
> > +		bpc = debug->link->test_video.test_bit_depth;
> > +		seq_printf(m, "hdisplay: %d\n",
> > +				debug->link->test_video.test_h_width);
> > +		seq_printf(m, "vdisplay: %d\n",
> > +				debug->link->test_video.test_v_height);
> > +		seq_printf(m, "bpc: %u\n",
> > +				dp_link_bit_depth_to_bpc(bpc));
> > +	} else {
> > +		seq_puts(m, "0");
> >  	}
> > 
> > -	drm_connector_list_iter_end(&conn_iter);
> > -
> >  	return 0;
> >  }
> >  DEFINE_SHOW_ATTRIBUTE(dp_test_data);
> > 
> >  static int dp_test_type_show(struct seq_file *m, void *data)
> >  {
> > -	struct dp_debug_private *debug = m->private;
> > -	struct drm_device *dev = debug->drm_dev;
> > -	struct drm_connector *connector;
> > -	struct drm_connector_list_iter conn_iter;
> > -
> > -	drm_connector_list_iter_begin(dev, &conn_iter);
> > -	drm_for_each_connector_iter(connector, &conn_iter) {
> > -
> > -		if (connector->connector_type !=
> > -			DRM_MODE_CONNECTOR_DisplayPort)
> > -			continue;
> > +	const struct dp_debug_private *debug = m->private;
> > +	const struct drm_connector *connector = debug->connector;
> > 
> > -		if (connector->status == connector_status_connected)
> > -			seq_printf(m, "%02x", DP_TEST_LINK_VIDEO_PATTERN);
> > -		else
> > -			seq_puts(m, "0");
> > -	}
> > -	drm_connector_list_iter_end(&conn_iter);
> > +	if (connector->status == connector_status_connected)
> > +		seq_printf(m, "%02x", DP_TEST_LINK_VIDEO_PATTERN);
> > +	else
> > +		seq_puts(m, "0");
> > 
> >  	return 0;
> >  }
> > @@ -161,14 +137,12 @@ static ssize_t dp_test_active_write(struct file
> > *file,
> >  {
> >  	char *input_buffer;
> >  	int status = 0;
> > -	struct dp_debug_private *debug;
> > -	struct drm_device *dev;
> > -	struct drm_connector *connector;
> > -	struct drm_connector_list_iter conn_iter;
> > +	const struct dp_debug_private *debug;
> > +	const struct drm_connector *connector;
> >  	int val = 0;
> > 
> >  	debug = ((struct seq_file *)file->private_data)->private;
> > -	dev = debug->drm_dev;
> > +	connector = debug->connector;
> > 
> >  	if (len == 0)
> >  		return 0;
> > @@ -179,30 +153,22 @@ static ssize_t dp_test_active_write(struct file
> > *file,
> > 
> >  	DRM_DEBUG_DRIVER("Copied %d bytes from user\n", (unsigned int)len);
> > 
> > -	drm_connector_list_iter_begin(dev, &conn_iter);
> > -	drm_for_each_connector_iter(connector, &conn_iter) {
> > -		if (connector->connector_type !=
> > -			DRM_MODE_CONNECTOR_DisplayPort)
> > -			continue;
> > -
> > -		if (connector->status == connector_status_connected) {
> > -			status = kstrtoint(input_buffer, 10, &val);
> > -			if (status < 0)
> > -				break;
> > -			DRM_DEBUG_DRIVER("Got %d for test active\n", val);
> > -			/* To prevent erroneous activation of the compliance
> > -			 * testing code, only accept an actual value of 1 here
> > -			 */
> > -			if (val == 1)
> > -				debug->panel->video_test = true;
> > -			else
> > -				debug->panel->video_test = false;
> > +	if (connector->status == connector_status_connected) {
> > +		status = kstrtoint(input_buffer, 10, &val);
> > +		if (status < 0) {
> > +			kfree(input_buffer);
> > +			return status;
> >  		}
> > +		DRM_DEBUG_DRIVER("Got %d for test active\n", val);
> > +		/* To prevent erroneous activation of the compliance
> > +		 * testing code, only accept an actual value of 1 here
> > +		 */
> > +		if (val == 1)
> > +			debug->panel->video_test = true;
> > +		else
> > +			debug->panel->video_test = false;
> >  	}
> > -	drm_connector_list_iter_end(&conn_iter);
> >  	kfree(input_buffer);
> > -	if (status < 0)
> > -		return status;
> > 
> >  	*offp += len;
> >  	return len;
> > @@ -211,25 +177,16 @@ static ssize_t dp_test_active_write(struct file
> > *file,
> >  static int dp_test_active_show(struct seq_file *m, void *data)
> >  {
> >  	struct dp_debug_private *debug = m->private;
> > -	struct drm_device *dev = debug->drm_dev;
> > -	struct drm_connector *connector;
> > -	struct drm_connector_list_iter conn_iter;
> > -
> > -	drm_connector_list_iter_begin(dev, &conn_iter);
> > -	drm_for_each_connector_iter(connector, &conn_iter) {
> > -		if (connector->connector_type !=
> > -			DRM_MODE_CONNECTOR_DisplayPort)
> > -			continue;
> > -
> > -		if (connector->status == connector_status_connected) {
> > -			if (debug->panel->video_test)
> > -				seq_puts(m, "1");
> > -			else
> > -				seq_puts(m, "0");
> > -		} else
> > +	struct drm_connector *connector = debug->connector;
> > +
> > +	if (connector->status == connector_status_connected) {
> > +		if (debug->panel->video_test)
> > +			seq_puts(m, "1");
> > +		else
> >  			seq_puts(m, "0");
> > +	} else {
> > +		seq_puts(m, "0");
> >  	}
> > -	drm_connector_list_iter_end(&conn_iter);
> > 
> >  	return 0;
> >  }
> > @@ -278,7 +235,7 @@ static int dp_debug_init(struct dp_debug
> > *dp_debug, struct drm_minor *minor)
> > 
> >  struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel
> > *panel,
> >  		struct dp_usbpd *usbpd, struct dp_link *link,
> > -		struct drm_connector **connector, struct drm_minor *minor)
> > +		struct drm_connector *connector, struct drm_minor *minor)
> >  {
> >  	int rc = 0;
> >  	struct dp_debug_private *debug;
> > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h
> > b/drivers/gpu/drm/msm/dp/dp_debug.h
> > index 7eaedfbb149c..3f90acfffc5a 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_debug.h
> > +++ b/drivers/gpu/drm/msm/dp/dp_debug.h
> > @@ -43,7 +43,7 @@ struct dp_debug {
> >   */
> >  struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel
> > *panel,
> >  		struct dp_usbpd *usbpd, struct dp_link *link,
> > -		struct drm_connector **connector,
> > +		struct drm_connector *connector,
> >  		struct drm_minor *minor);
> > 
> >  /**
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> > b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 1708b7cdc1b3..41a6f58916e6 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -1464,7 +1464,7 @@ void msm_dp_debugfs_init(struct msm_dp
> > *dp_display, struct drm_minor *minor)
> >  	dev = &dp->pdev->dev;
> > 
> >  	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
> > -					dp->link, &dp->dp_display.connector,
> > +					dp->link, dp->dp_display.connector,
> >  					minor);
> >  	if (IS_ERR(dp->debug)) {
> >  		rc = PTR_ERR(dp->debug);
