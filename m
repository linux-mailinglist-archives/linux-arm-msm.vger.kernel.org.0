Return-Path: <linux-arm-msm+bounces-109219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EbxNsQmEGpQUQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:49:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E72315B174A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C28A6302A1A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27423C345A;
	Fri, 22 May 2026 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/eOEC+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvEZW1Kt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEE12C032C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443044; cv=none; b=pybRbVS4vsxRP1eXcxqfetq/kSen83q7JZmz159vTZSSxJPRf4FFNYxdKX5hnQ6VfW5E0VsP57EN4v3o/IT6w+y5L9+1Q3oZgU7FVM5EY9mUJoMZuhr1qrXiI/Ih1HGpF/TCgwuh+GwX6bWQlC4SXxhyOSRYNZCBMFKd8GLYO/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443044; c=relaxed/simple;
	bh=fusSPUBgcAiBKAPSIpdU2Gjv6FHTAl6rDn+2vTg4/I0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=upgJU271+QSHbREJWnyBT8PDStV736V70tm4qfIA71+aZbJSKj8A2S2iKgWH6n9ZYPfjyvJrFRSb2tYIquGOfVReYgDg8Gt8mogL26ghwgJMSTOvj+yFFDOZv+90PPmXuQGl3renPLTS3SoX8h/Cw91Nf8oKhcLJuyQ125w/5EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/eOEC+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvEZW1Kt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9EFWf3005145
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	75qS3OYJwx2ND7auGvDt2hUntrDTnPmW1cpbweF7c0E=; b=G/eOEC+C4OIQ9qlT
	i6bomT/JSpw7JWjs2YrzGmdptTYYmeVDw4H4nYvqHvxhOSIcTDQJgwBI0ugfqCFj
	eWXhA2fykGsAEhbu6MnMqtKmKm7XqyKlXqT/JuXJF47mRvK2ZJAmiBRTctF2ux+8
	G8+YxCCfAslkQpYe+Kq0yF4MoXJRQy2DaOrUcKMbyNB0QGLfqwPsiVvteAzag6t9
	DrkC86LT8eKZZIzmq+d2AEF+QIGrgNfoYA8VEDHXnYnfEe+ePITfh2WVkN7VNNLT
	klGEDdXd6etZ2arAwcjrlwnkpHdP9LP3GM0VKD3xKam6L3HcYplrmxJ8EYv1aFC5
	kLoVTw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt9crv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:44:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f1b94ac9dso27246511cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779443041; x=1780047841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=75qS3OYJwx2ND7auGvDt2hUntrDTnPmW1cpbweF7c0E=;
        b=UvEZW1Ktl0NhyODLQa07oMQEQphkQXBjaeMmv+r3tpAvklWRCy/odM/rBdpZtHSzHK
         9wGOgbJ8bf85QAZ+wJIdP939gI5tfD/W7v3I3mo17nFiM77FP65c+Ho+cwXvr6yfgEEK
         REjJJdN92iqbkuk1hwEWY5Tzt6s+GhrhXgow409u95dsVceY2lG1DVLpYxiH88fRIr4a
         iZZv4SNX/F7GmgiEUtVMAkG/bAY2g5hdXx2ldE3o9VA261AmgSto7pjyZ/Cx1hGkMHrP
         MWC56Otw7fsq5FFnSN7p3tXSbSS6wmOnivZ7S3O4B2qOqquH0WQvyOK7U9xI+oz6qy22
         d+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443041; x=1780047841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75qS3OYJwx2ND7auGvDt2hUntrDTnPmW1cpbweF7c0E=;
        b=O1aRciWvBspRDYAaJs9OAdBiE/sH8Bd5N6i9DiQy08yXXcsNma45KCJghzYdOIneac
         Znv+9NWMVsfjMAv6PTA6ZaLW7bV152I1xTpr+Z3nZrGJmod7AyBINAy4dKei8tmfZmgh
         ISbJpwcemJbPCHYRuSlltn3h1m3ewu72NzNpNk7R5u0qzqWaV63bqCsxaZqFH8cHU+LV
         b1hZEvgAsEEbStPulswIqxd+AHYaV0DK+L3VB+Mt+FGAB+QmZhsbIwfv3g1QIpW8/5Td
         O8NISIgVmUdznLnPcves2XV/tDQMlGBOfb5k36spdoRLFqVHhuJC9AhMx6za+F5x7eV5
         jDOg==
