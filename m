Return-Path: <linux-arm-msm+bounces-104139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLCPJkLp6GmkRgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:29:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C2B447E83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 770683034289
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C2333F59E;
	Wed, 22 Apr 2026 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPc4kSjK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxfZXHY0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41A933A9C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776871517; cv=none; b=qu7vCQArtDCsDJkWmZP2xgJ6RWepaVWnn6K0puIgiyXtrV/PzGV075XVOv5FTuYM2amGVT4C2YlFs70zJ/1f5w8Td83M18J3X7y5UT/imUggZAL8m4m33FHphbQQ5DhggE4ViO+U6bxoMMNPT5USR5ySzW9eH7voTtTnL4vGmQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776871517; c=relaxed/simple;
	bh=W/o4CK/M62/W4UaDTIsuYYRjmgttl5pkwqHmlVa8Yao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0dD7DIwwZhtyqZVsN0WdtQiQr5q0JDz9T2oQEqit9vh0SyZVppMUA6Dq/BGdbUtucyBnOaknS6dZ036R1TxKNgon0+cF5nLJSI0vHaXVLhNfYsjHzRJCdGQql94xwuE+v2hMv7IsKP4T20VnuX2a3uJJfphRl0Y0dy2zHBtFlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPc4kSjK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxfZXHY0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99EjD1443728
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XBjmt240DJA0WcHkbd/6a3tL
	PkKq8fZWKUi6P5JuDHg=; b=hPc4kSjKwiw6RNRSChLJe7eo/HHjzvGEqUHdedtH
	nl4KzpMt7sAxWIbK/rQ0fJRn8ydG3l+G+iVgvSMOuOXIQcsz8om4ZjSLva+7heRt
	aA5OsKjTPn1pp5ICPtPqS2KhkWDyHI7lhZC9KxfhVqO5RIie8oQr4jogB3J3NAfK
	QZiUEdI9JGeeTmk90huBd4eCK2TwtEh5medWpjOM/stcEC6dVNtDmusDtMk2hx3b
	YtPC1CrCq8iHecgbwnUkgUQfoKTMKwoxrZ01DaURBiyMiLpggLmpMfBQfRQWhd51
	ChzuBCPhnk0WvZCjcECD0pFddiE0AZdbTW/bIIoazRFDLw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfuwum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:25:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5fb6622ca5dso2392812137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776871513; x=1777476313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XBjmt240DJA0WcHkbd/6a3tLPkKq8fZWKUi6P5JuDHg=;
        b=NxfZXHY0ZAy3O+ZzbBbv2uviqlSTIVpYu1YQGSWX2VrQo+uhPNpZlO5tSm/oe1tOHn
         SVjkh/pEYL4kwnRypH5dEpQvqmEQXXibInyqXtFQwnwjFvwHpfcyomMS8yOTwDLDwgLr
         xskaktsDcsgdLus5GYq4uFjG4y0XJ5KIHMGBata/XahjtSm+HJo+retFCHJolQY1IBl3
         wAMgnrCajhJqi/8k8Xl/Jd5jH9yM6RAQNR41+V+AZoQYzZdWdURiJMxO62URbsZV0uTb
         pNY4cCuww9AhH3fU02zHv/cczyna+MVZOvzDovu2Aby2EFaisjNiEu5gUNsFTTJ3NTxc
         JeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776871513; x=1777476313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBjmt240DJA0WcHkbd/6a3tLPkKq8fZWKUi6P5JuDHg=;
        b=WrjdVxFI4lPPLhv4lCz3n1jcmO1HYuwx+WMdv/wWaK3FTlddhRUcksEeMcMwGUafJM
         BL2JdXtqJqk1IohKmanHVZytBovnSRkbsPSdzS1oZwi2bkOsF8WaIMWqwWpXxyRF38nB
         A6zORN75KKUEyAh+sOLvCGUgiLJFSm7P+TimGHKntyQziw48IZoT1UovKk9xOcRq7OVA
         gaoFM6HJ9cjxQwl+74ocDOcVTuWEXD1GLrFKZnh63ZTH5pDBBR8ZHDCa4SdnT64dLvHw
         LSquV0+WOUxU1zLsuA7niBFrpFUajnmCmanslGXSsFpzXc6gYwG74x2GiTKZ8Wk6oO5W
         VgNA==
