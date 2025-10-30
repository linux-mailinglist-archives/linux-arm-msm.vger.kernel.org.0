Return-Path: <linux-arm-msm+bounces-79657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8D0C1FAF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DDAD1882693
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CBF354AC1;
	Thu, 30 Oct 2025 10:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrThRorK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QxcKZYbG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75276345CB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821978; cv=none; b=XKxIHqZqB5jvJ7KyIoDMTTfN2UwFCRcyetSg9weuBpsOY0qAYEG9p3+g8QSrWI0MKHk3gXuCcxc9qnjNornpuUsW3iPSPcQTDy5ynmhsKUkteHQjGVjWz+wgvUPyK82Hy2zjI2FSzoDJDqygIdYlqSuhnx4UBVRvowsclrExtjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821978; c=relaxed/simple;
	bh=BbRIYKrtQYCigvrwEoQ2LjjH1U/u/uIdgxMwQdpQIXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSOdUFbKSvOzS5haxtf8ufaNJFnzJ7ZYwMjdrSejSdYC+KmVvAQw41j1Vud+MM0RUl9o+2FYUpt7kB8ooAAeZj0TV1A+dQ/3kxm1wODgOzB79PP4oRo26cSqj6rPtQ0ibhdDLLpsspX4uKUsTEXQSTTqTM7PDKMpVuJaL6GO+xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrThRorK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QxcKZYbG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7SXNT1656060
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1eADsMxCm25VwuU75ZqyPHF8yfHg2vthS/LidojXfz0=; b=NrThRorKfs6DWcNQ
	9IhqKoG+lLWdIep84pEv1mjQkJxGgpGSDFL/UNF3tB27ffPAPlZ/JI8fJ+0Yr6n3
	TPbXPJrbV1VbJA7sZQBzvNxXYfpV/tj/YOMlnHCaSZ7apWwJd7hgu2Q0fwhWXDOt
	QsGSuRq8L8TnuFlbZnkZJx1+aAvxkLtfO7Nj3bhWzla7t5IVvSZT1Kr2bbdXXbQZ
	qxr9ht/q1dtj7gHuq07gvwzSyzr8TJbVtfNB3cY3EBxnjr0ZGgNv13VMXrKKr8Vp
	1u6lMv0HCfdqLClCEriXxCh9O6OFOfZqKHYkNkLeFKOxPmVYJkTyP1+n3bQ4uvgi
	uoarmQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tptt2c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:59:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8800dd3de99so2321156d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761821976; x=1762426776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1eADsMxCm25VwuU75ZqyPHF8yfHg2vthS/LidojXfz0=;
        b=QxcKZYbGhtHVU+o7Gdx1cgddpuOZuUmlCq7ePeZOpzdOA+u9F/o1pxrEMofggaoVYD
         DVuOqTB0wt85DzgQ8Rc2qHq2nv/Mc2DhO2NgxD80nB/vX10CTNZlGi+fvsMynXhqRn6J
         XkJ1H1KtWfuuWvu7Ojcq+L80CYFnkN5HdfVOhnC3TWW9r777smfyYjFgOJ2QpPbTVeTQ
         3PsLBpnV1LGBOLsiKtj2FcysS2z2aijvuFeuAruc+seu12+sw18NUoZdzYm3l6bHoE1v
         zCgnNtXKdJJMsFkpVwsPd8yca6sSfyL85LMrJSOSxTTSEGvfkXM9nwZqsxnNbB+olRqc
         bWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761821976; x=1762426776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1eADsMxCm25VwuU75ZqyPHF8yfHg2vthS/LidojXfz0=;
        b=wzUdJV12aX4d4c49hlUzRd/s55dj/ekRMKVhKUnn4Xm/sxgWt6kwuCJeMGTZKzyuRh
         LSs3Vl7VxBxQJN9yhTJfD9jHwcItnb8PbjCU0PoIWNSslcb6vSa2yX0q4HCrELG3WPCX
         zzPDSl+oQ0JJmieAWz7KW/GxeGAI2aTk2nQsWZakAO+CjAFGg9nGxtXnD1rv1ZvLAFKB
         JtWfBBJgUrdopuJ4mY7uEeqPeHVy4XTTNthKKVeuPBAD59f6rua9xLmUFsp/YOowXak3
         21ukwV3xnNm7uRV/xTo/RBDgyVNmXyDW+mVpTujYefr1uTchEmH85MfSvzioYj969v+R
         gVJQ==
