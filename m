Return-Path: <linux-arm-msm+bounces-79312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47530C178F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 01:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46386188609F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 00:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D012C21FA;
	Wed, 29 Oct 2025 00:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3+F7DuD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RVVB5wK7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287A528466F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761698160; cv=none; b=leaXaFIg58yz082Sw629kvtNkMxdJ21MMKwrgG/MrQsfL++fxNfPeHI3VoaNP1wdWp1zn2IIkd6i7y2HlG5vw5e376zJdn8CT0V802CjkPh4Etmwy6d9gKDAio5RrhB/h44gY/IrR2noMyXgY+JNeYzCgKDI4pxFCY24C+0KTwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761698160; c=relaxed/simple;
	bh=EoE8k0KBFJiVu+lUu/6ffmeuppX2gDDFdvUcYzSJ2Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYy2RyWfAI16rJKQEyrxBULRmAbEpgkl0TDXLkz3c7p96b9YslZtJT9ec03Jhb6dQZmROXoiiX7TEK6TVAYD8x9DEAur0lPOXd0XVfg5/l6+UNKHgwNmeScd2fRDv0oX5TRtLHn02TorEQOvaULdfBECIvIUuEYLD1vBeZlrR+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3+F7DuD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RVVB5wK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlSqO2575309
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5d++JhR83X1EkIgn5+hFamsAqFSB3yWcWtebHioBuH4=; b=E3+F7DuDzmsYWcMk
	EvBz9HHrOuqIhWRtyx5i68YDA57L77H05A2iHS8AmLmxTsYc2h2USz3mKFW+5+1P
	62bMGSVQH36yGH9DRz551AOwgCse2afKyGbeImDfEpmbvB2g+mCGijg1N/KxwtNa
	BH36h3xBoG6LyCs7BeM7eU2GJ/0elX6rlWbw6kN0RXpwv750b9Qf03dCRFbtsaCb
	EoWA/2zaQSy6Jj3EelTbthCyzj/041/nj0RZeaHVcgO6b+cwlr9tHa6yOpR44X2Y
	RgbeXib1hoG29zNqihwjn2nc3dCPQAKN9IidxUvT0a79A5pioNETLExxdfRFY81Y
	nh9xLg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a20nsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:35:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2698b5fbe5bso89138545ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761698157; x=1762302957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5d++JhR83X1EkIgn5+hFamsAqFSB3yWcWtebHioBuH4=;
        b=RVVB5wK7fTlNeHlWOXQ6APs02EN2FG6+lQkIyntzLwTRudCncrXq1g8c09HgVJPhXW
         1Xi/MxCwC+2bL59L3Z+vf60rzyJJFzx7eezxnfXUgKTqRjgbGN6QBkQ+5wBu0x3BaxGu
         l4GjA37DWdBOgJiSUUJjPhfHm4nGd6dW+gewKEEZL3FSoYP96azz3eN1mT+2zQs95C88
         +M2GWOYoSedWjQ2ggrJlJbjIL3Ak7dMEaUW2yEpFZk3Wn0s3uaqVJ917cxqDccedv6uq
         Rb/TVYQMhJt0m2/ilhfpZVY/KvgfOJFmgNIMpvB+Xp+dZvh1Kobv7PTF99ZQS0LeTnng
         XCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761698157; x=1762302957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5d++JhR83X1EkIgn5+hFamsAqFSB3yWcWtebHioBuH4=;
        b=mUOv3llh2ocp4RcLszNAK4gu9cqb3tOgLqESrfkcUvTSCz6YHRI+kWIgseD0NQ1f3T
         Ww2VF3KxywLdWi4NX6b3yWm/feDjoFfd/iZtz2wOjaJc/55zyVnAN/dQMGoWr9ZysRxr
         dsKKAO3DUdOQ54NbBqKCt+B2KAQ2LTNKQ1S94ayzELkEAhFF7EjNANhJ3bMQlI3ibimJ
         g9q3N/8VRKcikmY0TuD08VZFKs1RUC3m3xmuOZObBdtCZVzxx9vji/uAB4tZfU0dfbDK
         /CWkn+5fB4G3X1kFYI4EELlGwStXTm1g4xhURwHffbYwTLcs47C+jpzqpsu7kOY51Cj2
         UiEw==
X-Forwarded-Encrypted: i=1; AJvYcCVg0I6u38Z7baWLvQZD6GmMX5SYuPDLw0wl6VIiLj1VRztcR5WtiFlMq1fHCJ0mqpf/1xx5udqa8C9dGh17@vger.kernel.org
X-Gm-Message-State: AOJu0YwdUYk8glCmnfqO+RUEvd2zRrfimyi/oR1wB7yGMIK5pFBmEanA
	zNGErI2WUrQVSVX8/sZI1LtWWVbez6PbZr7BX5YrA93W3dW/AGwLluFGZaYdCBQB9CXmsxt+Ud3
	ZCmEfRUFpC5RZPdnfcVVVyQSQPFnlae/XFiJiRtMvZ5z/5exAiph646UEliPQrQ6kPYZCHBCuTr
	qJE15oZT6I2JnoESt7jpoW1E5l979EoFIlGDvTvBfUANs=
X-Gm-Gg: ASbGncvgecodMjwC15q5mpU/YwQTuRHigry7Qy9cI18nhJVP6a89plTxBQIi0eIvdtz
	H71S3jL6sU4JMHMIQJGA+L7YNU+ih2fLAKk6+nD4Lo0xx5yXTSDfbU5mnKSfw1SqqxXv1ZTZG9R
	WYSzAQve05Y8M4KJD8X4jIrB9kRp2+fS1MsxGaeU6GL7qozJ0ZKHgOorwc
