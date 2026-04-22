Return-Path: <linux-arm-msm+bounces-104147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN/qHuPt6GkdRwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:48:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC6C4481B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CA4E306E8E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1192FC00D;
	Wed, 22 Apr 2026 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eh6h25AJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewsTVzOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BB436165E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872846; cv=none; b=Bc7GAYknLUbCRgogr5tN+IXt/s1DsNTPBo1pY5HaOslcTXsQGWH3IKKZKlqKleiQ+yLekiiPIE1DBbU4o1zdkNzbyrOZrTmKEYnKfrtJmrZCCSC8vMYCkzylDqIgnqBNSgeQoSdrKWwt3TeCRXjvUcd1wzJ/xY4wLjz/SaZwMHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872846; c=relaxed/simple;
	bh=xXa5k2K99vx+lhuaNBx05uhEKqKCsUcHg8UJzDDhqnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwMUZROhpnqAvng0W7ixOlflAIjHEMeXH3atAF9bqUbjHmZYf7L54jHS6Y8b9Y3lH3NPhogCKzBihBydQKZZu/u+l4rSXeGuR4utmpf8MJH4nHXqRHtPBDOCaPIga2Rl592mm4EgdEAzFIM1qDnsUgW4aD7QbwDGj0KJh9yItFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eh6h25AJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewsTVzOd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAdSI93377635
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TIu+DBStZtyj0oJu2FZ3xGC9
	pVsbcUr12+1053rYZU0=; b=eh6h25AJgDrEZuVCUlq9yOcElyGqH/Fi9NmySvei
	8v1+u0UKn26YDxyuUamZJTGhB20QivW9pW9IWnnSNitdU/YXhRkxcrRhkmmBxLM/
	usHltQC5g8lvYnXYu4gwLfxiN2Ho9Gaupls0WDovlNXiiy68DlD/3RFSbwYd5BT6
	pWm2CgWaRf8CO4yq46GQMtKMtW5yb4ZWHrSdi8k0jKoZjCyRY5UsHNODwXvM3i8J
	y9YvMBP5mZ3Ff6352oyI9D7TtEfPKLx9/MgpLPT7XlARG0qcpqY6F9qgfAV6oM6U
	m3kZnbxJHVImoFapYLeFWi3DMhioYYXOpCsNf1obJS4FOA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng44u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:47:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6100b5a0757so9425433137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776872843; x=1777477643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TIu+DBStZtyj0oJu2FZ3xGC9pVsbcUr12+1053rYZU0=;
        b=ewsTVzOde8so4zUIOai1qWo/ZB3gj7G7hhZ+qPQbd4dbNAOkwK3DLS7Xd83gBAvd1y
         G//i3ASyaCnda4gR0U2b5itHe1IJKzoGR1o6eKs6orlhMSJ4U7mDFCLJebqdS2ASUWBI
         aDge6VgMj06dYFji5BIq1/fbW95UQNQdCffdIe6LJpn/PJZAeBM8HUI+xBKLJHDMJBfo
         CXfZ6dEdd4JKYYjN8/nh4iHg4xfWHVXVPClLYLnTEhU6u5NV8bXIDXkinKmYKBHLfZPa
         qWI9Kzx4gi5lCdDzqELZkKxQqH+Wt3ump8EuoiPYchBhQHno4SbdJh6M443LjPV4mnoT
         BrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776872843; x=1777477643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIu+DBStZtyj0oJu2FZ3xGC9pVsbcUr12+1053rYZU0=;
        b=DUQP6GGGgEzcS3Z3p5COolYllxjc3gSRF/ADv0vAR+RJSgo0PbGAXOfe0sSMvXEIIj
         LSpaZ9prYK1TUmOGZ1We1aZzudJzXWLqSZo5CMRHifDf4yNZyB8Bet7s58UVBeLNx1x8
         0RNebLzdKFfliauIuno9UCh8K54KbrGqwPo52NnEFa6usGrMORgBZI+77JYEDjxPjB/d
         tzGlHhaxkqnMLKa/jpopUR9vL38v41G8Da4h1X2WWMVeYpNvFfUpPTS9OUY5CF3hGmki
         Mdu4mffT1pbZSEXw192IWPkHhcEyIYbQ8K07w0C/1yM23ExKvoq9uMCQbAj16IIJWdMG
         1xlw==
X-Forwarded-Encrypted: i=1; AFNElJ+GEZ2R1CpsEDYuO+ZWWsm3L8jYHdNCWqFc7rwBhNPMoPM80H8CXU2QT1o+ySlIzf2c7PfYtn7Q01dqd6JJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzVuAWxLQTgXYZsUJkeMJ47RvGOMdIZOZLG/1HZovsYKG04sS3x
	ZS15N7X9gZ2U9zROuuliAhRnqyrkHrSsO+NKLJ+/g5eDSxdXNGyWUi+2zl1C1v2Qt25++0SLtQv
	qZWnaG3qOEeSp/DMw3Zyoonehi9MY5Nm1TO+9XjAYZ6sqIrW2VGdLKQ3bFpxnzHJLnc/M
