Return-Path: <linux-arm-msm+bounces-47600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D10A30E7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 15:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA8D716224C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60D124C671;
	Tue, 11 Feb 2025 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBMzsjW1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C88F24C68F
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 14:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284592; cv=none; b=YVPq51mT9fMSXNjr+0CCuiHLMGzXnjke1EbgYQc8hHqmYNWYdx4Bt3vdG+rS9hAf28RmSTBoyS+yBpyBSFqzV66i/iuuU7FGPkEYq7T4e2c+sTWOHCTeumq1NVMGi6mUn71Sm4Q2M9yS6Jvo34M3uBiJs28BYwdCThbksH8ovDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284592; c=relaxed/simple;
	bh=7Ii4oZkOZGYKE3BZdy/K87x7eC+Q8/Yg8xmakzI1XRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGON32bflNihMFeXPIwovqzaLj5x5WmLzfPWCo7t9+34elPCIVApWEINhavGvUKGe6o+seCdU4accZj4VwfRJFUZwPhoZLCpnM1AfM6ZlDVMTU1p/yZ8hjmZ3MOVOrzIGp9I40/QR1/lpSErA4OpK1x1RNbsyJhacjgXDeCW4ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBMzsjW1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B9QrTU003521
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 14:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1WudjrHqQFLXTx6wDZ/8frFhEy4z+ON8ytd3oA/31g=; b=HBMzsjW13/L3niYb
	J/VObtlRmyL4aGLwfXV0eupMOupUvNloVngCbuuuB/c6Irsv4cHefNX/PURZgfWR
	8FnfAiAP1no2lFdB3EcEHOkeyJt4s9TVztSeY43PkuWanNGguzrqIsDE+lNPvpzp
	m6lKjM2JUetNKwCdLZ5ma7okY22rdbWd8zjQ4i1pKxun5hqobdJG6eHYtDHfIVGM
	oNINsP3V9lxnrrrkSsXmIzdWXOui6Wkh6s8DNr/4qRHp65L/vCrFEljxYp/zLQEY
	CbjFwuraDCG6sENmaMTZxyY/TCK910MOqwqoEpm9p4keuRq/Bs8CzyP+lDGx1dF2
	lhvE/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyr2uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 14:36:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-471ad2e69d6so236561cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 06:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284589; x=1739889389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1WudjrHqQFLXTx6wDZ/8frFhEy4z+ON8ytd3oA/31g=;
        b=gN/EkstziR0nWGGW5/rPMx3CchU7aGs3eE3yDs0vY5L1OLbyxU+vO7e5kLGJx26vQA
         wBFxWmB4qlDRydhrroq5MAf/X7hFhXAMi8jWp2kwAbvVrI8UKcQWAzSeBdSPw2JZ7sHs
         q1MDCyXT5jQWZBF0viNUo47c2P6d3zdEtbq6O0ckMyoKxKyaxw/FxQMBiFWG1IRybf4m
         cxQ/u70igGMny3j8GvCgW8DNje1sAllRCCz3rrnNaWK44qgwRkRGbyiMN7Dlm2dueOhR
         jwPKZFXpdL3SJ0OgmlegCKKMIDB/XH//q612EMwAphZv0A2eafZk12BPp/ylwS6mZtzE
         XtSA==
X-Forwarded-Encrypted: i=1; AJvYcCXFmiaSLNVYqMaqu3fbLu5IhIj4EnglTuTfdJV50fX/XGHJFAC8z7FYKTmywz1HoWd7QmBZrmduZFfxu5Zy@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ2D65o425Pj+wQar0wiu6UI/1FEmwZVmZ6Q7pXnnMzhKxvpUI
	9t5dQyOLOvLEtsGs/qd4MAEZX8CW9FhK7AsF0hj49h/q+ClKusstqgni0ZwyBk1cusXe+K4iFV4
	fUg06YJKub791nOmO1/Ntt+oUpxUwVto5z5Bj3mp2kyQuw3I+f88G1sqKNf8ejuK0
X-Gm-Gg: ASbGncsLj3NUt3CSjOQd8Ya2UauodJqgyo8PvrxGRtAQAXwt2kklyHRAc0xyrzwmBb8
	DCGXglcfpo0R4t8ZlYqLF0XpIlcOgwpEkv3IWQfdvKuDWXMbz2+bBClzq/9aYHnvYsa0d+c1J6q
	dvtWSmSqATzAAUdc9W9Kk+l9PiMQ17lllRvE2TBe/fFvyYrrSvBW6syDDH7ILaARfOiQYLtJP58
	/8z0QvHmrIRz0P067TEckWNfHkpJkdjXGO4t3qpVRdcAZuFU+24h/O9Yv30j1FHop61ZPXLMQ+7
	rvqYBDDbqed5uEOB/86JDjEvL4gAIRpy+rtiQshpHhq/Z7HKliPMRULPj3Q=
X-Received: by 2002:ac8:58c6:0:b0:462:b46b:8bf8 with SMTP id d75a77b69052e-471a3e28ffbmr13331751cf.14.1739284589368;
        Tue, 11 Feb 2025 06:36:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBtd/o9zaPUcZSBSJqeNb6V6jDhonTEpK4kvS0kO6RILTzAgiYeOe5mvtHYLZNwbNqBaucQQ==
X-Received: by 2002:ac8:58c6:0:b0:462:b46b:8bf8 with SMTP id d75a77b69052e-471a3e28ffbmr13331531cf.14.1739284588932;
        Tue, 11 Feb 2025 06:36:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b4e96185sm521953466b.86.2025.02.11.06.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 06:36:28 -0800 (PST)
Message-ID: <13f7d30e-9237-4a3e-b9a7-0c667b3e77a8@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 15:36:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 6/7] arm64: dts: qcom: sa8775p: add EPSS l3
 interconnect provider
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250205182743.915-1-quic_rlaggysh@quicinc.com>
 <20250205182743.915-7-quic_rlaggysh@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250205182743.915-7-quic_rlaggysh@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tvHGT9pqja4rYySRjXDLfH02sCfEh63H
X-Proofpoint-GUID: tvHGT9pqja4rYySRjXDLfH02sCfEh63H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110097

On 5.02.2025 7:27 PM, Raviteja Laggyshetty wrote:
> Add Epoch Subsystem (EPSS) L3 interconnect provider node on SA8775P
> SoCs. L3 instances on this SoC are same as SM8250 and SC7280 SoCs.
> These SoCs use EPSS_L3_PERF register instead of REG_L3_VOTE register for
> programming the perf level. This is taken care in the data associated
> with the target specific compatible. Since, the HW is same in the all
> SoCs with EPSS support, using the same generic compatible for all.
> 
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

