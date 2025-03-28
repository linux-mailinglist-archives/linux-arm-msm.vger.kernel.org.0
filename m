Return-Path: <linux-arm-msm+bounces-52768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43736A74A80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 14:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F33BB3B000A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 13:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7409D145A18;
	Fri, 28 Mar 2025 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="QRVsdUjm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A048D136349;
	Fri, 28 Mar 2025 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743167996; cv=none; b=rnoEg3Z3zb+bVl7NQsBphT/vBBrle8Vn4aSPe3jhApj+TEubyjFcodb+gxzWqnOvoX812A4Bwg7/1LOBeal2m26Z5CqAddDqBTgJ0lzoVHXGY1NAgIRFIdP7NPFRFiChYsxcqCs6ZRcy4HD4TSc+Df2DhQl5cuoEcUqE3W0KZzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743167996; c=relaxed/simple;
	bh=KYahm6JG0YdSuBaXvOJHhPaJFRhvQDkrJRy2sOWzvqM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=EQq6j9GmKQqslTC3oh3lc/syGqSYkSp/V5qE6knHXCqycmBPi1E60fFCC+bufwAaUOGYeIr4szd3QI5pXUFe8s88XzbQDJlDWx+6QCkH5NEyhXNSixv3NXOysPfyxQUrKRjmHCshCS4jHsQH8ffg4fE9+5SXUi278ZtHW+rhfgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=QRVsdUjm; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743167982; x=1743772782; i=markus.elfring@web.de;
	bh=DP88rPq/JYCBhLpHyj7Uu+ctiTC9ho6e5ZWTcc8Bw3Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QRVsdUjma2+1dnIp75j/U9u+t2iVo0DXPSWp4hxiuKRWlqk6Bpw7spBrkW3o2ncd
	 AgwMLcZyOFXh/yzMD3+GNnZyLvPvsq5kSWjWRj2+CFfhEcdfxMZMcYZm6kVyQOLiM
	 /dxj5Sq0L+8Xg/PfOeHzDI2EEsiGKCZVFl66Umj3FxCER8Qk6XayU+pm7+TIZdr9c
	 uORxocmB8fcKv6CZUwYb0Yicu/9DrrbldvtrjtLJfcVoOiCof6Kml4UKuNk0kYw5E
	 TX49xQZxnNo/FGxAMqtYZQOHGMByyzel3uF3wU01Zkd2BD1abfvkEUb2JYN9pVEuD
	 RVkrdoRamHhc9JULHA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2ggX-1tyzdB3EC7-003uVq; Fri, 28
 Mar 2025 14:19:42 +0100
Message-ID: <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
Date: Fri, 28 Mar 2025 14:19:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v2 2/3] i3c: master: Add Qualcomm I3C controller driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D1NZ9DZicC+HG+7dw0RV49Ulr4osReyhCq4fkq4n5AWuD2f3hEf
 O8AW59tx/bkU6DXG855XMR/FShgvgFnQgTfzSIt4PTvv/HfxCzZnwgjmdeYDQqOnZU621FC
 5/5aEmCtC9aexJcQqoQEB6SkHr6pST6dVCrjEj4VfXis/YBZtT7FlcZaTOkyDrWql6gJDmB
 plqdGAcGlgAPC5yWyC6kA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UUnc3BLpdwc=;2HmWBbEzTvCxzVkzd7w3vzCQtA2
 dGrGy5TnXmVcsyDq8Jm/zF3NKOHdVDLVmL8/1H+iuVUTCUuP53GvR4C1dLOcO9NXIkzSxVFoK
 sd9JfKlHFOLAAbHG8XgTHB/nfqer+TNUucb8xJoGwQzdCAHaH6i/Ps5jke3bXjPRzyN0pL/3e
 jJCaBMZbTEsmXPYpOJMcUXRSOTr7x3Hy9ct3qd8IKQZePIkufLuirQZiXpF6GRjeZ9mMMYIub
 RtebDjtQjZCt686TC4Ih1xJpm4oCKVmGwVdl9GpTTyUmu2hv0FBY8xCBQ0STTbDpMCKx70x1b
 b2I8iqmpeDRVSRNbodKFxb41DwU5VY2fQPfzGDODHo1wfG8GRNYwhHvYSx8IWYD7aaG4gwe7V
 3iHrhGg7nyNt53m6DRHTL2gMznhlIpvpcblEpshAp44UhSmxYO+ekOhNUyhscmgryK8+jczSE
 UcjhW4RWEV8z6KzCcrSPrt4URfjHwW3gdeyUQfpkRa5l50drQXDJaJN44JwharRQ7X8uMDEA3
 ARnp2eekcSvTe5gHMOypqyxG3d5UGimLhR1nM3JwMu6WPhBbqV/nBv2PLwZkJ2h2oofjyzP76
 Uro+2uRalPVRQaFgBKHlLWUllZznrrgPueEbGc+ZNZ+31ZwfOeLyJMnZyUF7qFWXe8R2GJ8uX
 tszXRUo7oC6NnjozCOFmk3l04BO7PyF6TtG8ipH/6LseqOdyScvHsWXlHKPJWrU/nWfSTJpbk
 E76XFXlWwv6tyTSZpgs76q9WzZStFJTQFB73UyRkARyAtN4cEVvwSsJ+2jxH5ABeyMuxAzJzD
 sZULWr5xBd+/a0L4nPCKUx3hM7QyTvk1UMwA3djDumxx/J7spzVuQJwBXBFfegmAAjdxtQcaG
 09LwVfppReIGVpCdAwGfwlVvJSG4DNC97zJALoytIXJcbjq3GFVfjLUH9dsJ4O3Tj9SY/f2d9
 blDt2GCiBLuYj1jBvWkgeqdRYFgtv8HEy9AdNAUW+OdIT2XegWe9CTQVVdi9FHvL5RYSZ80jr
 kVFG7Jv6pW3Pjqzipc//luk9j357oV17xeXCQaixF3+xCIr8BD3JxfTf2OuWEneXyZwuRVvdD
 9ruJx1Jp9PnEXXg+i+WzNhnFVSo5pNNvTEMCwit50yk4iBH140gAcGklqEdfBELAb/IMMGABb
 3+k6yLAqBkYl0QuGhqM//GJIReW2jR4+8RdqSUo3Co67XTaQD7xZ9rh82m2jV9qUXTPW2ve2N
 SNE+3NMFpm5hlkqUS3SKcrvUXC6ECSbFG2RNuhGFHRk3grAunB259ifLPqbZHBMBgg9X2pe4h
 L5DV46toqXxDodtEktSyZWMYTOHi3vMYJKAmiofLJAaPqt6jedWdv9jPrk8Aa135+Ltc5FgL8
 jiy30UquXyU2Q85K54o1iDAPphuR0lVsi1awwvMBAp2lpsjxgRGFpNtx+Z8R21veJvIyCmXBX
 qoDoM7YhGhRecODVykv4nWrYLRwZEN9bk85A751DMGWDfd636

=E2=80=A6
> +++ b/drivers/i3c/master/qcom-i3c-master.c
> @@ -0,0 +1,1107 @@
=E2=80=A6
> +static void geni_i3c_abort_xfer(struct geni_i3c_dev *gi3c)
> +{
=E2=80=A6
> +	spin_lock_irqsave(&gi3c->irq_lock, flags);
> +	geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
> +	geni_se_abort_m_cmd(&gi3c->se);
> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&gi3c->irq_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/spinlock.h=
#L572

Regards,
Markus

