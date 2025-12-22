Return-Path: <linux-arm-msm+bounces-86255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50837CD6DAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 18:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9D0030285D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 17:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF1E3009C3;
	Mon, 22 Dec 2025 17:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCiVEhEQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQ1Bg4o7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CFE26CE23
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766425524; cv=none; b=PZj3HKNPBT7HyvWzGmrZ80qSLvoGkHDS4TA/VGG7Ii14rrkdi6pKt9YgKzmOZrC7MqVZyppCKZMMyrE/mpBLtQ3uY8BMz8hsBnwaiwg17+U9bPgKiquSEg9NoaLVKlsQo471GgOfh2xs0nfTz4hESdRa3ZT/uuQ559QClUJLxMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766425524; c=relaxed/simple;
	bh=mDcYHWWDFCZ8abX9mVhTIcxFXGToPYmyE1T1wNNsIEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CluvaR5cr1iqiXeqevKqaYfmEU7PtSIDinpX9iDptdVCiSLahPmRhEZSl6I2rt11f7s41JBAtfTny43MdOQ2fixfTcHfE0FO+hSmTJkh3KeCdbJrSJDQHIChqr9G5yPtL6Z3g0+5s4IyWFmMMtpNKyV6vPXM5aJHGdncsitlnb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCiVEhEQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQ1Bg4o7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMECLjr2199486
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xNreFgwKVVrMQp9bKV36Cv+4AeGfdYFXYCSfOTeRS/Y=; b=XCiVEhEQBzgMg1Td
	p/ZesAYpTQDZLgHUW+dBDIz6/9OMx2eBGLwTwAO5APTppzX5K++RMNAhyKpM9REX
	N+UINCelzSrq3uQT+tfy7wK/SYT160zat1fIWxh9hLmBS9fDdLhPaUAQHm+FiIQs
	JWKUa5hjFS0jZ4ksXjIB8vpOfCBKlnbmEl0HupChADqHL58JmzENyy9FMWiyS23s
	ufRj5E8m0WzY6LOB7pHsI/9H6Nu/BZWqN8EVPtqQETh2lWFSbm6LVXhqjgg6EQVi
	picuDhsurkVN8fPS88TxlpYBtbXyIdDKRoT+I0WHJRDrc+krAWrHAPDu7VWpeuC9
	2Me4xA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fws98j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:45:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b952a966d7so8736403b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766425521; x=1767030321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xNreFgwKVVrMQp9bKV36Cv+4AeGfdYFXYCSfOTeRS/Y=;
        b=hQ1Bg4o7LliVbiCq6e6zFe8GkRad4CamgR4ZVAN9gPBy35/3FkNs/na4Ydkdlp4EX6
         8Utr3C/R3xnXUGy1WuXalciOq5cY2WlnlqKCNuu8NKVwClyLdU7XSEQCDD8aM+fBySES
         +Qc7dhhBudyN2sB0Dw1dtT+o7vwhBgMtymrdnWI09C7bovPV+UeqvtM9mzj3f+DqCKuU
         lcicagcHROX8XBsJciiFMZCKrE7oZts7tBRlpHNXTYHp5B1e+TPnUkIMg369nWP6HERr
         Dcc3k602NUK+oJxzwagn5zoiaivgJRcjdGFa34MyK5kE8C5ugghs2Ur8uTrMjo/M+vAe
         bq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766425521; x=1767030321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNreFgwKVVrMQp9bKV36Cv+4AeGfdYFXYCSfOTeRS/Y=;
        b=pMMCzJh24IzNjV+zSaCvmIsxYLir1sGb4WGAwYp9VLu4kFdi+IERaumrX4XeLy4J0f
         FYMtU+DB/1rry3HlPGlEoPOfoN2V7UghUPUOzKQnksUwgjlj2Rkim7fVrdECssovzgmu
         j0ZMZNsmm6ZkRlxxl8dvTAJF2yAWirIs/8NXk4TxTi65s1KBl4+/VDOxmzOI984bXVdf
         j0jizdDuFQNJIjCSB1g9aY9nBGzB8BL9dYI/3rJHx4ONTnvJGI6McuOX8/SrdZ4SXjUH
         wc0oiCq30nkLPmykx7mlFptC2KPTr949+/f7oJmaPdkhoINHiR0GWACLbzBnW9P6V9gW
         ivew==
X-Forwarded-Encrypted: i=1; AJvYcCXkYE3d0j0peNymAjw7KPUM/5+CTMTpuiJtPvXNqz5JKamP6XOW4VSCVMHzrBbdUVj2QTzJT49nmpsJmaQd@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ0oG2ouTrjyPy4XfyDRWhcl7XiZhPT/pYUHGvMbfNLtagrt6n
	K4HC6i5/+YcGo+CMQeZ0thag6O+9B4Nlrq8BxaZcWnLzJLNgS1zwer/s4YDpCBBHBvW02X/yazw
	He7+V+jgrZLzsGmrxFFJsDCg+0uxVJlu4JYUWi6hhIOkgHzMnOKCXZC8PTQFvNipty4N8
