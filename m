Return-Path: <linux-arm-msm+bounces-79328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9594C1850B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 06:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CB2B400334
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 05:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233B62F83A5;
	Wed, 29 Oct 2025 05:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MU4iDMhR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNIwgJPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C872DC336
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761716576; cv=none; b=Xpm7o6oqIf1di+yNRlgYrA90i97/i86JAmqz8khwOM63jgWfxevJvN6ZmsCaK4ntuR03dgqam6lfSfX7xUwJg8o3Aq1vpmA60HqUsTo4MdYRh7BPeVTpL+5wPiIUOPJlGI27g0uYW0UiMRKj+cbsJGZDtmCMfgW0wASRjQqVWcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761716576; c=relaxed/simple;
	bh=Hq8XQ7WLCASzgS3W4PqiVhut8mCz2MvByqRttaBS+zI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j69tesHGVYztXoLbOQMPeXLTwWAZ87RL5YLlD6UmhSi/2hO3XsNfqTA5twVueUkOtKWmGD9wYqM4b/2QDCZ0AW52K2gxZYCzoNrNjDWSAFr6QjOFEJqsRYlJG0UkStFGfJid6uZSW6TBL7QqptkS9GVUYrZHxUV1Fru5eghx5J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MU4iDMhR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNIwgJPf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v3qo3755366
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D3bKb0RDe7sqcKTtSK80VBkKPBG6lWJuxoKADwOVxbA=; b=MU4iDMhRdB5gEpoU
	+Zp/rE6ISERvIz42qDt+G461liT+E0ZZsQG2ahU7C/pB3Tsxmq0I+bgEbtZFbCtW
	88tzkOm/7fJSKQc0mtSTOZXt9pG+egYpSosl4TDFJho8DV9TUwreDBl35WZcPuNM
	PtNuVO+WxiGXJrz0gZqD0puGbPRsovLl4RtUpDNIEk5d1OMpX8d29pJuX7B2luXK
	KsOvw+kEvVjocmHouSOl0tiPvHRTM8vVL4Wykob0Km7hXxiACy3oIN6wQtXxXtzC
	z2D7wN1KL0D4AM1WYFcBf/9HUcIRBFzKh3HCi+UnfhMqV9aL0H8Uj5lT2Q/Tq+Md
	Ea5+Bw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0habk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:42:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-339b704e2e3so6220877a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761716572; x=1762321372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3bKb0RDe7sqcKTtSK80VBkKPBG6lWJuxoKADwOVxbA=;
        b=MNIwgJPfnWISd6Ss4T8KCFu6QLph2vMHI2PMMZChFpuGVbknH0ygVVw0AMDDVb3D84
         PDcXFyCoS+Zks4MiKXBKqcbTdf7IyIbqKmdQUlMn0+3P7qEn2VTd9J6TTxCX43icHvCH
         LMxU4RMc5/vScmz2YwmoyUyuKWCYuSnlznVCm7xU9OgK9iv1VwEgiLL9+K9aKQcExzAW
         TMBDNklV0yhgk6hG2CdUojGwqWvfmli300TsHLsy4gCNjyOA5zTuJPQ86eN8wWaV6oAl
         2YZnzabFedMLDWsuEdSuZGeYIkZoHNTAufHCuMJWrawA1zhJTDbsGoKk7Qkm0t1vsc0a
         StZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761716572; x=1762321372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3bKb0RDe7sqcKTtSK80VBkKPBG6lWJuxoKADwOVxbA=;
        b=tw74daJtB2KX8Z1+Krf90spDB8oOEGCnK10hKdITfKWnYjGG3NMzODm/s+VZX/L62t
         HKkdFir4uQVBDWtcR8xoYB+jEMSbQ56JIN9GSvRsb7InnHqgXRFDeuAXBKAUjKZGKn8V
         FmcEAY/HURS8gHxqFdTalPn3uBM9EE4q2DJ1iHfQbtcvwamvjM93SqaEhy7lvT0rSv6e
         P1fc1qMLxFPP8QI5oAeA3mOdduDczOfF1ag6cGzVnjbQb7sZzyGsHkJowhr4CaptK69o
         Iu63LKaDZcmHH2ubGIwJrMqVvQEIFkUM9e7G+rOeHfOblQFRrmbunOg4nVRhS0bmYn0J
         hJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMC+r5i1wTFWDA514czFQ5/mF9W9hAHfJeOqXgHqjKzQQpZanS24WGSJ1j20zx6nP4okcGNIdWznXR6VMa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+HmB4mCosCMyFRlNBMmuvPy8C6nUbZM4WcpesaS0QdpoP0TT1
	oqvtYduzmPRVn0UiQTAr1phhBF2NTTZVEH6MPfhOLGI2JVfrF26/JES1WBH6anKpY7ewbdk9qo/
	VSa9xfibiNhOW7PxCIGXvSyW8VBQQeL9f6PDmHkuBVVF6O63EeP6IXZZgQyUrBSpYPPab
