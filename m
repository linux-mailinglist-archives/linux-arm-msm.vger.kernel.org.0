Return-Path: <linux-arm-msm+bounces-62445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19019AE825E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4725D17B9E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CE025CC47;
	Wed, 25 Jun 2025 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNBD/mXc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C901B4248
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 12:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853334; cv=none; b=R7NxzEjAxX2B6/Kibwcz8KPuA5kUEaHDtjrfVoO8N8jDagta+GJynuMpGa1vOc2IrTKeCDlfUKHi6ypvnD+tk77dOX8LDhoB/fyxAxBxTT8wz9dNlsIf3UlPIv1L5VUOiy0p7tZaOZCMFvxkFlfYm9zUxS16QtxkJ6wzxW3wO9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853334; c=relaxed/simple;
	bh=XjUv8TaY5yIBH6/CItLrdw8sZu5ezM4kHakd8j9DWGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4jsjKt6K98WbC59RDPwjDq1l7qfVPycwLA0hzQvP6KDHynNWcAP5ReWHP218QIivE+426WC8Ht4IrFb3OPgNoKgNiMQCn0uAHj3W1ZGCs8bOy6v5kuufTfn4kZZY7lpibMGFpANAD30W+ElFvv0iPqjE+Zb/Q55BOJmR9pdAVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNBD/mXc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5acP9015282
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 12:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCaQnVyE91f9iV4YWIF0jVhUsTexB56Na6nrOBLs+DI=; b=JNBD/mXcTUez4djY
	XllbM8spH9REuFkvl4zfaE8jU+BdZV9IO0aa8ATHclLiCyHA/E24N/3DoHNB7IgJ
	k0UU6MBhmMHn10NsFiqUmIiKBMVXF/X9SPy26jn5n1oC7C6BmXai+E9jMTr6D2+Q
	QeKe90bcHEtYZcWZ4ZoSwdWwCIuJP9BT+m+RD0tDRIhzedwkeVWA75WtAI8ajAGx
	jSKKGqwuH9F75KEaL+JqI4bbmGWRPjpJH01G3f9b7j94er9uNNXJZObIi253BAGr
	46EMIER8LVhUVSHpBfMd4us36jmSr7TZP8snOlWOtrFc04k1UMxk/F7vYt+KjLLp
	sGEiaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4s0q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 12:08:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0976a24ceso204045385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 05:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750853331; x=1751458131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MCaQnVyE91f9iV4YWIF0jVhUsTexB56Na6nrOBLs+DI=;
        b=Q5AKEXVxFhl1tMPBOEBewY8FbAmWWdL6grrcjxRFn2Kv4sqxpjgz6HtEEX4ee1sXPt
         y0Y7+Oh7O3IfcRrIbr7cSp1YhpcqN5vmOPxwf/9/rMZsLyv2w7fAj/5z9eZ3gPcuRw4x
         sESSDqRFsFG0F8eByioQvy3tM9tx+14E0mmhYknmilvkbjXIV1E5qUGkjeRipV4cpXVQ
         RDtQF3t2MxO9nVz5m533e/kIFLVR7N8a0qYJRHP6ncwcKfnrvjmzfP6NFJsesKhg5aS0
         MFZwAlRfemqRJD5cP+XIiUfOiPDYx7PMybdSu0LhHSAh3hKYOv849QAbDP4NfAtpejSt
         Wzgg==
X-Gm-Message-State: AOJu0YwDyQbyVL/rjCBDnjv2GhA0kmNLREWlSDOCFl6tMGDIj1wMfVeF
	OWYXeyTGzVk7mgxLwB+e/+nCtWjpNGms9WnwKOCzNIDLUXdRGzcFalLVpQqvcuSCaSovhC61czD
	c/D0JDAKkscPG+6MRC94Ef1XebDdgIIOrPn+/rIDDf9iB42PVSQHpfPtBEDctOYFc9Zlo
