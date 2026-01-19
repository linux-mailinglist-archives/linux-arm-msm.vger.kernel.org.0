Return-Path: <linux-arm-msm+bounces-89667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE179D3A940
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7F14300E034
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9D630BB91;
	Mon, 19 Jan 2026 12:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PU1wqFok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHIAF46l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C482135CB71
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826374; cv=none; b=Uza4j3qsULjLWj+eGwZwkn3bRja2zzK0KSo5ETzfsbjiGjJk3Ly2Lf4Y4OS8mlrKCNsx401EfaXOtuEvDB+LjbEn6ncsZE5JBYIbcGk914mPGV7htgFiQT603IPlai5ygR2Lj6o+u8G8J25Rqm3FIlezpPMZ3NUEfWL4OytmLhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826374; c=relaxed/simple;
	bh=C9CMmfRxh7qhhbnL1H5qrLWu6PlLcgbrqLoWO4Ezcjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNGkbzcjdNH9E14qvcxtqnxeQ04G8xsbVUWE/NpAuu72kZO0KTxRDmv1yNvd5/uUBML1TdZcnve7aPtpz8gpoGEgWjk93vTbfkVPO0ELxlevN1A2R0AG4WL19m4tvdyVTYibQdIxIOYfa9/fgrM7bNFXFiCBMIkessk1+CwVTKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PU1wqFok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHIAF46l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91459903258
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u/igNly3caGwOjqEsZYTcGrN
	eQi+egAoMo72lP6pEXI=; b=PU1wqFokf2mQzExpgGKHCiUgbwL7XQ2GA37pRGRv
	TiqZ0WWdRSko6Qj99pBcHid74r6twy4kvB6l/x9WXJxbkW3VTYh5BsIWSb11m6nx
	7WwFicLB7O0xvnO7Hp9jg7n7e5+QuUGYc2urPJHY35WeoVSJ9atGSPX4KUqABb3k
	yg1J+Uzh+1vZC8dZoOWj/rzFfnvwWoUWmSiSIdcNSM3EK9fLZewj9OESoRoi8Yti
	g1Ta7tAEhKCtaV0VRWGoT8LgYWYCjdFXexfCkdoIsbPVMX5BWwJLDTeYDxe1eDm7
	C+xKzLxkvz8Wt4M+8YpkxD8DSWzIX80gpiqRpyGsHilYUw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4ysub7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:39:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a5bc8c43so905366485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 04:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768826370; x=1769431170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/igNly3caGwOjqEsZYTcGrNeQi+egAoMo72lP6pEXI=;
        b=XHIAF46lXoSRU/y+rgswEec7aIKTsrF6aiM8QYeaVievtGNJwPZC+xfG2q55IAfLR9
         vHBMDDBB+bOm0h6WMIJ3FxKbxKwbchn3eOmRgFeDp0dIwf4RyFPUSnNLM5MKdTsZesdQ
         wjknvVsNX4yUoGlIQhXz1exIcEyMO9Iy/gJ/28nl+YulW0Y44Y5kDQHd8IQpiwY8SwYk
         E9r904Xi5zeowZYs8sERGhSsfD3JQgH9Keo2XAzBXhWAqmpyoUHT6kSCtJrJUahIa5yP
         9OXt3m3WMcG6EmZgojEAzSWwEqde6n9xgeACm6a/JJMgh28gzWjaQlRPub7NtNzoitfm
         Ee+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826370; x=1769431170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/igNly3caGwOjqEsZYTcGrNeQi+egAoMo72lP6pEXI=;
        b=DeQ4lOZFRzwbFwrLA0+jZKq1pNNscaeYP/0XIevq63dqzstVWDrCO4nfuIHcxPUOJ+
         3Ncn6lUK2D1VAu2RgzBIVeag//ayKXTeia//i78tbNRDhQ9j5jnf+7B3HWgi75/OT5Ac
         CmvTYx+GfceXcDApIEMjiAm04P4neiAUHLKN9DI1dVv/aXRNa5MyohyEL2G3Oa92gF4s
         pZOsowEbF8KLFgPTfw2cOyenQutiEEcrFAcWxXY340TP9GSFOuo3kx5lGVq87lT6Er93
         AWhL+GI69SB819qbJzFtkvnApcRIIZuTRQQG1Oe0/PlY+S8H+Om5JStVGS0V5lWZm9sd
         0SvA==
