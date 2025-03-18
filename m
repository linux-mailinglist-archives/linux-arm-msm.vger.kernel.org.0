Return-Path: <linux-arm-msm+bounces-51770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B13A67873
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 691337ABBCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E471020F065;
	Tue, 18 Mar 2025 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9HfiOtd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9CE20E033
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742313275; cv=none; b=HdPKoyMbIglmKc1yyXDzOWy95kWFncM5phAlXO58QzDjUjn9ZfMfjpvbnx2pEhrNeHQgOAR3H21hWNpm1DRUioN+y5x1WmIt4lmHufc/rhnHq4IwPnRZhL8Mt1ZW8ch8HYZ4y2zh3R1+O/7rp0B4mMXHihv9xn+CjetNh19H35A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742313275; c=relaxed/simple;
	bh=oxKIBsNlJlT1kPBIzSrXpjjUvcEU3pk5b6B22ySjIQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InwjC8XsT6+MT2WDmfdNGdhfuRqLM5xxT95jOS0BK7pK8St8lGD+I6c+KfJYl90ItQec8MvmKCO+0wE5rK0lXkiVoKpVOOU/+TieaZ9GmCr2LgG833SBAZN7g7hqE98VH9Sb0oD7ITn9qjFj+ZkO3Gly3/O4K9YaHzZNZV1xmQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9HfiOtd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAIW15027106
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 15:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Xa1vIDYqanRUirDnrweIzMORGB+bGkA9Q5Pq6d4ttM=; b=R9HfiOtdAiawBeHq
	8uK7efvQTuoqDnUTdz+mzQ5vGD+5IHXoR/puRh2RGGP0WQCHEh0W1qObJ8jymWo9
	VAGa3eeutwiv/k8jB5xdpi2FXTLeElXN8ZVc2WP5IHWemm6hOZerLQcQxTe5X55x
	yVqOU8G4rONsP/P38zXyStAAxbr8ktv60bwxIBtUknZR89DCjJ8KlnmVLL8dbeLE
	/2R9CTN9WrBvub/o6IZCZ+Ofe/pM/8EUmyY/eWGvvcChU6BuYXnmzbvK9rGlD2F1
	7w4nAmt+xB57q2fpHAMtsBCF7gDAgiIIiM6eeOy/qr2Loucf4yg2x8fWaUaj3vhZ
	0QpFFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtjf1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 15:54:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7be6f20f0a4so59031085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 08:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742313268; x=1742918068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Xa1vIDYqanRUirDnrweIzMORGB+bGkA9Q5Pq6d4ttM=;
        b=nY5s1coobpkKgTalBTKMONtIIV8A1IsWghtpzUQZ6bkkntq8JicRj2FXfkWUbBjJyc
         EOBdILBuM9C7//gQ/Or//beaQ3TYmEhXVhPO5Dku1huqLv5QtIRhiumA89tcswmcM59j
         I8fQq4KivwMVU36PFE/KW8mgBLpkAZNvsqtMtkiUnVP0Y3Dwta632jxk8YliVLdgFJ4O
         HX295OAnsUi6LO25Tyj8sF5pMs7UyWi2IrS64Mtl16xROzoFOh31YwU1Ij6zDFghqnex
         9lPRl3U/UFOKRZ9MiMkIFK+dRP+FfmSlX+G7SaO26GsPQ/+KWsrDVgf7G8v5dJeQd2sw
         Kz8A==
X-Gm-Message-State: AOJu0YyCdlUJaGs3q1TxnSp07sYaUrCSw4g0OKKsBccexL2/fAK2PoI3
	0jttkunAlcXpkVCVhgtVqKJn35TPhjayqUrahqRG6bY3NmJ/VC41GzXnEULsFGXsN0qUmJu7ush
	cCLv/h6qKZLPfIFuONtxYt2UOKUq9Mu+WCzlDwa3AtFD+/t1yLSsoIMSHOuymFnQn
X-Gm-Gg: ASbGncv5K/dWKbn6DcDoyFY4BNToDy2krDrb9iAAt0Vd/9mhlM9dh0/1j5p+lEE9+jS
	MTEcdSPyHNPvqLVollCraQ99GFaQt0bRa1gS37mMj99ri8a3uN9L/avNv1Sa8Nmz62VE+Zkm1V8
	jWDzYbahelbKqddzLz9ilXX1YM/guyPujvQ/LtshETZcS/mH9/a0ay+CSnABYjzR5t1Y+eswMyL
	4deox2AA/jCLpjVNGCNb3cxiN3VXhHivWqOJipL3hepFhI05FVc85qcF7TmfljCQWkaVV7Odebv
	CyU+lGYTDfxiA7no07BJXvS93be+Xx9yFDzQguZkK+etUaIlfG/MnO6Z6EsPBaa3qTyaOA==
X-Received: by 2002:ac8:5d51:0:b0:474:bc4a:edc8 with SMTP id d75a77b69052e-476c802e949mr102042711cf.0.1742313268455;
        Tue, 18 Mar 2025 08:54:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6xTKNeNNhEgwTIfTmczzperJP2O4LGuYPxK2AJYkX+m+z/87TGCFWXQ5mEjZvJDgSdah5Ew==
X-Received: by 2002:ac8:5d51:0:b0:474:bc4a:edc8 with SMTP id d75a77b69052e-476c802e949mr102042531cf.0.1742313268055;
        Tue, 18 Mar 2025 08:54:28 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816ad27c1sm8087797a12.59.2025.03.18.08.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 08:54:27 -0700 (PDT)
Message-ID: <64ccc09d-7e1e-4c20-90e9-43b36a9cc46b@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 16:54:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Stone Zhang <quic_stonez@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_miaoqing@quicinc.com,
        quic_zhichen@quicinc.com, quic_yuzha@quicinc.com
References: <20250318093350.2682132-1-quic_stonez@quicinc.com>
 <20250318093350.2682132-3-quic_stonez@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250318093350.2682132-3-quic_stonez@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f0U_MV1XqdLVoy14GwjlHuS3-opNLbO-
X-Proofpoint-ORIG-GUID: f0U_MV1XqdLVoy14GwjlHuS3-opNLbO-
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67d99735 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qC_FGOx9AAAA:8 a=COk6AnOGAAAA:8 a=83HhcBTouBSDzsAgFTAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180117

On 3/18/25 10:33 AM, Stone Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
> ---

This change looks good generally, but please align the various stylistic
things, like property order in the nodes you add with x1e80100-crd.dtsi

I also see that board-2.bin doesn't contain the variant string you've
suggested ([1] @ commit 646e008ec53a8bb9ae16ebf98a65b29eaefd6da4)

Konrad

[1] https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/blob/main/WCN6855/hw2.0/board-2.bin?ref_type=heads

