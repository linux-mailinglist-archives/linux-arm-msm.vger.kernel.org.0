Return-Path: <linux-arm-msm+bounces-35933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4678D9B0C53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 19:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56551B21627
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619BA800;
	Fri, 25 Oct 2024 17:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MhvSLdFZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EDF18BC23
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729879031; cv=none; b=SKlNGRysvykPiodkzs/WDFIHCkp0hmgBETBr1SYgGVVWgti1rhgMacc6lPbQOeNgRSXwa8s0aPbvEqpzkk6mKWqGZX1G3OAPVjOTpRzMOgoQaxCyA8iUjo9HW4JFDUoS7ecvQAW9T22ldEwRyN9zFblN0Mp3VrG70g0u2YjlImo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729879031; c=relaxed/simple;
	bh=gMpO0Vkai6llWPqOMIr8YDk9W+uQ5OwhpngfxxWCXzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6cMUWaOSsRhN7ve6u8mMGwHythYemRzb140NW2ohDHWlM4xmJgKQDeyrtfLMjS/TlDahWjhqVRwa0HpKS7XSIzKMRk5kf/25u3qJaDsFwagAllzZe1JdtpsGOczTdESzbFzsOgXsmWvcZVNLTxWDXOQXgu23+lyc9RH9P1Kj4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MhvSLdFZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAcIUE009177
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AHDdXA+eyg5UAQ1TSfoY5ybRjUtnUkQHRF2M1LNd7jU=; b=MhvSLdFZlo2AvkvH
	dsH7lXzuV4t1xl5DBQiDcuzeUvq4v2QRtEGkw61kwCV6lT+d5zsFb676ajt61zEj
	esPn+Ir1+K7vP2iq8RBiBx3wokYsXmBFHaTdc+KuwmQ1rIxYrk+Hy8wj4+oMWMoM
	y6wViJe61NjD5qOlezBI4fX7SQCRBJgpkgdhiTkLbQWmNh4kKYqE+MaS80BVBTmO
	7h43F62eWXikdwPNUSNCG48+EO05gtrm+45CjMU9Ag7HDqOfS1+ne6YALDFvR8SZ
	zFcFF308EbzraTcmqCyfSff1SNsVNHDG+cctKRpM3dm1AvJrHfiha9yZ+mL+j1YG
	hW0Lzw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em43j0my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:57:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2e3063702b4so309165a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 10:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729879026; x=1730483826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AHDdXA+eyg5UAQ1TSfoY5ybRjUtnUkQHRF2M1LNd7jU=;
        b=FRnebh5ekmbEVtPadpkL9jO2128TKeGSWt2MXdTcKdhbqPEVFjMi4Zhep1SXRQHbzD
         1ADOm3MG9/TWqVnfwDhUGI6Qdb1NHdhXUVJwoC9pYuFf3TPh1XJ/+JacPEtYiIy0d5Bx
         0lO7LbmhoKBMkkKNnBDGGeqgVzNriGkU6zmkSrfTDhXrnLFjRfGyqL+W+Rf8/bE9AKbK
         j7ruxcbKoREUXIiLrR+ZvNcpeEVHHvLAVSDsOZC/cbwmLQbYC/GvAZbt/FkV7yEuQ3Cj
         mp/j2wb/ASd1FnY7N1srl8a8gGrH9NMt3DeYcp1gM5ANb2x8do0dAuVcTvn6RYvvjGw5
         JcQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkqe/7fadZRomPR7QFQT7uZ0rxYputE6SQc/ylCNPjU5oCPHHDQmcHdyzNHYpR/8izBkNSs4HQo8QhBhPW@vger.kernel.org
X-Gm-Message-State: AOJu0YwtY1lK42wJwqi36OTFEiGre356wG+kZBgMjMDmWjpRtVCO0VKP
	wghD3ez2Uab5mFB+4286qlyP1ivSRLMAyX8RXXVblHZfucXNy2OurlXODu2tlqn0o9AGVcYD3yV
	QYRZLJrt97A1N4ekHJfiWvUU/2W5n+Pdtc99kvCJB/lEU8hhVo0YY4tiql9HHP+Gm
X-Received: by 2002:a17:902:da84:b0:20c:60d6:2dd5 with SMTP id d9443c01a7336-20fa9e9f922mr64976565ad.12.1729879026530;
        Fri, 25 Oct 2024 10:57:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUdgt5ID+6OGuatRRBgdgKoGN8JxuO4BhrIdRQJam1JkxgkdDPizWMrxe4g3kxsfxwltZwrw==
X-Received: by 2002:a17:902:da84:b0:20c:60d6:2dd5 with SMTP id d9443c01a7336-20fa9e9f922mr64976425ad.12.1729879026180;
        Fri, 25 Oct 2024 10:57:06 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a081d59sm93627466b.189.2024.10.25.10.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 10:57:05 -0700 (PDT)
Message-ID: <fe0ba0ed-0536-4441-abd0-2af277bb9610@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 19:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs8300: Add LLCC support for
 QCS8300
To: Jingyi Wang <quic_jingyw@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com
References: <20241010-qcs8300_llcc-v2-0-d4123a241db2@quicinc.com>
 <20241010-qcs8300_llcc-v2-3-d4123a241db2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241010-qcs8300_llcc-v2-3-d4123a241db2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1VnzZVc1Jrzd4rMgTkVOKa8sUw8XbhtU
X-Proofpoint-ORIG-GUID: 1VnzZVc1Jrzd4rMgTkVOKa8sUw8XbhtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=697 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250137

On 10.10.2024 12:08 PM, Jingyi Wang wrote:
> Add Last Level Cache Controller node on the QCS8300 platform.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

