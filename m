Return-Path: <linux-arm-msm+bounces-37731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDC69C6903
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 07:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C49D1F222CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 06:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E0A170A31;
	Wed, 13 Nov 2024 06:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="de/wS9hw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711A310F1;
	Wed, 13 Nov 2024 06:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731477822; cv=none; b=gv/mLyB/Z8RbDapFF1kjTRALnujqzmpbllLLydfd0dsiZu/68+A+JtR1coha81bt+wDYCXaeX4VbIIMFXlm15S/ibSbV0OwV+wablEz61A28Z+7m7An4xQtv9Ty6K7g6CWn9oDJtDyS5H5K4yzLqijncNf25+x/K7Mez+7OYSiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731477822; c=relaxed/simple;
	bh=AYmuM2b9645Yoo9Z1mFsCvVpUkr+Fpm2ignibA9XP0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rh85Qsrg2RGQgSDDbQMeIsdT7DGWJGUx89aA+ol5bWZnKMAYduKIA9GCzkyl6pyBMZeotlP/1R0srUmLdczT/s7g8NeRCw672exbxz5l8KBIod1ZFhGxJKVXvQRUaEYS2XrDkyae8+NjSew5YgsLGG535Up5Hf5TKLnzBM/glxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=de/wS9hw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BE5C4CECD;
	Wed, 13 Nov 2024 06:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731477822;
	bh=AYmuM2b9645Yoo9Z1mFsCvVpUkr+Fpm2ignibA9XP0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=de/wS9hwI7o3bOyH6Mf8Nx60ot7cbBoEjUBYFWMWmpUNOl2kY9N0c12otcT4uZexx
	 DXcsBeo8YIm2p3hkYys+84Zs2DEAOTEajzA76pgifSjccdfrgB4n3hKF2URZS4bI82
	 5gPQhOhyXfbtk1x8apWV7VnZZ1fVKLpFxv1gl1j4=
Date: Wed, 13 Nov 2024 07:03:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: x1e80100-crd: Enable external
 DisplayPort support
Message-ID: <2024111341-platter-disk-8238@gregkh>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
 <20241112-x1e80100-ps8830-v5-4-4ad83af4d162@linaro.org>
 <ZzOK2Xz1QQvugGnG@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzOK2Xz1QQvugGnG@linaro.org>

On Tue, Nov 12, 2024 at 07:05:29PM +0200, Abel Vesa wrote:
> On 24-11-12 19:01:13, Abel Vesa wrote:
> > The X Elite CRD provides external DisplayPort on all 3 USB Type-C ports.
> > Each one of this ports is connected to a dedicated DisplayPort
> > controller.
> > 
> > Due to support missing in the USB/DisplayPort combo PHY driver,
> > the external DisplayPort is limited to 2 lanes.
> > 
> > So enable all 3 remaining DisplayPort controllers and limit their data
> > lanes number to 2.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> Please do not merge this specific patch.

Please do not mix patches that should, and should not, be applied in the
same series as that plays havoc with our tools that want to take a whole
series at once.  Stuff like this just makes me delete the whole series
from my review queue, and if you got sent something like this, I imagine
you would do the same :(

thanks,

greg k-h

