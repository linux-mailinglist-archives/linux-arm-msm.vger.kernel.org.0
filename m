Return-Path: <linux-arm-msm+bounces-3219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A430803037
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0634A280A06
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 10:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F5A208BD;
	Mon,  4 Dec 2023 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="v7gGEBmE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BED31BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 02:25:20 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a0029289b1bso551470666b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 02:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1701685519; x=1702290319; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aq+xirBYpOKkgca1eZSuL+2A1j9+CgouYiCwrjD1giM=;
        b=v7gGEBmE+kCZFnoVPEa45r2ReOx+/1p2IILLp95HhqJ5wcVZBJ3tJfB0yqTEjU7tOM
         DCZFTZJsQM6dWbHwltdAPTFM/OzVH09HZfF9JhZpReE+H1ZGRu7sze3tbREPpcvxy5oB
         U2LxVkzgF9aHcDXRmBa06YUYGvx1JuA8rgDAYL+vaE7CNzStC5fUNpcwOungj/NLMkc8
         3dj+JC/AfDMZbbR8YU3X3FRRnm+lb0966bAlcLofXMJtB3OsqpTsRVb9pEkbuK529nbF
         1Gq49X0Sp+v/3su+dXdG2wlVa3Mkpft6dYynt9LRNf62nIk5cMIIQ5cEQU0hgeqfKIy5
         gcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701685519; x=1702290319;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aq+xirBYpOKkgca1eZSuL+2A1j9+CgouYiCwrjD1giM=;
        b=OsmnjULwqqpFuhEKFVVYzkKKMiYUakQvSrDOBqhKjtiIqkAf/BZ/vTPTVGjOeZFV1U
         JW63CUQhHUyCIQiLTIrVAvNwzI7as7Jf2TTVU+gsSQ/QmkWoRp/YySJ2FRXr50FGpgIt
         dSF4VLWadgVPIYbaqYFHJdBK7UhE7trqjMLCNEAbil26KCtvHntNCyQyLX2AWJx9W0lW
         9A+aTfjHqbhmpcMmSWcd00GzG5PHoy3UmDP5kwjRSPBjAs557T77VFRjnlLjTvLuCama
         DfQbmckavOdGnT4xGGuwqFZe9o6XXYnG1ZTv7UDzoBnmoPeLQFsO+Q5aX2ukbYO25E6d
         6Dpg==
X-Gm-Message-State: AOJu0YxV7wZGYKlyICO9e3Dl4NLwvaS2LfQNYYx3+CV8mYoJF+qtI35T
	+Ww4EM1qDWGhRqLBqDniSPCWkA==
X-Google-Smtp-Source: AGHT+IGXQXao7rNTBZHQgJuB0+45+KeoiPwj8lhmQ5FXfr08n7j/ar6GYkc4R2qZf+xv/FEM23ln4w==
X-Received: by 2002:a17:906:3f58:b0:a1a:60e6:a1a3 with SMTP id f24-20020a1709063f5800b00a1a60e6a1a3mr1963513ejj.24.1701685519006;
        Mon, 04 Dec 2023 02:25:19 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ef10-20020a17090697ca00b00a1b6ec7a88asm1291759ejb.113.2023.12.04.02.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 02:25:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Dec 2023 11:25:18 +0100
Message-Id: <CXFH66Y6MBZE.1YDXWOFV4MY7Z@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bjorn Andersson" <andersson@kernel.org>
Cc: "Andy Gross" <agross@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Nitin Rawat" <quic_nitirawa@quicinc.com>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable UFS
X-Mailer: aerc 0.15.2
References: <20231002-fp5-ufs-v2-1-e2d7de522134@fairphone.com>
 <dutd7zn5avelyujiyb6k64luzu2pqccy6ywhfj52i4g2m6ld47@2aqstxoekqrq>
In-Reply-To: <dutd7zn5avelyujiyb6k64luzu2pqccy6ywhfj52i4g2m6ld47@2aqstxoekqrq>

On Sun Dec 3, 2023 at 5:41 AM CET, Bjorn Andersson wrote:
> On Mon, Oct 02, 2023 at 02:30:41PM +0200, Luca Weiss wrote:
> > Enable the UFS phy and controller so that we can access the internal
> > storage of the phone.
> >=20
> > At the same time we need to bump the minimum voltage used for UFS VCC,
> > otherwise it doesn't initialize properly. The 2.952V is taken from the
> > vcc-voltage-level property downstream.
> >=20
> > See also the following link for more information about the VCCQ/VCCQ2:
> > https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-ext=
ra/devicetree/+/1590a3739e7dc29d2597307881553236d492f188/fp5/yupik-idp-pm72=
50b.dtsi#207
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> > Depends on: https://lore.kernel.org/linux-arm-msm/20230927081858.15961-=
1-quic_nitirawa@quicinc.com/
>
> I'd love to merge this patch, but this dependency doesn't seem to make
> progress, please consider fixing up the outstanding feedback and posting
> v5.

Right, it's been a while since the last revision there.

I've just sent v5, hopefully the various feedbacks should be addressed
there :)

Regards
Luca

>
> Regards,
> Bjorn


