Return-Path: <linux-arm-msm+bounces-54688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D467A92BDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 21:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3E273A525D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 19:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D892B1FE469;
	Thu, 17 Apr 2025 19:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltBH42ik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C01B1FFC7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 19:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744918436; cv=none; b=kxQKgDGOcNLxsqmJltTg3QcFL7S5ZjnM8VL8QkPt+F/rx1iR+TOd5P3QefPp/EjVd+qNeBssAbsdVg60OkZFOkS08V59ROgQI7BbjKImRysvFMLuS0QDIpIT8Pp2ji7TXiosGiwW/dcluOF7WJ3kfr6rRu2tfs4SqcORVzawaQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744918436; c=relaxed/simple;
	bh=yRRVy2xHGh5NhnrsjVe72cTfxvklFClIfnNoEVyS/gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6o7mviBmhNq7Q1E1fFWpdPQDCpbABZjeJGEKoRAfZkIZrPOtz3OA1UGVCmpBJ5UhHJ0g3/Oivs6YIq4epd51lzoRCtnlcW1ed39HUVevd97Tu/wcTgWObVh/vK0OeWyOn+oQuITLg2pqk5/BfPY56+nfkC37t/RCoNrUov4VaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltBH42ik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClKUK014436
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 19:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BBOfhV42VjOm1soXFuVXR2vhbNsgpq/CqM2J31GQXQo=; b=ltBH42iksyPjtR4+
	N4ikuzHOC7Vp7dULMajfECvZrdKDyUl6nGtyOLzLSd0Sl3Rgz037hPshqEalCKP+
	H3nwbrxWdDQkiV+WE9QHlHMRdeB+4K0J3BnOkFlFJhs+aW+hRVK3j3pJ9PIhyNxk
	sEVmED1Y4rdL4L78/r/CEWjykbuWc0Z0o9f9EoVlLewMoTI0OduKYjO4Ju9KB7je
	JNhJNE1hROH+VQk/d5l2NIIj7zjWKLxnM1ObLhxbEZAfITntHfrS5xyHlm8Lxwiv
	evJjyHBdwp5NZ0V5UuXm2rAde89yYxeLhWITI6oIGz2be9YrwHl4CTeAQUEwf0yi
	VLW3oA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6r4jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 19:33:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4769273691dso20093211cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 12:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744918433; x=1745523233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBOfhV42VjOm1soXFuVXR2vhbNsgpq/CqM2J31GQXQo=;
        b=OBYlp4Jpk1LZZM7Bcs7hlGuwxU8bxsR6BLy/TnZAGkG9w1RimOX52YE/VOtvPhhwfH
         22s+EUPdGzovxtKXKhVtrXnOVtLbB9C6asRG+kjNZ8WUdEtzM1BrbsAt7+pfE3hcwwYj
         3vCi+aBeZmlPH3COBBMx4iK52JNT0NJ8NPLt1rcqhVtWtFQ5KZ31+EGWVPJ5qNajrI5A
         cZM9BHc1UkPwcmDG4Tv/5ziu8VWYnviCBkwiPDn0OAgSsg1eKgDgfopRdm7BMiwVCrPb
         ky7tstSF7WL4Wb5f0XXPNVYuDGi8HMBldRg2DampFzrQXZeHK7pq4yzg/d6xiDQIiSy8
         zXhg==
X-Forwarded-Encrypted: i=1; AJvYcCXfdxKA2qbjIdiLxAcUXcKhjXACyRJMcVnnXyS1SQWEeWz1m+MHn/O1tyDNTBVPrLJqtlDwNLn6AzFhi199@vger.kernel.org
X-Gm-Message-State: AOJu0YwhI0XiVwb5XMd90npVM5wUOmX2rY3+pBl/wp9bPddbuVbaeULR
	+s2a85swky9dbDcs8KycEUOeYzyOdhlZ0Vnj+W4H55q4PA+Rpxd6qqvroS1ZO6xnVkK0iZGsfaj
	w9d/Sv+yhQBblXaYwQt1U1iFpg8K8FUaFGJ5yREKLcpniGgu+YT+uVbXNqPSLUSnVytPGkfnNiK
	TWdihkA6HgafBCUbvR+mobR6vbtwulvfNqSOeu2jg=
