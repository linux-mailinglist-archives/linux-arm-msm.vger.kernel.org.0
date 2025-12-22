Return-Path: <linux-arm-msm+bounces-86174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B17CD5477
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D6863010CC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9118C221710;
	Mon, 22 Dec 2025 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZeyGeEca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GY6tFrSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DA230DEBC
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394943; cv=none; b=LFVE+/QnSHW+49DQeIQAw8VPAYqog95e2YBmwPdVWrg7/bPRXA38qHzAzgqH+f/peuZN94mxqoQ4Y1cplq/GR2SRXANzuWOk1aYLZ+iQcRFYJawqaV2R6yMgO1I4Ok03FFI4KMFrphq0dQDCqJM/eEYAjUjJyfInKF7WGAZjfCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394943; c=relaxed/simple;
	bh=8MGzKxYQ/qambufL4cZNOGpw1L7b7D7FgxqD1wsHs04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRDS97mgJnY610WqJQinpsuC+nbVLYPYhSDJxCwmxZHE25dOGPSUrymnZekCWW2hOKXWway2MThKcoeZnah2qRmV4wlOAFbWScDXmt9NZuieQCM5/fI6gLSmVMZdCdhZLU39BEWRPuPFIadozE/h8T75gWl8adwuIvXWL2sTmjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeyGeEca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GY6tFrSD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7mi1x3386689
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SAGqqkDxnQOETQ6A2lr8RQHn
	wvjGWEvaTjk/ukztY6I=; b=ZeyGeEca3205l4ORn51Fdf56tsdOKiynMdpnMLza
	KYFZu7TBpbWzGsaE539ZdIdKJ3V2D9Iv/ZRITmI3GZd1NdgdDjO8IjLFlUpZMtC9
	VYMLs5XMHLiC71FZfJbKqRB1Z1Fc22IvcO965CpukGx2ge499AXVKJmjnmgvW7CA
	iitPq3AYG5DftpgUGlVk+onbkDkL3pPSd1oMvKi2HIJhmUDQ4mW5v868fG8eatAE
	W3CHKYjKqdPEtc4baMysUY6Qn7l42jV+FAFYvQQ3ut3rmd4QfSo8JD6cPqkFhvEg
	DXd59m3Y0mmJIfc5LUmE3Dp30zxjWDnhooFukpBwBSgNmg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqmfr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:15:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so4188105a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766394939; x=1766999739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SAGqqkDxnQOETQ6A2lr8RQHnwvjGWEvaTjk/ukztY6I=;
        b=GY6tFrSDsYcFYzo+OsQz4tEwZNjH2vc927rZXHjqZsu6ezp/B5O5A369/J0IogGYIU
         90kolzty8r3ZAGwn6zheT512tHn7JCToMbNzTUb6OCmt2NEbKgUVtViolMiss/na/eB3
         wHbkxQiJwVvCsZIHotOrfzQFvD9In22jXmPIyDlqq5yd3z4FkpCZBjgeuXeif3ecmDaI
         Fi4oVHJaEijoszyU9qKDjVK9TwgEIWaTL9Si8j2/8jwPDJ7CYq4K0DBFLrd4tvY7NZM7
         M1yBF2x/joRipilXEsmGn53NrG+IOPEn65X5GS4cRS/BvZmnLUqqLeu+qMMycLO/MJs9
         aisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766394939; x=1766999739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAGqqkDxnQOETQ6A2lr8RQHnwvjGWEvaTjk/ukztY6I=;
        b=t1QBNCm0s0tE9Umxmu81AWRcjdRdeojlI+TyxRRn950q0qvkGVMj++Sy2MFf4igfOn
         Th8g9VVo6A2vhFrwv//TdfNt0gocPMiKvw729j2apjIb1SsRpDjaO+sf4OfkanqC3rAM
         KqmG5i4P5sePJZC7Zn4KipQ7q+zfwPlWVwd25zYdmBdsap4Nx6Fna+7Q7wPHkgjnd4vk
         F9Vqjse5OB7nZPvJcof8j+thvqlxpeVasjGChaFX7UrG7EC1oUHN0G296RXJDjTOxgGU
         CRI4cvXo/nNrZuUReDXJx6Voys39nIl/MUma1DscovMUlPcMGSaM3dU8kp793RWlIy+9
         iNNA==