X-Gm-Message-State: AOJu0YwfUui1uze7NoY5dQ7TbaBVR/s1bofFKXX1Uel5oorbEO87qAVo
	5XgJuxH2trhnDLrHIV0dPBVMYYE4MnZm6eeasUtuERXLs71rEW1GsMPsi9JJ00vyX/IpVXbZd+M
	KyHI8AvcE1k+jsXeCQA9z3T4R3ntfWhSU07Jlx5zqZBbbv4YJIPeFHljgXU05d2M5SxwV
X-Gm-Gg: Acq92OGpmSoO7/bhkAEyA6j99JN/v+nct4k5s3EtWAt1XfjnINiy3g7oC/XO/y3M88/
	NpRaElKVlY6TTScPVqVoH+wi7qF19aHelbyDoF0DA1m1TJ/+dM7Xm9FctDRH3fchzxQYtQ7KFy+
	9QkKgiLFte4rrdjDu+7AQHZdPemstAp6S/7NB2oluo3aXhr+KEqTI+9tdmqSKF4RdT/X3nMYTMS
	kbjTuQQqhOoqWKfumyy5SbHhZIs3DSziObPi6gSgmZ1NG1UF/EunIQF+uKMQnbecAJqclU3MBY/
	p3DgkJUYnY8NDcMERFyPCNs+be89711eIKDQH04bRxafgX2yXovU1va+hLUumV8R0nT0GAleHJj
	YEOXJvBeVUDYd+0ENKpv6QMvXn05xJO7nQ2FrVIe51CpjA8w/fstOc7ET
X-Received: by 2002:a05:622a:134d:b0:50f:bea5:52a with SMTP id d75a77b69052e-516d41a0d4emr31175971cf.0.1779443041673;
        Fri, 22 May 2026 02:44:01 -0700 (PDT)
X-Received: by 2002:a05:622a:134d:b0:50f:bea5:52a with SMTP id d75a77b69052e-516d41a0d4emr31175831cf.0.1779443041275;
        Fri, 22 May 2026 02:44:01 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb139b40sm452719a12.24.2026.05.22.02.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:44:00 -0700 (PDT)
Message-ID: <dd09907e-b637-4f7b-90ac-bf07fddf2956@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:43:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ice: Support IP version beyond v3
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mani@kernel.org
References: <20260521131229.11199-1-mani@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260521131229.11199-1-mani@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a102562 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NmW1BMHllK96DJv5B-wA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NiBTYWx0ZWRfX4wWm3fiVAVdJ
 e51Ic+ytHVeDEnI2NV6bqaF9RiB2BILrXSCOSwz7eNQVl2y3fh0l1+EcrbdCCv+33e0MMltYOk+
 M6ZZGBEuByEiln3sntpxAHgMs5zhPLRyFWnrZJWTeOmvLvBBESSE9pD1+jXq2R6PNjgjzOmc+1K
 K1s849oCntIUJj2hsiGDGpLGGph/lVHkeLPAeIiz8cle584dLwhRq4h9P/lw/RBp0lcO48FzrR2
 kBNu3aQHV56mmVm63F5tdcfUTdGXN3R8CQt6EtfwJSBcOL6+j4veyrm0tHPpaGRQIWot2r3ue+V
 zWgWlAz/K/zMJ9QU0OEJEuoGiigPZG7pqvLoq4sAwJRxS7C+TSt2TDg0oaWm4CrnvwIHB8BYXb5
 kmZc0yFKdTzdY7a/PReMDLVatnitzUY69uHLOk0WnNr9Ktlsk/5qAimqxzTJOPvEi4SRAhWT3KL
 Wi9Xe7GSBd4OXrTiHhg==
X-Proofpoint-GUID: CvzJniyfU0H5vz0nwlrg4Xt4Ea8f9QRz
X-Proofpoint-ORIG-GUID: CvzJniyfU0H5vz0nwlrg4Xt4Ea8f9QRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-109219-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E72315B174A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 3:12 PM, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> This driver currently supports Inline Crypto Engine (ICE) IP version 3 and
> 4. But this driver fully supports v5 and should support upcoming versions
> as well. So extend the version check to support versions 3 and beyond.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

