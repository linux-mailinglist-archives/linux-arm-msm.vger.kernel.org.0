Return-Path: <linux-arm-msm+bounces-62635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFD1AE9CB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 13:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8C3E16507A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C23275841;
	Thu, 26 Jun 2025 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nhltDRcg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFCE27511F
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938018; cv=none; b=rWaHfiNFaMUWbBLeD4/lujhy9cjlRzC1iJ4k0sotdY+jSjCGeEpNSZuzg/jrrD8jq3jtYHYlnzyuGFgX3rxXlbzgHYPDK3zeVrcn5DwgmaWQSWoXqkj0Lbl0lI8423XfMnIJ8lK0bpLZ3cCJCWCjGypzB4ShfFc7Dm6XSktm5jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938018; c=relaxed/simple;
	bh=Lxv3bobPbxguqV2LQ7hYcX5/yUmzEtL0xJfqCpV1wIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPM9By8oyS9BJtk+oL9Uc0ut7apHf3gbZ2p4YPMPN3xnLCiUx7MyHsnoJZVFWjZxx8G3oxcHwQlSYF60g7p+Zv4lBpq27eGrcIWWAFJB9xefCct4lQSzuRkU1pM9nIrkSosT2fTchj162paEVvob5vqIhLBhJcVBDym7iBgmOuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nhltDRcg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9CxnX026610
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dT1fvdGe7YM5jDqJFXKfujHv8UGAeLfHoh3jvqgL6rc=; b=nhltDRcgxbaZZHTG
	AUrg1GRbCzdgl7FluMos7m8yNO5dl6PQ/61Fute8Ke/cpUUAZHf7ZJRx+COhc4dg
	OQN6hEOPaLEhlFhEioEfR7qa9RUc62MG6ZXPIl8Jk5hC4P6shuPfnIYQjbJZP1sQ
	iv65/liEZyuggfzqiRvDRtoglBFBO6YwyXbVzrdwrwupQsOyDDCNg+LykQ3PbDgf
	lS3aoh1ibLUXQQJMdE0KD0CZdcGEqPCSak3GcqtV4drAfpOaF3uiIRxClnO27aAc
	8CjIuIUDEurC9ynb9hg7JAGZwkuwuHDP6NOVfR41J7Vk6o9svkk0hfIaMN71GqO6
	W10G8w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5va1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:40:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31315427249so858361a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 04:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750937998; x=1751542798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dT1fvdGe7YM5jDqJFXKfujHv8UGAeLfHoh3jvqgL6rc=;
        b=k+mux4o7DVdpA1ztWZSZN8JNwXv7+j2c6J6ax1kfjswmdeki4Y2aeNrK7LmeAv+S8I
         2yTxzt2xCF4gPvPNOqnFyZv0cRwgOXRAIGA9RBruMkzqkBOiesZ2hUAHlruw3cLC87O9
         /TUSvfAKFlflbVTo/IYOChH6ejDFgWMBjC5fx6MS8m/DJYEyqJqdfIVi40UZbxaYednG
         djuWRa5SqIkRjjo5Fe4cI8puX7X+G4I70t0HJlNkfUn/pinBstE/r4RDTup/hpWKUCu+
         /a6MSThrU1CnlS1jK/RmztBGRcQMTmGsthH1sgJ9cGxvO72VeVJ8Ww02rnQNz05zYf/a
         exRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoNocQXdTqJQi8SB2v49SEDPxLWGKH6BwD+wnfDyCI2nCt6F5TLT5WrDM+AwTKam30D7afCAhqhMBMzHUv@vger.kernel.org
X-Gm-Message-State: AOJu0YzQxI9I2Dfg/nJMIP+cymyNkTfeAqVsNKLVgAjugzZDuT0lUwo6
	5NOqTvPFHPCQE0CuNvDvQCbEgQ4SZ2Dh0bQHAzl++VY/N2Vu/T3kth3Foyw2rZn+GluHqHYW9RO
	Q6MSyCF4PC/SQib23WR0zeh/Icw/sBB25D5DocrESntTmQqu5CvbeMVj9a8o75nzK94/8eltykP
	0tIP4TlhMiawuXkRauoC8xB0N9FCUwMEuarKNRGoBZpz8=
X-Gm-Gg: ASbGnctewzKhEr8gx/keU+zqzeA/8s1xrxboVGQ0vFaLXmvEimCvCXEkyK3uuI246iL
	DNLs3X5QmT+ZSFMm/bkBCC7nvXBGGPBaRr5ViB6GML4mxjwyRn4TnOX8DrWtsnvguZG9uiKZLH/
	+fAn75
