Return-Path: <linux-arm-msm+bounces-75677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D5FBB0512
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 14:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CC422A246F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 12:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D2B2D063E;
	Wed,  1 Oct 2025 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STCRlEs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C80A277CB3
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759321410; cv=none; b=t+7I1TSyrdWpsq7jtN4O7trA+V4r0YTVActFnNeuFX0o4cvqT7lSaE0pvO+Gh0w8UbEQMuTybGH/qd4nOQxvPKUu3b4Svf7seqpnOvI7VJ9Z9LrLezA8+pQFd1QNgSUd/K+uaufLLyFlQ7LYfxE+vlrIZD8X0MbRqQzmigygn6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759321410; c=relaxed/simple;
	bh=cAzm1k/LFtYsfMoz1fPTwsIertg3SJX77LxBl5CAl0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCAGZ5uADaHWZNJTKd0CXzKqD3Nr0R9Xt4UuHt8Tc5y5qB4MnT9x84SdheifrNWTDDm18DCcNZnQXPV4Q7UK1W8wk0FpfPwI1MYyqj5B5b6Pp9hsnmjln/a/YmD+WN+aCxFkqZLZHSYxCRZjvSdLhNgMZkGuqOGMptoWPjTwZ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STCRlEs3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5919D4HH020349
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 12:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAzm1k/LFtYsfMoz1fPTwsIertg3SJX77LxBl5CAl0Q=; b=STCRlEs3uozSjQv3
	G8jluY9INTujJvjmpmz5oUhPEaVCUvBXho4TPh5XFMzW5+NxWIB4YY3uBc4LmQLx
	8R3qK2nYaqeLrc9scFGUJqeY/dc+kpYetzdttljj97vvnVkxASRGtpFLZRIV0WEV
	FLDbrWR3siDlC0J5bavIvgQ1Y3+Ac1tbHY4wymg3nmApbJCSmA9WdYmKBN29DjDY
	QRO617j3bsqaff8SW/NxFe1sG8o07D9iXGzR5Bb65wYGNjlblHRI5g1Ve7CP0Q4X
	sVt1gif7vosCSrK1G82pYqkQVUK9vNJ9/MAcjxDJu7tw45NN+wBZyYNsGdWoZMeT
	4tCzzg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5vn7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 12:23:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b57c2371182so6245073a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 05:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759321407; x=1759926207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAzm1k/LFtYsfMoz1fPTwsIertg3SJX77LxBl5CAl0Q=;
        b=U0FPvQO8BnPPeTTzIPrDzgdzTnU+4wzEFU+UK8XcjBs+ZrpHMNZoRx/qZXtjyPF3RR
         c7UWWjwgbJOUA85RH+5NVj5bBz/8lIAomtVutc4IeGBlSiJNemIN6Xq2P1IPixpgpTur
         SQDHj7pqQLHblWJDdVVXMeqw4/7cd4z0bNDUZakDhy3An+PVVRrup/Do3RVdw/l9k5yK
         j+sFboIupJ+SfELVcvhSpI/zTnwkq3SwHnU8Pzd7SZ9Topx12niJvSs/qKuOix1/UDyp
         4C5eBftls9rMZYMZNQiXoHF9bpcb1211FuWCqMY8AO68BZgYlRHKxlCRdiy/vWqTQ48o
         sL7w==
X-Forwarded-Encrypted: i=1; AJvYcCV+yST2ZjzBlkJDV6Hn7SOTRiTM+uTFwhdZQN2pni1IhhMUznm/+eD8zhy2Pp36kOLexGLpMwju4F2PsQUg@vger.kernel.org
X-Gm-Message-State: AOJu0YxV0aj3Jbk2My5QQRZgrakMAU4kuCTLZKmxK6VO97rYYUpO0ID2
	D5z6+lI5yMnkaUbxvSNVntSdaUrk8APk/8SYuZU5WEnHhwoHxLwv/1i6OvYx5IZvKzEBkgMZiGU
	e6pAqL7ITeGlklKHY4hWr8rPjy8m/aSNY78u9ymZxFVXzpkrsUY9AUsea6vY5VZLv16E+COtZ/4
	I1+9DStc2UDcXO2NmBq1wZSGXBmCegdSHQjlohA9P2u+0=
X-Gm-Gg: ASbGncuZpCp2UnsVB4yDnV3fPJcmieXxdqtq2ZoJ2icyJMO1sZoDRp6XkgP/bRQ9fQZ
	Kw2cFMKUlvHQZNABmxTgN6MnnD0i0sF9e7LkLdgNRpDOJHZpOT48NDJyfnGT6sTHR6t44PImrAb
	PGqWRsoZqX+vVpD2yOAfnLbEYt4I9AezKqmpKmmNZ/CBKbspk2b9374f4q9mI=
