Return-Path: <linux-arm-msm+bounces-111605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZTKWJzzdJWqlMwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:06:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9F6651982
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:06:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nBtg5fYH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SplEZb86;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111605-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111605-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A90AD301BC26
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438F92857EA;
	Sun,  7 Jun 2026 21:05:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420C30E838
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:04:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780866300; cv=none; b=JcdX7ml85olmOJ/mnukjbrtel5vCd6BIT7RcRoUTMLmCML4Qpf5rt2k9/6nr656bbVKamEuUfbSCRfljB8V3MNqLRPG6idJtCvWtvc7KHO4fVCGcNGDFSDfiiG9eTrVWt+MrfVjdsHZr5kGvEDFRCqqlh+R+MubUPdxsqYp64bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780866300; c=relaxed/simple;
	bh=9zR5AOWHKt/GYerk6Uqs9WTURiwzh2mrCZp0c4b9z7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VA/NoV1WAyxK84u8+gX+LvqfxYeSl4MJ6Fa4J/ssxcF42l15A8QSNbwgcwNCb+XUqWNxUUCPNaTOVdX4tpWo88o5pVbb5D+rkhbDXWJSxJ2MrzCP0lGcHtKKEpYbPJwV60rKO99j9aacAv/piap4AFE0Faf8kUFkgbRRXu3Y8/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBtg5fYH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SplEZb86; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El3YS827195
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wy/LHbrdpEkRnrsqrOcU9s26
	gNhiNWxa1iVHyLEUNxA=; b=nBtg5fYHYO8wewfI6r2Wga8ZZdTZ2eFLabsxSOwZ
	O4i97tmZVGOROFS5hwz/KuwBYfW6sq2uNrvkMwTXXQ3pWbRZRYWc/ek+M8+y01HJ
	vVHqD3MAIcsEPTCAsWURTpo1SfQshB5TBYBiCxua/UuMHixmE5WlXQfnT3fwrdGF
	acZwoYSNWwwRoU/Ptao03Wqs9XoLs6x+pjj77eCsC/kGajK7CUBTK1ZP1gdIzSi6
	2zJbkISv10iYWGdg32s2h9dXusgjFVOnFiAw44h2ByfttCJ4tJPI9aUNKZYJM9Lt
	28ZqF51u50ItyckTYkslD74jNOokkt6yE/osS8Pknh/RLQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6cpjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:04:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5af6d1a2c32so714346e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780866297; x=1781471097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wy/LHbrdpEkRnrsqrOcU9s26gNhiNWxa1iVHyLEUNxA=;
        b=SplEZb86Jgi7JbisixbMnbrbEEXG7+mFdlpJ2ErQSEFsRhuMqt37tFhxJKI8jiL71z
         5y6fO4pMJt/AvauAQQ1xiIq4mgAgPB9fHDJKlr6z9HLpBO0Zos6vLBBJIWes+HNYX94h
         gCRhe3BiH/XM0HZwY/Fm9GTSg+ZxVOAHcBHPiGFPlLG4xtR2dpuhUH88Aa/pPxzyCyKX
         uxAFcEtqhlP/hz/lcE8lu7kmnyzib6/X7VwwWki7/066E5eAQBj99DxS1kbQ+JO9TPsW
         0o7n4USPVkMON5P89PNG4/+PUsxq28Z0LHz9/1ahZNxAwKMZEl9syP3jMDw5n3cMDC7N
         T8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780866297; x=1781471097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wy/LHbrdpEkRnrsqrOcU9s26gNhiNWxa1iVHyLEUNxA=;
        b=pPYwA6GcSF7+3zyrl2mpj/+oM5q12l54+OlopBU706HtWFx8WZ1lPuqjQb0FIGtEHH
         eNHX7TR/h+jt9q7FUFQGR6+QhEzjBbzQU4/VQ/O7aoRm88x481b7ognyETmdSfkaRLvg
         8VLsHDo4siIl9dORMwowOIy0QG/SOxkY6SWxrdsoFuw41LS5/pZ2R8/clDztY8QTAe+Q
         NbCSwFcJAU0NVe1wOscWUhMdVSVIJ93MhTVXAc75maewYivrg5ar8rqplnP5bNrt/CAj
         bQXpVPXdxrJpX4tZNfY87VKdC8YTQ7q9b55H7la2w16YLLFFDgpJ6le/qU3AcaMMvKlB
         Uqsg==
X-Forwarded-Encrypted: i=1; AFNElJ/bNXxrtMNuGu9OU+RNbN9OOuKWwfR7b8oRmBzgLfhJit/qumYDIZYAylkCEkt+WRWrnqlfFCfS6DRAe0pU@vger.kernel.org
X-Gm-Message-State: AOJu0YxagzOIrGfhEwYdagcUS9GczWsI+nsFHmaAdflBEqeWQo5GgJ05
	nWaPq8/LNjs7W7iZ+zZZacb0Sk6vWiBeSO6A4VSC5eG0AgB8lgxWG1/0tpNIdxTfuWam3NqzpbZ
	vVHzYEvKinOafGSbA7GY1mGxdqJNOuN1y11lgjj1oPYUucvVbP5+97LoBz5yBL9CQQo4D
