Return-Path: <linux-arm-msm+bounces-100811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADCMERCFymkW9gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:13:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B19F335CA03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F0F2301753E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDE83D811E;
	Mon, 30 Mar 2026 14:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W36l8p+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G//hy1+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4583BED74
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879739; cv=pass; b=eywYqcBOH7sbJnYez9SIkNVYNCEUb/oA9CDiNuD5hs46q6Ue2fSTIoEv8lmuG5iE2WSaj6jqz1+wdGpBZwjmEgVyW9+1YrUcttuLU+MrMhODMb/hT8uyivplOSCu+WKjfiBbY1wfXWSBQmOIzZ4BBbXw6wbgg1a6EXQ63h2UiyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879739; c=relaxed/simple;
	bh=6j3MrGMGJ8BaZT6b2AmYMG2GmSqY2yDP1O8mNQuJISA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdfYnM54YTBvKpD9SoFli0Ire0lziw7kn0ynNNDpnOl7UHNRiCJJ5Uop9w+7WorNELW7Ho5tuxKzGCWpr4AKRazQB+YAHvl74jQeH7hO0fWfeXjRTNTEs/bGJPTJMjEu/pR8glm9oH4epqEui4o9xGpZ77rp/C8n/ZLKgiJPJtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W36l8p+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G//hy1+T; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCmDMi350298
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=hN8mTpKXqacUhxQzUN9IZmgWttyQCUtx5hu1tCLpHfw=; b=W3
	6l8p+J0XWsL9jQ6AhGFi66uWIavFG8Ct733Y9ZIgxwCNIquINDtZR/ePRxVUdCMX
	FPUZRppvkn4alPbqsV+3/p/98LYjht8A+mZ+BihLx9+HnXfGP7SItsoj+HpZU6ym
	J6U3OHGzEK/Oh1nEiuyTL5LRaoIvy+LP/2dpkq1ea6LD7q8Yk3ABGDEf2y/qr1eD
	0a40/LoTn1sbPLwF3tPodmJDn87TbXXubvgVwQyr1O/sRx1FaEDSzoe81BkwUAZw
	/D+ByFFTsFLZPvsr31nEGovf/ww6S1bc2S0wMVHPry4DcASkdYo/hPn9MZyRoWLM
	j2njOQnDP4ZScoDkp22g==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqeme7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:08:57 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-415583a6862so10856288fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774879736; cv=none;
        d=google.com; s=arc-20240605;
        b=iMcAvkmoRtFa8EvuABV6srq1k+pcjSfcWxNM+11OEE7VfeLT5p974YLXdkrvYVxlRe
         bV7ef1RL6qMD96dct95rJaE19p7i++liGv9JTd0H8brqNlba7GgOEv0KsFHbBW9PmVkO
         OXr6mubf7/d4bOCw4263t2Qp3jZRj06zSMyWEx+DlY7WrxZbjcuoTb6PKTknRh+1G9f+
         WmzOCdT7ePGLykD7YqX8z4WYHgJuBbZwHr/f01uWbI6UtmPoeqexywJU7qFLnPkdHk6P
         CesaaQJ1uLx38NS6v1vObAK3Nzjxuhawkf6/N85OWAEyhgxgOVMIXIdxw4qXhU9zjN+W
         twzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=hN8mTpKXqacUhxQzUN9IZmgWttyQCUtx5hu1tCLpHfw=;
        fh=DKO72ui740PNsXBvtLHo7FSclSo+gVIO0Ku9mtR5sR0=;
        b=Oqpme5cQOXk3ZxorEE8OpFcl+4TQO4aOBxp/fiR+muH5P66OphBqXiFjr52KyR/4YA
         Tjz75hknf04X9fWWB8t0KM6MMn3+DLDilGyV1G/OmuchqHKV7YXZCudYliAnxRA+bPxE
         2vp24S9dFGt+XDxJWBLgYeA9PbFyUKbDHAv76vgShlrGymKZaBP42GDTMamrHPWvBHaI
         tS8ZrrZB7rTSSBZGVd5BNBJ1COvzAz2SDHTgi5gmyuT7y8LclZixEp+p4vvBE9Y1LjEf
         1TgqQ7r0ng3kVgYIb4NuSSgiama2/+OLmB/0tCZEw0D2s1b3EBF+VPPNc0SkRxirIpAS
         1nqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774879736; x=1775484536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hN8mTpKXqacUhxQzUN9IZmgWttyQCUtx5hu1tCLpHfw=;
        b=G//hy1+TDdX2BhFYmTa8lQSWpzMCK9zRFz6w4UdBwk8VlrxsWWsf9A5ux+/FnEFW0K
         QzJA7UNNiUXdd8im3e8L5AZ4uN8P1iXrJ6z2uzK2Qi/DHSjxH6unvvXuIcd3rtQqzdit
         8Wos6UngNJPrywYx6bb2VTaw5MjRHxJM+sngzxXZP7xxZYolZUxJ8DkCmKzdRd902U0Y
         KWOGW6dJaaMGFXMfb7JN9PPJ1tilLxcyXVCIAX+uD/6WUUeRotYI5282MwE4Vv4DWA94
         VC1NF2E2eU81x1bCcoBfE0QxO4XS1auDJYdfzPAmaBxk3Wvbp2fahueYr6t61jCBYtRm
         gDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774879736; x=1775484536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hN8mTpKXqacUhxQzUN9IZmgWttyQCUtx5hu1tCLpHfw=;
        b=q1mfLdehbopAM4Q7Vexfbk9ePXF2EAI/Q+XDcv/hIS0VMVCiMG2985KYOUvHxVJDYz
         GNKVdaNSDbmQwQ1cT//rphSNemtNRHnG/mS6pqLqG8MSEHiKIyv0Z/g9Ep4W0biKdbFN
         SY1dCoBA3FpXlv9RNcATt6TOPEQJ9M+WrynFxpWD0g92YPsfvj0puvmYcEs7y20IyJ/3
         NJdNDup52CHZbGDmwQSbf2UYFsm5xnfdTZOi43R0aK7rjO896RP7F85SXZyhq89jkMTN
         bZc6tmVBKiSVseCKsGDX+qsNygv7TVwvEldOExHc5syyaphxxVjGBSxtD4D1tKywgPpA
         x5vw==
