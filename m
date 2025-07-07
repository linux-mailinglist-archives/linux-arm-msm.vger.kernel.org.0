Return-Path: <linux-arm-msm+bounces-63871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D4AFA8D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 03:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 272B13AFFC5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 01:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B85E1993B7;
	Mon,  7 Jul 2025 01:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjGjmhOp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88A311187
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 01:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751851327; cv=none; b=mici+RLMNZYPZ0FgQ/Zo2bich92QD/3qxSXLvBT/9GfMbYOhEd1zBIYGbt1OUqNGovtrebbm8WjE58i9BXiYipakqGFOfhC01B7VzgoG5clhbuq8uKXnJezKNaH8koFDC8F9xm8QKGMxaJYSE3H3tmBn0JF+kN/9AWPCF43Qn0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751851327; c=relaxed/simple;
	bh=9NwGVncvxKMkaM44hYWhWAwxYrfgYjHJFYDWSh/PDMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZos+Lzlhb5gT/C0lBimw+SSeOeOBkDI+WXWT5IWxS5KmNckd+4GKHECwMRRhY2mLYuhZAo4uHjRqtoz496oTtafsVH2NdMuXZ/ucd+witHMsD7B/W50b9rRmakI4sSNLVYFiuG2AcVCm36gTUFRSBN/BzaaSyjxgHPuY0sPsSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjGjmhOp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5670DIe5007041
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 01:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGTEHq4IajGxUn2mf1ux8G7XL8Yixn+AipVYC3nee/o=; b=NjGjmhOpTMbWmN33
	mO3imoHpweZEY6jBfi/omYJl/pKFRtYRJ6sMhVkOIIoaIPHQpVMJnFinvQ3in5vT
	6AuvvOwiRY8vANIXvbF7JBu7jjDoy4+PsEqNSJe4nPolGpqmhxGQtNVZ6ZLcGV3d
	ODRIyn+ZQpMyaw8S0r6TOjzc4Yk2tuiPxzXOtiOAvzaiRkO8bPblMqeDACid4fq0
	+FTaL/qHv8RiCybJ3AOCC1fTzHl+FxCKI482mtbYVv1WeCnxWTQHxC0/xX/KTS7q
	I+ngBIkmIhqV1GABdAWgJmjcpasugjNzrMiuDMFdhSE06uNxhfv6kRF3MGUxwKXA
	ZcRsYg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun2813p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 01:21:58 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-408d05d8c03so700524b6e.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 18:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751851318; x=1752456118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGTEHq4IajGxUn2mf1ux8G7XL8Yixn+AipVYC3nee/o=;
        b=ByZvfhs4pWAKWOeoeJ/WxdOp6mG6FsfgA2WtdsCTry1Y3ScNsSWATbQ0Gg7LwTfNIz
         DPJ/vbRWEmXhqnS3qQmYG8Crd0o9WVMM0YLEPHm4/PcssH3AI3zOR7EQkokmFSQa7jd+
         0Orp5brqaUeWMVkTZrYOTiSI1RgB/yXra7A1DkEbMeBamz9ROb3YUtRoY6TVXwGhd8jQ
         z2pUPBMlXKrqT5lns+pweLEYTjOG0DDvSz8KM5p2dImnkOilW1IMgl/40lwj50F69nvd
         ZjV/c+IVuUu6QRFnxnXrzOiwpfiF+k6W6lAqXxcJwdJn5QMQICJLOM4rWuhP1X1oX/y5
         XnoA==
X-Forwarded-Encrypted: i=1; AJvYcCVWmAS2nJLobfpef7GFRIIGmEuLSHxtkBawFnProDMWeUQKl6ZThYKEGcAR2+rTldbzOme4EXnSX9+VyJoC@vger.kernel.org
X-Gm-Message-State: AOJu0YzUi6paDRQswkK30yZjZF1xeNuqVjxZ8+fxHE8cnNgkI9Qnz1EZ
	GUH5fTzTgTwqatXMeZRYwHbfvL5SenNVAjGRdtZvMQdybCYTMO25XlMWLZFaBPfje7m9uyDYz6+
	evDN/GRDXYI7btHhAStl0VlEQL+CNxXFg8X7agbE3sEQTDlg9YFZHrY6XmXHJSXzNTs5NDFruT/
	QJZ7H/OJRYL2K2eZ14fkrkyhJChhHabSr5BaFu9vMRy8s=
X-Gm-Gg: ASbGncv1QxoOutmP+kX+a29ehHe7cenbu3BwYxsmpPnvdzjk2FlHHscIyn4JP4kJtXI
	7e4dp/GCK3RtQlOxt4w/3q5IKZD/RzSPwpqh6i15aT0FmzAlLfsP90Xwmq2emZ7IRfCuD8YaLWH
	ufyaWlwvkjcO/NExCzw6k2CFocWqplS4TgGps=
