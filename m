Return-Path: <linux-arm-msm+bounces-74630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E39B9B124
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 19:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C2FC3B0DCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 17:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06899315789;
	Wed, 24 Sep 2025 17:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKtTnbE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32042314B7A
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758735164; cv=none; b=VU/QrqlJ7QP7PgltVW3AQXh3pQW+hlfRjVxAQMmTHsYIL4/m2HHfbk7Nv6Ek0utR0gEw4bdJcJ0syMvH9UAxA4/Nnj6l92FgpoY1mqaPxVSaLsRNgSm/Ac0+S3CpM6HYRzJOu/sGrKwQHvNUyf2bJOTfe6nwGjLSd1BP+PiwU+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758735164; c=relaxed/simple;
	bh=LK7FuHWulSuZBSrOktpH5cJe+KfysFVveMNzVDwwTAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KuxkeLQRyJ3l1xkQYkUMFEyVfAn3hwF7nivPHlqtUlptGMnLwCkOr1w8OPsplGM+t+iGpE3Uu7xxeamxAr3U1dsib2GjdUzr+Jkfj1n59XmE4lMOAxASEQcHxcrd306TucSsuWJWxMfnJqBT4mTlhy7+98TIp3DbF5inR4xfGFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKtTnbE5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCUUKm001842
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Z5b3FyW91Ev7pON5LFlZ546
	L5v5xS6NyxTMHjxie3I=; b=fKtTnbE591uJeV6EPt54V98sX958FJNXQWP33iuL
	HMU173kjpyld6tP3iTkRIJyCAP1zz8iQDe/ezaCSD10W+5qKUClmYBhe6oGrtvpF
	naq7PEMxvsHSpfHdU01TKMyOqH1AVbKDsqD/J4W855HlH8YMuMG8BwgBVwgpT6O9
	MmHoDGQAZQSNf8XRyqBSWC64YleMV2hYgb4N/B7IdLrHsm3vL1Ub2vW3zAg/d0qp
	C3GTwzqhHYCrXx+9LvZrBxmKQ91kIvuNrN/C4q3DV1gAFIu4kNunNpSob3Ktx6ET
	FPYO6NiVh8+Zbb4mAdVKg6qlAq79jaQaxOO1rCn8R1F7Yg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98n7wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:32:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6fbaso686395ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758735161; x=1759339961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Z5b3FyW91Ev7pON5LFlZ546L5v5xS6NyxTMHjxie3I=;
        b=P1aoe2z+uVlXn5dvM0wXC3DWeqa1syybuHvBFRbW0m1wDSs3B1VTKnOdB9hrCFxbJM
         aXeqX1F5/5/WQw3Bs4tZ/xRmEb8Nkk5BrNnCiQYEtJhaNT9bw5vLjF+3wr8laq3N2Yvz
         EcUO+fWIJ4S+KwjfVv/vuCTW003SGAVR0/sqoFUmsG4Jusr194q6zVNF9mBHW8t38fpE
         2qkZNWquGXpv/w7GXHrOjuogSGY4Y0bXxpl5YhTsqlOTqsy/eJBJ/cNPpbvesU/3Y+vX
         7H+8ORMntOB1sqIzRPGsi8eFpfq6q03NcI8ppLXl+ijxYV1uL7Kt50KNaKTskRcyGVXb
         EbiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR7OFKu5MbeNcNHwhz/ylf4YNe9jf6HHvmna5nR9XhQZkRBbX78cCpJAYagVy017jnxE5KKvO4M5M1EkKI@vger.kernel.org
X-Gm-Message-State: AOJu0YwIRNMkvHMQrj+1fWjyi7w3wjyFJxTA+a0bPwjZxhYR1un5oVa9
	PkZSTOxfURyGdJrQQgrxt5wflsAVcEI3lHtpoy9poXcCSBhbhnPfuED21oasohONTPgEoKMnvG1
	isM3+GdTTfl0mdN3FGXN0Nq1UJJBYI/h3YUGzIe1oQgAuOEGe0DsHAUXK1R4R0ZXJj7WPxrYGkD
	rlnxzS8rYbTOjGIWV/ycSHfN6d5fQP/iAaYXnEIW4EYFA=
