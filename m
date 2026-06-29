Return-Path: <linux-arm-msm+bounces-115082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 26NUFcdvQmqa7AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:14:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2FA6DAEA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:14:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="CxYoStG/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="XpbA8/U7";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115082-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115082-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD88930E47D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5162040862E;
	Mon, 29 Jun 2026 13:06:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E7F406282
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:06:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738410; cv=none; b=ZaKX/Row9bGv5IDiy/ufm3XCr1k6KdnRvZJrmRdOLpD0fHcLu89/M00sg7ei4n3q+nFq1GkyhP7B+wNzmdUdpFv3+czkHlIPT9XlkLPT9UFMpIPGcGV5qHn6oB7IxUpZH7s16tI41SNzaFR/RfVfcluWVunyNPdVuxF1qa1xxao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738410; c=relaxed/simple;
	bh=l8xmnKZyogtxblVYuRExx3KDcBcxzaoxeA0hboGd+sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixuDRME9H28fp8WgtufJdG040IukBveUhAHv+0R/Z4M2EBRSejKwHUr+cGZse1I6RiqyIEBlPSPqULhCkc1B+8IcYBOMfuc2oqeRMsp0H/iSSa/Kfh+wjfJlKlp3PYi5DYZabY6G8NKH0OSZR/J25hCTfr03pOUVnqVRJYY41Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxYoStG/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XpbA8/U7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKKs2656156
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V3Ubk+UOHQ19y0xPujiPR9uA
	upfXfjgvmCMxsopvLFQ=; b=CxYoStG/c/8W9UgQ2yCt8y4qytS4I+rH/zmq/dwd
	vIGMaLjxpshv6ucAHCBqqkL/TGjJQGq+3InBDbpDeMqXNdh1r0YKL8nIwDnYCNs1
	wsr/gomoH6fAom8iWApOvIGGt8VPlZCgIQ1ZLUKcFxbnhW8+T2Wx7WbMLgcTI6a7
	xYMM/7IFStrFTi+zMjLFR8rrzma5lpKz1ITD9H3vRcXH2u1xzv356u0eIyezDu9B
	bac7ojOO/ee3Mk5QoypjCwK+ruMevlEzsIENhG9cuDWLeL9kZEebTiADQHESh6Uf
	3EWdKJJ6Hv1hbFZpBtU9Xj9plcGscwFMXCA9XSjzqTB+bw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7gwve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:06:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73883529f3eso1127339137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782738407; x=1783343207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3Ubk+UOHQ19y0xPujiPR9uAupfXfjgvmCMxsopvLFQ=;
        b=XpbA8/U7Dqk0fP0iyqSaDiuuC4OjLWcqeXq9M/q5KZO3RKuRuBTXYLPnYgAbv6xa8I
         ZipoA8NZZ39uKh90OctlR5buDtSt/9LO1ZmY0fADuzuQEeXTwiALa67PCUyNel5Rv29A
         MOtaW5mvEP6JhEAzQZG508b7hNdix0L9GNhv0ABNv/VGvhkAueyOsNdOhgaFAS1opLIa
         tvnL2sBwKFgq7hIMWGaGs7V9whCwT1ZHt/JXyDan17mZSvrmnKNnqm/OfFQYHO9g5Xa6
         f4qtwQTBSL9PqK+JCIxC72uhLHNG0KVPioXfFwSCPeiBdTM3FnFdTAuwxSDN+ZuyCfes
         GkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782738407; x=1783343207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3Ubk+UOHQ19y0xPujiPR9uAupfXfjgvmCMxsopvLFQ=;
        b=W1ENBZTgUhZHpec1YrmwQrZLDMOAaUGOnhLL+5HQBEbQFqXznNXszMNNfZCQEM6e96
         7nQgCw+e3RDookv/SUOwPE0JMWMHVqmYJKV7K4ZeWHLPgMJROQCabWAQ0EkiAJSXI+Bt
         Bir1/TJRyY0ZLHY291n+qTDiKx4EOIgrtA6gIRHiMnBL5bOUOOLTGSMvWMNZwNQbZj+B
         XJpZ1GP41VFohVoogZHJjZr93Aq/zH3LTLPaEVdXb41ABGwzZstlHFfM0/NrkxZ9luIl
         EU5po3GmSCfmtRbTzO21cHONcwh/iHM6iOQ8ECt2Dj8duKyYq+1Hr5rhw+cSMC6jRzrq
         BJOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpw2wNY+5OXbFQceu2xZeJVZr1SU87knENkAGlCl4F/xElrYrJN/9jd1CBtQ2iVWlR7BAvINxQl+OOlkdQH@vger.kernel.org
