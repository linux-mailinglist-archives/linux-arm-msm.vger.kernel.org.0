Return-Path: <linux-arm-msm+bounces-88024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12735D03F5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C5C630DE029
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7297D34FF7E;
	Thu,  8 Jan 2026 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6el5agI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ke2ubWbp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A6830ACF0
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862553; cv=none; b=C+ZJa7DR8TAIYTPtvGqYNVEH0YBEn2efjiW5OkV78GJrRS/7aexNGb0hmMPEGmPCalNMfeUp/GVSxx+/r4GIDtdmKJFDsGjxqcDuW8Enj64FOop/Zj47emAZhzJjt55rH4p+8ieErsj7tYez5rqfl2PxdshMEUL9GnOsSSmnYb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862553; c=relaxed/simple;
	bh=vihXKZgC0RF0ZvWdSb9dihAYRm5zi3vzFR6ngUhuC5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUAwE+ejhMSyVYgktE3u+jMqti0FJrGTSpWqwKjMj5Gk5UKDklL70o2LtaLuzkwc3QSikUCb/rb86aC1kv41a0fSg5zAgAZcQed2qhfARpWogL3UvF1GCmH6pUF5+1eOSF8YcbJKyfn5o3+MwrYKFSngNZZaRvjH3BtRynTk/Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6el5agI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ke2ubWbp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087VTbw1838244
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+LUBAWmsVKlASWBuram6zTfQJk0Q97+yOU2s3t9Be4=; b=J6el5agIdb0Tv0H6
	AweZ0W4e0nDdcw6KClr0kxkxvvWoaHjpy6kcoeFZjAHksZ9JORlHI33VBmUyiXNZ
	acCvd8okWKfonyTboawiXCvDBQ3lCF2mozB9amhs1tXGSSj0mL40Y9bQ/h7QpYHL
	G5rPr4mqfumhYo/0MT5F5bk0F0fCImunLaedL4Ee8PjE9acJ7ECMNmCuOZ6D5KLO
	OL0R5DffkJuXu4g34WsFaS54u5+QfEp3D06xvlf9ivL6kg6L2ciT8yXNQmvk/BJm
	NzDNTqR7Vkscyqu/t2R8AEJEWZ+XyabSlRussylCI5FbIuJJRupxtmDuUnYzEEVD
	Hmmyqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj89207q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:55:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee409f1880so7335981cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767862544; x=1768467344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F+LUBAWmsVKlASWBuram6zTfQJk0Q97+yOU2s3t9Be4=;
        b=ke2ubWbp5m27bThrAYFevJyC5SdLT33EAIAMrYIm9W97HCUucpt0E8+oNxGAwF5l4i
         jXOwbfI3YCcAUCO30QPe0kYbPUMK7rL51DobbjFp/iDwO8oEHCFmZy32wd9RBCZo+v6w
         mFEhJp6t5QNaEU8vnen9K4yYPVO0ew28wADf7lcTXyc4dslrtK5O22S6mahxBCK6V6Ny
         uLz/F3gzcn1AYL3TXsx87dJfqNtpwOlJ6g4cCDVZXEOYgneGFTluMgDFkWLnhMObV7u5
         IrXjmeUWIWyS2Xt+6DBKKNeF41C2fIENjwuc5LDVQeRkmMoT7Wzv5a3vMTkyYtLR0nrw
         UEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862544; x=1768467344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+LUBAWmsVKlASWBuram6zTfQJk0Q97+yOU2s3t9Be4=;
        b=Cvy+Q3+MXMJabn5H62w5wUPHYH1E6YgWtQpgxIGznKAk57Ta9w8ynV8VI9sNXtHjYB
         duqZOGxmJtocTUVTPEyyWzoj5bA8+a5Vs3COFregwaili0r4vIDefeLT0Xm5JnNe/x0h
         458Sk9Ou60JPBL7cR0P/Lx0JwYDDrDt/JXDKBXeRZ+5dMTK+eJZyPNUqzFaIxgMANTH2
         tYLpVs/TajYvG2KONf4UXrhUOCyo3MQLUdWL0WNjxLvfWs2Cly9uDbc4qfovniD7WNZV
         Wz4CaAEEhL3xllXdCkso1+KjVPiWjKpiWLMAgtqMsnBM7bmRQZia2D8uWCo/NDB7fY+m
         8/9w==
