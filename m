Return-Path: <linux-arm-msm+bounces-45976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B20A1A426
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 13:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16A8718894D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6299720E6FE;
	Thu, 23 Jan 2025 12:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XAz6Cuoz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA4120E035
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737635209; cv=none; b=GtRtJ9KuK0t3htzsh+d34wDg7jDgRzMBK1Q4YjLrTmHuST2wiBEXILUA5XnlxGWn22h8abadsSdgoWn6jB1h951mXzjrsImWTCnBYZnOBVdXN56n69ULiwwDw22wzzti3CVgFFLmYnDwNgyhYXKx32R4RwwEeOR/3x1SaXKPne0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737635209; c=relaxed/simple;
	bh=G+QKe8FfMJCfm1MlKvKWgZRaCarwwrdjGyBdzMRS4WI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UleQ0PbWYFzO4olJXzu+ohmsDOqwc4NwJSaiV7p9z7TG7lVY0o8TSvFGOjAAzofi0oGsTOMYA7H/xN4bLLBDrmV9avnblXe/Hxc7pJZRhrDypy18Tv51Y5bsWoBjJ+6NvBzujvkM8H/Y7y3/QfWz5tuv3qAGcpWuPatpVBZGG8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XAz6Cuoz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NA2cEA015164
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SVZW13cVN8pkSk0oQ25DglUpIcmodrG5JxW5IFgDsRg=; b=XAz6CuoznR6A0BDV
	EP1lnsI5+XxsQvP7/mWfoevtCzh5G/Z4zQz61mB6WKvYciXheynUZidMBXp4g0ik
	mOT6RK3D+zUVWgpficLDHP3hKWrYds7nLvw2poUbNse90jNpvXfoup3PQZGW+hFz
	tAmyi74nkC3GiOC3gEOlH6R1Fuj9Q/TTyECjW4YAYHlGobCtqEvSI6hA/PU2Vst4
	KBSVSEMlVAy4V8G1s60kVx/naoPZ97EOIHHr3xZJ4soYF759YXU79HTyvuDh+OaS
	WFGNvt8/pEDPYAxvcaruhrwtbjBN+rH+bAAhd2bJwDtEHx3U6d4PkTxejZ2oJaUB
	Y4giyg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bknxgapy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:26:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8f15481bbso2144796d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 04:26:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737635205; x=1738240005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVZW13cVN8pkSk0oQ25DglUpIcmodrG5JxW5IFgDsRg=;
        b=kHciggglHeZ31l+eYosKDK6FhJc1clPTUIHauFOVIwFP4KWnkdqzLFyDZLPYYVzL/u
         +ESosuki7ubJkIoXjeD1n7OExt7aP24Yf80Q7hYYGDRXPSExupYSHcohxxHlXdghy7TE
         wEhOO/lP2Gu7YvXHVwN/Nt2l3JlS4V2lgZKL1dyZAqqX1kxrU9jNLKukhiJhgPzRCJhO
         qZCDskxSSpGCb1RzyGkmkGjrkABY4mEfT5NB9OHD4uqMiaxhhN/aT+pKGkFUDxml3aTq
         wBbQyO/2P86Tmt6dzNSBOisjutMwNF1umxkJ4zs0TWv6hwqZcw6MU8GKIT+J75iHMkUz
         n3zA==
X-Forwarded-Encrypted: i=1; AJvYcCWzHlXHogfPDl5MKGN7fiN8GlylkTJObyM068QlxJbneg0HtufVP+ByGs0Gh5edNKEsDayErb/jYfsNu3tF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7xXSwcrMNHIOx2EPbrkgCnEZH5kkZT5tlrNpD94JVlKh+FRdl
	1a3NawsctTN1cN88zUQa4Z/5LcZL9g3ZEb5uhWyPeguy0JUIGF9AQ/mWnbOQTo59Cb2yY9rbvPc
	/xsd6ZmmhDmum+b1zr91DyIcvCpdYZxNX3SoWYdbaT9j69jOjuuLe/CdBMX3WVdcd
X-Gm-Gg: ASbGncu/u1VRAu8WTbS7S/SCTUypGH9+1DZj1Zyjb3ClgTIU1QfoHHKbdUYxqx5GapI
	sZ0z8LFi3g3fdnbbQLLDNjes3r4fjZJN4o/iEihYTDfGJJkqPI6GG0M8CeYOLQ0mKOdqOOSYaDj
	/l3HWf3dfBx0Tj47G1GXHMqA+Ol/xETxi45J1u5ASSj7E9ROft9TK5NTt8I+u/3LNGc/66+j4Qq
	0sgMjfNkJ7oFOxccyps+Qxdxi5d4iXNDbKjBFWm4TWQamstfdyQzL01PPt1khS9z6+dnFklpYw4
	pGk1Mcg0aKCPLXmXbOFEkzwCu3NnLXV81EYeqy8rPQ8eghZu
X-Received: by 2002:a05:6214:1cc6:b0:6d8:adb8:eb8c with SMTP id 6a1803df08f44-6e1b21fdfe3mr142360556d6.10.1737635205202;
        Thu, 23 Jan 2025 04:26:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz7Y8CusS4RA3BkMNLMi1X1MQwL8uOIZ5Z83f5hBMegoiNhIaOyMr2v+dC01obzMP3OpsYeA==
X-Received: by 2002:a05:6214:1cc6:b0:6d8:adb8:eb8c with SMTP id 6a1803df08f44-6e1b21fdfe3mr142360346d6.10.1737635204866;
        Thu, 23 Jan 2025 04:26:44 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f223fesm1066630866b.105.2025.01.23.04.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 04:26:44 -0800 (PST)
Message-ID: <3b085773-bc6e-4d03-a9f0-8f8444bdbd45@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 13:26:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: x1e80100: enable rtc
To: Johan Hovold <johan+linaro@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250120144152.11949-8-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250120144152.11949-8-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hQVubruR60tqFV8OXM8dU40IXqbVT71C
X-Proofpoint-GUID: hQVubruR60tqFV8OXM8dU40IXqbVT71C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 mlxlogscore=741 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230094

On 20.01.2025 3:41 PM, Johan Hovold wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
> 
> On X1E based Windows on Arm machines the offset is stored in a Qualcomm
> specific UEFI variable.
> 
> Unlike on previous platforms the alarm registers are also unaccessible
> on X1E as they are owned by the ADSP.
> 
> Assume all X1E machines use similar firmware and enable the RTC in the
> PMIC dtsi for now.
> 
> Based on a patch by Jonathan Marek. [1]
> 
> Link: https://lore.kernel.org/r/20241015004945.3676-4-jonathan@marek.ca # [1]
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

