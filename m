Return-Path: <linux-arm-msm+bounces-93176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPOJIg5olGlFDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:07:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D4914C620
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B46F0304AD12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D613542E6;
	Tue, 17 Feb 2026 13:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqjub6dT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aOHcjAmy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A773112C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333383; cv=none; b=qwuv5ZixS1LpdKBhgXRi4eJ5wHO9RwSq6kzJ2Rka57aaYifuznTfaR30qaVAYxnVfGnL3bQ3eRNb1kjSYgOWZa/5yWioVJYCSQ6JyeOSIwvYAMD7uHFNNSS1tHmtdJZQmHf1KCjtKjr79jpLfA3VR0ZcZFM4VHRSUQVOCo+AZ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333383; c=relaxed/simple;
	bh=6SgAWtQb8PX7DsmKfS1ar/bVGRlUSpjeBG8c8DPZxk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P3/CFyE3UmePeQHt1ayoAqHu+sB6NZTUNp6+Na+OMxx0TWpPSx7FDNwCvp8kaGGb1/W3j/BwXl88oihJO6c4PzIKYN4HSJamu1I8iACB2HtgF5TUC7Y3cNJT5/+5mT+v/ga0l8ouCxdvrg7UW7hWTuVm05mpqCB4JegovpsJvVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqjub6dT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aOHcjAmy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBDgAb125852
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	An9Vv1vqNs3nmIxOhXPvuWuNV5jNcLqHxON5vO95rRc=; b=pqjub6dT3JOUI6P3
	wc4MH7O+IKQiQYC/cVYHYH+MHZL/90CdVc3J6WCcSg1Zz51fh/6IFpCER7p3mSV8
	e5XdMWs/Ud/oAy7f8/Is2ECd+nZENAK9T8auz4y+A+gNl3LVey7Z940QrlEeP96k
	Zg2r4k+86LvBKU6Ivj0gdKKUZS9lxh8pdCYLpQUo4jxrkMtJ1gZpnjHjcnNiA/4D
	U+JiVs6msz+JLJfSY21PrtmTKu79/E3sNUBAo8PD7O00ZVS+YDshvO0XO3D1rddj
	X0xlVNGe1Y+s5fzRV3dw2ahUXhTE13v28GWUazROARARfL4JTk+M68dcIInmsc9d
	TaXDeg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxukhjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:03:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5034247408dso38635951cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333381; x=1771938181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=An9Vv1vqNs3nmIxOhXPvuWuNV5jNcLqHxON5vO95rRc=;
        b=aOHcjAmyuWvqa9RK3VyxHe24SuBm2jzOW2g4gx6D50Zj/p6vhg6iEG+OMskPPZdH2M
         U/v45sG2r7CrGTSKQGyxXoppEXJh4n+4NyMXEqX3ylaMvioFw1J1fDuI3I8WmtpdJThw
         flApPhAoWJ2M8qEgaPzt6Gk+EenBcGssI5wUsZCWWwrM035BnpsbmgcqKy1pYyjg7u1Q
         tJ/uBfj75TfbuQrTslsm3gX5eyQ/lkAgG4WaFIXGjfduc89V2NyMKONgp5bYsudy+T4G
         Jo0RNkWvbpGjlzVhAJKKPGC5udMDRL3Hfxud/W0U760v1nb4HqDQX9F+tabOevhD3SmE
         xTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333381; x=1771938181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=An9Vv1vqNs3nmIxOhXPvuWuNV5jNcLqHxON5vO95rRc=;
        b=F78fJuaadzvESzYd0nITEEjuD0iKhAcDCrbn2ELRqPrU4YdBjAFrKuMEuDZcQPScMM
         Rxxu47fQkpbS+mxuVU2F0E3NandfNUF1RKKNVbIToI8NdS3cLTGzwZIBAoz5aHCcZkjv
         IhWufBIRGszn7EMiCcCZNnIGHG+JRpEBoYXDp9v8W77+tTDtX4ZgGuXkEuTIi6+EGxnC
         0MtFLjkTG+SrVx2hCYYnF3/ELPksNkWQxipLC0ujDBPZwT/Zkwk+Zd1psdkNj08eNzxL
         Z8WtaAjcjqOan6OzdGVEfE+19lK+Sl6M+GgJ+h5W5apm6WJBjc/6ncfS7mxFXo33haFJ
         juQA==
