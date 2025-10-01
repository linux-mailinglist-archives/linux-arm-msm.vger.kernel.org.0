Return-Path: <linux-arm-msm+bounces-75664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D27BCBAFE00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 11:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ACEDB4E1069
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 09:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA392D9EFC;
	Wed,  1 Oct 2025 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1IDEJh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8942D9EE0
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759311319; cv=none; b=BWQcIs6ZR+5vwO010wdJnHWQnxAPKiO1qlO28M8kYlq8r7gTkvieGeOVQ5+PfI7TIS1Ftfd6pqUDzK4rId4kHLUfOLukInaHTe60u+Kj4AZehABksQJwbDhFu/JK/rZ/O8X4HuuluuwotX71hX8spF6pFU3CCgzFDMSxsQZHqa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759311319; c=relaxed/simple;
	bh=clodCt2KFV7idC6nf+b0UvwIapnLPbxEnItnIWj7QEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SENnH4iEPCnDvLT1KSeGk5pKXfjIHUIdbg+vGmoWnb4X20I7L6/DtiE7YoKCcMay1cmYBuPx43gvfaPsnHUw4Ir+OX4enAOHeM8oL+p8QMl89xiRZ9znM+aGwjhZxXj4pk8GDMuF6fu738KeFn3kpbWAUQEdCgQP1TYkues92Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1IDEJh4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UMII5u017533
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 09:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDF9dailVTb9C+8g1Gxz0cI5TBD6wn76XGlSDfVLb5s=; b=R1IDEJh4EBryW4Sb
	vT9pxjcQ6folIvZgqA+UqusGWBLRXww5TIVxaPn7sLYRgwjLmUkrq8+zsvRI6zKA
	15jaPB+YRd2wsCuJwJs1UNNYjyctsUFM60nIxHtQ1uYrOeboFRQwO7cTqcslIDv0
	AYFqiFUJijfnhIwtIR1Gf0FdEjp6qg1EO/5BWc4F4EN5+Y6VkJnD/PbO6zBp/c8B
	0vi26cHbZqTwqJYj1R8XJ3cPWpShfJa/P+nK1zMHHmpFP+yrxcNooVzKaImHHSlf
	EL2RC3URhNiDYTX4OgtZuc80r2Vvm//aIcBbUXQPRXcBURxGietSfJUTLM+d1B2c
	SbYJvQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tv7ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 09:35:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-269af520712so75637275ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 02:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759311316; x=1759916116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDF9dailVTb9C+8g1Gxz0cI5TBD6wn76XGlSDfVLb5s=;
        b=HT/P9BVLYA2en29W7PNzkPA/9eJ5ckbZqeUIDo5Q+uQIsZ76LP7tNoAMdtuR19JUdC
         miiETm59Tr/fUsz1xR+8e+oPSj6FNPTMxr26wGzrw4T6lir8Ygn06eI41fPzERF6ZKqP
         DyZslCYXlzIPW4MBVfq8oy0XbSBT63hnIdqAOYcgtsymP+Hgz6RTgoh56I3rQTHNGkRq
         moyxJFVBATnqeGQ+UJKb4VPd3mzfBWdhzMqn7yaWgggzVFhFblbSG2Su5/qxq5e+14sA
         0UZll7xmldYrUvPS0yvzD/5Tnsfe2pktICtfTYKwuUdGxEz2J4Y6VgUqdya5lY0XI0Mw
         7+Ig==
X-Gm-Message-State: AOJu0YxH3vRsZx7ZWCaliPaOQ8YdhxTiILijdAlN8l/AO8a5MjTr0tmS
	LTskNIM5Y2wHICQrOqsAXROiC0UZDUK22LiWsnEmMHzlbBjySOUq21GWj9bFBDe0qghygTQroRY
	7IaedBjF2XqBGVWO3lWp/cpxw5GfcbZV7yzxzOtw/XWjW4D+G4b1vBXL5WVqMCUmKmxJg
X-Gm-Gg: ASbGncukvc6RVjqlqoXaC09TpztGTnPL1eAmH4L8B3dTMc8FFKILzlXRFP5KMuV5uvj
	R96sRuEVisb62Ddv9vOMmVtl76iJgUsH4UPAtj2xf4E/Xj/eMet7iFtCtNZJOAB0LmU6JqtE6e9
	wSvZMZP908SMg4I6IIOP2Rbc1PWWvIA1+k9sT6kJKR69PRg2o1IU0jJ59GjG5CS3wdxxUhDxGI5
	CcOFNvAqbtsRseaq2SkyuJr0jJhuqiJQns1xiNppKC97eoRrQtWIWduQttaZ/wp3adNdh4Grye7
	xfmf1XhZ/prlnXR6hZsgCkbyZa/EX/RPiRS7u+Go5fEKKBHJTKuFrDSQn2rMJy081HIru6yBaGb
	08l02
X-Received: by 2002:a17:903:2384:b0:26c:3e5d:43b6 with SMTP id d9443c01a7336-28e7f2f4ef0mr36261295ad.32.1759311315781;
        Wed, 01 Oct 2025 02:35:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYUv/Dm0XesDSTyHwQm2dVe57hhTs7K33D3ebSSuW0U2zhQHMjz1FXWOI+Y+NBaNAKCKO4DQ==
X-Received: by 2002:a17:903:2384:b0:26c:3e5d:43b6 with SMTP id d9443c01a7336-28e7f2f4ef0mr36260875ad.32.1759311315356;
        Wed, 01 Oct 2025 02:35:15 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671d8c6sm181633145ad.56.2025.10.01.02.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:35:15 -0700 (PDT)
Message-ID: <32fd77a1-f352-4f82-be18-c978fabac280@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 15:05:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX0hKWjJYKXso+
 hJ6PPWos+7GjZZ1YHAwj2uoAPaJK36EWc6FXLsIMmi8u4paY/HwZ0L1K+8/2hggkMJvevwpd0I8
 aVpIB5G7gz0fBGPgOVdBbAi+Kx1eyOV90Fx0pbMeNpPToqtjO0fbQ292/3E4NdFSjtw+haHB3WX
 coBb3BAi4NWXTEFyuNptkkD0U1oi6lVi2H4BMv9ksKXKbIet/sN4k07NOxnAjvaXJo9hksom0Lm
 jvWNPQarNtk40lDSO/YgxFb6th/Hhru5P+0bpyOJvJxu2ImEI6zmYJ91kmYfDhGot4B5Zln3sC8
 daAnoScjXeUHEzloYEAGoYp+d+jrj5jtHTuLsNS7mX8xuPtZlGObMseLacXGaZq4GLtIEJmSN1h
 3lf4J7EGEaaA2MQuYtUnXQnLMUDoXA==
X-Proofpoint-GUID: w4OATKce2xALMhPZhV2c67B8WuYyktTW
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dcf5d4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=fvgdV2PV7z-sFcuOFeoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: w4OATKce2xALMhPZhV2c67B8WuYyktTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029



On 9/25/2025 5:30 PM, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>


