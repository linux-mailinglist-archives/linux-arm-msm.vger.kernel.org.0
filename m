Return-Path: <linux-arm-msm+bounces-59042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D0CAC0B76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 039613B775B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 12:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7EE23C509;
	Thu, 22 May 2025 12:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gaiO47So"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8D12620FC
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916234; cv=none; b=usXV8Oeg+1zjak8AcBfYc9Ek+9gerYawXLZSx3EdefWd09WnhcsCOUmP7gAWCj6wbCNq9miPC5032P8QGOf4O0pR7opkH2AVALTbvuwhz1OUNAwFfK/EmILBcX9xBAC/TPFPx3Jd8J/s6x0i4YkoMvWW3miPIVVzylVXIDZcgiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916234; c=relaxed/simple;
	bh=r/iDDrr0XfmgJ4JFhFolvnmGEfB4M3tzmf/f8qCwh3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkHp+CCZirzjOjDD+HFeH5KC7pVo7LzDB1MeAOeMOKHAcckJnXrtmReD3FwXo5mAMYHhZ8/Fknh7fnI56c/GgqJhDhkcPkX6KuVAEnl/JicyWQBhf32jRFkuXM6WeFNNDL6r19QTTH3vem+37jvzVF/vwy/8AUpt318z2LPfLCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gaiO47So; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7IofG000808
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTNm4E8KMM0tOBGRYkPHrmoGvUWhWy8i+SlbW2+nzf0=; b=gaiO47SoPG6ZvyJ7
	1hr+FM+TAt1xz+OGeIDb3jozC1jcNU4wd5iAeh/hR8F+unZn90CwTjE0zM3NmUzL
	FoWycWT9kXG33zz/fBACGEfTiuc2PScGJL5Gy78Os2MYpYoSr34k1zKgZqCEmIeG
	67LhAyu9l3WR3eCcyChOXwLg7XUiN3ArzbmMDWVYMxspmQmvmwKQ9FB3o+RIJnKQ
	sFw1IQoDP3IBD7dhm9O6DN8SVaWig+KXfZQjH6E8lJ7Q1Ilz4eHJ0lN8pAkYHSjN
	lmaSWmIXNfKOyYXIOo3khheo0akoyZad9CDoVJAL/7x7vGwFDUAFgfFJHuD4vwX3
	/1+6yg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tmmd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:17:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231de0beccbso44945325ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747916230; x=1748521030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTNm4E8KMM0tOBGRYkPHrmoGvUWhWy8i+SlbW2+nzf0=;
        b=p9Bq6JJeFitYll2P/b3FV9yrCBeAqwOqIE6lN/MPT9pYMqlNxNvTqhCFZNxOxWu7MD
         DFjyL5VdXsyCU+ZDdUIROlbveJjs8a24XbGy8E8nv3uf078NaOKKYtcOHaigSQrNtu0X
         dGQ2lTyLNcZl8xcOR9svhWscp5WiprEGWSKgZPu/QsefNHEZUNtW5Yk5vMcD9ZTtVIkv
         ycSsUoXS/oP4W+QwbYeTtJdaEt7KsBt9+ZaaOcK1dj1/GUNVTCBbWNRG+6xFP9EvBfzc
         Reb+IK8mhQP5RVZCooRvwubBm7NvX0WFIb3hPeAj5ZcrJGFSRG9t0ViJqIKsgJkx5ArL
         hoKA==
X-Forwarded-Encrypted: i=1; AJvYcCWiUdJ7rFZ6yCrcvO/tAfDdGrzody7hlP9DYUZ0pkC9GIp3oFjLxVlp7CxCsEf5eO4TRcS3QsJkgDr15wow@vger.kernel.org
X-Gm-Message-State: AOJu0YxH/8IRtzq9iWiFANGdYo5fSDfNpHmuImXR7byE+Rqmz/GkpuDb
	UmZdsOFbyg6vcbq0c6b7v8wwXHSes4lsLMIO/ACc3pJ5FZ/ItQlEVeGmPrir1KcuF7Vj2FurNUF
	HcZw3pwuu53RXtIddaxuo74OackA8d9sLTIXw8TKSrE08S3HWqVwhR9nroCuzfWIVX7teyDSGKn
	tqlS3coXmL/i/5kRoQQcFRBWZYsCzB0UZo9kSuTxa6SRw=
X-Gm-Gg: ASbGncuncS4QB5NlXQDUrGo04zY5AzM28mB1N1F6pxCh8t7LSj9GcxN5gO+AyYCIEUr
	ErFlHFjOOfapsGWOhLwVZ7V9sOUJI40YP8O+zvA2a7YjduIuVN/LEn3jykVlS1xVkLCFtNNnYXU
	dtkyRPuPY=
X-Received: by 2002:a17:902:ce90:b0:232:5d3:aa73 with SMTP id d9443c01a7336-23205d3ae44mr310121155ad.13.1747916229925;
        Thu, 22 May 2025 05:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoSLXl5/4cgxXoGRMtvVyt7iK7+o/RJ/VrVLSgRKQy9k8zDOJHOO8r4gvb0ubtnF919mgbZwicxDSQ8BkmA5Y=
X-Received: by 2002:a17:902:ce90:b0:232:5d3:aa73 with SMTP id
 d9443c01a7336-23205d3ae44mr310120615ad.13.1747916229543; Thu, 22 May 2025
 05:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com> <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
 <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com> <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
 <46caa88e-790b-4733-83bc-75ed6c7ca2d8@quicinc.com>
