Return-Path: <linux-arm-msm+bounces-83750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EB4C91C6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EBCE3A8F5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21373093CB;
	Fri, 28 Nov 2025 11:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLsb+Npl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRMul8SB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D86A309F02
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764328705; cv=none; b=j9eIgKMF/EELj4kYb7H4LkR3g0bBVvGHSaMGzGfkJ12Vi8S7o5pgV+zlDUcP93curlQTuWDe609/Z12hhOEP/BYNyr3TXaCPDIfWt58jaGftxTXhjQLe4h+uWfKAFL1fRo8K+tC8zcwjmGcRR3XQuwJQ8cNLhP4JBDKydhASz0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764328705; c=relaxed/simple;
	bh=YCc1+UgPiuXJvX0TVpusAfBmkPlFfpSHgkcHG6WYdBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDl03g4UOBfNS4aDeAhkBPyeuZl49U4Cv2Qk5OZMyOgb6X9oQR5PQbF7oeMfA866zL+5HNvx5gGPUxBNR82kmmXd+mLOSCjCsFg4A4yam3q+ImS2V0D/MNQ/o9BdM1oVu10RZ7o+SmnhaJ9DjAxBq8giJuUPRGIi0Sa969W7mf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLsb+Npl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRMul8SB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PDrc3919482
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AV3c2aAbHyk24KKPKA36/3/W8ooHQXQQioPdhszcSSw=; b=QLsb+NpleYwbZm9F
	uvaqS2aG6rT+jFVsqmrYZaMj5WNJHW+4uRRT1ShYq5xCHeTAtW9QJ3k0wu+s1fbs
	dXlkqCcvGHNHpPg20A5gerlmjiWSwM23TwYElpjc/9T25ee4RzsP9UPbAvAsk2mD
	YcK3nZ8qczUwe4WIRnZA+zPAqJOxi3hNIV9xNhawku++fI58zVNVafZ8cuJeRgF2
	S4jW8wfY6B9WB8rQPWdmhAIUCL9X5tDWMjKIsHi57y9pTRJulXTwBj3YXm9y+l03
	2zoPK0uV5lAZNXmrL9xr7r2wfJkBKgRJcejhdckn0ty21BPqRrZ0jAD2m05gx8MJ
	leD1iQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apq66jqna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:18:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88057e35c5bso4887206d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764328702; x=1764933502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AV3c2aAbHyk24KKPKA36/3/W8ooHQXQQioPdhszcSSw=;
        b=BRMul8SBRe2fD34Z12c7TG6aex0QRCgpdsq4iZWEpZtbVH6MRmbCNCeo78M/Hduq14
         R2CSlFqz8XGsbWxSwS7fLFcORZmRjzH6B5Wazxf8LTa/mfcYQEg2fyoBdRuR4pMpwGEL
         Rk8ZKwf+seWwNJHm+mExO+Dq5QUeEvwOLJ3mseVkN6A3vrzrZzEmX7/XEC2czQFDXj4s
         5S9NLTZiEpI4wM16zE9y0K+u/Xj5nWIFr+OlL4KOekO4YX7AQ2cRevl53l9wJGffZtCF
         HKwpOZ2coPlKD8y+MmnoU6fxkP3KqPN99VqC+WMoFQQzhWoDyDdcJNS2B1M12cvFkrO4
         +HaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764328702; x=1764933502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AV3c2aAbHyk24KKPKA36/3/W8ooHQXQQioPdhszcSSw=;
        b=U/6cH06CZ2ii3yrGngauvGzww8Hl2mhPhi0bt55WxAoqEaVfIHjm8DZxoZs70lUdHg
         MUbxHawnGnAZ5cE33KO0rLOJ6J7wcllK3nqdEfne2UkO/BETlOZ77I0HTYZEjkhO51Us
         8Yj9qkaDUP9cYNLzGtPXVSqblo7jyuHqGh6YjCwmTSAV19cum7O5iQGPzoANxHy+Oizd
         PibC1qjznnLBr21w02ZGDRScvuMVAYm6wXmVL+TYb2Cjf5rJC1zPQC0TT4k5pKeK6+/N
         0eO+pvRyKrPb+Jk2cq/ONParQ03FCHNEpusiCpMn+Lv1MCIowOeXWMOw849MmZiFBY21
         LvNg==