X-Forwarded-Encrypted: i=1; AJvYcCVDhzAfIZmKpHcqekMDTKEz+zu4RzaU5+D9FWPb1ruUJ11Au66L0KyNilCzUD2rF6lGZS6Nwh3a1UoR9oCA@vger.kernel.org
X-Gm-Message-State: AOJu0YxvDuV0JbzJ1yeMTW7bO7yebnZL7aGmilqdsVs4ddSnBptuyjGr
	0xO7s/fhjtS3K5EmN6h2HLveBkZPPTMOXFj/EDEubQnL7PwXTUv2ODA4z/I6eZi0DUpg9Rd8ue/
	yQWtk/v9zZ9J2TwXajXZNkZ1P5OmKPCFwCv1X4sy2Ix2OHQEBk9Oh7ChcSVI6qNnJuoUzkkEgP6
	HXHKfz7P1h34VxUNVH4Qu3f3MRnTnfJvwN5QDFnFN+Duw=
X-Gm-Gg: ATEYQzxOP6uvmQNgtpvm0bxuLqTNMfr07VP2ylEiYorbua4IJp3FTygTTEX97reh/Gl
	0WYTpvXcFY+Jh0v0+hhHoyLRmVeX2142zI7L0qOL9GCpBYFyUfSEDS4w93n6OgphszgxNWbOLB2
	o5WRYx6QTWu8bj2KeEFCuUNY84C726NULItledaIWDn0sJcb0d/pLMRI2wyi+gLLiIpXW/RJrch
	t0Ii7qK3VzOLzr3FsimHxIg+06HpZpCTe8Gwg==
X-Received: by 2002:a05:6870:fb8a:b0:41c:6bae:2307 with SMTP id 586e51a60fabf-41cec63bf99mr6133540fac.12.1774879736430;
        Mon, 30 Mar 2026 07:08:56 -0700 (PDT)
