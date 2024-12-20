Return-Path: <linux-arm-msm+bounces-42942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F00C9F8F00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A57E168324
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04351B85F8;
	Fri, 20 Dec 2024 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QMh5KgqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1596D1A726B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687039; cv=none; b=eZsP+isMcU0SpmtU5i+WqzIp8tUIWAxXLikNW56eVLg45YZMrfiyD0Y5DWtleEM5wQowXOG1eupClYqK7RrWXrc2JpTT7wvtwyeRMk7NgR5wUcdigY/esx3U2/P8YK/uVceJ/p91IlFw0KpTmdal7b6+9zQD/1P7GE9e1K80XyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687039; c=relaxed/simple;
	bh=j7OVgCHRHC1fGXt5U4HJtYavOVk0sa3NXJU53Xfjs8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAnm2eNMAbvj2q6Ma2rkgX6xb04vpmsNcVOJStsoh0mk/lTZ6KNpFVAjoAMQAQjnFTNeAO5SiAMQrsSm6YU6R/Rr3Uin9GRil/oRjXt0IWpPgv7SLGjchpVALrlGrmxGgFvvwPVpyr8RdSHHtmKfsHvhse1oepsc5d0jTNenV6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QMh5KgqQ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-72739105e02so1831726b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734687037; x=1735291837; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ByXi/X5ENmiNNt5+6rwHFixmOfwBVaDYK2KBq4o/HRw=;
        b=QMh5KgqQkxgQ84eedYlE9BhwK1aY0YLbcrFvfMMnU1UDZY95dZjufMFuuJYER3Q8by
         EWbGtrTBT6n2fU1MGXGgPXhfuLuDytvcyWrVoPiK29SauUlCv7HKaEWbYF/mhAAY591V
         nEnIz+oXkXvsSeR3lNXsgIpKU/7PPpX/b+fj/jLHd66DMKowz/zMoD2O/3kH9+oNC9d1
         eSCewNoDWsWXa9LGFtXOtyblc6d7trkHydmxUFrTcenFwscsop0Q83UUIacJp7MyufY/
         qfQ5764nwINCVZ+nAf5PG0wrqmj/umg/oBc5n0QdvKye/zBK0IyZffXnyEjDhZo2FFU/
         oB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687037; x=1735291837;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByXi/X5ENmiNNt5+6rwHFixmOfwBVaDYK2KBq4o/HRw=;
        b=FtxCBDyGnawmSNKwq/oMFGnOqJAYI9qoYyyy1HGQMyhzOLff6PtTX958d8l+ie+Wht
         CSmnm+xn6m7Oc7659EikO90Tr2Ena3e7uFSl5zeZquWtNApK7pbVtBoP9myd0hEE0Mfc
         T1iJTqcXxoJWtjvs+MY/Fz92nYPLbJ4WNlb/qrWGkJXmStENNhRzYe03SVYrFiOdih36
         OzVrnfsL3kbPe0HHCZzwUDmKtXl+kD/8s9CenuPLtYL7NSOSNfnqJ2jOGEN8JbVN77OZ
         hsmbUk1CG4wTrzCLxCI8K/x1O5Y9lmecq5RyU2LuFVMjUGSTxNu4jKqfREwPmjcOB+Xv
         Ou6w==
X-Forwarded-Encrypted: i=1; AJvYcCX+hli8O7YZ0thyVTvzC/dwrD2yNqKxUVwqzdxzQgxPskigUHjokvsJTlHKGbBjJm1e9Fbu09kHx68/8IM/@vger.kernel.org
X-Gm-Message-State: AOJu0YzA3fvgM5WrD2YZLjsotd3X1r+qnZ/mpHFkEGpnExZZ+G0BLuw/
	RCbtSYPUiLQFcIIjzzkn7zhttE5/CC6Z+N9e1gAR2JeA34BP+eMGBDTwlPfTxQ==
X-Gm-Gg: ASbGncsP/mInHpsi2RKTEb1mq4TJJkksFAUNE7mC4k2k11ePPQCMcY9Xw9Xh77HQjZo
	SVi/e3FZrYQp/z/y+jK9yjpBCg6+fPAQxS4r+LcU1+Ti0PzvY+5t0+CST6JTzMwhifPczPgTG1M
	9WJNv3ZwTa4H69brhlJDfcqbX1O/GSOJpVfgJkII1YGDRqliQw0ByJUM+w7cdxckyP2xwFjCPZQ
	yITqZ8tSPThpcTSiVsF7Ld21F2OzfYHdG9lPaK4XICpxZRDZtrgyQsNA6cIOqaO0arg
X-Google-Smtp-Source: AGHT+IF/Nb2ERdvtlBhMiFXyGT0KhA8msdwfPAqL4vPVA2znS47Bj667IM2h2pVbccmBK1in6s1Ncg==
X-Received: by 2002:a05:6a00:4098:b0:725:c8ea:b30a with SMTP id d2e1a72fcca58-72abde2ab0emr3170686b3a.14.1734687037472;
        Fri, 20 Dec 2024 01:30:37 -0800 (PST)
Received: from thinkpad ([117.193.209.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbad9sm2768017b3a.103.2024.12.20.01.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:30:37 -0800 (PST)
Date: Fri, 20 Dec 2024 15:00:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com
Subject: Re: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Message-ID: <20241220093029.z4zsr3owdnqll2vg@thinkpad>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241122085933.2663927-1-quic_mdalam@quicinc.com>

On Fri, Nov 22, 2024 at 02:29:30PM +0530, Md Sadre Alam wrote:
> v2:
>  * Updated commit message
>  * Added stable kernel tag
>  * Added Fixes tag
>  * Renamed the variable from offset_from_qpic to nandc_offset
>  * Set buf_count to 512 in the parameter page read
>  * Replaced the buf_count value of 512 with the len in bytes 
> 
> v1:
>  * These patches will fix the following:
>  * 1) onfi param page read which was broken by exec_op() patch.
>  * 2) Fixed offset passed to BAM from QPIC base
> 
> Md Sadre Alam (3):
>   mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM
>   mtd: rawnand: qcom: Fix onfi param page read
>   mtd: rawnand: qcom: Fix read len for onfi param page
> 

Do you plan to respin this series? FYI, these are regressions, so should go in
early as possible.

- Mani

>  drivers/mtd/nand/raw/qcom_nandc.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