X-Received: by 2002:a17:90b:4cc4:b0:311:b3e7:fb3c with SMTP id 98e67ed59e1d1-31615a727demr4029197a91.31.1750937998026;
        Thu, 26 Jun 2025 04:39:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGCGw1uW8CKFNs0exv/LQABjq4l5r8EPg6eTda6AvaEb2kZw0zXQeP6iKYM50KOOF0UDcJWbd1bnLMn0/jBp8=
X-Received: by 2002:a17:90b:4cc4:b0:311:b3e7:fb3c with SMTP id
 98e67ed59e1d1-31615a727demr4029167a91.31.1750937997587; Thu, 26 Jun 2025
 04:39:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-sm8550-correct-vreg_l6n_3p3-vol-v2-1-b397f3e91d7b@oss.qualcomm.com>
 <aabcf5d1-7380-40c8-896f-6ce37944e97d@oss.qualcomm.com>
In-Reply-To: <aabcf5d1-7380-40c8-896f-6ce37944e97d@oss.qualcomm.com>
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 17:09:45 +0530
X-Gm-Features: Ac12FXyGej7puhbPsuLCEV_dDy34vZtozmvv_Z6e9DnduA7CCbfzjuZzVSFf5I4
Message-ID: <CADhhZXYZGO7Ns6R4JEyrt43+HGBuVwKz8hRiA7cxeTfg6egVcg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Correct the min/max voltages
 for vreg_l6n_3p3
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ePJOSoR99qXHkfEMkWFdJVtLqicFIEA6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5OCBTYWx0ZWRfXxIzm2jyhYwMl
 kV217SGwxKfXKvd8cqkVpYC44NNfO9QGI7nJa8KSL1KuBHUxxRYh/9dqU9mi435CYkPklthPZg2
 mufnEk0XCFJ3s1UjiAEy3gkt45U7Sl3Cl1RorItzL70yoUcWakBVFd+NjqwX+BDEENbK0UDCUSh
 kWb9OPsTJGsU0JlPQofcCMaoT1ESVw1uVHN5d6mMFS6XKCrzhv+KQu7Xyjrq0HgP63DKkPKe6EH
 rK0xZOSExSQl+pye36+Rtb3OLWyS2HBbJzejjEI1NDNti8wJsznh11e3ESAcNIyk23Zi6shtEDX
 rqklyFrjOYxeJVrypEihApjaX42goqUNp9j1Phcl3IXvGDj+hcee8GOWzhVo7CyCCLck+Ulu5/w
 B+iJvBdo9T/m9wv/J9hvQffRLO0EJLJdci2NaX3f5YtISuGqLukFImu2ONUGpI7/navRUw1U
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685d31a0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Yddgdl0A0T_G1bcxSVYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ePJOSoR99qXHkfEMkWFdJVtLqicFIEA6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260098

Hi Konrad,

On Mon, Jun 23, 2025 at 4:53=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/20/25 5:29 PM, Kamal Wadhwa wrote:
> > Voltage regulator 'vreg_l6n_3p3' max-microvolt prop is currently
> > configured at 3304000uV in different sm8550 board files. However this
> > is not a valid voltage value for 'pmic5_pldo502ln' type voltage
> > regulators.
> >
> > Check below the max value(3200mV) in the regulator summary for min/max
> > used as 2800mV/3304mV in DT:-
> >
> > logs:
> >
> > [    0.294781] vreg_l6n_3p3: Setting 2800000-3304000uV
> >
> > regulator summary:
> >
> > regulator     use open bypass  opmode   voltage current  min     max
> > ---------------------------------------------------------------------
> > ..
> > vreg_l6n_3p3   0    0    0     normal   2800mV   0mA  2800mV  3200mV
> > ..
> >
> > Correct the min/max value to 3200000uV, as that is the closest valid
> > value to 3.3V and Hardware team has also confirmed that its good to
> > support the consumers(camera sensors) of this regulator.
> >
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > ---
>
> FWIW it seems like 3.312v (which is slightly above the previous
> value) is also supported:
>
> static const struct rpmh_vreg_hw_data pmic5_pldo502ln =3D {
>         .regulator_type =3D VRM,
>         .ops =3D &rpmh_regulator_vrm_ops,
>         .voltage_ranges =3D (struct linear_range[]) {
>                 REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
>                 REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
>                 REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
>                 REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
>         },
>         .n_linear_ranges =3D 4,
>         .n_voltages =3D 32,
>         .pmic_mode_map =3D pmic_mode_map_pmic5_ldo_hpm,
>         .of_map_mode =3D rpmh_regulator_pmic4_ldo_of_map_mode,
> };

Yes, originally I was planning to share the change for 3304mV -> 3312mV.
However, while testing, I realized that I would also need changes in
firmware( to allow for a 3312mV max limit). so during internal discussion
it was clarified that all the consumers on L6N can work fine with 3.2v.


>
> but if the hw folks say we can do with the lower value, it's probably
> even better

Yes. Thanks for affirming.

Thanks,
Kamal

>
> Konrad

