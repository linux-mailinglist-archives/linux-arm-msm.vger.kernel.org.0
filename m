Return-Path: <linux-arm-msm+bounces-91326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AnKJnzkfGkwPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 18:03:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35170BCCB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 18:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 064F6300FEEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 17:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92192ECEBB;
	Fri, 30 Jan 2026 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETVG4Gog";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3cTXhfP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642603563F9
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 17:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769792417; cv=none; b=PEFNs8iEosyc8TYkMfKf4Wua7R1SJayK6g2DJi5/O4hw40NymHhHrR7/kAK5A8Yzc4wcTDyQC+1TWMCxRJKBL9GpgRDuePfbplRY+OcPD3VG58q3sCkgRxgr/cEph3VAeFxOfHJwgxcKrl7V0zrBQlICvWK5QRyGCWulkNdCjLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769792417; c=relaxed/simple;
	bh=ds9FPB/5pM/kv71BElJIzPABzsNvdIriGuFb8MtF9aA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTRQidsYMjGl7HXeKNNh9XcniKpAZyS5qizqClGo15Q6wokFXnClYsmUZI/mHT8AMB/Blw+C63JW4HSWx9gVdRb6Uwo7CJjOOqsHd+EhFDs1vz927q1cgnHMQ5Ale/HZ4SOylIVDb6TZXRlzJj+yF4ttw+2BMXz5GBbQiJv0Hc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETVG4Gog; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3cTXhfP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UBLQWu2992856
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 17:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zb3wuqHKR/ACis16psjpt8hkng4oZUPBMQt0TeF/IN8=; b=ETVG4GoggPSEaYNk
	6YHAzRnjxRiZh7Xx4dz9GvBUz7xr1SdT49lC3wM/p+UWgbGZIERkm9wBRnb18OBX
	/CdEwng+GjYziTZMu5ut41hKvOJfV0BFeNy8vFpOlctpICRlhaPD+ZjnvhA1GDgN
	x1jqq+BjuV6/3GmAPBNTHaGIzEg6g3Fu6aX1baiN71EVT4nAKOY6hrOZXtf8ydui
	nFEXwsIGX7nFfpIlz/VEunlKcyqVOp/6f7ax4DXwKKXxVY4u0jTWBQAUjkd+iWg5
	R9gaM5y6JNnC15HIbSR4gxCmR23Sxt6Op7sTJbeLXcIKC7oii/2kolwnecNEGzAM
	Xi+JoA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0db1kke0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 17:00:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so22181435ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769792415; x=1770397215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zb3wuqHKR/ACis16psjpt8hkng4oZUPBMQt0TeF/IN8=;
        b=S3cTXhfPTGRmaBD+fz02CBBWBYddwLelBOLA0vDTeaBskGqF7jK3SeW1nJ4S2j+1Nx
         OwiOQhYKIuU5SNhIJuzjGFppQMI75LTgSvYAkwejMUIaUM66HchGCcYcCRTg3k8u0VdS
         Y77zdCtI9E0hIEJNAPishZ6/99k5uBCtblYdq7BiuuOCuGInB7EYrFag4DtohQ+GJmYW
         H79sll9AAIFBfq0/+SpdN/kExTimmlzqGi6WTUdsmSOI5V5A2fvFIZ2yHZzcCnLtVesi
         xNr2eACgb3jLXPSXjtV/WhRqRrG6RtCJ5U8fsptQ70JUz/kbxyFWOIaOUWUtsGVoziZX
         5ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769792415; x=1770397215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zb3wuqHKR/ACis16psjpt8hkng4oZUPBMQt0TeF/IN8=;
        b=GPAoD0g5VtSmWQpsdidhC2F1n6+wwqnF8W3xdTSYXcgJcXslbZPH8eJYegPN1ZzQoc
         DLDmKuoFtyErZlefAlL9TyCU1CdopCFIwEtAgfnx+LatyZ11/GPfPX3FSSOWoSYdtI3c
         8oJpTosjdBfzVdt0o0fxNFYDtiBMr8y1KiIodpd5htI6dqy1lFlMQ+DyCI5jDGvj4/Zw
         nRZno3osw6B9ypj4WT0c5vHxSIhZowwCxY2nf1t5J+Ar8sNjUo+HX1e4RmX8sHAyhw6B
         Gsjsq02P931zRIUPsjFM7OSIkU9sCg7gCBXKU9HYRW6tbLbx4Wc92MbQDFEU2016QrZt
         hYDw==
