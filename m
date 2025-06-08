Return-Path: <linux-arm-msm+bounces-60542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C104AD12F1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 17:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E85383A4C45
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 15:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0963020CCF4;
	Sun,  8 Jun 2025 15:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pz6uu8ru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727571EB5FA
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jun 2025 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749396108; cv=none; b=U0i+e3OV4goag6qg8olnv+Hp31kN8rYmLalA5CJqlG8AMcwHK5EUUTkQmjhJk0/K5gxVI78dTHIOoshx7T++uCD1GXMT9Zma7oJh9hxM2DIHJ1w3FmbaCTy53IvcXamMkHmeQJ8729jspQE8tcOZcw0WBIghLDkcA5wMo9eYJpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749396108; c=relaxed/simple;
	bh=kuT2meH+GoUYl5dDOMdL+3vbhIr/LYNnR/dcHdw7djg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2gA3AFvZeQ9JyEZ5QZZ7q4HGy1qu3aUqv10FCWXbRYwjT3orixrUAiNplC7m58314SbigBgJLqiAPzVEX0NR9HGrvRzPgRtNODZkI2UDfG00J+Q5OD7/SltZNKHDdZKMB43+EHoiXkdl7wnY6VFRcsErR4sqBD0TsuPJhHiex4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pz6uu8ru; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558AF2i0020744
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Jun 2025 15:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=eBW87gG+bs7XTeUanjoqFUZo93HnKMO9MXlkJu+f3B4=; b=Pz
	6uu8ruZbbxQJBWUXgV7JoCc7DBOj9QCBE60RwlPOXfeA8Xxzc7Ffhwn92PGbcJaa
	DVAdP+4/zh0K33sE2OxLMn5Iwq8JuQS9jKtDCZDUe3KJXC5cObD13UyoKb70iBmo
	AAgLje+TV0Z9b/VYYs8oa9oa9KGoFrwxndeTr0Z6DfL3TXfeFVLQoE040kMgzbXR
	1njLB2t1KIfGbeBTXdyaktZuc4qggx61LgIJHhlST3b29aqKO7xvsJqvJkThSIJT
	uj6saz0zK4/2pPa8Nx3ARz2hCjM6+khqfnJt+yJPnm/0wrNwbUrJuUa8SaGTFdne
	tpfmjWkvzake6hBeU68Q==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn631j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 15:21:46 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2e94cfbbbc1so1141295fac.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 08:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749396105; x=1750000905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eBW87gG+bs7XTeUanjoqFUZo93HnKMO9MXlkJu+f3B4=;
        b=PGc+XyTt+4PeeP/4/JDUYB0FIDIL54pn2Q9xyZ2Q1QaULWuHWN29J7TtKjqWKzbYPx
         89r0lWGRSHHARAz2mfV0ymbp35d+S3JWsyj6+bNXAdqL+GDWJsGkyYiUldp1WVPAmG/4
         8L5luzX9t30W6nslBATrKslBkqDO6CpxSX8lcZg+/QPctx5X3bxz7fLhe5bj1unaYafW
         LqZAiwE4C47wtvwvYaqOLUMB9U/fzeVKZU7JBTDSCpQ33Z+YtY7Y9K5ZXanBFpc2lrjK
         /APaunqPgwdfs5cFT+UoUySEpaTc0ikHtuWByWxKdJ9Bxf69vv4DHTIqcuHp5keLtCfF
         5mAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrxeIjUYHLYO3y5ohboXemZw5Bz5FqDdPh3WsIoCEcg1wJPaS/C7wr2f7EItVlueaJAKYx36UpvYAbVHJ1@vger.kernel.org
X-Gm-Message-State: AOJu0YzMCwtDkflgUhE8Y3M86xu6p/ehGCj4t20lSJkxJp6CG5w3TGGR
	6oU62EHGiVDzyjQAm/BTzJP8+y1Wmi+GZbS++pUPjml5N0zlsTkHJL/89z77F9IxZFPEaPHR8GH
	/wTS2RnKFUhJdY0eYyWlTJKxVOcx2W/qnUMP5cOFECxFTg0IS/QwVagYdCABGHMC6n1whqUfPBf
	/IzPR40mbXaA1vWgpdodi4z6Evu+cUyXNWSTZHIOcOQlM=
