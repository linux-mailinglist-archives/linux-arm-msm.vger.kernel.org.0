Return-Path: <linux-arm-msm+bounces-75073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB11B9EE24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA9BD16F816
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5582F5A20;
	Thu, 25 Sep 2025 11:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gw+mVJCJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F10226D04
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758799013; cv=none; b=cn9vIKhruk/S4ce8/HlbyRDWkb40X3khUO9jgOsvAvib5B0Wsktz1Yz5X3RLj5KrqnRR7cOLlncQlhZ4D98zE+v8sRwI8srfPBSD/FRrbf0jduSmrlexQVSdVOKxnLupAeKxRaSYWkAfkrDLhPfcdQtRjOO3CpDce0WCYrXppf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758799013; c=relaxed/simple;
	bh=T2VcPwThL9SXdk4Qmg713JMUFXXSm3tP92DSAIb3VCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lx1XNupcFy855sbyRWnYuvCF7AbsWvUwYfPM3Ysp/7oQVLjMBzoZLLSIMpMYMWZBNjiitvnhYGxYlH1qsIdyn/Zelx8ZzqRRjpDYcScWPENcz2OpQ5ePjYK31oxRkV2q1k2coAMmhPd+qPrplujHE2XSSpHIKuG97cePMMFcy2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gw+mVJCJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PAHrsm001919
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3p1317b/OjiVJS2/YXmaa/8z5cpoRP1b2R07MF/E7aM=; b=gw+mVJCJfSpN45JY
	49ZsclwOPUART968XiXdrP0Y07w/LNlP3ipp517ItnAUM/mwjMnWgtHux6+rdNO/
	vyG1UUfIQbQZT1sajUF95ivCN1UlAeykPFD7TjULiYKEQDjfmnRHfkM93m3QUUjn
	wHTjtBb994uxY3PVdie+Tdei8tjDTaLq/kWMPTLeJSeG5V+Cr+SRY2mG+7DI9VFq
	lbx+0Xo36N40Ua3i+gdJSz6OSV9PTY3+jHlPzmZLrcAQnWNq3cfHgtujk1zox9RJ
	ZCrvQSvUNJLTpYUVljnS7gMTdyqec18Ld1IT19P/59UIXt8IHvDsXgWnPBJazLdp
	L1hDwg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98que8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:16:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-819d2492a75so41321885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758799010; x=1759403810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3p1317b/OjiVJS2/YXmaa/8z5cpoRP1b2R07MF/E7aM=;
        b=hTovR0TNrrDbCR6BN0eHRWNjeOh/YmuQVeUxI9ETaIGs3l+uCC/dd1qNde2ofW32O8
         Qg5sWVvJ9qg/8K+VgjElKSLRklm0EBzJf49oH9nLKnYZhOS97oM1ShwhuNwzFfaq546v
         Ol3zFrPCJWX9gJtOluYzm9AlypkCXiVjk7Z7CjKDv7fmMf4VHsLqo5gCz26Z75ORjB7s
         7zZTeI1j3i2zYpYq3kfny81AbkYqy1KwP8IILem8oG0OYAVKsvpntAHqN2CCG82zS2HE
         XUaUq/y6PSih2lFMqpyO1Oqp8HkFJjDUjmqGdHRbdYrnKom2ZDhUaUn1wHQ7pwb8ZMwy
         GFHw==
X-Gm-Message-State: AOJu0YztcOjAeU4JylQWtR8wHQvqhRP4TzKUpCh2sXOASv1ZE1bAcIq9
	nrKhPF29TEieffBRisjVRnMUv1ehm9s6VUv+k99mRykin0TeK5r79zyguD7cYvgAbqs2PTlJ4DF
	kSkazJ6dLfhkYckPNIoefZ3zW5KVVabQj8k3eZmQJj77r9cAo82eegZtZ1dy+NI3Mojl9
X-Gm-Gg: ASbGncucwlP5It+UkTV77JGQpgRETjpfYSfsBeyvxkRy6cdcF9Pae50ODD2oGRjXZaO
	tXip/qcbFsiR3eiS5YgajQBvntaH8bZZo/JwzeEFAhayJ3Grg918ResNQuUKvIX/ekegtYclokx
	FYXW/TZ98NiILqn/TUG1Dnrzt0K6J7sByG+NDILMQmjZfXME/KHVQ+VmPJN1Dr9ytWypEQ41AZu
	bbjAw7FTlkvZPmT1Y7Kd8a5aegMzVY5rbgozpE9wT05yOtcoronCk48o6IUEemzxNuDNTd+Ze/9
	9UJbLad5Qjo9cGYSGxL+K7gOiuMNMnpg5QhYFTzxsaUWssY3RvvWcQb1s69l9pAmsIhGoFvyIsD
	ifywUe5u5YBEv94xvM5luBA==
X-Received: by 2002:ac8:7e91:0:b0:4b5:f1e0:29f with SMTP id d75a77b69052e-4da4c1adf7dmr24224651cf.11.1758799010510;
        Thu, 25 Sep 2025 04:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNkcG9kfuA/k1nAetJ65GvIW+MEfbUrJraHtBF3h49xihmeaOKctfs4Ii0CuHlq4orjUfMdQ==
X-Received: by 2002:ac8:7e91:0:b0:4b5:f1e0:29f with SMTP id d75a77b69052e-4da4c1adf7dmr24224491cf.11.1758799010035;
        Thu, 25 Sep 2025 04:16:50 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353fa65a62sm147858566b.47.2025.09.25.04.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 04:16:49 -0700 (PDT)
Message-ID: <cd91e7f2-72bf-48f2-891e-4e6cd36b1e24@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:16:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/24] arm64: boot: dts: glymur-crd: Add Volume down/up
 keys support
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-16-24b601bbecc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-16-24b601bbecc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JSA0RfSLVFl1JE7RtOkXWFtI0HGDkSvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX0wZfW5NKiC8N
 2FuAMyqpG+MIjQOdjFi0mox+EFlGg8ajcQvLjndJNSsEqEEW/qkhNqUlLDWX/+M6J5IHSSpC0Y1
 yqdup0m5hUM4Nd14m6Cr2Bjb7BFTE5pT2wNZIhnMboNivnvyJeU5RAHXf3Bbx6BTk/hYSUvgW7i
 Rl4cXwNHxUaJnMmf+d/cMDgiqoqdCsN7tRlE2gU7qx6IiACTO2HgEmMnYbu3THwKAGLBynKiS4e
 bsOO0dRIhgeb2uYAa3P0Q42Ujyw954re68Oj57yljLHSs0lOoRZ2ML0LRJcG4JnSwL38Z2iRo10
 NowLj1Z7vDRVPobcQUH/Seeo0xHHJHG+I54amufBJOmO0sRcBs2x/KfVGcorN6esL/fSg5QKnMM
 v4+OVchN
X-Proofpoint-ORIG-GUID: JSA0RfSLVFl1JE7RtOkXWFtI0HGDkSvf
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d524a3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cz-Gyc_q8kcpoI4PfSoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On 9/25/25 8:32 AM, Pankaj Patil wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add Volume Down/Up keys for Glymur CRD.

Does the CRD have these physical keys, or are they routed to the
debug board?

Konrad

