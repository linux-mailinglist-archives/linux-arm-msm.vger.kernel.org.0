Return-Path: <linux-arm-msm+bounces-105218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KchItsN8mkynQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:55:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA80495330
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5183F30CFB59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC74381B1D;
	Wed, 29 Apr 2026 13:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opyL4EBS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTh7nciP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1602E175F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470797; cv=none; b=KUsvOnp9SQnmhNAXG0s9tT7MK9pwyGU01KMoHYxQKehpGJi+calJkLBz/PmTl/myWgvnMT7GJDpGP9VgcvT60wvpDn4Wh3aBZvEiMlqVJeylrzCfBYahtJO/D6HGuzF4LWcQQr5ckzEgWEJLBtLiARufjD6XohhwoDZdr7qwg98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470797; c=relaxed/simple;
	bh=GTPA2YcB/zw30wy+DRHalzb/HWpk1KhTEVzAqq0pRq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKuJtStJrY9+gpLu6H4k6juUcl/bnkXPVWyI6/RLk4jWPiwr6GxDw4cKtj1JBHSc+f9kRalkuDGj5Ch2JxK1Y/ZRz0QhOvIKojqJgUvk3Olp2H3gZ7lP4wMfZmK8dYh8753ebaYBqK0pPDGkadMz8NKT/oSlFdo/oBnPVtRFBEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opyL4EBS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTh7nciP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qbaI870121
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N9U0SUgWF2lcmbEYf0NBfn0l
	dEy8tcMY+YE7XgOzUV8=; b=opyL4EBS6uDORxigC+UcE9nHJcnx30GM4XkEiaKJ
	+EKqtzXUpLkVEyXvFEr+OwuSno+GiOYRHQD21jvxb2FquWGStamzVGChieH0Vz/Z
	tkD9WFYveNCeJLXqD89niR3bF1KWvJJqWDGIHTsM5zL2vgXim8F1CXJNrPLdIyE5
	jF+wZ40Obr0A7V0abVcLlwzHgr2W3AGwMYaPBKyX6wVizsjyIZA+knAKDfv8Pf9C
	Q+NWs/qQ2X+nP+ibrFzo9BzC8zWR2BbWcKjjxOek36vixHMAuF/9v8oCmSvRxohY
	wK0l9GILTkz0aGEXhyH5u9yBWIC+BbMaklBh3ow7gNashQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1v5u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:53:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7976ded5c5so12927411a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777470794; x=1778075594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N9U0SUgWF2lcmbEYf0NBfn0ldEy8tcMY+YE7XgOzUV8=;
        b=ZTh7nciPFVfeCQjahrKfG9mxnwFJ296a8aQ6UbT4+TbX3/XUuQN4sh9qZnjt3ITgEi
         wzZICVzToKcPsT4z9BaAuyxlVR/V/D010bmOk/rqKyxrNMmhyEEDl7oKnxcBysFLBZW6
         Wyvt4RjVV4sREIveNFIvE0I4lCPWTl3DM8yKw/a5qFDIEuHlJ2U7+H2hioHOb3M+dhxz
         /mLg9F1VPnUzKnGBG7coG0+D6TXp47Q11Kg7utN2cFjwmvIVOGYs7KEkkFUH2l+nmbyl
         2AdPiiWAicVCzEEz8+fzRvgxjGxwU3mxsNJDiYu3tMHqg6ngTWNHJjyfcUwAnqT07x+B
         Q1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470794; x=1778075594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9U0SUgWF2lcmbEYf0NBfn0ldEy8tcMY+YE7XgOzUV8=;
        b=k8cJ5NQqT/WgfZwJzLVtOD3avCt4TQ2dqiiU70ujr5bbvsc+nGfJ8d7wpnSsB78E1L
         sb9WPWRlnOA53aGjRwyrmj4Eb9MepjZtQeVhXitrMbi+v6UUThkWwB9ObRp+0c4KMSSw
         32VC+5Yx/jegecgn3qRpbPmflCJ9MSLWOGNNi5169qfH1MS1d6dtgw9U2ZLXXsp9a572
         OddwIXRNtkRSN+NJym+IF1Blc4AG3xH55UFWrFF/HNzt0pPAdWv1ElOxsMposLS2hM+y
         MnZht4WU2SPH86ct7yZ5o9ooC4Kwg6zPVDDLv7vGNZLKuvcCjmm1oUegw6w0v9lOA40R
         GxjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+OJhSHtp/CHTA3u5jwqamKdh5CrAV0I3OQ4PNxzhbFm4M09Bram0fgLp6ZiUvajDouzn693n2ZmiCs+6Of@vger.kernel.org
