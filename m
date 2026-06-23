Return-Path: <linux-arm-msm+bounces-114110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nphRFzxAOmpA4wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:13:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A55BF6B530F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:13:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YMTqEOYz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A96STHz7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114110-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114110-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 252FE303FAF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0703CB8FF;
	Tue, 23 Jun 2026 08:11:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83831374197
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:11:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782202319; cv=pass; b=BgwG1JX9kRIQ8YoEm7zB4zHluE1n+lYXYkNiET648ZfQrYc35lQ0ftRIg3N4dOjJNzUL35cl+EtFBCZrik2cN44AhElqzsgJ/AASpMGAO6W97+c6UyNYdIuNu3w2FTYblny+3ALQ6yDwQuWu0dOaoovmY30JBseGNnzoB4uva28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782202319; c=relaxed/simple;
	bh=X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CryuhT4YK+tm0eod8sLfhGgKsMcXyAgCo62epYqBsJmXvaQpytNMwaHXosGPz+tmvtsMK43ndf68ASEDS9bj1i/sOdtUr8qkEgHITDIPnqD2L6DHfFaAOrXCl/1+5cnN1a7Q7LQoZoqHHEEbPiwpNYw6r48hLdEPmZxpq4HoVbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMTqEOYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A96STHz7; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6crhH3547402
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=; b=YMTqEOYzk2G8IFxO
	eIUFRcj5WP0qqlUpu1hv6PH4T5ILuXy0X4BB2MKsgg8/4gFmcWifXRAW9lsW8997
	Vlj9B0/+r6QRm2oWUva/Joxw9jqMG1VxhqKwlbY9afQKGnOX2OaeyhKruNVkPpJN
	jZMyLI6/dxypGjglx0TY2E0Eg3zwMMFsYebYoaSRyZpTEmK3BMmlHpPDIlq9EKNL
	TxAA1IFHIBbDO6xcx/pgjPpdtaZPQW4fDKj9iDzTqMMVJI3BCk3qtUgYzCXk9ZWJ
	D/SOOztWNj1RtDhDbojuSRtASUZLyDa3+GbJtVmEfp0CdKEK48jZ5Den5R29nTtY
	S3M3Hg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3ebc589-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:11:57 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8067fa066bcso13612227b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 01:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782202317; cv=none;
        d=google.com; s=arc-20260327;
        b=jxRM/pA7kVTAVbRSv7578zK/e8bDVmJM80X5M3SFpb3SJATUMOBNvVPtxk8UlHnXRZ
         NEYREJBttcENnM4izftBY54iALVDLjq56+cDBBMleRdzhtMY1ofsT+ppFavlBz3GKIkK
         wch3MPe4nFR1W7sAhto186W1Gi5mOMlLdL9wRKMpB9CaYV3jbrI6Sq2DZUHrOxIUAc/H
         RDfl0Rh+QjJ/dz9HMcvtPvr25mvuc/MIrxKd98NEVDxwYzOdb5MysRg2awS1ObfI433I
         cHOXWzRKWKlBOiPWLJwoXcg4wd14GUfbo7EJBW1cvIMEO/OTZtmM9vcWkmK+oD5xxFxn
         iMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=;
        fh=RuyJb1y7rBinAV9FJDS86iwdbAtVDT2nVraYdKE2T5k=;
        b=jUNAzd3K+k+9G6L00ADdYbez2K6lheUhF+AjI+hh2q+rvMZ2hx/y0puim2qG5yYsJn
         ACCww/N6gxKLAniN+6to1oERM66sETVvbehGrgBcRRomiBrbepSe5d29UboinVmmBJb0
         THkRKmL2kJT8+sWMVH7E2jZh6ot/fmMa7pBFqaI8yV2Gow1KrdorY842gMVg6DusWeMj
         gyPXA37bybkQaT0qtWHM+tk0RlI2iQdhr0xwBGYwLcWuq4mFDe1mSJeMLveuMEmcbz2h
         G4ADIT7iW6p95RztaYJsf52A2h7zBAI6cSLzDrIBagpyQv5DpAVZqDwi4MSGaVTZMhwD
         L6lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782202317; x=1782807117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=;
        b=A96STHz7aOcTuFuk6JxAVUt/HKkprH/F6HS7gkUGPiomu7ctifIZGxBcWxyH+dctTR
         4Sk51KAJiN9+EkB38Bm9kv3B7AXPOXCIschbg+WoOHt3B8A2kllpGvt0EnZLLKZVdBEP
         1h/SVR4ZTXsGq8kEYgq4ElLaQuSVkT+5AQCy0/PVuJYeKvge/AR/iGfVpvAjY+KYd6LU
         SUscPVTTBm8V8VvRTaWlkbA9iatvkEE26BQJB9p7LP8UMt8oS5uuJ+qEJPaEgG3KwPJw
         ZwQ1wk6Muv26+N1rg1/Z68U0/F/AY/kK2Z0S2qJCz7Kqczz8wWsksznKV6GPjU7bB3yX
         C3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782202317; x=1782807117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=;
        b=YtLFrFvyKV1l0oirPUzJlrM24ELBisGdavS3sSeipwkzGPF2syVDOrLNj918q/Vr2f
         h1Ru1HYulouEDQosxrl+I2zQAGRuUvJ9PKB5514xUabb6TmyJulWg+zCKpZqejCFhPIB
         4wnGBQv9NQZb8xhao/q8FO2/ic8QtnXSR32+8cilP/ZyBa3QBshavToTI6l16Xyfy5Z0
         U4HamEP7yZcXB6IvAJhtI7TRDhB9prsWTnd2ECu4KuXxLtjIOPLygsIk0SiuLikNt9D7
         K/5F+iPk5rL82d1z9pmbw7o0rWJtIxkhFxwHcWx7MeL+me3npv8AsKLG00fiVbOVykER
         gEdA==