X-Gm-Gg: ASbGncsSh/7wpYl5hooQ5MfbP/mitvFww+0rPIprfAHsehkInocTbzjywSWYj/SzE8p
	/Rp3ljMFiwN5tGGM2SCF/Q6xbNM+ml+p/BJXzXdG3o/yW4PpCu/X1y8XdvxgnnrVkmD8qRkBwWq
	FOJ4WxdZCgKhhj57+ERGqvW4utjQwijJOK6pPHMp97ceQdxRT8uiRleg==
X-Received: by 2002:a17:903:32ce:b0:26b:3aab:f6bf with SMTP id d9443c01a7336-27ed4ac311dmr5754705ad.42.1758735160860;
        Wed, 24 Sep 2025 10:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVFoc+/aSgSKbGAREv44isgr8a+oJ1tMP5eoC7Beox5ftIIQN4N8Cm8Ud1RQbDvEzYZH2wRrzwwOkyntCwtL0=
X-Received: by 2002:a17:903:32ce:b0:26b:3aab:f6bf with SMTP id
 d9443c01a7336-27ed4ac311dmr5754505ad.42.1758735160426; Wed, 24 Sep 2025
 10:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com> <eec9a046-2742-4b7f-86ac-ef11dae19aee@oss.qualcomm.com>
In-Reply-To: <eec9a046-2742-4b7f-86ac-ef11dae19aee@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 20:32:28 +0300
X-Gm-Features: AS18NWDEujWGHc1CUohsolkmSSOR_zn4Ju2H3zwxDzlrpwz3Mtyqx9QBAuAE8wk
Message-ID: <CAO9ioeWJh6fkDYT-Y6O4mJHN3CpVw-D0nygvA0TsgHGqXpLq-w@mail.gmail.com>
Subject: Re: [PATCH 00/14] arm64: dts: qcom: add refgen regulators where applicable
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 9t8T0BUDtEJ3bvHbjEcmytuLK9dR2NZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX5XPVX5MgKfwu
 T8ihPiNRV8u278xYDgA+7Jrtq8z9g2VYnouspwit+6KZMvZwXyJ1dkhDY5gHYUU24zkd3Fe+3YL
 Bx3D+HBSuU6wYNTLM+mSW52VxinHa1icwE6VeGUEamUqh6iU3qQeTsTn2M5hBMGHHNnUMSVyovS
 gkA+SunI05NbfeAjoe/VAVRjPDYNDoV3bxSXqZRBUhaqrUXG5zWO6Qxev2+hss5UR4srwb1gee9
 00Y3Agnko9I12FH8R5J0CwNlOitdXOPDKkggoAKTAuggrjKsEXijmzR9FnCkOFEFI5g1JLrY2OO
 zuadTp3wgBxAHF4PMnrGbPysw/d/0C6DUDsERBbnY52YEA9HzgJoy4VALKgkLj++2jFlqozxfKD
 HHGwKqAG
X-Proofpoint-ORIG-GUID: 9t8T0BUDtEJ3bvHbjEcmytuLK9dR2NZO
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d42b3a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=v75zDIhsPqNLugsjS6wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Wed, 24 Sept 2025 at 13:13, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/21/25 9:09 AM, Dmitry Baryshkov wrote:
> > On several Qualcomm platforms the DSI internally is using the refgen
> > regulator. Document the regulator for the SDM670, Lemans and QCS8300
> > platforms. Add corresponding device nodes and link them as a supply to
> > the DSI node.
>
> It's likely that all PHY-ish hardware uses REFGEN, so please make
> extra sure your patches won't kill DP/USB/camera

As far as I understand, DP and USB cast their votes directly in HW.
For camera... I don't know. Do we need an extra vote?



-- 
With best wishes
Dmitry

