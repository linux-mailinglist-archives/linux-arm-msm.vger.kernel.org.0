Return-Path: <linux-arm-msm+bounces-100468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2H5zEqjsxmkIQQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:46:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAE934B402
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B48130E03C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8790538F64E;
	Fri, 27 Mar 2026 20:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCBt9pCx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCXOnD0D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051E637BE7D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643618; cv=none; b=lGPKJ4F6NDrI8pZB8lUPlyHNIemLCWIHksnLjoZsGlTjQg0CHUE3iL7VzmNt1PHiC4IIDksjNX43n2t+TEXJqLKLfDbe+BV3AoOmamIMoi+kQ3X9VXXwVY0JRFOFJ5X8+EvJxAdets/XzyFGrVVzhOVQyEBVU3RE2GzLe9T61A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643618; c=relaxed/simple;
	bh=keFw1/XjbB7jwqX5zESU+f6p/vJiLEdwKlMIJTnF7eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YA/4/nGyQ1yCxpmcx4VBsdJ0V9RO7teeeZkXCpkokxYlM3rNN4dZ4epUUZYGttBs2aO9Zvbn1MN+9macHCbDnAPEv6PBsYBXQGQ+E3aGfcMJENJo3R4iZzc900hBWbFSBdGd/JfURqsPVuQmxjFHJS45+5XY/QEKpJfxJyQaMGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCBt9pCx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCXOnD0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2bU53659031
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rW0LpKAnyyF0Y3CdhoPuNAvMCsetS7o2O7ydNPWwqCs=; b=kCBt9pCxn0HTwQMA
	TxAnHiB86/KNNPHCKrXrk2Ve2IanSLoR1ldkjw8TYfMzF+LgVjMZH8UtBBEsZtv/
	Pm/HHxwS9qGh9uCUGRLIT7xAr7DDAzEpdXu4bFT07etq+qV7i1aObdkMUvWXj5Cw
	TJySeAcQCr7J4Lo8TkUIDN6Hvrw+jhEUfeL96VDfAoH+g4y2ccDpiw8vUmyfucq0
	owklJbFB16ns2kRSZYu/Htz2gkW8/qXeVZ5b96WnIf8Qu2ZyGtR4JPVOSHSJrnZA
	EgNaQgs6dsmdxLh7INEEEDmRYk20/x4w73GB5f1eq0n07JAVU57VsfO/XUqPdclS
	1IQ0bg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn12vku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:33:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a108d17d2so74017416d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774643614; x=1775248414; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rW0LpKAnyyF0Y3CdhoPuNAvMCsetS7o2O7ydNPWwqCs=;
        b=TCXOnD0DkziihurKzpZrLPkciOvVhgP7TF+XyOwidQWb4oKxLiuKlF0Oet2nFANu6H
         ZGaCm3nIEawlaX6oiQ8IQjWsgSLXrRqkKlfkZ/yijktBbHxBKyGrIT+Kqozr4I1K/htQ
         yOS1dN5s9lS+1E153Izf+kiA6hPSCKIEVMeT0Vv+x9TzdqJxiy1uTsPjy+BZxqwAVDPX
         DO6913aindk56r3Pu0fLb5s+5WobZqj3yqtIB6SgcGy2m96k088Tx8yYNyGLOqkYptx9
         LsXq6k7k2NDczq4exqORITuh3s9mNnItpJxJtexzyS1xxY9t4EKw3w8EVVqfgzRwDsPq
         izeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774643614; x=1775248414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rW0LpKAnyyF0Y3CdhoPuNAvMCsetS7o2O7ydNPWwqCs=;
        b=T7r/C5k/hxU1ktMuacgKIMMSjTiB1J0sk8is0d9oaIE0Dha5xG31f3xo/X1ynVuSf/
         sLkx8QDa3xurcrRjifw2RqG5DfJeK8i2XHDvS6dC0CnKhQji9wetQ/+I52QbBgwR4x/O
         nwGHvDcO3Djq4hDSM7hVDfBH82kZvop2Fj2mxEW2BVceM2V7AqYxkK62yvn80AEOr8EL
         o2/+ornCgeemF7wqRiNUFBRUxDPjzlUieyQ/YeUI8kj0eV9RRfBO+RVbAWCkKRaCRnJ5
         tahx7wHhayRYngVU/9bhXL6XBT8l73cP03aa3GR/V0v0HI2uY2hLKt4WeiNpKqxdCUSQ
         Fg2g==