X-Received: by 2002:a17:902:e88a:b0:269:63ea:6d4e with SMTP id d9443c01a7336-294deec53e7mr14264725ad.37.1761698157220;
        Tue, 28 Oct 2025 17:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9OPHkH91X5aZoXnjzphjr5S5o2KvwNZWa5RxYObLofGJt/ji5FPIw8MHSQiXS9oyAy6iO/yF+aesYbSbF248=
X-Received: by 2002:a17:902:e88a:b0:269:63ea:6d4e with SMTP id
 d9443c01a7336-294deec53e7mr14264395ad.37.1761698156747; Tue, 28 Oct 2025
 17:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
 <20250923-smp2p-v1-2-2c045af73dac@oss.qualcomm.com> <bb25208e-a6a6-4a81-9dd5-5c5eb1cf16b4@oss.qualcomm.com>
 <ff382661-4d05-4f9a-8b9e-55fa9932a22a@quicinc.com> <15617371-0b20-4326-8e08-2c20b3d3c767@oss.qualcomm.com>
In-Reply-To: <15617371-0b20-4326-8e08-2c20b3d3c767@oss.qualcomm.com>
From: Christopher Lew <christopher.lew@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 17:35:45 -0700
X-Gm-Features: AWmQ_blJ0XZJj57smLg3viz2rnoGszVfVoBpYuAGhEffTwa9-ivzie97R69q8yA
Message-ID: <CAOdFzchG34Eq-Px--ii3s+3yUf4ZNc=+0msr2bB86xMUExsanw@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: qcom: smp2p: Add support for smp2p v2
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Deepak Kumar Singh <quic_deesin@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris Lew <chris.lew@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAwMiBTYWx0ZWRfX94xVewkWRMV0
 JoBxC6iSXJiHroWQW+EYGpVVrb//INz9tB9WM8h6RBtfeEJH+dSUUIZyTIz/VudBzOIkw45O8nM
 OLx9cRCAW7bZyZ+N4N+ejwOnYEVyyPpt9BrDKjDccwD4w8IjCuLyCqU1+LcjklUtUtpLn3ygiKL
 UAq2bJmRX5yU2PyP5DNZjztpQipp2naMDgoeS/PczGwXitPty7GYWUZNtahA1be7Aw8myjCcIPT
 oeFBeyc44fXRcQhx/RbOy7JOOQ9gENRpW3kGbAkEb75iVjK06OvfgD9Ci/lkhNSRal1yU786/O+
 YAKJZhf28lOkwAMag/TpVF+LoYtMdPdV4NS82rBUf13BXYm5wrWah/B5LHdYP4Of9T0D/quv3OI
 L2InkreuVmx4YDiI7+nmU7ozyFY/uQ==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=6901616e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=eY5W3OMkMx8GTqqscWgA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: wrZW6ioCIaoSBsp4g957NTxIWrC2QRud
X-Proofpoint-ORIG-GUID: wrZW6ioCIaoSBsp4g957NTxIWrC2QRud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_09,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290002

On Tue, Oct 21, 2025 at 2:39=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/21/25 10:23 AM, Deepak Kumar Singh wrote:
> >
> >
> > On 9/24/2025 8:27 PM, Konrad Dybcio wrote:
> >> On 9/24/25 6:18 AM, Jingyi Wang wrote:
> >>> From: Chris Lew <chris.lew@oss.qualcomm.com>
> >>>
> >>> Some remoteproc need smp2p v2 support, mirror the version written by =
the
> >>> remote if the remote supports v2. This is needed if the remote does n=
ot
> >>> have backwards compatibility with v1. And reset entry last value on S=
SR for
> >>> smp2p v2.
> >>>
> >>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> >>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +static int qcom_smp2p_in_version(struct qcom_smp2p *smp2p)
> >>> +{
> >>> +    unsigned int smem_id =3D smp2p->smem_items[SMP2P_INBOUND];
> >>> +    unsigned int pid =3D smp2p->remote_pid;
> >>> +    struct smp2p_smem_item *in;
> >>> +    size_t size;
> >>> +
> >>> +    in =3D qcom_smem_get(pid, smem_id, &size);
> >>> +    if (IS_ERR(in))
> >>> +        return 0;
> >>> +
> >>> +    return in->version;
> >>
> >> are in and out versions supposed to be out of sync in case of
> >> error?
> >>
> > I think that should be ok. If we return error smp2p connection will be =
completely broken. With default version 1 partial features can be supported=
 even if remote is using version 2. Some features like smp2p connection aft=
er subsystem restart may be affected by this.>> +}
>
> Perhaps a different question is in order.. do we ever expect smem_get to
> fail under normal conditions?
>

We would, this new flow gets executed for all the smp2p device probes.
For remoteprocs booted by HLOS, I would expect this call to
qcom_smem_get() to fail during smp2p probe time, so I have a silent
error. The in item will be found when we get the first ipcc interrupt
from the remote. I would only expect qcom_smem_get() to succeed here
on smp2p devices for early boot processors.

> [...]
>
> >>>       /*
> >>>        * Make sure the rest of the header is written before we valida=
te the
> >>>        * item by writing a valid version number.
> >>>        */
> >>>       wmb();
> >>> -    out->version =3D 1;
> >>> +    out->version =3D (in_version) ? in_version : 1;
> >>
> >> =3D in_version ?: 1
> >>
> >> Konrad
> >>
> > We want to assign in_version when value is 1/2 and 1 if value is 0 i.e.=
 error case.
>
> That's what this syntax does, with less characters
>
> Konrad

