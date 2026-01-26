Return-Path: <linux-arm-msm+bounces-90606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UChSCD2pd2nrjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:49:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A2D8BAC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F08A3023522
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FBB344D88;
	Mon, 26 Jan 2026 17:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpnf+/yL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOQb//iJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330A7330B07
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 17:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769449786; cv=none; b=DcjQeU3ON7/Hyc7jmCipUk9B/1LLOjzvhOX+ake3ERNIdMt6zcSMZjkUqm9qxI2yPmN0q+1kTu2xc1JkMGhNAij1wzqAxehdm0B083EXo19Pmekp22ivH3ARAkph6kfm5S1sya4s8gJ03OfT5iFdM8kcihHHjHVhmg56Hqc8/Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769449786; c=relaxed/simple;
	bh=qvYeO5CCgip+OgI8p8rVg7oXqN7yNa3ohCROTYQh2BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKirzsroJ7z5Orr8RmoFRq1sT1a6qfq83mah6IZoyJfpSj8ExqWee2FFiqScb/ggcHghusPwhhe39SKsOj+iJjcos6S1nr7Xh96oh42xuQDDSgVeUeDeliLlJ98/r/MQYfp5cRZux2hFIalyMx1lvrtvuVdULDZV0tWk1EZpbBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpnf+/yL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOQb//iJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QGZZXo3904560
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 17:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ySodch6v1QRZGOCXacTCdsPe
	ALMgFzrSdAkV6wT6V60=; b=mpnf+/yLJBV5QY4hrKaX75dKM7RTNNe1PabE67RX
	+fi+cMYrYFs0GNfIxkNlUP8Zf5pKjA5Xz2y1HupcUBdZX3J5/NsdyhsNQMnwkA/7
	XQ2/p7i6QFXYJ4kqWmfOgXl0tr6fYPW+KeWrmWmKRCEwb1PhejM3KGg7Vi+fczB7
	u84xeToKijFFcYouMl3dW5V5fHXH/0dRcPJZeFco4Uk62Ge3LB+d562MKcHfJLEj
	11m1Q82j8HmXG3UzDqVWY998fOu3/rDtzf0YfZeR2Qspvu6NMGW4N3TBhCGuW8At
	768c58YSXVJb8/Tsckh/jKiUWQRGxRSNEXQ75dCdwIG2dA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qncrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 17:49:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f541c55778so4291167137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 09:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769449783; x=1770054583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ySodch6v1QRZGOCXacTCdsPeALMgFzrSdAkV6wT6V60=;
        b=HOQb//iJ7aW1UnTpdkh2cAPq+8tBAPqHBt2mBtGXwgk6pcQZHREg2keXLcMc3XgS47
         vQPnevEn7ELt6jn5mF1xkPRYHS/Qzb64rjSUfmmOUBNpGR706CrfOlcq5cW9aRQ/j0PE
         MOvUqkbMa0A7EemXUc9NBY5hUWfHs9dAEQWTKFxMQ0KiwCw1DDkFFETn1rcU8pNY9Pzc
         UrgsT3EPgm/Bp9wrqMFVX8S3lmUEdT2U3ySxqcrg7/lqhxERKtyyX3vmKZWh3qHxpR1U
         K4L9PA9a01n2Cc6znd41+1vRbgP1NNq9n3mElvlTrCcqZmE62fqOchycF7uB5tu2cT4H
         Cqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769449783; x=1770054583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySodch6v1QRZGOCXacTCdsPeALMgFzrSdAkV6wT6V60=;
        b=eqVUmlWDXODd8OX6Q7f7iGbJU+AJva1J58ReR+6xlyqxYJK4fFGHkZerPvbmPN9bt+
         n9WVroJIusPExHwRyAe8rNp1Xa57mfDe1GWSN4D4/1LY6TRtwwy6vXClnsPxF7XllA7y
         339Na5+WzHjWtdxtsWbFfCxyVSwiOhzdSt9CuBk84y3x1UDawmKyajFr7MKlj4GI5IEE
         EJBMINEQrnx7c5LzyxCrAySiMWN+gqlhvjdxTHVPCifDemJYEZrt+NFI7AFwEAIg6U9g
         95i4YnYiZ6FnVYjv4kVkdFnzWwWIDarq07K7FvLkPmS+8Lcd8voA4UI+SWA8JFEpbH+b
         Pnig==
