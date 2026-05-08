Return-Path: <linux-arm-msm+bounces-106761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C0QNrJ3/mk8rQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:54:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 203654FCEE6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39451302A6BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 23:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F0B36998C;
	Fri,  8 May 2026 23:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqAva3Jo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BFcOFUUv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02530368294
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 23:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284453; cv=none; b=NEvHt3InY9e9p7fpJqJEZnMyJ8MT0oMPIoT32aqXEPZ86QyVfq4v6BvvgExUk5gDGsJSfGZkrgf6AiC8DeMrculpsQJZbYsqiKiq5TErAJQhkZ0kG0qVSp4gN2slKPJgvwYSG1wVwrRcy1I5q2HKr6Aa76bK/Tgz64hrVqVu4jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284453; c=relaxed/simple;
	bh=M+irl09BB3lpaeKwpF9y+VIsDUUpMsVxXvjsUgdWUqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ia0J/I9mD7aTVBqBN+xki+/NE7fkdCdCy67+ugZ46kikop8avQEv6bKkzk4KZxj33TcZVWbEM02FW3CyHwqWR+Bql4tUIKNHd7w9F5/mIzI0aWTjxBRSq+2tgOwRFJBSaUY7zZDlQWcG6CAfHgXY4aTmzpegfgXYGI0W8G3PWPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqAva3Jo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BFcOFUUv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648He03x874422
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 23:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U/y3XlxsK17A/ooTr1YrUKH/
	737x87wh9dKRfPzZz/0=; b=lqAva3JoUFBU9P+C0Ml+j8gYnNhFiFc4GcfrBw+P
	1Br3PBFnhgd2J/28iJNuOVg3yzCWJ0yXdoEqmFwWo3vU6y0WUgUmJ5n2ybbYmqCa
	VzEcnExd7j7kcY4CVsobvZ8jD88fjcow8e1rydxfbRHrviHGHn4HATI9XUyLFUkX
	bLbFNs85gQa+70lp0VDf6axj8ajhYDgmLNz86OuN4zyTJ7k9CS9ZZQ5KSq1NpRej
	DUND+xAGgqWKUjBrw1yU6AwD02KR93lWUNyyA7Bih+wMDEMfvJtdifv7V9CB8Qes
	Ypz2qATIOGnilaWGipCM0WMu1RdONUd3kaoPgMQKTEeOFA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1me80yum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 23:54:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb6d713ddso43729201cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 16:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778284450; x=1778889250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U/y3XlxsK17A/ooTr1YrUKH/737x87wh9dKRfPzZz/0=;
        b=BFcOFUUvbCPN5A4umTLabOgFAG+TrOIkFYBzxv2O4PG5Vo7czHUlJlojXhvOfBkvyI
         xQ4IBJMxtZyZZlh8S3aXlLtnh4uB0KSxS2fr3St4L7V494FHSweLcx7iFUZ9hYuO+1WR
         aVkoduV1M+eH7ZIgaTYCH/LO5IT94a5xH9cBk17P6Dwt3z19wW2caCxEeS/zk5o+DsmN
         DI6kpMQlGNrhGllFe5oaUDodJXAT2Y3VXJyNGxjUK3zeum/jULp8SEKDobHfa5hJq1//
         A2xkObA7Hfb6VikZqZQLWRaETqCrOZVgq+A6XZ3/jkM4jcruuHuuWV61TtGvPWsTjcc9
         Is6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778284450; x=1778889250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/y3XlxsK17A/ooTr1YrUKH/737x87wh9dKRfPzZz/0=;
        b=fDtbgfWK66M75TvnIknLeCxSMsFHkLuvzebXeDcFfQWhZkkTI97jzImfT5Mxb7Fdcc
         qQKz+t4HYCYqBix00obaEgkRnwKP/vaKC0sO4u+jWHR4EZb6e59bUsS000chF3gLQ94E
         fHpqQAm1EYrWxAkWeBisy7ycrO4v7NROm/PIb/JGEJb1CHa8qH9bd7YSMnNh+nohzaV6
         M92VYmY6N7IDmsiC/eGFm/Nmnw9+7+LP178KiraZacMdAv81UJCHFoREPde/p2Samcir
         ost2f9EvrJYtgupLsjNMdmWql0zxd+G3m5Yi6ssgJUrX0+aX0Sfwf9sfR71f8fnN7gSv
         5tPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+daPVjwbttHI5zGjrOzmgiSCOYm+KfORiaEC566Cbx8jclXlpFmZPUlWofKOqvIHyWaNy+645U+Oj2ztcr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg3gbMyomVbAlhpYAW+MGht0ZBOZ9vgWIl825rF4MslTOG1TiK
	iTA1A9BfGKAlCHFu7WveqiKzq2Eh8uHX0m+q37431G3xbYCgHA4mlxpIYNj1RFzfkQDA+rn0rDZ
	WhyZjRbEup/yYO3EAo5Tp2nIjr0qG2yPLHSKzrDe21V4IP/9JhRYdz/tgETCLUZJ8hZs9
