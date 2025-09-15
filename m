Return-Path: <linux-arm-msm+bounces-73499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BFCB571B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11D24189D686
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679892D837C;
	Mon, 15 Sep 2025 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="Q6e9zPLp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD9A2D7805;
	Mon, 15 Sep 2025 07:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921981; cv=none; b=IMdA65+nyRzgvl/Vlafta5VNJwbaSdZ3OlUYdABkBzuQqv6xhSzcFE6DV8KUnvK84+PhqBJMs3l5YXAOm5QZ24DGT+xR2TSNUaumpRtC1ePcjZ8ceVXuMC1lt4c097arJ2Pn/yXai4T+m7dXrTHTKjumdK8hl6lLy1PFCsCkbaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921981; c=relaxed/simple;
	bh=4Pb/V0LrYWVwi0b+Il7zbDAYpXPAXnFwlg+4Rq+OFxc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OOq9kJTdi+epX8ji9oTj8OxWGSW8C9EZzG95Sy/XxT/bC04sUGmGKdl3ZgjiAIawowYuO2SjH65quaMlFCiFgV/yCl30owE6HNjKgp0jt/OsIbKpW9DV+1CVdkSY3qUOT6+j8V/EJ/T7ScPM/SN2Y8JF3vgvuaesB5fqFtOp5LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=Q6e9zPLp; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1757921973; x=1758526773;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=4Pb/V0LrYWVwi0b+Il7zbDAYpXPAXnFwlg+4Rq+OFxc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Q6e9zPLpjiZIx/JAm9AftL+MtGTRZo1dw0B8sY9y5RTRJoJ2wV8Wwlcz0jdHsyDe
	 GcmOWGEd/54aWrBNEGcqSWWoHdjGzPXOTrxTHuejhoQ6AGlnVnKFadS4FiMZCbUA1
	 TTKDMxEMOjlSBAFmaFrAWy88aoLLfpTs1b4PXG5qpEc234PtSsgUNB/iHxUN1ioZL
	 6UKS9/foJV7UV7/YmjgPpaXuosGBa3FK4WwwU6cBnwnOgRGottF/7b11Wygi8deAz
	 c1MTwIAyzDmxYN8TTDOHcVhr5Fo6RkZ9X5Ka21t7mUgdRozwSK62cyL/RZpbCw7Gx
	 Q+deIcibBGayILlwdA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MryGj-1uabbs2Ahp-00fOp4; Mon, 15 Sep 2025 09:39:33 +0200
Message-ID: <03c64dcf-f553-4918-ae1a-d4cd427da6cd@oldschoolsolutions.biz>
Date: Mon, 15 Sep 2025 09:39:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: x1-hp-x14: Unify HP Omnibook X14
 device tree structure
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250909-hp-x14-x1p-v8-0-8082ab069911@oldschoolsolutions.biz>
 <20250909-hp-x14-x1p-v8-2-8082ab069911@oldschoolsolutions.biz>
 <aMbBOgNc-382vwMY@linaro.org>
 <cdd2ac5e-d02e-4dc8-a4b4-06baad5679e9@oldschoolsolutions.biz>
