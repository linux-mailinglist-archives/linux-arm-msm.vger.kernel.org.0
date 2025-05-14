Return-Path: <linux-arm-msm+bounces-57869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 357CBAB6FC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AE331BA003F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A78486342;
	Wed, 14 May 2025 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cObmxX+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04521B4140
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236561; cv=none; b=cz+MsNLziYgPInG9HX7G5Gl7haJ0HmWOCwcHpWYLcjY9YqBFpXduQ4oLLNFrYovuzVr+LLu81yzfK9YGrQS6tsJw4OKQjGKG2dpoGtYgYsBkcCppG2D/uwLePERoZbovLZeZl4qLYkg3MukBRWPfEeQWJk0muiS9yluFQi0J3P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236561; c=relaxed/simple;
	bh=B38HNpBTKqQ0yjLO+CP8uG90979PDm8VB9963MAwEfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suFgQ0rLuiP45B/kzSkCclbL463B9agIqoH3AsoFmWyFwAnFQG0bxcgN+dfxbpptAODjJ2FVxs/2LdMRAa6/HNSLO8ehBwpW1jAd8GVywX0rIP0Wr0px8jwacv3FrBtNBw/xS0Pt0r5K7OBUbNqABwfLMcVrqG9T67L1jzHPoyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cObmxX+q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvem015147
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 15:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nNhh7tTrtVppZOM44aoAsiuIMid4rGaB2UXO4+XqS44=; b=cObmxX+qdKmoqnIf
	/P5Fz2EOvQc307k51BOfKNbJqQRFr8In46r+li2xDOwM++FM8ldWhn2gttYUzXbG
	Ao4tS3BT1G5hW8Xze9wQT0L2k7vxCCeEB/45IdwlWeGRUJCGa0c+OrXtsVAy8QtI
	H+f72fFpWjjqUxhdRIQMQoD/pUD9GczksELu7ZiObXJCHUybDon8DQhi/Pt88KCN
	bM7jwDQp7EqJV7hVFJtLgs5TXgjbVoF07ZsffoX8+/4RbMLkPGz+HuDy/b5K+656
	09vG6Ul71ENjWpFrqWdUnb2KaSzWaOusrzhiGzElUCCrrMeH0QpO8H4Kn7a6qRvf
	erzDSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr33qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 15:29:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so196190785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 08:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236558; x=1747841358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNhh7tTrtVppZOM44aoAsiuIMid4rGaB2UXO4+XqS44=;
        b=QSxNx2gaGFVgsAEYCPw0+wewTGMv2l8wo1S2S3MmcOw0ClzdXpFL+WLYOuLWzAtgaE
         b41fWIUkrXquinn6HDADRWRPGhq/s2KbPJsPjFwBvg6rBbH64mnNp8Iixk/c9XrNgN5c
         TGK0uWfc0h7vu0S2yh5fkixJZnwLxn3oZ3U6P1ZMdJnkHedYSM+7gneZG3iBVkqSfdNs
         Bih4IndZ5xxizlB93DzFROwLGnUoBuFj2zfSRAN8woBwFP1hck26OGizsi4bl4MTJ0R/
         5FxH8ddCHgIcCeRcv8HGtM9HufsCvyWf+Dry7E/Or8OUV7cgO+XPEG1ZY+GMI+ZHfrIm
         y80g==
X-Forwarded-Encrypted: i=1; AJvYcCWNC/qOXiejzzSOSw6wutZqACyeZTojUn31m76Ruuc5w5nDGXqHAmPZIpgxMsCNu2duK185v0fqltndxRuR@vger.kernel.org
X-Gm-Message-State: AOJu0YzBClGDOrYhCR1k2oChIe6nRrw6trKqqk9du0QM6TQPzXviVR6e
	KL11dCTfXaCHdGcGGjRU/sfT99zgifpGRceDrDaEcCIKPpwI+UErxUw8fqdygXToc5PYDDBZ+Yv
	E/q4Cz1aw+0Gk0SW5kfMu5KdhhQ1PIu4hUVEbpbFi+oLP7Y2qMnCyw0LeM5cWXyl5Bvw9Z9Et
X-Gm-Gg: ASbGnctXQnw90kSi7nlIhLyk4+eQi6T+n4ul4elhhtFPOvmSecTov3M6olYn1HTt5UP
	VtmcbRNhipzYTMmfpJTy9DISjKlCmsYCOtmvsSOgDL5sjr63+38iKLoEtwu129FjJ9NIOz1Uzuw
	ohYCLwED+9tnFQ/jrb+2nni/4huppLJ1Hf9XpcwqVhIZh5/K8+LROhNk3yXVzflwTvFTo9ewAZt
	WIPPvi4BW4lqgz7ZTeAV72Q44zHlxUakhtS/LhuInhp+MsRgbwaY2ZKjnXqI6kBuK3QbKfOW7cq
	P+3qK5q6GF/VnWWOGCXUR+FbzbXEsC4DWNUCsxf29JluLq+BinHUt/hDpACwWHKH8g==
X-Received: by 2002:a05:620a:8391:b0:7c5:75ad:5c3a with SMTP id af79cd13be357-7cd287fddf3mr234612485a.8.1747236557697;
        Wed, 14 May 2025 08:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESSnbZfR1OlTiIaVYJwWyGGbrD8XQ6bq4lkNbvhbCIEFOfDySQCqDpAoZMS7HgH50fPKy8fQ==
X-Received: by 2002:a05:620a:8391:b0:7c5:75ad:5c3a with SMTP id af79cd13be357-7cd287fddf3mr234610685a.8.1747236557345;
        Wed, 14 May 2025 08:29:17 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad505564d46sm72730266b.121.2025.05.14.08.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:29:16 -0700 (PDT)
Message-ID: <0e1e112e-e9ff-4d02-9779-6e1bfaea6195@oss.qualcomm.com>
Date: Wed, 14 May 2025 17:29:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 01/15] soc: qcom: Add UBWC config provider
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DCShJkRkG_pVDT8m8rsH2bM9jcR-NwGP
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6824b6ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=TDUkdBfym2ZfKPuXuAoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: DCShJkRkG_pVDT8m8rsH2bM9jcR-NwGP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEzOCBTYWx0ZWRfX+nHY8+l7CRwu
 +fKOhWghukq5nu0eAGVkioFxFT/h3GP016W2GOzX1IzJMnTJMWd3rndVDYyomehzvea+TbaBK60
 QLF4ci9I6B2eQBJQp9eYbgF/RvsbaPcJTgZwHNFZoUi2waMsIdL9Kz52lhB+RsYi056iNhed/Cs
 Dyf5tWL9An7syAHLo45rJckqqQT0hJCbe5H5910mreJrQLsWBYa5lgUpFIw2dCxqsOVuf3hgFaI
 t7GN37bC1fu5awidPijnslTP8vOOwewEeAowxDJMnCZUxxK8Fep3yDZ+XwWNPIVCe9YOlCQhG5B
 ImNJVdQ1rNYtuzwRlB+KhO6M8VbgW+mp7+E3nn/sXBZD1DEb+5wSA9/v9/ut6LkhlNShgbi/ESj
 gJ5hcY9b0cdn8nguE0aVa5JRbUR+gcugvu8wZhnXhUEekKneaoao8UQno5vr/gNBZsctNeh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140138

On 5/14/25 5:10 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add a file that will serve as a single source of truth for UBWC
> configuration data for various multimedia blocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

> +static const struct qcom_ubwc_cfg_data sar2130p_data = {

So I failed to add a user for this below.. 

---
{ .compatible = "qcom,sar2130p", .data = &sar2130p_data },
---

Konrad

