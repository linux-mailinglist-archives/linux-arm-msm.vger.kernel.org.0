Return-Path: <linux-arm-msm+bounces-57276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD99AAFD8B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31C509C3C4F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA1F275102;
	Thu,  8 May 2025 14:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ja5X++K1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A95274FDE
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715419; cv=none; b=emWFW1OQhfrXboIfNoSppADC+aHdOfp6wecwNxanNEXk9BxRUAZWmrlxflioO1efRazWlCz/l9hEuJa1QVOEKHXm3EDkxx/xiaK+zvoME+3qFBHZI9UhxqdBHbjZcYSVN7onri2p6+sd1eobMPlu141oRkmQBbI0/4Z4STrY3sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715419; c=relaxed/simple;
	bh=QZiZoalbyPIFmrGB7MjYu/yFu2xYCiPLxNK2Xpyl+GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pBhUjQ31UbJYV5US1zmIPKpejHUi9sAguogQDKxmqyZHuq7BoRYBtpUNtOWbSEbtK+vZzFOx5uyVXwCf3Bs7OtylnF+aFNMpHU8AH86K4lh39DoJQz5yAw8rXcRMG+AFsDdq9+9p7stxtx3uwBdKy8eGSU/w1QcD0p7UPANohms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ja5X++K1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Cfmc9022969
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 14:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ccHcTHH6wwQXQQyGRXU8tZr/iAlIyx7YdnKF7+4xdLY=; b=ja5X++K1RQCV+lEh
	Gv3lIVnhgY7fSsT6FNPMIq+wbHxz2pbcMLboJ4u8AzaKuayp3SOWhES7WAjkWJpB
	NRK+QtXP/AtOaG+KQghJE27reoAUckb9THDbxVtTomfe5K/3vqlnYdzEmI3Ju+Ot
	CkdSH31AoraWSjkylBdrxcFxS+RsKqNdiL8BiiIhjDwkhJWiSden0CYVFS4y66oN
	j5qDdmHAf92rrjKO6bvuAELZKMetZl+ZkBlNS4IufQYpXYRAZx1aNYs10nIZwZfT
	NwoIbr4YV8XCEatPQFu1WPf6aPMVJbb+BzeBHPy0q1KEvaf++Yu5/4CPyCFaOrrr
	ss2wcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp81p82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 14:43:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso25420685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 07:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715416; x=1747320216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccHcTHH6wwQXQQyGRXU8tZr/iAlIyx7YdnKF7+4xdLY=;
        b=BOtZu99ynpvQVJ43Px1CKA4iRnDJfeFtFIrdzMu5pyr6smWSRGF0u+uzE0v8vL4CYy
         yPCKWKbupkHeVzpBp1PZ3mQEgo6FoEa9R4W/vvlRh9RFEImp2f6z0Le6FDtURRYk+w84
         R2uVvpisVD9vJhmWuPTwhlpswpc9e3LNbqdkPDVYfrZtYuAJ0VGcdMc/JY/yRh+uyq3D
         VNJC0NURiepT8rQexNLuiPyTQ+zhl/ErphBEUsC7lwiVhcdJAdZLMGonUCGiT7wfXXFh
         CS7L0ufDIrFv2mR0hZtqHCZbKPd2uvP8qSD9HMWLiET3b8K0Xhpj47iN0OhXfZnyP/JJ
         5KGw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ9AABWlrhNbOe1mTjGRNi0Z42Zl9I4+K++8TGnF21gMtWG3IwiuCfo9u0Q09kbZK4z7pWMki1gtG2WO5L@vger.kernel.org
X-Gm-Message-State: AOJu0YzzaF6UIGb16smLN6Tvdy+3LaH1PB2itlugEb/ajYfV4z1qBKA7
	ecZmRS6jQDD5ySm8BXAv9wjd51+MAtFRAqL5/ovXFte/oqNMltZozp4a4JXwJ5LQ/X1ewcMn8MG
	nweRf+O5NoFgb11QYVhiUl5igVus92f9vuGG2FmOTpMeK0PsuKdHfOzSOGlYyOqOE
X-Gm-Gg: ASbGnctGDmz6vIBFtJ397oiPq78xKtlX2LJq7jzdaMGPIponoJa6mW+N/b/0YMVnOfz
	ZX0rosJHBUbSbqn/DJaS02I4co8wx/cB7mAYIdKcJvioGip+y2zQJPQggWPCFVF9jukmph5MvDq
	vqHUDbRDJzZckclCL4iABOiNEpxzhvgdP/dfTYmstj+om/JFZAR9rXUxGfuSc6roKd3TRFYYTFt
	YAgw3c6s9u03YFoYvfCsdpnbk7hZ6QW41AEv4F3/OkNpoM5i8FiLM3BAQuIn2+IINC0JPFDaDEY
	1U+Qed2YXCjNv7/mTVEs8dsKsQ9/oolr1WpSdV2GXhTqNbsZzF1HWL2cCLVUg37zYf0=
X-Received: by 2002:a05:620a:1793:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7caf73a26f5mr453367185a.6.1746715415855;
        Thu, 08 May 2025 07:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGZx8hwuxykMt2kAYXqKEJRioot+1Hdnl4uKrWI1L1nMr/jVge9mVrLmUsf/5ZZ75qKvBAWA==
X-Received: by 2002:a05:620a:1793:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7caf73a26f5mr453365085a.6.1746715415324;
        Thu, 08 May 2025 07:43:35 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77c04411sm11181106a12.67.2025.05.08.07.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:43:34 -0700 (PDT)
Message-ID: <1df330ef-4de4-4641-a42a-532b05bbd98e@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:43:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs615-ride: enable remoteprocs
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-6-52ac6cb43a39@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-6-52ac6cb43a39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681cc319 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=32Q6MQ-mccEAdxySR7UA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: K9CKtYw2f9PRyPNV4q3goUD57MZFzd0b
X-Proofpoint-GUID: K9CKtYw2f9PRyPNV4q3goUD57MZFzd0b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNiBTYWx0ZWRfX5PJJl7W+Bdw5
 XeVmbkMTdPlelUEEDbEiy0QVhdUsmXPiK8dEyJfh5P6gIC+GBBYpKUMSzYNRmuy9eggK2vHh8hF
 +kTESMvfsoRAed8n+VdhlkQQpfiOE87VSfiCNmT9Cc1t5m78f18pJdwiNPtHgMWT1/g5aQEBUjI
 8iZhgGhUdXAupI6ivhToU/aFJOEODFNyp5HM5V1yQEakJpk5cVPhFnBxgrQH26Zg+6QAsryWMeH
 fWiGvt8oHdYrej+fHi5oGlg0+v7Ociyxm1Vi5olv61AMFdKjcO61huKmJzh3HLU3lseNLJhrnmW
 yknqCBmSbXsTwA2z+taCBUYjYG/UMqvyyuG5gXbZGJM6cDBHF7B+7xBIatyDxTjFfGZp/6bAsWT
 rKA3MV6hfgMMBmQaHcOc+E0djw70g/5MTtn65AMe0mee/YszdSf45H02KgiQMr7wzLfwHLno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=715 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080126

On 5/7/25 12:26 PM, Lijuan Gao wrote:
> Enable all remoteproc nodes on the qcs615-ride board and point to the
> appropriate firmware files to allow proper functioning of the remote
> processors.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


