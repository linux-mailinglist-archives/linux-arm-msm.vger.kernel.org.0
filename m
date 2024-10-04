Return-Path: <linux-arm-msm+bounces-33097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE9C990047
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 11:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25B49B24A37
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 09:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D69A1494DF;
	Fri,  4 Oct 2024 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F53f5GsZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FC914C58C
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Oct 2024 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728035560; cv=none; b=X5xxn0oaopc8ipeiUYIY4CWQX/Gxj8rENFqNhBeUs6xInKleuPEUN2YwnbPV0YxMKpJMjuec5FZsqL4LGvIUYtymlhMWCcDh6EVITU0PUqCL0HdeSLcH3H0HzyOT5x2Q+H+NPcRHql2/+HGRzGrGXLgUzkkd+Wo4QcDJmuasX4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728035560; c=relaxed/simple;
	bh=H909r7EBxLaodYwgEv2a99zZiE139lBLdtGTsN3xwh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ef9dcRuEI1RJwMMdM7A3gPHj0089ICA4kWGSvwgUCLKdiPf7SRm4Y/CuBe5Rcw8gY9t7jLsSwBCV7uicSF2UdKq0N8jlx7ySUiOjtI0KiFQ6JRrust8r91A73yOgeyYmqqs/s2sS+QDVEsN+S0DMOuwNwi4ePNe7T8gvn6Z30oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F53f5GsZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493HxPWc022353
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Oct 2024 09:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoyqY+ou/5x6xtj7TFGxDBBjsMoXv2qfS+nE6ns1F4Y=; b=F53f5GsZJMRSr8oK
	M5VY22c5vbaFpEqEr4xhL4w2+SvByUgxRU5xoCXUZjaytk2y4Zltznyb09sWFrdi
	N0CoVXndWOHuumqdQW+gbdNjFILogfg3FtUF5ibza4bcVwQIvH8Xd3KoN1ToBoR7
	FEY+e8RvjnMMaolOGErhuFbNXb2Pg7PRZzcBZ00e4acAcLEmKhcVEHnx4yMgDly0
	aVNf28KJT3N+AtdVMLf9/uQBCbnzfZVEhTrnbWSZlw4PzUPAti/4myQJq9jUg0Jy
	fDSgPKSd5keoiA6Aq6J2R0lDhpnPVstUwv7FTBkwqCQW+/MKhz6g+M2QAeU0xmyb
	TtNk4A==
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205d9pqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 09:52:38 +0000 (GMT)
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cb5015032so2878045e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 02:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728035556; x=1728640356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qoyqY+ou/5x6xtj7TFGxDBBjsMoXv2qfS+nE6ns1F4Y=;
        b=Gd6vBmWB5I6pXoxK9RPeR8r7ZE8LDDDnBde5yD57wdW4/eKXpSaAq7z0mpv6XPw3VS
         uqgQAZpgc/Kvn2q0k1eV2Om8NbNQ1hT4DtinD3BPls19IC1olq1hEV6MOTlh8EmdpzHH
         CKgu1Af3nCRiV5ChytFJUrBu/idU+wQ2a1s8lI5Rgkgsmk0yFbzqQhbmDgZCkxZn0CL5
         1t/ORh/BIobg+Mo0n6Di3lbgPtFhLJrcWN0XBZ9i+ppGX3u5i0Hl8Q+aNgHsH05vDDTH
         wJ8xrR7Hj1vs09FbeT+3Ygk1UO4fC5VtK1GTCoa+94NLoYHq+GHlPh7FMPFyUlYdR3od
         hGag==
X-Gm-Message-State: AOJu0YxRiHg/xL3C8hyFZznJTc+kbvMG8K4QUYfDy1c1Bs8BKAIPlZtJ
	emAtivCbPLYnjETy0zg91hoXZ8pN7wXJuDFdOpHOfZuSNsjy0dpZBu0cMksFtNi54FRSnb150r/
	y2VjTS7MnNtStR+FgJ7JDfDEDQpfJjiZb0pWoD9zO0vW9lCJqqd5ucNmgY9P4t8L/7WiYGGoWRq
	E=
X-Received: by 2002:a5d:5848:0:b0:37c:fa12:8cf5 with SMTP id ffacd0b85a97d-37d0e50b420mr757496f8f.0.1728035555654;
        Fri, 04 Oct 2024 02:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGVpkedxRIRARtG1vsRB0nGp8t4h6rguYRWAbij3uXXq9ZtVjE/NRidrif5fAPl/UfC4sVCQ==
X-Received: by 2002:a5d:5848:0:b0:37c:fa12:8cf5 with SMTP id ffacd0b85a97d-37d0e50b420mr757485f8f.0.1728035555283;
        Fri, 04 Oct 2024 02:52:35 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8ca4f66aasm1665164a12.84.2024.10.04.02.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 02:52:35 -0700 (PDT)
Message-ID: <bf4d3fdd-e23a-4747-8ee7-137d925c2c03@oss.qualcomm.com>
Date: Fri, 4 Oct 2024 11:52:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: sm8550: extend the register
 range for UFS ICE
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>
References: <20241001-wrapped-keys-dts-v7-0-a668519b7ffe@linaro.org>
 <20241001-wrapped-keys-dts-v7-2-a668519b7ffe@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241001-wrapped-keys-dts-v7-2-a668519b7ffe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: noWZY0_PQUf78Vu-4Xu2ZrlJbEWspMpp
X-Proofpoint-ORIG-GUID: noWZY0_PQUf78Vu-4Xu2ZrlJbEWspMpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=741 lowpriorityscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040071

On 1.10.2024 10:35 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The Inline Crypto Engine (ICE) for UFS/EMMC supports the Hardware Key
> Manager (HWKM) to securely manage storage keys. Enable using this
> hardware on sm8550.
> 
> This requires us to increase the register range: HWKM is an additional
> piece of hardware sitting alongside ICE, and extends the old ICE's
> register space.
> 
> NOTE: Although wrapped keys cannot be independently generated and
> tested on this platform using generate, prepare and import key calls,
> there are non-kernel paths to create wrapped keys, and still use the
> kernel to program them into ICE. Hence, enabling wrapped key support
> on sm8550 too.
> 
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> Co-developed-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

