Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADFB7B5A1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 20:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238756AbjJBSS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 14:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238745AbjJBSSz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 14:18:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2488AA9
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696270686;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JTHelUlse8IqAMEkn3+OwaSpVuDEvR+XOh2gu1M9D5c=;
        b=NAE03PTak9OCw/qUqieFOvDzGxQLGcSqI08e7sucC8ApT6jjSkYWCta3KEDuyTCSUTS/yb
        K0wp5OS0n7lHA0csJ2BLHtPPhNCy2g3amORZzr/J7AUXGSxOINDKaZrgIN5t6sEcd4mwns
        zVMsk+fNMEwUa5I/X9FwsK7iCj4rKro=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-nlPig_G1PL6ZOBaxA6FkTA-1; Mon, 02 Oct 2023 14:18:05 -0400
X-MC-Unique: nlPig_G1PL6ZOBaxA6FkTA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-774294bde69so901585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 11:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696270684; x=1696875484;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTHelUlse8IqAMEkn3+OwaSpVuDEvR+XOh2gu1M9D5c=;
        b=fjOOAAytSNIDkGBBe1P6zuamqx0E9yU7cHPY6U/H2P8eNouKfCyeisLDz0shXbf79y
         qfqrrgJlixY7Fi/avy+dtaIS6OdQM2RyyesLhTytW3jn3r4a/LJz653tR+Yua0EOxmzS
         dnhkbd4UAL90WFy3euUmp3/jp0y324z7QaU/BmB5upa1BkryyUAUK7dsUPHLQnP23or0
         d9aVppXC+HeQhSdtMWsgDrVi4ad1kGBILljs4znoOP5kpdc/ZBQ2K3WDyCZqqCDI89fi
         vV6L/0BBEJ5YbybZz+dWPHJE7tok/tTqa2I5cHc8sNGRd8EbPXMZUsU3qJPglD4s49QW
         kzRg==
X-Gm-Message-State: AOJu0Yxz2m2hDxLr/EoFi+lSv9bl+KGBj9CqS2/UMjEQPD+1d1rnKJyf
        u1M+0/co4QmSZYTRCSLpk9Zn5vkxxkRfqCGhAKSwHuaB1wCN4QU9P6YnIhOUjAXpIjg2LIG1B9k
        subAKLZ7fYbr0PhjV4b2ET8UwuXjs6prTIg==
X-Received: by 2002:a05:620a:4090:b0:76c:ae1f:201e with SMTP id f16-20020a05620a409000b0076cae1f201emr539274qko.27.1696270684166;
        Mon, 02 Oct 2023 11:18:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjEc7izGr0GyD8cKh/uiIXCkEVxKgvtniJXa7m5bt13+TPqrNIMC8w/At/Vr4WizGwvTagDA==
X-Received: by 2002:a05:620a:4090:b0:76c:ae1f:201e with SMTP id f16-20020a05620a409000b0076cae1f201emr539250qko.27.1696270683850;
        Mon, 02 Oct 2023 11:18:03 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id ld7-20020a056214418700b0065d89f4d537sm3313105qvb.45.2023.10.02.11.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 11:18:02 -0700 (PDT)
Date:   Mon, 2 Oct 2023 14:18:01 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Nikunj Kela <quic_nkela@quicinc.com>
Cc:     sudeep.holla@arm.com, cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/4] firmware: arm_scmi: Add polling support for
 completion in smc
Message-ID: <ZRsJWdZVMc+F5ZgF@brian-x1>
References: <20230718160833.36397-1-quic_nkela@quicinc.com>
 <20230911194359.27547-1-quic_nkela@quicinc.com>
 <20230911194359.27547-2-quic_nkela@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911194359.27547-2-quic_nkela@quicinc.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 11, 2023 at 12:43:56PM -0700, Nikunj Kela wrote:
> Currently, the return from the smc call assumes the completion of
> the scmi request. However this may not be true in virtual platforms
> that are using hvc doorbell.
> 
> This change adds a Kconfig to enable the polling for the request
> completion.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  drivers/firmware/arm_scmi/Kconfig | 14 ++++++++++++++
>  drivers/firmware/arm_scmi/smc.c   | 15 ++++++++++++++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
> index ea0f5083ac47..771d60f8319f 100644
> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/arm_scmi/Kconfig
> @@ -125,6 +125,20 @@ config ARM_SCMI_TRANSPORT_SMC_ATOMIC_ENABLE
>  	  in atomic context too, at the price of using a number of busy-waiting
>  	  primitives all over instead. If unsure say N.
>  
> +config ARM_SCMI_TRANSPORT_SMC_POLL_COMPLETION
> +	bool "Enable polling support for SCMI SMC transport"
> +	depends on ARM_SCMI_TRANSPORT_SMC
> +	help
> +	  Enable completion polling support for SCMI SMC based transport.
> +
> +	  If you want the SCMI SMC based transport to poll for the completion,
> +	  answer Y.
> +	  Enabling completion polling might be desired in the absence of the a2p
> +	  irq when the return from smc/hvc call doesn't indicate the completion
> +	  of the SCMI requests. This might be useful for instances used in
> +	  virtual platforms.
> +	  If unsure say N.
> +
>  config ARM_SCMI_TRANSPORT_VIRTIO
>  	bool "SCMI transport based on VirtIO"
>  	depends on VIRTIO=y || VIRTIO=ARM_SCMI_PROTOCOL
> diff --git a/drivers/firmware/arm_scmi/smc.c b/drivers/firmware/arm_scmi/smc.c
> index c193516a254d..0a0b7e401159 100644
> --- a/drivers/firmware/arm_scmi/smc.c
> +++ b/drivers/firmware/arm_scmi/smc.c
> @@ -250,6 +250,16 @@ static void smc_mark_txdone(struct scmi_chan_info *cinfo, int ret,
>  	smc_channel_lock_release(scmi_info);
>  }
>  
> +#ifdef CONFIG_ARM_SCMI_TRANSPORT_SMC_POLL_COMPLETION
> +static bool
> +smc_poll_done(struct scmi_chan_info *cinfo, struct scmi_xfer *xfer)
> +{
> +	struct scmi_smc *scmi_info = cinfo->transport_info;
> +
> +	return shmem_poll_done(scmi_info->shmem, xfer);
> +}
> +#endif
> +
>  static const struct scmi_transport_ops scmi_smc_ops = {
>  	.chan_available = smc_chan_available,
>  	.chan_setup = smc_chan_setup,
> @@ -257,6 +267,9 @@ static const struct scmi_transport_ops scmi_smc_ops = {
>  	.send_message = smc_send_message,
>  	.mark_txdone = smc_mark_txdone,
>  	.fetch_response = smc_fetch_response,
> +#ifdef CONFIG_ARM_SCMI_TRANSPORT_SMC_POLL_COMPLETION
> +	.poll_done = smc_poll_done,
> +#endif
>  };
>  
>  const struct scmi_desc scmi_smc_desc = {
> @@ -272,6 +285,6 @@ const struct scmi_desc scmi_smc_desc = {
>  	 * for the issued command will be immmediately ready to be fetched
>  	 * from the shared memory area.
>  	 */
> -	.sync_cmds_completed_on_ret = true,
> +	.sync_cmds_completed_on_ret = !IS_ENABLED(CONFIG_ARM_SCMI_TRANSPORT_SMC_POLL_COMPLETION),
>  	.atomic_enabled = IS_ENABLED(CONFIG_ARM_SCMI_TRANSPORT_SMC_ATOMIC_ENABLE),

From a Linux distributor viewpoint, it would be nice if this was
determined at runtime, rather than at compile time. We generate a single
kernel binary that's used on systems from multiple hardware
manufacturers. We'd run into an issue if one company required this, but
another one didn't. We may potentially run into this same type of issue
with the upstream arm64 defconfig.

Brian

