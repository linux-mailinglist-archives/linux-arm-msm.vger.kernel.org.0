Return-Path: <linux-arm-msm+bounces-58835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7306CABEC03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 08:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D45D1B66A28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 06:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA17231A32;
	Wed, 21 May 2025 06:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+H/JhV3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D8B230BC8
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 06:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747809303; cv=none; b=Eb0SQeX2qfgz0IkDYuWNCUMy0lU7xmJmYB1uTp1i/K9BSH6drIox7JSadI7oeuz8XwnpazGE5P8WbipMgioQEJILRo9NlARsOS3ebyFm76OXlbL9ZJpyr62nxaqYEZxlCBLb511cZTjvVwN1YrcdE4kmLEXWf/+ZveKrPQ3X/jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747809303; c=relaxed/simple;
	bh=yX5uXk8xZuF8KykN3btTAQn+eR1OpEbcKHd8ywumTVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrfVGOg3QOnrFFNoOjfwL38w/XTJM3VSdS9r7mlydq1G2PpCCTdDbWKDLBi/W7Y+uYU8nPQ67xOKczzBt4iSLgc8cBIbZMKD7EKJLSOjhGTWztjntxB8qFK3a0zqQlnR4u6qErNNfuSyeV8gsaAohI9M092B0glf05+la8QzTEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+H/JhV3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5erBl027127
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 06:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZ9hKputcd1338BrnRNmVIdwAO2+8E1/p45jvoCFYRE=; b=B+H/JhV3PLJpUBSs
	ILfVntPasJvRg5MuEQm7m/GebKraXecKRXtAvjzKBr7HD3t+miPrGSQ0B52XA+s9
	a4HnxK3IaPuR1r/2ZROJZvQy1lH+NvXJypDYDRxR3DQOpI5GLQ7UJyXbgYSMT0wn
	FwSJTKzCdUlJj/xVlzjBV5u8Ltlob3RztSKOgfNbT90r9LDHXeOGyBpExc5iXO8P
	khTyGgePcFVVNvEA19V8rFkRrUguEZtsU+0m1INgf/tH3M01ghw9xSJwruQvBdI9
	uU8MzoPqLSJk4zggSBT/RGdm3k1BElqhMKpFLGiyHA+ruqUVgRXYn2+o7w1UwKo+
	cDWRBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf99r11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 06:35:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4767e6b4596so110004411cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 23:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747809300; x=1748414100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZ9hKputcd1338BrnRNmVIdwAO2+8E1/p45jvoCFYRE=;
        b=bJxeourhKmZYq4zWRBcmWv7untiypKB3EIZ91l8YvzhgTe2/XDpA0Y5F4IBHwVzEs/
         n8HZeBqmh+EVzJXHKpvkIHM5wcuVzX/CgLZi4uFqQ4W5fqCzoeSbqpLsuDF75FJha55W
         LARKyovbosXswk28+CRsfY+SrhLeKxPDttMeeAgWJHP+8gNE1nBhi9/z1zOmbmAMbxE9
         OBeBECrlc6lisXi3bAUaijz3NjusSE0wE+v5stgSI/j4PNgjg2oD7vFa5bO86M6v9Lke
         gFOln0bx/57yCa/SMIyGwYNFgkjFb/KCvqVBktfI8th+yQCI+yTRg4wbgUzRHoYuE8vi
         82UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoBJIQw9GYd616M/L3+6WerklHDoeiSrtitOB/GbaMr9+ej7PYkCNZyOJSuxVHiI0kJPw3HmMK6sQfnEN1@vger.kernel.org
X-Gm-Message-State: AOJu0YxL6SLV1O6khg9EDX32LURPlLIbGAn4ik0Bg1du2jK5uRSYn9yT
	7vft36W6tGpsKdUf3C0mKoDCS/gsZb9stQZnsMTRmoN4OIU8i3zm9QAVaouG5l4LhoIeqhgib4J
	IZAN8m9nJjA5IfsLanZB8spzPVGoFOO0nqzmqdamiJdaNjIt4XmewzZBy3kvBxcGaWJLnWW3gSj
	nI/BfVTQJTZFmD2yu/C5KKH8trYmzhsBuGh3EyXy+LHoo=