X-Forwarded-Encrypted: i=1; AJvYcCW2p6nYmsAJoZk20LqSW2wR+5HqEmQtpJOmi8UIEWX8awYw3Iskmh/kguFL8wcKFLHcTExla8CtGyZHtMHN@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHkXvGzDdpJTIQ5zDTu8QSdcaBigUNwALlsIutlrfuxIIDXkh
	p4g8tr6WYMacv+O8TNaqYjmsKIUsMRS7Ir75MmtnRf8PrIPfbTbAnsfcfesLIhFUDwkpaizF4jb
	PuzdXoGISm8yZ59kPZa9xpCQfgKZB4GjfWDvcWRWI0WOagp+beZ9cSKIb5g1N4MUvF/Zk
X-Gm-Gg: AY/fxX5H+kfrsL0px3U7NLU1YYUZV4HWEDytgFgSUjhsL+05ItFgEiXmKSi91O97Y4P
	dR1SFdAdEi24HdE4kpBduBBjQLd/w7nTnAwhP0WkdTrnuA2FkSHWsdWCI26c3x41bHIQxErSngy
	i9EXNt57lR7Q8kQ/1dyPMNUxGHQTxDLnB7o9fCp1XoXd0fTonVWkjol4nMB1GwL+T6SdBixkknH
	csHUo4JV16ifKlM3G2YOaRIHTQ/f2X0R+Sv+Q1jpnvGaXvLHmWwq/ZgtzruHWZQS1vUpmmgS7A+
	qJ6AvOE7y2kAivKDNUiV2AKFC3QH520JE0iU1PYdv+EbrfCfg6l+zzligrWBTLskFQ/IP1/p8wK
	UwlESQIA0FsLVwL1HSCXoMXIHvMm37hIFzVgQdU65yTxIy9e6piOV0vjo6mYfnpQe0UKzeuMft2
	YKDS1JXrq8WVIQv/u/pgPTGc8=
X-Received: by 2002:a05:620a:40cd:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8c6a6705321mr1398002985a.34.1768826369915;
        Mon, 19 Jan 2026 04:39:29 -0800 (PST)
X-Received: by 2002:a05:620a:40cd:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8c6a6705321mr1397999685a.34.1768826369359;
        Mon, 19 Jan 2026 04:39:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a0db7sm3252151e87.87.2026.01.19.04.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:39:28 -0800 (PST)
Date: Mon, 19 Jan 2026 14:39:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com
Subject: Re: [PATCH v1] Bluetooth: hci_sync: Fix not clearing
 cmd_sync_work_list on power off
Message-ID: <hkjzyyrwhdybojyh335w7gl5bgifdml7l72bnxczizk4p2v4hj@76qh6frpcqcn>
References: <20251209140347.2816326-1-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209140347.2816326-1-shuai.zhang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696e2602 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QayldU47vYgVRzYphUAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwNCBTYWx0ZWRfX8fXcM0twM/JJ
 HqIDWuc8z67/Jt44fJCb36PcHbxKL0GKjW5ecQRidVNTXiGkSIL6EJoZ1+QGi37bW2ng/EyJNbQ
 ZWpigKai9fstYrfGITPD8Otd5E8ki45nP9mRkq5huy1e8LWCNRuapku5adB3ALqsWPw+bBMkDHh
 7dkKrflH5CH50LekUAa+27t75kEuJDg25/uVlEcQ6UfC0GTeaoQXR1438oFMaUvmH+w/jfuJ64d
 OQeCFZ5xO1bpcjKopurPD6DzZ7wm5q3Iu3lXQI/gafX0ZGbQFL9fWKImtsVYrcCj66dGnVfcyER
 VKbG6g3KN8TR+8p8fv70xtBYQy1IZcAGJobAZkQK9rf9MuWQX63DmzUsLnMCZBS3RZufvxnoGZT
 ql3nJoDc+6LyTgSiOyIKVeslbfBxZWiocYSh6AuOz16CTj/TIPuCvHUf259nDoBZ6tsFdkRuYVf
 muR0QauIeq9oQ+TQGUg==
