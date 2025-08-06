Return-Path: <linux-arm-msm+bounces-67945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7432B1CB22
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 19:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0AB3168AFA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFF2231845;
	Wed,  6 Aug 2025 17:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGeb6EZU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B434F1A08BC;
	Wed,  6 Aug 2025 17:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501947; cv=none; b=nn93GbUCIdTJP+1Id2wiZwhMyAZDz1FUBL3vOVQVJMpBBT5As1SRWRT/Hr+LbAKtvbY2luDNo6z/Z6cC6bDFIaXctDCqBOh4ahTUK9lg3EUoh/YRDsuuPrI/E0aYPF3H973Fjkyy7blptX496g5tcPUknA5PrGvWvbgX+I9q3AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501947; c=relaxed/simple;
	bh=sC3xqR0PE11fVdcrxja9ytXlDo8MBamvw+7NE88bt8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofOYP8rfYnnweZXRzyWUs/bUI2xMrVCHF4F2tqKegFA+QyQ3qQ0/Y4w3+7etPbHrHv+mj1jJl90SEURiqpdU7i+3hQ5GSwyVOoHYHSvBjlGvX6d512TqcAkuS5GEYsPq5U4WzcoBUlp7ZOqnEhW5/SuVHtzu00BXjhK3b0+HgBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGeb6EZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891E4C4CEE7;
	Wed,  6 Aug 2025 17:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754501947;
	bh=sC3xqR0PE11fVdcrxja9ytXlDo8MBamvw+7NE88bt8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGeb6EZUlNe9NsKLmyBHXf+7FA8adUHNspzFF6Jzf+vcJ207Q7Cs/HgwnhHVfnx3o
	 ah5CeWmiCiCeLqjMA+XoLMXSvufwYxg0udJdObZB3tFgLzfbaoNGEim6wbwAh6C6p+
	 CHh9ZL8u6t9aD8OobNVPBITBhDRhJjf2wrHk+tYvXU4GcdNb+0y2m5Z6BIIfLrLgMa
	 GJ7SPeyWJtD38+wMKgm/ON3nRBHhXPX7X6azct7pGsb+ZKO6A7frxl1Bd63ZoKXGzX
	 AbwltQAN2hxQU4SaKGsKeV2otYypxi5oLtqhm7FwE42r/eZcBJArHRQ5MZabaeSodd
	 I8BNydrIGeRvQ==
Date: Wed, 6 Aug 2025 23:09:00 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Palash Kambar <quic_pkambar@quicinc.com>, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com
Subject: Re: [PATCH v1] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for UFS controller v5
Message-ID: <mhridnexscaevsmssu6k3l4x276cj63gl2rlvypym23kj2kgov@pw323zkhqcrg>
References: <20250806063409.21206-1-quic_pkambar@quicinc.com>
 <ucr4imzntw6ghcvpeioprmva7gxrqnkphjirjppnqgdpq5ghss@y5nwjzzpvluj>
 <c62c2744-0d07-4fe8-8d2a-febc5fa8720a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c62c2744-0d07-4fe8-8d2a-febc5fa8720a@oss.qualcomm.com>

On Wed, Aug 06, 2025 at 02:56:43PM GMT, Konrad Dybcio wrote:
> On 8/6/25 1:14 PM, Manivannan Sadhasivam wrote:
> > On Wed, Aug 06, 2025 at 12:04:09PM GMT, Palash Kambar wrote:
> >> Disable of AES core in Shared ICE is not supported during power
> >> collapse for UFS Host Controller V5.0.
> >>
> >> Hence follow below steps to reset the ICE upon exiting power collapse
> >> and align with Hw programming guide.
> >>
> >> a. Write 0x18 to UFS_MEM_ICE_CFG
> >> b. Write 0x0 to UFS_MEM_ICE_CFG
> >>
> >> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
> >> ---
> 
> [...]
> 
> > 
> >> +		ufshcd_readl(hba, UFS_MEM_ICE);
> >> +		ufshcd_writel(hba, 0x0, UFS_MEM_ICE);
> >> +		ufshcd_readl(hba, UFS_MEM_ICE);
> > 
> > Why do you need readl()? Writes to device memory won't get reordered.
> 
> I'm not sure if we need a delay between them, otherwise they'll happen
> within a couple cycles of each other which may not be enough since this
> is a synchronous reset and the clock period is 20-50ns when running at
> XO (19.2 / 38.4 MHz) rate
> 

IIUC, the second register write is just reenabling the mask, so there is no
delay required between these two writes. If that's not true, and if there is a
delay required, then do:

	ufshcd_writel(0x18);
	ufshcd_readl();
	usleep()/msleep();
	ufshcd_write(0x0);

- Mani

-- 
மணிவண்ணன் சதாசிவம்

