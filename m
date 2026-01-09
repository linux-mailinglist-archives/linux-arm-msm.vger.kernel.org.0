Return-Path: <linux-arm-msm+bounces-88261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54393D08BA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 11:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A9A03026B1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 10:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122832DF126;
	Fri,  9 Jan 2026 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tvsj+KOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iiiMB23S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A24433A703
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956030; cv=none; b=JV8xkaR34r8NoRIJJSBfI/8QxVpW2UCmS1qBGv+a6Vo1CtbPDR9SHUMlqqeq75pLdJSKaW+G4k2Qs9og7UclRAMlMqIKcnLmpWDht7sc5s4gAvUmbSNsp34+RUkegvM7w5YevI+JXVly2f2v/0KO04lL27dtuSmN0eXKuNuDCEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956030; c=relaxed/simple;
	bh=QHKi/CD2glnCqAP4UBQC6pElNN3ZRrpwqImMhDKxwvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gn4u8mNfj9TkzJgshs2iTHe2AqnrNSMtApSdNwrZmXValQJXTez1jHyAFXzFsG8aFpJS5GzwTfX+YxMB3hnn5UH5UbuS0NGSlA8rZDrJIgqMiKrh/3qN+HCjX5zkWFUfmyMgGsGuu6OHX5eUUqly8oWVeiWW1+0+ORjXxwZOIiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tvsj+KOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iiiMB23S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099X7W13324889
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 10:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FX3/e4Bui7do3TpGHWokJutJxg3+CkyJAoSTy/dKC24=; b=Tvsj+KOHvVXjLTob
	/OtLXE9XVhfY6MBxawp+V+KmOA7nxQW92MFSWjTKJKHFX2UuCvVFlXubT2Qq/fNa
	vUw3RK17dQvTphfoxqldvKSuQFqj3JpTcm5uTvpzpnfB+gfgYkIil4+trLdHpYxF
	wz+3fNRGk9rMDlNx/MYJzSwizEOu9M2pQRsbHlxIdiTa9yPuJQxvaC14qFNwZmNK
	vQjSN67c4qMtL8aXWBdr0O+26ftxw0U74aqjXxyUP1RvLOlyRAmMMvU0FNfGgCuM
	/VHSsBaMDoeZ3W+5XghYPf1XHM/dm4F5ejD9rKcf2bBlf8y7xlkK198AZSsuy2Re
	tDuVJQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjrd6hgcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 10:53:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c6cda4a92so5337070a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 02:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767956027; x=1768560827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FX3/e4Bui7do3TpGHWokJutJxg3+CkyJAoSTy/dKC24=;
        b=iiiMB23SmBmaecg5ckzfq0rcHAGmMn0J52nLc2dSO26inhia+j8BklKYvHMgtKSekx
         Fi47c18uaDk6aGEeSEQc4enFJ3wUPeMDpiZtqiXT9rKhwt7NEPESyJB1O8l6/ISPIOPu
         pYqc5rPcz/2BDk7W48UTDUkIoZXUqHgRjck877//zqzS+cPQs7u/maOS5fufgZyt+2mG
         Rksc7VVwNIzCuuvj/Uc1NdhZQ1EfchLUpzsqCXopdVe2CouqMtabBZgJMnsYyyFAOh5F
         7Lza1qgFIysEj9QQqcqX54gQMKU/NGU0Anxo0zbs4oG1xgpInYQvAFrctWPNYDt1DAN/
         CTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956027; x=1768560827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FX3/e4Bui7do3TpGHWokJutJxg3+CkyJAoSTy/dKC24=;
        b=ZmvMlOBlqvks2izJwX9yipovuInUMAXwbXKmdMrPq70ESo+s8jFjx8qgD745CZ3pnk
         wWQV7Ac3toOCCmB05DLasduaTvDfhfEfvyX6GhGDtbewZKNET9HICFahqCEMLhPgkQN8
         eJpqAJbD35paDgn9F9UNteB1+Y1AmN4pLM8XVkbWqCSUxw5x6PPfSmv0wDp9v9oUhXhv
         tHWpo454u3C4OfV0n630rE4ozjZct3nELfoplhxHE0m1wNv2TExsWiYa5GNxN096lfm1
         dLe4K3FIZJNvRN5JfBGQCCnceMbgM3F1IPfu+9qAPZQuSHEhFKRAEkoqjQbXtiDjGSVt
         kzDg==
