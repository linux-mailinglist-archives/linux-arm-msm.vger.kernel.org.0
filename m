Return-Path: <linux-arm-msm+bounces-27528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E465942D56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 13:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50C851C21C17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 11:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CD01AE84C;
	Wed, 31 Jul 2024 11:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIafMp8i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403481A8BEF;
	Wed, 31 Jul 2024 11:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722425821; cv=none; b=EJPmJlK+EaDy2gUJ7qiqMfUidqdPRahh/3+A2vGvRF5tb0Z6V6wqrmtfU6Us9yhAJahaFEXV0wAt5RgL0+Z9QdcWbzDbOQyAkkPTrW1uJH+WSnV4vt2/SBxtpevW210O5QZvoIIvbzP0ABYjjBheyPPAF3xElQMm0/fQNmIlU0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722425821; c=relaxed/simple;
	bh=2mhwWJxE5yx29WXEJC/VcAvSFAoWXPOnNXtcqC8T5fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ed5coCVDT1etjKXlKmvfKVBi4Qhg/rZ726c9WluGRvyHGhnR+89tcY9KXTTFubI/+utsr/ux6VoKwTrW5bvw4nx73vpLLS0Vc4Boj1qaaJcNPKYquSf2DFsil29oqyiSKp2Hk0hvgx6P12LJkrZRDEeQ5RCvfoDBQ7z0D4YVDOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIafMp8i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CEBC116B1;
	Wed, 31 Jul 2024 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722425820;
	bh=2mhwWJxE5yx29WXEJC/VcAvSFAoWXPOnNXtcqC8T5fQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIafMp8iM2uBcBfVUatyyh7A0wsTPD1tAkF41++0iXfKrRTvBGVE0VrU1Gi0zcX84
	 dq51xkDDgWxhg23vFQ2wFrhmVOmM5avqAJnRhgK4ZKyop4rdPms2QZ01HE1MwBR7Ao
	 87+t+yhTLPO8kzDsvYPFTyWNHTNEEI0266Z2UmItieR3hrNX5HWxw7yJi7686lHLjK
	 Cxtyr6UT5jRjkAhwhj+k+DpX3Z7oIWg5QSRYhnmz/n2Qrmhh0FV1a/c6zfIUz6UlaT
	 mlAGCmRTn3jsxz4OzRqkQkpHjHxvofIUskriY5loDOjXJQij4EvvaSLk9qOaqeOUwM
	 VsNjrViUncfnQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sZ7dn-000000007h3-1VJq;
	Wed, 31 Jul 2024 13:37:11 +0200
Date: Wed, 31 Jul 2024 13:37:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>
Subject: Re: [PATCH] phy: qcom: qmp-pcie: Configure all tables on port B PHY
Message-ID: <Zqoh5w9b8nGBw9UY@hovoldconsulting.com>
References: <20240726-phy-qcom-qmp-pcie-write-all-tbls-second-port-v1-1-751b9ee01184@linaro.org>
 <ZqO17rPoitKbUa_9@hovoldconsulting.com>
 <ZqoeXUFtBq-F3x1V@matsya>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqoeXUFtBq-F3x1V@matsya>

On Wed, Jul 31, 2024 at 04:52:05PM +0530, Vinod Koul wrote:
> On 26-07-24, 16:42, Johan Hovold wrote:
> > One more nit: subject prefix should be just
> > 
> > 	phy: qcom-qmp-pcie:
> 
> I dont this so, phy: qcom: subdriver is better and used more widely than
> this

I don't really care, but if you check the logs you'll see that 90% of
the commits do not use a "phy: qcom:" prefix:

$ git log --oneline --no-merges drivers/phy/qualcomm/phy-qcom-qmp* | grep "phy: qcom: " | wc
     43     404    2949

$ git log --oneline --no-merges drivers/phy/qualcomm/phy-qcom-qmp* | grep "phy: qcom-qmp-" | wc
    310    2346   20020

Johan

