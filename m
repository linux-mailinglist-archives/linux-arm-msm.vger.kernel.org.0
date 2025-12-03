Return-Path: <linux-arm-msm+bounces-84210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A78D3C9ED3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 12:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D48953A41C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 11:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012A22EFDBB;
	Wed,  3 Dec 2025 11:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OC14gGlB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xd490/4c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A4B29CB48
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764760605; cv=none; b=aK+hdgmBrxozIzp5s71FEbBYBZmZERX5oP4qcTkx+Fv1K/hQLgBfLTZCj/rHrldhgJ1pL7gEQkCwPKFPlBtu7Z+rYQRWSCGo6asPg7um3CyMHZ7JUNzAaIeWnHPqlYJnm4AHDeJWrqvi13Q1/cb5QYykTgAzpxy3HmWyyWC8D0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764760605; c=relaxed/simple;
	bh=vaGteorrlWcHmugbH9pc3T5DA+q0mweuH4jAtEtUSDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSsS2sYOs+UrepW4iZ3R6woexb6KKrFg2gavtGjm7rG4qNuwHJVtsiVxbxYtN63cAePuMu29JuLXCnDFnedOX/KCFmaKC6ifUlHlXLpCWyoEHMNHrMX15xnmgzXbFOFaJgYYqFzk8sDvG7CpXGy/9IBJbtaNsGilNRg6i9WGmFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OC14gGlB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xd490/4c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B3fa21536254
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 11:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1vcxkhN0VIYWP6osWbYrzYEnR0RIZYi5lmnXSpJzjOk=; b=OC14gGlBmCV0vq3m
	u/Ely86TIcvg766ng+oEXFc80dQVxwePTzA56UbFXxQNe4jOOcLuX3ri1GzBOlnx
	x6aPzCgeK5Ux724uz4czt3vxvLKWPbgXGDFca6Lk9iHWsXoVKoHJoVb9T98z9Phq
	bV6g+Zza+FzYqVv4z/Mgmnq1hd/DQAy3sfXVvMlFnf4PdULOGaVwvmKyE5Po+U53
	E0VsE5J5/0RsPm+Gnc4+8uJgyoASSChRgNxQaYV44/1tVOKIbOE3HA+Ugo1MVGMZ
	sdycC0O5ft2ORMKeTY5e5Gs8Q7m4Zrt8wdwxykBu5EKrog9la1mxuVLoiPPExq2w
	dD7Nsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0hr12e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 11:16:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b10c2ea0b5so216298185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764760602; x=1765365402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1vcxkhN0VIYWP6osWbYrzYEnR0RIZYi5lmnXSpJzjOk=;
        b=Xd490/4cO2MahXFTEsTQeRAecuZ9KdKLornYRjAtj0m/OjW5WI/rEL2E9YJO3f4Xsl
         eV14XSiTzwZJeafKR0T4j6fTUJwCvtJ0FeAPqxFz5rd6dkY8lQdD7ZPHob6CUgnFDBM+
         xf/hLcUum35TCo8yaSdI1u/IA2oEgC09MkyoEiEdIEo1JS4myKaikuuRjV2cpcR9iK6m
         1BSCoFymm3viHmNsp6is1DP1kKe6tXa7nLDFSS/+aWBHsY6OfXDnSV4SSkcunOClVLhI
         rVTtpPI285aaSNMaR6l6dqJkbTLx5kk3+Vb0gJUplbp8WXD87MTMj1bdbWv+dnL2v+Z6
         57OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764760602; x=1765365402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vcxkhN0VIYWP6osWbYrzYEnR0RIZYi5lmnXSpJzjOk=;
        b=PBdJ6hNSgSRSNnh3q4nXkEm2pjiYN66wnM+/SarnsO13OIOgxoz2k8V+3XxAkdv9gd
         romU484W7uPqatnNnqsIRxrNtQ80DQHgbfpeq8fZR/pN3SnlxsnvJ6sG8OA9j5ThpW3d
         91AGA5EZLWONCGTkz2wfKX9R9MLINmfApij5/Zr2gewMf6Cs9lQ69gkfmRPnOrIPvPMZ
         1ci4zYVL2G2qMc2u1y3IHFW4C5ZZD7J6xv++IYgFbKSlAV8QLt29pQqFkdHlT2FJbyBq
         8I6pk3eott+FAuK8J1dfDWrXLu8U0PUgufgREJAKutGK512xe2CeJUpsIakLnkSSPwgz
         i5Rw==