X-Gm-Message-State: AOJu0Yz+E3/LByOMXeHVIS1lJxhnPCroVH956NVzSBo6sCAVekzFXuO2
	SOVg0id0XLhcEOHHVhsu8GhgvfhIFWVYVVNW87MCljyGQFLZ81rxfrJ3Xsb+Rxs+hWCQ0R5kBtf
	DFgVpeMODpJQ/tVviKIFX6mPXszU4+Z9an1+V2RHkWRmh6N0lQhXOhwnJUW4AsNukaEpQ
X-Gm-Gg: ASbGncuzDbPq1n8gPPv6qklMADExVeyh8nsPS9xyZK8sUjwB5qPCCqhhsXO4YPNTKCp
	aY4m5q47nblpR/Xu8plRAwrTV99PNVNnYxeuDcDmh5S6X7iPS74ZbfHJEO43eBwOsLn1Auxmbon
	TXg91FtM+mKVRv4HOQlS3+gEQa+ZYzxIQxNAwF9jbj0QDLnrPvNl219SXAY6htASMMjz+GQsrAg
	Ebyian+J+DoBNd6znOAdnTZmmzTa3f1QXZm6MWYdg6TxWFNS08pzZpHW1S+rYZ6nCauZ/GgJeki
	WriZs3TPfGV35RIOQuupUYLRu1wKHyMf/VHMHnRe60roLmbX1r/1wmUYqAVnoMM0rcD5v7536EC
	fDq+tW08rl/R+6im31e/wpWzHGADjQqvt7xbYtIAIXGPXhtRQj52p+3Aol9XCgFfJnKM=
X-Received: by 2002:ac8:7f46:0:b0:4ed:616f:3cee with SMTP id d75a77b69052e-4ee5b743cd2mr253381191cf.4.1764328702641;
        Fri, 28 Nov 2025 03:18:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHj1H6DQWuhx4oQp0mbbzPy86iehPS7VlROaDciGm7xcRUUcuSKijkMWZdCff3nA3UKriXdwg==
X-Received: by 2002:ac8:7f46:0:b0:4ed:616f:3cee with SMTP id d75a77b69052e-4ee5b743cd2mr253380891cf.4.1764328702200;
        Fri, 28 Nov 2025 03:18:22 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d45sm4099314a12.8.2025.11.28.03.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:18:20 -0800 (PST)
Message-ID: <17f8caf3-10b4-4397-80d6-72cb7e076f51@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:18:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: talos: Add GPR node, audio
 services, and MI2S1 TLMM pins
To: Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20251125033311.254869-1-le.qi@oss.qualcomm.com>
 <20251125033311.254869-2-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125033311.254869-2-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tfY8OaEqLtUmB8yaGAjy968bkIQs29vM
X-Proofpoint-ORIG-GUID: tfY8OaEqLtUmB8yaGAjy968bkIQs29vM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MiBTYWx0ZWRfX0q1cUWzXp94l
 V1JuyKpZ95VLATbR4b9Ysw2hp9FT/aekBY76y6g/dEYAhxZpnLLAhGK+5zICbPFKdMP/lhjqE7T
 2mUpCLUd/QQ8VoO8fm6wNnRW0CULmb9GDUQTMJLd0yM8suc3Z9Fc7U1qOcERSfLkfbtWRTKr1K5
 9vGbA4bU8+AUkHhsDVmnPPRkTCRAFZ8RYFvsfN6e7rN6UXasBpE58a27H3Vt5GVaaUxiImxHuqM
 acgGF5T9uap2tqMs10HxwamtZwk8bHIdeT5I57ULNKcx8oCQvdf3p9QJbiwy3PlJMB7ufx+D2Gp
 zoCiy4mr0rsBhbMrd2bMUIzudeGOmdMPd05V5A1+Q7umEBrb8hIMU3nV3MWxAeXtn32F+BPs6Y/
 WAFLFgSgwUspsDp//laUDzukbAfPrw==
X-Authority-Analysis: v=2.4 cv=BYHVE7t2 c=1 sm=1 tr=0 ts=692984ff cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oAnFxF7TWIMXTAyBLVcA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280082

On 11/25/25 4:33 AM, Le Qi wrote:
> This patch adds the Generic Pack Router (GPR) node together with
> Audio Process Manager (APM) and Proxy Resource Manager (PRM)
> audio service nodes to the Talos device tree description.
> 
> It also introduces MI2S1 pinctrl states for data0, data1, sck,
> and ws lines, grouped into a single entry at the SoC-level DTSI
> for better reuse and clarity.
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