X-Gm-Message-State: AOJu0YxPjjDDlU0Nakv1IFmYZgt3MktRCjYScBKR51NedIk8yZFpB1Eo
	3SxEpM1Dqq51cxoFbou7EUUsJrlTno6r9y0wQZm0N5rq4Gf764vwHt1qb3AUJhdAWRCH9+BRcix
	ULjW1fy8Qf7EhXz2BLjfI66iInXcFe80/K/NxdQlvusFNuE4bz/2by8Yw+kPv2YMDTE7+
X-Gm-Gg: AY/fxX7Nb0MJiN1XRU69lNGk7e4J1p2Z5kkcvc6XDD3TO6sDzjBMabN0jEsjQxIHMbL
	yMnMqiPoLgvAGtqo7qTmurDjbSXmcO1ydWdpDEBJCXKEvne28CXDmPsbj5Onuh3AZnCbaFxXYA3
	Xv5gN421UtHB9IZ611KQNPpFq+UKCivz0SNVtmVLvy17Ff9lfhiUrIrx2TxXIfJBVbeJpeNfJdi
	8yPfjG7oRMoKQjJrCUlOMWMyRr8mv5TQF9ihehWdDBk/hMGJLfCC/fbC4rRbqvMargVuNbGhprX
	hWpAgDRsYLXaLs6BTSh9k4qY2uuiEh7OWnX8iYXsrd0bWUO1tIQCKIvMIajuRKN1ihTMvFD89lr
	1ecjAG13W5A39MLwpGwybaI76FDGooJG6aTQc9BbX4PZ8hX9CtsytSPJ9C9f3Bnc87G1BO8gS7H
	Y=
X-Received: by 2002:a17:902:fc4b:b0:2a0:9084:3aff with SMTP id d9443c01a7336-2a3ee509c6dmr91959605ad.61.1767956026657;
        Fri, 09 Jan 2026 02:53:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErzTnVlKE5xwARBJIfQcab8hKCQtqT+guI2WKRBtLVTc+stAGDCN+noJGv98gsdAal+Av8QQ==
X-Received: by 2002:a17:902:fc4b:b0:2a0:9084:3aff with SMTP id d9443c01a7336-2a3ee509c6dmr91959375ad.61.1767956026188;
        Fri, 09 Jan 2026 02:53:46 -0800 (PST)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a31dsm102526905ad.9.2026.01.09.02.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:53:45 -0800 (PST)
Message-ID: <4370578c-22e9-4af9-a4fb-e87a8cdc117d@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 18:53:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-binding: arm: add CTCU device for hamoa
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
 <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3OSBTYWx0ZWRfXztSsrLL2yn+K
 AzKtSbmwyOYAXs6bpB6zMcwWN+i5WFDQMIKoMZ0v47HLdkE41BNVYohODMmCWyiwCuLK1QFp47C
 qKz4xo42RLhShrRcgrnYs1w1KSRadFQtHUfG+wOr0XU6UaIIlWLzlUa4xvTbs0CPcjM6d820on1
 knqdh68vvsTilcSuk9KHbSu85059B/30BKZjuXtoUc6PoSpaQQ6QnJaz24iKF4oHIY7SUtjvBLh
 o/5QxFyETy63LD6UvKAKNK4MIds27/LMt3bWeJnumD3sr9S8UZB3HE0cVmJbemBLhvvpkPDoIc3
 q0YpKltey/bvASF/RFvSKRf7NMxLE0mzYcb+/54sIeCw7KatMBx4Dh4MmcoG92XKvkMDWenJG5L
 LgNNTTDFtoV0B3tlvps+yuvylfzl2NZuCAbz4ty2UeJHtmkzcXd5RFHNi7gvpys6XbAQQFRPJlA
 ktNN4Ona9sFeojSbMaw==
X-Proofpoint-GUID: GG54P60vpg6mEp_HxAyuSBGvvfnpNCqc
X-Proofpoint-ORIG-GUID: GG54P60vpg6mEp_HxAyuSBGvvfnpNCqc
X-Authority-Analysis: v=2.4 cv=Xtf3+FF9 c=1 sm=1 tr=0 ts=6960de3b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1asyLrDfyG44IMe3nHcA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090079



On 11/6/2025 9:57 AM, Jie Gan wrote:
> Document the CTCU compatible for Hamoa, enabling support for the
> CTCU device on the Hamoa platform.
> 

Gentle ping.

> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index 460f38ddbd73..57dede7a90e9 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -29,6 +29,7 @@ properties:
>       oneOf:
>         - items:
>             - enum:
> +              - qcom,hamoa-ctcu
>                 - qcom,qcs8300-ctcu
>             - const: qcom,sa8775p-ctcu
>         - enum:
> 


