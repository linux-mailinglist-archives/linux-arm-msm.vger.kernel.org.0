Return-Path: <linux-arm-msm+bounces-81029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD769C4718C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF01A4E0547
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5A4311C10;
	Mon, 10 Nov 2025 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gr/BdksQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2wfs4g0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F04311C2F
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762783576; cv=none; b=bT3WOoK1uK501MYhvChtEPtMUPM6lP3wFAccIw6YIvpU2He3nhilohBSLrFVOxCxExje9SEVC2mdtkY6bkpuX0lVaajBHKfhSpjQ5umm/2ceq4cvv/hbFLe5P/1xRb3ZnEREoRCJMVN1NMxwnxgnrlMjK36RI/6es8DDgpbePsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762783576; c=relaxed/simple;
	bh=L/CmvJYCyYfrJvD22vpA92Xdgu8gpWQ82QXdZUA9Vz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohid+4sjBej7M3OhqAI96NpeXRoM/RluAW5ZYyKmz1E2VJnrDMLDFiLCCw5UBh/nOCtduIYxA2gtUUdBrGqmcEadjGg1fMKmWGkE2Hp0jRoFHQbYq4zI+CuP1qagv/dFURSPl+szxQlWIGrAaJ/Z3+441u/Pu4E6TmkM3aFUoSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gr/BdksQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2wfs4g0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA8UDGx1810426
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 14:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUXRgMzr0O6XUgHM9OyGr8SqbOOjNjkdqNOeZDXnadI=; b=gr/BdksQK+r5Br+N
	S4urR3GLlEvoohCwwxlyiz1AVcTHVzu20BTfThsupKInBX1hT+Vri03YGUz5z+BH
	X9k+wlHlRSPZFtLb7VvzcKQDXbEuSy7QsySywxs06qVdui7PYfmtbE8Khq90afVg
	fwgfSRIYCrrG/jI1DyYlfVbE2zNcxrDoT6A4A49O0aXGt5RYbguaHKKuvKDadKB7
	DpWRd9IGQgS4AnwvPbF4vI4+K7uCrWCj6NFdrRgfpAR/uU6GnR5gzdJZTNomvs9L
	wwrZq8JxP1W2NNpGocNfbQFhBulX8DFEmyfBzKwYDopDkqfLB7qTXfOtkacs0L4Q
	Wkx9HQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1j3n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 14:06:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3418ad76063so3578558a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762783574; x=1763388374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUXRgMzr0O6XUgHM9OyGr8SqbOOjNjkdqNOeZDXnadI=;
        b=G2wfs4g0QnmH+BgKnZlEjVrT7JIW1UDCXs3ZjFz5okHuY+G0vYw7IhsJ8mf5RHQdYM
         kYDE1rp6tPi5IirrqN9UfllIOKSURW03uaSCPG/aIsLRnLgIxy/8zCnH+HCXqSCEHFrt
         moO0ADHPYh5FyyGXeb8Q+ZFwA0onjVsrZAR0EPI7bDrNZefE5JJg3xW0kE37ZNEDJdw1
         mR2IYLjcpQgM25Pk/fYobRriPTnvT4qYZQ0bdePlLBYB3P3gdPQFwzCqAy05bofzydgT
         0aXQ3Crx82/YYlJe1CenvVxOSTyy7GYrmru3Uu5izNfwePAWGyoskibfgIqVV+OQK9kp
         7Lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762783574; x=1763388374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PUXRgMzr0O6XUgHM9OyGr8SqbOOjNjkdqNOeZDXnadI=;
        b=ki1Qa5W0EX8npqgil7JZc+Eg43OSYJO2Zt+beiIezRnypMFpzddgegi2rI79lgyX5i
         dX7T9TgZ9qLyfMr2SqClb4JStw8KwN0LRk4Or6gTMmZFqnJDcfeeH3F55/uUxzWZTrwr
         gXojZIMPLX7/SyqV0OWzXvm4At2eCL8D0FD6tl/U8EsKMq9abuwga2036ejXy0knSLxt
         O82fsk5aKPDhhHr962M90ar+FZ58YkkU6rbNuKY+MQ/XsYWanF1uu5o+RePMYaQx/VQI
         tNjiotTDutf7oq3EVrp8uZMVQOPQc77sHp2n6v8Pi6ek9g+nWSrveRerScQrCoFyT2Fv
         GF3w==
X-Forwarded-Encrypted: i=1; AJvYcCVPu/S7QJaeuZdIdPgFba+ToK2TAxwKobL4AfoLgAXzj2VGcfHOGO6gqQND0MBQs0i8y5pmZUhkUYkwijWN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3VgrDglTZ1n3GfMvcCJ43Gf9svM0vVTxZggqRekLjGbaMiKhh
	dpI/aSpSbECtq+tI1jGOWr9C9rFsOXfzpNsUmSWMK1Ondp52TiUFCovlMv7DzF+lhohYVsuNGiV
	u4Te09zDUqcIVZRUUllIY3a3EhgmG/TmpsQB7CV9GJOggVTZ8+mw+nTR6vW7mtxd1kWn+ffc6TW
	4p3+sFf3RgNk05rmhh01qiyOvjcRjadSVaGs+S5hX4PgU=
X-Gm-Gg: ASbGncum/6SgUFbtgKFiHO6TwcLkbvSBFyIT5zhQ5HAuGJ5lkkMOaIfqU40CnbsOOsI
	Rxh0usAgVwtvj41NkDxLlzPZXCjdFNH8bTNNyUp40zBZNBqCc+ApClH1Dc2MWiOQ6DcexHsVf7p
	j+UU2gig89+r8dkT9/pM0ocj4a3HdBWT/YpR5AfeaQJRiyxq9JmZIcEkOsFIeiSuQc0YBNle3UZ
	OL3HAr/ycLXePk6
