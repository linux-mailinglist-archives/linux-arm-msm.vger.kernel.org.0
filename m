Return-Path: <linux-arm-msm+bounces-103538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OpbOG0+4mmB3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 16:06:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3679141BDCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 16:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6009C30363B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 14:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CB2273803;
	Fri, 17 Apr 2026 14:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+C8bZXk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlrEp0w4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00CB286D4D
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776434710; cv=none; b=NbQwVckqYX3ZcI8YDcxLOZecrq0rKsjA7U8efOnCN0GFbEKr8cY76fKhc63UJFtlNRmxIrH/kLM66e9UTyPyFi9SIf0SYZLNdAPI/uS1rTupdolQeFeQf02b89Wbiemn3YSxEmxPKDoth3Q4G32dSrFNJ4316tXHP5fl70ngqKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776434710; c=relaxed/simple;
	bh=fvhCnYIXJu9NlTEK0ZhQoJC8I3uZolKOwzBRwXBuoIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0nl+iAHHLqSq0159MtpEkPduGkHdslJYUXGVAu7Z9jVP4hTqSLTL/qH53gRP0OM7sLOw1eLVc9ali+XZrg49eVBi/Wf8M8Hqmp7GgvZ+XY/uzWoHFNMmJ1ob2bZ3Q7J/+KKkuFrjQ07ZW+HA6to+yJZrkiCQ6IsjhZ+RTEtajM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+C8bZXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlrEp0w4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H80qsn667772
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 14:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eWvWoqz9QcqhnuWEa1OGrXdT
	RlPfmGyBbK0LFPb6Ikc=; b=n+C8bZXkyZ/6jAtMlFyVUAx/PHm7DqOBUhIJKM1u
	zbCI2MoprIsQX4XftL0h/jjCPcMJ/YZI+Zt2z+9Mqa/I5rvscStelLa9qzi/UD9T
	xYuhqpTDfdId2L1yYd2sytDljfgEpbdgRR9N5TpiyisZfmHaMHt0ARJa/oblTS9X
	mu4Zw7SvjeiC8SxuODog57ePSdggcop6vZyFyeLK9ywH31vyvOA1W0KzOW3O7cxG
	hkic+4zmG3U5mv7CJxpVoFbye+OFZF0usfHhQv+Nz3v+/d54e/dCEUNBUSesktGe
	WOGZ8AY9jOs7Qn+yUB8Jm1j8/4p5p2o6wv7/uljfTyAsOw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkaxctg9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 14:05:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2e60238adb1so46233eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776434706; x=1777039506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWvWoqz9QcqhnuWEa1OGrXdTRlPfmGyBbK0LFPb6Ikc=;
        b=TlrEp0w4k1JUjjZd6MCrZdMogMQ68spTSwAHhWgojKDQZgAsUS7080PFbTTU+dQrYY
         cBgUwkaadZ1RtZP0LfTotYSAo4PoROBPCGEUwVhWNvUV6zOi20QGpdeT8xp/62pJt1rH
         YBahJokA1ja/srEi7H//hqMwrwY21AOIame5GSCrKGLTLobWU+RRIBrhPX0fywiY4Kfb
         wMRveLg8xTTqeU60E039Gw7Tsj+UnggHpbwvfGgdDtAd0jhMr2UZi6x2QENQTu2ZotCR
         y35BocgJ3+PWvUzqD3z+N6CTzq8xMlTxtykGd0S989sNn6v8OVinRQ2wx1aEIzmX8LzG
         iuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776434706; x=1777039506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWvWoqz9QcqhnuWEa1OGrXdTRlPfmGyBbK0LFPb6Ikc=;
        b=TEUs/He73Q09/yoMLIwKo/N+ido0+iFbZLyTp3vV5JkhPlBuXNl6gJWS87kof/FFsp
         05cj8eISkoG+cXYDgwDE8+HNLld1rR6WPBG1hTyH9EKCwGPFWBKkY74ODHZzVW4pwxw9
         TldpoqesflzL6Oh/+st8tKJ/WkwAfBMYeHlqwkci6NjUg8tE1HzfVnPd2GXa0p+hg7pN
         uPYMwiM6/y9hbRepcPyIPQhsyNEXpOMbP0fe54sFTJV93knONx+SLGSr2TR+bZ+wBF0w
         XoRySADmdYjTpKC25PxOVgyr/ntPTTcQOzZ84SFiBgmlt9V8+PP1fLwlOVAkdURo4b6D
         xANA==
X-Forwarded-Encrypted: i=1; AFNElJ82K2QWJG709IXcXFtr7sZb0nQ2thuM7mGJq7LTNP4zaQXzz3QUPCoa2wB0Kxs2i8YCE/TJw9p0Qnw5jvH4@vger.kernel.org
X-Gm-Message-State: AOJu0YzuNkf0XXflSZxzKD9fsBW7UxwueQ8jNlZH9i0/x9ygadDY35aJ
	MpCYL5N9z3BhuxjcGGDNkojJmEQ5ldNI6tyL85N/pZHZEXCIbi9A1opkiVMOTIo8cbSjunUFqbH
	QGJtkLnYmb4P5Lchj1Qd/3zoCq50iKpcE95jVNeYQ5pb94AJHmYs1h6lPTNl7rJ/lFUcn
