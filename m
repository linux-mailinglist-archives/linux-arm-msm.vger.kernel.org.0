Return-Path: <linux-arm-msm+bounces-85594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A796CC97AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 21:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5586530281AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 20:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89712D77F5;
	Wed, 17 Dec 2025 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWjHUkwF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7oIoOxC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6497258ECB
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766003066; cv=none; b=aIgdOW3iRIyjf2g0IKPKxXzZpVXwvhsIMjj9BMewJEuvAUkie5tCDy8ijyl26vxHJO8IQENh+YgJrJKMcY2rt2Kot94GqNdTy5MDV98REX/YSg2w/TKJNUCexqwqD4JRmcygD+9AohEA5nsf2zeSYL6yfp070MHlxzpMNiZwP+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766003066; c=relaxed/simple;
	bh=vGywHmHGxCD7gsSf8aFHvCc3GiqfFaHSq1s1as9SHng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L++K7Mlb8hIiXh1lTu8QP0pT8M9joLFR+oLA5rSslYUBxiDGhXbzdY39tMzeDaiOB7sAt8/1qt6InmaoD9iHl5DKwfjd+PrxEfroACQ4G8hx/eJeezb6IYLIgF+ba2EqTcIQ0bvf3pOF1fcBzGikd79hQkjPyC0N0j/PGYnx0pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWjHUkwF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7oIoOxC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHJBi6X3565792
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 20:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vthNad2+T2rmsoTcjGmtKVeS6Byiedh7dsoEOYpCIwY=; b=bWjHUkwFx4jFAQay
	c6sPLzRcwwaVi1fRc5Oxny10U/XHwh3YfV/ZDxjy1u7iVOWPRCjV5+g2e+MpVUl/
	GjEE6EsRHhIVuS76uzFBKTuM9C/5wDZ0a8+j+lAgVNE4yps3R4lGDKYftzZ18OnX
	HUD1xYlD1/Us2SkE8VOql/8LMbvAyG1Yc3d+5mMB1KURCi2nkEM9+cXMxY/3tAlO
	zzK7hHa/RDlbkkiGJpOL+tCXT8bhL6VDiaYYuNm12xCvSijcVFgVRRlA0AgbUJ20
	3ENBhDt6aBeNdQ83AirCn6rvu9C2dhP0PCjxwxPnwGL/shNxYDvETsboj23trR8X
	cvGJ9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3myj3334-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 20:24:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a37ca7ffdso54128956d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766003063; x=1766607863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vthNad2+T2rmsoTcjGmtKVeS6Byiedh7dsoEOYpCIwY=;
        b=K7oIoOxCERXkmV6uZPiOM3duk48wUKB6KPygN0x4y/p2+vg24i9paCiCoK5ITqsAue
         Lz9aqibE041PGnT5XfdUNlViPwxvvfe/LcH+OOskCr/msKzPZE8qpBox3w8gqB11miK+
         kqUMg9w3LJxdcllPc2VK9S5v53i2kL4Y/Kp2EzyP4XnFl0j9BW+Cux22gnz/qr+C/TGg
         Bl/7tTHTQbmIXi1C7KpD44+79nT9vy1AHxULMFhvaHCHNRxM9O1inrUiLgUM8AHpffYB
         k2ftWGYCth5PFMc0BNQCFMha9DT8WnaXbTeRNO9t3ydeTprtGRA0vmZYNj0UFQ0zRFSd
         KwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766003063; x=1766607863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vthNad2+T2rmsoTcjGmtKVeS6Byiedh7dsoEOYpCIwY=;
        b=Jw596PfGxsw3+FgQNzvYmjb3GNML+cfmBbt+S97pjnp1FUUa1bt21lWoKRWwon9O4o
         D3zf4Bm1ieeim6J6ELjhCxMRe6Xb5pG37cbpmfRm470dwja6rfE/jypqUWu9WkBYINIs
         ZSQVGtxXM6vBWL7MCSICMKjUTlEjtjD7j0byTKY9XK9N9WCig74DpQCPXwbx220JkTFt
         5G25yaaOXgkVvHYbHG43rG1wAfh5q7kNXE0thSBrfAFNT0SIkMAl+Pq8xCtnF8A+rZPs
         ho+6u/uoRlAQqwq9LvO4CxwzS3NEKPduAayGyyvln9c3IYicxtoB44ERbfrAT9CNF2PI
         RlDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYIJqRxTf5SJ5f1Tqx81u3ofjUyDKvQIAXEezuQkKrjQV9C2VvDCD6aHBEqwJdrlrczLetULIOsomX/CDz@vger.kernel.org
