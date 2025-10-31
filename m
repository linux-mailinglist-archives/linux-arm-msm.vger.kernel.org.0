Return-Path: <linux-arm-msm+bounces-79825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA1C23F83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43377561249
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 08:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4886131A049;
	Fri, 31 Oct 2025 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hucpX1VY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWaQcEqm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6103191B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 08:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761900998; cv=none; b=CsDydv6gvKjpgLFWtyg4ClpyyBycjy0gIqUq84Sc6kLQ6LgjteThPPQ5mtsyAdkDyGP6MHIlUA2Bl1FfCs0sA7qpofIzsFBdyraiu1vcFOd78B9nptKgNupUY6baOOt4MIP64WvN+E+2QlYCvneZsfTTPAt2b8g1aizC41IF1h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761900998; c=relaxed/simple;
	bh=W5ZlQCgP/A1LoGvxjaWkUen1ep3flGUv0d7VkxnHAcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dyO3mJykZnHjCDWqfCTe0jGLdK/vuOcHTzJ5Br219H28msvkrOzok0w8GWGQSSKz+5RkdgpWd1hUqhakbr6u4MEuoq+uNBNzLFaB1cUwqWYYfshcQykM3hu6NYjLuyPEHFqjrHb6AG48p8OU6ARvINYn1Sqm25X1l3SEbqvS6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hucpX1VY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWaQcEqm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V17xtr1512386
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 08:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYxNHYs7jVuC4tl2A2YyBIs3QrYPUoziuqOeF47ahUY=; b=hucpX1VYkhXRNr0Q
	uM/APKUjCdhf6aO+nBED0gGz13YcgEUmuKgRo5Ga/Hc1zXcCIwLm2RpfgnQ0Lh6G
	7Xqj/iUgc4+tDiMzUHq0/01DW9mr3KqP/8TdEiExTEkMlRyXBu8k7TdKdankdqLB
	RTWM6zRBTxTvakwkMyBsKZV86A1qXI0eeIyg3ostVmXrEUe+xBtNCKX7zYynko9s
	39+K1Z3xwAz4khf7YmVsmTfS/o0a2754QTfv6tRyZz0p0Rs1zCUuYqSFCNKGne4k
	0eZxodT7/N7xWB+l7iZjM4TnTYYF+q2RBrSRyOekvtLx+B9/IQjsJe/Dn/udiX4h
	v6wBWA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69h2gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 08:56:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eced2a52ceso6541571cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 01:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761900995; x=1762505795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FYxNHYs7jVuC4tl2A2YyBIs3QrYPUoziuqOeF47ahUY=;
        b=TWaQcEqmpt8uu7HtI1bqaW/4+XIYSfzFwYL52V63hUZqgHFtmQLnfWLvQhnp60vMHM
         YtC9fyRPAXerepTfZeyrThZ+HUWxjF26fUgIE3TLBh2kmZ06E/s53EkIGyOHjQCQpIkp
         imOiunaqtk1hbz8oe/FXpv9I3Mn2xZVnn6w/MusG2f9M+jsY53lSIgyfdaEsKys7vcQn
         0pd/Ye4e1SJczgIvjbjFmyuLzsqdcwHGZb0qybT7MiGhL2r5A/cohBf07ND3vzknt8ED
         KKlN0dXznQM1AlZXRgJCKbP/t3jRkMyPztfU6tWn8FjF635uHnheowqmQEdPHrzLgH+8
         rnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761900995; x=1762505795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYxNHYs7jVuC4tl2A2YyBIs3QrYPUoziuqOeF47ahUY=;
        b=ObMkUcyH13SJ/aT3VH/GEGD1t3A5CEVYd5Fncu+eoRyyRsK51/NX5XrnT0JG2qGQWL
         N33mZQeOcc0DYsRjr+iOkNkaRqQ3Enp9St9958vtXYhF7mO5yJvCVa3Cg+cHDkvgPQy3
         p0jDaR9TTeih015QX/i2lukgT9vXUyvbpNJOQDHHBZJR3Zr7BY91YpyVJsUQiB61KBEv
         ZbIm6w+emYJ8KWDaJQwuFlOpTq+v6d7gOuBK3Ryft6HF8dX+aTkdyTw3ZhOGEKUhQmol
         0SnkDBPtVNrpJCMyYhtQujjnGKVlsydGLrXUDE+pWS8SRCgSS7c7vvU6niZgecDTrsxr
         yC5A==
