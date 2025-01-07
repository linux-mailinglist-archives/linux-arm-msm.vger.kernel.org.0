Return-Path: <linux-arm-msm+bounces-44156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F88A043E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C23AC7A20BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6EA1F37A0;
	Tue,  7 Jan 2025 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWefbsNe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADC21F2C51;
	Tue,  7 Jan 2025 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736262837; cv=none; b=f2AM+E3W7qGUtEyt6Qj1LDOhsRh0aqqwxwKr7qPfAa88/xvkNx/uHsecV7HHU2DdvWBE35bvV4YhIzDnuEjHuTcYh55xB5Ju95iuGBNbJZNDvFdMDrTL+dPM/hHmC7mtMWXUsLk/Mv08MRcS9dvx5B1qyL3dTj0w9SvYE5gIfwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736262837; c=relaxed/simple;
	bh=Q1S5dypVCn4QlADR0ehn+gvfH+rG2+WIE3R+f7Xjyyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFrho4W1SXR0gFs7DiQJ6z87WlwRne9qqUQaPsdmrgjY9Vhm8KNbkbG5m19I6p6xeDBuD2UJEzzBZTGDbRKPpBZ9dqUApYoeYq2YwGV/dpxd2X85iZmLJUfJmIDIyAHLBT+g26Q3SzZuArDMg7Umuzp3Zb18eWzelXw92CGPATU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWefbsNe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA98C4CED6;
	Tue,  7 Jan 2025 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736262836;
	bh=Q1S5dypVCn4QlADR0ehn+gvfH+rG2+WIE3R+f7Xjyyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bWefbsNetYsPJ77qpaubEBmnW0zvEP8nFtZmxdt1aM52qTNjNcJZvVamJHEnWZ+Y3
	 emOBOUWWtCl+3u6y8BI2cH3PI7OOJr7tzZIWZrlpS/C5gMgKawP3Y//ab180d/uDF6
	 N7Vvzb4a1xfYneyrJblLyanNqQCnlUL/u2PT3+cMPlfkcjE6eHeCddfZBBxyuE2JQU
	 ue8pLpRDswZir9BjQ1242nuamnOYV2vr7ThndI8rp8q6ntRp8j2bJ1rC3rwM2AxU6I
	 tfLVyIg/GC4d9YBvz5FYD0eFcxSiWL1BxzNigndDWRiq4OpNkidqVWV5hYdhXpQJBv
	 2eRaV3Kg3FViA==
Date: Tue, 7 Jan 2025 09:13:55 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH RESEND] dt-bindings: interrupt-controller: qcom,pdc:
 Document SM8750 PDC
Message-ID: <173626261776.3528329.7285784618883424028.robh@kernel.org>
References: <20241204-sm8750_master_pdc-v1-1-3a06cb62a28f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-sm8750_master_pdc-v1-1-3a06cb62a28f@quicinc.com>


On Wed, 04 Dec 2024 14:53:37 -0800, Melody Olvera wrote:
> Document the PDC block on the SM8750 SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
> Resending in case this fell through the cracks.
> Original:
> https://lore.kernel.org/all/20241021230439.2632480-1-quic_molvera@quicinc.com/
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