X-Forwarded-Encrypted: i=1; AJvYcCVTCO9zk+/2mHmpBWDngAam/ZQMThxALuwALtvNvFrtUWoOo3V1fCERFwlVwfxyunMBVFTPZxhQ6FUvMJ52@vger.kernel.org
X-Gm-Message-State: AOJu0YynJgm+MZB2rrjNpfJJTyB3TiUPx39h4sw6bRgvcsqSS1u6XbMe
	lkPfPkoY/K6Sh9Rm1VTx6JhVwDBFyaeJTPzf/3KvToa2XUrOSnWwB9aD3IcOlHGVg8muBR6NpSF
	6FlsaIe0G4UqVGnwLkMsePNKepYcMDalQXSVNxKsblH10fApgDczVZTtd5Kff8X0cxXg8NVJH1Y
	SXt+CQq/pbyIG1GKNAwlRqfBbAGyBwRlTCwO//A1LyJhU=
X-Gm-Gg: AY/fxX42msaMIA1GQMIX37WbbRPa5De3oWKDCGVr/dLQEkTK2ORwjbB/vmPtihHcE9m
	/NghjDRqltrXOArv7kIfhanb0hIHe0Jx2b/4MFVqsC1iQCAk4NNh/zwKe69Cgf1ikf3QTz5st7K
	fD3SmsfMqJfCx3YRlxgEDF8D+ONKaeEcEenGYm6BwlFj8mJTnvLknZuyxWuHu/Yv8vBillSWpJh
	uKiiPdv
X-Received: by 2002:a17:90b:580e:b0:340:c179:365a with SMTP id 98e67ed59e1d1-34e91f6c085mr8540424a91.0.1766394939274;
        Mon, 22 Dec 2025 01:15:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdWjFmCJ3rN1M6axq/0TfkrinCUile+xnFomj+mcjrMdNMwpxIjIa8Op3EfgtrthHKSCqP4lzYpmqP/jYop/4=
X-Received: by 2002:a17:90b:580e:b0:340:c179:365a with SMTP id
 98e67ed59e1d1-34e91f6c085mr8540401a91.0.1766394938594; Mon, 22 Dec 2025
 01:15:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com> <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com> <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
 <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com> <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
 <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
 <030a8eb3-c79e-4be0-8305-7c9bb2005785@oss.qualcomm.com> <wwrc637p5nkz6ptuef2hrhyjgqnyifcztlkjrqyw4764vg6jpf@wso4tp6onb5l>
 <1afebfb7-00aa-4f19-b6c7-dd6fadb83664@oss.qualcomm.com>
In-Reply-To: <1afebfb7-00aa-4f19-b6c7-dd6fadb83664@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:15:27 +0200
X-Gm-Features: AQt7F2rMW6zMGcmCg7JttLGOHszdUQSLeOUUZjlwigtbIlbhAjEFgTk9jEvqaCY
Message-ID: <CAO9ioeXqP5i9hEa-DfrEvK3U-3py9KjdMmWnjzZ9kGd4BPqdYw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: IPm8WlsMzqA9z6Nl-KdRDQVL-VBCWUIY
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=69490c3c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=RMOT5V3lTFKcIcGDt-0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: IPm8WlsMzqA9z6Nl-KdRDQVL-VBCWUIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfXwiEWnTmClmLm
 xfuBj/MZdF6ZBhuuk6AMkoj0Xh8zQ5jfCUdWvQwS7FERev+Wx1oOoufgXUa5INymbungaOK7D+0
 rPbu75ePUOfwY4MqqC7eotBHtx8QCYQyfSgb3aTYMcWLIm79PJokF4DoesGXSeBpY/IYFLDBtQJ
 uwNqDxNfgt7IOLVJUnCBHXAdsxqm+mMz7dTXCNR4ucP4AyZkG3OatAb0QoJwyvVmi8WMrHUgfmE
 Ok5+28Z2aTPfmhewUxLzOEpF8BSvs8im9t/Pcqe08aeEj53JBHW8PERlEHg3ZxaiBPxg4vyp1js
 BRKYW5B09OrqUi3KXm/Y/oVhnSPvHf5+VZFHoGOVczzGGZUZuK6ukh7ETHvYK3GjvfnJao4YNnx
 SHrQn0NCab+xc9NRdCwsa1My14Ixsgpgg8LXahasOSnjoLIdJHfCq8jQL6mhGamIQOQVoiGILLE
 3CwkJ4Sr3UOu3vGw7NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220083