X-Gm-Gg: ASbGncuW/GSJGEicZilQvgcdeQpCpQ6OSbY857XT+7vnJqZbs41LRW09v1+HzZQd+i5
	EJ9HDnCzxg7+P7iNJLoH8ucCydkEyF+ogixMCB2AHLjcS5vpnxV+0RoyWnUgb+gmkApi1DjdCl/
	OAEoItc6xwUfPlzhPYlyeSrIduzqTShVTGr/g=
X-Received: by 2002:a05:6871:7b0c:b0:2c2:b9cc:afb8 with SMTP id 586e51a60fabf-2ea007a9e74mr5430093fac.7.1749396105520;
        Sun, 08 Jun 2025 08:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeiwEJ5iaDlOgKPAjvzclsMxV+Ve51cmb4U8YPN6w25l7BtGOQgh5AvGBbsmLKSAPaB7+VQf5sDKWINoqBQY8=
X-Received: by 2002:a05:6871:7b0c:b0:2c2:b9cc:afb8 with SMTP id
 586e51a60fabf-2ea007a9e74mr5430084fac.7.1749396105225; Sun, 08 Jun 2025
 08:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 8 Jun 2025 08:21:33 -0700
X-Gm-Features: AX0GCFulliz7op4BWmvcmnZlyStVB3chNWH7TufZIrZInNo_JnqWpgSQFphHTQk
Message-ID: <CACSVV01A8aqyoM4KYuUYVXTHnM1egn5-4UxqPrQVVjuvxxbC6g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support for Adreno X1-45 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyMSBTYWx0ZWRfX5YEf+Lz/LrJ9
 LDRcIs2jojFqMul3+JPqgGtU/ZzKxJxWFJU0w2nIQ60s9/Cfl0I7fGUKL6BRao2AANH6Xt37wU8
 8hQuz9a/6wiDTcAOF/eBPUGQM+k5fHh0hXsxC9wqTN0aobUm/X69Xo9/RMUqYAxt2qmialorq05
 dKDHCBtp0b2yduJ0cfbM1H3/IhAz7CsqONYH5Ap9XlJ53rmUioc4EgBldEM8wAC/rtF65IfeyfS
 Q9Jfa7ZflA/rT4QGpsLSY2Vru98+7IXV5dbc2RaimyVAWk2qV40XHFYbl2kCJgmW4/L59kS7dsL
 66Y1c9x+d7HLWUexo0c4fn/BuxCnqHzGeQXtCOhoQqzsZHZduK4tMYJC46H5++cGsXa5xddiCO2
 WIqJtpjGXXkLu1D1pWV6gDyIVebnt/Y6HDCGHCWJqKxnrxWO9FczXhE/5bXKz6DEUoaq1ie7
X-Proofpoint-GUID: KyLkU5VbxYPraqNbCjaRdwcQPB8FwOJh
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6845aa8a cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=MXl9TKsJXw4pWBb3H3sA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: KyLkU5VbxYPraqNbCjaRdwcQPB8FwOJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=659 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080121

On Sat, Jun 7, 2025 at 7:15=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
>
> Tested Glmark & Vkmark on Debian Gnome desktop.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

fyi, mesa part: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3=
5404

BR,
-R

> ---
> Akhil P Oommen (3):
>       arm64: defconfig: Enable X1P42100_GPUCC driver
>       drm/msm/adreno: Add Adreno X1-45 support
>       arm64: dts: qcom: Add GPU support to X1P42100 SoC
>
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 ++++++++++++++++++++++++=
+++++-
>  arch/arm64/configs/defconfig              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  38 ++++++++++
>  5 files changed, 170 insertions(+), 1 deletion(-)
> ---
> base-commit: b3bded85d838336326ce78e394e7818445e11f20
> change-id: 20250603-x1p-adreno-219da2fd4ca4
>
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>

