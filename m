Return-Path: <linux-arm-msm+bounces-39160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0FB9D917C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 06:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59F9B167B45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 05:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5517EF09;
	Tue, 26 Nov 2024 05:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tnqzw4s1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B148831
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 05:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732600174; cv=none; b=RVlHUTLNMRYDhbpn97HCtwfpJ7ccvFjV9ExqXHKzhsKZ6b364+9M/AIqWcqNoW5hzJLD4lncpSbh2WwjAKTlbTdiVLu4Y6qwtG1XvPCLAZlawrpglBNA0uTUgc2Zi11u/inqsNuNPGJloQNvp57vCAlDsXETewumwGwqo16zlqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732600174; c=relaxed/simple;
	bh=MKtnIf+LS1N4QSySgV/jc8UR+T4LSGB7cnpXs46QdME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrRkUFCorU5C1eD31Ao/364KtIaCIjMRKAZtDlgwjyFAUx2uvOuuCdc3RQRu4cD415f/4e4GqlwRnCN1nCraDADrpmVN1DBJXa3YN3QGYY/aJDQ5EDe7JyrJx5y5miayd0UGd2XMXcBkbHPsnRAdYAV0ifOnHsWqjkl8q4nS7u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tnqzw4s1; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7ee7e87f6e4so4405895a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 21:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732600172; x=1733204972; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UB6HIiB9fYrnHWsQY2vK1iIVeNJm/snUPz8wyR7wZsQ=;
        b=Tnqzw4s1M2eLcNsPMwnqrxp0yvkTKRbm5Hg9CnwfEc9MeCURz701QX3Jb8kOxMT8vM
         zgP/PsEmH84hdoRoUn1stW2Rgqy5rUzJZKd1d9xqJ/XHZe7nxHWdLRdlraalsoE3ib34
         +AGn3VU+wTWjm/U0Q7rJJZ3a/gOtp5c3iKrG97zubezLVG1pWxFiJrbJQOrEaBi/2XAi
         Rm5Utj62DBxuy5ntO8K3Mae4d7EkIDD2+etZpc4/vFuZKWFSO+cPAP5TYktqJkD2vRZ9
         xShmuDC9aG48BHu+jjSoCdueFJ2/J71ZgMHCJbZUJiYq7+cDQFUe33a3s/B1NLedz4J6
         +4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732600172; x=1733204972;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UB6HIiB9fYrnHWsQY2vK1iIVeNJm/snUPz8wyR7wZsQ=;
        b=tNOPiI7r6bcnXEA7a7s9l0WDRbDUAHaqysYwzX9Vd0cK5hY92g7UskT/XTMgdNDNyW
         nkayikrrxlOocZoEVR7GOjyQdq1asHq0RzZAPg6/e0k1BeV5P/h8EmZ7I3LtyKny2MLJ
         Y7uCL0oycc8MpDfOzcfHvOyUT72JbDsXXii7D5K02gsLiJB3jDAvgpyQhXnSRY3vl3AG
         W9z/lFmizrt9D+2b18rLMA+8HyyRdZlNL368PszIp/OQ9DVmWJ8/C31nULrbbJOu15+R
         gsaHyEZTIOYOhHd1uHtW59F78D0SHhS/uQzzg7D3xWwxOr9yM2KgsDZc/RQ42LZe8mSO
         5PYw==
X-Forwarded-Encrypted: i=1; AJvYcCUl3webVUYSW82gSu/DGamOrWZ2q+o8wzsm0O19pK+Ab29thtDXHIjMvJKaFzazXpb4hFXIxUYgKB5A3rWf@vger.kernel.org
X-Gm-Message-State: AOJu0YwHf++Og9ihSmfPg7T9SEG28c57ZI/58AYlGRlDaT1wuhVmPFhr
	2zY23q5L8P5oCJI65n22MDWHc3kUWpYfmmWsOkCRIxJjldyFUImSElVCiXVfrg==
X-Gm-Gg: ASbGncsjadrQsmb0/QrBHWn55cQgT78q2BS2zl/ej6ExzTJaMGUYPJ4piMVPxI01AA0
	kDlBwAl92z5gTsLcDtbxXS85lquzn7ZX3tL/nV22JS0+qgXdrSYjZXaUsh3NbEfF34WLyoioOuq
	cBjN5s8rlduo4Zg/D/3W1eU9RjQgynoY4sBwtdO/+cmtU4JCn//Gfw3v3J0V1B1UDOPfeeqI7vJ
	1KqaACbR/c6cdsoQ0VJaRDqx0TpfBvhkA3JdBSG7cnFY9a86duV6Fe8+r3wTUo=
X-Google-Smtp-Source: AGHT+IH7A4RpJtC++YPuYB5MX3HiLhpx1EDYwGMi9/FEGgV6zpbeHZux/sYsnjCByhEA+eq00AHWQw==
X-Received: by 2002:a05:6a20:9d94:b0:1db:ec6b:ba13 with SMTP id adf61e73a8af0-1e09e4178aemr23288221637.12.1732600172510;
        Mon, 25 Nov 2024 21:49:32 -0800 (PST)
Received: from thinkpad ([220.158.156.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de474c9fsm7503389b3a.44.2024.11.25.21.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 21:49:32 -0800 (PST)
Date: Tue, 26 Nov 2024 11:19:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com
Subject: Re: [PATCH v2 3/3] mtd: rawnand: qcom: Fix read len for onfi param
 page
Message-ID: <20241126054926.w2y3q4qnwiyatw5x@thinkpad>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241122085933.2663927-4-quic_mdalam@quicinc.com>
 <20241126054529.ewoajuaor4wpa4xe@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126054529.ewoajuaor4wpa4xe@thinkpad>

On Tue, Nov 26, 2024 at 11:15:35AM +0530, Manivannan Sadhasivam wrote:
> On Fri, Nov 22, 2024 at 02:29:33PM +0530, Md Sadre Alam wrote:
> > The minimum size to fetch the data from device to QPIC buffer
> > is 512-bytes. If size is less than 512-bytes the data will not be
> > protected by ECC as per QPIC standard. So while reading onfi parameter
> > page from NAND device setting nandc->buf_count = 512.
> 
> s/setting/set
> 
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
> > Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 

This was a mistake. I didn't intend to give this tag.

- Mani

> - Mani
> 
> > ---
> > 
> > Change in [v2]
> > 
> > * Set buf_count to 512 in the parameter page read
> > 
> > Change in [v1]
> > 
> > * This patch was not included in v1
> > 
> >  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> > index 31ec3db1246d..e1dca4857754 100644
> > --- a/drivers/mtd/nand/raw/qcom_nandc.c
> > +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> > @@ -2926,7 +2926,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
> >  		write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
> >  	}
> >  
> > -	nandc->buf_count = len;
> > +	nandc->buf_count = 512;
> >  	memset(nandc->data_buffer, 0xff, nandc->buf_count);
> >  
> >  	config_nand_single_cw_page_read(chip, false, 0);
> > -- 
> > 2.34.1
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்

