Return-Path: <linux-arm-msm+bounces-39724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 096EB9DF146
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 15:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3214281303
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 14:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBC219C55E;
	Sat, 30 Nov 2024 14:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPSnlZhO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00FC15C15A
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732978117; cv=none; b=CjWzdx3ivaPTiHZdyS+9BUPeTuBg0t8hgoBa3+rpY+R/uOvSGPC1HnR7dy3dsUzoGmiZB5rsQARsTRwnmgott0r4VEfgXZszsdff/zX5so53enUqLLct8xq2DarGoilA/x9fAVWiN8RC9o0aYIGbi3m3zz33dGUptMCerY4A3/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732978117; c=relaxed/simple;
	bh=SxMKZqWHINuMIWk2ERrR36po+nHqNifEB9pvK/kYI2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lyG8JhgcBTlIxVN1WQTGiAabgk1YwNiB9Uax8tUsVYR5T5LZeLIjUxeh6oRYoYCgEy5W6vOcaAK4Ndq04YTcTiCAQx+OGtA62CJBj8rsk5UG3he6TXOvns9GNL2JJMng9hTBwwIJqcjIV1MsexGjC51c0vxerHLUc58qz0oo41c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPSnlZhO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AUDlNao012254
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 14:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zbg7/a8AqK410FZRMTiXn+gGp6N3/qpdAoKw9aQPDA=; b=cPSnlZhOmCSuNKf8
	MOcZ7IfdAGB8gnU9/BqK03ExM9nLkh3UW2rLySGRgXXjw3C+ry1YJhCeLh9Y5yL3
	K5YJ8reZicLXW3YNLv3i5YyFScbiAvJEWzu4J08VodkendnU58ydgULvg1rjrf9m
	QeVf2JYkhuVt4EduLYMnBBlNrzZnMSZkfEg3rQxFmwV4/SCznoIZcSGT5Uq7Prum
	vDOBYpLRqZv4ledSsI+4fuHsPiEbISXDDYI2Bhq7lWbCZSLg9r3qgboMizbVR1ao
	ZCvoC9BiKCEbBeM135rcMIbaQ+IRSDmgZOFZHCIBQkxMgB6T8pVweUdRpjazLIC7
	BGFqPw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437snqrymn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 14:48:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d4276c099bso5150536d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 06:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732978113; x=1733582913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zbg7/a8AqK410FZRMTiXn+gGp6N3/qpdAoKw9aQPDA=;
        b=dNkKEH9efUaGu4wZE2rgP3Gvam0ae8weL8izCCfLKR/B6DbAU3DJVtvg7xEnSlxG5r
         NvynmYDVx6EyFcdnhfPYacPqvvx9noO2G5ZwFZbghxxJpYmKkg6nnJOja+7FR7YMynFy
         otCw6vi14xdp7/jXOP3QENHfMyj5W79wJjrAsQBXGWWDsIKR85WZ+66F6oofGPCUaoH8
         w5FVMA0w3lNNv8g4NCaBCEYrpV2WpJ+ZiacWU1E0rk90GFer2q46o57fi9UW/p6pCkIP
         fqu1VHBaTVpZEcmgAOY8RVjzqb4aM2fIxCwLn+ZbTL/xdZrRd28P6/UVixvnkney8tJ6
         yDwA==
X-Forwarded-Encrypted: i=1; AJvYcCUdvW/lH2vaToDONvyJr/9umJg0lr1PjBaq8w4hRqTmvVDK/F89JI8qo+3mRyHSv8KsuiVOvtRYbKdtRFRm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8x1ZoYndiBWhfCODru5yFHOEa7FxbBDkEeNXDkwlIRBroQHbj
	IU2iHg3QgRiCwWiAoI4riY6++PS03InzzqdxR6kDxEqSJ0vWfZ+42WLuA6q6Dkgu867HztcQmiM
	6Ci0veZYbfbgT+V6r4ONMcX5YIWiQGCyL32PhMr21MUYCfuIO7+R4CA8ffi4TttMv
X-Gm-Gg: ASbGncsM6KWkXKB7hmdIgt62diEYs/sWm5VjyPtKvC8do1wGP7WYQNuh9oGK7q1ULJP
	4bDsmcXJ4Z7zmE3fx5RMt67KFgf57VUleqgHWk9fIZKeZSYbPhnXKmdJpH9oD4wyuVYBybS1OPn
	yi2fSNDc3wKGTc69IjxE2igCtNq93Lkus3Zj00xAakJXubnsz/WY4zvf3cAeE5odStOe2uwyG8V
	jjj1fd1OdFQJVcY5DVflDy2VViuHHEd/nrhd9+iU1Wukb3mb20CVqXQsJA3qBGOFGArNrYiX9KV
	McC2SVhy5snIGvjBPeHGN+2klylbyUE=
X-Received: by 2002:a05:620a:400a:b0:7b3:5cd2:783 with SMTP id af79cd13be357-7b67c2ecb97mr812515985a.5.1732978113488;
        Sat, 30 Nov 2024 06:48:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeY8KeawgKDJwviovT2Bn0JoxwOM88gdpGWgJSdYTdl6Hh3GheAU3zBCTDOc9MEO5DqXkVhg==
X-Received: by 2002:a05:620a:400a:b0:7b3:5cd2:783 with SMTP id af79cd13be357-7b67c2ecb97mr812514685a.5.1732978113206;
        Sat, 30 Nov 2024 06:48:33 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0ac78c0f2sm1964681a12.10.2024.11.30.06.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 06:48:32 -0800 (PST)
Message-ID: <a76ef7d1-8407-4ec0-8180-83ff39cc0487@oss.qualcomm.com>
Date: Sat, 30 Nov 2024 15:48:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: ipq6018: add 1.5GHz CPU
 Frequency
To: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241110140019.3426181-1-amadeus@jmu.edu.cn>
 <20241110140019.3426181-3-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241110140019.3426181-3-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tvcWpBXuun_vnDqFWN-wqIexrLPhTrr8
X-Proofpoint-GUID: tvcWpBXuun_vnDqFWN-wqIexrLPhTrr8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=688 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2411300122

On 10.11.2024 3:00 PM, Chukun Pan wrote:
> The early version of IPQ6000 (SoC id: IPQ6018, SBL version:
> BOOT.XF.0.3-00077-IPQ60xxLZB-2) and IPQ6005 SoCs can reach
> a max frequency of 1.5GHz, so add this CPU frequency.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---

Similarly, I can't seem to find anything to back this up

Konrad