X-Gm-Message-State: AOJu0YxYQukEGauqC0bsuoOHHfW11zPWzHNe/mxlUWk2FgVIbbl8+14D
	pWzwHwcMXp/2nOwZpzrqe1m1GftKR/gx74pTjyMcIn2tH7IBpX9+klsTtBpRdtBPtJBjCQdB3MD
	S1Xmorm3bGrieqy9LJh50PgnXuAEyTez1F3OalXvgs8f6EGXBtKn9Pvnhm5nLF9diHJqzpgbXFY
	IETN1y6gqB8op74HvRSpB92ltn603ApXC9aW2jCD5b8Zs=
X-Gm-Gg: AY/fxX6lkibG3oyiAXX0TfTXTZMu/y9WHwROM2dVDlJBj/zFEIHToeNl/pOhpdoDHeN
	BOqmrPi+GTVkNXTH5ZivcasX8VVWUSj/bbINTOhsSclePy5yQVrsXArJlMCeViobe6Qq1K/pV9M
	FR1xMVqscBLvIFD6luFIJlhhM1TdAM2xjcYLSYoCuSVJ+EWkfy37ydUuD0mW/8/T1/0DlKj1N2M
	waZTn9LTCCTKEsvx9pTA3COTPQ=
X-Received: by 2002:a05:6214:2403:b0:88a:27f1:45b4 with SMTP id 6a1803df08f44-88a27f15228mr221016086d6.64.1766003062615;
        Wed, 17 Dec 2025 12:24:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeBgJQN5Ey0wcQ6AWDyHDO/iXdgT8XWK/xdnuSO6/M23MJ44oZy/UWfQN2bu+7isUHsPE6XDH3pL56E5SFUKk=
X-Received: by 2002:a05:6214:2403:b0:88a:27f1:45b4 with SMTP id
 6a1803df08f44-88a27f15228mr221015556d6.64.1766003062064; Wed, 17 Dec 2025
 12:24:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217-qrtr-fix-v1-0-f6142a3ec9d8@oss.qualcomm.com> <20251217-qrtr-fix-v1-2-f6142a3ec9d8@oss.qualcomm.com>
In-Reply-To: <20251217-qrtr-fix-v1-2-f6142a3ec9d8@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 21:24:11 +0100
X-Gm-Features: AQt7F2q7A1e739k8MGr1ULDKzmInip-7FQYO14MzSUzmqXEdlwQRdTjGriKEiYU
Message-ID: <CAFEp6-1hepC9TdkXVPGDB393e661jTfQvvC7hjfKNC5r6x7RZg@mail.gmail.com>
Subject: Re: [PATCH 2/2] bus: mhi: host: Drop the auto_queue support
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxim Kochetkov <fido_max@inbox.ru>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDE2MiBTYWx0ZWRfXygWbDCtWWCaS
 A/mNkdVKyJSKwcMmdpgo8I/FpM9tTpbbaxscTwVUwaFEGLYCyhkbC90rWLMGWCsjmE5RBVQdwbx
 gg90GLSRtpZuehi4Gbu6voe41nztlI1PtrNKDbqPDKk6B+6u480GPKyCFI2fLisv/IG9uHTkkgK
 1Jn6EZgqWq415Kvp+1vCXQiaIC8DSlAsE4QmGnvss90GiROEcSwZPc4Flsk5YY1Js4qmqrtiAw3
 YLlbb1bsApOcP16YKFi+2Snu57OhDdEtBXqj7Ynb+izb2Jh2YeAPMBvLVOgIBu3Z/xdnnr+eZlP
 e8mGb4y8ei2A2CgIiCxnEfLWrMBc+4P+jh3Yc0iuOjVMvvzRUFQTmEs1loRV5lcr1DcuVEwWnVG
 r0sPHIEeFB3lxW149tokwVUmvq69eQ==
X-Proofpoint-ORIG-GUID: -ONY-T-lIM02fz5yCNcqklA-72TTG40b
X-Authority-Analysis: v=2.4 cv=CtOys34D c=1 sm=1 tr=0 ts=69431178 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7mQcDxK4x4bWUiN2oWMA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: -ONY-T-lIM02fz5yCNcqklA-72TTG40b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170162

