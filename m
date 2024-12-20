Return-Path: <linux-arm-msm+bounces-42944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5088B9F8F1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 381CD1897195
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0FE1B87C0;
	Fri, 20 Dec 2024 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNSz0FZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB701B85C5
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687399; cv=none; b=ruLF0Q8XbODxyrHP7jNz3LX5YlJVkLQ7aqnr2S/RTvRI2DHLyVh/NkaxZD6clTN+BrX/VkS40BlV4oFPsJ/nH4lXMY9a04rWggAeJOR6YnBTtWmbMo2L8fGEvr/KXwlQo5XtWpVJTH2A3/iFO0z8Ph4qPpx22z89XGKaKm4sQwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687399; c=relaxed/simple;
	bh=sDdFiDa5rwkAIlrLyHaCtQbwf1RknOw9hv324X9pEmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGdjuU+wrrR30zCP6X/Mw8/Y0Sg8cs44d8/0Y3HkmtUaUAdGOwsTp9v6a9WZvpWoHUr/D+t9omJkNjzRaBbYSmtU2ToM0eCqU9J9zJ4ye5LXgfvwNomlRBQE4HRCkNiO7KJnA6DNeGykn9SIO7eNVdWSHHbbZzPKLiTJBn6sY+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNSz0FZG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7LhW2029328
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7oj8R8h4E4EYHPxhiDSmNCuo81TupGOmdcttJnlWpc=; b=iNSz0FZG1YcH+8Dw
	Fl7dIoV3u55itHDXeQ/Rc/8pxNsdkFfk017S28+nVtF1DExqv18EKqjzKc+1ODp0
	eUbzE7rscXa8ba8Val7f6TIck7dvHazIZuj/7Ce+HpCD58GcyVt+UqOkphAK8oof
	MNsmMj9u68hUMsWm+IvriMmdFerpfiC/0ewFhClMdBzHgZD3Opch4KSPUcK5pNMX
	A96SiZdeqnvUHDBiYuPtubLhFvnam/nRmgzuSrb8NyV/LxeIWnF+4BiTOELSFIN1
	t6lOI9OLzNBU8q0M9xVxQuMePLRxsrOHGRK9oFAmwfihq6BciWecmfzdWyubIJTW
	JHnpuA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n44fgd4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:36:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d904ac0ea2so2944436d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687395; x=1735292195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7oj8R8h4E4EYHPxhiDSmNCuo81TupGOmdcttJnlWpc=;
        b=eWiR0CcJeRfE2P2Pd2mVBXz2cBKvbx9gpPLgVIXpaxFqhxQa8h0V6K/SxQ1CvRjxCe
         psME6qS5G9+Z/pv2rWVIT0/91Ra1nbk4JMqYnihVbtcgexGSZRW6/gtT/Jf7E1/dIT1S
         v5RBKaWeYTcuwvR3sE6JfLz20M8MiDibgCv3HfjB9X1ppZwx+I7r6A2XQ5rzZYpYKjwm
         d9iAMb9XYrtQc/SObMVPye9YiLLbBFgwunlqAK3iXRZG+xNoo96O5x45ukTGYIhG8Xuz
         d1b2AchXWcAeP4XMvTMEvFaatJzU+FpP2X3bA4tg51lVL/swAdvdcOHv0xxFCj6qhrmD
         RX5g==
X-Forwarded-Encrypted: i=1; AJvYcCX2IlNjStn+3mORU5Vzj1RiUtCcdIMc7KRP20BC6uVecDVUyh5HI9DwA51ktHwqmAftxSwi4d7PP+rEw4Oj@vger.kernel.org
X-Gm-Message-State: AOJu0YwJt1SymH1KTepq+9Lx386Iu2ZcmZwi5GlG7/BWin/fe/NHxpt1
	Hi5d3JO6Qv5Kxife/STN+Qcsdq861yCXI2odW0KsmLETr3N/GoZpVkawN9/BnMWVI7wPPncBWPx
	byTV19wVkf5ZMS/gKccC9BLUOWkSDiPK5Y8oANwG5Ugp9DYUeBu+2PWgGinjpebd0
X-Gm-Gg: ASbGncvtOzeIfL+Nxd+8d7O6KX8PXKep+o5Lu+TakvNAbtctRPJiQZn5+FuVZkhUe2q
	jx4o+rDPWgfioyK8akp2OveP+FSf+ZfQ/DyTXfMY8hzMOy6dniPRqmEDlyjj3N5THXFloRw7nyF
	WOfN6VilXWw2/kVpBjyN/stC2RILZr2m1/KvLQfapabUCUMX64B34j3n6KpMQaLsWJpQ51urhtJ
	op7VwsPU7pRvuCHov9iFxhD7JRd4xwn8Yujc30hs9m4twH4ewccIqXRCvWimGSiZhEBF3FII3xb
	8RKk/FIEuYayTqyt2ALgauCFLg3uGO9aJeg=
X-Received: by 2002:a05:6214:c21:b0:6d8:9a85:5b33 with SMTP id 6a1803df08f44-6dd233bafd1mr12002476d6.11.1734687395495;
        Fri, 20 Dec 2024 01:36:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoncBjB8cj/M7gA2nrgGGLaBphVRng7XSV8mU7QIm6l9QbtXTfOitLjiLlZGrB/N13wB8Lag==
X-Received: by 2002:a05:6214:c21:b0:6d8:9a85:5b33 with SMTP id 6a1803df08f44-6dd233bafd1mr12002376d6.11.1734687395116;
        Fri, 20 Dec 2024 01:36:35 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830abfsm158492166b.20.2024.12.20.01.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:36:34 -0800 (PST)
Message-ID: <a536afc9-0837-46f9-9135-c220cde7f862@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:36:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Drop extra
 qcom,msm-id value
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241220-fp4-msm-id-v1-1-2b75af02032a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-fp4-msm-id-v1-1-2b75af02032a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AKa9UQuOi_KwcPzIQX6dq2Zg5lHLUAcF
X-Proofpoint-ORIG-GUID: AKa9UQuOi_KwcPzIQX6dq2Zg5lHLUAcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=929 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200079

On 20.12.2024 9:55 AM, Luca Weiss wrote:
> The ID 434 is for SM6350 while 459 is for SM7225. Fairphone 4 is only
> SM7225, so drop the unused 434 entry.
> 
> Fixes: 4cbea668767d ("arm64: dts: qcom: sm7225: Add device tree for Fairphone 4")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Completely dropping these values also appears to work when using
> boot.img header version 2, but doing this change now would mean any
> tooling in the wild for packaging up the boot.img using header v0 would
> stop producing working without adjusting that mkbootimg invocation.
> ---

It would be nice if you could start shifting that tooling to bootimgv2
slowly, and when it trickles down to appropriate places, switch it up
upstream as well. Of course if that works for you.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

