Return-Path: <linux-arm-msm+bounces-65808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2D4B0B633
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 15:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBB6A1893217
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 13:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89634213224;
	Sun, 20 Jul 2025 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMaWHWnB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A1620F098
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753017314; cv=none; b=pRiMd0RhUDPlNAOBbu+OHzZmkBHcrqjFVeMpdNaJJfRta+cXsL4+X7Iayfv52/FNSC3M8y5t4jfxMuN9KqZld6LU2GCH6CHrZWoxoiD9hb0pyIh9fRUGLDJ/xW4+mFwKa1EtVY6IXB2zsphwjYs/duZe+dIbzRdqFXLc0+bepz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753017314; c=relaxed/simple;
	bh=a+/9yQt11K3VithUaPvA5gO2rBEnkjNtJ7gkK8eJqIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyRq5Xr9GZ+r4MMdoAR32fKRZO6FyHarVCF9p9zMEHSV0b+uuqDgkPMVIQRaN9ro+b0mnYpsq4BBqHy9a0FWaKp5Ry09NNxyXqpXA5rGWu40GsMtByv1Hwpl87SlvqwybuvFYl8TZNviEcgutlPdlzWFyL/sh79YQw5544mCF2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMaWHWnB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K70hXf031995
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 13:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a+/9yQt11K3VithUaPvA5gO2rBEnkjNtJ7gkK8eJqIo=; b=IMaWHWnBCHMw9zSG
	jGCyqjPx0M+qhwMzCf1ACrW7t6ln3YmGSNhkpnA5aI6KPJK6QNpRU7ksWq+nabna
	cT1vUXXHhFqjyIEpyAfLruMADmFlAMjPE20xVIxuEQdlV+Y+EYBLnhxtvjJZksph
	0qhN+Zqq71W+nu8RXhRourKtYckgH29VsHnoFRFWPONKF7X9smcuQrIeppj+kS+G
	DTiKpMcRtoKGscoCYXxW+SlCfux9k1SNAt49kpMasOByQMju2Y4VGXBdt+LT905K
	avsuFDNLry6Evac5qIgK9svtcwHZvKtWS1f9vMsY/38LZQhN0de8bZ+ndP3GSwgj
	1fgvMg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459j7yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 13:15:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31cb5c75e00so3301077a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 06:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753017311; x=1753622111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+/9yQt11K3VithUaPvA5gO2rBEnkjNtJ7gkK8eJqIo=;
        b=qa/L0ALR+ZIV0ZQl8XQq1sgzpXcL1YDXntB2XnQq2+irblAsL59bWEhX/uUxlRMlpM
         L1Oo2gn4FthMViz+TDNzqhIVMA4ZUQJQHGtGcsrD5xaWe+lJBsztvCob/EcXQxq6ar9E
         tcgujki908WHgB+JsWRTZk+qML+Yu+5IAzfbFAfrFi8LI6GqvWZXBiSO+0xXKdPDLhk5
         lM3mmr43IV5wwAocXoOS0oD1onJ38/JRsM0FTd8cutbMuDeQv22dqxTvySegc2FPMmec
         PXjiiXySIHo3nAwOez/BSCQ5TQvAPVVGeTewOTFdvLJxrxwpkPlGrNJwjVYb50shUXLO
         hV5A==
X-Gm-Message-State: AOJu0YxGef4HDOJSfQxlcaVmDwl29QKn9soy3qgwle59Vb2EnHwB7RZ/
	hVqKx7gsTp5P7eYsqmhuyv/ORNaQH5iBpLbq+nCXgQDxX0FAAw2eMqtkEoc7W1ovZC5edV+DIEz
	Y0Iyz3wzrNNOtBvl3aAfga4Hi5I14x9W2d3gJi2xkI/6B05xvDx+tv/TJ1p56iXnIfyXr
