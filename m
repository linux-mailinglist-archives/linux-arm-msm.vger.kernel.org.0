Return-Path: <linux-arm-msm+bounces-103911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id km38Kt5I52k46QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:52:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F008643923A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A31F230A1C04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679083B0ACC;
	Tue, 21 Apr 2026 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSdawfXp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgBwCxS2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A85C3AA1A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764791; cv=none; b=X1TGatnEFJ4QMyAkqf2vzlqotBtkMfEp/cYfeNfgicx9kYiUonclLJOm/LJdWP5ofb1FbDh49+w72uOHloz6BPU888a1/XgN6fLvAcHt8cbrRu0dwjm/6XXOn86eQOWE6CLVzm+nig10UJmXrORmTnsp1vGnRTaFBtPYhRLywoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764791; c=relaxed/simple;
	bh=mvEHAZ37oCPDXOuYiqAbdqn9ee2W2yf0pq21pqqdlpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSZ1xe9ubqfCwL1/02dsjqAI3lIDScjDJn7Ad4A8dZovFGbmOYQ4c+AlxQo+t+T/ZGLe6Eh8MuTEDVhQGw3mbv9I7w0F9wspMpKaEeDXA9ACTQ6aJyURBSJWUcf05eIGSvpD1eSYs2cI3bgxLVH1ueSaU2DZ/njFC69KSx1RbhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSdawfXp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LgBwCxS2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L3PeGC4168274
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Nx4YovSNFz1U/AoUNwYoROlzNlXRuYyoJDe9nhlv6E=; b=eSdawfXp+6a81AiJ
	mOkVjFEs8pddnjmHP07YDh1lqqftB202ilCRxoG2ncVSkQQWwkhdebzTO/BufInI
	lFk0CEEf1WJ72o8XxMHc+lUflDaSycTQmTB+jq5ifUqv0X5v98Z/4Moo/Nkd0Vm5
	bNqoIrYFray9dy96Pqg4k9jioDKcFadqAvNqvOYG2SggJSLlFe88DdCbgV7rmUQa
	e9we9B3amW4qZqhVQmRsjbG+L6UincjPX9mMPBj91X1w8b36CWU52GpRJcvY53th
	UVVRS4nNGb7e9jGovCrpRdwwnhNbBcV/EgLZo4M3RkwWcjv2jXPIF0JITfR+ritr
	KVqUxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au1cwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:46:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d45ebdbc9fso69289485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 02:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776764788; x=1777369588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Nx4YovSNFz1U/AoUNwYoROlzNlXRuYyoJDe9nhlv6E=;
        b=LgBwCxS2tv/PPgm8Ui0zLMrvgZ8HV/rNodkKZCQy2BxPzOAGCi88kfgSlUxn4G/gpT
         RGuge4WAkBfl7XjwK2hP4WAA9xk94uosnAHoWlAnOZ+Qh56iSosfgph0HVppaLYOKsdE
         bx/SlrIviAHRCZJlyDpBWWhXpx4rCeEIcxfV6fQVmmZFl9Xn4SQ3++eajvhdFPJOP9eT
         6osgGZWKStNxm0niyL+YWUDKaTKHCK+dPZQXbt9KHaC5mqVHaZ0O6zz2BhXfhBdJHfhH
         J9s12UblSySm5wxFzgqpFuyDnaeAdx9jLizn83w98hf79NCOMnPHERthI/nom1ciFdVD
         53kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764788; x=1777369588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Nx4YovSNFz1U/AoUNwYoROlzNlXRuYyoJDe9nhlv6E=;
        b=CNDji4Ui1LD1gs0yY8uohgnJVGFhGCVmHc6i/4vUyvirII090xf+eaeXi71QNx9JlX
         Oa4KYkpSw0cI3I6Mg5WGsSHW71aP4zblZp3C00i/tlAjYQ56v9G+o/vwnnXp331ri+OV
         KOjJmZpV0y9I7DjGPgGDvMA7T1PgLeZHF7EuQK0VD0Xs3yyD4beBMsPds2xAC1dge0Z1
         pNk6hw6rDglaumIZHBqzNivLymqxl6Jmdw6vrY0dbStm0mi0JtZsudebi1XF0DRnD6pI
         /HU6J+M/QAf3MtjTeY8E96M24XcojDNo3zOEfTlsp6YLzl2vYsZqVRigQtqoIpF/XsYo
         p7pw==