X-Gm-Gg: AeBDiet6o1VRFKJ1ttjKYG+RCFWa0JF4C/OJakZ62LlMi/5PZi0sHkNY5BAlZkZ0voQ
	Xg0uQ24dG60H8DTMuepelqF90nEIPRlD37Wr/jelc2nxTeJXJu3S4NxMM3ZWDmUtKU6ghI/W3ki
	v6stw1Z1QY+QBUP7NHr0P6I/7hB27dkyzCz0uyttH/5zgeeUTn9ZcdZDogVFfbmSvCB1q6zufab
	sqR/al3t5M+OTnlzn7yqnXvqaBhgQW1hrU2C3NPMbWphwxBdD/zMv3j4LQz/UbC9XUz3oToMXOp
	EImO1GqW8MRYHTOeJ6/oDezIeIkSQaZo9oEq8FswCo3bSFhjRwobzSaXsLsQMvR/weEjWNnlqCs
	mNB5HCtaOye+kl/qQfqwkU09EsnoGnWbH9jOQeup9PEO0CbQ/6Vi1eImn3g+1W6qYBF6vnNNdm4
	ap4SQ3NyAJMI1GEr/03vjAQx0tdbaWWlsWHlNRVx5Gq8kMLQ==
X-Received: by 2002:ac8:7f01:0:b0:50d:8050:a358 with SMTP id d75a77b69052e-51461fcf281mr213549751cf.47.1778284450335;
        Fri, 08 May 2026 16:54:10 -0700 (PDT)
X-Received: by 2002:ac8:7f01:0:b0:50d:8050:a358 with SMTP id d75a77b69052e-51461fcf281mr213549431cf.47.1778284449855;
        Fri, 08 May 2026 16:54:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393fa029671sm7049111fa.36.2026.05.08.16.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:54:07 -0700 (PDT)
Date: Sat, 9 May 2026 02:54:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Message-ID: <676tz2xvipbhm25djmbqokfemscjjwwjethvglycvzqqtsf2uj@xlqiuzyqyfax>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-14-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-14-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzNiBTYWx0ZWRfX2FM8e2XLCfFn
 T+iPZysgnqd4j4M+RARlMrUxTfCtv8/Aulhi99YWkSH0z8egis5sJlkA+aGCfwmdv0N8qSDYJNt
 dBrLJ6Q+jl0eFdTn+5fkYYNApEd3qr9SWMxxmZcp6yOzitCvQwADMwct+F2nGDvg9vzzCuJVu9r
 6cZsCEG/nMzECtqIyO0fcLdisu32wszX4NVS0gRWinQyXVCrpnpYNEJ+0gj6vOBOsKNA4WFPkeS
 3YgznU4ZeLziZylenHk6q0zF5JcN6LEj7xPg04XJ08JJWhCoQiMIO71w4PJJghzz10sO0bxDGuk
 xUHEeDZqEQFBk7v1XmwKJzr8ZPBuw0/hFycwPsrSA+j4GaJebUbri6KLmYOS9V8njbBfSKgQP6W
 iZN6/94xuysa9UKRpupALPJTg9VF4R83mRhYVKUHI2HauQjxh0sCWNgfeyTzs2NMJOolZ3LhG6z
 wbYpmZL1XzLlZfNIf2A==
X-Authority-Analysis: v=2.4 cv=BsKtB4X5 c=1 sm=1 tr=0 ts=69fe77a2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MCItce8SuK6p_Dj8i7MA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WGMDfUcUqxCSvH4v6mZ3bay_sqQjddFc
X-Proofpoint-ORIG-GUID: WGMDfUcUqxCSvH4v6mZ3bay_sqQjddFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080236
X-Rspamd-Queue-Id: 203654FCEE6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106761-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:30:03AM +0530, Vishnu Reddy wrote:
> The iris hardware block is described in the glymur SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

