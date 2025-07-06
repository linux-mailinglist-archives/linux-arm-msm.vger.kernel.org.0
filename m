Return-Path: <linux-arm-msm+bounces-63864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D43FDAFA6EE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 19:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B1013A30DC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 17:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39987288531;
	Sun,  6 Jul 2025 17:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="likQLbt6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C39713CF9C
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751824291; cv=none; b=bo0kjXEw6vMG4FQUgWa91pV+WQqVMYXnDpZhA+e8Hk3n6V3rr0m010gCCVI0ZGpOTlJbWYO7+Mpz4sAURgOhILL/RBx0TvbaGcZI2iHizku3JxdR2F+BqetWKGso6f93Qu5e6r/P1Bp7tFJKOJgqsx5eCkDe2fQ/saVxvfdJUaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751824291; c=relaxed/simple;
	bh=dChJTGZn8G3JSF+xUlkCPdn9/tfQniGS7rIMUAbxqiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOSb8nzweY850gHBfKuLXfftROdybjsS9a7OKfI10n8UsZ0DClQhwMZR/1Kq9Yay+/9Cu6Y5LgHyk1WZPR43Y24m3bFEkVJasr6eaaErh8ls/QPxeENf15SK5AuHT0r48ujb9F88HCW1Fie2LUrKxcDw53xm6C9M8g5ASc3mh3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=likQLbt6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566Ccef0024736
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 17:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=LOX59rWqByosVSw0xaHgEnKypfzIaPx5HQ8Gnd0xkM4=; b=li
	kQLbt6c6JFl9/yDeu0PLNWkpj1eyrRI2PX8dpIt6o13ESNG6kDR5n/TrGkBAq0aa
	oWox/26OrYG0SMncLOX5FVSAYf9rFICArt+ure93zCgQMAy9NHZjkdLmsGTES30f
	nwpQkGZqtDCY6UtkfeWZ7lqg8Lc75TLgeu6EJBqUIgI2O/5KVfUz+Nmc/trADOP9
	uRFxxqvZVDyYsjDz3P4vfvkytM6qRuJy6YSxEEl8wpPMVwl5njIRrHBPP0DN3G74
	Yn5DMZyszkq9PGJXtKWCdG/wiqWMcEFpcV9TAJy62tJzH2UP8q6lSp5sSnhyeUJE
	04OCfiitXFztY1nOanYg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmdmv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 17:22:42 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-40d04995b67so539654b6e.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 10:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751822561; x=1752427361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOX59rWqByosVSw0xaHgEnKypfzIaPx5HQ8Gnd0xkM4=;
        b=JZQg/CwIBzHUV85cDPMTNMy0+twCgkyxiVA7k/LXj8Bbo7aBt5ckqAYZxxUKi6yN1y
         qiMjC4ufJiG6BdWTUrsxpU7RVhf3freJIXC6XCKMtmb9Npzlu5Hn6TR634X7uFl+Q8I5
         +6PsPG1EQZ+H3uhf1FbSnrIJPIcZatij0wqtbxt0aq7VoLYfUZtYkq/C+dffZSnp6OT9
         UR72zxLv+jJHa/uB93e6gFmvFDdWpvYD0+jf4DO1t5CyAxQiCkGVSkZ/ovWmSUGXIm79
         TSIjEA7jUCLsWsLqr0d6ZNfkLJO2NU6De+fio2Un3v1Thtezo1dE629nsear0lFv0uYN
         iiJg==
X-Forwarded-Encrypted: i=1; AJvYcCUVRCEGpU1EddgPN5JFBEEIaIXdW7D51xSd6DiU5mNK2tbXEFLgc0iRz4Qh/246tZLb16LJLJ/UEaB1dUsx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3dOl5IdCBtugZMzjKuFvCO+pdu/aaY3nqVWWZDlUIfxpZ+Am9
	qdeo4KjxNrajB2t9gY/+rHDH5hRWzEwh/NtpWuOW0OYybc8BqXkeXhFUM0x2bdsJ5EjRLNlgWwD
	PtjXdKXDZQsSOMF+GK5r+GHfMj9npw09gdOHwyelT/3MiSahA4k+mLpCH0n2S0S4YIzFSH3lmDC
	r+sOo/Sxi/9JjcTsHUQsx1B6IwQeCLF4VpncCb9BnCvj0=
X-Gm-Gg: ASbGncsKAX3GYbB/O9Nv9fn1s3MPGqjlFF2seesqJCI8yaUM5g+6puwGP4WLJKs5An8
	XARF2xOkCB3ZY4E5rud1jnGpq4i9KXoCjnUQPVWw4d+fgAod7fG6H3quGSi65xxhBsvzASezudc
	K0r7rqSeMYhmZoHvri1YehfsWRCiKUx8LFh0g=
