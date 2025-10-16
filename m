Return-Path: <linux-arm-msm+bounces-77608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 853DABE4059
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 16:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1649E1891836
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 14:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D70C3451AD;
	Thu, 16 Oct 2025 14:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oK0IvGUF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CA23451C6
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626359; cv=none; b=DXAwicNFDjwTjPVykIVnPRdOKM6tsnpPJKPQhH7WUGhM+SHnAGxjODtM3ODtAvlLJKctX9/tb1rvOLRKZuniP7/xOG/pmSpyDXTG4/WOBjFstg1CQUA3vFFkjLIhwh037aAKvo0RQ926RUdfLpY/G5o+aGgbiCqEZ4+A/E/FIyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626359; c=relaxed/simple;
	bh=bb2uPhrku27uZPv/Jf75e5nhpowUMYOiMnBB5KihFPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbhDiJDPI0f0uiXwxi+KMJ5J38b6C9mPXATj690MZ6VkoGETGToh3J5xE7gOvFPPKoM3m+u8po2a7dqIQFxhzjFUc4qW/WgEY+b38R7gSgpmBCouVOBRsjP+9NR1kyIan75fdVOvRRV+EKAODUPI4kvbjoq4ppAe9yGD3Mq8i1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oK0IvGUF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GEFpx5016271
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 14:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=jPmtY2bWstZxGYrHD2oLA4kDgMlBAGLM7cSsgPby8R8=; b=oK
	0IvGUFq5Jpvs+nDFM/Il2MpT/ilhF7MHPLO+EQjXbkTN5WAB2rI0VHOSOOV+Qzxv
	sRtsBKGetq9wWxLEcY2lXvRoMYL7LPpZ9pIVBfAimdy6R2mv9p6gAudwk8iSrs25
	65FvBqQsyi+Yt4UDL56r1HgrPj1Jwtkn5AOnrPf0622q69XSNno8TLBKC0CUEYol
	ixpON2jXbKn9SfLTwAQqtm6rDhMB2kh0BfyW/hagjxvIxYHeAEDIseAWzJedm9W+
	vK8BUcdjcOH0s4pKDHXdtZfLjAruVuPpD/VTQr//0Fa2Z6QX9Ou1aNUUAQRav4qz
	6q8Ce5vsU3zTX1Onw0lQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkgn9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 14:52:36 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-3c97be590afso161377fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626355; x=1761231155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPmtY2bWstZxGYrHD2oLA4kDgMlBAGLM7cSsgPby8R8=;
        b=rGMAQ2G2jUm3IVNqrupQk1pzX6De2tWI/K3CBmdlzHmC9MmIvZvZfbmFi8DFsmcuTR
         5stWSppNX5pI4F6U8FMaeNhVd7ro04Zl7IfYoDdfBsYu8K620xZLhOvrcTSxl9gYdjwI
         t/62zpvWJUGAG/m7RhnMWNOKwpwUBvvYtmGvb2EJstoS4NwtrBkxbzRS9vJzQBW369zS
         IdjphtAe/uM0W8rvKiNW2eb1z6lX2ygDjO1N6uLPPahUygKBepvpZmrLBxVxvp9/JcfP
         Ha+VhHQwL8nhBS0iekHABKiY81i8Mr0q2TyK24NNggACNrZ/PDkZs87iuD3ZZUMD8+Qo
         7+TA==
X-Forwarded-Encrypted: i=1; AJvYcCWwchPb43SSexrzuDDjDkeAgBapU7+b7AsMfOmeoE0BGslE6ATqxJHh4v5EH8OecMxrweRObLIq3N7az35R@vger.kernel.org
X-Gm-Message-State: AOJu0YzpFo7Jhc18hlLTUe0urpbycgrtP7fjBHdcfR/qZy4Jmai6TJNJ
	PNRX6v9yya4N2F4zvl8FUewUUqqO0oWhMjo76wftjiGsJoSRI6kdaJblrJmejBqELB9YUYocvus
	Nhnt7AUdagfoXLHA08xFY/qVAwuOarvfXWLTuy4pG30frRXjH8UcRCLX9LrJq5DsUUyN0+jeVTl
	Qr0i/BM1bC4yXnxIPVwrAz5//Pb3m+2tVT/YYfKQSoNe0=
