Return-Path: <linux-arm-msm+bounces-60288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BA9ACEBC1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 10:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 121FC167533
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 08:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DBA13AD05;
	Thu,  5 Jun 2025 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esmUzvm3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1051D2B9BC
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 08:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749111904; cv=none; b=GoP+ZXGkzFYintzHrQPGy5x3VMnRUcWVTxaZe7VFIsQ3n5QWV9NtbicfEvGV74s6acaL9fOUIu6OYn3LPpK0xNURkP1lrAKEfshn4lfKCWxWWyGlg7R4eKfcGKPOtykE3lhVV4XjjfD6YxVIuzL2mOSuXI9grhh1NDr52WzJIrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749111904; c=relaxed/simple;
	bh=xZaBeZfytCrJKOrjxBjzXhmtknBq7xCcBctElbMsMBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wv1ArIUjJ4zo8kHId+0YeG30hbDvp0KUQ4F6vB9ZktFt8G9UZCcPgX0LFYCZb9W/yRHynnWwDAik0sdAJCClSNeG71UrNvH9hRtU/euMFWlIpP6Ub/UUMy44McqcANHXakx5JqLBbNw3lNvmn76MWRScmitUgODW2cPhttT6Ii4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esmUzvm3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55581VIp032409
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 08:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtqcVj6Ok3Dj6NeRpJglAQeZgn6trv34Ds7Go5yrpew=; b=esmUzvm3cW8H23iF
	rVcEDPGn6EbXYZArK0XDbOxU4YfnOkb4uRSWRZB31Pd0Fqs7eY+W8x3hf/HuB8EY
	XZkF83spB64HgrCeV7RN3tH74FuPPxsPMZTWM92FmxfCr8wnhIius+VXM1sBn2y4
	K69otmMDrJpc41dOJHQLoHGxZmFLeC2PHc7nvP/x+8V98jm2lE+rO1NtivJgSm08
	Ja2V50M7QgtvZOYjiw81JaaNKHW/Kq6M2jM4nNGp3wcSV2g3lCTvnnDte2Vf8t1J
	DFId6dEvTCq/41xJCwJZa2oK7QvI7h7gRojzmKtJPdqylamXZXMoiegzh9SaxN+a
	b/erxQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfuyg3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:24:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2872e57so142123585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 01:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749111898; x=1749716698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtqcVj6Ok3Dj6NeRpJglAQeZgn6trv34Ds7Go5yrpew=;
        b=L7sZVUNkWFHymVDCnzR+7rmLPH1SCs8lRCJaI4iXSIYTFUPfcYoULyN7uJy1SKSpXy
         WEHY0EtJJW0tMDIZQy4ZxTMBHwuoL3JrgnB8Ou6widXvF3QwnIzkLclVD9QX3IaJYI/a
         bQpRQnmOITE5crl2sx3lXVCvq/Jrl0iEeWyahL7n0/dga9GG3VAfQ+R0DIUKYlE4a/21
         StIbRUm4vOJEGAkCkRN70ArMgI2XyQd6to9t79+ZdYk3jScwj3sz4yeXJBDwm+Sza5ae
         II/z6yJBNBHAfyr1ezxM3bwetwSQ58mwiH5Zl9H5VJOh2aFMNke1lXgXBpJbS5Y1wI7s
         hDkg==
X-Forwarded-Encrypted: i=1; AJvYcCW8ObJM0tnqKtmxRzxDV+23T//g9Ictayuaye+zhEkSJFW+5tam3IbxYa8RXci8VjOaNS8C2Ah5I9H60zvN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/1dFDGT3g0Wve3emHf1gUD1ckTL6dmTHFeozLJoUIS4uZ7FE
	iBpvNdRFKLcperbQnj4NBg14eeX32NplCTlL6qvLEjUPICdmaJ3mFxT53s8Jm9l8b59PL2ncse+
	/cOMgzTHy5VuY3QH3PR16chveR68jzdu1HTL2EX91AMNpPx5CIsYmlwzzQuLF9m11qKNS2A4X/b
	y+JsEXwq+YIBonmFqimORL4E6EpsBgMzHqcsSQYQ5+xo8=
X-Gm-Gg: ASbGncvizIj/wB7IUAOH28wfiQl9NgJXKN5AnVJ9RdQXKZjoUQ4edpzCOxze8oTIxb0
	EJNOIcGlquOXflhWMnc/MdnX1MT64SurSZQkfJzuEG5ohm2P71thAcjpRLQ8sV6xdY4KYcQ==
X-Received: by 2002:ad4:5ecd:0:b0:6fa:cdc9:8b02 with SMTP id 6a1803df08f44-6faf6f9e8f2mr86670296d6.16.1749111897901;
        Thu, 05 Jun 2025 01:24:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwCWJddjYrv66EpklTX8+EcEihxS3i6p2Y/uBi1wSP3SPDwA7FauNdbdHLl/D99kI5j790nOP61NBUmgl1UqE=
X-Received: by 2002:ad4:5ecd:0:b0:6fa:cdc9:8b02 with SMTP id
 6a1803df08f44-6faf6f9e8f2mr86670066d6.16.1749111897530; Thu, 05 Jun 2025
 01:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-qrtr_mhi_auto-v2-1-a143433ddaad@oss.qualcomm.com>