X-Gm-Message-State: AOJu0YzxyW/c042wA0egjrrJGLqJPjITujB1IGRuVymcmrcVHJjm6Ukq
	AgHnqt0O44tj+Ggxbvx7aT2YOB0c+Q0Wt9N52FcL8AEl8LvuDqphkHHr7VAouBAnAEHEx/eupLB
	uIlFhkofwMv4ly81CwiP/G2JzV55R22TKR7thkMgW2bnrJDnu5hU1ZTDep4n3IpNaekHN
X-Gm-Gg: ASbGncvjpwFmCDDDZEIOHtIdXTxcKLdYt23QDdj9QiwGU37vJ2QJjaXcvHGdtcsH2ME
	Txw6BtqYQ+/6lzK5g6XwjJfbVLlUIlLFuHnRTUfF5VLxGoAwtpMIXaYLHIsUE7qCeNoqpD/1UVZ
	r3rZaX/urdOiw8ADnfEjTJptDR+ZpZhgVbn8VY2Pg9M580KQNKTZsrysPU+Ixh/bAjckYgrsltf
	jhm0w1R9PlMYLEgRR7Dk5O7xunem1KfSlg3pdDNMMfKYS2n5TcbnLnnADjuZTEtRajOXWrBcc+f
	duLKtfxFXV8olQ/d9HV8J0PlbXGXavFRYERGyoKY4en+DN8uTvIjED+xbylS4alZKMGEDmReQh6
	HZMq7HBGVgzR9NN3ARieOehFOWLfcq4ZYM174u/GC+Ec+ZsMkseRDhuPh
X-Received: by 2002:a05:622a:828b:b0:4ed:3165:6084 with SMTP id d75a77b69052e-4ed3165647fmr13633601cf.0.1761900994976;
        Fri, 31 Oct 2025 01:56:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM03ZK9N+Lh6AHHcg0kqRx98VHD9IXz+FL1+/SsNyh2NmAO6CDleI5rli8SMy3mi4Ri39SAg==
X-Received: by 2002:a05:622a:828b:b0:4ed:3165:6084 with SMTP id d75a77b69052e-4ed3165647fmr13633481cf.0.1761900994552;
        Fri, 31 Oct 2025 01:56:34 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077975d24sm123498966b.1.2025.10.31.01.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:56:34 -0700 (PDT)
Message-ID: <e0941e4c-849b-4089-9aee-d36a628d09c9@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 09:56:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: rename qcm2290 to agatti
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
 <20251030-rename-dts-2-v1-1-80c0b81c4d77@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251030-rename-dts-2-v1-1-80c0b81c4d77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V_gRBYG1NTr64txr3lizu8ShpxiccCAa
X-Proofpoint-GUID: V_gRBYG1NTr64txr3lizu8ShpxiccCAa
X-Authority-Analysis: v=2.4 cv=OYaVzxTY c=1 sm=1 tr=0 ts=690479c3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LoIfXdEys6ihF5rPnm4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4MCBTYWx0ZWRfXzX2ovMKWY9BR
 WgaKoLX+XkqqE6VRlGqK2PmNdnl2voX8yP1rAGGAosMSMjgmdhOLQXl0HNl41jiJXC9cYsPLzej
 al1T4oAFKiyT1Emr3waMTz49CGDrE4KhvALaxEHtFtsZPgerC9yosCKbZielJ5gUHc3vUQsW6P7
 HyCJznmPZscTLO0Rw6uMEiZYc1sVUX3hfEKWjXKRLQuGFM0wyiiAEjOhnh/lYcKREG7Rzly2h4g
 q21ZQOV7jS2nWuUdl/hWfToqQQB7znymAAKbL6X159TVcrNpgJvcGRUjDVUFkWDL7izZkWnIAiR
 hcWaqSKYeEKFN6swA24EtPrP1pzHqNfIM05RUjniqhRY0jDOmjlhqRbwsfn8uNUgGFg6jbTbrQZ
 xesDGeEDWw4t3enyPTKFmVTKlBRK0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310080

On 10/30/25 7:20 PM, Dmitry Baryshkov wrote:
> QCM2290 and QRB2210 are two names for the same die, collectively known
> as 'agatti'. Follow the example of other platforms and rename QCM2290 to
> agatti.dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