X-Gm-Gg: ASbGnct+y+b52PUyiiXSCAGC4w85VO6FpLogW8mAAkA3UUOwzCGLQjK09bPpcFDBOep
	Rx2hihzg1PdqbLUopy3eUcRJZMOXxdGp2yfIsansDuqCQY3uMutK/t9TELksl5AtRSi6g8P76iv
	xNpfQT8QB6vR6k+btT7YDi4aZfTNr3Qme0LzZUPzXaJny3mCRBhoHRO/DBcGAHIlVABxx0r6As7
	nSgbWH5L5s0ANtYYq0sYxELbz/tQ0+BlI9evvpg+MT9V2UZaExzWrTJ44awVgxNtWialAWOpi/z
	yxNn9ep/95zocMpHMyj9lEAHf58JFWZMGKfvQS8KLWjmbhKehxMJN7W10RatQKtXzIR+PSoHRa0
	Y+bP9Ng==
X-Received: by 2002:a17:90b:3f84:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-31caeb94318mr19574376a91.10.1753017311159;
        Sun, 20 Jul 2025 06:15:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAUVIdg3VfO/chezPNcdAQfGrPXF/HeTMrNxiX6naKgNf1iAKiYVgWsV5q5SnS7nUk8OkSQQ==
X-Received: by 2002:a17:90b:3f84:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-31caeb94318mr19574324a91.10.1753017310705;
        Sun, 20 Jul 2025 06:15:10 -0700 (PDT)
Received: from [192.168.0.168] ([49.43.231.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc0be8707sm3942525a91.1.2025.07.20.06.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 06:15:10 -0700 (PDT)
Message-ID: <a4369d76-df44-4281-a2a0-cb6d32197302@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 18:45:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] arm64: dts: qcom: qcs8300: Add EPSS l3
 interconnect provider node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar
 <quic_sibis@quicinc.com>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <mdtipton@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711102540.143-1-raviteja.laggyshetty@oss.qualcomm.com>
 <20250711102540.143-3-raviteja.laggyshetty@oss.qualcomm.com>
 <b5a1314e-6733-41e3-9258-c3a88b2c90e7@oss.qualcomm.com>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <b5a1314e-6733-41e3-9258-c3a88b2c90e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I2Vpg0c1l4avmuUvOcg_vpKMsxYhFPGk
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687cebe0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=zhpjAwSWsGC/MCksz6s7dw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=69bba5Txv9aQVdJV0a8A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: I2Vpg0c1l4avmuUvOcg_vpKMsxYhFPGk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDEyNyBTYWx0ZWRfX87NYEtTsW1Y3
 yW3Coah9EjK/AdgOfKYQO/nJBQd68UEGd0Be82nPauqiIiACNOd02NpEqqfDJSaw4IcjlzAdVz7
 wtxtnHguE/k1qmhFlbK0HNgVyvcixqJIM9ddYJzC6YeiTfpDwtV94/Ws0cgEjS6xmEX+ZQLcLk/
 AevfoMvRUO+yclyz9Dg62BV5tKA4n5AYO0F+voVf0uT/PDOnIpTb/sVxXZAdolvxNGdAZiJrHhy
 Mlh8P5+GyCxsHzUjWtvB80/5wLqUCsIX1C2zihTs1MH3bCK3eWoEhULZeopFY4H02V6ViEcNFAA
 7bV+I+EElM11p0LW1TLbrQgOHDDJuDOc9/2uqhnJIZN+XWao9Si6uWI3x8wHN203o3aOYJz92Va
 PdLtExNq5vyu89zEXS33TAr/gsOdNwIM5avYXoMzrioWvX/97feE4bRIfhzgA0gqDe32qwYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=977 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200127


On 7/18/2025 2:36 AM, Konrad Dybcio wrote:
> On 7/11/25 12:25 PM, Raviteja Laggyshetty wrote:
>> Add Epoch Subsystem (EPSS) L3 interconnect provider node for QCS8300 SoC.
>> As QCS8300 and SA8775P SoCs have same EPSS hardware, added SA8775P
>> compatible as fallback for QCS8300 EPSS device node.
>>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> ---
> Squash patches 2 & 3 together (because otherwise you'll still be hitting
> the issue I described the last time)
> With that (modulo me trusting the numbers you put into the OPP table):
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
Sure, will merge them as single patch. Thanks!

