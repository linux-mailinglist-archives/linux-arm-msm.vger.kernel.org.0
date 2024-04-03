Return-Path: <linux-arm-msm+bounces-16199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA51F896484
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 08:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C632282B7E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 06:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9C617555;
	Wed,  3 Apr 2024 06:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHfXDpzA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598684C98
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712125815; cv=none; b=nwKvPdpNTfPB8cvtSdNQPE4l1c2QsWFP53UNHdR76NoJHRBmIaGnwe5AdT7pd1yXMWX4G0EamCwgDNYeSl4bUujR/nQuwLZbAsC+sAuCUJ+G8pCi8aJV54GkNtcRXVOd6tzjyCILBX9aUEbdGvIsGsz0WGUHiI9DVmNw6eqrq9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712125815; c=relaxed/simple;
	bh=8sgnSowpaMZh5S2Y6ZK1p1McE5Xqmbt7t1FamwDhRVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPKuIH1qAHG9bGjRQ4wrWZnun0DO4SmH+BWdPnrsNJvkNRdmShUnpPpToQuQh2oJrpOmfXerSNq0re2CzYDbynAZr3heNoLmlu8akp9V2IX2uiFcGebIOfgHCMzKJolqmmKEMSB0BL6uIhngSDyJNV5DrizNWiz8xgXeXYNmiHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yHfXDpzA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e0ae065d24so50916775ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 23:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712125814; x=1712730614; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7RD/Ll+en1rNJsL6MJyoQafEtmHmvnu+TP2GShmlV2E=;
        b=yHfXDpzAJb1GnWuhHW8WH2qmAtf4Am8P4pjtM86LyRqCDS6Qkwuw8ViaasHoziQuhv
         CWF3hug2o5T/0WSOu6LC9dz2u4WCyss6dXD+FM42fk3NwXBun2W1p3u6Qio1cc+H2fyL
         zy2pKjtn0uE7Z8Kft9aJRV0rICmOSpkIYGvdYT6sddfFxtpE/LJxE+obYvwg32Z0uZFY
         Jm0Ggmb7XJzG2QQSRqxff/CGOY7SncJLgRqfH5D+CPud72URHXKh0SDdPLYoypPMT6cp
         INzL2G/U77Ik4uRG69Vhpx94G1BTcVgf9EoGskijmWN9I53X/jChYGzcFn089Faoabgs
         ecZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712125814; x=1712730614;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RD/Ll+en1rNJsL6MJyoQafEtmHmvnu+TP2GShmlV2E=;
        b=HPNK85hjHMenSnzal3pC4kwSW15Lz0G5sW8yL9NW12VFQgpaQ2u0Cu/HeFC1g0dCtM
         dOtEUWPT+4SlImevOJiFNvRPJldkOGyjBGZX66NbqAImm0vwGeDmC3j6y/B0CDoN5p48
         OLx4Jkhxuta3slT9k4G1s/TIs+BdCS0U0h6PoMoqY+VOQFYo+6bMsDeNgq2WlJw/XtEp
         4OFBCKSpQuzrYRoODtFOv9jubMI1BGX2Zc/D9Nr4R+JY92PABCPCx/FZh+MPxO7EjeHK
         m3GHb6A4bzE97F/7PmFnLnAAgk/dBGjFCvzCQ5Bw6lrED7Mea9roSiAVnqN1cgvvoIRy
         o8yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYsG09vaUq7IrYp2t8TK96zAPyJV9Fov9sCKXX8oKR0S9P+FYyU0SQB0ReFJXV29owCQUVDeQGFsQiqtEO0HWaTvqiL/HZtUElUANzhQ==
X-Gm-Message-State: AOJu0YyWfFsevMuiJ+iF44gHOahPbAddjPK0qPNZ8o1vkJSwCKhEbOBu
	TulUrYOgoBb35/UfqSr0NqKtnZz/3PEG8QSCnyX4JQYtFGahSkk1Fdzh1cGTkA==