X-Forwarded-Encrypted: i=1; AJvYcCX9IYGhQBBTnYt+297M6VRioH7UVZRrJGEJlhxjgiRtdMxpdH+n4VWJUreZPRHdZmOB/otPYuvWmsoES3Zw@vger.kernel.org
X-Gm-Message-State: AOJu0YxPG/Ufxk7z61Vde7byPMolLz47SMxPwy0w/30RNQyzD2cb7LTo
	Uu4ORlbK3nErLg5n21mGfOpVHUWt531ei+kT39gmNAQp9O2bWKIrLIRHYIcf3GQu4Clt+HAzzX4
	vXbgbmUofMZnhOYnxh4BnyHsuE5JW2UlmyvL5q/Cq4N7ukGykUCUPrm6+ZZkWF0B1eZRE
X-Gm-Gg: AZuq6aJVS5N7/LbPFWG//U1a/wwTKF1isqXVR4PQHg95vDXXxvidDh5vvJzgHuzAdK9
	0XL4hBLmI6TyAF4LDBn5i829RE7HRq1s7SG2b4nyDh5OtCRyTuBY6aJ/bn9B2Likdv/U7gce8r1
	eXrFkrtQI0WglhzXUVVv2g/aWiC8LwjmHxgO81Hea9X1NpH2Nzhsi8XiE6mGZiKDzm96B16VMol
	ArCunQBx9XepgMyydBOvuTIPCTYAc9fkH/PavMym/VHGsk58JXkvcTtYOitUpzErJx+ud0vWCAp
	IerquS1xHplhRSPAiEtqrIfXPA/0oWcO8B3agKn4JEIlI39YDFMMyp7skeK4gGAQxs+LFGpjSaq
	HIVt6bWqFQ/AYkFLkpAKxw16UfuMmy6ju6k3w0Ovz26KuQMqvXWeUDD1LTThrnVKKPH87F7K1AJ
	He7XqCI0vUY3bD5/qJeJCryvI=
X-Received: by 2002:a05:6102:c05:b0:5ef:b5fc:dd4c with SMTP id ada2fe7eead31-5f5762c5007mr1243497137.7.1769449783156;
        Mon, 26 Jan 2026 09:49:43 -0800 (PST)
X-Received: by 2002:a05:6102:c05:b0:5ef:b5fc:dd4c with SMTP id ada2fe7eead31-5f5762c5007mr1243487137.7.1769449782690;
        Mon, 26 Jan 2026 09:49:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4927b19sm2857055e87.91.2026.01.26.09.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:49:41 -0800 (PST)
Date: Mon, 26 Jan 2026 19:49:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com
Subject: Re: [PATCH v2 1/2] Bluetooth: hci_qca: Refactor HFP hardware offload
 capability handling
Message-ID: <4qib2j5dpleedths6z2dhdf7lbjinxesqetab6q6f3j2cdgpua@wz5vfomy26y7>
References: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
 <20260126162444.4194293-2-mengshi.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126162444.4194293-2-mengshi.wu@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: T2Qozr5eYfXoyEJtlSVR6QTn8jA3-9Lv
X-Proofpoint-GUID: T2Qozr5eYfXoyEJtlSVR6QTn8jA3-9Lv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE1MiBTYWx0ZWRfX9J5etciZ4VMh
 xOkPIcyWzEsKlYAnNS5fPhJtou+9xzYIoTL+tDWxv10kXbA8+spsD+4aJ0Q1G8v5f/RfkQJ0GK4
 fOk9nZbeHzfEo0J9Wb8xoVx1RWBvqj4vLQuiqc6pkDZhgHnLAXUqJwm7X0hXbjD1cNfQ4iBt9/M
 e2JzuHKjFq4UEG80Hs4LmcZTno3UI0flRcHiuzmevsMzde8tUSauvXit8fR/gU6uP1CVBf5V61+
 zMbAJHezg/rZ04UvihD2xe9ybh0wW+NCk2fOY3301g2/Z3tKLV4VzupK92oN9h7r8fFGj2pRRn/
 /RZtnwp1ex/r3BZ4Llz7pU0e6uVLk9oOVX2ZXUXconpMO2M/e4NjgqveTAsyNqF2+qxgmgCdfkR
 RF1EcnVxWfVhLho8ItpYoFhYwVapQsU8bAW5xLT0FE9VdHpagOZeywLO2E5lqDWFbehwqBLDNtM
 8SYJyP+nrT9scnj1/BQ==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6977a937 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=isNLRfMVHu74YVDN5kMA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90606-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76A2D8BAC6
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 12:24:43AM +0800, Mengshi Wu wrote:
> Replace SoC-specific check with capability-based approach for HFP
> hardware offload configuration. Add QCA_CAP_HFP_HW_OFFLOAD capability
> flag and support_hfp_hw_offload field to qca_serdev structure. Add
> QCA_CAP_HFP_HW_OFFLOAD capability flag to QCA2066 device data
> structures.
> 
> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

