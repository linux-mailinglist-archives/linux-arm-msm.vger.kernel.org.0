Return-Path: <linux-arm-msm+bounces-106948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAVeBo/eAWptlgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:50:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 070D650F511
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0ED773014A20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046E33EB7F0;
	Mon, 11 May 2026 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4htGWLe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iafbDEC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC468C1F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506818; cv=none; b=tjuVielP3ce2tDODL44r+Lic/l9Vw3Wr6Copngo8YNZOc7pArvzfj+0WaeLhLyVXMX/aOzHNpS0pgeakamlaL1kfMurGSFe9u0TRhrko+h89VnGlRxkZJuoxUAYN41+532sjvdlWFzNfXhl3AYdIgNG08ncfjN6D7EGggwVj8+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506818; c=relaxed/simple;
	bh=iv7kN/9CexyaXWUNLh2lz6maV1d9S2gQPdpq0kjz0Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPDgV8iTiC+lREDO3lG97M1fwUV98VYoc+Sa0ZeA+Lx0KMpw6Vp/uBAGaKp5Qt86N0Pn9AZ8QmyWvqxwoJ8DHCXAXeAuMT+eq6JJV6huAXwDPu/202WoZB/fqIv5XfYewrEIJS3mWQgdhNEw/XHWFSNzSSGWVmst/cNq4ev7adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4htGWLe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iafbDEC7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BBIOgp1344436
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5N/UX/mU9KJ4wGcjR1nq8tug
	EB70qgQL0Zgb5R0yn0E=; b=R4htGWLe7Z3fNK+VGKp3RVMO//4Gq54CK1c7eXZu
	aUxeBYhdujeIgdFC4dx1rPLM9sHWS/IrRKfyGxfAR9K27yFtSdhQZ7U0Gv/vogoZ
	lgKFPJUuOTr1e+6o5ZzO58MDZEcMJV0y7zVQvmxYOwAgTC2NXfzLxkQ+XCKqUQBy
	6XIKD67zwyFzmOp/zpJqmNQPA8BTEgOtPenJIpMAxDlKuBCyWFCbYJbgzcGLgKxT
	SxsPGZ5rDXjwhXf1pwpMqhBL5jOdGuiAU51tsK1/XBGCd7yaGSrjGfZ6B+ARd8E+
	Yy00iNOt/nR7x4q1DLdGTnk+ejgMisK2OqSAy0R+/nIfiw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3e498ems-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:40:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6347ed78bfaso532501137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778506816; x=1779111616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5N/UX/mU9KJ4wGcjR1nq8tugEB70qgQL0Zgb5R0yn0E=;
        b=iafbDEC7IGqavh8QWvvSyBaJVNgv/7kgRDCJvI8nfYLfyr+SNcMcmKvEuDEdHSe1P5
         jcAFVoTZ8oKD1d73hMwS9TtNSsrSFhTSfc8Y/+lfxnEO0gkOIxd7KaoJ1mTms3i4Mi9c
         2HKGSY+DRgLT3+XAA5L/rlxkPSIGzbCE11kj4zeYRI3kjGH+rXPZ/E15zXkaCEPXqFwx
         SkmqF4OZGuau1EBXGni3IwS5/1dCR5Kem1d35/M7g5hlioy86nbZNNEnvKr7ifAcMjd/
         nX6urkJbRZAdTToz1QofrDLBuEn6Ovl6NIMkB22LLZkJWfSY0wJH1Q7a1oEbamYHCklz
         baDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506816; x=1779111616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5N/UX/mU9KJ4wGcjR1nq8tugEB70qgQL0Zgb5R0yn0E=;
        b=LEIs2Wsuc4IPfrg9VHVbG+0OmSbKVodEgKMuieg20S+Go5rKJTCXQCp86Zfti5uOAf
         oJ6k6FlglGfGE+gkjrlwmZd+L7GeuqtT/cCOZlaKtem8Jx96h4kyT3RinoG9JuRMsbks
         FqVtGyX0FszodzzDNX5vHxj5G5O/7MuFGL0QxxaXSeqdA6uzeKRgPJ6FlO6EdV85mg0g
         jTerfuCJsNbkRxvJqLtJR2SjnTSnLHpleQQQbXdNhkIDljwukIrZl+eCBeR9vHXrulgg
         8GiNKwF+N2dy6lZio3bH3d8fYPUhJlG6Z0DZLRhYnRZ3jfsUoiJ61DKggbC/SHrlqd4p
         7Pfg==
