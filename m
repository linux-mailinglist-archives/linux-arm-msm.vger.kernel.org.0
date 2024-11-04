Return-Path: <linux-arm-msm+bounces-36896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF749BAFE9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 10:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFA491C21FC6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 09:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CE11ADFE4;
	Mon,  4 Nov 2024 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1wJhu7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502291ABED9
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730713137; cv=none; b=hK0PL9EXMl10AJEmriADXYtuyCuNCOZvYbbrDBlt+wC0Ku8CIRBQ5svvUddKW2ueP//zdblvXJsPSMjEPBF3gOSYhQfahervpdvZuS1E4DsNYXp9yN5Xoi1bYm0E7SEIfFkPE+UlKjYXhzJDN9RfW+K2/llXHAgYxkRyeqp8KfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730713137; c=relaxed/simple;
	bh=v+5uKrxJPK7NSh5eV2LEWmykHhNXvjyhTaoGacIPfPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2Fm4Jxg49vtsXhSCIlDyxRH9G+728rCPSyHjAiClslUqp3gSmSl/GrA86DQakmHcxZ57x6MUfRxg2BbM1OCiFIOd6h0UxupPgrD+5sHTBEdyzPbYW5MONYlfxayLxjHC9LDCeudlaNvxyo+jiQDZ6SHYJDPSU9+1vHAeTv7OnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1wJhu7o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3NvIas010819
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Nov 2024 09:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+0aO+sDRIu53v+/HLYpCyoLln7SKUM52sQdEs3soqE=; b=b1wJhu7oU6NSStN0
	uG/EbuVHMgxj+z23UhE7gAaztjEymjYFBc78PqigjxKmbRzv5rebESdlpX46ylAJ
	ekHK6BGPngJWonW1GKs5/VmbBdvBwxYCuHJp9LXDCfJLxebUKpQIXccWJyhwuDEj
	6BwAQhT2kedyWWDFndA8PepiT1UHdprbDv17PU1wcXJtP0bcKid4qmBYjcQw6Lp3
	TcYmeeSpazN9X3rknhv0QRh0KNaVwVFZLrCwTBEi2EJP2sm7uCPmZLM+WZDfiRBr
	QBPhyx5ftXjB4NeefRPqGN5+MLqdLt5fKs1Q3MRB1/K7tkJqqc3JBSv5C4S9OvIN
	GjyrQA==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd8hbkke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 09:38:55 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a4da5c5c02so5680705ab.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 01:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730713134; x=1731317934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w+0aO+sDRIu53v+/HLYpCyoLln7SKUM52sQdEs3soqE=;
        b=qJ/wQw7rQ0umm4isTF/JeKyNIniJtGSUJ02oKGHtDsCG6RAy98CxecW+bPkkfl+swq
         zKQzQfxP0TFd5MZLdSdGi3MkifZ2VTQnlz3mXB4PEuVN5I4f+lFszmWuY1No1/c3QD8I
         sDWgwALoJ1G0fL6KAY5ybRTWI5bJNzpS1zVZc0zps6Kho3JSyCnddDP0Q8jBriM8Xbzm
         rzegDizrRSh8ifWW+8pg2tfpK1PkgHEKw7bAgc7Ur60T1268zmh4h5QCf/EhxSyVa7k/
         FA+LomjLkob5YRrifRXA2cDeJ7545g+YP4KNwknjE9ZvLpG5PUQIx1X/xww/Oo369itx
         0Rxw==
X-Gm-Message-State: AOJu0YyQvfm2l68T+gqKgRrUsRyJY8GXlHZJNzRKIBWLYzid00k/jwvi
	bdoY/dZecIZIjz/IfwZpdyg5t3BqKOSyu1gE7Vdxhjt3+fNyU9EfvTLufU5/QFG2CpNVstDvROB
	v1jsn3YzU6aztJZqgLmKa7VqYemATOSBlgehvoNklfSLDhHbX9mJS3HoI54Bx0dRe
X-Received: by 2002:a92:cda2:0:b0:3a6:cb61:768a with SMTP id e9e14a558f8ab-3a6cb617b34mr11932195ab.6.1730713134384;
        Mon, 04 Nov 2024 01:38:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEbkTRmJu4tXOQzYcWlGet0DpZexFPcRF5ecWMR54BnSeHzrLe4K78glfIVccskz28EpjAcQ==
X-Received: by 2002:a92:cda2:0:b0:3a6:cb61:768a with SMTP id e9e14a558f8ab-3a6cb617b34mr11932135ab.6.1730713134006;
        Mon, 04 Nov 2024 01:38:54 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e5664931asm529198766b.182.2024.11.04.01.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 01:38:52 -0800 (PST)
Message-ID: <f6205012-5f5b-4613-bcb5-dea3f904b5a0@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 10:38:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: scm: add modparam to control QSEECOM
 enablement
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241103-rework-qseecom-v1-0-1d75d4eedc1e@linaro.org>
 <20241103-rework-qseecom-v1-1-1d75d4eedc1e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241103-rework-qseecom-v1-1-1d75d4eedc1e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3-H0P5CaV9v8Eb3NBIhUojL-2iLJ5Gcn
X-Proofpoint-GUID: 3-H0P5CaV9v8Eb3NBIhUojL-2iLJ5Gcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411040085

On 3.11.2024 4:37 PM, Dmitry Baryshkov wrote:
> In preparation to enabling QSEECOM for the platforms rather than
> individual machines provide a mechanism for the user to override default
> selection. Allow users to use qcom_scm.qseecom modparam. Setting it to
> 'force' will enable QSEECOM even if it disabled or not handled by the
> allowlist. Setting it to 'off' will forcebly disable the QSEECOM
> interface, allowing incompatible machines to function. All other values
> mean 'auto', trusting the allowlist in the module.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

>  
> -static bool qcom_scm_qseecom_machine_is_allowed(void)
> +static bool qcom_scm_qseecom_machine_is_allowed(struct device *scm_dev)
>  {
>  	struct device_node *np;
>  	bool match;
>  
> +	if (!strcmp(qseecom, "off")) {
> +		dev_info(scm_dev, "qseecom: disabled by modparam\n");
> +		return false;
> +	} else if (!strcmp(qseecom, "force")) {
> +		dev_info(scm_dev, "qseecom: forcebly enabled\n");

forcibly

may also be useful to say "by modparam" here as well

Konrad

