Return-Path: <linux-arm-msm+bounces-103577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLySHkLD4mlN+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:33:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC9C41F2D9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA576304D427
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 23:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B523537F727;
	Fri, 17 Apr 2026 23:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6rweTyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ub8QcDUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7314C199D8
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776468784; cv=none; b=sJP6CXNGNw+ou2Mq9XSdP+tOpn9zBlqqb7aUDmiRRdGBq4imQszUeYMHEQVAT2xlf0/lk1hULT3JRsvoOMGftDkxQ2XSnzq+BYcWRjtr9nQ/ob5giycusp3N3wiFbr0QopjRa1e7hlgQ84NonwOAzVsBvQMhiwmMkFzyQm+U/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776468784; c=relaxed/simple;
	bh=i6Ol9BdX93JIjEUQ23dcMzbXsAuBsHsR1913FVpkpC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbIRPvIWWtuDPXt91NR4Hmnnq3YWtVOppAVFJN9oNZvkykrKUVeEn9I8UPMluFLdbL5GS/13UK2qbldoiIQk7uD7Xq4yil/UgplXR0iwnMX8f51nE2dmZFE1nFhpo/UbVb+sY2fOOD3eQJez87A750fqvuRjt8cFAPjmbFTnZn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6rweTyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ub8QcDUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4AJV3929274
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGUkS1YC38o59D8IELve7BiUTp/N9+xbJVx/QVtxOt8=; b=Q6rweTylMVZ9FQNf
	pDnMIB2twbmgLnNIvMdOBoeIRrzM+QHSUjgPs4uLkTYmoi5N0y6DmWKuMQ/3LBAj
	B+ATX6KrRo7bobqdn2YudN0rbNyL7wdwejz1+IhW3xj6qQDHXe4Pyp6NxWEVgdX4
	a/kIuQeA1Dst7VGI7F9EGkVwDTEs+tpIoKfQCkdoQS7sbfCGui0Wojmlrrz6xx/N
	xxONnDzj8hLRXDwnGJzCQYpSrkcRWWUUrOGg5d4agSBsmx+h9fi4qItQNP/dMB1d
	dnN8stLz6hEPAmk7ewquLgxFTEszK75pcc6cIDOeAo6uPGJrL+5YDrHOm6AmNmWK
	Mmw4lQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkqujh5sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:33:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8ed08aa4so47278221cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776468781; x=1777073581; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yGUkS1YC38o59D8IELve7BiUTp/N9+xbJVx/QVtxOt8=;
        b=Ub8QcDUYkteK+c/eliOJ4jNkB1qPMbpQZk4ZX+BQXgHVzcYlM3M+99HVMP+Tr+KH/R
         Ltpj4dOUfyxHG/BbwK0DcEdknRuCiLFAQ/pXs3FAE4cTcAloz1oOF9CkQnVf2Kv9UIa4
         H2Fmb8u+zY+7g4qI9u1WX3HIYw4KKzHkXixPociR2EWRnCbG8z0BWJAzLjRO1r1gZSmD
         W6/MVZ3lDVyA3AlObqZG3bioa/0f4OxahfgiakoC4ALEOBQUdSbol86lT68Rd6siWJSo
         5Okm7wzkRybSmy1tS8ruP6FxmHQN3/2Sld7NJ83dx+1pfNVTweRrUburc+Ebujy3Atgw
         tPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776468781; x=1777073581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGUkS1YC38o59D8IELve7BiUTp/N9+xbJVx/QVtxOt8=;
        b=MM2ENiMzkT5KjCgpMQB0UqX/Q2MgoA4vHcU6XARTvwUWd6jE715ZS4vT3G6Dig+1Mf
         7MWPw/ZJfktRqz/Zun7sOIgFfB+fOagSRKAhmo7fBqj4tY4mywbbQ9JG2MNgarEhk52l
         h5lel6DQrTstCoOht7/AEDWX0xteRq1dt2WjUG00hewuGbmlKG2DdC6qlcahzfv4tSCr
         sqlFzqV9rNkCIaCJ2jernB7KLlVGiWrlLt4TdkQubLxdZYAuBaqqaFVXVu+MVzERMNMY
         N0p33GFmvrSYu8VGHmVDCbs8DPwW0uMssPHo50M8wXWn3wyrtPYNV2g6aoR2JmgrkDOi
         yq7A==