X-Gm-Gg: AeBDies0e4CtNzFVaA8HfOZPRpCd8SeCS82hKUhBsKIviLNxAxNdUK39exg3VWpU0V8
	OoEOB579URfTcSwNeLV0b3dtv/Kd/u2q7LxzeoyDvv2Qi7OX6jEh7BOX3kQaHn69a9Dehnwltyl
	dUaTVE8IRcY3dgOQwYuXvT1Ihp9G9X45H+auGPq4tw1ZnUQrQKkwezxLdaPpvmIbMN/IKZ7emb5
	oO1JSRbUFDNcMHboBl0NMFDXpjTZ1xdDDVXQSViPtkwB9fmOFN6HvIw//+YuV5PyniAKidf4mV4
	4rdpwFLSFyg/wr4Zs04xKok9QF+yI54KD7X0EV5t2mrtamF/04rQxN21tw27MAkH6ux1P2QUakp
	3N4g/MPvCi3wc6u/4XjzO3pq3e75jsm7MsPDpuhOQWYOd0NH3KUK8TbVGAqoSm7ZoLKoLjBod7K
	rk4VXh7kpQxXigkSHO7TpgqeoK5BBmAI+BiKEM2/cX2vqscA==
X-Received: by 2002:a05:6102:b0f:b0:607:97a9:e3dd with SMTP id ada2fe7eead31-616f73fb01fmr11038168137.24.1776872842944;
        Wed, 22 Apr 2026 08:47:22 -0700 (PDT)
X-Received: by 2002:a05:6102:b0f:b0:607:97a9:e3dd with SMTP id ada2fe7eead31-616f73fb01fmr11038138137.24.1776872842469;
        Wed, 22 Apr 2026 08:47:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7d80sm4485337e87.68.2026.04.22.08.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:47:21 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:47:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: Re: [PATCH v9 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <jqehwyeoda5t5kabxjouc4kgpnebndotkr2a4tuuiypzqcck42@dv3vu7wbq6nh>
References: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
 <20260422092409.4107093-5-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422092409.4107093-5-ekansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e8ed8b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=EekQdeYcPna9Ds66k2oA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 5dgtl9U3ds5ZHx3rgXTp1IZG2z90xDoZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1MyBTYWx0ZWRfX5bqLOcd2Et8X
 GwIZT8sCDu1CblkpoZzAktHEoxjtoIMw3DINIZA2PZv56BQ1Tqp6T2b8g3ocZhRD9E+U3BL6FQr
 QdhgoUHQJG6888xXx8/zxW+DL2EnVFCA9FKxQLHUMzcPcA3FPSBCclOixxbgC8c+gD3R+nZPblX
 t8s8CUr7nLj6k4X3KSej1To6Qrh4fcEK/V/uwR6hQAUSe+XEc8veOKSVz+JqzWXVZr6JkKQ+oOk
 xIFN7Q88Gl2zRCcmdbH0yNlW4Cf7ZTlGAkIirrAJh+sx13Gl6vJaVz1eh9B7Ygt5kbVjfdEm2AO
 D6i3/YMMHrX+SnW63p10lZR1G7ONVupUzvQXFMGsLO9iM8DSDZlHlegk3bDfFawdLxQkivy9LtA
 gnyAXWrqtGnde328dGAxsT3w+y7mOdfnEZL6DcwWoJYqhKRplRZgrMDx7H2xr3nPj7uFfimGXfu
 BabHJjGbxpeoDe9myjw==
X-Proofpoint-ORIG-GUID: 5dgtl9U3ds5ZHx3rgXTp1IZG2z90xDoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220153
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104147-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linuxfoundation.org,quicinc.com,lists.freedesktop.org,arndb.de,gmail.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBC6C4481B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 02:54:09PM +0530, Ekansh Gupta wrote:
> For any remote call to DSP, after sending an invocation message,
> fastRPC driver waits for glink response and during this time the
> CPU can go into low power modes. This adds latency to overall fastrpc
> call as CPU wakeup and scheduling latencies are included. Add polling
> mode support with which fastRPC driver will poll continuously on a
> memory after sending a message to remote subsystem which will eliminate
> CPU wakeup and scheduling latencies and reduce fastRPC overhead. In case
> poll timeout happens, the call will fallback to normal RPC mode.  Poll
> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
> request with FASTRPC_POLL_MODE request id.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c      | 148 ++++++++++++++++++++++++++++++++++--
>  include/uapi/misc/fastrpc.h |  25 ++++++
>  2 files changed, 166 insertions(+), 7 deletions(-)
> 
> @@ -2331,6 +2446,22 @@ static const struct fastrpc_soc_data default_soc_data = {
>  	.dma_addr_bits_default = 32,
>  };
>  
> +/*
> + * Older platforms that use default_soc_data but whose DSP firmware
> + * supports the FastRPC polling mode.

There should be a comment, "don't add more platforms to this list".

> + */
> +static const struct of_device_id fastrpc_poll_supported_machines[] __maybe_unused = {
> +	{ .compatible = "qcom,qcs8300" },
> +	{ .compatible = "qcom,qcs9100" },

Use qcom,sa8775p instead. See sa8775p-ride boards.
What about qcom,sar2130p?
qcom,sc8280xp?
qcom,milos?

> +	{ .compatible = "qcom,sm8450" },
> +	{ .compatible = "qcom,sm8550" },
> +	{ .compatible = "qcom,sm8650" },
> +	{ .compatible = "qcom,sm8750" },
> +	{ .compatible = "qcom,x1e80100" },
> +	{ .compatible = "qcom,x1p42100" },
> +	{},
> +};
> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;

-- 
With best wishes
Dmitry

