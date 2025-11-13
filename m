Return-Path: <linux-arm-msm+bounces-81615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E86C57B60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 14:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E305357D12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 13:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E055F23F26A;
	Thu, 13 Nov 2025 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AoXCpOsh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVDKwEVA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3290F221FB2
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763040855; cv=none; b=u6ZbPGtj/L/XApDWk4MnxoUWbneZN+DHaIjqm18gO3JpJ4pQl+kM20XYefAk+ttnqY/zXeyvYuXWl7j76SAJAtZ67xquLXDjatgiytM+w/ItZC5nOLpxanHFFcdbVpXn6RdWf9SzGusv+IA7mhfzLDfqVsqz0Y4JO/9x5344LnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763040855; c=relaxed/simple;
	bh=+IP1XudSJ38VP40JgyddsTiDM+XvNBXWL/m/zF2pMPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ciQnWNDfYd+LA+N6kcIDmkA66x+iJczFk/TWI7CpXKKOTB+L3Rafi6AxmVs9EtUJSpZfVk53ch7mVnjKMDzb/IcDVqqMoq40pEpyo+5CWm88htj6jjvjFg8p+c50wLhbQ8nfD9kOjEl2wiXfnXVxfjUUhsAFR2r9pRwN/mDAozM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoXCpOsh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVDKwEVA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD8d6BH2993501
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 13:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KlFdoAYM8/VYA6GdFSWsSZk5wCZjObFXEKG3Wx/Bryk=; b=AoXCpOshHgJsGACk
	5F1dN7j2MoHce1jTJtQArpaZPZ4MTlZ6HHWccKnw4gKbc3XLPchPWL07hOce2H1/
	jDiy4M2lRMMZGXZ7sDUvpbBHZOWorVaEXgq/xwLud1IXwYQTOhExf9hOLg4yExyS
	h9Eh4BTTAWfq1PSfzWNp2Lmy78wRc2PyJmMT3UIm7W0kmXTdf33Xaq2A3hTUCwiw
	JV1o2HKgRqp8JMYtG7nXk7wOwO6JROBgBlLvBSZvCux0RvhTE7xWQBFnEW6dSYuY
	M21QQQO/9as1Wp9HjTv/11VgU0cDqqc6RicHCIN07Xnk96gYA2P5WSlMiHxFjfqL
	jTqTEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad47jjc52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 13:34:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaa289e0dso2413181cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 05:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763040850; x=1763645650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KlFdoAYM8/VYA6GdFSWsSZk5wCZjObFXEKG3Wx/Bryk=;
        b=ZVDKwEVAWQmhfCHe62RSLVq/JQZZ/YSGyIuH4pE35mjxXfbWSUpXgMWkh3YF6/56tS
         XjN0k2prdAwujWQtTmtktQrb6DX4YsuhOR54oOqtSWcVk7QKTvAkSBt9IMUdpmiCioyp
         NGNqo2Uh2dn0sJHJyDdgcAraLdAJZgAsZydrOUYop7nryyIr3G7C74cgg48XySwdysu/
         MWRyC7XUQMCPQlW4B6WI9YYWfxYWT/wk3YTVMwQayqKqKxTewvhzgQeZaGbtUctO12iw
         aRcvl3tICh/1JwcyWd5FGhE5jaIFB2ztzlAgRDNKXMqyqzA0CDYysqZYnjiXUsp/0N+h
         KFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040850; x=1763645650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlFdoAYM8/VYA6GdFSWsSZk5wCZjObFXEKG3Wx/Bryk=;
        b=a9jHIuQ8thKAoc/xZlm/7sbsvZn0X9S4BjtxEm38VDIRm7WLOXhT03VKEp4tXBdguk
         VDxRRYHsxh1fs6yeY652/RWjFpN+g/EV6tayFj+nkVAd33+kkjJaevN/KEww2u6PVJ1H
         GNcpu2dBMdbfiD4DbWK1NJEWsdi0YybHjXny+VDQpnlDqzIFP0uVt4DkwHPJyrEUCVQD
         4edqmrHVXOdYwA1dSdE+BVV2kKgMBcuyA1fx4iamjryMvqDncalp5bvxkIwy/3FNwE0c
         cmS8eEPMK7YfW67cYKfOOD8zn3cRk71GQ/ykbRZCA4WWpB0mzq95XFsxsERy8K40FcYh
         SGcg==
