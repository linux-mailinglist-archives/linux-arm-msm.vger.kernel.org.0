Return-Path: <linux-arm-msm+bounces-114284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5L/vFpiAO2qhYwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:00:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B526BBF8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 09:00:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hR6Pnlln;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VpD5rwx0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114284-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114284-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 928243011766
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47957372EF7;
	Wed, 24 Jun 2026 07:00:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29EB38AC90
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:00:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284422; cv=pass; b=G69rhYmPlVVQuHKdR5bnq1UOa7wA2b/Y2SMi71GFMr8susn4DYcS+T3zkGgHKCOYYAIp2eqizRc3Xorp1pgjcdEcQlnSIoe3JlC6onQZ7ETzEE9rlfcxR9qCTSePzuEDe8av3gJHCjDN6dfxe9K+SNPWQ7qJa4kG0WEvMTnCMhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284422; c=relaxed/simple;
	bh=oPnXewy+StHDGXwtmPu4kj4a3Pu/agCuE4dOn+nwcWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iO2rWplVb5P89l/vLBTsM43JkhyMc5s8i2mARdfYcOO8R/vaEX/q2s/cvCCntRHMRtEe9rhcyUamQrmxB3ReUWkpihOjA3Ff1XgbyH20c5g2KqVGaQnLuHEJYxz5GrzPdYCvEsi86BNWRMz4HEJf1Eq5r9qGiHLHgh+4Vshi6h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hR6Pnlln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VpD5rwx0; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5txk32237373
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jo+tjDv7dD6J6AfSDYrRcLpY+LDm1i1herlYND0gQWk=; b=hR6Pnlln/3aTUja8
	to+PzjGWDGeLr0WRnKM0mB7YnxlMZ8PKIsUTckEloS6v1OaVBdYXSOHnd7R9dulg
	VSYAeqic7CkFAJB8tu/RVbJHXUaaUggiM2GcrGo5IOBaWXutVwRxpCI0lgekX93e
	QJU2PpQxpCCTTx0MA6gDKOKs846DK5J/gERgNKHkWUUD2CkeYQZkLuazqFdI2XPY
	z59olEJZvC4liV1eB1O36sGwJ3E4T+vM2uiyoCgTYWoAnGuic1m8i4fjpzHXoUJE
	RAIOn2ruzi+YVuiMxjh/TvTAOHM9rJzM1aExKfZGqasgB1JlDwxUpviTBvTD1dB+
	wdDTwQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p1wpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:00:10 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8067aec1f51so11805437b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 00:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782284410; cv=none;
        d=google.com; s=arc-20240605;
        b=ZylSnW8IWHXNQP67Nd+ikW9BmCOgACCVIrjtF4yfMeJoeIX3xCLaJ9fqA8YDgzS6AQ
         JpOu7cSNPzG8gMoRxkBj/DnCSFW6GUIn5BOROGQgM31wgKZLI6wdgM7B2Tp01bQCY5Ma
         nmpjuAnOqYURvpOnAMSuxQuZq9tjai2sIV2PRbNxZPyOM9wkxwqOZC+14M75HYsxu9+m
         r1ZM1GgfbIo/xXCO2D4xnphsfmIo/3lPBKwkCrb7BxEfbeTKS29RnMuPJZNSaKh5lvN6
         mk+GKZ8AF5GpikULlcgonYw0fv8EDLQpkJ7Kr5POYRYIz9jze/7ayMh5xNGzJ5CCFLLp
         sBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jo+tjDv7dD6J6AfSDYrRcLpY+LDm1i1herlYND0gQWk=;
        fh=6dUxyV4Kh9bMBGvFcdqyWDhGn7gCCQWURLcOsD+jfKQ=;
        b=MEUNQoM62MiyFefNWaxgBHMNuEMadjGbeJcbC+v4QG1gd0K83znRMu4bt4LubpUc33
         mtmMRnxiroIvdAEaezFQhPFmD573wB9gC/3r5ZWuQWlEsWSSSD8CL/dARodC2iRCavtf
         mIqL2cZxZYM735YYoZlRvbzogafmP4TTirRh5ddMSCxEXNsGbRoGGLfSuy6yRXpa0s1o
         9dRbTuIBmPxqkiit7jjBx7k5ZOhs3o9WT/KSpGhL/XHH4Ac/+cGB1tUvHwhzFIzPkmeY
         zmSxsvUExfOKgaqJw+q/nv99oq9OVKmypCxu0jFodRfqqCroF+jIzJVwyA0/p61/3+o7
         /hyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782284410; x=1782889210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jo+tjDv7dD6J6AfSDYrRcLpY+LDm1i1herlYND0gQWk=;
        b=VpD5rwx0Qws68vuaT+0qsdJhRyrjtBYdiadrI0enkcVftwr1tX65AsuxU21tCN7iHg
         Jmp1ky0xRBBkF1aTgXBju4OIN1GrGOqTfF5htg0eBe5uEXnkcj98bkeLXUlKuwwO6pU6
         GI/Aa9qvVP4/QXOsEAducRJqb9DhlFzIuI5wpVvuqNsW9hNr4gXcYW4jjuS7miqrrwaq
         D5Mk7+3aIec9KpwrgZpwAgmrnVk+zNdTjVj74Ntl5WcAM9Er7RCFt9dZHmD10XbFNgcA
         dcHv2PumMPl01MmZ83/lvIdAE7fvzwHf21g2jQ9m+5UBg4CrG7+DfxrymHQ+3jb3O5nH
         4IVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284410; x=1782889210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jo+tjDv7dD6J6AfSDYrRcLpY+LDm1i1herlYND0gQWk=;
        b=sln+CVyfmAJLXNtdIEE12mdNe47SK+cXr3wAfihOSFsqCn0lCuGB9PRuuv5HMoYx8X
         g+334PU9l001jUhBr2Bb3M2awZPRHG7sajQAqMUHNjktxgM44tTkSC6ecl8QKwcFwKce
         XEulv1m316uG6qQ7vbjc2cBEKbGkCKR3Deql4A7+LTGVlf2veM4bqeJ3GE/T90MS71vb
         PsvSqpaeEIGefzn9/RHdrhoZXvDCmRsub3Foyab9QkfmBNYKOv6Y+vXHRVyYsuDAK8ZQ
         +eLG+eyUkfSnsfwb6NXgzaFSvK1r2vO49F3Wy8N5fwx4RHEBxnm57U7U0ZQzfGcn/tmQ
         LYAg==
