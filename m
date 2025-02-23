Return-Path: <linux-arm-msm+bounces-49048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F18B8A40DC5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 10:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97CDF7AB367
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 09:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66D71FE463;
	Sun, 23 Feb 2025 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="MUrgKJvn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3D81DDC12;
	Sun, 23 Feb 2025 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740304234; cv=none; b=ZH20BqOaxhqkj6GiNgXgWOIGPuLouJ4dosQgq+l77gdlvXeKDW2luHAdyhHdBhcHNr9yzjQDdPKnqz13CV/xBKC+9qs96YrNkg1N7L2fIiQv5tggD/+ARk/dcTD2XKcrl8QoYo4KJYT8+7uk+8r+y6J3ED0IQHC5J3Uu0weanMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740304234; c=relaxed/simple;
	bh=d58RwVa7DbcO1qKm0r+LcPPaDjg73Am3OIA+pp6DxJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sF4Xx2yWSYyuYIuKU+a7Fu2xmIJVZAVqyxYejSmmCkuHkKX/I3VMsrxj1FYxYxP8bBUWZw0smen3/cTONlYyjCjo1PKs3l7A/euz0UTNP2k5KQJOzJ3+PjuDukKFpniQe82AbeVdkrr3sHfaswNDGnXVurHq5NmZLvX/wS/QXTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=MUrgKJvn; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1740304218; x=1740909018; i=markus.elfring@web.de;
	bh=uNqtagFfaX+k1TuZfiWllVGWvAnzX37lvyjkNmWZte8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MUrgKJvnzf8bl89mBXk5+a6sYHhBCdm/CbvdYwA/gAlYSkF42N0tsuTCi190Ycwb
	 joYGEspNS+fL16QoyidqL6tOBXrRcNfFDtU57gDS6J87HucPdFV8YHWu1uQG+3qk5
	 1BXo4H43AoRrC46G38VZiWN3RM37/QjlDoxSOoW+vaOjY6kyypc7fNS0PmfMQ4q6M
	 GgYVTvXggPwyuCTz8kzlwbmeJG14+9Co4lk1Fawa7clMF9kIdBDvVFC2P8VQARoUh
	 ifgFfyZp9tXBk6D0VUtyGUTIzBZT2zRkoHSEYGwGEplIfJ+zKixc1BmpcPntmOypF
	 MnSPXtjUeiH84Kca3w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.18]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MOUxo-1txcWq2vV8-00Wa8T; Sun, 23
 Feb 2025 10:50:18 +0100
Message-ID: <c8cb0a78-c547-41dc-ac35-d569c57ebe3c@web.de>
Date: Sun, 23 Feb 2025 10:50:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2?] ASoC: q6dsp: q6apm: replace kzalloc() with kcalloc()
 in q6apm_map_memory_regions()
