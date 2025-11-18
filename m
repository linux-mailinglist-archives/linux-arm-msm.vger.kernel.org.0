Return-Path: <linux-arm-msm+bounces-82178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C53C67439
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 05:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id E6E292A3A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 04:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FB329AB1A;
	Tue, 18 Nov 2025 04:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TeNjjjLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbVLZ6WS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CD5285417
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763440273; cv=none; b=m7Y426kSG2IVvFGXnLioLaE01c3kBqu/XAoQKCgJnUh8axV+6laI4luPMhJkgFntTTiDliglgvsGZiUBXo33pVtRKDyKaiAuCVAT4Ry61ZuahXUujn8F4w9RvEM7Ly5uh5deB4/uEjrT/hkFL9XXU6GCZ/tFf4Mend4O9CxnM9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763440273; c=relaxed/simple;
	bh=HavdvHtaUmsPCbS17TWupL2hRZZl5Of/xAeauK0azg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PH2S1btI1YfwjoVTHwmy3WTwxGZ12VvCQfFJLNKHzdAIpSIhEuxkobB4Hj9VwXp1FqcB4w+WxhbfDP2wBpjEeX60XYAXWWWYSML5H1chB+/krEhDXHXkhujoUJBtcAbuqHdKF1ODelzUfOO5k2CZogRvxsVSH8N5v1rFf0k+GLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TeNjjjLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbVLZ6WS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI2w9Rt375768
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XOqRyNm6zGDnKkA4W+0GBFVa
	0Eebq9X1l2piDS1JtGA=; b=TeNjjjLXQ1iBjHdBfCAZiLw8sAYXTKTvvseUi9p2
	yU06+wE4RF2P4fgZ/lTDhhB2bJjLZ2UaGGDLNLtC0DHGapL+WGtNYpglphnZRG8T
	5f7nHzdxbDhX241wNVe3ivXwtGXjsd4TGvBhZVelaJBNh76IAVd218gwliF8OtP4
	NJQbV77czO73CaLYjsvbVzDTmtS5cfFK2fnLv2c9C/J8l/tR/chDygZPig+HY/ym
	xf78Wm48L0nzV3pr7OVoD6cm3JZvphGiP0f08kkAtSzva7ZsfvgeGaaI7C5ALNhB
	OtmsHaE+7HuFXOKB6+35eZvXplj7KJ7iSwoTAflGYNSXkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76nhs3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:31:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2ef6c8340so497527885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 20:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763440268; x=1764045068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XOqRyNm6zGDnKkA4W+0GBFVa0Eebq9X1l2piDS1JtGA=;
        b=bbVLZ6WSMfn++wRgaC6LRnsfCBgQnXyDUNzsW09ZUirRjRKru2me8GVmxLSCs6wPEA
         w6IfSqpgHIfLcyFJiIynrJgulbgOeUgzo9KEltyGhmwDQhUZbamdKBmxHUBU/AWdvCWu
         2E1zfznU7kd0xjR8nk1FC19XadYIUspL8RhjvRVpsxZQoMMrIXrqtawnwLxKkuGQz4LY
         o6xRVaAT9q+u+kYPOa+wN+UJppd1WiSez90g5wGL9crlt12wD+kobmRm2KROprzZMoBY
         IMOPlSFHPRatNFqNWAnYNRbV5BX2JSzW6cS6T+7bGB2AcyiuO+oTcjKh4x2fHR7wnkjD
         3R9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763440268; x=1764045068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOqRyNm6zGDnKkA4W+0GBFVa0Eebq9X1l2piDS1JtGA=;
        b=IvGuCUl053nTZnEhAepGg5JltKLmlyYB4/H1gtFpJy1C/Bnr+EFvUq3n7Uj31dTqu2
         VwfWDj6DqKI9CpcxvU4hDcwqdsE0bojEfKGsGQ3+umCy8SnkwRIooXt09ClBLMDvDkb4
         7473zX/MqhzpBOL1uIouvKgjYs5d/4aD5DX7gl/+CnXm9DFHw1nvVNDnwgbLtUBHekQH
         1Guo+BEbgSXP0fTAla3wmaooYv519NOWvgXG/wyB+P8dfHQPAEnH6vYodm2hnA+/2lBg
         0Y3iHoMXud84tW06GdaOJTMcuR4prNRhBYEDYeQovZzyyZcUlKKuV993wXYO4u04qBQ/
         tmkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV41XhiHIN8h+myT0O6QFtUqY/PMeXHsr7gQGsTmUUBPAL5MUiDwEuLIgyNyav+Hys96osO+T3nDypICQZd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7UswpI8zGmNPz+xJMecSSXYoiu/7y5YnJ1kjyWSjGZoC9Cp01
	bvgF/0/ohvYA0DEl7H9c8thpy/2sUcXUpco3U+3+6BwLGXkPIDqV4NN4agu3eXSK1s9wGz1P71H
	QCK5MuHF3bim9AjV3RLnqMPmf7Vvm+pRGH47PSzCOMmsgGtZ/L0Mq+nUu2L9RzNauT+TUvE+Mte
	lj
