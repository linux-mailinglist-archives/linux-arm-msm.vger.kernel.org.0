Return-Path: <linux-arm-msm+bounces-86852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11087CE6D0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 14:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 551FD300BBA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23052288520;
	Mon, 29 Dec 2025 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVEyHRME";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUH0K8Sm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AE81DE2C9
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013361; cv=none; b=Hpvvmqbh1U7sgw/7pDJ+yZ0jmoyGtzn7zZ4nhnMzuqk0LzRh3bF8gEUtDNRetN4FlUKVaA9Y+mCFf4Aw/Grqvtv+7z1lhDC3uqJ9fGmjASgha5GJff5ppUptQbqGMmUDO1cAiLBEbEQhKWpiKLKOxcp4CWTa0bx6P/jSe8F338s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013361; c=relaxed/simple;
	bh=CVt2FGC14gyUkk0IVe2HRnTfwU5NYRnTMlH/k451/XM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2Bwkhkv5WziUfkcww9OzjAiRoRcnjeogFgOJnR3aXEMFbARCvrkAtuiKDhwyEaVevEK8H0P8mjEJu4jJwho+F+EUimZAiAgKG8k+yTzA++rxFL8+kJSHK24LyJUrIaS8J3YRhHSeG9UhkZpdsTx4HLAL59grkCshIQxodPFIZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVEyHRME; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUH0K8Sm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9Twgb3686954
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGUgj+Kn9KCJ7M8hH8ssNXe59EoU7BgwRO3/h5NqzOY=; b=WVEyHRMEFASVbix4
	tUsPe+V23uIRD/EAUl9BWrvfCzMCGsUQEQZmDYUcDMpBjwP5YO44EWHa8HiTr/dD
	+Xj1JlhW/BxhlAaXKPnEgAZkh9jIujJMxf2ajl6na4PURSTER+EWcnZ9uB45ORsV
	wULhz8aY9p2rEJUHFEJmOoIBhn6mbj1YBhFY37LRx7F6AA9zgxatqtyVp/3UBAXN
	iyGYqR26gUaPzNQU+242oPlb0QQcRTzQWref7lsbV6rh+VxKiCYzGihX6VnuaUgU
	SFME+INiQ6hWjl/iEwoBblSI6hP28ZoaTFNFoDcBv4dq949fvAQpGpx6IuPhE1wS
	pY1wOw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsccye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:02:37 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-64471aa9ee5so2114270d50.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 05:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767013357; x=1767618157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGUgj+Kn9KCJ7M8hH8ssNXe59EoU7BgwRO3/h5NqzOY=;
        b=MUH0K8SmNWdDFVvnQ8V1VnGuyyZfLBfmv1qT49gN4KdVKEAMqI3i/hiOAFvA1YZqNV
         bn03zuiesjf2tOHS27hXYaGZCtcIsow3SY3B3hLbj4NnNDv4xEO+uIS8MTXbcazyjgYT
         d4xYR9ufcm1sg+kAW86vLSKATcuGLUwcs07m6tL1elZ+YK/zIZHGJtm2gGCfeLEi1H/Q
         qSnbAkVbbVh3RmjX+t7kHOlSS7nYXAc8r2XDb8SPsnvOarzyypsCEvSNAd1Tmvb7HBFt
         6L49EZ6arigGS36rgz9b3d7fSZksWsyxcVw8BBu1CYy0i465uKVwfnY6W5qcS8hV5pNx
         SK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767013357; x=1767618157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGUgj+Kn9KCJ7M8hH8ssNXe59EoU7BgwRO3/h5NqzOY=;
        b=EczrEzXLGbCi5GR/yMB3lFBZqNMGeH1PHd/jmIye95vWaJNINXO0EfXVHIYsE4UZzo
         khpq45GJ6qizR5hIW5cfi/PUp/ueVxgzSvvRKQA9o1JzwK6mGBfMw7LfzA/tzHxrFFLy
         lwhjvOvYiehz0omzTVertZj+zAFOQxJ7D+dG0M3oXGx2C7CFMiEWrqi3EVKjI8Ue0ENb
         a7Y+7vZjvyY+3kCyAKoM666WW6U2hI2+qKnSjyIN06slhYzasFfc09H5wAysGbw3xbNM
         Nf27oq9X0atAdNe47M5Rz4K2oshLD7kJdzVcxfbvOyQwtARXdh3hvYATLYDWhbwhinWj
         tR/g==
