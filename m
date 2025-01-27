Return-Path: <linux-arm-msm+bounces-46229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2075A1D4DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 11:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 308293A735D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215DA1FE449;
	Mon, 27 Jan 2025 10:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C88+i2P/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1951FDE2B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737975172; cv=none; b=kuyCuyD33cH05HRbXTK3ym+7xsKBjacjm3mgs0RHUGPBpwKJOb7hKTuNKkpk6RfM6XivcbN45XCHg4TWakKysT5hiQQrPoSijo2qdjKQjJAQCiSexaHpqotihon+upYmYOQCGOKxsw2RMpRyKz+QJtBGg2TrRbm3DCkZjtpRGDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737975172; c=relaxed/simple;
	bh=vNUQYQadkUNvKvScDHPn46h9AjzZ9mX7qgUIqvLBbbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JeMhjT3uAH7OSRkDwGKsxaTPFCeV0zWkNOrPXE5o9FADO+KbtFdQdnGO1e8HjszQXyRda8XDz454dwmZZZ3mOM4xXbJmFUOayiSC7LOGyRoBQll1AtdKI3Bz7nlZN6gLXXRbghvFgox50YGeP5onqXpZTSObNF4pgdtu7z8ygkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C88+i2P/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R6KWIK031789
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzuABZdcPI0lbW9DLZ/XzAnk3dOGMz7EdaRwj4UCTX4=; b=C88+i2P/hQyE8LtL
	b7r8a6DY+rhh1yhxq8MIzT9TyGwMT5qulyVoRgai+cLqEz1VEEwFKIm0B3xaxUq7
	2lZotFQLdnI2WXGgk4v2wCpjw6ZgeE+bR/dS1n4baLss+c3J5oVApR5j5suA5lIU
	1WDPq2btz8XsVsuvOVfRaEvlrq9pI3Bt1yX4LygEQhXeD6ApksgcxayrIPE9z2Xs
	7Pls9pl4Sws4z1dLgCw+YxrFhqTXBaicTjnnXVOuUEphnI2NFC2hjr/PSXVlsdRH
	kjQDzsq+EfGyV4zY1vX9hdv7uhKQakHBwj/bcjVyRd9RNVQALJM8UG4EOL3jwZ76
	/l7EGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e4su0ge5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:52:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6ea8fc9acso72879885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 02:52:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737975168; x=1738579968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzuABZdcPI0lbW9DLZ/XzAnk3dOGMz7EdaRwj4UCTX4=;
        b=p6a6Q4ie/2mFW6TZEYdYQQ9paTzVFH72NlEA1I/X2NLjdlXu0/gA6XQEQFQzZNSP/R
         MiAPO/V4UwZTYYCuZ1x/PRFn9xSidHodxrrrIbN6UfrggVOzdTB5153hbw57oh1rEb9r
         tALpZJ1E+yNpeYye8JFwrfviSUSPZ9t8yObcgg+XI//ymJtAFn7CKeuNBD2jsUmmaAyb
         DM4eBo3Tw48pAiDvX+bntb3vdWnmJTU5UBmfULSyhti44Hl5/XPeCms3djzPSxRGKyN+
         O5UL0Ur41QERIG100qfLx1stilNQHyFXnHJt8gWMxv3Wznese6E2MZWtFIPDpw2Rwkk8
         UoKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMNNsQe3a4UQnq3YoBr4UJiPDSNs0eBS3HOuyQUSIQD0o8GKasj4wySrImmxd8N2BTb2S6TaF8bBffEZ8+@vger.kernel.org
X-Gm-Message-State: AOJu0YzZkCjk51hn8YakVWiYOiIExkSEEmQSL/5Bz09WrVpPfiF/oZK0
	y1/gtcdpRzE0TmpiiHFvIfYT+/W2b2oxnP2v/2roNlHWkaFSI1zKmpJL6zXVRmpacBt/kU3Hk13
	n0ipjA4WnBxs+tMDKEFhSZlCKuUGsTbaaW49Y2WsWC19VYBcUflFkDWx+7ZkSX75S
X-Gm-Gg: ASbGncsSQiW8J8cS+3wer4PYJTA0omoXGdmI7ZUsZfvwZuUigNYf9DbZGuOaSdhlG6i
	mpO2ucS9uJCnxhhYxblzH/DmvkCnMPWezHLLKGJlKDXmB0c86HO2e/cKuoDHE66jGE0gOZepP0z
	6LHMDabXzz/0T+vawQzmMAHH9OI/2YWEzIUUNPhmzvdmMQ9BoNrqvD7slb9jniEdfIiRwWAabRK
	yNx9p+PPGG+qkxlG+XQmFE8cACI+SnPouQAM4M/Xn9cAsRGN2O76tVXsgy7qolxwVXi4bffZUfz
	HWad2LhD8LoQqUd7W/g/HEan+wO6znDHmzwVjWivdgWCTL1Q9+SGPLRD4X4=
X-Received: by 2002:a05:620a:4713:b0:7be:3d23:c2f5 with SMTP id af79cd13be357-7be631f2589mr2034550085a.4.1737975168547;
        Mon, 27 Jan 2025 02:52:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOE6S8P/ZNvxadvHMIP2h0O+Xs9ND1xC7izmGpe4732I2PGSMIRa15/aitydsb/TkNJ0D19A==
X-Received: by 2002:a05:620a:4713:b0:7be:3d23:c2f5 with SMTP id af79cd13be357-7be631f2589mr2034548985a.4.1737975168252;
        Mon, 27 Jan 2025 02:52:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc18628d0bsm5071437a12.31.2025.01.27.02.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 02:52:47 -0800 (PST)
Message-ID: <113a48f8-0f13-4179-bf08-52da2a817dd1@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 11:52:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: Do not expose internal
 servreg_location_entry_ei array
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250121102817.68577-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250121102817.68577-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fu2ptQQgweJ7_RcANNymyTjjSMAZcHhn
X-Proofpoint-GUID: fu2ptQQgweJ7_RcANNymyTjjSMAZcHhn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=933
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270087

On 21.01.2025 11:28 AM, Krzysztof Kozlowski wrote:
> 'struct qmi_elem_info servreg_location_entry_ei' is used only internally
> in qcom_pdr_msg.c, so drop the extern declaration to make headers
> smaller and code more obvious about intention.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

