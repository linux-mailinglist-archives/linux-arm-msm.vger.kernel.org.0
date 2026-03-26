Return-Path: <linux-arm-msm+bounces-100077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK8jD7wHxWnn5gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:17:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A533325E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48B2A3173D9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCA71D45E8;
	Thu, 26 Mar 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVauT+Jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMdv2SQL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360A9322B8C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519671; cv=pass; b=kP4dNn9PPRXpHcbS92DNirKQuGS0oaOiQZkF07Fb0XJyni7KqkBotZ12xQd2lmJxTlHniSYAjB72XX8ZYg47P2nq357uQZ/nu8AMw4qoPsDtBahlaqC1ReeioA7xToiZCB2OginYRfJ/plkgGUXSX6QltV1tnUFDYTBOtcUpJtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519671; c=relaxed/simple;
	bh=lqaeI3ynPbRJKQe5PDeB9VaBQLaANlhTZEkq73SPjeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gafMRHlGPveVTwvG7GUNFul342uVKmwZ8IBr0f0hnwrIjFnOta8bs4ikemHYHJScSl0UMMJe+Ps3IaEGuv8BbfAjh6OcIoAx/EPxUEIPqK81FU/Afjbc3rh5J9CUlAmtOEsXJq302j64i0Q6OhTKPXgDlNWTidu5R5r2ax/0qIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVauT+Jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMdv2SQL; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8AlrM3957557
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dnMavv9VcWVUyZA6Ex4ByNZK75MDVF8digB1PwkBNzg=; b=gVauT+Jvzf4P/isc
	y/2dyX8RuxmQPASHXtfsNXVjOqQBoEGQ/nTinY2ccG3c6iJyo7W42gxAg8h63oRw
	CYW2N0kdLalzBeVllX5sEhtX0GdSJm/vLXEr0X2wFU70axClCyk7IrK3udbBriQo
	qBqGAsAp8wN9Svk92fiSkCjpiBttcYw4xP6X+yEdEFE8SO6zNY05+KsJ7KNDEpLl
	00qknhLZp9Yt1DgPp63ZHYrA2IqcPEy27u0xzG69fbudHQx75ovm4eNqxefG9F0n
	AVRaPSlNvOsUqc7dmDYYX1eLaBAPc/jeWnGzn5U1NLCKQCbOxLSIwIdbTqMe5Pqy
	Sth0BA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjahphg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:07:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899edf0171bso21650446d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:07:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774519668; cv=none;
        d=google.com; s=arc-20240605;
        b=SqSmYbh/Ac3XUOD7vLfknLoFUmx68Qr/BgJl2OzVQkbJpwL81wgnxEmiEcnm68pTpD
         UndpIM5Ies0EY5LgdwAdafZi5NN7gkDh9bh0moGZnAWrooOm2L4M1RBGPu+suPp4+ijE
         gPwSaHzi/yxRgrcTaHLUG65LF8GEfM78liqQEydpeyStG+yZyTlqTJnpDuOo1EtgMoDG
         lak5jva7IP/rImwRJJx8L7lkzdNfGmPxMYYpUswFIHYWcWXbvMSfFsSDWW9a7qSKLDDD
         ldPp4sXby7iQfq+fLi2Fmvwc9JoWPP1acrQX65yU2Qyqp8tIZnn69ElqIyDXyOlK+6bT
         5oIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dnMavv9VcWVUyZA6Ex4ByNZK75MDVF8digB1PwkBNzg=;
        fh=k4tB9hHm5Pqh3LukdGx3cCJhxr2Xtr2XUJiu6GbMIzw=;
        b=F66daPyTLyCMwsH8LFpa7yMYYchobSVdnT4KD8VZzVpMgr7IqAS3Gx5+825BemE3uv
         zLlydPPZOOZPWCSE+/fi9Ej8cokyfU7qsFyj1vjycvUcadHdXX5heVVCRth39fFTYFYX
         1ev4XYzMlA/x4/pJaBplc+/uyECAD6Xa+eqDvbFBKQm+1uCcpibdLf2plQOY+8SK71jP
         ZB3g76nVOt4TVPE6PkTvYKex+RgzoIfhlu7TdTNyJzgYGhgYQVT+JUkxow9zrv9riAk9
         myji1Lu3lqpqFknaLlOevO1klB+NXx2A9G6NzhXLaAAm6fM6DUt0T9lWkx5PDo3Aoj/3
         nBmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774519668; x=1775124468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnMavv9VcWVUyZA6Ex4ByNZK75MDVF8digB1PwkBNzg=;
        b=kMdv2SQLCJw5MBvaFsfhvwANke14fmFNraGxkXyv3ylVTKt/rNVszCc1aR6kB91HXk
         +Q4EJ78ywvyNoipSNTxDE1u3730AJ0d1MVkkkfFje2qn2SVf1Q0WOwkHY9OYfA9LDA2B
         XRl6INrZRYlWXWl6UZ7X6p2BWQQZhULnQPejBOH0xliHzF2aZUj1GEzoqjYoP8DKWzgY
         pcuSu0OK6Qj6gByxv7JBcyC3j+UePM+wzaQ8VU2j96leZrPHDQbdP1JyieSMTv7exa93
         NHFvn3CXULmcibJ7jwk4Ui+bLghh0vt85nuWyQv8+GkD0sycYlHxYeQaetfrqRWgc/yH
         OekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519668; x=1775124468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dnMavv9VcWVUyZA6Ex4ByNZK75MDVF8digB1PwkBNzg=;
        b=bxBoC8DtAd0y03+T90eCH2nKqRr14JXjw5yyFCJ0CIE62miptzBih7vOBi6U6vjCDd
         9LOIVeTnoEdQzczp4WhSSR4jpqCJoel581B+m/wcyCW1eGpbwSaoffS+BeLvFKfKSCgN
         1w/Ns8uXjZlQ0h+In5oo8AXYrrMrSJG/gsT1nf6EfWElYdGpEPbDE72KAkmaUCCRx5+C
         a55GbZ2WBMB+pGZNSPKrgGj5pmUSCGg10zfM2jdL6/GvEvFbWPRL3IPI1RoTff3hXw0k
         91QgZH2TxfIV7bb1g63APBfanvDBBo6e4pYrIxW0IKo7xO4aA6Z2VVwaDHKZcyTEMEJ3
         KQjg==