X-Forwarded-Encrypted: i=1; AFNElJ8tXBBGzX47en/Ka5Y8meAN5+RqDXs+1U7zJl1fUYvZBdS7jQsGkSOaOhQK4BNty8ovueU1SwhiFRbLrz6Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxce+6D/squR/Leeu//tBmC0rwxyUU0MOtfbdJz5+IYjeT+C0EJ
	TC8lddcdw3kkm/zXNXmDTNHQGLJ7Lr9vgFIoMVTguROUTGqjf8ojTREEqWgCxCE4W1OJuj9FDFe
	S69qIVVj5dkxSMjXs7MgejzWKTiwxOyuchMqPgJd0iipgaFlK8tPqL4ciCGhb3vB5EhIA
X-Gm-Gg: AeBDietDoBdc2nO/zM6Sg+4ttKJl5tF5bjut2srrvzmFANCMC+CBuRTWbjNS/L2flLr
	NPAgBidUi63Oxcl2P1TjXGhOwpiAhqnlbPxhjYVviv67X0Cd/bYQMZLFZjSkQwaB4A3GzpFznlh
	Neg3UQtVN5AwQee6xVw4VHBH+rZy0EUvvw/NoXvQ+VF3GK3nolnu+u9HF6oGMHaD7H4oZMDAY/S
	B7CvEA7i2XtjSk+ceRDof/I7WyBpsgKABZ1QbbtwXyPBr2c2ZdwhVB2mWeJ/IeX+qD8t/33alwe
	C17YXX20+TgK12O6rHakMitIyVirOyYRkQ/483Tx0pwEtWE8Do0qA77KpsDy5E1bkURF+Vdqr1i
	255bGOrQ3us3UXesIPvh43N/s10f5Lo4d8bKc6TDMYpbkDIo6i856ggWtdoeYBflCVn9eFoSPGC
	R3UkEnbzawJ4kFfQpYhmMRymMWGrVWYVSmtg/QishqshG4og==
X-Received: by 2002:a05:6102:5122:b0:608:759a:53bc with SMTP id ada2fe7eead31-616f1c595b4mr9994386137.0.1776871513034;
        Wed, 22 Apr 2026 08:25:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5122:b0:608:759a:53bc with SMTP id ada2fe7eead31-616f1c595b4mr9994349137.0.1776871512472;
        Wed, 22 Apr 2026 08:25:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebea2sm4416197e87.76.2026.04.22.08.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:25:11 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:25:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add interconnect provider driver
 for Nord SoC
Message-ID: <l2o2g2gci5o5wzfhxln323eym3vb6xfaboff6plfg42re6hc2x@oygjgy6tpxey>
References: <20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com>
 <20260420021351.1239355-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420021351.1239355-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: l6DgWhD2pNTDByDF04ZOkIWshDnX95LA
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e8e85a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wvzT7jLtkUm77yG2w9UA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE0OSBTYWx0ZWRfX4l3vyGO+S3i5
 QJhvi5jYmn8K5nZOfYT+Gs4Nq9ENVC42TLcvXHxfZyy90GbnxPbvoEx+OmSGKBMowbHlVs6RoZw
 4s5MT4eGfBaQcNy0cqhk3iqmj3R6nb4NOuocmvUYZbRPCurIFQ7eRVYpD7DVY8gZzk575Q7WR7b
 Y4RqdSQNgA+AHtNoN3Mov/h+8QfQ6eAqPeAh66bDuTwWhG/mSgkPJQUW8BvFCG1vymaBarYYHoj
 V7nvz/4W0sQfsHt65ehKR7DswvH2Z0gXLhYvEQAcFKn+VuKvB3VnD8NVlbtGzXzvJkyLBRytaXZ
 irmIBhzEM6WJVz0VT9pV0ZFnN3gulsRE3GEjQzvDbxCn6KqucsEQI6JvfVEb1w5CqQ8ivUV3/xI
 PEeYev60CdM/fQOMdtkigl6db2lCqwfDTeYMlahi6CrlGs2pV5hf+ZkA/KGj9dLliPpEJ7Y0IaS
 D4juDXSS+Olnnw1TNjw==
X-Proofpoint-ORIG-GUID: l6DgWhD2pNTDByDF04ZOkIWshDnX95LA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220149
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
	TAGGED_FROM(0.00)[bounces-104139-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 16C2B447E83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 10:13:51AM +0800, Shawn Guo wrote:
> From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> 
> Add driver for the Qualcomm interconnect buses found on Nord SoC.
> The topology consists of several NoCs that are controlled by
> a remote processor that collects the aggregated bandwidth for each
> master-slave pair.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |   11 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/nord.c   | 2682 ++++++++++++++++++++++++++++
>  3 files changed, 2695 insertions(+)
>  create mode 100644 drivers/interconnect/qcom/nord.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

