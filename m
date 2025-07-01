Return-Path: <linux-arm-msm+bounces-63206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B522CAEF79A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 14:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 136C27A9C57
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 11:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EFE2741B7;
	Tue,  1 Jul 2025 11:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkpXT2gA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D308F2737F2
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370828; cv=none; b=bkjSMiu308D0iY7md5o/tma6LhrTF5yQryNtyQp3294iYi9XE8tCL9fXZD/72lgxTfCpNzKahm6U4Qwy6TDnRjMLp0invIhGk+ztOH4uhi/0AAjzvqlfVCAQbFiljx2BonDrLMK0/jGg6UFGxeqV/HQjF3EMLkGlh+f49xz/n2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370828; c=relaxed/simple;
	bh=lfplTRJV/q/OMm+q7mTMyZDq20FwbquibZUlr89u/Vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svZd8i0DygWsTeOOuZCJKR6Gr0s1vnPjL2raDbhkAT9249DcUv+aftWDiYb06In+APtQjT7NsJjk7T3edfVG396mO/q6430N0G51TAPnkiT7deHyzHRwDbLzMIkS6KIZYAkZ7gCKC8c6ntPAfki6/LGWJhVqB+PC1WN6JlrgpFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkpXT2gA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561BrQ5i030208
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 11:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QpxwNhV8kmBkr08es5SALZ9+EdMkxt7tGYCT2PU2xfs=; b=MkpXT2gAJBzaclE+
	cMg/d8jiIfvjRAaHVctWYlfjKh+MGU3wDkIEooQWfm6OylembSZQCaMQQmQem8rc
	KcuwImmFMo+KciPu2OJwh7AM7PURxWt/y5DfklzwPAlkJp4J+Rv0bSrxUIdpQD/9
	AOfjVBhpXRrvF9/+FvfHoLV2LnvzndRbvXJnlzaWMBcmvjE3XCWA+dwjZR7Ck9Fd
	8JrxZ6McFi8Esqwi4080mE2WA2XGjRtY16DCbsyxAideclbyK6rU8lQzl9TDI2Uh
	q9DaT/q4tRhvh7W3vaghhYX59Fnq2nQjJIBpjVbw2aeH7PtSH9sUTzQ6XjfOKdCg
	Ca30zQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47m02v2tdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 11:53:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a5b3aac5bfso10520881cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 04:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370825; x=1751975625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpxwNhV8kmBkr08es5SALZ9+EdMkxt7tGYCT2PU2xfs=;
        b=gxQosgetbAoe8uai26Bpuq31so6WAG1CF6F3XOGiUmoGTdd05QvQupQPQB/bw3CdEW
         8N1C8CnYlUzHgaQSGbcN7jviLvj8xPdoa8uzDTrtF+Mran1OEzTrDFWKZFkxL8bonQSZ
         5/Iai9kFutZXX2BEiIeuHCrqyJA1CN4K64DQe3A10JgsovMae12IOVvJVQmxmZ9dFXTb
         66e7vVj70esd/mXMNwRNf1AtVKotj46EfUjwTL3Qgi5Zxn1QiR1jOJXQDGfcQ8nAQROi
         pju9ocrfcCReU/qHpIx1T2lTO1rsp1rJ+cdqW8l5k7b8hOhfVPs3MPhckX6SviJ75MV6
         AoGg==
X-Forwarded-Encrypted: i=1; AJvYcCUKhA5qAZwhYfcZLRgKVO0okziFRzZkhcdS0vD7CS4MxQRGHQ2nEoHGVZIJ9Ufv2RZV3Je2rWcVdf3mCgfD@vger.kernel.org
X-Gm-Message-State: AOJu0YxXBoQxe+F9w3jSS72EfbtcS4x9lcYSwsiELIrkptJvBW3rjnwY
	9k6DWg/x96CE6NOdp3epZ9U8xxgbMufZa7eOiM4RGWklJ/+uZQZ+pwwbOjsYNxH1mhSNGPApBVj
	enYVvNPh0is5psv3AVuKh1KBPAQGbAGofwxxeC6lC404kQCI4oz9yQAIWkB30g5lX0WS1