X-Gm-Gg: ASbGncvXHsSKnwC/QCr1ZIzAOpv8yk4qHBvTnXWXqA44Qv/QdnN3hr9VGk/8AtqXJ+e
	l9zxO6gylHl6jmYFrF4D4caGyZmI7Hx/iKPCRVMXiOBAzggI/1+IKgTraynRaXRjK7oMfmi810Y
	zQHYPo3p8tJlOqTYTpDGCnLz3q6beMYxuDcFvxDruSGGZvhaldlI9RLZNjWHQ+LJgH/CZGOFCkO
	Nx42HJQXvIgGiAjJjhekAIAMD8t7OEHOcXss9SfZqFZ5yr0eBAAgTMx4CQUeNlUYQIwaPKGCApU
	a2C5IkPHM5GkFZpbxuPkVn+neYERVTafP3kuz3snZjeJdzLC/Zi9yJkIZ7+svB+kQUKOsY/5DLg
	+su5/mWx/emadCbznj7bqcMp3WlUOD9ET9LWR8QCOGe4OgZ8LtCRbl9I0AIM=
X-Received: by 2002:a17:902:cec6:b0:26e:e6ab:66fe with SMTP id d9443c01a7336-294dedd1f75mr20591415ad.5.1761716572219;
        Tue, 28 Oct 2025 22:42:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0J62yU+cW/tUQvL7VRAYtrnfeGLHRB6xGqt8DJOtnOMkh89UIRroDUUeQ58BKxUmHrLwaFw==
X-Received: by 2002:a17:902:cec6:b0:26e:e6ab:66fe with SMTP id d9443c01a7336-294dedd1f75mr20591015ad.5.1761716571699;
        Tue, 28 Oct 2025 22:42:51 -0700 (PDT)
Received: from [10.133.33.214] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4b17sm140263785ad.5.2025.10.28.22.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 22:42:51 -0700 (PDT)
Message-ID: <a1b02978-8c6b-4480-b2cb-305865ddb7a4@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 13:42:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
 <20251023-add-support-for-camss-on-kaanapali-v3-2-02abc9a107bf@oss.qualcomm.com>
 <20251028-wonderful-olive-muskox-77f98d@kuoka>
 <84ae4280-d0f0-42a2-acfd-e85e0263be1d@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <84ae4280-d0f0-42a2-acfd-e85e0263be1d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=6901a95d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=FnPmbW6RWPOSwBWwTPYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: -b4gC_AwXODUHzb4r8qUvcWdSefnlaNa
X-Proofpoint-ORIG-GUID: -b4gC_AwXODUHzb4r8qUvcWdSefnlaNa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA0MSBTYWx0ZWRfX81MFOnuEPEer
 NG/udX3FQpAwRcKrucrDhf8/6n+UIlFwsemw+J49FIw9POLSoOASFQRfT5EUtNKTo/1+m3kaElC
 RUJCiAkewW6KllOzSbzNm74Dkua75NUXby/hbUrBSBNAiKRR6TdnXBRgHLb/NrtScKHa1bB8Avr
 ua4LHUw163v5wblvAqpUCYI/bX0ao8ugqr85bpNKsyW4oQT/n/vEm+95yXJTPYOk2QUortPgVCM
 Stdr2AgV5TfidW5N3xRtSoqqsujsrNS84Cwx+KhVxVFjr3tY6Igd7GCNSaLLkvuZYZrdxk8eQj1
 FReLK+/3dVOFefZ/L6ISjmWPEzXIK5HMjncpwkM2ruAnMo0rcPkFb+tgNcNwFKBuPupWDYPFQoO
 sYe2VmJOFySDD/Uv4+shfMoLLx8O0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290041

On 10/28/2025 4:10 PM, Krzysztof Kozlowski wrote:
> On 28/10/2025 09:09, Krzysztof Kozlowski wrote:
>> On Thu, Oct 23, 2025 at 02:14:34AM -0700, Hangxiang Ma wrote:
>>> Add bindings for qcom,kaanapali-camss in order to support the camera
>>
>> What is qcom,kaanapali-camss? Sounds like a compatible and you cannot
>> add bindings for a compatible. Instead add bindings for hardware, so
>> explain here hardware.
>>
>> You could easily use `git log` to see how such commits are written
>> instead of pasting here your downstream practice.
>>
> 
> 
> And of course standard comment:
> 
> A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
> prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> 
> Best regards,
> Krzysztof
Will address other comments and follow this standard in next revision.

---
Hangxiang