X-Forwarded-Encrypted: i=1; AJvYcCU9Kn/TFVM3mD8idmWlVszSuyCCYpnmR2bzJYMtBYgPpeiyjj3M67lQdjMeeCalRWcnm7lixhiGFWjvT/0T@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgo031KwV3bl/EkyhpceAhvoULLDr1kn7zZmLqMBrOIxPAmxaT
	e/+ghORBl8Zur/dFg+OIhX97qyM/HhSeEU6FVWgNn919TuovRE1uDJ7y9LPIO/52GTzfAHtI+MA
	Dx55nIkZwdi7v/ZFrl45YDeLtoeNrX8HwQZYroNbr+8T4xl983dqfpbwyU8yyEzkHMglK
X-Gm-Gg: AY/fxX79/GlYtYxVMci+i7p/fCnU3GRQlnW8qPbeS8gL75tUMegC4ec7JnlFszXqxcB
	Nepy25KToTlGZw72Mr6ZGPEE4gUgGjOfuDN/E0ulghUwZASJg1kgRfyIiOBXjT3CE0NFdojtlW4
	HEqcbp1PALfjogtnr0e+kjzp6h27g12m3dJcC5NXyJsyptRykNZ+DMqkSP+SNHMU5hYz4O7+eWE
	zhNho0B4tTGJ1WmO3HLN6aXAbKe3GcjNb2GZx2a0purCcDVLAvOshPs6Vz/4csed524OeCHWKfr
	SE5Pl5RNsfmMMs/uDo0+Gkfh7G7P8Sf1EB03oc2H64x9I95KDjmBVe/5jN7s57E/iiIzOsi5BVs
	W/Xyzaec1J08Yz4f9SkhENuuHtTqq2Y4s4e/SCUm6tFij2LtuLlsPY+CmcHgwaS6w+g==
X-Received: by 2002:a05:690c:dc7:b0:78f:d300:1ba7 with SMTP id 00721157ae682-78fd3002314mr177536717b3.3.1767013357531;
        Mon, 29 Dec 2025 05:02:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJv/cJRIcfHWOehcWwgeznXBqqokkgxA15J4TrsYpAXURJ0KC16Heb7NVu2F1k6ufWr45YOg==
X-Received: by 2002:a05:690c:dc7:b0:78f:d300:1ba7 with SMTP id 00721157ae682-78fd3002314mr177536387b3.3.1767013357182;
        Mon, 29 Dec 2025 05:02:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad1e6dsm3369708766b.21.2025.12.29.05.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 05:02:36 -0800 (PST)
Message-ID: <c39224af-f228-41f6-abd1-bbc79b970028@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 14:02:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] FROMLIST: driver: bluetooth: hci_qca: Always perform
 cleanup on every setup failure
To: jinwli <jinwang.li@oss.qualcomm.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20251222123824.3000167-1-jinwang.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251222123824.3000167-1-jinwang.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6rAJvRJs6ZWnhY4ziq5vjyy4oqCjQAhR
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=69527bed cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NCdfTAm3FWQDpeI5H1gA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: 6rAJvRJs6ZWnhY4ziq5vjyy4oqCjQAhR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEyMSBTYWx0ZWRfX6Df+CKaQm+XX
 bO5E1IrX/CMNldTLgWzAd/QJngaOC6wpN2nQwJpJaGTE/5NYAyY1AQ4Kd3OpdiGvXhol8jAJhKC
 HyeMVFL8gXISLbNsEm66gf256lZqOdIr7nNllH2VQ4o0FJ9D8HYl5siRk13+2d53rYIAfDQ0L9A
 qZIv8TAjc97HLy8jRp5Lk2kaLjHN2lPXA04anufiEbGPQ4JBFCIMAxUrPT/9c62xOtMxapWtSmN
 XvdN5IEkkIPqNgDjI3MduEPkETbX8zDv0zM2tiIew4JnXd8X0fF9BOsh+do6f/X93UkeoGOxS4u
 dqhw09hJFGdN9o7VKjuR41aHK2X/2w1FgckpEBMu0JkZPN0r47QGEb86Igy7cn5lhdFt/gGKR2O
 qUmUgalGJxtDqSJWrAm/wW6B0r5QJJL+qr/75+x1JMwfzS1lTUt/F7dn7EZazoHWMCzu+5dq8I0
 sw3BGip/sAMwQp4jFtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290121

On 12/22/25 1:38 PM, jinwli wrote:
> The retry logic in qca_setup combined error handling and
> retry gating under a single condition. This caused the final failed
> attempt (when retries reached MAX_INIT_RETRIES) to return without
> performing cleanup.
> 
> So only jumping to retry when there is a error and retries have not
> reached MAX_INIT_RETRIES.
> 
> Signed-off-by: jinwli <jinwang.li@oss.qualcomm.com>

Please fix your git name (unless that is how you actually write your name)

Why the 'FROMLIST:' in the title? It seems like you're the first submitter:

https://lore.kernel.org/all/?q=Always+perform+cleanup+on+every+setup+failure

Konrad

