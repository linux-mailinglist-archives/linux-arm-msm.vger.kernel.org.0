Return-Path: <linux-arm-msm+bounces-22773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B4909E7F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2024 18:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CD56281483
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2024 16:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E2717C67;
	Sun, 16 Jun 2024 16:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="bD9LHZb/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BAE12B87;
	Sun, 16 Jun 2024 16:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718555079; cv=none; b=eTbQ98+cCefoFymAywluFLxAkLLtib6zuWIo5r0yo+t4TYunETgvcOC9FhA47mEEAksmaJ7Dp7eXomfFrSk9WTCEvb4/+00SH8JL8ugKs+8ntRWRy2Www8PLXSOMmyvkAlb+4Hbqnq9wb8m/m2hg6+R17T+cVHbENOdrj0ZgESo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718555079; c=relaxed/simple;
	bh=+3eKN6rwa93XJe6m7zUD58lUDjbYzISB9+7MIO6PQkI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=WhQskgugJu79bg5v/+aGfYQwB3JsnmIwqFIKiHCf27rdpVfFy8gXb/HyiJu6i/bRVZzmMeQkwK3XtND+d6a6aEwfdN86N2q6l195aUWDnoKpXyolYh9jv5rb29xvZCntHFYtyq6zRL7E7GtnocuF9YpCeS2cnXUxXBNp3VO4Gro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=bD9LHZb/; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718555045; x=1719159845; i=markus.elfring@web.de;
	bh=+3eKN6rwa93XJe6m7zUD58lUDjbYzISB9+7MIO6PQkI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bD9LHZb/jXzlnbFe1kyTrUHjMGINmgFPq8/NJ7FopDSJLkuBfrx2eah7cLPZgxOI
	 rsx/XUHI1ZoKlfvpCEXdRPpyf+5ZYf2/TUx6BG3dKelWKsynURwSCAvJRnfsWRd4Q
	 1PVHg1lofDfZT3NIi/1l8mo6q8WOZ40L/k/udXNvBUNllWzahY7jc0PZkabhp/dem
	 GDgTkDshbDsB09Fznv40hJf8sMp02ySXHQp2yLqtfK9maruQZqeHHoT/VmBmmg3Em
	 MDQsSVkKcHa9kfaG4UrYjQlKwE8cdEzNQZVa+j3Gwdltv6arZhkBG0yUP0/4PbtSP
	 WTUW22ieG1YWrimHZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MXXND-1rsrEY39pP-00N8Ks; Sun, 16
 Jun 2024 18:24:05 +0200
Message-ID: <24260b3c-fb0a-40b7-a88a-e2ff4897d085@web.de>
Date: Sun, 16 Jun 2024 18:23:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Banajit Goswami <bgoswami@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>
References: <20240611074557.604250-3-quic_mohs@quicinc.com>
Subject: Re: [PATCH v6 2/7] ASoC: codecs: wcd937x-sdw: add SoundWire driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240611074557.604250-3-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6TBVlJ9i5HBMK36G4jUvHsDGVuWICB2AUlHnyRXxxfNWJWLr4vb
 0Rf8fC5cbcaGtmSyKbQ8btm3s+jHAl9V+NBO5UsaUV0BM3+v2/eidWtox0eHbZb46ndck3r
 LQ/d8O62ag1fLKydU6BtgcIZkDuot9lQl6aVF/qEoU1yJ6DIKNDDswigJAXsrAL2BSjzNun
 6bd5U3CgpX43v72WCAjxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0JQCIjcD+oc=;AKWulCgs6tJ2+LteSqQxGxIOR/o
 OThAHDcZlr+HJJLfkYrtjPnAwACVAUeoJrzNP79FzN2yawhvBDhDPn3xKqGNjh0pGzpLk50m2
 f8XVZTJrLvPoRTUGv++ulKbBqI/wY8eqLzQMBQGDNdTQXat3Axx+k9BNzdESCneNq9MH/Vck0
 1BB5uvuUPvoIr3eIRDCN2GN1ZC/NKCCGmoThxDYoLJyeCcFlj6H+VYIKQgoHGzngt0RYAo2EY
 1zrvZZ+Vy063YulZKMEZ22ir7xTAcE1clkBnHAZ1GP59a1NHenC6e99ozX+0dTee4qwcjVf1q
 uW9z6uWh4kPbrHjuCyIP9sYUAM9xAJbzETRISuM533R+jJWAQRE7aJz7OpBwdwBJHpznNywc5
 /XiJkuZhfZbWspCxR4k7or7VTFwb7mwpgZpoNsxNbwCkFZ8dT8ND5FTybo2EOW3nZpwVIfQFu
 /MAKwZqZBryk5OcoD8g3brQwTytGO9dLPM1ao1e88YpF0KFM2xe7iW+dm0IKM9cPBQj3JdqH5
 zL0uOcdLQy6C0J/stdgfqwZJ7YkJfBc3cirt0uttnttjfhoABQmdBC/iW/VaDDJWmamXvOLM1
 CEAeuuZyfCiw4iJx10wnNnhqi/KoGBWT2MNVS36K2bEaFVuV4cTsPEfkQ69BoT2WqB0+Uhtg3
 neCSyPf8PxUBrzceyLQIV5IWA62XrUcuRsQYOZzT3HzfvV+Ww9g0nsu4vRFgCX3F4j2ta1NPj
 DadMTGqC8mDy9Utpseb1W7uWS3uXwP55fcw8+XYgc1NdB1f3sybS/G1Lx208oCVzIZjPCyUuw
 XgvGFRuS3zKuHk+uUc+U/wByTW+LE0JE3uCbKMpCcfdws=

> This patch adds support to SoundWire devices on WCD9370/WCD9375 Codec.
=E2=80=A6

Please improve such a change description with an imperative wording.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc3#n94

Regards,
Markus