X-Forwarded-Encrypted: i=1; AHgh+RrSJibZd20mTUooFIACb2MuG420X5g5ZIQHfGvkq9PvWM6lYTfa4cMDcmjnuDN0LIARfI0QSsYNh6/sJ5Yx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ImHR/YRNzGcDg2XlDri3oghptp8sJ+ANRKg0xqWJiK/Nvjoh
	zGpSM1Hx23QelR1gOfTXdnSclWCzQ43D7n0teL3/KyvwnB2QKrnbMiqpJCN5keZh9fsXwe8VCVk
	sT+VqM+lMBsQ1M606XudGTs6aLfFCi6uW94wS8p7hxMlzkZ6AAfvNIU5faZXnWSNFL36gtBTeM2
	Gz06RS4cORjIVCVVP7Mq1PMNgmC9VWCXQUxctHcm4KW0c=
X-Gm-Gg: AfdE7clvBUNTumyBnxCCNf/qCI0WTcyxYEs9KhBgIxLu61CKb+tfQilr2imQssVp3dL
	ovjuU6fAbWrHyjch68aZJUfCzH5e/59Ao4g6jk8BcE3DP/fO2pnjQODlc7hpycr63yIvYsvZ1mZ
	AYK1pNjS+RKF0v2ip5d3FYcubYcJeu/hp/Bm/QxV2Ao5bjzZ1P3ZCTex2z1CkLa9WTh3I0
X-Received: by 2002:a05:690c:c455:b0:7ff:83b:72ac with SMTP id 00721157ae682-807f27fbd82mr20880267b3.12.1782284410356;
        Wed, 24 Jun 2026 00:00:10 -0700 (PDT)
X-Received: by 2002:a05:690c:c455:b0:7ff:83b:72ac with SMTP id
 00721157ae682-807f27fbd82mr20879917b3.12.1782284409886; Wed, 24 Jun 2026
 00:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
 <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com> <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
 <7948feb4-9eca-48f2-944e-ec982b6823dd@oss.qualcomm.com>
