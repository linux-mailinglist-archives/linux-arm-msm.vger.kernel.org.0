Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01DB3F0546
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 19:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390646AbfKESoM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 13:44:12 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46444 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390432AbfKESoM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 13:44:12 -0500
Received: by mail-pl1-f196.google.com with SMTP id l4so4670851plt.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2019 10:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Qih/alkmIQbfF3MY5qtSQFmZNoWqlS/zxFnHUyH1R38=;
        b=aSnTg9KHEMB49AxbsfwaAz90kx72tV9XpVZf1DCYtUItEXCJcShFRUVYe8/jfcE70C
         fGilYsFMnICncY1ka6ITmZXvvljgCa9MPJrZHnKzou4r6lD2kl1np+KosoU7P08tXIJA
         4uopLlBFncqBQ7w1dSeAkq/yiydRQSSTBLdwOHIk6HC3QR4rB5Nt5jRhy1AVLlMZ0tKt
         nKafeDwb0sh6ORPsClkqYrkSR7CtoM1wCptaYtlnwmZlYmEVX5Q7G0ic6R8gvBUXrZBl
         mApaq6akcvbrAsOTtoZWo+NYl3/k72TJBI8oqYwFqrGYCyrUfdQYOZeEz/TuQljKB82S
         erFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Qih/alkmIQbfF3MY5qtSQFmZNoWqlS/zxFnHUyH1R38=;
        b=p80T9eV4lRyfac9pTFRlEVJURblYcAgUzkeo/g8LM04Z520od8qqFWkfpbleWfDFD0
         LXdcBmEYHSr7KZtm6kqOLBA3xLZCwcd+fppkXUBnNjPdnmy9UC+2sx3eWx+iWFDmVMaP
         iDdYA0IdlxYRW2BT9MFFOAs82DADxw/+8Lc3te7qdgl5EpiAO9YUKhfdnlrOkqGMKYFe
         mbmW7zQ8RkTNsM4vbH7zy9YYzUZejHUs/w4DYecn7b4bobnwZdOAT0xOlJBjm4jSAq2e
         MJDoCd+h7Nrl6cu05qXp4SFgrL5FlGA3ekMOEpjs+ahjZfjJJAlZKh0KDKK3wzH7pIEw
         Zybg==
X-Gm-Message-State: APjAAAU94bSp6AqeA0iVwhx1K0gqYfYqTZTJm/t4J+jhJ0dliliCVb66
        IwDVyXWqOo9ZWTKsyNCLwIjxLA==
X-Google-Smtp-Source: APXvYqxSuxMrsqDhwIi6laAe2V358hbO8Mf5HSGwYgv9fa5ZiFoJA9Fqc+OE9ZGQSTS0VJdq29PhVA==
X-Received: by 2002:a17:902:b60f:: with SMTP id b15mr35138746pls.68.1572979451125;
        Tue, 05 Nov 2019 10:44:11 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s24sm21442801pfm.144.2019.11.05.10.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 10:44:10 -0800 (PST)
Date:   Tue, 5 Nov 2019 10:44:07 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        tientzu@chromium.org, seanpaul@chromium.org
Subject: Re: [PATCH v1 2/2] Bluetooth: hci_qca: Add support for Qualcomm
 Bluetooth SoC WCN3991
Message-ID: <20191105184407.GA1852@minitux>
References: <20191105144508.22989-1-bgodavar@codeaurora.org>
 <20191105144508.22989-3-bgodavar@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105144508.22989-3-bgodavar@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Nov 06:45 PST 2019, Balakrishna Godavarthi wrote:

> This patch add support for WCN3991 i.e. current values and fw download
> support.
> 
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> ---
>  drivers/bluetooth/btqca.c   | 68 +++++++++++++++++++++++++++++--------
>  drivers/bluetooth/btqca.h   | 10 ++++--
>  drivers/bluetooth/hci_qca.c | 16 +++++++--
>  3 files changed, 74 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
[..]
> @@ -48,13 +62,16 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version)
>  	}
>  
>  	if (edl->cresp != EDL_CMD_REQ_RES_EVT ||
> -	    edl->rtype != EDL_APP_VER_RES_EVT) {
> +	    edl->rtype != rtype) {
>  		bt_dev_err(hdev, "QCA Wrong packet received %d %d", edl->cresp,
>  			   edl->rtype);
>  		err = -EIO;
>  		goto out;
>  	}
>  
> +	if (soc_type == QCA_WCN3991)
> +		memcpy(&edl->data, &edl->data[1], sizeof(*ver));

memcpy() shouldn't be used when the two memory regions are overlapping,
use memmove() for this.

[..]
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index 7f7a2b2c0df6..309a720ff216 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -126,6 +126,7 @@ enum qca_btsoc_type {
>  	QCA_ROME,
>  	QCA_WCN3990,
>  	QCA_WCN3998,
> +	QCA_WCN3991,

Please maintain sort order.

[..]
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
[..]
> @@ -1663,6 +1674,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
>  	{ .compatible = "qcom,qca6174-bt" },
>  	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
>  	{ .compatible = "qcom,wcn3998-bt", .data = &qca_soc_data_wcn3998},
> +	{ .compatible = "qcom,wcn3991-bt", .data = &qca_soc_data_wcn3991},

Ditto

Regards,
Bjorn
