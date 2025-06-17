Return-Path: <linux-arm-msm+bounces-61512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2898ADBE2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 02:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55A3F16A00B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 00:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E4F16DEB3;
	Tue, 17 Jun 2025 00:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVig9xNP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C294514F125
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 00:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750120203; cv=none; b=luDFdzlXecNSOq13vruL55OoggI6RnFuvjFNptbUKOJqVQx9rEu6S7ihgkiWYngk3a7idkWFuPxY6c3VHgEIxLSa5TTKkwS+ItPN7spqbVVNEd4wHfFRhfvMy7lz2lgZfKjmsaRobC4ryAbgkD/8RDVHZPglvKUPxNixfr3tOb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750120203; c=relaxed/simple;
	bh=/OvAXeXnbc+SV9Vq7CWaLCrhrnHUxMr1vpR5Fbdm0Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEO03mVh5J4eoEhCMblscIc28mYDP1gqDRfJKh59zguI0mZtRx0sDydFfmpRWafjJzLpdH295zLXgk+qc1Ku4DGHxnKagjAKGxU0+A9rpzCS9v7eyR/wbcWHc5ePetW1dVDstrqMFYaprBVRPHJrlaeKb2SqLK29wVnuWdX4fQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVig9xNP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHm700000772
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 00:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PxBxdB6UbGf0Xh3ZJWJL1VY5sPor29vDeLUN/9Oy33Q=; b=AVig9xNP007KmNUZ
	3ZknusRj4RY7El0ln90ryEoAzzf9DfFJTbVHUdyiNs7d2SrzkQy2wjfQJWNW03du
	44cMGgB4GKEWygqtVe6FamKUKuPfyxHPScMEGqCtm+9oaE/P1L9LfkCHxcEhKX8C
	1F6D7Kk3uGk7LOVxgKPFHuNQcTz7sg8preOmKQl1EhRFXvhLhOnlYYzJ45dLHPDU
	MuLll+5WtgNtvRgPj9K7yQt+OBs/onG1UZOyAar2JVT/vf78np530uVig/dNoNgv
	3bkgFmlqKmXzBdH5zoBqMSo5yVO1FuAQfcl2hTwWer0rMdx0K757G9BTTDIwqJni
	iIDRaA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsx706-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 00:29:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311d670ad35so4944347a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 17:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750120194; x=1750724994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxBxdB6UbGf0Xh3ZJWJL1VY5sPor29vDeLUN/9Oy33Q=;
        b=bHlJ5+mQIJhGunvuDQ6nVSMJHOHO13eSoq9peUeQ+hFuQ6oDe8uV2xY/lmy4bs4fvp
         0ibjxfZ+TIfuux1REiKARXXyZ5m5c0eJQ1fy7hUDbvNZpy6DAUZuTjz+TdY5jKPCJDww
         35nK5qz/Af7FK+fb+349/a8QlZSpNNk6T1yC7nuje9tJ/ATL9pM9nQjhUh/wZ6rX1pno
         pbN+xAJmAlPk3LoD9m6KYYPQC2YdpgNveO64M+OSYkc2Zxkv8001cFLXOCcI9N73h1Pe
         43Ya7I12gJmXGupOIa4GRy+TvAg5JMNyWuZFOtrPRaBeIgie+02umRtBm56mUnIFeY+R
         XlbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzq/Pw7yzKEsHP6eeX/oBQS/WNhWezCnATGFOf1AUN1tF5gepVd8oALV8hDAA6r6IRaxnjuVH372X4C+/R@vger.kernel.org
X-Gm-Message-State: AOJu0YwNcoSHUKex8b5cE5YEb65rK5WzXqcYXNp0WC7fQFInmKftlpCj
	RQsJjwoWYmwhaH76QaRdwrFI3pxg9o/6HbybhwjFxGi4eUcabPIEGMd6zcHHgNno+wbXcmr+H2m
	muMVgtSsg2SNvnXvZ9QiaKDlv6NyDiw1suv6KhYu8bBZNfb7OKLUheE6H0WJBK7JCdj5d7mXE8D
	M2+XX5f11umUhLg/PF6YcuKNdW8hD0s23cNkkT0S2X0hU=
