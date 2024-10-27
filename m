Return-Path: <linux-arm-msm+bounces-36088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E59B9B207F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 21:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAFFD281D7A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 20:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED86117E8E2;
	Sun, 27 Oct 2024 20:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="YKOPQNcv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8004C17E472;
	Sun, 27 Oct 2024 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730061746; cv=none; b=ioBsoDBDotDBeAF75UGyPAtLjmCT7ynSkQ7OvxcWEdpDNTlmyPO9P5uquI78DS2TfV/Z/njcrNd1hYiJrkrdclnQchxrmb/rzhjIfnlUa+4sUD9XctjouSZPYYhAbkVDfXP/ilGwhx9yY9NE1G+Nz+3+T3VDpSHPPwcdVO/z1XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730061746; c=relaxed/simple;
	bh=NbGuF+x2WP24BuCXaRX+u4/djh9DZC59mfxtQd+DG9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hQ3dYdBOrr8GhPy4loU7GBwSdgmthjb3Cil+rtT7Gtq600zI+GgjofWVMPBcvdNFwhtYjnLHZNu9NIKsgWnWtlAOZDVWp3JwgV1ihAcJHaUyGH9JvkHcZn/RpUkzoI33+1V/Jz/lK6L1aR9Isgo4/V177cp+QPaALOEuya+D+S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=YKOPQNcv; arc=none smtp.client-ip=212.227.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1730061724; x=1730666524;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=DjFohQ1Pztt9ldrciEGNPHqyVfNhK8SXwj304Sn0RmA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YKOPQNcvMViiBTKL5JZaFPerklWBu69muCzBqvxJavdRI/UVJ+2rRcXUkkUVySQL
	 YbCjIM9T/YStsJMuMNNYicGjcW2PaM7s7DMYyr1+Hrw76OWXp66//5QXAPT+6AQdI
	 V80A6jhLr8OtFfUIinKBU+lbx1EJ2KCwvy71s0WpLXwZviiDQe3/ZBIXzXewANaB5
	 CRh9aWzX/4YwqBhUXjko+4hfg9mnLCLHSM3ZpZDv1VC4yM7JyDDDFie9IRVTRFtnM
	 X5nPr4evP45H8+QtXO7Btxgy7SR6LLXoYr0MNOfP+7fSxHVJxxe6/e7uEs79GNnKK
	 CIHhvEtekEUUNdrSeA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MaInF-1tQNji3tB7-00Ma82; Sun, 27 Oct 2024 21:42:04 +0100
Message-ID: <de85e32d-5d6d-49ea-9d60-d3c30d9daf12@oldschoolsolutions.biz>
Date: Sun, 27 Oct 2024 21:42:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/3] X1E001DE Snapdragon Devkit for Windows
To: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org,
 dmitry.baryshkov@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, abel.vesa@linaro.org,
 srinivas.kandagatla@linaro.org, quic_jjohnson@quicinc.com, maz@kernel.org
References: <20241025123227.3527720-1-quic_sibis@quicinc.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20241025123227.3527720-1-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:h1SWieM4h/FIcoxjT0llA+Q0zxJ+IC+pyXcpHVSxvQPSsQxER1c
 01IhMz6V27vWVj/vGVYdMw7rpoVpPxB6w0dCSFEYAMCf/cDDo9j3iH3SlTw8wtNdWj6TrFo
 hHunEXhA922vipY1XF5TpiUJEuc5vLfva4uVlOs+D5xoIZmFKhoIJJcaVC1BdIDReIfOq2B
 /eIboIhdUGQQ/DojrKRxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1iyrSaT98kI=;Uqt5hPGAAQtkaWwPnwCocGDs1yu
 3XC2BRyt6+6RJa5A1sG15GkRtnvTMSTAdXlbMEMK/C3dpLuimliYWZlmDKosCbBvvvVOMDB2H
 uymkxdTU5kdRm/KHN6wSLbLp5zwycFqMAEmnN6WRuxZFfjurejF7QWxdOgcMr8SI5PTOEnCNc
 qeT3gh/7j5wJVhaRdERrqjo37ljEieiWIUs4HX2SjkT8YjmzZq6RGwurKuR1WcjMAWjLkiGgh
 xLSsve3DelFK+TH7G0ruNlVWzC5OL9adzkf+UsLtbXhiH8gj8NdQtrDa6Ic9SjetBSQvx/y7I
 DuxFUcrE3HdjjmosplsvXjg6aFDvVzDPlr7F71b3osP+0edo8XojQx+6HFfjZcb5KdJhaIoQD
 BQRKfcxVR0CMZ1x9ZpvMH8jbg65zfvbLJoZDh6MlMjK6oJdU/8zhyn9jyilMhYFmbmzniR/A8
 j9TCGIsN+RXz+aL/fj/XhTSCTOhmsQYebPZTH0n46MZsQ1cAzPqyS2+MM0h12rKopqC4EXi2K
 bnsxEcZMevRMAMmnke6y8HDuNgi9Vgj/TpJm9J8nWryIvV9i084AO21TZ14jxs4Z080lKlJ3G
 WP5MQEpYC3sgkXHcaVXTamYADQOdZR8a3aQR57UkfbokVvincGxATXXXlLFPG8JZqByHNkw7T
 HIP1av5I+3UFzenmJOAIl3PY9dmekUeXngXuPAPJQCnoIIJY7r9B/Vsz9duuU1+3c7gYp63tE
 jxoDkb2ss1mk47GDchBy8fjTKVXW6O7lg==

On 25.10.24 14:32, Sibi Sankar wrote:
> Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E001DE
> is the speed binned variant of X1E80100 that supports turbo boost up to
> 4.3 Ghz. The initial support includes the following:
>
> -DSPs
> -Ethernet (RTL8125BG) over the pcie 5 instance.
> -NVme
> -Wifi
> -USB-C ports
>
> V3:
> * Asked around and looked at the firmware, couldn't find a codename so
>    will keep it as DEVKIT. Will update it if someone from the community
>    finds something else.
> * Update type c roles as reported by ucsi. [Dmitry]
> * Update THUNDERCOMM to Thundercomm. [Dmitry]
> * Update regulator names and sort Order. [Dmitry]
> * Add x1e001DE devkit to the safe list.
> * Mark regulator-nmve as boot enabled.
>
>
> V2:
> * Fix Ghz -> GHz  [Jeff]
> * Pick up Ab tag from Rob.
> * Use Vendor in ADSP/CDSP firmware path [Dmitry]
> * Fix reserved gpios [Dmitry]
> * Only port0 supports DRD update the dt accordingly [Dmitry]
>
> Sibi Sankar (3):
>    dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
>    firmware: qcom: uefisecapp: Allow X1E Devkit devices
>    arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows
>
>   .../devicetree/bindings/arm/qcom.yaml         |   6 +
>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>   arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  | 814 ++++++++++++++++++
>   drivers/firmware/qcom/qcom_scm.c              |   1 +
>   4 files changed, 822 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
>
I have used this dt to bring up my Dev Kit, it is a great help. Thank you!

- Jens

link:
https://github.com/jglathe/linux_ms_dev_kit/wiki/Bringing-up-the-SnapDrago=
n-Dev-Kit-for-Windows-with-Linux-%E2%80%90-without-working-display

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>



