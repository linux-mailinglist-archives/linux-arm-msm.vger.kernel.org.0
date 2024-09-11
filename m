Return-Path: <linux-arm-msm+bounces-31499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAA79750F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66226285CEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5ABE18732C;
	Wed, 11 Sep 2024 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A0Xd81HI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038D2187337
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 11:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726054934; cv=none; b=PXdb5iFelImzexfDfx5Dwy708ZG6d1C582lgJFb0/a2LtiZtwTG1DKCflaUYHQ/z4pFfxLjN+fYO4dVGv08dawA0j/HFKvURNNeghrV0Yd6WD2IKf4NfCxBziaI35jVbzLZyFFYMS7byKoTbuIl44M8TmgC/WQ1FH+HD7w63xQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726054934; c=relaxed/simple;
	bh=O2Sq+D19rPPOkL3YgEEm2sHTX4Ks9lKnmYnH5POWRho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/H9z9akhSMjogwdMJvTdQ8D4shUcmoXFqMDkndgGz5EWWs1ryUmveU0XRMlafqG4z2L0sHVbv4UiKPtDuKF+3iP5JPjpam6nFCbhLbCPAfAqGXtKNjLfTttuJzE4BFh+FB0Qb2uL6/ijPzpr50Vox0kiXMpZ4N/6cUvLKhFd5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A0Xd81HI; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f752d9ab62so63367161fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 04:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726054931; x=1726659731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2Sq+D19rPPOkL3YgEEm2sHTX4Ks9lKnmYnH5POWRho=;
        b=A0Xd81HIFb5q7swZZ0LEirx/YFU7SWIN+u8n+1EY5Saq/sa2R1uM8WNrPSawUXM0Ks
         nCp0aulATCCwcnySjq6PbAr7rxZTgkDH1BoGuhH7t6Fx5uzoBFbDMk5lUO9NC4XJ6msD
         c7Pfk/hvdP6+IhqIEGVL382vIppNYgVPBmdcfXKUBgwF7VEAcpmuRO7az0TYt6myyofP
         Vd0gI8ZwR1yvmpYcASZ9NY5wmcepEJEtQVVIIRdAtMWi/qHCTiNaGEuQPghnoNhRhaxF
         zVcvhZcOair61hpSt2BTa8Q/5ooS98ZcQO5dLdKvGYl22QIw2xwMCE7gY8vA6VSkibWt
         2DVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726054931; x=1726659731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2Sq+D19rPPOkL3YgEEm2sHTX4Ks9lKnmYnH5POWRho=;
        b=ipFn3ae1uQF9W7BPDCTxDQYKEadezNiPex+utQPh20IrVgahM1dPXMz/zYIm6Uylkb
         eJ9W+2buKT7KdzAZkf0OiHj1RsS14s7xtfrZHjpZrpLQpy82tpvmUMd+oK26yI6g3L9a
         GL18RBkaO9tGQUBFuWJSD35VqMy4bkp2JNSeNXRbOJLh4QgWXYV4ootaLujvHm6HTkv1
         zhAbUIw8bNWmXtF1FIBXTYYHQEavU2Gqn1r8FAm2YQm3zRVwKzwuB4qNW1zwOUnKmIxa
         p4eTYUUQ1w6Bbj6zI+hlXoyNMGePX1AqC/XdtBwu+ZDJt48PdUfRqXUPKrewb4PKPM1T
         yOpg==
X-Forwarded-Encrypted: i=1; AJvYcCXKR8xRU6twdkWkLTx2XDhvbK7vwM6pNFGtPTW2qYf6XgG7BlsPHLxnt84oOF4gaEZAoC6p2aZaE0P5LLII@vger.kernel.org
X-Gm-Message-State: AOJu0YzKbKUK7KnkUZtQgSw0eOHXBiQ+ZqY7+OIxjgEUFK81MhVziCR2
	TBZRrJzdXYxIaPEvqpQw8F5NppSBJeYI9zQX5xdY/8Rn2rKsDoZd1R3tatcmOBK4jFwIlwQivMG
	dtOCL7AOjCqVviEFGcYoTiKU5t3BUhF9kVKV5qA==
X-Google-Smtp-Source: AGHT+IFcHy4GccUogPshb+I8zndIaHpSY0pzAdijqWuA/NDAsNFlyAXCtC9O/q9g2HYU8bl4WfFykffAMSm3h0X4xpU=
X-Received: by 2002:a05:651c:b07:b0:2f7:56c2:7288 with SMTP id
 38308e7fff4ca-2f75b87f0eemr82376921fa.7.1726054930020; Wed, 11 Sep 2024
 04:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org>
 <20240909-tzmem-null-ptr-v1-2-96526c421bac@linaro.org> <20240909131842193-0700.eberman@hu-eberman-lv.qualcomm.com>
 <CAA8EJpqSKbKJ=y0LAigGdj7_uk+5mezDgnzV5XEzwbxRJgpN1w@mail.gmail.com>
In-Reply-To: <CAA8EJpqSKbKJ=y0LAigGdj7_uk+5mezDgnzV5XEzwbxRJgpN1w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Sep 2024 13:41:58 +0200
Message-ID: <CAMRc=MefTjz=h6jzE5vE-yaHnyM601Ts8XYZqEYnOsidfQEavA@mail.gmail.com>
Subject: Re: [PATCH 2/2] firmware: qcom: scm: fall back to kcalloc() for no
 SCM device bound
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Elliot Berman <quic_eberman@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Andrew Halaney <ahalaney@redhat.com>, 
	Rudraksha Gupta <guptarud@gmail.com>, 
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 1:06=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> >
> > I'm a little concerned about this check. I didn't think making SCM call=
s
> > without the SCM device probed was possible until this report. We do
> > worry about that in the downstream kernel. So, I'm not sure if this
> > scenario is currently possible in the upstream kernel.
>
> MSM8960 and MSM8660 don't have SCM devices. For MSM8960 it should be
> trivial to get it, c&p from apq8064 should. For MSM8660 it might be a
> bit harder. But even if we add such nodes, we shouldn't break existing
> DT files.
>

I'm wondering about how to approach an eventual refactoring and I'm
thinking that for platforms that are known to have DTs out there
without the node, we could exceptionally instantiate the SCM device
when the module is loaded? And then modify the driver to require the
provider to have an actual struct device attached.

Bart

