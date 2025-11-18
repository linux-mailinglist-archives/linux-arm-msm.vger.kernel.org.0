Return-Path: <linux-arm-msm+bounces-82232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28FC68976
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id C25432A5D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB44F329C58;
	Tue, 18 Nov 2025 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vx549b7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZbsLIf7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27AA329381
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458790; cv=none; b=mg99X/w8wbIYiOXu+Ggg8XrvzRG39Y5arBodh8DMJsgtlBwX5gMOJM/gXu2qKsN13f8hNKxW80ILF01tzvQ555oHCDiDoOQ7hrX4QA0OnZOoPa6KpcOEc+/GE+ySrWaEMmIIyNrByOW63oV7/YoM46Dei73Gl1LZwIdfV/9GMbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458790; c=relaxed/simple;
	bh=mfRRUUiLEUM00WsS0T61tZsOtb8UlFWYBb8fTQshtjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3zdvQSJjvq2uesJvS28D59qvZJKmd9aaHlH5zb4nxLC9cBAsjRAOKyhoOlfPXQgQDvJCZjjlOFV7AVB3MA+gboC0/nacvVWGTk203QkjcBx5vx5q9i33PuZVDITdvIM5TMleFy/N8ShGv/xAbGcl09+4pViT5rpu8HHA4FfN1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vx549b7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZbsLIf7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6fR7i2343395
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lpxskyOt/DUyd+JK+oswxenNWQqg6JO7PsHwIirxqQk=; b=Vx549b7wmIT1t9Ld
	Vk+BjWJn1YsWUZZd+IrS1liaqjSeSlv+OzGHA4JB4gZmyzXyU/4+WUHVZPC4YYSd
	KH8d4aIsSh6nAD9o1lf2caJauqu/n/pu7VXhCfRdEdzb7yElftD7Ti6GQcTSOgoo
	kzH6geewdDtKAav8jpREcv0UP693nhRMgWJQRRAfpMmbj05eqaLIIBKXM0KTM91Y
	72OosjmZ4mJNKLgM4/aEXSZueB4dicC12uHISlPiOL2RQdpMDHZlFvI6kX+/sgOX
	0X3CTGuLJeD64IlXQ+07BXbLQMbnEOQ8WkeaOY+9sJMaUrWnwhS8fRJ/cI6eCS6F
	K+2T4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrn0hnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:39:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed83a05863so20532701cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 01:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763458787; x=1764063587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lpxskyOt/DUyd+JK+oswxenNWQqg6JO7PsHwIirxqQk=;
        b=iZbsLIf7WrrK9TjnMGrDs5oM6MKwt6THWzmbJIAGx7tS9F60+L+82kxsROyA3H2u5h
         UeGZKTjEggbtKPIccqCFjbmQhRf+KROINqQGkYmPR1wZxnYg9QnFLQHt30LiVq2sxo5N
         x+47v/BjrFhGLDvILBZjcDd9CcWar/KlQbiTwQ+fKZGuZ+K4s3PbzP5d05jVf+LDNVJG
         Oiat4E0XGSVgfRYEukdeyEzhR1R13vpg4yPrMW6HUuLaeEpUWAys5V8kQG5XCM4hc7Oz
         cCa2r/rgDBxUYYsa7RftGMohxbmyghSyNRTXNA8CJYNYmi4nYMjwldT5db5IUyzatBnO
         1KCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458787; x=1764063587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpxskyOt/DUyd+JK+oswxenNWQqg6JO7PsHwIirxqQk=;
        b=Lcg9qsNbhJ4EXhFhwMABoUFOBhuF+NIsUZQwpx5yViAP+9vtMW8IkfvMZ4khVSElBr
         vX6WtWVPnglNitQ3yuNCumGBK0CSLBdPpUBGtaj1GPvVKBTUUP01rbc9N3+rIgR9D3eB
         5TPBQKtriiiGcEiYobpxgHeLvkXYdMg+qTZzNR+SPHfKnYeF2dVa/3wBpAVktNxOjA1g
         Me0pNl13rxUYEXNy74NOmYvvczlo1V593plBOucofxvtzhRUYXgTebHwaKVnQkuytu8y
         PQ7xFomgd3C/m/1BYLknTzvTz6AItfx//rOH0mN+6ycaukM7VqjkVAL5wIH4/MXoys7Q
         mKzg==
