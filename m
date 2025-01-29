Return-Path: <linux-arm-msm+bounces-46529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D183DA221FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B63FD3A61F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 16:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA8D1DFD83;
	Wed, 29 Jan 2025 16:43:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9032143722;
	Wed, 29 Jan 2025 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169025; cv=none; b=L6EiBtmDbTtaM2jj9VBLcwIV42ofRaKdtyLJ1LFCEAaIVSyFPWwdlVaBpkl2LrxA0qSSPmfbyEvxZ/MVcZPu03WamwloDClroSlZe05vIpt/TCkufjTOAYhon/cG25c4HUx/L8QuU7mOHfl35AZTyMGlnlbWy1ABTPJ8aUwfAuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169025; c=relaxed/simple;
	bh=bjXQS+WjTj5gxQTd/SKBqciWrxIb/RWjnWTomQ1YQpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcXZjYhPAPpwfJSbF+V/jkIxXTt7Uy1m7GIMzl3vlgQGfjMjq6KISkfCwjPOuRXEX1vxwbPzPuTaK4YTZyrMUE4x4sYkqS/UCMooTvBm+uSJYGZdmG+RALmOpBujFVcarJy5vdVBLr2JqitBVuUaB+K5ZbgVHW33voKajPYspLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F04791007;
	Wed, 29 Jan 2025 08:44:08 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B1F53F63F;
	Wed, 29 Jan 2025 08:43:38 -0800 (PST)
Message-ID: <af19e188-97d1-42a1-aa2f-4792784c701b@arm.com>
Date: Wed, 29 Jan 2025 16:43:34 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: errata: Add newer ARM cores to the
 spectre_bhb_loop_affected() lists
To: Douglas Anderson <dianders@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>, Julius Werner
 <jwerner@chromium.org>, bjorn.andersson@oss.qualcomm.com,
 Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Scott Bauer <sbauer@quicinc.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250107200715.422172-1-dianders@chromium.org>
 <20250107120555.v4.5.I4a9a527e03f663040721c5401c41de587d015c82@changeid>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250107120555.v4.5.I4a9a527e03f663040721c5401c41de587d015c82@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Doug,

On 07/01/2025 20:06, Douglas Anderson wrote:
> When comparing to the ARM list [1], it appears that several ARM cores
> were missing from the lists in spectre_bhb_loop_affected(). Add them.

It's a moving target!


> NOTE: for some of these cores it may not matter since other ways of
> clearing the BHB may be used (like the CLRBHB instruction or ECBHB),
> but it still seems good to have all the info from ARM's whitepaper
> included.
> 
> [1] https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB
> 
> 
> Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
> Cc: stable@vger.kernel.org

Reviewed-by: James Morse <james.morse@arm.com>


Thanks!

James

