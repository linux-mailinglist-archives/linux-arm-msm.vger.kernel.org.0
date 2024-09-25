Return-Path: <linux-arm-msm+bounces-32486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC94986028
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 16:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46F5D28920D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 14:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B91186E27;
	Wed, 25 Sep 2024 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQFotCNI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE01865E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268085; cv=none; b=S9fr5KoVmg7c2fjUrJi0zWnTSvIVjfro3RExwuntz8KYFbV77RGARj6dSMyFE2V7GsTs5AHPbbdj94sfyvs3BspvLyK07y5B2jxUegEkkK7dLWcce6calbRYcwMlwzdAaW8av0DLxLcX+ZK1NfB81PrzEh2eWM0q94F/PzeZXhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268085; c=relaxed/simple;
	bh=YhBxDPpYQH4YqwY+Xz5yX4fHNoiBzWpOpC0HAJ/BbGk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LFkL7OLx2J0A53qLDqdjXYnSY/NcTnyiYnUJqIv3Vn373tlZXnFAKrbRMR9qMoIa089nQkYeQPXHu2WrLx2kHxfIhX0rgzaVaJuyPB9iltwUdIbtAwaIGz9QlF8E4KUcCuLT09mxACJJKKNpMoSvNxCxZP1t6xS8iv0D/tSHD8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQFotCNI; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9018103214so929647466b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727268082; x=1727872882; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Izurz+PMZmOHAHw9NMc4dqCu2H1VhQy7BJX6+wDdt9M=;
        b=DQFotCNIt4fwuRs9KULT/DBg+n0AwQoywoUipZtw3TLpQIUBa8t156Hscy0gbLplGO
         HeH5kaHPPr9Ba2K5nc3YTD1du7ezVFjJHHN/qU3qt49/TPfh5GGonPVZmGFmkzGzkQ8T
         /oYwJELE0kSxtpC6OjbUZhRx/kjExaFwtrsdZB5qgtVrt6wEfO0glyDi9IPcKFdSmGSG
         MgFnkCqbV4h1k4hXGC2Ox3JGI0KaxiIG2SMtOwm6vEisFalQkn6TeK+aO72yzt2qPHFs
         ITcsxnS1yOJR1coJPFsXgN6fdiMYXzH0/H0zE8Yjh0azmQmlxXjg+Ots4llYx7kGrisp
         z18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727268082; x=1727872882;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Izurz+PMZmOHAHw9NMc4dqCu2H1VhQy7BJX6+wDdt9M=;
        b=CHesOIE8qsNSvt/eIzxDmQVKH+XlTgz4QVeNJePR2MAhF72FrREwMcSl/udbpvCoTL
         pkKt3xng1tLq/XnBViCDSwfN18FUsaNNZjksDkXWZ6IwzBdVLlSxLrGnT7Qts2r80jO0
         zbEjEuna39CsGuoq1jKfIIpAfbssj+swjvgB6BXj63Uol9ezjWiWMAurhNFQDxsQeOJo
         TbRngL9wbo7cjxKXCzvgQ/oyGhpJJA80uEEAIIfvW6XxDUyhKu5LLBzeO/mem5RDKT+l
         Zb2sCgIOVeQTMwq7C3yx4ihOSB61WcbEbNTCopgtsQhRrgatx+LkGeSyV/eMOpcmqV03
         2H6w==
X-Forwarded-Encrypted: i=1; AJvYcCWD/ZzOwAbqIM06sYPZDYPCWNsL9r9+iQV9blnx/KBo+nTm/tltvtvIfXxPnEGqeyCoZOKrw/eKqpn5Qr3R@vger.kernel.org
X-Gm-Message-State: AOJu0YwCNoUwM3f4lAHTxiq97nihVSQed49G1/N96c4ob6LRYckkuhnl
	QLXflp20eNKbqIBQRaCkrNBIqkmCxy3R6Ka/avYD9QqEtHuzmxbuOO2n0XPWR2E=
X-Google-Smtp-Source: AGHT+IGWq/qS81LG8YAeWtGigBWFGSY2KUCD3wh8z6b4HsLNJ/KmQuRXg4EvkhlOqLo8SJiXSmkn7w==
X-Received: by 2002:a17:907:94cc:b0:a86:8f8f:4761 with SMTP id a640c23a62f3a-a93a035ff85mr249552166b.25.1727268081819;
        Wed, 25 Sep 2024 05:41:21 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae0fsm204615666b.120.2024.09.25.05.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 05:41:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Sep 2024 13:41:20 +0100
Message-Id: <D4FDFLNQVSLD.3GSWD0IK7Q4FK@linaro.org>
Cc: <srinivas.kandagatla@linaro.org>, <a39.skl@gmail.com>,
 <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <krzysztof.kozlowski@linaro.org>, <vkoul@kernel.org>,
 <klimov.linux@gmail.com>
Subject: Re: [PATCH REVIEW 1/2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n)
 macro for DSM_CTL and SEC7 regs
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mark Brown" <broonie@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.18.2
References: <20240925043823.520218-1-alexey.klimov@linaro.org>
 <czlx4thp7thnb6jrauilpbtzgbq637rmnwlpifxq5b5jfa3lqm@toyy3b2viscr>
 <ZvPPpfobvDmmTCfi@finisterre.sirena.org.uk>
In-Reply-To: <ZvPPpfobvDmmTCfi@finisterre.sirena.org.uk>

On Wed Sep 25, 2024 at 9:53 AM BST, Mark Brown wrote:
> On Wed, Sep 25, 2024 at 11:27:54AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 25, 2024 at 05:38:22AM GMT, Alexey Klimov wrote:
>
> > > +#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)		\
> > > +	(0x0434 + rx->rxn_reg_stride * n + n * (n - 1) * rx->rxn_reg_stride=
2)
>
> > This is a nice hack to rule out n=3D0 and n=3D1, but maybe we can be mo=
re
> > obvious here:
>
> > (0x0434 + stride * n + (n > 2) ? stride2 : 0)
>
> Yes.  We could also use some brackets to make the + and * precedence
> obvious.

Yeah, sure. If this approach with stride2 works then I can update to:
(0x0434 + (rx->rxn_reg_stride * n) + ((n > 1) ? rx->rxn_reg_stride2 : 0))
and update stride2 to 0xc.

Looks like I can also remove:
	if (j =3D=3D INTERP_AUX)
		dsm_reg =3D CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
from rx_macro_digital_mute() since INTERP_AUX =3D 2 and this if-check was t=
here
to handle special offset of DSM_CTL for RX2. If RXn() will generate correct
addresses then this no longer needed. Or such kind of clean-up should go
into separate patch.

BR,
Alexey

