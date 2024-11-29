Return-Path: <linux-arm-msm+bounces-39608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B90859DE927
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 16:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7878A162E12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 15:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9050173446;
	Fri, 29 Nov 2024 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="IhQoyofM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59DC208D7;
	Fri, 29 Nov 2024 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732893344; cv=none; b=BqUtxykCcFKrqod/EZACYcoz2z63xvd+vW6t6ayzLIs+3JR+iU6m532qj4RZUw49GrMEPPwEI3Z2Je03Q5mH89ikJaYIslq+7cqfWh5zvHS1t6AKdtmYazlfJBA95Z6acbAB9JsQhY6FZJFQB8C7AkrcQlrju/yj2N8mxpbisXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732893344; c=relaxed/simple;
	bh=rUZ5NIdEIYlCn8HyzSe6zl5HHKhzIBZ4/pYs2KTpGfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWhBnZbM91t20WPiTmjaj75PgKCBemHzVP1BXdO7Jmyqq+sbaiYE3zYA+Hsr81rMFbZ7E/O6+RNexKmhi4fNZiqr2TaYs/RfAPJkaPH7Wbipym5qS9honJWZAS4zqYBX+iUbuHedHfK3qWMjEY2TwdBA+HrN+NU+x6gW551IwS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=IhQoyofM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0NBukuuVJgfoFTSUK27Phbsx0LrIXsMWovFBCA0Cxj4=; b=IhQoyofMOjBrm7kgThO9Ko8q2w
	wvHLp4TacAhK4nI7DHjDhadds602NfZDUog1x0bR/pFqj4iNaEA7UcWIou4uFi/XdpmpDob74cWWL
	KMSm4lmWHiXH1fHjxZEXBswh1khB3znp/ccOCKERKOLLIMuEHDiP8ZR7G8QtB713DmhY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tH2iW-00EmLR-JA; Fri, 29 Nov 2024 16:15:36 +0100
Date: Fri, 29 Nov 2024 16:15:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
Message-ID: <e1c192ff-4fe9-4473-92ba-4c3a40ab99da@lunn.ch>
References: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
 <20241118-dts_qcs615-v2-2-e62b924a3cbd@quicinc.com>
 <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
 <89a4f120-6cfd-416d-ab55-f0bdf069d9ce@quicinc.com>
 <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>
 <3c69423e-ba80-487f-b585-1e4ffb4137b6@lunn.ch>
 <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>

> > The usual setting here is 'rgmmii-id', which means something needs to
> > insert a 2ns delay on the clock lines. This is not always true, a very
> > small number of boards use extra long clock likes on the PCB to add
> > the needed 2ns delay.
> > 
> > Now, if 'rgmii' does work, it means something else is broken
> > somewhere. I will let you find out what.
> 
> The 'rgmii' does function correctly, but it does not necessarily mean that a
> time delay is required at the board level. The EPHY can also compensate for
> the time skew.

Basic definitions for phy-mode:

rgmii: Indicates the board provides the delays, normally via extra
long clock lines.

rgmii-id: The board does not provide the delay, the software need to
arrange that either the MAC or the PHY adds the delays.

We then have the values passed between the MAC and the PHY driver:
PHY_INTERFACE_MODE_RGMII: The PHY should not add delays
PHY_INTERFACE_MODE_RGMII_ID: The PHY should add delays.

A typical MAC/PHY combination, phy-mode is passed to the PHY, and the
PHY adds the delays, if needed.

This is why i said there are probably two bugs:

1) phy-mode rgmii should probably be rgmii-id

2) The PHY is adding delays when it should not be, because it is being
   passed PHY_INTERFACE_MODE_RGMII not PHY_INTERFACE_MODE_RGMII_ID.

	Andrew

