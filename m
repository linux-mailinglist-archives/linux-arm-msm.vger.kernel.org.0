Return-Path: <linux-arm-msm+bounces-73088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 833BFB52D40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 979971C84E4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 09:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8932D2EA147;
	Thu, 11 Sep 2025 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+1GRRRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248FE1B87E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582953; cv=none; b=oFydRSGbP8jfynH6A31R5JsE7GBGr2aZ6AWwnAaqnpwiRNmHTLTJQAJLLVJziZJ0TBJE6cBw7OrGhiqLAyJWDd7UOQN5PGSCosOvIG7cBZkCyQkcij9rE/+gSMi8I6Uas6vT5taWz9D+XViXJrhB5yAhWEVnnqFLJQpiGvqYzLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582953; c=relaxed/simple;
	bh=ipXS9rVBQf4wsqYin8oB1mjXXUmA+Ac9XDh9G1Q0gWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbPQits8z4rx19oGPzrq1JDWhF3mxcGQMf7gve1PtDEiLMwBpfE8vvOSxlXL0azD3nGoHkduO9p5BtbjN1M38Vh3hdA1Ns/w5Ql5wi3AppNMkCLOtsnjZd51O+D6U8PSjQpHT6ItNCZNTFsZZKDJNy72dSSc8rlo59hmo/gYn9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+1GRRRU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J1BZ016853
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7JL6ZwC7GKOtZo7eA8lk+WbkGf11yCi9JngNpI6M704=; b=S+1GRRRUAZLrH58L
	54CyqAMNeeFDmjGNuD4C9Fo1eHAQdESsMeqFzlmCYZ1FjnjykIQYQkRKWVcA9Lek
	hvVYevnaRGJd+L6sCDlkURHzk/NgtaRejd4wOmaLkk5bPD24NfPXCg3uloUqmgPD
	vJiWPxdFr/cwqSWhcpotGc2QR3tDB7RyiPvzm4nzEYB1CPaoX9Yo/kY9H/dU4E1a
	/yJmzxCG9y5L+FrMCGzTX4sk+mPzNC38NEw/Pr90BZXRbAFqrhSsmjsrhqcNnVay
	iiUW1tOUEAXUTdVNAwezEgPGTVOLtn67ivqRzPpld87YLJV2F4lChmAZa7NXcB+Z
	khLY/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t383hkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:29:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b48f648249so1090081cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 02:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582950; x=1758187750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7JL6ZwC7GKOtZo7eA8lk+WbkGf11yCi9JngNpI6M704=;
        b=rp0hG/swHAlBKPN7NoeAsf0vBoW6OP/x6zmH5h73ukcXpnBUpLFvzh65t/ZAtDuEsF
         bcQqVO4qTn+z9cHH6G0uZuEsthqyX8Xu3ek+TcxedK5tPVpO86PHHnmrgl7+GPuQ3HIX
         dYaRQXu0v71b7QS855Oy9suPl9XM6gZ20+hFhmfPu5ROuTiN84QSgSZi36iq/vSSq5pk
         aYQ5EDZf9ERQRg69atgqpHUwVNGYNHdRok/cKpqr3MwPQPiKnAHR+mGcIu1ZuBdkigd4
         wyZi+5VYHDcUPO4LN94YZ3e3oi6iKbLfm2PdmH0m6jA9R6yQN9JjjiqNoqbqOx9bqT6k
         eW7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAISWo02jpPTfam96hIgSMB558QU2GzY5KUQyFcrsR+C1hv6GwuXELhMeu9NNPWCIPKRpLypf2pOdarTLC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz+XrwauHGWSlVYCHhdtwy24gjYA+zqeHU7sOxBkQeo2LK4iwK
	aq+LBNYBzIa33jD3k7PBaofNCyRuyAup8jpjlfFA2s686GYRPNy/EmDv0mAxZmz1SR8i7WX4+Ad
	79p/rW/8Rh76OkfZVszyEAeiMx5bIFPAZN+6TVhDeSqn8p6mFAuMl1BUPprj7tt/BQdK1
X-Gm-Gg: ASbGncuwE7hZyyXJlJ8nU9CN/hCQ1HhDGutZZCtYd7iL0rQbvHE5Lt9s7zTrAghq2uI
	cHfDhWM32XDjRK25LxQOF2JVkJeMYoIIPb+/pVcBEVaQtVASEeo8NLYK0GXVKy05Uql6/O6C8or
	+EsodvtEYgoWNUWnw4fQidR7C/ELUvLztEUTw6YEEskFF/H+QRJQgI9Yyk2r64x/+AObJE5eub5
	md2HMYAU0LXpoxMj0fPQkC/vpiG86o0vtPMvyJ6SzXIJyTneR3JIw0Kz1BsAjVr7RwNLB5EvoDf
	HK1OApJl24W8Vphrt/6FaWiWi+N2sabjSlUeXCw06e4BLYm69luwEsni+Y+fHQWP2W3g573Ij24
	HK00H7zBmHbbhIVG0rV+zTQ==
X-Received: by 2002:ac8:574d:0:b0:4b5:e4dc:1eee with SMTP id d75a77b69052e-4b5f84273c3mr133403351cf.8.1757582950182;
        Thu, 11 Sep 2025 02:29:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTV0m4toGz7+xbdgA/U5Fea5/H2PZYRmfWsOyBhCLZpAb0p8/1CkRX4GCGdlGibx5cQEGPZg==
X-Received: by 2002:ac8:574d:0:b0:4b5:e4dc:1eee with SMTP id d75a77b69052e-4b5f84273c3mr133403121cf.8.1757582949666;
        Thu, 11 Sep 2025 02:29:09 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128506sm92707466b.28.2025.09.11.02.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:29:09 -0700 (PDT)
Message-ID: <90526e2f-17d4-4a37-80fa-60e08440d67c@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:29:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: qcom: camcc-sm8450: Specify Titan GDSC power
 domain as a parent to IPE/BPS/SBI
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-7-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: s9-melPzxIXAq-I8VJ190KtoxaNHpvKt
X-Proofpoint-GUID: s9-melPzxIXAq-I8VJ190KtoxaNHpvKt
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c29667 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LDDDIuMr0XRAt-0CmwQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfXzW4p+X3t8Z3o
 3otyJMLCiSN/8JiCs0XQ7NhsW784JIthtjzvoGvvXG2fePV2+66c6ul38O+5NZH75YcakrjPmss
 naDkVLG9cWMl9J/313+UljONxwADzUBwgInqLz+zDziMSAGhrMVkxZac8iVY6woRGW0ARiM41TP
 vK826x00nDpwQ499AYF9BSRmkE/cjA0aaT4Tv01HbCAbxcrelgLcksQWKa0U1qIOEsJDRfLyPb1
 WiA32Tp+F2DS7SoUJJW3W5LK7WJiO72T+p4CC2lp+WLwnnpApztDXvG+2Ok6hDvqoGjSlaCwozS
 YYKaOaiBZDGKTNF3r9O3O9Z/AcCJCzogA9vJdY0rRMnL+NbaPzWsZHjirGLXejDQw6uJjHrDuE9
 +xbMCZTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On 9/11/25 3:12 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SD8450 camera clock controller, and it should include
> IPE, BPS and SBI ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