X-Forwarded-Encrypted: i=1; AJvYcCWzpJEu5Qa8tWhbsmXPhq6INXAZPDwqEqtAWW/UAB7+lsyOCuSeMgQO7AgSB7wxz+NBCLAR9tlaMq26pZG5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/W5IeYziMvJt3ZZ32SbfArMSlVf3fkKdfSBl5aAzurTs4jrR7
	d0u9wuKDXh9m36W+qcZn3IsAW9EisQ8zG6daN+mwiSDZO3t7npfTU7AvsyZtEb7Xq4SxJLDdx2a
	nNtdHOO8nQw2jpdjS3LmAZAnquI8PxgIJRuJvVGrRtBfZkRdaYJ9MwI4Vd0WpPgkMmQJuUxAZSU
	CJcL1P55DQaMj3x92DC/p8tDXe+c2RNtrMBGBL8hWy7b0=
X-Gm-Gg: ATEYQzzPvyr1NbW4HJwgrh1Y0+GSsWpS4v4liEiSsCRBfRV/ml0SrwX8Nqnik1SXokS
	lGxxytHYX3dMEIiBMmxSzSezV+huI3480e/AORbAsXiB+hgfze1R3+16s6chG4Qu3bziuu4xr5i
	JL4FlEmpsQ4p0iwv8fzgdviWW18CW18HIxpcMW358nP/CvYwsSUOj4Yny6hRcwgyVFbHi1SGg/d
	j9oBqE=
