Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC251E17D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 00:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389491AbgEYWUD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 18:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387629AbgEYWUD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 18:20:03 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFC0C061A0E;
        Mon, 25 May 2020 15:20:03 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id r2so7375094ila.4;
        Mon, 25 May 2020 15:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cL1utEGO6TQa6zJAZV4J0dPoFxlZ5b4/euTKZrTC+g4=;
        b=rt6RhOd/SDXRzSNsrB6Ud4tpKlEEY1XuOMro77Xg33MDvOcuc7dgLi7D5PdEuZccDd
         bim1E8TXGrv9s5VjOpsoqt0AsxTKgRg0hnbmONKrPjcai2G05Hz43x5cgDEY0Hhgpy/F
         aUcMmZDZWtTpof99/fZi1OMnG3qwnfm3YKjMMhGgeHNfKm0uNYjU10uBnLjr7hAF7JuI
         f3PvdNBaTO0IzuRdqH8jQnrXKuSDl+Pbw4v+pPQmmtTgU5EK7kGPuPDnyahcUs6y5jkQ
         E+MK80vbYAiBrvYja0TBWAYmTzyUj7+ld+jfRbI5XSwQrcy1yC//ozPVtKbwgfJd1SAh
         2oSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cL1utEGO6TQa6zJAZV4J0dPoFxlZ5b4/euTKZrTC+g4=;
        b=af4ohXNjJyzLAhEjocxDeH6ZwXsqfBCtCWUR+FaDCEsKtZKjJsOEZ2QwBh3saiQ+ly
         MHyEaT+mp+s3qZY5DsxfFuGEo1JnuEEhX+iR7gvJbW3XRUsz19OT7D11FgIPXB2tUFgz
         3x9o+UcmzObcs+rl83AQYXtD1V81Gu/ICiTnQc2QLQQ2rWIYDFngp9NdBJlUOt4gOuIx
         c6gQGJVUV0wm9qt3Y/1YCQ9TvwhG3hsDprZWYy3PWl4cluZdjJUscKQdVZqdXvsdS8Id
         2L2HQPBBEQHHkBfPM2I7TsE6kfifBlBv6fzC7HRgtF4PmlRVEzMDlujGqsR+WOFwzxf3
         zRXQ==
X-Gm-Message-State: AOAM530JLM+dw8aD0a9WYS5kh7DPmFTHtyT0NB8UAm9mFtzb0fCrhd9q
        oT2VEBEIHaiMl2f2nMY/YKTDzzchkkQ72hAFQGQ=
X-Google-Smtp-Source: ABdhPJx/aS7mMnbY1KXcIxjKicYNceCG0o520JIMG+fgCY9vP5hfYtUtot/XSc/gWOTd4tUE3HobyVw+/t+HWNS5Vso=
X-Received: by 2002:a92:d449:: with SMTP id r9mr1331555ilm.166.1590445202782;
 Mon, 25 May 2020 15:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585160616.git.asutoshd@codeaurora.org> <d0c6c22455811e9f0eda01f9bc70d1398b51b2bd.1585160616.git.asutoshd@codeaurora.org>
In-Reply-To: <d0c6c22455811e9f0eda01f9bc70d1398b51b2bd.1585160616.git.asutoshd@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 25 May 2020 16:19:51 -0600
Message-ID: <CAOCk7NrrBoO2k1M7XX0W6L2+efBbo-s6WVaKZx4EtSqNpCaUyA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] scsi: ufshcd: Update the set frequency to devfreq
To:     Asutosh Das <asutoshd@codeaurora.org>
Cc:     Avri Altman <Avri.Altman@wdc.com>, Can Guo <cang@codeaurora.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, MSM <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 25, 2020 at 12:29 PM Asutosh Das <asutoshd@codeaurora.org> wrote:
>
> Currently, the frequency that devfreq provides the
> driver to set always leads the clocks to be scaled up.
> Hence, round the clock-rate to the nearest frequency
> before deciding to scale.
>
> Also update the devfreq statistics of current frequency.
>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>

This change appears to cause issues for the Lenovo Miix 630, as
identified by git bisect.

On 5.6-final, My boot log looks normal.  On 5.7-rc7, the Lenovo Miix
630 rarely boots, usually stuck in some kind of infinite printk loop.

If I disable some of the UFS logging, I can capture this from the
logs, as soon as UFS inits -

[    4.353860] ufshcd-qcom 1da4000.ufshc: ufshcd_intr: Unhandled
interrupt 0x00000000
[    4.359605] ufshcd-qcom 1da4000.ufshc: ufshcd_intr: Unhandled
interrupt 0x00000000
[    4.365412] ufshcd-qcom 1da4000.ufshc: ufshcd_check_errors:
saved_err 0x4 saved_uic_err 0x2
[    4.371121] ufshcd-qcom 1da4000.ufshc: hba->ufs_version = 0x210,
hba->capabilities = 0x1587001f
[    4.376846] ufshcd-qcom 1da4000.ufshc: hba->outstanding_reqs =
0x100000, hba->outstanding_tasks = 0x0
[    4.382636] ufshcd-qcom 1da4000.ufshc: last_hibern8_exit_tstamp at
0 us, hibern8_exit_cnt = 0
[    4.388368] ufshcd-qcom 1da4000.ufshc: No record of pa_err
[    4.394001] ufshcd-qcom 1da4000.ufshc: dl_err[0] = 0x80000001 at 3873626 us
[    4.399577] ufshcd-qcom 1da4000.ufshc: No record of nl_err
[    4.405053] ufshcd-qcom 1da4000.ufshc: No record of tl_err
[    4.410464] ufshcd-qcom 1da4000.ufshc: No record of dme_err
[    4.415747] ufshcd-qcom 1da4000.ufshc: No record of auto_hibern8_err
[    4.420950] ufshcd-qcom 1da4000.ufshc: No record of fatal_err
[    4.426013] ufshcd-qcom 1da4000.ufshc: No record of link_startup_fail
[    4.430950] ufshcd-qcom 1da4000.ufshc: No record of resume_fail
[    4.435786] ufshcd-qcom 1da4000.ufshc: No record of suspend_fail
[    4.440538] ufshcd-qcom 1da4000.ufshc: dev_reset[0] = 0x0 at 3031009 us
[    4.445199] ufshcd-qcom 1da4000.ufshc: No record of host_reset
[    4.449750] ufshcd-qcom 1da4000.ufshc: No record of task_abort
[    4.454214] ufshcd-qcom 1da4000.ufshc: clk: core_clk, rate: 50000000
[    4.458590] ufshcd-qcom 1da4000.ufshc: clk: core_clk_unipro, rate: 37500000

I don't understand how this change is breaking things, but it clearly is for me.

What kind of additional data would be useful to get to the bottom of this?
