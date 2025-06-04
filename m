Return-Path: <linux-arm-msm+bounces-60177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6853EACD7E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 08:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 061E03A4C11
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 06:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240EF1E501C;
	Wed,  4 Jun 2025 06:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYwo9iGN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC24F1D6DB5
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 06:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749018890; cv=none; b=FNzCeNkkTqxc8+KBQdr1HVAa0By6rcsxtzc+lwGHtKktinEju6Q1CBns7bY7Sbum9YFcSrz7u1wtQpAYjH6mLy5irEZWu+U8Yj45yvKhZdeDP35X4LHe7hV2Wova0HrdAP5Qs8Ym9ix6zEQBnXEjbPPv+gC118DjitDqp90HUqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749018890; c=relaxed/simple;
	bh=T9079cpPJMqy1lXX9Kc7OWLUoMW9Z59kC59hAowCd8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDHNtqTTQHVmVkfmXGhP6ZBnSthq0xGkIMdrEcuiE/uqKmUvOMgdTp43zCXq2rXvR2e9pyvfRryS9kcDuPmxk7j6FWcuLDZiU45DuixenqDUi7koFsxzBgQQFAT/ocEUH/m/I/64LLnNOx5RjaD1prThquJUrZ00B8642AH5Fsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYwo9iGN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553KF1PH004226
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 06:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9079cpPJMqy1lXX9Kc7OWLUoMW9Z59kC59hAowCd8E=; b=OYwo9iGNbz8rlG/f
	Zn8yg9Zbi+SZtqFfEkFy7SOpk0YH5F6VTtbtzD9NdA6Em3959IMxHbF/YxI8mr4s
	6bcSRPOdjpC8k9+Y4qRgqemf66HPvktkC3uhIjxzCk6ApfQiyrXpy8MqfZ9jGHhd
	YXz4gqfAW5YWQT4VT2mIJCqEt/7aaCu5hQm/6gef25+SZTaXUp5MmWVXzSLsWjUT
	YG4gjqYAfv+Ze5U7c+IFp3rNL4PR6Ou6WSKe4FQ12XcWStxIb9r1lqyBRfGDnXQj
	nn0Anetm0k5cgLqrxClXbMFCL+e2eY49AOyIp//MY7IHs7fYwiQSrr72bKOTg5R7
	hSK0Jg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8rw3tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:34:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311f4f2e6baso6258096a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 23:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749018887; x=1749623687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9079cpPJMqy1lXX9Kc7OWLUoMW9Z59kC59hAowCd8E=;
        b=pvHDSfREy19dph/QdZhK1jXQuBh8zdcxk+MqBHcjZ5uQ2uWZU+Xxo/DszAX0pUywpH
         K9MyHUQdrJCdWVAp9N3bkQaADMka129BQk4A3+T/nBr2Z8Lj5fv73tiA0xxn37m8yIIC
         wwHLN3O41Kv7VR0FsMO6ty+veiO3Dss+dKc8ov4W5ApedyBdW5hKz8e/9vFfSrXZbpJw
         +ywPWrUIHzkLTn5PldUv75Jnp+koRaudevgL7UoZ9a0I4EE07IxoZKl8cqrarYyRwG6Q
         1Nj0VA7E0sBxqzcI6H95NJaH9LbYVSGfDt8h63aTyWMK+ekQk9POT5/AsV8LDyIHE/cf
         1cLw==
X-Forwarded-Encrypted: i=1; AJvYcCXW5RcTJwIHmDGgbr7uPIJLmHiuN/QP1+KDAuJmFuA47BNzGlQa/Z+SPSwwkx577MXxyvHVCcfX9R7Ovg4X@vger.kernel.org
X-Gm-Message-State: AOJu0YyIe1ceZdnfwAewKgPG5qa2whlfOZqEKxRPmqZXJDlAOXb4/jZx
	19JumsCK0DFaDuMzaIMjckoZT+RhccCGbm90KNrwE+yg1F6MgA1y9FvPSVsWct5LZVqxEA8/qvp
	yIwQ5nRWjV8N/5U39+4vriaZeZUVANXwrgHPWP+SygO+aB7VhUIIkxqNO0EDaz6lVqLEKi+GB/y
	frMfLs9L+jpsoGDr5hN39ApnFEt1GTDWl4OOUvs9hh1Qk=
X-Gm-Gg: ASbGncv068rll9I1ByALCagj14GiPyW+o4pvySuuRWuobOEWnM1ItSqjl6eLAUvIH6R
	p4i6OweJNX23jjhLpIiJibe9ICRkPxJ1nFa2Jy9ynvMGwmGI6Tte9L1EwXoVshMuUGU539w==
X-Received: by 2002:a17:90b:2c8f:b0:312:29e:9ec9 with SMTP id 98e67ed59e1d1-3130cdad261mr2945200a91.24.1749018886646;
        Tue, 03 Jun 2025 23:34:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIuPluBDu4u5KGnxzBhJcv5mMUkl7EBUh/65kh9bW75WRsQbbaFMAdq4P0YI8KhX6NYIyU5JJbH9xVw242LSM=