X-Proofpoint-ORIG-GUID: 5Lmxeo4HUwsJAa5yuwltqUbj2CzdABL8
X-Proofpoint-GUID: 5Lmxeo4HUwsJAa5yuwltqUbj2CzdABL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190104

On Tue, Dec 09, 2025 at 10:03:47PM +0800, Shuai Zhang wrote:
> When powering off the cmd_sync_work_list may contain items which shall
> be cleared during power off as they shouldn't be run during power off
> sequence.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  net/bluetooth/hci_sync.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index a9f5b1a68..45b593ec7 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -648,16 +648,22 @@ static void _hci_cmd_sync_cancel_entry(struct hci_dev *hdev,
>  	kfree(entry);
>  }
>  
> -void hci_cmd_sync_clear(struct hci_dev *hdev)
> +/* Clear remaining entries in cmd_sync_work_list */
> +static void hci_cmd_sync_list_clear(struct hci_dev *hdev)
>  {
>  	struct hci_cmd_sync_work_entry *entry, *tmp;
>  
> +	list_for_each_entry_safe(entry, tmp, &hdev->cmd_sync_work_list, list)
> +		_hci_cmd_sync_cancel_entry(hdev, entry, -ECANCELED);
> +}
> +
> +void hci_cmd_sync_clear(struct hci_dev *hdev)
> +{
>  	cancel_work_sync(&hdev->cmd_sync_work);
>  	cancel_work_sync(&hdev->reenable_adv_work);
>  
>  	mutex_lock(&hdev->cmd_sync_work_lock);
> -	list_for_each_entry_safe(entry, tmp, &hdev->cmd_sync_work_list, list)
> -		_hci_cmd_sync_cancel_entry(hdev, entry, -ECANCELED);
> +	hci_cmd_sync_list_clear(hdev);
>  	mutex_unlock(&hdev->cmd_sync_work_lock);
>  }
>  
> @@ -678,6 +684,7 @@ EXPORT_SYMBOL(hci_cmd_sync_cancel);
>   *
>   * - Set result and mark status to HCI_REQ_CANCELED
>   * - Wakeup command sync thread
> + * - Clear cmd_sync_work_list if the interface is down
>   */
>  void hci_cmd_sync_cancel_sync(struct hci_dev *hdev, int err)
>  {
> @@ -692,6 +699,9 @@ void hci_cmd_sync_cancel_sync(struct hci_dev *hdev, int err)
>  
>  		wake_up_interruptible(&hdev->req_wait_q);
>  	}
> +
> +	if (err == EHOSTDOWN || err == -EHOSTDOWN)

Which one? I suppose it can become only one of those.

> +		hci_cmd_sync_list_clear(hdev);

What will prevent ocncurrent modification of the cmd_sync_work_list?

>  }
>  EXPORT_SYMBOL(hci_cmd_sync_cancel_sync);
>  
> @@ -5260,14 +5270,14 @@ int hci_dev_close_sync(struct hci_dev *hdev)
>  		disable_delayed_work(&hdev->power_off);
>  		disable_delayed_work(&hdev->ncmd_timer);
>  		disable_delayed_work(&hdev->le_scan_disable);
> +		hci_cmd_sync_cancel_sync(hdev, ENODEV);
>  	} else {
>  		cancel_delayed_work(&hdev->power_off);
>  		cancel_delayed_work(&hdev->ncmd_timer);
>  		cancel_delayed_work(&hdev->le_scan_disable);
> +		hci_cmd_sync_cancel_sync(hdev, EHOSTDOWN);
>  	}
>  
> -	hci_cmd_sync_cancel_sync(hdev, ENODEV);
> -
>  	cancel_interleave_scan(hdev);
>  
>  	if (hdev->adv_instance_timeout) {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

