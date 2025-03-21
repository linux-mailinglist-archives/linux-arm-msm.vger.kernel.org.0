Return-Path: <linux-arm-msm+bounces-52183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 197CAA6BB96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F70816E65E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 13:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC9D227EA3;
	Fri, 21 Mar 2025 13:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbU3lTRs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF141CAA81
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742563013; cv=none; b=TLshzL8AnHMonEvTtRQWWm6mOMTXw+tKQHq0pYIRlUQBx2R2ZulwGGHLIsAiZ/FDNQVOid/xU2bFQBi8n/hZAdAgNIdoIaWmjZLRpLbt4ce5SkbgJozsinK6bfRqcFVgMuGlxVObXWGzKB4rZvE89GG7oKHkfNwvtv2ZeK6b78s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742563013; c=relaxed/simple;
	bh=5v0eCXSJKnOzt1bK7YTndfKX6eAKPgqOyM0NGeGssOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KSlDYxMxiyR50eiZxUF1/zs/fPVt9CmfIy6JOX/Ybg4CxmbQjpyzniZUKpzBax1UROvMk2RImMQWAvCGalr6f/PLi9J6FMVHdyd54XZ+6G9mGK/zvK77Ow0koWzYRD2sKw6KM+v/jJq0sdmV8p8ku5eF7Smk8HHE+A0YwoS6EGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbU3lTRs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCT78u027372
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 13:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rKDADviDBRmij4wqF3bNF8yg
	rPd+aXcSkF8NWGkccV8=; b=CbU3lTRsUR+71/EMi+TdzS6oaA2BNI0uOMCfeHmb
	3aionmkhue1FdweCXCzRZ2LNrmaPclCaL8r4OJszkaQTW6NDiGNfgkgUrTVybKNE
	ZgCA4eDgmTeKfOBk7DDpw3JHBWc2auF5yU+/wMrGm9B4oI6nvq4jbGTojTKBu5Ny
	lsjuLn44esjbrcBJnmrtgZmUIoPE6X5z2QL22JkN5U71qEG8HOyXjlCn2RvmuFdE
	ErZ2BkF9gnHumRby7WS1Gkizi3LvifoW5xge1GDoZMmGLGmIY3hr48SsPm1Pm2Wz
	7qd9YXuem7LacPPzJRz349PQ6s/6SitXU8KRnZoFgLTj1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h854g4g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 13:16:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3011c150130so3110395a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 06:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563010; x=1743167810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKDADviDBRmij4wqF3bNF8ygrPd+aXcSkF8NWGkccV8=;
        b=Zzijag3n3FPNLtHyvz8+jj73JYI+016/IzwQU2nJnRwaY6pT4S1IxO9y5tsRthRLg3
         qyBQdPcCwDIb+gBS0hdnm+omIiygM1UxddgGDHWZbwaNw0+QkNXG9FvgD/6GroiKqcVw
         jUPFIcrozfQYVO1X13CqLigGNJNhutypRfUZvCwq1OXAKPQ8HcPFirxolN6HebDgUrpu
         PDzcFMO0VRGIyNv2hLmVX5ZChaFSFayf6M4KpBKeJac5uEzTYWJCfNuZnU067R8H3rt7
         lIj5wjfHufmPwP5t8ic1kR0Did1VeCTOgv50PPPLfpQ3CMukWvl5yo7AMOTM5lPsWdMa
         GA5g==
X-Forwarded-Encrypted: i=1; AJvYcCXdZNoIxfClv0WJky1Wk0rCti/+qxFb9Z+0TaFrgfdkiBQwoh+K/SjWh3x6pTkmVVE+pgRWLkg6AV+r3ZOR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/H2MRJlu9dzg2Kq66W7jICXlbMyBAAdOtEJLUsyDQu5YOhB3T
	dlrzwUs/0enPZ6AtNMD7LaKydY4BoGUAerrU6wk/RdMqFq6zyh3gBZC1kh8RYfDTJ5Gx1Z5ND+H
	SXbZKmiYgLY7qXSD5lZhhPsDPj5/2a/JYKx3BiGl8l2cE0rXcypmwgczNcEaE8f//du+gTDa1Or
	axu58VZFdmFSoHNAhickz+GN0VdtokBLPj2FGRsOM=
