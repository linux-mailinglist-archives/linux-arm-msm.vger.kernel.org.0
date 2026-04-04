Return-Path: <linux-arm-msm+bounces-101818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFYqNb6I0WmlKwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:55:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A84639CABA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 404DC30078FC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD51A35DA7B;
	Sat,  4 Apr 2026 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2B+Yzmf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2f5e6yU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9790233E373
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339687; cv=none; b=ToETaFdvZ16v9VEq+jRl9YcPakeXr6OFEWb+NBQoKfUPLDnbUfB93pGnX1OLrDRzbvcJ4DyjUcadUZ+dhOSUEdjh8pnjWArSjP3oI6Vsu60U3Gs12hYCWE7fxZ2ZtlQnOeSQ7Uhq2blbaNEpZH4ofPctKT52Hd5KKcvaCl7M4y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339687; c=relaxed/simple;
	bh=u+koxI3Yoe/GinKMBs6efvqTvGNRQbfIRJCp+dtWl6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lc3Qq90enrtYluckFgeyZEOnkbs5RRAWfi73oVppX6K0HWhg7rwhyvOR3Wh8HxkQM+KW5zbnUqi26Un1LomNefhrXCIXM8QgqVDkYCP4L2O0vM6Y1z6rVAN1WC0EDjDL4A32YKJxMF8jU/MkfogJmP/OqsMY6DYYpIdlJcVupoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2B+Yzmf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2f5e6yU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343PTc93672512
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=INGDAgs64kjYvsGtYYAY/66g
	nxazyYC9vqCcyr+LqGU=; b=P2B+YzmfaMcCgwrkM06rKzlcjL9hbEkLKma1lf4f
	plGRK6eCmkF5Ii+81zPxLvkJcmRgVnpyg7XQM0qCJtO2q6WHplF+0WXzcYipcdeK
	7mo/vDXIY9ih8lp6Op6dMSwJiSoeeuKqLQCvZCzrQaTJ3kEbzI6BV8ybK+S4hP4W
	BXCZ2VzJtgiGnfTNzfe1/uGD8w7ZhlTaRKjmHznpYKmpubTdM6NG6iqvNWFF1qNF
	+OEhnU8ofj0fl4NPSY0GiQ+2Ijeh/RIL5Edv7YR62s8QzwEwEaG7DHSr4lnw0ia5
	nEavtQNlunTs9O79tYzc6f68NDWVxrN0oGWdcghX8NE/hw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqshgac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:54:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so82838601cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775339685; x=1775944485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=INGDAgs64kjYvsGtYYAY/66gnxazyYC9vqCcyr+LqGU=;
        b=G2f5e6yULwRnkaVtDxuJtjk+M9ImPHl9H3+sd5ciSplubYG/uIIEfw2TWAzbyqmN4r
         nTVNRYqX5QebWXfjkuJJ2kl/4A9khg4ZDmD/OW2hglVPFvR7iuCSCqsAb9hH5JGHsfVI
         d8mv78zGd4Q6XIJrW5iUkZGJc9pTR87XB9PQNlBF8ygXJCju0pyFOs3ftdgJv3CxmjCc
         3IRDgR09h/+Vvrleq/jFWvbiKROiVKhrQw6jajxgj6UL8KsODzDKZn9RJJl6Zkv54gk6
         G6b2Gn3XQy5eHO8GhCTb+MmwsQuMnq8RWyoNKZgCyXizWdNpuF2LnDeXvIbqOxfspfiT
         2P/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339685; x=1775944485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INGDAgs64kjYvsGtYYAY/66gnxazyYC9vqCcyr+LqGU=;
        b=SIhImejZ9pkLt3ImYJSI3lfpGmtO+eRbHy5htsaft2lIncIKb4qCIjpuyXDNyxPjou
         mdcSuDmt9NC6X6H0xudsU7oBSR+2h5x91iQE2lYCozaHwLnpsuZvDQPW48WSkc2a3Qps
         AgmrG8UATHQaQu9VfJHbqyGVP29CPC1x5pTpj+U7pqKBWQOyHgffJuEJ5Lb1nEsqK5jP
         aCIFEmQFtGDLpmXn79pJYl5b3cRmteRb5vdx2WVBChEWXcZGLPTKmQ8SVW3PD8cInGD8
         VNtYLZY8s9Q5/KPWl4HLwgzcFg1iTMLUVbWBypYa3e6P+c820g3HFeKp7g9Bi2yVn1pp
         +WBA==
