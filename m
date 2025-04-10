Return-Path: <linux-arm-msm+bounces-53822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E43EA84245
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 13:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 295D04E09CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11ACE28F929;
	Thu, 10 Apr 2025 11:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7MQhzqY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FBF283CAA;
	Thu, 10 Apr 2025 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286013; cv=none; b=P2T7IcLbp2Pfq4SKm7tWDGAdAwwAfKOhiTnQ6Mh5fTCKlNWGbVm8D5WQ2qxg8NH59/TayUpk5niK0XtjD8Bgo2Y3F0OzG/K1rxE/fvH+5PdDv83s/vRkZWJvyrlKFnCKILI+qgmHPLfdERPYH//4tEeO7beV56tqRpEzXKaDtJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286013; c=relaxed/simple;
	bh=PhiOxgPV+UJGeNCtj3MezYeVIX8cgjdJLX0OoBVn8PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ez/m7JI/hP38qWCr8Gotkvca9PRrD8FpLV4yUucVnNei6RQMOb51ttoGnHbVaIbXTQFfRjhHY5vK+VdQEh+7ORkQR6bAKN3wf0YbFml+8GStgmTxKpmyDEoP+/pswa1TbKGUz7HHz4wd5beK/GV8fbib/MKwe0kxER6shporo2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7MQhzqY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5BDC4CEEB;
	Thu, 10 Apr 2025 11:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744286012;
	bh=PhiOxgPV+UJGeNCtj3MezYeVIX8cgjdJLX0OoBVn8PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7MQhzqY2PpJ0Jem5Fw2rsXzKuA1s69TONRI1iVqGtOLjORR228OnpOyzwHw3s5h+
	 vwgY95cSE+Co0rFRlFI7+tP0C7dYB7y+tggmxpExoPNjTzc6sBj5Mf3MOxmPpZaUcn
	 SIuYoYcUpI/po+HeJlmC2P/8Xa8Xre7fZwuwLqXk5pEZ4rxli+GaFoVRD/YBNFnklt
	 sAiUVSzji0bfDgBH+w5NVXBxW/nF7WyQ92wClMsAoAlOgOBUzD4V1KqEUQzsphw0sL
	 6I1CQS8eH1/DmU29GNOdnFxPzaz3HdRAa7mfik1bOmdRlenPIZ2BJSL2ZGDK92BGSc
	 YHOzgOQT0pSHQ==
Date: Thu, 10 Apr 2025 17:23:28 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <Z/exOF4T+0vNLQwg@vaman>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>

On 09-04-25, 10:48, Melody Olvera wrote:

> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
> +					const u32 mask, u32 val)
> +{
> +	u32 write_val;
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= ~mask;
> +	write_val = tmp | val;
> +
> +	writel_relaxed(write_val, base + offset);
> +
> +	tmp = readl_relaxed(base + offset);

Why are you using _relaxed version here?

> +	tmp &= mask;
> +
> +	if (tmp != val) {
> +		pr_err("write: %x to offset: %x FAILED\n", val, offset);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

-- 
~Vinod

