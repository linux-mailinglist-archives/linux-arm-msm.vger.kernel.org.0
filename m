Return-Path: <linux-arm-msm+bounces-107343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIblN5yVBGoTLwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:15:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 731AE535E3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F31E8321307F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8C2306760;
	Wed, 13 May 2026 14:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fu4TBP68";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1l6nbjX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B6F311592
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681471; cv=none; b=CyFHsRGZ2vXjm3zBB966CeWZNPP4XXw0jSgMewpWrdmSrI+CiHBu6hbcesrkfqGR+WITHKIeHmhnKgjstDxkc6u1yN4RmQmNCNBjdm025durksRTNOI4TwJ6EOq+sOgYoGKK8T4fi6nglzpTuwSenNW7BuQzTMXyvJ9bLfzmzEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681471; c=relaxed/simple;
	bh=jWE29w4nh1ds+QkDLiiY5h+gfOiFbhOX8+ULzkp0trk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIxJMW3RfmP+XykNOaqAX0VL9aNe1vAFm0Cnk/S1FG1X0PIT0H7h2bc0Mt7O7nfgS7vIzZbzyjZ+Csc8QBsAO5uiUfTeJd4zVBMxTNpqYBlQnrG4L5dycW2OcnlDIPmbvWVWlcFaci6WPrRg18ZUdxbb2bClovyOJOml+YmsYw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fu4TBP68; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1l6nbjX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DB6EPw978386
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t8SLqEZHWB70SufbsgWahPyh
	ySxOVNvIZVdCxL+wGqc=; b=Fu4TBP68CspN4MooDApKnRAVoNX/vS5Nyv8FI1iu
	SoC9IItvqWaKJ3Tzu/oV1Xn/eysEwlnGJsHMceigz0c8rwALfvCgXV0qfvfbb5Bq
	+UfyTcMZVgrv3dmYXJ4HWUGcW2feri6u8cJur6w4dFBwnYSCi9k0G8NWW4Lya0FX
	KizohsduCHo3tSuN0e4M1JOVmX437KH4xWo6MsDkisvhJ4iFjb2tXQqJ59WM46Q7
	x8yV0C9c78lnhorIn2p7svinAifUzL115pQ0C9zPyVyvLjgdDkmnIrolxkHl9q8+
	vdYe6JWgyxDeEcRET52ofWTXOrG6v/uRjXm1d/KuFE5BPA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9vmga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:11:08 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6948c46e69aso7388368eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778681468; x=1779286268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t8SLqEZHWB70SufbsgWahPyhySxOVNvIZVdCxL+wGqc=;
        b=I1l6nbjXFmA9UmOUQIvgyDFN3GjTJSB6hAtsXMBJzKM+BQr1+tVg1ZjwEWakTAi4Rg
         Ju+RatfI2FR/YBw8QEpueqi66xhM8n3pQaNoLexGg8TbiShmbFsASOnaDTupTNGAR8sU
         FQXKoZvGItmf9QSsUnIDdkHwXRa0TB25R2eamzjvXprF4R1ne/aigiglPiYMMxlZcSfP
         yow9uSVdevzc9vfSx61XnljTncJdkQ/K0jSxdgmCgk/SD+KcNddYA7/M5I8tm3jUGfZT
         YkfMzvPpJ3C9ltgqqi+HEXoV4dxN/wmz0UYO6H6iW9maGICU+zDXUih0kRgqXsW4NAAK
         E9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681468; x=1779286268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8SLqEZHWB70SufbsgWahPyhySxOVNvIZVdCxL+wGqc=;
        b=oWPxsd+sp5i6/S6bNBjhxka8j12bzCTuRcuIh52im9ahWYIOCdOxZVnv7sKFF8/g4f
         c4BZ4TQJy4obG028MwJjVcSPaWwBXKXioASukmbEBDFp+H9TQOLkuQoD+LBpYaap397q
         DgjKKuHM5/pD3XoPLMtQ1x0ndPZvLelPXgUU/JXjAk39k4v1wprnu40pwpYiLk2rvRoV
         SMW/XvZtCnwXesFmHh2pGmyNcL05rk2t6bxfbETbZ7I2XhGoy01mtXcRbI+KJonFCJBV
         xGtgTaqv5IRqKjEaJ3t9G1Z2NZ0nkXb61NiHZKlrt8oGY5ywPB9Bz3Dp3oaK7+yGZzE4
         0bgg==
