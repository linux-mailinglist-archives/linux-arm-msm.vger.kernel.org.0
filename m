Return-Path: <linux-arm-msm+bounces-75508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 033CDBA94A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 15:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 810217AA56B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 13:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B474306B16;
	Mon, 29 Sep 2025 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dW1xdGqy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D460E305E09;
	Mon, 29 Sep 2025 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151501; cv=none; b=QwoLCmh1ueu3NsgfoIMjM5cRvZekoIKqIBAEtc84UJBCwl1BHCUltHRYFqrQR801H1fZQZJzQW/Q8KCMtFaIykR8lTIK/s8KN+wkYfFtZPxLx5QqQ7ImRfP7D/KJYI1sIO7VIb6S0sZAWJ16XmxvjTa9Ki+N0fhV9izsh6yH31M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151501; c=relaxed/simple;
	bh=iLOE8W2/99hWknymgXjyOoeKtMi2ze7WIIb2J/6KcFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIaLxj4SoyDd3J657HeYHNs7ADzZ78mTiHLwYPX9YmjPSoOvuSbCnzHhWVjQ+HeMzvjjN+IXH0zfaOUrXMJv23wpslsAFCL+ZPo8TNDnvC8vw9MZS4457KYtFmTV1vpJylMemmDfsl2ykYDGZZY5xcxcs1kf8KEdYHhdfu9Dhyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dW1xdGqy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4CDC4CEF4;
	Mon, 29 Sep 2025 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759151501;
	bh=iLOE8W2/99hWknymgXjyOoeKtMi2ze7WIIb2J/6KcFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dW1xdGqyVt/TrsQIXloANR3pVBr2+hrkA1b/T3cYQ9QPJOsrvw7fFgatp801pFlid
	 ObHMHvQO2oXrx4X3Ep9oK4/GuCYOYOPY4E+MWit5LAhE4WuXMYZ0R75/sOlvxsDEJW
	 AhVV4XiA8u5A2pYupeVYPd4nmoPRurVebXEOoXTs=
Date: Mon, 29 Sep 2025 09:11:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: Re: [PATCH 13/20] arm64: dts: qcom: kaanapali: Add QUPv3
 configuration for serial engines
Message-ID: <20250929-notorious-masterful-cassowary-e26114@lemur>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-13-3fdbc4b9e1b1@oss.qualcomm.com>
 <9685e29d-bff3-4188-b878-230d0f161ce3@oss.qualcomm.com>
 <5410dc83-0732-4b25-ba07-605e4956d840@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5410dc83-0732-4b25-ba07-605e4956d840@oss.qualcomm.com>

On Mon, Sep 29, 2025 at 02:41:27PM +0800, Aiqun(Maria) Yu wrote:
> We’ve tried using git format-patch --patience, and it did help avoid the
> deletion lines issue. However, when we send out patches using the B4
> tool, the formatting still defaults to the standard behavior.
> The challenge now is: how can we integrate the functionality of git
> format-patch --patience into the B4 workflow?
> Any ideas?>

You can set this in your .git/config:

    [diff]
    algorithm = patience

-K

