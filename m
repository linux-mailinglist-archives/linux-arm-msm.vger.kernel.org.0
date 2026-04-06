Return-Path: <linux-arm-msm+bounces-101954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIovMLqz02kdkgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 15:23:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 228863A383C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 15:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 651E8300F538
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 13:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB05A332913;
	Mon,  6 Apr 2026 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTEXEg9q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsrWhH0j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377FC328B62
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481778; cv=pass; b=ZpyPzru2v5pkDxYG72/GVErQR3hsLgcBVuRLhdCszHGhy3fuluEZpl7gLW+bZv+TZNZBfxFmun6f7d0ybFpJAvpQe1u1Fm0TPeWs5L+n6A1vOJrypKuAmVzsUG/FL4QnuGAlWoN5Z+DHhNEK/OrC5StaHkIP1KlEkeV/RELnGMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481778; c=relaxed/simple;
	bh=VK1ThM+uqbu1JSH381FumBkiogu/j0zYMAwl+a98Hpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9Qa5qAlY0EGAhS+CLN/svi/GQBf81IRC3vtp4u/RLUDo31M4XZCXCs2gPOKz8X5mImZKYQW/QJ9WRGP4+g09z9RkLXTbPlLBrB7FrTmL6ZPUWscY7JEvRz0WXyzlRkK/mv9DdaoM20yLQ5c+wUKn8Q470PzA+AKlbcZ0ZQDrRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTEXEg9q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsrWhH0j; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63692Y5x2469655
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 13:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXW5EOLhP6pJTGPFoJj0ro9L0xBVMhnkMxgE+lrT8AY=; b=iTEXEg9q7uMQFgIJ
	TiWom4He0UwvRFm3uXMy01J0jZbm21f3OXVzDbueKzLh5ic2Bv+UlXD6Srd8KonV
	L1ooDr0UABvbiQX9kl+GCljpAWJ88AuXfAMK8Stkx6BOYF0p5PGdAY+1Zbl50iSl
	rmC9WBQDaYxQYl48D3mVbKG47zUPCXMxS5PAI+5KLqznAcwcv8si/Qmbd+XPATXU
	4IMmsNawBaL8BpJTgnqggCyL13JdyDCroBkm/Jm5yTYgBC+EfAdmQGMGulOZfdxh
	NNTSonDhxrJb5OzgJ050JyZ79X30jYygEoBs2IbyS2mov9euO1YfAsOQ3INtTTlS
	JzSssg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mndbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 13:22:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a8ea3f1becso50906866d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 06:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481775; cv=none;
        d=google.com; s=arc-20240605;
        b=c4w/qMN0xqyacd2s4UctbIObKJXIlpyl5EZWR7koDxTkXyHEZG7hFDAjwmgtpTSX7t
         NIMQkyQfb2++PaHkRMzzinhmQGJAZa2ZSJ9mX1BQZILxAJhxjJ1nicNpB2fZxd54we7x
         LtF3HR7HPDk38R+BMefqhd6kEwCoj2LzGGZLHjMLWtZgdPeaNpGIRryeetE18U4P+oSu
         96vH2dePqz84VFLqs5L0NKmYxGcZMRyJGS8yYDi+a9QuRX5B41DRHe4Bek5WpxNfiEo6
         ro3d1vhySklnQQc3zyaTPDE1+ptdYL20nlwSrFqgI+3or7n6NPw+zpHgL1fTc0YzrvZp
         OGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wXW5EOLhP6pJTGPFoJj0ro9L0xBVMhnkMxgE+lrT8AY=;
        fh=fUb878GvAEP6yo72y++G/2M5Q3Iw3vu3qLznF8WRqg4=;
        b=EiRKVU4PGZNV3SgXxFMHmcrcUxQhxA76Syb3My0sFO+RX/RS8OAVjZEZmagFeF4bXF
         SuTF6s8e8jNVGwFeQONrY+kgj0WCI/OkGgX2WH/3PPj/vGflC8wIXQ/HGiTstAq8HhaQ
         IDMfWmEKVKY4yXvAlGenyFOWHwArN58afwY2G/dTso85VeSuVEdxbn2Myi0rp6acaNCD
         fsv/n/bCVORTZR2ykwLSX3h/f7QsX634SKTKkyUnsZWqdjZHCc8mu9bQO/k/PaQHI5u1
         rZIaFr3AL+lo4tN7dCLthpDxFfmnbUwBkVZqzskMBu1Zgjd5g4+UYnkJGdBKSSWm6jmb
         pUEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775481775; x=1776086575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXW5EOLhP6pJTGPFoJj0ro9L0xBVMhnkMxgE+lrT8AY=;
        b=NsrWhH0j+kzOha7j8tc4DdvfVPQ3mvmAZNoal+uzmPC6CwWyHFPeUZehjxI2H+c1BS
         0iVWArigwVVMbdg5TLn4V4cBFpR078vRAeIJZeB2T5U/TDYTDa7RhdZsJT/aWW/pKsjz
         0q+iTje5zOwYhsIq6Kv4Nd29FSV6/G+BBATY6dlIZmhpt6kfv/3SC00gQSmxeYXz+5Dg
         0+eQesUxfpr53ZtD5eMuSJNr26az050MsifGVKN8A5Z0y81xcRDQY+WMkcn/9UcPaLer
         LVRhr2nTr7Eh60yiC/I7IjwHgcFFU0PC1iIG/S6NPqfn17FufkeLtr3HruTkUZwp9HDX
         klPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481775; x=1776086575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXW5EOLhP6pJTGPFoJj0ro9L0xBVMhnkMxgE+lrT8AY=;
        b=g4CKBtWyFU3gLsMcpSvgab+P9xNaztv9lFsOk2ms4tVtSaNlQGPETuiyhugpT9DvxL
         qZ18ampiQtRZ6RLfcgysxP0o+Qz3QG5ccKO8eCcqseCFQaSMCC3KyRcn/N3AphF7mTSA
         Bj0+XrZTuVkzSH5EgKZUjU8NDRlLYCLNU3ruvvifbZGqXm3+BvxLB74RGI9v0kWXnxCn
         tTee9UHYpe3V6P3ngLdG1ZZcbRiIFKEM+yHB6TCj7oxU7eJbAUsDPXWi2/5/no9hPaal
         ufoxOw7UqaY7mNjKIgIYi2iqHBFFE+zo8eAACciBTjkaNmi0fcrFBSMXW+hyLHOmZcL7
         atmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFdBSJ33fv0PaohOngJqpUN6nmy0H2wtrkb2VBigpmVmp0BURr42NXoMiAH/KyqeW2KqoAFTD0n/LqRxcp@vger.kernel.org
