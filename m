Return-Path: <linux-arm-msm+bounces-70395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2847CB316A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08EDBAE374C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045E72FA0ED;
	Fri, 22 Aug 2025 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pedOmExJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980B52F8BFF
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755863104; cv=none; b=m9b+rNtrIVikRvxatXFUBFimo+syjozZxBalFs7ybs+8U2fh0nq2wGykHtF+ZhJ0s3mQ9NUWZvqxehzEahKCSePlgDlR0W+obs9fwSVpuSXghrfhCzCdGq21wf8YOPWfsz98NQ2q3i9tDsLeS+UF0Z67shpKzj6wa/ecUs8u1Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755863104; c=relaxed/simple;
	bh=GF+aq3BmblnP7UO8TZ6Fm61AgyK0+PsKeyXIW4GsEC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8xqdRRZrtUcBpSP80nsVwVmi0fylaulVAg9Mc/K4pUDd1lI18tvW7IjYjUTPD3fHFh3ZtJs0f27PzIbK4NIJJJ2EUi29D9fHr6l6/2AWGq99I5VqvN4qM1anOk27AFuePbfBejA8wsu10OwbfcKLNyfkCxOQwhwHxoMBxdJ5pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pedOmExJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UfFx028071
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FDfUSJe03Awd7FOR2RSCmWZ/
	ZclRfZGke6zPf5LEDxo=; b=pedOmExJ5a38mAt3SKOKe2Ec8DUmTFYovNjq1MmE
	I8c/WxqGFq4yV1U47ow9ltSWOoxT36+v1YIclZfPFCVDyz2kDJCUtAicvNBq3PJU
	P9Wa4uNxU63hSy0YVYb/4e69H8Kne/7K93k8wfBIix+3I0TTB+L85Xswh0PA/IIl
	dT8ZC92dUSP5f+xiPevc6fYvUaXIAgygNDp97ESJqb2sRe0Ti/lPeLQdTt6rA4ui
	rOz1SglWDdweHKhyWv9yK6UASmeH5P5FVOYCGOzLtG8lrPYdQrQJjk4iORCuGRTt
	/vYqiLABooVlBTa38cexBhZfHKVzUoEoe3WNitWixdwm6w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52992as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:45:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70d9a65c18fso16731066d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 04:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755863101; x=1756467901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDfUSJe03Awd7FOR2RSCmWZ/ZclRfZGke6zPf5LEDxo=;
        b=QmGpcW0/6RqMdelcndL0Eh7T0o2y+kDHe7xkyS2YlpS2h5bBTnZ5zZWBAw6Ep+Jm8b
         OYVFFjG+1RFlmyILdSa08ssUidlLBOssJxHc8V2cxc8ov/+RTI5v9iVEwhMC3D/HbdQD
         Jb6rqmVhDWKV81FTUiSVqvIhvO3MlLXCs5xbRwCqTIYtCpeaoLaZAU5lktNNJkv2Os5x
         G/4EOgfZfWGinJPSVHR3iplAQlOvpPtOHkU5af8BxTRGZFWFjLiHH7Wg4UErJu5TgWHe
         QWkRCxNbx29GkDVR390Tmoh8W7/hjLSbCZU/Ep68FZ8H7YGzFXzOjAA/Kv31rxtMquCT
         PVqg==
X-Forwarded-Encrypted: i=1; AJvYcCWs+afwXsVQkECibstBFnzRpvLhB/znXiFz150r7/Wl92H580O1SksFb6P0sdl5WvXr3lfiQd7CRo1kL+4d@vger.kernel.org
X-Gm-Message-State: AOJu0YzsJF7MHd3QBORPBm7v2W+QoVqyaN+pzeRRp1ul3U8/MlZLD57R
	zwnuRSzv2D5f/bamlcZtWx7uWf00Gn3xOg/H858lWeY1uYE2F4NLlP3QUphnsJaF7FWXMjTSDCi
	hL7afL1ScRDeA8W2qxicyxyfpr8ucvimhwkdCeMZPbHOxm+i2AECE/QiG2VOANGsaLUOl9sAU/H
	gH
