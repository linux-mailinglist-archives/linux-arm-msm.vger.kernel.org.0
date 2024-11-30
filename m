Return-Path: <linux-arm-msm+bounces-39727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E15939DF154
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 15:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D87DB210EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 14:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5908E198E99;
	Sat, 30 Nov 2024 14:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="hFrjncKG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D78A4087C;
	Sat, 30 Nov 2024 14:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732978345; cv=none; b=YZRhw01MYNgRqFQyBYL0rNjwuHc4ML4q4KZET4/UOQw1KS8oEGZG6Q6jnrD6N7AOQlkfyxxI166zXCp8Lxe+FmDhZZ4tRoyhqC4mOJI4DZm9Lo10t9BN9ytxuWQHZ3vTAdQonS76CwSl/FPXom1+d3rRfKgeYgYEkr2KKrkNQkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732978345; c=relaxed/simple;
	bh=0aMWcxX9uA7GVxYIF/o3B+0rxQ0/hyeKUt8LCVjriX4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=nskFx6yfaBA3hMC8mFq0XFSDTzXGcvT9MygpkZqZGkQPMZgIbkDKqdAjYMjfgmTQOoEKm6Ak4j9GyQKv89G51D0PAgTcfySQ1sREf/hEKsKZXgdFLYYVyyM/D7uVrKxhnm6CzLYUFy4ZdE5v50DG5yC3AJ0+M6BZtdoLQkA3cjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=hFrjncKG; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1732978314; x=1733583114; i=markus.elfring@web.de;
	bh=Nifl2V/3CKBYI7gdEGbl16DM5HQdoonN7ehB/oWYjFE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hFrjncKGxl39JwIhtUEdjN6PQbDtSizgvwv5aPZJIWlxEjR/vt/6bCuC6MS+sSj7
	 Swaxf1tvPRemkjXwF0grtS36lRljCyq4IXo5xxLofnVJm/P/nezGZLt+jc8Sm5JhE
	 z5rbr8TyBLWjPTq2Rkd+8I+kvwxtS0EKYeftENnrDm/cIJufN70uq5jncVHbdO3SQ
	 DIrze7dOt1bfCkr1EGYJ/le/niB2NkaSuimjoax+5JoLx6el0R21G9QLPllrsLRdb
	 vvOUBw9J5NufUBmeGHATAt6q9rq+miMkp5aYxWsh6MORQy0XKcjmrXNv+J+JUR35M
	 Y7yzGSacA7hoqwsK0Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mtguh-1tXHa10qGV-00vIwN; Sat, 30
 Nov 2024 15:51:54 +0100
Message-ID: <e1de6040-dba3-40d3-9088-5555735224fc@web.de>
Date: Sat, 30 Nov 2024 15:51:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20241104090738.529848-1-sui.jingfeng@linux.dev>
Subject: Re: [PATCH] drm/msm: Check return value of of_dma_configure()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241104090738.529848-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EM3nnya8VmuxiXCRf6b3qWdwOEYygi/Zk+41d7Ggy4PvOymXs5a
 CaewBGoJsAoFkKvKQddvLTYeiWJ8LGttTZq6oPeqsZ0FXUUO1cGF0aCS9wetWB/BN41LdK2
 ozSLEpDCU9r4voOnDJGgSpejOJDAJlrmv0UCYggqSpgaUSE8RzmpzxIKviPNFmN5xagltec
 YeaE5o0UzgvjdrPG16yFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XFO4vol6THE=;0hECVTUByNrT91fFcv+fZRG+LOZ
 d60Mg4yG+8OD0qUBvP9m829GywGPd6V4Fy+vFobpgMk2mhShI71t/aoo7DFiSzqV8twxLzjNg
 GkraHIFksWBDBpWX6g6NpzJAwvAAEQ8usqr5JxsWeHkH4D8zRZ4+R7b4XFhZO7NVlcWNiupcc
 85hMeAhrAUiIRsX6QDW2BNQg7r0voP2gc3/VozgIPVoxsKoItf3oGYwg2tUaGppRR1fV0vSjE
 sTxWBZwTNfMZPqEtNR2/CD57F0MPWLOavpX2cp00SUMCe2B3e/mFr/Er9dX7FlmmNsURtewGd
 coaA0qwO6gRquqEjAh8hsEORIEnfk9xEOXlYgfk+VfQ4uVE0kMK7oy8JkbriQ9m+ExOpTrXx0
 R+yfy23PWsQ8Ebgvj2spRhF8niDaTxwc3chJjWNlGhRutywSXlSBzWBW6c8JKsLm/6n3ydBS+
 01hxLw4E3th/qKuwvU9Np9pvi8fHL5hzGR3BL5jfOmTuZVFWtQqxTjP5YFcgIykx3/IAfc77f
 OjyARAcjHvJ1m9/P8BVK5L2LPrmRnTAemej0z9h7s1ZJlvx/wNdqJKSbeAfrDEWznRRoi3jIo
 uFztlsWgdrz7+CkYIFbRJJyTYLpwh62awnvTcyew/aHKt1+7ikD3DkdCbqfaKJEqweoN4oD+W
 nd7JDf0WdjrImDh1H6AxGjJ4kzmV6c/uVCWgNPyx15/Ypm68jaZEOe5grcUEIdXwo38l4gweE
 fpXO/yoNz4Hs1AVkRF5R/QEYHfEm3vR7Haq09YNH36oyr8NKeqEzJelZCijpaNV6RZAZdpVV7
 qWaAbjpomAbqEmEsaLMI7QWva//xo70erh2AdnSpwUsWz9OgsbIYVSopelo14dL5sw6HLT2cz
 EVVfFu9q3Ht0JMDF/GffuepAOkeWpfmSZDDOQTp/CkM8A1lTaVJulV5Yc/04engfhw6N4DQos
 OwGpfMN2kBY4nSzoCguDVzCw+RN/7Mo8UT1A2p0o81TCF5/WxsBuNd8oioE0QGS1NHlsPB+UA
 Zkr85uYzFooXauaMkcDqUnryXNy2WnkVQctfQpDyE5SenZJVrHuOLqCRbV90Lhr2VoA38J5Nk
 3mrCNk6ZY=

> Because the of_dma_configure() will returns '-EPROBE_DEFER' if the probe

                                      return?


=E2=80=A6
> Stop pretending that it will always suceess, quit if it fail.

                                      succeed?            failed?


How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12#n145

Regards,
Markus

