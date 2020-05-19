Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F9F1DA461
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 00:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgESWUj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 18:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgESWUj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 18:20:39 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5C1C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 15:20:39 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id l73so1605159pjb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 15:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qqjzSh1ztmtDYwc/MYnPY/dYSfE16wab49lYkM1PfBQ=;
        b=Fsh2DrJuOBDMLbA4apQRID0KeanRhQiSAbTpdakI/ENJh94XscmLkvjLVV6+XZOkW3
         eucUVxtVvrsavK61NAUg8AzSih+MeDqP2lDhozqB/PsV3iU7jq4IVUPvAnXx/WYB1AEu
         rCvWOaUxyLDiXamwU/LAWr+51cWsMbudGo/hqlk7XmEi5gIQli+lynuVkVgMAYARLkxi
         dj5VS7LHFE3sAYoY0FhUG5QqivxzJamv7Fvb2w2QqKPIUtuC5iUCxSzz4iwr5EtDW0cO
         hI8W9R5cvtjBzJOjHU2iWFxrI30srcJL+vNlj076HVH/Iy78HnA3CZhU//XRojnIn9Ni
         cjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qqjzSh1ztmtDYwc/MYnPY/dYSfE16wab49lYkM1PfBQ=;
        b=qOM3ozF/TReRcUS8GMh7F3rN21ALzPL/VUP2iZ8VB17Tnn5B4bs7+KIdPkl8kYzDZ2
         6MQG0rCo6xp4/1l/J1pZzgLfeOLBwCw0+e+HcJJRRYA5SIKBf4AGaJPM+YXHx8u29RSv
         3fTywrEy1SfgmX5x6ma3AzMsGKd0NW3M0VBHd7lKXSQYbK42+pwtoBUR5Cagq9jz+sYU
         NnybGhIoSmW0FWui9K60o+85WhRvuXYGdVSFXbxS6/fCVUfelLDbsmHX1uWNTRc7v+SI
         b1q3R2aAzOv5DN0xmitQLcfg+uPcajZivaOMNLVemiBNRFYNdl3yQsU6lvFs8pHtHR2+
         pyGg==
X-Gm-Message-State: AOAM533YfcvUMeocuycwlqIvZJFGL9GW9MGOixpG4uc0ifQAY8WkDmfz
        0Z+PNETlexESLW68ttxMLKcGxQ==
X-Google-Smtp-Source: ABdhPJy2qeKYVGFiaiYmSSm3TzYMf3o3nRHsvHjU3Vrs44XNoMU4nBKRIIfLUZrvaNoGCn4Gi6Emlw==
X-Received: by 2002:a17:90b:503:: with SMTP id r3mr1752652pjz.69.1589926838459;
        Tue, 19 May 2020 15:20:38 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id w19sm393729pfc.95.2020.05.19.15.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 15:20:37 -0700 (PDT)
Date:   Tue, 19 May 2020 16:20:35 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH V4 2/4] rpmsg: glink: Add support to handle signals
 command
Message-ID: <20200519222035.GB26832@xps15>
References: <1589346671-15226-1-git-send-email-aneela@codeaurora.org>
 <1589346671-15226-3-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589346671-15226-3-git-send-email-aneela@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 13, 2020 at 10:41:09AM +0530, Arun Kumar Neelakantam wrote:
> Remote peripherals send signal notifications over glink with commandID 15.
> 
> Add support to send and receive the signal command and convert the signals
> from NATIVE to TIOCM while receiving and vice versa while sending.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 126 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index fc8ef66..68e039a 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> + * Copyright (c) 2018, The Linux Foundation.

Again, not sure what this is for.

