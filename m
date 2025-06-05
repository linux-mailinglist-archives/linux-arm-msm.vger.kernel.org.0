Return-Path: <linux-arm-msm+bounces-60365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7A5ACF591
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 19:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3721E1894256
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1BF213E74;
	Thu,  5 Jun 2025 17:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBnJIAbB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E4E149C7B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145278; cv=none; b=hyGeE+t2nMVunM8aeGzsSRgWXENUTyuSTLM7YXSGWSAxL6rVUWjJWgwzkc+osoh5zIzUeYBK5XV/FFJ/nf6e5P64As0fQ7l/TIyaa6yQ1G2etWW3xK8d6r6mEhsP2UVS5Kh++8PCejviGX1mMzSco3P5k0wHS3nDB/pvp+lbUIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145278; c=relaxed/simple;
	bh=Kd705cVy4cZXsJVNVs/ul0Sz4mIzrVXisg9DUB+95HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uLwtSzPHNubsY7UnkRD7GK0JN4eCeTrxrEXTVD6itUae2+QBAdqy2EpFawsSuwNcjdMRzfi3YJqBuUx9x5XFD8DfRThIm8OTCTxlRZCUidfzUuxhNoQQrXboCh+HqTT58pJloBl4RFN53d3mkxpo6v013CjRoQerj6Lsrdi4hak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBnJIAbB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5558hv3f007388
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 17:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GHgxB/Xl9nkZamsw9NDapmgVHXV42gJWpze445U0Ts0=; b=SBnJIAbBFgtOfs83
	q7KjuX0LFFoxgvFyRpjNa18yiPkWYLIyyl+fEKk7TJsz2Id1w1kzbUZWc6tZ07fS
	NB72xkPIguN46lYV3EwYgFwhUui8woJ/qsx5y4SOCCX+1A7oLhcHfuMyaG9r+tI3
	wDuDdDUMZNMGpVrtxyZGmv7Q0gfXnXwhin9YeLgBPnxUsznvWzfcpoF8jMFYivRV
	oMbBQc29iDDjvuc8q3qjvM7jBlrieR0H1dcJIVXejDPtO6H8TSX51iZ0Q5l/cA9h
	OYUJCRV269vx+Vch4eQt+0oZ6zLFKrpbctzSI7lpUbuho2U1i+5HJ0K6Yi1++50x
	D/+Ujg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t25j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 17:41:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0979c176eso23493785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 10:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145272; x=1749750072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHgxB/Xl9nkZamsw9NDapmgVHXV42gJWpze445U0Ts0=;
        b=MyzgVC1dOlMY4HkyfCrK1+KtIviSQO3sUc1+HmDhyfJzlrqfArqDrDyzLtdrBgALQR
         vHQilXg5+6bjtX7yzQWRZu53i4NKvKJShOIQoasJUtvak3tU8l09ZrHJ8SwsJFF08M00
         e9FcMXuN8xxksya7MuxzGMdYHGk7ZP/5mFBCKdaf+T97IV+FrUuK4RrSpTBjpsgPytaU
         JrHGwpPbcAMs/eiWw+IQ67bcy4iwfyeonPq4cfoqcvmNScE16dIg/XJQyu4YvJbFRo2G
         HC3CEXx64WKhViSw2DSyYqWMOt8K9qk7Y+Xg9l+/OtbHjSQ+xGf398eGdrEWAAXz6j8g
         Tkjw==
X-Forwarded-Encrypted: i=1; AJvYcCXepJJjdtoZLzotRhXjjOnAVlrsJ4KrQsoxRhoUiWM4P4KX9jpYH+CN66pnuM5KXMS5akXm5noSJK2Wwra0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7vsft1R4HgtUiugTA7bO1b0xF9azAPBF8j/vQhP1p+fELr34v
	bX90E+2N4zA1TI5Sr+d40pdlPnNrVP/6ibqyV4unhU0tQQly6qrU0fZUBON7WPywwev8XREv4oo
	8N9ygPCYDFVpvwW1m3v3NdfAJstH2uj/TiSL/zUEbE9aTWte51F6nUHBSYQ0fvemD0gTm
X-Gm-Gg: ASbGncvHdLnLkPIASPuOgske/zP0nmBiTEiFcb9i+C53eyvjs74ldKtRfiUlg1BLaOz
	FZkeGh5nmHk0YLMYhYGyK23PHxJZUtvuyzgM7ClxJbiQYyXT9RBrRcjPt2u4b0PUfTO/PLdF54d
	uWFCF9mF6mpt/eN/AgOiwdxPfMXvDCo2VFb+TLTjzBkuqCf0SLI84CHLq4pfsJbuX/SyPKeh6an
	Uy8o5thHaTrhc6qoKQ/DkLs2NG+ZEdReA9ZOSw5NcW2EIuVYdqEisD2Y6e6wiok1PV5e8CU7W+6
	cCl7P4sX40QCFOApLuSnaPBmdPh4X4LHXGVOKW79CvMlx4IyOx2UCo5jXVpcIYYmgw==
X-Received: by 2002:a05:620a:170f:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d2298db7b2mr26665885a.3.1749145272689;
        Thu, 05 Jun 2025 10:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwcr6cpf25RcY9Wl74uoirxp1iprjopwhfQNVHIAOcoE4TlDgGNyG2XDh/h14zGU0QC4ewwg==
X-Received: by 2002:a05:620a:170f:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d2298db7b2mr26663985a.3.1749145272268;
        Thu, 05 Jun 2025 10:41:12 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade125a01c3sm87638466b.95.2025.06.05.10.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:41:11 -0700 (PDT)
Message-ID: <44d9bc9a-ca30-4c5e-a3e5-c3edb2500767@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 19:41:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] arm64: defconfig: Enable camcc and videocc on
 Qualcomm SM8450+
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250605173608.217495-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250605173608.217495-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6841d6ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=cZhTYrgNKX4ggZFUOAYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE1NyBTYWx0ZWRfX5NI1XUAS/HhY
 KQ5momwVTE9QxKblny2tHgeqiJSbg4T7EtduMs6lhVhT3jDKiReKTccXYpgkwlW+uubVtGVAaGw
 pEBJRgorBjTmepy3bpXnCkc2+SkuJsj9VRX9zy1QtiRx3POkZDOW0C5BxHBj65eLOnONkMx3hj2
 WViUKhRgTICLzCpHMm3rVmqOolf4IQ+jyi/NdzK/kIKVD4eHeHwsNwaKe06R7k6UQ57OkOlabt3
 bB2eQZUu7/T/B5Vbb7ytnwF9Lq2W1RhVGwo2XmB6WpmLEqqMujbC0Au0LgfQW7cpc90uiZlVve3
 PJck6nQtnM4Hv1T4AxTCttjELMDxhNhaFcqbhmcKgEMcWU0qT2dBveF3oBk6YX9Av/BCityYnzB
 5Xzi/GLB1ZNGQSMpEEOEADii9pLvTmtVptUIiY0klk6QEfN1JRtme7iqLEE/uyLejSX+wqWx
X-Proofpoint-GUID: vsesU-eiAuiJr2WvDT_CW7BiGvMosCmu
X-Proofpoint-ORIG-GUID: vsesU-eiAuiJr2WvDT_CW7BiGvMosCmu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=863 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050157


On 6/5/25 7:36 PM, Krzysztof Kozlowski wrote:
> Enable the drivers for camera clock controllers on Qualcomm SM8550 and
> SM8650 SoC (enabled in all DTS files like SM8550-HDK or SM8650-HDK) and
> video clock controllers on Qualcomm SM8450 SoC (enabled in SM8450-HDK
> DTS).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