X-Gm-Gg: ASbGncs13PeEAX17qCsuliNm9R54eEKYvteRv5bPRQU91KLtz66g9c1yMMM0aCr7eqt
	r6MgTJtD2+7wXpaS50I6ThXtTe9G1FymZyh9vpGJwni6WcAYtYWcxgxp3qtm72kA/H43tvYQH8I
	bb9P6xCPNRoUvxoZu2ZoZJIFO0WQfy7d2Ew0PTqRX/ee2F1uaSW9lqrWRcySGkmFRToGTvJtIoY
	+NXhFl1WjTBnUk=
X-Received: by 2002:a05:6871:2e88:b0:35d:a9e2:fbd1 with SMTP id 586e51a60fabf-3c98cfa8295mr10099fac.21.1760626355281;
        Thu, 16 Oct 2025 07:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF39ocujuIwT0Et62sHrBT+rRRN4wBRxOHxmKLmre65EnhOwqDPEsCuGBua+8VJiCAAa15gVkxk2D9mH6TwzQ8=
X-Received: by 2002:a05:6871:2e88:b0:35d:a9e2:fbd1 with SMTP id
 586e51a60fabf-3c98cfa8295mr10075fac.21.1760626354773; Thu, 16 Oct 2025
 07:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250718105407.32878-1-vignesh.raman@collabora.com> <20250718105407.32878-2-vignesh.raman@collabora.com>
In-Reply-To: <20250718105407.32878-2-vignesh.raman@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 07:52:23 -0700
X-Gm-Features: AS18NWBmqrEUHFQlSWdIGqm2-_tBPDNsmr766wJpJByzaFclGFLQ0RGnzuLEsPQ
Message-ID: <CACSVV029ueL_4Y5irmmOwy_9QDQGqDe_1wCGUe22FdefQiNjkw@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] drm/ci: disable apq8016 and apq8096 bare-metal jobs
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        robdclark@gmail.com, guilherme.gallo@collabora.com,
        sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
        lumag@kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: t2Wz21QhPPXQvlSiwA-0wmv0YeawQi1F
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f106b4 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=Gxbm4VOBLxWGKnsTXboA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: t2Wz21QhPPXQvlSiwA-0wmv0YeawQi1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXyquOHVyoJlA+
 PDWwO0PEkOwmJBu2+HcRq/n8acEEe6eAsHjKLXjT+Vow7xv+K9IYDZTKT0vnZFxlfgTeICXpaeD
 IhCqHdgXqV8fFJifTUIZ2Qhtf7kOidHBzK7xv8vM4A1UJi2f/bkqJ+GknVZ2rwkE13zG1eQZH98
 CxRXHKlLa5Ay5GndZZFQ4PTx7qJKbzNgBaeJO+KuS53AstacQtUpK05bMQPkRGlvtHru1pYJJep
 Jkbo4jEaalx5BcOTVOyGMm6pe0b3Jd9kZkxrdZ5H4qRuuN4QWa3CtOE4hcRV34oVHngRV7XAyCP
 CDq7vdHKUjBxfdEaClbqUP+mIj2Pi2+8Ul10VsSmfoKyPCwza3fPr+fyTdOokfovaRmILgUIQct
 3cc8jB/YvX64dl2+50jvHgBakIBU+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Fri, Jul 18, 2025 at 3:54=E2=80=AFAM Vignesh Raman
<vignesh.raman@collabora.com> wrote:
>
> These devices are being moved to LAVA. The jobs will be enabled and the
> job definitions will be updated once the move is complete.

fwiw, the runners are up and running in LAVA now

BR,
-R

> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/test.yml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 81147e86bfd0..53d19ffaaf61 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -148,7 +148,9 @@ msm:sc7180-trogdor-kingoftown:
>      GPU_VERSION: ${DEVICE_TYPE}
>      RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-kingoftown
>
> -msm:apq8016:
> +# FIXME: Disable the bare-metal jobs. These devices are being moved to L=
AVA.
> +# Once the move is complete, update the job definitions accordingly.
> +.msm:apq8016:
>    extends:
>      - .baremetal-igt-arm64
>    stage: msm
> @@ -165,7 +167,7 @@ msm:apq8016:
>    script:
>      - ./install/bare-metal/fastboot.sh || exit $?
>
> -msm:apq8096:
> +.msm:apq8096:
>    extends:
>      - .baremetal-igt-arm64
>    stage: msm
> --
> 2.47.2
>

