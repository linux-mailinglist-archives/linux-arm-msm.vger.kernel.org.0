Return-Path: <linux-arm-msm+bounces-104164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIn+COwP6Wk5TwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:14:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E454499C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE624304C942
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125A93CEB94;
	Wed, 22 Apr 2026 18:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZpt0Fsm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1zR2Uvw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E56D3C9EFE
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776881620; cv=none; b=puDRUAhAgZLNGInddL1qTY3B+2JlfFaq7yxsgE5VDHP+/kU+A0OP9zNcjdhWv5PCVhZmrHxbwtEMKSQw/lqxqh1CTidY0xno8Rh6zY0Rx+eijds+b5CvLe151tfHs/nx7G7J6AvajRFfI81C30WzJYd2gAmA626jp/rb6N9RfIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776881620; c=relaxed/simple;
	bh=PaPDqh80ozVU75aW4BNtrfEuNWCk/0rdTrdselOu24o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndRO5LYZnB7bRGtWs4Fmf5PJx+oWJah0kjtdxizGOF0/1eDa8UJpKrWUSZjjofyEn1kqXHGSxEMqicDT5A5MRo7tKUYejNLyx6No7ag/ImOnYZvGOdx0H2n9gVPnpg/VW55pqPAKbEdklN8rSY2UIj0Zle/G3gdXuAtGYP4dIGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZpt0Fsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1zR2Uvw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MHtlZi2630069
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KQsGjDbp+bler2r1zdP37zyP
	pQtnIV+3S3atXelU70s=; b=IZpt0FsmfwZEwHOdBBZJjgGLsliu0wofhmSE8vIS
	zEHKzIV7HxWDtIrUEsSS1nKD0qv4FkG/Rn5AGGI++12LwmMYzclPT//Pe279IpuJ
	cAqCX6WnBGWFdMIXQ/nLupA2jo+MyrKmsS3Q/obmeOC13ea5bA8pWqFdvynS/b48
	HwyQHqVzTUXP3Qyn/7N8294Zy8Xhf+1snguWyXYVJQbsHB3FKa6hf6nAOUIAIWia
	iLur7JldRhFqLFxumA+KibNZCR3wvl8WETPRv9h1u884hcaUsHnw8gzOqtOkM/HI
	Y9PO+vdNmW0u0YftRc3NWfjIKSvFCFCO4L9t+mQDkHlYoQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35r81wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:13:37 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9546466000cso2163896241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776881616; x=1777486416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KQsGjDbp+bler2r1zdP37zyPpQtnIV+3S3atXelU70s=;
        b=L1zR2UvwjdOp04IstzGkNa/zDJSAePcxb8LldcizvqlmIeJDcBZ1VSG4MaDv5LuwER
         fE5+OTJnGQ8gOosy3crT5z/5koHyeh8DS//rq1sDyh+PMFrHRsDffVVoPWd1l6UdPBJD
         lPhPhT9pilsqiSGXSYteb1DqwI4+xMhH8ja1RtEp+QcFphnCFJiHHE8qbse+6FkdxpB+
         9tM6LYR+YJ4lO9+xDP63Qu20kXUXQo8n4NXiy3sLifKYoufHAqylFcq31PWKtCKdh11g
         MA2N5uQzkNi1Qck28uaTMVU/nRtrU6BDdr8CvqJFRhcmpKQEnyIxSOZJAuxua370znkI
         GpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881616; x=1777486416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQsGjDbp+bler2r1zdP37zyPpQtnIV+3S3atXelU70s=;
        b=H0Va39hHGowSbaO6lGikEZpFmmvn2SDYIPvBhNit/fIEg/82g/pqljMXbcOVa7vTJb
         M891AfG9Gnvh7A115LyucvWo7uFkKXU6g6uxTV2ZD+7Ns8QRHfnt9+eiNHzR0FmgGx/k
         BSz6WwCdTk2t9pjXd+4onaV5XXUT8YmIWy5haUZVms2OFOYUe9ohwlogWxX10z4gxPne
         wM/URhdvtgujzqAylcqUYEzBubAtL3Q6v1yAYZy0M0t9CLBGZvJQgiXvAm+PHMXbMJKk
         h3iqCbFqfk6GTl20ltBeQlKg63BzxTH4JcgTmdm2pfasP6eOMBDcpogyFBLr0gq9kggx
         xygg==
X-Forwarded-Encrypted: i=1; AFNElJ9Co+0yRN92yGAzbP4LFxWxIabuEw8sgzMHCr7I5Ne1X7DiincDB1Hk17t/uZeaRP7GK7f5KhL23hXLm2ZB@vger.kernel.org
X-Gm-Message-State: AOJu0YzluL9yVF8jinvpOmTofTVs4GkNHmcZNRKVkStI5JwUZ+ERi1m7
	7MNUsV23mWD2P2q4Ts4O8USuWQCZSSocBAbXpAzVfDsgFVktK3PyjsjfXjTvY4i7RxUpTwNo8iZ
	2J70zUKUUVi8jXG9L0CvgdKRtqTgvmE2Rqn0IMrLDTfTAcn12wJ1BroR7JMWbfaSZzGTx
