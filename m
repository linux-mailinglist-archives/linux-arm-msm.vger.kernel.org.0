Return-Path: <linux-arm-msm+bounces-100655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Hb7M3D/yWl64AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:43:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C2D355558
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC3BB30067BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1865A374E63;
	Mon, 30 Mar 2026 04:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DafHZeIn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAb7WEGz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BC8286D73
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774845805; cv=none; b=Dx8Qjj/m2o8NTCSJDTL9iJHqTLjj4LKR5NwZRMGnV1NyPKXFDISLG4nZ+JJTT9cvT8EY4IPHWZ+ceWpnmeFdeKUUru93PejwFsehcINsyDum+gr3nyzXyeovuzqugqDusIX+/E9dhbLnOzqTmKORVF+hT5QltM+ofp1DcDUu/nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774845805; c=relaxed/simple;
	bh=9WVzykcacsq22c50jNF208X+qoM9j8ADPetre1D+Iys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXvmHeCsAFMSgAzLdS7PK/J2gneJVjhY/RUMY5LOtEXuVs99bvzc9ZormFLxAnufRwjNkfZ60EFemTTHaEI02Hy/pUPdy+YDQRD5Pdb1yibyyfOP7cQEh9+8crzxiynAzuZTUR9uBW6EAOEB5jlAAXG4c/uiu+XrfFKlC98w+PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DafHZeIn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAb7WEGz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U3NnDN1974830
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eNczafUMsUWBgDmDWTP3kexVfHM3mf6OxUQJ6oZLC4I=; b=DafHZeInPcGt2fbd
	JhQK+So+maBhaBc7F3bYLKKZ7wepGrRZbmq2a7Bw+lCU9xEnOa8nzpP6vtqI+y96
	+aQt5oO03Q3RgAn4jCFuTHM+SLSSvunir4UJz7lt+rkshAwFqzIt2oY1XEJj0nZD
	mvsp20bMGZr8TR3WmyxoK/87kt2LnDWWpPfe3KxSQ4xX1U1iCKK9w0PhtuZJ/+8I
	Ghh96bpOb93Qfd0TxlyvXYCWgskX0EgLbDcjP6HY3pJU/2h26UQMdXJLONpSp4Oc
	imp2GLRfISRb2QkNZOyBzM81YocSeVzl9MYtUSraE/wScFHoVJLSOSz5MMavUs6P
	YG3EoQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmjge2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:43:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so4732821b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 21:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774845803; x=1775450603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eNczafUMsUWBgDmDWTP3kexVfHM3mf6OxUQJ6oZLC4I=;
        b=NAb7WEGzRrjBmx7lOyqlgxttguhd39M3vqaWyA6C7HbRwnPxVipH5sisvY4KQR316Y
         MHxdRFte5SXDxU6opLRr9P9YsT61jo1IGS8SmK19wB7YH+HvORegDPqaJNf38T1sG6Sr
         zP4ueQ7yeaGT+mHTSQNi2S8SlLkHrV8A+QlbP9GLSLDIklRbKTK+Ze2jxalm/mHrhKsq
         3L2KqTG2XxKCzieT/0PzPKvLYkIO0Lk8P9Qd0LCTbfrY/6S96HXARwa4C5YlYPUMYU6A
         U125x335oef9wcgfMb6suGA2wYqjH87IjcAi7e1hd84kk8HH3y+SXRQnJ9j9gmswEKUn
         Xgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774845803; x=1775450603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNczafUMsUWBgDmDWTP3kexVfHM3mf6OxUQJ6oZLC4I=;
        b=dCEL+Ep0xAdU9V501RZKQGxIrvFq55/AzyMATPFZ+7qK3A7pNOFo/z1rZih3S5pcr0
         0BJK981DtHPm5ccUS+bRwuRHTgMZ7ipSeYkmpGGPqDwKaeCT4aJda3tcJqinYTAgTN6F
         LblF4T4I6L/YEaLS7HIdcfvOPWJatLIxh3eSmsqdioAmzMMmNJsb53LsjJ60rC89uowy
         IDLkzc15NbhaHLRcW+bzTAxIir3xDJT3IYA1JJeTi0030nAml7z5qZTW8fIsU+1qGj7G
         41j70trQv1x7sIPwcW1wkC+C+bcajPRlrTOCRk2WHCUhee/RHMZEIkLaJlVMhHxEOTnC
         PtwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRiJFbcobop3pBwiCcOeIJKMEk6E7FN3eJJRUWajl0G8RgqO6U5bFvZUTz51/W1liexj7ClGjqnu/u+Nch@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQoZKtW8XIwBLSMmyYuhvg0Zp4LTwCGwE+UigchsC0JgOBmra
	imKNFx44H8NuinoIzojI+eAmRB4MBKQGGbA1klKPCcc06TMb+oDOE8uRA/Gos9ZQfxH2qaiJxmx
	pTwcZ2maFWi9PUcqs5JDcI9DIsb3o8CcAeJm50ds3kTuXcfEoHz100Ig94EAd8Z0Yk1Ba
