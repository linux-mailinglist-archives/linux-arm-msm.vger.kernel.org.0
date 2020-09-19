Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFCF7270D9B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 13:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgISL1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Sep 2020 07:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgISL12 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Sep 2020 07:27:28 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F02C0613CE
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2020 04:27:28 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id jw11so4406183pjb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2020 04:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=RfCH5EQD75GPqHY0gWCFSqLjcutXbDfTuHy4LJ14TTE=;
        b=varJdIJ6N4GAGB5Xwl4guzDDYExegk6cUdpnovxH7qCENTpe/0B/FC8ZqBLEiQHCSi
         MUas77XU7JLUO6XOwExV/KRdu7/6kc0DfDVKSgM2BRdeRImSXnUGsf6++HfaHLwhS9/t
         QaJWe8YLrQOjA0jhUxnRUQKkF9ZwyJ10vfEgGb2Sngsu3hlxEr030QpXgSIJ3ljZyGnn
         ggT4BoLqS9GXV4WJ4u87RVdeshSV9Ff6MpPj2II/FcW0ioWfTA1JNwCWUbNzRF2WbEr2
         KDpg1jbbPGzLIRkJLnjb/qthtjzVkuxudhnmoQugBVYGSrwpeArg17XjhoaC88SgqcYf
         vWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=RfCH5EQD75GPqHY0gWCFSqLjcutXbDfTuHy4LJ14TTE=;
        b=bxCRJpbkfz1X+366X5xE+AwzVxzgIO5lSdgAa3Ef9VBZ1pim1jcucVfd3Qo0sGgumD
         V/K3hw08uFuCBooc1uo2HBMQ7S/DOuAcyopBIb0u66PQqYsqLn+H+rvw6QxK+smOhSXu
         9W3UGzFW6z4PhqliA/RblaNnm+YiiMCmMgvKiKRk9kKdfAc6L4Rs5YW7xK4evOrnMS5Q
         rylSoD8CDJuXsIaAH2z1EtZBhOwIB9Jxt7vthJcur27ojYZzZt/8UWCPbfdt+oMix+xF
         wmGAH+hVo2nVGwTmQTiHgp2R1FwXJBVf9lHbnVUoY+ljaoix063cNgkz+KQe4m1u8WPV
         JhMw==
X-Gm-Message-State: AOAM5309vxxrI4blfjoy+Xy4spbFMEPpE9UIklWlZnaDWyPaR9Mcwl+Y
        1dRIi+SJu6W8SkYrZs4wnb/V
X-Google-Smtp-Source: ABdhPJyTpFUX4tLzigh+FiKh55R0ruqNr5bvTF0RmvBgaKusFMwqgvtKP1p3zu3P7LwNaEoOusQj8w==
X-Received: by 2002:a17:902:eed4:b029:d1:cbfc:60f2 with SMTP id h20-20020a170902eed4b02900d1cbfc60f2mr26181154plb.0.1600514848195;
        Sat, 19 Sep 2020 04:27:28 -0700 (PDT)
Received: from ?IPv6:2409:4072:6d80:ea8c:4827:e640:206e:12? ([2409:4072:6d80:ea8c:4827:e640:206e:12])
        by smtp.gmail.com with ESMTPSA id z127sm6215740pfb.34.2020.09.19.04.27.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 19 Sep 2020 04:27:26 -0700 (PDT)
Date:   Sat, 19 Sep 2020 16:57:19 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <1600424219-6674-1-git-send-email-loic.poulain@linaro.org>
References: <1600424219-6674-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] bus: mhi: Remove auto-start option
To:     Loic Poulain <loic.poulain@linaro.org>, hemantk@codeaurora.org
CC:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <E1056EBC-1EC3-44F1-A0E8-28C7627E0074@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,=20

On 18 September 2020 3:46:59 PM IST, Loic Poulain <loic=2Epoulain@linaro=
=2Eorg> wrote:
>There is really no point having an auto-start for channels=2E
>This is confusing for the device drivers, some have to enable the
>channels, others don't have=2E=2E=2E and waste resources (e=2Eg=2E pre al=
located
>buffers) that may never be used=2E
>
>This is really up to the MHI device(channel) driver to manage the state
>of its channels=2E
>
>Signed-off-by: Loic Poulain <loic=2Epoulain@linaro=2Eorg>

