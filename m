Return-Path: <linux-arm-msm+bounces-106852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GI3AR6OAWpyeAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:06:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA83509CDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6938930071DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739CD3BA24F;
	Mon, 11 May 2026 08:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnB0Wwl+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFs0Ax+M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BBB3B9DAC
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486802; cv=none; b=UNOPHKRWWrW4m8tofYQWLt51s/VjqqG6nvKVPuIeCv6S2cci25D+022rarcDzVLDstfNTwQIOYrgIlP2MnSBqZsabmU5DZOjgcn/V1nm7YuAuYYxGbkVVKCVH9C+yO9xMccLwCokOCR1d2iconvxmt74En4WTxCGL29tXb310h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486802; c=relaxed/simple;
	bh=3Tz2OjDF5lCkQ7m1u9fa1A8Pfz/yv22mmCYTrI0gwfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhzJIVrPJyPvjDiee8QjliduJHEnlCP6QzCAzbcny2s2e3VsMCjXBh6n7cPpJuJMP8KFbNSIKKck3IPCFPgTed92QVng59dw8iwQv3UpH2QR0COP+X7Dc+IcMTehtRd3w4STZNDs/k29FfzHFhMMrWqSE1CtZNTZurXU1O2HsiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PnB0Wwl+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFs0Ax+M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B45itH2923123
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/6OY4QeYUbWXnau99ZtZcmYK
	nWqdx8LqgKBOO25F1fk=; b=PnB0Wwl+S8dEIo2K3MJIQLzRvgJEzIVOKb03bCU5
	4Xkkoa/rzeLu1KoO5+hCUeEtsgwglXUbRgQTG3MDQhMbKAMgdEjsnETaOy7Xl3Gs
	nCIa8WHRJ254UnzU8Dw1GVgdukuZg8kZ7KDt/74KXwXH7GoIVDCLScsMAwBTIyeJ
	tknK0JzBesKmT9dnw3oct21v9FoCURyydRx4VUQS+Gv2Zij737HBX54jaxAXc+uX
	PRiFVARo/c63CDp6dxLs21hfIgA4bMwCy8ShbO22cW/H0LBCqDztxjCqwUTyIfhO
	JNN+cKL7LZtrhKk16qNommZEJal0RAUA6OvmTfD5hn2MlA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wped1sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:06:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-366122e01fcso4526413a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 01:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778486787; x=1779091587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/6OY4QeYUbWXnau99ZtZcmYKnWqdx8LqgKBOO25F1fk=;
        b=GFs0Ax+MKj4PnxmnOLYMAAS9y0ag8OObxQo+gA0upOz4GcUBMbiLCD65/yfO1GaxVV
         5wneooFnLZBJCeYCeLxJMcKeP5s8Oc2zfKX9sBdxFh9dxLjqi+l6JUKb+030cv3JVMkU
         Rp0UnfjUiLCLyaOtRQdAK0Z9ADuFs8p0WlYcvz+0fH/uJ1xtxIov0rjoqfsQstfA0UeU
         P19CSyLyglJGoz2pLxpOAcEJ9fxqyJoOGcdlMa4eftrR58+3Pd77LAJUuoRHP/UBjIgc
         Ed+mYdNBpZaol1V3iAtPBw5wJfZJBTEnECUg4Mmf4zBPuU8Eqja8n2VEKz6w6NaOyUcQ
         fDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486787; x=1779091587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6OY4QeYUbWXnau99ZtZcmYKnWqdx8LqgKBOO25F1fk=;
        b=B9bXf9pP1ob5WJRdl5Q1/k5uBKEZUO9bFlLKguGmT4MtANpRd9UTknkrmuaccdU1W1
         ZgSFU3ZRVDCwoPlWKD/4WrUL/N+Q3UHlu9dThzYuRxMjAP6OMZGIu8J53owO9qYe58ti
         MbQsQYFFzh95Xkx2ILNfwB4qt11JLY+H+otT0mp6wp/7YN5db1jB4spS1MlH4i+CrS3B
         S65G0WaeiDzq1Ev1JIhh7fgWJX/Wj+qKFvQlvvzswiIEpAjiovh5nl3g92DRjtczQ3Kb
         Tn7SUyR6E0JlpLanhYrdYI2fLKkxZ1Trin4ZM5/oynJhap+RSHdm6xTd4OLXjs7qXBJ7
         SXbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gpFu3+NI1SCXrGsV8DMGCBGBCJ2eApOwilu2l/n5a2R010PQk6EpE8vKLna9zSVrG5LWszGz5GAcPUwiq@vger.kernel.org