X-Gm-Gg: Acq92OFDwJaeGDK9mBoLj5yo1rRNi5MOkhU99P6KUg7XsZjP0Nl7pn4Ah4v0RvKXvfu
	EkmRcYSaSQTg2korcZajslFVC1ivgAHV0nEzJzRy08fWYRB3m9MYIOAkpM1UnUcTiO2euIx6rd/
	muiHkGymuP4chD73KMLcj9IUoKdEmCd2+A5OUqQPhulUBaCLDq36KC62NOQ+6bF7OPlGh5IGPTN
	biT1L8jBA+iaq1Rm961Uo+WajISX6rE2nb8RoO7wvHpcXIHyzPtKsF5411CMYwrpLnSo8Tgp6PO
	BbQPsYLgnNlg9FdS7nSDp64BOzZoQjxW5qO6/Xrl/deepxa1aoIe3CF0/x2gEE7k09lBm4PnVv8
	7d5RAysMt5j4QVbl5RQ5rtE/EpaYYqniE6v1bbgZnHd4bqCoVtmBsq1xuDCZEimDMv8tvd6h3Ww
	3mgHvZ8LednbPhxxSHoEGpKyeIfNzMhayQk+g6+8ZR5vGAhA==
X-Received: by 2002:a05:6102:580f:b0:62f:46be:8318 with SMTP id ada2fe7eead31-6feecfb41e8mr6467936137.6.1780866297495;
        Sun, 07 Jun 2026 14:04:57 -0700 (PDT)
X-Received: by 2002:a05:6102:580f:b0:62f:46be:8318 with SMTP id ada2fe7eead31-6feecfb41e8mr6467929137.6.1780866297141;
        Sun, 07 Jun 2026 14:04:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990d37sm3343521e87.70.2026.06.07.14.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:04:55 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:04:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        Om Prakash Singh <quic_omprsing@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, Olivia Mackall <olivia@selenic.com>
Subject: Re: [PATCH 4/4] hwrng: qcom - Move qcom-rng.c into
 drivers/char/hw_random/
Message-ID: <w3nvohaf7qvfwssggdhoqogwtcfmucfzqiuihbtwly6iqa2i46@3tybaiubfn4q>
References: <20260530020332.143058-1-ebiggers@kernel.org>
 <20260530020332.143058-5-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530020332.143058-5-ebiggers@kernel.org>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a25dcfa cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=b4jLiGy6nbOHC2eZWhgA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxMiBTYWx0ZWRfXwjg+MRLILgbD
 0A34jQCQQAHHJ/3y7xr3T7WwrUmISXhKgr5+Bf57uF+L8OUMEG/56p2r2O7wgM2zIyA3HoXJjrb
 zTawEZWjqnrxwemoE+mPNOgxpUoDDNAr23nlB7h2e/X/c8LSHt6QQy9qrIKj/2i4mr8PTmdOqgh
 DT2L3AE3f7qIip1Ajb076wM1V9JxzyYEIx+jzw3Mt0lWYBXfifky/5P1bZborbvmALpbZU0kTQX
 6AQoVD5bK1KtGWX8XsfftQdxVflgFlZCdvnJofcp9nvVh+zaiIPvfnKxUSo3uyfJIk+YoPL9QIk
 NslONPnCftTXivcCt9STfKuRwXNzF3t02LRpiYen4LS0Zr7I09ASZK8OaRs2/pSbcXFTkG5ggM4
 oIG0HiZsnEV4aUkR1j1BbPYLp+5kYA8P7TinelE1AfBxWubzewsViv6CcSCKDdz3SDxfGUnv3OM
 YzDOW4UJOa0OUiidAUg==
X-Proofpoint-GUID: pv9NUzCMplh7iOSP4athSs0A8w0wPs0G
X-Proofpoint-ORIG-GUID: pv9NUzCMplh7iOSP4athSs0A8w0wPs0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111605-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB9F6651982

On Fri, May 29, 2026 at 07:03:32PM -0700, Eric Biggers wrote:
> Since this file just implements a hwrng driver, move it into
> drivers/char/hw_random/.  Rename the kconfig option accordingly as well.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  arch/arm/configs/multi_v7_defconfig           |  2 +-
>  arch/arm/configs/qcom_defconfig               |  2 +-
>  arch/arm64/configs/defconfig                  |  2 +-
>  drivers/char/hw_random/Kconfig                | 11 +++++++++++
>  drivers/char/hw_random/Makefile               |  1 +
>  drivers/{crypto => char/hw_random}/qcom-rng.c |  0
>  drivers/crypto/Kconfig                        | 11 -----------
>  drivers/crypto/Makefile                       |  1 -
>  drivers/gpu/drm/ci/arm64.config               |  2 +-
>  9 files changed, 16 insertions(+), 16 deletions(-)
>  rename drivers/{crypto => char/hw_random}/qcom-rng.c (100%)
> 

-- 
With best wishes
Dmitry

