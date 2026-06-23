Return-Path: <linux-arm-msm+bounces-114210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JzUuK6F7Omob+AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:27:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DC88E6B7112
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:27:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Jg/S0uHk";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UEi+eZMy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114210-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114210-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F155D3023339
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2033D6470;
	Tue, 23 Jun 2026 12:27:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4C3D5C26
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:27:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217625; cv=pass; b=RTv9G208xxuSxN0broo7HMslw5ER60/bx82X04Jwz1S6eDv4VGVARIjI5saBu9AMMF0rVWMlPcQoZwfbIvrSV+r0AWMjhVDdGikKmCoxNY1pnACrkeaek7UUrY+HGzyKNxHX+ay+KWDpa79/mBDQ2sF7SrIstrc8nGvCzIHKl1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217625; c=relaxed/simple;
	bh=7/LQftETyHGWgSX2G2vHM1wJ41vU8thaiCw48xx224w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASSwLfuhXlzhKeEQIjNOMn1Ql3JFMZgyY1pjTRz6egKkoB7pC3bqkNjjgmC5t7UuAWbyzG+9MpXwZXYxDq3+kzGq+YCfTyzOdsclbh2ApBk8NoGrz9rdjjpvzZedllhISrk41zMAHs6TdJl8Tj62KuCk8t98gG9RNKYkdq0HkRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jg/S0uHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEi+eZMy; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYgK9113419
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Peilm5GMknF7DoalP2gFZmK7h0tb+Y4svc63egvx14=; b=Jg/S0uHkeM4A8Q90
	CfDNCsuglEQ2J0vvSLvckFNA+8l+EovNT0g/fuF+KeO0wvAULR8Vn9kNDfCZV+p/
	5Q8ZX1rztepZWg3o0Ooq7uumfRq9uPW8YuaqDauT7eRKfiFyMh+B32VAWX22C4MM
	1m9MGJ+aQl2N+Z3fLQxhkhjPyBVEIUuzF1k/eZgIrBkBgt4nCxtqNh41fAsd+h7o
	qqnOtUGpz4rtoj95J0piBAHb6LGr4mAk/YfZ8FnLXxHifiy2iaWyTG5lXjrUp0nX
	puv4ItQFtCW+mn/n/ehgezFpSdSzxlbVbS3azgvnywNFYI9EG6QBYR+yRhrtMUfv
	yJWTGg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvsek0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:27:03 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7fd85d01ed0so87229717b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782217623; cv=none;
        d=google.com; s=arc-20240605;
        b=Ha5gEwY4G42L4n7x/ZpO/hBY6mAoQKu0CBdD7Ei29M7HN+j1998PfOiUECM082BdR6
         sgx0y21r2BK4FCyMyUTJKW+IC98NoibuUY1/KDzRH8MFFYoTtimrOBTsmBiAyTWAxBVC
         +9a7JIYInfMcp6nFHXz5mnWhGV8Z5xmsGfiYAYXYt0m62ZAkmjDs4+SMlzU94EefYGqR
         EZky1L1p5atI8OD3vvSp5WS1ereSyLjH6mfAFEQEGJz98sVCnA74XbcVAd91cd/ijfya
         66CIvX5LUMDGtf9c4uXKBXxWTV1ei4UHGLr0M6h0Dn7qx3cs32GG896eJzElFuK3hzBY
         pdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Peilm5GMknF7DoalP2gFZmK7h0tb+Y4svc63egvx14=;
        fh=umXlGT7NOhKeb+o2GMlyDCBUc6I0gh2zfZwQcgiNgJw=;
        b=Zkg3hVGcrUUcYTdczSW6kFvN8fe4IWE9xPa+xC7I5xJSwZOUXHH/LHtgKWNr7rwEsh
         Jh6+4k2Oe3f7hS0Kf0OJBl7Glsmcb2paBr/S6yRAPFVGGxtgYB6vPnmce2OVgKCk4Npc
         VOJmXXHFmt5/eEgEvNzubQRphDrgkfREma1JjGmtuggGSRgC7hTV5mCSWdfMn4SckiDp
         JOxL0KLFtE7r9O0bOg3yGslASgfHhSlGrmzkcZNNCNSz93ObvlS4sTUtYODQpn8wFAGb
         0Qc0aK1AfKOE4dDbN1tgSy25U9W0pa0kQk6xsoXm5mz31HG/Nh8zb+LbWufAWYof4LNv
         wXJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217623; x=1782822423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Peilm5GMknF7DoalP2gFZmK7h0tb+Y4svc63egvx14=;
        b=UEi+eZMyIKVHYgKb42Fg3hgj33nMuvi5ceyZpZi+b5jqwMr5f3wmZqEoj88AA5XSjG
         RHq0dDwj4kRCQ7jXUTG1NVLTJyIQ47ivmqbFwhBN28qzHhU1rGBqowh99HI9fp5dqEyi
         huBtJKBKlNYE6XBnwf5cUvaGhDrBVWVXo7QiNol8YhBkdiIRg3rCNj6OdSD3Nb6+yBLl
         LcbD2v1OgG03Mz4d9RIBXAgoo2fVA2nuX5nzSSa6I+3MBu9fvO9n3tH1Pk9LS5pvXfgd
         57/EEA+fqwNG/QCx8x7ZCFVOrnUC2uxbG4fz44qI/491Fa0WgwTs0+ZSMe8WjLrFNr/I
         EYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217623; x=1782822423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Peilm5GMknF7DoalP2gFZmK7h0tb+Y4svc63egvx14=;
        b=qSMiiFh4sPfN6UZKrpgviJSBgx7v74D1RXWpCBkNmWWqzX/KBsyiCPyEqgnTeYHhp7
         xrK8STxICzp/5mW8t8hEUUVLdPKj2wC7/8/d9+DU+T2NLNJEp/pLV1eOu0Z0d6x+YLKO
         6J91GujXPr73maooCyTVtwExQYLG93cNZisnERi3ZErTYzzJ5e1DaghaqM7jWNq/+N94
         Oq/CT/wcRd25WeBu0QfHA7tRncoBaNXwdG/vtF2H0UdC5Xkgjwcjd/3+dwYp+zfRWcbn
         M6lKF+1ne1BYMeNoAqOU+zCuCkPofIiQj5sX+znpwAvcYm0/aPj74Vc8J3hYa+4nvgfA
         KveA==
