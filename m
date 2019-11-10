Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED6FEF6940
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2019 15:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfKJOGY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Nov 2019 09:06:24 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:36210 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726390AbfKJOGY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Nov 2019 09:06:24 -0500
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 97F3ADD75B; Sun, 10 Nov 2019 14:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1573394780; bh=yflV46r6Z1vb4YN4RYdnGadTt4kXCYdqD+gr9ZsDdtk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=DKgD+KBAkuZYpoddBKNqxEx2yaUS7h2SJQ8TDQVF/GpBi+9ykTYyXnBVjhz1X8KG6
         Kx4OrMEyZ5C2dQG4OSH4L9Ywjnv+EqtkCAgCr1bLO5XNLPVt7h9ZQmuXD1CwO/7gRz
         GWmlTRrmV9V5U0cv1IMjp1qwz3SknZ4oD6fuB2lg=
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.2
Received: from g550jk.localnet (80-110-127-196.cgn.dynamic.surfer.at [80.110.127.196])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id F0C72CA0D3;
        Sun, 10 Nov 2019 14:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1573394774; bh=yflV46r6Z1vb4YN4RYdnGadTt4kXCYdqD+gr9ZsDdtk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=DM1R1IGTcNsZX7zHZIl8S4o+tH9uAgeN9b/pfuUmJpqI0yK3B3Q41on2kCobv0FGi
         vtY92CtZlrxGPlOrVwHE0BDFKyjaAZTsRQQa+cpTc096ymkPhgQR+u0btubl2ja70i
         sSQjQhXSPbX8EZhYCAHAnn3rKccemqNfFeM+wuiw=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_mss: Validate each segment during loading
Date:   Sun, 10 Nov 2019 15:05:54 +0100
Message-ID: <393350950.66DGQb6nHQ@g550jk>
In-Reply-To: <20191109004033.1496871-3-bjorn.andersson@linaro.org>
References: <20191109004033.1496871-1-bjorn.andersson@linaro.org> <20191109004033.1496871-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9367707.mdyvPZqoDZ"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--nextPart9367707.mdyvPZqoDZ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bjorn,

with your patches and modifications in qcom-msm8974.dtsi, I can boot the modem 
successfully on the Fairphone 2, without the 'hack' commit we had in the tree 
before! Thanks!

Tested-by: Luca Weiss <luca@z3ntu.xyz>

