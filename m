Return-Path: <linux-arm-msm+bounces-114285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jjwBJ0qBO2rQYwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:03:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A30696BBFFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:03:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HTiRQBm5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AJb3129g;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114285-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114285-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A86B3020A82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DB430F548;
	Wed, 24 Jun 2026 07:02:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B196635AC00
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:02:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284546; cv=pass; b=VvCRXG/tm+kchh2nSnD36iDH2iZ8JWG4dyRxiQBAVKn1HhwjMHwBTssC6VxMPi+6l4d8QWpMWmHD1C4OckIZS5P+Ps0lSbnwjL76+hRnZgyR37qqjkYnyWdBGzwzbvPXaPzteeZ0vqmttnx36Ys/CpQjX1uv9CQrkpgoPWPTWg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284546; c=relaxed/simple;
	bh=Vk/Kr0B59WlWxBhNqn1ygNxweI0JfOjyXzEGj92jtNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIVNTvzgYatH6sbaZRmXdfVcxkRNvAAEDsgB5ZLyg5UmsZ63Lb60OrgRJupB+XzO44/5N9OHt4WJ+VEMYBSyUGa8pfhB2DfBYTncEPTt3wZ2Td1MUXWAfjDimBycxSbG1n4nqrpVoKdVJZ0crk63FboM2hmDJ1QezX8stvyB64o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTiRQBm5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJb3129g; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uEfI2555751
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ayS7d6aooCn+sbxrkdiWnDLcNGrduTqUOe0t8xR3R+4=; b=HTiRQBm5PB2iUwH8
	C6fNfW6biBsHlSRwBOlu4LfYafZEXoLjGRTSo8ZnjGX24S0nn2sAPHY0WZy+54Qq
	MWNn2HKYuGPhydIStlXtjk1vdqPZQSu2008vtU/pRv+9h8T0XDnsAdOq3x3VELJQ
	Ughtq8T6tY7ac91AV1Zjli0tu4ce9oloGScCdpsp5l5Y7c0qPDFNlgg0e21S884r
	69IwU4/8NZZyn5JtPx/GjRe2YddN17MSVUTNRavh4xagqWJapS58a7yYZxFQKwCt
	1YGaeo4E3+7bsluUpJNRk5bN7AkrTbxtlXpER8yyxiWV53LhhCe0ayWFscGVeUVq
	y6tpMw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0996g93v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:02:23 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7f5b54da461so17519177b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 00:02:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782284543; cv=none;
        d=google.com; s=arc-20240605;
        b=CDtI2HcfKP7348ppdno3l010az06GoLIv9NGWQdX9360wYnFCMZs0Fx8/g+GtDdCHY
         6GCjNM5GUvhvj9dLPq1YFglCStOIL2ChKIodvCWWb/uyhRC0o4CoD2G/19sqhkyuMxwr
         8/MmopvV+YVleF1/VhUcROjbpUm1LUwQ9ZIX3tqU+sUCp9IR438UI4eNQgs8l1rk/mTo
         VQauzmV/ELlencjtFR+Lk/oYHmiBcdCRTyvwpvwmlRyLJmbyF8R6f5wGW5kvEAulvrZQ
         SJ1/R2KhLq73dyLZ4XrQflMXIgiR5qu38Od7oZiAt4sPmxAM5yR2Ri257t/Vd6SdYtSv
         5wUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ayS7d6aooCn+sbxrkdiWnDLcNGrduTqUOe0t8xR3R+4=;
        fh=PvUDzT4LvQpUOMJRt05pAD+YApin5V0n5NkZIqW3vKo=;
        b=NkUtWLJvunMrovELbY9Rb0NvoCszKsbNH1UK2+pUxyKKnuPIxqwrymVCjUggDpsrjr
         BqboCxkklUkHJqoFWrmu91CUOui79VOZa9HWU/3Li+D6drAUbdluoGnktAg6tkVwCgYp
         5h8+g1KdHuIKCrppqunqpCrpBT3Fs8u3gkFGgWBC1axm/9FbQLiXH3pkZLNhrot1L6+g
         UmAdCo9gTQQc+jYLJ544uxXrSS12emShHSygywQJ6WoNLUcXyFbup+1Im/VFexGQJo9g
         O0ncBC3vn64EZH0UeMhwh8G249AW4NHBUuQTOG4rZH+xuwg5/Vlue2zlONpcTkjgTceh
         XxJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782284543; x=1782889343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayS7d6aooCn+sbxrkdiWnDLcNGrduTqUOe0t8xR3R+4=;
        b=AJb3129gZdUYGVqkDeotV1ud8AgVH/9sw9vSpbxJdaFvAfJpGNhFPHNJh0CPVa8KN/
         tOTdkcXBbXwPW5n7RXM+v+iMiwQ4w1xsy8cGWXl+L42y9wsMCLVnJlffHMbwDZ3cNxzu
         zOdC+/dT5TWl+TqoDHUxmAk4GEtjTrbTfYtNxR/f6lkoSfc7YI+R0fFvpi19vIVgtjRt
         kGFbdrxLljHjbFSFEm/zjlnT8icAxB0lfid6S0SqdOyGqQLeZtjfs9VCKULddY3lsOFi
         p+CVYtBcm0UXEQMDRaEvdo2VIACiqYnxDyzWMnwRQqs/yC328pq0cqMG7S+DmWVAUy0u
         Znzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284543; x=1782889343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ayS7d6aooCn+sbxrkdiWnDLcNGrduTqUOe0t8xR3R+4=;
        b=l+2AvDklk84Wu2eFcPkM34/44z5NHs25+EgILeGwc2WSQhBvu8fblBvcrlZidN+Xao
         +4swOOzAnAyvQrFB4VHFS3FHFaEtHbX46nVU26jj8c9A7rJ2+LRAEK55gGm89z2DDFwo
         /O/wtKythFvJ5lb4KOTLzfaAOwRmKA+LLc95H+HH35o7TbJkUTyM8QgmrRdoC+cMPnDk
         fyns8pAH0bYeDmpcZdf5iKpJwPpVdCICLa11DYYRnZDoNfivNcqt4kBsAKSHBk9YWx1E
         LObpa9b4BC6Hhk224Oh8UknX5sqphYM/d/yrSSden4S4Eqv/R1Uxlz92WE9dSl1Uslp9
         LOZA==
