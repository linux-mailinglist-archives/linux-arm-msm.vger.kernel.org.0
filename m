Return-Path: <linux-arm-msm+bounces-41985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBB39F0ACC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD8FC18849E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6A81DE3C8;
	Fri, 13 Dec 2024 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QU0FsxaP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916CA1DDC26
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734088978; cv=none; b=au2AX1NVRIbz2hSO1ignhrXGlCzpxj80EOkUSmfIvsptnOwlbAPNniPs64gKnFJf51HoI/N84WUJDslNh+K+zK2X/YNfzWSsFw3/y+uOh4tfMWA30KAEIh9KMTRrYgypepB2rpsi+H5xINR674CkLkCrsmSoF7fYRbyQqtDMxSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734088978; c=relaxed/simple;
	bh=N6v1cyR9J/zI+Q0ORnKRS/ZchvHrsmRuEczw3AxZGk4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Z183mTDbqyEM20geb61WGCqW1VVuOCemBcqTEF+AUwGsBRX8CeH2IU3IQRc/cXLwRFHq/FQ2utNQqGloTvVh7aUu9zZdvWADSavJzhwE2+6eu4waO+v2j2kDtxoLwva2DiZ9W09tZcqPXajBuqg+BiIuApWQ3AKfRJNgMjesrQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QU0FsxaP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso17110735e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 03:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734088974; x=1734693774; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0x+W2FV8c0fNb2FM/fYmcZMsw9cp5lY0mr2d1TA5uY=;
        b=QU0FsxaPM1rSU+dSnUlkvl5AuKgamgDMRrxAkzpTgG+J3r9c8DW0drUNK45o5kvPQa
         OIG1ZcAfX69XqfudCTx6Der3tgT2YDYYC01ZFviPa6N9xfQvP5X/PhHd76NqBjsxUx85
         L4qtFIzYvvFwTJtNbngCGC8uTehv0ZeqHQ07W2+QptLjqvdRqx/XzqVHCfVwk6u6E4+M
         DvpEB0hk+pOarK4kuXLVz7Zl6fsTnwl2Z10oqpQkHsl2V+alHK8qGssrO/q6PU819f6n
         RtTtWrWJLqbRgJzQxHwgH4ZweDyMYqnZHLuVWeQMGsFUJnVQHkx/AgrbpEGwzUJwSRYi
         HdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734088974; x=1734693774;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R0x+W2FV8c0fNb2FM/fYmcZMsw9cp5lY0mr2d1TA5uY=;
        b=FdCWM7bz4W8nXJhI9EzB0tvm7N1RyKcYrlOX6SNoHVFzB5UCzuD+zmf4205AzKs5xi
         ZUn+j4aqTdYdRZu3tKD1WWAYqr6l2cllBltmr8sctkpTNWOfR2tBvMfFkYdtHBpYBZ7R
         sXVtPmqhtzxCyY566iTF10//KuZUSNlTWzlDf/M93bsqnaIX6tT4BwdlSqutofYEQJs7
         OUS8dLi3PWX95gtEZejNwe0pFfF6xmDCX/cfDH0b+Rf4hxbZxRTi+pg/ibssUwoDSQvt
         P+Gy7ttbSFV6PkH8xcDOVEC7z6agh0YbaLPsfpffijzxtBwFcWmaYL3aPRjfdK05gp0j
         3FLw==
X-Forwarded-Encrypted: i=1; AJvYcCUY3fGFQTTD66pG83hCqltSICt2VCYxonJS+7mAaHeHvmxYBVGD8wh0SI87taalCyoTLsPbwTCFOldp2P3S@vger.kernel.org
X-Gm-Message-State: AOJu0YydFStl78gN1NI7EK5gGc40kCE3aXxNh+rYKmru+US9fnVIcKIm
	hs6oeylB15fg+Qxfuw3b90JSE8iwILYOXDRMV2WHrTfU8n+vSQt1ebsAUSyVKhIE8sPGi+dWQbp
	uPeA=
