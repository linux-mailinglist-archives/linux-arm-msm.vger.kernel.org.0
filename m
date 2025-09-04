Return-Path: <linux-arm-msm+bounces-72064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34694B43DF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBB901C21F81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2E6306497;
	Thu,  4 Sep 2025 14:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvZD2U9R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874E12FD7A0
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756994613; cv=none; b=rzLsmkv+GDRlD9eB1PudRwKaek7y2z/xAfiom5B3CZjFEmeTdsoa1VleTfRwKesJIGZ9335F2bVgi/VZPZce8AqAvU3cpehknXtHqGum8E/qvruNDjhHB1Lt8fbtgiFwMTj0PgyUuGnZ7n3QPhcvVVZDIfgxKdWkAftVk+xN/RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756994613; c=relaxed/simple;
	bh=ArO34LFWAHT6cgbIIgrLmpPjzc7jkLJhhCwhm9njkJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHad09pPuKIwf+/1WUvSWHXO2p+VP66hendXxTaittNsAbeWRE+edema2gg3X7PvTZdjq7xKeM6n1yvd1WWaWas4ud1b9TyMF9yAExT+DCp90Vf5aoJf3O4YIF97TCs76c3QqaueM7U4FWixoCE8echp/G+qNZO+A/ijfXEXjRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvZD2U9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XDQS003172
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 14:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWpJrvw9vwWJVOBOCwWHiQEXh4D7P2GkFtskOHhXN7Y=; b=HvZD2U9R+UWFBATU
	91D05jhpzqp6KNdXE7VUfdWfkq4yof3ZGyKHqzdB0+LNdIQiaIUn0Hel4LsbAc8X
	wzH5F5WZFsmmB8W7sCXmF+GIpiJetOBAsigKfR44f6Ps5XN8d8DOjw3mqX5vqXd+
	IWlCXfrhw4+15tMhAVRmOhCdCoFjGgLyCXnPY2YseUL73dbEZNI9oyLQu51UX4pS
	8XfI5pNBsqMp2vym9bISUg2YH9AMmk/ZTWvOmrh9YqtA3LMb9BiEws8fsIGcoyyj
	dTKdWI5DHaGx5PYXjxAS8gBVcatA/18h+Y07O69Scy2mxFL9dHiDMKlYhK8XEkEA
	qGWCkA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush37js9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 14:03:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5369be2e7e2so29027137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 07:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994610; x=1757599410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YWpJrvw9vwWJVOBOCwWHiQEXh4D7P2GkFtskOHhXN7Y=;
        b=E1k3+36G4VLX+VRY5Bqlej/EP6ox/sfqKhvAhUC1V6GXRRDN5oKjoNt2p1xn/8XwV8
         XtB0N4Z+b3PCYos9qZOh+h0ZA3kw+0JqnuEMH4PRhiYdwSaT5HdkMBkeAO8UGFYVb4dJ
         T97iNAu8IkoKGGSwYR1xKLeRPpPZslAG3zV75V54LtRBCwIv/scRK9HH9j+Jotn+Yqil
         st2MxY/tYYzm9rT4YlctDUYDXaFCqssQ/kkYEyWrsivBpDss+PTWkHltmtXAz8sHfQ6b
         ngp7zcaDudmbnnidntJuCDt8Mea4Hbx1vUMoEF8+BZG+VaWGgQ4edEM73kM294whQf6r
         yFKA==
X-Gm-Message-State: AOJu0Yyva7LMQ/g18hcXMXSPAFGfanYGPX7AfxZQwUJ/xxq8TdclORV4
	O/OJKqTRL4VDFGoRv0fZPt/UW8F2/iQOAYF6OpW0KrEhB7xc4p92Vwo1Zewx1ptRsS1l8USeZ/f
	HYmAir3CYQXcdYHFVxf8G8Np7MGvEff6a9oo0TPuhg8BINyZ51Vfd8pSNv0cdN+FeVCH2
X-Gm-Gg: ASbGncuxmdUUO151uQqVZf+xlHAkpDvENQHNBDClbRLOX56ju8C4YPln/atkKqQGKks
	8ORHjRRVavdoPeZ5Xe+ASeKA1jd9K8c44Dggg/zVnqu6A6K4VmrDgMyClZiBwA1PgxzoH1fUEgU
	13kmu0YbP33ZFLrKJ0zziSsTIbSyEAP5h6Y1ytUe4G6IvlNrQbLj3oi/hX1qeCHJlRmmVqekACd
	Uzmlpo/Po/nC6ImPM+LTFcqDdLxVP1RrKWEQPYehX43OGRC8YigvfzmrEAgW7V0qbnZn2biMDeO
	8rFnsh/1Q4+ZhaIUOw9kaBcD599pJztXn9/Wtj/5Em98goJcm1bRDgrHiZtnZNnFZ9v0aX+iEqd
	k1zfAGqlcep1yjc+HTaOY0A==
X-Received: by 2002:a05:6122:530d:10b0:545:eb6c:c6cd with SMTP id 71dfb90a1353d-545eb6ccd07mr149565e0c.0.1756994608509;
        Thu, 04 Sep 2025 07:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEemEW1KVZ+XfsmWOhxU5sZGSGNKVct6j7eGnjkrqmieGlIosDSRswoXL29fuGAJkdSjSxbYg==
X-Received: by 2002:a05:6122:530d:10b0:545:eb6c:c6cd with SMTP id 71dfb90a1353d-545eb6ccd07mr149338e0c.0.1756994605943;
        Thu, 04 Sep 2025 07:03:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62069b79e1asm848778a12.26.2025.09.04.07.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:03:24 -0700 (PDT)
Message-ID: <2c5d97b4-762a-4bbc-b85e-53bc59aaa4c9@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:03:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-enchilada: Add notification LED
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Antonio Rische <nt8r@protonmail.com>
References: <20250904-enchilada-led-v1-1-dcf936ea7795@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-enchilada-led-v1-1-dcf936ea7795@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX+Xwbq5B1eGyj
 PKgExf5Ktq6cO9BLNT+g0Ga5rjPp2fXke6ykX89VPVuuWLdxcvCqkjNCrNDmYYHC346qIJxvTg/
 Qpp6iOTlCGwGRphGXpokVSspCl0s7YQMAuPAf/Hv+yotRrmfVJwAWfc5aX9bVqE6uQaf9xxJo0D
 Z877/hWpX/iFES7vyXPRtIu8TTu8c0XNt6ZfEFx2mijm7TE2bHwn7cshQa8rDRBhTLy/idPY1uz
 BIMnBGG54oXmpZBwANi83dsMK5TN2z3QcK/30J/c9hronl6UBkha6kq3x0YdiHY1dlIgh7dpR8x
 iqiFALsamjkO2L2n4kewKXqtAjVV6BUsXdnnxSVxNzJXSjoLEa5SP+oB+AFyTuOQDHtchMYhsd0
 bXvKbmhc
X-Proofpoint-ORIG-GUID: XuKdL-zftc6hf4Dg5dhZmXr4qn5BenVO
X-Proofpoint-GUID: XuKdL-zftc6hf4Dg5dhZmXr4qn5BenVO
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b99c33 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8
 a=sMes0nJH1TucWEBAg2MA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 9/4/25 3:54 PM, David Heidelberg wrote:
> From: Antonio Rische <nt8r@protonmail.com>
> 
> Add the notification LED for the device.
> The R/G/B channels are controlled by the PMI8998 LPG.
> 
> Signed-off-by: Antonio Rische <nt8r@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

