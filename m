Return-Path: <linux-arm-msm+bounces-40026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 308CA9E14AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 08:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB92FB286C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 07:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6DA19AA58;
	Tue,  3 Dec 2024 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5mreDrvi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EFE1B21AA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 07:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212385; cv=none; b=WVLHuXW6B9eqNSEnnQ0MeENUfjyJX+Eh4mwH6vk32B6ZNy+sbDvsu9alZfxJre5xY/lQCtAwLWtuhTYBP8Byh2x6OsnVoUgP0H2QizPua6DPEyMVKHm8KyzbYbwtqZYXZ3zUFyT0z67Cg0ukLuN7lVMyzm+SaMnJ345cgro5TTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212385; c=relaxed/simple;
	bh=7rsJx8PPlBUPhNYZpY4C2T1GcmfaUB0tv/4wQt6eSwQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=V6se9VZtAuu9WQ/76ezwv5lMoW526VeJqPW2OUzoFp0o9tSknRcEPsJQyLCZqAbXdzZkZJsg9BQaXnYut68QD315h9e7QVMai3MjvkfiiH0V8Yzd14vkV1skQ/N3hDSCdBkQB6p+HBTenbp8h+oiktLRxX3N8pcnjRRIYDunb1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5mreDrvi; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa51d32fa69so797474166b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 23:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1733212380; x=1733817180; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D7zw9MHhki0fQyrcbsaXtFGQSkwrEFiOvoXEAaY/xE=;
        b=5mreDrvisXdmU0+p8DFDxeGIiyupLJoDkLv8XDdd/CHi1lEy02hanxmk6zWLfyowjR
         NgwFRMJhnZUkHQCmbdMAwZ9oaIgmrnI6bHF0UbKkxXXBX4idrgEOQxE1V7WsnQjPqMcK
         LWB5Wn4HAXF6vAVBCGDeMMrC9xLJbivTWv/Vw68v3bxumnEP+D8B9s4De3u46ttvBdI1
         R/5OB80A02susf0LbhHs3YlOcHElYWGW5LRqF5prvB0ohAq1rcZKHjqZQ1o6qS8bvAfB
         uW/d6CyPf2N+HUBOkMofkRBU6pBkKW7m9DyGXnH3xkl5iBb9v2C9eUBTS0B9samKgHCW
         /EwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733212380; x=1733817180;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0D7zw9MHhki0fQyrcbsaXtFGQSkwrEFiOvoXEAaY/xE=;
        b=S6nJriN2sMnBgYxn6v3MSTOvDJ9RG4Q+gX8bAh+C1yKlO0ZDdLmqCv/jfY5lpQNFkA
         zDRk69Ss4bYmVYGl2HvGoOD0w6QsnGRml/k2NrzUAsKJYZo7GY/uv7mONa8NV6ErL3cV
         P6y7UT2x0KdM5Dsn1KE6Mp6ob/sdvMq5yRfC9g0EqT9SPH7gXGXSRMncNugIuTFxgbRH
         JSshSBnAaT8rTiGgvBy5zKb3CSj2/Cf62DYFRCNfjVI0t/pkb9Ae8WyuqBG3QmC9dyv3
         d6rw+lBB37Nd6PhbgAYnGHVXwbJswV3WtH1sT/D+CGgvkCdt/Xc2jMSgYLhudZNNbrCO
         pZSg==
X-Forwarded-Encrypted: i=1; AJvYcCWtVscQrKMtCMcGnCkxLqQRSKeBtuqll6jcDQVHecht2jPCygNNN6B0LTZga/mUQObkS6oCc5xXwBBcrgYY@vger.kernel.org
X-Gm-Message-State: AOJu0YzVi5vd2t39j5od5GPGskdoRMZVTqCYwILSmFyysZQk4sa954nE
	PGIfNXVOSn73vbnkKJslUfLTfYspHO2snCZsQYECqeRJRC/ws+RV6BjvFVpPBIk=
X-Gm-Gg: ASbGnct7Lvu1EtAXIkg6xqH8Q8XIXrODK+1nDQmXT9pr0cqEirVIvknGnowFZTx5b33
	phkWPCvbbmOo4fzn4cd+mcN6+RuRUj8OQ2BBudfWpm1nJoOOp10rzK1E0UjrC01aQLzVRzr6nGF
	tlFujXO/93UiswtIpN/olRTWKfeeOAidL8tisFyYND3En5o59YTyqm4OjB6h1e2MwyT+PwRD7zM
	3ZM+0nrFLIna+vxOMxoO3MIf17R/xvR/lkCpASzVK2aRgI9ja2RFMVlHbPDoShQheVg8CSkc08f
	k7SnwDT1YeXt5x9SMhs=
X-Google-Smtp-Source: AGHT+IH5Y4Euy0lKtptex0iUPrTdDlymLHlyKHDlm+teFEcJLphIHtL9LraZ6mJjjupisyuttL8ryg==
X-Received: by 2002:a17:906:1db2:b0:aa5:152c:1995 with SMTP id a640c23a62f3a-aa5f7eefc47mr81228366b.45.1733212380291;
        Mon, 02 Dec 2024 23:53:00 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e771csm591681166b.127.2024.12.02.23.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 23:53:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Dec 2024 08:52:59 +0100
Message-Id: <D61WIF2XWKL8.MWU6PK2XGX4F@fairphone.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: power: rpmpd: Fix comment for SM6375
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>
 <yo5cc3cvvwwdrqrrgwlquztj52sijip3ffyyqag55jrnztxi2m@hn75ylkhnxie>
In-Reply-To: <yo5cc3cvvwwdrqrrgwlquztj52sijip3ffyyqag55jrnztxi2m@hn75ylkhnxie>

On Mon Dec 2, 2024 at 9:00 PM CET, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 04:45:02PM +0100, Luca Weiss wrote:
> > During an earlier commit, the comment from SM6350 was copied without
> > modifying. Adjust the comment to reflect the defines.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> Fixes tag, please.

I thought for just a comment fix it's not necessary / desired.

Anyways:

Fixes: 2d48e6ea3080 ("dt-bindings: power: rpmpd: Add SM6375 power domains")


>
> > ---
> >  include/dt-bindings/power/qcom-rpmpd.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindin=
gs/power/qcom-rpmpd.h
> > index df599bf462207267a412eac8e01634189a696a59..d9b7bac309537cbfd2488e7=
d4fe21d195c919ef5 100644
> > --- a/include/dt-bindings/power/qcom-rpmpd.h
> > +++ b/include/dt-bindings/power/qcom-rpmpd.h
> > @@ -65,7 +65,7 @@
> >  #define SM6350_MSS	4
> >  #define SM6350_MX	5
> > =20
> > -/* SM6350 Power Domain Indexes */
> > +/* SM6375 Power Domain Indexes */
> >  #define SM6375_VDDCX		0
> >  #define SM6375_VDDCX_AO	1
> >  #define SM6375_VDDCX_VFL	2
> >=20
> > ---
> > base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> > change-id: 20241202-rpmpd-sm6375-06582e126d7f
> >=20
> > Best regards,
> > --=20
> > Luca Weiss <luca.weiss@fairphone.com>
> >=20


