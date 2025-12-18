Return-Path: <linux-arm-msm+bounces-85696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F6ECCC053
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 06B4C302F3A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517E63358CE;
	Thu, 18 Dec 2025 13:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6CnhYA/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ksrfDVpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC53313E28
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766064840; cv=none; b=FHQOlaoMB58gGSDtwSNLDQg703G8VDNNHhQANS0cdBazN+s9wmffjmkvgWWUmSLQbILB10URDo3CFhlRY+tDJcmL1/r56I2D5hx1aDgE54fus9vgU0bh0N8u3iL7RNOznKzpBFZP+LjSSbd8sofH0KzU60BMiWuXd9xl9ogswXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766064840; c=relaxed/simple;
	bh=lnyg40KUhEFPYZNdBZjXMbfSCXX9xwcbbpFyc1U/xNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVNRN9f8Xl4r+vlUjgyEUWodM6cl+ojInSQABbhV6U7jDfSEaqXqDV+fDoH42chk+NeE8OxcKbwpEwTtd1fcB6oDh6iP6esTD+5x+faHnKvhE3GwEiY4uN7l0kekHHAGXflw4OtqZEHFVFzwdH8dkqBhWUgOAtnvcbbjLcQ+LAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6CnhYA/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ksrfDVpY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9PelD4191394
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLk8SXiYprpUvnDvLbLafiQmZVsZ135ZwhPEfPUYFJU=; b=K6CnhYA/IWTwE5Up
	ZeJrbRhskLrlUPiFehZrVGdFfQFp+6z6vXcKXCRlLM7DP9qvDRWOwlt6KNeWe6LQ
	Dv6Lz6KTcP1sIOAhhH9CCthZ8cMGsqV2kWAvXKmC6zR8hr3tR3zNbcfYAHqfYWt3
	M1/LYxIsq2foNx/gUUn9SNZC7kCzFxYUNyMzriecJ7mvZo9fsLBL0+loWWdz5wbf
	g4q8tYTccLDI1QGqxiVMJLyJ6NQtwUqwtHCzzL+yrljcm2/R+kRXiwkOQG5XCbal
	CJvQnX7gPyi45LzIXhmTsfDIg1d8RZw1UyQbW4eShh03unS5RHDTVmrU8IxC85yW
	JSAUlA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b47pkj4t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:33:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c38781efcso1178697a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 05:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766064837; x=1766669637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLk8SXiYprpUvnDvLbLafiQmZVsZ135ZwhPEfPUYFJU=;
        b=ksrfDVpY2rsj3wMB24QCB2GwLI+SjTZyPbOZdHX2r4pfi/XtAqBPQcoYxCNxh20REG
         O1/kg+EbOos0ntg/ASObNqflMg5LKXJA+n+mFgSe5ypdpXHs6Jk5WSfJLtN9xhCp8izn
         8OyoZc7ZZ9qt9jEiS6ylNTOZ9ZcCG0dOPvDYiQLxbiO8qiwndqOpxRF93jkQKcYC2i1k
         Aic1/7jYOFY9W0ZJHBqFlVMgil9l9JqdJ6DAvyDUN8MCkC3IppdXDfipvdkPgMPpEOSO
         vX39Wb0ePGqEjHYhw7qJ0sATYtz7Zv5UE9NaxqyPAzLm0pqhNabyWM2c9Qzc/MlzGEgV
         796Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766064837; x=1766669637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jLk8SXiYprpUvnDvLbLafiQmZVsZ135ZwhPEfPUYFJU=;
        b=AiCT+GHw1OHS7XFTgiy1625bne1Nxl+HGA1rocJbOgrVUjQrkn+y6XeauNcdsqnq8P
         sx9pQ0gFAwoRE9JxBCpL8+UMsf6traGcI/RdJWfHkE/dZtHu4a1Tc6uG7i6OPfYFU5It
         zSXTvSlES+MkKN/VSLRNEc6a2HaFE5wxpzzbcLYQ+21+KgbsBy8LDk3E4OUVxrAgBWQB
         DbaSx/AKtnz1asZshRjKhrCx2yDV7oNTboLp1fch78RBZ8dRgZoK19C/aA0x0A0Lo/qe
         kjni5RVFXwS8PDQ/kYyaZWvmWNRHPbOHRlj75eWFcsn5NemkJmjIBZlKhXWQWBXTd8Xb
         pM3w==
