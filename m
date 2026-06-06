Return-Path: <linux-arm-msm+bounces-111521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k0G2Mx8oJGre3gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 16:01:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E34A64DB02
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 16:01:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JPXQSakS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W22Mkk+h;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111521-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111521-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B7263001A73
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 14:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B241718C933;
	Sat,  6 Jun 2026 14:00:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDCA175A69
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 14:00:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780754457; cv=pass; b=tdShs1CgBp2m/tSv052Zg0iG2+sihwpAzBPPKrm2WfwEMh/VhIrcul19eFtMkErr6Rz5NTqv9QBAT4Eu1TqdXFvraFxaOOq3ejApkfb7lVOH1VOqSbQbA2qS4aoUHKZA5cckSWMQYrnw1xJ1lIfc+Cp8sIFHa0vbhniuL1+zztM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780754457; c=relaxed/simple;
	bh=o/jLftLru5JwMQVXS/FUWMZA0RWydIgmyeSD5jsebN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XlDhkw5jRb2HBDW8XUsYFrdopZ1MFy7PftbVEOyhibq9gX+kOJ3U6y5x3o43vvYUuhp4K1+M1zX2tNpS9B/dpmZAI4NWHuoSXomYPr+4IHuDGuHrjhCdaNPiojWt3DLkBUzZhzBKQAToOJ9xWjjxUFZMDaErNjWkDcrB+l9iRjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPXQSakS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W22Mkk+h; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGma61296028
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 14:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/jLftLru5JwMQVXS/FUWMZA0RWydIgmyeSD5jsebN8=; b=JPXQSakS+MvI+aNT
	LKrGinXT5XGqii/VdctQAPJbqKGrKAmGFy94cTaxXG8ZGWqyPgShYRI2ctVH6dh4
	Wr9hNoptjn6trp3EW3iVnQpsfwfpIVBcZkrxbFshMsEENdvKwRZBeSzGJE7gWS7q
	1xRM11t3SUXBeS7JjrIJOF7J+JDxgmmMah+sGptyb3JDIt8jcYaYC8dKWAPu+NHY
	wD3l8HZ1SeeGgGEseg5UlQCHGRzRyWZNuqRYESmUInq7D3PVQdLttSWi30Z3BhxU
	KaNYO1XaC3gVaySQWGBu8iixlBts/BjBlP8sWd6GoMSINCeX9lhHGU8TgvR88cme
	MHV3dg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3hny7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 14:00:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9158f2c4b55so595261985a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 07:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780754455; cv=none;
        d=google.com; s=arc-20240605;
        b=EGDPivbctoB0u38Qu+fhD8LXMigRFgY+ZfXG3XjMd61nLEAWXtHlFcExI2v49Ig6sY
         TkCev0NG/F6m9qI2v+rD3ZnXpSeKrOsXwwvzfthU1Nrnr8iEpjy0w6E5FOBUAkSEkndi
         BdIJYUZMkqHakD2FYzi0qR34/lnlwRc1Xfvg+1jw6iMNGxnyj2H4Bt+ah62hOq3TySNN
         kfQXQ3ENqPQ8V1J+FS3kTG5Xl8db6AOeBmT36+JTKQmmi1aIpjoO0DotOb/lRNOrPR1/
         EL/aUxJY6FMmgIDHen3JBuVyJ9MP8UfylhhiYzjmkoDGTPlpH08DVi65OyJORjObKGvQ
         tV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o/jLftLru5JwMQVXS/FUWMZA0RWydIgmyeSD5jsebN8=;
        fh=KVIsy4FGKjbgTt7EAVIcHuKJv1APRUE3xDblJkiO50Y=;
        b=OV+YeO3gE1bpaae2dv7XNRBoAK9me6CP6JKi+5TBau5H2GP/CoaGjT0Xwa6TIIdj+p
         cSBGeM2dxLNVNmtKvqvd380MKdTd/PKd9+P0v5lmddKD/s2ECVkvJQlGUG+uPB7rq8u+
         IlOk7hREmLyxAv9EWW7MRiYxBR7rR/dq7dByDxIfOAUTCLyx3wKKbbdxfzRcoIfpb/xJ
         RIlEGOVlhi7zTptvPMKF74wFRf1hZSNTUSG+AXRKtQuuk2Rpr7D/WHxtsbNdbOsw2joH
         Xm0MMLyfXJuDuoMPhX12pm21GFyDBTzcmyW2LgPdEZ/6xX8JGFWAaOmSRuasSqIaqDcA
         IBJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780754455; x=1781359255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/jLftLru5JwMQVXS/FUWMZA0RWydIgmyeSD5jsebN8=;
        b=W22Mkk+hrKyINci+fQNg+KiaTZydue333kfBSjlCAnvK74bcot/fRqHYctIe0T6SqK
         RCs0o6J2ajaIBhRhmeg8VU6G5EhZJmuvvOOeL3l+bnb/Eq2xkEmr9C5t+YKr/M2zfdIf
         M9BOPSptoWaTtV8MsMTE2JKVieKptg3B2y+FPOxTpnP0H5BSqf7xTXbQwLRuWWu/Omhu
         KlXS1hHFhVtVyyw+AjBG1hLfjVQkXKAELAuo6KLiYCRFw9cncaiEkPVlrM2oX4s/vFSj
         HEnhhzpr8Cp7Xt2kvJchE2f/NRqe233OUGYF92pEezXNr2BFr2ATUm7j/xLqIzzzsBQT
         cR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780754455; x=1781359255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o/jLftLru5JwMQVXS/FUWMZA0RWydIgmyeSD5jsebN8=;
        b=p1ltoxPtuVmgHLIFfhhcJXyCrGn7LfKPSGI+SQrOaX+TOczdGUDz42TmC8bIE7sMUx
         1ItiSX26j3gxHyBGhDcdrUXQlirnH2YOffphP8q50wMc6bWSMPtV8LFsjpPChh7cRKOl
         LULvBFa3h5AVWYRzRjX4CV/meX6FS0pP9MBbXFM4IwTA/P8ushSP97e0sA1iWpqM3pDt
         SxYG2wLxxwAKZecoIglElIiRqYyhwlgm/bBUvrBbRhuxvwI9hABwZNkX5Uf6B7SbAR4z
         kGLcBKCNy4P4UVSyWeiKNM4t90jLsI8/RLNrrSMJ0OII4bpSZFTXlqm5ARaIL+hmCX/s
         a9bw==