In-Reply-To: <7948feb4-9eca-48f2-944e-ec982b6823dd@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 12:29:56 +0530
X-Gm-Features: AVVi8CcSQz5bnv0X064mFitr8CQPXMcyB5PfpB6F6jJw0iQ1yBkRbyOZPxsG1VY
Message-ID: <CAC-tS8Af8GNQ1rq2PN6Yr-wG8_D55ddU9t77H4CUEvWfaP=Gkw@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1NiBTYWx0ZWRfX9wxk0FCIPdr8
 neS9PLMT5fbQ8BGneXUc95Nlk7lNxLGo7/cU8Ma0c//yoaJYUk3wJ1Fmnu9aWihgk/Duo24BdT9
 vUnKfqa/jS4uTwIYse2XapYSmvaEXkY=
X-Proofpoint-ORIG-GUID: 8JNXAGyZpwZBICDGhWV4ex3vtlVk4CxB
X-Proofpoint-GUID: 8JNXAGyZpwZBICDGhWV4ex3vtlVk4CxB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1NiBTYWx0ZWRfX4Ayn/CcPXtFU
 zWWPi6/HwJHF0wwPj5elNF3OC5ULFRyyas0IC1YIQeN7cIRHY0HxMw3AAY3QjIwmLavRV0t2CMW
 Fl+1eQnuYLHd+6sjmCBR5/4KdSuHWhVk9t9rS5uKvcnwdFfvAkbCx2EycF84XaJWiFYHi1tRUUN
 gF3A1I4QD8GKTagto8t4hMXclT1m/tqWrQMTUOo8PJ3ZuxhL2t3gHxVIZ6d9J0pSBBBbFMoYg1h
 8WvGho7kF043bCpHmdy4mIviOQ6UTv+IEKSQ4+vgUm/PfnuKDwngkKT4J1T5R2MS929oZ80h1Cs
 tQ06kBuOXJKHtV9qKVRId1SeJzCgPaRXEqAwTJHI9cEnkCbg5vrlhYTPQl/GBJLK29QEWUhIOSY
 vlF/PAa5Adn/dm5waU9GfKPtND2Iyg==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3b807a cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=70Ip3T5yH-gdihXWpJwA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114284-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5B526BBF8B

On Tue, Jun 23, 2026 at 9:18=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/23/26 2:26 PM, Harendra Gautam wrote:
> > On Tue, Jun 9, 2026 at 3:27=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/5/26 12:37 PM, Harendra Gautam wrote:
> >>> Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU =
DAI
> >>> controller used on the Shikra audio platform.
> >>>
> >>> QAIF moves PCM data between system memory and external serial audio
> >>> interfaces through the AIF path, and between memory and the internal =
Bolero
> >>> digital codec through the CIF path. The controller needs a binding so
> >>> platform Devicetree files can describe its MMIO region, DMA IOMMU str=
eam,
> >>> clocks, interrupt, DAI cells and per-interface AIF configuration.
> >>>
> >>> Describe the single register region, one EE interrupt, the required G=
CC
> >>> LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interfac=
e@N'
> >>> child nodes used for static PCM, TDM or MI2S configuration.
> >>>
> >>> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: lpass_config_clk
> >>> +      - const: lpass_core_axim_clk
> >>> +      - const: aud_dma_clk
> >>> +      - const: aud_dma_mem_clk
> >>> +      - const: bus_clk
> >>> +      - const: aif_if0_ebit_clk
> >>> +      - const: aif_if0_ibit_clk
> >>> +      - const: aif_if1_ebit_clk
> >>> +      - const: aif_if1_ibit_clk
> >>> +      - const: aif_if2_ebit_clk
> >>> +      - const: aif_if2_ibit_clk
> >>> +      - const: aif_if3_ebit_clk
> >>> +      - const: aif_if3_ibit_clk
> >>> +      - const: ext_mclka_clk
> >>> +      - const: ext_mclkb_clk
> >>
> >> Drop the _clk suffix, we already know they are clocks, as they are
> >> listed under the clocks property
> > Okay, will correct.
> >>
> >> [...]
> >>
> >>> +      qcom,qaif-aif-sync-mode:
> >>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>> +        description:
> >>> +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pul=
se)
> >>> +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
> >>> +      qcom,qaif-aif-sync-src:
> >>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>> +        description:
> >>> +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mod=
e
> >>> +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
> >>
> >> Should these be boolean flags then?
> > It should not be, the intention is to define explicitly, for better
> > readability I can rename these flags as EXTERNAL/INTERNAL, Please
> > suggest.
>
> Are all 4 combinations of them being present/absent valid on shikra?
>
> Konrad
Sorry if I did not put details properly, I will be correcting in the
next patch. sync-src can be external clock or internal clock, where 0
means external and 1 means internal.
-Harendra