X-Gm-Gg: ATEYQzxmVXtXAf4wb5ER/3R5E1SEJBpShucP8ACmUtcwZAsmPznAtni+A4DelQa3LcT
	rMWmIvDFJCWeqRNsoL+kVJEtnJM1PjcrfR6xSi7ekNl27T5j59IwIip8q+690/xYlZx3nFw1+5f
	yoQtDtWbJUDMrL5ZztEgoH2RYYOIO9VNd3UJexT4jXD6L3Qh5z1pyuIfJz6rS/W4r7JoqsNwo0Y
	q9vuoX6wXTomKQUD8fUE1mMztQH6HB/TisD7Y9YdfHvcqi6iAFllLiyqjsj/NRWc9kRYpcwqJTA
	nYRsL5FLfVCxsDU/54fhK9dOmJl+Fha0r3mFvMDGuq9OpS3EDG4cVsK8hoigN9xx3o7QYT7p6zt
	nIGVUFUj8H9IyBWy2P3mjFO5tFXwat5D7f/Hb+Ew837Gho8wIQli7PA==
X-Received: by 2002:a05:6a00:cd4:b0:82c:6d2b:7c53 with SMTP id d2e1a72fcca58-82c869c2554mr11585231b3a.19.1774845802730;
        Sun, 29 Mar 2026 21:43:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:cd4:b0:82c:6d2b:7c53 with SMTP id d2e1a72fcca58-82c869c2554mr11585200b3a.19.1774845802153;
        Sun, 29 Mar 2026 21:43:22 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82caa8be173sm5310354b3a.55.2026.03.29.21.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:43:21 -0700 (PDT)
Message-ID: <721b870f-400c-40dc-b33f-0241252ca886@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:13:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] spi: spi-qcom-qspi: Add interconnect support for
 memory path
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-2-3efe59c1c119@oss.qualcomm.com>
 <92c58ea3-5492-4de9-bcf7-d4a419480002@sirena.org.uk>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <92c58ea3-5492-4de9-bcf7-d4a419480002@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzMyBTYWx0ZWRfXyji5I3WnegJ9
 BhZ59UiG6zDrLLLl7UyY20yFkUVllXKmSp45lb1ChCGqh15zyYg52+Us87S31qZAmelbDMep0Y4
 phCEJHZxhihrQkhJXo2fPTYktLZrJeHFaDBQaInsm72ZTqhuLH6nDbVHgVOVTkYBRbPYbwK3/OJ
 kGlXJQuyyApqTpSWHSQpflbpqyPqi0V7Q4tMctxBlazFI08H83ma9hQ7H47ydWZgcjsy7Bx5XmZ
 qdggWIYoFV0J4lSWHI3+YhGmpUS348ebb5C3g9ZLwMMhieDoqGZ0Ea9VqZh9UJKhgITjMvC+LLP
 zyt2dzpKdLwnjUTQYcuHdJsNkzXD4BbUnBCWEb++xFMBgw8OYn4HESq8TnMrDPYzlR6WOTSKy7b
 4LNDpmU9VBJdV2PvI+vmUggnCTWbq3RnxyNAtr9N0/PFFts4LTUP2kfyWbrlzY7TFMbo5B6ULjh
 cLuhumdgfi1a9/Az6kA==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69c9ff6b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=N23bROnFMMGRNAIHwXUA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: N39l_GDVRWUN6HlSHwkeoWjXaaKUAar2
X-Proofpoint-GUID: N39l_GDVRWUN6HlSHwkeoWjXaaKUAar2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300033
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100655-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32C2D355558
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/2026 9:54 PM, Mark Brown wrote:
> On Tue, Mar 24, 2026 at 06:43:19PM +0530, Viken Dadhaniya wrote:
> 
>> @@ -829,6 +842,13 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
>>  		return ret;
>>  	}
>>  
>> +	ret = icc_disable(ctrl->icc_path_mem);
>> +	if (ret) {
>> +		dev_err_ratelimited(ctrl->dev, "ICC disable failed for memory: %d\n", ret);
>> +		icc_enable(ctrl->icc_path_cpu_to_qspi);
>> +		return ret;
>> +	}
>> +
> 
> This reenables the ICC but not the clocks on error (which is a
> preexisting bug with the error handling if the other ICC fails but
> still...).

I will add proper error handling in the runtime PM path in v2.