X-Received: by 2002:a05:6808:6c85:b0:40c:fc48:33b5 with SMTP id 5614622812f47-40d2b968e58mr5796406b6e.12.1751851317862;
        Sun, 06 Jul 2025 18:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFs2KQvXeA8I+eNNlGJhs4a9HX4VvgO+pAA9xWcKrJk8Ka7dlkr/CtyJI2GXTeTCdlInF915oStCiYnr0X/MU=
X-Received: by 2002:a05:6808:6c85:b0:40c:fc48:33b5 with SMTP id
 5614622812f47-40d2b968e58mr5796393b6e.12.1751851317490; Sun, 06 Jul 2025
 18:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
In-Reply-To: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
From: Robin Clark <robin.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 18:21:46 -0700
X-Gm-Features: Ac12FXwpGmCmQ8_MwW7xpPT4fw4jzAuObtuXcAM1LUtEgzggh8phHjbplkb8mVU
Message-ID: <CACSVV02AvJb_mb+Hw1aQPP+WTDTgG+f0n=kK50On1g54HnBuMA@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: gnToxKpDc2IRHM6P5v1y6NGvTdxXLKM2
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=686b2136 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=1Na2Qn3s6HqEfW6eAF4A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: gnToxKpDc2IRHM6P5v1y6NGvTdxXLKM2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAwNiBTYWx0ZWRfXwDMi+VgLw8u7
 A1bz+yOKjvAtfTDCOadsIsqLfP13/OpEdHX8lHHnmXVT/DpU/JAa2V8qsqfH9k9X+8mnwxxrGXb
 6XQnBthhmh5M+bgD76lN/FJS9Pt5w2CCQ1BiJ2Dhdf0g0sqoDFsjCjsC6PORehUq0iMYs0UhxK0
 AF6E2bw9iiv1LAlhluRUe4pF+ykaYm2vRCrDPBHKbGgXanku1rYlhcAycnNH+zDeJ5c367DEnQs
 Nheq6SdBVRCb4njJ0fYX2vt7cFtZh3Y3JSRRJ8Q4mBANqHV+VclB1XotgD/76MlRGadh28v0ogp
 XbxNPMJKki2ZGVMZNi1q35F7BEwd/+hiuaPK+KLqC+acoscYMelSDVbd+yPVMwwzQyk1cIniSR3
 rSZt0UO1Y5oJmhAY+1fTcy5VB8IMkFJlKa1V5ex78axp/wj3FzNEhyeJDJIRs90nehmvpVxo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070006

On Sun, Jul 6, 2025 at 4:01=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
>
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note: the driver is a part of drivers/soc, but as it got merged through
> drm/msm tree, this fix should also go through the drm/msm tree.

Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>

> ---
>  drivers/soc/qcom/ubwc_config.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_confi=
g.c
> index bd0a98aad9f3b222abcf0a7af85a318caffa9841..df074520a8cae1a202a14ca09=
4903bb1e7389066 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -12,6 +12,10 @@
>
>  #include <linux/soc/qcom/ubwc.h>
>
> +static const struct qcom_ubwc_cfg_data no_ubwc_data =3D {
> +       /* no UBWC, no HBB */
> +};
> +
>  static const struct qcom_ubwc_cfg_data msm8937_data =3D {
>         .ubwc_enc_version =3D UBWC_1_0,
>         .ubwc_dec_version =3D UBWC_1_0,
> @@ -215,11 +219,17 @@ static const struct qcom_ubwc_cfg_data x1e80100_dat=
a =3D {
>  };
>
>  static const struct of_device_id qcom_ubwc_configs[] __maybe_unused =3D =
{
> +       { .compatible =3D "qcom,apq8016", .data =3D &no_ubwc_data },
> +       { .compatible =3D "qcom,apq8074", .data =3D &no_ubwc_data },
>         { .compatible =3D "qcom,apq8096", .data =3D &msm8998_data },
> +       { .compatible =3D "qcom,msm8226", .data =3D &no_ubwc_data },
> +       { .compatible =3D "qcom,msm8916", .data =3D &no_ubwc_data },
>         { .compatible =3D "qcom,msm8917", .data =3D &msm8937_data },
>         { .compatible =3D "qcom,msm8937", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8939", .data =3D &no_ubwc_data },
>         { .compatible =3D "qcom,msm8953", .data =3D &msm8937_data },
>         { .compatible =3D "qcom,msm8956", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8974", .data =3D &no_ubwc_data },
>         { .compatible =3D "qcom,msm8976", .data =3D &msm8937_data },
>         { .compatible =3D "qcom,msm8996", .data =3D &msm8998_data },
>         { .compatible =3D "qcom,msm8998", .data =3D &msm8998_data },
>
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250706-ubwc-no-ubwc-3c5919273e03
>
> Best regards,
> --
> With best wishes
> Dmitry
>