X-Forwarded-Encrypted: i=1; AJvYcCXr9giD1B5HidK4rVVYHR+v+kktU7TcC5PTqkT/9wrk1NdACjYRnabEE+wmuwcWwxNFxnkGTtRdaj7KMOao@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ2vi4c+7Qcd61p+kqDi2/vX/EF024PaaI4uD4aDLq5PZlaORs
	89WFU+TUaivcMvmAQFaqqK9fHP8/bnkpHDIGTAvewGM5YINporLGue8bRC5jH+3RLIpk4DDmMOB
	c3LdP5px+p5zWDMqVAIl7rPUtmH/aMmWEKOpOIsRk8JeQtizlLqBmxDU9Iui4u3hxXHPn
X-Gm-Gg: ATEYQzyp+ur3gWoO2vLa8kIMGuWtJZjUFUoubzxf+MiydpePBsAIcLsXr03F9Zy4ltI
	ufLa6ncgZNsmF4NkulcSgafzVNxpv2HgxWTCttdUI3nYMfWiSuJPnuiJ92mP5LvFepsA+UYwlrU
	hDSelzy3ns8kG6cy4FfYH+f6sKj8EGkRHz4x7t1xN5aDAwrKnLyaNHeg6kB2tnABAdppfYH2EB5
	iOySkX93NvESu0YAb//UYmrBNolxbEOtSNW81m/A96Du4CV1G17yCbBaFjlzjjAySabd/MKFBkp
	KYAknRkY/orEB+HO2p6oAnzgDBL9ilN24ddT+G2o63MUndIWIFbaYARDXnAS6pEUH7VU6Hm0PAJ
	cij0YEBSK+6+9HDT6PkG+s/qHjurGkhs8F7Tf/KIKRwobC8RRZcb9arIPJTxH5he8jFcbmSuBVQ
	dvKK4ahj9J0w9u79KVG+d0W9Q1vHwovJ/j54Y=
X-Received: by 2002:a05:622a:15d0:b0:50b:28b9:b0a1 with SMTP id d75a77b69052e-50ba391db58mr53731351cf.45.1774643614346;
        Fri, 27 Mar 2026 13:33:34 -0700 (PDT)
X-Received: by 2002:a05:622a:15d0:b0:50b:28b9:b0a1 with SMTP id d75a77b69052e-50ba391db58mr53730961cf.45.1774643613843;
        Fri, 27 Mar 2026 13:33:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1455e14sm6079e87.64.2026.03.27.13.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:33:32 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:33:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/7] MSM8953/SDM632 rpmpd/mss fixes
Message-ID: <lv2ali4zgsfdh54yd74cx5mvec2z5kg7v4rkayyukpjt6juyft@vzprb3rvewkm>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0MyBTYWx0ZWRfX9FXjxVVlLjlr
 /Nd26neX2b6oRPdeXozeUTq5nGKE+i+V0uG4vZcN0KA8akFcglp/oobs/YNZs+YSruEC88AwXEZ
 36JOghwPsIIFDGnpsGBgy8yBrxDAHLUv3DY/h4Gfzp9bSpmPeNKScwg+KxNYKGBE2KBWNCilwIv
 ulHB6PPslX43kMnsQQ4et141GaVqE6rcc5Ptdi/xMzYMoUsO3VTdBwomS27U218+htN/8zbZ2UE
 EE7Bho3Xp/S4CbE6AD4/xMrvFDCkBsf1ha0JX504Ptqcm1/w3UoC2sbRP5JtJVNlQVt+vcSwbXw
 DDg2fojjyEQh/Bue0Doz4dPCG28ScmjpfOLoUJoOIJng5ophpCAZGRUTI7P16buAA2K3bg/g/LI
 zMN3ZSTxlz7PG6HTObt2Ab+9mctefE+x+VXKJTPgFdVLxIzyD4+0UPY49m+eqCo83Y+57jDJ/NT
 hIwNyG+jOLyo50zuRYA==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c6e99f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=4YYDNayrJdHcgVGABboA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: YljuBjRkNPjYq-FcupDIEE9osJrTMhyE
X-Proofpoint-GUID: YljuBjRkNPjYq-FcupDIEE9osJrTMhyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270143
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100468-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[oss.qualcomm.com:query timed out];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAAE934B402
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:11:42PM +0100, Barnabás Czémán wrote:
> SDM632 pm domains are different from MSM8953 because MSM8953
> is defining pm8953_s1 as regulator but SDM632 is defining it
> as pm domain.
> 
> This patch series correcting the pm domains defined in rpmpd
> driver and splitting the MSS resources for the both SoC to match
> the reality.
> 
> These changes was discussed in a previous threads:
> https://lore.kernel.org/all/2b057aa5-4416-4fd4-aeab-6bc23acbb53d@oss.qualcomm.com/

Was 4.9 never expected to work on MSM8953? Or did it require firmware
changes?

> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

-- 
With best wishes
Dmitry