On Mon, 22 Dec 2025 at 09:19, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>
> On 12/13/2025 12:58 AM, Dmitry Baryshkov wrote:
> > On Fri, Dec 12, 2025 at 01:01:44AM +0530, Akhil P Oommen wrote:
> >> On 12/11/2025 6:56 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Dec 11, 2025 at 05:22:40PM +0530, Akhil P Oommen wrote:
> >>>> On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
> >>>>> On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
> >>>>>> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
> >>>>>>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
> >>>>>>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
> >>>>>>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
> >>>>>>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> >>>>>>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>>>>>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> [...]
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> +                        gpu_opp_table: opp-table {
> >>>>>>>>>>>>>> +                                compatible = "operating-points-v2";
> >>>>>>>>>>>>>> +
> >>>>>>>>>>>>>> +                                opp-845000000 {
> >>>>>>>>>>>>>> +                                        opp-hz = /bits/ 64 <845000000>;
> >>>>>>>>>>>>>> +                                        required-opps = <&rpmhpd_opp_turbo>;
> >>>>>>>>>>>>>> +                                        opp-peak-kBps = <7050000>;
> >>>>>>>>>>>>>> +                                };
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> >>>>>>>>>>>>> or mobile parts specifically?
> >>>>>>>>>>>>
> >>>>>>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> >>>>>>>>>>>> here.
> >>>>>>>>>>>
> >>>>>>>>>>> The IoT/Auto variants have a different frequency plan compared to the
> >>>>>>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
> >>>>>>>>>>> except the 290Mhz corner. We can remove that one.
> >>>>>>>>>>>
> >>>>>>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
> >>>>>>>>>>> speedbins from the mobile variant until that is supported.
> >>>>>>>>>>
> >>>>>>>>>> No, we are describing just Talos, which hopefully covers both mobile and
> >>>>>>>>>> non-mobile platforms.
> >>>>>>>>>
> >>>>>>>>> We cannot assume that.
> >>>>>>>>>
> >>>>>>>>> Even if we assume that there is no variation in silicon, the firmware
> >>>>>>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
> >>>>>>>>> wise to use the configuration that is commercialized, especially when it
> >>>>>>>>> is power related.
> >>>>>>>>
> >>>>>>>> How does it affect the speed bins? I'd really prefer if we:
> >>>>>>>> - describe OPP tables and speed bins here
> >>>>>>>> - remove speed bins cell for the Auto / IoT boards
> >>>>>>>> - make sure that the driver uses the IoT bin if there is no speed bin
> >>>>>>>>   declared in the GPU.
> >>>>>>>>
> >>>>>>>
> >>>>>>> The frequency plan is different between mobile and IoT. Are you
> >>>>>>> proposing to describe a union of OPP table from both mobile and IoT?
> >>>>>>
> >>>>>> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
> >>>>>> has speed bins. How comes we don't have bins for the IoT variant?
> >>>>>>
> >>>>>> Mobile bins: 0, 177, 187, 156, 136, 105, 73
> >>>>>> Auto bins:   0, 177,      156, 136, 105, 73
> >>>>>>
> >>>>>> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
> >>>>>> starting from bit 21).
> >>>>>>
> >>>>>> Mobile freqs:
> >>>>>> 0:         845M, 745M, 700M,       550M,       435M,       290M
> >>>>>> 177:       845M, 745M, 700M,       550M,       435M,       290M
> >>>>>> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
> >>>>>> 156:             745M, 700M,       550M,       435M,       290M
> >>>>>> 136:                         650M, 550M,       435M,       290M
> >>>>>> 105:                                     500M, 435M,       290M
> >>>>>> 73:                                                  350M, 290M
> >>>>>>
> >>>>>> Auto freqs:
> >>>>>> 0:         845M, 745M, 650M, 500M, 435M
> >>>>>> 177:       845M, 745M, 650M, 500M, 435M
> >>>>>> 156:             745M, 650M, 500M, 435M
> >>>>>> 136:                   650M, 500M, 435M
> >>>>>> 105:                         500M, 435M
> >>>>>> 73:                                      350M
> >>>>>>
> >>>>>> 290M was a part of the freq table, but later it was removed as "not
> >>>>>> required", so probably it can be brought back, but I'm not sure how to
> >>>>>> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
> >>>>>>
> >>>>>> I'm a bit persistent here because I really want to avoid the situation
> >>>>>> where we define a bin-less OPP table and later we face binned QCS615
> >>>>>> chips (which is possible since both SM and SA were binned).
> >>>>>
> >>>>> Why is that a problem as long as KMD can handle it without breaking
> >>>>> backward compatibility?
> >>>>
> >>>> I replied too soon. I see your point. Can't we keep separate OPP tables
> >>>> when that happen? That is neat-er than complicating the driver, isn't it?
> >>>
> >>> I have different story in mind. We ship DTB for IQ-615 listing 845 MHz
> >>> as a max freq without speed bins. Later some of the chips shipped in
> >>> IQ-615 are characterized as not belonging to bin 0 / not supporting 845
> >>> MHz. The users end up overclocking those chips, because the DTB doesn't
> >>> make any difference.
> >>
> >> That is unlikely, because the characterization and other similiar
> >> activities are completed and finalized before ramp up at foundries.
> >> Nobody likes to RMA tons of chipsets.
> >>
> >> Anyway, this hypothetical scenarios is a problem even when we use the
> >> hard fuse.
> >
> > So, are you promising that while there were several characterization
> > bins for SM6150 and SA6155P, there is only one bin for QCS615, going up
> > to the max freq?
>
> I have cross checked with our Product team. I can confirm that for both
> internal and external SKUs of Talos IoT currently, there is only a
> single bin for GPU with Fmax 845Mhz.

