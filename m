Return-Path: <linux-arm-msm+bounces-38804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D379D5C63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 608E2B23798
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 09:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E87F18A951;
	Fri, 22 Nov 2024 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="dbh0B0Yv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CCA1D9A5F;
	Fri, 22 Nov 2024 09:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732268920; cv=none; b=p8P8LdoaQkb0bOF/Bh5VrR9a3KhZ/R6A4N67n8zIyOZLalvC62EyQ0IqYQ3hUw0saTYhbLZefBUnbnDNCa3P7kKPMhPAeI9cXK1DyVfEV8+bCTthXnGv+xU+PW4wKBjCh1wCjVcYbuww6WjdbM8tJbae3UABha5UQd/Jew/oPmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732268920; c=relaxed/simple;
	bh=3tlwou2ly1FSVPGI+kNPRidhI8VWMpU7ojWbBT+mgvI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E0wWHj14btr/B8G+i4NhvuuwRHuQXyX8+6gbcrrguyjSlKxqVO5es2YiBPzVooQBpV5YR83P5isxKbJJwp6Y5TuvOjAnqi1bDZOVAE/nFvFeyY0zQ9F1mucek920iKIXdUoikdgXgGZ7gnWZmTwqoY0WFFwzkXPzrvGwgraQErM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=dbh0B0Yv; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1732268895; x=1732873695; i=spasswolf@web.de;
	bh=jgsWbzEaeodrT/HG+ixsgaG/8789Y4nHnVAiPfUysPM=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dbh0B0Yveobj5uPw/ZYncFJgBjfQkpW4MShbnoYpx7xgLsvpZ0DHyOg1nPwqvVo0
	 BYfhu/6yegoO53zxJriveXgqbE4HCw60xeeb+knXwz2ypqnCrMS72D6me1SAecPYF
	 iLOH2POP/QYqRmgSWacTqsRPii0NTWe+EwYSp48LbwzYaCS8ErSWCAOAuNhJXaOWC
	 vw7UkuXf+Cucd8+MB2UAl3lr3lQfE5bGBj6jTVg4vuagdLpL8imBp2pEyU0ClDfGk
	 79dJwXewIXUEF+f1+N4AsOUa9HAIxPZ4WzxEtysWJQ35/K8aeEg81HsrcChDYKsTK
	 HWMM5Ep6XKW1bZ+G8Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MNOV6-1t3tSf265S-00I5uB; Fri, 22
 Nov 2024 10:48:15 +0100
Message-ID: <8b18aea7c30b16f3a79036e25579f1d26ef2b1cb.camel@web.de>
Subject: Re: [PATCH] ASoC: qcom: apq8016_sbc: Fix second argument of
 apq8016_dai_init()
