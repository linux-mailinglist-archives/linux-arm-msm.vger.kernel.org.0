Return-Path: <linux-arm-msm+bounces-103222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Em2OoyY3mlTGQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 21:42:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 494EE3FE0E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 21:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE0AB3035AA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E245D2F1FDE;
	Tue, 14 Apr 2026 19:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnOkbEs+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eik+dwUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906AB2773CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 19:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776195721; cv=none; b=Df7SQnRKC/TzB/0PJr5Gkg9m6TJLAZa2Guj0VgNuQW4tT/iZTskqOlNzFQ7cHDIqRI7oDhE/x7az4Dsava6VVAzS2QGxJiLk3g8p6I40zlf+98FeRuC3BaHPLpxHmtrftXE8lzSaMNnDBywpvsoXDxY/RYeXsn7pJrMLFbv/kLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776195721; c=relaxed/simple;
	bh=QkzrnqDcPKFiAQSECbFb5lrm9W3CV2cWM5eswTkD3UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8Wy4hIxhHDYhLXI4/MPIUWs8pvDlJMa384k/ClCISy71OhUy0tOd1yXm82o7Ez8h3MhVCFtUZ9KqBj/47p4dYjQbu+GK4hHH3Fhq30nlJiaCkZF6KFsHmewAzU9kq8YUueUYRRlhLfM4i92lH1N63bVcILUPfzAgFSv7pFp3Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnOkbEs+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eik+dwUq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHbZfi3126759
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 19:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0YWxJ6DZnVNr2AnafJDd/N4S
	yzLD9qWkQCrNOl8YuHc=; b=CnOkbEs+REsdGXlz3hX4Z9mXKrw5OPk5F1vFLIp1
	am+jXuphWpVea2hZMKrCJ/Zphe9GMas5PVxgvVsADX7GpHNUVUZCWvHcnpI9r6tt
	a5IdmJ67oqtl9ESQiIolD96zkeidDBIKfKhQayNTGiRJSFxV6pfNUA8EgEcRI5Sp
	FkslApbjv2Tn9CA6xnWzhpyPL4qdIlcnmoHUFiJcBkqC45/PI5rwwE90/O00DiCR
	nqllCMHGRTySPb1ZG/FFB0nNE4agl0NG5hOaJdXf+BmWMu6K/yg4hXvpMWiaFkNP
	2sH+6Xzzk3utQy76O+TlQTRof7rY4pvcfqc9uad+5a5Uqg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56rdku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 19:41:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d76f460b2so154223051cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 12:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776195719; x=1776800519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0YWxJ6DZnVNr2AnafJDd/N4SyzLD9qWkQCrNOl8YuHc=;
        b=Eik+dwUq4WmUZBtpbyhdcTEterZ+P0irjB9S5rh3kJUiysxFBF2oa2KaPJQ7tNv5LS
         eOpQBu1h99Hy/wQgR0GJLc14W0n9XafCaEELyP7Y0YtFdrDva5Hvv8SJQB109R9qSYqC
         j3ndh+3M/gt7J5X47M5Y8If+RtFfUDaDnpX0roVWZ4XOGu7cTsyXPCyLf480Wk++wjyy
         tem275ZNKLbwTUIRjOFsNGv512yOhoA4rUqaG3KHws4t+XlmD7AV5Uol3eNe6OBogdYT
         ijRO2vI9iOxJe//sn6dqMvdfTFcz4hQUhEvElk4tcT7cPiNGiIMT5xb0fbF8e4x6vkXU
         w82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776195719; x=1776800519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YWxJ6DZnVNr2AnafJDd/N4SyzLD9qWkQCrNOl8YuHc=;
        b=LohsAjlHKfTeYtPJI3jU0o6ilAVGLdTSu7BK+ZNfEgEsA2SV2BiSgzdGLHgE95M8nY
         SKs3sLhEAJN3FqSCL3G985j7RLbUDT8RTEgbR5WzeROctPxoZSAkSQnvaP/eMW8uaPIB
         8SaklVTnORXhA4sj8ugGgiQiqdkaEbnKljQ22QvsEeXB2t7gh6iX7NSGRVf1DIgGh7jB
         I5FmRq2SfCtylulTqQ5QoI9yLYvdyAobtxM4gCNZO1EVg8rVa3KyPND0F+kce1udqr8R
         iS3lb9ASppscQEIdeH9CkX2ESjVntzlIlr9Ubmz9/ZdKjv1QQ5KuVghEnN+IMEOS59ka
         7KMA==
X-Forwarded-Encrypted: i=1; AFNElJ8aTJAbiTXhcs4YEi5jH6v3dLM93QNb5D1EkTelrCneqRis5sr46U9V1vVkioZDqaEHvsKRdTUvUPMdyWWo@vger.kernel.org
X-Gm-Message-State: AOJu0Yyujin29lGswaW5J1TOTQJm/xLsckmuFRZqBwDxPOgzEVHGbXdL
	Oov4SqWuOeuXTpkPs+ktPScH9ujOVbQzp6Vi9V9G5xP4BZneQwWfyxroFUmB/QmxU08smPXExDa
	FCUDE4i/4fqmLan0k7NJ9NOJps7TrNshPFhO77E/bqjGUidXIl+LVqnQiQpT4Irhb3e0+
