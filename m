Return-Path: <linux-arm-msm+bounces-103839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ld6tEOqR5mmwyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 22:51:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D409433D1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 22:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 513AF30146BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F2A2D7D3A;
	Mon, 20 Apr 2026 20:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDi6ZzAB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtiECJ/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F8635E930
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 20:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776718311; cv=none; b=oRnFotE7IIKYb/azQeDgESb+JDDpU8G3XTa/V2cr5xzIVQuZxn9tzqtJL+5xRX3NaA9qxIp2Kto/zWFxGtTPDCz441sauE/mGsKnNiz8M9hHksoi0+Gqjc8/6A6DvJJrjJ/cllfggCiWX9Key+1B6mITlqSzR/ftIkYh5EN0HAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776718311; c=relaxed/simple;
	bh=HD5TVKcIUA3Vs9kUbCC9h69ccSAxTBy7PSs9IMhxjQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Er1BnZS4MsLhv8z5+5TTnzl/OoxR56Qdlq6XWSPFoh+SzFbZU356KGK49czXzegKj2fJr/tjPcsNqfbJTsfU6W/M6shpU2aiA93vTtWeM5dHA1kD4S3NlEJd8IyFSHRWZXgzSQ3wFFEsC0ZtoPhADyPIFrV5iCHds0lVlofShYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDi6ZzAB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtiECJ/S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KJhDnJ3454948
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 20:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ShdYyf7UWppTknPbWPh0egFT
	HdBn9gJPWfCvL0VBpLE=; b=YDi6ZzABcdZT9DvlowXiuNcfmZ9MRpKcyDxYTzV9
	6P0BK//xT61sQ3KPqwE6XK2+6Kh3qIYa5Jk5Iws78Pg0SJ1EnHCFirLer/4KX1E2
	atRtT9cFAc7k2S3AxeKhMyEBN3vftgwIOAO00Jti00CJzbdqr89Nc56msZMo9+bA
	92of584g6/TUS1tFZohBEOn1WsHisTjClMOBzRbcXmPWuhgaAmdNPHqCv38skUe+
	6Rj0xrfq6pbBkHOAO1S1Lx4Vgu/p6DF7kmJIKCNZVqlU8QWoWan0hWNL1NNnGtur
	IC3giAxMRo5p4YXIygbnVylqTyI2wujFfQ8vMm7ruuXofA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvju3e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 20:51:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e575a50bcso19560061cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 13:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776718308; x=1777323108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ShdYyf7UWppTknPbWPh0egFTHdBn9gJPWfCvL0VBpLE=;
        b=BtiECJ/S9P0TznyaiYnIYMAo8sqIyRdNqXx/BSgiWd7B6aHKsmLmYmT2ZijF56bINM
         BZTJdocDM4Y+m8qhHj2iR2jV6ZP7SYWXXFLYtLdlYLDq3Epx9xmh9c0QILEsSi6XadCb
         mvimxxHHfEt31BYNr/t8iiT/C9r0UH1AGUitZE5vcCAP0u6P8SVS8bq+AOs32YcFgkWU
         ZNGv1mjD2nSbKZTl9IGrNH86FnMEiQmtTp15krkVp4qiYa0gQ73gm8MFvWjX4IKKy2zU
         Uvw2cyL+JQebdmayKFi7ub6GnNRwQUh68OToBqXwwZwKgc9SLO5ZWop6LHlw7FIrMpNC
         yKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776718308; x=1777323108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShdYyf7UWppTknPbWPh0egFTHdBn9gJPWfCvL0VBpLE=;
        b=sUKsGOXWuJO3lRKobf/5ndpAWOGkREag8dlN+HhSZOXSgGtjn9uiZ/YuK65v2yYj72
         KKTNgEMuqNnYRk/ADKLZZrHavBlO2lIYmQBuRiPm1z31ZwVYDqKpWEiL1kxs6g8bKCv8
         bzGUKY5RVrWreZQJZxbGiiEOUTl5RkWMqjMC8efAgMK/dJI4sGT3Iosb8GjfJVO2caKN
         KgpOPZiDJ+HPcI/VDYODyVC9xQBNtemL2sJvSMippw7PQDahMP1VqGYcSU2UGI1REp0r
         wmnkVuoOUxi2tDOfMPh8M15FK1lWoL4nE8ltUgcMS+2sE1lP5nZIVhM0iO3G5Fwxf5Fa
         D6Ew==