On Samstag, 9. November 2019 01:40:33 CET Bjorn Andersson wrote:
> The code used to sync with the MBA after each segment loaded and this is
> still what's done downstream. So reduce the delta towards downstream by
> switching to a model where the content is iteratively validated.
> 
> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Picked up Jeff's r-b and t-b
> 
>  drivers/remoteproc/qcom_q6v5_mss.c | 76 ++++++++++++++++++++----------
>  1 file changed, 51 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
> b/drivers/remoteproc/qcom_q6v5_mss.c index efab574b2e12..914d5546e1cf
> 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -358,23 +358,29 @@ static void q6v5_pds_disable(struct q6v5 *qproc,
> struct device **pds, }
> 
>  static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
> -				   bool remote_owner, phys_addr_t 
addr,
> +				   bool local, bool remote, 
phys_addr_t addr,
>  				   size_t size)
>  {
> -	struct qcom_scm_vmperm next;
> +	struct qcom_scm_vmperm next[2];
> +	int perms = 0;
> 
>  	if (!qproc->need_mem_protection)
>  		return 0;
> -	if (remote_owner && *current_perm == BIT(QCOM_SCM_VMID_MSS_MSA))
> -		return 0;
> -	if (!remote_owner && *current_perm == BIT(QCOM_SCM_VMID_HLOS))
> -		return 0;
> 
> -	next.vmid = remote_owner ? QCOM_SCM_VMID_MSS_MSA : 
QCOM_SCM_VMID_HLOS;
> -	next.perm = remote_owner ? QCOM_SCM_PERM_RW : QCOM_SCM_PERM_RWX;
> +	if (local) {
> +		next[perms].vmid = QCOM_SCM_VMID_HLOS;
> +		next[perms].perm = QCOM_SCM_PERM_RWX;
> +		perms++;
> +	}
> +
> +	if (remote) {
> +		next[perms].vmid = QCOM_SCM_VMID_MSS_MSA;
> +		next[perms].perm = QCOM_SCM_PERM_RW;
> +		perms++;
> +	}
> 
>  	return qcom_scm_assign_mem(addr, ALIGN(size, SZ_4K),
> -				   current_perm, &next, 1);
> +				   current_perm, next, perms);
>  }
> 
>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
> @@ -681,7 +687,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc,
> const struct firmware *fw)
> 
>  	/* Hypervisor mapping to access metadata by modem */
>  	mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
> -	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, phys, 
size);
> +	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, true, 
phys,
> size); if (ret) {
>  		dev_err(qproc->dev,
>  			"assigning Q6 access to metadata failed: 
%d\n", ret);
> @@ -699,7 +705,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc,
> const struct firmware *fw) dev_err(qproc->dev, "MPSS header authentication
> failed: %d\n", ret);
> 
>  	/* Metadata authentication done, remove modem access */
> -	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, 
phys,
> size); +	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true,
> false, phys, size); if (xferop_ret)
>  		dev_warn(qproc->dev,
>  			 "mdt buffer not reclaimed system may become 
unstable\n");
> @@ -786,7 +792,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	}
> 
>  	/* Assign MBA image access in DDR to q6 */
> -	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
> +	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false, true,
>  				      qproc->mba_phys, qproc-
>mba_size);
>  	if (ret) {
>  		dev_err(qproc->dev,
> @@ -820,8 +826,8 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
> 
>  reclaim_mba:
> -	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, 
false,
> -						qproc-
>mba_phys,
> +	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, 
true,
> +						false, 
qproc->mba_phys,
>  						qproc-
>mba_size);
>  	if (xfermemop_ret) {
>  		dev_err(qproc->dev,
> @@ -888,7 +894,7 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
>  	/* In case of failure or coredump scenario where reclaiming MBA 
memory
>  	 * could not happen reclaim it here.
>  	 */
> -	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
> +	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true, false,
>  				      qproc->mba_phys,
>  				      qproc->mba_size);
>  	WARN_ON(ret);
> @@ -915,6 +921,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	phys_addr_t boot_addr;
>  	phys_addr_t min_addr = PHYS_ADDR_MAX;
>  	phys_addr_t max_addr = 0;
> +	u32 code_length;
>  	bool relocate = false;
>  	char *fw_name;
>  	size_t fw_name_len;
> @@ -965,9 +972,19 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	}
> 
>  	/* Try to reset ownership back to Linux */
> -	q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false,
> +	q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, false,
>  				qproc->mpss_phys, qproc-
>mpss_size);
> 
> +	/* Share ownership between Linux and MSS, during segment loading */
> +	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, true,
> +				      qproc->mpss_phys, qproc-
>mpss_size);
> +	if (ret) {
> +		dev_err(qproc->dev,
> +			"assigning Q6 access to mpss memory failed: 
%d\n", ret);
> +		ret = -EAGAIN;
> +		goto release_firmware;
> +	}
> +
>  	mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
>  	qproc->mpss_reloc = mpss_reloc;
>  	/* Load firmware segments */
> @@ -1016,10 +1033,24 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  			       phdr->p_memsz - phdr->p_filesz);
>  		}
>  		size += phdr->p_memsz;
> +
> +		code_length = readl(qproc->rmb_base + 
RMB_PMI_CODE_LENGTH_REG);
> +		if (!code_length) {
> +			boot_addr = relocate ? qproc->mpss_phys : 
min_addr;
> +			writel(boot_addr, qproc->rmb_base + 
RMB_PMI_CODE_START_REG);
> +			writel(RMB_CMD_LOAD_READY, qproc->rmb_base + 
RMB_MBA_COMMAND_REG);
> +		}
> +		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> +
> +		ret = readl(qproc->rmb_base + RMB_MBA_STATUS_REG);
> +		if (ret < 0) {
> +			dev_err(qproc->dev, "MPSS authentication 
failed: %d\n", ret);
> +			goto release_firmware;
> +		}
>  	}
> 
>  	/* Transfer ownership of modem ddr region to q6 */
> -	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true,
> +	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false, 
true,
>  				      qproc->mpss_phys, qproc-
>mpss_size);
>  	if (ret) {
>  		dev_err(qproc->dev,
> @@ -1028,11 +1059,6 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  		goto release_firmware;
>  	}
> 
> -	boot_addr = relocate ? qproc->mpss_phys : min_addr;
> -	writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
> -	writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
> -	writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> -
>  	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
>  	if (ret == -ETIMEDOUT)
>  		dev_err(qproc->dev, "MPSS authentication timed out\n");
> @@ -1061,7 +1087,7 @@ static void qcom_q6v5_dump_segment(struct rproc
> *rproc, ret = q6v5_mba_load(qproc);
> 
>  		/* Try to reset ownership back to Linux */
> -		q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, 
false,
> +		q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, 
false,
>  					qproc->mpss_phys, 
qproc->mpss_size);
>  	}
> 
> @@ -1101,8 +1127,8 @@ static int q6v5_start(struct rproc *rproc)
>  		goto reclaim_mpss;
>  	}
> 
> -	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, 
false,
> -						qproc-
>mba_phys,
> +	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, 
true,
> +						false, 
qproc->mba_phys,
>  						qproc-
>mba_size);
>  	if (xfermemop_ret)
>  		dev_err(qproc->dev,


--nextPart9367707.mdyvPZqoDZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEObrSLwgs2pG6FY/6cthDuJ1N11YFAl3IGUIACgkQcthDuJ1N
11aLPxAAsUepL/3HCBvfxEMZOa7pH7U6ORqMTkGuv/HT2nBHFDUiYYFaU26nR0Li
M7YCXy0HMNo0aOFxjvCa5ybSKRrCy5tLonsLoRVGPg8cDQNWbMYg+tgDMgPyBJ6m
6PktxIzfmMaxVkDfZIvb1P/vO2wDVeAHcjbKvj0h/nxnQPHwu0/6CGqz6mAjPIoR
GFDKTPhfzouM/e7ZkmOSs1UB72gdb1vl2e/CtaHhYXbYq2QDntGESJDNGWLpBL8u
2y7PYDslGjV9jZABWS2JuILFimMan/e4HGai/3DKhSknEpYHbYPHj6XJAnR9SDiy
pYtRq0pYms3jGLtCAsZEDl2IhmNiNx+EzVmTJgc5c9yg+/FRS7oqztXH+WIsB1UE
9j+nv8CY8YkcBzHEg2BWbnG3kAfg81NRwMSXxTv2sEYm857fthGKXLoW39bXey00
sAvKk59PNPDaM+SP69ggeIZ4oKewP60F2lWulRWLTaW2BuxnlU/i1CMviHz0r5tH
0dq5I37Lc9+5q/nW23eBWqkTGfI+Pr+odKwK7CR97e67/yrJpVnRd7RhTOBxjOvh
kVR3S8+m4zron+MRLjlcCJxc1WHHV4I4JoVOFormPEXDCjdX1AdAdRW8aIOO0lo9
lz9Zw0rbF6ExTCeJk/DZy52ZXw6mqGaLQrWbb3cMZ56nGGs5Ar8=
=uIQJ
-----END PGP SIGNATURE-----

--nextPart9367707.mdyvPZqoDZ--