>   * Copyright (c) 2016-2017, Linaro Ltd
>   */
>  
> @@ -17,6 +18,7 @@
>  #include <linux/rpmsg.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> +#include <linux/termios.h>
>  #include <linux/workqueue.h>
>  #include <linux/mailbox_client.h>
>  
> @@ -150,6 +152,8 @@ enum {
>   * @intent_req_lock: Synchronises multiple intent requests
>   * @intent_req_result: Result of intent request
>   * @intent_req_comp: Completion for intent_req signalling
> + * @lsigs:	local side signals
> + * @rsigs:	remote side signals
>   */
>  struct glink_channel {
>  	struct rpmsg_endpoint ept;
> @@ -181,6 +185,10 @@ struct glink_channel {
>  	struct mutex intent_req_lock;
>  	bool intent_req_result;
>  	struct completion intent_req_comp;
> +
> +	unsigned int lsigs;
> +	unsigned int rsigs;
> +
>  };
>  
>  #define to_glink_channel(_ept) container_of(_ept, struct glink_channel, ept)
> @@ -201,9 +209,15 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops;
>  #define RPM_CMD_TX_DATA_CONT		12
>  #define RPM_CMD_READ_NOTIF		13
>  #define RPM_CMD_RX_DONE_W_REUSE		14
> +#define RPM_CMD_SIGNALS			15
>  
>  #define GLINK_FEATURE_INTENTLESS	BIT(1)
>  
> +#define NATIVE_DTR_SIG	BIT(31)
> +#define NATIVE_CTS_SIG	BIT(30)
> +#define NATIVE_CD_SIG	BIT(29)
> +#define NATIVE_RI_SIG	BIT(28)

Please align theres with the BIT(1) of _INTENTLESS.

> +
>  static void qcom_glink_rx_done_work(struct work_struct *work);
>  
>  static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
> @@ -975,6 +989,76 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
>  	return 0;
>  }
>  
> +/**
> + * qcom_glink_send_signals() - convert a signal  cmd to wire format and transmit

s/signal  cmd/signal cmd

> + * @glink:	The transport to transmit on.
> + * @channel:	The glink channel
> + * @sigs:	The signals to encode.
> + *
> + * Return: 0 on success or standard Linux error code.
> + */
> +static int qcom_glink_send_signals(struct qcom_glink *glink,
> +				   struct glink_channel *channel,
> +				   u32 sigs)
> +{
> +	struct glink_msg msg;
> +
> +	/* convert signals from TIOCM to NATIVE */
> +	sigs &= 0x0fff;
> +	if (sigs & TIOCM_DTR)
> +		sigs |= NATIVE_DTR_SIG;
> +	if (sigs & TIOCM_RTS)
> +		sigs |= NATIVE_CTS_SIG;
> +	if (sigs & TIOCM_CD)
> +		sigs |= NATIVE_CD_SIG;
> +	if (sigs & TIOCM_RI)
> +		sigs |= NATIVE_RI_SIG;
> +
> +	msg.cmd = cpu_to_le16(RPM_CMD_SIGNALS);
> +	msg.param1 = cpu_to_le16(channel->lcid);
> +	msg.param2 = cpu_to_le32(sigs);
> +
> +	return qcom_glink_tx(glink, &msg, sizeof(msg), NULL, 0, true);
> +}
> +
> +static int qcom_glink_handle_signals(struct qcom_glink *glink,
> +				     unsigned int rcid, unsigned int signals)
> +{
> +	struct glink_channel *channel;
> +	unsigned long flags;
> +	u32 old;
> +
> +	spin_lock_irqsave(&glink->idr_lock, flags);
> +	channel = idr_find(&glink->rcids, rcid);
> +	spin_unlock_irqrestore(&glink->idr_lock, flags);
> +	if (!channel) {
> +		dev_err(glink->dev, "signal for non-existing channel\n");
> +		return -EINVAL;
> +	}
> +
> +	old = channel->rsigs;
> +
> +	/* convert signals from NATIVE to TIOCM */
> +	if (signals & NATIVE_DTR_SIG)
> +		signals |= TIOCM_DSR;

In qcom_glink_send_signals(), TIOCM_DTR (and not TIOCM_DSR) converts to
NATIVE_DTR_SIG.  

> +	if (signals & NATIVE_CTS_SIG)
> +		signals |= TIOCM_CTS;

Similarly, NATIVE_CTS_SIG converts to TIOCM_RTS.  I would have expected to have
a match between what gets sent and what comes back up.  If this is intentional
please at some comments to justify your choices.

> +	if (signals & NATIVE_CD_SIG)
> +		signals |= TIOCM_CD;
> +	if (signals & NATIVE_RI_SIG)
> +		signals |= TIOCM_RI;
> +	signals &= 0x0fff;
> +
> +	channel->rsigs = signals;
> +
> +	if (channel->ept.sig_cb) {
> +		channel->ept.sig_cb(channel->ept.rpdev, channel->ept.priv,
> +				    old, channel->rsigs);

What is the relevance of old and channel->rsigs?  They are certainly not used in
patch 4.

> +	}
> +
> +	return 0;
> +}
> +
>  static irqreturn_t qcom_glink_native_intr(int irq, void *data)
>  {
>  	struct qcom_glink *glink = data;
> @@ -1036,6 +1120,10 @@ static irqreturn_t qcom_glink_native_intr(int irq, void *data)
>  			qcom_glink_handle_intent_req_ack(glink, param1, param2);
>  			qcom_glink_rx_advance(glink, ALIGN(sizeof(msg), 8));
>  			break;
> +		case RPM_CMD_SIGNALS:
> +			qcom_glink_handle_signals(glink, param1, param2);
> +			qcom_glink_rx_advance(glink, ALIGN(sizeof(msg), 8));
> +			break;
>  		default:
>  			dev_err(glink->dev, "unhandled rx cmd: %d\n", cmd);
>  			ret = -EINVAL;
> @@ -1340,6 +1428,42 @@ static int qcom_glink_trysend(struct rpmsg_endpoint *ept, void *data, int len)
>  	return __qcom_glink_send(channel, data, len, false);
>  }
>  
> +static int qcom_glink_get_sigs(struct rpmsg_endpoint *ept)
> +{
> +	struct glink_channel *channel = to_glink_channel(ept);
> +
> +	return channel->rsigs;
> +}
> +
> +static int qcom_glink_set_sigs(struct rpmsg_endpoint *ept, u32 set, u32 clear)
> +{
> +	struct glink_channel *channel = to_glink_channel(ept);
> +	struct qcom_glink *glink = channel->glink;
> +	u32 sigs = channel->lsigs;
> +
> +	if (set & TIOCM_DTR)
> +		sigs |= TIOCM_DTR;
> +	if (set & TIOCM_RTS)
> +		sigs |= TIOCM_RTS;
> +	if (set & TIOCM_CD)
> +		sigs |= TIOCM_CD;
> +	if (set & TIOCM_RI)
> +		sigs |= TIOCM_RI;
> +
> +	if (clear & TIOCM_DTR)
> +		sigs &= ~TIOCM_DTR;
> +	if (clear & TIOCM_RTS)
> +		sigs &= ~TIOCM_RTS;
> +	if (clear & TIOCM_CD)
> +		sigs &= ~TIOCM_CD;
> +	if (clear & TIOCM_RI)
> +		sigs &= ~TIOCM_RI;
> +
> +	channel->lsigs = sigs;
> +
> +	return qcom_glink_send_signals(glink, channel, sigs);
> +}
> +
>  /*
>   * Finds the device_node for the glink child interested in this channel.
>   */
> @@ -1373,6 +1497,8 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
>  	.destroy_ept = qcom_glink_destroy_ept,
>  	.send = qcom_glink_send,
>  	.trysend = qcom_glink_trysend,
> +	.get_signals = qcom_glink_get_sigs,
> +	.set_signals = qcom_glink_set_sigs,
>  };
>  
>  static void qcom_glink_rpdev_release(struct device *dev)
> -- 
> 2.7.4