In-Reply-To: <46caa88e-790b-4733-83bc-75ed6c7ca2d8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:16:56 +0300
X-Gm-Features: AX0GCFuDjJasRehFewEiiJw-x3UccHeyPWTYxkBPQlNLcvub_E3TBxXS5baFHug
Message-ID: <CAO9ioeVoqQhDhBW_fVU8kkt=3trV9YhEDUO0izdf8cuCDqU4Tw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for audiopd
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f15c7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bh7bGpV3_KY8qhbZdMUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KTefPxE7KeFFQiwyMcg0d3lXLs6CMldE
X-Proofpoint-GUID: KTefPxE7KeFFQiwyMcg0d3lXLs6CMldE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNCBTYWx0ZWRfX/8BK96C4aZO8
 P9Fi092WBZo4WZSfFQDk4/ybdxPG0cdrU2/Iq5C345ofiGrcDMSnl1tgynB+R36ImFzN8+7bq8t
 YuDSYWhjlxkcPKuOf5WbSDZOTuBw2ZFV+Vw8A61HzvxNHxSUG2/EXlIxB7u65wzGp3N42+xZVym
 nanCnKKLdAPXyiub8ajBj22IDxayUn3EL3NNPNXYrIw2/4rIEPep0l8gXM2eKhLZqTzR4MqVgw+
 GHUep2FeUuCR+/HO1kh38lT2+XzlcqjJzldIt2+HUgMwiOU3MJjR1LF9GDpIkUbLeR8vyNZR/Um
 F+jWtkCpE7afmhxA8vpNHtZ6uQXYtDdWEzb3gS+kJGSygIk1srAtUcGCQ8R3SoPXFgJLF8AQZtf
 Qo5F180d/G9R2ruUQQTNXk/5oWT7qeba5vDjEfeswNw2IwF9xJcqRlyRfLjndKmHVfNwm5qk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220124

On Thu, 22 May 2025 at 13:44, Ling Xu <quic_lxu5@quicinc.com> wrote:
>
> =E5=9C=A8 5/20/2025 9:53 PM, Dmitry Baryshkov =E5=86=99=E9=81=93:
> > On Tue, May 20, 2025 at 02:41:22PM +0800, Ling Xu wrote:
> >> =E5=9C=A8 5/17/2025 5:47 AM, Dmitry Baryshkov =E5=86=99=E9=81=93:
> >>> On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
> >>>> Add reserved memory region and VMIDs for audio PD dynamic loading an=
d
> >>>> remote heap memory requirements.
> >>>
> >>> Why? Was it not working without this heap?
> >>
> >> yes, it will not working without this heap.
> >> Memory region is required for audio PD for dynamic loading and remote =
heap memory
> >> requirements. For more info, please refer below patches, it has provid=
ed a more
> >> detailed explanation.
> >> https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.q=
ualcomm.com/
> >> https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.q=
ualcomm.com/
> >
> > This triggers a bunch of questions:
> >
> > - What is audio PD?
> >
> Audio PD is a protection domain which is running on DSP for audio
> specific processing.
> > - Is it a required component?
> yes. it is needed wherever there is some audio use cases where
> DSP audio PD dynamic loading is needed.

Which use cases?

> > - For which platforms ?
> >
> For platforms that require dynamic loading of DSP audio PD.

Please be more specific, we are not playing a guessing game here.

> > - What happens if there is a memory region, but it is not used by the
> >   driver (SM8650, SM8550).
> >
> It won't be used.

So, what happens? DSP crash? system reboot? blue smoke coming from the SoC?

I'm asking all those questions to understand:
- whether this is applicable to previous SC7280 platforms or just RB3Gen2 /=
 IDP
- whether this needs to be backported or not
- whether a similar fix should be applied to other platforms.

> >>
> >>>>
> >>>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
> >>>>  1 file changed, 11 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/=
dts/qcom/sc7280.dtsi
> >>>> index 8e86d75cc6b4..d9af79ff8c4e 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>>> @@ -188,6 +188,14 @@ rmtfs_mem: rmtfs@9c900000 {
> >>>>                    qcom,client-id =3D <1>;
> >>>>                    qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
> >>>>            };
> >>>> +
> >>>> +          adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> >>>> +                  compatible =3D "shared-dma-pool";
> >>>> +                  size =3D <0x0 0x800000>;
> >>>> +                  alignment =3D <0x0 0x100000>;
> >>>> +                  alloc-ranges =3D <0x0 0x80000000 0x0 0x40000000>;
> >>>> +                  no-map;
> >>>> +          };
> >>>>    };
> >>>>
> >>>>    cpus {
> >>>> @@ -3863,6 +3871,9 @@ fastrpc {
> >>>>                                    qcom,glink-channels =3D "fastrpcg=
link-apps-dsp";
> >>>>                                    label =3D "adsp";
> >>>>                                    qcom,non-secure-domain;
> >>>> +                                  memory-region =3D <&adsp_rpc_remo=
te_heap_mem>;
> >>>> +                                  qcom,vmids =3D <QCOM_SCM_VMID_LPA=
SS>,
> >>>> +                                                    <QCOM_SCM_VMID_=
ADSP_HEAP>;
> >>
> >> Thanks. Will modify this.
> >>
> >>> Please align '<' vertically.
> >>>
> >>>>                                    #address-cells =3D <1>;
> >>>>                                    #size-cells =3D <0>;
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> >>
> >> --
> >> Thx and BRs,
> >> Ling Xu
> >>
> >
>
> --
> Thx and BRs,
> Ling Xu
>


--=20
With best wishes
Dmitry