X-Forwarded-Encrypted: i=1; AFNElJ/f0zJ5LOvFfNvLR1YqbpJfZsn5x4GYoExoNqlU/DfXGHt+nmj2BG9YFhwltIb7nGwz+UaJinta6M8q6xdl@vger.kernel.org
X-Gm-Message-State: AOJu0YzzT5dIcYMjoEKaK4SuOvL2ys5ym36c/bSw+j0pfuPKtZSgOGKP
	GwEy0o0rv6xiInI+mRYfwEwPgcyHNY+nfV7e3K6O/TKINaGDmkYP7stcFe+QhvvMpFxTOjCkXED
	ZeXwZXCUrUsKStpaTQR5x6dLdcHvviRMK96PPoGk3d9wCmC8u9RpsF4FON2CmbPAlkwmC
X-Gm-Gg: Acq92OFOMyDnLHezzc5Zx/OcrQv2A7Z7yv/KzRVyBmPsYdd+Hd1EQTn6u6QgCoBtBiQ
	pxpU4SzfsxO4ucEs9LCujQs/nNQgV8abVS+GsnbxkarmfRIC8h+kUHTB/VGclhSSCguTYK8/UVv
	o8I6EJbmSfkJbbsW5rXcj4txRxL96sSMjtGUvmcjEoHy1Z9EjHE2i49rXUiVDa3vJbaPkGfqapl
	tmucVExJf+Sz+DIo3/bRMMpzUvXYxJw2lbbnesfKfFKyo+zk47qL0EP/JwJkHqP6c50aiwrcqaA
	XeBFzodp6kuyvscskkrs6Yk5VlwTf/NPjG7150jFSPuy5LkU47442rLVFFv0DStN7m2kIiuHhDT
	EoAP/LD+R3RXqu3rRo3bWAk+uFBZO58kbTMuhjDJgNc02WXzd2g9FVZsltXGTViVzmKe+qobHl2
	d3slIDWuVm4gDB+jw5NETZAQpRVnB8hLh6O6A=
X-Received: by 2002:a05:6820:1c90:b0:696:77e2:a83 with SMTP id 006d021491bc7-69b78e5df29mr2043259eaf.53.1778681467839;
        Wed, 13 May 2026 07:11:07 -0700 (PDT)
X-Received: by 2002:a05:6820:1c90:b0:696:77e2:a83 with SMTP id 006d021491bc7-69b78e5df29mr2043224eaf.53.1778681467404;
        Wed, 13 May 2026 07:11:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18ef9sm40743831fa.8.2026.05.13.07.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:11:06 -0700 (PDT)
Date: Wed, 13 May 2026 17:11:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: Add support for GPU Clock Controller on
 Shikra
Message-ID: <ke4fzofnylbxtigpmg3pby67pu5kvlut5kbb5nikr5yvpa73rv@gsmhpb5s4qqw>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-4-5fd673146ab2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-shikra-dispcc-gpucc-v1-4-5fd673146ab2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NiBTYWx0ZWRfX7sSuVZilbJiK
 n9eSvj1Z6QdHFDa+9aURQMbomc+DpmRDvMlAzsEmnZuXf4kdeMSL2VkVLxXVpdcUie2GyZ/P38I
 PQvE1gF8KvKB1/kt3lhA9tK55vcE1GjKXjY1aZt6QuS4g+YMZDKXw4oYW+Eqs+QACkF7iA0vSA3
 T3pAsMXM7Z6PvjCtQ/VQDdWM6M67LWKxTSNcFeKWi39eUv3zRlKElXONSmgT5QX89W90GkKCQcN
 Qb7zdGtsJ/Y/SjEi/cEbauzZc5JTfrORlm362gpDv5fLPFWjg6GhCNgL2Y8TKiG8S8kUCYItM5o
 QebTqQz79h516z3g2lUdnWq+Wl1O/ghs7ef3JE1ADXv5hmOXwKP/wQVb9IWjr0KatW3CKSrzmC6
 K59ZEkGhAfRT/Fh+0mxyPv+NCxXDZggOUumTsOO+XTeMzLDvrHOyF56AacJ82S7Gd/PM4+sK+nD
 xE9tvmi6A/K5LeXVRYg==
X-Proofpoint-GUID: bTmNfnZuxVGy2eTdRA3FbNQFJ1Kwd0RW
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a04867c cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=qXpo7wsCot1G_wR8kq4A:9 a=CjuIK1q_8ugA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: bTmNfnZuxVGy2eTdRA3FbNQFJ1Kwd0RW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130146
X-Rspamd-Queue-Id: 731AE535E3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107343-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 07:10:39PM +0530, Imran Shaik wrote:
> Add a driver for the GPU clock controller on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |  10 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-shikra.c | 406 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 417 insertions(+)
> 

The same question, can we use the one targeting Aggatti?

-- 
With best wishes
Dmitry