X-Forwarded-Encrypted: i=1; AJvYcCWnxE/ySGW6kd2GSRfmqXJkIBOLheqc5EwOayQH6rwhvK0Pg09jrt5Qi1aQY1l6YSrmRDcJEgLGeLgnMfUD@vger.kernel.org
X-Gm-Message-State: AOJu0YySq/scr7Jd0c0gnF+t+iPKLyi0rhLK0icSS4KgzIW44aoKJ6Av
	IQSi2GWz1QnehuUgHKQqMilzueeS3EP+49s10ZJKx8KVgnqWPGG+ArNXy2C+N9GCIPZUSX/ci6A
	vca0ZRk/DU963gHcBuZor7U+Dq/lPeJF8Gtf9KVsynyDJ2wGJ7r+R794aqkRyPILyHaIg
X-Gm-Gg: AZuq6aJ4baoePokyoc5QLA0ULm4reKAJAYQzER1p0ejiHALDvD09fRNhOtEQxk1qQUq
	ujx5DvE4QtRYOpeKBpEqe3tNTh9+3fEfW92CIByqD41qP8qDX4xparlIdtBJEhRKYx0qS6Ir8rY
	lgtH8E8Kge58Y6ExhHxw6o+XY5zdjSiAR2WGY+FLnf0bX7vcrdgHmDV+ZjSGacRa90X5MxJRTwG
	tTDKMF2mxFVibZVCgnXSDusKDLun1CmDJfMTieNEPBBAtg5smn+iY6hS096izLMK28mH3hHJ4gy
	EhJlU9okd6dbo3SfDrAoSuSJlHGMHTUgS0p7OAFck/3HA52BacJp6/7Oy+sI4m4HYujX+anStG6
	9J6zMPSwKnq8m22DAlWePvAJ89dKBdtSQfLkYBcfbVaRKCB1buUXrzvn8+2dWVIoPViNDdUuDWY
	UtNps=
X-Received: by 2002:a05:622a:1356:b0:501:5260:51e9 with SMTP id d75a77b69052e-506a6815affmr133019631cf.7.1771333380130;
        Tue, 17 Feb 2026 05:03:00 -0800 (PST)
X-Received: by 2002:a05:622a:1356:b0:501:5260:51e9 with SMTP id d75a77b69052e-506a6815affmr133019061cf.7.1771333379236;
        Tue, 17 Feb 2026 05:02:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f563564sm3980554e87.4.2026.02.17.05.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:02:58 -0800 (PST)
Message-ID: <0cc60cb9-5714-4128-8e41-cb62eef513fc@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:02:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] interconnect: qcom: De-acronymize SoC names
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217130035.281752-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260217130035.281752-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217130035.281752-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XN2WelyRuP8r5U6sz2379q7V7JX6AHbQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX5UxSzejBuo6z
 rPvszFsF3IMwq1EmcN58XnUAvNu+KuQ9Q8DjFEjBXHm2gD6nPWgw8RJSuikhvRB8i0mfu69lNZN
 LUynsD1FlI3I7MkO+n5hMmAD9afQwbkYQlqUTQz9yac86Jwru2rhB0eSmWH0FxgFmhIysTzWWVg
 b2UnYXNl/SGyOeubwTrxkd7nIM+2LhRGikLczz+n9TXJ4JdIeulyzloVkHw60buzjZaFGV33EwO
 r9qwGHc2NeIDARrfbkza2spav/OosdFQhEipyxWVeI1iG+/8UxbmWl9Xz103JMNbLI55Mq4JEx3
 I6/MPFWKSqvjIbX+4vRwz7ybu5g3GD1NWjN4QWk6IryrX+F6tzUXR2+12PTuCAsVC7MREW+GnsO
 BZje43iwHukPmf1ejjySCpIbqFnfooP6wutuTHPc4TWmI/ndTGF9B7OyhF67asvJps1qkqDjJ9G
 IFOOqGp/ufjUqkZjb0w==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69946705 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=FlZS5g-ABFJi0eqNzBkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: XN2WelyRuP8r5U6sz2379q7V7JX6AHbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93176-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09D4914C620
X-Rspamd-Action: no action

On 2/17/26 2:00 PM, Krzysztof Kozlowski wrote:
> Glymur and Kaanapali are codenames of Qualcomm SoCs, not acronyms.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

