Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6657BEB7D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 20:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729509AbfJaTNi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 15:13:38 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33540 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbfJaTNi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 15:13:38 -0400
Received: by mail-io1-f68.google.com with SMTP id n17so8032244ioa.0;
        Thu, 31 Oct 2019 12:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5qcbevFIs2aYQ2grseLiSq4gaoOdVmWtBf+FnqFDu18=;
        b=dNPAP+lKDMBfFTAOu3FiyCc+LPMP7bTUUOMve/qOMH1/n0L9Lce/AQvMIoEMY9bClQ
         zY8O53xKkYqzzIXG9MZHxMrEegAqubVvDxtofty5iOTs2GkIB61ibV2aC+S5hI97dNkI
         XCF0WM0LPG8tCHQItkqxBl+tzL8hriTif+rmdr8oL3qAWXxLV2iiSc4qaMkWdzGG0Qun
         TjropKHsiT+XDxlyDsBqOzqPChunVK4nIXU+EScoDAY/v2/IhGjfCkESsUnP47Gurd9B
         En1hibSCbaGiHZ2x+EHfxY33Fx5Ob2cNUJKhivKOg1NcJv6cvS6Kn/C7herMvzPvcG3/
         x9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5qcbevFIs2aYQ2grseLiSq4gaoOdVmWtBf+FnqFDu18=;
        b=b4jLDWZ/n3FPSt8FUru+hW0WXX87gIMMgaWy2Yx/VH5pOC7I0ibbXg1iJ5DTICspSl
         kIKl3XhW2rXIEXo9bLBqh3KRzDeEgMLT4p96NvfOhE/ZhDZAR7GY7LMYZNHMJ1TuHAoY
         oPTyeS+IOTAWXdwGNE3Z7Jn9g92PmRgvI12QL3ASn0Z5vXCoAX22SlNc3eaJnxUNqjPb
         Qj6YN36dYXPgQw2L8G7gdzh4PPMrdOauQbgo8M/8tN5LTBtaQYm843SxUtjc4KINQb+S
         ieeFIpYp3LOdQ8C4phwJTSZWR++0o2pTvYhA9eRbFpSSha9CLdlWr8PyTKxmlJmv2d0t
         cpTA==
X-Gm-Message-State: APjAAAWsB0AJ9zxsxwJxTQnSwT4bjO2PD1N/mMuJ3VSBXPZL9xZxt9jr
        4KYkQvTmBDu01c4jUZZfDcLTEzdYmQcwHB5M5E8=
X-Google-Smtp-Source: APXvYqwTphWgs+ycW1dBSjImY9hyMY/d77yCw21tUcfbBKo30qv0IQur7GF19IdAdhuuLLJatzxI3xYle0+mkIGhHIU=
X-Received: by 2002:a5d:91d2:: with SMTP id k18mr6617936ior.178.1572549217261;
 Thu, 31 Oct 2019 12:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191031184632.2938295-1-bjorn.andersson@linaro.org> <20191031184632.2938295-3-bjorn.andersson@linaro.org>
