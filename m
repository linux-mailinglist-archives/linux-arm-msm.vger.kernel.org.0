Return-Path: <linux-arm-msm+bounces-84010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 351A6C988F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 18:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F0379345087
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 17:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DF63385AB;
	Mon,  1 Dec 2025 17:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxyuzaXv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3IFI0He"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578E83346AF
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764610868; cv=none; b=OERqLIEC9wPKDZ3TK6QcBLvCJ54hJemp8pxgJoEYpHWCTNO/L9mgF0f2Hcf7+KGgjUJ+1q0gFU13Bi3I6M3iK5lxftzvOoiaHr/pQ093t5PpgQmXteU7w3EXv8kK1MX0R1SlzM/aznZHdAUEu1iaXJTYlE7OZeL0XzPD0zfSG6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764610868; c=relaxed/simple;
	bh=kQ0Zplu74sroYykShKNsBr0haSMA+a+HAxKkzuexd9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2Way0fABwgTYaVcpd6QRw6BRQctgcww1ysIUDFTCTpHknMxEGQfskgJNLbL7+BochAyslISajiq7BIxrKHXEi+7BEviiahdgAz0wXsjkqmPldtHJtrgRrUR7u3RmQ+Tjap45IHVBBznC1inQUsQUmlKVMEcfgpDRIVPd7FgdwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxyuzaXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3IFI0He; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1BK5k0106130
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 17:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=; b=ZxyuzaXv6A26qiRW
	3ib+4vKjJnwB99Ulmz3+RRb3QOIt9IEjEBZ2SK904Gsv6nMU2UluCtxKVvgbRPW5
	aXIV0VxAUSTF9gt+hZmetm/hPC3OkeqsVaPFydPZLYXkVi6jmR1m7IIpi7WMdh31
	G1p/Mm5LYsJGCX7rhrWPgKhgo7vMYyzGcSbUtkJSFYm8z2SL/nbgk217ze6jfZvJ
	eC0pkwM6QvoPRK63MsxQXNL1M+QTG01ljbQaMRJVju5uvMdOjxXBsAqaxu4C3s4H
	/zjOeRaj09yH4rJo95lgrRbtjeRy5qN6DQvXd2C/tC2nj88agyNrKRoRmpFD/Fpd
	eNuP+w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asa2393j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 17:41:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso3389858b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764610864; x=1765215664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=;
        b=R3IFI0HeBkThA5/dEjl/SXdjufhQWzWrBEqdCZ6hX0XB8pkzY+WuHwq9oBx6ggMqIZ
         iw4ZTPbRXAnc3Zwk3XGsv8Z0XRXyq+XIpmAVe+c+FtkaqWGVsqvm7FHOFTPYjIo+tc3a
         96JJ0SuVzviwZSQyFK8/eCIheHJIAugRQsVunYjiqmVvOp+OdTjZDkmGPLqr4xQ6GSJp
         0vkavj2mS9x0DiNYkr4Va/iFwVD5LUpRLms/OGgSCUPUPuDWtHF4d1dP+jxcx/rAXk5l
         WvJTYpkGYBvEQ9HxWDluG29F3zk+zc2rTuQu+YUGkPkSAcKkF2weTij6kTpdFaLfaBDf
         /jnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764610864; x=1765215664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=;
        b=AZXJ4P4wh02ZRUzhgxtHEpckGsgKExWV8p3bvJ8ZoqE4WZcnKN1zHkOnBFvp77IxGp
         rlOMHM0hlASztLANHvtikOFOH+sKIAzuwfDz8W9Adt2NQMwOhL0SvYm66/R07qFgE0qd
         sLJKTEyNf3AfnidvM+Ug5cibfbT3f0cJ7AYCJ3MRYs6XlNp/O/qXHHbbea/k5rNl2MlX
         qX/h20gYi3XGvhvAk/AsVApmsBf7Lb6BSP7HTJ4jBgxbjkXilv2RXtzW74YQrlwz9LRt
         l6UJV582Mp1ji0tFFDjqUwbWdJEHRYiaK/iLN88i4clA3WQzXYBp+7yGTMXQ8SXPrkt0
         LzfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZOqRTnRvmUWY4STEdCM0WU4iSBV8XhmbM19EnZht9SajEc803oQCOblDZPoetiJOPRGrG8lGYXoSOJi4O@vger.kernel.org
X-Gm-Message-State: AOJu0Yym3EUrgCm0oLBGMeJ1mVCeBV6n5S+u9YvdsGz+pG8A6OdqRisR
	NGQWZCvZbXPtlNaLP4VPI/LA1f9ZDOMBgMH+Jlfdg/bCZGBUtWA0EST+5PjUYho2u3iYmGuDJq2
	QouhJICMDSKfgvSxjloRnPF9b2ayG+ilKLBdTBjdzMMILjt1rwC+U7efl0jE5l0ifwbA/
X-Gm-Gg: ASbGncv6neFKsikzJ/A4fHZsYHjFTQt7VNYK/i4uKLet2Etw9JGWw5TOFlJhxvF16hS
	RoGfPJI5zdSuX2D/P2kAGv/LNm+xChlrbMmjfn41l9swHFBMycsOzv7umAkYhSugdMBsvFM1oCg
	DeRTZVnJ2/eqv1pd5Au1zxWB+wVZYqyMwz3UnG5/bjkiCjS+b82NCHjHz7XZKLh6Ghr8gzP+hIl
	tlsraStVpMofYa5p/b5RKBffncdXjQ+vrptClxKIKrUe0BtGA9tx2lQOPaLBLWodAUGIS7NhfkB
	LOhGjgHKRPpiBQ0gQBBtsO6GHzDnlCmC0oyCFcZMfBKdIhnEHryLNA4fLEK4X94GjD51l8yxEKl
	C4GIK0J2Ao0bghdkGYRymJ6d/kR+rnQ1KEb+0lDW26F7pDt4stHk9GATL