X-Forwarded-Encrypted: i=1; AHgh+RrQmQ7WxZKezfcMdbdYfGMFOnnWjmI+j8qFi5Mb50XY4AXAISnUaf3n5oobXZPBJUABYYZ1eTHNFGEdz/Qa@vger.kernel.org
X-Gm-Message-State: AOJu0YxU7JXISh4c2OWIAVaJKx7sL1vK4nVD1Y9lc/2WBeHaxS+kr39r
	Hgx0OziChc9nuTqSoPXMn10iXAr0JjTBCdEoYqKtGLa8w+ERZ3iWOrkFb/RljWWuU+1iOfzNYGh
	SWBCL2bv1VPNVPXsoDMtAfTh+E80N6nfWyfTGuDb3WvCsZ/Go89Cm2NArsTh7bVgKnukQYtqKD9
	mV2neUuRxqVTalCdNkIAZezrv8aUUSOT1z12EgEgnap7Q=
X-Gm-Gg: AfdE7cmEsU/xFzj4RJkdP6z8XsCb2oEDDnLwQbwsU9gTExEgTpyVOFStt5dsekJVUVv
	S3lii7+Sn35kkVrrh21C80koD7gy+mrpGVtaoZqnsksiJyPbN8+FG9nGBmVaXXV/yinqEXtvXhH
	XkKW9klDFbC6veRzuQ1oYcbAEk9vAialH1bJngf/DmPMefpDQhY8AkAKp4+4jNH5DuvQIt