X-Gm-Message-State: AOJu0Yz1b1nQbYp+qrilOKwaBvYZnzp1mYXgt3NLSSSE/to5C1OXifcp
	osQXCfKqyq/m5zAxwC90QcMo8UUfk05BZ5gj8oG8y5Xym1+kDQNhm8I0uu/RoLwbtQESV1v0j49
	mpsu/+pEer1GHjeDsDMP3Asn0GIO8WKxJOZGXv3W5b5sCXuWNAXbpXyUMrjeKoaXE45i3c0DCiC
	bjGFHjcgudYmsZ1x5l5vpzO7XWiL/UW4VuMlLsyVt1EgMxM2Tchbb/W7MR
X-Gm-Gg: Acq92OFQgM/+kj9HxI1b1a81gEDkZ2wdjWXcorL63kL/i1phs3esqrz6rVPRO7KF0cF
	t+n+SpNBPrudKXERCU+swbPs5uS6YMz7m3/Ne/B8FUvHIa70cqZkPKXSf/JXYXZMGyYQmpbvREd
	o2ZZmuT6NAu/0iVbdOZlJTXL+NqJiuPPjMOcBPq0GJvCNJnFVLnFSfcG2IL2ouHdtUJcGmjOEYi
	RcWS5MLKpEXCHrHUMt5uOokKNCtuS3UfNJ4vovEBh2cez1dRJk2QG+ryxiYipeH5OLMIm1gyYHU
	YK0AhthkXnMAeNb49psqbJdUa+1bMOUO
X-Received: by 2002:a05:620a:31a3:b0:915:83e2:3b97 with SMTP id af79cd13be357-915a9e0d02dmr1382596385a.58.1780754451461;
        Sat, 06 Jun 2026 07:00:51 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:915:83e2:3b97 with SMTP id
 af79cd13be357-915a9e0d02dmr1382549385a.58.1780754448764; Sat, 06 Jun 2026
 07:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603015958.1242255-1-qian.zhang@oss.qualcomm.com>
In-Reply-To: <20260603015958.1242255-1-qian.zhang@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 6 Jun 2026 16:00:38 +0200
X-Gm-Features: AVVi8Cdwpucsdxek_NSdtKb2Kz8nMFR5OUfI0v7GrC-4SlIlGL5v02UFlRZ87y8
Message-ID: <CAFEp6-0XDjuCNy=Eac94VQC6uzumeTyYPy1CYtozrADpC5D5sA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDE0MiBTYWx0ZWRfX8ceP345Z2Ljm
 CBNdiFzS+8OG59Yc3zvPAJX/lhZK9xWFYRJe7SaVxg+zTc473wdVwIxuZrTRAi3YcBO1meSXBFL
 duCUKZTqIIcv0hEGq6S/Dps4px4IsPIGQGP5IFFnRxdVKeIgJ7dTfCsZC6mvJJvov45SYW3pgJd
 uA5jpcRrEIXAyn6yyQFWQ0GbMgblVASZBv5FtoHhGZorDNHMxb7LFZK6o5s0dyTGUXfsrfpFGFt
 r3GhEJzmLaPSQpb0zHqJFSDkrBRdOUFbHdQd2YZhQxabnK2whw49I+QOrILjd+qK/d6QwAUP6YD
 UsAY15YCLHLiKNS4SdNzG3T4nvieGenx303nsitWp+/U/TC16ImDm1XjJ8EX0vFTgAja54mtUPF
 ZyRW0lnvGKkAFVKIwfFTyyLzNQEmRefn4xC2K7IKPlG3e+m/p+VRymgOHtt34Bhxaww2SQjdQ6L
 gDD5pDcfUL/Z3WNNHWA==
X-Proofpoint-ORIG-GUID: 8sjH7LOAWRHLWFdJN19NZ1IQ2vz1aqK9
X-Proofpoint-GUID: 8sjH7LOAWRHLWFdJN19NZ1IQ2vz1aqK9
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a242817 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Tt4NY6GeduoLECNWj4gA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060142
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111521-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qian.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E34A64DB02

Hi Qian,

On Wed, Jun 3, 2026 at 4:00=E2=80=AFAM Qian Zhang <qian.zhang@oss.qualcomm.=
com> wrote:
>
> Add support for the QCNFA725B M.2 module (WCN6855-based)
> connected to PCIe0 on the Arduino VENTUNO Q board:

This overlaps with another series that relies on the pwrseq-pcie-m2
and M.2 connector bindings for Wifi/Bluetooth:
https://lore.kernel.org/all/20260520-monza-wireless-v1-0-9f6942310653@oss.q=
ualcomm.com/

Now that this connector is available, I think we should use it for
this kind of module.

Regards,
Loic