X-Forwarded-Encrypted: i=1; AJvYcCUWXJD47Eux2gNrISu0mdSBidjUD5L+EdBukdaqbX76FSYDkO5Tz/WH9utgAI/qh11Xtdtu45dhkRXZDBRV@vger.kernel.org
X-Gm-Message-State: AOJu0YyyNK1pW6hgfe1Aeonpz1N6jZcWbtRpjFiRaQYZSqH94u+UeW2z
	HhWH4Oamo18aY3rOeGcnnUzeMjv+X14jl28vbY24eh2JT9MB9gRBkau0Gpfd0cBiBCB+cla3VbJ
	biQCMzwAMaSH0Uf84nNlBf9HAZ0e1WTkxMYgkpVQNiRqVF5LmqExZ6Ucomxj5dxfYfC8B
X-Gm-Gg: AZuq6aI9UJbQkvJvfuSy5w81PZ/RfFqTIgEgoE/WYHajJjsXRq4vhrTZKRttxqhAfI3
	SjnAacYza5Hd0cF/JVZ5NM9FrRA0KUd8AAKki8lP9dQnYCPcpvgrUcV+w3AQqcm+QdVpLco8UeS
	CK91IZ+Otj7EkgdX3LGVlpy55NSLAheQ1kePRXfOzn2CAGthc/dPOBW2ReolfHAAKFDlpBRBVGC
	68H8piIaOa6Fjtb4nyd4k5XYjEFpNuiNQxAVsZI/5szFWWCzvet82dUNWwNhfv7RRbfv4rTxG9q
	YmWriN4soxwpWHqrukSN6dVybjYt0pr/2CYUWqBoz9Rt2YjgXRnT0U22F5E5/en0KYyd83elpV6
	2YsrOvks2Q2d3d9ieyRUkpyjSgOWUdURmDAmCYPcL
X-Received: by 2002:a17:903:166e:b0:2a7:8bf3:5677 with SMTP id d9443c01a7336-2a8d81bae0cmr34347695ad.59.1769792414690;
        Fri, 30 Jan 2026 09:00:14 -0800 (PST)
X-Received: by 2002:a17:903:166e:b0:2a7:8bf3:5677 with SMTP id d9443c01a7336-2a8d81bae0cmr34347195ad.59.1769792413761;
        Fri, 30 Jan 2026 09:00:13 -0800 (PST)
