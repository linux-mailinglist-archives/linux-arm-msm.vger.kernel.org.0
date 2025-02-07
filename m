Return-Path: <linux-arm-msm+bounces-47175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56793A2CE08
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 21:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76771188D60D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 20:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03DA1A0712;
	Fri,  7 Feb 2025 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VdCAYhQ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF3C23C8C7
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 20:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738959624; cv=none; b=Lx42//BPzU6EQhqyeEj1J4+JSw6yy2hf7GiPPUF7gNuJ4g15Nyg8w3IzOaefoUWTgbX/cIow7UB97adTXEYdY08RNNujb7E33xXFGDSyc98w9VJHEmUO4pxV44Nhuk7Wfe5hCebwx4zTflhS05gMJ/JtcStoZAcY7sdHr11GwPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738959624; c=relaxed/simple;
	bh=nBM4DZmDQv6tt74S9NggpfBtRBceUzgagm9bf7r2GXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaK2HTNmDT0Kxfur54SuquaHvUI0JLZAvr8VxYCATnrT87FLgFvpIACJkLpGuPrmcmxxJbVKz+Ulsa4U22MSK6549+cM1nLUR1EcChg5RfahOGvKFgtIl5kBSOuj8taPwFUmg7k8m2yv5STsUfm+7eP67iriWyAqWuIMJKTwcPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VdCAYhQ7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517CT90Z010620
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Feb 2025 20:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R5+HHERxxJ7BW4/TYZ5C+u2OAyVYPWzRYhyWOOU+CJM=; b=VdCAYhQ7iVbi/04K
	4JCZOSdwwHeoXvGqAGldhSWwPp3Esg6DjVw8T0gBZRQ82d3xtqpsZrRBwa20qZ4p
	fUmNKx6Q/liRCgceo1/UuMLLbWCrZvNh52UIP9SnsO4h+VjzVeDy3fqbPn5lDW3J
	6HkGuVd779tQpTYADC00/yu5BwKymRWILHjzHlKglu+uLDOTrbD8ZiRmbwOt4phO
	OF15TBea49PAUOiBUVRsRKeJgkhaUbaT9DkxsdB5hvAF6PQH0wPS3UvcKU/JVBLB
	1bQwoTkJfPL0OQg6l5/QmV/p5RXOQagJoCChl3zXTMuMjkjpa+GvnybaAICKYnO1
	LdSreQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nj6w94m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 20:20:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6fee34f95so30287685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 12:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738959610; x=1739564410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5+HHERxxJ7BW4/TYZ5C+u2OAyVYPWzRYhyWOOU+CJM=;
        b=mnm2kIg31uHnX5T7VvCdflEEaSltqZFWRIwzYFhLwL9YpsJsjEi1Ep8lYQHp1v7Fkh
         JmS/f8IMx5hVJKH5k5/yppRYmBkwBtpVfMzdrGBNhmSDjbKUvmRwqeQfxAd2g3zfqOxi
         FO6YWW/zqY2Ap/OQsFEnYZ6UF5iUjXu+hnF1B0xVF6N4y+4oDwvM6g1LRQ+X7obKEcs6
         p1SAV9hRED41UoGaHgFwNqiHx4yw5wffAJjC6DALdkMVOpSANQLpLuJhjCoE8MgHNBFn
         KzLfOsRNGMBM7Rxt0MGIOC/Uf92LUwfYGed6k52VdtZN+rXH5BN/FpIA/uNksi3SBwtF
         7AeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVQAeaLu9PlPULNNLvuoOFd3M/G1qmLcoA+54eW2Ivq/iuVon8zGrvCz+6aamCnU8yQCeIO2f5WD+kFzui@vger.kernel.org
X-Gm-Message-State: AOJu0YwC+Zk9KRw+Tvlzfmkhyo4W4FZhdPCv/ztZNVLx2nghdi2X3n2K
	07dzGiwa3fobcWHdoLIN54tmxW/IpzL1xlJnjR44p+G4zQR4WInwZN53xDQp46ZjPRcpk96DiBL
	B/UbQIjBgWGuWEOLbRwB5IIMg7j6LTfU5fTUzDSEbwEnDcLvAuRcYngr7592Yj7Fw
X-Gm-Gg: ASbGncvu4JVtSfpcnPOFg+Y7Rliq8QhkAs/nBIwEYcBAUmKC5O2Q40+sncHodRKXNE9
	7Rw+dGbnTxwKjUWN/Pv8ISft6EaTvmG8c3qkLuTBrNd5q1Rnx00saVc7kkPV5e7ZXLN0b76PbdE
	MfidTVLbQGfZFdilybV4eB4JGd1GBYU2S/HPbbMgksY8TNQwr6pk55Esc4Y35JqtJQuFmjDQUwg
	1ePuo5yX8W6YZ2w++SwdP1yBIYlyNDdm9bmwaEjTk0X7TsRzZxhcxDzBs3ku6cFlhOwOerqggoy
	tlMaLXm61lXjlVilXReeZA==
X-Received: by 2002:a05:620a:2601:b0:7b6:c3ad:6cc5 with SMTP id af79cd13be357-7c047bc666dmr272721885a.8.1738959609768;
        Fri, 07 Feb 2025 12:20:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmEyUIm/VOLiJ4tAJ2lxhMAvt67rONo6F1TFJ9jX0/fY6FC3rQweEnrPhVW8/iuTFETEVeHg==
X-Received: by 2002:a05:620a:2601:b0:7b6:c3ad:6cc5 with SMTP id af79cd13be357-7c047bc666dmr272719885a.8.1738959609377;
        Fri, 07 Feb 2025 12:20:09 -0800 (PST)
Received: from [192.168.65.90] ([78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab786aa2c60sm209993466b.102.2025.02.07.12.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 12:20:08 -0800 (PST)
Message-ID: <85c31e1f-20bc-4e48-b179-e44ee8e1f816@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 21:20:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: use guard pages
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: "Dr. Git" <drgitx@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250207151706.45031-1-caleb.connolly@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250207151706.45031-1-caleb.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZB_10pDcYPxPScuDyNnJsj4yt64v7iTd
X-Proofpoint-GUID: ZB_10pDcYPxPScuDyNnJsj4yt64v7iTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_09,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=730 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502070152

On 7.02.2025 4:17 PM, Caleb Connolly wrote:
> From: "Dr. Git" <drgitx@gmail.com>
> 
> Rather than manually define the guard pages, use the
> "qcom,use-guard-pages" property for rmtfs.
> 
> Signed-off-by: "Dr. Git" <drgitx@gmail.com>

I'm not sure this ID is acceptable

> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---

The patch looks good otherwise

Konrad