X-Received: by 2002:a05:6808:bc9:b0:40b:3816:6637 with SMTP id 5614622812f47-40d04430f90mr7183401b6e.24.1751822561162;
        Sun, 06 Jul 2025 10:22:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRx8YlZAXZI87WKI5wrFWMyyqOATVu6msOEMWXwTOG7myzreBVkUpyGxA8QIeqknVC/HOkS5l0RcGzJOGUVA8=
X-Received: by 2002:a05:6808:bc9:b0:40b:3816:6637 with SMTP id
 5614622812f47-40d04430f90mr7183385b6e.24.1751822560811; Sun, 06 Jul 2025
 10:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
 <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com> <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
 <CAO9ioeX0ffO8-v-mZaefFbyjOcCqGyu++gFjaMkpHPMyVOwE_Q@mail.gmail.com>
In-Reply-To: <CAO9ioeX0ffO8-v-mZaefFbyjOcCqGyu++gFjaMkpHPMyVOwE_Q@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 10:22:30 -0700
X-Gm-Features: Ac12FXw9ekp3dldeCvMfuxN3qhkGwT6jmeHSunKw3NKlYFi5TZD1Bc0FmrK_Dgs
Message-ID: <CACSVV03JP-jRAJfB0NYNty=VZFVgrYPDkzkg27YYrgJBu1ymxA@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686ab0e2 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=N1quPeXg1Wl-6W9anc4A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: WFFy8xGZ7R53_Veg-FN0L0stEuopogh2
X-Proofpoint-ORIG-GUID: WFFy8xGZ7R53_Veg-FN0L0stEuopogh2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDExMSBTYWx0ZWRfX5kqwfrLn1fKm
 FU1xlU9xVjFxivd9ipREzbNQBWd7VXdOPsBZvrsDAByJk2XHAA9JdSNvxaGh83C2Jb6lcoJXNxN
 WIyohC6uiKyMxFUAOTEORq9SJ1ObDuGvLrHH1ln2fUyO2bu7N40Zj3GA2m11UQKMHSEZMZ8ZTpA
 q/lYy1/gi5YupSXA4MNFzUZ5HvpYbvCRk8ZU4TaKBpr8FU4Km2fXCzy26qQlcRV1aEHSyMb1AGU
 TSM0DDj4+S+Aw73KJyuvJVgqRGM74d3YDeTwECw8g8utNzxSwoq7Ni6cYMw5jdkM1DokXlRKaH0
 gh7HjdZiuUgdV8fDH9Mw07RC6cB00MCoYSSYHXxpYkp2NRkSx6zrm+G7AxCE5avfLWelHKR8EMF
 3NSqLB2FwcMB105WF13x+JnjzNZPY37o1dXhqXq60jKzKQC1WUVdh/lBq60F9uJPo4vB1t1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=626 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060111

On Sun, Jul 6, 2025 at 9:38=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, 6 Jul 2025 at 18:20, Rob Clark <rob.clark@oss.qualcomm.com> wrote=
:
> >
> > On Sun, Jul 6, 2025 at 7:22=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qual=
comm.com> wrote:
> > >
> > > On 7/5/2025 9:38 PM, Dmitry Baryshkov wrote:
> > > > On SM8250 / QRB5165-RB5 using PRR bits resets the device, most like=
ly
> > > > because of the hyp limitations. Disable PRR support on that platfor=
m.
> > > >
> > > > Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup=
")
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >
> > > Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > >
> > > Unfortunately, there is no way to detect firmware support for PRR saf=
ely
> > > from KMD.
> >
> > I still am a bit curious about whether it is the ACLTR write that
> > trips the fw out (doubtful, since we write other bits in that reg
> > AFAICT) or the PRR_CFG_LADDR/UADDR write that does it.
>
> Indeed, write to ACTLR seems to go through, writes (or reads) to
> PRR_CFG_[LU]ADDR cause a reset.

ok, that is what I suspected.. I think if we can somehow figure out
what the inaccessible LADDR/UADDR values are, we can come up with a
reserved-region workaround

BR,
-R

> > In the latter
> > case we could potentially use a reserved-region for the PRR page,
> > instead of dynamically allocating it (if we knew what values are in
> > LADDR/UADDR.. I guess 0x0?) to avoid reduced vk functionality on these
> > devices.  AFAIU the vk extensions that depend on PRR are required for
> > vkd3d.
>
>
> --
> With best wishes
> Dmitry