Received: from [192.168.1.7] ([49.204.111.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3db4sm84917295ad.50.2026.01.30.09.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 09:00:12 -0800 (PST)
Message-ID: <eaed2a51-2efe-44d7-9186-115dfd185a62@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 22:30:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] soc: qcom: geni-se: Introduce helper API for
 resource initialization
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-4-praveen.talari@oss.qualcomm.com>
 <f3a47ca9-643a-4885-b8cf-0e32c6a1ea2f@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <f3a47ca9-643a-4885-b8cf-0e32c6a1ea2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IealNCvzGV82rw3C5k3ktUtRWYOkmEet
X-Proofpoint-GUID: IealNCvzGV82rw3C5k3ktUtRWYOkmEet
X-Authority-Analysis: v=2.4 cv=VMTQXtPX c=1 sm=1 tr=0 ts=697ce39f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=10aD+GSAjGS7IfLbEAHBKg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lW4um1KOeupUEvrI7wgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEzOSBTYWx0ZWRfX3WGm96mjiVVV
 Knrn+JYD14+UHR22jgy84K5KNU6PCuNSTFjTzTrA98KAbfsJ9pvX1a466PVYoTq/h4wA/7lhcxu
 DpfBRh264pSUiOt1i6MDTDe6hWongdNBYsjqMWeUBil4vzbgPlMUl9XpFAoxk9pTwOlOljK/hf8
 Mp1eK4a6fEIDTNBfuYCmLkBykVbrNstGpUu10SsTrfNcvq8rBQbFAQiKUems7FkarQwN/q0Ob3s
 aZAbrpiKA3ZNOJkU6J/fZgMf5BB4q+VL9B1Y53ypVN9CrPMT8pMvQa0cJmUo3k7eM60WDX9sik1
 CucJwxjv8qHMge8Yu5hiYikRgOWOKn5motxNQ8bAH/gymoGqcvZZN64xC1lOfvpgIe29ifB+I2r
 ua9+ZlstWDEO53MGmadUKxf4+dxrlbX7ZbNNtMzg+tjm/JXvlbWu20mua2OrsR+8mc00d1bX7c2
 FW+mjDfWRRS7QJQnTkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300139
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91326-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 35170BCCB2
X-Rspamd-Action: no action

Hi Konrad

On 1/30/2026 5:40 PM, Konrad Dybcio wrote:
> On 1/12/26 11:47 AM, Praveen Talari wrote:
>> The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently duplicate
>> code for initializing shared resources such as clocks and interconnect
>> paths.
>>
>> Introduce a new helper API, geni_se_resources_init(), to centralize this
>> initialization logic, improving modularity and simplifying the probe
>> function.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>> v1 -> v2:
>>  From kernel test robot
>> - Updated proper return value for devm_pm_opp_set_clkname()
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c  | 47 ++++++++++++++++++++++++++++++++
>>   include/linux/soc/qcom/geni-se.h |  6 ++++
>>   2 files changed, 53 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index b0542f836453..75e722cd1a94 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/of_platform.h>
>>   #include <linux/pinctrl/consumer.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_opp.h>
>>   #include <linux/soc/qcom/geni-se.h>
>>   
>>   /**
>> @@ -1012,6 +1013,52 @@ int geni_icc_disable(struct geni_se *se)
>>   }
>>   EXPORT_SYMBOL_GPL(geni_icc_disable);
>>   
>> +/**
>> + * geni_se_resources_init() - Initialize resources for a GENI SE device.
>> + * @se: Pointer to the geni_se structure representing the GENI SE device.
>> + *
>> + * This function initializes various resources required by the GENI Serial Engine
>> + * (SE) device, including clock resources (core and SE clocks), interconnect
>> + * paths for communication.
>> + * It retrieves optional and mandatory clock resources, adds an OF-based
>> + * operating performance point (OPP) table, and sets up interconnect paths
>> + * with default bandwidths. The function also sets a flag (`has_opp`) to
>> + * indicate whether OPP support is available for the device.
>> + *
>> + * Return: 0 on success, or a negative errno on failure.
>> + */
>> +int geni_se_resources_init(struct geni_se *se)
>> +{
>> +	int ret;
>> +
>> +	se->core_clk = devm_clk_get_optional(se->dev, "core");
>> +	if (IS_ERR(se->core_clk))
>> +		return dev_err_probe(se->dev, PTR_ERR(se->core_clk),
>> +				     "Failed to get optional core clk\n");
>> +
>> +	se->clk = devm_clk_get(se->dev, "se");
>> +	if (IS_ERR(se->clk) && !has_acpi_companion(se->dev))
>> +		return dev_err_probe(se->dev, PTR_ERR(se->clk),
>> +				     "Failed to get SE clk\n");
>> +
>> +	ret = devm_pm_opp_set_clkname(se->dev, "se");
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_pm_opp_of_add_table(se->dev);
>> +	if (ret && ret != -ENODEV)
>> +		return dev_err_probe(se->dev, ret, "Failed to add OPP table\n");
>> +
>> +	se->has_opp = (ret == 0);
>> +
>> +	ret = geni_icc_get(se, "qup-memory");
> 
> The second argument is a NOP after patch 1.. originally I think I had a
> cross-subsys patch to get rid of that, neither solution is exactly pretty..

I will drop the second argument once these changes are ported across 
UART and SPI as well.

Thanks,
Praveen Talari

> 
> But otherwise, this looks good
> 
> Konrad