X-Forwarded-Encrypted: i=1; AJvYcCWhV+7OXiBBllVueE9pcjj4jNFbbn7XSzb0ED5phb9aFxwQVd4hJhmJCmS0v/leKVY5z8ykeK3CtCXFjHh6@vger.kernel.org
X-Gm-Message-State: AOJu0YyyxVmf1i/07Bat+QBLUXU4haV6xcDFRXwlnsJMewSNX7Q6Wjw4
	34AjpVJ4yx2N9be/+d1ypRRBRiABz9Cn8kS5D1+UcrAFFxMxQS6LsOz6kNdyMp9ApQUvkIfogWo
	t4+vfj88+q4xPfMDxW5NnJYxyDF+RzZ7z35mwgUTyIOkAnhJEh9TZgBfguQohkd/VfK4I
X-Gm-Gg: AeBDietHAIqcD+zhskVsO4B0UvFdKPQI1eWHCFBBt1OoBw5RZy4VBdj6J/XOSJZQpZl
	Rf305epKA7+fILtIjhxbglCxa1V37pbL9mbuTiMi1kNSV1zXQQpsxFimIs3Nef7JJ6PidIH9xcG
	4u8m9FxhUBUHIvMt2GPqTe02SJsYQuEBhxWJ76Yh8T8Y77ApplW/GzcKFGtJY1jxSBxJTsSSrjG
	k6PEWQ93yrlIKW9+SAWBCeCxrBG3SUVd5C2MgaoCJDtFQNLmXVX3PsDp5l+tljB1a1S+gVLnpjq
	vdespuUewsRKiLZRgCM5xbJb0SDewge+dbXsAxorTobtwy/+IMxEQtQ2gxkSzmKcC5B3QB7UeV+
	pkGTxER9bWDxLw3Ozavj/utKLhACQ7C2ukBgKPixyBpqBhlQqJhC3DRnFJqa1h8zsx6Z0qaRq7p
	T1zLaZmHeqvSjCkVvoiT3DoIuA3b8/gMzwD1k=
X-Received: by 2002:a05:622a:834c:b0:50d:41fa:80fe with SMTP id d75a77b69052e-50d62b09c81mr101535841cf.53.1775339684888;
        Sat, 04 Apr 2026 14:54:44 -0700 (PDT)
X-Received: by 2002:a05:622a:834c:b0:50d:41fa:80fe with SMTP id d75a77b69052e-50d62b09c81mr101535571cf.53.1775339684437;
        Sat, 04 Apr 2026 14:54:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6089sm2351011e87.50.2026.04.04.14.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:54:43 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:54:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Motorola Edge 30 (dubai) DTS
Message-ID: <saj4lkm3cwoihwmzensubz2c4xz3b6o46bwevnsnwk3s4oxgp7@mx7qnphkxuos>
References: <20260403054417.167917-1-val@packett.cool>
 <20260403054417.167917-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403054417.167917-2-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d188a5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ePosGYAZjQQ63RukehsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Tv9R5i3L_XGJ6-OUdRZO57ajcgcOWewI
X-Proofpoint-GUID: Tv9R5i3L_XGJ6-OUdRZO57ajcgcOWewI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwOSBTYWx0ZWRfXwra/RMNp10Hw
 h9BTwtlQ2PVbUAwdz4lJE0uxo/w2xJBieNyHDx0UJ1ky503UXtm2Q9Ikm7skmPiMhJ1GrERPMJC
 LPYHHa/0ORqmHtyMYqPhTOZ+bxgV5LDpRpQvCUt+5P7uax2wpNXlPdsBsd3z1m6RPieUIYInmRK
 7SWQDHm/Oo5LF2HmvIKnaKRoDoZCHyKQ2FYL+1Q5vpUXZoGFhN0KHfI0x4O0juErxhiX2CY2C4y
 +WJa/yQwwXWhViYrQjmNjE5YemA8RVOnmNsop8ept+4AzupPJ5uJTl1Soq9Cb2FQyCUXagl8Plc
 Wi/z7ymYHXn6oniM1mJsMn5kvnIlQSvL5A7YxJWByMqCQqXvsX95zmMm1DHIMjqYzqtESqmbXsC
 EoeOqZjUOMmxqCuwmScTxATF91b0CR4WJc+HoL2K/HZG1OPaLuI9cJiPEkwDDFSMcn/mnrJ4GTK
 Y1c/5tauZRBgXW8DUXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040209
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101818-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,packett.cool:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A84639CABA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 02:33:09AM -0300, Val Packett wrote:
> The Motorola Edge 30 is a smartphone released in 2022.
> 
> This commit has the following features working:
> - Display (simplefb)
> - Touchscreen
> - Power and volume buttons
> - Storage (UFS 3.1)
> - Battery (ADSP battmgr)
> - USB (Type-C, 2.0, dual-role)
> - Wi-Fi and Bluetooth (WCN6750 hw1.0)
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> v2: Apply suggestions from Konrad
> v1: https://lore.kernel.org/all/20260329103055.96649-2-val@packett.cool/
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../boot/dts/qcom/sm7325-motorola-dubai.dts   | 1456 +++++++++++++++++
>  2 files changed, 1457 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

