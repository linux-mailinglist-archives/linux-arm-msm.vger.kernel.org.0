Return-Path: <linux-arm-msm+bounces-57600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A06C5AB352A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 12:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21F7716D0AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 10:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023F3263F3A;
	Mon, 12 May 2025 10:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ytdl4i2E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36C5187872;
	Mon, 12 May 2025 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046948; cv=none; b=ROB713XNQ+uuiSKfjY/g91RsgtVnJ2uh9cuD77gSTanep04MQ5VQ7FFYLvAaSTEUrdHHuL973JmdrkUd6KbKdV+yHtafmPrDJV96jWiwaMSN/L6YrQYSMCrtxpO5pbff+Ruz+Pr+WC8Nup9tePFvkp3VUspkRa6U1ehZOE43fs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046948; c=relaxed/simple;
	bh=zUpC1gW4fOUJ4OC+/1Eb2zn3OJzoIcVx6892BOSlhgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUXrLHdYrdQUVZPAUM9S/6k710ws+AsZB90OnBbsAuAHEuOxdcYbBdh0UvyP/196bhCrzamoiZ35hOk2Uqi0dyoOnCTMDMNV3mnawUqADtk4E0gpxw0ast4otvHZcv33lKsYw6jTHI1lzySrCWSxhqyX79QIY0i3LLcP9rzrUA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ytdl4i2E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3F9C4CEE7;
	Mon, 12 May 2025 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046948;
	bh=zUpC1gW4fOUJ4OC+/1Eb2zn3OJzoIcVx6892BOSlhgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ytdl4i2EUNDHcrySlH0apCvUjrSZ8JL9fSJihZ+5sMxY2RBl75mCoXrliddy+qoV/
	 V2JtbOObqemMSqzmnAZAXKKk2EdrYRT59qIJm30CsSFuR2UDoyOP3c54u2/jEOl9dE
	 /+KYhczxroCkePxFiCB/De75LSspDWGSJKgOwH9QRT2Qxtsn/ycLYLRrOMUcfr0ZHx
	 hvS13/+PrnUaBm4QwD2O4b8+28m5IOnPJ6PmGJb3M+A8FfhXM2Vmks+etkNN8JgkYw
	 +2qzzBODsTUltDuQIiHC1Yxnfwa67Gc3LbSQweTeQo6vxEE2fApRmSY/bRr0wUAFjq
	 +nDGAudA0DhQg==
Date: Mon, 12 May 2025 12:49:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: qcom: Add missing bindings on
 gcc-sc8180x
Message-ID: <20250512-beryl-catfish-of-saturation-208467@kuoka>
References: <20250512-sc8180x-camcc-support-v4-0-8fb1d3265f52@quicinc.com>
 <20250512-sc8180x-camcc-support-v4-1-8fb1d3265f52@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512-sc8180x-camcc-support-v4-1-8fb1d3265f52@quicinc.com>

On Mon, May 12, 2025 at 10:34:36AM GMT, Satya Priya Kakitapalli wrote:
> The multi-media AHB clocks are needed to create HW dependency in
> the multimedia CC dt blocks and avoid any issues. They were not
> defined in the initial bindings. Add all the missing clock bindings
> for gcc-sc8180x.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  include/dt-bindings/clock/qcom,gcc-sc8180x.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