X-Gm-Gg: ASbGnctBSdjMaZ1qL9JYt1Wr/zW1Iuc4+cMhrtBvXsZjUze/QeFY9qYtMaewJU/7iio
	jqZ7/eUxJ/FYHdyDfxiVwLiY0bty/Xv9vjdFXEVYVwgu04e70T3WMtGI3QMdBuIY2Hj1O+Q==
X-Received: by 2002:a05:622a:1988:b0:476:a90b:986b with SMTP id d75a77b69052e-47aec3cbd65mr698331cf.28.1744918432981;
        Thu, 17 Apr 2025 12:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsNTDC1SH0ezt5ouAYo9qCu2e4f97nSM2O0VjLMf1GC5S8PAXQWMHH/GYp2bJil3mMNj9ufrDTFjsgSDgXr2M=
X-Received: by 2002:a05:622a:1988:b0:476:a90b:986b with SMTP id
 d75a77b69052e-47aec3cbd65mr698071cf.28.1744918432693; Thu, 17 Apr 2025
 12:33:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
 <20250417145819.626733-2-loic.poulain@oss.qualcomm.com> <82415a35-2410-4c5d-aeac-3b4656804369@linaro.org>
In-Reply-To: <82415a35-2410-4c5d-aeac-3b4656804369@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 21:33:41 +0200
X-Gm-Features: ATxdqUFFH9wIe54N2rC2EYrUgetL69hhYOQegURyxTVVzUemQMqTWr70gmFhsJ8
Message-ID: <CAFEp6-1TEiuDN=By=R03wBtOK5ZcPEEPwNVB7dF9-QcOdq6T3w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] media: qcom: camss: Add support for TFE (Spectra 340)
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: DtehEEirjEqPe-FMdutIXjRlRt9owZO-
X-Proofpoint-GUID: DtehEEirjEqPe-FMdutIXjRlRt9owZO-
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=680157a2 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=D4ChjzI32PwueRJqcUAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=751 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170143

Hi Bryan,

On Thu, Apr 17, 2025 at 5:49=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 17/04/2025 15:58, Loic Poulain wrote:
> > +static void vfe_enable_irq(struct vfe_device *vfe)
> > +{
> > +     writel_relaxed(TFE_IRQ_MASK_0_RST_DONE | TFE_IRQ_MASK_0_BUS_WR,
> > +                    vfe->base + TFE_IRQ_MASK_0);
> > +     writel_relaxed(TFE_BUS_IRQ_MASK_RUP_DONE_MASK | TFE_BUS_IRQ_MASK_=
BUF_DONE_MASK |
> > +                    TFE_BUS_IRQ_MASK_0_CONS_VIOL | TFE_BUS_IRQ_MASK_0_=
VIOL |
> > +                    TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_I=
RQ_MASK_0);
> > +}
>
> We could mix and match writel() and writel_relaxed() but you almost
> certainly want your IRQ enable write to be atomic from CPU to AHB/MMIO
> endpoint reg.

AFAIU, it's safe here because writel_relaxed will stay ordered in
respect to each other so the IRQ mask will always be configured before
we start the device.

For reset it's an other question because in that case:
```
reinit_completion(c)
writel(1, RESET_REG)
```
We don't want the writel to be executed before reinit_completion.
However in camss case we have:
```
reinit_completion(c)
ops->reset()
```
The compiler should not be able to reorder this because of the function poi=
nter.
But the CPU may... So that why I initially implemented vfe reset like this:
```
writel_relaxed(TFE_IRQ_MASK_0_RST_DONE, vfe->base + TFE_IRQ_MASK_0);
writel(TFE_GLOBAL_RESET_CMD_CORE, vfe->base + TFE_GLOBAL_RESET_CMD);
```
To prevent useless memory barrier instruction while keeping correct
ordering relatively to normal memory access.

That said, such micro-optimization is probably overkill for such a
non-critical path.

> Its simpler to drop the _relaxed() everywhere but, if you want to
> include the relaxed() variants I think you still need writel() @ IRQ
> enable as well as WM start and stop.

Yes, fair enough, so I will revisit and use writel for non-critical
control functions.

Regards,
Loic

