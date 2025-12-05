Return-Path: <linux-arm-msm+bounces-84426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C1CA715B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 11:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55A3A327A732
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 08:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D2A33AD99;
	Fri,  5 Dec 2025 08:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IC8oLUOB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9148733030A;
	Fri,  5 Dec 2025 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764923602; cv=none; b=rENUGAK/hcTF1wq2oZSAK33XbY/Jt4pcI6UhiqUWkQMLlEiDj+J14oj+7HoCYRmAlsf2HroIM16/1b1UPZp01kHujMqHWCYV+NxrWAmbRV1fCDuijXRky+b8nkbOHR8KFakld+RWBrBg8qUcei35Fj03No7QJAnilW26C1VMGIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764923602; c=relaxed/simple;
	bh=6FLIs79yqeUX+yeui13nYw2jSCWzh1jd9U8YZ/owWi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYRfZkOAbr7DGTIHv5FdipohEu2jPw5j9EUun5JvQeZt6SzFBqcLocFpdPzDt5HVHiYW907vix3drEPvXrbGGdqC1FqtgJy/VXOMsuxengcJwJdXqu5syodezD+6YEyp/V9q7UXqrh91AaSXb0gAiYzkfzERRibd+d2ADzKUP00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IC8oLUOB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78EBC4CEF1;
	Fri,  5 Dec 2025 08:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764923601;
	bh=6FLIs79yqeUX+yeui13nYw2jSCWzh1jd9U8YZ/owWi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IC8oLUOBy+kGiJRb5BvZsJ9aAcoM3x/OHWhf56X2GAXlFZZa2CxM6+Bv5Y2Zi0095
	 up64MIePMwSzz4DSzq7XkxThvgJYm2PJCnH0Ghppz8PUY0TTGA8aGKZYGA57hiNahb
	 Uhggo6IeBLIB7xkVa0E/6EqpQbe6BAyIZ/LpU9K1KgHz1O681DYkahlBAvTeM79HcY
	 eqbqMPg3amofx9FOB2jzyLlZJx9dUifWsLfZE8ZX6HKSTkrPds2WeNFlKqpghvLteV
	 7oi1jEepcF3wwUNbaIqSSEmA6nou7bNeQRUwByv/XiVPGm3EuueMXPAJEP/cMbnS6j
	 BRk1zDVWrHH/g==
Date: Fri, 5 Dec 2025 09:33:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com, 
	arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com, 
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, jingyi.wang@oss.qualcomm.com, 
	aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v5 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
Message-ID: <20251205-silky-uncovered-panda-82b0bc@quoll>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-2-kumari.pallavi@oss.qualcomm.com>
 <191e6be9-5e61-43b7-a75b-e2d211bc6630@kernel.org>
 <ab942177-a8a7-4047-9b6a-634aa3d15b21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ab942177-a8a7-4047-9b6a-634aa3d15b21@oss.qualcomm.com>

On Tue, Dec 02, 2025 at 03:31:17PM +0530, Kumari Pallavi wrote:
> > I asked last time to drop the unnecessary items. Wasn't here before.
> >=20
>=20
> I=E2=80=99ll update the schema in the next patch series to remove the unn=
ecessary
> items. The revised version will look like this:
>=20
> properties:
>   compatible:
>     oneOf:
>       - items:
>           - enum:
>               - qcom,kaanapali-fastrpc
>           - const: qcom,fastrpc
>       - const: qcom,fastrpc
>=20
>

Yes.

Best regards,
Krzysztof


