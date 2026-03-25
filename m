Return-Path: <linux-arm-msm+bounces-99879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAp4HFbTw2ljuQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:21:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA05324C34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EB33303CE11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF303D16EA;
	Wed, 25 Mar 2026 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYSALH54";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4+F6+pW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578830C62E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441220; cv=none; b=U6c7GTZIngcCrxv86kbzQiES3AQ7HV+MS68enbL90vL8VzYe4/MlZLGmGU6414j0kuKebJFzTkx84ypKt+cnnuyArsD8FbNFh+33wwQfAlESLvYwu2LLLV+JHjHJq/L7tsWrMAmTXctvj7vEcjuIUH+16Q/T+YkX9UaUVRyjNlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441220; c=relaxed/simple;
	bh=P/TelUyM+Y0bnRgMqSPESGUpe4W7E+42Z6GeYeMBxB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNrZX+0kt6OGnvyx5tjra62EXxwMlEKiie4HqCxzQz9a870NqxEHxqdA6db/2sZq4laD9v/EOZrUqUYp0LmeIscBF6HXRfNTn6I6DP1g6MTb+nhHKQ2jgQg+6uFlNjgzvMd0knePwr0GPDTwgDANKw0CedlppU6hXvYMUhYLmt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYSALH54; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4+F6+pW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBG5b93090982
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qq5Bnm4WRCwgnF/KjYL7ACqN
	xLUtKHzcJm3eAfrAnnw=; b=HYSALH541yxLIMG+uVlbTYQTwvX1mbennUb0N0vC
	2FCBiDxiOlgUAmrZ/L1ALeoOs+OpznTmlkoEErKCB53EQ+rde0OUL26oZMXLVFxi
	+X6PFFTcgGGZkxOgGTcEMzaixbshsTwmYe5V8Wkn7jjETdvBwXk7/RO2JmL0hZ9/
	cXAsiwH2fFJKzkzgjRaV4yUi2GRPbglWybgOI9jhsudB415gUE1vO9HUSsSjlFU8
	cOobbV2GoGNQ9oxwjgF59nVBTH2Z6dsg9r2kgAzq2uwu5AGG23MwXZXw18y6YSpQ
	RENbEVR43qLA6Qe9d/+dK0hfIcLjoU3NCFs636EsaOyJ2g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmprfvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:20:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso9566481cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441217; x=1775046017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qq5Bnm4WRCwgnF/KjYL7ACqNxLUtKHzcJm3eAfrAnnw=;
        b=h4+F6+pWf63VcETOe/n5xdXgA5K43MLqbFMKI5B4Omq8pTlvf4UIF6gbLSdf9N2ob7
         SghGAmgpnHNuQwCJHoVW5ciUXgMRysncTkFeTNW5rT1LWtMG2s7zz1xUFwYQSnzIzHix
         NlJEiheh8eoEsb7vimdLzMuRYYo5EZt4/M9ebgOp5YMLlQPTZu0RYl7LfP12EG5EZyA4
         /7UypcJwvkHLdl2cgSbkr+YgbPSgGaUODX2HzPJ02swNnSWow2PQZ0oxOGlVZHzYjAcY
         MaLcbHM67tHq13Rt/t2VbzPbUzOO3iZBslkBm+uJFFz7Bd6X1MgagI7xORFM2GUC7MrO
         qOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441217; x=1775046017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq5Bnm4WRCwgnF/KjYL7ACqNxLUtKHzcJm3eAfrAnnw=;
        b=tXD9uYIDssAD/bl7rttNRmE6Loz1ecdfxbH60N7vLhWbxD/pA/unEXYB1qS0uV3sTv
         BI1TgTJPc0+5nb/orezEqghvyO02Ldh1Mm74Lqks8s/bn2n1ifceKcSpsW5NHFKWMEJN
         ohgzryhO6VcG+LrQV6vNSry9IpyAnnWPHLPOeoO8zi1h2FiziLZejI3yNBxlKHeP4LXC
         ERaaVyYtHzTTtCN6l9M82UNm2vesLX92AXKT5jhk2Q0SYT7WgfoKWhZe1LYYzWIReNhH
         +/XFAiz47PlolNxrVlzpzWzWWNdJrXNRGq2KGLoPMduzmmlg42gootGHX36MBFLILEP0
         EIjg==
