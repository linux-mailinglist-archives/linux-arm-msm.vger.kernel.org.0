Return-Path: <linux-arm-msm+bounces-46892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE599A27E0E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 23:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73BAD166C94
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 22:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26DF21B8F5;
	Tue,  4 Feb 2025 22:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2iUmSSz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF19121B1BE;
	Tue,  4 Feb 2025 22:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738706958; cv=none; b=fEgvt+brMPEmyeto7z1cNp79I12Ag6z126gfeYz7i/UWheMa+a0/3GIJFgpkv9kXGEte4eoxXtVqAIAg3ro9FI85YjkBGkfxeJg8BubgzUM/19+W/RU+ZfLQzHPucKcfqN3oboaJaAnOUA3UglEi2MGyKPpYoeZgrBnJ1S8lvqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738706958; c=relaxed/simple;
	bh=Q/b2TXibazPA+Xu3VHO5Z1c4UqPVO/0QWz4Naf8gPcA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lNqZywRZJj/EHITIVVlVLq90ClTodxdyfGsQjVTF6Fu77rZc9tj4bAIEZ4PV/XRpth3WLWxwMybftU8J+iyQgJ3W+OOuCtRlLaFKS5aw2JQq/Ya+KPZkQEgO8tH1U5z9X+J8zXIjQEiHHGfycWTwFBabKkdTinMO961acSVLU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2iUmSSz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16101C4CEDF;
	Tue,  4 Feb 2025 22:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738706957;
	bh=Q/b2TXibazPA+Xu3VHO5Z1c4UqPVO/0QWz4Naf8gPcA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s2iUmSSzuJGtFM57XyI6FA+MAJ3tJ6KBOe8Rzm59XZdCeUJ7BhlNlRVOAUOpbPhv+
	 VxLR2ZKlg8tIkqlG+aLnv9JOiYR6lIOjc8AaHvWv0eS3RMSeRiFXK5jg8FfEvwkFD+
	 KZCiofC5faT0RjGDXj4KHS5DMt6dj892wj7sW35RA5k6IuoVnJibpWHbh2WNQXJlNi
	 rGGneUaCih6m5Fiplc0+nLOGxHii1da++uHuzruSGfhb0UaNXtddkfYAZ2iFLfzsEx
	 Xgp7bMEt4W/5kstkLQougMdtxxtraKq7ZecQgNlOYTiV0l44uosA+e0AgVP2/HLuxq
	 TI75f5HJsjIng==
Date: Tue, 4 Feb 2025 14:09:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek
 Vasut <marex@denx.de>, Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shawn Guo
 <shawnguo@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: net: smsc,lan9115: Ensure all
 properties are defined
Message-ID: <20250204140914.5a91499c@kernel.org>
In-Reply-To: <20250203-dt-lan9115-fix-v1-4-eb35389a7365@kernel.org>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
	<20250203-dt-lan9115-fix-v1-4-eb35389a7365@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 03 Feb 2025 15:29:16 -0600 Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add a reference to
> mc-peripheral-props.yaml which has the additional properties used, and
> fix this constraint.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Jakub Kicinski <kuba@kernel.org>