From: Bert Karwatzki <spasswolf@web.de>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, spasswolf@web.de
Date: Fri, 22 Nov 2024 10:48:14 +0100
In-Reply-To: <Zz8_kZkKyetqnRr2@linaro.org>
References: <20241117232100.23760-1-spasswolf@web.de>
	 <Zz8_kZkKyetqnRr2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.1-1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iYAU8b2NyM15m6ed7nUARIN284sYmhrR0u/UbEdF4yJoWePOYZU
 2BSzVQX/fVK7XElwA35LiCzDlZhFhLYzORU2g79EIRE8Djz/r9NpqKkeqrsvRZkRP7EGMqk
 xcMp5nNPsWG2kUpc3SNdsVRtY2OTLyMk6Y18WIHg6ziBT7i3gX+CWSyt0CLs6/Ejj24dg70
 3HlbAHkmzvJ98zoDORe2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RzwKDYuTiT0=;lHrpLhF3BwGKawv2Rbk+QVEakf4
 Xa+aqcZ8EswcEPRfTaU+smSK1f5wUIqR8BRWTozgLhXwBjMUXGwoWg7XJJ6HffwVaGkeOB2kd
 jJMwzv72+NFcVv5VvpsUjrdTY1K5tYPsVtFtfgy9ylvEGj0fF4HF2M+ZO51ct852XSngs4Aol
 YqPlRbzacPpnqPfM5p8/xAaKYeANpUY4/hLrlYeyhSNISutLQbLk5dajH0nYEBcHptbIko9Wh
 NgyhWo2dTMSSmrL7RraWInUd7JbCcCIqBXV2lsK4kMjPShkI2vCOqWli8LokWogewsvKa+OuQ
 RKQbc9SfAL3o1j1Ha7PdV5fvVJCUlgUFU/AmokOrX7pbWahs2RTTugtoLvheKTv4eIBaPPSFh
 /dPwNJedjJGSHitxfAOs3lPOGSbtms4QL+hzuThSI8e0ly2s0eJx5sbXSaLOwK7j5J+VIq0Xb
 71PdJzs06YrFcbBRELTMisjNyrv5r6EnSa4GmXo8D1pLawgVZLWElofhgV8sfBSDCA7XfnGY0
 GscrMBgz2upjcc1D9BUiupyzHWIknZ+3+Ci2vCzpIpeH7kRLQG5Tn8Nu6s43F8XcwxTeXYQ3t
 qPnYb4Quws9d9Q5LQ/n75QWqqV1HqGjHJczG/MuX8ZO+TM6DtOlzmIvn7rJqTBS2fxquZxnSI
 zIYR/YBuk866opx7yJbXLgQUdt8a8OPBARen0npkqi/IZA7JeG1yiFFXHi8E2VuijEG9+Y9Ce
 XEI3DuvYzie5DWNF6AXwjjsJku+s+crCE6gKesu5uckTw6nybBtLMWmhWxdO/dEqtP9ujT3W0
 u8NHa1Cg20ty65c+gfXNFyViGHzodlugjD+N4RK3du3NU8lo+z/Wjir9ZLr8aezf8jAmYsEtG
 LvlAvZvS/+tQ+scYd/AzPSt4LaiW9EGi5/bJfjC/puFIvygNBejhLIVIsJTvK/1zp7X8mjd6E
 ZTixa3b+RxTjEDmnY8cI/53W4l0mEvkRX+ZsVhTcZjWcRSQmNhnGqLVj9fEdmmUJGEq5dP+J/
 vtqFejzzDHGTBhIuiW/TEe1FkkCwLsaCeyDkBP+nSCOYyLQTSkBwxV1syHloYU3XJxEMVODfy
 +cA8dZdg8=

Am Donnerstag, dem 21.11.2024 um 15:11 +0100 schrieb Stephan Gerhold:
> Hi,
>
> On Mon, Nov 18, 2024 at 12:20:58AM +0100, Bert Karwatzki wrote:
> > Since commit a78a42fb48b8 the second argument of apq8016_dai_init() ha=
s
> > to be an lpass id returned by qdsp6_dai_get_lpass_id().
> >
> > Fixes: a78a42fb48b8 ("ASoC: qcom: apq8016_sbc: Allow routing audio thr=
ough QDSP6")
> >
> > Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> > ---
> >  sound/soc/qcom/apq8016_sbc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc=
.c
> > index 3023cf180a75..ddfcd4616895 100644
> > --- a/sound/soc/qcom/apq8016_sbc.c
> > +++ b/sound/soc/qcom/apq8016_sbc.c
> > @@ -150,7 +150,7 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm=
_runtime *rtd)
> >  {
> >  	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> >
> > -	return apq8016_dai_init(rtd, cpu_dai->id);
> > +	return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
> >  }
> >
>
> Hm no, the code is correct the way it is. There are two cases handled by
> this driver:
>
>  - ADSP bypass (lpass-* drivers, qcom,apq8016-sbc-sndcard): This one
>    uses the LPASS IDs as DAI IDs, so cpu_dai->id already contains the
>    correct value.
>
>  - ADSP (qdsp6 drivers, qcom,msm8916-qdsp6-sndcard): This one uses the
>    QDSP6 IDs (e.g. PRIMARY_MI2S_RX/TX instead of MI2S_PRIMARY), so
>    qdsp6_dai_get_lpass_id() is used to translate that to the LPASS IDs.
>
> The code you are changing here handles the first case (ADSP bypass),
> the DAI IDs do not need any translation there.
>
> Thanks,
> Stephan

Thank you for explaining this, and sorry for causing trouble with my "fix"=
.

Bert Karwatzki