To: Ethan Carter Edwards <ethan@ethancedwards.com>,
 linux-sound@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20250222-q6apm-kcalloc-v1-1-6f09dae6c31c@ethancedwards.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250222-q6apm-kcalloc-v1-1-6f09dae6c31c@ethancedwards.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rYfx/2i6V4IQ3Dw4RZIfxE9GJ1AH7VPLFCjjLUor9tddYNk4qf4
 iR936YWJXwQd3oOEGiX+aBc0Vp+qvfEnlIhqn4CqP3xhrSD9qo8QFD1dYP+nA4tfpqUS24t
 hjmGFdu/eHaXNsOPMC8iSSebejS+z80IEnt6oJasWJ+zkDJThr/aoJRgiSlPcJG5ET+ztBc
 LAr8LbKkCaQZIcUBmKxaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:frMgY1647xs=;/6lsbY/b9/Ua30DHNQG4CgdhlcX
 xHZHCdor/0mLXZXYLmpmCujHrSgZnHpfzzwFNqe61jwJfFCLE/D4r6MeJDOhl+ITz+U871kge
 +w82eon+5hQy1gWoa4f0YJAjXSInBmncXldm1xfZf1ut5JwLtnjDcQP8JNFgZkhzR4BmOq89p
 KUf22pKeCdMuxP7e08ThjEB/R89F7wDL35d6id7YCs+1/cyQwYeoGKX5dEvUt3dEimXIPCigP
 AdUWNVrC2dvI2sh2vX+uIKy0Uq8iSZPWgAeEhqbicUTsQZBuFCfjbcg5CoVIPb7JWJTDxpM/U
 PwRNU1DyrJbfrFaGyGS+wH9tWPckM9no+EoulC5s6TBCRkaWRvpRmFFj2Ip9qUMuQLQUvHsGA
 Ln7L1HroGOT3wCQFELsnHAwr0WObQ/mnVck1RvxId415T1wREz1UflTYvYhgJs0LjIYL3fuWy
 Yh8W/dY3wGZ0gqhj7X5CLnngZH42hGyXnPbGVpe+t2tliRmL+HJGTa7wP2Q580iSwBu9G5wdT
 jTmVhv7UQMa3yybacDsRH3csuaVEXIIigUpaKHdn/cCLI4gzgEPJ9J2exGQOgJChx+rxIVKK6
 V3pjQ4e1HchVSBuJIhu2dy+b8exO66mNaGjL82lHtJDJEUPmKLpHkQQI/DzB1I/NvTeYgu7Sp
 FdnRkv7dKDZ6BCZ3cNHPaNROBgIGUFp5Em+zTFmjhHG0xfSB7AZikrwybNRp2khS31L6TiSpv
 K97TaIEkp64XITs7dgqIerOrFR/8WOQa6CRex8/yhWhzbXckm7HsJkM5kEu68vR8q2EpY393E
 ijU6iRg2oidTgdz3+gtgI5o/Kq6WxW/lLnoW2eTc2Zug+zS/L2Q5QmNkbK3RCSJ2enikZVQez
 Lh5mU15nM/ttRlnMkHmKMZR6do9H9rIajkCIV8N/Qfc1cSVxNfM9X1FW/drYp80Yka7WvVkWO
 Qw9VDWsLfQpa38/GxMy4k3Dm40CBSo/3g34ZGCn3iSoi/zmAnnSBwoI2PAtkdrhgjUlrYbEg/
 3b5jiGnUTt4TaRDeuQ7O5LVbUe2jnB/uSiIPxRsBBxd8VmIO5Bbo9tM4H73ZTadAN7/4fQo66
 j7UK65xNgJWjw9usG9b7zdC4YfJlchcB2WTtTFEUeCikL7vfVSD+AabrZabRWj1tGYzYbd1P9
 ZABRPqwOp9ZYGqGNjn1D7JQAT4IwpuZ9jO0ZCXRyhu7m2x2jnNBJMS5uZUGMPyNrGLvqMcDpu
 j6Z1TIbffqX5fVM11kKf0CIBNnK/fROC6/3QnXAeQn0IhQU7bVK57quPHr/Hfp7vrsOtiN50l
 TvKnMUe7SeVDJLMXbP69JYZOct2a6pTjOp5PJkfSakLCLi91YV4cEqE8LmXyYUJUqt7fRbhGY
 VtIgY2UePs9cRdexwKBohYNiI1bhLNrK4ZVqin1Bqr17LEIcRxL5r4/ofE6HTetmrTRMiZ4bo
 NDhnLHN/iKnwrjSakBIaCvIsjxJk=

=E2=80=A6
> We are trying to get rid of all multiplications from allocation
> functions to prevent integer overflows[1]. =E2=80=A6

Is an imperative wording more desirable for such a change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc3#n94


=E2=80=A6
> ---
>  sound/soc/qcom/qdsp6/q6apm.c | 2 +-
=E2=80=A6

How do you think about to improve your version management?
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc3#n780


=E2=80=A6
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -230,7 +230,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *gra=
ph, unsigned int dir, phys_a
>  		return 0;
>  	}
>
> -	buf =3D kzalloc(((sizeof(struct audio_buffer)) * periods), GFP_KERNEL)=
;
> +	buf =3D kcalloc(periods, sizeof(struct audio_buffer), GFP_KERNEL);
=E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.14-rc3#n941


How do you think about to increase the application of scope-based resource=
 management?

Regards,
Markus

