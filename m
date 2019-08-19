Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2CC91ED4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 10:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfHSIZo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 04:25:44 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42740 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfHSIZo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 04:25:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5D5E060A44; Mon, 19 Aug 2019 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566203143;
        bh=3MIGLCqNQzxtDvy3lqyNCEPCNNhYlcANdLA6Obi7OJg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=V1oy9GwR8C3SZ1FX5zoPu6hNC9eunJH6AK1GWY9FW681ARQvEDj0c++h6GHBqdXyi
         N90NZcY2tT5lNqL7baSWRdmJEg1y/1dxpFeiA9BNifDqq9IrvqyjJ1GuyE7RbJ73R4
         NQCMu8+kujQoF/ybqclF8rrM/2FIlmmJvXFSAaxE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F4B660AA8;
        Mon, 19 Aug 2019 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566203142;
        bh=3MIGLCqNQzxtDvy3lqyNCEPCNNhYlcANdLA6Obi7OJg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QW7ThUwNhbSwIGRwMntYLklwNHP3Kauc+WWw/x3O7VKXnA8gTOq7Jvb8yPftUYjEi
         7GEpZS/3ZFtgknfbHQRMsXKyeiZ5HTQF3mjNen08cgaJDhFUYaTQIjm/LxVz2BQW4G
         8XUjKm5Ve/vECctQ8mHYWn7iVNP8cYEwL0+9UiZI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4F4B660AA8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f53.google.com with SMTP id g8so867246edm.6;
        Mon, 19 Aug 2019 01:25:42 -0700 (PDT)
X-Gm-Message-State: APjAAAVjmiyKfFdd4neCSYBams1n3l76TZHYkIjJg5a4mHzZfIwZ4vxb
        uPdBJmCvky3PgeazrlLpfI/YnQaHg64JCApMCUI=
X-Google-Smtp-Source: APXvYqxCh97JmEUeH7K6W1Q7HSEKXXrZ9y46FLd2VqVxnPaHT/6qVAMhBvz/DyAUlubXNbbUk0vNFR9vUq+2TwOOrQ8=
X-Received: by 2002:a17:906:a94d:: with SMTP id hh13mr5531528ejb.65.1566203140957;
 Mon, 19 Aug 2019 01:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190819075557.1547-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190819075557.1547-1-nishkadg.linux@gmail.com>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Mon, 19 Aug 2019 13:55:29 +0530
X-Gmail-Original-Message-ID: <CAFp+6iHJQJiNw2JKFJi7=9-Ac8nZbTPv5XGARqr9iHzcJb0yOA@mail.gmail.com>
Message-ID: <CAFp+6iHJQJiNw2JKFJi7=9-Ac8nZbTPv5XGARqr9iHzcJb0yOA@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs-qcom: Make structure ufs_hba_qcom_vops constant
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        ALIM AKHTAR <alim.akhtar@samsung.com>, avri.altman@wdc.com,
        pedrom.sousa@synopsys.com, jejb@linux.ibm.com,
        martin.peterson@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 19, 2019 at 1:26 PM Nishka Dasgupta
<nishkadg.linux@gmail.com> wrote:
>
> Static structure ufs_hba_qcom_vops, of type ufs_hba_variant_ops, is used
> only once, when it is passed as the second argument to function
> ufshcd_pltfrm_init(). In the definition of ufshcd_pltfrm_init(), its
> second parameter (corresponding to ufs_hba_qcom_vops) is declared as
> constant. Hence declare ufs_hba_qcom_vops itself constant as well to
> protect it from unintended modification.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index ee4b1da1e223..4473f339cbc0 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1551,7 +1551,7 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
>   * The variant operations configure the necessary controller and PHY
>   * handshake during initialization.
>   */
> -static struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
> +static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
>         .name                   = "qcom",
>         .init                   = ufs_qcom_init,
>         .exit                   = ufs_qcom_exit,
> --
> 2.19.1
>
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
