Return-Path: <linux-arm-msm+bounces-113944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tMpnD67mOGprjwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:39:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9336AD4EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:39:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kVCoqM4i;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PDOr2BaW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113944-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113944-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54A5A302B75F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C538436DA03;
	Mon, 22 Jun 2026 07:38:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1003655CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:38:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113895; cv=none; b=PTEW9yUcZcVOONlIMmkIh6pFWy/QLVd3EB0Qh3122YBi0eq9UF9qytM9dedXK79bjXukyurHmQLKUqflPmOSvCrARwRqw1o2ZRKWNDqw9t+UBNpH/fjF9Q27W5+vXOR448k5YHjmY9cLDNHdBdbOJgi3h4svVX3K29WecDKaSN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113895; c=relaxed/simple;
	bh=BS9AQVWy8TOmpnea/+4LmE8sR3+CCphPYN6ZLhsapag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbZtRunFnkpNFcvZyWDxsTpnUIP+qYlB5PpUQITffDFs1qCtn1FbAf82cSq+TfASfdev4YqiXXR2sRnSqm2jUQnyyDQ1XlbGXdEpIhT9hFD08X3mgSP4JeUZOx1BL8PdOx7T2558ry9IGTeLMqYZC3lshlz7iwqDokZ0NmtW0xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVCoqM4i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDOr2BaW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59BpN3850472
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M4jwyS0eGc3NAZijuRwJeMg7
	4OO8FYkEkOVQqhLxmf0=; b=kVCoqM4iNHQz3go2qKGZLbB3EcI7Xyc/5KnZTPHv
	8gpyeqFc7pXuVPF1Z04D9VJ2ZvY2vPam4tmE9nt5x+YBVfgeT2y8ywRoKiT0pPiP
	8Q75dFj6vupc9aBAFh/JORxAH9QHTCJGxLxLxT3wYja39Lmsohpwyx2F7cku2MgD
	zpZOzv5FA5P881fLpZAlEpjaep6RYKsw3WkqCktmdEUnRTzzA3J++VwUonvY72yF
	3o53NvLie+Jl7FYbHm/ejC+SGS2q/MerWV66paukdJjyueNkAP9M3x1T9fKxvWGQ
	rPldabPpEU8R63orQ5T2I3/j4il3KaRxDRzcXxIB3RD6LA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm5854sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:38:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f424d5bso2852419b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 00:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782113893; x=1782718693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M4jwyS0eGc3NAZijuRwJeMg74OO8FYkEkOVQqhLxmf0=;
        b=PDOr2BaW8eWC4jVyGukIUWNn4iIwJla7QfIhDg9PSEECZkYDkSfLDRlO3bOAHWGyG8
         8b6Zr8hYpaDAC4k5zw8yNw1Wkaw0mlROcBFgOilv1TLVEMuq+MxBf//dAX0fG8XoPyu7
         rhmda0XDYvowEnmTeQc5XGynQMBevoWNsVefsPwSG+0WiUTSusZcDjGP+5wHC+UndTUi
         MnNwoTL/Ty9tlrjlhK8iv3x/ghc2ysfIeokgIhbPanyt6i05U+KYiiB/f+c0ZK1SBD3f
         jpvSaj9CSyA5j/JitK47y8Thp0V83MtUC1rUC2Bb4lqWeyAiZ6nHfSwrTqfwxBvIq+5p
         AkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782113893; x=1782718693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4jwyS0eGc3NAZijuRwJeMg74OO8FYkEkOVQqhLxmf0=;
        b=Yvz71a/2cUzN7VPIRyj29GvTlrHQWRj6OHAXVVPU756BQXo79aNc25gElLtfw2r1PP
         vegs0Hnv0p73ZrTFuEBwTqbvlksf7zZpAUMeeWPlj8lEfAhqGlkrRKHTyFuByMc2mwoN
         K0PKvlmbnQxGEIvi6REX46Xa/MqnQyG6rpShIur9eds0Gnfuq1PCTL6je1m4ATubBWN4
         A7mi9RyOPsmIwLJFT6UDzICgRFKH8YZZ/ZI/K2wFel9HxqNBX1IDByAba9PDCWTPWtyD
         G0iK61oRMDaYFPIW0s992yziV+Y/utfNBvFaLAu6EhZyddAk7H8ltl1PmdYWFb/fpRq4
         HFJA==
X-Forwarded-Encrypted: i=1; AFNElJ/3chyKxaTSG5qjoGnmL7rSEpVuv773fZKWoC96FkVAo3S8geJ7QYUVIv/kCXHKTZrs0sCqK9sde6unrIQP@vger.kernel.org
X-Gm-Message-State: AOJu0YxP6KxYqAEspUtUcTAtXCTfTaK7tl+YSseWNO1PsB5O4xd0/TVa
	kxCes6lmMOVVOo3EhGkh8v8WzgeYsoXOyb4HhUKHNRVOXTL4kC2jRFhTw4u/CD/BX8lMKarSqH0
	7kjHcYkW/0QeSTTNiKHjX50bslukAEOQvJUMljgXRgBcenj+zz8NDZf8A2JZYhbVvCSLq
