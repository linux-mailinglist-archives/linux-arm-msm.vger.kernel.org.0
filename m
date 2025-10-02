Return-Path: <linux-arm-msm+bounces-75825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31294BB46D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 18:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 478EA3A2B84
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 16:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376CF27453;
	Thu,  2 Oct 2025 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aoikIAgR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA3E4A0A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759420818; cv=none; b=N4e2DX4THnUFkWr1+druoiTE/vxdthi6dr1S9bhirWfnrxWQWYgq2ttV29PxnX7MGQ4NStUV0n9mmi67TKV9O0pVu5VLBOob0L4JU4/JzNbRlLoXngjsKuX9nvHPZDxjnILYx3eslwFIW0AFcESnhxozZKK6C6bBiTfeFTk/EE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759420818; c=relaxed/simple;
	bh=L55qLLAlJuHyhIu6IcAbTzxJ6Yc1Y9J1x5XdW+9c8Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lOYqk8anhv9rTWR0wEdSKR71NkERG8AFUkPh+vGKQfvtPi26MOiLCJcF2WKAS7c0ueSCqgmvtFb9CxUJb99jBQILT1rxpnkNYr9sTJZgaNI6v4vi3HtIYrhGRMj+Mo6c9KbWZnEJJEjVWnTUSkrZ4IbzmyMyfYz92w7EB7CbntY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aoikIAgR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5929bFRC025234
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 16:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrjEEtaRvE0dVyoT2k3VZr0XIqGIMCkFp8H+n7LB3d8=; b=aoikIAgRFTTgV0EV
	5ua5CbelK4JQFPbRaWpWSWtUrjdOTBUR1qTsLScNZs+mWIq5dpu1EG4GwNFM9hCk
	vS4CYMUKbuBvBUWs0EjEK6otojtUpoX/GKcLsW+f1IpsKlYfopLgZixfaQqWxn4E
	LBobMe+NDbmNNIaFSthRGfF1bIJCHlO2YnPBrMl2Mx0auRDQOJn/CMDa6L0PegnK
	IzOwCMHYhzpLVBiwJXWg1QQVi9/pEtvnhpVkEOE41BTQQSF+G8wk/RmGLlqT82S4
	uR8azAdn+gMKyYhb6fY98+zFbZ/IN2hYv0k3OTPzQhwILdCAA3kxPLjis23veqcF
	ZZglkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e9780347-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 16:00:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-829080582b4so357917185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 09:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759420811; x=1760025611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrjEEtaRvE0dVyoT2k3VZr0XIqGIMCkFp8H+n7LB3d8=;
        b=t5PGTUtKntAtme6yb95QuBziUPKw6c4W/nQJAXRhypiG4HVtM25yrDkc04nS/W1XtJ
         pU9NoUeAk2Bbn3FgSeQcxbyW/nKBBaJ0P4z58TCSx1+cu7rAHoICpvSD20w+TFT5bITr
         vJNXVe/6cSZAYllVIDUGE97z9X0NkjLB2NxeR4/Qxxf8vcQxzGuOJCjEBiA7pzgWhtfY
         XZOnsI9/j/aLdu+AK79grbf3oxAFiMTL8DplLJt3IRcGuYNR04K9805pabc1nSTNH7mZ
         0eSgiD129fZ5q8ti4jqfWlj/QSS0TnEwx8WFC9JRM8okCe/ZIbJBSI08o/b0VGkS5cJ0
         NmUA==
X-Forwarded-Encrypted: i=1; AJvYcCXlWi1OLiMMgvGmUsE0fNJ7al/OzrAf+t8ar+Y3vcCyhJsdPBFxdL3JBtTQVGlA1fqdXWBurGY44hjIAlby@vger.kernel.org
X-Gm-Message-State: AOJu0Yw51RAZ+A9Ce9aLnz5g3iwJq9enKR83abPFblws1TevYWokVkKL
	k9K2UcK39DJuSdR4D6Twzzjz+VJonKSclwBIovSR1zXMy0ZrrW0plD0AdKWITtKzpp5s+Hf/zR0
	ki27hVF3dGcwQK7kTMZPcwySihu6Lgj5R5eSej2xU3+RWxAMoKtfxIU+ijhCzVhD9loOwX2Kwv4
	lSbCrmMQduBa8YDdMvAJTRHw+EJ6WcF4dq1VM25jbVFvg=
X-Gm-Gg: ASbGncsycxPXH5g2rybBFdJ1zWpO/I092TUBcCLlIhESUdVhv5vvyn0H94txwcFuZVv
	kFnN5nUMrZ3cUJQoYcCs1hWIm0+N0dsj3Stsd6XD2oYF9gHncVrRS3K5+ZL3vfOslM/W0DJ5dId
	iLGldjUgCHhTFbHZqCkWX4Og/atKW9fLmG5rX7ou1KlG1Di/AQ5CRHukbgmFdL
