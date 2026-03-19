Return-Path: <linux-arm-msm+bounces-98677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EF2EhfDu2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:34:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B342C8BEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B65230B256F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B16D3B38AD;
	Thu, 19 Mar 2026 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="equf/blw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aa9F//f8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06853B19D0
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911238; cv=none; b=ZAeC4rPTCjwxpT8YDEowTvfNDB+I8cnRwbk3cFwlbDu9i211EpWvD8Xq0Z4GCE3rR8dkTztMH66RarakEvJAWaxmbi4+1lUB2u8WvKNnq4he5yHWk406Jlxm1AobkI/ZTsCZK5ix+7g1ns8ip+e5vIXhCJatFZtldy+oC2D+X2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911238; c=relaxed/simple;
	bh=phJe4cOiYkLMs+xPLqGKhHIyzrPV/SU0j8J2JM1JPXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eyuvMSq6SDvwEoBnNFAKnic8ugYxN9dQZvCVsAAjfbl+QK1kcytSeaFDaNq5CBATuTUd+ccr0aA2zNuB3AWlscDWZwGYUHOAm7ybL4TV6gZ+dfNf4KMv/Rsw3Hs+jZ49ywKBGq00fcqhq7MAvN+FgA47ml3+8O/jlS0jBusl2xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=equf/blw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aa9F//f8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73uNE1770574
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZD1cRHOfX6I58ti9hUBFh6NzbgdnGh0D9rATqcSJrR0=; b=equf/blwTPRxgN21
	n4ndgXbU5m4YKa11RRzJgLWd1CmOJVyim8hjcvCd+dvX4Cd/4izN+UYnMOV/gOaF
	pPErKz7kpxaA9dzrqw8SbbPH2SqG4kaTXzq8wA8iwIcgT5zCgXM4KhhDnAEXchyo
	JaU2iLb0KGuInl0aKbXigyvIoF4LzTdjcs39AOIb1Jz9YYuFXyyzgn7tjiURLtn0
	qtah6sLJ58P/WPoeA+X3ENSZ2E0kv4uhRszEEYaMDJTepb5NUt63UQ/L5oiuDfGD
	a7c4eC5rvdOEK2ckGBhQDgfzdy7v7Q4uryt3Te4s2/Uncj0TIES9WockfvFi5VAK
	WE3Q3A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75tuj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:07:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b059511554so53441945ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911236; x=1774516036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZD1cRHOfX6I58ti9hUBFh6NzbgdnGh0D9rATqcSJrR0=;
        b=aa9F//f8SXTute7fMN3B6sraO5f7YR9JGMIQKYa7k4XHTzo3GphQcNrmyIbvZgU9wB
         zB2/gypih4+5adoeCGS4PCPy1Fv0OqdEBudMAKplP87DQ2tLTQQCA5b+IVAK46NGJJM+
         ohxtOrO9LDP1i8k+fTxBBSkNQhrSOmgUCn0bJR+tq5YQQJucgH6fqXRgCQ5wHvOcMTLT
         ZinV7f1MySdV3dqXj6KEeJyJflMIEzUHiO0BjE9fIQpMJRKBgA5YEnu7YomuSC7LU7va
         Vt29B7cFOD9qv2eYcPW+hWYMGbVJTy04tNr/tRdEB9SdXUhw8SlQaEisU2/XhG9UNuCs
         MF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911236; x=1774516036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZD1cRHOfX6I58ti9hUBFh6NzbgdnGh0D9rATqcSJrR0=;
        b=fE7LctEMvMeBwoSZnSRWGv66mWDhv2GhBg1DkGkyFokwL8FlLpCJXYTDOz0q684giw
         hOyqKbKBDbMQtv+dOlsDPbd2delF3G7GITcuH0mE1RJ+d1gu0rzJ8EeCxxyJ/G9V06Ez
         HrIheFftqO62ffxuFOstAGKT1bZPBgBoQnRz4rLcyHkSwPs9JzOMbHM7h7jj4m7M16IP
         1KzMfmy3W6c9qbXxkZOedrvIPGR/4oy6GgS+ve7qs8+zqO4FtNwXFaxT4rmChlI0un07
         JNtEJgW8zvchMQw3rNFAkPYyROzjdwmw9yQyvd8qo2MMfBOmAWZwxOyG7JAaJmk8GvQF
         FabQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr4qvUQKRsTQUWHOExsH1rO/oF51ii0mXoZFORxe6k8WP1yWPWf7Kp1O8LaBnVKSosPbKHIHNA7knV0ksc@vger.kernel.org