X-Gm-Gg: ASbGncuw80gMZQCWVM/KAC+1AJsKvQOI7Zg3AN3kNa0LkaZjbU0es5oU5KiT+oQpSrJ
	eI7N8nqXjBNbP9h7RxMuk8Iavee0ybSSvUXQmBDNkXxX1Dk2yjB6qhGGLv+iGGmu7rD3WGOapSQ
	AldgpGWHZPPTDFnlVjK9HJB4Pp/ivnIRP9Vo+V06nJ28iYlxoaXf5gqJlGI4KTlDoHCJ3F1NTBv
	j0lHzL85TDKTpQsitv4+clDs4oEyVUkxTH6GLSwTSK9KQe6JnL/hTMA++uAIf15oCYJUXPIAQY8
	zxisn4vmDMhX92LKEzB0Vk17Oc+Z+ebZkGcKb7qcPMuyMJwQRMlg+K0BdxsBPiCo9ATDbIpaghM
	20F1gcviq9DSgwzZ9d8frKM3WrQDVSrvxg8aJKURSTJ29gNFIV/Bsuk/ityrziDhJaiAy67l2PQ
	+wJh6MjmMYQ4b2
X-Received: by 2002:a05:620a:414a:b0:8b2:aaa5:e88f with SMTP id af79cd13be357-8b300f31428mr232180785a.30.1763440268437;
        Mon, 17 Nov 2025 20:31:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGINp4LrB+FLyj7KzZYhj6XUNXFOyCPdfbPL47E9cNSd2RbBsvLl0Yedu+4HF+/OLtvSbzn6g==
X-Received: by 2002:a05:620a:414a:b0:8b2:aaa5:e88f with SMTP id af79cd13be357-8b300f31428mr232178185a.30.1763440268034;
        Mon, 17 Nov 2025 20:31:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040049fsm3651658e87.61.2025.11.17.20.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 20:31:07 -0800 (PST)
Date: Tue, 18 Nov 2025 06:31:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Allow LED_COLOR_ID_MULTI
Message-ID: <27lvlcu65hdtm3nlovi43pfzi3kwelgm5ruzhnwqpmxdaepnok@lqeq3y2boeyf>
References: <20251117-topic-lpg_multi-v1-1-05604374a2dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-topic-lpg_multi-v1-1-05604374a2dd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAzMyBTYWx0ZWRfX44LZ3I0c4+n9
 RsllRJEYio8o9kSKdZ8VcQJNb1+bVRKFVTDVVcCI8afnnX/Fx2BaDhAKL0oxNhU34QiHBQb5lX+
 KfGtVbNZIdi2J44yHp/pvs/WSNrvQlOpIUEvMSKY8p7J9Voybhg++eTE00ciaL254336o7CIOnR
 z0zLnFBXpcd6bluzNUCa2+eKeVVvvcDvv1G7jPzEbv8+GxQlOzAgKp7MLODoVtA8ClZWUpGKNUU
 kjqwuAoyxzJhCpPbWjLbXUnkwe2P/R6vU/5zNVCy0LiGPNF/03aox2pufDNkvKa2u4UU/ym1GCx
 bO0SzN6WpZEc/Bodho+7JjC29YKcgOPaVSww5g5La6JvcesqdAqx5tOtsUQJfAP8Tk0YBfF5bYH
 DeBcvWj24mFEF2wXQaD4S0j2KzpQLQ==
X-Proofpoint-GUID: W7wPSnthF53MpDEVCqiYloga0FRRboko
X-Proofpoint-ORIG-GUID: W7wPSnthF53MpDEVCqiYloga0FRRboko
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691bf68d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tMveQlRAX1j2jsrkZ7EA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180033

On Mon, Nov 17, 2025 at 02:45:59PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There's nothing special about RGB multi-led instances. Allow any color
> combinations by simply extending the "if _RGB" checks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

