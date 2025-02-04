Return-Path: <linux-arm-msm+bounces-46890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D51DBA27CA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 21:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5538C3A4653
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 20:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F96921770E;
	Tue,  4 Feb 2025 20:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9g/HURu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B83204589;
	Tue,  4 Feb 2025 20:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700243; cv=none; b=F6UR/2LiB9nWwAkFBp7oo6IWaWlfyiuyHpyWw0dyFPwfgeksa9+32trqeVNPHKV8UEafX6RQj7dcNOoPOhEr/WKyN2Ec5CWLGJNdtqIqR/g826oduf603DUOVzev1IYtYKZX6IO2Q/4fR+D8I8trnboQGJLuDdzReJRi7y3gv84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700243; c=relaxed/simple;
	bh=IKMAu70GzvirZvYxshlYPGHmROyQyEcux2lL2QHCxaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edoRPt7J/onBIGaDuo39jjB8p2T/wKO+RTOm+nh1TYgoqdi9T3LhlB5eOAIhT0w+jdsEPmlLKGvDXubTZPpCYU2jhDsy4/5Ed99vUgVmCjFet9yAhy29DZRlZWKJZto02cBTIJKwdeqO2MzdWBeFI0/L7slELZhjuzpX+1+IUeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9g/HURu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA1DC4CEDF;
	Tue,  4 Feb 2025 20:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738700242;
	bh=IKMAu70GzvirZvYxshlYPGHmROyQyEcux2lL2QHCxaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9g/HURulPRDTLy0bT4Tx2NAvCXF/ZfmBcqpLRlEkQRY59mNuCYBbXfDe7G38O1Gv
	 Uf4Rcf7ywDbMwtiXXTmuifLH5hWWZzdS77Wjoim8FQI0vdAcjUBriuvxD6OnQQo/uV
	 ESSNLi0QoXHUCrGLEaqsjWRrVFKM9Q7ot8auvvYNe2P+83grgmKeCm/8wwnnOosJOt
	 eerLuU3bst/NDF0hOpFLpHy+Q/wyEI/b4f+K3nf8lKPmtn7VXzTg9lTgcc+oMgRtj2
	 OMvDG3fcyxxr0Ct54jz8U0+KC6DprkpoMWE3N56M33qKDB7lF8hHVfpvmqj4AKLfuw
	 Szpj4RuFHKZwA==
Date: Tue, 4 Feb 2025 15:17:17 -0500
From: Sasha Levin <sashal@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.13 1/8] soc: qcom: pd-mapper: Add X1P42100
Message-ID: <Z6J1zR0Hon1pe6NA@lappy>
References: <20250126164523.963930-1-sashal@kernel.org>
 <Z6HqNgy_jUWwkMnV@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z6HqNgy_jUWwkMnV@hovoldconsulting.com>

On Tue, Feb 04, 2025 at 11:21:42AM +0100, Johan Hovold wrote:
>On Sun, Jan 26, 2025 at 11:45:16AM -0500, Sasha Levin wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> [ Upstream commit e7282bf8a0e9bb8a4cb1be406674ff7bb7b264f2 ]
>>
>> X1P42100 is a cousin of X1E80100, and hence can make use of the
>> latter's configuration. Do so.
>
>This patch does not have a stable tag and makes no sense to backport as
>support for this platform is not yet even in 6.14-rc1.
>
>So please drop from all stable queues (if it's not too late for that
>now).

Definitely not too late - patches without a stable tag sit for a while
in case anyone points out they shouldn't be included :)

I'll drop it, thank you!

-- 
Thanks,
Sasha