X-Forwarded-Encrypted: i=1; AJvYcCVzZE8KS8AIKdmmBu9VxxCpy/uj2wFUJmqUNO6uu9hJx/CXc1pWUtSQfx1yEsY8sNQjR8i5FXSIqO+YEdOY@vger.kernel.org
X-Gm-Message-State: AOJu0YwAya29gPhZ80U5atcSVdZ1DPpcVk/HvaAYKy334lD9XyA1TZ46
	Krh+lHQUicX03Og31/lqaKiUcj8J+Scwfq3eJPK1aHe0THCOglCsn918eTWk4y06UlYHDc4ClMR
	wj0WXsdH5gaw39I42WT3QzlPregfPj2RynUZHJjXFQNhlo4tR57aeRtL5qnXASwcHRA/f
X-Gm-Gg: AY/fxX6YLR7w7O1o6XLSZyi1h1BxqGy4o1SkvwHLgsiPW7BeOGnsx9qgrpsMSagXIAL
	sTKifMtRvpKa5nPfGzp19uWwlxCHU2QIgxQ9FzIjY/8rls0PxFkN4dEMXCSBlyexIQd6+WIKxwM
	6/uda6CQ21E0CshZ7Bqa/Bx3EVVny74c2olcS/CmWSmRTaR6Z6gJF0aGPbRKnvYeAOCjnocRwzx
	dhU6h7SVTFCYR5Jj0OXlhuVkhmW9DS0ceVmLWjxgZtp5BskOFJM8Vl7tM4gSJZRMb4u4YfTAAiH
	sEI0d4dOmwBOJ6jcR4IYuTTQHsdc5ur+IPJGNPdKtW8lPYl61tun4HQ1cZi/4STw/vG+URxzS2d
	LeDJCNl148r1AI3zmqt0VFVp/DOLGuUF679aksILC1jJgaLv1Jz0q/zke3hZAIDz7CGc=
X-Received: by 2002:a05:622a:2cb:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4ffb48d3b42mr58398621cf.3.1767862543704;
        Thu, 08 Jan 2026 00:55:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9Lv86d+HKglAfIaITF0v/1w20K9Yw1Cy6aKrCbkHCUfrjyUTzhk3wIiJr3LYFJQaOUvw//A==
X-Received: by 2002:a05:622a:2cb:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4ffb48d3b42mr58398381cf.3.1767862543327;
        Thu, 08 Jan 2026 00:55:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8429fdf4e7sm780584966b.0.2026.01.08.00.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 00:55:42 -0800 (PST)
Message-ID: <736c8986-7adf-446e-9720-c4a71272825b@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 09:55:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695f7110 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=GYwjzM_fwieWSpg0kukA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: IBP516vDtmMeojTparUGka9AfpFDiu-2
X-Proofpoint-GUID: IBP516vDtmMeojTparUGka9AfpFDiu-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX0CwvOapOFCq8
 DbCHzwwnnRR4utScWvc0MnlcSYZHq2f/wUESlsuLjE4UpbusigCaUdJ+Jht4z7B1rKnDxbfHHaX
 V19CWSLbTb0jU67sqPxrhfvCo8n3BrnThibznzDIiBM/Z+r2x4u0E7+hihI39z92Yd67VEAHl9A
 85FFgd4gZxxNofKbVx/prO2MBoGjIdZULafWD91YWk6SIXk4JUpUjyA1mzWv/W8yD2BK6wlxexa
 HhISqnTdKRou2rtMTa16yyQc5G/rsG027Y7fgH2bAvR1PljZxH10S/ZW14lhGJr4mPhYX3KIKMQ
 Jdtk73eaM+0b6NN6CF5Ha0sTwC4XdIU/nUBy87c0CXw94eV9Qt4T7+0LuB51C0cX5DPRc638X4Y
 oD7+S5CmrS6mqlZy3OGFfZ2kmAwzjQml/kMce0m0DlTp46+x+TNmqdbGAzVJzHsclVh1XW5w4y+
 /7K5wc+/tFzXVEJEPHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059

On 1/8/26 4:43 AM, Barnabás Czémán wrote:
> WLED4 found in PMI8994 supports different ovp values.
> 
> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Likewise, I reviewed a version that said PMI8950 instead.

Konrad

