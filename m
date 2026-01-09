Return-Path: <linux-arm-msm+bounces-88250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 680A9D087CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 11:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B98EC308A7B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 10:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6225E33506B;
	Fri,  9 Jan 2026 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCug0o07"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9EB329390;
	Fri,  9 Jan 2026 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953279; cv=none; b=ft8359oT2yeF5zCM5RaYfuQM20NmxQ9jTfnulXeYSFzl7blM+0Zcn3ITnalWQoJysLvwi/2y8QPUttvPAgLjweLY7KYO8QPQjTteozHPTcdzwW3QrFLNmIwsCQ+iYcyufNiF4zNYgl/WCi6KAisvki8GOWSBC4jfl7OQ2Oz+SWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953279; c=relaxed/simple;
	bh=xZDFT6xCQrfp5temujsjrNIgKlzKzOPx2SZayOPArss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPbERse8Eq+u1QvReTkNuA6hK0+lItNbY3r8KD8im9mTl40MfUkebe+CAqqw9rj+kAPiT91QjFuuR3q7HObYJJB6Fp/rxe6mD7pEKWHwlCZSR9sDizioCqvH7ITKAuO3qPHFAoJNxisEqVf+zLhp+tCD8dohhiuvyEtBoSXQc6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCug0o07; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A3FC4CEF1;
	Fri,  9 Jan 2026 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767953278;
	bh=xZDFT6xCQrfp5temujsjrNIgKlzKzOPx2SZayOPArss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZCug0o07zRJc7azyDc2VOX0WzPDeP1XOCBz5jQV2/prrV58cdklK8RkyDJd651mtz
	 BQI7U0grLV4s9kxz+T3uOCo28sF3aPuAzWczllwv1DM1GWMKgy9/WubJtPzT+uiygK
	 m3Qq+cv0xeHX9YhCGMVm18/ywk5EDdJ7mUoaZGZ39jEkapntUJa6m5HPMJiB9wAJsU
	 ru/Ti1m8NQxSxP1QT43o7MMa0W8F7+j9WnqndO42YCav4NAFEWATYRi7ef5pTZjccb
	 9u2AFR1oM3bpKj9Db+xptHZoJ164IuyPtf364s8UcXAGJNX1wJXIYgRT+Xqq7z6uAX
	 OnIyaCw+l00tQ==
Date: Fri, 9 Jan 2026 15:37:49 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com, lumag@kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: agatti: Address Gunyah memory
 alignment needs
Message-ID: <aWDTdYYVkFjfw4-C@sumit-xelite>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <20251229071258.456254-2-sumit.garg@kernel.org>
 <ahbbg3pffedrjzvksgz2jv7lwajwlcxc6nsmmtunwc4346eawa@xayff4ozvdbn>
 <aVtQHftDmENIAxrb@sumit-xelite>
 <73bcf4c8-3d49-4b55-a771-0c5c1ef54380@oss.qualcomm.com>
 <aV-L81f5NQg4leu8@sumit-xelite>
 <ba3f479d-1233-4e6a-8593-5c7fe5e79762@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba3f479d-1233-4e6a-8593-5c7fe5e79762@oss.qualcomm.com>

On Thu, Jan 08, 2026 at 01:43:30PM +0100, Konrad Dybcio wrote:
> On 1/8/26 11:50 AM, Sumit Garg wrote:
> > On Wed, Jan 07, 2026 at 12:29:02PM +0100, Konrad Dybcio wrote:
> >> On 1/5/26 6:46 AM, Sumit Garg wrote:
> >>> On Sat, Jan 03, 2026 at 09:49:04AM -0600, Bjorn Andersson wrote:
> >>>> On Mon, Dec 29, 2025 at 12:42:58PM +0530, Sumit Garg wrote:
> >>>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>>>>
> >>>>> Gunyah hypervisor requires it's memory start address to be 2MB aligned.
> >>>>> So the address map for Agatti is updated to incorporate that requirement.
> >>>>> This should be a backwards compatible DT change which should work with
> >>>>> legacy QHEE based firmware stack too.
> >>>>>
> >>>>
> >>>> How come this isn't conveyed to the operating system using the UEFI
> >>>> memory map?
> >>>>
> >>>
> >>> I agree that with EFI boot, the information is getting conveyed via EFI
> >>> memory map. But there will be non-EFI boot scenarios as well in case of
> >>> U-Boot. And moreover I suppose we need to keep the reserved memory
> >>> ranges in DT updated to reflect the actual memory map.
> >>
> >> Can U-Boot not do the same by altering /reserved-memory or /memory/reg?
> > 
> > I suppose you are referring to DT fixups here, we generally try to keep
> > them to a minimum required in U-Boot.
> > 
> > BTW, don't we want to keep reserved memory ranges updated in DT? Or we plan
> > to drop them altogether?
> 
> Generally I believe they're only a necessary evil..
> 
> Since Gunyah-on-Agatti doesn't seem to have been released yet, it would
> seem like a sane idea to fix the issue in the firmware. If it was, well..
> 
> On UEFI-enabled targets, we can largely rely on the reservations coming
> from there, only adding some carveouts for e.g. PIL regions and SMEM (not
> because they're not resereved, but because we need a pointer to them)
>

Fair enough, I don't see an immediate need for this from UEFI boot
perspective. Let me drop this patch then.

TBH, I am also not a fan of putting the memory regions configuration in
DT which can change based on evolving requirments.

-Sumit

