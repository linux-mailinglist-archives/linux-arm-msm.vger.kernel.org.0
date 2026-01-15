Return-Path: <linux-arm-msm+bounces-89170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CE4D2364B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1E39304A917
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2171F3570A5;
	Thu, 15 Jan 2026 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZO9e6+QY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0A135581D;
	Thu, 15 Jan 2026 09:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468497; cv=none; b=bJ7RubCXWXpc4+usHToIlTHVLxAKuShRMfOyFMD0MXCyLJuVlrMk9PYwDgNYsK0dOwfN9eluPm4YLCQUoWx2WiILMq4fy3h4ggYWEkfYZXDPdL9dai2UgKoJ0jVW5sSymOZCNuXXIiXiT/XpsKdX4viD5nVUxEN/wGndbYXytJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468497; c=relaxed/simple;
	bh=c2mH3DKf+6PX1dSBvPUM4JjqEZd6/UYW4yAWXyHDL1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsPA4eJ0FKmAhVlyXxX6w3LiKiOczPcmo9/Cf4OxdO55ZJdypWaQDw1aDpakr+hEnUjobZNS4O1QYRN++YF/T2lqcTrhJqes9XvS4klId2lgVgoQjxXCQvjwf+Hofni6d1vaufWL3UKPaoypP7UGrIAi7A4x5d9oZQYXgyc9H8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZO9e6+QY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41A0C19423;
	Thu, 15 Jan 2026 09:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468497;
	bh=c2mH3DKf+6PX1dSBvPUM4JjqEZd6/UYW4yAWXyHDL1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZO9e6+QYzQcXf3fru/svCaVXD35VGqvJDxnlV0Y7dqfwXaLkbG7YEyeRmB6z7F0/G
	 iWT2G0QXYik0D/+WqyTEFjw/oWHSBWPA8VADwQ6mwz8pMbMVTCIZs5h8coW4k949eZ
	 6uN4aMqny7oYlegsmD+RxARYqIYPfjR1GauBSOJyD+czJ04407tax5ii8vtatv0V34
	 JuVF7NNKe6NZByemYzqYLaPBA2k/CfUEQit4n66AF1lpclQB+fWVbtz9M1RMN2HYVI
	 gX5r/k5/fq0P0wc4CGEIzjJUAQHtgxb0AgeUXiDOAnEErA+4j+5L5nCw5eftxWb1ak
	 KgjF8IHNJ1RGg==
Date: Thu, 15 Jan 2026 10:14:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 3/4] usb: typec: ucsi: ucsi_glink: Add support for
 X1E80100 compatible string
Message-ID: <20260115-annoying-ludicrous-hummingbird-c7cefe@quoll>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
 <20260114211759.2740309-4-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114211759.2740309-4-anjelique.melendez@oss.qualcomm.com>

On Wed, Jan 14, 2026 at 01:17:58PM -0800, Anjelique Melendez wrote:
> Add support for the X1E80100 compatible string which needs UCSI_DELAY_DEVICE_PDOS quirk.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597


> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 11b3e24e34e2..e700c6a58a46 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -379,6 +379,7 @@ static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
>  	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
>  	{ .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
>  	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sm8450, },
> +	{ .compatible = "qcom,x1e80100-pmic-glink", .data = &quirk_sm8450, },

So is it compatible with sm8550 or not? Based on this commit it would
be, so you need to clarify here why you decided not to make them
compatible.

Best regards,
Krzysztof