X-Gm-Gg: ASbGnctvvwmg1GU7NiTsdpH+9llMvbitC0Q31EKxYryJBCgwiN8MKPSyH0X5egqv8Ba
	+fuf9MoewkxZhNeda1rltSBnvmYRlxMyq1vph/A4HQI9MyEZIiRkI+dpdd/04QDh5PuYYmX2C+F
	wbt5c9
X-Received: by 2002:a17:90b:48ca:b0:312:26d9:d5b4 with SMTP id 98e67ed59e1d1-313f1d4f258mr19603850a91.17.1750120194148;
        Mon, 16 Jun 2025 17:29:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSNC2kTDTNGwuTiWe+hV85H22cRA1JUcvRpOafMzvyazp3L8h7VPy14wOxOhT9JVskFD/RQnNoBw74CrtV0VM=
X-Received: by 2002:a17:90b:48ca:b0:312:26d9:d5b4 with SMTP id
 98e67ed59e1d1-313f1d4f258mr19603817a91.17.1750120193711; Mon, 16 Jun 2025
 17:29:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-qrtr_mhi_auto-v2-1-a143433ddaad@oss.qualcomm.com> <20250609160042.7a8940d7@kernel.org>
In-Reply-To: <20250609160042.7a8940d7@kernel.org>
From: Chris Lew <chris.lew@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 17:29:42 -0700
X-Gm-Features: AX0GCFvc6F2pbAeWVNoCAEXGSMZa2DpN02Ww52JJsSMr40FBqwooK56KL_L_0sc
Message-ID: <CAOdFzchj8KKoBd-wz-KZbNu6V4BGWq6U0-spPdQx7TDCv7U9nw@mail.gmail.com>
Subject: Re: [PATCH v2] net: qrtr: mhi: synchronize qrtr and mhi preparation
To: Jakub Kicinski <kuba@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Hemant Kumar <quic_hemantk@quicinc.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDAwMiBTYWx0ZWRfX+8qYvvAoOpRA
 B0NECEWeTNA6uTHB2NcgwWkCf5TkCOSvHgbWnaqix3bwumenRa/lU+aHFfqrrmWYf61wXWrjutb
 SfnxxjRfUFebgQ9QzDDON52z9puLMYwpCyUoLB81e7x+MRkyOZYm7fq9L5hZ/aXAP076KF3AzV1
 D6k0Q6AbCKLGtiuN9wcFIZ+Z+TtvvpZ6ZJHpmTvElPwGLjcy/WUTPsFTg9JcQIes3W1SQ+UGyY+
 5VGW/y9R9Qcy4PIVTBcHddHuhY+UbUDY95p6bZKD5XC3iJe10txyhXho2bhR8c287pnYLGKLKfZ
 P4+gdpHvk8v5u0sT1MO5x5MVJLV9Ghrmfmk5N5EUxysWrUyPr8sAz70ptmctHgw5FMZwSYk43h2
 uPMOnSODRrt7EAyl6LqZsCwP2DkPQE14Q2Ir0KaC9JKwM7BcnCge/UziZS2CzGcV7dkHdlvq
X-Proofpoint-ORIG-GUID: zjIfzyga5GIg9Fu99ebcEHEoq5hmDmS0
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=6850b703 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=VwQbUJbxAAAA:8 a=UYrFKEw7bejQHJ5Mm34A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: zjIfzyga5GIg9Fu99ebcEHEoq5hmDmS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_12,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=689 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170002

On Mon, Jun 9, 2025 at 4:00=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 04 Jun 2025 14:05:42 -0700 Chris Lew wrote:
> > +     rc =3D qrtr_mhi_queue_rx(qdev);
> > +     if (rc) {
> > +             qrtr_endpoint_unregister(&qdev->ep);
> > +             mhi_unprepare_from_transfer(mhi_dev);
>
> is ignoring the rc here intentional? may be worth a comment
>

Ah no, not intentional. We should return rc here. Will update, thanks!

> > +     }
> > +
> >       dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
> >
> >       return 0;
>
> Note that we return 0 here, not rc
> --
> pw-bot: cr