X-Gm-Gg: AY/fxX7eM/VoB4p4A1dH8h49YFLvj7cCqub0eU4wlHeIhp8sdyxikcz+onqx11B8q/a
	9r/Uo+MkoV+tPtcxTfTLqr4WCaLzcIBF3hDLLzbkK/19KlVdVcgdqhck/0g9opRJdsoAWD9ENuf
	0om+nEXzE4imMC02uZzpx9Ai4XeFRW2YFN/fteQJ8nzuma9kM73mhj2ftiICSnYHQSvuUZfZvxi
	d9yy1O2vIjyYNNIYMyxiBS9UacCPUneb2t83zdAXZQWiEUt6KmCQtiQxi/7M1mUhKZ1YYQfxnbF
	+r/ZL+ITAYa1/bdNTuBVZxgwqcJjk5f/NXYAG6urzUYWMJYKdm/EYNboI/F7zy+t86PMwj/sfDa
	XrRyFoNuM1mQ6mX8W6f+c+/8n3kRTY09Iivjb
X-Received: by 2002:a05:6a00:3c8e:b0:7ff:ce33:e6b0 with SMTP id d2e1a72fcca58-7ffce33f6f9mr10410974b3a.10.1766425520797;
        Mon, 22 Dec 2025 09:45:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSjEA9ajFMNhJnx1qyt2wsBG0dEQR3s7oZFVNUtpfNlBwxwsb7uE5zp34TNadcX7aJYIR1sg==
X-Received: by 2002:a05:6a00:3c8e:b0:7ff:ce33:e6b0 with SMTP id d2e1a72fcca58-7ffce33f6f9mr10410942b3a.10.1766425520287;
        Mon, 22 Dec 2025 09:45:20 -0800 (PST)
Received: from [192.168.1.5] ([27.57.93.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a843ee4sm11188529b3a.10.2025.12.22.09.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 09:45:20 -0800 (PST)
Message-ID: <3193e3e2-2b00-4c7e-a84f-86616c3666d3@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 23:15:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: add clocks property to
 enable QoS on qcs8300
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
 <20251128150106.13849-2-odelu.kukatla@oss.qualcomm.com>
 <4930a0ad-258c-45ea-99a0-753cb3c3ba6b@kernel.org>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <4930a0ad-258c-45ea-99a0-753cb3c3ba6b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694983b1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=luqpl2TCSyK2LuNNAmtdDg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=izIGmOzjKg6u1_hBuywA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=i6qsmYmKKdoA:10 a=csto0wWSG80A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE2MSBTYWx0ZWRfXxJFoEf1l4+NW
 XYwop4JHICv0yNQS+v7G7FPiQr++4XNlgbF0tOm6De3s2wy7x9ZXEA0zg1ggM0CUCDT6IajbYVV
 bvIrihufKkKgC/oElhHZECnJn/7XLhoJ+f0C2yzgMuZ6YVB5y21bmMUoU91iUtNcm6vJmAFdpkk
 gYJP5YDY/BtNiVCbu6vWeuyPQ52F5lgBPrKHAThydyEVOOM6ALcpoYS2i8pFR/K4TKVYbrgKu+V
 weoiPLvCqHMe/2SOAbHvN0koJ/uWBf4ADylqd7ZuqI6298OprnEjgisAhuQb3RX2azprdgogQg0
 5MdMlyMiWrRLGM45z7aX/91ODHI2aIke4R0UNQ1gSPsiVJAf+BGFHdHd3DMwHnIw8XVkxGNg6u+
 SbKyHcVKT9jW/35XGyJ48Dp+miLW7F3Ul/IBfCIz1DbIr4/TjHhY/8fZuwThxSH1HYAn2teZllY
 m8LN0cfqZYoQBJ87IDQ==
X-Proofpoint-GUID: bp_mzUVHI_4YD5Gme2sM9qXe-d1AXN5a
X-Proofpoint-ORIG-GUID: bp_mzUVHI_4YD5Gme2sM9qXe-d1AXN5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220161



On 11/29/2025 3:15 PM, Krzysztof Kozlowski wrote:
> On 28/11/2025 16:01, Odelu Kukatla wrote:
>> Add 'clocks' property to enable QoS configuration. This property
>> enables the necessary clocks for QoS configuration.
>>
>> QoS configuration is essential for ensuring that latency sensitive
>> components such as CPUs and multimedia engines receive prioritized
>> access to memory and interconnect resources. This helps to manage
>> bandwidth and latency across subsystems, improving system responsiveness
>> and performance in concurrent workloads.
> 
> 
> Same problems with your previous and other commits:
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> "on qcs8300" is redundant. Prefix defines that, so use proper prefixes.
> You do not add clocks for every interconnect...
> 

Thanks for the review and providing pointers, I’ll address the prefix
issue in v2.

> Best regards,
> Krzysztof