X-Received: by 2002:a05:620a:2954:b0:858:f75a:c922 with SMTP id af79cd13be357-873705ee14dmr1151527885a.6.1759420810678;
        Thu, 02 Oct 2025 09:00:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmX8lkWW7JD1xPFoFK2TsnE5w970ZCeRAA3DNU2mdUhqhcpjReibtOkdWBCmDgCogGi7mq2UVyAmL/vymCMRA=
X-Received: by 2002:a05:620a:2954:b0:858:f75a:c922 with SMTP id
 af79cd13be357-873705ee14dmr1151518085a.6.1759420809940; Thu, 02 Oct 2025
 09:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <20250926073421.17408-2-loic.poulain@oss.qualcomm.com> <CAPY8ntC-Or2ErudHmP0mQMY6Rb8yQ53wkB5fW3b+4DTeeytbdA@mail.gmail.com>
In-Reply-To: <CAPY8ntC-Or2ErudHmP0mQMY6Rb8yQ53wkB5fW3b+4DTeeytbdA@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 17:59:58 +0200
X-Gm-Features: AS18NWBKPj2iACWebyncy890oBW9cdusAwWZYKBqMxptMXkMSqe-nJrKIx4MHK8
Message-ID: <CAFEp6-1tLTviqxheTxGeeBk8vt4Nm-qSBs1jV=CFPF83_6fUsg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: i2c: ov9282: Fix reset-gpio logical state
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, sakari.ailus@linux.intel.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: jmCUCBBaroA8DBlrnjLQOudWDM8BlnHK
X-Proofpoint-ORIG-GUID: jmCUCBBaroA8DBlrnjLQOudWDM8BlnHK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX78OKweTPW1Qb
 1AVMw6/6Zqo2Kh+fM3vm9LLBT6UbXUgqPLW9W2Ou16WTJkTpt3c99jdiDGjQnH/FBDmACB2G5mi
 uNC0YYFKB84QcIwcFvtMQteHF36k1fkvF97sVybEAGkI6GS5rj01UsF4bgiiI88vQdBaK39DTmw
 8R6EEmYX6KiFGB0RH7JLgGPQUnGbgHQN19JILPM+qumJLOlnGPxCA77ztC64rWS42tnJ+wTETSQ
 0tGH1bNGAqNtv2+40OrRX1tm0BuIfBXZlNxTgEbcsdSlgyVyBbRXTMKiXa/D4ez8SRs2sSZA7yK
 l/rx7IZ5rYFRPxdJzQs2qcooUtpQfh1hFKgnflKzZrAbQBxN+YoFJSBZp3Z4esu5XYGEySXchOd
 RqNi7S3PJkUV6EjcU37md6AqAvWBDw==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dea18f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=RF00TdSWAAAA:8 a=EUspDBNiAAAA:8
 a=-mY5VsyjxCvqmBmQmoUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22 a=_nx8FpPT0le-2JWwMI5O:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

Hi Dave,

On Mon, Sep 29, 2025 at 5:18=E2=80=AFPM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi
>
> On Fri, 26 Sept 2025 at 08:34, Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
> >
> > Ensure reset state is low in the power-on state and high in the
> > power-off state (assert reset). Note that the polarity is abstracted
> > by the GPIO subsystem, so the logic level reflects the intended reset
> > behavior.
> >
> > This breaks backward compatibility for any downstream dts using the
> > wrong polarity.
>
> Ouch. That'll be a nasty surprise to some if this lands, and
> particularly with a Fixes: tag so it gets backported to stable
> kernels.
>
> There are a number of sensor drivers that have been in the tree for
> multiple years that do indeed have the reset logic inverted as it
> wasn't something being routinely picked up in code review. ov9282,
> imx219, imx334, and imx274 for a start. Krzysztof sent [1] recently to
> flag that they are wrong and shouldn't be copied, but changing the
> behaviour feels unfriendly.
>
> I'll defer to Sakari as to whether this change is acceptable.
>
> Checking all my use cases, they use regulators instead of reset-gpio,
> so it doesn't actually have an impact.
>
>   Dave
>
> [1] https://lore.kernel.org/linux-media/20250818150025.247209-2-krzysztof=
.kozlowski@linaro.org/

Should I just clone what has been done here (pointed by Konrad) to
keep DTS correctness while ensuring backward compatibility:
https://lore.kernel.org/r/20230102114152.297305-4-krzysztof.kozlowski@linar=
o.org

Regards,
Loic