X-Gm-Gg: ASbGncuBI4sQI6SJbAxv3vKkcOR7uGKGxVKrrCHkZzuidZEsspfBoq0XP92Zm2Uzv/y
	5zRSlWgN7HD4qMhsqJ4LZKLhaAmD6orwFStlbfrDuVxT9ChLNMGnNa2lWKuWyPmJx+ntWxw==
X-Received: by 2002:a05:622a:5c95:b0:494:b316:3c7e with SMTP id d75a77b69052e-494b31640afmr313606881cf.28.1747809299979;
        Tue, 20 May 2025 23:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhL/8XUvaTvdbPP3M/jAlhpC+jim7euSMn6JxVG7/tX7Zqm2OcngXdvkAaGGLBTeDl/gT4n33IPTAgb635QxE=
X-Received: by 2002:a05:622a:5c95:b0:494:b316:3c7e with SMTP id
 d75a77b69052e-494b31640afmr313606551cf.28.1747809299623; Tue, 20 May 2025
 23:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-qcs8300-camss-v1-1-1dfcb2e3bf93@quicinc.com>
In-Reply-To: <20250520-qcs8300-camss-v1-1-1dfcb2e3bf93@quicinc.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 May 2025 08:34:48 +0200
X-Gm-Features: AX0GCFugv4ozE6oN7_Lq0Cwf2qtCI-Rj0snyB97U0vzVGF9Yp5a-qiJ_uQuP00w
Message-ID: <CAFEp6-26HVokO-0+HEUf+cm1V7=OO5z1ndP7zVAk=Qk440Qviw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Add support for camss
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: OncwF6bxS43FqOwCbYXI97LXqQzhYQMz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA2MyBTYWx0ZWRfX11Cj/a5dTGsN
 t9rf7Aj0aw1In+KDfbSccBui9dKG/b3hOg9dlGo6xQ8G1bR8An7rbc/wsKJEn6zXRxv1bsxUJFz
 sNQOUbZW8piPEGcwwrSUHydPLIMhhsrVVBoaOy5jOoiTSbQlvDPiXcedAjjDHzTt+fEQu4nkf01
 RE/mXitxd8DQtwnqtBmHLLB0+mLe+3+PfBIPkyrkgkRejK6S08RzrIizs2o+dPx+ubX1lOd7VEp
 sWI0VjtIPqjY1jcrmnq73PREELi6Bd6CA5l0auxLu8PG7LpZREFT0Mmw6pMeHDLOr1gcw5jEMxG
 UjsZCSEENZjaAwPOQPC+XX4jROF22HP5uQZ6MRXk4mAqJh5LhlUsqnQOdCgcgT2urmLgUPza1PQ
 fPtMNA5crT5wHJcLAVNHugD+dpwCH8SrPWUNOuUC1gYrPE67YysUW+1akPZEjdAc5TOpGSZy
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682d7414 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=PPW_EwrsXE-T7dBlnmkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: OncwF6bxS43FqOwCbYXI97LXqQzhYQMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=860 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210063

On Tue, May 20, 2025 at 11:40=E2=80=AFAM Wenmeng Liu <quic_wenmliu@quicinc.=
com> wrote:
>
> This change enables camera driver for QCS8300 RIDE board.
>
> ---
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
> This patch series depends on patch series:
> - https://lore.kernel.org/all/20250214095611.2498950-1-quic_vikramsa@quic=
inc.com/
> - https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-1-3f76c5f8431f@quic=
inc.com/
> - https://lore.kernel.org/all/20250217-qcs8300_tpg-v1-1-6e0f4dd3ad1f@quic=
inc.com/
> - https://lore.kernel.org/all/20250214094747.2483058-1-quic_vikramsa@quic=
inc.com/
> ---
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/=
dts/qcom/qcs8300-ride.dts
> index 3ff8f398cad31a36fa46060855b075c8c2020aa7..97281d6d7376a406e5c31466e=
175358b10441256 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -207,6 +207,10 @@ vreg_l9c: ldo9 {
>         };
>  };
>
> +&camss {
> +       status =3D "ok";
> +};

Same comment as for qcs615, what is the reason for enabling camss
without an actual sensor? If it's for testing via TPG, I'm not sure
why it should be enabled on this specific board.

Regards,
Loic

