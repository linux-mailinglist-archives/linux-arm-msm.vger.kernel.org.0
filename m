Return-Path: <linux-arm-msm+bounces-46399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 468DFA20BB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 15:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F19E67A43DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 14:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414C51A8402;
	Tue, 28 Jan 2025 14:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpIWLMle"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D216119F127
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738073110; cv=none; b=Z9rnUzYYPg8IjnggQc39UhTYr0XlXWvyvJROedna3uHTyd87R2FtNsRKikXVtILTjC7zy5pohTfyjK3gj8Xf5SUAFTzqdD24smOBjwQuA28mcuQcPobSNLOosMLqQ63aPfIfIkAbNGW6ZKWOWVm9KOxiNWilpa1rX69qWIxhp1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738073110; c=relaxed/simple;
	bh=JiGD2cMe9lX307WsEEDwaESbm7NZG/QhYRCoDpdf+7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAdRMMTQX+QdWp62wX3iIdaiL3OOywPDGCXUF90mS/FNmKukGdTHObzuqnQHirvzXR6aFW7rWoKhyviBPzqk/VNbo1lcSr1IJiYovp4FJf4bYdz3/b3s3zocZM360zFOgtBnIz9owqApVuReCQF+RNhQxfqtjzrOm+9ei1cg0TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpIWLMle; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S0Dpww011347
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	no3WhmSMt1ha/2u4SRajwCvcV4h5mAOvCoziluL3Mss=; b=lpIWLMlebDehy7EF
	huqJML2Hww3r53LvRjjmW/Nlgwv/Eo7AFNYoxKUgEEsfBjcaYJlPuD3sY83RPMpe
	6GsNApjV2zJmWO59Bz/HQy0RPj7PV9d0YVwHJ0Rw1OG4hPKSPsWFViTLvsRLmDr7
	s7fLDC85/PR6CRhB8A+nSdLQwbuH7tYgaOBjEVbPrm1lu0jiZylarlnpCMio15bm
	5dk2QebJRCWGKBTnlCkkN+p7/xrFBQhzCFbvchnCYOVZxfc6sYwr1dAzMObBq1u/
	DcUoNsIWdPb7+whKxLxtj8AlH1CauZsXafTc0Doo8UySf3xCgZ/EUyG8vH6H12RO
	yeDEEg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44emgtsj3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:05:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6fec2de27so124809885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 06:05:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738073107; x=1738677907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=no3WhmSMt1ha/2u4SRajwCvcV4h5mAOvCoziluL3Mss=;
        b=SnG7E28K1kztc/4ZSUvO8cbwruiDmlXQ5k5qy15tLtVvlL4uglzDLzGtTOEZwMj6yD
         2dIBIFwyTN9klFtAtS6QaIkcomeuQpjnwovPRa1256RDaeLb4oP5py0ujcLBrUWsT7/c
         kDupcSQrM7JUBQqC0RKxNZedvnC+hbDMkmYL/QQJfd7JwCJ14e0qkpEnfoMvWwwnh4ux
         pGN0jy1Jb3DMhdx1lMRFeG3dGK7VQ4Gs1utOWN2iWwVpIigFQi/20f1chKbm3h98h+oQ
         XkRInSAknILesVN+961XUav7pvMnfJrkUmSnyM5HM/fcQm6Me8cJBu2U9Rg0F2QZqQ8B
         2HkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo8r+OLLD9gAZbHZtV83nHJw26dm7E8zuJoM3xmeYcOalnDUguRXxlNtEigZ9TlevZpBklY5yU369F6qSr@vger.kernel.org
X-Gm-Message-State: AOJu0YyIe1WoYZcxGLsC5fh17pxXnajSSeZBbRuTURoYaGvDtHIKPRQ6
	ppssfU/qYld4RhKnnX8US+3atWnp7HmKIOGkHlBTjDkZX8ntI82tT5eGFTiigWXoXwWTFwF6i3K
	BvNEhMTHCWPmANCsNIMUPmKXnfXKQpevthG/aD4HKkGSu/0Hn/aoyLgxtH+dpeO7o
X-Gm-Gg: ASbGncsklm19cYcXnvFtkhBe37Y1JH/VwHDjvhQs5hsE4JmK27GDCbXCMtbNDR1zL4s
	3EwyWK/muChj8o/zjx03DOovbAZ40B1qxY/gnIV+WstMJpI3dzoTPgEzu6VVao770NONwRr5gXa
	JAFrQ04l6g6D/2DtJlbfUX62HdG6H72zPh7aa1sC8YuaeHOZzHMdXBdU82M8qk55uTzEzdqf+f0
	xln3gZE4cEx+rYAzg2M8nQF7+CeX2Ku2/E0pv7WF/2wDeW2YDJmWph45Z6j90V1+wmYj4ghpVsj
	vaq/IY4VthX7HfJ2FWCnHMyvh5eyLpqVG5sHCFfB59E71PM0WaK7KwFUImc=
X-Received: by 2002:a05:622a:182a:b0:461:4467:14bb with SMTP id d75a77b69052e-46e12a16648mr253563501cf.2.1738073106563;
        Tue, 28 Jan 2025 06:05:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/LbDGQlsRbLBsthnFftYoCMDN39FmOkWnL2VkhN43zQmeyE+B71djH+1Jp+LrNzwR7oFTZw==
X-Received: by 2002:a05:622a:182a:b0:461:4467:14bb with SMTP id d75a77b69052e-46e12a16648mr253563371cf.2.1738073106182;
        Tue, 28 Jan 2025 06:05:06 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fbab0sm775064466b.150.2025.01.28.06.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:05:05 -0800 (PST)
Message-ID: <dd03609d-fc75-4841-977b-8fb536684673@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 15:05:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs615: remove disallowed property
 in spmi bus node
To: Tingguo Cheng <quic_tingguoc@quicinc.com>, quic_fenglinw@quicinc.com,
        quic_tingweiz@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
References: <20250117-fix-kernel-test-robot-unexpected-property-issue-v2-1-0b68cf481249@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250117-fix-kernel-test-robot-unexpected-property-issue-v2-1-0b68cf481249@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xOP5X1mLe7BteKZU3BBbazawwTvEgroj
X-Proofpoint-GUID: xOP5X1mLe7BteKZU3BBbazawwTvEgroj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280104

On 17.01.2025 4:24 AM, Tingguo Cheng wrote:
> Remove the unevaluated 'cell-index' property from qcs615-ride.dtb
> spmi@c440000 to fix the kernel test robot issue.

To fix the dt validation error, reported by the kernel test robot
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202412272210.GpGmqcPC-lkp@intel.com/
> Fixes: 27554e2bef4d ("arm64: dts: qcom: qcs615: Adds SPMI support")
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