X-Received: by 2002:a05:6a20:3ca6:b0:361:2d0c:fd70 with SMTP id adf61e73a8af0-3637db29723mr30315557637.17.1764610863737;
        Mon, 01 Dec 2025 09:41:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuoKHcI6kog7ZiSeUimSTc1QQRfMcR0gyLQvIhQiA98rGJvDjNieYJ0dzMpSwyxYjBOD4K6Q==
X-Received: by 2002:a05:6a20:3ca6:b0:361:2d0c:fd70 with SMTP id adf61e73a8af0-3637db29723mr30315517637.17.1764610863190;
        Mon, 01 Dec 2025 09:41:03 -0800 (PST)
Received: from [10.73.112.168] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150c618e7sm14245014b3a.3.2025.12.01.09.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:41:02 -0800 (PST)
Message-ID: <ce68d28f-c737-402c-9f6d-f13fec4d2e82@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 09:41:01 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] net: mhi_net: Implement runtime PM support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Chris Lew <quic_clew@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOurWeZb c=1 sm=1 tr=0 ts=692dd330 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vwh-6NgWTdBnnHhUpCYA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: WMYBrtDPQn0kaaQ0PNGkRcEA1xNylprn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE0NCBTYWx0ZWRfXzjQF2pg6BXQw
 ik8lBiHN71z4j+E7jJgTZ0g8HIf44wMxDq0JsFUBvIcqrN+zZYTXsyHtw2pSbC0oi4pYVRF19aX
 W68mTAJ5sQdvQGi3JfVog+TdcEKDbkuA8qCq5Os2zX1sKYelmWLVBPcbMFB7qN35f2x6sWW7cQn
 DJhtz+0r5Q1bRKllHNhIxk7tm20VEnkGhTDtGJojuuhrLhnov6WfkwVyfCVVkfXNtUChmsgdIUY
 fZ+VTam6zDhIEuf9CfDZrGfa0Jdonm4L0yrQGgXkpmd6OFSgxvOGidAM9+c9mP0CcGkR2fbvQdn
 q6Gc6pW37oLb7/ajABvUsKaSlBuDktvMrMKjNIw11KtaZvhHEWU1vqQUQ/BtPm/bLyfumFAvcDQ
 tkpl+shliaNgqVgZe0RuWwsLTOQbYQ==
X-Proofpoint-ORIG-GUID: WMYBrtDPQn0kaaQ0PNGkRcEA1xNylprn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010144

+ Chris

Do we need to consider updating client driver (net/qrtr/mhi.c) ?

Regards,
Mayank

On 12/1/2025 4:43 AM, Krishna Chaitanya Chundru wrote:
> Add runtime power management support to the mhi_net driver to align with
> the updated MHI framework, which expects runtime PM to be enabled by client
> drivers. This ensures the controller remains active during data transfers
> and can autosuspend when idle.
> 
> The driver now uses pm_runtime_get() and pm_runtime_put() around
> transmit, receive, and buffer refill operations. Runtime PM is initialized
> during probe with autosuspend enabled and a 100ms delay. The device is
> marked with pm_runtime_no_callbacks() to notify PM framework that there
> are no callbacks for this driver.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/net/mhi_net.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8e449b5a427993abf68e8d032fae2..c5c697f29e69e9bc874b6cfff4699de12a4af114 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -9,6 +9,7 @@
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/netdevice.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/skbuff.h>
>   #include <linux/u64_stats_sync.h>
>   
> @@ -76,6 +77,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>   	struct mhi_device *mdev = mhi_netdev->mdev;
>   	int err;
>   
> +	pm_runtime_get(&mdev->dev);
>   	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
>   	if (unlikely(err)) {
>   		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
> @@ -94,6 +96,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>   	u64_stats_inc(&mhi_netdev->stats.tx_dropped);
>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	return NETDEV_TX_OK;
>   }
>   
> @@ -261,6 +264,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
>   	}
>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
>   		netif_wake_queue(ndev);
>   }
> @@ -277,6 +281,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>   
>   	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
>   
> +	pm_runtime_get_sync(&mdev->dev);
>   	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
>   		skb = netdev_alloc_skb(ndev, size);
>   		if (unlikely(!skb))
> @@ -296,6 +301,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>   		cond_resched();
>   	}
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	/* If we're still starved of rx buffers, reschedule later */
>   	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
>   		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
> @@ -362,12 +368,19 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>   
>   	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>   
> +	pm_runtime_no_callbacks(&mhi_dev->dev);
> +	devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
> +	pm_runtime_set_autosuspend_delay(&mhi_dev->dev, 100);
> +	pm_runtime_use_autosuspend(&mhi_dev->dev);
> +	pm_runtime_get(&mhi_dev->dev);
>   	err = mhi_net_newlink(mhi_dev, ndev);
>   	if (err) {
>   		free_netdev(ndev);
> +		pm_runtime_put_autosuspend(&mhi_dev->dev);
>   		return err;
>   	}
>   
> +	pm_runtime_put_autosuspend(&mhi_dev->dev);
>   	return 0;
>   }
>   
> 