X-Received: by 2002:a17:90b:38ce:b0:32e:8c14:5d09 with SMTP id 98e67ed59e1d1-339a6e83db9mr3743323a91.7.1759321406533;
        Wed, 01 Oct 2025 05:23:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgIgEmCWOZbOFHuIFYRCg/Km734jZV+7WJCamZI2sYC7RYyp47h5Plxy1o+W40foeNndZscq3o/Jh91cGo7nc=
X-Received: by 2002:a17:90b:38ce:b0:32e:8c14:5d09 with SMTP id
 98e67ed59e1d1-339a6e83db9mr3743293a91.7.1759321406092; Wed, 01 Oct 2025
 05:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-17-24b601bbecc0@oss.qualcomm.com> <CAJKOXPdi0+c_FqinVA0gzoyqG6FVFp0jq5WSLsWWKiT12VVs3Q@mail.gmail.com>
In-Reply-To: <CAJKOXPdi0+c_FqinVA0gzoyqG6FVFp0jq5WSLsWWKiT12VVs3Q@mail.gmail.com>
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 17:53:15 +0530
X-Gm-Features: AS18NWB4geW4hLTPYgmoVnPDMvTYBeUM3eY3cJp_CGVJlhX_7-fckOoruJv-GaQ
Message-ID: <CADhhZXaB310hVo_w8_CoJLQ3j9dy1eeTwbmk0q=vUV2ga1PAYA@mail.gmail.com>
Subject: Re: [PATCH 17/24] arm64: dts: qcom: glymur-crd: Avoid RTC probe failure
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: NHaQE2Sa5oVOUfuLamW2vnOK-FQk39w1
X-Proofpoint-ORIG-GUID: NHaQE2Sa5oVOUfuLamW2vnOK-FQk39w1
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dd1d3f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AfoGAnNRudiV65anGGMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX0vSDRGTaL/BL
 HPvpCEGOEbQUuoMBCyRYZ19WkRv69LdaAlSmRHAOxNES7gSz8rORbxFz/bUYJ2CMSr/kmpPPzJE
 rAck2firaoYFgg8LWqg10zy/98qv33fSIhx0AxPsp/bSUAfhgi78lr/CzwsUD9R5ygbm0lEGE+d
 pTSesSpvn6g2v1WkGJOhxKQ8YjcQjoUtHHBsSMWSESBsfYZDbIw53iLgGb4Kv0oAdqj6S78t7qd
 HjuXgdeCIa/SWVEYQ8iSlNPEnNdMqWxRqWtQPTxXo8zlJz0ghJsJdywzGviSIAi6goglZv/s9aA
 h9sk4EPv5s7er4/NSHRAeVCn3iXEO7jwIhoRTexYFRBJirsXsy4xfBIEDkQf4peuUsG/BVShBfz
 7Qdy0VjTq5COq5dssiMzbLvxoBHQcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

Hi Krzysztof,

On Thu, Sep 25, 2025 at 1:41=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
> <pankaj.patil@oss.qualcomm.com> wrote:
> >
> > From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> >
> > On Glymur boards, the RTC alarm interrupts are routed to SOCCP
> > subsystems and are not available to APPS. This can cause the
> > RTC probe failure as the RTC IRQ registration will fail in
> > probe.
> >
> > Fix this issue by adding `no-alarm` property in the RTC DT
> > node. This will skip the RTC alarm irq registration and
> > the RTC probe will return success.
>
>
> This is ridiculous. You just added glymur CRD and you claim now that
> it's broken and you need to fix it. So just fix that commit!

I'm afraid, but this is an actual limitation we have for Glymur
(compared to Kaanapali).
The RTC is part of the pmk8850.dtsi that is common between Kaanapali and
Glymur. On Glymur (unlike Kaanapali) the APPS processor does *not* have the=
 RTC
IRQ permission for the RTC peripheral.

So we need this extra change in Glymur explicitly as a workaround to
make RTC register
properly.

But sure, we can squash this into the main DT patch, if you think this
is not a limitation
that needs to be highlighted in a separate patch.

>
> This is a gross misinterpretation of splitting patchset, some twisted
> LWN stats work.

Sorry for this. It was not intentional (definitely not for LWN stats),
mainly this happened
because this is how individual driver owners/teams internally added
their patches. So
this is how they ended up being sent out. But we understand it is an
inconvenience for
reviewers to go over multiple patches and squash it all one patch.

Will take care of this in the next version (and in future).
Again, sorry for the trouble.

>
> NAK

Regards,
Kamal

