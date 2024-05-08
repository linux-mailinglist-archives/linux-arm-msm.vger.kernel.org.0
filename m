Return-Path: <linux-arm-msm+bounces-19475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 509418BF7C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 09:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BF30285A80
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 07:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC022E417;
	Wed,  8 May 2024 07:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="sOUQHNNS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FD1450FA;
	Wed,  8 May 2024 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715154703; cv=none; b=VM8wFJB1ujQpeEJPXh+r4kzxVW1GoMXjDWEM6FHoS1w+iwksAIFhlQwVBRlYTKFK4Wma6Nzk5bSDimSBWjnWNcht5++FpX90zSJx9Lf89BPBSpI9CxSFKi7ExTsCoqqz7cRFZfunj0PVR1L4QEvkJsg9gYxm3wHSWDa5ExYaRcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715154703; c=relaxed/simple;
	bh=A1cL+trfWd+1YzVAvl7toR22FR7A/lXoS2Ld4mzp0Qs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Nv04dBiXO07XsaOVuMHtyZFnjkhrq+I6ypOji2598QnHwdDqJY9Cg5Rxx+fpFgl5tnGT+JaAgMaycWn4mvJMuqrmZQyTny679RKc+Z5Xl9OYt66UtM7WlbAPel5By+87nuT4c319/j6kpjwiQQZF/l9u1JgPYE+5gEady463LW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=sOUQHNNS; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1715154690; x=1715759490; i=markus.elfring@web.de;
	bh=A1cL+trfWd+1YzVAvl7toR22FR7A/lXoS2Ld4mzp0Qs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sOUQHNNSFahruIAWs+7seJXeu3bOUjNFMuyGGkmy4GOcD8jE3NiQEmDpgvI1F/Rq
	 St4dOslJc4cV2ifTRq7ls2xvFDTHDlrhD2+oAAHQ4o2pM1dMdLZZXX6kO+rPIpzjK
	 9S4bfjCwZUijdJqTBNB78tVW8QJErXmur+N0JrgrpXL7WqnVEZ4UedOaF4OVtvdSv
	 PhgXGj57Ca4GyNP843+SHkalMwVmZDy53C2ZXmRkjTlhMCNPleFLqYaKLF33w9etX
	 4VNnRaoTNHwuISQD0Pha2gT2ChSicLr92w7vWzsL3/J6SZ0O7l5NIeCHaHhdLoLBD
	 CH2DCJgqQcQQy80KoA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mfc4q-1sXMGg0Vo0-00mBl9; Wed, 08
 May 2024 09:51:30 +0200
Message-ID: <0fdad323-ff72-4e20-8fb9-65d4181b1ae0@web.de>
Date: Wed, 8 May 2024 09:51:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Caleb Connolly <caleb.connolly@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexander Martinz <amartinz@shiftphones.com>,
 Luca Weiss <luca.weiss@fairphone.com>
References: <20240508-otter-bringup-v1-2-c807d3d931f6@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add QCM6490 SHIFTphone 8
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240508-otter-bringup-v1-2-c807d3d931f6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zH6xSo4N3GyqA27EDnWMOXSunaYdn47GzAB4KMzYHxNZIje+UeK
 ncRl2LUHJPnjqGP6t3q1OoAG/7SmTZRNbA8vV0vH8KlwSrR2cr9MHVvoJ6VUfGd1him8Zcp
 P0DnUQBlQ0VjCxFmdo+LYb7tmowsYfWtprQ9agF/oNQTz+zOeD1tztBIp+CNviO/i8CHPEf
 A44mw4j+p6K7oJtyqDwNw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+EdKx6qCwV0=;/dqqmM23NDee+dzZ/yCQZuHuAyh
 pAFHPaTaZe1iuEcVp3gv3AcPsTFwSP0ss5HnNCC5Edw49QMgDPesmbZB+OLsFnLyGGnUotjxF
 Tsx3HiaN92bDOBn4RfaiNGMmd1ArF4C+KGG8pZ++Gyy2nOVaI1Ueg9rqzT2MHvyM6geT/5qs8
 70VPlXTRxE3w4fyoa8xKiP9zAsI1em3wF50uTEY9MgWhd3Ej/v82mYxjgkHMarZeT5IMqe5I/
 PJMDRGyQ4QVE8ICOmPe60GsON+xjFIRbEvGYj5tnTk2sGz6k2Jeh4pX9PiHCPpaw4uvkJvWnr
 7XcRCxkOf3pGjItbJM+ZDpMY9RUzI2n8+2FST4KRdSiuX6O1L3te+6cUu05WEIHE5rSxUZvCN
 nK9ClzHp4OdJdg+hOXIOIn506Ytw/EXSVF83Tbvtpi+4Obj4JYFhf0NuG4SOCyesB2BuwFeIp
 6TtcLxnxqGpiVOBvC/iUYAdsnFeU9HC1Q5sPvKDK59PfJeCqG1MRrDGZvKJxMDhwFiFiqXucy
 KaSXO/A41g2OA5YSMQz2T55lw34UiUBuNKeuHO5+HJrbtHAwgjHpcUomVc/WQAnwDtwLqe5AQ
 iJ4xCe+FuM5H2FReTKjVKVjzttwBOcNkxjiaqf4MxWpEfyCTcuLeFYy+q8eQ+7jxsmFR/yOTi
 8+hAY+CYlzkqTjTdL6Do2ODbtwbqvmOx2LUNewUpZfaMCp44RjGHJhDAowfD+IK3r0H+3QBxg
 gcmyi2DT0amJmztMZB5YtbU2BLhVk8hp/9vq8StQjNjm/z8bweNGtF6TJ2C78/vuNl89ALgh2
 0RwPbfdEr3NqWdbvhn1M4KyeblSTNBK/Ap2bCV/VxU1E4=

=E2=80=A6
> Initial support includes:
=E2=80=A6

How do you think about to use imperative wordings for improved change desc=
riptions?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9-rc7#n94

Regards,
Markus