X-Gm-Message-State: AOJu0YwY2fS286VclovGqMGrwAPOOLK6oIdUNk/tjIvcq7q1dxqKHgFZ
	2/mrTGAmZpWm5fW8aX2l7L8lqGK+vBEjMCi8f4feblpsPZ2m6FPFqYr8zT0vLW+wacOZMRXWaCz
	yILedn2/66TMCclq/H/lk+Ja8B0EaGGXXiBzldgE9NTMLZyUO2UQA9gmCSpe074Evsg9y
X-Gm-Gg: AfdE7cmJbEWyg7hfzE/VRPqkJIPcYnOi856//u2uEhKoAfMDSF2MZLhm+ct/5mtHYWv
	dQUnZYDZ80ic6yxq00ZfwQze0gRQigj3F894SM4jVaGQBrAdNWYq/L98Es1BDvwiI0DxmQAU1S1
	iS9Gak+sayt+/cNkLz/b5n3f4UKVdqs46cmbDEI06FFEai8YuXNvBHl8aJXDOYErnuyH3z4kcaT
	P2zTDj4UUw3bs+SNzAwsHDt+tLT10FAwYTwqr1EWp5esbpXCKDrf6I5wLDUyFEPUqcIcRjRN3dn
	w8N0h4MYoxpLTLpIHc1AtMj9ngFCta2+b0+qw6W4ySDUTRYPqmqMLcikTwyh50key4RXVPjqKLG
	6py5fBXkd/gpqLZ7Lqt/0Vu/AL8HvJw4xspPzV8wQnXzYVy/CWyxi7VLJ60L2//N+6hvUYXtySR
	PiV38Hgf7TWDwJPs1lUG6/qbWe
X-Received: by 2002:a05:6102:80aa:b0:6c5:d55d:c093 with SMTP id ada2fe7eead31-7343444e59emr8018147137.8.1782738407045;
        Mon, 29 Jun 2026 06:06:47 -0700 (PDT)
X-Received: by 2002:a05:6102:80aa:b0:6c5:d55d:c093 with SMTP id ada2fe7eead31-7343444e59emr8018089137.8.1782738405311;
        Mon, 29 Jun 2026 06:06:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a8b6sm5851946e87.39.2026.06.29.06.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:06:44 -0700 (PDT)
Date: Mon, 29 Jun 2026 16:06:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <uyxnmtfrcwmgz42vhegr6t2arra3kebrvs2vxo6252czdw5jip@lt5uw2ge76n3>
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
 <20260629123359.3469724-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629123359.3469724-1-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOCBTYWx0ZWRfX65uIUJ+Npgwh
 wpllHA2X9kjG4WR+iQybh1n9Z54qOiq9yYbYYdridUJvOOk9aftmE/CU2NkAy9uCT9eV7Hk3sIz
 PKxGkyPOZ1tGTfk8wtiQ+CHfyKj6vshkmJT82hfja5Q70g++eOYsudsDmuMIwYj2PyroiItAkbJ
 E9BgHplH4CGidnDia4fT54igGgi4g3u7xeb9NOne9qQCRO19t2wKZCDxVr0oKKOT/F+32WyuCu6
 qMreIWa+bHJ7M2Xc7udMc9TlENI+ZCSsD1Fog4JWRfLpnQ2v18vqruDJ1xC60VbZ5xNqtx14LlU
 9QDsx8O8HxphLPcw4jUCtEVnwwyycPUhk31nm+IV5VrQ4SoUojS0BaquQc27D92y3u2WV7EXTFt
 wmmsn8VhU0jszUPJKL0um1Q3IKBZti5H6uoWjttnTsIgv1mCsT5OR1A0epLTQJv2YtCjO2NpVAt
 5FRRwF4LjdkDheOkF3w==
X-Proofpoint-GUID: y8bELk8d-pkiXHHpuzhJ_j2XC_qVhiJ0
X-Proofpoint-ORIG-GUID: y8bELk8d-pkiXHHpuzhJ_j2XC_qVhiJ0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOCBTYWx0ZWRfX5+NWvwXFhLlo
 SZeUrPo35c+NcRbcdFj8ljlHjc1i7+Uog70xyCkkvpAzgjo/d9JGLKSyRAGErZ3AA/xkaCgBmQG
 VhXyy7jYrGT1xIfoedaK4zLiYrcy7yk=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a426de7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Z7R4kEFDkqlNfSA089IA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115082-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A2FA6DAEA1

On Mon, Jun 29, 2026 at 03:33:59PM +0300, Atanas Filipov wrote:
> v3 posted:
> 
> [PATCH v3 0/4] Add Qualcomm JPEG V4L2 encoder for SM8250
> https://lore.kernel.org/linux-media/20260629121110.3469048-1-atanas.filipov@oss.qualcomm.com/

No need to bump all threads just to point to a new one.

> 
> Thanks,
> Atanas

-- 
With best wishes
Dmitry

