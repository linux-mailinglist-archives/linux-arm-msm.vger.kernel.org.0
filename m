Return-Path: <linux-arm-msm+bounces-80152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB78C2D72F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 18:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A6A74F5360
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 17:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6962C26F293;
	Mon,  3 Nov 2025 17:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vBSwVUBq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42033164B7
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762190354; cv=none; b=pbRbZ3z2EIwqWzYbGW7zOHLNf6byy9R9yCrdWnPMmsjvGLwdy7yTl1iq/F+B6gV8MEjaemfuAi9Hga9Q06K0wGIKtjC9Co7oQqn1HTH9JwczCUYwtwCV5N49Ck2VPI5nmR7YB5qRfe6jrIZaIPRdKY5awAQtleVnMbJZXvRoxoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762190354; c=relaxed/simple;
	bh=ykkLoYOuaWcFu4WGWepMaxMO5r32F9euxnEAAxSaMU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s7MPvUJpmy/Nx0ypLc7CiYkSsfmhkW7wteTF6f42EZPN5eAVHfb99u+tq5KtAXNit3JQ8IxXrVr0D09oSa0hpoLnH1CGd6f0+buu8wqm0CYpDYKm6L3M6ZxN4AEUqzJoRYfbQV9NVdATcQJr5bRct28RHjC5QtzHiYH6po5fjiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vBSwVUBq; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-36295d53a10so40019821fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 09:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762190350; x=1762795150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfJm/0K/IK+TFySYahec6wkbZ/mH3F/d8fqO8oHuTx0=;
        b=vBSwVUBqaj0jOXEmNQ0HLYU0QSnjBNQm0dhjCCBCjxQmjZHe1uSqjI0w47BNU/yfhC
         CvCXrpYUtIwH9dX+/Xd6dMjtLabtr5eXvwh9mKhF4Vw+ozoKogSheImJ/t+VPtzsewo7
         NF2y/FM1x8jNahLdGR9WtVvz7FzDO4VJxOOMzcPhZ3l8HKqND3j+mPVnRcDULkdI+omo
         fQScYzLcpU0zkjJUPYCndSyIOwZ8Gn0xGLxg/XyYo9N/OhzsZpEcMOhCoLq+y/bfbvUe
         M8syK+R5nt2fjqgk11vB84LHxG3IYCZDDbtH54NfyQBHg8VeFfslF7CayMkbRYXSwQfF
         jQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762190350; x=1762795150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfJm/0K/IK+TFySYahec6wkbZ/mH3F/d8fqO8oHuTx0=;
        b=WPCcfuoxfY4rX8RJab0EmGovpR+KmRxFXgeHXAv+vCh6CkX7a++CETQyxjiftp9ESG
         PeTXgaf95uOXA2Uk8zO9z7QmDiEQSBpe4t7uG+AmHWPfxlG5dju10aOxRFmbe/1clUVf
         srx7ypAqsmkWvV/Osa3VgANQP5SF34B+1D8MA2DMH2/MJKSMo2/JJFYL9yh4a1EoECir
         p6h365kwURdBm0CIit5WJUY9DCG8tZGPU0m+RM3EjmWS8y7OPetFWSG2Dr1Sgvz2B/zx
         r/fGL1PmLNNoOV5+wvyyAL+ZpwUUe5WlXfehlJPKyg1YO6mc/pvT77hkazyB2P9UigGL
         jocA==
X-Forwarded-Encrypted: i=1; AJvYcCUxvhROQ0oqoqG1O5hQ5s3x1vTQ5Aeh4iD79lyLwmurT8B22ZlaxBU338iINKsBoB8A7UOofIvCVelyKuGC@vger.kernel.org
X-Gm-Message-State: AOJu0YxPvci7M/Ek4z2L1XjpMXlEZNTnH1R5rWwwwdC6JpjYrcWpgOMK
	g8L5BK5BcTv7Vc6cw8PztfH9fozkUrOJ4WMa+T7gv8btM7lIlqbT/jAs28MOjKQSA+RbwM7J762
	+esSpHGiQEO9QaSCXVIgAiOyeR1PvW8cmdZ8W3ljcCg==
X-Gm-Gg: ASbGncu4ex2RoUh0DB8TU7XY9HLBZ8AxFe7dVOt6PF6o+6aWEfevLrTg6KunZOWapSg
	wzHf/tVI9IJ29TsMKMpnNjUO2qUHvAhT50MQ7ITgaQC0/W3tudQuIMbDtCPjglmgyJpYZRFwTov
	YRFX1uFB6rgH+4+VvHwLBp3RoNScZuQV7p29lwVN2OYCcSqRlWEWBXyyQeP12wk8KiY4AlbP6JK
	YrYPxv4OicOEMtC7YKK6fQsP33d3ARQjp/t4KooB1BYvmdU9YbEv++LhELHS9NSFTBJ5828HRE8
	vwQkVgcn7O/BnoAnayXQdAh+q6g=
X-Google-Smtp-Source: AGHT+IGyFfYznWtlzK+1dscg69T3Xfj2HXDxx8skS1npII5281AQkb1LuDH6QTamNOOg1pxOfm3nDu+XQdPeX9ecORA=
X-Received: by 2002:a2e:a546:0:b0:37a:2c57:579b with SMTP id
 38308e7fff4ca-37a2c57588dmr22924761fa.7.1762190349831; Mon, 03 Nov 2025
 09:19:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
 <20251027-qcom-sa8255p-emac-v3-1-75767b9230ab@linaro.org> <20251028-wonderful-orchid-emu-25cd02@kuoka>
In-Reply-To: <20251028-wonderful-orchid-emu-25cd02@kuoka>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Nov 2025 18:18:58 +0100
X-Gm-Features: AWmQ_bkcWkBdzid9BUjDSUzrVzjV4d_nhcsRcb-w2ymlO8H-z-8gOwTsZnb5fIM
Message-ID: <CAMRc=Mce_1O5fRn8xCu5GRc_hFUtMgotx7ZK1EHF4xZMoWsawA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 9:16=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> > +
> > +  power-domains:
> > +    minItems: 3
>
> maxItems instead
>
> But the other problem is that it is conflicting with snps,dwmac.yaml
> which says max 1 is allowed. You need to fix that, along with
> restricting other users of that shared schema to maxItems: 1.
>

Just to be clear: snps,dwmac.yaml should stay as:

power-domains:
  minItems: 1
  maxItems: 3

But all bindings referencing it, except the new one, should now gain:

power-domains:
  maxItems: 1

>
> Shouldn't phys be required? How device can work sometimes without its
> phy?
>

Actually I will drop phys, the serdes PHY is managed by SCMI.

Bart