X-Gm-Gg: AeBDietdBpRtAI6i6R4P8gMlbz7uNsbOfqh+7rtVQ9hb2Ff3J5x635QCCs7AktvYNAU
	XaCKmamKgddV4vadp5jz94iP1NbZqfRJ3P93DhjIHocM+mVGo8MaSMuy6/KFPZ9z3Bob1QduXaj
	MMoYHUREJ/8/lIq0OrGv2Fh/E2nfSiSz2GE0nWnntgCHUvkpIKapsrm8H1tcsw1gGiKENzqJSFk
	2Prn1g7Xtex+z1r8/eIv7VzsoenqBOFu4xucAfemEdcHmccswm9Iwui4zZlw/pGJAD8+YXfLcQR
	bAGCe/6QLWO6FdAB5fViJGF+Gg58iZcnBfC2Fq3C+390hAUwnetlU8P0fxPnvKVIQ4JcpV36PsF
	EOcLozDDhEj4Z/pY4lUjWplHJPHDsfac6H9sxUe/FTfgrNbb9Syil37/bIo/WtKotmtcZ/S+V7v
	I=
X-Received: by 2002:a05:7301:1698:b0:2d9:94b4:a1c7 with SMTP id 5a478bee46e88-2e4788390cdmr1619184eec.15.1776434705528;
        Fri, 17 Apr 2026 07:05:05 -0700 (PDT)
X-Received: by 2002:a05:7301:1698:b0:2d9:94b4:a1c7 with SMTP id 5a478bee46e88-2e4788390cdmr1619091eec.15.1776434704692;
        Fri, 17 Apr 2026 07:05:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce440sm2231261eec.14.2026.04.17.07.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 07:05:04 -0700 (PDT)
Date: Fri, 17 Apr 2026 22:04:59 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>,
        Ninad Naik <quic_ninanaik@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Fix fastrpc compatible in ACTLR
 client match table
Message-ID: <aeI-Cxf8nE8PH2WD@QCOM-aGQu4IUr3Y>
References: <20260416152652.958229-1-shengchao.guo@oss.qualcomm.com>
 <yel34g6ugumgqcuhe33pzaaxqvmjcdakdg22wb53oq2snpbb5v@6wfisbcwzyvs>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yel34g6ugumgqcuhe33pzaaxqvmjcdakdg22wb53oq2snpbb5v@6wfisbcwzyvs>
X-Authority-Analysis: v=2.4 cv=JcqMa0KV c=1 sm=1 tr=0 ts=69e23e12 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HBlysRB72iAwEyOw3cYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0MSBTYWx0ZWRfX73pGS+kI5izL
 2314KWkaX45E+iz99wloq2RXulvJNhjsuuMd8Avc2mMPLChFtVMjGYiW4uZ59QZ9HfRj6n443sE
 S7D7vPArUyKBrUULU6KHcUfz6YFrGQc+sFPEo54Zt4P+LUJpCQPNAIhXy8gZG1c2mAubho0EV4E
 laUR0QkeAHI7u6dGh+Uu5G89Gi+pGuuWr9DLTsOl2tb5dlyDPJc7vE/FqUc32e2t3wFYrB3bMYB
 Mj/0GJbm6MREX8WVv9mxiV8FMYuGPbUlhywEMq8NGbkv61+iIfWRKSnjHAYebktMAXkg4SyXsXj
 z7yp/02bFKc3MG8hXjOD27bLTMpCHu396lPBqxr5bCFOw/e9WZ4dqtQqJVq7KgFCkD5s7tkaZm/
 C11uuxaEhPSOwIgPdRehUz2zUWLwtyR5MfrzEjTXmikZLNaRb+VZ0I66ymnrUaUofMTC0mJTIYd
 4Mj5Y2VgWaWP6sGanlA==
X-Proofpoint-GUID: vBGh7MlbUz97nCbwq9mljF9EU3C2rzpA
X-Proofpoint-ORIG-GUID: vBGh7MlbUz97nCbwq9mljF9EU3C2rzpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170141
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103538-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3679141BDCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 04:19:14PM +0300, Dmitry Baryshkov wrote:
> On Thu, Apr 16, 2026 at 11:26:52PM +0800, Shawn Guo wrote:
> > The qcom_smmu_actlr_client_of_match table used "qcom,fastrpc" as the
> > compatible to configure ACTLR for fastrpc SMMU clients.  However, the
> > "qcom,fastrpc" compatible identifies the fastrpc transport (glink)
> > device, which does not have an iommus property and thus never attaches
> > to the SMMU directly.
> > 
> > The actual SMMU clients are the per-channel compute context bank (CB)
> > devices, which use the "qcom,fastrpc-compute-cb" compatible and each
> > carry their own iommus property.  Replace the compatible string so that
> > ACTLR prefetch and caching settings are applied to the right devices.
> > 
> > Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> https://lore.kernel.org/r/20260408130825.3268733-1-bibek.patro@oss.qualcomm.com

Ah, thanks Dmitry!  I should have searched the list first.

Shawn

