Return-Path: <linux-arm-msm+bounces-81573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCDBC56BDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 11:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 536234E751A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F5C29B22F;
	Thu, 13 Nov 2025 10:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FFz+VPhT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B711435CBD6
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763028147; cv=none; b=Wc3zTkqs7LKxMpZ2/evrrszSab2nx6IgXLc/i5yErd3mrGpA8xGdR6iWUGf5EyFIH7IKng64izTbqQ5HVClaDycLoYMFSc4j3SCHn5Yc/h6rKOLzj4su8UCXX04b2zeMHMSMsRFAdRW6SKOmdJp5iq6uu/O/Bi3aBzeTcMLknvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763028147; c=relaxed/simple;
	bh=347InnF7w0TQGwF3LKDpkxoBP63o1pAQwc45OEGOOng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RL1X+oTS+d7FlPjD0aBj/AKiD7z/nRZcx6rSxuOsnlxKIjhSoZPDJtjnM31mJaaqSAnpPS3ovXDhimQpph259MOJQVE4S/FU/mpBe0CF6w+W8eXgPiwGmNHvXdJVSslCc6j6MROzBojWdmP7YqrbxP05U6XNUz7kt2UNMnNK3t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FFz+VPhT; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-378cffe5e1aso4688061fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 02:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763028144; x=1763632944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=347InnF7w0TQGwF3LKDpkxoBP63o1pAQwc45OEGOOng=;
        b=FFz+VPhTnQolSJSmG4FCu3Xt4fES5kBKLCd+GhIneSTYDKRGfPN8zyn3eUMQLuodD/
         H2z3dbJ9PxXXRjIXTypnTv7fD5q3Rd/ke6LsB+xiLQUaKflb+Wnx1eYs1wITzu/OVP9b
         aiQMqhgD8S012hXS5cNwQrhvYHpCByonyFcXG3j7AOXGG6rN+GampPrA0sRvyyGO/3vz
         zjd8sdAl75JUdv+8J4VnsuXD3OZ/I0yGFVt/xMOhgUO+SwPyJp5Y8RUtnSDToJOGyxYb
         XKLGpelNvpUjvGQhJA54sg7e1sOfozlMiFDTN9BV6FpwmJcpSPfww6fSimPKkmYoJLsd
         p9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763028144; x=1763632944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=347InnF7w0TQGwF3LKDpkxoBP63o1pAQwc45OEGOOng=;
        b=WOeD+PXNQEpVMDQsCjEWx5VxqTEAbmWzzaTJyZYbFYeUaauS4cvzdjat8OPGLDUf9H
         1df887Qa+V8pdO6pDy3HQ56//cBRID4XyGqNjlgP2leltvBtQhSyiF6U6rhU6rN4akJO
         yUmsM5AHgzB5oDwFOiLjB8aXrebjfrR2My/zWOeC9v/A5IOKVKYwEZlcfMQpTif9ZK4B
         E2EF2IiQlpxW8GimH9E99rjDx9nW8IUPs0v8lTKwN0KuJ3R0JWumCP4+acadQBk15sUu
         CdRbzjqCef/RnjecUmE/ejRLG/KyBxAPtbUhkR3XXb/kbgFT/OvA19igywN6xnpI2t94
         zrRg==
X-Forwarded-Encrypted: i=1; AJvYcCXU3RDY8aMAdSvJcbDQIPcxjA802ItgdWMTHtCuEuibTPueIXVuyAa2CQC5mVxhN7D6F5dqrbuUIvqDzoWd@vger.kernel.org
X-Gm-Message-State: AOJu0Yys0gvDNDsJynWStgmwyXBsYOjDdOUCxxeVE+s6AO4PWwpKsYX9
	4R1ZjfUcJ3ACqqxhXQm17iXRbIFBtqQdjP8qxDlyTF7Fh1XOP0pUQHmUuHx7ifGWbG7LHZCDej1
	yEebdZwHybu5YivTPo+epC49kWWsWXDLQFRVKqpEEJQ==
X-Gm-Gg: ASbGnctKse8srdOcZIcYju6aq6+TH/SRjN8jXCLNrz5Gqe5Y2n5XkfiZkYN7/a55AYp
	SB3tjeDpYkBNsAFOkVhU97JlJDEf4aaP2VtlUPQJt4NibRVV6GvTyyX8/P7tTh2g3k2/UcZ1DBc
	nH5zb2U7tmWxy1FQpCIEYBH8oufO1hm/JvtTs7BETK5CaRGdaYu43aue/1gMWgjh9o40uj9Vib0
	sniyDxrYhvb2M2A3iyrlbQUKkMCImocidg0FbPrWvmdGixvYHFHeordGLp9rXpFWo292IsKFrdf
	nNuYBINNxHblHs6dCHhoAl08aSs=
X-Google-Smtp-Source: AGHT+IF80BtPctM9eC4e7ij+kECyiSMuMR8eaI6A5q1UsvTkOe0o1G32eF/kAIX8FZ3UAPGxB2FJF3dPMAqvlpNwJF4=
X-Received: by 2002:a05:651c:4191:b0:378:e055:3150 with SMTP id
 38308e7fff4ca-37b8c2e1512mr16366071fa.5.1763028143794; Thu, 13 Nov 2025
 02:02:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org>
 <20251106-qcom-qce-cmd-descr-v8-1-ecddca23ca26@linaro.org> <xozu7tlourkzuclx7brdgzzwomulrbznmejx5d4lr6dksasctd@zngg5ptmedej>
In-Reply-To: <xozu7tlourkzuclx7brdgzzwomulrbznmejx5d4lr6dksasctd@zngg5ptmedej>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 11:02:11 +0100
X-Gm-Features: AWmQ_bk-LstuhQR3H10ukwySBYZfpE2zb40DoLXgGCclIQAg4lhk-Zsk676Qpb0
Message-ID: <CAMRc=MdC7haZ9fkCNGKoGb-8R5iB0P2UA5+Fap8Svjq-WdE-=w@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dmaengine: Add DMA_PREP_LOCK/DMA_PREP_UNLOCK flags
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 1:30=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Nov 06, 2025 at 12:33:57PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some DMA engines may be accessed from linux and the TrustZone
> > simultaneously. In order to allow synchronization, add lock and unlock
> > flags for the command descriptor that allow the caller to request the
> > controller to be locked for the duration of the transaction in an
> > implementation-dependent way.
>
> What is the expected behaviour if Linux "locks" the engine and then TZ
> tries to use it before Linux has a chance to unlock it.
>

Are you asking about the actual behavior on Qualcomm platforms or are
you hinting that we should describe the behavior of the TZ in the docs
here? Ideally TZ would use the same synchronization mechanism and not
get in linux' way. On Qualcomm the BAM, once "locked" will not fetch
the next descriptors on pipes other than the current one until
unlocked so effectively DMA will just not complete on other pipes.
These flags here however are more general so I'm not sure if we should
describe any implementation-specific details.

We can say: "The DMA controller will be locked for the duration of the
current transaction and other users of the controller/TrustZone will
not see their transactions complete before it is unlocked"?

Bartosz