X-Forwarded-Encrypted: i=1; AHgh+RrNzFRzMirrmyT1xq2TNS7IqR2pQkn++FcEjg78909Ko+9BdU3cnmTebRIFJrU3bj6bnXPgBjHenDoSeNzg@vger.kernel.org
X-Gm-Message-State: AOJu0YzQdiLBkQMnDI99P9DAuDk7OhpMiyj8krjeROn32OX89VaN9Xwb
	2IK9KAuli5w/EirISrQVG4mR5h4fXeywOffRopc20pLadhy25E9qm1kPwnkxnHbEl583Mcyq8kv
	rvflQJnBAUxBKQMldrZcO3OGThdziiXcKSu2HQJN/RJWeIR/Mwt9r/88ZttW8u/9eWbcyQ1UOmn
	2/Gmn3XZtRWlAYIRYy4szaf5/k5C73qPEdYFsOJpbNdMc=
X-Gm-Gg: AfdE7cnhVyT9lC5u06A62U68qUkmzmR0iEnKueEuEMY+JrLt3CrHfbytjbhNK+aEmU9
	KcPCxnqook3lStbWcCGAgXs4HmPuhY+PAMHXMTRd+Wew9dDAXAJzadOLUYaSMWi/VIBv8LaibgF
	RfZiZSqf0GtMmKmhu1qd0V1lvEVLGZHW4d+BTpBdcPeV9sLIyAdPVAwkepBcuruTw0+hRZ
X-Received: by 2002:a05:690c:39c:b0:7de:8229:e86e with SMTP id 00721157ae682-806731eda88mr27100687b3.21.1782202317070;
        Tue, 23 Jun 2026 01:11:57 -0700 (PDT)
X-Received: by 2002:a05:690c:39c:b0:7de:8229:e86e with SMTP id
 00721157ae682-806731eda88mr27100347b3.21.1782202316650; Tue, 23 Jun 2026
 01:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-6-harendra.gautam@oss.qualcomm.com>
 <5d57d386-011d-4d5a-8f14-901019f3f961@oss.qualcomm.com> <CAC-tS8BvfQOLhwicBJ986UqTTZGmiYDbg5MVA54ScUsYLb-dog@mail.gmail.com>
