Return-Path: <linux-arm-msm+bounces-20300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789B8CD1A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 14:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D1931C21600
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 12:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287FA13C671;
	Thu, 23 May 2024 12:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b7nwr34i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E7613C682;
	Thu, 23 May 2024 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716465603; cv=none; b=ZGlt+X6fCWDSQ0SlSl2MkXN4szBZs546iS267pRlYSrrSIhjg5nqWV4MFPH/otCylNA7drNYmqjYD8VRw9lLQl4pRRSzlEeAVoLTt/DhltaY39frxWO9omPKmSOLW1/9Zd5wAAz9SYPQPIXworXpaXOO8IzckfE67nksqRYGZ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716465603; c=relaxed/simple;
	bh=756qsfElG71obD2TiHuvBzILH7/ej5jW+w1gcPM9L0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDWCKNhF711SCNq5Y5Bb7/cvdo+e9IBgV3f2e8iv+7+lBNE4gkyGqnCKT3OI3XUVbHdtSbmmWQliKI1NANo9yrUPu4GevjW0v50VExmtU9kN2USWh2kutJSd0mlZVLp6UtNTlGrBUFhPzyC8GSQH0wX0cR25V96VnnduSrR6guU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b7nwr34i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA712C2BD10;
	Thu, 23 May 2024 12:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716465602;
	bh=756qsfElG71obD2TiHuvBzILH7/ej5jW+w1gcPM9L0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b7nwr34i7CLyVA78WCE8cleMZD+chJyIpIvhsLBnLAopmetCxGbMdWVstxG4KlOAo
	 vM6x0XlIQwK1iHG9J/IqjS2nRQJDO3bbFqQZ82ylnupqJqMTz+YoFlEBJcDMwKpDCj
	 mJTx42qQs4SFIKbMhXf51A6CzMDey3VGgVN17yls=
Date: Thu, 23 May 2024 13:59:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Elder <elder@linaro.org>
Cc: stable@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5.4.x] arm64: dts: qcom: Fix 'interrupt-map' parent
 address cells
Message-ID: <2024052351-sixtieth-mayday-894b@gregkh>
References: <20240516152136.276884-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516152136.276884-1-elder@linaro.org>

On Thu, May 16, 2024 at 10:21:36AM -0500, Alex Elder wrote:
> From: Rob Herring <robh@kernel.org>
> 
> commit 0ac10b291bee84b00bf9fb2afda444e77e7f88f4 upstream.
> 
> The 'interrupt-map' in several QCom SoCs is malformed. The '#address-cells'
> size of the parent interrupt controller (the GIC) is not accounted for.
> 
> Cc: <stable@vger.kernel.org>		# v5.4
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Link: https://lore.kernel.org/r/20210928192210.1842377-1-robh@kernel.org
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Now queued up, thanks.

greg k-h

