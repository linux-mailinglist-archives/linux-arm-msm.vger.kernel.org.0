Return-Path: <linux-arm-msm+bounces-42040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924039F0FAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2CEF161B04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE521E1A33;
	Fri, 13 Dec 2024 14:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9lvwmVF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124451E105B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734101642; cv=none; b=OsxnRHGJjrDaQmXq66lPbfuZQDilE9JhjuMHQ03WK2F84uihmcx1zq3DsonWR6ZuC0HkuhdZajAHec5yw2vxkjmz1H6X0GZtpMJvv/Hm3jR8crJblGB8SqPHluOQlejYZGF+T2S87y2USsiTjjkYY7kwuqRsJNUlIpL23bEoJxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734101642; c=relaxed/simple;
	bh=CH3mLT7v8IsunUYTHNbeDiMX86VuRK1OCaIdDG9clto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UkirdromV1E7gIG7iaCyKpJg+G4jz/p1IwxQiXnmTGoF5ZDn79NZ9y/zjI7CbmVwXKhrj8Wa5naK6t1eX+hd40n8mu6S8ExCzAHfMopiEaA4aJ0ppPCPay99DRBuPGxEgG2ZzeQpQ9HkBNF1KEEA6F7XVZOc4L3yY4wRL6Ow8rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9lvwmVF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9p27u018166
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJ0+RquiEKp7rrarVQZM02Ew7/RBU8iGygX4fyM8G+w=; b=o9lvwmVFWgAZjpYW
	x5urWmDK4X1sJn6YVxSR3K4GtBwk3qIUH+ZNI72Uvio1szt+t7ha/dhCVs6VeP2Y
	0u7Lgsn1+1rFUWEKdTTJ/RfL4Cq8Rc0lEnFKYghOx2l2Prq8pWbbZJDuKfsNua3g
	ShZACQQYkOLLxrwDUpER+2E8nIdRSMvFY270GthcGhWbNqE4/1Hoxjx88ruRTql+
	CSPvmhWMvZXLfyoGnfh9SbCW9yLGF0IOqIbyqghH9GS727kU/0ZRo/UIw+dTnQpH
	jXGiQhfK/Yp/W2hbjO99tRzxyjpaJZsqXPMfMEGoQCYA6KXFJzOh9Y8EiEydWaga
	fhgnzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjnb0u5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:54:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467a97dec51so1563491cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:54:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101639; x=1734706439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJ0+RquiEKp7rrarVQZM02Ew7/RBU8iGygX4fyM8G+w=;
        b=a4/qTH3s17MY91REahsuRYCyOW7eUPA1gzKgHiqP7hAfiF/eXQT7nurcOqLCgydeOd
         JKuGBKN21tP6mwuStAILRdW3BasWYr38RAJFW6BTmw/jnPrHwr0wPMSBciLrWMScATS5
         72K/5BFM0tPLmZfBRKVXINSmvMDPw8HWrZEhNHBlpBxNurLiNZJR5vsf5JW2PYzLJmxi
         naPO/F0eDrwV133vkLOH1+/T29Z6cxsEay18Or8TPvOGQR08/Z+zTd9EjjwpGd0Kd0Qx
         kXza+8s6YRaq4ZRwebBbwCLqXrRSrQSy5KahEzjBpRdBSLODgD9mLmV88tyvgDN4iG8p
         jHkw==
X-Forwarded-Encrypted: i=1; AJvYcCVkqhUFFIUnsL5g/kraSnt8oGTxSNJZ4LFyzxJWlBifdblmpF8qmsr2ZMUF/h2wguYxIrTezToX/k0JDhfa@vger.kernel.org
X-Gm-Message-State: AOJu0YzLkHDfnQ87/X3Uu/pqsJkaN92j7UdbiW6knMMFh6bwYPP+59Da
	0ipC13lFd7pCBRU92uY+EfHPjCUN6U5PCa9BUc8e3XwcqjlFPh54UV580kSSqQwzl/uy9FfeT6A
	vbalOaeuFBXg8doL+aAAyIe2JazpYoHHDNnqbDDhyzlV1OFEa4HtPHqPHl9iqu6ax
X-Gm-Gg: ASbGnct6CsdgwzTw/B6S4Bf19exXczVY0b+pD0jh6yD6ZqpOvPk8KuTvYfpWTAEagut
	GBOtFAeVcl71s6F+EoJPpnSqmhL6LmAw3arCQRoMmmbrxATbBQrXapXMYPPNIzJT/YJGqD/fhJh
	XLBMs8pLjSXQRMFbdVygIFQ9nj6suCDWxbcrrQkhtr3oqkAdLxywqq/pO4pkfjVLVe3yPQojQlN
	TuJ2mUVpbtN9wdV+1PqI1kAnVBzOt1dP2IxV+GhHiQmXLHV86r9AcT9U2IJ+HDAwMBG5F+1CqfK
	5diIoMd+Ygwqf7F+flFxJn8M/g9Xd05wSlGQ
X-Received: by 2002:a05:622a:345:b0:467:58ae:b8dd with SMTP id d75a77b69052e-467a576e84bmr19529311cf.4.1734101638777;
        Fri, 13 Dec 2024 06:53:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEm7nyEai7+LBryXvXeks41c0FwnZxFSCHsFVk3yvJUOaPVQjvDlzjPA3p5bBG7PqFH6CICrA==
X-Received: by 2002:a05:622a:345:b0:467:58ae:b8dd with SMTP id d75a77b69052e-467a576e84bmr19529061cf.4.1734101638300;
        Fri, 13 Dec 2024 06:53:58 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3dbf898e7sm8899985a12.16.2024.12.13.06.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 06:53:57 -0800 (PST)
Message-ID: <17897300-3c9a-4467-867c-3dd2ecb1a766@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 15:53:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go
 (sc8280xp)
To: Pengyu Luo <mitltlatltl@gmail.com>, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, chenxuecong2009@outlook.com, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
        gty0622@gmail.com, johan+linaro@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org
References: <c344a212-1932-47f3-ad0b-c6f65362a699@oss.qualcomm.com>
 <20241213135055.600508-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213135055.600508-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oJJn1b2bvzeROEY6-6LArR8MX3J52JkM
X-Proofpoint-GUID: oJJn1b2bvzeROEY6-6LArR8MX3J52JkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=335 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130105

On 13.12.2024 2:50 PM, Pengyu Luo wrote:
> On Fri, Dec 13, 2024 at 8:57 PM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 13.12.2024 1:50 PM, Pengyu Luo wrote:
>>> should I attach the all?
>>> # dmesg | grep -i 'adsp '
>>> [    0.000000] OF: reserved mem: 0x0000000086c00000..0x0000000088bfffff (32768 KiB) nomap non-reusable adsp-region@86c00000
>>> [    2.249916] remoteproc remoteproc1: Booting fw image qcom/sc8280xp/HUAWEI/gaokun3/qcadsp8280.mbn, size 12950508
>>> [    2.556517] PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff, trans-id: 1
>>> [    2.556546] qcom,apr 3000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
>>> [    2.556594] qcom,apr 3000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:2
>>
>> (Please don't top-post)
>>
> 
> Sorry, I am getting used to mailing lists, recently I write replys with
> text editor, last twice I didn't give a blank line between subject and
> main content, then quotes were removed when sending via git send-email.
> 
>> Yes, please share the whole thing
> 
> Check this https://pastebin.com/p2JyGW4K

Hm, right, looks like battmgr is not there..

Konrad

