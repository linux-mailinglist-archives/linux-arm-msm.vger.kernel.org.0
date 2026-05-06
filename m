Return-Path: <linux-arm-msm+bounces-106182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD2pCK2N+2lvcgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 20:51:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7454DF883
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 20:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24D2830069BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 18:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2C64BC038;
	Wed,  6 May 2026 18:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="yqlozRSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8C448BD42
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778093479; cv=none; b=hI9LHR+SSZPtFjkyqOQNMrA01LJw2a5Xi/rKWVe6Koh2OoMaEdc2442Kh8x/P4a+8Pm0vCh86cAqrGPX/z/rpIbiu2E7MkoQ7+De59oXtaWsqBpAk9PMya5VeoHonhAOSjSgLVu/9UZhdLHuKdFTsA7acxnTng9SBw/Mube5ZxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778093479; c=relaxed/simple;
	bh=s8SojpSoc+YK02FQkvYYyW4yXNu4hN2c6ETT93ArWJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3X9f/LhACEhTsjBndmucT6rL8sfMNvUVPt0pgmEzyZIr4qJgBxD9WyL8M1MmaqExzo5lp5KZQIRruvii7C/f0AJB5f5Yze33JN/D79tlIXoa4tmtzp4i1kukldbOaRXJb6/IKd70XMYgsET5CAC1xA/xVl4QsukfxR3UGu1lCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=yqlozRSf; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8f984bddf4eso2145685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 11:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778093477; x=1778698277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVXRMaORBAm1p+hmPERIzD3vaX/XPR3tJcXrI0tApsg=;
        b=yqlozRSfuCUJJ9D/wW3WpVlAitl6p+MalJd4d+qGeBPP7HHYOs15Ifo4zv4JyQM3RY
         oHUbujbmeUjmk/O4VeGR+RGnA5ACtoV1slnTP6zjtIbj9FGxzvsCksN3JeAJuUeQBmX1
         nRTiF8ZF9styqnDRIE7ecUgF92XqjybzmU2tpys//cSjNx11JXVgSmQFJy+B++GX2ZOC
         u6zWm0k2NWbcK/N5MW1WjdBqxvdMsVhpGXTL2VLC3zGDINTcSdycmkw83ftcdERHrH5w
         WiRYxhwO/qEdWGPjZdrnDZShFy8obFYV9aNveGpk9ZuEsT82efZmnwLdExxspdhvUjsj
         3Z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778093477; x=1778698277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVXRMaORBAm1p+hmPERIzD3vaX/XPR3tJcXrI0tApsg=;
        b=UsvfLMAGGG75IfPYfrrAzTc8YUADPxkMJJb5v/zDJxswa7RtKNqXi98jFIdXxwJCsR
         JzfHptINbGVaklIDyTTk3yp6MROl09qYGliOMGDi/uq/B658NQMC2O7kvIKAEt4/Data
         WJ9uO36qRJgFP+CIH8Ot+G3XDJFe0vRaX4Z4dgg1bSYsW8jlxM1QoxplAsKH3KBCVaqQ
         XSkAa3iMAajaXYfwJyYEZS1lbxxYb92FkG9Ci9v4cv2X8rKIIxgoO/Jh/UT807fIXASJ
         AOYTQ7GWNg2Mzzov4aayttP9MvxAqi6uxmQkaU2l+5J4L06TlHN9WzvrR2unp+AbR7jf
         G6MA==
X-Forwarded-Encrypted: i=1; AFNElJ99kUhPZiVtj+mh1c2lBozxWxeDQZUgyjrgLzfGBKoWsVwj6W0dnw8Js6x6QCYvhfB3/iKghr7BvuxbDJVo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs9p4DprbVOap2hk47yGnnHpWz0oGBV6TzawGv2mfkgNpEcZ4S
	rXV2m2/8FjTBAb4uoOcWfrvtSU03N4SCVTrijCoCtJyBFDaLg7fKUbxGWUgYN48vycU=
X-Gm-Gg: AeBDietFx2YTkskLodoTlpU6k0wU4UvFr/BsUhFI8DZLeJM8PqyVw7gr+lZKIBMaWic
	KAedEe3CweTWaZ1rfh3h6/VKF9U5ExTKs20sWhcTQ39TSYfNSxO7EDfoJhzJYTOAzqKvScj5HlK
	hA/lCRmSxZ8j3a5jmo/nkZS8vZDRpUvRSnINgDcKYI7F9Drvti83/iyBnFBUPg5PraqfrcnkAH0
	vlgcZ4frRzZjuenQF3msLc25i3MNnFJ4DNR4k3N4W6nOdT5rwyLyHOP44rQDfzH9mfTfAAQoFH9
	K9s6NBjhXgaDKsnBfc/6ZEALa/INhq2qbSTWNIrunqk4rSI0ITQF6Zn6Joe7G7IXTKiT+b13mDC
	DYyDx4Vg8gUDrhTxyqYuARqQZIz5hD/SmGXy+1j2KXcQSS7AFrPEge3AkclHlK+v7NhsNU9111y
	85URMTeVh1dreu+r/yZRFf9osUlwjXOpEWUqam5a2yF88uum1SIU9dnPK+Fh6GJ5PNhHLVJnD9c
	w==
X-Received: by 2002:a05:620a:1a13:b0:8cf:d804:456a with SMTP id af79cd13be357-904d4c54265mr713100885a.20.1778093476942;
        Wed, 06 May 2026 11:51:16 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc293837b5sm1889639085a.10.2026.05.06.11.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 11:51:16 -0700 (PDT)
Message-ID: <a52659e8-0382-4eb2-ab2f-5563bbb73fcc@riscstar.com>
Date: Wed, 6 May 2026 13:51:12 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Julian Braha <julianbraha@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1E7454DF883
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106182-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim]

On 5/2/26 10:42 PM, Julian Braha wrote:
> On 5/1/26 16:54, Alex Elder wrote:
>> +config GPIO_TC956X
>> +	tristate "Toshiba TC956X GPIO support"
>> +	depends on TOSHIBA_TC956X_PCI
>> +	default m if TOSHIBA_TC956X_PCI
> 
> Hi Alex,
> 
> In your Kconfig changes, this condition 'if TOSHIBA_TC956X_PCI' is dead
> code. Since you have the dependency on TOSHIBA_TC956X_PCI, you can just
> make the 'default m' unconditional - assuming this is what you intended.

I'm not sure I'd call it "dead" but you're right, it's not
necessary because it already depends on that symbol.

> Perhaps you would prefer to use 'default TOSHIBA_TC956X_PCI', which
> would have GPIO_TC956X default to 'm' or 'y' when TOSHIBA_TC956X_PCI is
> 'm' or 'y', respectively.

Yeah that might be better.  I'd like to eventually include
COMPILE_TEST as well, and that might need the "if" on the
default.  I'll find out whenever I test that.

This GPIO feature should still be a module even if
TOSHIBA_TC956X_PCI is y, because it's not always
necessary to enable the GPIO driver (depending on
how devicetree defines the PHY resets).

So:  In drivers/gpio/Kconfig it will be "default m", and
for drivers/net/ethernet/stmicro/stmmac/Kconfig it will be
default TOSHIBA_TC956X_PCI (at least for now).

Thanks a lot for the suggestion.

					-Alex

> - Julian Braha