X-Received: by 2002:a05:690c:6908:b0:7ff:2f80:ef66 with SMTP id 00721157ae682-807ef727bbbmr20486767b3.41.1782284542911;
        Wed, 24 Jun 2026 00:02:22 -0700 (PDT)
X-Received: by 2002:a05:690c:6908:b0:7ff:2f80:ef66 with SMTP id
 00721157ae682-807ef727bbbmr20486417b3.41.1782284542299; Wed, 24 Jun 2026
 00:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com> <a7852d0b-10ee-42ec-b966-28d3f2066bb1@kernel.org>
In-Reply-To: <a7852d0b-10ee-42ec-b966-28d3f2066bb1@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 12:32:10 +0530
X-Gm-Features: AVVi8CeK6XPpyfVlMUz11jEi2RpO6-1U1UJ--fwyTAgiu4KrQOHpgFt0-DV2pw4
Message-ID: <CAC-tS8C6+Za4eZbmDVE2jWK53oi2dhtU5=goTxjhBLUM4KxxTg@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: TktkQXWd7_nJVajP-6-w1RPlbMdmytDE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1NiBTYWx0ZWRfX27Ycp0Ctp93U
 aucX6Ody/LYhaCThGo4WB2e5nVZsm+9dV+5uoK8kCpAD8XVy2VFz/9i98NgG9EUkpMY1YTKGRxX
 +P16WmOctFueUzqVnaIJsWHuhd7ZX2Y=
X-Proofpoint-ORIG-GUID: TktkQXWd7_nJVajP-6-w1RPlbMdmytDE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1NiBTYWx0ZWRfX9L2AJl7Uwmvz
 55yvqZ78MbHHyGLXwbUXubaKl0nHyLIuKabTEM9sHMCDp+Hl5H7bG3DkZK9MAJ0ShIsAG/JwElv
 3pObuSMYVcAMXtYEUtJNoi60jYWJXm4wqpEXBAcmbgNRCPPHGHRZPWurDwMAlGv+RTEJiGVIE16
 Hg71VFOw9XiE/dgI12J8v0eVJbb9ufrKaO96lfe7ljOV7C43IsSDl1XON2+bu4YBWBdB97dLmaO
 T1DLCBtTLqk4kJKWDicPZOz9KGxCgb6osraP2sBXDasor3jDJGITb4H3ySwwMVXI6OH/VR+cMlx
 mX+DuLyCICBFy2cirAWmrx0+hE7Im7mv0ppgKOuDT5XKrenHj1LgbMeB0MgE91+Ne6Ee4CKXODT
 VOepeDxml7DbNH7x0ZOW2DVUT0l7Dg==
X-Authority-Analysis: v=2.4 cv=Tv/WQjXh c=1 sm=1 tr=0 ts=6a3b80ff cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=zsM4kEk9bMrbwn1mo7gA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114285-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,bootlin.com:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A30696BBFFA