X-Gm-Message-State: AOJu0YwBtp6dhtSKbrh3Q3z28ushxJrOYSZm2UA86dZzxA+2r6oV/2DW
	kcGrn/x9Yw/Ki51icbUzN5o8QRWbFs2BMo2MYtVwrankP6aRsuJzRI6LgmxNjLdGXL60ly+frhJ
	1kz/xFgW67X/4ETincMeuix7sUuccrDn5QMEHsw61plDY3T7plLFv7XcXBqli2opTFQNp
X-Gm-Gg: AeBDieukOs4KC+dyagoBgDaA9ENB5cKjrNARiFkXrc2h254V+VnpInvxWQscc3ImV4V
	cWequLSLbP6yUQDORk/rifzuOnsy/w3fXM9VMmynrOhJszo5mbKZ8q2AhckamctFu6zj3yDq+sW
	8E0xOkiDmdbWxL+R4Q8qBY4yTKowzQY9ey5ACl2DFQ9ZHgYNwLuyhTqFvhyDNf3leNW4AICtXR9
	0178iEBeaZuZmD3fDZYUo848JupkGD7x+THrCNNXKvRBE1GtykOP6qjxvu/XTx7hX2tHKdzgcvZ
	OqwhBdO7YJKkiHtl2dewSlsJ+fEz23abMzhOPR3CRHtwiJ6j0JAFQdhNlLZ93N5yHf18X6TtHid
	90959UlILy0+Y4b07lKyT0gtxFd3yjq4ZhqJ8kAvBgu2gINSX/7q2rCsx/rM=
X-Received: by 2002:a05:6a00:bd0d:b0:82f:4628:4198 with SMTP id d2e1a72fcca58-834ddc2db4fmr7647892b3a.31.1777470793699;
        Wed, 29 Apr 2026 06:53:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd0d:b0:82f:4628:4198 with SMTP id d2e1a72fcca58-834ddc2db4fmr7647813b3a.31.1777470793036;
        Wed, 29 Apr 2026 06:53:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cccc4sm2190396b3a.14.2026.04.29.06.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:53:12 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:22:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 09/15] remoteproc: qcom: Select QCOM_PAS generic
 service
Message-ID: <20260429135257.utgighzczrbnl6cp@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-10-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-10-sumit.garg@kernel.org>
X-Proofpoint-GUID: L6YJLIpNK7bt6RMV19ABYygxcFL9u4DC
X-Proofpoint-ORIG-GUID: L6YJLIpNK7bt6RMV19ABYygxcFL9u4DC
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f20d4a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=L7XPiZuQ2t1DW7kJCHQA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MSBTYWx0ZWRfXy7p5gub3OPcl
 Zgo/5XI1gq+9FPwi1ISNaviwvvZ4byry26nKciMDV9WwQOg3YO3SZ50KZ8AYIMz2nBTb/roKB1f
 oThEBc5INdFhS8sY7B2m62R727KT73diekh+VEZakd/GHb5xQ1VCz3WOlLZNoC3vePSF0bMl/Kw
 iOrDEp1bGOPwagV4UyLYMEGrDjiYcAdHoQ6jEOpQPo7ViVIEv59b0fJemfaMw24HcYvb2buBgrE
 HbleEnBa8WitD9es0eNyD0PVvGby2gntA1+VIz+9fD7YV/APaz6vTL1RDf/8inXIetQczHjfa7k
 Yke9tvOfiTnj4fCEOY2KI9xBNXQ0HSJNDujRSL8j9d8cVyHHwgRSBWtOH0NO1JSHx4IHEwdpcMB
 5KUMsyGMZGsRVy26c9uY1gzq9wZ0mkGJ+nPwH+dNS5eVtz8RqsQpoDmi+LG1FMg/5vDeGW8airx
 dz4CqpzcB04646J0l6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290141
X-Rspamd-Queue-Id: 1BA80495330
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105218-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 27, 2026 at 03:25:57PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Select PAS generic service driver to enable support for multiple PAS
> backends like OP-TEE in addition to SCM.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/remoteproc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index ee54436fea5a..da3c5d9562ea 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -230,6 +230,7 @@ config QCOM_Q6V5_PAS
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM

Check do we really need SCM now ?
Why not the change for WCNSS, MSS ?

> +	select QCOM_PAS
>  	help
>  	  Say y here to support the TrustZone based Peripheral Image Loader for
>  	  the Qualcomm remote processors. This is commonly used to control


> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