X-Gm-Gg: ASbGncuQGFfnwp0uZ+1inO2NqgJR1mtXJ2JASsBskoq9+2B4WrpHEh9vyXfBIGgnS5U
	EgZoUHnKC4LEsB4l3R4XusVp8++lw4s01C7BtED8JO3tOYQWETbRyiFskY2U02dPz1zOstGx+mB
	QUy6h+k002djFMBnV2/x+Kumy7EMSQYOzqCVxUx5s6AEEr6n9dyfc5JKg/2ltHRi25uR3Gap3mO
	g7+oANSmhIX2DJnuHFPaYSksTjVqki4O+ENe83/zyt5T1+q5SBoel0Y+Zf4SG6QZRhEtU7ZG2HX
	nYmJ/tqHAxj3HT1TzD3MItuCC02BToCS7CJUhCwvSpmi2HXu071WcyTnD6uCYCTg3KbLP6oio0O
	rStZ+71Wm
X-Received: by 2002:ac8:7f12:0:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4a832be2468mr13903911cf.4.1751370824584;
        Tue, 01 Jul 2025 04:53:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWdgLxpAzuiN8smmXG1hbj+2clhnPsKozIAenNYDlGQFDJbhfROsW++8GbvMW+JJgD+uQTCQ==
X-Received: by 2002:ac8:7f12:0:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4a832be2468mr13903671cf.4.1751370824063;
        Tue, 01 Jul 2025 04:53:44 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8319b155sm7402498a12.52.2025.07.01.04.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:53:43 -0700 (PDT)
Message-ID: <9b6de81e-54d4-4448-87f0-5ca83086fc27@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 13:53:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250701-sc8180x-videocc-dt-v2-0-b05db66cc1f6@quicinc.com>
 <20250701-sc8180x-videocc-dt-v2-1-b05db66cc1f6@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250701-sc8180x-videocc-dt-v2-1-b05db66cc1f6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3MyBTYWx0ZWRfXyHE9Mow+vs2h
 /hYge1XyuZdoi4GINDqbQAT7wWckutIp4IsFCDAJgH9MFr4n1Ofw3XPIDMLhANsB5kfTkZeMsiM
 ZyogGY9grmbxEJkXL/UHnH0qgY2tVOug/wInRd/Uf0iY6y/iaNTsizD5Sw+EZFtSvTOQjupO71A
 Foi8aZaCWXQHQ1qNO+cg8bJTI1xZbzphy7GNGLaXExvb/eOq+Qpo8Epv8xB/qWmhogvDV2b9aiM
 liunITZNGlPxcN0O6ZxYDfoqLej7riFVe0NuBzhtsevAQHyiSZQWhnseeJldd3VxiYYKbj2pBl4
 069w7LWb2MxNemOqPiJcGh4m4JjNjOLeG0U4UVMAKLaKIlBfSHc2FsVv9HsL0eO10hLH3ALZnvC
 283/Kgl09kYiofif2v1fEwNWM8PtZuxJMOQHHmJ+MS6v7ieGeZAF2sYaTXuxBucGKS03mHbb
X-Authority-Analysis: v=2.4 cv=Y8L4sgeN c=1 sm=1 tr=0 ts=6863cc4a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=pJjouIxg0UYB63CLVSoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cweq3MPh37brjVfm_Bco46oSUSF4CySM
X-Proofpoint-ORIG-GUID: cweq3MPh37brjVfm_Bco46oSUSF4CySM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=719
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010073



On 01-Jul-25 13:40, Satya Priya Kakitapalli wrote:
> The sc8180x video clock controller block is identical to that
> of sm8150. Add a new compatible string for sc8180x videocc and
> use sm8150 as fallback.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

The yaml checker throws a warning:

make ARCH=arm64 LLVM=1 -j$(nproc) dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/clock/qcom,videocc.yaml"

  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
./Documentation/devicetree/bindings/clock/qcom,videocc.yaml:28:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/clock/qcom,videocc.yaml:35:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
  DTEX    Documentation/devicetree/bindings/clock/qcom,videocc.example.dts
  DTC [C] Documentation/devicetree/bindings/clock/qcom,videocc.example.dtb

Konrad

