Return-Path: <linux-arm-msm+bounces-51445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08A4A616C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AC5E174B60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 16:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07273203719;
	Fri, 14 Mar 2025 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/H70oSR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABE21FFC5B;
	Fri, 14 Mar 2025 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970944; cv=none; b=BDkZTUr2oPq1p+frwTYBKB7D1ZkBGE2LlRIpHs5FpZ+mYdXJuHo+2raXXU04oc6Z+qC0BKYHgoh60WFwJ5XikbYePiiboDhwZJTsc+G7pTvC2voyO1F4J2OOqoENShbKNWM2DiYK86A7VWp5zFyuTTgK/y/PS0c1Yfaw2xi9Kg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970944; c=relaxed/simple;
	bh=JW6R4xOpTLFnNLrbqWO8JY6H8dfEYnttBIocU42Nwyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECucWLeUPONrV1PgiBn32r0lAW6RvMqz64nQKdRcvLrUIcT3Giln2FtKO+t76LJX8voDJMIr4UPMFyNyINs2lMmORZRa+h9RyK5YR9q+zr8pFVWMZOExe3qlZz39mUCLXNjfXXC3dmlbY+iiqg3E4J56qf5p4igugGhFs5mS3yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/H70oSR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29807C4CEE3;
	Fri, 14 Mar 2025 16:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741970944;
	bh=JW6R4xOpTLFnNLrbqWO8JY6H8dfEYnttBIocU42Nwyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/H70oSRIEv58fq/SYOScICYA4wYmIZrtAlIALuUBTcA9nCbYazaBbNN+UfDHesEj
	 El3fLEJcVZ2vW89HK2/CuZY8ddPZJXhlgxHdEE1A0XCAeRfybxdgZ6soYVzeTXJu+K
	 qL9ctu6HH9Q33xO6iq+uKTh4n3cX3vczD1QHcXqJXe6P1xkCnxgNN1sMvhSuCBu0c9
	 E5kH+PD6SBBfYULaWqTZkX8ZRr8WfVOJM6MKc1zU/Mcj96knUjlR4GjtDM9XVqWLc7
	 6x6hERhbZSG68/bEuwYHRtiUmRhEeo0aaX4ubt+CRm1cnbQoCsPNuF9n3NAscXm1C9
	 g5hlrk100QUuQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tt8DX-000000000aR-38Ew;
	Fri, 14 Mar 2025 17:49:03 +0100
Date: Fri, 14 Mar 2025 17:49:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/8] arm64: dts: qcom: x1e80100-crd: mark l12b and
 l15b always-on
Message-ID: <Z9Rd_yCl4_sOuC1g@hovoldconsulting.com>
References: <20250314145440.11371-1-johan+linaro@kernel.org>
 <20250314145440.11371-2-johan+linaro@kernel.org>
 <zhiunl3doj3d5rc2m3w2isnwloyyvtbbgiiuzbg3dxy342vnhy@n27ioyo2mhvm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zhiunl3doj3d5rc2m3w2isnwloyyvtbbgiiuzbg3dxy342vnhy@n27ioyo2mhvm>

On Fri, Mar 14, 2025 at 06:36:19PM +0200, Dmitry Baryshkov wrote:
> On Fri, Mar 14, 2025 at 03:54:33PM +0100, Johan Hovold wrote:
> > The l12b and l15b supplies are used by components that are not (fully)
> > described (and some never will be) and must never be disabled.
> 
> Which components?

	https://lore.kernel.org/lkml/Z8gPaoqLiC_b2s3I@hovoldconsulting.com/

Johan