On Fri, Jun 5, 2026 at 4:16=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/06/2026 12:37, Harendra Gautam wrote:
> > Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DA=
I
> > controller used on the Shikra audio platform.
> >
> > QAIF moves PCM data between system memory and external serial audio
> > interfaces through the AIF path, and between memory and the internal Bo=
lero
> > digital codec through the CIF path. The controller needs a binding so
> > platform Devicetree files can describe its MMIO region, DMA IOMMU strea=
m,
> > clocks, interrupt, DAI cells and per-interface AIF configuration.
> >
> > Describe the single register region, one EE interrupt, the required GCC
> > LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@=
N'
> > child nodes used for static PCM, TDM or MI2S configuration.
> >
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L18
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
>
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/sound/qcom,qaif.yaml  | 353 ++++++++++++++++++
> >  1 file changed, 353 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif.y=
aml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif.yaml b/D=
ocumentation/devicetree/bindings/sound/qcom,qaif.yaml
> > new file mode 100644
> > index 000000000000..5b385e05a650
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,qaif.yaml
>
> Filename must match compatible.
Sure, Will correct in next patch.
>
> > @@ -0,0 +1,361 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/qcom,qaif.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Audio Interface (QAIF) CPU DAI Controller
> > +
> > +maintainers:
> > +  - Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > +
> > +description:
> > +  |
> > +  The Qualcomm Audio Interface (QAIF) is a fully configurable DMA-base=
d
> > +  audio subsystem controller. It serialises and deserialises PCM audio
> > +  between system memory and external serial audio peripherals (PCM, TD=
M,
> > +  I2S, MI2S) through the AIF path, and transfers parallel audio betwee=
n
> > +  memory and an internal WCD codec through the CIF path.
> > +
> > +  AIF (Audio Interface): up to 13 multi-lane Unified Audio Interfaces,
> > +  each supporting up to 8 independent data lanes. Each lane is individ=
ually
> > +  configurable as TX (output/speaker) or RX (input/mic). All lanes of =
an
> > +  interface share a single bit clock and frame sync. Supported modes a=
re
> > +  PCM (short/long sync), TDM, and MI2S (stereo/mono). Per-interface
> > +  configuration includes sync source (master/slave), sync mode, sync d=
elay,
> > +  sync inversion, slot width (8/16/24/32-bit), sample width, active sl=
ot
> > +  masks (up to 32 slots), bits-per-lane frame size, lane enable/direct=
ion
> > +  masks, loopback, output-enable control, and full-cycle path support =
for
> > +  long chip-to-chip connections.
> > +
> > +  CIF (Codec Interface): up to 32 RDDMA (playback) and 32 WRDMA (captu=
re)
> > +  channels connecting to an internal codec over a parallel bus. Each c=
hannel
> > +  supports active-channel enable mask (up to 16 channels), frame-sync
> > +  selection, frame-sync delay, frame-sync output gating, dynamic clock
> > +  gating, and 16-bit packing/unpacking.
> > +
> > +  Note on RX/TX naming convention: in QAIF, RX refers to the capture p=
ath
> > +  (audio received from the interface into memory) and TX refers to the
> > +  playback path (audio transmitted from memory to the interface). This
> > +  applies to both AIF lane directions and CIF slot/mask properties.
> > +
> > +  DMA engine: RDDMA fetches audio from DDR/TCM/LPM into a shared SRAM
> > +  latency buffer (SHRAM) and drains it to the interface. WRDMA collect=
s
> > +  data from the interface into SHRAM and writes it to memory. Each DMA
> > +  owns a private SHRAM region defined by start address and length regi=
sters.
> > +  Burst sizes of 1/2/4/8/16 beats (64-bit) are supported with up to 4
> > +  outstanding transactions per DMA. Two QSB master ports (QXM0 for TCM=
,
> > +  QXM1 for DDR/LPM) provide the memory interface.
> > +
> > +  Resources are partitioned among up to 5 Execution Engines (EEs) via
> > +  EE map registers. Each EE owns a set of DMAs, audio interfaces, and
> > +  interface groups, and receives its own independent interrupt output.
> > +  The interrupt hierarchy has a two-level structure: a summary registe=
r
> > +  identifies the event class (DMA period, underflow/overflow, error
> > +  response, audio interface underflow/overflow, group done, rate detec=
tor,
> > +  VFR), and per-resource status registers identify the specific channe=
l.
> > +
> > +  Interface grouping (bonding) allows up to 6 groups of audio and code=
c
> > +  interfaces to start synchronously and align their DMA period interru=
pts
> > +  within half a frame duration using the RDDMA padding feature.
> > +
> > +  Two rate detector blocks measure the frequency of incoming frame syn=
c or
> > +  word select signals and generate interrupts on rate change, undetect=
ed
> > +  rate, or sync timeout.
> > +
> > +  Block diagram::
> > +
> > +    System Memory (DDR / LPM / TCM)
> > +    +---------------------------------+
> > +    |  Circular Buffers (ping-pong)   |
> > +    +----------+----------+-----------+
> > +               |          ^
> > +         64-bit AXI  64-bit AXI
> > +               |          |
> > +    +----------v----------+-----------+
> > +    |        QSB Master Ports         |
> > +    |  +----------+  +----------+     |
> > +    |  |   QXM0   |  |   QXM1   |     |
> > +    |  +----+-----+  +-----+----+     |
> > +    +-------|--------------|----------+
> > +            |              |
> > +    +-------v--------------v----------+
> > +    |         Shared RAM (SHRAM)       |
> > +    |  +------------+  +------------+ |
> > +    |  | QXM0 Read  |  | QXM0 Write | |
> > +    |  | SHRAM      |  | SHRAM      | |
> > +    |  +------------+  +------------+ |
> > +    |  +------------+  +------------+ |
> > +    |  | QXM1 Read  |  | QXM1 Write | |
> > +    |  | SHRAM      |  | SHRAM      | |
> > +    |  +------------+  +------------+ |
> > +    +---+--------+--------+-------+---+
> > +        |        |        |       |
> > +    +---v--+  +--v---+ +--v---+ +-v----+
> > +    |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
> > +    | AIF  |  | CIF  | | AIF  | | CIF  |
> > +    |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
> > +    +--+---+  +--+---+ +--+---+ +-+----+
> > +       |         |       ^          ^
> > +       | TX      | TX    | RX       | RX
> > +       v         v       |          |
> > +    +--+--------------------+  +----+----------+
> > +    |  Unified Audio Intf   |  | Codec DMA     |
> > +    |  (AIF 0..12)          |  | Interface     |
> > +    |                       |  | (CIF)         |
> > +    |  AUD_INTFa block:     |  |               |
> > +    |  - Serializer (TX)    |  | RDDMA: DDR -> |
> > +    |  - De-serializer (RX) |  |   internal    |
> > +    |  - Sync gen/detect    |  |   codec       |
> > +    |  - Up to 8 data lanes |  | WRDMA: codec  |
> > +    |  - PCM / TDM / MI2S   |  |   -> DDR      |
> > +    |  - Near Pad Logic     |  | Up to 16 ch   |
> > +    +--+--------------------+  +----+----------+
> > +       |  Lane 0..7 (TX/RX)       |  Parallel bus
> > +       |  Bit clk + Frame sync    |  + Frame sync
> > +       v                          v
> > +    +--+--------+          +------+------+
> > +    | External  |          | Internal    |
> > +    | Serial    |          | Digital     |
> > +    | Peripherals|         | Codec       |
> > +    | (PCM/TDM/ |          | (Bolero/    |
> > +    |  MI2S)    |          |  WCD)       |
> > +    +-----------+          +-------------+
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,shikra-qaif-cpu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 15
>
> Drop
Sure, Will correct in next patch.
>
> > +    maxItems: 15
> > +
> > +  clock-names:
> > +    items:
> > +      - const: lpass_config_clk
> > +      - const: lpass_core_axim_clk
> > +      - const: aud_dma_clk
> > +      - const: aud_dma_mem_clk
> > +      - const: bus_clk
> > +      - const: aif_if0_ebit_clk
> > +      - const: aif_if0_ibit_clk
> > +      - const: aif_if1_ebit_clk
> > +      - const: aif_if1_ibit_clk
> > +      - const: aif_if2_ebit_clk
> > +      - const: aif_if2_ibit_clk
> > +      - const: aif_if3_ebit_clk
> > +      - const: aif_if3_ibit_clk
> > +      - const: ext_mclka_clk
> > +      - const: ext_mclkb_clk
>
> Drop _clk everywhere
Sure, Will correct in next patch.
>
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  '#sound-dai-cells':
> > +    const: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  status: true
>
> Please do not invent own style. Is there any binding with something like
> that?
>
> I finish here. Why? Because you sent DIFFERENT binding to internal
> review. Then you made completely confusing changes and never reviewed it
> internally again.
>
> The internal review which Qualcomm implemented is for purpose of not
> wasting community time on reviewing trivialities. You bypassing this and
> sending us the trivialities feels like that wasting time is okay?
>
> No, it is not okay.
>
> Best regards,
> Krzysztof

