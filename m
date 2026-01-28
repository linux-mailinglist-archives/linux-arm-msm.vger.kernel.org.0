Return-Path: <linux-arm-msm+bounces-91060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON9DCRA1eml+4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:10:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9818CA538A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A30783009B1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1FC2D1F7B;
	Wed, 28 Jan 2026 16:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nID9qwAg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTJKtW4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAA830C60D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616408; cv=none; b=TdW7nsq54qTBf6FHh+Q9NhHR/M1NAYtfg8nLZN0Ehj8IkJoFycocHK2YN5abU+iMoXDmMloezdSpCXlW3EwAIDArF+4yghCXsoCGF2Ahw+IQxPq0grz7rMP9f9sZbCjgdqq/cN3F8afYkiOczOWhtPdrtngnaPpDG7Maujf/Y2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616408; c=relaxed/simple;
	bh=VW/qc4m7QYnWq8rGr+uR7X5ZxtSgkDmixXSRRjkvsXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7SMPYdZoTu+RYYxjiQh37CkTvs6/KlnfXzUhVMNBKzI6i5k7VlXCWV3uejcx4h5V2s0HboqAmd4h8nXIZLWIjYefA+AAWI+2763OiOymXaasoAhlM1Y6HMxFnhENDTQ2bgW578R4DC8vqFFnB7MQYF/Am9AUUQA9COjpVHceDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nID9qwAg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTJKtW4Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFv6JS042038
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XHLifZ9wwYI+BPtJUCR9DVIO
	9WGqye4RlpIupw/JkLA=; b=nID9qwAglbIqC48REmyIsR5BGQea+I7x+m84TSH+
	bH/L/m654Lj4V0/Xyp/5QMa/G8WfZUw0pTjOTK4E3rVFRTnDOXW6U1P8dl29W5rH
	Yj7MHAnrV9MrcBDc6QUGZLtCLqUHDJFax8v0CmdPSjEYkCvQQG7e5G1CO02ktqV4
	hbxK7Fp6MWJJL3F1CvoCosHwKXfZsCCgIG6XH3tzyD/JtuxiO9UQ5d2KSXPQzx6K
	HfWMCEumtHBcKI/YQZFDLJODITOHF+acpXVhZrPPHPBCAB13LkYTNEsjQaKVgQ6q
	uQbDhdy1ns5zwTvOCOfbhYkwyGxQVTMototqE7Cv6B3zHw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355utfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:06:45 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5663cd97317so6796622e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769616404; x=1770221204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XHLifZ9wwYI+BPtJUCR9DVIO9WGqye4RlpIupw/JkLA=;
        b=hTJKtW4ZuWS0RorGXFyG3r3A5Z4RBm1+EN6OY+vE3tuNUjp4vQ0LDFwKo0NjcEqXed
         XzICKF+K+0UDmCYz44+wdXLcfz+ngsD4DXmiUYPcmyVD2ywxttwwvW4P9mgTq0sI+8qA
         6BxHI/Id4ryJkBGoUNjqU3+s5T7BFlCqGNQoTJhC+cnL8LwOGTbk6bhjmYslp2Eah518
         f1gdfWZxrUtrmMF4wrOmfENsrsrbicwusiXal69iF1M5whaRrw/ulVxQy+MH01bjfhP0
         plp1PD59Pg4uaMNXM2N5FORZxBFhRS0N98WBZp/rCHYxNLQodaZCuFrxP20Xr6C2xSpC
         c9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616404; x=1770221204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHLifZ9wwYI+BPtJUCR9DVIO9WGqye4RlpIupw/JkLA=;
        b=j7ZyRsybsfL9WjsiUjB+sOYqMZTMzv/TMCf8fzWymwD+fOUwtAdBrVQlj8HaVNusm2
         ygoO2W2hEAnzZWEEpkjYLJMN0uDNFjEAM1JXwSMHqtp+kOcKtw3r5qougDUVWlhVQxup
         LpR21uGTHkgLYKryNWwVoVt7mEuqj6esDQMFdlhywOFbULgsiZC037terL+gd0XOFKEc
         luTK7ey73VIgSQNPlV4izCXF0dwZ1WCHAockQ5YH/LSnoT917tNdttV6MsBlGfQXs/BO
         lmsVL5EKRY79vi2fuZ/ETMhGsEgqGXCv0vGp71nqW8NSysh5UFzRuJI8woRj7NPIbeWI
         rBXA==
