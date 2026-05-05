Return-Path: <linux-arm-msm+bounces-106004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LVRAJAf+mkJJgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:49:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB2B4D1A31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F918304CE8F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 16:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009A84949E0;
	Tue,  5 May 2026 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="JkAevuNr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E449252E
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999599; cv=none; b=d773OVy2+Hgbdm5VFCnrVSG3KlMesADRApV7xuBp3e0v210StkTsla0FXDdPc93WAoH4gObTJYWiTUvehDUmA6Buc189JejiS84unYgiu+90xz94FnKMQw0tvrcdwl+Xve3wgMFTbfDiS63BBssIhzT7lo4HHx2Q4gEyrUk8IXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999599; c=relaxed/simple;
	bh=lP8GSMfbSOdPUQu2yG23BWNhx5HOEezwIqDOAMp/G78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mvw0uQ9ZYEhNYFrbN4/BF5MdPUxoAANvYdig1n7gn15VQ2T/3O4aCE9d15VaB+hfKQkfqrs9OqvFSNaDztrNtzSYU0KYHa5aK/hK84wKD9zjTUprwA9RT7rdIs4Xq7rbAhMVORBdNKufGP91KEbcaPFgLXbkL0YikNla32/Ic6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=JkAevuNr; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79a535e7c00so67616907b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777999597; x=1778604397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DrfGKIeyY4VV6HtGnp4FKIxytz8xo/bAXQmJCIlvsw8=;
        b=JkAevuNruhd/yKdOlNO/Zb4RDcsdJSG8b3alVSqro2WqzsHTZqjrgeqGwWn2qboD0R
         Vvg10QJ5eul0ZaRcVdACZe4ej6YQ6+ykfGXbLrDof53cKOyGDxvQFOXpyBJ+2JgLVEdw
         CmpVDaZfiR0KHOvghsUBqRSnDsIhdmcqGpqEKij3Mk++aVjWT9/l7oNgAwcNdv4WrqzR
         VKOV4rioDm/xd4aAmUWWAdto+cotpCAZ+6rYpyPyqRF1zOt4OeqzKXizhKTimcDgL49s
         DVZZn78TEwa/SfVNS6gcZBT2+EQL3ju7rQ3KLi2V0oDD5NG3pvX1PUlHpZ2sENlL3aJA
         TQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999597; x=1778604397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrfGKIeyY4VV6HtGnp4FKIxytz8xo/bAXQmJCIlvsw8=;
        b=evdg9USdzWBCp7jaf/RYX3481n9l/TdI7x0DjMlam3fEcvG01D0CLVw7qWvqsEVo6H
         pNG8fdC29SpKUA0GT7fK2H17FxjoUjWw85UW9WksaZhzGqjfJFSnQZYyWL0Y0YjFTtnU
         GHaajPkCG/Nhfl/7XhTc0Vfn732LJegdj4Eb2pUtHq+3qz5Af7YvC636TSRhMfQTGV0X
         l29AXJpbyeQL8Jo9c0Kpdb8CeE7N6xACpHei5wsUSeOaVtVBPy+dUiBw132sCq+uqAyI
         kZdRR88SyOk9od5aZBcY+SbFM3mkyF5Liu6ZkBSUPF1kUqpB82vXM1eA4/xoiBb4/4Ob
         g0IQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WjRP06DdunivobZPtdaQgwaeS5noYF6yxX2kNBuwkIU1ktxilNMCe6OxSQytN7HxO2cNzILMP+r3uutD8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnp1ot0U/i8YjVcQbCmCbeJ3MsP8HWsoaFZdfOhCXyJSjhCCsI
	ujP7+By1WKZmBftE6aqdI60wmpe6U/YEUSOeZZt0X7b1TWSDl0csrXRaqTOR2EJMCBI=
X-Gm-Gg: AeBDieu6qmK0KCRo2MKyUkVCsWwxa4mqY7uuugwdEmPzLupG0Ih8DIQLFFTYZdCiKp/
	uWBmHh0F3JM2wrid6jy5bT9NXSxOZieH2ytcAOe/X5FkDjzYS0xhJbCZvAAexdFtejdutsGpeWM
	XQ+fPwol4k5I/qOYHTP3CzWjrXpmJkCHpbBnEuzeVvHb5y2DwB1NiA285iS6OGy6H7N514j3z2/
	9dd5H7NQgLFRtd942UQ8c8OoJwp+YsRBZp4SbumBzH32oJdq2eCURzkgBwn9GClVKi+3Lc6prAy
	W6fbejaEDZ9Nf0ICx1ZvLjEgCFqNDj8UGlCa73GgELmwg+r0Mjybxaem0kGilOXFx2P88lEBLuu
	d5vgHi+94dJBRelhWt91iushPPYyyZkrDL17dxfPW8B7f0bzav0TEKLkS//F9YWePrpbEYf335Q
	hC1FQTyM1Q05hhuGz9PaZXwUTK0iYMVmFC1yHP4LZySCyq6n2lLDLseTwm46ue6xBbTMWBf+4Sk
	A==
X-Received: by 2002:a05:690c:60c4:b0:7bd:8cb2:4fa4 with SMTP id 00721157ae682-7bdac5ffe89mr42184327b3.39.1777999596609;
        Tue, 05 May 2026 09:46:36 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66558f35sm66666507b3.15.2026.05.05.09.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 09:46:36 -0700 (PDT)
Message-ID: <c716efe3-1b60-4a82-8fcf-1928c0233d64@riscstar.com>
Date: Tue, 5 May 2026 11:46:33 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <afod8ot7xb+g0wzN@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <afod8ot7xb+g0wzN@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9BB2B4D1A31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106004-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url,riscstar.com:mid,riscstar.com:email,riscstar-com.20251104.gappssmtp.com:dkim]

On 5/5/26 11:42 AM, Mohd Ayaan Anwar wrote:
> Hi Alex,
> On Fri, May 01, 2026 at 10:54:20AM -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
>> TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
>>
>> There are multiple builds of RB3Gen2 with components included/excluded.
>> That means whether or not there is a phy attached to eMAC0 depends on
>> the exact board. However all versions include a TC9564 combined with a
>> single QCS8081 attached to eMAC1.
>>
>> Add properties to the existing PCI nodes to describe how the TC9564 and
>> QCS8081 are connected to each other (and to the host SoC).
>>
>> (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
>> binding, but checkpatch.pl doesn't recognize that.)
>>
>> Co-developed-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> 
> There's a minor typo in the PHY name - QCS8081 instead of QCA8081.

OK, I'll fix that too.  Thanks a lot Ayaan.

					-Alex

> 
> 	Ayaan


