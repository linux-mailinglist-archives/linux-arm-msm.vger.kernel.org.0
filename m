Return-Path: <linux-arm-msm+bounces-71867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEEDB421A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB1B27A694E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10C2302779;
	Wed,  3 Sep 2025 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8ibBCI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FDD301031;
	Wed,  3 Sep 2025 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906093; cv=none; b=XvXmHBUVsOhNjAmj8bBASVxlHpVNrRJOlueeTc0GrVcHXVZu4XpIRSS0peKGLuWNi5Bk555JrBiZnoHHMbwQUmv5LkbfQQ9GCn3eTVk5arbfCPsj8voXNt8uvbdzcep+J5iOtHZEvmq6qCQcsQWhYxprO/pYDobMa6TMORSyUvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906093; c=relaxed/simple;
	bh=aXS7u9zDg1qPgO7wVuVYj2EMtRmtwS0TA/MuDvCgfKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNWf6bYTG7h+St02UnxX+aQBhgcVSvC8DY58p99IanUmx6GlpQurKAHyTretKx3sBIchQT4+11qXuNFCGay7rRy1NQOQQLfQzXqjLLUhYR+qk0NWNh/5+aLWXlfohCQiIQvkim21ZvrRvqSqL9URNaumQhtwZeTgOAIn/TGUNY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8ibBCI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF86C4CEF0;
	Wed,  3 Sep 2025 13:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756906093;
	bh=aXS7u9zDg1qPgO7wVuVYj2EMtRmtwS0TA/MuDvCgfKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8ibBCI/s9pdz130Z7x27NT6GABCl8/8TkGAfAkLjLw6gPb2IHuiEzs2ycM69dhrj
	 KUpfgIoND179IaGhsGRQrtA+n8Awy69rEgpYHjmnLzEFLd9wlB5z9EiOqMbc9O/6zq
	 A5eXVIuYdjklw1HjPPEBbTVfLl09GlBLiPZs15hwtA/vR+GVsgWamtcv282KYCItbA
	 z2kJ5IeM/4OX3c6ZV88fB6i0dyiF8L3vWeysW+zUBPU6Uy2OnpR5VaWETbEXFePE1Q
	 kDPWEVsqfaOHTnksJTC0UqzJHsI92swUBl1Y8GgT7WiKf2O+ZMl42OiUW9K9bKRu9r
	 4AQOq0dhmJVSg==
Date: Wed, 3 Sep 2025 18:58:04 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V3 3/5] scsi: ufs: core: Remove unused ufshcd_res_info
 structure
Message-ID: <jzxvodlzamuta5cgupp7upkh2wjmi4n6gdvj5vceawhvw2kquc@hm4kz2qt5u2k>
References: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
 <20250821112403.12078-4-quic_rdwivedi@quicinc.com>
 <1ccecf69-0bd8-4156-945d-e5876b6dea01@kernel.org>
 <1efa429d-7576-49da-a769-b1eba9345958@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1efa429d-7576-49da-a769-b1eba9345958@quicinc.com>

On Mon, Sep 01, 2025 at 09:38:25PM GMT, Nitin Rawat wrote:
> 
> 
> On 8/21/2025 5:18 PM, Krzysztof Kozlowski wrote:
> > On 21/08/2025 13:24, Ram Kumar Dwivedi wrote:
> > > From: Nitin Rawat <quic_nitirawa@quicinc.com>
> > > 
> > > Remove the ufshcd_res_info structure and associated enum ufshcd_res
> > > definitions from the UFS host controller header. These were previously
> > > used for MCQ resource mapping but are no longer needed following recent
> > > refactoring to use direct base addresses instead of multiple separate
> > > resource regions
> > > 
> > > Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > 
> > Incomplete SoB chain.
> > 
> > But anyway this makes no sense as independent patch. First you remove
> > users of it making it redundant... and then you remove it? No.
> 
> Hi Krzysztof,
> 
> The driver changes are in the UFS Qualcomm platform driver, which uses the
> definitions, while ufshcd.h is part of the UFS core driver. Hence kept in 2
> separate patch.
> 

No, that is not a logical split. When the users are removed, the unused
definitions also have to be removed even if the definitions are in a different
file.

So I believe you need to remove 'ufshcd_res_info' in patch 1 and 'ufshcd_res' in
patch 2.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

