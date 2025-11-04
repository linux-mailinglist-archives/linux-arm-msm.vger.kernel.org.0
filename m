Return-Path: <linux-arm-msm+bounces-80355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCC6C3303A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 22:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E56CF18C40F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 21:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F6E2ECD3A;
	Tue,  4 Nov 2025 21:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltHTTeem";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cn79UR0t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB442F83D8
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 21:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762291198; cv=none; b=RpcFuVJcCn7TNoBSYlEHhx/Dtrb8+DG56lOaPa23oFFuGkYI4tnUc1NG8KiT65yiS5lPSuUwr0h5gMpzHdRMsWXsrZM0Cnitm7fy5tzcUVzeOyw6gIaozKOElvCdqK1PUG1GFE486dARIfns7dStbzqR6omZFHm5I62d6nBqbvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762291198; c=relaxed/simple;
	bh=O1h+4JCwzsGbtVqSYlNfNaUKue0RFvzI1fkR5b3AGJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dAxG578R7dSsoYgfemUdP/czjevXDdV6qEKSOFdyRx48sB+2kEVOzPwLGeJHgAN6pZmi/Zu8nm94orYoXgYMJgtCqMEGBddO1syAO4xQ2yLOM12z++ogR7PAZnQBaLo/K852IHT+GuLKPeW/0pMcoWBTtXIjtMQatL19WFvU71c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltHTTeem; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cn79UR0t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Kfn212978811
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 21:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ao1xhpFX+XOQkTW5iWtSuLDLy82w90QS7hnNgJ443Y=; b=ltHTTeem1oFN2AJD
	kR3jNKjD/90nAmVh2kC2q0TP99FT1NPjXnZFKebJO53T6b0xTc7qrS0CZLm6vByY
	3XvSRWo4Z7mdDF7SpOHFQEhNAqhAWSf+BwqPURV1os4TWUf9PuRrtEAeR95yeTh9
	Cvn/mj96ZpjVZ9YFfAi2s1NN5UoqUnL5poPRukS1KqC+3lYbtt+sulPXuEtYPJFw
	gKG0dk/yPk4Y3LFpJw4+0tDC5eo0wrUjMXHqOsgKVSQpdJ9ogKmNkbpmkxm/L34N
	acWki8IVprGTZWbaAt7Ocd/7qnd1swUMoK75uhDxW0vGTu+fASX/3arKd1SgUvdF
	OEtEow==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7hbjsjf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 21:19:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88032f606bfso52279756d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 13:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762291195; x=1762895995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ao1xhpFX+XOQkTW5iWtSuLDLy82w90QS7hnNgJ443Y=;
        b=Cn79UR0tUL4+GIw/V47ndi+mzP3E54Y/p9IBNoVC0tc+SS3GrtaztIxVvRvAkgWQKO
         0fRxStemD1H7L3fFvQfv+ZLAGcGLV7+jgaPwD4wajCx/DLmJcmq0147+L4DqnYLIDOB/
         wMXbWaz0kFviF5UZDiDrSrXXo5zWJuyTosa+jW2SSFYP2jDxsO03yLqfmVgoe0WWysds
         D9xXMBtI7IH6fzogkPdQ9JQqSN3Bz/MmsO0gIyljdzd+FHB5bddJe1FHHaQYX1X9hNnA
         w6pODoaH56OGoGVZhRdvLHFpFKutwE+uchlr7Pxb129vMF3j3YVNvZHDDe0gnlLXotbw
         7sPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762291195; x=1762895995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ao1xhpFX+XOQkTW5iWtSuLDLy82w90QS7hnNgJ443Y=;
        b=FmxmYR7CCogwHvHAzGSAW9mklo2mlxyrTccPYBhHPo2a2Tu3HeP8QRSJXhunIqJt+j
         dYERDt9gtdDjRBJSjDzU1ORW7lH0pPb3/TLSwfqakF39DQU1MbzC9dpJ3GbUtdBxrhbD
         KyEJK7zl3XknOlll6o4OzLSQGSF6WEXyDtVwiSubdiPqKQgIS9nbGpKybSGUtWM3/4mR
         Cg5n8goZfNMymy/6chl1Jp1pR95A5Hf5gK/m9qmvBHmmruZaluuQiSArRbbeFwqAv6OU
         bqY7folCpTbw8cfqITiKE+UxOzb5TDSW3S5f2vqaQ+6R6Z9xHKdGn8icF5bkrLS+aox4
         BpWg==