X-Received: by 2002:a17:90a:e7ca:b0:340:f05a:3ebd with SMTP id 98e67ed59e1d1-3436ccfe431mr8790516a91.28.1762783573530;
        Mon, 10 Nov 2025 06:06:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcZK/I+Oqj7cXYIYbymAdZsmrBRsLxABQMipK9Bn1Ts4Upxyiuw930Gmr6hZFgRBDHnDCcsb3fu4H6bnas7ys=
X-Received: by 2002:a17:90a:e7ca:b0:340:f05a:3ebd with SMTP id
 98e67ed59e1d1-3436ccfe431mr8790452a91.28.1762783573001; Mon, 10 Nov 2025
 06:06:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-18-24b601bbecc0@oss.qualcomm.com>
 <09b2ee28-ee2b-46a8-b273-110fb0b4d8a7@oss.qualcomm.com> <064d2a33-22e7-446e-9831-a390510698cc@oss.qualcomm.com>
 <20251103102651.ywxi7lqljsmjg7an@hu-kamalw-hyd.qualcomm.com>
In-Reply-To: <20251103102651.ywxi7lqljsmjg7an@hu-kamalw-hyd.qualcomm.com>
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 19:36:01 +0530
X-Gm-Features: AWmQ_bnH5-5jNfhWCOUYTXVu7I9tmNhczMz2vx19inA6uDgAVRKJo8Gomv4g6H4
Message-ID: <CADhhZXaD=ut7MCQD_uEvY1ew7o=rqUUtviaXwQSkE-nmvCxMhg@mail.gmail.com>
Subject: Re: [PATCH 18/24] arm64: dts: qcom: glymur: Add PMIC glink node
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEyMiBTYWx0ZWRfXwgEAFnJwu6YD
 Dche8880F1RuH1KReEBL6wKqwXC26Jtq+caFS/SHSYgkKE4RGlBegwdqMEmkmGP8YgMbxyvRnyr
 IrWRUNhym0kHUsgcrXljn2KGwZctdEiXIT2Yvi2b7rMoxy+7OrnSVkZWtFZTXzC+mBnr7MTItwc
 ZxAeQ2ehbcXa73YwIYJd25M03+BR8NI1If91zGSTHEB9CC+p1MDCxDH7KHrbixY+tc7w0k0A9Uz
 cwp36KldT1S8eininv6Vkru0eRNnGFNLLhM5j7qyf2MaLNhwwydtyidJp+vkfNaZdQnSiAOa2bM
 UDEAdHfFDIIxGA3v9SphmAb22NhHmGD1PuIdhhR9sMkPQM4KqdDMcxyfBB37/GL9Jbvpetg8r9Z
 ZNNOXXuBaIG887iWcJFT/fQiuBPoIA==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=6911f156 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_wFouAXmutvAtFiYnf4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: RITHsJgc7pm2RSuidkJVhMCrSxWszSyS
X-Proofpoint-GUID: RITHsJgc7pm2RSuidkJVhMCrSxWszSyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100122

Hi Konrad,

On Mon, Nov 3, 2025 at 3:56=E2=80=AFPM Kamal Wadhwa
<kamal.wadhwa@oss.qualcomm.com> wrote:
>
> On Wed, Oct 08, 2025 at 05:25:39PM +0530, Pankaj Patil wrote:
> > On 9/25/2025 4:02 PM, Konrad Dybcio wrote:
> > > On 9/25/25 8:32 AM, Pankaj Patil wrote:
> > >> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > >>
> > >> Add the pmic glink node with connectors.
> > >>
> > >> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > >> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > >> ---
> > >>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 28 ++++++++++++++++++++++=
++++++
> > >>  1 file changed, 28 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/bo=
ot/dts/qcom/glymur-crd.dts
> > >> index b04c0ed28468620673237fffb4013adacc7ef7ba..3f94bdf8b3ccfdff1820=
05d67b8b3f84f956a430 100644
> > >> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > >> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > >> @@ -79,6 +79,34 @@ key-volume-up {
> > >>                    wakeup-source;
> > >>            };
> > >>    };
> > >> +
> > >> +  pmic-glink {
> > >> +          compatible =3D "qcom,sm8550-pmic-glink",
> > > You *must* include a glymur compatible
> > >
> > >> +                       "qcom,pmic-glink";
> > > Are you sure this is still compatible with 8550 after this
> > > series landed?
> > >
> > > https://lore.kernel.org/linux-arm-msm/20250917-qcom_battmgr_update-v5=
-0-270ade9ffe13@oss.qualcomm.com/
>
> Sorry for late reply, earlier when we were sending this series our unders=
tanding
> was that we only need to support for usb shell, and anyway the device was=
 on the
> debug board so this feature(battery/charging) was not tested.
>
> However, after testing i found that the power supplies are getting regist=
ered
> properly however the data is not coming as expected. we are working to fi=
x this
> internally from the firmware guys.

As you had asked,  i was able to check with this patch (and firmware fixes)
https://lore.kernel.org/linux-arm-msm/20250917-qcom_battmgr_update-v5-0-270=
ade9ffe13@oss.qualcomm.com/

The qcom_battmngr driver is working fine with this patch included as well.
(though i faced some conflicts which i had to manually fix when
pulling this patch on latest linux-next tag)

