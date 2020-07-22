Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCB3229A3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 16:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732555AbgGVOhb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 10:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728837AbgGVOhb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 10:37:31 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533E3C0619DC;
        Wed, 22 Jul 2020 07:37:31 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id e18so1472600ilr.7;
        Wed, 22 Jul 2020 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uum90XmfNycK6jDJoE+OLFnrkzTNxS7+iW+O9eCiWeM=;
        b=lEdN6208f44Sn6ODIAJK83c4RYAShaqQuCEZ4xGt6JSzk6lgHXBHLoYTeHSHu5T3mu
         iDE2UKBY6Md1ouGeE6xaBR8N4KmfptqJyLR2vFxJKw50KKKfVaW3hCr88TclQ+u4OnX1
         xlndCgxHBrAXcKc562ZmvCtgfx2EPhdcIRtAl6Ktxoc1baOlmVBB+wWPbH8FfO3+UIcQ
         LQWse1rBe0wLvcn7Ug6YjXGpY7jkMyzccvf4oJc1NdBjKVOQqhVUd4NIqcZJHrHqiN7Z
         HWg2zYoJIPdx3qP8F2nmWT/0z5Oy/vkcm++uw01yXot3zRdg7tlC3NjiAnvqVS2HoSgj
         IXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uum90XmfNycK6jDJoE+OLFnrkzTNxS7+iW+O9eCiWeM=;
        b=WFvRrhyl3thWBNU5wBnn7I79TdVN4ayRbwx+Pk8dS/DPk3QcfJtGnYdOhnepwjgcIU
         JEz3Ou3VtojzBrLxLKG2BQM4vD5NW/WB2/j+TnRVlp9BNgfSd+gOmEl7HGyKunc/tWKi
         AuXhp2jigz0UziFx1eJGHYWDoiDb9DX2y7zzwnAcC7h8kAOZHtIO4GXDw1J9kE9tYOW1
         MYzemkeFeKL2o2B/LmfleSHCm54sw686b3hgt83SadSMRX07STRKG+4haKNiKbAelMJ9
         3LEI/sNBJNBmPVv1E7vDg9nHhEM2V3qIiOmeZ4GLZSHM1dFYuRym38mOIEHmHl1ZOMRL
         bRRQ==
X-Gm-Message-State: AOAM533xgeyfIu6oaug4vLl/XqpBnF85DEX0Rgi/ED1RhiqoQqrFGyHa
        AuoRzqDUuKNnlP+PW9jJsaMvAZ63vZTK4p9a62g=
X-Google-Smtp-Source: ABdhPJwpE8HkCfsDSkfAjPnUVeuc7tn6xF0l2+UATzJPcOG6uy+pfG1LTgzeK0upHl081OQGfXfTFHXcgwkpU2B4WIc=
X-Received: by 2002:a05:6e02:80b:: with SMTP id u11mr226641ilm.178.1595428650674;
 Wed, 22 Jul 2020 07:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <1595226956-7779-1-git-send-email-cang@codeaurora.org> <1595226956-7779-4-git-send-email-cang@codeaurora.org>
In-Reply-To: <1595226956-7779-4-git-send-email-cang@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 22 Jul 2020 08:37:19 -0600
Message-ID: <CAOCk7NpLLV8yoWsrFKJ+OirGcQjeP4NmFYnMfXj-9=sMt7E94Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] ufs: ufs-qcom: Fix a few BUGs in func ufs_qcom_dump_dbg_regs()
To:     Can Guo <cang@codeaurora.org>
Cc:     Asutosh Das <asutoshd@codeaurora.org>, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        sh425.lee@samsung.com, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com,
        Mark Salyzyn <salyzyn@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 20, 2020 at 12:39 AM Can Guo <cang@codeaurora.org> wrote:
>
> Dumping testbus registers needs to sleep a bit intermittently as there are
> too many of them. Skip them for those contexts where sleep is not allowed.
>
> Meanwhile, if ufs_qcom_dump_dbg_regs() calls ufs_qcom_testbus_config() from
> ufshcd_suspend/resume and/or clk gate/ungate context, pm_runtime_get_sync()
> and ufshcd_hold() will cause racing problems. Fix it by removing the
> unnecessary calls of pm_runtime_get_sync() and ufshcd_hold().

It sounds like this is two different changes which are clubbed
together into the same patch and really should be two different
patches.

>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 2e6ddb5..3743c17 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1604,9 +1604,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
>          */
>         }
>         mask <<= offset;
> -
> -       pm_runtime_get_sync(host->hba->dev);
> -       ufshcd_hold(host->hba, false);
>         ufshcd_rmwl(host->hba, TEST_BUS_SEL,
>                     (u32)host->testbus.select_major << 19,
>                     REG_UFS_CFG1);
> @@ -1619,8 +1616,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
>          * committed before returning.
>          */
>         mb();
> -       ufshcd_release(host->hba);
> -       pm_runtime_put_sync(host->hba->dev);
>
>         return 0;
>  }
> @@ -1658,11 +1653,13 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
>
>         /* sleep a bit intermittently as we are dumping too much data */
>         ufs_qcom_print_hw_debug_reg_all(hba, NULL, ufs_qcom_dump_regs_wrapper);
> -       udelay(1000);
> -       ufs_qcom_testbus_read(hba);
> -       udelay(1000);
> -       ufs_qcom_print_unipro_testbus(hba);
> -       udelay(1000);
> +       if (in_task()) {
> +               udelay(1000);
> +               ufs_qcom_testbus_read(hba);
> +               udelay(1000);
> +               ufs_qcom_print_unipro_testbus(hba);
> +               udelay(1000);
> +       }

Did you run into a specific issue with this?  udelay is not a "sleep"
in the sense that it causes scheduling to occur, which is the problem
with atomic contexts.
