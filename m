Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB84EB812
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 20:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbfJaTl5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 15:41:57 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39393 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbfJaTl5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 15:41:57 -0400
Received: by mail-pg1-f196.google.com with SMTP id p12so4723402pgn.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 12:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AhjfIod7SQCQHZV7lhiJk5rEvnUEd1LmAIrAKGF1ifE=;
        b=pvebIAAjYa8iAiEqMGvnxsLMzzKlHrpnTijyHM1zSWRukHFcMWhu9kJKOf7iO7IpjO
         JsP1kiL28p94Xdd+8mAO9XFhZppUptWaO5yzT+CBfUUZfVSBZTBjM9CkPGu1NtSirEVO
         rTqo9TbFRBm4EAEMLIdIMYi5ztPjt8y4Tpg8hxjZi5TUcoGne0v5dR6ThE4AqEUvn86k
         V92bCCXeiV/EIcdvvjeoBAto0pNnZfqWcwgTeXAgJrofROuY3ynjYOPLoA7ioxSeyHYW
         hV54DTHeyLkfyGQJpTeDHLBtWTY+XdwCQr8ujU4oRHFzqyAs0Jc7TxKdzuCEvmsG3gLE
         LJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AhjfIod7SQCQHZV7lhiJk5rEvnUEd1LmAIrAKGF1ifE=;
        b=nUVDjAYLHfA+suM6330Op/Jlg3M+SQaYXvC08Fjuh534OpgfePN3iS8nh3FxMFy2/3
         Ipzo+nDTYlKwRi4AlmJz2bcHVv9uprnyypcE4sBZCCTUX2ERTFEl1MPAWo3nc6c3S3iZ
         0Co28Ctx3An/xTxjJ8JRGydDCna2c/hIznBkglM4dOCzjz7XUjzjfb+Be8s4gFJrPW/h
         ueB6QcDoS/jGfo/EgANKD2nyLGrbH1eWwEEfFdim/JG5wXPLJ7EjM1I5IWXJmcsWZ2Wg
         GWpaL7f0a8C/qGzMx7ap4uyDDlRMX5JEFsnDplohw8W66xoSh1kKG1TQoDBn/Q22qH3K
         U0ew==
X-Gm-Message-State: APjAAAVn2Bm3Xoc8P9Fnmfu9GOkTReicglEJyf7eNK0+oMGj8sU3tk4J
        cHiXTqF7nzLw3Tz8nG2NRd/OFQ==
X-Google-Smtp-Source: APXvYqzwSncZfbsCu8/7tq36MfxWW3WNUjm6V4/NRyM4kpZCJyiBSQ0YTBUq8dOGWtkNqtMIporK2w==
X-Received: by 2002:a63:4501:: with SMTP id s1mr8655227pga.5.1572550916256;
        Thu, 31 Oct 2019 12:41:56 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t9sm7460172pjq.21.2019.10.31.12.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 12:41:55 -0700 (PDT)
Date:   Thu, 31 Oct 2019 12:41:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Validate each segment
 during loading
Message-ID: <20191031194153.GN1929@tuxbook-pro>
References: <20191031184632.2938295-1-bjorn.andersson@linaro.org>
 <20191031184632.2938295-3-bjorn.andersson@linaro.org>
 <CAOCk7Nr+nsfvaLbPK9q_Uyhy5s=Nx9A8w-HPtVmBPpfVNMhTJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7Nr+nsfvaLbPK9q_Uyhy5s=Nx9A8w-HPtVmBPpfVNMhTJQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 31 Oct 12:13 PDT 2019, Jeffrey Hugo wrote:

> On Thu, Oct 31, 2019 at 12:48 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > The code used to sync with the MBA after each segment loaded and this is
> > still what's done downstream. So reduce the delta towards downstream by
> > switching to a model where the content is iteratively validated.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/remoteproc/qcom_q6v5_mss.c | 74 ++++++++++++++++++++----------
> >  1 file changed, 50 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> > index f4a02105d539..bdf1dd00b89b 100644
> > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > @@ -358,23 +358,29 @@ static void q6v5_pds_disable(struct q6v5 *qproc, struct device **pds,
> >  }
> >
> >  static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
> > -                                  bool remote_owner, phys_addr_t addr,
> > +                                  bool local, bool remote, phys_addr_t addr,
> >                                    size_t size)
> >  {
> > -       struct qcom_scm_vmperm next;
> > +       struct qcom_scm_vmperm next[2];
> > +       int perms = 0;
> >
> >         if (!qproc->need_mem_protection)
> >                 return 0;
> > -       if (remote_owner && *current_perm == BIT(QCOM_SCM_VMID_MSS_MSA))
> > -               return 0;
> > -       if (!remote_owner && *current_perm == BIT(QCOM_SCM_VMID_HLOS))
> > -               return 0;
> >
> > -       next.vmid = remote_owner ? QCOM_SCM_VMID_MSS_MSA : QCOM_SCM_VMID_HLOS;
> > -       next.perm = remote_owner ? QCOM_SCM_PERM_RW : QCOM_SCM_PERM_RWX;
> > +       if (local) {
> > +               next[perms].vmid = QCOM_SCM_VMID_HLOS;
> > +               next[perms].perm = QCOM_SCM_PERM_RWX;
> 
> So, does this need to be tristate?  Downstream makes the HLOS perms
> RWX only when HLOS is the sole owner.  HLOS has RW perms when it
> shares ownership with the remote (modem).
> 

I've not seen any issues with retaining the X in my testing so far, and
it does make the code cleaner.

> > +               perms++;
> > +       }
> > +
> > +       if (remote) {
> > +               next[perms].vmid = QCOM_SCM_VMID_MSS_MSA;
> > +               next[perms].perm = QCOM_SCM_PERM_RW;
> > +               perms++;
> > +       }
> >
> >         return qcom_scm_assign_mem(addr, ALIGN(size, SZ_4K),
> > -                                  current_perm, &next, 1);
> > +                                  current_perm, next, perms);
> >  }
> >
> >  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
> > @@ -681,7 +687,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
> >
> >         /* Hypervisor mapping to access metadata by modem */
> >         mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
> > -       ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, phys, size);
> > +       ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, true, phys, size);
> >         if (ret) {
> >                 dev_err(qproc->dev,
> >                         "assigning Q6 access to metadata failed: %d\n", ret);
> > @@ -699,7 +705,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
> >                 dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
> >
> >         /* Metadata authentication done, remove modem access */
> > -       xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, phys, size);
> > +       xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, false, phys, size);
> >         if (xferop_ret)
> >                 dev_warn(qproc->dev,
> >                          "mdt buffer not reclaimed system may become unstable\n");
> > @@ -786,7 +792,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
> >         }
> >
> >         /* Assign MBA image access in DDR to q6 */
> > -       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
> > +       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false, true,
> >                                       qproc->mba_phys, qproc->mba_size);
> >         if (ret) {
> >                 dev_err(qproc->dev,
> > @@ -820,8 +826,8 @@ static int q6v5_mba_load(struct q6v5 *qproc)
> >         q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
> >
> >  reclaim_mba:
> > -       xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
> > -                                               qproc->mba_phys,
> > +       xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
> > +                                               false, qproc->mba_phys,
> >                                                 qproc->mba_size);
> >         if (xfermemop_ret) {
> >                 dev_err(qproc->dev,
> > @@ -888,7 +894,7 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
> >         /* In case of failure or coredump scenario where reclaiming MBA memory
> >          * could not happen reclaim it here.
> >          */
> > -       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
> > +       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true, false,
> >                                       qproc->mba_phys,
> >                                       qproc->mba_size);
> >         WARN_ON(ret);
> > @@ -915,6 +921,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
> >         phys_addr_t boot_addr;
> >         phys_addr_t min_addr = PHYS_ADDR_MAX;
> >         phys_addr_t max_addr = 0;
> > +       u32 code_length;
> >         bool relocate = false;
> >         char *fw_name;
> >         size_t fw_name_len;
> > @@ -965,9 +972,19 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
> >         }
> >
> >         /* Try to reset ownership back to Linux */
> > -       q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false,
> > +       q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, false,
> >                                 qproc->mpss_phys, qproc->mpss_size);
> >
> > +       /* Share ownership between Linux and MSS, during segment loading */
> > +       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, true,
> > +                                     qproc->mpss_phys, qproc->mpss_size);
> > +       if (ret) {
> > +               dev_err(qproc->dev,
> > +                       "assigning Q6 access to mpss memory failed: %d\n", ret);
> > +               ret = -EAGAIN;
> > +               goto release_firmware;
> > +       }
> > +
> >         mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
> >         qproc->mpss_reloc = mpss_reloc;
> >         /* Load firmware segments */
> > @@ -1016,10 +1033,24 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
> >                                phdr->p_memsz - phdr->p_filesz);
> >                 }
> >                 size += phdr->p_memsz;
> > +
> > +               code_length = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> > +               if (!code_length) {
> > +                       boot_addr = relocate ? qproc->mpss_phys : min_addr;
> > +                       writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
> > +                       writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
> > +               }
> > +               writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> 
> Should there be an explicit wmb() here since presumably this write
> needs to be flushed out before we do the following readl?
> 

Doesn't the readl of an adjacent register wait for the write to hit the
hardware before returning its value?

> > +               ret = readl(qproc->rmb_base + RMB_MBA_STATUS_REG);
> 
> Is this status reg immediately updated when RMB_PMI_CODE_LENGTH_REG is
> updated?  I would expect that the MBA may need some time to update
> this reg, thus there is an implicit race here.
> 

I don't see any waiting going on downstream and afaict there wouldn't be
any harm in not waiting for the status register to go negative, as
issues will either be caught on the next iteration or when we're
checking the final status.

Presumably though there could be an issue if this somehow depended on us
not loading the next chunk until this has "stabilized".

But afaict, this is how downstream does it...

Regards,
Bjorn

> > +               if (ret < 0) {
> > +                       dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
> > +                       goto release_firmware;
> > +               }
> >         }
> >
> >         /* Transfer ownership of modem ddr region to q6 */
> > -       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true,
> > +       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false, true,
> >                                       qproc->mpss_phys, qproc->mpss_size);
> >         if (ret) {
> >                 dev_err(qproc->dev,
> > @@ -1028,11 +1059,6 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
> >                 goto release_firmware;
> >         }
> >
> > -       boot_addr = relocate ? qproc->mpss_phys : min_addr;
> > -       writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
> > -       writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
> > -       writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> > -
> >         ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
> >         if (ret == -ETIMEDOUT)
> >                 dev_err(qproc->dev, "MPSS authentication timed out\n");
> > @@ -1096,8 +1122,8 @@ static int q6v5_start(struct rproc *rproc)
> >                 goto reclaim_mpss;
> >         }
> >
> > -       xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
> > -                                               qproc->mba_phys,
> > +       xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
> > +                                               false, qproc->mba_phys,
> >                                                 qproc->mba_size);
> >         if (xfermemop_ret)
> >                 dev_err(qproc->dev,
> > --
> > 2.23.0
> >