X-Forwarded-Encrypted: i=1; AFNElJ90SSRqOpSBURoygYZV4K1Xznu3rpxr/20qfxk7/D8aXqwqsXPkFziRCdUmvSZtnNvEcFUYZjbyI7/fGXEq@vger.kernel.org
X-Gm-Message-State: AOJu0YzTGynmWwzxhmu2cVuVPiMjF9utfNSWr1pJPhWVJYpv5DdwRb6v
	GMYfhnlmmy8mNrc8kTW+ougWvVDurY2DqT/gb0EYQOXHx6bgAr4B5VlwLitxHP0Cr5MuXoI6wo4
	3bGXsy1dBMBmv2KO7JnglUlInqwQI5+ihyCyV5jd3k6SVmnoZGmYl1lp/rAWlO23ld7Vm
X-Gm-Gg: AeBDieuBUqOM3lyJWuHmrkkqK22UP2eryblHpFwrxSLtjNdOZrmR86KIuxzqyrSvkqf
	DzNM5GJ6T+WzLvHyKEamhfVVit42dOyHxPWoHJfn2WIECYw8CZlbBRFRIRgc3uk89F8by9XU1hu
	eOcj3yksBZ+0Ul5h4xUwNFAWMy5koiugf+vJjVYTggxTld3IjOeJzj2nQU80bkpdOH97vGTRYNC
	a0JrExOOHtRiYLmai1w6d9pwiBcpv48YWzOsFi19SStW52Im7WOP07JVyvSikZVJYDJqtoM+0ML
	15sm9OpJjB4ifz0LIEoxpbOcFUC86snbS3HkR3g+5u8axTqygElBxSgEEbrOq8bSpL9HlOxjKwA
	VbPUfkUn9s50mvuaUEAia8zyGppHDkri1+XzSjPw1Cx+kEJXnNnbyr4YI4lCzVF5kZ2K7wOTIQU
	NgGPHNAeOvmfmApZ8zRDLrYiozSYbHNF6hLJFikg8tKaKFxw==
X-Received: by 2002:ac8:584c:0:b0:509:3098:819a with SMTP id d75a77b69052e-50e36c4ae82mr70599041cf.44.1776468781437;
        Fri, 17 Apr 2026 16:33:01 -0700 (PDT)
X-Received: by 2002:ac8:584c:0:b0:509:3098:819a with SMTP id d75a77b69052e-50e36c4ae82mr70598731cf.44.1776468781023;
        Fri, 17 Apr 2026 16:33:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm823884e87.36.2026.04.17.16.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:32:59 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:32:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 03/10] media: venus: core: Add msm8939 resource struct
Message-ID: <zhvfcwpy6z2rgpicnkvx2rg6huyqnen6q7imxv2fqjzc7k273v@oiqhebjgfnbc>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-3-a09fcf2c23df@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416-msm8939-venus-rfc-v1-3-a09fcf2c23df@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMiBTYWx0ZWRfX/mvR7adLtTNF
 3kptjsUEF2WvuIQB1Ldy7AsrGZ/g6rJeMLjDTw+VNYO/uIC1cUj2KMhsV6FE8z+XEoaPwjAu2KL
 bTP9+p/XQfTcdtt/AhWZRgubqTlPZ7HhgK37YCSn716eg3Hl+CjyWr67RaKe9IPDLZY7wUEcvcy
 h3xacqPgPmbwGJXrEzsVRWC1NU3VznvvuKIUmQFQTnJAk2fNE2xaly3myUTzfplm48V23XV53NC
 VL+8vFAXyICs0wI1KEiSqHQDqNFTAUrPnALb1uBte1dTLuhexIg40VoQRLpgny5uAJTa/TFlAkA
 FiTD+AqcJ7cCqATNtfLXQvgJKL00KOwqnStDMyplh8j1Nx2fZ9iydUSHY67pdS5SsHTxoA1PlAP
 iw6Hd4zPokgc3eAkSe/csGEWdUAE3knund+ANK9FIRV+Gm4uxYPQsli6DApx0XsktPHumAqk7wV
 HGMcukDGWVPZeCHWg0Q==
X-Proofpoint-ORIG-GUID: 5SsA5Q2c2DKjoZw2WBd_0wPxVoQWEPln
X-Authority-Analysis: v=2.4 cv=FP0rAeos c=1 sm=1 tr=0 ts=69e2c32e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=HDjIzE35AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UowR2J5Dr4mKXK4zQ_4A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-GUID: 5SsA5Q2c2DKjoZw2WBd_0wPxVoQWEPln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170232
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103577-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ABC9C41F2D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 04:43:50PM +0300, Erikas Bitovtas wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Add msm8939 configuration data and related compatible.
> Cores on MSM8939 Venus are used for decoding, not encoding. Move them to
> vcodec0 so they can be enabled accordingly.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

