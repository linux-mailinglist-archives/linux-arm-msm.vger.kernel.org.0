Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 531A385A81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 08:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbfHHGVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 02:21:06 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50918 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfHHGVG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 02:21:06 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0C13F6030B; Thu,  8 Aug 2019 06:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565245265;
        bh=WOVzriFtN86Utn04VUsys6K9j6mbDVjJ+0hWIUTdGQY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dgNyQl5yhuQrITTZ2opDkozCa8gs2nO5vLKhQutadaB1bipxxn2Yv8lErqtBA4BDv
         3I4kNLauT5V0LZXM8Qn6BIVrxR9GFqpiKeLtA1UfxaVIajtqo6u5NhKtvdIdUu7gr7
         ID3vEx4VV+NRb56EngueLWSIXkG3TvFOcKBVb1uU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 1141F601F6;
        Thu,  8 Aug 2019 06:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565245264;
        bh=WOVzriFtN86Utn04VUsys6K9j6mbDVjJ+0hWIUTdGQY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CU7Rf5sX9oINsGgXAtQajjlRknYdHrvfrj5+oZqRJbVEVMalGD9ueViK3CNjzx8QM
         x+Fi+7w6x3oxYgoLcuGElSZxHsF2GFQpTjaKw9rx/ymJYxfBwVE7aWc+UEbQZHYPth
         5kAYhxP1+Vu1PJB90eglrzVoQLzCveY/M9O8rOJg=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 08 Aug 2019 14:21:03 +0800
From:   Rocky Liao <rjliao@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, mka@chromium.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, c_hbandi@codeaurora.org,
        tientzu@chromium.org
Subject: Re: [PATCH v1] Bluetooth: btqca: Reset download type to default
In-Reply-To: <20190808060737.3506-1-bgodavar@codeaurora.org>
References: <20190808060737.3506-1-bgodavar@codeaurora.org>
Message-ID: <56fe734d517399c6509f6e9c45f9b096@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+Claire

On 2019-08-08 14:07, Balakrishna Godavarthi wrote:
> This patch will reset the download flag to default value
> before retrieving the download mode type.
> 
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> ---
>  drivers/bluetooth/btqca.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 2221935fac7e..9fb247c10855 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -140,6 +140,7 @@ static void qca_tlv_check_data(struct rome_config 
> *config,
>  	BT_DBG("Length\t\t : %d bytes", length);
> 
>  	config->dnld_mode = ROME_SKIP_EVT_NONE;
> +	config->dnld_type = ROME_SKIP_EVT_NONE;
> 
>  	switch (config->type) {
>  	case TLV_TYPE_PATCH:

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