Okay. Thanks for the confirmation.

What happens when somebody starts working on a phone using SM6150 SoC
(e.g. Xiaomi Redmi Note 7 Pro)?
Likewise, If I understand correctly, QCS615 RIDE aka ADP Air uses an
auto SKU rather than the IoT one (please correct me if I'm wrong
here).

>
> >
> >>
> >>>
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Also I don't see separate QFPROM memory map definitions for Mobile, IoT
> >>>>>> and Auto SKUs. If you have access to the QCS615 hardware, what is the
> >>>>>> value written in that fuse area?
> >>>>>>
> >>>>>>> Another wrinkle we need to address is that, so far, we have never had a
> >>>>>>> dt binding where opp-supp-hw property exist without the speedbin cells.
> >>>>>>> And that adds a bit of complexity on the driver side because, today, the
> >>>>>>> KMD relies on the presence of speed bin cells to decide whether to
> >>>>>>> select bin via opp_supp_hw API or not. Also, we may have to reserve this
> >>>>>>> combination (opp bins without speedbin cells) to help KMD detect that it
> >>>>>>> should use socinfo APIs instead of speedbin cells on certain chipsets.\
> >>>>
> >>>>> If it is a soft fuse, it could fall into an unused region in qfprom. On
> >>>>> other IoT chipsets like Lemans, Product teams preferred a soft fuse
> >>>>> instead of the hard fuse. The downside of the hard fuse that it should
> >>>>> be blown from factory and not flexible to update from software later in
> >>>>> the program.
> >>>>
> >>>> This response is for your comment above. Adding to that, the value for
> >>>> the hard fuse is mostly likely to be '0' (unfused), but all internal
> >>>> parts are always unfused. Maybe it is 'practically' harmless to use the
> >>>> freq-limiter hard fuse for now, because 845Mhz is the Fmax for '0' on
> >>>> mobile, Auto and IoT. I am not sure.
> >>>>
> >>>> I am trying to play safe here as this is dt. We don't want to configure
> >>>> the wrong thing now and later struggle to correct it. It is safe to
> >>>> defer things which we don't know.
> >>>
> >>> What is "soft fuse"? Why do we need an extra entity in addition to the
> >>> one that was defined for auto / mobile units?
> >>
> >> The hard fuse (freq limiter one) has to be blown at a very early stage
> >> in the chip manufacturing. Instead of that, a soft fuse region which is
> >> updated by the firmware during the cold boot is used to provide a hint
> >> to KMD about the supported GPU fmax. I was told that this provides
> >> better operational flexibility to the Product team.
> >
> > Do you have an upstream example by chance?
>
> We use soft fuse for Lemans IoT.
>
> -Akhil.
>
> >
> >>
> >> -Akhil
> >>
> >>>
> >>>>
> >>>> -Akhil.
> >>>>
> >>>>>
> >>>>> -Akhil.
> >>>>>
> >>>>>>
> >>>>>> We already have "machine" as another axis in the GPU catalog. I'd
> >>>>>> suggest defining separate speed bins for mobile and auto/IoT in the DT
> >>>>>> (0x1 - 0x20 for mobile, 0x100 - 0x1000 for auto) and then in the driver
> >>>>>> mapping those by the machine compat.
> >>>>>>
> >>>>>
> >>>>
> >>>
> >>
> >>
> >
>


-- 
With best wishes
Dmitry