X-Forwarded-Encrypted: i=1; AJvYcCWOvsOhvZEeLiQGO87TUMsBVs+5Ir9DxQ4cx9cO1fcoIHevIce26XgTUrTlzztMd9D6EQVVb0YAIt74uEru@vger.kernel.org
X-Gm-Message-State: AOJu0YwAGvSwagEZg8uksSAtJ0zhpEpazTEsaLvwLHxQ8kzK1KXnPS/K
	lzTeGQXJXH77X+ULQpeaq+n49Jnz5cPdXzFq+bppAEdk51MXt3xwTHu6EZ/bgmyNJpKlrtkhdVm
	lLTSHdwpb3dnWh+4noOLTzkzmH5mkObXbyILkaFpythhWNDC/hOQwKA1zpxAehtBc2dc0Ipw++V
	wD8ZLFAtfdLvdBbwWbaEgn8eHyHV/qk6CpPZcURb6gzso=
X-Gm-Gg: AY/fxX57JKL4CgGFbn9aKJ8SGYOPPIhjmmjiW5OJZHmUohLfPfiy0AOjfO8NHeWuYlx
	x7KOpXesx/725jlKVKp0PAp6UTg9hfjNaWWalMBJKErcjxw9nV/AePe9OnI5k//14w/EbNg4Itj
	eVrj1flGLuYzgF79Svc8PUYbo8CO0zCxCZatYIPM5YVnVOuAOb3VzqjueHtbumfYSTAMw=
X-Received: by 2002:a17:90b:2d83:b0:334:cb89:bde6 with SMTP id 98e67ed59e1d1-34abe3e0a40mr17088250a91.4.1766064837021;
        Thu, 18 Dec 2025 05:33:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgsf2vQNv0CNOtxC5mwAlsF7Af8JajfyasK6Rb1q2H+nBf6Kt9oxtXSF2qLF6Kmm13hAHAbQoUfTwZZvVEmmE=
X-Received: by 2002:a17:90b:2d83:b0:334:cb89:bde6 with SMTP id
 98e67ed59e1d1-34abe3e0a40mr17088218a91.4.1766064836449; Thu, 18 Dec 2025
 05:33:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-wip-obbardc-qcom-msm8096-clk-cpu-fix-downclock-v1-1-90208427e6b1@linaro.org>
 <8d769fb3-cd2a-492c-8aa3-064ebbc5eee4@oss.qualcomm.com> <CACr-zFD_Nd=r1Giu2A0h9GHgh-GYPbT1PrwBq7n7JN2AWkXMrw@mail.gmail.com>
 <CACr-zFA=4_wye-uf3NP6bOGTnV7_Cz3-S3eM_TYrg=HDShbkKg@mail.gmail.com>
 <f902ebd4-4b4a-47c3-afd7-2018facdaad6@oss.qualcomm.com> <e2eg3zk2sc7pzzlybf6wlauw7fsks3oe6jy3wvbxkgicbo3s2g@tks2pgigtbza>
 <5e255831-3e84-4f3f-8b4f-c66d05e6be09@oss.qualcomm.com>