X-Forwarded-Encrypted: i=1; AFNElJ806Jgbo7GQylFcY7SHI6QMAy/36UXWegelmZCiRY6PK5lWni1FUUYWKOcEELbcpahQGvJLXHNcZXMTi/nR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh7x1mNY9L8ifAAHNeTYOt5BtkxK2tzPFIcyr/s1fk6pCXqJ8T
	PIqsbLXLVcjI5KhJwOVE7Jvw7LLfqnV49Bjs+0TZeIu26XjEMU+l1xakmw8jzu1BZR0iwjS+9Q1
	zh9gvR8whYp6x7Qikb30Tb19H8Y+4gWZG9y4E4cqXRhHz5tcndDLyhqOrrpi1GgVyZNMI
X-Gm-Gg: Acq92OH3/hArWwcYCIDy2vppcERmpgSPhxnjtZf5oTdOHJm6j0KmCby+uIDPxQFNuW4
	nIQ25sfJCnbGKKfhqdE+Kj81Doz/nra/cf/joORC91vo2hD9U9l6t6PKG0zNcOuArDbN1cAu3I4
	VuQBZ3HqezKYXuQksyFM0ZTVkvAGyhbc8Jgt8nXGU9Kcrl9TiXFhmGlSt3tH47SALG/XlyhopgT
	a/c3dES7jb8b1V6IfusEBLQf7aXHFRdMDPdhwopHAKUkx7pdKmKeG7OHVlgT6mQZz1gD8cVzStC
	sG1gMu8oQNZxzWU6UK+CSaPkszS9LHzyZmPSUVVfKGdKh0FCnRWPmbF9Oihh4OKMA2skhRz+X9m
	Znnc5PJlD8uiAL/gp2rqzrA47ib9JK/eWPnDi5Id7R3NEe97AmzuGtv4XpYqqcOPU/9Wv2fiFgy
	ybHhn5QPouFi2p9LdZ7ZpCDL1RxSA2yaUX4Wk=
X-Received: by 2002:a05:6102:580e:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-63141fa0939mr6281629137.29.1778506816051;
        Mon, 11 May 2026 06:40:16 -0700 (PDT)
X-Received: by 2002:a05:6102:580e:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-63141fa0939mr6281603137.29.1778506815171;
        Mon, 11 May 2026 06:40:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b2a1sm2652329e87.78.2026.05.11.06.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:40:14 -0700 (PDT)
Date: Mon, 11 May 2026 16:40:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v9 6/6] arm64: defconfig: Enable Qualcomm reference
 device EC driver
Message-ID: <lep27mjuw2kv642s2gvlmbro6zad2vvwt36x2va7v3juoq7lzc@b5kxiy77oqgo>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
 <20260511-add-driver-for-ec-v9-6-e5437c39b7f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-add-driver-for-ec-v9-6-e5437c39b7f8@oss.qualcomm.com>
X-Proofpoint-GUID: 775-pC1QvsOfak0K8htrIoVAZKK3oLqF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1MSBTYWx0ZWRfX1G7iiMMuFXNG
 0A6wvQHM9ChXHtWkA0lxVv7uzEaLjPHhiOl6phAuYAN2OuJ22jIVTg7JgcCyU5iKV3ZEfDThPf1
 b7U/FK1npT2aYzFl84D/tziH85z1GXpHED80b+Y6m777fAmL6QxaINjIuQibQObADkYrmjuY4nb
 58E1bT83bOqHKDRp7s7/kcHrtUzcZFaEWqXC72dx4Tz2BNho+IjnSSp+59lf6q6uErOuJtUsy9N
 AocDzBP6dicAA+Rcj0epa/nEVhlcDAnsDkwReLTEFDSmApf9a6TvRXvdgkLJfAY0NrM6BaVlH4L
 HaD10dHh2/2SIlL4mJJcix4jCVxWFi7Yx1smiEyQcyxc4G7dHeGN2w33aXz+redTBDa+KTPrjqT
 VPVwnWiAt2FJbEgbjTR4mM+nGa6vv1hIZ8X49kI3Ze1f3BUItXxBLRXs+TPMFyTOxwXojIS9uNX
 IRgHMPfciLRHOmafMmg==
X-Proofpoint-ORIG-GUID: 775-pC1QvsOfak0K8htrIoVAZKK3oLqF
X-Authority-Analysis: v=2.4 cv=Yr0/gYYX c=1 sm=1 tr=0 ts=6a01dc40 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gxucJjpxkCO_kLWZwBcA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110151
X-Rspamd-Queue-Id: 070D650F511
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106948-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 06:13:24PM +0530, Anvesh Jain P wrote:
> Enable EC_QCOM_HAMOA as a module to support the embedded controller
> found on Qualcomm CRD reference devices such as Hamoa and Glymur.
> 
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