On Wed, Dec 17, 2025 at 6:17=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Now that the only user of the 'auto_queue' feature, (QRTR) has been
> converted to manage the buffers on its own, drop the code related to it.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/bus/mhi/host/init.c     | 10 -----
>  drivers/bus/mhi/host/internal.h |  3 --
>  drivers/bus/mhi/host/main.c     | 81 +----------------------------------=
------
>  include/linux/mhi.h             | 14 -------
>  4 files changed, 2 insertions(+), 106 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 099be8dd1900..b020a6489c07 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -841,18 +841,8 @@ static int parse_ch_cfg(struct mhi_controller *mhi_c=
ntrl,
>                 mhi_chan->lpm_notify =3D ch_cfg->lpm_notify;
>                 mhi_chan->offload_ch =3D ch_cfg->offload_channel;
>                 mhi_chan->db_cfg.reset_req =3D ch_cfg->doorbell_mode_swit=
ch;
> -               mhi_chan->pre_alloc =3D ch_cfg->auto_queue;
>                 mhi_chan->wake_capable =3D ch_cfg->wake_capable;
>
> -               /*
> -                * If MHI host allocates buffers, then the channel direct=
ion
> -                * should be DMA_FROM_DEVICE
> -                */
> -               if (mhi_chan->pre_alloc && mhi_chan->dir !=3D DMA_FROM_DE=
VICE) {
> -                       dev_err(dev, "Invalid channel configuration\n");
> -                       goto error_chan_cfg;
> -               }
> -
>                 /*
>                  * Bi-directional and direction less channel must be an
>                  * offload channel
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/inter=
nal.h
> index 7937bb1f742c..7b0ee5e3a12d 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -286,7 +286,6 @@ struct mhi_chan {
>         bool lpm_notify;
>         bool configured;
>         bool offload_ch;
> -       bool pre_alloc;
>         bool wake_capable;
>  };
>
> @@ -389,8 +388,6 @@ int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl=
,
>                       struct image_info *img_info);
>  void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
>
> -/* Automatically allocate and queue inbound buffers */
> -#define MHI_CH_INBOUND_ALLOC_BUFS BIT(0)
>  int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
>                        struct mhi_chan *mhi_chan);
>  void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 861551274319..53c0ffe30070 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -664,23 +664,6 @@ static int parse_xfer_event(struct mhi_controller *m=
hi_cntrl,
>                                 mhi_cntrl->runtime_put(mhi_cntrl);
>                         }
>
> -                       /*
> -                        * Recycle the buffer if buffer is pre-allocated,
> -                        * if there is an error, not much we can do apart
> -                        * from dropping the packet
> -                        */
> -                       if (mhi_chan->pre_alloc) {
> -                               if (mhi_queue_buf(mhi_chan->mhi_dev,
> -                                                 mhi_chan->dir,
> -                                                 buf_info->cb_buf,
> -                                                 buf_info->len, MHI_EOT)=
) {
> -                                       dev_err(dev,
> -                                               "Error recycling buffer f=
or chan:%d\n",
> -                                               mhi_chan->chan);
> -                                       kfree(buf_info->cb_buf);
> -                               }
> -                       }
> -
>                         read_lock_bh(&mhi_chan->lock);
>                 }
>                 break;
> @@ -1177,17 +1160,12 @@ static int mhi_queue(struct mhi_device *mhi_dev, =
struct mhi_buf_info *buf_info,
>  int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction di=
r,
>                   struct sk_buff *skb, size_t len, enum mhi_flags mflags)
>  {
> -       struct mhi_chan *mhi_chan =3D (dir =3D=3D DMA_TO_DEVICE) ? mhi_de=
v->ul_chan :
> -                                                            mhi_dev->dl_=
chan;
>         struct mhi_buf_info buf_info =3D { };
>
>         buf_info.v_addr =3D skb->data;
>         buf_info.cb_buf =3D skb;
>         buf_info.len =3D len;
>
> -       if (unlikely(mhi_chan->pre_alloc))
> -               return -EINVAL;
> -
>         return mhi_queue(mhi_dev, &buf_info, dir, mflags);
>  }
>  EXPORT_SYMBOL_GPL(mhi_queue_skb);
> @@ -1472,45 +1450,6 @@ static int mhi_prepare_channel(struct mhi_controll=
er *mhi_cntrl,
>         if (ret)
>                 goto error_pm_state;
>
> -       if (mhi_chan->dir =3D=3D DMA_FROM_DEVICE)
> -               mhi_chan->pre_alloc =3D !!(flags & MHI_CH_INBOUND_ALLOC_B=
UFS);
> -
> -       /* Pre-allocate buffer for xfer ring */
> -       if (mhi_chan->pre_alloc) {
> -               int nr_el =3D get_nr_avail_ring_elements(mhi_cntrl,
> -                                                      &mhi_chan->tre_rin=
g);
> -               size_t len =3D mhi_cntrl->buffer_len;
> -
> -               while (nr_el--) {
> -                       void *buf;
> -                       struct mhi_buf_info info =3D { };
> -
> -                       buf =3D kmalloc(len, GFP_KERNEL);
> -                       if (!buf) {
> -                               ret =3D -ENOMEM;
> -                               goto error_pre_alloc;
> -                       }
> -
> -                       /* Prepare transfer descriptors */
> -                       info.v_addr =3D buf;
> -                       info.cb_buf =3D buf;
> -                       info.len =3D len;
> -                       ret =3D mhi_gen_tre(mhi_cntrl, mhi_chan, &info, M=
HI_EOT);
> -                       if (ret) {
> -                               kfree(buf);
> -                               goto error_pre_alloc;
> -                       }
> -               }
> -
> -               read_lock_bh(&mhi_cntrl->pm_lock);
> -               if (MHI_DB_ACCESS_VALID(mhi_cntrl)) {
> -                       read_lock_irq(&mhi_chan->lock);
> -                       mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> -                       read_unlock_irq(&mhi_chan->lock);
> -               }
> -               read_unlock_bh(&mhi_cntrl->pm_lock);
> -       }
> -
>         mutex_unlock(&mhi_chan->mutex);
>
>         return 0;
> @@ -1522,12 +1461,6 @@ static int mhi_prepare_channel(struct mhi_controll=
er *mhi_cntrl,
>  error_init_chan:
>         mutex_unlock(&mhi_chan->mutex);
>
> -       return ret;
> -
> -error_pre_alloc:
> -       mutex_unlock(&mhi_chan->mutex);
> -       mhi_unprepare_channel(mhi_cntrl, mhi_chan);
> -
>         return ret;
>  }
>
> @@ -1600,12 +1533,8 @@ static void mhi_reset_data_chan(struct mhi_control=
ler *mhi_cntrl,
>                 mhi_del_ring_element(mhi_cntrl, buf_ring);
>                 mhi_del_ring_element(mhi_cntrl, tre_ring);
>
> -               if (mhi_chan->pre_alloc) {
> -                       kfree(buf_info->cb_buf);
> -               } else {
> -                       result.buf_addr =3D buf_info->cb_buf;
> -                       mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
> -               }
> +               result.buf_addr =3D buf_info->cb_buf;
> +               mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>         }
>  }
>
> @@ -1666,12 +1595,6 @@ int mhi_prepare_for_transfer(struct mhi_device *mh=
i_dev)
>  }
>  EXPORT_SYMBOL_GPL(mhi_prepare_for_transfer);
>
> -int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev)
> -{
> -       return __mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_B=
UFS);
> -}
> -EXPORT_SYMBOL_GPL(mhi_prepare_for_transfer_autoqueue);
> -
>  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
>  {
>         struct mhi_controller *mhi_cntrl =3D mhi_dev->mhi_cntrl;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index dd372b0123a6..88ccb3e14f48 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -215,7 +215,6 @@ enum mhi_db_brst_mode {
>   * @lpm_notify: The channel master requires low power mode notifications
>   * @offload_channel: The client manages the channel completely
>   * @doorbell_mode_switch: Channel switches to doorbell mode on M0 transi=
tion
> - * @auto_queue: Framework will automatically queue buffers for DL traffi=
c
>   * @wake-capable: Channel capable of waking up the system
>   */
>  struct mhi_channel_config {
> @@ -232,7 +231,6 @@ struct mhi_channel_config {
>         bool lpm_notify;
>         bool offload_channel;
>         bool doorbell_mode_switch;
> -       bool auto_queue;
>         bool wake_capable;
>  };
>
> @@ -743,18 +741,6 @@ void mhi_device_put(struct mhi_device *mhi_dev);
>   */
>  int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
>
> -/**
> - * mhi_prepare_for_transfer_autoqueue - Setup UL and DL channels with au=
to queue
> - *                                      buffers for DL traffic
> - * @mhi_dev: Device associated with the channels
> - *
> - * Allocate and initialize the channel context and also issue the START =
channel
> - * command to both channels. Channels can be started only if both host a=
nd
> - * device execution environments match and channels are in a DISABLED st=
ate.
> - * The MHI core will automatically allocate and queue buffers for the DL=
 traffic.
> - */
> -int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev);
> -
>  /**
>   * mhi_unprepare_from_transfer - Reset UL and DL channels for data trans=
fer.
>   *                               Issue the RESET channel command and let=
 the
>
> --
> 2.48.1
>
>

