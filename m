Return-Path: <linux-arm-msm+bounces-50745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E31A582E1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 11:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6117216ADC7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 10:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D23718FC67;
	Sun,  9 Mar 2025 10:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="elGo6Ws9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68F518A959;
	Sun,  9 Mar 2025 10:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741514448; cv=none; b=bVyZxozejsRTCQ2hnnz1YLzSh51PgtZ0U1kVK4a84TJio8lLixBrTUCgABLNVMDkt+z33sS9jr9RSYG+qFirPlj0zpyW8Npur9Aq9dFPfYZsNJNmUDPulkPGFxoVoosBnn9xp20Whu4RjcFOY5Rfq38vkp4QowwcCIlRCLLnvvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741514448; c=relaxed/simple;
	bh=vCfhMg9R938vwtMtzUz95fNbLj1gywbLqULeR9Dbivo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=S6vy/2XGZwBGoixA91GO7tDiYW0AdVR1Y9RwyS6UEWeDrCo37T6qy1u1FhHQmlF9LXml5GQq9iEdfSONEiR1Va6DCbaMoFKN24xte63rDFMgN8cNHQ6c+KVctB/eZKsm4s+p1YuWZc3XPfPpDQOFwTmGtUK7Uv7SGz3vPaA4VBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=elGo6Ws9; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1741514418; x=1742119218; i=markus.elfring@web.de;
	bh=vCfhMg9R938vwtMtzUz95fNbLj1gywbLqULeR9Dbivo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=elGo6Ws9ayXNezVXbzFU1P6+TK+IFM6dpvOh9b5jalPctpWJ9IcbIO+hysAYCWyF
	 RuheIrDVrFsfERcMWI/X266aHSU6TVQ4djCJBCFyu153LE30oAGfzdr0lrtAfEvsL
	 i8utYPxGPei04BAerulpiCr9MGrrGgqhDybgpw8bKUBkWTOVrc0Mgb1ribvOZgedE
	 WEzvre/b0x4piBi3Y7bRaa9JGZbHqYRxQXDQd+RLvCNoRUeGnMZAC7yoXaHgRW5qg
	 4ki9rc1ZwVpEOhfOhqkrbrnF9uwdfzWDjogKHcbav6VIocn7Rz7v1SrngSdEjnzTE
	 euiiczTx+T24Iz5Q7w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.26]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M1rTQ-1tp1b73epc-00AyRN; Sun, 09
 Mar 2025 11:00:17 +0100
Message-ID: <25e29571-6b96-49cc-aa72-e3040fde8004@web.de>
Date: Sun, 9 Mar 2025 11:00:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
References: <20250308144839.33849-1-qasdev00@gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: reorder pointer operations after sanity
 checks to avoid NULL deref
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250308144839.33849-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YRZtq9TUAoPm8rhJitIcG7Jcn8vs7jJjq1tg1yPZdkW1fQQ4qZe
 hshYarNYkgB3BdK+5T60far+NFl+lUfNpIYE7aOE0EmW2Vlbl6fvNm6KI2BjmqoQ3eiT6E/
 hivnCFA3UrTb1TeigR5VN18hIfQAUHddc321j5pgaVRx21SZHlD1tY2Qdz6d/lCi86f/p6w
 qGObaDSAMTeuv5/Apxe4Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YyKem+iWpWw=;wEYr0geeA4XIjjiHyWUhwJUnyak
 orL4oNDTScVYJ0MHlfFGOn+UMUaBGPrbdh5MiqedNDhlPnJtqDfjmZWxsH/QNUHVP/TalvSCK
 SpbLfkgws+CsbRVnnOITcbOFzDleQLgn266+EfeUnY2KRfvgGwsEsoQPaSb+aHAjiz0vaoEk5
 1h42TYq2PUaEZ3BCcmlGQZhTyHrpgDXRw4NT+eQuJTVFUHFHxMbDkT6u3H71U1Vqk1bcP5hu5
 OGMm6rXu7jxSH2cClnUY4FF++RFcjGdYvK+JFezr29arOjt9Tt2GeKZWgE49KX1903X9XTENX
 K+49iXvhAD6quCVUsZ9gCnfHdFxaF5yCjSodJ3+5Dz8uT1vcaJfgyf/zrcbqVT1SzycPWVClU
 YXJLnbBhNwqCRiMfvqI61ykAFVmDLqpXWnl8P1pcthxh3BKPm7HfE1rR3CfRaRmo9wjNdfUQO
 zizKe5oOnw7jkFY6qjIzeaJVIbu7lDe73gKHpI54RvgFV1QFq1eWa0BcCmbBbGs5xG5dAsrmc
 mYg8TqOHXjOyBHnFjNwPv29Xur0a5KFxV9Xlsr0wGmHYBWxDE60nerL7KoRUREs7/5eyYIZ4S
 maB1ugCoPDadvhyp0ReePb9OY+1A56dYQhNZdBiR6GbFWp2IEhOcojXwbbEhWW8k6eX0I8fPp
 yAum1T7jz8OXW0xAHn2Y20QNkIH269RsFcE37sCmtg60dU9GgSrnFGazk6pBB18FheClXsNv4
 245Fa/28al+joCgu2CV/ZFTEILSiWYNVuthjf7886mnH5lcsSBSpJIqaIrw7Y3kcqLgoX++yM
 eWbhG3q1Sl7sEnBzIX7QENlXex4HV8/Du23bSANWvyLE/NNG9yiIjmrg1VDIAJYECI0oF7eZi
 Wm4M20s5wdIEC1/DIU1teaVDnXBU+I2yNz4+KMbuYWz2Mv3bw8EKGDebAM0RKhLeFgyQyXgtW
 hEQEaRJ1R7uiKqEFK9nGpwLw5BjWeRWYNnwvsNp3JRoBlSWNbAcZYWr7ao5Org8cWVQLdrTSx
 h4NERBcm+xVYbbtPfZ9s+dN9TU1wC+J8WQyrf51UdmTF/8hEfQsRqg9sggMKYR++RHpW7H4Tt
 kKfnqx5VWI7CGwBn97huv6r+gmDN45HyW+GmDNVZ5TmoTxY0MKFucYMS/wHs3hhB5jS6lkBu/
 lbPGnhNAXrs6GzSQ4+JZKvvHsKglDRiNRSmvEOS8ukkVhcHW9KjlnNk/rHLRWSwSsHnZknWsP
 huTXTSGvG97r/sSVGl22J6uwS/Qtic7j5oYWTv7XgsfUfBEaqxYsDV8oo3FFllZX5O3VGfGzX
 jpBo8oG/PLvqmw7nEKTdvS9K+DoDNlgVQp4hlsoE3phHUHweetzvoD/wZ2FiP0Wyc+Yco7rBa
 mQW2faNoQ+rUQl3SvuePT6aCbVX51EDdNP/xTfAGB1ONbrztgXzZyKxtA9RRWqpGbszFae9U5
 ffQOhKw==

=E2=80=A6
> Fix this by reordering the dereference after the sanity checks.

Another wording suggestion:
Thus move the assignment of the variable =E2=80=9Cdpu_enc=E2=80=9D behind =
a null pointer check.


Would an other summary phrase be nicer?

Regards,
Markus