X-Forwarded-Encrypted: i=1; AJvYcCU7rzgvtynk02A5PnI8zegKOGrGvVTv5Tq1Zut6SM85T2FIHSWhHF42dJgkKEHzwvXxp4vSW9YMoY6BOCmj@vger.kernel.org
X-Gm-Message-State: AOJu0YxlOpIyTIVk8MhdH++jBvHEznhvSSrUHxQyKTkMcYBw2nbGfgRF
	2g+bBjRHWIqtyREIey9rvp19hNJeQkAqUdjEz2h11rC9qgsJ8c5Axj4/0Z0rKGVFPLWTCjk/LTv
	d2ZFkIc3gLpPy4S6ihAcTOOo5WCxXS3SzSQd+/ZUrzQVUOXZ6X4BbqM/y36ST2QUn7llv
X-Gm-Gg: AZuq6aILMi5yiq3KreCgB/lZq8Gg0oUykUBYUmn2Udb+khfy7xJQ2+/HhZHCS9czfxs
	w7NaHmwRz2awXhyakSGmMqg7STfriQ2OfnyazaZ+d0VHg1ZrxLV3nrGf2U+0HEWbNlz8MBVPe3E
	QH/3Q0/N/G3w5EYJYaT/1lgHge+r+NQcXF5/4JwXJNnA4iICASXm0L51jbP/bTitbz45BHpHKxW
	C8mRd7KUbo8waCXw3ji4H/PsqBZPHtCyJp0ZuqT8dmS2UtggJCJvaMOjDsAJrBYWN55smXtX8fE
	zwke5gYfs8OKXGLZpUZhOlH+BNAZLWB05pGAYS3pfkJ8Il9vpd3iCULGThmNadXyGHS5O9jMN0p
	K2GXcCMjAXtaw2fNVSZqpw7WbkH8lHJjJSUqpHpm8NrCixwf8WdQQ42SeJGFaHKZod7p/f8vGRL
	+57S1UjhN5mzviDrGC80lLKpE=
X-Received: by 2002:a05:6122:210f:b0:566:24c0:716b with SMTP id 71dfb90a1353d-566794a81b7mr1704490e0c.3.1769616403833;
        Wed, 28 Jan 2026 08:06:43 -0800 (PST)
X-Received: by 2002:a05:6122:210f:b0:566:24c0:716b with SMTP id 71dfb90a1353d-566794a81b7mr1704396e0c.3.1769616401913;
        Wed, 28 Jan 2026 08:06:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625f6c670sm4378361fa.32.2026.01.28.08.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:06:41 -0800 (PST)
Date: Wed, 28 Jan 2026 18:06:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 vibrator support
Message-ID: <w3e3weyxdp3bi6mlxa3hvtmvbtuyddaj3hfn3urhixtliejhsx@h3wqvscon6n4>
References: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
 <20260128-aw86938-driver-v2-3-b51ee086aaf5@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-aw86938-driver-v2-3-b51ee086aaf5@fairphone.com>
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=697a3415 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=7WDzbpTNP48-5iC3XZUA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: PuD6_Zxl9wfy-6fyUcR-CKThSvS3Qiio
X-Proofpoint-GUID: PuD6_Zxl9wfy-6fyUcR-CKThSvS3Qiio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzMiBTYWx0ZWRfXxkFBz03s0r4E
 CEoUAwUyThaimIx/+6wZk3L9fET9wMc0Kj5dG7ptU4VnJ2NDRQlIT96kQBLIFrdp6EhiiU/pJ9x
 Cp9BsxDKr5ulKjndMfBgLzMdiK+m124BpFYs7FITpy37T3cmzD1uPeDZp9KTMjopxGDLpMGPAgd
 p4HEflIQvCNXcwR8+6eQ2rs+AT0SumD235zzARdLZ9w5gif+JHeE01MLlRgeoseGiuxuD7vWJxA
 AN6jl/7EE+8gdwDOft2wUYJ5mPIAI3HS5ISyIYvCAstkspZl5PeOY+8aGrGfPFm5GDLKdqHOitb
 CdmAAKewICLGEQGlMZLgtBmGlpe7Htf+E6HXciI/zIYhCljvwPtw4gMbIAnfRJTp9lzw9V86UGs
 0Df/4dc+cZ+NwBV1JcEepkLEfA7ew2bNAG7szE8AVyl+BEcb+OUnu32UJPomYzmKy8+Jhx8E+qB
 jiWOphxGCgYt5xtJzJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280132
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91060-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,fairphone.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,fairphone.com:email];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9818CA538A
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 04:51:15PM +0100, Griffin Kroah-Hartman wrote:
> Add the required node for haptic playback (Awinic AW86938)
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

