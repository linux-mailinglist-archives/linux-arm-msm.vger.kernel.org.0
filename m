Return-Path: <linux-arm-msm+bounces-42959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6960F9F8FF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 11:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E666316BA2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DE01BEF8D;
	Fri, 20 Dec 2024 10:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xII7jMMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5B51BEF63
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734689512; cv=none; b=IPr3Gc/g1K9opykgQtAVID0tWktmb8V3jS6qXGmgyrlEktX62DTbLXF1MgoNekdLTza1U69XEaNteZGcRsppflCRDLf0QN+Ph7JBGDPBf/zp3O+Rthyj/9AamWwuJ4jNjkWigkHc+Kdy0GBQ8U33vZNf11YBvURPEVTbAPwXG9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734689512; c=relaxed/simple;
	bh=EaSdb8z72/Ef9LspwhXaWKy36z4KEu6sCzfALY8btEw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=h+XrJuDIxCihaCz4Q+6gBYxUtlZpDMn91LHH6HC6HXF/2s1PNieyKIg+IUX4Z7zLZdiJYIGdZIumiGq//4JngeNwZBF8LXOJ/Kl0FjDZf97JVtSuE3akFYCgbVZSoXo85krGwKMUoGV0yjUvsbGi2PvVURmmBX2Fd88lCtYCOTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xII7jMMJ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso1001791f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 02:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734689508; x=1735294308; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaSdb8z72/Ef9LspwhXaWKy36z4KEu6sCzfALY8btEw=;
        b=xII7jMMJW/VkUuE+mnsE/e5LYak9IlvR/aBD49lVR3lumTHolxlrRMvAWx680e+80j
         5PKSAeC37lnjwG0dmOw+Hy4gUGkf0TquWVq4g+m6JeNbdCon75NugK9h2dE3/jP/R0FQ
         a2EXpf6+4rp5Fyzub7TZj6/SrdhpWHGYB9CBOKpbt9XRBVO8D4rRIc9xDqOqIysHhiN9
         2ztgytOwFn17mvo0hoDjy7wx8oEtZWmt1EQLVWhyi9KlfabYQXXP0Owzojvshj5B6U6h
         Q1wpW3Y4fc791mipeYi18MX41vssq/w38HOZYgQkRlr2K44p21eWocUMp1R7RiUeLFaD
         6k1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734689508; x=1735294308;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EaSdb8z72/Ef9LspwhXaWKy36z4KEu6sCzfALY8btEw=;
        b=OIdhvo1nOryMG4bUE0TLeilQYs4KjEFR99qlMor/u4SGVNDkiCVN/mF9d+UEPbChou
         0fBrvccZVqlJLa6CTDzxGVKjRiZAw5QKg/i7YD8k7fAgALqO055QBmWM5NOwiodEs+5y
         GoMIFDhvbqVTDllr+NFuRxhE+vaKDRhLNuCiZXoiKPeF4lmpS3L05BZSZhgu/T+lT2j7
         cNlQT0THT+yw3uzRJpSmhkGwQSZ4kuRZDoaB6nfQneY8WJXRYRdjA9TpfDAApkIG1Ek9
         PiDA5polsfG+aTmIf52CkfzP7SOsCiU73fXpWJMjt/0oxcSlqvXagYK0Xqq7anY1v7y3
         ffWg==
X-Forwarded-Encrypted: i=1; AJvYcCXN/CaYK30QItt0Vu+BzSRSFytkCatLYiI2100tnM+FGTxOSdoSzbk/+mGrKMiR6QKjIVXYouORysT/ofgS@vger.kernel.org
X-Gm-Message-State: AOJu0YwnxSZPN6bHGLU0MYhSdEkyGMfL3zo7xxBIlAXq5Ig4Yi2fDUUB
	h/8TLcsr3waH/ETC/9FyxdGr7z2098KQAaKo67NZZBDoqQC+El+QYdf6u+iG7Y8=
X-Gm-Gg: ASbGncsMAZpbpGuqfBnV+XhDWah1avCMkV+VbnXmH9Gz9i7Kqw4Jqgj0UZmJyhGnFB1
	A2/0GFX2/nyPdPKlPO2ikjngEeFf/BgBa91Ou046YWWSv3mvXk1kCLL/91p0nlOCCSepRCvvoSs
	r+67cR6mI1+1/8+cmV6219kqJEjJYOlZvaYOFrdmEcCzKvvqrCBsLp9qW7Zkm+kWaJh3Rc9Y/eb
	bRJ0vKCaaqNsFgereOAhvSsjNoLX2Wbev7mUs00tPhFkZmyUv0vqrDgwKx9eMS+xfg/NivpnAWi
	eXZSVXESNZa1c7oh5h8XTNfHHg==
X-Google-Smtp-Source: AGHT+IHYXbF5zEgptW9K6SaQDrYDWMjumw3skuuvDaqv7mt65+EQ9elAtWEo+20ASe35/lJk+bD6iw==
X-Received: by 2002:a5d:5f4f:0:b0:386:391e:bc75 with SMTP id ffacd0b85a97d-38a221fa986mr1984788f8f.16.1734689508270;
        Fri, 20 Dec 2024 02:11:48 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366112e780sm41626015e9.0.2024.12.20.02.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:11:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 11:11:47 +0100
Message-Id: <D6GG3YBXX62X.1JV54ZRWY7B5@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Luca Weiss" <luca@lucaweiss.eu>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Drop extra
 qcom,msm-id value
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241220-fp4-msm-id-v1-1-2b75af02032a@fairphone.com>
 <a536afc9-0837-46f9-9135-c220cde7f862@oss.qualcomm.com>
In-Reply-To: <a536afc9-0837-46f9-9135-c220cde7f862@oss.qualcomm.com>

On Fri Dec 20, 2024 at 10:36 AM CET, Konrad Dybcio wrote:
> On 20.12.2024 9:55 AM, Luca Weiss wrote:
> > The ID 434 is for SM6350 while 459 is for SM7225. Fairphone 4 is only
> > SM7225, so drop the unused 434 entry.
> >=20
> > Fixes: 4cbea668767d ("arm64: dts: qcom: sm7225: Add device tree for Fai=
rphone 4")
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> > Completely dropping these values also appears to work when using
> > boot.img header version 2, but doing this change now would mean any
> > tooling in the wild for packaging up the boot.img using header v0 would
> > stop producing working without adjusting that mkbootimg invocation.
> > ---
>
> It would be nice if you could start shifting that tooling to bootimgv2
> slowly, and when it trickles down to appropriate places, switch it up
> upstream as well. Of course if that works for you.

In postmarketOS for sure it's simple to switch, I know Mobian also has
something for FP4, but apart from that I'm not sure if there's more
build scripts floating around somewhere.

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad


