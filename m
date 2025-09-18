Return-Path: <linux-arm-msm+bounces-74065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1377BB8415F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 12:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11CE23A8E9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 10:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2582877F4;
	Thu, 18 Sep 2025 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xj8+bJON"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D664280330
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758191240; cv=none; b=u1fUONDCZoJ+BE74jbBHKAGGmgfUvgeqhco+0XDlloYyJepAMYBPN8l4ms9ZOCyvmxf1pyT+yujLQ7OSvSExNJIrMg9pBL6bEyjVR9r1crIxkX6kl4du1ipXU2+gv/VSTViLFWZRzQD7sKbW3WWhycr+cfS6Gf184/yNFeZHN0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758191240; c=relaxed/simple;
	bh=SFFv6NEMjbrj0MqTLSIDkcH/Ec5UzdpQKT06CrRKoh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQ/qpeWX/ukopnzDEBox5lFncii1BHud/BGBBNG0s7J4ILKOIc125Rx+oUGPt5HA9LYgrgFndW2C8dgqcKk85/LNDprCvi2lKCVa6C5lGM9GmTGe32FHkRpA67OtiKmxeX4gHSqWMlwzD6wrnVgjUS7G8VZ3HQhv//9OoPzaoHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xj8+bJON; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I5MITH018046
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 10:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SFFv6NEMjbrj0MqTLSIDkcH/Ec5UzdpQKT06CrRKoh4=; b=Xj8+bJON4h6M4tex
	eud08TlmICVdM46C3Tno3WLRmkhsbNqhTgCberXdpoMD14nQHmlRgjlnHEXKF/2r
	S+J8P8/fiV2JZRB6IsymMfqP7fIVxiS7amroKAScOlJUSy1NJomH6IwwfhRqqgj9
	pOsgXIDONGDPuCe7kEo5WyIhMMCjdyDa4Fwe0bV06eO3TXlDh0HbWW7J6QFnh2tc
	5aR5Xo9CkpAv6qyLtcM8feBGEi3aXP90Yd1yJtKNHZXBbljdopXYR3CgO/pfLQXD
	RH6tVxKP7ZDMibIcy25K4HSl0x5HyrBVpYvDWcSssdxiUbcI1LEFF3zkxLigFthH
	+eP9Bw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982deaewq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 10:27:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b79d7413eeso2693301cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191237; x=1758796037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFFv6NEMjbrj0MqTLSIDkcH/Ec5UzdpQKT06CrRKoh4=;
        b=O1Fg4ibOwmW0Xmb5s8Yw2v0A/WMloIHu+leCUMToepxpVZqwQ9S+oHwJ93MS04bS0L
         RAlqAWKPbH3oV7jMIR0c4JVnIcqTVAgjHnm5mYTN+aID12XOWrpXHnN3rS6heynT6RTx
         FcP1xOJfmFlR9nuEoOuxNBLKwsHK/n+ZTy7fRT2mq8+177NY2fS92ezL6ZN1deDROgUj
         2e4ToxMzAYrxcnYeNt1vH5MckaLopUMuOsqa3aPlEgPaKIfPoISF5dccGgFr8qDlq7E7
         X575P/2Vs1NeIV3tpZ7pbaAdOBVBJySMm+IFNTEawj0LRh0EseeM30616prafnCTWQAa
         bsxg==
X-Forwarded-Encrypted: i=1; AJvYcCXw4VZUi5RzrKgbG1fjpNLvt+doo4vtbginYXQRVJtCBfW8htvYd8bZmLbJofPk9dJaGYNJlFEklRXslvpI@vger.kernel.org
X-Gm-Message-State: AOJu0YyZfqUvJbavuccKxkJKfmU5Ou4S4KuN3WKTkgkcpVIDgOYhjPwC
	9uj1YujkHiMTJIrj1EaglaKfgRMuI5cWIhuIP5qMLF9CPHsapjjsrr8TAVABFKtbbZMcUbwZwDl
	dkXf/qRVQdBhW0xcXl7XEXJeNoOQAaQ8h4K3LnxYjOaMYwjnQc8BX0b30Toy3FVFm1066
