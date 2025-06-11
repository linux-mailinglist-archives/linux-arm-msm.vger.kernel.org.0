Return-Path: <linux-arm-msm+bounces-61018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DAAAD5EFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 21:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27BE2176F5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 19:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3DE29B772;
	Wed, 11 Jun 2025 19:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="RNavwkus"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91C727CCDB;
	Wed, 11 Jun 2025 19:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749669926; cv=none; b=JTdBgd0/w6/kENaHqUByDsRgytqSk5fHqbfYiEiPdJCONTWXAzOS9yjZXFiEcSNyWTfT0in5U0qoCkEKpCiXZ3QPD6R4UMq/SAV9t5GyVaFRBm2LPO+mRQfsyZY0NM7cqdJBwTJI5DXllIcyIlOJRyPIX3AMDF1GR+vCxiZSLlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749669926; c=relaxed/simple;
	bh=rMrecsMLV05QJATkaLBYEZHt+MUdO5IkweZcLHHNWPU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GjrI6ywXUjODMnp09nwd2vpILPYTIuwovmy5Zfzpditu+xEypo5LHLd2/+vWd4CSZ6ORfPBTlNtRMvq3gMxqVBJ9y9l+4NzB1FMAmhJlm84BEzQdW0kWhgOat9p04wySpwRWfkZGrG1r3kEtm6PFZG/3HorrkcLAKAVxooo9heE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=RNavwkus; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1749669921; x=1750274721;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=rMrecsMLV05QJATkaLBYEZHt+MUdO5IkweZcLHHNWPU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RNavwkusowpDrsPNRnGLUItYxG1uNkOcG3yrpdLMEhYpIvP2DpzlUqpIJPqLG6Jf
	 DKyhS14JO+tjDNe/AsDHXYL+rNMHKs4ypt/sTjfE0u6DcuoStSJL7P0kzNzmNgPpX
	 NQAZzwgtm3cqJMRXh2QDjxcT1r9kez/IRLPJhSfvljls7cUuUf9nOo4NFrBKBBIVx
	 nsN+2apwe4yT3pCtltvKI9EJQ1ZtHKf61iHkGuzjYmnJ5Nemj24qz8FvH5qmRn+Wq
	 sDhgPrEGaUOuJW63G0fyCeprq78r44gyuhP60O2XqV9m4rWGchriQntvJFnWccijZ
	 bIR6jG+gvipHT9VQIA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mum2d-1uh6iQ2xSV-00z90C; Wed, 11 Jun 2025 21:25:21 +0200
Message-ID: <64d963bd-b38c-4f14-bb1d-f7e89dad999a@oldschoolsolutions.biz>
Date: Wed, 11 Jun 2025 21:25:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v2] dt: arm64: qcom: sc8280xp-x13s: amend usb0-sbu-mux
 enable gpio
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20250610-x13s-usb0-mux-v2-1-598454e6ad64@oldschoolsolutions.biz>
 <aEffYQND8eUgJbua@hovoldconsulting.com>
