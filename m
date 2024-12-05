Return-Path: <linux-arm-msm+bounces-40548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D55EA9E5AB4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AC572830CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331051DC18F;
	Thu,  5 Dec 2024 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwivEnYF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BD61D515B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414778; cv=none; b=NvVg7mCp9fsuBnIkYJcGNuljGF1msqqmLlmb0tcTbaRuqtLfG8mBGoZPbFB6N94Gp5qLmg1cOdKzfOZz/NLFqe8F8JQrIOLUxcFKTF/1eZvkRX+6GLE0EZQNR/Ezjm1Bcblogs42uySFOivwfEQNcUraxYb54W5BLomvewpwxdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414778; c=relaxed/simple;
	bh=dTGTozDvl5r2bsdVhzhgEBTX3U3UFXR9QdyYJI+jplc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afrU281yypf6xVXYiH/pYkOvpG+9Ed7VhOoNKJywK8BhbcIrEA+fRHCnJKmmeDze3RRlQOeBCfkNHEg67n96mqDZFyE4SdXe6g9p1APSbbHo1016BhjVzcFO3zwhjCSvquuToZ9X24qx08PP/aaOU+ZsMmjx1bafoyZZt2r5Gq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwivEnYF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5EZCR0032016
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 16:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xBfiocvIunnaNdZDDLqDWW4sOXy+djzBwH8MF4PUINQ=; b=hwivEnYFXmdrGs4v
	MBK7TzXbl65XrV89nzqUUFt+MgNVfhrv8mMWc/ZmftpyxLdS3BYx1jPgMPBNKcOF
	XRYyDZZPm06o61Dzxwi+mWNkI79vbZxW/PXjTgzYV4CS17czWFiXDd0fZBGPDm0L
	HMUdl72fFjGuNbxPgXN33ws+K7zYKKPBJnYBDNmFAvIIa6sYbE2HmpngUy/Gn6XK
	dKAMIhfMy4NeCsVbkcJOvVfp1p3TSPdO4kdHaB14mkT4tNn3a16yVxjg+4BxP/A8
	qprbVThfdQfsfcc1GCLQ59q+COiu12VhipMuMULbtLBTHQI5UXHIZ28vU9lyBqjs
	iOHzyA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3fay21t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:06:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46699075dd4so2787031cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733414763; x=1734019563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xBfiocvIunnaNdZDDLqDWW4sOXy+djzBwH8MF4PUINQ=;
        b=QftBOGTnCONZQIc2NpdgInqzijtaPUiZrGGtgmYNXFC/kYFcPAwsQf82TQjnt9/DgO
         cQ462fLfOgFbzW4F7xc3pkB5YXA28Sri3oPwywWFBwB4aajuSqKPIJHNJMJOymzRftyK
         NSe5dO6/nK0e+FEXgy89HUfU7P7Esn+fXSWpys8VKZeqFJxFEzu3CJ02U3dJYCYeS9bo
         v3UgPQpz1zvgFPYpmDKwnGj2jsIms/TdjdDf4h2Cp15BkyRLeoQOoOKy9egzbmB4bmjg
         qK6VSZPY0kYJq3nEu+K3K+0Jqy1q+HG7d6u6ShSzppTUH0L4bZjztvD8uBmwk9XJexVt
         koeA==
X-Gm-Message-State: AOJu0YyhZqfyYKuxS2vAGXbixtUYexWCs5NXHURNMmnsuCRwrhVngJnH
	HtWhJIAFqyLyU4u3NVv8ktfImjFPif92YS5TZVLspdThOURJvgdFuQSU6QmWnex97D5K/M+ydfG
	CFnv/waBD58M3wiHXn5MOqM7MEtYyTt5NvBdK9c7jz0OC2NzSToaw7Vwxyco96hPs
X-Gm-Gg: ASbGnct7CQzRSlSlcJHQMyJrEq2rGF6YnzvC6rwwI7HaEbylPtfq0+vN8ZNqS/8sz4m
	1ljN0CVBY9HCPoGkTfhMcbixOqwKv5IQSMbqhm9HyPrPSqHuz67Xym9+SHCEUI/uJS+C3MLxaBW
	83hwY9N7AM2Mu6yyPWyUaNlqD8gITEjIHuYcDUv+JDNYb0rba31mUdQiCpkZNhJ9I1DdDTokpIf
	KC4ExN7gW9RPPegehIsX4SYA9um5c42OrDP633PWGL8I7ERlLZBoFXPUpoHb5B+ymfPD21uuJsl
	9WlTK5xqcyZVcp6AKAbOQc4lkZDmEFE=
X-Received: by 2002:a05:622a:14cc:b0:464:9463:7b32 with SMTP id d75a77b69052e-4670c0c1266mr65695161cf.7.1733414762889;
        Thu, 05 Dec 2024 08:06:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrCtcaE45feNNHFxkzDlmaVr36CClapjNu62lWnE1/SccytLaUZvqDSxyCoV/RvKzynTQGcw==
X-Received: by 2002:a05:622a:14cc:b0:464:9463:7b32 with SMTP id d75a77b69052e-4670c0c1266mr65694961cf.7.1733414762471;
        Thu, 05 Dec 2024 08:06:02 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4dbf3sm110912566b.12.2024.12.05.08.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:06:01 -0800 (PST)
Message-ID: <54e9582b-8570-4272-9d08-6a89a1548bd9@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:05:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: Add base SM8750 dtsi
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
 <20241204-sm8750_master_dt-v3-4-4d5a8269950b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204-sm8750_master_dt-v3-4-4d5a8269950b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E-oX6AsGaKH8MiFajin_DFMaZFYUW42U
X-Proofpoint-GUID: E-oX6AsGaKH8MiFajin_DFMaZFYUW42U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=693
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050117

On 5.12.2024 12:18 AM, Melody Olvera wrote:
> Add the base dtsi for the SM8750 SoC describing the CPUs, GCC and
> RPMHCC clock controllers, geni UART, interrupt controller, TLMM,
> reserved memory, interconnects, and SMMU.
> 
> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Co-developed-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

