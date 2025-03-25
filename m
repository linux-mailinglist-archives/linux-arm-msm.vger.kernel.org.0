Return-Path: <linux-arm-msm+bounces-52436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C4A6EBD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 09:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 195E1166F8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 08:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E824D253B4B;
	Tue, 25 Mar 2025 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/yaiK2p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAACD2528FC;
	Tue, 25 Mar 2025 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742892012; cv=none; b=t3sOKlrTj1fTsdCBK6pR9oIACyyoQO3Xeouo3XReNYn/ACRhqfo20c7khkEz9n1cks/7AcOT5buXJYkc4yg7AX2TSnd257tlU0DgCNYrRwWBeVjUHF3ose6wJktXQvgy32ndYjPfj0UZ2LoBqM4qavWQ3IMJghc3shUname3eA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742892012; c=relaxed/simple;
	bh=TmbIfPtYUt67veZyLFjjXPG9cmLVbl41Uz+cN4Rbh1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJ6rBBm2JFexFE587EWR2Y3pQPywELi70sM621rTyoZebyy3XApQdjNkAub8IEudCqbt8IKviIYWzON5qH1I3Abr1CP9vTtEmjh5+xFHEnVlKCRofdfTrHD3dEuJQqgPj7dnkK7CSp1k7HcDX3SPus6anNIqwKEPDbERruUXSO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/yaiK2p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED7FC4CEE4;
	Tue, 25 Mar 2025 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742892011;
	bh=TmbIfPtYUt67veZyLFjjXPG9cmLVbl41Uz+cN4Rbh1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/yaiK2pJqDobKbMh9KEAlyuhCiEvIaLg8OXQY/Q7jMt4tJ30uNF+R6QdPB2nae4i
	 4CznQfTW0I4kZzMEyeqxlqIzG5Yi7XD8tabzD3jdOgilS++NMMeNqtq0Ca7EXp/Xeo
	 Hul+knbtAy1+jMMbuOCDnH25JDAbB3mzezJhw1sqS1m3x63Aack0sLdhdKwGAiRRbE
	 SldkytJCqWXI/v85kzu3MyXSHBVhL3GmJciCN4D//GNpKp8fJwd7FeUz26QcNGtRPn
	 tnEcmD8vRjoLAj7S9U6AFybH9YISUFV6A+kEtNOonzeUaXxeyw3NbWukmgcI0yx8F3
	 Z3kZqHbDcs00A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1twzpU-000000005ti-0M1v;
	Tue, 25 Mar 2025 09:40:12 +0100
Date: Tue, 25 Mar 2025 09:40:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Clayton Craft <clayton@craftyguy.net>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: fix spurious DP hotplug
 events
Message-ID: <Z-Jr7MifpkR8cL5B@hovoldconsulting.com>
References: <20250324132448.6134-1-johan+linaro@kernel.org>
 <7f161a25-f134-44cd-a619-8f7b806a869d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f161a25-f134-44cd-a619-8f7b806a869d@oss.qualcomm.com>

On Mon, Mar 24, 2025 at 08:21:10PM +0100, Konrad Dybcio wrote:
> On 3/24/25 2:24 PM, Johan Hovold wrote:
> > The PMIC GLINK driver is currently generating DisplayPort hotplug
> > notifications whenever something is connected to (or disconnected from)
> > a port regardless of the type of notification sent by the firmware.
> 
> Yikes!
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> That said, I'm hoping there isn't any sort of "port is full of water,
> emergency" messages that we should treat as "unplug" though..

Seems a bit far fetched, but I guess only you guys inside Qualcomm can
try to figure that out.

An alternative could be to cache the hpd_state regardless of the svid
and only forward changes. But perhaps the hpd_state bit is only valid
for DP notifications.

Johan