X-Gm-Gg: ASbGncuLtF2A9XwIGLI/yMJOP644wMjO+rjadi319UG/UxIcgYZBw5gZ0CchX9yiyFH
	08J16LGG2sZhBI6xQupk5BkMc6sHZifkjNN+MrMaX+Q2ClXh/x7J2mcH/clr4TQlk3mlJSBBQJo
	IaVYZmGfcr1Da5h8ivG1iKaIFtcni4
X-Received: by 2002:a17:90b:2ed0:b0:2ff:5e4e:864 with SMTP id 98e67ed59e1d1-3030ff108a6mr5526834a91.25.1742563009900;
        Fri, 21 Mar 2025 06:16:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr2mutO+YUR5/PARS6/TKZO8Ev2O8vO6eT7KZPndPdr3Py5PTyw8qRv2gkQufsIZf3sd6sgOq3hu/uvvAaFgw=
X-Received: by 2002:a17:90b:2ed0:b0:2ff:5e4e:864 with SMTP id
 98e67ed59e1d1-3030ff108a6mr5526785a91.25.1742563009246; Fri, 21 Mar 2025
 06:16:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
 <20250320115633.4248-5-srinivas.kandagatla@linaro.org> <rdvsnxuc6by6sci56sh7thzpxo5cqi7q24fnmc7hi5yrfszwrg@kqjpiilko3xo>
 <b1aed195-b2e6-4f48-ba10-3049d74085a9@linaro.org>
In-Reply-To: <b1aed195-b2e6-4f48-ba10-3049d74085a9@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 15:16:36 +0200
X-Gm-Features: AQ5f1JpCRwMtkjJDn9oo-cBhrY2GuyMxCFMeKp_-hQaIAlV_kqtTNCxsu0Mojn4
Message-ID: <CAO9ioeWLRfzUOwjnFsi_yztdJo2Q25bhvjddh6D3naV_K5eShA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: J3C1XWb5Rn4JPVoMl070wNOUbbJkod25
X-Authority-Analysis: v=2.4 cv=ZtHtK87G c=1 sm=1 tr=0 ts=67dd66c2 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=2awXsTXn6f5pcYlzz10A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: J3C1XWb5Rn4JPVoMl070wNOUbbJkod25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=836 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210098

On Fri, 21 Mar 2025 at 14:35, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 20/03/2025 14:03, Dmitry Baryshkov wrote:
> > On Thu, Mar 20, 2025 at 11:56:32AM +0000, srinivas.kandagatla@linaro.org wrote:
> >> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>
> >> On some platforms to minimise pop and click during switching between
> >> CTIA and OMTP headset an additional HiFi mux is used. Most common
> >> case is that this switch is switched on by default, but on some
> >> platforms this needs a regulator enable.
> >>
> >> move to using mux control to enable both regulator and handle gpios,
> >> deprecate the usage of gpio.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>   sound/soc/codecs/Kconfig   |  2 ++
> >>   sound/soc/codecs/wcd938x.c | 38 ++++++++++++++++++++++++++++++--------
> >>   2 files changed, 32 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> >> index ee35f3aa5521..b04076282c8b 100644
> >> --- a/sound/soc/codecs/Kconfig
> >> +++ b/sound/soc/codecs/Kconfig
> >> @@ -2226,6 +2226,8 @@ config SND_SOC_WCD938X
> >>      tristate
> >>      depends on SOUNDWIRE || !SOUNDWIRE
> >>      select SND_SOC_WCD_CLASSH
> >> +    select MULTIPLEXER
> >> +    imply MUX_GPIO
> >
> > Why? This is true for a particular platform, isn't it?
>
> We want to move the codec to use gpio mux instead of using gpios directly
>
> So this become codec specific, rather than platform.

Not quite. "select MULTIPLEXER" is correct and is not questionable.
I'm asking about the MUX_GPIO. The codec itself has nothing to do with
the board using _GPIO_ to switch 4-pin modes. It is a board-level
decision. A board can use an I2C-controlled MUX instead. I'd say, that
at least you should describe rationale for this `imply` clause in the
commit message.

-- 
With best wishes
Dmitry