X-Forwarded-Encrypted: i=1; AFNElJ9vzu0QOqocd5p68NWuZC1e7RoWI9WExw7v8JysKLk+x6lFAbxkFeX+s4yrsGWmo5hYLZHeJBgaWKpsEb3/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46CDhKUNTzV5lRQHMc1GiOw0oDaCg7X/iv53wfDW3ZW0/ghJU
	f5a5hoL6ALB90/Qhb2+ledAHLLbhxZOlpDTq6xzZmggbWwyMzLnwUCvCvrdmbv+VYoez/n6R4VG
	n4Uc4JlUhEEzck4P3BCA+g8a4OrASogGcEZGJMb8+i2tyT80SGS2JmnklBLK01cVHj2Mxwlpxtt
	LZ
X-Gm-Gg: AeBDiesVcYON61DeoX4FS07szCMHMV954GILaiWcsO34EOYrB1yIrDbl58sCBJs7l89
	SQn1vOUKaX0c4a+vd3/edn+OASb3cpmW0cnIOjxPd8kFzfPaFsvyGHJjB2IihNbYDb0nx+wA6pi
	9SjM8tVxCGSIGk9eTLUom3qfNk6MdnvJ+nAdp9awjNszFtUyqml/mqs8e1tNSPMbsWAHjstnehG
	PKU5+OV+CDFg1nsJ7bxDiRjO0X8iyWyqG425VIla1HJ0tI/CyRicGg5NxQD/6vgbL1uuxkE070N
	5yC7Oe+j7rhVxmkcYGWmzcbAHlVdE9ug7Wp1I8ck0QSWrWQYmycgV4F1scYPEvO6Qwd1AF+YS4i
	dUyPqPVr1gQ49D2AWBsxh/oskzDOlvOZRg/kRi+u2m8X6YIqWsRzsf6D2BKc3kzKeEKeXh2VPr8
	vTNmZFk/P/2kZUQC26sG1f8A2fNr+wW2ApcqrOeIpuz4cqQQ==
X-Received: by 2002:ac8:5dd1:0:b0:50d:6baa:9e9c with SMTP id d75a77b69052e-50e367ffe43mr218495331cf.6.1776718308061;
        Mon, 20 Apr 2026 13:51:48 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:50d:6baa:9e9c with SMTP id d75a77b69052e-50e367ffe43mr218494951cf.6.1776718307623;
        Mon, 20 Apr 2026 13:51:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc58fsm3231005e87.30.2026.04.20.13.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 13:51:46 -0700 (PDT)
Date: Mon, 20 Apr 2026 23:51:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH v3 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
Message-ID: <rajdw22en2r6tfbhrlc3x6mhblxlz6pt5bfkxusfu2swixlnj6@4l4ejrojlq7g>
References: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
 <20260419-hawi-spmi-v3-2-b04ee909cb87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419-hawi-spmi-v3-2-b04ee909cb87@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RKQziL6kEOANiGAyjDdb5zw-vM9pRD6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIwMiBTYWx0ZWRfX+9cmYwAU6RZ9
 nqN7b6oeb45/WWB6MyDrGQPzYoBX/24KwCrIITTuwNmBLbNmHw5eJCbzumuu2OitgRSnG+AQCS/
 48GMzpqL2UvlQJicNGlD3B7YNRhT2u5AEjKkrKFr1OvkgJc71aH43n8z7d4LqgAptCaU6dNy0RP
 ZNDbeuglH7RHjtdGOc51dxbk4jf5TMpEbPTRSq9ipr14CaVeWYElEAT5qPgS8oCojY0M/m7mK97
 lY8GYyXUnVh0ElqLySrG9VI6V/HTna5LVcMR+7xUl3dfwaLkrs2n19k0sGHWU6HTEqxbenVibd6
 f+iCwudpXxAbhTRJxgq5PQXIzcY7STT+uO87Go+FlnQK+wYUmFHohEURWqbRa4vYfNn7NnX/0i7
 XBu2bKnOJmW2LhoI4mm11P6Nbqu49YuBwvpQcPFrk9y9nUChndJ82L0njDrwkfzAs21HLaJ/Xmw
 rouwEkN+YZ+tK5E5zSQ==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e691e5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4h3_F-PqDEY_y8xvUNAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: RKQziL6kEOANiGAyjDdb5zw-vM9pRD6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200202
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103839-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 8D409433D1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 19, 2026 at 07:25:53PM -0700, Fenglin Wu wrote:
> PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
> the definition of the channel status register bit fields. Add support
> to handle this difference.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/spmi/spmi-pmic-arb.c | 142 ++++++++++++++++++++++++++++++++++---------
>  1 file changed, 112 insertions(+), 30 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