The patch content looks good but you should split the qrtr change to a sep=
arate patch=2E I can't queue the networking change through mhi tree=2E=20

Thanks,=20
Mani

>---
> drivers/bus/mhi/core/init=2Ec     | 9 ---------
> drivers/bus/mhi/core/internal=2Eh | 1 -
> include/linux/mhi=2Eh             | 2 --
> net/qrtr/mhi=2Ec                  | 5 +++++
> 4 files changed, 5 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/bus/mhi/core/init=2Ec b/drivers/bus/mhi/core/init=2E=
c
>index ac19067=2E=2E7aef6b7 100644
>--- a/drivers/bus/mhi/core/init=2Ec
>+++ b/drivers/bus/mhi/core/init=2Ec
>@@ -727,7 +727,6 @@ static int parse_ch_cfg(struct mhi_controller
>*mhi_cntrl,
> 		mhi_chan->offload_ch =3D ch_cfg->offload_channel;
> 		mhi_chan->db_cfg=2Ereset_req =3D ch_cfg->doorbell_mode_switch;
> 		mhi_chan->pre_alloc =3D ch_cfg->auto_queue;
>-		mhi_chan->auto_start =3D ch_cfg->auto_start;
>=20
> 		/*
> 		 * If MHI host allocates buffers, then the channel direction
>@@ -1125,11 +1124,6 @@ static int mhi_driver_probe(struct device *dev)
> 			goto exit_probe;
>=20
> 		ul_chan->xfer_cb =3D mhi_drv->ul_xfer_cb;
>-		if (ul_chan->auto_start) {
>-			ret =3D mhi_prepare_channel(mhi_cntrl, ul_chan);
>-			if (ret)
>-				goto exit_probe;
>-		}
> 	}
>=20
> 	ret =3D -EINVAL;
>@@ -1163,9 +1157,6 @@ static int mhi_driver_probe(struct device *dev)
> 	if (ret)
> 		goto exit_probe;
>=20
>-	if (dl_chan && dl_chan->auto_start)
>-		mhi_prepare_channel(mhi_cntrl, dl_chan);
>-
> 	mhi_device_put(mhi_dev);
>=20
> 	return ret;
>diff --git a/drivers/bus/mhi/core/internal=2Eh
>b/drivers/bus/mhi/core/internal=2Eh
>index 5a81a42=2E=2E73b52a0 100644
>--- a/drivers/bus/mhi/core/internal=2Eh
>+++ b/drivers/bus/mhi/core/internal=2Eh
>@@ -563,7 +563,6 @@ struct mhi_chan {
> 	bool configured;
> 	bool offload_ch;
> 	bool pre_alloc;
>-	bool auto_start;
> 	bool wake_capable;
> };
>=20
>diff --git a/include/linux/mhi=2Eh b/include/linux/mhi=2Eh
>index 008b8f6=2E=2E742dabe 100644
>--- a/include/linux/mhi=2Eh
>+++ b/include/linux/mhi=2Eh
>@@ -214,7 +214,6 @@ enum mhi_db_brst_mode {
>  * @offload_channel: The client manages the channel completely
>* @doorbell_mode_switch: Channel switches to doorbell mode on M0
>transition
>* @auto_queue: Framework will automatically queue buffers for DL
>traffic
>- * @auto_start: Automatically start (open) this channel
>  * @wake-capable: Channel capable of waking up the system
>  */
> struct mhi_channel_config {
>@@ -232,7 +231,6 @@ struct mhi_channel_config {
> 	bool offload_channel;
> 	bool doorbell_mode_switch;
> 	bool auto_queue;
>-	bool auto_start;
> 	bool wake_capable;
> };
>=20
>diff --git a/net/qrtr/mhi=2Ec b/net/qrtr/mhi=2Ec
>index ff0c414=2E=2E7100f0b 100644
>--- a/net/qrtr/mhi=2Ec
>+++ b/net/qrtr/mhi=2Ec
>@@ -76,6 +76,11 @@ static int qcom_mhi_qrtr_probe(struct mhi_device
>*mhi_dev,
> 	struct qrtr_mhi_dev *qdev;
> 	int rc;
>=20
>+	/* start channels */
>+	rc =3D mhi_prepare_for_transfer(mhi_dev);
>+	if (rc)
>+		return rc;
>+
> 	qdev =3D devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
> 	if (!qdev)
> 		return -ENOMEM;

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
