Return-Path: <linux-arm-msm+bounces-53820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AB1A840ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 12:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 557AD465D04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 10:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FF727C174;
	Thu, 10 Apr 2025 10:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="z7kV0aTq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3758BBA33;
	Thu, 10 Apr 2025 10:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744281531; cv=none; b=GXeZFo+EyaRsVoq1mSN4lBk12/J+ltEYyAiHTEcHQRW26IRYKClmoGqDkBimygxcQW6LEQhmIzxG9K8jH+f2TI6YYfkT+Kd+rvI+uBFV0imC4R4ArLD7ZPH8mOzvz2c4l2p8qS4KYRigVBDm84b4Fwsql+DAJEXW80FX5hLgTm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744281531; c=relaxed/simple;
	bh=c5XTT4qEHGgCMYa1z33NO+JggFBj56sKwgHQpQ/tYR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lN3mQAGlsu3Fv03SkJnviIwPPS61DccVDS/Op56PtZvPdQEZ0phbQ7hiymV6p2y60MI7BXhJe8FLxFcqF9cxUmupEbJ5vZG8NRJdaykAZb/W3QI2vNjWBmMRZjyTIKpz6AhJqkuVxC/vGQMJU6CwUpU4F+SvKqoYw0716fiqUZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=z7kV0aTq; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1744281526; x=1744886326;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=c5XTT4qEHGgCMYa1z33NO+JggFBj56sKwgHQpQ/tYR4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=z7kV0aTqBMLaRHnzg2mM92FPkV4FNBMKb62vbyE6Cspsm574APLbsyqLL0U5Ivb9
	 m82aWivXCGDYf59p/jKmZ0Af5ZE0aXBlm/g/n8/axMT1Ee2V+6FVOL08jUJouSsnF
	 gl/42DwYUSP2tqhGQx7Qdlm9bWg1yu4PZuXfuMlFlCklr15iVkeU3VD0gv4Gjri71
	 4BxT+pgE3bY51/z+zoqh0eKSlZhKjJbcckLlW8pFHYYW5DN1KIBPQx6vigg5NlTLN
	 ahlWlci2oyKOc1o3yVrBV3I4g/5ci7BdatOqTLN4WpXQv0RD8CqFSdZEA/VI0gbDV
	 AZCnjKiMPJBMtv8YUg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.152] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MDPuq-1tsP5J1QW6-006gvS; Thu, 10 Apr 2025 12:33:15 +0200
Message-ID: <44eb1bf8-55b2-4185-a4ac-fe41bfdb71eb@oldschoolsolutions.biz>
Date: Thu, 10 Apr 2025 12:33:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-hp-x14: drop bogus USB retimer
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250328084154.16759-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250328084154.16759-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OX0UsNunnMDxxZSh+PkinXtYyho1+HXrTSk+9RMAUdAjx/nHiEC
 UqRycI/xgkYM5PhtkuXYCuobxG5NAUBBue5B7RvHIOtwHw9lJdXlLrzNdewJGCU/5vnSpM+
 jK+venid9CwFSWmKqj2e9+xMa+D0kP2S6AIEELcawyKnELjs0ndjCI4p6DOpKOwhl1u03pO
 JxO1X/luQTE7MKtpi0q+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:juvZSYytPOo=;qG+OOdNGQz1TG4KehHdJa/h/jOf
 jqyPDcMUrUVjXgnlOW7/gaxqxtRKnV/f4qZWWeS5B7EYSorcJvM2ckgQj1nlp2Ua6PjneiifP
 7qT7DHeP3w9ov3VzRc+YTGJJoBy5sUH32IYsdNTVTnn857E37E991SrEM8Q/lw/oQL+ZL4eoq
 h4cmBSi8VkaoaYzCzw2YH4+rpw8FUX++m/WKJSaXqQRR5oF5hII1BP+go+m3wdtdkObWzO1g4
 3/TbpNcLkY8gfq6+Y3ZjiEtC8/Mus6cClyUey4/V72vJBmNJ3B0j31oQpLkL8h5h4wB4mhM3i
 z/e+CV8E+kdT+7NojTd+A1Dh2PAWPbepF05IqH3EG+WvqLcN4P73QslPJh6btOjE66Qi4+cpp
 TPyWLxcl5/TLAVgOGZFIgrDnDdQjfOYjgDIzT60z0/2P/YC4blEIf0i6h8pvb3dlFRqTJ5/F2
 BtdOZjppUz+GmIgKUWWHeXefqxFICzGDEUVuPSnRwOnBCNNfI6DdvVh7+WvzHBRb5q8RAATnt
 WyFTyQW91ZjPYSTcUrm+6cQCJbNzJvQN7JMfy6p9j0NPYGtU8cxTfMbmVhrhyyshhUSXM+aRB
 3wD5L3+XEU7/DbGtwhabq6Ym0bNb3mr/jCQ8JWFf34vgDOyzpgMc/otdVYSEmcNMJmquiwYua
 eBHvJkgTygRacNor6gogkFaHozkR16XMDU69e5zwUpIIPwlJW2ToVIBFmStBt58+M70zpDLgj
 efM3h24os/WNjXGtNvM1ULvb5b5zMlXdgr1CbvlO+o9jn6WYGG0iVtxX33vG0sBhkmODx3ptD
 hMRVTtmcNhl4s2l7AEypSX7YqehoyYVVvaH/UfiiFwAV0VEMwd6ZRy0NiR4+pP4A0PioLuSen
 CaCDjUFwCuaIxbF0/TDjTZJV5DS4+KAAYRTVMzrxrq6HSrrTaZTcOHuZBgnjmB0Zya2+oEdUp
 5i2UcGnGZbySnSOhRIT9Tsf08aCXodzDfSoE20cVTmHFcrM9wt5iZX/7BWPgaydKdFWthVtCD
 2J+vQMw0JWEPtl9cIH+pAN7cIjhyxqcgoTgLejevJoCVcBLB9KekI/sysLyfTd54TMmvVMdMi
 /g76TpzEpu6Qy92MSS4vXrT+rQ9ifcEUkhcMcYfMvPZ5/dvBW+dIL3y8Dai7EKyfy0a+zqYPn
 DA3aZJQiLAVMyOGlkdIYkDH41k98xRjxAIXdTr/hSlCmtrcIUAkaPQRTAzmRt1Pcc114Bhc4a
 63T+DjhUFq4rLmxvEMq+HgXNUUrvUYBJnOlQRQjNHVYc077v+D6HO8KmwLMV2GIDbRkEsEl7T
 yHSOhhz7p/YaPd/vYhMD+9K38ABamoYWXvijKo60WcmCTqq989arsHRYnYGCMzM98dzGiDNHj
 86tXJhJZAgYuCWLMkmBIBRsaEgqjJuQj4dvIQ=

On 28.03.25 09:41, Johan Hovold wrote:
> Note that the SBU mux can be added later when/if someone figures out how
> it is connected.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

I have added a patch for the gpio-sbu-mux on the 10Gbps connector. [1].

[1]:
https://lore.kernel.org/lkml/20250410-hp-x14-v2-0-d36414704a0a@oldschoolso=
lutions.biz/

with best regards,

Jens