X-Forwarded-Encrypted: i=1; AJvYcCW973j7pO9sdnlnbsNHpS6m5gKpj0Jm30GTC/Pmuafq5Xv1OfWXrllpU3SWxkbKKo6nNJ7LeYb7yIxMqCX5@vger.kernel.org
X-Gm-Message-State: AOJu0YxkvjF5YRQU5ns49itaQFrDHchL5y59HXHAhJY2CEHSVfLQW/3A
	XsYW2URlpMqLgAEzTf8Qsiro/Y+BkGqfhV/iEfgAxash6LgROVHcd7FM2xOIkhEDBYhgPSxfQU2
	OPvN0rpYc7SbN7x/mU0nq68UwfbIuBOEz4q92Hw7Z77lxZZUrT/M/hZnC2s4swflZn+3JI6VLfI
	b7PBOcbOuZ8zujGpJpbSh+gwcujtdTy8v9KOAJiPHE3JQ=
X-Gm-Gg: ASbGncvwOp2P9a7FCpGLaXbwq1Ss+iENIhaTkE8Ei/+XrnNjzG9PjojdDwtqC9yXT7E
	KSdYxy5z36w2ZcfUVn/M3cVq8WDYg9hZpgdezny4pPdhDgz0jCmQQsDwT4sPQr25K37hsCJLpZV
	pd4Da+qnPB6vQafisqT8ArP0KgRFMbdc1wuw7l+aAyINYxynhNkOK+bt5r8treqviMAPWpSSb+7
	675G51Q6Sg+RpMsTQ==
X-Received: by 2002:ad4:5e86:0:b0:880:54eb:f66d with SMTP id 6a1803df08f44-880710ef566mr19875216d6.30.1762291195325;
        Tue, 04 Nov 2025 13:19:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAtr5fi63eLSJNqRxiTEwYKcD63XOKrJwVcoRoTpEaTOJBhc0VY5rc0qTciRzV6XQYN449ljhx84vZ76s+rbU=
X-Received: by 2002:ad4:5e86:0:b0:880:54eb:f66d with SMTP id
 6a1803df08f44-880710ef566mr19874716d6.30.1762291194661; Tue, 04 Nov 2025
 13:19:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
 <20251103182006.1158383-4-loic.poulain@oss.qualcomm.com> <aqoxdaq72prkeqwxmmohlmbpx7icuc32sej7did6vt6rzrgfib@bvmt7ppkvloc>
In-Reply-To: <aqoxdaq72prkeqwxmmohlmbpx7icuc32sej7did6vt6rzrgfib@bvmt7ppkvloc>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 22:19:43 +0100
X-Gm-Features: AWmQ_bmEwhQu5qGTjy7kyV-oJxAIA4QXEdTlLapG7ZT_EYYjiAQKe5I_bkwPYHA
Message-ID: <CAFEp6-2GGA2gvBKfO0fZemVmJmjQpTQEJ0vLfEewfhHKOYQGSQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: firmware: qcom,scm: Document reboot mode
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, sre@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Uv5u9uwB c=1 sm=1 tr=0 ts=690a6dfc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=--1CKO6TaCenDoQP3NYA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: eoh5U21YXkK7EGKc3ZKypp3JQpiEdrhr
X-Proofpoint-GUID: eoh5U21YXkK7EGKc3ZKypp3JQpiEdrhr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE3OSBTYWx0ZWRfX9czCtCDILGH+
 lSj5LaA6F8XlQq9nbw11lOMlv2mcxeQEqKp0uXo0EmpNy/z23bJE38UGdvebXGYISJAaOYBMaLr
 jligyJM1gdBm1ELtnkrKM8Lp6W2SgVpUTgQDmkJ5Yg4ht1azM5rtuVJ3R2JsNGivEBcapf/Dx8d
 Gq0umqxAKW33zHOk87xZmGqIthbllA9wF6spW7OOJDeh0kyTHies8Y/hcSTSV6nLPg4dR+tq4Ih
 OIBFct1xRZedsHujs50RRAQLRZy/E/2uAO2RV7q/iKrb+AH3mLGI894aFf4RarnCOkumvElPkl5
 lYyCQuC1bLNW1kUWu/cW4+sj7A7Lx939o7vhKuBKCHB27ZCEHtAKLWRDsg0sB9PXrQQM+v2tWlQ
 ijayow5MsHlO3tLZ1Zsew0Yg6jnvfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040179

On Tue, Nov 4, 2025 at 3:12=E2=80=AFAM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>
> On Mon, Nov 03, 2025 at 07:20:04PM +0100, Loic Poulain wrote:
> > SCM can be used to support reboot mode such as Emergency Recovery Mode.
>
> "such as"? Do we have any other useful bits in here?

 I heard we may have different EDL modes supported like USB or SD
based EDL, but I don't know much about the details.

>
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b=
/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > index b913192219e4..c8bb7dacd900 100644
> > --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > @@ -121,6 +121,10 @@ properties:
> >            - description: offset of the download mode control register
> >      description: TCSR hardware block
> >
> > +patternProperties:
> > +  "^mode-.*$":
>
> I'd only ever expect mode-edl =3D <1>. Do we have additional modes that
> warrant the generic nature of this?

We may extend this to mode-ramdump if it makes sense, but as of now
it's indeed only edl, will fix it.

Regards,
Loic