In-Reply-To: <CAC-tS8BvfQOLhwicBJ986UqTTZGmiYDbg5MVA54ScUsYLb-dog@mail.gmail.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:41:45 +0530
X-Gm-Features: AVVi8CcEIEim4mJtqqqf56j5RT2JtPMKNUIlavtlNFsinkA44--VyQviYnJLK7s
Message-ID: <CAC-tS8DWLz3EK8cOQ84F-2COJR-K7X=snpWxm1doOxP6fQvNXg@mail.gmail.com>
Subject: Re: [PATCH 5/13] ASoC: qcom: Add QAIF shared data structures and
 variant interface
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA2NCBTYWx0ZWRfX8rt03wHWR389
 3I63OK1rbDc/c9cJHGH1P0oxs1ee3eZdSSGmcMcnOS/7HNVFDaTECjgZODdg/9JbyECHfFPRYJO
 LAlWS5fIerv2saKO3IAoTtUo3qw8S+Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA2NCBTYWx0ZWRfX9BnrilXPL2zw
 34MKGMgKgN2H6ttU1pGO4YEygbJa//2v4RXMhD6245tEaZn+JF2FAuYhb4d47UDx1i0L79piZW7
 DG2OrkZaRICIgJ+MZZPshxIVT/w2v9vDUdI2eNVIroNs6AOOPwt+PPb9r3qw+d4n4u3MRP1Lch1
 M8OE0TUN3OPuwL+d7z5do6ETcYAYanIaSLg148/5Z1vKtlPgnvxeMZ+RxK72rKnRanAC+WMlot8
 B39pIRdR6Hb2h7GJHhKyEtKLyCCKqnm80R3Rh4JMuok7tYoVfi9ILa1+Fu6mpPNIBZLOuyc0bEG
 KpRK97R6lJpgEhKeWXv4hYSkQ8DNqcXGM0RhkFzPymhrENE87nJpeHL+TLmWz4q183tlJXjio7w
 4S3dhdhM470fgPib98Vh6BJC8Osjd+phl1r7rnEYFNhwQZjIYE6EASLpWSYATPQESWbwu0Rm49x
 aUZIR08VQJmUMyjwZ4Q==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a3a3fcd cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=Ke4LyEce-jOch06ua7AA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: Vny6ahXVfvg3F0wbm9OC9hwMv47aVeNd
X-Proofpoint-ORIG-GUID: Vny6ahXVfvg3F0wbm9OC9hwMv47aVeNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230064
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
	TAGGED_FROM(0.00)[bounces-114110-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A55BF6B530F

On Tue, Jun 23, 2026 at 1:34=E2=80=AFPM Harendra Gautam
<harendra.gautam@oss.qualcomm.com> wrote:
>
>
>
> On Wed, Jun 17, 2026 at 1:58=E2=80=AFAM Srinivas Kandagatla <srinivas.kan=
dagatla@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 6/5/26 11:37 AM, Harendra Gautam wrote:
>> >
>> > + struct reg_field cif_rddma_shram_wm;
>> > + struct reg_field cif_rddma_active_ch_en;
>> > + struct reg_field cif_rddma_fs_sel;
>> > + struct reg_field cif_rddma_fs_delay;
>> > + struct reg_field cif_rddma_fs_out_gate;
>> > + struct reg_field cif_rddma_intf_dyncclk;
>> > + struct reg_field cif_rddma_en_16bit_unpack;
>> > +
>> Why do we need to use reg_field?, currently this patchset only supports
>> one SoC. reg_field makes sense only when there is change in bit
>> positions across SoCs and if we want to leverage from existing driver.
>>
>> --srini
>>
> Thanks for your comment, change in bit position won't happen for a IP acr=
oss SoCs. But these bit fields are added with intention to configure bits b=
ased on defined value from device tree or based on usecase. Please let me k=
now your thoughts.
> -Harendra

<<resending as last mail was not delivered for a few lists as it was
not plain-text>>
Thanks for your comment, change in bit position won't happen for an IP
across SoCs. But these bit fields are added with the intention to
configure bits based on defined value from device tree or based on
usecase. Please let me know your thoughts.
--Harendra