Content-Language: en-US
In-Reply-To: <aEffYQND8eUgJbua@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+BhG55VDLfj/+sqJDIgRGg/xEIZuxqkARB81LAmByP2KY+VvmwX
 KbxPjrXWTlmUZAEMU7pQDVK828BKjt2i6RiCmh/RUONusVBym3XRDQ3HZc/HC9w6PmqmHBk
 Xs+X4KawGhyM4AB3K2noTmfFsm1+HPy4r8qBRLiVO+cgWcHow3Rg8q/whOPnYbV2/bmm38o
 umPbLH2OXC3SZV04lSRsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gHbHn8FrmBY=;4+vtrRykcxVoC5UInwTgKOlID5D
 k8WcsuUZC2Zo1K/b2Ee6q32HE36RplDskMb2TNuJ9F6wmWrmgKKsv2jbX4D1/9MzQ7lGTW16f
 z0bQnot+f+iMuhA+XecQbuRr8ZctysUjOlCISJFJSwdgwqiMUm97fUwPMBaCTtHwC8KaYSOiR
 +Ht9aRM/LWXaIJcwxnG6+NX7ylBtpVBNvfUIaNZ6UY9Ofy2RP0xBuATgEKuuUdr9FCO4dwPy3
 y7TsGcqrqx6/MsrIF9hSSfNr+c8ANPL6T32C/+fBsm7Z1UA3zCpbp4I34rAWsIocKT32W8J0R
 Myiiz6QI41VvdMAV7fzCLwtpZmgpLZQLY/8PtbgFL9C25P9bnAYpFKxCdLFrIsYF6gBaCR+l4
 eQ15KzoxUOuF3SXo0B2ETUhhTizNFnsI6h9SS4SP7YxUCHzxxlbr0Y3XCtSRUKkOi1fNoufkb
 qUO8F5+/MD92kMYcNBadTNl/oJk1riaX7YMQIpsJm4XRCO5UR0iQkO34J7ak8Do6CwXLkoczJ
 Ge8q3VJknFH/gbhhWdsVASg3wUzNpverYFTf9HH6je25wVHsFA8936vNmnTl06G5xWzrh9iCe
 KhKTzovNGVWfHnaNPEE+rpsEK+Cty3qpnWC2cR+hogHnV7v/7IoQa0lEAxwQaSdJqKiym9HPM
 Dy1agpSIwx0becGHzAKNgHOId1gVZ5PjokeG1uD8wSh3+hkodlShKccXPdYgvxXIaUKOBwFD0
 0SZDa2dQFfF18/bo86dAxrat4nDwuNUcvI/NI69jgFw5kNnJJflFadxXyEBLnLiDD/58QBKDS
 ha+LZIfF6kKuWnC9K164JaNox/FU2AxYGHHBs7wD9dawRO9/832c7g/gnU/zGE9kgMUhs/uTh
 gSZ/2LZUigBxlX7Qw4U5koVfcIePAlJXQ2ndSTIC+VO0qjM30K7xMzwpzUqD4AMVZw+K1lkSa
 2Zt8sIQFr4+/EbgzOWcp4UBI3+DDXpxYIZahfWBbOsy2kydGDRHWMHHa7NqxtGbAI0e1Fgcht
 58i6LrVCeuuQAusrf3+rTNKYGEIDQaYV8YagL9u4Il7CgYJLbSV8qULxI4TcpRioSYHvPgnnD
 aToxUU4SSjIPIXm2ynAfeknoD83FNRgz9rrZg6CABRKfJtMOdm58fhfUZC3+8E+VtbDrXmP4k
 YbhlNUjfX3yWCfl/AOPsKJLcXqXUm5Wi2aM3znUdFfrQsxdfnvZ9Pp/cOEDzv2DYQi6BX1nQs
 koPv/mjSPAU6WN2cn9OlU+rNYH8QjsrKQ1phPQJBm5dagVSSkQSAKpxfOGnvUFz8RGsL6c5S3
 6211vtMTDaTnLBGTzg3a1gPU93ILZtAr8nNH302BNidiEJ0KiVVoFMu2/PYCC/F2G4I0QUva9
 aNZDbR49NZCOqaB/4O/+cA2RXfHWTDxTZA3tVSSbPXlnk6xCB669htflOx


On 6/10/25 09:31, Johan Hovold wrote:
> On Tue, Jun 10, 2025 at 07:04:46AM +0200, Jens Glathe via B4 Relay wrote=
:
> DP alt mode works on both ports of the X13s and "resulted in
> gpio165" makes little sense so this commit message would need to be
> extended.

Well, that was the problem. It didn't on USB0. without and with the 4=20
lanes patch.

Observed on Windows Dev Kit 2023 and X13s, what prompted me to look deeper=
.

> GPIO 101 *is* the OE_N pin, while GPIO 165 is not even connected
> according to the schematics. The mux may still work after this change,
> but you'd be relying on it having been enabled by the boot firmware.
>
Schematics trump any other data, of course. After a lot of tests and=20
some wild
results I could narrow it down to the display I used for testing, iiyama=
=20
XUB2792QSN.
It works with HDMI adapters on ~all other displays I have - with and=20
without any
4-lanes, lttpr patches. And the original GPIO.=C2=A0The issue with the=20
display appears to
be something linked to how negotiation is done by it on that specific port=
.

Do I need to do anything since its already NAK?

with best regards

Jens