X-Received: by 2002:a05:6870:fb8a:b0:41c:6bae:2307 with SMTP id
 586e51a60fabf-41cec63bf99mr6133506fac.12.1774879736029; Mon, 30 Mar 2026
 07:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <45cad9a9-8bb3-4174-aa5b-7a7cb3b7603e@oss.qualcomm.com> <dcc83729-295b-4fb2-beab-bbea1daec7a2@oss.qualcomm.com>
In-Reply-To: <dcc83729-295b-4fb2-beab-bbea1daec7a2@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 07:08:45 -0700
X-Gm-Features: AQROBzDL6ig_KbiMSXTrORH4oZORYqMryEAtXqw9Iz3-jK_CaA9S6hXZtTmgKsE
Message-ID: <CACSVV02B9FOqi8w1VfgZXtvUxqDmsSsHMVF21qAAZNxDFTDNfA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Add driver for EC found on Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca83f9 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=N9dVvvH9XMu6gbUqmvYA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: r24o2wzu-gX9N7dGM97oYDxNqy5ZmX4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExMCBTYWx0ZWRfX0iac3fZw5d61
 roo90v+J1+RbdcCsoXrBYRof9NmmQLBMY3hx0MwNGtlXl2cznuYMw65qvpTOkgsiGG95/U2N3tw
 9mchV1oakcL8OygXUTgdeo1RqVTRUIK5qOKfYEpREIqOEuLrgLxWRpO/5YvP3onUd/wiVPrKmMO
 AzjhR8jrUw9XLOM31PLzgyl8VqiQ1TlbhebMQ3uDmTB/feDokgMs7bXbiNLVzkz/SHNIfKZ1Dd0
 FyCY2w3BeeDyVJ7cMZmTYooO33s2tYI+OqNAJ428Ls8qaDi/dYt2Y4+0nkNhPAacodxOD05S9s1
 0uQxNUgHRQ9EzwT86t6ga+keuJ8ce8zBypgcAhZzeGpMiEl7bI/TOs44A9qgQlAHTEBSi0uiLKP
 sCr/2xAM3VgwLFUMVg7g/Z2ll4HNII9fZaYgelvmuydYJUSPV2iw/QeQIP4X0jJascwAFR86g1n
 dgul8F303xsvfnYuvmg==
X-Proofpoint-ORIG-GUID: r24o2wzu-gX9N7dGM97oYDxNqy5ZmX4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300110
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100811-lists,linux-arm-msm=lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org,linux.intel.com,linaro.org,infradead.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: B19F335CA03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 11:57=E2=80=AFPM Anvesh Jain P
<anvesh.p@oss.qualcomm.com> wrote:
>
>
>
> On 3/29/2026 7:52 PM, Akhil P Oommen wrote:
> > On 3/27/2026 3:38 PM, Anvesh Jain P wrote:
> >> From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> >>
> >> Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
> >> reference boards. It handles fan control, temperature sensors, access
> >> to EC state changes and supports reporting suspend entry/exit to the E=
C.
> >
> > Just a question, is it possible to force fan to run at full speed
> > constantly? That would be helpful to keep the passive cooling minimal
> > and get a more consistent results while doing performance profiling.
> >
> > I see that you are registering a cooling device in this series. So I
> > suppose we just need to update the cooling sysfs nodes.
> >
> > -Akhil
> >
>
> Hi Akhil,
>
> Yes, that is possible. The cooling device registered by this driver
> exposes the standard thermal sysfs interface. You can force the fan
> to full speed by writing the maximum cooling state directly:
>
>   # Find the max state
>   cat /sys/class/thermal/cooling_deviceX/max_state
>
>   # Set to max state (force full speed)
>   echo <max_state> > /sys/class/thermal/cooling_deviceX/cur_state
>
> Where X is the index of the cooling device corresponding to the EC fan.

Getting a bit off topic, but is there a good way to associated cooling
devices and thermal sensors to the GPU device?  I could see that being
useful for nvtop (which currently supports shows GPU load and memory
metrics, but thermal metrics are missing for us)

BR,
-R

> --
> Best Regards,
> Anvesh
>
>