In-Reply-To: <5e255831-3e84-4f3f-8b4f-c66d05e6be09@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 15:33:45 +0200
X-Gm-Features: AQt7F2p3sO84AEGdlajb_bnGjwVEOm9heGbIyV8I4pKxXUyFoxAcwe9vyWQ_rCU
Message-ID: <CAO9ioeVBk0CLGcdUdbixVGwGfheOaVwX=i39JovHa740mO4kRg@mail.gmail.com>
Subject: Re: [PATCH] Revert "clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb"
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Christopher Obbard <christopher.obbard@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: DYYf-va8ake6mBXyJ6n2gjgZFD_fOw5H
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=694402c5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=CAFnV92_3V8pvHR-v9AA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExMiBTYWx0ZWRfX4xM6Gqd0K9by
 IHfK/ffNtIjbnYiiLAij5tfs8zGSZQuxN6pDcKj+wHMYzh/D+14dXA5VdxhBkko5g3Lp9C9qncQ
 nol1+b+8iGPyMUUdgB/cG/wcTzQJOm2TA/BdKgSxPTrt2dKa/RBja9+M2+iBLxWkRTxN5mSHgr3
 w/PwhAMlRPvOYy8V9y0ZAINTpdxW3wKkaA2Q1z7x77wNgUATeReZTpw1QIiZ0RalzUgETNuHgiE
 ZNPwn3UpRD9y8c2kRPJhDlJENGWC0wlokJtrOuoQeSnUz2idPEJCVYpm/Z0c9RhPKI+hAAjKZtJ
 dFEPu1wc9BdvUSbp3bKroIV6y+trvqlTVqYCZbaux69xjNJQ0jfMvqdYttaBx9Yultv58ihMTgo
 FP6aa1vL1fjeEqD3Nv7vwL+WSeGudQ==
X-Proofpoint-GUID: DYYf-va8ake6mBXyJ6n2gjgZFD_fOw5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180112

On Thu, 18 Dec 2025 at 15:09, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 12/17/25 5:39 PM, Dmitry Baryshkov wrote:
> > On Wed, Dec 17, 2025 at 01:22:59PM +0100, Konrad Dybcio wrote:
> >> On 12/14/25 8:26 PM, Christopher Obbard wrote:
> >>> Hi Konrad,
> >>>
> >>> On Mon, 8 Dec 2025 at 22:36, Christopher Obbard
> >>> <christopher.obbard@linaro.org> wrote:
> >>>> Apologies for the late response, I was in the process of setting som=
e
> >>>> more msm8096 boards up again in my new workspace to test this
> >>>> properly.
> >>>>
> >>>>
> >>>>> It may be that your board really has a MSM/APQ8x96*SG* which is ano=
ther
> >>>>> name for the PRO SKU, which happens to have a 2 times wider divider=
, try
> >>>>>
> >>>>> `cat /sys/bus/soc/devices/soc0/soc_id`
> >>>>
> >>>> I read the soc_id from both of the msm8096 boards I have:
> >>>>
> >>>> Open-Q=E2=84=A2 820 =C2=B5SOM Development Kit (APQ8096)
> >>>> ```
> >>>> $ cat /sys/bus/soc/devices/soc0/soc_id
> >>>> 291
> >>>> ```
> >>>> (FWIW this board is not in mainline yet; but boots with a DT similar
> >>>> enough to the db820c. I have a patch in my upstream backlog enabling
> >>>> that board; watch this space)
> >>>>
> >>>> DragonBoard=E2=84=A2 820c (APQ8096)
> >>>> ```
> >>>> $ cat /sys/bus/soc/devices/soc0/soc_id
> >>>> 291
> >>>> ```
> >>>
> >>> Sorry to nag, but are you able to look into this soc_id and see if
> >>> it's the PRO SKU ?
> >>
> >> No, it's the "normal" one
> >>
> >> Maybe Dmitry would know a little more what's going on
> >
> > Unfortunately, no.
> >
> > Maybe, the best option would be to really land the revert.
> >
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Is there a chance that this removal:
>
> -       case POST_RATE_CHANGE:
> -               if (cnd->new_rate < DIV_2_THRESHOLD)
> -                       ret =3D clk_cpu_8996_pmux_set_parent(&cpuclk->clk=
r.hw,
> -                                                          SMUX_INDEX);
> -               else
> -                       ret =3D clk_cpu_8996_pmux_set_parent(&cpuclk->clk=
r.hw,
> -                                                          ACD_INDEX);
>
> could have been the cause?
>
> On one hand, we're removing this explicit "set ACD as parent" path, but
> OTOH determine_rate should have taken care of this..

My idea was that we switch to SMUX temporarily, then CLK framework
fixes that for us while performing the actual reparenting.

Christopher, as a quick check, could possibly revert just this chunk?


--=20
With best wishes
Dmitry

