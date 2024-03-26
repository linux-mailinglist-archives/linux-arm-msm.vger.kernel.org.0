Return-Path: <linux-arm-msm+bounces-15123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D12CA88BB87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 08:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CBBD1F37C6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 07:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5135713175C;
	Tue, 26 Mar 2024 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NmeTkp1V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58E9130AEC
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 07:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711438953; cv=none; b=OA5cS6dXzwu9gqYjfI7+sxnFWtErROH6s3m6/rncl73Z+DKfKr7D67Y/fKT66dgRyAxKRbV7s9U3xCS/x6N5qsA6OEJwEoZAvlkDaxvWJm8Sm5dfZXk5qMTFTum5X6nSGt00Ym9Us66GvP/JTrvwrlPJsqpN2v+2K1LeerFdnuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711438953; c=relaxed/simple;
	bh=lQLJYF/S6aNnizdrvZwuqBFYXgWMgmOQnMbgfAPsYiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phCvTQGUIsuSoO/xW9LtE8u8jx5zQFKptdJN9l5unbT5EAmIwwWivgb/J7fN7PYUx29L3UPyy+z6JhoDBayh6qyhUYe9BG6gn7A/tIvWMpJkNLALjC/LHWekpJ5EPDExHemvo0qB7cT5tnwyzqP62jSvnz/RiQutmtOVRCjpxds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NmeTkp1V; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ea8a0d1a05so2092816b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 00:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711438951; x=1712043751; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=suWtwDEm4B03eU+FNeyx8FV8u6kO5WvtfeH16xAc4og=;
        b=NmeTkp1V7Xu9S3lMJMQawDIf6myHY8XQCtdQq4/jp9Gq+emaSf90nqfPH91VjefEkm
         vqXx+vZPNSJLOnWYOhmGmkUXTIWM79eaab1nhBtRnuDgXwAaSmgAjfhli4hDVpZnO8A0
         vd8PSXor5j0NWFBfuynf1kpNOBmMHHYI2AKuuwV3iJYQVsAOHjVieCrC61XwHVnDkZbM
         tXUPob354J2vaQFIueDJp7mYvD6Sy5r2Hw2pEArkoVm0Yv92nZ71C4UCC/l/oiVKtf48
         sL4RxwOQjrBQjDZk5b4ZuV1bJ7m5LJX/2CfyomH7lvgPkqLJBdLumG9Vd7JoAw9WAoJf
         k4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711438951; x=1712043751;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suWtwDEm4B03eU+FNeyx8FV8u6kO5WvtfeH16xAc4og=;
        b=vYWITJ348ReUt1cHd9YQirz4EZ4ayWorS8oOuSoo95IN71+HOBgCb/LD6uwzfA68vc
         fngXrJ21KIfyN4+qLGOH3GamA7h/l2D0HpcJ3ucwuchgvsK87yYE2JI+3zuL4qs+Y0Sd
         6GHQ3869DuqznGIn/SOuCZOiTs2oNWFR1YkrxEXn5udQVF87UjsTJMI/tQ6PDv9m0LIz
         /6vjWHZ+ZEzxRNA9JpbQ7KDhP2+emndCQI+6LhSqPGIuO13dWMliham/QJLsgEzJFDbp
         IqCo7p0tVmK6cHRo/bPy9gi2qo+4FqOOJJ/w6uzROkQVjPr7NGHfkVhQdbB4M06/GF3K
         rvrA==
X-Forwarded-Encrypted: i=1; AJvYcCXxbM3eIkvXEdKX7SCSuh4U+h1DSZqrD8KNbakIcxVGTkj1tieA2pgr4OWcJhiN6P/BMkoJdR+0wKdMHYWE5AjD63+zUE/sFJbQ8nUEDw==
X-Gm-Message-State: AOJu0YxWDsIyv6U8DTmpQixIsQgmhWfUCg1YU2721gXv4/LVEhAk0iHB
	O8Zmw9H5GIkbRJ8wSYaOFWi6pGgYUqFO9V7p1earHM2hTHeatU//MSSSLTMXbQ==
X-Google-Smtp-Source: AGHT+IENYADQhqltAgsX3SaQGsChrRbnmlYma0ZqXAvA2PgQ9EbWV1JZJVQXA1LqKU8H1D8C5SxnMA==
X-Received: by 2002:a05:6a20:3d87:b0:1a3:a8ff:473b with SMTP id s7-20020a056a203d8700b001a3a8ff473bmr939435pzi.29.1711438950796;
        Tue, 26 Mar 2024 00:42:30 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id fi16-20020a056a00399000b006e795082439sm5313094pfb.25.2024.03.26.00.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 00:42:30 -0700 (PDT)
Date: Tue, 26 Mar 2024 13:12:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: qcom: Fix broken reset in
 misc_cmd_type in exec_op
Message-ID: <20240326074223.GB9565@thinkpad>
References: <20240325103053.24408-1-ansuelsmth@gmail.com>
 <20240325103053.24408-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240325103053.24408-2-ansuelsmth@gmail.com>

On Mon, Mar 25, 2024 at 11:30:48AM +0100, Christian Marangi wrote:
> misc_cmd_type in exec_op have multiple problems. With commit a82990c8a409
> ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path") it was
> reworked and generalized but actually dropped the handling of the
> RESET_DEVICE command.
> 
> The rework itself was correct with supporting case where a single misc
> command is handled, but became problematic by the addition of exiting
> early if we didn't had an ERASE or an OP_PROGRAM_PAGE operation.
> 
> Add additional logic to handle the reset command and return early only
> if we don't have handling for the requested command.
> 
> Fixes: a82990c8a409 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> Changes v2:
> - Add this patch
> 
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 19d76e345a49..b8cff9240b28 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2815,7 +2815,7 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
>  			      host->cfg0_raw & ~(7 << CW_PER_PAGE));
>  		nandc_set_reg(chip, NAND_DEV0_CFG1, host->cfg1_raw);
>  		instrs = 3;
> -	} else {
> +	} else if (q_op.cmd_reg != OP_RESET_DEVICE) {

But this will fail if the previous patch is not applied. So this makes me think
that you are trying to fix the OP_RESET_DEVICE command with these 2 patches.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

