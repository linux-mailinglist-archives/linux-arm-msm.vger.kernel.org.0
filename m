Return-Path: <linux-arm-msm+bounces-117593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +Zd3NlU1TmpVIAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:32:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 304F4725976
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:32:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hAk0lkI1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VkNwpd8l;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117593-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117593-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E88BD306445F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D263D349C;
	Wed,  8 Jul 2026 11:27:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D72041A798
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:27:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510057; cv=none; b=rgIuwKWE32Hu6NkA25UqyHkXjQXeiAsS9725X6KKvRo9e5SzeM45t0UHcVCNMAVa0xK73w0kYDBsHlm80nffygVUT9UCEHX+Iivxbo+oPYxMyde/PfaZp0Hhvc1wB9Km0cdBXSOrgRyOLy6tz8ATKZZ7b4wASNy52xbilv/Yi40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510057; c=relaxed/simple;
	bh=0E98CbxoAH7NU/gIZrLxvwh1LenoxDPx78uQooU65Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNbreBxIyi1o6zy7JuvncIVusnwhZKyBcIcj6XIwBcEu//To3ndzl4uDhWyiAkVjEbD6i9fys4RlMGJqEXmoHOVNQ7U+1HAVxtpobvxAvfUjDrwVxGauoQ85RX7yCELX6rItirfiKdT0iESBsBpw0btsAhGTKKOzQZRSQFAgMYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAk0lkI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkNwpd8l; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66888s3E2204654
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oqQbi3O1Ir9tPu1Uux9QRrMs
	J6SDU3Wfujb5UtxPzak=; b=hAk0lkI1jTSi74wZREd+sFw9OpGw/e+6u8YiC1cM
	EuAkXgaljFFe4D7XAXtJfMZFfvXXneU6EeDyihXsdEQPkWjxOMQmlJxccnIFfkxa
	eOo2ISfV3KI+IVmK7wg7IleAARgtlIbnu0hsmVRndAxwoFaETnRdr0wmumt1GvDT
	rnj1/YBs4UPKSWuduSizoB2jIJDy6mRigIM5gWmC4lxZwvSXPa+WVEPoTaODHrbD
	6F+d+ENeYuTuAtbZrZJqYuT2cCPcfBryV49Y/Jau+D5S2D1ipfwS7aCZvF3xbgT9
	qGfjevTEtLkQFbHDF6KdV+gg9vwCSSQCjFdDPHHYOV2hDQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv1223-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:27:35 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e80385dbso36951137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783510054; x=1784114854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqQbi3O1Ir9tPu1Uux9QRrMsJ6SDU3Wfujb5UtxPzak=;
        b=VkNwpd8lxSSELMls1/t02DimskFbrgK1z+yO1GJyVknpF0+jzFA1GduftCyOkcpGIr
         ziQtTJB+pfDU7G4dd3gYxXUmHNuEfrUafN8RZ/vSQVMMk3zx0IzYqJpQzsLYUAuToEvf
         VdmPve6e2nkEbeTLxsNydq29821L00+dT2EYmzjqzhZ2tmrz0YDmWcqw/Z+itkA19y77
         4tIjO3PG+LOkhAdWA6nQmtTfYrPFX8rCdaevaHSTnNWQ/W0ZozlRl84tjAJUSB4Qsok2
         7/whOpjSfht3Ck7OWS3QNa3+7DPxDAtg+0QZQGGI4aKZtNJS3B8GivgbAs5kse46zOHc
         D6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510054; x=1784114854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqQbi3O1Ir9tPu1Uux9QRrMsJ6SDU3Wfujb5UtxPzak=;
        b=AL+Q5CucM+YUYL9tzGnc+bxzJ6MIXiB9/GNgZ44ztof19zKYTOC+1wIpqqO1dRixSt
         sFRdhhXH/16PZbqxGjCtjZ8vIEj3i7n6+JSPTfX9ttieu4Wy8wbSMqpY+JeZ7WcVgOvU
         lJd1pRRlu0OK7KDUiEEHOx3hxl2OFvULcyLepglTIZKiKuyiDpsLoodfipbKGpxnjuJ3
         nAi8rAJX1QS3xtzzyl7KjeAC3rIOzQEBC6wFLlaYqlzaOPiO+2WrNwp59wQb8Rtfgz12
         1pjmI9LcTXmCCybsWPbHJpwKTe7Jcs/PWjvEsPG9+uJ1K2XJUWILEj5pH77eDyEJ3Mde
         S5SQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCEWquncgRW415zY5H+EgMfRYcb/h7Ti16u3n6PE06Ay9d/8K1Y3oyQnPE+G8GOIBLGlr/rujOCqS7brRQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwwctxnOnanESlJATJIZxMyE5D9sIbKAEnD754ziI2avllrGDXh
	vlV9ZlewFvBreHwPkf2l0avE8LoMfjU6vMonl1ovSUDACeQmsEporQEi0K1VI+jX0uO+6d+8Avg
	nRwjKsxpsluwb/LOBisBNgl9Nj8sWBKWnDc5CyQIA7PKHnVOgxrJFOy3i7unVGM+vUyAwFB4zgh
	R9
X-Gm-Gg: AfdE7cnpxXqROr7uLNhKV3ajOL7Llv6fxKrUHXcC0W+AuPti9icSLk1bRWZ4VGYvk1K
	wqvEMNTAtetNLsS3vohpw4s2yg6d93nZTDdJPbRDrrFPwUN4a5qmUKsv16jLl7+ERgz30AzrrWb
	MwNRVHcrbs6jgEhO2nex9ZYA982iGp1FV+b4kb6mC0JC1+SQqJZzBMYNVrVSnVtp84iaocrj4V4
	+RWmglBb3lH3S4geojvCPkXNNpSkW5wDWAyCSOxrZQQlXrmBDMEtzW25mASbejIeceJSV4Ed1L3
	kNTnoq45+m6Ysklt2lop7h+N+/ScFH/oIHWPSXmWIRms+70/Qr3soLdDPaoIJyyeB0IZ+3wo9mk
	u4B9VgbX+cvRh3i3drMPXEgHg6/awr/KZnmS3MTzKflZLlin+EO1X6DLOWNguLK/RiMrNkO7oky
	jM9wlm0p0Mh4/3mjSezk5NI39C
X-Received: by 2002:a05:6102:2d01:b0:73a:128c:4e38 with SMTP id ada2fe7eead31-744e03ca77cmr913900137.27.1783510054235;
        Wed, 08 Jul 2026 04:27:34 -0700 (PDT)
X-Received: by 2002:a05:6102:2d01:b0:73a:128c:4e38 with SMTP id ada2fe7eead31-744e03ca77cmr913888137.27.1783510053825;
        Wed, 08 Jul 2026 04:27:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad1c8f9sm33991581fa.4.2026.07.08.04.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:27:32 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:27:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] clk: qcom: ipq9650: Add clocks for the REFGEN block
Message-ID: <i5lqugso6ejwumiiaw5a3flycyuvm3kz2b7thesiygxlbyulaf@ygwfp26dxzhp>
References: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
 <20260707-b4-ipq9650_refgen_clocks-v1-2-e070624d03d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-b4-ipq9650_refgen_clocks-v1-2-e070624d03d2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e3427 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=u8PmIFPGs7L9BQWs_BAA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX6Ywx9tTyfqPc
 CxdA0Cw+J7ziAbsOzV1Anre+8vpq2RiQ8I6o5qqMvtJGwElKTVk8NaYGol1aKnZFWjfsiFRw+sz
 KrQTurCFx5Ksn+9lC19IVaJk7LbVbVY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX1627X26KN4Wb
 PkpehTujUyI9s6L1m6QXE9B+De0eydPQXKgA1nb6ZujuB2Mrx22wEF9y456IxwoYj7tpXqGufAL
 8UKi7SC5ykVIPvHO0hOrNo9sL4fCavLEaS7wel6+ULl1sAVwmoAsvzcDyzZeVVyO6t2dGHBGPKj
 GRLOpqcZmf07JowChMHYZfMGDly903iJgdLL75qy2/bIdyNYkfbIGKZrei+7ioXzo6ZG1rQnw26
 j/RRMkfSfa5qn4ANqm9LYkZTGIOwO1dRAXDrc1pt9TboTlAQfydQb+H4keiJjW9XbrMMbDuX+kO
 ZJfSLVAVlbGRAXJTKag0JanPEfvegMiAZNSo2fcz5wN3eEwhSI2LSus/+r/M+66mw3Eza8Npa/2
 yEmAjkpslcc3XGCNF5b1TF9D+e9GMSrd4gX34J6Da9LET7JTnB84NlDKzf/qmaEgcUd6NGykWlo
 vQnoXQmnXRkKnWtF78A==
X-Proofpoint-ORIG-GUID: Ai3QLYaM41kep5fGCv8j5Q6v6NiCmagy
X-Proofpoint-GUID: Ai3QLYaM41kep5fGCv8j5Q6v6NiCmagy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117593-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 304F4725976

On Tue, Jul 07, 2026 at 12:25:24PM +0530, Kathiravan Thirumoorthy wrote:
> Add the clocks required to enable the REFGEN block which provides the
> reference current to the PHYs in the SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-ipq9650.c | 89 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