Content-Language: en-US
In-Reply-To: <cdd2ac5e-d02e-4dc8-a4b4-06baad5679e9@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o5fwt2RQiXXHmYY4bZTNlnm8TFhVcDzkDZqwdLKhgHE2qPCVXwq
 r9pUeoOk+kvUCoON6g3FpNTtG8JT/AV0FyKwIkRrTrra18URDyWccfA/QR+lRtvd8Nl6LdF
 8fWsIPSvu/gNAhKeQSmTGWbVEwiNiMXeLtXyeK70QHKy+eDPPSppXcC0HWGA6Ba43MvIgl0
 LTE5s00jFRAsgfV7fvFjQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:v3ApN73J6zg=;5+ms1KNwPHFVxSBESpGVSd6KCt5
 +cAF6Gghi2xY8BkUa9mKwl1SAGlZmCdH15sHsvIJcqntBkS+YD7tU3kBIrWQPMLSriOaDh4ka
 WROjD6k/bEDZI80e/erxN+aB+v2yeTk3VdlCNlyKOxVNBWQuOa1Ex+pKRMGcwPz7WSvH3Wrt7
 TqOFNotWAYeodsyw8KvKmqnmQBOWQ034bZcL1IZhxhILPK3ZY2ddMM4SxiP1D6DIvNfQfeo+s
 L5OFJI87/0PWIK7LVGDeF3pz8sWZcmrFvP+rgWNKbqYLCfs7vp0sYVmUo+wickWt979GFfn1l
 RpM+WJb7yohvkDtzgCjsbHLf2LuEeW5j3OCcVPYKl1LZoiDUP5thD2wnX9bBrlJlJOmqZavR9
 zy/plvtzN3rI31ZfbiC1R9VfWU+iTptlKKhgSypRHDu3u1iSFTPe05YtKzukUtLIFp+d+uv81
 giMUGvhXezCobFvYoSa/4dK0wdJFxLFliYfWMcNfWwgDKiJpzNSiQu2GlbsFJ+ONlldZmU+HU
 x/2HujKR1rZDmCVG0Wx2vsMw0qxfWefBRQcvWLB692eeVEISb0ShJKIFx5zM3MtjwkFH6JnB0
 92IS6BumhxYlBky1Pzv2BuufLPgma68FKRbBcQ1bJ2Ps00XcZmqWtekrUQg/s7d0O/WBkUXyA
 I2XghwgQRhwWzOIKFJnIakrzMnybXhh03hZQb0pGtZLoaA6vYSCDTq43ChboC5qnzRp3LPb8S
 5ihqjI90LGsXf7dIxwQ7SB8tcVCRGJvaSjWNrh9q/2n2ETVoI2gsEEFxw24anKffbggNJhG5L
 vzObP1iduMcNhx/JrDbQ2Jj539i/xi9ljCbgIv5r62HUvBZVLW9nknp43eEhhQuY4q80GLv/u
 iABh21YKt3W0asaB9+GeCBNyF/xxEv8viOyMWs1lhRADeAFU9VhvW9jJEfnzvxcAo1uAq07qB
 KfYmS+7x3kpS4MnUTrYGENtgO3lSaeZhqcr6XwkTE6y16Pk3Zsb0+BNk5MShLylVX1CwhzAJK
 T/wWFh5oWbB5mC/Hry0ZoCNtjOPtdWb6sqLdX1Qe0r4EZecK9P6Jdrqu6gDZR1I6UQfMz84Nz
 mJnXokvzSJZ4Pb44hOaWCXfpcFhwqT4ySGaKB/rX2FZiuwzkn+yVXWwwmPIR2AaRV+upgbwt4
 mUXtkCTiwFQVlffx763a7geb3XNOlHCGp2b0VA4PbGfUJe9WrdFE0tKAQNAYTHpNPiQy22gNL
 pKm2k5dy5C8dlnxppvWFLgacWdP57HV5nXAnWXmAErkceC8lJUH+iOigG8oIpE6OZNfmdk6yO
 WFZuYGhtOn8mD/eyEL7nLcH5MUiaDpHhCFQMS5qW0vBU5Git1OriK06FPSzmqBySBq9U6aKwi
 QS8Z7xnsHM1B1M11lM0lvrzPVLznRx7BMXxR8Q0yM+Dya4TSJ9niKV6yM/XxvBJdhAL+sofMe
 Fk9rbGQjz0El85/rVeOvIb68vGyzHLHMBSr/ZStCb0FP6vL69YgjpHwaAm6BCiLjEcXKyBJkX
 LebbM34gkxQZXWUB5tqFgAz1PH1lM8d2fAg95E4Zn77zLVmrhRGboKRp/uHZECpY+ekTE34Sr
 KicL4O+nm0YD+nvngFsoITt/GvQbBeyi7MJSdhCRt7v5PQRQkhm1e+b95I2C/fRdIyuf99o12
 uubWGhQglYrCg8BpkbweizvQLJOTR7N79xAJy2fT52rISBNrbUf5Wgst9PfGi+1FXbuUVunS6
 1khN/8IN9a8wUrYgPO0my8/vcHr/UUiwB8w==

On 14.09.25 15:23, Jens Glathe wrote:
> oof wow thanks for the hint. Will redo.

It's now sent as v9. [1]

with best regards

Jens

[1]:=20
https://lore.kernel.org/all/20250915-hp-x14-x1p-v9-0-fa457ca30ffe@oldschoo=
lsolutions.biz/