X-Gm-Gg: ASbGncs+EFm71+z3RrUQl82LWJxGHNYhKgNM/Jd1SzErsLPt0sUyRQ5t3KjmTwVo8KG
	Hj5BVyUxglcG6cBDAOLXbbuuuvd0etf85m+XW6Dlw84psmJPlh4/fZZUatDnwvTMakts1XwaeG5
	BnHbdygb85TXqSZK/1WbfrYQWJKuv44bF9g0jr7rZmc121J8mlptI+z9PNKVEMz4MUhyaa9sDY+
	xsr2IZADg9bsWSHfEyR4Y1izElnv7umGej2pNGAEzVHAsvI7X+xoXxaTKklLFNmE1ijP7auBtNZ
	U668lRhBkgZ20ShAfUGk27jXW0Qr2103wPh1zCDOit8y4ahJiayRAs0MfuoZsVE09kPVwtb66FN
	7fGnWlNR/kHsUUsXSHvVvtZVe4WF+Kr7+9j3u1ONzh5m4GEoqmGUt
X-Received: by 2002:a05:6214:5f03:b0:70d:9938:55ec with SMTP id 6a1803df08f44-70d99385a8cmr22501856d6.42.1755863101212;
        Fri, 22 Aug 2025 04:45:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc+zgwxGBs1pfu/9DcgVXcZwNNCpsvXMT8jZWEcMzgwrXXe8vEq+xbRqDG/TBkXvO7KOtQ7Q==
X-Received: by 2002:a05:6214:5f03:b0:70d:9938:55ec with SMTP id 6a1803df08f44-70d99385a8cmr22501366d6.42.1755863100532;
        Fri, 22 Aug 2025 04:45:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351797sm3464852e87.27.2025.08.22.04.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:44:59 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:44:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_bt@quicinc.com
Subject: Re: [PATCH v6] Bluetooth: Fix SSR (SubSystem Restart) fail when
 BT_EN is pulled up by hw
Message-ID: <qirclgwbh556rgkqbejs6nbkbv737n57cgmzgh666ginspya7e@mzacv4crszph>
References: <20250821121627.2727387-1-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821121627.2727387-1-quic_shuaz@quicinc.com>
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a8583e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=TtMG-BGGMhrgH5IDBmIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rVl1KAhPJ68cFT_By7dKZOaGzSvOr4mc
X-Proofpoint-GUID: rVl1KAhPJ68cFT_By7dKZOaGzSvOr4mc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzQ8LBiS8ur+s
 B6m5h0CmIXNYWOVfs70E0q+r2dFBSd6URSqxCuHrwoFwWuNRQLSPAEpGBbG0mGg7TwVXre+5KhE
 3VX/953cZrPDJgqkOdmzSK1JIeIy6VYSe0wg5cpfdFbp9fxJFun8DimlNkaSOkfuVL8oTKGXOp1
 tRkUrON5nMg/osKRjtdGeS0llvw3SdSEJnVXmKzzsWTMkQQiTw+XGKup7lih6HUJDZQlYfkeiaw
 uwC+USm2L+U6z4b1q+ix/RFqs/5eKgaOOmA0G9u+u8NYWfnBjoDzg9wU+Fc9rrlSptSOc4XrCZl
 b//XZj/tHBKEO1CfpqMDkI0b55iim2JaftwwKXvn3MLpd3gxSrylzCEd/swIcMMYmMp5hwv2exo
 dl3K2INHFHoaxlFvy4pDXyimmrI/vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 08:16:26PM +0800, Shuai Zhang wrote:
> When the host actively triggers SSR and collects coredump data,
> the Bluetooth stack sends a reset command to the controller. However, due
> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
> the reset command times out.

[...]

> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Missing changelog between versions.

> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 4e56782b0..9dc59b002 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1653,6 +1653,39 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  		skb_queue_purge(&qca->rx_memdump_q);
>  	}
>  
> +	/*
> +	 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
> +	 * hardware and always stays high, driver cannot control the bt_en pin.
> +	 * As a result, during SSR (SubSystem Restart), QCA_SSR_TRIGGERED and
> +	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
> +	 * command timeout.
> +	 * Add an msleep delay to ensure controller completes the SSR process.
> +	 *
> +	 * Host will not download the firmware after SSR, controller to remain
> +	 * in the IBS_WAKE state, and the host needs to synchronize with it
> +	 *
> +	 * Since the bluetooth chip has been reset, clear the memdump state.
> +	 */
> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {

And it didn't improve...


-- 
With best wishes
Dmitry