X-Gm-Gg: AeBDiestW99K44lBXMT5WVhfZqX+i7PrG5g7ujap2Z4Uh7RMKzFFeV0wcPmrkE1zi2o
	5c0xngT8hQtLJ7wDQe0urdgIM+u1Tks6JSfycAGXRGTDdrxof9urqxF17uexPs5FufCb7eeYlvb
	9sus38HHYjSxIy5Re/u0e8ecRac2gNQqrVOsS3sAAMwgE1gZgr1DHemjoRXSi5LtwJ5TrWNSl+2
	yXo25pPaxMCiDRILdMrBW8wveA0qyFd4OuXtzpmRLG4dPvaJqfe1KAFBOex6JghiyFB/EHIcHMn
	sVJ57I/suFF/703x1rLSvIZCWRYnEeal5oy/1gWIYqye2jx+85gizCl0cKquDNZcDn3Khy5+KJz
	ApCr5lR0UneKAozr5IS+TH3/daqBTpYidI9HuRSzgC3zrJiX5WzuEGepmhtdpbE7WIvW45JSL9s
	3I5E2xeOe0kq2++J17vQAITM73stEXjuExJPH4LFAVku6Nqg==
X-Received: by 2002:a05:6102:8022:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-616f68d76e4mr10996216137.19.1776881616287;
        Wed, 22 Apr 2026 11:13:36 -0700 (PDT)
X-Received: by 2002:a05:6102:8022:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-616f68d76e4mr10996186137.19.1776881615768;
        Wed, 22 Apr 2026 11:13:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41974167fsm4585950e87.60.2026.04.22.11.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:13:34 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:13:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        stable+noautosel@kernel.org
Subject: Re: [PATCH 12/12] Bluetooth: hci_qca: Fix the broken BT_EN GPIO
 detection for Qcom WCN devices
Message-ID: <klxyhlqwzl6dzk76lrhugxqdsv4hushphlfchuorcmvx5yja7q@pdmp3abepldg>
References: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
 <20260422-pwrseq-m2-bt-v1-12-720d02545a64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-pwrseq-m2-bt-v1-12-720d02545a64@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3NiBTYWx0ZWRfX9yivoTGw9B1B
 azuCHjSIpcWGb/5Oc0HL8QNyPLPEF8kbfySbX+QP8USfSu4R9zm/sP5zP2isN8eBvqeOqgM+uuM
 6yKY6jg6ANzBczv/Klg6YLNw2BBdQIVTkweUnuHlRso57Q+2mDG2/m51k+CjkzmGw8kLjmQAKuq
 hGLXobgdfMbGGIIxOlE0PfDoTA3EfP8/nrWDdxTemBam6xbnmVm/IPKrEYjTZdt2F2dDHySOVjt
 MnBKJeXyjIvOkeZvX69+IOM8+LJNuGBzmqAzU1VLTV+EKPpJvqfAdCy9FEPtJHu38mQLzmqMwgM
 7enyY76UF4xx5x9uSdQVtCLWblazxfC2GOVxhOrubzCidqC4Tra17OxNa/8BpvgHx270Cn/pYXk
 lZU32ZijmywHlboA/5q+agtNktSb6+KSBU7lD3CWLuvaMhbgXJ31G4lHXJl6959c9cYbrEUSox0
 AXJPIyVvm7VRYr+lcdA==
X-Proofpoint-ORIG-GUID: sVz1Gfj2y8ZORuumIwPVnPzKJN6jdvCq
X-Proofpoint-GUID: sVz1Gfj2y8ZORuumIwPVnPzKJN6jdvCq
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69e90fd1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pih5qmTRXcfhijoFvH8A:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220176
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104164-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,vger.kernel.org,oss.qualcomm.com,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,noautosel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2E454499C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 04:54:53PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Commit 'db0ff7e15923 ("driver: bluetooth: hci_qca:fix unable to load the BT
> driver")' tried to check the presence of the BT_EN GPIO in Qcom WCN devices
> to indicate the HCI layer whether this BT device can be power controlled or
> not.
> 
> But it was broken for two reasons:
> 
> 1. Assumes that when devm_pwrseq_get() API returns an error, BT_EN is not
> controllable. This is no way true as the API can fail for various reasons
> and also the pwrseq-qcom-wcn driver treats the BT_EN GPIO as optional. So
> even if the GPIO is not present, it will not fail the probe and this API
> will not fail.
> 
> 2. By skipping the error return, probe deferral is completely broken as the
> API may return -EPROBE_DEFER to indicate the caller that the pwrseq driver
> is not yet probed. Skipping the return value means, this driver is not
> going to depend on pwrseq driver probing again and it just assumes that
> the pwrseq is not available.
> 
> So to fix these issues, fail the probe if devm_pwrseq_get() returns an
> error and if it succeeds, use the newly introduced pwrseq_is_fixed() API to
> check whether the power sequencer is fixed or not (i.e., whether the
> Bluetooth interface on the Qcom WCN device is controllable using BT_EN GPIO
> or not) and set the 'bt_en_available' flag accordingly.
> 
> Cc: <stable+noautosel@kernel.org> # Depends on pwrseq change
> Fixes: db0ff7e15923 ("driver: bluetooth: hci_qca:fix unable to load the BT driver")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 27e52b08ec47..dd1d93cbb3d8 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2470,16 +2470,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
>  								   "bluetooth");
>  
> -			/*
> -			 * Some modules have BT_EN enabled via a hardware pull-up,
> -			 * meaning it is not defined in the DTS and is not controlled
> -			 * through the power sequence. In such cases, fall through
> -			 * to follow the legacy flow.
> -			 */
>  			if (IS_ERR(qcadev->bt_power->pwrseq))
> -				qcadev->bt_power->pwrseq = NULL;
> -			else
> -				break;
> +				return PTR_ERR(qcadev->bt_power->pwrseq);

This will break the case of WCN399x devices without the PMU in device
tree. There is no enable-gpios since BT is not controllable, but if
there is no PMU, then devm_pwrseq_get() will always return
-EPROBE_DEFER.

> +
> +			if (pwrseq_is_fixed(qcadev->bt_power->pwrseq))
> +				bt_en_available = false;
> +
> +			break;
>  		}
>  
>  		qcadev->bt_power->dev = &serdev->dev;
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

