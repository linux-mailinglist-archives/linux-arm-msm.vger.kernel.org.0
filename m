Return-Path: <linux-arm-msm+bounces-78163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 623EFBF666A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 59B4F504780
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1C632E74D;
	Tue, 21 Oct 2025 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kx4/jx/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0407A35502B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 12:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761049056; cv=none; b=gMU1plUCq8PlgaBGGVJessVVzjz6h1zaTNtgW+L1Wo2A3YWQZqYAu9Z+KBmd373PaoeFxkBM1XDAGn+8LH0K0+qzYVSFoSzejVAsbMKWVR9rXcWTwKJMsYXoEvyJ8mivK4Nc283GxBio+BRgUrWKgNfJnNGGu+x1QjWa/9wydwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761049056; c=relaxed/simple;
	bh=Ik8YTK9+li2kctsxdsSAX5UkwYsN4owKy1yNpUgTOtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8YQEG55mEvOOe0pZzygiwfmteaKR6fXQNsAsg93C5gZZE8/zZKI1WLjMZrVtniDAxHB9j5l0SLep3/SKZyQ0rwubRGDGG+3Q4WV47Mhg76+cYtgHXmxF4m7OtkmhpbsX+Y3X+pR6lJxM5YpiVTG8TE3it89R2bE9ovr37WBlVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kx4/jx/g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8KDI8020308
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 12:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	62ij7qlH0jAbXbq+caCTrSlt+OeWrvirXMKUpKG5id8=; b=kx4/jx/gddJzriWr
	YETzYOVX786PvozAsP/T4Wz0FOx8akCyXqVgh5Q7dVI9f9K2ulbuUv4FKE3xhdHS
	cWXt/zrzBUWrlcTK0NHwzyeIYFcV8HPjrV+R/ojxtCu3MiFTFV8VS/aQT0FBfY8p
	UfeYLQZQ1kplAWEuGdy0ptYjmERUddoV2/kXuh4cJwCXlC4RsyBT2bR68L/Z9HET
	K6H89njqOkq7x+GQMrSxPN9JoCCiiqGvWscljfeGp009COA5zMeF/gtmbfAH7tFK
	MJX7SAEZ8AFP3tOAf3KgrHvAEwgGGMi1FwrDkkpQBmGOsW3e5oMKwonatNsWa+XJ
	6U7FSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3440me4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 12:17:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88fcb38d0d9so279374385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 05:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049050; x=1761653850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62ij7qlH0jAbXbq+caCTrSlt+OeWrvirXMKUpKG5id8=;
        b=wjeZ8l7KdmtGXKRuF8JkGDwkQCIoXGIKkdw5NduLID9WyH+XMDm0JMqWIFwrTMrtBI
         zdHZiwAEh2oLTPcPpJIpvEsPBXXiUUpO1LWt4iehjPXgqwZjiXsmWn6KpTCb9JWbQKKW
         1g7aqi/pblyikIggixggAFndmMmciBzM1WinoQ1qbOtxCi3Gl+O1RZ/+cIp0wrCBun+w
         i8X29ywKyZoSmiSj2Ha3DGGuErraS6Kfbk81qI260zi89TwK9Qatb0dOK4bIuxzmfRbF
         QJedHdsXOUsg49OqM1F8zVVC2knUC92b15OjA7Oo73qb4sRRWHJkGR4S1sXUnO3X/aPP
         e3IA==
X-Forwarded-Encrypted: i=1; AJvYcCUPjpR1U84XLK+3PZj0IJv8DbHB/ZOckhyNV9YfRNXtLIEdZAJrn/CtakFE9Die5IuiK+6vcBviYEBgNAoU@vger.kernel.org
X-Gm-Message-State: AOJu0YyIFSaOVyx/ZUhV/YYiOSdPk4qcpR6qy/5TB3Rp6fx5S4JWSi8d
	qa54MZegEY5pFuH+BgpyPqec/LekmzLImW3ePAl49JJ/RQ+xGNX9j73Hd5W+Qi73yEYona4ipDO
	2NMlL5dX5H7b092uGfuHRXgc0fDosYm76Qd2CgEaoTyhghqFKhSzJF7nqODGw11fOD0jj
