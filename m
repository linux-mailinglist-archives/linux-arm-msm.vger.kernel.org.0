Return-Path: <linux-arm-msm+bounces-66038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C5CB0D6F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 12:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F306018957AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 10:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B57A2DCF4F;
	Tue, 22 Jul 2025 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qaNW1cSX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F53623CEFF;
	Tue, 22 Jul 2025 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753179022; cv=none; b=jMcGATd20mtH9Bd3RvsR0O5x3hNXaEYYxE6zmfcnyqm2hgLuQ957/VCFoFg36+R9C1ANdmFOYMmHNprBGYsiO/bRvJTaRg6JNIY3f4pcDIxLPPJa1uMNOc/9z9PrZPHWQOMr3GNQ1LyfgzGrSGGSQAtVYuCjVeUUYmP0saqFym4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753179022; c=relaxed/simple;
	bh=zry+6/DEBDqbzAcnz4iOImSYYy30ydmUGJusGB7gDp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpVu+48Xnt79c+tQNZ4JRG8eXI7Y3gyt9LHob57Wgzp7yi1N3Hg8E6VEbuP/9FcQs+dHIplmL6Zq2WBT48Rol+utGyGUW1LjQysQYJJJdovsIC9kqNFRx/M62Zf4pXe/olhtgLiVLA4zpf8QH4GwcHRZ9wj1gdSJwnPtvAKOCNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qaNW1cSX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B59EC4CEEB;
	Tue, 22 Jul 2025 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753179018;
	bh=zry+6/DEBDqbzAcnz4iOImSYYy30ydmUGJusGB7gDp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qaNW1cSXSkmjstENcKf8zMlowefgIxlAnBSaoBt/w7MOtlBdCmgo/ZEYi24sCF//N
	 pJfwXntf73Lu99l8Ufr9QykPYgNqMBVDCWcyXsr0tnuq/jS2T96HouGnnnuAGjIZhd
	 5mMlQmueAdkZTZaAkdHuNFanGUztTCfAOiOTMIF0=
Date: Tue, 22 Jul 2025 12:10:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Melody Olvera <quic_molvera@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
Message-ID: <2025072210-skier-specks-b043@gregkh>
References: <20250721-eud_mode_manager_secure_access-v6-1-fe603325ac04@oss.qualcomm.com>
 <2025072141-anointer-venus-d99f@gregkh>
 <CAPHGfUOsk4BjhvGiN-b0UP-JZ48UvGeKFU=dhb=KOAvo8NCPZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPHGfUOsk4BjhvGiN-b0UP-JZ48UvGeKFU=dhb=KOAvo8NCPZQ@mail.gmail.com>

On Tue, Jul 22, 2025 at 03:30:11PM +0530, Komal Bajaj wrote:
> On Mon, Jul 21, 2025 at 12:23 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Jul 21, 2025 at 12:08:41PM +0530, Komal Bajaj wrote:
> > > EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> > > as read-only for HLOS, enforcing access restrictions that prohibit
> > > direct memory-mapped writes via writel().
> >
> > What is "HLOS"?
> >
> 
> By HLOS, I meant operating system running at EL1. Do you want me to
> change this in the patch?

Yes please.