X-Gm-Gg: ASbGnctDaT30HLQQQLw3scSKdHe/pqQihsOJEsSxiplC7aeK0cHgtAwcAE/YuPXVSaq
	nEIXOW4vaNtu7RnC5s33FDY4VfyoGYveelAo0PMLOr3o9jy3E9H3x6H+wwqDls1bHSqqV34CB02
	4RZcQ3lK+w4mwjHOUrgAjzt/GhJvBA0yrAW4AMmwxypxnWvEaPhZYutmBHRhrXdiA1HxxzjJJ4k
	42NLRHE6no1X5pwzAw759QVtuzRgHkPU22cWy678cozw1Oll+0zovMuwsAV3W998qQgydLJFna3
	Vl4V8RCCNXN2Yi7zm1yW9cjaSg==
X-Google-Smtp-Source: AGHT+IGX5tUiDSBzaO6MT7A0xWnpvOc0YW7KrOiuYx1f0SQxj+bIuIxBHtCdFRMgkKA6+olSdAlgFQ==
X-Received: by 2002:a05:6000:79e:b0:385:e0d6:fb6e with SMTP id ffacd0b85a97d-3888e0ac4c1mr1337773f8f.37.1734088973848;
        Fri, 13 Dec 2024 03:22:53 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878251c3a7sm6710697f8f.94.2024.12.13.03.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:22:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Dec 2024 12:22:53 +0100
Message-Id: <D6AJ8KNRUHB7.1EC9O3WSCSNIP@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] media: qcom: camss: Restrict endpoint bus-type to
 D-PHY
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Todor
 Tomov" <todor.too@gmail.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Barnabas
 Czeman" <barnabas.czeman@mainlining.org>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@somainline.org>, "Caleb Connolly"
 <caleb.connolly@linaro.org>, "David Heidelberg" <david@ixit.cz>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <20241209-camss-dphy-v1-2-5f1b6f25ed92@fairphone.com>
 <9c89e6f4-a9af-4270-b266-537f3464ee32@linaro.org>
 <a047e4b8-c2d6-4486-8037-e7b854660cb1@linaro.org>
In-Reply-To: <a047e4b8-c2d6-4486-8037-e7b854660cb1@linaro.org>

On Fri Dec 13, 2024 at 12:02 PM CET, Vladimir Zapolskiy wrote:
> On 12/9/24 14:32, Bryan O'Donoghue wrote:
> > On 09/12/2024 12:01, Luca Weiss wrote:
> >> Currently the Qualcomm CAMSS driver only supports D-PHY while the
> >> hardware on most SoCs also supports C-PHY. Until this support is added=
,
> >> check for D-PHY to make it somewhat explicit that C-PHY won't work.
> >>
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> ---
> >>    drivers/media/platform/qcom/camss/camss.c | 9 +++++++++
> >>    1 file changed, 9 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media=
/platform/qcom/camss/camss.c
> >> index 9fb31f4c18adee886cd0bcf84438a8f27635e07f..b99af35074cdf6fa794a0d=
2f0d54ecf12ac354d9 100644
> >> --- a/drivers/media/platform/qcom/camss/camss.c
> >> +++ b/drivers/media/platform/qcom/camss/camss.c
> >> @@ -1855,6 +1855,15 @@ static int camss_of_parse_endpoint_node(struct =
device *dev,
> >>    	if (ret)
> >>    		return ret;
> >>   =20
> >> +	/*
> >> +	 * Most SoCs support both D-PHY and C-PHY standards, but currently o=
nly
> >> +	 * D-PHY is supported in the driver.
> >> +	 */
> >> +	if (vep.bus_type !=3D V4L2_MBUS_CSI2_DPHY) {
> >> +		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
> >> +		return -EINVAL;
> >> +	}
> >> +
>
> Looks like it would break all old board dtbs, which is not just bad, but =
NAK.
>
> V4L2_MBUS_UNKNOWN shall be properly handled without the risk of regressio=
ns.

Please see drivers/media/v4l2-core/v4l2-fwnode.c around line 218.
The code there sets bus_type if it's UNKNOWN

    if (bus_type =3D=3D V4L2_MBUS_UNKNOWN)
        vep->bus_type =3D V4L2_MBUS_CSI2_DPHY;

So setting "bus-type" in dt is not necessary, even if it makes things
more explicit from dt side. I don't think we'll ever get UNKNOWN here in
camss.

Regards
Luca


>
> >>    	csd->interface.csiphy_id =3D vep.base.port;
> >>   =20
> >>    	mipi_csi2 =3D &vep.bus.mipi_csi2;
> >>
> >=20
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >=20
>
> --
> Best wishes,
> Vladimir