X-Gm-Gg: AeBDievRnv8X8HVgKL5dscLnM2aFgicb4IQ3f3kuY3oPEYfc0BXdtuakUBi+LQI5WQj
	tTWOTfEasP+WqwZrAlJlV4QmnJ8coiThsV6No5L5DWJxY3IB1VXB/sRpFRbe8OmRrDD3VAJvpME
	uy19yiqevQhVPGq4s14A+GD7itBJrWz9iI4x2eWCBXHMU03k6jpq0HtTU+IlAUT3h2UYEjFV8cS
	tYngsJLZsl2doTVm8FcddjrHL/BKDPScYmFxpig4G1WP/0PzPDtEjAPOLnJCTPGceSHx2AkBtQp
	J6eP/j625XPeRDzY8XpGlOpAzbgMbUn4qJp/IRv8Rmupwk2y4D8zm41uZZxpX0Du86Ygyc5cMvU
	KczImaqxLHbD53/atH1tZ9AKXLEKZkNgxj3COlLHhY6VNxYHuVcrFlayiS6fFXEtnecndrhT+Rm
	k/z1MGE3Yx1YP/MQCn+JKQaJ0t/7FlXps4x4FPekXolDaXWQ==
X-Received: by 2002:a05:622a:ca:b0:50d:e69c:fddd with SMTP id d75a77b69052e-50de69d0ab2mr217328981cf.36.1776195718747;
        Tue, 14 Apr 2026 12:41:58 -0700 (PDT)
X-Received: by 2002:a05:622a:ca:b0:50d:e69c:fddd with SMTP id d75a77b69052e-50de69d0ab2mr217328391cf.36.1776195718201;
        Tue, 14 Apr 2026 12:41:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefe209sm3530550e87.72.2026.04.14.12.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:41:57 -0700 (PDT)
Date: Tue, 14 Apr 2026 22:41:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8916-panasonic-eluga-u2: add
 initial device tree
Message-ID: <azb2e7oiqf4t4xmjqyznzr76medvtljq4ncv46lxoyuv4dsqgu@7hxlao7fp27x>
References: <20260414184429.168612-1-linmengbo06890@proton.me>
 <20260414184429.168612-3-linmengbo06890@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414184429.168612-3-linmengbo06890@proton.me>
X-Authority-Analysis: v=2.4 cv=LuiiDHdc c=1 sm=1 tr=0 ts=69de9887 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=0BkvYA8_tpNE3naGNAUA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE4NCBTYWx0ZWRfX1wR1f1KgwF5X
 bXG2zEBHy+Sjc2PnFiCWQHu+XlkBtAPMKVqwPicDuVh21pZxWxkthMQNVgT+gSvFYzNMexJanz3
 2NT7XoFcVQaM2Z/kYUabtUf/nmh54XccJhRL78une7fhPmuGaOmXlbqk4OBhgAp2FixKZlmbViM
 LvFLVQA6LNrfTO3pkNc0UFDcJo/BoGQxVkdBXh5G0rA7tceO4HXf8JGVhPbhk7onm8q0nJLfgns
 Vu4zazEFzs/IhStjs2s+tRr92Xy4ox4c7kj2MBZquMLHgR4kwxFuSE2NJjD/cxYK/NXk6T60lLt
 V0mY/L/OLgvBvLl1R9GwK+c+6oV+hWKNly/zUA6Ml0ovavFJYvffOgp2BM2hSUIpJqozmPG0b36
 RmtvSbZvYLIzAtKo0bQtCRbTh2KTYGya8c4bFnI4FKIzRHP3PTW7FR+WOFIIUI/DUe78c1BADtl
 hScFlE/cdd6wD64SiKw==
X-Proofpoint-ORIG-GUID: uIHSUoItfohQA15UBg8KUCOwPv9RHgdI
X-Proofpoint-GUID: uIHSUoItfohQA15UBg8KUCOwPv9RHgdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140184
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
	TAGGED_FROM(0.00)[bounces-103222-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 494EE3FE0E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 06:44:55PM +0000, Lin, Meng-Bo wrote:
> Panasonic ELUGA U2 is a phone using the MSM8916 SoC released in 2015.
> 
> Add a device tree for with initial support for:
> 
> - GPIO keys
> - GPIO LEDs
> - pm8916-vibrator
> - SDHCI (internal and external storage)
> - USB Device Mode
> - UART
> - Regulators
> 
> Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/msm8916-panasonic-eluga-u2.dts   | 149 ++++++++++++++++++
>  2 files changed, 150 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-panasonic-eluga-u2.dts
> 
> +&venus {
> +	status = "okay";

Does it work with the standard Venus firmware or do you use a
device-specific one?

> +};
> +
> +&venus_mem {
> +	status = "okay";
> +};
> -- 
> 2.47.3
> 
> 

-- 
With best wishes
Dmitry

