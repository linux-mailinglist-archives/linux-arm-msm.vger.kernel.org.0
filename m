Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8503485A95
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 08:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731048AbfHHGWK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 02:22:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52888 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731005AbfHHGWK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 02:22:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2E7F360F3F; Thu,  8 Aug 2019 06:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565245329;
        bh=4pBxI6elRBFgUqs9QtZ2BrzwtFoiLq+EgNn9JyVFTdg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QJv7j/CmM6K1w/P4+F6rMK1sLzfoURWG25MkCrrkP4wOU5xoX7T430bBkyPBTDLIM
         b3Evq9eJo8DjIqk3E+FckdtqqIb9CObEtEgY9qAgzAaL2p9WmleY1ft0Qufm1UIF00
         pjUR6VKFGqOGXMBg3vPvEe6y6xDe/AzrwaPVUIzU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 69D84607DE;
        Thu,  8 Aug 2019 06:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565245327;
        bh=4pBxI6elRBFgUqs9QtZ2BrzwtFoiLq+EgNn9JyVFTdg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SKhD/1zEGNIFgmrHjqdBC07zFiB8beHvAz9UgzuUP7tbCYMEdpQ8H1AZjRX51EX80
         VZrmgDXkHCVSWjIlulU1Nm5wAPS8UsnWkFq63tBoT9NebQT3jCCeWt3USf9JiwHj9z
         gYY+XUHvf6bXpC+w108EPVYxiUEe/Fd0wMJLxFaI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 08 Aug 2019 14:22:07 +0800
From:   Rocky Liao <rjliao@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, mka@chromium.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, c_hbandi@codeaurora.org
Subject: Re: [PATCH v1] Bluetooth: btqca: Reset download type to default
In-Reply-To: <20190808060737.3506-1-bgodavar@codeaurora.org>
References: <20190808060737.3506-1-bgodavar@codeaurora.org>
Message-ID: <24fa28207ec5426487600736e91d199c@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Reviewed-by: Rocky Liao <rjliao@codeaurora.org>
