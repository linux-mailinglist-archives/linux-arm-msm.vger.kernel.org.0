Return-Path: <linux-arm-msm+bounces-35988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 983F79B16F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 12:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17878B21766
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 10:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B87C1B78F3;
	Sat, 26 Oct 2024 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RbqzqQbc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0D51632F1
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729938051; cv=none; b=rxvD9M4ZsBjcm4Jk3o3VeL1w+UOZaMYVOCWFCyl+gFZEkl8ZVmIWVrSmL1DN0d/6umv15n+Jqli9dGFInN1AFNQ/5gORpLbvuPlAlU9CvPK+7U3Ekca7WWE0LPp9hR9sM/Q/MOAG/GGbPkGCVZnAlHP0lduVD20rBFgZL3WA4yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729938051; c=relaxed/simple;
	bh=Rgaq7ReqIAQTm40Lwr7SvibuzkW5wbR9WU+yEHhQ5gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFaDqP3coewhKdKc7vm9naCFoIZtx+8f//IQabnRx9Qf40MKlIpa+L8yv9EHmWHaHurQz3UAr6+kRyIlnfibcUMcWoWX1zZGKWgBM7Ta3aZTXvMj3DpIQ1P/6QV2jlBqD10u9iuXTUoSBnlfRy5G9VM32Ztz2txfX60j/h9pYuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RbqzqQbc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q4F3rr006180
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UdsYLf/p3CQkr1b4rIZAdrrJ1e3MWxNTEnsDId7lgG8=; b=RbqzqQbcLBbtqQTF
	iwlHy/k1/epo0FYSmFHRN+JzNUdLMqsZE+BsTRAD9phq4vzjMRWlMgwIcGv7uAk5
	AW0nNS34AALofTfEYcw/MowVI170NwoKnVjXzxFQxQAsa9Z7ceePB/ZvReffoXcJ
	Go7XAJ6kb8Dm6BP9RE7ciQrrRoD/HmQ6vJVlRB+QOqmMIWu3HECJocjBysumWadd
	PJ1wVtZ1w3kalTmNM29kgSpVFnu1pc0lUc/DWoaxkSdpQA/0kF0xohRo5SHwb++h
	wqQa8wgJN/ycsS807EdaOMu7Q5xLUkBQCVXjLyY5y8M29NyPR933utwkeXybkMKf
	XqTKOQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gr0x0r61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:20:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbf4770c18so8703766d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 03:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729938048; x=1730542848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UdsYLf/p3CQkr1b4rIZAdrrJ1e3MWxNTEnsDId7lgG8=;
        b=nEoyx0vy13GuhVU33AqxZFHJWIJBlCA1FnlcBfeDqSbsjHdnKcGchDxp/5WNd3NFyR
         jDjP9zRs7cr+JXLk5QGfBAVQreVzkh4RGJ+nLgNZSUaGFqeCAULgUB2R5QmqN4bz2N21
         weJkaaOt0cbj0V7xvGMlMdeVgLwA+RNgyNkkc5Rtn0XsdU6V9wNsm4pBy7f+2airS7f/
         DPavL18HMIRJ5ZcOQUzxyXp5yfiTeSXvBfQJst9WufKEqF77/c4BvC/+O/PELy5A78sV
         ycbrVRsN0FSfTdBJ+NCOffaFFcXXCKAnWKYsuWXo8Z1MSfyjaqUsX4FjtMQQTuT772Xc
         3KFA==
X-Gm-Message-State: AOJu0Ywd6ASrFUwlVo8CHYuH7N0IwEFzNRQWW8C1ivFZC4bkgWC3k4GX
	iB8uASzJQEfenc2RLJQk2pANeaGr3Q+GgRpPXxn1LTUcWazA5Ct9uTI5HfieaaJ/kJVAJC1uSGq
	FB8UZRzNANg7kuR0swcIP7PGoxwapYDSo9zaz5WFLc9Gu0jAG88Sm50wycrglYUd5
X-Received: by 2002:ad4:4ee2:0:b0:6cb:31b8:43d4 with SMTP id 6a1803df08f44-6d18558d937mr17693076d6.0.1729938048106;
        Sat, 26 Oct 2024 03:20:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvq6DKxhjnd3S8AuLNtEgeBFkxylZ29k9JSPOQ/x2U1+UIqTqjZ8WzJSCKHMD/gnZHKKfXaw==
X-Received: by 2002:ad4:4ee2:0:b0:6cb:31b8:43d4 with SMTP id 6a1803df08f44-6d18558d937mr17692956d6.0.1729938047700;
        Sat, 26 Oct 2024 03:20:47 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b2f965d90sm160642666b.154.2024.10.26.03.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 03:20:47 -0700 (PDT)
Message-ID: <3bbbb028-83ab-4096-a67c-4d7f0bd73420@oss.qualcomm.com>
Date: Sat, 26 Oct 2024 12:20:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/12] arm64: dts: qcom: sdm845: enable gmu
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-1-5445365d3052@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241008-starqltechn_integration_upstream-v6-1-5445365d3052@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x6WjMi3c95jNpdmUskBugVy-8TclRJ3A
X-Proofpoint-GUID: x6WjMi3c95jNpdmUskBugVy-8TclRJ3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=616 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410260086

On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
> Leave gmu enabled, because it's only probed when
> GPU is.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