In-Reply-To: <20250604-qrtr_mhi_auto-v2-1-a143433ddaad@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 10:24:46 +0200
X-Gm-Features: AX0GCFu6xWPgyNFI69TOSuHK6IF_kGY0Cv_eMSlpv6YDKdLvYpYbd911sy_xsb8
Message-ID: <CAFEp6-1h01SScjbv_m8rU9DxhEgAFOBT_7U2mQegFZQq_O0y4A@mail.gmail.com>
Subject: Re: [PATCH v2] net: qrtr: mhi: synchronize qrtr and mhi preparation
To: Chris Lew <chris.lew@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Hemant Kumar <quic_hemantk@quicinc.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6841545b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=us5iPAVF1rjgtYe1CekA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-ORIG-GUID: gisCrMANkXf0bdlVrXQmFSKEHAERHL9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA3MyBTYWx0ZWRfX5NdRccG/3Nhz
 mbM/BD9miPpIIwVga8/WoBdxf694QUAXgYEDbfXQKSmRcNz6rest2q9XwADKUi943zH3FYG/q3B
 Pl3OoPM/Ed81cL6v1Pn5j2+Rm50FxRnM2x+ZL86Oy7FZso+ECs1dzirr0zK50s7wEIj9TVsufop
 agSiMvj5CllNJItTSB0Es9elofvWFcp/c6Mm1z7OMzUuPjtorcikwUz1BWJb1WL9RSPuCDq0DC1
 3laVu2DpNg6s8pC8pgZj40059qtYTBTBYJ11NnWXxxQJMYcsbjaBvPMtZB3jRVgTa0uhtmAIxej
 1oxwmFsBA7bT/DbtEM3SUiXFtI1CpgG8lbqR3KQmj6HG10udhrOsiJrFpA1bqVv80VWnH72CNUA
 cAJSckq53Dp+iPhzIzBCam0sv2jlxrgsOAYnNZ9sLhTyz0343+IIK4tgxswMUxdIt1WwFLbj
X-Proofpoint-GUID: gisCrMANkXf0bdlVrXQmFSKEHAERHL9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050073

On Wed, Jun 4, 2025 at 11:05=E2=80=AFPM Chris Lew <chris.lew@oss.qualcomm.c=
om> wrote:
>
> The call to qrtr_endpoint_register() was moved before
> mhi_prepare_for_transfer_autoqueue() to prevent a case where a dl
> callback can occur before the qrtr endpoint is registered.
>
> Now the reverse can happen where qrtr will try to send a packet
> before the channels are prepared. The correct sequence needs to be
> prepare the mhi channel, register the qrtr endpoint, queue buffers for
> receiving dl transfers.
>
> Since qrtr will not use mhi_prepare_for_transfer_autoqueue(), qrtr must
> do the buffer management and requeue the buffers in the dl_callback.
> Sizing of the buffers will be inherited from the mhi controller
> settings.
>
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation=
")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldcons=
ulting.com/
> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> ---
>  net/qrtr/mhi.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 5 deletions(-)
>
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 69f53625a049..5e7476afb6b4 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -15,6 +15,8 @@ struct qrtr_mhi_dev {
>         struct qrtr_endpoint ep;
>         struct mhi_device *mhi_dev;
>         struct device *dev;
> +
> +       size_t dl_buf_len;
>  };
>
>  /* From MHI to QRTR */
> @@ -24,13 +26,22 @@ static void qcom_mhi_qrtr_dl_callback(struct mhi_devi=
ce *mhi_dev,
>         struct qrtr_mhi_dev *qdev =3D dev_get_drvdata(&mhi_dev->dev);
>         int rc;
>
> -       if (!qdev || mhi_res->transaction_status)
> +       if (!qdev)
> +               return;
> +
> +       if (mhi_res->transaction_status =3D=3D -ENOTCONN) {
> +               devm_kfree(qdev->dev, mhi_res->buf_addr);
> +               return;
> +       } else if (mhi_res->transaction_status) {
>                 return;
> +       }
>
>         rc =3D qrtr_endpoint_post(&qdev->ep, mhi_res->buf_addr,
>                                 mhi_res->bytes_xferd);
>         if (rc =3D=3D -EINVAL)
>                 dev_err(qdev->dev, "invalid ipcrouter packet\n");
> +
> +       rc =3D mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, mhi_res->buf_addr,=
 qdev->dl_buf_len, MHI_EOT);
>  }
>
>  /* From QRTR to MHI */
> @@ -72,6 +83,30 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep=
, struct sk_buff *skb)
>         return rc;
>  }
>
> +static int qrtr_mhi_queue_rx(struct qrtr_mhi_dev *qdev)
> +{
> +       struct mhi_device *mhi_dev =3D qdev->mhi_dev;
> +       struct mhi_controller *mhi_cntrl =3D mhi_dev->mhi_cntrl;
> +       int rc =3D 0;
> +       int nr_el;
> +
> +       qdev->dl_buf_len =3D mhi_cntrl->buffer_len;
> +       nr_el =3D mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
> +       while (nr_el--) {
> +               void *buf;
> +
> +               buf =3D devm_kzalloc(qdev->dev, qdev->dl_buf_len, GFP_KER=
NEL);
> +               if (!buf) {
> +                       rc =3D -ENOMEM;
> +                       break;
> +               }
> +               rc =3D mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, qdev-=
>dl_buf_len, MHI_EOT);
> +               if (rc)
> +                       break;
> +       }
> +       return rc;
> +}
> +
>  static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>                                const struct mhi_device_id *id)
>  {
> @@ -87,17 +122,24 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mh=
i_dev,
>         qdev->ep.xmit =3D qcom_mhi_qrtr_send;
>
>         dev_set_drvdata(&mhi_dev->dev, qdev);
> -       rc =3D qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> +
> +       /* start channels */
> +       rc =3D mhi_prepare_for_transfer(mhi_dev);
>         if (rc)
>                 return rc;
>
> -       /* start channels */
> -       rc =3D mhi_prepare_for_transfer_autoqueue(mhi_dev);

The autoqueue has been introduced to simplify drivers, but if it
becomes unused, should we simply remove that interface from MHI? Or
improve it with a autoqueue_prepare() and autoqueue_start()?

Regards,
Loic