X-Forwarded-Encrypted: i=1; AHgh+RrPl1gwyHj8UoPoZomipVyJB/3G+cV7vKwu1K1tnC5DlonQbWzWb0QdHuTS3SiMuX/L1Adsm+w2if1IWyrI@vger.kernel.org
X-Gm-Message-State: AOJu0YxtV2NYKIFVFaZ3SGvH+LcO1lo0JhhdbFlKPTpTEzWAAldMOQ+V
	N3frKA3YShHwcHpq9Hx83k5igggCg1lLPQwphIcL5tkRRxb1v2Xdoa7bKqZV5hR9tY667QAlimB
	NQrBejTF2WjSPyclYQkwE2S0nAcmW5tkkEiwfvwZS9dmWC6dRc016JbX8tncPHi4U/Z/7z6LbOf
	su5nm/lMpFFe/fx5uzHUWHjZivEIQZWQpM0q0lEHk6NII=
X-Gm-Gg: AfdE7clJy/m8l9TpWifjUYrt+ncybbEkHUvSaJdKT1xPCyrHscXRu+vISQ9B2uvygbH
	d8YZzRF1NpF74qK/OOcgu5MTpVUJz2Jjdc9FuffDZghw8/yegfdd+rgdpWojwMjcRTAMH0lti4Q
	lISA63itNo//0IgdxaveqFQ7AZtLlyfVurnQr5tcg4dMC/z0s5dGheOY1qNqiEa1YhSpyP
X-Received: by 2002:a05:690c:6e12:b0:7b2:1bf1:8016 with SMTP id 00721157ae682-80263fc80a0mr166248757b3.2.1782217622763;
        Tue, 23 Jun 2026 05:27:02 -0700 (PDT)
X-Received: by 2002:a05:690c:6e12:b0:7b2:1bf1:8016 with SMTP id
 00721157ae682-80263fc80a0mr166248317b3.2.1782217622215; Tue, 23 Jun 2026
 05:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com> <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com>
In-Reply-To: <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:56:50 +0530
X-Gm-Features: AVVi8CdEV3C9R692WZmwmWxoqEuJ-cpwwBH_4E0rGJUcM6b62Io0cU-8ZJp4vNc
Message-ID: <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a7b97 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=Jg4MX6P3rhpUa4gzTSMA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX2jE4aNLBmrfH
 /Aot5nxw4Kqd0QpXChbdC8o5IgrP3Gm2WDVJuGBdCBEzqnSqaVV5K1J3+GaEFHWIxQSf3I+WAPv
 j1gzkpTTD3xs4MVRbkAjDnIjVGV9+7s=
X-Proofpoint-ORIG-GUID: hb0s1QopckRDXyj9c9FvcpqKuYW_rwIS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXyB+kyqT3RUif
 mwQ1YpDqdR+HtmulJokKD2Ijxzfq4m7IGEumjZp7r2cwtulVDpCbTW81QJj2wQ3Hv0p32YFTJq8
 Y8e3CXB/Aayx8oaUWeh5EiDwU8rB+Mb75kh3rXK32F4vxyQue8fHEk6QDDFoMYmSkZGqoYDPj+0
 RvseVFTy1kvD+2HWIc72Pwc6vNZ4Cd9BeNVPxtVHWCwAy1hBOMMt4VqOjd3xsUuPOP6XcNq0kr+
 EftvQ7m9VnPriiVWVd54BqlpqwJcPvO1WzBqMI7oodfJxP1XQcxL42smqZbYFb5P1vyShtb39KU
 FP4pEIfCRfE0XIXnf0b6SdkRyuM+J3GQYVSPtpscBjSgzNdwLuDngQ3XCUhn1+Rxiuc99LYIKPv
 QnqpsHM3U52TD55DCHhIXlnDTOUpGHgB3ErX76fsfgqYUt21p4nG2i3De0tJ3TdlKPsCyLl4l08
 jbKyd0lRNPmVZm4wwDw==
X-Proofpoint-GUID: hb0s1QopckRDXyj9c9FvcpqKuYW_rwIS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114210-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC88E6B7112

On Tue, Jun 9, 2026 at 3:27=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/5/26 12:37 PM, Harendra Gautam wrote:
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
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
>
> [...]
>
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
> Drop the _clk suffix, we already know they are clocks, as they are
> listed under the clocks property
Okay, will correct.
>
> [...]
>
> > +      qcom,qaif-aif-sync-mode:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pulse=
)
> > +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
> > +      qcom,qaif-aif-sync-src:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mode
> > +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
>
> Should these be boolean flags then?
It should not be, the intention is to define explicitly, for better
readability I can rename these flags as EXTERNAL/INTERNAL, Please
suggest.
>
> [...]
>
> > +        #sound-dai-cells =3D <1>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        interrupts =3D <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
> > +        status =3D "okay";
>
> status is "okay" by default if unspecified
Okay, Will remove it.
>
> Konrad

