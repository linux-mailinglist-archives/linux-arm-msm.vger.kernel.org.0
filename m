Return-Path: <linux-arm-msm+bounces-88589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1BBD13C44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 16:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 771BC3007665
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 15:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0568E35E54C;
	Mon, 12 Jan 2026 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vEL+rdVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AABF35E541;
	Mon, 12 Jan 2026 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768231896; cv=none; b=c6fVHFGbVOMso4xUsfVUHTnvExAr9uVryfs5OkZ7Y7TctuIytyZNvAuCd4nqVwdZVVJ1qKqIlwNMRA9UAS1QBo5JWh26XRGxfXYvUcQD/x/UXj6I1Mqzwqjol2F75WcYCRRG9coQTYonhUW3a3aKvTuvHzV/AZDwyZH0M2COiYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768231896; c=relaxed/simple;
	bh=OBaVQYuS1mUWyoZ4+IBpOkYK91j/GZXfPKqvIk/pfQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJLNBdLgbPgw/IJyW91i9FU3PU7g6OAz3ASBPrgGvQIRchjYFPcl+PdUZMj/F/7gBhVT2qnSAEecg6sTfozRG8sRAJwtcWwwLj4vAQWSEsXVxj+aI94+PSkF8FlwwN8SfRycg1UVhuZqlVIqMuD0CJA2UZ2+7JkzSeF+oCHmbBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vEL+rdVH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C1FC19422;
	Mon, 12 Jan 2026 15:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768231895;
	bh=OBaVQYuS1mUWyoZ4+IBpOkYK91j/GZXfPKqvIk/pfQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vEL+rdVHMtCSHY/1kjJs/YjQ1Hl/UrLLVm4+Xv+J6qzNKJDDVZfY3i2vCwdLgXumy
	 FGVg03NGKgVlRZhlkUT5y93tjGuBxgqJzRK6yEIiRr+lc+xXNS8891PS1Epho6P5r+
	 mLguZFfFEZAdAuJKUECRC9DX7/FWespLaNSgpUHqrXlx1PzF/qvfhEWoPKabzuyktp
	 fM6gawbrGMSDVUIpL71XQCwxzKUrNS5U+waDA3r8hvFWSSUEh/j5dDsvSILCQtVJt+
	 17DDbfYQzfZPloLS/21dAYzEYADOTA2BQUPx2aoR7i6DjzIvfXAVaAb2rK5MTB+b3z
	 Hs7sZ8YmocbNw==
Date: Mon, 12 Jan 2026 09:31:34 -0600
From: Rob Herring <robh@kernel.org>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/4] Add Qualcomm Technologies, Inc. Talos EVK SMARC
 support
Message-ID: <20260112153134.GA215739-robh@kernel.org>
References: <20260109095221.2847067-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109095221.2847067-1-tessolveupstream@gmail.com>

On Fri, Jan 09, 2026 at 03:22:16PM +0530, Sudarshan Shetty wrote:
> Hi all,

From the mail headers:
> Content-Type: text/plain; charset=y                                                                        
> Content-Transfer-Encoding: 8bit                                                                            

When git-send-email prompts you for which encoding to use, the correct 
answer is not 'y'. The default utf-8 is correct, so just hit enter. 
IIRC, newer git versions fixed this.

Rob