X-Received: by 2002:a05:6214:400b:b0:89c:da4d:de26 with SMTP id 6a1803df08f44-89cda4ddf32mr20561326d6.17.1774519668527;
        Thu, 26 Mar 2026 03:07:48 -0700 (PDT)
X-Received: by 2002:a05:6214:400b:b0:89c:da4d:de26 with SMTP id
 6a1803df08f44-89cda4ddf32mr20561006d6.17.1774519668124; Thu, 26 Mar 2026
 03:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
 <20260318040644.3591478-2-swati.agarwal@oss.qualcomm.com> <20260318-devious-spider-of-endurance-ede46f@quoll>
In-Reply-To: <20260318-devious-spider-of-endurance-ede46f@quoll>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 15:37:36 +0530
X-Gm-Features: AQROBzDyOqDscpM1Qp598tIiy0z_Urr2uTYFmuTrlyekpsKSj5Jbxn8BdIURSw4
Message-ID: <CAHz4bYsUAojfB3BCHVoc8PMQBrjme6grdEnkxu7KhTQ+sxOf0A@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: usb: Add binding for Genesys Logic
 GL3590 hub
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: W_JTzWJvnP54LwCu1Kx3OZ1GwijM5zOk
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c50575 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yKxla6SPEuOvPVJYePEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: W_JTzWJvnP54LwCu1Kx3OZ1GwijM5zOk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3MCBTYWx0ZWRfX2lrdw55xjaHo
 Nv43RkwB2LTVn2t6Stcm+t1ikQHjiDUkbNvysp44g48XxBqmImHw4WkWlW6185mcDFauHFbxU37
 Ioc4t//ujm7w2JObMytxiIbJj4xtUYOy8PE9pL1Tvs4UM/CLebEMPZb0xW8ckV+3NWDrxCoGWQW
 ZwsNOj32BwdcDZnXPHVEH4lZyNTPkTSQ5AXSOM95E+NFser/aYBaElkpZCNBvrvnegzTXYZg7bm
 Uu5AEwuyZUBLyzNrZfZrJURVrdz2Nus6i6ucSHR6V9HaIXkH6VDU2qKEDAlJ7OmaiqitpeiTPXV
 m1+VSybysl1yIPVcZSyQiiTTxkdsS7HFdfpey8SnURUutFfEfJ1Agobc+9B/ix4O8mPFEhgz4pb
 6+fFJwviwgWO4WA0ZA1TdcSsAir5jrp3UN6KPF+xWJK9sU4c3dfEJLEWSP0fN4VA/3oQp5/1gWT
 fkSm5lEBjBK5nC5EoEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260070
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100077-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,bootlin.com:url,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C81A533325E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Wed, Mar 18, 2026 at 09:36:41AM +0530, Swati Agarwal wrote:
>
> A nit, subject: drop second/last, redundant "binding fir". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L18
>
> >    reg: true
> > @@ -26,6 +27,10 @@ properties:
> >      description:
> >        The regulator that provides 3.3V or 5.0V core power to the hub.
> >
> > +  vdd12-supply:
> > +    description:
> > +      The regulator that provides 1.2V power to the hub.
> > +
> >    peer-hub: true
> >
> >    ports:
> > @@ -69,6 +74,17 @@ allOf:
> >          peer-hub: true
> >          vdd-supply: true
>
> Here and in other cases you forgot to forbid new property (: false).
Hi Krysztof,
My v5 patch series address this thing as follows:-
https://lore.kernel.org/all/20260122092852.887624-2-swati.agarwal@oss.qualc=
omm.com/

But as per feedback from Rob on v4 and v5 series, i address it as per
his comment.

https://lore.kernel.org/all/20260122170651.GA2632938-robh@kernel.org/#t
https://lore.kernel.org/all/20260121022449.GA1804139-robh@kernel.org/#t

Let me know how we should proceed further on this @Rob Herring
@Krzysztof Kozlowski .

Regards,
Swati