X-Gm-Message-State: AOJu0YyswW1B52ymRzEb85a+52AKpXnA24/gKdhaLiuJ1/XW7WVWx3aI
	xANq7aZwMW/TPDHtJnZL7T/76YD/7opin8x32wlzVv0F14/CWd/M5PzwJT8w00ArpISAQcEjV1P
	5snzeF9FxxPOtFm3/Q0x13ZVda0ppdzb3+P9clu6Ssye2PGVKoqHOLzc8pKuvHwPKv7SraCBBOK
	rDqlHQIc6YZ3hTnAgdwoH4gd1vq0r3aykaNR0uoB92lCg=
X-Gm-Gg: AeBDiesH+50o3g8ph8t8r94jbfCRQH/X3cSsDaMop2IfPmicA9X1oNrhCBZdoun4I7a
	KP60jK2B2ArEW/J2z7Gdb/NtX9FaluwC3TOM/qgb02cfDojRwNvtCNiUESo5wdzTZTmEQh7eu5i
	MM44+cFQeTCoaOFSRJ1PEnQZKTgSAoQ2aQAOiVUcqg28/pSlK+eXmjxB5/gExj4mEf5gz7nSbUw
	cqk3oGGTWvK8gZIn99/BE0xp9GhvH9Ae1eNmmU/cDdvXQfUcBm3wub2npv1wO1MOuYV
