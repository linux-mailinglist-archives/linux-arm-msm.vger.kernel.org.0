Return-Path: <linux-arm-msm+bounces-49443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84794A45876
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F89F3A297C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0741E1DEC;
	Wed, 26 Feb 2025 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6D7+/Dx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F36E258CEF;
	Wed, 26 Feb 2025 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740558950; cv=none; b=Tp5R79lTUc+ztMWeKdNTlqwW2Bxzps9RJb5SAdXI3ja0jFWKeIH5iEKz8lvNVpnWRd+PPHAD6DHSpS1oVH9oajm5oqLJn26e4NAs4y4PpP3BNFxcYTXgxOBNp9kd4nrjTNI8jcpt35pW7cYPP+EE0evwNc+u0+1t8TnNawwngvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740558950; c=relaxed/simple;
	bh=4MYgiidHr8/ZdNMzTcx3mGJcSD5JeuiEYpQrrTIb/VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSfoznzJv+8BDMxhWiwVX+isURPPW6XtyyaMhMHzcx1WMW3gZtCiOdUv7YEYUbzVlOiYkHlUPy5RSVBSOxLecL7hRqBaLJsAXvocile/2HaGLe3g6FxkrJcBrUbJLphQqBVmUSBdLOPDbx/8RadLHvnm3VaSqk4lH3jjD/TCJJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6D7+/Dx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E311DC4CED6;
	Wed, 26 Feb 2025 08:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740558949;
	bh=4MYgiidHr8/ZdNMzTcx3mGJcSD5JeuiEYpQrrTIb/VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6D7+/Dxefnk9azDCjH0/byQKuZKBZHYYtB5BHFqReTtU0kXViV2zcE46dhYhAtDS
	 4CiFxxI+hJ0Zcf7jyvIFFhbIJ/i8I6zUW/tsu/BxBoBl2k2HqiGnhsDCCyVpi7jDPw
	 psnAuvj25AnRukudfQRiKjVjIEwUgOyRqg/LbD8nLXefoAhjyTdvG4hjuWLxT8UFTz
	 kaels7K95zsKmkegdGaLJD7SJYuYMYkoCJXYXUOs9BqO6z1gNAMt6BT7pMKWBPqTNx
	 WwPUP7UOKwIqyHEZHeP/u8+mNm7Oeq5Hoba/Destcgns8dTA9zKUsIHYayB5cjB0ki
	 +7d/qGNgO/kxg==
Date: Wed, 26 Feb 2025 09:35:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
	marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, 
	quic_jesszhan@quicinc.com
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to
 DP bridge nodes
Message-ID: <20250226-futuristic-messy-rook-e9f85c@krzk-bin>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-8-quic_amakhija@quicinc.com>
 <ecdc2230-1ce1-4d70-a352-180f6cd29e61@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ecdc2230-1ce1-4d70-a352-180f6cd29e61@kernel.org>

On Tue, Feb 25, 2025 at 02:31:05PM +0100, Krzysztof Kozlowski wrote:
> On 25/02/2025 13:18, Ayushi Makhija wrote:
> > +		pinctrl-0 = <&dsi0_int_pin>,
> > +				<&dsi0_cbl_det_pin>,
> > +				<&dsi1_int_pin>,
> > +				<&dsi1_cbl_det_pin>;
> > +		pinctrl-names = "default";
> > +
> > +		dsi0_int_pin: gpio2_cfg {
> 
> 
> No underscores, see DTS coding style.

And as Rob's bot pointed out: insufficient testing. :(

Please be 100% sure everything is tested before you post new version.
You shouldn't use reviewers for the job of tools, that's quite waste of
our time.

Best regards,
Krzysztof


