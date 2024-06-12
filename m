Return-Path: <linux-arm-msm+bounces-22431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9805390526A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 14:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF8D11C2225E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2458B16F845;
	Wed, 12 Jun 2024 12:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="vnN08X8c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6600F16F0F3;
	Wed, 12 Jun 2024 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718195352; cv=none; b=S4u5SECb3y2FQlW7EbDmp4GMWlnThplfGFdXlxQcqaKUd2CHAh7zwxnRSL/KP2tJwuIfNsZkQG8fbU/ocS11uDF8A/oFPzos8Yzy2uYwyrGJsBuGrnCdNfQyEP6uXFUL5BtsU6QnwEPaWkrwIyfjhNroc3leX+ipqIAJREDmOX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718195352; c=relaxed/simple;
	bh=xa3TDRwgZuX8yrQhYuKQcppS5saA02uNPUv7uS2FNlw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=RNBEy1SeC/bDxm/om2T+z2dwNv1BtEWAWItnMu86F56SGFJdYn6IFi2cqfcDvxBMhmp0sUUZZa7k3u0W2Ve6Og65TltWbfSzOcL04k/OSGgUCitHm/Af/JagE02lY7gwRDocrlau0fEGnSIXOK3GmdEmSIa6RAEcxUz6mfDUUSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=vnN08X8c; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718195331; x=1718800131; i=markus.elfring@web.de;
	bh=xa3TDRwgZuX8yrQhYuKQcppS5saA02uNPUv7uS2FNlw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vnN08X8c9dQil+FPsUvfogxmWJ4G3S2/XuGyM6/hEthZyVGU8cx7iXfZI8CYQu52
	 tWjqZ08zhRMBhUhD89KDzmYTfWT0m3aYW2dm+iHwVkd7d+isO5bt+LpomHQ2rk1Aj
	 g6lCS3uM88rApXtMDvkGDwo3Vt8s8z9XNUXOBH9/nzBbHMCot/K5yVKTHK1gOJE9a
	 96CFXAgyZCtb1BDwYoaXXWXf2bDm261yJzBrZ/PQzZtRpVUqw80IgBeXIbLsZbagz
	 Pefp4Jiw46fZSbTElpaq3aWLmsY54sy65RL/VUqrMULfuSX9H+P2v86kGGqZbVA1T
	 29cQwcmGqjkREINl1w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mrfp8-1sn91S3dPY-00cXtP; Wed, 12
 Jun 2024 14:28:50 +0200
Message-ID: <47685d2a-da23-4558-8577-98f4ddfff386@web.de>
Date: Wed, 12 Jun 2024 14:28:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
Subject: Re: [v2 00/14] drm/msm/hdmi: rework and fix the HPD even generation
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ja2i8ZUUvIyK5q6YmCwdL9rk9uZKTbD7PKkt7563jmEhmvE1n4c
 ZzUvQSj4iXfm5RqU3YVXn2bO8RGzprL9jpkdN6Wkyc5bi1udDg6/jMke6Qq2DPUgdk/qPDS
 rx/UmNp34WoVZtCQ+Hm61N2h978worirp0LojuomUXpXRLzwhxvIvn04DPLkfb3EcHLR1LW
 CkPD1llIIPwaJ3/+h9TfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yYaB5Ri7W4o=;VeXpXqKLcMhulJxSFoDGSSyHCDU
 1qiyxgM707FIzTmPeutdJTN5Z17s79WLkQGxx5T5Ev/oR/SQMAXyzDiveZyG+pj8UoS5LMJqO
 d6vpnd7OBMweb9Jo7kPWnDDztF5e9B2wQi2XO3uWcMUTJWiHaXG7AVoLAosaHK0L2DxcUc9I0
 NLzd06Ls5sXgkYesdr/NS++eWV+gto7Jm3CQ0h5AJR5parbruvLI8RjB0n/cIiY3nGtYVQ6t1
 5W64isUzcseQ780s3janMrjpRlLANa8cojD55YJu3G0AypYh0eFEKKBmkMAwf3XJ0hEGe/gpW
 f7P5rPFmslf7STucUBuuxem33Rr0xzIAQUaaVWoc0S62z2BywINXnbIlIs1ekeMRxHeXfeDb8
 98N4IgBEijbe93h+kX0qUrIqhTDeBJYeG+UGqDMKrCL6hP1jaKjrUMgUm0y2L1pgJwcLta20f
 zs71UcnG41xTdDus060Qmhgfmp8L7KkTMUokwgDqklp6CRpQUeMoyC7008lUs8xrpM63h9uuV
 itOkG9n/KeONrcxZ9WwLW6IZ4iWAwDGWqGI1/vxLk34OaqQQ7yceltRI51lTMSbKGU5aILVqq
 KGmguOz31zO7mh8x+yjLdyyhHM5/Yk25SxsnuF7DJqEv3OXTVrKi6kcxkrDIzt4XQH0Nebg8p
 XOx8PYhVqK6MNf0KRKu0U8myq5TlI/RsTyO2Ks6wT6feFxiUqA/ta6mFKPzFeMpr0IJDBVy40
 Tu7+hQ01bR+Ndii39ADVjIwGhElg0IQT53xwFbbn4pFjNa21+0Dk6sxi2xK7+OiW7sUebrJgE
 JcQDccGzTtj9OyZn8803lhasUDYIkIoYl4OmHPFDAbLUY=

=E2=80=A6
> This series was tested on msm8996 and apq8064 boards. Previously HPD
> handling sometimes could trigger in the CRTC event handling, =E2=80=A6

Would you like to refer to the word =E2=80=9Cevent=E2=80=9D also in the me=
ssage subject?

Regards,
Markus

