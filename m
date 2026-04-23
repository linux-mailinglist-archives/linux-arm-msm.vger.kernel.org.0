Return-Path: <linux-arm-msm+bounces-104184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GdcOPKi6WnafwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 06:41:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5639D44D003
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 06:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A4903020EE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 04:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218FC37FF69;
	Thu, 23 Apr 2026 04:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIThHOPj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ks05OSAI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06C631282F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776919279; cv=none; b=Iv7BZKsC0kHseRPXWmaXzE5iwST9BuAjJvVWLHtb0+ZEiYVc1R4cV0O4vK0QhzZO5Sq2WK4mZxd8O6bYtD1pXEX0hnDB6LsCvN6uUmvrUBjEK73wMtWiFPR7iVSIR+A//MbreBCBBQC8t+Q0z6W3b84Pl25M6aUjOYPwEIpJ0eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776919279; c=relaxed/simple;
	bh=9J4BxM7gtyEKauNKqbRS21TUg8P0EpQ40xplG6+3a/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZfzy7drrWFbYttmvGMtvMgrUfQzGk7zH1652TCXGbgztf6wYyWrAndIzpq3gdruj9KDLGDR250stUhy/N/oXhDIz9rRFQGITnPGW8vLLwlIL6dXraUOJdPNpC6X7CYyVy95pR/8O64/aGPGEQ2EnmHMJL539iyYyAKwxz+Clz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIThHOPj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ks05OSAI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N2UeKj664134
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXcarQ3/SORvCcBXZAV2XtrZqcRRpX62RDXzsLa4WYw=; b=bIThHOPj8YOdhejd
	7i9zM1dNoAy4uU2h3aT58PQU8GGeJ1Uv8c32GfIJ98HfX9m9mGeWYOS9hgFeOvid
	pYI7PW8a+Pqnedab+41b4os6XlqvubiHjFSL0gT7y5YsMJ+lm6dSjTfewvgcrnZ7
	yG67bRtb7nfJYei7VXaiQNtYS5Zso9XIpjpEBt++0m9aHi9PLcZma6PXLDaMP4ZT
	X52mVEPcu1ZnJoBUuRBJFmyt0IyxIzlrkRlapqAUF+QZNHuq/B/6fooSpVsyFr4P
	8g7SFKlRQJY55U6lHaaV02eiAFpmrmEGVa4dHnYNMqVlijFTHt1TJh3kb+o32zI9
	jwzm9w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudguq0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:41:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c44bf176so7457127a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 21:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776919276; x=1777524076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXcarQ3/SORvCcBXZAV2XtrZqcRRpX62RDXzsLa4WYw=;
        b=ks05OSAIWzSYL8SjGV8ej7Kw2wU7O19mp+EjOTSVDZENF57AB07qmxAM0/VpeeYiXt
         NuyUoGxQ7cXwJRbPGCEf+EjqgZA1t3tq8yUx2EGLiRsb2ewj4TLd7YWOgBEwbkVLtS4A
         CmDBQTGsf6bD0QOx32rP7tqtBNAB8zOLwzEdTUu0bThdb7o1nff1IPU2Nbk71huYjQrZ
         Gqz5IG/iSVbvJyM+3onSCETsQafWd6xXrtXcHdELJjlLJ0oI7tUEZ/1YqG2bmsEiBNqg
         iAWEsG8w7iPSAejdvwy2Vrm/Io8xYy2/psAvPVHT/jY5YZ2WYgYbAbwIMQF2Qz5YrGMX
         qRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776919276; x=1777524076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXcarQ3/SORvCcBXZAV2XtrZqcRRpX62RDXzsLa4WYw=;
        b=UN5+KAV+KTfNRr4mhTIJJTuVgdYhML3/IcK35s4vfneB6eOlT8iFk31QNfUgNOM+0j
         Iyx89IOo2JlU5A/uw1aZ6FNdAmVh/qQ8KcWGxDcLVNJmXss4Zh2MKy8OtHiwwifmDK4y
         YkZf5J50znJXBkckSQ7M4wXwjiXKlNeIA1oFngseCyB36eH4BZFTTqhM/GLPOlLIVLD/
         q4/vKldrrbr07F0iyG9VyrzBcLRdoUjhXS4cR5/KgGEO+Y8UpTm6+/Jxnh/WLssJQSin
         avtoRvmvIUiY5AkNRm/onR+ddaKWxRn4P+56+PExjfj8VnqBMz2Mkf6pc4svSnEfqUYv
         +V1w==
X-Forwarded-Encrypted: i=1; AFNElJ+qPKJHCFiX0AiqUIA9BfEHkKqXznEi3y2f7/ocsD5x/DwL42MTNT6TZW4lW/tFQgOGndOx7Y5rcKzOSPug@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3t11B7zRyHhFNwsTPZfKz27aI2qsTJQzFMTmd24t5f4W2tHhW
	qSrVm+YslbIZlsUbwrXHO1qPUgH62XwEefGRhPE4FT5/rJyayw//VJQz3CmRy0EpMiUu5hB0Lyu
	vmh1YlUUHWNiYIswj0dvpah5I05+ofoVDD4UqhlOu7ryECy2emppB8uNHTO1eOY/qBpHu
