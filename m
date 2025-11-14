Return-Path: <linux-arm-msm+bounces-81915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDD6C5F5B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 22:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 214083BCCDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 21:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11D5355059;
	Fri, 14 Nov 2025 21:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JA83ryeo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGaEzHGF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B48355046
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763155602; cv=none; b=Th56zJ/dXduO8IUjGHJ9wW+QdKORGc0sILOATByqM0RiA1CWCORdowJ3+a6+wmwaw4XD61n2QOv2HA7G6ehbAawn7TYiKNqj4N9a570lZYD6934BKf1zM5YM0xCQlycwLFZLFX5+0wXCDUDGjLr+IVq3sfBXVBkL+Z6Jo5/4uyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763155602; c=relaxed/simple;
	bh=to7r/JLznATiSuCwafk6WbIxmXJeeJvn+hHjk8MoSGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwkW8g4VWgffeC9lmyQxUm3g7jR+ZqWwe9R/bPdm1qSELFq691+h2aG5HYy5/ce436r7UWgxjXIvnr1NBi8jjSxHcSz4X9oF9joQT6YqxladEnRMbTFlhUCnijAct1l1JtNOztCbgdCcD/YeiStm6JYiTBrb/XNjBsr73bL/8Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JA83ryeo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGaEzHGF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEIQ5l8043087
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/T87TDYoGrkVCJEeJItquAg//RgZZsYJELTi1c+nr0=; b=JA83ryeo8hTm4Cbb
	XP2/TGap4oCxBLKJfM4bb84hYWOD1rpUN8cdu2kmcvzDFWGPXRf8NNqcCFSKiPNh
	IIvNpbRSjleGHK1reKVvylDvssa00CQwYrHfA5w0OdjIP8kXzZc9KfFdAmoYzC8f
	b/ykmBxj/mSBAVKUc8A69Es06x4/kgrx0lduyl3BsdSfxLR+LnhVfLoxUZyxK8gX
	lA9kP8dEDIx66Vn2elLUtiDmONm36ZO44ouyzlSU6Ps1+7Bk+hrggv/dM/A1v56e
	wThoANQetYfD9iq8nsAG2xRcSPdCZaz4FLrzx7vgC9ZEXOOVADbcfLfZjJ+SzgfS
	yLz7Nw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae3t9sn8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 21:26:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b196719e0fso78808585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763155599; x=1763760399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/T87TDYoGrkVCJEeJItquAg//RgZZsYJELTi1c+nr0=;
        b=dGaEzHGFtZVmoXhuFNw+Rt/owasUo1+cXQ3G6dHVLBBcNJCFKEIbcyKVTJxiWKtfZI
         1+1Pv0c9DUpqQvuaKb+qMuAzrdSrGehDzPaWgyHMetnj1K5HzgvlziaO2Z4a15T4N8rU
         cyemcfhwG/NqnSGHjPiQWej3ULCQSJgza+hEfJ6F6up6ezpPZ9HYYrcQinMcSvsUu+nw
         Jg82DaGjvw6wmR920sNv2xgfREahFJGYcHSteq0HIn9nJ43qqbm4QYRW85kCtWlD2TV0
         o8WAoTgpL3OOTgZLh4/Ddj+u6VWIkP6iWYirvBg6F+3yCoQuOjhOAwzEoyqzSXYXokPD
         AgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763155599; x=1763760399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/T87TDYoGrkVCJEeJItquAg//RgZZsYJELTi1c+nr0=;
        b=j5VsQOHRIq3yD5qf2MNC042b7afIur7bh5HmmjjxbowmLQzitCQcP7k8xyt7SKHIRS
         wRWAk1vkfsx8LNac7Pn7aSfzaJchNXnEMkzWfGjbCUZZuvsjCtDptuXUSrr6csOd8rhA
         28fNUJdcKmKCKjYNLvifoMtNo1/YCKpSw0mFz0GtZC6ojhbxQwXUcw5CI1ha0ST6odhg
         8dqZ941Ir59Lb7cnnH+XWp1HRaYLWkT4wjocUq/bO1Qqa+jGXTKudhcb5y8+ZBHYRqUb
         fAr3jECrkfKDoCpLRQ3A5aDBhgWmXH81cqCgclMA0Bk7JfXSgwjRDNKt19bNdWNju0c+
         rCkA==
