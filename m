Return-Path: <linux-arm-msm+bounces-102210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL62MtYt1Wli1wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 18:16:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8143B1A21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 18:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FB71303CA50
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 16:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4583B0AE7;
	Tue,  7 Apr 2026 16:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cr5xdDtv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkRqQyMH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80D13A4514
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 16:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578576; cv=none; b=o35ex2LBXOWAE4cb8thNV+Qs9AbfR+htqxcJuEtAAXD0NRHVDtTIUjJ9IPIKYzKpFTzccsiT3qrIwQZYM/hr8jHa6o4TA6dyy7uTV0LJj8iucjqDLyf7ScQ35ZV9SmwSx2El58yRwZ1AtawWmvH/FXadFgL3dpfdpkCcnvn8NbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578576; c=relaxed/simple;
	bh=2J4zbkyCRkdxpNFBhWUmGJNe5DuiJpTy1rHHoz6v0sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGBs7fy1+GjN6S87hf1W8Y3TflOY7Pvm9frOFWfamriG4NcY3uYWHg10l44FiZnQFzct3dzMAbrBEhWO98QN3i8j4+A+5KSyuXTBHCECJedugSboyN4ZhrbrP5fNK0fB2rG66lRi6sem+nare8wUt+lf2YgG0lQOaQrgb465U80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cr5xdDtv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkRqQyMH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CN8Yw1404166
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 16:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qSJcvPei7/x1R8FChuHMtIgl
	/NlquKOCcLN6Tv4gsmE=; b=Cr5xdDtvlik4Drtz1kPoA3z34IKBFzqnTMjxrSd3
	ojJPDQMtaeGaI6qTE3fa+FBqTwweOyajC/unTRF9d0NdiLw4p6nbaU0su+1jPoox
	iyf45rI6ks9tNu2Bb9gE3+NjVx5denIfZkT76VV0RVntOeXupCGkQLNj0wMVmz0z
	+jRV2jOITI+joE/VU36q92+U4HlUdtZr8B4CerlNA2itA3o/knjaieiIwa9DVdR+
	98CSOtQEd/nQvZQ1fPxU2RNt2UpwmkbG8CkCQthvpN0kd/f3+CHty1ie68stgnBo
	VFaatLb9STrj0S8NCoanCMwmViKg46MLJxbI5qIgNON57Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8bkk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 16:16:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bda35eab74so39579eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775578573; x=1776183373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qSJcvPei7/x1R8FChuHMtIgl/NlquKOCcLN6Tv4gsmE=;
        b=kkRqQyMH5q+sH4/tzqN0tGTFr3nufjZYbfMO9jLIv0ByxIIvz+kZGBem0L8ZGYKm/N
         DhPwq31cFQtFVHkQoNOmkmYIo3E4M6qui6C2C3DszPjueNIFWbldcqh6lQFE4DF89T57
         Pml176a0+PQSu1NJf4SybK5fYMUI5V1ph1OyaVDRWvfeK2HujLeAAB5fxDgvTMPhhJlV
         5e9+xLdi683D8H/eRoqix1LZBtTLvIt+wDOIB2qKmPV2natWWZnxyLQMOdxEl/HfI0FN
         dAO5uzWa4nESmhfOi09g5WWG30lKZkeqRb5ibmXXE1ppgxxhHTSlBNVxGZcOzXCmz9Lz
         UOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578573; x=1776183373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSJcvPei7/x1R8FChuHMtIgl/NlquKOCcLN6Tv4gsmE=;
        b=MYw9OL8iu6EsFonob6FbsANk70Z/jWWHv36iomgm+J48AlsSyHjHM5MAT2wSpu6gOi
         QjyM+hl0bMLSUS54p34AI7tuUK2wIgxvU15tEsby4VCXfNYjoUVvuQetwfGkNePjoedU
         faftJ/iMtvBD3CRuEYBG7n2TbTSlyWlmZmuBhRxBkn6XxK5iaQLbzs89gElTbbOXtuNb
         zxeKvQhAI25yz0fgP9ajW7ZgHS1AYcAR3c1CvBzw62XgAukR/1LHEKYVb400ZJ5R51PK
         O8d+zC67jv3S0C6vjr+JvSglfy9fr876bnrGNFIYDxPkfQ9RR6diS60Arh5PnDwjfmj/
         MWsA==
X-Forwarded-Encrypted: i=1; AJvYcCVn6AKnvrfFsVfQ5H8FlTKozqmPKeyl9LcIbOObdDYBwOKRXSzTchN4pP+GoYogUuxs5Xo2/0gjoVWjizeF@vger.kernel.org
X-Gm-Message-State: AOJu0YwPNdJza5yjF1IC5acex5vNBti7WD5vzkPegwbugORgEPmmZIy4
	WW401IfMg5Q8hr/NGg6gigfroJfM8BaQWm6pSQqgWsHeMPkZg40pPnRWqZljuDsrdYrtwa8sZeD
	QokQnV8tenm7Pxz3r9BkgpIDwqGwFUrulM8OudnS5Amc7+nHF36CGzEpi5brU6itRN21fT7Tzuv
	jD