X-Gm-Message-State: AOJu0YyYFUrELZ0XHXVRL4m5b9cBsiwLQWMwZ4keBldx1+wXgR52iD/e
	8Mz4ZGs0X5Hd9rS9ZgptXNlpqtuZAZWjm7tD+SztLu6u0XdyOurvetB/Up5ahMcrAF9rkjpEyaX
	FZH4c4cLXo6JzK0hi0RMzpWlLQ7jp+PIuWs28LI7ltV0ahm5NRzE6Q+fEveCn6GXvDBLU
X-Gm-Gg: ASbGncvygobpfD0zfeejVuN08gaJqkPn5GHzY2VAcANDMcw7mSKrqXJueAkWMx3nOAB
	Hnx9gfE8rRQTv+03GF6yHUnzmzX7VLwGfHPEUgPa94nmj1eaZWMY6yA/o8dB4P5+qEUZcKGpBjj
	4OGaDudE1k93vN9zhtAOuPijgomWmw2swUwvijPIqaOJjL3pE0b9mW/Tz2Ra6Nac6gTmea9aUEg
	zTyPj0putS1J9xqFcG9B9WcozeU3GHDMuysbuLP83Q50nx+PnThCVYc7EOvnYB8Oq4i1/LPm7zp
	vOsA8Oxkp0Zchf0jXEeOqQ39q+ZqmBfbV/QiH5xckR2dLzIqbMqCiwyqVxWpl6p5orSQ7h2fOfF
	0oXddLu0Jrf6u3lsBNFqIWTue3xEjI/x/BLv95ma6sQ+zg3vdf0wlSVRk
X-Received: by 2002:a05:6214:487:b0:87d:f8d3:2456 with SMTP id 6a1803df08f44-88009aed4camr56289216d6.2.1761821975615;
        Thu, 30 Oct 2025 03:59:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETsY3cy65jNGv676OgwNZFpwGttAwGotKcpm2AO4l51J/ujqTq8ArZw7nSd7EwLYbaEex1tw==
X-Received: by 2002:a05:6214:487:b0:87d:f8d3:2456 with SMTP id 6a1803df08f44-88009aed4camr56288996d6.2.1761821974981;
        Thu, 30 Oct 2025 03:59:34 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6404de640fcsm3844588a12.8.2025.10.30.03.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:59:34 -0700 (PDT)
Message-ID: <4b34af45-f37d-474d-9ec9-dbc814f145e2@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:59:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sc8280xp: create common zap-shader
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <20251028-dt-zap-shader-v1-4-7eccb823b986@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251028-dt-zap-shader-v1-4-7eccb823b986@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4OSBTYWx0ZWRfX28A7y0vvDswv
 UxMSvuIEgRi72YV22udkKXtlYRk+WWOSeSyWkOoJQ78zJLvIMvB0MMvrDwbcQNgPGRbPA93RDJm
 dOHjOz/G/aqMYLLHXB+y/I89t56IbtQ0g8nzvbcJ5dwJq6Oms+TW2wxsQnQW7hxTqa80uu99sVa
 eHeCabz5fT7nQqBP4D5Y5eBpl/FtTbQFtVOnKog3Jd4WnOvcfb39UEKMVwFTLUVnbKFoxllfU8J
 R+51fb6ptZ+6YwIQ3uY3LLv95Xvqtj6SSuaTtI886sbYKJiGA0lfX8GxloMAH7J6+20YqVDm6PS
 PPXO7JJpKltNa4qsBK1gafg1VdZIPQ3oAtY6lC5TDrgPc0I1CkThmZtag9E2dboLjU7kSOu76Pi
 oE/6yyWNlHTjSs/pcIVLPLf6xV1ryg==
X-Proofpoint-GUID: H8Xy1zgPeYUe2FeydAB157BFT4Kpjca7
X-Authority-Analysis: v=2.4 cv=MuRfKmae c=1 sm=1 tr=0 ts=69034518 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3S55o6r4CRsqHmcx2iYA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: H8Xy1zgPeYUe2FeydAB157BFT4Kpjca7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300089

On 10/28/25 10:00 PM, Dmitry Baryshkov wrote:
> In order to reduce duplication, mMove common GPU memory configuration
> from individual board files to sc8280xp.dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