X-Gm-Message-State: AOJu0YzEatXOJZ8dMRrrthddjV5SZBG5lFpGwoCCLHUhOK+/aiyzN/V2
	5oOxM0i2Up2Q7OzjGhFZV8dxlOtzdiPlp815oB009qeQXGWUUiaufA8yWAaQ9tUjXNygVg2A8Hm
	fYOBQUfQ9j5sP//81qcvx9R4I73MlgKLmSO/h/jqSFJ/FuFpn1jK+8C1rj4GSr+g9O9nL
X-Gm-Gg: Acq92OFUPGLlokMe0D068vtzg6/v80LG1+Fd/A+HQfyZDr6ss9O5xnUAmCW6czxJkXY
	bJOU977sMxCJTDOvmxwVB3Ct1Pcq/MphXE5ZCGeccPEUtqV553nzknG7nNoLCY3+dZ/UAozVTgw
	546FsZ0nKU8sRsWeeOVL7WTMHUWkC07O9adtVlaSMjcb7dnWBYNC8C0UpW8kqA9Aron92+woW20
	+N6qLt5x/GmzrWgZaZ4Tqc35MLxtCOhCw/0pRvJOoZ3gsUZfjAhKIRPf4oVRFANafgjktmR2XLS
	v+l+UWgotzT5wdojQ6RNvBFyTUlHhT6O/4mQxclcsJOV9tZzOq+u7X8fsn1BUON2B9iCEEVHqIS
	xpZMLl97QIJmFBnnfuc7SZoFUNvdtgOA/SR48hdQFlll6RoXd
X-Received: by 2002:a17:90b:224f:b0:35f:b69d:7292 with SMTP id 98e67ed59e1d1-365ac080dc9mr23365373a91.15.1778486786611;
        Mon, 11 May 2026 01:06:26 -0700 (PDT)
X-Received: by 2002:a17:90b:224f:b0:35f:b69d:7292 with SMTP id 98e67ed59e1d1-365ac080dc9mr23365320a91.15.1778486786006;
        Mon, 11 May 2026 01:06:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d683fb92sm6583882a91.12.2026.05.11.01.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:06:25 -0700 (PDT)
Date: Mon, 11 May 2026 13:36:16 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20260511080616.6niytw6t5kitf7ug@hu-mojha-hyd.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
 <4e132e7c-ffa0-4954-876b-67b53870e832@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e132e7c-ffa0-4954-876b-67b53870e832@oss.qualcomm.com>
X-Proofpoint-GUID: 694cPxVVbHN_NKhi6vxjjFyMCQPtove1
X-Proofpoint-ORIG-GUID: 694cPxVVbHN_NKhi6vxjjFyMCQPtove1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4NyBTYWx0ZWRfX1ai5C+R9cqhp
 6Y9pWZlvouzEI7QbRRij/JT//C80tWMETu+7DQ1eAR0ZEqFWKjAuwnhN5temtj+VmsEstXF8mDd
 5agbmAETo9o7/290mZBlt07K7W299oGH4ysCtXTkH0q7CvFs5OPeSEMNDx1RzKe3y81CKfQF8oH
 qiQXUkqtu9IcOwzt+35h2NXSOy6bEi7oxduFjbXLRAVdc13LsrIdSwPYIHM7sp4czQ0XUgo0dOi
 u98rnE708PlNnkwC34VdECT05RxuXC7OJMr2WQLnMnlBDs5KUw0OeJVrRoC/PcUIvOolb7EE0lM
 5UT4C1AFZk+B9msPVquLeCSDAAzDmd2LtINOingq0sNZtuKsCqCwLY/m8FqjrVDH+5DtPWu8Hkj
 iAjuw0EPJTe0ueREN3iYn+U8Z7XiDfP5gamPF1O4sS4duQ/n4QxFQBYxTENd9kKMZdEd1ryGb/p
 QPJt/9GCqmYytlPwWaw==
X-Authority-Analysis: v=2.4 cv=EeD4hvmC c=1 sm=1 tr=0 ts=6a018e03 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=H2__nBlnFGDM6hqOEFYA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110087
X-Rspamd-Queue-Id: 7DA83509CDC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106852-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 12:05:15PM -0700, Trilok Soni wrote:
> On 5/8/2026 11:59 AM, Vishnu Reddy wrote:
> > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > or QHEE),
> 
> Gunyah has open-source version as well. Can we make it little less ambiguous? 

I doubt, Gunyah open versions handles PIL bring up sequence which only
done by QHEE module., Yes, we can just mention QHEE here to be precise..

> 
> ---Trilok Soni

-- 
-Mukesh Ojha