X-Received: by 2002:a17:90b:2c8f:b0:312:29e:9ec9 with SMTP id
 98e67ed59e1d1-3130cdad261mr2945163a91.24.1749018886254; Tue, 03 Jun 2025
 23:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
 <20250525-update_phy-v3-2-5b315cd39993@quicinc.com> <mcmpmaapzv3vbiynlrp6sijdjvj6a5j3dxzoixz6b4cxqsvbsl@ecljexn3zg2e>
 <0aef1687-0158-4d7e-8e3d-b6eafc38d049@oss.qualcomm.com> <CAMyL0qPd2HRv4nr2C9=5SgzSkuKO_1cfZbOUO2aUj3vPWnmJbA@mail.gmail.com>
 <41ac26a6-7a5a-4c11-b05c-9ce688ad1856@oss.qualcomm.com> <8972adb4-b6ae-4ea9-986a-32e59fe84c50@oss.qualcomm.com>
In-Reply-To: <8972adb4-b6ae-4ea9-986a-32e59fe84c50@oss.qualcomm.com>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 12:04:35 +0530
X-Gm-Features: AX0GCFtUSo3xmhLJTp6kkLzM4r7UUUEdKvCLKhwD4KBE-wPI3JUeW_pADGCllGE
Message-ID: <CAMyL0qOhxKq8j1UXDX4xrWa8aVZoeqrhpWSVN2dC2hDLaqJoHw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ICpyKDL3-9OuXCIugOZ-7HVpb-bGEMAM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA1NSBTYWx0ZWRfX2UDvTdyfDTR+
 Xk4DRqH5MjzTddzfMsZvizUGMKDv5bnbDJlvsi1AT9oqbwQEQctvTidU7Rs0W3b8d+AwJrALTGl
 tEfa6UKRITNTUcCcqCbeVhNDW5TjZVKHBXl1M77QVsX+4W3d3bm+8VRetxDMFZGHn1YxGIJqdg9
 yRmAQQDJAFETonwGFqygrXl8RhhMyHyK2gRhzzziWdxEQHhLO7aviqKTJfBVHisY8WOjptRx/xR
 QahNPGkVuFgjfnMtYHvwLASb15qc7kxREOacGVAu7mzjSJcE/reBdW9GrrIMjsIyc6FzSfjA5R2
 s+/gZ+bubjFeN5JjzOQqLXfNnVXAgvN9gzlZg9+aaZAXo+7i1X+uThih5+Gbp50JnUYwvV+s2K/
 8tIYlZO5xDS5Lm4qhaAasX6T2fES3pn8jvNy8U5TH9RhT4+lO/TmkdT6OrEPFsPb7ELug7N3
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=683fe907 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=o19W8QfZZ25Kakzi4KgA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ICpyKDL3-9OuXCIugOZ-7HVpb-bGEMAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=760 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040055

On Fri, May 30, 2025 at 4:26=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/30/25 12:50 PM, Konrad Dybcio wrote:
> > On 5/30/25 7:38 AM, Mrinmay Sarkar wrote:
> >> On Tue, May 27, 2025 at 4:06=E2=80=AFPM Konrad Dybcio
> >> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>
> >>> On 5/25/25 3:29 PM, Dmitry Baryshkov wrote:
> >>>> On Sun, May 25, 2025 at 11:27:18AM +0530, Mrinmay Sarkar wrote:
> >>>>> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> >>>>>
> >>>>> The maximum link speed was previously restricted to Gen3 due to the
> >>>>> absence of Gen4 equalization support in the driver.
> >>>>>
> >>>>> Add change to remove max link speed property, Since Gen4 equalizati=
on
> >>>>> support has already been added into the driver.
> >>>>
> >>>> As Gen4 equalization is already supported by the XYZ driver remove t=
he
> >>>> max-link-speed property.
> >>>>
> >>>> "Add change to remove" is a bit clumsy.
> >>>
> >>> I'm more worried about this node not having these gen4 eq settings
> >>> (i.e. the part talking about driver support landing is true, but it's
> >>> unused without the presets being explicitly defined in eq-presets-16g=
ts)
> >>>
> >>> Konrad
> >>
> >> Hi Konrad,
> >>
> >> Actually stability issue was resolved by this patch series:
> >> https://lore.kernel.org/linux-pci/20240911-pci-qcom-gen4-stability-v7-=
3-743f5c1fd027@linaro.org/
> >> and I don't think we need to define eq-presets-16gts for this.
> >
> > Okay, so there's multiple parts to it..
> >
> > I was referring to this series
> >
> > https://lore.kernel.org/all/20250328-preset_v6-v9-0-22cfa0490518@oss.qu=
alcomm.com/
> >
> > Please check if you need this as well
>
> If not, we can get this merged as-is
>
> Konrad

Actually the series you are referring to is not required.

Thanks,
Mrinmay

