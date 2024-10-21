Return-Path: <linux-arm-msm+bounces-35169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2B99A5D31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B3941C2134A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C0E1E00A6;
	Mon, 21 Oct 2024 07:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQAi490z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11901DFDB0;
	Mon, 21 Oct 2024 07:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496142; cv=none; b=H7CFfLryJLeKjgck3t66soZWfeGS0uaOmYGvppuIwv60PQx7AszNgx8jknXFVgl7+crmM7mSeCzHrWwyitf0R7MrEZ4BPb6doIbVse1Hv2wi1wzJ244g+PJXkcU1FEqLJOGNlgIBWXChEBUEvQfXjRwefu39gIp4v/WX8dc0ISk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496142; c=relaxed/simple;
	bh=wybT2bUv36pflpIUF9oYJw/DtXVn6jl1SVHa2Dbie5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IA9bfUHClluwUVkIXVCw+CZS+myBS6pmPW51IE2BIgTjYyhimIIhpoDtIdAeiI9VZk/j7gzX4g2xFmoBIxbbz8d0ZKAB/k8sRK5IjULZ32007MN3/XMQfK1zsjYLuR1MfqmwPRuJQfGP85j8IfDfBm6snvdulL0FH7vmcMubQ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQAi490z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D28C4CEC3;
	Mon, 21 Oct 2024 07:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729496142;
	bh=wybT2bUv36pflpIUF9oYJw/DtXVn6jl1SVHa2Dbie5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SQAi490zPpFuqUV7lcumXm7ZrkdzQ4dgksxyjnRTfnGpsJce1tTfSubFoMZ4951za
	 CIkPmeIR/l17jNcyiFOged4raszJNDw9MkyHzDmcO0LUN6ufqY3r2OwQNmhKodKVrC
	 XtLIghQNXAEfcIMG65cin93GuFjkQv4Gyb/fGRTxBxGfbrOUz+vjjbL8dQ4TzUESjD
	 e4lOSo1Yy/PPkeFmHqli8p9FcKhC71gEdxWQrDhvAdIGYStyDyW9LxGgm1Nf091U0O
	 YT+IyRo+CugyUGR1xxcgfAx+j1xXe/1SrAQQ5U4vCtfcJvaFeMZt2w+tcckDfcYv0R
	 7KtVuImIn9KTg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t2mxD-0000000020n-2rH7;
	Mon, 21 Oct 2024 09:35:51 +0200
Date: Mon, 21 Oct 2024 09:35:51 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb32dp: Add
 SAR2130P compatible
Message-ID: <ZxYEV-hS9NhlnhYZ@hovoldconsulting.com>
References: <20241019-sar2130p-phys-v1-0-bf06fcea2421@linaro.org>
 <20241019-sar2130p-phys-v1-1-bf06fcea2421@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019-sar2130p-phys-v1-1-bf06fcea2421@linaro.org>

On Sat, Oct 19, 2024 at 06:44:50PM +0300, Dmitry Baryshkov wrote:
> Document compatible for the USB+DP Combo PHY on SAR2130P platform.

Looks like you got the patch prefix wrong (it should include 'usb43dp').

Johan

