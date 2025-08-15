Return-Path: <linux-arm-msm+bounces-69411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 048F4B287F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 23:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1260E3B889C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 21:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFE120F076;
	Fri, 15 Aug 2025 21:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7Ste8t8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AF22036F3
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 21:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755294527; cv=none; b=n3S/RCaZyr3XsuaR+6faGljUwhqZRaVVh4VLL95gcTMiavTdk456QbJ3HiSz80/wSX9YmAnDxfm4KwQLX0xMHCSYon76rNy1AzEA2kEOZPHn6FB5ZFJizK02oxBry4Sj9AGXQw+HaXN+5DL30jIptwOOOjjt4T/J69Hj/sOBwoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755294527; c=relaxed/simple;
	bh=mhrUoh+DSjfZVrrPw+Nsk7fI8aBvnkqzQE57gdm55qE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSnDP+ibNGo22slJEOQkD1SxKuulXhscZK0bS6yfoOMwaLAJTmc3BkaD3mPX+LCoNUOkHxm6E3oVn10a0n83v6+Z3HGkxreLmtxyo8s8A8AKABOkANMjigJ+DWf77QtjcMeewdcjV3ZBQd6ox7MaSajlrbsmtvvzy9zzragEmIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7Ste8t8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FKpug5028210
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 21:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3azxfqhNzSwS8fa4uccCMLq7
	gy1B9YWDKdwGIQObTuE=; b=X7Ste8t86//bHppSOpwmTbQgsdlfaVWzwIRFqGOi
	R8+xQTx2kF27eyuI9hG5zyYn6KOgI8Y3lGQw2rxsjAz+Iq1vabqZBp1YUvCTM6cO
	RU6fFm2N4rlJxYEvIiGYcqzLAEiLdHRWUvUBlcpaip1EfIIJ7JxFymhjcQtYbahl
	lNib1KWZVkjWNJh1SCdZjtBCPNTlK3qr/xMzatl0brJ5VrJ+GzU0fPMzuME1S34R
	GUGl5OJoIZy+KErMk5+7ZnvUjXPkR19cqEjQizK09blEWsikJEtcKE+nzaXgr6sm
	Zc1ZDZxqXyLP+IokkdIOFtbK/rZu7p6VTi8JpUuZFH6jpA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9qa3ast-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 21:48:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f55eb56so49416236d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755294521; x=1755899321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3azxfqhNzSwS8fa4uccCMLq7gy1B9YWDKdwGIQObTuE=;
        b=vP9kvvfhUJY9jPrjK0S7fUA6cqQvc2tbqi8+pGsgVfj5/l3pLSo/nKZjiwgrDOsY92
         luDTrKefb+ZvVAeTE3HrQwWRze2hum17ijD3YQHaUbCYRvcj7zz7VVHswvuCU36/KTRq
         8BSv3+qX1vdNKOA2Ua+RHjRyNj6ge6CSq0zuFqx2KV8r8MrofatUMd0b3F6RQGkVPU1d
         1c+PbRw4/XFszNZ2P0uOmsO8+AJLvNNuvwWujrEGPWIouff9TQMeJxZrA0spgvPE2KMI
         7Q+ao8KdEqW/+QZsu0fVdCkF5N4yhtKAVCbzlA9p5/nAjjWBUc1stJi3DarzCWzPjfGX
         dxug==
X-Forwarded-Encrypted: i=1; AJvYcCVKaZZ0XpdMoISPOqAwvoBSktwy0xVAMNFdz+xuQrCBBFLHqnr26ZD3UWaPtCzWuCkxgVmIFfSsKR7Zv5ls@vger.kernel.org
X-Gm-Message-State: AOJu0YwCtx7ip9fCYvbJDRsKWl2Qj4tAfqAJTtZYzWZZLp0rbWi13ZBl
	o4D25CoFnmqTlUmPL3fbPurfJTTcKZRWnijX5LcaHVOUkS+9gQSCnC9dyspqYhencG4NyQoXSol
	8AxoC1DF01uCtZtAILbr6Xe98tfetjne8ZlMp+IXsWgiDYtX3eNsogaRDlAD7UiZBO2Cs
X-Gm-Gg: ASbGncvpcSM5/FyODX9q/V47Bou2PAgALo3RgirHFdn/kK7CySfjCZSx7WUWm4ea4Yi
	OwUU4Vkg8nCtejajADUB4E2aJrfFjLTgnOWjkuZS3mctCjvKPdOBocPdwZ2qJJPVvqTjAfuQSE+
	42u+k+/xTQ29t1MbLxCD1qVY7MDk7NKELxADm7GRe2q8khuAZLvmp2dSLxEWwLOcNVZZdLIFud6
	9OMVTtmDeSlFOP294xrShOokt2QycnJrTV9fgtHpt7TbdkXRYmocPuG24yxfPLeSU0sPqz/Bd2A
	Q+x4JsAfudmRoz6N+dapGsMWHrhDlkGVFdiS4jWzNbXt9kh3AtxFdGEvN0topWKTDNZnWBtke8G
	aO5AIG3rK/oxaBL+DnPpbqUGEzYEk4JnJlU+XD0DGnz5wfp/n7vup
