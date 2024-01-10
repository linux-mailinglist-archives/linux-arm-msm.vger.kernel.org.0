Return-Path: <linux-arm-msm+bounces-6875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C543829833
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 12:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D57071F25F59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 11:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC144176B;
	Wed, 10 Jan 2024 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IVNTihcm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8808541236
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55719cdc0e1so4502816a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 03:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1704884424; x=1705489224; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONi/SB9nLqgwdclaMN3RyBOpRG19jO44sGJgFACT67g=;
        b=IVNTihcm+vRSs/l7RJQ/Ty7O8XdgPaIZUKJnF8cpWhci6F2+kNMWB9wr4LcNEhMD+y
         BzhqC4OPpyFUzKzKJz4efIWl1sb3Jrq6wcV6r8zRt6gLxvSjSt6iHF/2frpuQQAjBnOY
         ILmj/85CJzSlER353HH9qJKo1bBKOaf4O4S70Hh4hwLjCJdBgJ4XU1G2N1akMkFQoT1N
         BIO/Wyc+qW0SsVh4ajxTm1Quc74ZpiH/KLA/o64NiDgvZk1cCrE1cZxUV8EanZrmD+ve
         CBFP+hYWWqSWYDzWBVCSIwXPx+WBV+HXEDh7Crzhrd7sHNlXrG1Ev2locE/XDCGSE5YC
         FkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704884424; x=1705489224;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ONi/SB9nLqgwdclaMN3RyBOpRG19jO44sGJgFACT67g=;
        b=kLG3tndUQNckjI2EBWZ2rH4olc/3PJtpnBiGRAR+zYF7BPS7Zvf+//Z2MhdQi88GAv
         6RgOR4lwgp3DOSg9a3W80VxAKKhB8yNrfNV3pdaNMt4l8xjlavmMZmEqo09FsHQIZ/pm
         vC8etAWWwfoNX5fXcoZfgjbbJz9Nv6A/OsJkmksk3d1QydVhboDv2/tgpwb2qztRotz6
         rbcT0ivJvbJHO8H7uapgPgWk459g3iK8FLYtu2qA2qOcoPB1s+P68oc3Sy/bTNq1PXHt
         7Lg1LnoiOiixlxTPAVN6gx3T2cBPcH+T/8WqkrjjcZjHblQvT+bZSvLu6doKPuRBhmjW
         Y4TQ==
X-Gm-Message-State: AOJu0YyFahZ03lApT4sp3aU/osUIq0qfHmRmvBawN8+HHlrO2ogHSolB
	AWct9FPath18Yys90RIgDB3al/Un4xAwTg==
X-Google-Smtp-Source: AGHT+IF5G3ti7drOafPhH/oJnH4OEjkohZU5G6wl1Gh/kLq1Rluh5+3uo+b16GQfeNr7IUyy5r+CMw==
X-Received: by 2002:a17:907:9017:b0:a28:e3b6:ae4a with SMTP id ay23-20020a170907901700b00a28e3b6ae4amr400415ejc.57.1704884423732;
        Wed, 10 Jan 2024 03:00:23 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id lh13-20020a170906f8cd00b00a2bd425eab2sm464326ejb.2.2024.01.10.03.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 03:00:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jan 2024 12:00:23 +0100
Message-Id: <CYAZ37LBKG4E.2096GKVUXN8Y2@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 display and GPU
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <quic_jesszhan@quicinc.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>
X-Mailer: aerc 0.15.2
References: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com>
 <20240105-fp4-panel-v1-3-1afbabc55276@fairphone.com>
 <3fdc6e74-d817-4341-bf64-9096608990d6@linaro.org>
In-Reply-To: <3fdc6e74-d817-4341-bf64-9096608990d6@linaro.org>

On Wed Jan 10, 2024 at 11:58 AM CET, Konrad Dybcio wrote:
>
>
> On 1/5/24 15:29, Luca Weiss wrote:
> > Add the description for the display panel found on this phone and remov=
e
> > the simple-framebuffer that was in place until now
>
> Why? They should be able to coexist with a smooth-ish handoff

Does that work upstream? I'm aware that downstream can do this but
thought this was still missing upstream.

Didn't check what happens when you have both enabled.

>
> [...]
>
> >  =20
> > +&gmu {
> > +	status =3D "okay";
>
> Please kick the disablement from the SoC dtsi instead, it won't
> probe without the GPU being enabled

Ack, will include a patch in v2 for that.

>
> Konrad


