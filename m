Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 416324561A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 18:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbhKRRls (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 12:41:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbhKRRlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 12:41:47 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA604C061748
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 09:38:47 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so8814186pju.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 09:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uZZaIGV1J6dR0MYTZzEkI8MN4x5huF5mh8UM/JBFaIE=;
        b=LfzDXNKilx+XBoNwP82vKixjCJd4LNp979P9/zj9MO1twBuu2i7DdX18C9hOFJly2a
         uxVpRXMxVUqjvkpBRdnTJnTHn62sRCYGQYrVE8uDSpX9Y/qyH4Qfsicvztk3V9lb4OVm
         bJQB4Y2a2aQRDAdU28kYsx31IGa7CnZB9BG9hlMGh0G5lL40wXH4HgJB+r6lid3YReeD
         7UGqa+obJHljiZYYArzBJS7Cs+8UAEX4xHs8jsRXeO03k0QdOju0hhLwv8t1pKjf1Za5
         K5cHbxHzMy2RmFZ5QwLTR+1RtOC2oPJcWmXeZvmlkzh1OnAhkxDjCH1QTvvjhEprgwDf
         UYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uZZaIGV1J6dR0MYTZzEkI8MN4x5huF5mh8UM/JBFaIE=;
        b=ytcXudbMTZpArTLMlPuw1i5MG5zxg2puLqDk/UkDkgudK6dgGgP2VLC89Lwuih960H
         Ee/N00tZcLpwjBKrc571bBwGkZqLkcSTNt6LGJClyRI2owzcO1EAIWsGQE3hzWSaJWVr
         H8jnzBvMZXHNAbTk+G5KOlOOP7yAG+fmuA8nRhkumkpnzDGuIj3HtXg/FYXsbtvBhPQo
         CDwHpqs7n7hcGZs15h8lkp1ztthjXX0hUHfVQjJkSpFv/Kp1feX7ZnlmlVDqNYVKqo/u
         E2x5DPaN2R1O10nwwahRjMbV9BKOsJ4wcO7UZE4jZixNIENQPz+FU3zK+YjBRHBv9Mzg
         i4eA==
X-Gm-Message-State: AOAM531XxaOYtd0NdgI2LvI33SToLB0800saV7PsYc6hOdXce3CkaEB2
        LjbUueuEE49bF6dVSF5La0bU4TX142/vBA==
X-Google-Smtp-Source: ABdhPJzIafSm7+krxOYZpZqmelZlXgg5zMDtaTi/0mKeXEfnRV5VWipg3LI4IxuHr/MrdiMYHqgelw==
X-Received: by 2002:a17:902:82c9:b0:142:401f:dc9 with SMTP id u9-20020a17090282c900b00142401f0dc9mr68884457plz.43.1637257126770;
        Thu, 18 Nov 2021 09:38:46 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j9sm223909pgt.54.2021.11.18.09.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 09:38:45 -0800 (PST)
Date:   Thu, 18 Nov 2021 10:38:42 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] rpmsg: Fix documentation return formatting
Message-ID: <20211118173842.GD2530497@p14s>
References: <20211108140126.3530-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108140126.3530-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 08, 2021 at 03:01:26PM +0100, Arnaud Pouliquen wrote:
> kernel documentation specification:
> "The return value, if any, should be described in a dedicated section
> named Return."
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c |  2 +-
>  drivers/rpmsg/qcom_smd.c          |  2 +-
>  drivers/rpmsg/rpmsg_core.c        | 24 ++++++++++++------------
>  drivers/rpmsg/virtio_rpmsg_bus.c  |  2 +-
>  4 files changed, 15 insertions(+), 15 deletions(-)

I have applied this set.  There is a few more instances in drivers/remoteproc
that could be fixed the same way.

Thanks,
Mathieu

> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 3f377a795b33..1030cfa80e04 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -427,7 +427,7 @@ static void qcom_glink_handle_intent_req_ack(struct qcom_glink *glink,
>   * Allocates a local channel id and sends a RPM_CMD_OPEN message to the remote.
>   * Will return with refcount held, regardless of outcome.
>   *
> - * Returns 0 on success, negative errno otherwise.
> + * Return: 0 on success, negative errno otherwise.
>   */
>  static int qcom_glink_send_open_req(struct qcom_glink *glink,
>  				    struct glink_channel *channel)
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 8da1b5cb31b3..540e027f08c4 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1467,7 +1467,7 @@ ATTRIBUTE_GROUPS(qcom_smd_edge);
>   * @parent:    parent device for the edge
>   * @node:      device_node describing the edge
>   *
> - * Returns an edge reference, or negative ERR_PTR() on failure.
> + * Return: an edge reference, or negative ERR_PTR() on failure.
>   */
>  struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
>  					     struct device_node *node)
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index d3eb60059ef1..f031b2b1b21c 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -26,7 +26,7 @@
>   * @rpdev: rpmsg device
>   * @chinfo: channel_info to bind
>   *
> - * Returns a pointer to the new rpmsg device on success, or NULL on error.
> + * Return: a pointer to the new rpmsg device on success, or NULL on error.
>   */
>  struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
>  					  struct rpmsg_channel_info *chinfo)
> @@ -48,7 +48,7 @@ EXPORT_SYMBOL(rpmsg_create_channel);
>   * @rpdev: rpmsg device
>   * @chinfo: channel_info to bind
>   *
> - * Returns 0 on success or an appropriate error value.
> + * Return: 0 on success or an appropriate error value.
>   */
>  int rpmsg_release_channel(struct rpmsg_device *rpdev,
>  			  struct rpmsg_channel_info *chinfo)
> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(rpmsg_release_channel);
>   * dynamically assign them an available rpmsg address (drivers should have
>   * a very good reason why not to always use RPMSG_ADDR_ANY here).
>   *
> - * Returns a pointer to the endpoint on success, or NULL on error.
> + * Return: a pointer to the endpoint on success, or NULL on error.
>   */
>  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
>  					rpmsg_rx_cb_t cb, void *priv,
> @@ -146,7 +146,7 @@ EXPORT_SYMBOL(rpmsg_destroy_ept);
>   *
>   * Can only be called from process context (for now).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
>  {
> @@ -175,7 +175,7 @@ EXPORT_SYMBOL(rpmsg_send);
>   *
>   * Can only be called from process context (for now).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
>  {
> @@ -206,7 +206,7 @@ EXPORT_SYMBOL(rpmsg_sendto);
>   *
>   * Can only be called from process context (for now).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  			  void *data, int len)
> @@ -235,7 +235,7 @@ EXPORT_SYMBOL(rpmsg_send_offchannel);
>   *
>   * Can only be called from process context (for now).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
>  {
> @@ -263,7 +263,7 @@ EXPORT_SYMBOL(rpmsg_trysend);
>   *
>   * Can only be called from process context (for now).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
>  {
> @@ -282,7 +282,7 @@ EXPORT_SYMBOL(rpmsg_trysendto);
>   * @filp:	file for poll_wait()
>   * @wait:	poll_table for poll_wait()
>   *
> - * Returns mask representing the current state of the endpoint's send buffers
> + * Return: mask representing the current state of the endpoint's send buffers
>   */
>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>  			poll_table *wait)
> @@ -313,7 +313,7 @@ EXPORT_SYMBOL(rpmsg_poll);
>   *
>   * Can only be called from process context (for now).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  			     void *data, int len)
> @@ -623,7 +623,7 @@ EXPORT_SYMBOL(rpmsg_unregister_device);
>   * @rpdrv: pointer to a struct rpmsg_driver
>   * @owner: owning module/driver
>   *
> - * Returns 0 on success, and an appropriate error value on failure.
> + * Return: 0 on success, and an appropriate error value on failure.
>   */
>  int __register_rpmsg_driver(struct rpmsg_driver *rpdrv, struct module *owner)
>  {
> @@ -637,7 +637,7 @@ EXPORT_SYMBOL(__register_rpmsg_driver);
>   * unregister_rpmsg_driver() - unregister an rpmsg driver from the rpmsg bus
>   * @rpdrv: pointer to a struct rpmsg_driver
>   *
> - * Returns 0 on success, and an appropriate error value on failure.
> + * Return: 0 on success, and an appropriate error value on failure.
>   */
>  void unregister_rpmsg_driver(struct rpmsg_driver *rpdrv)
>  {
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 9c112aa65040..c37451512835 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -547,7 +547,7 @@ static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
>   * should use the appropriate rpmsg_{try}send{to, _offchannel} API
>   * (see include/linux/rpmsg.h).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>  				     u32 src, u32 dst,
> -- 
> 2.17.1
> 
