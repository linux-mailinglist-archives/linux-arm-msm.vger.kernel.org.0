Return-Path: <linux-arm-msm+bounces-42068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F179F1036
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E43EB1888928
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42ED31F03CC;
	Fri, 13 Dec 2024 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZcvG6tQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EA61EF0B9
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734101910; cv=none; b=k4KeXZQjuRbd25l/MVAg9GAadxSiX6eVEIaNBo4GHaMjK/ts/Voo3oMdmIkUKZTR7dnnedHM/BG8kDtXHjsTkAh4KVXNmQATMi8ymVISyHPA/WnM0d6BmH7BxEPM7twkOtcRiGHkSoyFKnZ0oZakRT7JBsyVITKNTRYelVYCrJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734101910; c=relaxed/simple;
	bh=lmjOqtmE3pQRfyAmA39ougBPtWQC5wOec62QRPP0k/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kezLv4D+xhANcxhEl/+FR+xwKVfXlml6EpTMEoh0mDoZoCt89VJ45tENldacSz86xDy7ZDu6XNr1J74Z76Fq5MAEfs1yFu3zK3D/crBAkAXPnMCjil1QAt0yYQXSObt6X6Mjb8VV3TCggjbPElsIdG/b464BMzOHM1Gz3xnLkKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZcvG6tQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD81jEs022262
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rlszV4A6z8fPOk5ll2vIiFFJYFkRjUHNY9V/Q/BxZbg=; b=CZcvG6tQAasT2y/7
	6IKltI7NxHxyGZmWCTw/o48T+acAXDpkjf3pd64mMZzzzpqB4XeSLMazsykv+nSh
	puhFcw+EJG3I2mvz5FI1k9aUHSK1qS4BcIPjIYBF0bycjJkf7EbUbYNUCdNXL9/0
	1WSkwdGTIWxBazXtCmsLYgOO9flNzAUybYJLyOVZytRNvFkW1zBGfsLHn/bYNloF
	yb9GO4kq9d7rmDp61XOMsUdsSSCCt9LTBkAfxChUPQAoiKD+ABCNQlgHTz+JHEkk
	5ZBIfpRH6C8eNgm0Dl3cxVNkrYMNmvT1S6yAX5LRijQQiB55lEJa0J0aHBU6do9n
	eY/qxA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gh27160s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:58:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467a39f07f8so2230251cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101906; x=1734706706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rlszV4A6z8fPOk5ll2vIiFFJYFkRjUHNY9V/Q/BxZbg=;
        b=Q6VAA/7dOgq8ysnZMgXD1IEo9lDdeGTNM523codGof4SJm79LEy2DlTRcwuucquHwK
         /byzAudlb3yswRwiXzjjMT40UQQGvz4jVUM+soFkeJfCKH1dRRulkYupjZD0koX3VABH
         zcMevNAqJrlqEiC24wyIm3H4xPplhKgC0ry1J5+h5HeyULrJtcKOl375sjFObFoNwKkq
         HtsRt46haez8uXT5mL1Pnvubwdfuax0CURew6nwQ0KLiYvvHTPh7jX93qup3OaJdzn/D
         Q7W1fhPdl5fbYewKePd4oO+Q1LIo2BH88ZXfdY3WQaW3E/n4rhNAsHrIPOxFgHwfetbh
         8kWw==
X-Gm-Message-State: AOJu0YxXgBDYPu49tmU6usv7q328kbf6ef7KfZ69vyZxj12EvIt/fghC
	pPImJ1PO1Du67mWqGyVZmiWEyYb93WOlBkO//6CZDmpUDfFI0tJSHSaY9/nqfoq9k5a2jRkXTc2
	mQWPqXpZjFBiLziF9BM9PcTc6nuuYf53h6ZuFialE4KCzE6UR0+JYfRZF5c4twRuKK0PRr16/
X-Gm-Gg: ASbGnctrSv4RtfIU8aCLw66RKLHfopVv11sGBZxNT4Mhc491sAaoGOFst+hn92wh5xI
	JTLv5FCqE2Z/xqpf7WpFvuUSvI0Ex24UHZmKa0slNZUZs7b7x+PzuT1lUH1u49GqLHVsHjkn8s6
	GUHoqWtt+8AADY/epxHIapTlDbAl+0BL0T+cjdPmO6oEkOA2BeM9ocgxDtOc2th0OvirkSiVMMJ
	o4AOo/H4lW1j2OVE0y9RWJOrXEhWo9lM9fYraZOwTtIhnMPnrrLhUom0xtucTn0xG7HEXIfhxjh
	55vXQtc8NgN0VERrxz8JkN7PKcHFBy8HZXGA
X-Received: by 2002:a05:622a:345:b0:467:58ae:b8dd with SMTP id d75a77b69052e-467a576e84bmr19626361cf.4.1734101906647;
        Fri, 13 Dec 2024 06:58:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELIUPmPsk1X8y29poteG58GXKBn3T/cSJEha5oU5OV75WwSXinQDUc4TW/0YQf+IFo5kNT6A==
X-Received: by 2002:a05:622a:345:b0:467:58ae:b8dd with SMTP id d75a77b69052e-467a576e84bmr19626161cf.4.1734101906210;
        Fri, 13 Dec 2024 06:58:26 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b609e56sm11517701a12.40.2024.12.13.06.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 06:58:25 -0800 (PST)
Message-ID: <9b9158af-c66b-47dc-9a96-41e131aac82e@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 15:58:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/23] arm64: dts: qcom: sm6115: Fix ADSP memory base
 and length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
 <20241213-dts-qcom-cdsp-mpss-base-address-v3-23-2e0036fccd8d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-23-2e0036fccd8d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g9D-JDEFPdJPAGEw-F_b5gABygYxqBuh
X-Proofpoint-GUID: g9D-JDEFPdJPAGEw-F_b5gABygYxqBuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=851 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130106

On 13.12.2024 3:54 PM, Krzysztof Kozlowski wrote:
> The address space in ADSP PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB): 0x0a40_0000 with length of 0x4040.
> 
> 0x0ab0_0000, value used so far, is the SSC_QUPV3 block, so entierly
> unrelated.
> 
> Correct the base address and length, which should have no functional
> impact on Linux users, because PAS loader does not use this address
> space at all.
> 
> Cc: stable@vger.kernel.org
> Fixes: 96ce9227fdbc ("arm64: dts: qcom: sm6115: Add remoteproc nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

