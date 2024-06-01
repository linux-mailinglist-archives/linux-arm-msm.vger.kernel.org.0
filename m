Return-Path: <linux-arm-msm+bounces-21381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB158D729D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 00:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1B941F21A27
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 22:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9752F2E419;
	Sat,  1 Jun 2024 22:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuNjfihB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6970738FB0;
	Sat,  1 Jun 2024 22:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717282702; cv=none; b=DMvKdAeUndrrFaXFJsNnynoSyItmX007Mr8u89uD0p3slekIiCq3fwaNc2tXEi2i4Y4pTNIuFHhriM4IWpLx5ZiK3xUdOzB2cQvngyTpsXXkQmuRClYyf/RW7QpDO6BICVqKHqcN37wNK3XoK7ODBfqhoS+IybrtjOqFZRXlU18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717282702; c=relaxed/simple;
	bh=nX+3VPiGwn/lXugoQSvq7Zf/3JFTiJozOIiDFqxDNXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nALEnYc+bSPb1Xdl4ug5s0KijrGkw5qThpgJVvx/BsgXf9Z6aXhUXaVdOS8TZphaJvw1QWsHW6zSYgnKzBXrSu4NJgG8H40j7f72P1bflmwLVjDIcDCPT8YcIGC+rg279Xq+GvXJn8mEiuy+30wHBvaSIDegqPSxv+QlFqLCWKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuNjfihB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBC1C116B1;
	Sat,  1 Jun 2024 22:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717282701;
	bh=nX+3VPiGwn/lXugoQSvq7Zf/3JFTiJozOIiDFqxDNXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FuNjfihB1HEPzaF9GFFqtP9XDEE9t9JZKyacw9Ryz3WaIy6jE4v8FphU3mAwbhzZd
	 KjKDragQPKonNc4M62kRk/hSQvJWaLVnXuwstl78GlPAsYbK1o0lBB29Lqkb2ALLb+
	 IjA6OndU7YNss4JGjFAk/G0GaN4r97BJXAcpwJS0vuPwyUd/6750A+tOcp44TAOgs+
	 XA9A28uLxQ7I0oe2sJbc5Dv3apYJR4YULGGM/z9G/p/9q7xPJKm1s0EKbTO8ldnTDk
	 V797HuNLTj3wElT6S+MYXVQoe4+ygfvqaxRRB3orEfPTElEhsm5lt+tY42xR7WAaV9
	 sIqQYwQ2j+dZw==
Date: Sat, 1 Jun 2024 17:58:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-qcp: Fix USB PHYs
 regulators
Message-ID: <fjawzjf5squniqse43r3xwshguwhcg5ofqzcjvmrn5v2ji3e7x@eve4fhsftnhw>
References: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-0-6eb72a546227@linaro.org>
 <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-2-6eb72a546227@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-2-6eb72a546227@linaro.org>

On Thu, May 30, 2024 at 07:35:46PM GMT, Abel Vesa wrote:
> The 1.2v HS PHY shared regulator is actually LDO2 from PM8550ve id J.
> Also add the missing supplies to QMP PHYs.
> 
> Fixes: 22b82135c02d ("arm64: dts: qcom: x1e80100-qcp: Enable more support")

This isn't the right hash. I'm fixing this one up, but please check make
sure your fixes are based on merged commits.

Regards,
Bjorn

