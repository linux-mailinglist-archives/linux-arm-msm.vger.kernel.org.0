Return-Path: <linux-arm-msm+bounces-72684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FF0B4A2CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 09:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9FD8188B24F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 07:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6767C259CB6;
	Tue,  9 Sep 2025 07:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcXhsJN4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9C22475F7;
	Tue,  9 Sep 2025 07:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757401291; cv=none; b=fPckXAHmD5SjosHqhbETTn+INhU3Y1omxSDMhRoWQxO1pF1B4mMGyo2y5aC7sWWTMNer7coLTBcEESrIvjbQ03iNMeZdWJ91d9cozY671HMEi8V13z//17qpr1W43A/WG9jVQaykzRJ7enkkdwaynrXPWnp83iUyQAHxY66/mqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757401291; c=relaxed/simple;
	bh=fUwqFWPf1tc5NxQUOkKNLL8h6Tc0YNiYX0IEa5dKaxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a95TX28XmWZrB7GMkdPJFC9gj+xMOfyNl2uB8qoWyVKWm+DW315pL7IvcSRuWwAu9XS0FX5ouxxBGfI1bc1E1gvUvZK75yObg1r88B+0pXn59ur/AjQ6OEXBc9hHdHmJ51L6XirCs5q6IPJhoXq4/wusWZfyj7wDvm5rMH/cLvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcXhsJN4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22402C4CEF5;
	Tue,  9 Sep 2025 07:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757401290;
	bh=fUwqFWPf1tc5NxQUOkKNLL8h6Tc0YNiYX0IEa5dKaxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IcXhsJN4rlwnsIuyzFA4dySfEh3ch4BdYpu8tbTTjWu7yin9C0vB08jEgXWLmnmGp
	 XvvK+YBrgWCldMQY2N3T0OI8B6qoc0ZxKIJUVx26XFt8tOGjvFCVrxoPBjUadGvol+
	 MnRMAwnrleT3kphG5Ns9M6Gff3NV5FgN+k8iTrI7QquRigo13m+3sTfX9/0SHgynxR
	 s/6iGhimZxUgk2fkicP9UcezA5bGFqeGmKmGQ1QDK6pg9gCc10rF4pDSnCD1uflFcV
	 C+Jwl9/0FJ2Hv2qHBanAXtps/l4fRlDgAgkNUpRNbXk9eA+8tmbLaaQuz2jtvzZ0iW
	 up6h2bhIiVACw==
Date: Tue, 9 Sep 2025 09:01:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, quic_nguyenb@quicinc.com, 
	quic_rampraka@quicinc.com, quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH V6 4/4] arm64: dts: qcom: sm8550: Limit max SD HS mode
 frequency by default
Message-ID: <20250909-flawless-enchanted-jaybird-3f5cd2@kuoka>
References: <20250908104122.2062653-1-quic_sartgarg@quicinc.com>
 <20250908104122.2062653-5-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908104122.2062653-5-quic_sartgarg@quicinc.com>

On Mon, Sep 08, 2025 at 04:11:22PM +0530, Sarthak Garg wrote:
> Due to an implementation detail in this SoC, additional passive
> electrical components are required to achieve the maximum rated speed
> of the SD controller when paired with a High-Speed SD Card. Without
> them, the clock frequency must be limited to 37.5 MHz for link stability.
> 
> Because the reference design does not contain these components, most
> (derivative) boards do not have them either. To accommodate for that,
> apply the frequency limit by default and delegate lifting it to the
> odd boards that do contain the necessary onboard hardware.
> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


