Return-Path: <linux-arm-msm+bounces-79820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1C6C23C9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 204253BE7E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 08:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0231A285C8C;
	Fri, 31 Oct 2025 08:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHb/SkMi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D077F257AEC;
	Fri, 31 Oct 2025 08:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761898529; cv=none; b=aRvl0YEVzlTB6l2kJXC8Z5IudV0ZENEsA8pAMBgWkEhySXr91SegG98/EDFdq76PJh/hOVguK5lQ4k+ciZcBKLF2yA/ILUSTheXtVimsXSD8roHR6VK4Gv3Gk7GFKDrcU2I10eHbYlFbnrNs8RvPGyKIYFHx2QXWwnSIobnao9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761898529; c=relaxed/simple;
	bh=LpMT6+KdYml7IMGouPrjUtsmwkVq4998zVK5tNtOfIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzFaR1Wmq8IeHVjxaPt8WHHR77sSixsypN703FKPdkabHMy0r6vU0o1cnPpGegPSQIlkLsSHrgwQ6BrquxOxoJgkkzkKtAilLoCYk/BQeoMtevDAeR8GmnbPo38N4CkcJXvgLpQVEkPPFLnxtGObjB4y0Wt1jMVi8kNJDjK7KAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHb/SkMi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7722EC4CEFB;
	Fri, 31 Oct 2025 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761898529;
	bh=LpMT6+KdYml7IMGouPrjUtsmwkVq4998zVK5tNtOfIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fHb/SkMiLB1KIJCF8ifz25lBccCapXvWtnBNrraT5G3gDKud3anb6rbeTopV+RmaW
	 IcnNnOLWVsNAf8tBLuFWDlRBqz7dnuC5OuIJfPx6XjafqoLUMSCJLVj5fPQxusri9k
	 y3rjeSHd2TXpbTd/N95PNIhJCwgr0y/pfnX3TIS4mMaxyDhyvti/jaEkAmEvYvTR/H
	 TF6WuEUhsDZ2P/VAqFufF1eIxgt7YwKmhfmGACao6fa/7OfcPHccN3mmKXV37mhM6l
	 NoD7/CcKjzg9KyXd0yL65qUAp8EGr40xfsCSGIVLwZX7XhdbuuoNOSJdNF3zaYKTc/
	 AFt64KnQFbpew==
Date: Fri, 31 Oct 2025 13:45:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	bjorn.andersson@oss.qualcomm.com, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [RESEND PATCH] arm64: defconfig: Enable SCSI UFS Crypto and
 Block Inline encryption drivers
Message-ID: <w52ajxs5rszlw5tyuezgf5ym2sz5nqnqlm2bbvbfvqy2rbth6v@jttotxort4rb>
References: <20251030095509.5877-1-manivannan.sadhasivam@oss.qualcomm.com>
 <27841a96-b8a5-44aa-b0ef-d8bab9ba3477@kernel.org>
 <2oynmuekw5lnzl244uqz2aehpg5rhttddu43lqplnxemyjd3g5@6yzchzihe57h>
 <6f9dd9f2-5b4c-4600-a537-d7c8e1ad0f9b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f9dd9f2-5b4c-4600-a537-d7c8e1ad0f9b@kernel.org>

On Fri, Oct 31, 2025 at 08:45:38AM +0100, Krzysztof Kozlowski wrote:
> On 31/10/2025 07:24, Manivannan Sadhasivam wrote:
> > On Thu, Oct 30, 2025 at 08:48:48PM +0100, Krzysztof Kozlowski wrote:
> >> On 30/10/2025 10:55, Manivannan Sadhasivam wrote:
> >>> These drivers will allow using the crypto functionalities of the UFS
> >>> device, like Inline Crypto Encryption. Both of these drivers are of type
> >>> 'bool', so they cannot be built as modules.
> >>
> >> Is there any device benefiting from these? Which board?
> >>
> > 
> > All ICE capable Qcom UFS based boards.
> > 
> >>>
> >>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >>> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> >>
> >> You do not need the second tag. You send it via oss.qualcomm.com which
> >> is still valid.
> >>
> > 
> > Yes, I know. But I was having some issue in sending email through
> > oss.qualcomm.com. Now it got fixed in the RESEND patch, but forgot to remove my
> > korg s-o-b.
> 
> 
> You do not need second sob when sending through korg. Your previous
> identity was still valid. It's used only when old identity is considered
> revoked.
> 

Hmm. I thought the s-o-b should always match the maildomain from which the patch
was sent.

Thanks for clarifying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

