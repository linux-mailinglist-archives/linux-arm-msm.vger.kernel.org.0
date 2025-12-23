Return-Path: <linux-arm-msm+bounces-86299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E14CD88D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69655307120D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 09:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A00327218;
	Tue, 23 Dec 2025 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXfjS6e0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvQs1mhM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4CB322A3E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481266; cv=none; b=CqzCUTApEkd1W2J3S2W4jfQ+ex5Db36FCuRl7kc/5VQOgWFuTVdY5lrtAkSecwDDtOx2Pqw46NrPMew01jk0wtcj2fregJimE+jotVR5V95ASOIcgDaOm4TFzjgAbh05rrBADYNNh4dFU5l/LJsl+yrbb1vcbNPm8iFtw86KBag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481266; c=relaxed/simple;
	bh=yCgAX1YryBgCsdZpRAQeSYgrmeDQDbGJxTRuezf2mKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+bug6HvWGxR+psn2RsR0MwVcsNTSZLmLEBCIoxafiXFLe+lajbm6pBS5Yud5g/Jm/BK5PoSrd7f9I6QPUtxceMC7goNujlbAFmy5wq5k7JJTAzmnf29Me8zqr7dacAELa0xFCR1eJvzDeO+eWDqkidVgFI/cWvQmD0tfs0ctxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXfjS6e0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvQs1mhM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2VfqB1889420
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t05rWGTb+LRgM4XPtrIbHRF5TcNKlqjO7KIC787c9uk=; b=NXfjS6e0PuzgMR+8
	rIVKgZOL8ux2lMmNxFcmM3gBE5vy1uKSHs7W/o0hqiqVMATXE1L/+k5q5yYLqMKq
	lFacsHlA5ckx1Nbn8t7I4zDqFC5pyKSUaSu6i2CnPkCUuy8vdrpj99Ojf3+Qxg1Y
	5lDIXLfHeOBiF6ZviPrOZDZ6iQNFsoBLJZ75yof59BcQbsjMNytIKhEcDnd9wpN5
	Rzd6jv+5gNCFvbpvwz8AtLZvIJ5l24X1ZfwaftVhPC1h0+lTy+FJvONlK5fBLtBV
	GEYny+PcbaRp/HDzZaFTdk06DS56yjLIbdanIrAf9NLNueFLCbwjHxF8FAyejykF
	PvomlA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ajxws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b952a966d7so10031961b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481260; x=1767086060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t05rWGTb+LRgM4XPtrIbHRF5TcNKlqjO7KIC787c9uk=;
        b=UvQs1mhMKwYTwUP05Mr5ePNMx4fIn+J6F379uZ73rL3XOfeYT3kkbujxX6Kq+cNZPM
         4GwrSaMiMXQBLg5kSIYrqeHU/rkD/CCPbX47Qn5Cr5NetqX+of9KH9jIG24dfbC92fUT
         lS+GkNEvsGW9wfK/qlmTtZJe3cWg5fA8qYH/OgcM67Yuy8xFu45nmr4aDeYOOf+uL2qG
         0MY/wkR9QhOJ+cU/qdyC7zgLDYfperwXtUXQNQKFqkzZlJrLVM2q2dSlaLeXFroL/THt
         7rhubO91nIOf5X+7PWuUpqTagT+PvlnMVFwkl3ZR/gNZv+NNbIaMhZuovH2xGErS+6UA
         74cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481260; x=1767086060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t05rWGTb+LRgM4XPtrIbHRF5TcNKlqjO7KIC787c9uk=;
        b=q435oS2hZqzIrBa4IU+45vnyUz2ryDIdCYqiGnwhVuQVmY48tXkDqsFL6uqGYWXzwX
         +4rSlRjC9L7qXZ762qI3oj0vLCJvTTWcidRNQkZWFiu0rqH47XON/nxrZuX639xpHQHZ
         YPdYrTzg8FIyYRcLEACnqc+u32918oKD8tnj05BDubf+PX4agUnKrta5BsARhH6vD7qX
         zb9+OPK7XxJaqEBJPuwIR9bO/F9sIJYf7zS4eHQiFvxTUQYPKuW8x0+ZiEqGS0CKs1Q5
         rqPs5QhHV5NdT0ZxQ970Kz8ISUtPDVMfFGcYYSEJNVkuoZDcQIrfmjpjPRKNjdtOHSiI
         rPBw==