X-Gm-Gg: ASbGncvJtziPlCI+E4VZ7o3aQWgrZewwRBYAEfN/DMSH21HPtu2InozqaiigD58Zeq0
	QwnCMVU3ZiMVExc2q4Ro7TqF/Div8L5ZgTzgCyR2jlLrnBpwfvrAmEbOLu39tj4T+6ahml6SDfu
	04aY5WOEawm9K+0aWY0Uk4594EGKTe62Sdpxn0LCW/X/S8HI71Kvx0cbn693Lj4twkkrLe0s/AX
	TGUkN7d3ml3RlsoeKupvla6LSkkpxk11esmqUQgfK8IHlFz/8iOWiImJZDTav1knYNpIrkm1Ltq
	x0sRe9Q2TkM397UU71y6yQooOHrhgVfuTlgafKNI9364wxFSx49f7f1LAJ9H+xcNUzJ2RatW3y3
	4xUM=
X-Received: by 2002:a05:620a:2982:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7d42973eae3mr124360985a.14.1750853330621;
        Wed, 25 Jun 2025 05:08:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3HJQWTbVAQpycWsnZAHVSDsKtE3FEka4f1RNXtv6Ih1VXbB/6c7F/YrjduVB5TAz9qzKGHQ==
X-Received: by 2002:a05:620a:2982:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7d42973eae3mr124359685a.14.1750853330227;
        Wed, 25 Jun 2025 05:08:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b40c3950sm220037666b.141.2025.06.25.05.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:08:49 -0700 (PDT)
Message-ID: <b1db543e-f33e-4162-8de1-257084d282de@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 14:08:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] firmware: qcom: scm: take struct device as argument
 in SHM bridge enable
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
 <20250625-qcom-scm-race-v1-2-45601e1f248b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-qcom-scm-race-v1-2-45601e1f248b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685be6d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=a_hKpt2S6j2HhseFbdwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ItO1k0xFXmluUB5Ba11TDgFDD1IPYCYI
X-Proofpoint-ORIG-GUID: ItO1k0xFXmluUB5Ba11TDgFDD1IPYCYI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4OSBTYWx0ZWRfX0+8wwEpYAZnx
 +PRdFgAZjP4NT0VnOQ09Ar7TtpJXBqhhK/pfvBwoDXUn4RiN9ao3SCAgyHCCBUMEQbJtYOJWb/W
 cPCB56lwTJ1J1WJap3Vsip1tkmq9jXYSrEnsI7Om/uMzY5SfYfjUgw6FBT4zRiNNAhQU5BJo95t
 w8XnUhnC08IcXWz4I2L554MJA4X87ZHwgskCWYsNhj4Xoc1yjoOBLsAiNNKx2Xngov1FsbXRm1n
 HgONatW9CupsI5skcK/3WnRUgqzJPT9YXmAs7prahPMXtFDIgrAX5+hsvVsVM0v2pF3+A3/rXQL
 HpHnh4fkJ94SyOcso+LbNz1F1COfMrXuPmle9nSat1Mo7M+58Fm/xe6XmLTCYwO2LXzRQGEF9xt
 dp6B+W0eyzVdAgpdCHTyi4XWJMil1sYUnu0HjxtgR3PIK5GG9TMHC7kHQpmuNKGODTRM2W2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=850
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250089

On 6/25/25 10:14 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> qcom_scm_shm_bridge_enable() is used early in the SCM initialization
> routine. It makes an SCM call and so expects the internal __scm pointer
> in the SCM driver to be assigned. For this reason the tzmem memory pool
> is allocated *after* this pointer is assigned. However, this can lead to
> a crash if another consumer of the SCM API makes a call using the memory
> pool between the assignment of the __scm pointer and the initialization
> of the tzmem memory pool.
> 
> As qcom_scm_shm_bridge_enable() is a special case, not meant to be
> called by ordinary users, pull it into the local SCM header. Make it
> take struct device as argument. This is the device that will be used to
> make the SCM call as opposed to the global __scm pointer. This will
> allow us to move the tzmem initialization *before* the __scm assignment
> in the core SCM driver.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

I think you'll most definitely want to leave some comment about this
intertwined chain, or someone is sure to break it in the future when
doing some sort of refactoring

Konrad