X-Gm-Gg: ASbGncupbKJ1Uu37lUVoboFTdOeKmTvaGbgLX2AHxw9uD+qCYtA5eMLfnJYt78C/E/4
	7ijshr1gJDW43dJ6Z3GRyxd520EmH+ocHE2y0a+ZEFDjmXYx8hDnum9Acg/UHbuVORfo6xUJv9m
	67i/uRTU6blqMjx2Fhq1BvXBV2Uf9AGBxPPtkCxgHJMijk4VoHi7uvGZMC5hZXrrTmZ7RYsRVm7
	G0F08mZgihuJQ7Pw+E0Z11A4ZzKtHl9T1HHtiSocKy4zNRUm3auXuCd8E1aXp9RitXnk+TBjFIS
	25MjKBYJA8DUXN/WqQDO3tex7eH3z/B68q39kWNMGYRnc63UIL9gtvGvebxFBw+wwkHzKI/XBkb
	1D4SPsBIF7wGF1UdU61Z3tAPQJtQgqu/0z0Ps1IQviG2N58nA0ErI4Czg
X-Received: by 2002:a05:622a:180f:b0:4e8:b138:2a0d with SMTP id d75a77b69052e-4e8b1382c71mr98419651cf.12.1761049049788;
        Tue, 21 Oct 2025 05:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9wVa62A9QqlswXTFOtj5hMm5dxSnWe0OKPK/itVnOD6rHNI29MyrzCPqYx7/z+6jDyT0yqg==
X-Received: by 2002:a05:622a:180f:b0:4e8:b138:2a0d with SMTP id d75a77b69052e-4e8b1382c71mr98419361cf.12.1761049049358;
        Tue, 21 Oct 2025 05:17:29 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c49430145sm9225871a12.19.2025.10.21.05.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:17:28 -0700 (PDT)
Message-ID: <e63dc4ce-8461-41f7-8dfc-3fe531d69f4e@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 14:17:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] dt-bindings: display: panel-simple-dsi: Remove
 Samsung S6E3FC2 compatible
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding
 <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
 <20251021-s6e3fc2x01-v4-7-5e3ee21c688a@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-s6e3fc2x01-v4-7-5e3ee21c688a@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ABA1SpxBukSCqNdpt2n1p5bK6gmkrQBN
X-Proofpoint-ORIG-GUID: ABA1SpxBukSCqNdpt2n1p5bK6gmkrQBN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX5BVkEYTattAT
 ugDO+6mn1tAoysBg5+h05Pur8y35ywymc9tsmMdoU3TZvVOtsIXpqYUBZEwFOcP8bQK6SAE9Q1P
 D1Q5HjsZVX3YyKDUfid9rlxqX8IhrgCnutlSxbvDA3zhtYIEGxL86xsRsd1tXC5kaac1fm2VrfD
 4XRggnfmJIR96DYVLNyTpOuIv9VuY9XJSxJ4NFvc3gNSX9arMBimHNWjre/PkG7ci6Hr5BmJfHE
 pJBPv0dmzc6ZKZDk/NgiNPnwMKmca3eUxds0KUjEXpiPz9wj3h0XR2E9AVUCb9X1NDfWJFHKTqB
 cdgnobCe85Ximw4opThAwReGeqBROZhSdt4qEC3qeXyqZQwDR3BecWrPyjZhgP8u4WhMm2WuJqv
 T4mtJkUJtinsT7RFj8bl+dFEO5fLvA==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f779db cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=BITFXGdF7uWLIDnxD84A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

On 10/21/25 1:53 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Samsung S6E3FC2X01 DDIC isn't Simple DSI panel.
> 
> This panel has three supplies, while panel-simple-dsi is limited to one.
> There is no user of this compatible, nor the compatible make sense.
> Remove it.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

I think you should squash this with patch 1, doesn't dt_bindings_check
error out when a compatible is matched twice?

Konrad