X-Gm-Gg: AeBDietj2DrZHidhg/Tu5NOIB339E2B21YUWFe5TXmqAaH0bnqUFXzqZevN54vcaqCP
	wVCC9/e5OT0Dbu/e0TshdvmpJGTdJ+0zFM7FzJidf6zO/IHT/qCWxNpL6xmJkvAHdBj6lHCA7k/
	+uEBrvdQd9F7RJ6R/5/n3hlN9k79Atfzw5I9P5q0T0vRIt0E1JIrSW7sIjOZnr+L7YCof9wfVpx
	PbmmHbtaRmLykPI2bQurTp3cprj6OrnDylKOb66wHPoC6Cbzm3nFSi05C6qboazohLK/dXAjFfj
	LCn8C3+eWMPfnRNLAmgiUofaYzPKF/3Bnt2KSaGZi1mD+7mHsvG/uYOjggFUl2o82l/SZ7nGVsl
	QZu8mQzy1XfqE4Kv5VqC9Fov9k5MDdGSCl5RVpGzs/Dl4Vs9zNLhQxuNLhWKSFyYS
X-Received: by 2002:a17:90b:1d50:b0:35e:599f:aef0 with SMTP id 98e67ed59e1d1-361404254c0mr23419614a91.11.1776919276422;
        Wed, 22 Apr 2026 21:41:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1d50:b0:35e:599f:aef0 with SMTP id 98e67ed59e1d1-361404254c0mr23419574a91.11.1776919275975;
        Wed, 22 Apr 2026 21:41:15 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a9fbsm24124355a91.11.2026.04.22.21.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 21:41:15 -0700 (PDT)
Message-ID: <84bab102-9b40-434a-9882-f6cbcb00c038@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 10:11:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] spi: qcom-qspi: Add interconnect support for
 memory path
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-3-7de325a29010@oss.qualcomm.com>
 <e7873eb0-bfcc-4ad2-8016-17b0db80feea@sirena.org.uk>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <e7873eb0-bfcc-4ad2-8016-17b0db80feea@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aZ2iiFx1GrF2UxzA7qGEyuBzo5fbD6lV
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e9a2ed cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Ktr-gnuM6ESvd8fC0OUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: aZ2iiFx1GrF2UxzA7qGEyuBzo5fbD6lV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA0MSBTYWx0ZWRfX4hwADkpC9JUL
 tJP34zcBEyQJz1ID1SQPs84Ch0irJJj9BWFEZk7K29PdAaTo5V+qSj9lL6ACcWD/4hTxFVYnOk4
 /D9MttE+fZa/bYSpG1Vex4Hr5ZE6cXgi/RQMmhYfQnNib1I431H6IlAXVtKpgKPLDMe/JNkCuRl
 GpSsOvZXgbskk/iNjfaKXaKmdInL3e3MDJFw1q0wKYWCH8vV9rGTBAQ58df/sT4rO80j2vbscOd
 vb3zqqxeJtQ7VdOaj21X0IWl5red/TnPUE61nTWlMgmtdqVDGuKZTGuSkeaZy2kR2aKaqLQLMcQ
 4Q9ZlxooQoFV/HHLcRYew9ZJE4ddYJm49HXx6Odl+4CIh/JCMg9VD0AREGkESghBNwRlZYEVm+r
 ORTK1aYt3WLAf3f9+kiTjdb6SJLO2VKPNlM/I/I2Q5sl5N2xRHQPZ+KXqclxNKAcbx4EareIysi
 bW1WwzIPMGzg0I4oskw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230041
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104184-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5639D44D003
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/2026 10:14 PM, Mark Brown wrote:
> On Mon, Apr 20, 2026 at 11:42:50AM +0530, Viken Dadhaniya wrote:
>> The QSPI controller has two interconnect paths:
>> 1. qspi-config: CPU to QSPI controller for register access
>> 2. qspi-memory: QSPI controller to memory for DMA operations
> 
>> @@ -729,6 +737,11 @@ static int qcom_qspi_probe(struct platform_device *pdev)
>>  		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_cpu_to_qspi),
>>  				     "Failed to get cpu path\n");
>>  
>> +	ctrl->icc_path_mem = devm_of_icc_get(dev, "qspi-memory");
>> +	if (IS_ERR(ctrl->icc_path_mem))
>> +		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_mem),
>> +				     "Failed to get memory path\n");
>> +
> 
> Does this handle missing qspi-memory properly?  It's not conditional on
> the compatible so it'll run even for existing devices.

All existing device trees have been updated to include this path,
so there won't be any probe failures for existing devices.

