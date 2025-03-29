Return-Path: <linux-arm-msm+bounces-52822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC311A7565F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 14:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 794D17A397E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 13:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6F1199237;
	Sat, 29 Mar 2025 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="r5NlGNOS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161C56FBF;
	Sat, 29 Mar 2025 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743254187; cv=none; b=pIUuwoFhaQUODDqw1ir5zF63z8TDYjZ+2+/mp9NdIEVXgDE8JRORJF5EeWPx+odr5IKsfiVDGR/EN4JOKwF8hEuE0iuueqD45wKkg67e+QS7nvJQpIj+lwvOwNpTuMuFwFH9hISvgI+EeTKStxR7xPJt2VfeO3Pd8X2fc11YEe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743254187; c=relaxed/simple;
	bh=KuHBuA8N+iaj2AuGnbHx4GIQehKT2sBQF/s4+KKtdTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKor+cQ6BPEeplHe6Vbpo3eg7k2XsJkqienf97Axg8bEkiMbVuYppby5hX29tAkPlcEpkqJCeVJWbAqC8a7XxZiQkYRzMFGUOHnaM3zPJ0Be02r46jc/EYtw7CKhMDTh8wjFqdwqOW9Emf7fdUwzzzg8UIFKgJ26thA7cIaMKgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=r5NlGNOS; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743254175; x=1743858975; i=markus.elfring@web.de;
	bh=KuHBuA8N+iaj2AuGnbHx4GIQehKT2sBQF/s4+KKtdTo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=r5NlGNOSS4ou4h6aHuVMk1ORDtvYYw+y+d+CFmAe8lnVyNYMULA6tKjQAZEe5Ccj
	 Bk9Mm3J/tg9El2T7lKO7fnYZdudAY74qAlY6Q8toUU6pUrc/deuDccQElVAJyHX7n
	 LEzbSXdLlEN22rHWBWS567r+XUvlJUF/dhXxtNZm1kb+buyxH0o0ZouzAJormLo2K
	 bb3apjV1BXOafbydoEWuvJU3gFPJiSekzatC49tJM5XBRGWL2LkrEv0kxtOwrrv+J
	 P+UAlz0X2FjcJJmezR+5klPe1ZaNFcEEMQ5+gypd3dB2dchZZOS21RxV/Ws1Vpyu7
	 INEvi8jmfPNhYwKVCQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N8Vsx-1t2mtT3ORV-00t4Bp; Sat, 29
 Mar 2025 14:16:14 +0100
Message-ID: <8a69d4c0-bd4e-4957-8b04-4a6130c82166@web.de>
Date: Sat, 29 Mar 2025 14:16:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
 <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
 <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
 <e32324c8-1888-451b-8621-0e468ca61fd9@web.de>
 <a96511dc-5ba1-4302-acb0-f3b49bf8990c@quicinc.com>
 <20250329104812225f9ee5@mail.local>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250329104812225f9ee5@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:0vCbp2qS7xGeC+SBFAnjb28Q/RO9znj5JgQZ49qVjGESI0ovFj4
 CmeUw8DbMvMDh4XyhBlWAqp/H8Zu8dJBFJRIaT00l4xeFWeNfExL6K37PES2c47PvEcKpPL
 Ni2aJJ0jG452VVaaeW4jUO32/kfr9/dEe+1b7ca2dJPvbyz9+b19SdXDgM5BlQ9uAdg86CZ
 3UkSmGZ6PDF0wn6pG3YEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sVtO3BxdzGo=;aKaK8yoHWCzvD1O+ArEVPeUptBs
 a00HnonhgX5CoMAU2m03+3N/8X9X0VY09kFnhzXuKwwBPrAapMxg2IJ4Tt9cGzSnoSKmK8S0c
 ut9tcup+qX+Rqe4KNhfLCqbQnnwp0ZLZBzRIYW3ooakmVDQ5sn1DHf+Dcq8BTbjKiLNIwgSg3
 fDdXKw/3cxRsShYT8FWNJQ2ETGHv0Ij16YkVs414m0fOykdcRgq731rnITGG+u9DT18lFzG0Y
 uMIlTG3BJ6loWXZGnr5nHdGAR81k4eKOXmj7R0msjYN0Hav+PU/IgJWveYS2rBp/6BHrzuqzp
 /5ZWOU1yII8C/6GsYtloiDUH+nsMVeDMWrtJ90NQdEq21KejnhBEQZAam6x+wm9cK7GuLebqs
 1XZhN0b9vl+7yFVi/A+xD9uZllvAjkRm4OLsemy9gGUwRlmLe14X1GxLNhLYwWERrJ9xkO+2K
 8G5XVLh1YJpzThGao6zRf5+aAEefVbLVIVPKhJtE50ngYK0V5frVNqDWhC1lFmYWOnEDaz/oO
 bYeFfhOcloM8y4GkhkrPYGNHcwkKDUoOyRCmLhMLHW7bkSBgbZCZDTU5flKmNEE/erP7mzZLp
 OuGEUtwRdKB7pZujiy6KxdO89QG3jZ9arRjYqOCO/wA73M1YrpHcJAY6BzNZXoVvYAS2Hpwy8
 v6h/i7ESa0jSlmwQDXIDpYw8S9C1D53UUOHMVZghKH611NBxtao2EoEH2czJJOnqXWadw+4eS
 mIkbkG/tBulN1W38zNLcQk3ydMeGP06WKFaORRG9a1fVaLWoWMBCyD7k8XOdVToOsKmivYN8P
 mIkxc+tkuG925NzrS1Xdgi8pnTFlYydFCSaT5H9AyzxQbewakixnemIvARrK+h+j0bmUofjG0
 u6heCL+du8vmgoy/IFqLg/nHUpWdw2e6ZhpcBvxSyfnK/4i+ZtunXpWnX4kHDzI/V5H6Un2dJ
 p2FGSvZN8ROGj3kswHc5wqXsc9+hsn9UKjiPRHKkut/OaN2I2FsNJzKMzYoK26+FxteR9yIIG
 VAOdZhYbSBY8HosfiN7/rhijKZ5npFU5PHqGTT2fkx3IoggjOxYH+VlvlH6EtC/Q3Nv/4w4ul
 bvOJMkLbwVe23im4yTr97pdviMLGUBHcLcQykZ730VmVDxTbDu5RL3hwPQ60ZgXhftC8dzpAj
 XeqOy/EFAfJlYEeaZR0q9dW/mAfu9/nKr1qe9MIbCb/uG5NnPtgEFK6QDQCGguYsqKFedb6Ho
 mL9QrZVlSwbma4CjrShPV5n0YGdqVZRWlx4z5E292hX67dO532gyHMmStbyBWeuRbbp4c1KM5
 nXuUIcZJ2rnXfThqO2Me5z8ZlRSKlUqju8orr4lb41FtKHtsMRPmW2qtbVAR8wDz3ILcP5tcW
 phbVMsMMH9KJLgd5z+cYppJF5I25LJFZbiI+hHm1cJK3h2hPraIJYwXlDskKBYlU2xO0mR8nt
 5/B3VTvhoQbCrVQjX9m3ZHrrol1TIrXljnWFg2QlRf5wogRiVBADSBOLf56k8+CP5YvlGtA==

> Don't change anything, Markus is wasting your time.
Can clarifications become more constructive also for the usage of scope-based resource management?

Regards,
Markus