X-Gm-Gg: AfdE7cl6m6q1gHXdcW1tCG/vNlB5XOdI5q1UzqI2JpTFfb3cd7+2buuqFWbpnZDvVjj
	hVutoRN53HwJWB2vhZJKTHsX64NHkrVvEqehohIQv0Ps3VhnPF0e78q7SE7pnrTmhqqZII4/WrP
	SRE2zwyV8RJANJdRsLXiUQ/rwBVIYIbAfMwgnDu431wD3IYUAKaFtTL6Q8h/hNEW/ZQraKtmEZ/
	Dg64a4R66ofJwctBZ7/uW6RlsEaYT7Ong3TnQc9lxUnwcQfd2Y5WCX3GYHsrCeu//yY9xHIJZNf
	VPnqTbF3DJ8BwJJ82yKKmKU2DgeqLK+V+C/IKbQvi1QAiszx8PPC1G1obF0qNNYkPN+N/1PHbRl
	x0VKNSct13I8QlyJD2LPvY34iRya0RgK3KEMYaTBRJIwjNsdB
X-Received: by 2002:a05:6a00:1ad2:b0:838:a46:ce96 with SMTP id d2e1a72fcca58-8455087235amr14531881b3a.27.1782113893148;
        Mon, 22 Jun 2026 00:38:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ad2:b0:838:a46:ce96 with SMTP id d2e1a72fcca58-8455087235amr14531837b3a.27.1782113892422;
        Mon, 22 Jun 2026 00:38:12 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e745besm6303006b3a.28.2026.06.22.00.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 00:38:12 -0700 (PDT)
Date: Mon, 22 Jun 2026 13:08:04 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Message-ID: <ajjmXMKdWzae5qqk@hu-arakshit-hyd.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
 <d8fd7888-cf7d-47e2-8e77-3ba705c88502@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8fd7888-cf7d-47e2-8e77-3ba705c88502@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IzE3GvRgtDkxh-1LU1cpC1wIUOnpRyw_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA3NCBTYWx0ZWRfX4SogEZ4pZjI5
 jFLoGfe35JORXbqHgbTB4rUrWPIllczZQVDv9i/CQtZsd+whvzBuRWisCA8IPqEsAyQGcnGOHnU
 dhXC9IDP1M4/T0+hGyoUEROpp41PYWM=
X-Proofpoint-GUID: IzE3GvRgtDkxh-1LU1cpC1wIUOnpRyw_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA3NCBTYWx0ZWRfX8TIlVcZN8pV4
 JKns07IYqniAv4Gfh4KU31M/dBJoTFkr+NXkF6tgih0Z8JBy3gsTmqRToOsycUfwUnSJ9UrTpyc
 MR7UpNqUWSS3cYqcZira2bMuYLlgj4eu48ydK/iemLAIIzIa7gLY66WDgEk9K80FMgYctQLVQY0
 i4zfKA7ipZdN7S5adsZM0xyAi4pmutLWSMV3RObZmwC/NQDz4FgA5BXePC/GPkOxjznB7tIQbMp
 Gt+g374Cfo4w3RTVi98HOJazNZuQwW+m113Cvq5fZHAG/R/Qw27KVZ999LoSG34SWEYWJEpI5xq
 u/sU7Cgv72JbNHL6gDsCUe2ZT1iF1QWhQZYggVdfc4jpMok989poGJIRp1dtbpNcRRfqd/apd3L
 bk2pK8PgskEH9gPYmMKbMcdqDSKxEhsuW8sBBuic4zoTr/Dop9jubboFzra4oFAxTWftTUo0NK5
 JDe6ZStJAQs1BK064dQ==
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a38e665 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FjpnKfaMezcxXxbuv6AA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113944-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,hu-arakshit-hyd.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A9336AD4EC

On Thu, Jun 18, 2026 at 03:04:57PM +0200, Konrad Dybcio wrote:
> On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> > Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> > an optional OPP-table.
> > 
> > Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
> > platform.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> > index a1b6e6211b84d0d5008231c55613a0ccd61b9450..d9298d8b7874b8669b2cded2a28a99dce6eadbda 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> > @@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
> >  			clock-names = "core",
> >  				      "iface";
> >  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> > +
> > +			operating-points-v2 = <&ice_opp_table>;
> > +
> > +			ice_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-75000000 {
> > +					opp-hz = /bits/ 64 <75000000>;
> > +					required-opps = <&rpmhpd_opp_svs_l1>;
> > +				};
> > +
> > +				opp-201600000 {
> > +					opp-hz = /bits/ 64 <201600000>;
> > +					required-opps = <&rpmhpd_opp_svs_l1>;
> > +				};
> 
> Since 75 MHz and 201.6 Mhz require the same power level, is the former
> OPP any useful?

Yes, both use the same power requirements. However recommended by the ICE team,
the DT should include all opp/freq supported by the hardware.

Abhinaba Rakshit

