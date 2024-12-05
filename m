Return-Path: <linux-arm-msm+bounces-40459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7679E5061
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1739286182
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 08:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0021D5147;
	Thu,  5 Dec 2024 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRYlrZp4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9F11D4339;
	Thu,  5 Dec 2024 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733388970; cv=none; b=B7oJXNEICTUjixhXuaVmlXzYWj2QBG2UdRsTx6geFEXilLTexEDbB0lPGOhZHKazBBRZzuE9U61gwomEzUOiRQqEBXTtkKWXyopexbmkudN5J7p1MxoAyby3N4NHiAPhwVYYglLSpwPPzfg1fZZL/uBilN3drMDogazKF6uXhXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733388970; c=relaxed/simple;
	bh=pH8a0eNfRI80cchfeptzgtUqN5gprH6NUlyyyD8s8k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qreuv+bu3hvUP55IbkYlIzayXepnATgLK7Wd5hMC34oVBhB7yWOghqSKn4mtRDDfPSFnkavAc4EfgyokwFNMN6LVoKX7jJ2GD1QwRxWBMBh/+urorMgXG6aLqWiSUfFKmt4UE3r0IN+ooCv1Q11M4TjkeZJrjUjS1YNO264XmE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRYlrZp4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C53C4CED1;
	Thu,  5 Dec 2024 08:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733388969;
	bh=pH8a0eNfRI80cchfeptzgtUqN5gprH6NUlyyyD8s8k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRYlrZp4YbGf3IH2/CZlwrjiBWrjQjPllwLRDW0N44b8FMUTV4+lC5DVRm2fXg59i
	 zo3acu0Lg3JGMV2uJCcUpJLOTU1O29naKmDcdHmQqK88S7TdSUnOQ/BBxbPysZS+ez
	 GWY8vz4V4RA6HNt9oua3A9v9WevjE31P+GBUcmNkpcs/L9e82eFC8CRM7v1c4+vZJx
	 TLSFlb8kqAniIMfIIPuCnYSmXYjmrKMotzaY8W5+tjVtcyvogU//yXlTPS1rPXSdtN
	 wdeO2yJMqYNYYaVjEotOQpTck5uMMr+RDe3r4xU0RfX6BZdF9MHP63qFxrZCXugDSb
	 czIM+Z6jeYOVw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tJ7eZ-0000000082O-2LQ2;
	Thu, 05 Dec 2024 09:56:08 +0100
Date: Thu, 5 Dec 2024 09:56:07 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
Message-ID: <Z1Fqp4EXxDbLOM4e@hovoldconsulting.com>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
 <d095ae2a-3f9d-464c-9dc8-a3e73eac6598@oss.qualcomm.com>
 <98b2b88b-9690-44a7-9b22-2f23e6606e82@oss.qualcomm.com>
 <Z1FhQ3OUI0t3k1_q@hovoldconsulting.com>
 <e6f60ca6-a4d2-4539-ab9b-dabe95dd2d21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6f60ca6-a4d2-4539-ab9b-dabe95dd2d21@oss.qualcomm.com>

On Thu, Dec 05, 2024 at 01:52:08PM +0530, Krishna Kurapati wrote:
> On 12/5/2024 1:46 PM, Johan Hovold wrote:

> > And IIRC I even had to specify more than just the fingerprint reader PHY
> > on the X13s to get it to enumerate. I never had time to fully determine
> > why this was the case though.
> 
> This might need to be checked. Did you attempt adding each phy 
> individually ? Just incase the first PHY is not the one corresponding to 
> the fingerprint reader.

Yes, I tried each PHY in turn, and only enabling the HS and SS PHY for
the fingerprint reader port, but that was not enough.

Johan