X-Gm-Gg: ASbGncudjFfgx7NWTnZU/gkqK1InKeVBChqNzFEDl9iQA2+1c91en87jdCd5utHxjRq
	k6OhuvNfwZgF/vG5JblApQzDLWrAqgqc2Aoih+uc3TEC2coEx5yTOb6npAWXGW/61IpSWG9yWkP
	3qGIRU9C6XZCAr/8RDathc85gAhbObI2NkE936hg6TXN0nbu/VHVfNHrtdjFqmwoJTuKK1qcO/x
	QPSIg73kqSV2c8vVjaFcou5ysT23Eze3hvuVXjzGKvBT6W95q2bswv798L+i8JcrNxTnDYjdjlB
	Ak9aQ3iWwNxwO4jmj3pbWGyTEYdOeczMfd8lhwLqmUR+5WMTGunzP9a1yZLgeuxIwX3eO1NKxFH
	Ken/4vpUg0ryhhMQhsFNOFg==
X-Received: by 2002:a05:6214:519b:b0:795:c55c:87de with SMTP id 6a1803df08f44-795c55c8cffmr4039476d6.5.1758191237087;
        Thu, 18 Sep 2025 03:27:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYzlJJuyXGduZqx5WCoB3OgJz/oYERgYQ1D6+IglQ8GmpT3KQfYFFrtxzVLToClE/f0NfFbA==
X-Received: by 2002:a05:6214:519b:b0:795:c55c:87de with SMTP id 6a1803df08f44-795c55c8cffmr4039366d6.5.1758191236525;
        Thu, 18 Sep 2025 03:27:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d1a89esm1217938a12.16.2025.09.18.03.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 03:27:15 -0700 (PDT)
Message-ID: <c5d5c026-3240-4828-b9b3-455f057fb041@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 12:27:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dma: qcom: bam_dma: Fix command element mask field
 for BAM v1.6.0+
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20250918094017.3844338-1-quic_mdalam@quicinc.com>
 <20250918094017.3844338-4-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250918094017.3844338-4-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cbde85 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=MmGnNXLGTzfTIO6JWNsA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: qL17DBlb_HLwXmztsnUDGi73IHzkYzPs
X-Proofpoint-ORIG-GUID: qL17DBlb_HLwXmztsnUDGi73IHzkYzPs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfXyvwN8J/quzO0
 OccWAzJmM1XoaclnCTN87nwxxQ6+g8/HUonQRhRS9dHBBSpNLt8X9BkE7yVL7/h/2IoMB/gkETh
 gs6qqK0tbcyZ7xAlcoYSfL13izhBDE3t4L4pJ/UkCHTXJ4gG3FdHETztBeG0NwDeXqABUKjqO2Q
 DYC37q0mtlG2/+oHeJtM8gzWore+ONNY41JGbzuiCThCjXF8jn9frqlvK5pfzlmmzCdni+MXPXC
 xE6SHdFGpcIQ+jl3xAe+ZXoxgG6uCGGySNWu4vVEdPnxTjfdobjP3vVPWiLmFwK0voH+ZuWb6lX
 wgeZLiX0F+lfoQCwNiwIiaaytSB47mrp3yPBrRTfh1CRCap2VmyeIv4P3RCB3IzNF59+RXflD/2
 +kOpcdoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182

On 9/18/25 11:40 AM, Md Sadre Alam wrote:
> BAM version 1.6.0 and later changed the behavior of the mask field in
> command elements for read operations. In newer BAM versions, the mask
> field for read commands contains the upper 4 bits of the destination
> address to support 36-bit addressing, while for write commands it
> continues to function as a traditional write mask.

So the hardware can read from higher addresses but not write to them?

Plus, you didn't explain what the mask register does on BAM <1.6.0.
If it really masks the address, all reads will now point to 0x0

Konrad


