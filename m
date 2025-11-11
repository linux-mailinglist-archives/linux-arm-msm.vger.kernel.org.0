Return-Path: <linux-arm-msm+bounces-81194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 901A7C4C39C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 09:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 52B044E8B2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 07:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933E42C21F8;
	Tue, 11 Nov 2025 07:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjGEIOut"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650C615E8B;
	Tue, 11 Nov 2025 07:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762847935; cv=none; b=oNFkGklIFlWA/EXuJl1Z4pNMTuwR2PD0dmEX2B6vIx3S7ubPzKNYqVUA28UXSHyoeNx+sCh48G3Jp/oUf+/uNGtwAtbi/ak8ufNeFfPh85ZZs3DACsrKlEJXSMe9aFDDVajjmLvWbUn8qzd749QDLVg4tvuZskb/Iq3dEoqnHyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762847935; c=relaxed/simple;
	bh=t8z+DsR+SctqG4ry1HDsLKkUjYHAZMrxzuomQp6SW58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azqMVjU+z3ld2WK8G9HeK5eg47CAauaa+jfeDEGUKOixsJCpf6TvFP+3aVOrqoX/P2I4HfxdJkmS+Mnr3aAHnhhECDcgiHoCKi1yJigcEWmixdaWNRzpR6ui9CWUr5xMXFale9jK2TBCNYhQBnaOI5EQs6T5lRgLmJQ54hII3Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjGEIOut; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601EEC116D0;
	Tue, 11 Nov 2025 07:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762847934;
	bh=t8z+DsR+SctqG4ry1HDsLKkUjYHAZMrxzuomQp6SW58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjGEIOutK6PmrJoukZphpytayAF+fN82nQo8X89aDoeZmXiJTESO7W7a4iCGwlnUE
	 tR9j+ZRBesJWZkPY7Ez3PCi8MvsL2UwzILa6x4Zc8xXRQiXousGE08DFoTBWfkDzuN
	 Yjvwhez06aDEntSgIccF9r1I2vpPME223IHW8ajRiiyGwOxQzy6l7bPQrZwcTOcAs9
	 lVKCgVCtyrjySyi9g0K9Ss+DmNDhBqbsmkhfQrxmvpYiCWuJLvnBIqj2PQw2Ve5Q5q
	 oU6mcH8uWT3AjaMQHSPYLN79vyhiXQQEjbSJC4iZXuIJQnC3wSzn5BYXxI2n10S6KV
	 deziRAddUrExw==
Date: Tue, 11 Nov 2025 08:58:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amit Singh <quic_amitsi@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	lumag@kernel.org, neil.armstrong@linaro.org, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com, quic_rajeevny@quicinc.com, 
	quic_vproddut@quicinc.com
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom: qmp-combo: add support for
 vdda-aux regulator
Message-ID: <20251111-innocent-affable-saluki-2bf8bb@kuoka>
References: <20251110115806.2379442-1-quic_amitsi@quicinc.com>
 <20251110115806.2379442-2-quic_amitsi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110115806.2379442-2-quic_amitsi@quicinc.com>

On Mon, Nov 10, 2025 at 05:28:04PM +0530, Amit Singh wrote:
> Add support for the "vdda-aux" regulator in the QMP PHY binding, with
> an enable_load of 36000 =C2=B5A. Managing this auxiliary rail in the driv=
er
> allows proper power configuration on platforms that provide the supply,

What is has to do anything with the driver? Why are you documenting the
driver?

I understand this that there is no such supply in the hardware and you
just poke to someone else's supply.


> improving PHY stability.
>=20
> This change is a no-op on platforms that do not define the "vdda-aux"
> regulator.

Which platforms are these? Your patch claims here that all of the
platforms define vdda-aux, because you did not constrain it per variant.

Best regards,
Krzysztof