X-Received: by 2002:ad4:5ae5:0:b0:707:6306:28bf with SMTP id 6a1803df08f44-70ba7c0c9damr49234396d6.36.1755294521222;
        Fri, 15 Aug 2025 14:48:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgwpAJSDUnwPnQp2m/lE5EwwP6ImBIjaPY0l0oQ5eg4FpmrJIrILBO05zQvRuPEk1BZenJNA==
X-Received: by 2002:ad4:5ae5:0:b0:707:6306:28bf with SMTP id 6a1803df08f44-70ba7c0c9damr49233936d6.36.1755294520253;
        Fri, 15 Aug 2025 14:48:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm500447e87.51.2025.08.15.14.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 14:48:39 -0700 (PDT)
Date: Sat, 16 Aug 2025 00:48:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_bt@quicinc.com
Subject: Re: [PATCH v4 1/4] driver: bluetooth: hci_qca: fix ssr fail when
 BT_EN is pulled up by hw
Message-ID: <lfo2phtbykl5dqiuiunxlzz3fybyqt7tcotihzhr27ivm7dk2l@l5q6ilkm5xrg>
References: <20250814124704.2531811-1-quic_shuaz@quicinc.com>
 <20250814124704.2531811-2-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814124704.2531811-2-quic_shuaz@quicinc.com>
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689fab3a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=wIQ4YbeHDpbAtZWM-s4A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: N7Htr8AIvtNfdbjIyAMuPkh3_T2lGsRW
X-Proofpoint-ORIG-GUID: N7Htr8AIvtNfdbjIyAMuPkh3_T2lGsRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX8bDWa99JjSsI
 j1szej3HXg3283+71KYUzxVgmK0XpGXy8WYNOmAUJ6o2hFq7laCIKLHDKZMZkMeYqt/knQAmvKO
 P4k2RPUeArsU/GbS9ClnVRHnakWybpWbdqyuTZEdZmw31u59tv0tCcg10+EhK6sb/4fW6gYGQh7
 LSY1JQxZWlV19el0hgfBp4qVsJedVZwn7FIKdrdMEn9YqFhmMe1mVpL33HblkcnnELJHgFp+RD8
 ZMXxrPKxM+ypMA/1I1aNK64iF4jYsm4xCscfwtyGRRlBO2p3PWObGtqSiOzzx0CRix1F+3s/WxD
 OY4aCnQJ9MIvOsHXVbk9TFNeFpsZbpc4os7kn8RKKBx/c4BFk+E+dlvtNqzHrbKm2MNR8Scs/4b
 kTll3Exb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164

On Thu, Aug 14, 2025 at 08:47:01PM +0800, Shuai Zhang wrote:

I wonder what does it make to notice the part of the BT test report:

SubjectPrefix                 FAIL      0.66 seconds

and update log messages according to the custom of the BT subsystem?

Please use 'git log drivers/bluetooth/hci_qca.c' if you are unsure.

> When the host actively triggers SSR and collects coredump data,
> the Bluetooth stack sends a reset command to the controller. However,due
> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
> the reset command times out.
> 
> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
> commit: 740011cfe94859df8d05f5400d589a8693b095e7.

commit 740011cfe948 ("Bluetooth: Add new quirk for non-persistent setup
settings")

> 
> The change is placed under if (!HCI_QUIRK_NON_PERSISTENT_SETUP)

Which change? You've described the issue, but you didn't describe what
is to be done.

> because this quirk is associated with BT_EN, and can be used to
> determine whether BT_EN is present in the device tree (DTS).

What can be 'used to determine....' ?

> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  drivers/bluetooth/hci_qca.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 4e56782b0..91009c6a7 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1653,6 +1653,20 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  		skb_queue_purge(&qca->rx_memdump_q);
>  	}
>  
> +	/*
> +	 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
> +	 * hardware and always stays high, driver cannot control the bt_en pin.
> +	 * As a result, during SSR(SubSystem Restart), QCA_SSR_TRIGGERED and
> +	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
> +	 * command timeout.
> +	 * Add an msleep delay to ensure controller completes the SSR process.
> +	 */
> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
> +		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
> +		clear_bit(QCA_IBS_DISABLED, &qca->flags);
> +		msleep(50);

It should be done other way around: first sleep, then clear bits.
Otherwise userspace might start sending SKBs while the BT is still
recovering.

> +	}
> +
>  	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>  }
-- 
With best wishes
Dmitry