X-Received: by 2002:a05:6214:5199:b0:89c:e7d8:9898 with SMTP id 6a1803df08f44-8a7041fd1dcmr215789666d6.39.1775481775367;
        Mon, 06 Apr 2026 06:22:55 -0700 (PDT)
X-Received: by 2002:a05:6214:5199:b0:89c:e7d8:9898 with SMTP id
 6a1803df08f44-8a7041fd1dcmr215788846d6.39.1775481774852; Mon, 06 Apr 2026
 06:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xy6TKmdveRx4cMshSHEUGZ7s3lbsurWcsc2vq05A7_N4bCialR7EelZitouugtZDkpFCAghjqY4NDdSQEIPprw==@protonmail.internalid>
 <20260323125824.211615-1-loic.poulain@oss.qualcomm.com> <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
 <CAFEp6-2NniQquVrw_V8P_cyUayMMY0SPC8hgczjB3ef5zx7e5A@mail.gmail.com> <20260405194851.GA3972481@killaraus.ideasonboard.com>
In-Reply-To: <20260405194851.GA3972481@killaraus.ideasonboard.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 15:22:43 +0200
X-Gm-Features: AQROBzBQYhS1dscbWRRvRHyPv5Ub23UlECBtJFH6zANXF--27o0o9pYwJsejpLc
Message-ID: <CAFEp6-0ReobVALt573jmo5HEbFfDk_NYfJ0-0tDM+TW7+T3ZaA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing
 Engine support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, vladimir.zapolskiy@linaro.org,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: LysHV-SHfBEpv7ATMoz_FHb6SQgIAOL6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDEzMiBTYWx0ZWRfX1q4MVt30plny
 Vh47pqGmBGoiirg9ESTmdGAB/a5U8Lwq04sPjG042eLGl0tSmUUs89LiY+sHQHohhm0a6dtCjOT
 c26QInmq50l1rMstLTARm8ICdWjNckHlUM8sM/icjov05gfxtqBD9tn9W8StyB7er8FoH6OeA9M
 +3fRo7qcRNOzjjRzJeUPLPCawnkEriNJM9C5niCfVJYSqBcES+brTb3WcW8fY/1tdVFA0dgETP2
 VB6V2qV3NW6AGQeyv4et8oQquVs1RARbFbRw3M5ukL9rUR0eA3CV8WUAKOFoAO83fiplkUlo/L9
 hkKjt6LStnOjDW1IvOtq6INHhlvrpeKI1pkqZxJuEJ57nl+w+rmxeQKO96w0MWHs/PsmhvafLPE
 yC16FSZlzY6dUthHKalFqw/bVXrCFoePha/KCqEw7MBqsWoqtByxO2HQxqcxLK3eRavpCWdwl55
 bheTLRXf+lBK5PkcWew==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d3b3b0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=GW7-DiasAAAA:20 a=P1BnusSwAAAA:8
 a=q3epTjbwirT8uiTGkjUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=zY0JdQc1-4EAyPf5TuXT:22 a=D0XLA9XvdZm18NrgonBM:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: LysHV-SHfBEpv7ATMoz_FHb6SQgIAOL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060132
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101954-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 228863A383C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Sun, Apr 5, 2026 at 9:48=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Mar 24, 2026 at 05:16:21PM +0100, Loic Poulain wrote:
> > On Tue, Mar 24, 2026 at 1:54=E2=80=AFPM Bryan O'Donoghue wrote:
> > > On 23/03/2026 12:58, Loic Poulain wrote:
> > > > This first version is intentionally minimalistic. It provides a wor=
king
> > > > configuration using a fixed set of static processing parameters, ma=
inly
> > > > to achieve correct and good-quality debayering.
> > >
> > > You need the other 50% of the kernel side - the generation of bayer
> > > statistics in the IFE, as well as generation of parameters to feed ba=
ck
> > > into the OPE - which requires a user-space implementation too, so a l=
ot
> > > of work there too.
> > >
> > > I'd also say when we have an ICP we should be using it via the HFI
> > > protocol, thus burying all of the IPE/OPE BPS and CDM complexity in t=
he
> > > firmware.
> > >
> > > Understood Agatti has no ICP so you're limited to direct OPE/IFE
> > > register access here. For HFI capable platforms - the majority - HFI =
is
> > > the way to go.
> >
> > Fully agree, this is exactly the point where we should sync and work
> > together on a proper solution.
>
> I don't necessarily agree with that. There are pros and cons for using
> HFI on platforms that have an ICP. If correctly written, a firmware can
> improve the throughput in multi-camera use cases by reprogramming the
> time-multiplexed OPE faster. On the other hand, in use cases that don't
> require pushing the platform to its limits, dealing with a closed-source
> firmware often causes lots of issues.

