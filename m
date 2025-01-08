Return-Path: <linux-arm-msm+bounces-44474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D285A068CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 532193A6381
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5591D204C22;
	Wed,  8 Jan 2025 22:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwxFpZoK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD7219EEBF;
	Wed,  8 Jan 2025 22:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376710; cv=none; b=FkMgvrNeZJd0tf3eVws+0px4Sp//oC6lzf25zIeTNVDXileMZjND44IeVNp4jTimA967/TBJ+h1/4wyl4mbnwFlZr50Fx5G3dUvnY8jz79qlTT/A47LMTOG9kTi3eXGxoVnrGa6MaRqormg+kdZak9q0oojNQlOVqHIWeYqGVMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376710; c=relaxed/simple;
	bh=34LjuJ5bPfofDGxa8K0A7scuz185lT1MGHOyPUMSi78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ti3kUfnhc/PTHAZ7diQe6eon+PnJpG4Hwl15/TGM/OCvjFwqajjaIfLGNpaQXVUn3uQ/OSgyvjnrfNvyQInz/VIDnH43wdnqNX9nwCpBcslToFXGTgC1syAoqPiAQhauWHOxcuj2UzXzQ1jRbhVfZzT9vXPUJST2zWLDOCIwMOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwxFpZoK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64961C4CED3;
	Wed,  8 Jan 2025 22:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736376710;
	bh=34LjuJ5bPfofDGxa8K0A7scuz185lT1MGHOyPUMSi78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NwxFpZoK6lJOFoXAhNB74ytJB5cJiI9+euYwZCKdUpwchsEdP8CkybEgypsT3S9aG
	 jQV9o2jRUWGvLKFMn3THoqtnAT1IcyHEioRSk+HSHQYLy1YMEwnDViv8d4y6IxKlLe
	 YqsTP+ZNbSVlKj9Wb0jlhhYSahHiShLUN1cA7Z5FoEciz1ZN3UIwtOv02IRzTFSiiE
	 juvm7KWPEil+pgZFUe2+z5JO/EWFurfKGb9rDB6E3E1y7vLq4coPHHUCjFwS0HVDAA
	 xMsw3BLLaPI0CvTEz79N35kmL0Ep/nn/8E1wh7XFuxx2AWfmebiNYzcSzKG+dcQD6Q
	 9p4qVM5XnbLbQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd_mapper: Add SM7225 compatible
Date: Wed,  8 Jan 2025 16:51:42 -0600
Message-ID: <173637670470.158785.17315728222693452905.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220-pd-mapper-sm7225-v1-1-68f85a87288d@fairphone.com>
References: <20241220-pd-mapper-sm7225-v1-1-68f85a87288d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Dec 2024 09:39:44 +0100, Luca Weiss wrote:
> The Qualcomm SM7225 is practically identical to SM6350, so add an entry
> using that data.
> 
> 

Applied, thanks!

[1/1] soc: qcom: pd_mapper: Add SM7225 compatible
      commit: 8e6854efd4738d3c9e6fdfeff8df726d454d4c7d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