X-Gm-Gg: AeBDiesVgcpm3AWRG4T9/VGvcQHB2BhBJnw5wUhOSWt4ivSiuVmiVqDD5kgVrZktJma
	cmTtVyBuTax2UqB3cLtYywyqvJe/ffhnlgKwUDZMQklaKISNMxny2oTgu9Uvsn//N8j7ozPppJk
	QlfFsxZnzBlkAW0kaSCkzGWq49b/lLIc8U1vliXLp3cYCLA/aZ0ubSr2h4aEHcC05PF8k4WoSSG
	iK2LXRn8u7+UH8t+kzKqQa9fJHf2a0vC6U3ib5eD9nvhThvixHHaWLwJeoRZUpW8p+SPesAg3o/
	lJ7B2GSTTaNi/JmiecFnVBuBnILqufETlm/QsGNHtbjdxZ2AxTdQtQRevMA/nIx1a017AxVIKxD
	QcFvpEnV4c1s8b6pJyz7L50VQMcaMiyQ716VEnqCAqCuQdy4zz3IyxCa3M+oM5tQEjKyOPsElCw
	g=
X-Received: by 2002:a05:7301:3d06:b0:2c5:6140:54d6 with SMTP id 5a478bee46e88-2cad60cbee8mr8792157eec.1.1775578572541;
        Tue, 07 Apr 2026 09:16:12 -0700 (PDT)
X-Received: by 2002:a05:7301:3d06:b0:2c5:6140:54d6 with SMTP id 5a478bee46e88-2cad60cbee8mr8792136eec.1.1775578571936;
        Tue, 07 Apr 2026 09:16:11 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm17775196eec.17.2026.04.07.09.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:11 -0700 (PDT)
Date: Tue, 7 Apr 2026 09:16:09 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Hawi SoC
Message-ID: <adUtydkb4q7FfbS8@hu-mdtipton-lv.qualcomm.com>
References: <20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com>
 <20260406-icc-hawi-v2-1-6cfee87a1d25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-icc-hawi-v2-1-6cfee87a1d25@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: z3_u0V00KVWw18CBd9oAixsUPh0B766X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0NiBTYWx0ZWRfXxlaIBVRiH8mm
 nq1xre3E1nnH9ug9DGudoWxYLQsjKBJjrJcrMwQFUt6IrzGKYRcWypYEZv9UDkVcwwTA5PEQsij
 6lN+RNd8x2vxiXSjclg2Ckgv0Oxib5O/sb9HvbjpK3rkMX9vlFOKlZBOJMqbywRs++HJTFi6Aez
 ZEJ4856tjAi4oHUoMccvRCtb6s8HvastybZt6KSkLPsws9o6cVuuR2+J7hFXspRhlmNOxnMwsF2
 yBsXax2O6GJqTzI7kEIvP2QkSA+kW5yY0G7LZRagejFlqwwOc9K1BPLYZo2Ron4p7N/typmpccC
 NAxr+RKW4RK4aQst8MBi81jQf8FN7pGbVG6u2DOKNGyNr/sa7cx/0IfPu1l2t1bh88sv7sY1THY
 5ZcXZOrg6VXbvHXQHCWGilvNQ1ALyl+u3kN6/Obtoo06+asuXpss+A6xY5CZ7EfZzj8O/jMFwlF
 m0HwQgJv01U7rqosRMw==
X-Proofpoint-GUID: z3_u0V00KVWw18CBd9oAixsUPh0B766X
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d52dcd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5zgHMrtXnVmdyp8FnAAA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070146
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-mdtipton-lv.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102210-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7A8143B1A21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 04:04:41PM -0700, Vivek Aknurwar wrote:
> Document the RPMh Network-On-Chip Interconnect of the Hawi platform.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,hawi-rpmh.yaml      | 131 ++++++++++++++++
>  include/dt-bindings/interconnect/qcom,hawi-rpmh.h  | 164 +++++++++++++++++++++
>  2 files changed, 295 insertions(+)
> 

[..]

> +
> +#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_HAWI_H
> +#define __DT_BINDINGS_INTERCONNECT_QCOM_HAWI_H
> +
> +#define MASTER_QSPI_0				0
> +#define MASTER_QUP_2				1
> +#define MASTER_QUP_3				2
> +#define MASTER_QUP_4				3
> +#define MASTER_CRYPTO				4
> +#define MASTER_IPA				5
> +#define MASTER_QUP_1				6
> +#define MASTER_SOCCP_PROC				7
> +#define MASTER_QDSS_ETR				8
> +#define MASTER_QDSS_ETR_1				9
> +#define MASTER_SDCC_2				10
> +#define MASTER_SDCC_4				11
> +#define MASTER_UFS_MEM				12
> +#define MASTER_USB3				13
> +#define SLAVE_A1NOC_SNOC				14

Let's align these values.

Thanks,
Mike