Yes, we need to further explore the ICP (MCU-based offload) solution
before drawing any conclusions, especially to assess how complex it is
to leverage or bypass. That said, the current platform (Agatti/OPE)
does not support it anyway.

> We should aim at supporting both direct ISP access and HFI with the same
> userspace API, even on a single platform. Which option to start with is
> an open question that we should discuss.
>
> > As a follow=E2=80=91up to this RFC, I already have several ongoing piec=
es that
> > aim to generalize the CAMSS ISP support, and I=E2=80=99d very much like=
 to
> > discuss them with you:
> >
> > - camss-isp-m2m: Generic M2M scheduling framework handling job dispatch
> > based on buffer readiness and enabled endpoints (frame input, output,
> > statistics, parameters).
>
> This should be generic, not limited to camss. v4l2-isp is a good
> candidate.
>
> > - camss-isp-pipeline: Helper layer to construct complex media/ISP graph=
s
> > from a structural description (endpoints, links, etc.).
>
> That also doesn't seem specific to camss.

Yes, architecturally this is not CAMSS=E2=80=91specific. However, the curre=
nt
implementation may rely on certain assumptions or shortcuts that do
not hold across all general offline ISP use cases. With some effort,
it should be possible to generalize them  [1] [2] .

[1] https://github.com/loicpoulain/linux/blob/camss-isp-dev/drivers/media/p=
latform/qcom/camss/camss-isp-pipeline.c
[2] https://github.com/loicpoulain/linux/blob/camss-isp-dev/drivers/media/p=
latform/qcom/camss/camss-isp-m2m.c

>
> > - camss-isp-params: Generic helper for handling ISP parameter buffers
> > (using v4l2-isp-params).
>
> I'm curious to know what camss-specific helpers you envision there.

Nothing too complex initially, just a parser built on the v4l2=E2=80=91isp
helpers, along with a few handler callbacks [3]. This is something
I=E2=80=99ll discuss with Bryan, as we definitely want to reuse the same
format and parser for both inline and offline ISPs (as well as for
stats).

[3] https://github.com/loicpoulain/linux/blob/camss-isp-dev/drivers/media/p=
latform/qcom/camss/camss-isp-params.c


>
> > - camss-isp-stats: Generic helper framework for CAMSS statistics device=
s.
>
> Same.
>
> > - camss-(isp-)ope: OPE=E2=80=91specific logic only (register configurat=
ion, IRQ
> > handling, parameter=E2=80=91to=E2=80=91register translation).
> >
> > This approach should significantly reduce the amount of
> > platform=E2=80=91specific code required for future ISP blocks. It shoul=
d also
> > allow you to integrate a camss-isp-hamoa (or similar) backend, or even
> > a camss-isp-hfi implementation for the M2M functions, without
> > duplicating the infrastructure.
> >
> > So yes, let=E2=80=99s sync and agree on a shared/open development model=
 and an
> > overall direction, possibly even a common tree, to ensure we stay
> > aligned and can collaborate effectively.
>
> Let's schedule a call to kickstart those discussions. Many people are on
> Easter vacation this week, next week could be a good candidate.
>
> > > I'll publish an RFC for Hamoa for that soonish so we can make sure bo=
th
> > > coexist.