X-Gm-Message-State: AOJu0YyzyLDQuhEOEULqCdvA+c66SqXmVK86GF4xSRzpZavqKPahpi9V
	FCq4gZsGtoQVqftTHG7S8JBaw3nNJUz0u2bZdO5Aqwj2tpvt5+ICepgA+DTh7OMNRWPN1jGubiW
	uIWmT7UBBT/cmqOXN0eCETyQO85WZsk668Vz40dMr/8W1fCTdyUyKazrK+27wji4grcsV
X-Gm-Gg: ASbGncvsvmzrPJNBNxHmxSmq0Zfy5M7huGJPUUbIzJH9TEOgJa7OotPlHBarePgfYU7
	I9mOprDbTXK1HeYhq7uEEkl36vAdaiJIM7ptPHmWdruQPRf7f4nZUQAmWp4vnmNKCLcSQxFd947
	X9aAwmgBbTVU1eV/QiFKtWrIvuMy7Rp5pM7lWnbI5XRYrF65bd8Zn8zr3DUQqe9CVdCxxGXTUTU
	JAuiAQJo1X8dY1sMmNzDwb9+WQF1QH7Q5eHhO1GklhKMEkEl0X1lXlIaZjPvdraleCU/1463NFx
	1O250W8vhj4a01iULgYvF4ecN2ulczxHL2V21TYE7OFqZT8u9+pCX5HRO9oWI27nKOZtVEAvzDd
	ynBEsUS7UOvXKhgaEh0J6mk4YN7xi0iMjRzJM53sxpBaE5/d1MWwqRLeVk+nfpyzttg==
X-Received: by 2002:a05:620a:2846:b0:86b:12e2:28d1 with SMTP id af79cd13be357-8b5e6a8f8ccmr162916285a.7.1764760602442;
        Wed, 03 Dec 2025 03:16:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGexy9sN1KXrDnKo2qqHpzGTyUcWmRk8uzjam3d5kIfzK18SMX0HS/cP8FWH3AVE4B17InURg==
X-Received: by 2002:a05:620a:2846:b0:86b:12e2:28d1 with SMTP id af79cd13be357-8b5e6a8f8ccmr162904585a.7.1764760600115;
        Wed, 03 Dec 2025 03:16:40 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647641453d7sm13387427a12.13.2025.12.03.03.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:16:39 -0800 (PST)
Message-ID: <dc3e381e-739e-43f6-b41a-3f77ce7e780b@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 12:16:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 squelch param update
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251203083629.2395451-1-krishna.kurapati@oss.qualcomm.com>
 <20251203083629.2395451-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251203083629.2395451-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dsUqEBnpiC_ByHxOJMj1d3nHIWpdYoTq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA4OSBTYWx0ZWRfX/QNJUFzxRsrW
 oCQ4VRmxAQRgtU8GANziowwzV3U9PoWO0s7s7ZB1W/WwztIMl0/qzawRgVhvhholFpoNoAkRQ5r
 A+ugyh8ty8Di+XG5cLeAAO+EDcTt89e7SjfQjokShwoVacX5+3utIjldrbJJkF6JQrsPCX92qlR
 v0O5IgKAJn+FkEjN0+FD70ugNkInLNTL+RLOnxW3EDHpmTSaVKjwEmaQsMYMCI5X4Z9qqX96867
 nHmEqYBxfR+vht+7oz7zOxGiW6tWJQZ5XjIRjalHKwwJvPqyv2q1fNtYZU1JsekXazG4azqWjEu
 Z4aOsNzs5dt3iw8eiTI5jAF9iBcBGA+KV+hRtoE9I75CE/BCJRRERYlcWrJAdZPGLLoybp/JCrJ
 rBwOk8Z6rp5KdYBHTCetxkr3BLSZuQ==
X-Proofpoint-GUID: dsUqEBnpiC_ByHxOJMj1d3nHIWpdYoTq
X-Authority-Analysis: v=2.4 cv=V5lwEOni c=1 sm=1 tr=0 ts=69301c1b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yeJi84D-AGgTn3bWYRoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030089

On 12/3/25 9:36 AM, Krishna Kurapati wrote:
> Add squelch detect parameter update for synopsys eusb2 repeater.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml  | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> index 5bf0d6c9c025..8a9251ba3b54 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> @@ -59,6 +59,13 @@ properties:
>      minimum: 0
>      maximum: 7
>  
> +  qcom,squelch-detector-bp:
> +    description:
> +      This adjusts the voltage level for the threshold used to detect valid
> +      high-speed data.
> +    minimum: -6000
> +    maximum: 1000

multipleOf: 1000

Konrad

