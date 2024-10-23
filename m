Return-Path: <linux-arm-msm+bounces-35630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C74059AD669
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 23:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ED50283C8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 21:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133A31E7C2C;
	Wed, 23 Oct 2024 21:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/cwhaW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C01494B3;
	Wed, 23 Oct 2024 21:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729718017; cv=none; b=jkpiIMVw36UDw05jsDNIeuHSuV2VmCKheNBmTz56uv9Hj8hOkV9q9sv2p9HlCUeh3QJDSrSw0dYSgDc/HkQrwwBfNAcLoFCKKWg6OmoxoqO7X5T0fe6myKxm4t5WAhC5SJr3ZcHo+nKo/LUOmRMyKOGOdPgXLWUqKh9wLy18Uw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729718017; c=relaxed/simple;
	bh=zsmVjv21RMn76butEOpsWJcI2TYJWi/sF1DB3MFPv94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2YNWPuSq4zJdaCHMJExiEldAcxkSoaEZ8ai88V8kENlSTqEsG44gVVGFaf+mVWiFb5I+XDzv9uLjEhgaP56H18VP7+yJy9JAGwX6eGisli3lW4xs5dOmrOkKKQdUBC3nRYIldaV1kkmgiiOwkucjdUezAvh6AcGY5c3HMXxlE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/cwhaW7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EF1C4CEC6;
	Wed, 23 Oct 2024 21:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729718016;
	bh=zsmVjv21RMn76butEOpsWJcI2TYJWi/sF1DB3MFPv94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/cwhaW7N2vBEZ6cVip97rzXSnnEDH7ZonkjY00ZXl2E85bHMVO5atOA+wUTFpVtQ
	 uyGJpn6B1MxzgpzJYxRRXZe2NtnaRHiUx37ztrmKP942TnMb3lFcAWls1pqAJ3XPgf
	 41grfYZE1+DDUuIcobV2FFVIeVlAJoBfGpDY+iIkQ7whAZrzsI09GQTJVxClNH/hyf
	 9H7ipx849WqxWF+21dsSrBc09wnYpP6fIZJkwzYpIri0+hPu7mObvfGSrWXRjxqdRM
	 7WF9MkEFxVZjsx3+YuoSCtRbpatU9Ujfid+qirGTXcGoQvp1S7wy+9TlWxH/hDQ/PA
	 lTQkYS9HuXBEA==
Date: Wed, 23 Oct 2024 16:13:33 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Chris Lew <quic_clew@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: pmic_glink: Handle GLINK intent
 allocation rejections
Message-ID: <2j4hro2vuu2sprc26v5uh4fqyjtel6m7ko5mkhaf45rmxvhlm4@jjnbe3oqmkpy>
References: <20241022-pmic-glink-ecancelled-v1-0-9e26fc74e0a3@oss.qualcomm.com>
 <20241022-pmic-glink-ecancelled-v1-2-9e26fc74e0a3@oss.qualcomm.com>
 <ZxfFL8eVs5lYCPum@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxfFL8eVs5lYCPum@hovoldconsulting.com>

On Tue, Oct 22, 2024 at 05:30:55PM GMT, Johan Hovold wrote:
> On Tue, Oct 22, 2024 at 04:17:12AM +0000, Bjorn Andersson wrote:
[..]
> > Reported-by: Johan Hovold <johan@kernel.org>
> > Closes: https://lore.kernel.org/all/Zqet8iInnDhnxkT9@hovoldconsulting.com/#t
> 
> This indeed seems to fix the -ECANCELED related errors I reported above,
> but the audio probe failure still remains as expected:
> 
> 	PDR: avs/audio get domain list txn wait failed: -110
> 	PDR: service lookup for avs/audio failed: -110
> 
> I hit it on the third reboot and then again after another 75 reboots
> (and have never seen it with the user space pd-mapper over several
> hundred boots).
> 
> Do you guys have any theories as to what is causing the above with the
> in-kernel pd-mapper (beyond the obvious changes in timing)?
> 

Not yet. This would be a timeout in a completely different codepath.

I'm trying to figure out a better way to reproduce this, than just
restarting the whole machine...

Thanks for the review.

Regards,
Bjorn