X-Gm-Message-State: AOJu0YysZN3WeZuWVGcHJ0SL9WIUP1+kIMBZgpeBK6azPfOVp/R0At86
	5Yhu8hAObfkU/cawOio7c2DBhnixh/xJZocO6MjE3vtDQ5Wx5ZUE30nfU3SnkIGkCuPYwhJ2Lup
	RXwlgupnt2KDqSOb+nO6o7aEAizmV8sjArpdBYIzGG9yT15mZs4Nbo9LaZI+iinxjDdSK
X-Gm-Gg: ASbGnctvB1Rj9CPmUrmgf6TbzEYBa6WUhEpGEH2hj0IJ+IQMi6x5Uc9p1hFsLQUoJvV
	fuR3GYumxtknAuSOQRjJ23VqTey4Kqq/bD54AketarGK2VyMUIjnPgZk3jAKNfuT3ybZPp/sl+Y
	W7v+7pW9mO2ugrZH8joxndn7VvpZplmudl11rOcgq5GsPdkG4QDoTHEUwfRu5a2N/jcbQGHfnCy
	D0g+D7L2DtUuRKSECEViEz53yuPCsLGAlLfsiVecXsfCWnpyS3glnF0S4hQxY49EQvXCTyEt0JY
	7Y4ovJKUj2/5isIMpGMSu3naa01Wo5oWMDuc04DxIIkOiEdE2oEw8IEUBmEEauW8W7D5q8GQ87y
	r8aCSnZWV6efc56sbQSiThQyYiaTHtvrNh9PMLIRdOwUJ40GqIZUYI2exyM130GpwAhY=
X-Received: by 2002:ac8:5a47:0:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4ee3140eb67mr19637821cf.5.1763458787177;
        Tue, 18 Nov 2025 01:39:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM2XznaRPw4t1ZV3qwqJLsICwQEZb87oxLhz3lJ4o/WnzQaq3sDjaNpuPz0cNrOC+2yawjJg==
X-Received: by 2002:ac8:5a47:0:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4ee3140eb67mr19637651cf.5.1763458786765;
        Tue, 18 Nov 2025 01:39:46 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda8a7bsm1283095866b.54.2025.11.18.01.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:39:45 -0800 (PST)
Message-ID: <875788df-3702-47be-83d5-e34619b31083@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:39:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-3-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-3-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VDp8k3dZf5Z9-kbEphX0ydNCIC7UjaC0
X-Proofpoint-ORIG-GUID: VDp8k3dZf5Z9-kbEphX0ydNCIC7UjaC0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NiBTYWx0ZWRfX6IWmm/PHos4l
 wa2AiGr4FHJfrG5XWh3de9eIeLoC1LQqjsuk5jc5Aues1yuQVq02F7Lqg/3xzLNVpOr0i3tTd8b
 vIAi4oPwx573N/KpH73/UMA6AN0k++w3KBhnw9+RKej4cj14epuWiRDeZguWAq09YL8gUcysZrT
 6N1jxy3apV0AP+5+ijpzDjW7rGOKbDGf4Rm4U7/LJ4cmSZaeBsqSFoAxozr6N6C8uFjtigK9g7H
 objhaTRO5IyNSY3PpG0nsayiB4Enp7/snWDxLTiuqjqgBM7UULj69I34qj6+ow6TMCS4xUGAY3W
 4kAGhG1r9F+o1UvMqZKNj2bjUrV1xQvbWQ3xaIjyX2//oafGFQiJlrYz6VH/hYkPivGhbhrr8FS
 G1ThWlyNGIm8DrTF6TiZfUzK48V1QQ==
X-Authority-Analysis: v=2.4 cv=L+kQguT8 c=1 sm=1 tr=0 ts=691c3ee3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8EbF_sMYILjvT3iq7EYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180076

On 11/18/25 8:17 AM, Taniya Das wrote:
> Some clock branches require inverted logic for memory gating, where
> disabling the memory involves setting a bit and enabling it involves
> clearing the same bit. This behavior differs from the standard approach
> memory branch clocks ops where enabling typically sets the bit.
> 
> The mem_enable_invert to allow conditional handling of these sequences
> of the inverted control logic for memory operations required on those
> memory clock branches.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