X-Gm-Message-State: AOJu0YwTLXn87D2uILXbmLyR8mfBGoi3sgIbs6QLIRsNnq4S/Qq7Wyah
	ygne9XdsOFjkaKNeaeiCLzMvntBJJGoEfsKTGX909XwoMWd5ZemLyrXE/68oaEtRwnaXdcsjlMM
	rLmH5d4E3t1nZGSMN+Cd0V+ZIrxoNJLBOVYTCQzoj01orX2vyQeQk4B/t9h0Q0tuWd32e
X-Gm-Gg: ASbGncvyQ+IjP7THz/cF1gOC7HUTOz4pvPmw9TJ7kCBGOK+uUANn6Ua8H3EnMvHk5ML
	0tZDv6+VdEr4sQ2Mvnp3HUO188TcFxU+XsQ3SmTvoyxYbl12dEJwTXF937qzxCpkszdRisOvQoQ
	S4ilfPTP3rfP2HFDD78SBSahsmP4PrWBXBm8kb/sfuFhcVY783CUWQ3VhJJQxc5yCEbYH6BB9mo
	+tjHRHUPnA/iZYUCsnHInS3XFsMnadcTZuSd91iadiNos60f+CmzYAlxRvlp0o5zgJLU7YzwYdw
	o1JyAfCNmZEKzxsLtUoTAG9ZZbUHlZhumJkctjOZkblYhEy2daANbt4tF0N9RkvKzN7tklH0HVp
	k1/wmJIoSwDSjEXBZXYs2PUXFJDn7X0jUwZ8A5/GH8Fp/BFab3g+U0eOO
X-Received: by 2002:a05:622a:148e:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4edf1f2e42bmr51006401cf.0.1763155599271;
        Fri, 14 Nov 2025 13:26:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEukoq8dSiMiZ3oyN1wqbXQhwACBYXZclpv9NtieRkmXcS2fwGkP6a81CuMWAdpurpsl7K5Pg==
X-Received: by 2002:a05:622a:148e:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4edf1f2e42bmr51006141cf.0.1763155598824;
        Fri, 14 Nov 2025 13:26:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad45afsm467492766b.24.2025.11.14.13.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 13:26:38 -0800 (PST)
Message-ID: <4496bc29-b7a2-4e39-8a7a-5850b1ac2365@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 22:26:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tee: qcomtee: initialize result before use in release
 worker
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20251113-qcom-tee-fix-warning-v2-1-915a460e7d21@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251113-qcom-tee-fix-warning-v2-1-915a460e7d21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IOAPywvG c=1 sm=1 tr=0 ts=69179e90 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=oOABJe4_B-9ENYzCjWEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE3NSBTYWx0ZWRfX2wCncPtvz/No
 lHMvC87I3tlh1OZbY3QanACTNlCyExbHShMluEDZV/ua5FdRy+Ds8jlhkoLg5bxk1+wlbyhbMWq
 7LfzfhxgxupiREB9A3rtPy6Lvff8bzGm9ErCL10a1LM9Q6/zGMWYWXAXWP/9pUS0dI3F7UDGPMc
 dCpurFxa5THmqGB3uKVFi6AiYob4H7uGOPChocvYUydnpMvTlBAt5ZDMP/4YtCr/F8HeWX8oCze
 dFIhuARf6XTGAR4JyFhUPE4ODwGSgXCAz8W9mYYohCyTq61prXD5qtGFCBE6n2/VSAKPaky9Yne
 f9oy0LsC8DbxThcO/+JlqAoZeTwBMx2b89naxD9xx108h5V/8X5tKyLgJvAQpGNjSeuF5pmebNp
 DL0fP7AS1APOMFleBcqHf6PJ9yYwxw==
X-Proofpoint-GUID: YlKik-Yc1Syxk6NxisoC8aMNStM03CeR
X-Proofpoint-ORIG-GUID: YlKik-Yc1Syxk6NxisoC8aMNStM03CeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140175

On 11/14/25 4:38 AM, Amirreza Zarrabi wrote:
> Initialize result to 0 so the error path doesn't read it
> uninitialized when the invoke fails. Fixes a Smatch warning.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/op-tee/7c1e0de2-7d42-4c6b-92fe-0e4fe5d650b5@oss.qualcomm.com/
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