X-Forwarded-Encrypted: i=1; AJvYcCWQqXtqKqU20h8o9g+T6FJT2BYyUO+A4uCwnUwv0Y+8zHOlwy5n0wPvcpitCGWK2uitMgA2zvCCHMKv/BqA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3/x1luHkNg7ICUbkqqUCEZeluIlreYOyx3bh1J/yoHa7mNVmW
	FPk+B74BXXmUmrs2y3YR8i0Nx5Vg+JSdhAPt8+H8yr5CEDWCLWFAlPRfJPDs6HD9Y9AX/WWf5T1
	gyDRhxSg8GsMCYlQphzll4Wdb4IGvUmN1VP3UdxUrHYShE59ACPEufS7arl1qu6BvtAAMWyToaA
	v5
X-Gm-Gg: ATEYQzxXiBmcBs68K6GPFYloSHynnXfhkG4b3OJEla8JIpwyH09dumyzY4ide2I47Io
	w2Be1nkO/VdCjAVV+Ym4uEjD1hak4UGtqwqC7uvnQvg0EqGnQRyVy8fQ/GZTKHgSO0G7mkcj2J0
	fIoQ67EkcymxUoToUSOLiQ/8J8EBAUcGgRXz3mMVeELxOu/LihzBq6pd+z0pEL/84JiHxnA3Y2x
	45wF8dYisbRcEoq9mpuE8dmRYQrc7PS7VMTiBP0ESZCOCA6F44VxQogaWnkuY+KNLBb+gm5IAbM
	vmAf6dnWQURaUM/25Ac3bgeyvbjFxLaSoGC5uZRc27jbJgETI6b1KRHXiNAacSOPNpxOHO7o0Rb
	DyL7UFWysXxEp1oM/0sE2uO75V1MzIWMJUrMM/VdWUkBv5T6y/GiucS+ea2+vqm9CYkXgda5REk
	vNenFtPUUh7/I3Yq0e2c3SSgTBWqQ/3YtNdCw=
X-Received: by 2002:ac8:58c1:0:b0:509:32e9:7e9f with SMTP id d75a77b69052e-50b80e30aa0mr44733811cf.36.1774441217218;
        Wed, 25 Mar 2026 05:20:17 -0700 (PDT)
X-Received: by 2002:ac8:58c1:0:b0:509:32e9:7e9f with SMTP id d75a77b69052e-50b80e30aa0mr44733401cf.36.1774441216741;
        Wed, 25 Mar 2026 05:20:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf975e9e3sm36641011fa.16.2026.03.25.05.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:20:15 -0700 (PDT)
Date: Wed, 25 Mar 2026 14:20:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] soc: qcom: ubwc: Remove redundant x1e80100_data
Message-ID: <xgbw3hsdpbjedkkxcsuclnsu4ucl6mw3mqdvtngzp7icklommq@y4cr5mqzikfl>
References: <20260325120846.139836-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325120846.139836-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4OCBTYWx0ZWRfX43rFYI9uTdb/
 m5SXQEznKUiCHjI/fxMzpezkVpvmEeBpSrkwJf6SAFvKyxU67oiw+GZaPxK6F5i21qfOPeTm4sV
 EfkkHCtIeL6ihK3hHTpZxtehTN5p+tTgOOS+qSBqliKRDUVzFB0c1NPRiQweG+TTolI0cQelHVl
 yagb5LZDb34AZtrCWfKU6fuoM4C+lCcc2cr9JeI8Xye5dY0UOFVamy3jslvp+z2LIo8/ICehMvZ
 JJoCeanYBYL3dW6o4WnHTafinEIvVIv2WTiTtPRHRLwW5ozOW6i7rZsIKTLtEVYa264bLhjkTi8
 bnTLWS2sQRENau/AJd3tqzzWdE6yivnBJcI28EmuhxyIjSIjdO5B5owRrK2dnd5I+A3Z2LV4f8k
 r4lgl7oRS/RQhHNJ9qVBz1yLc7ZAqdwvwmMyvaE04++X9Ss4RrmzfDn0fx39JB9Vviq3GFoQyMa
 2q2zsKFl9fRmF6GXRkA==
X-Proofpoint-GUID: gUMSFW3ZaQ2x5P3Onjm2JYRG4pL-3PHU
X-Proofpoint-ORIG-GUID: gUMSFW3ZaQ2x5P3Onjm2JYRG4pL-3PHU
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3d302 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Y64klcQ1Q3cTQ3YQOkAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250088
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99879-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BA05324C34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 01:08:47PM +0100, Krzysztof Kozlowski wrote:
> UBWC data for X1E80100 is exactly the same as one for SM8550, so reduce
> code duplication by reusing older entry.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