In-Reply-To: <20191031184632.2938295-3-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 31 Oct 2019 13:13:26 -0600
Message-ID: <CAOCk7Nr+nsfvaLbPK9q_Uyhy5s=Nx9A8w-HPtVmBPpfVNMhTJQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Validate each segment
 during loading
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 31, 2019 at 12:48 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The code used to sync with the MBA after each segment loaded and this is
> still what's done downstream. So reduce the delta towards downstream by
> switching to a model where the content is iteratively validated.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 74 ++++++++++++++++++++----------
>  1 file changed, 50 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index f4a02105d539..bdf1dd00b89b 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -358,23 +358,29 @@ static void q6v5_pds_disable(struct q6v5 *qproc, struct device **pds,
>  }
>
>  static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
> -                                  bool remote_owner, phys_addr_t addr,
> +                                  bool local, bool remote, phys_addr_t addr,
>                                    size_t size)
>  {
> -       struct qcom_scm_vmperm next;
> +       struct qcom_scm_vmperm next[2];
> +       int perms = 0;
>
>         if (!qproc->need_mem_protection)
>                 return 0;
> -       if (remote_owner && *current_perm == BIT(QCOM_SCM_VMID_MSS_MSA))
> -               return 0;
> -       if (!remote_owner && *current_perm == BIT(QCOM_SCM_VMID_HLOS))
> -               return 0;
>
> -       next.vmid = remote_owner ? QCOM_SCM_VMID_MSS_MSA : QCOM_SCM_VMID_HLOS;
> -       next.perm = remote_owner ? QCOM_SCM_PERM_RW : QCOM_SCM_PERM_RWX;
> +       if (local) {
> +               next[perms].vmid = QCOM_SCM_VMID_HLOS;
> +               next[perms].perm = QCOM_SCM_PERM_RWX;

So, does this need to be tristate?  Downstream makes the HLOS perms
RWX only when HLOS is the sole owner.  HLOS has RW perms when it
shares ownership with the remote (modem).

> +               perms++;
> +       }
> +
> +       if (remote) {
> +               next[perms].vmid = QCOM_SCM_VMID_MSS_MSA;
> +               next[perms].perm = QCOM_SCM_PERM_RW;
> +               perms++;
> +       }
>
>         return qcom_scm_assign_mem(addr, ALIGN(size, SZ_4K),
> -                                  current_perm, &next, 1);
> +                                  current_perm, next, perms);
>  }
>
>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
> @@ -681,7 +687,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>
>         /* Hypervisor mapping to access metadata by modem */
>         mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
> -       ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, phys, size);
> +       ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, true, phys, size);
>         if (ret) {
>                 dev_err(qproc->dev,
>                         "assigning Q6 access to metadata failed: %d\n", ret);
> @@ -699,7 +705,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>                 dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
>
>         /* Metadata authentication done, remove modem access */
> -       xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, phys, size);
> +       xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, false, phys, size);
>         if (xferop_ret)
>                 dev_warn(qproc->dev,
>                          "mdt buffer not reclaimed system may become unstable\n");
> @@ -786,7 +792,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>         }
>
>         /* Assign MBA image access in DDR to q6 */
> -       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
> +       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false, true,
>                                       qproc->mba_phys, qproc->mba_size);
>         if (ret) {
>                 dev_err(qproc->dev,
> @@ -820,8 +826,8 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>         q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
>
>  reclaim_mba:
> -       xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
> -                                               qproc->mba_phys,
> +       xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
> +                                               false, qproc->mba_phys,
>                                                 qproc->mba_size);
>         if (xfermemop_ret) {
>                 dev_err(qproc->dev,
> @@ -888,7 +894,7 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
>         /* In case of failure or coredump scenario where reclaiming MBA memory
>          * could not happen reclaim it here.
>          */
> -       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
> +       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true, false,
>                                       qproc->mba_phys,
>                                       qproc->mba_size);
>         WARN_ON(ret);
> @@ -915,6 +921,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>         phys_addr_t boot_addr;
>         phys_addr_t min_addr = PHYS_ADDR_MAX;
>         phys_addr_t max_addr = 0;
> +       u32 code_length;
>         bool relocate = false;
>         char *fw_name;
>         size_t fw_name_len;
> @@ -965,9 +972,19 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>         }
>
>         /* Try to reset ownership back to Linux */
> -       q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false,
> +       q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, false,
>                                 qproc->mpss_phys, qproc->mpss_size);
>
> +       /* Share ownership between Linux and MSS, during segment loading */
> +       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, true,
> +                                     qproc->mpss_phys, qproc->mpss_size);
> +       if (ret) {
> +               dev_err(qproc->dev,
> +                       "assigning Q6 access to mpss memory failed: %d\n", ret);
> +               ret = -EAGAIN;
> +               goto release_firmware;
> +       }
> +
>         mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
>         qproc->mpss_reloc = mpss_reloc;
>         /* Load firmware segments */
> @@ -1016,10 +1033,24 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>                                phdr->p_memsz - phdr->p_filesz);
>                 }
>                 size += phdr->p_memsz;
> +
> +               code_length = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> +               if (!code_length) {
> +                       boot_addr = relocate ? qproc->mpss_phys : min_addr;
> +                       writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
> +                       writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
> +               }
> +               writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);

Should there be an explicit wmb() here since presumably this write
needs to be flushed out before we do the following readl?

> +               ret = readl(qproc->rmb_base + RMB_MBA_STATUS_REG);

Is this status reg immediately updated when RMB_PMI_CODE_LENGTH_REG is
updated?  I would expect that the MBA may need some time to update
this reg, thus there is an implicit race here.

> +               if (ret < 0) {
> +                       dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
> +                       goto release_firmware;
> +               }
>         }
>
>         /* Transfer ownership of modem ddr region to q6 */
> -       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true,
> +       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false, true,
>                                       qproc->mpss_phys, qproc->mpss_size);
>         if (ret) {
>                 dev_err(qproc->dev,
> @@ -1028,11 +1059,6 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>                 goto release_firmware;
>         }
>
> -       boot_addr = relocate ? qproc->mpss_phys : min_addr;
> -       writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
> -       writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
> -       writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> -
>         ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
>         if (ret == -ETIMEDOUT)
>                 dev_err(qproc->dev, "MPSS authentication timed out\n");
> @@ -1096,8 +1122,8 @@ static int q6v5_start(struct rproc *rproc)
>                 goto reclaim_mpss;
>         }
>
> -       xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
> -                                               qproc->mba_phys,
> +       xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
> +                                               false, qproc->mba_phys,
>                                                 qproc->mba_size);
>         if (xfermemop_ret)
>                 dev_err(qproc->dev,
> --
> 2.23.0
>