X-Gm-Message-State: AOJu0Yxt3fXmp+p/wxLmm0yfz9SERLFuIzrS0aYD97UsMjZwLXCT/uzu
	Z5m6/cu04eyx2sCw0jHjQKuD5QLOLS1/Tl4ufnLIveBNo1sPeHkj9vh4fFf8Hk2/DDcn+OS0DZx
	WoBEYRezEgdpq2jNusLHC1YMpTMYN3AhPzYiCkiVDqwUsCrvxan+3ZGvAyY45h7SQ9WFc
X-Gm-Gg: AY/fxX6L/th0BuoG+fe4ybixPeuy88brty+6KnR7DvmyzlU1nkyUwxkPWw8AE1fRgsr
	NjopmtTzMbRVGRBWLImQeEMt+XbdKdEfy8Db3zC31XGokqkAAB3fDSXg9DgEN8DNdQIRQqcedju
	+31BJw2qFEh9R5gtgJJXJRCBCZOE2jZUfCgfws3Jq2FlwI6Y9vvc/n+3/xKL/Gm09vhAL3WGXma
	SzQTxgpx8g4Bmeppa2QWHzH5b7x5cvhaJklRHiv+V9A5bXl9sjcEGBLwDKnw7cZI8iU2jPPl+O2
	cAP/Tp9zLoCC2DTvneyKrU3P8BYxQiP/ufgvwzJkNtnXmCq1IZxpotvBr0UitIqtQIvW5lG4+Eq
	1XC1jeKkhrsnblsF4eetAEcdS3nNxA0o06kZT21eRWPy7rJUlKacziPC9RxpPQ4StzTa08zk/cE
	4=
X-Received: by 2002:a05:6a00:4298:b0:7a2:8529:259 with SMTP id d2e1a72fcca58-7ff650c7d8dmr11719169b3a.9.1766481260119;
        Tue, 23 Dec 2025 01:14:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGe4HdZJVbYIWjRU11UlrdiBLG05fYEZaonvOroH3LucyJE760wFEvOG+/uKCU3r36+UDgyZg==
X-Received: by 2002:a05:6a00:4298:b0:7a2:8529:259 with SMTP id d2e1a72fcca58-7ff650c7d8dmr11719135b3a.9.1766481259647;
        Tue, 23 Dec 2025 01:14:19 -0800 (PST)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa328basm13090376b3a.11.2025.12.23.01.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 01:14:19 -0800 (PST)
Message-ID: <076f6aff-4f9a-4630-8e5d-c11f0272de70@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 17:14:11 +0800
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfX1PLulVXxj+ZL
 S8IDurS62sV9/cJStpGBqqM4sfrjNpnri3kwpwaIVWMskyDsfRlNX7vbI1KmL5QX+rfDffaEh89
 IWUE9gMuDCpXRkrRDZ6YpnJ9KFe5dR9KmqaDnHpSgntbyj6tBGIKIINfcJ9i897whFkf+GAoIg9
 g51OePzQIt4J2IaVXTSez8XOX7KHGpyTdVlfNRTGQ+RNIM+JSYQrZ9X25/x0sCcnKdkD4twBrDP
 O/Wjxi/OJmalT2OKE3qs1Q7CaD/s5NG+ojnF91hAyEwaQckcCYn7XgSOjrgkzSUaf0C+kyP6i/e
 B6eISUpGrmYWEzUqF0yR4hhkA85Nasqv6y97sROrjJCnuYmU2NjBkSTCKhY6UnRtsvyrkxxDm7p
 QPYnAv0WHW5FV3XhiS4Fc++km7rBl7vapj1h/YtiZ1V4PBihQnmu3NeBrSMMtjBokSnKpXPor/s
 TnqIw87mhv6QDLFzbpQ==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a5d6d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=RAHE_PFZX2t7DYYKEr4A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: DP6VH3Hvq6bpWLkbm9pSUCxPxuaSwJ_a
X-Proofpoint-ORIG-GUID: DP6VH3Hvq6bpWLkbm9pSUCxPxuaSwJ_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230074



On 11/6/2025 9:57 AM, Jie Gan wrote:
> Document the CTCU compatible for Hamoa, enabling support for the
> CTCU device on the Hamoa platform.
> 

Gentle reminder.

The dependency[1] has applied and I have tested this series on 
next-20251219, no conflict and work well.

[1]https://lore.kernel.org/all/176615287813.688536.723538049922655005.b4-ty@arm.com/

Thanks,
Jie

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