X-Gm-Message-State: AOJu0YwQndQ5F8G4DezQKtt8sKGYdRpnno8VxFqL6yWl5h8eirZjGWwt
	GfMvsFRWsO1vi6pWoqHnkBTgVjgvwfXY72YA+x49qfAIP3JmYdCmbi2WQOWhW5JTkfrG5LobxJN
	KSN1dF042NxUTa+jHk2xnXUT9uOyHFcajCbg3SazF/xwIMtLVvI4y7fS53n8Y0k27jjR6
X-Gm-Gg: ASbGncv9otc+3F8M3mTGqf6nUtqaQg9NBw/nOVcE+Kcy5VcdWqzRvy2NAFSslqgbO1B
	+OlusMHh6QIDq5hRiQZv4nsqLbOowPS41+W2qD4plOa8Nm/mwazM1IFYWurODmbDxeSMKYRMmZe
	VvJJT2eCHAIQPGk0RpmT86fMPs8jvQAUs4AFN5nCJeUxbxI3pjxWW4AzkcGKeXmsLAPmXpCtAEn
	r60s6JjMSKLxU1gzhAyvyI4LH8sTd316EuIRTqVmmXi0aEFVSw9TyA6SVoiYb7nRRn0Q+XbDk2i
	G6nsMlF9TYVYmm8OjClQ+D6ngjKkN9Cdtxm0AXzWUo7R766/sRwGijO0apdmMIFZ+V7H0fkq4MX
	kVbQEpSZzobO7lBHV35PgQg9/0zyg3mA0LGJdqy5Y8+N513inIy5X3uoc
X-Received: by 2002:a05:622a:148d:b0:4ed:b2b1:18c1 with SMTP id d75a77b69052e-4eddbc9bff9mr56111041cf.6.1763040850233;
        Thu, 13 Nov 2025 05:34:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPE0sRVrglN3s1Wc42f/OsKVhH+8tSWcqanaQmO/9xNP7f5H7iuIa/iIFmPGwOU/XlckjLYg==
X-Received: by 2002:a05:622a:148d:b0:4ed:b2b1:18c1 with SMTP id d75a77b69052e-4eddbc9bff9mr56109611cf.6.1763040846925;
        Thu, 13 Nov 2025 05:34:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a49806csm1453196a12.18.2025.11.13.05.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 05:34:06 -0800 (PST)
Message-ID: <f433a645-5af6-4813-ab76-687d1ce22b0c@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 14:34:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: Document Kaanapali
 BWMONs
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Amir Vajid <amir.vajid@oss.qualcomm.com>
References: <20250924-knp-bwmon-v1-1-56a9cdda7d72@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-bwmon-v1-1-56a9cdda7d72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEwMyBTYWx0ZWRfX9Havd/E0nshM
 g/8aJmxIJPBtlvCeLFZtr+TKxr8RsRQKMke/wGWFVZXNtZ3lKMSXUvbeLeNHwKdvfrsc7rmI/9g
 DXf48wuj0WOF8Z5RmbSfQOcjJ3AgYYXXs0foZFYtWV883rtLYpyjp6QftiSdC2sBcqiQ3wRMq7n
 vlwO3vsSAOx70Yo0Ci9N60d76qGxw0ulrVp83niFuIuT6TyRt4RtpIpPzokIvvKWXrbSQl14YwI
 BLtilbdR9+8zqeN1CJ6BLYd6DAKP/raPe3EFIpA5197V9viuirgcx1uB1B8I9RZiy0g135oKutV
 C59xXLMZaTD9EUtnlYGpgNwOVe+oaxMpbRTj18ofFt9xocFtLTYrPPgrYGnPU+bIoIjFv2MXtf8
 HmhD5HmNyrPmwVhXh90NoLdOlaAUVA==
X-Proofpoint-GUID: G5n22IK4T1xzbZnWbUGmB4QFbwCp65Kz
X-Authority-Analysis: v=2.4 cv=A5Fh/qWG c=1 sm=1 tr=0 ts=6915de53 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mygda9kbUFeXYpHWPk8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: G5n22IK4T1xzbZnWbUGmB4QFbwCp65Kz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130103

On 9/25/25 1:25 AM, Jingyi Wang wrote:
> From: Amir Vajid <amir.vajid@oss.qualcomm.com>
> 
> Document the Kaanapali BWMONs, which have one instance per
> cluster of BWMONv4.
> 
> Signed-off-by: Amir Vajid <amir.vajid@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