X-Gm-Message-State: AOJu0YyJAdAfzJVU8zfnWoQY4lkARenp9RfG0IQmXnihSwGXu6p2FOT5
	4aTwxYpEI16gdXds7gJbesro4r9jIfrj3gBipEc8GQBlwPcujSuKBtJvDMz15uyqMm5RyaKuc6n
	hGekXAdI73GgbI7F04z3+GYBp5cWzQsyfpZxGdNUk0JEEzLG8HsobGydPnbOajoxKgMM+
X-Gm-Gg: ATEYQzyGi3e+jY/k1jgnZih1N5Kj75kbM0tI393alt5hUQPnCjVZunlbEf27fW5jNMl
	IA+NXy8KD7eiP3M51VYhPb06FFaOB3eSvQ9CrhMXuHml+iRZgceYmDgPGYO70EYS0bPtHkuVdnD
	cRSXZQ6RBniWwiUdgltSbtySdzr48qbmTemW5NS4yLNowTfHh+iuK8QESyPBGtHEXuRlbHLN4xP
	3fd9gspESxh44D6tXrcjgDslK6wyU4jPoVyQj29g0e4WcJ7GfdAvkX9trsqLEGBK7BBDdoD8rV3
	GvS1Au4S2kDm+QAsgKWDb/fxr0PkmG90FuPetN5/d4hGNjiMQwUeMRsQRqoOCAwHLV+2sQ7JCw9
	oxYDIhVcKSvr8RCq7B5SZYXXRJ5K++J9dGrLviSi7IQ0MYb0D+CjP6FY=
X-Received: by 2002:a17:902:da90:b0:2b0:6e8f:8e9e with SMTP id d9443c01a7336-2b06e8f9399mr68692805ad.20.1773911236439;
        Thu, 19 Mar 2026 02:07:16 -0700 (PDT)
X-Received: by 2002:a17:902:da90:b0:2b0:6e8f:8e9e with SMTP id d9443c01a7336-2b06e8f9399mr68692505ad.20.1773911235957;
        Thu, 19 Mar 2026 02:07:15 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.254.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5ef42asm63996555ad.40.2026.03.19.02.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:07:15 -0700 (PDT)
Message-ID: <9a60ba48-f9f2-4998-a73c-162809651b63@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 14:37:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/11] media: qcom: iris: use new firmware name for
 SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-10-55a9566ebf60@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-10-55a9566ebf60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MiBTYWx0ZWRfX/ji6druUMSzK
 IQJRL1lH2PrHyHLdFrYjArhpmTfj7+TToKJ7sBwBA8pwh/jkzipbBR8kk8jsA4JHe24g0K6rGkl
 VNNnroruA5vhvLjfUVPpymCGQujtJ6JRbXNEC4A8XeNlwIUTYCLZLiumsxh5oOgQ0tZKf2gpi0u
 uSmKieDEYW91lF4C3ppXz5Mci9sy86O6H6mDT/AyDjKn1h+Qy1ErfwAs2U+B15MxZYCMCAyXjuA
 Nn4uevdP7MBvCm6FKYs++keDlkGWuiV5FSwu09vyuCZJ4sqvIehn6u4vEOHLY4Se7wTS7tVae+y
 xU7yk6yZu7i4GfJtUF7UIi+P9ibg+lFhTNm6pjdEhaqf2l2kMTzKOdJvuheCthK7Cjyz73w3U05
 hXMgcbMP3cec1mOwdIZQnbRnmmidPaH1oYBzkF8CTQzSzHIswBxbvYY/kVI2OybMOs0lFV4jbtN
 eYBS6sosgVOwXutaYeg==
X-Proofpoint-ORIG-GUID: i0NmeJzvJO540sw32EpBiO6Z0_He_oSb
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bbbcc5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=vmayvKaVtNuonzR42S3udg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ygpMJMYJU6yCGMAIxH0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: i0NmeJzvJO540sw32EpBiO6Z0_He_oSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98677-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41B342C8BEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> The linux-firmware is providing the vpuNN_pM.mbn firmware for SM8250
> since August of 2024. Stop using the legacy firmware name
> (vpu-1.0/venus.mbn) and switch to the standard firmware name schema.
> 
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