X-Google-Smtp-Source: AGHT+IFB1/jew2jwqrDsxXrqrjGsZHTMzuxqjY1GHMh3+JdUbou30h3sipXmeEKmZIIzGMunMk8+TA==
X-Received: by 2002:a17:902:dacf:b0:1e2:367:9879 with SMTP id q15-20020a170902dacf00b001e203679879mr15757623plx.45.1712125813278;
        Tue, 02 Apr 2024 23:30:13 -0700 (PDT)
Received: from thinkpad ([103.246.195.197])
        by smtp.gmail.com with ESMTPSA id d14-20020a170903230e00b001e06c1eed85sm12341503plh.141.2024.04.02.23.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 23:30:12 -0700 (PDT)
Date: Wed, 3 Apr 2024 12:00:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] mtd: rawnand: qcom: Fix broken misc_cmd_type in
 exec_op
Message-ID: <20240403063008.GA25309@thinkpad>
References: <20240402214136.29237-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240402214136.29237-1-ansuelsmth@gmail.com>

On Tue, Apr 02, 2024 at 11:41:34PM +0200, Christian Marangi wrote:
> misc_cmd_type in exec_op have multiple problems. With commit a82990c8a409
> ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path") it was
> reworked and generalized but actually dropped the handling of the
> OP_RESET_DEVICE command.
> 
> The rework itself was correct with supporting case where a single misc
> command is handled, but became problematic by the addition of exiting
> early if we didn't had an OP_BLOCK_ERASE or an OP_PROGRAM_PAGE operation.
> 
> Also additional logic was added without clear explaination causing the
> OP_RESET_DEVICE command to be broken on testing it on a ipq806x nandc.
> 
> Add some additional logic to restore OP_RESET_DEVICE command handling
> restoring original functionality.
> 

I'd like to reword the commit subject and description as below. But I hope
Miquel can ammend it while applying:

"mtd: rawnand: qcom: Fix broken OP_RESET_DEVICE command in qcom_misc_cmd_type_exec()

While migrating to exec_ops in commit a82990c8a409 ("mtd: rawnand: qcom:
Add read/read_start ops in exec_op path"), OP_RESET_DEVICE command handling
got broken unintentionally. Right now for the OP_RESET_DEVICE command,
qcom_misc_cmd_type_exec() will simply return 0 without handling it. Even,
if that gets fixed, an unnecessary FLASH_STATUS read descriptor command is
being added in the middle and that seems to be causing the command to fail
on IPQ806x devices.

So let's fix the above two issues to make OP_RESET_DEVICE command working
again."

> Fixes: a82990c8a409 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

With the above change,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes v3:
> - Merge patches
> - Rework commit description
> Changes v2:
> - Split patches
> 
>  drivers/mtd/nand/raw/qcom_nandc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index b079605c84d3..b8cff9240b28 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2815,7 +2815,7 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
>  			      host->cfg0_raw & ~(7 << CW_PER_PAGE));
>  		nandc_set_reg(chip, NAND_DEV0_CFG1, host->cfg1_raw);
>  		instrs = 3;
> -	} else {
> +	} else if (q_op.cmd_reg != OP_RESET_DEVICE) {
>  		return 0;
>  	}
>  
> @@ -2830,9 +2830,8 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
>  	nandc_set_reg(chip, NAND_EXEC_CMD, 1);
>  
>  	write_reg_dma(nandc, NAND_FLASH_CMD, instrs, NAND_BAM_NEXT_SGL);
> -	(q_op.cmd_reg == OP_BLOCK_ERASE) ? write_reg_dma(nandc, NAND_DEV0_CFG0,
> -	2, NAND_BAM_NEXT_SGL) : read_reg_dma(nandc,
> -	NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
> +	if (q_op.cmd_reg == OP_BLOCK_ERASE)
> +		write_reg_dma(nandc, NAND_DEV0_CFG0, 2, NAND_BAM_NEXT_SGL);
>  
>  	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>  	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

