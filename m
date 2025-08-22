Return-Path: <linux-arm-msm+bounces-70230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B185B30A96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 03:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE8A9A070A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 01:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD882153BED;
	Fri, 22 Aug 2025 01:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXxv0pXy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E41520EB;
	Fri, 22 Aug 2025 01:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755824569; cv=none; b=uYeHVsPGUyz9Ue73WTV5uagXqevwFqh2VfYFvB5u8hyKgSR8Nso0CAiFjziqEasld4Ys6jAW5Ai/rx60sgbyQUwUIvben9yPGwtV0B54xySh1jjM+U1RFeDel9DUxQsZ3yMBbbMhhL6vd696Hsp+G/X67Xink209czImNmzj5b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755824569; c=relaxed/simple;
	bh=Do+uWpwv73DTWQtTzqO8te1Yb9ycS3Dsz6NZm5yWHXg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MqqZVl2K+T03NlxmQCOwLi+zxiG53L2rkQIY4EZGFSSGXFpZBmIE76y2vJyUxNpQidLYGjmkNF+WCqsIBa2CMj8RBoBmEHH0MjI5SmR6u6VYm/pm8I+yaPtV7qKmybBkXjS/Co49lnPVXyUR9gAhpV2WYdS4pg469fooJyD8kOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXxv0pXy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9AAC4CEEB;
	Fri, 22 Aug 2025 01:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755824569;
	bh=Do+uWpwv73DTWQtTzqO8te1Yb9ycS3Dsz6NZm5yWHXg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oXxv0pXyVgoC/6ztCj4LsjG6cm3CzXRVswNxabwEchCLFzY7jsaHbeJ2fjpgnE8Hy
	 Wnxb7rRGVYhxuzvR2eatn82AiLUKYYHj0Y0bdyTeSYhXTkp8+zdpaQZyBEOS30fTgS
	 UgDrX2wLSSM2HGR3g/0O5g3z51TTZC/1mkLg6z4WO9kSjuIGNtW7eAu/ap6i9PNtsX
	 7V0d0LyUO8Vmwqpm8kfQqVA7TdAjryEx0QgKzxFWsC/QI3EoUKE+cyCvh07A4G7b9W
	 QAw6EqefOr5JUsVIhowG8X7gVFl2C+aRdkhbFLTpj9fZ8RdOnYRGW0fFYNKuPmhrMm
	 jsqorgpu5lfzw==
Date: Thu, 21 Aug 2025 18:02:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Richard Cochran
 <richardcochran@gmail.com>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, taniya.das@oss.qualcomm.com,
 imran.shaik@oss.qualcomm.com, quic_vbadigan@quicinc.com,
 quic_mrana@quicinc.com
Subject: Re: [PATCH 5/5] bus: mhi: host: mhi_phc: Add support for PHC over
 MHI
Message-ID: <20250821180247.29d0f4b3@kernel.org>
In-Reply-To: <20250818-tsc_time_sync-v1-5-2747710693ba@oss.qualcomm.com>
References: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
	<20250818-tsc_time_sync-v1-5-2747710693ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 Aug 2025 12:25:50 +0530 Krishna Chaitanya Chundru wrote:
> This patch introduces the MHI PHC (PTP Hardware Clock) driver, which
> registers a PTP (Precision Time Protocol) clock and communicates with
> the MHI core to get the device side timestamps. These timestamps are
> then exposed to the PTP subsystem, enabling precise time synchronization
> between the host and the device.

> +static struct ptp_clock_info qcom_ptp_clock_info = {
> +	.owner    = THIS_MODULE,
> +	.gettimex64 =  qcom_ptp_gettimex64,
> +};

Yet another device to device clock sync driver. Please see the
discussion here:
https://lore.kernel.org/all/20250815113814.5e135318@kernel.org/
I think we have a consensus within the community that we should 
stop cramming random clocks into the PTP subsystem.

Exporting read-only clocks from another processor is not what PTP
is for.

