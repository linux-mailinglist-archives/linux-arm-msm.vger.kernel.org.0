Return-Path: <linux-arm-msm+bounces-57551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E374AB2BE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 00:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B73243B8F85
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 22:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6D219F42D;
	Sun, 11 May 2025 22:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgO1X/OT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC451B7F4;
	Sun, 11 May 2025 22:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747002657; cv=none; b=YbMX+yUu5NsEQ+LH0gKbJGO9Jzkk5dMj5Kn3bUYOv5Ghj2BbR+coEVzdhus4roU8TSL1wB6ILXMmt5SuZBOBlKmaM9qZzFWDEf/oEqKZhrHDR02+b/jyRp/yERZ4kwu8YkeDWURVS/8uzRZxu8w7KxV59JO/q9/8cGLeVQTokak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747002657; c=relaxed/simple;
	bh=bMtyYFCfsY0jOs8tvoOy4JVJT+Juj/u5CcfmeOzYQRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNvRaLMjTDCSGRXL5YDr8hxFm9fAZb0VUmyZNpvh/H+VgqN3bPQoaHSQH4go1tUMiX3OVdT8p0qZSrfGte+DxnMjo4HxwIKlzYuz7a300K3z22gh30IiDwZbZ3SIhMUwPtJqsbh9VwJsx7oRHhkqDs6laCkjhcxWGmGMmQt1hd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgO1X/OT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAEEC4CEE4;
	Sun, 11 May 2025 22:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747002657;
	bh=bMtyYFCfsY0jOs8tvoOy4JVJT+Juj/u5CcfmeOzYQRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YgO1X/OTBF13nA6Svw+6VbtdlJGToCqMBYjdWXIHEYf+IL6yyomv1yCrMnMNHvNs8
	 NUsMu3/XrHolMnS9NmCjXUHTIhBFmjICQXJpG6X6F2XLxUzLxtmt7xe4vkq6nmQaZK
	 kkRn/a9wxIVvPyDcX21mCn+N33bSEsowzm4NfYVTjRaJAyeDxYGmCS8vjcr2rN3IIn
	 BLDpp9ECRqY2RspEMRFNWSSA0N6VpvyxwRCcfdH5pa0WRUnDIwjNfFL3ySqATrSVDu
	 E2Spo8WRIP3PwC9dO9vWgHhl38j7BUzMBTLZIB9jgBmzy1n0B7PWEvoDhHeTpXB9Jy
	 EfDq01EhmbI2Q==
Date: Sun, 11 May 2025 17:30:52 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] soc: qcom: socinfo: add SM8750 SoC ID
Message-ID: <yv3ageskkr2mwtgnrldlpgmvgqbxfullp52w7yjg47lm34h5cb@n27gdmljehyc>
References: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>

On Thu, May 08, 2025 at 07:16:34PM +0530, Mukesh Ojha wrote:
> Update soc_id table for the Qualcomm SM8750 SoC to represent
> SM8750 machine.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2:
>  - corrected the order. 

I believe the feedback given related to two different issues with
"order", and you fixed the sort order of soc_id[] but not the other one.

Patch 1 can not be compiled without patch 2, so applying this series
would break "git bisect" of the master branch.


I'm applying the two patches in opposite order, but please do make sure
that the kernel is buildable and functional after each patch in the
future.

Regards,
Bjorn

> 
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 18d7f1be9093..8c4147737c35 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -444,6 +444,7 @@ static const struct soc_id soc_id[] = {
>  	{ qcom_board_id(IPQ5302) },
>  	{ qcom_board_id(QCS8550) },
>  	{ qcom_board_id(QCM8550) },
> +	{ qcom_board_id(SM8750)  },
>  	{ qcom_board_id(IPQ5300) },
>  	{ qcom_board_id(IPQ5321) },
>  	{ qcom_board_id(IPQ5424) },
> -- 
> 2.34.1
> 