X-Forwarded-Encrypted: i=1; AFNElJ/Ii+RG5zYjMb8K8kr1vrtg1DAjnR492qo+mIkLVHNIkXsGKP5KmFaehzYiJmE5gyEfeIqNkRAcN0ejRyo5@vger.kernel.org
X-Gm-Message-State: AOJu0YyDO7JftAS3qkYOGvkqBhSCAfPFj5Mo3gCT6IVYuS6IjhUo2dOb
	DeMjNDFf1z8pNJu2TUuaHpcmroFy3Is/MS/ENxfP3hfxiVj8Gi0xgdprZjvIZqksNXxu+8Pt7x6
	tLUg3hf3BOYo3J1m+uwJkp1leE2QYGmDEqey3wMyJq1K4SU2rU3O11l2h5kTPzvkn50H9
X-Gm-Gg: AeBDietVnDnPAYoE5NRTKbucgqroBbyyJDBtP1D6ZtRp750cEGVtQIpK3F15UBk6W6H
	rk+oaAOpZOvQQE7UlyVg8GILm5AQR4otzSPMu4JGw851BfLPd/4wy1fcEypJiYmJ38ngXoXrXi8
	w9QjJoyj9BoEs3VKkfeoDbwV6ttr1Wf/53+8mnygQZ1Uy6iC6Umf2DF8vkSy4ur8ffTWRpeEP4G
	jfWqqC/V//7iK90OLVmXJgwQfVwO84JZvTCKjvPZXUBzpRvzMNmw/Ldt8o1rQHCj+DWMZPgw/Xl
	kuCBRkAPSQWxfgc1JZ6Q6afUHDaFYyF5PsCCNNkJml4swJK4rWoRKKwa9IZxroVplV2sgVn4+iW
	FZCskvVpGcjs2TfWs0Hx5XpN5lUzOCKdTeJXeSCpKxf0MamDhLjmgVJflHWnxW50dRzAWtRTmql
	atWIDW1Uqom6/GwQ==
X-Received: by 2002:a05:620a:458e:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-8eef44a05b2mr36850085a.0.1776764788442;
        Tue, 21 Apr 2026 02:46:28 -0700 (PDT)
X-Received: by 2002:a05:620a:458e:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-8eef44a05b2mr36847685a.0.1776764787906;
        Tue, 21 Apr 2026 02:46:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e18esm2575163a12.10.2026.04.21.02.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 02:46:26 -0700 (PDT)
Message-ID: <20cd0d36-eaa4-4ab1-9fa6-37d43887c7b8@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 11:46:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] spi: qcom-qspi: Add interconnect support for
 memory path
To: Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
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
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e7873eb0-bfcc-4ad2-8016-17b0db80feea@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5NSBTYWx0ZWRfX3kur8vjmLJho
 3wz8LkN+O50rdFsVfOy2ItJUoGDgHNh00qfzu3D6w4lHva/MtgLB356wLTXUu2EpYwiQvLxNt40
 Sm2ocq9QsNSJNCSSOrEFrr5iT5zDjDZ+85gdwNMd6cgMqw2o5l5didMEUZUctyRaBweoOqyX83N
 tnQOVYoNEIPsJj4QX8GR8B5UzG8NUhVLRUGhZMdEa60V+7aOsvoPcxKKNHyLaWkuVouygzGsCmc
 4sKTGgfZj/PyZbBjELv+zvuA7T6RWI+Ni1AxXJKbFhOoo0fP6kQBGFtawoPIZvZ10+tuBtzaCp6
 gudp+Izdb6TRnrA2Z9NxJ5cOcT/tTjw2bk4iQrWVj4FFF9xuYdEPG7DDaXANdU3TzjCNazgpp7f
 5aFPAQ8pQ+O957cNHYLzU6vEmw3iiUWES7liUCYFWLoy4+/PgwmzSUOP7su5I/v3npscMffx1fl
 ZX9gkP6TCDli2EVIFtw==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e74775 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ktr-gnuM6ESvd8fC0OUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: YS9Wgeclqsq71AB7dDJuhb5Mw201viSU
X-Proofpoint-ORIG-GUID: YS9Wgeclqsq71AB7dDJuhb5Mw201viSU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103911-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F008643923A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 6:44 PM, Mark Brown wrote:
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

Ohhh right, I glossed over this.. looks like we need to ignore -ENODATA

Konrad

