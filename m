Return-Path: <linux-arm-msm+bounces-33374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0AC992D8F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABA891F24D53
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7684A1D1F5A;
	Mon,  7 Oct 2024 13:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="NlJ4r+5T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583B5156875;
	Mon,  7 Oct 2024 13:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728308446; cv=none; b=LWO1VkXQQfqtqCT3GLuNvuhvKCMcLaYUqHOZ0Cx0/DNulUfk7H+qd3W8h2u9GmScPGCMSIWaFvxNl1/lLudNQF5xzP7gtcT4Bjl+qt6aNCHmKHIjlG5PWKMTrdWCQDb+NcpMU25h/mgKTW0LEJx37KiFiQW+HIUbxgEhdRrCpas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728308446; c=relaxed/simple;
	bh=jLz84yx57rMUyMrYweXyVDvuBOPGOAyZYEzz4GQzM78=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=PBuC1BrstSQFHjuLlohJ8s9LxrVOmrju3OtBVvOExAsE+Uw5s8IcwyYVb+p2pM1nX+rmbXXm7ACSayFd91Gq812KoJxgTaJwuGUgcviARs3l44MeBFP7QU1GNSq2knijXCfsw4k2WpJvuriQqZVnWzjmdf4Nw8esUsciKcCRj8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=NlJ4r+5T; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728308423; x=1728913223; i=markus.elfring@web.de;
	bh=uNDbyTC+VvTw4II8s+8j3WlwWTsyRMvrYvyOAIO6/gw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NlJ4r+5TwqjWaDr3b8lv54NXLE12M75yY1PuGqve8EHk6iukf3rAo7Xo8mBLERo0
	 ex02+qHeivWGi+xVsQULamO2TxMekqdJsQJL7W18qZEplbJL3j7iXn6rFMvIH+l03
	 2MqWR1Df4vZh2yCOz2SNzE/J3eW+7JRIOBq0UfjJGxkdMJBoAyb2KUetJLkMVNrMb
	 jgDfCZKtpPoe5x7nXaQhF8/LfVb25V4v+j8GuLDOSlaVnFCo5I40MC/AGFVJjuejC
	 TO2ug7+xr+bBIT8+HrHxFds9TKhTASA03iszzEBaEMeJZ/D2ApFX7lseUC/FXN9S9
	 5rcZ36Qzy/C6qOW7VQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MsJSy-1tq3UC3Rta-00rGtP; Mon, 07
 Oct 2024 15:40:22 +0200
Message-ID: <bc2f9291-c91d-4e46-bfa9-573eea6a67c2@web.de>
Date: Mon, 7 Oct 2024 15:40:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Chenyuan Yang <chenyuan0y@gmail.com>, Zijie Zhao <zzjas98@gmail.com>
References: <20241006205737.8829-1-zichenxie0106@gmail.com>
Subject: Re: [v3?] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241006205737.8829-1-zichenxie0106@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:riV0L5mlmEIR4dXPGagU2I773oUqWQtoY5KYJxgB1uVUBjxO5Om
 zNswnhL7l5jeECauaAHGaRj1UYfNM1QSxOxpcZVrl1iz+JOtnI1L2vA/K7P9hjZSUAlztn6
 TOAfvKXIOIr1sy8jMQeOKp1MjBJWh9umA4anhUJJXMqRebm6rMIatMkIheT8/WP0UNw1c0B
 azqb0PrQC1FSw4sOmBamA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Fn7znV4Vg3o=;us8pt03XPhEI8ToSvd3lelJu9IA
 1QhsJ66wVxBBvXjxnYLIANg3kXp25Y2n9wRMf9QcTDe3Hbf9xrC9WLvHlnV1GpvADdLlINUIw
 X96hgxF+6+RztwsX5+OfAEXfQ1+PBA4+vmMJ5xOG53pke6meywwyxRYGhsEwalrKpD0C7041T
 J/G7t0hy3r+1hZe9wgD270F/qXfGOrGtk6OhJ3V2jhKzL+TIzeN5neff17HFZqxBKe6LVVAyZ
 SDUqxwJX6yTf5LCJyT8C6Znx7N5dHYp7mBWO9pr/PvCNuwQMhgZHSbut4IXEigmgGprF7D1lA
 D/kjjelWVblWcmVd/wiggfIQtVhLZNtcSWzfXAftX1UkcX7j+EyDaqnc6PP14Yl49EIXMunns
 0JYHUoLBF/2F9lq2BTTbWAb9UhC2RztLr2rcffe+3XY/EwNeHpvZyUH8KD6QkFxMsO6uerA0t
 VEfycSmES0Oz7ZBI6r0kVTqFz8qQleqVJKzj3DnQi3Ao4+TifpQGXNssa7MN7LeUvBJSIB8cg
 y8+2mdBxOWkGWo2TRJruEDQ0iPtVzl7LAZT4se1it7a9KiN4iWOZ6RSfuCmsrheGRTfWOgDle
 u0Mo3fNtEe3um2qdon8JTuyruancO66xZdMuNX7d660PeVExQlJxRKVDcLaFb5sWHRuryzPok
 v3rVK6qf26O5Dw7noQQfbwQ/JYSb/WjxgH8RhTmBoA2I6zJuQPm2AAZ9lrPDYGW5Q23gmEyjf
 CEjZ0djXbtPMgiNDH3BXxFztmmSsy1bfX1GIRjFXv2Jtca2y/LVpr1hcTKufslr6rELfEspwR
 ozDEeofaUVNr7am4mget4yvw==

=E2=80=A6
> ---
> v2: Fix "From" tag.
> v3: Format tags to Fixes/Cc/Signed-off-by.
> ---
=E2=80=A6

* How do you think about to reconsider the version numbers
  a bit more?

* Would you like to mention the repeated adjustment of
  the patch subject?

* Can a duplicate marker line be replaced by a blank line?


See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc2#n231

Is the email address =E2=80=9Clinux-kernel@vger.kernel.org=E2=80=9D still =
relevant here?

Regards,
Markus

