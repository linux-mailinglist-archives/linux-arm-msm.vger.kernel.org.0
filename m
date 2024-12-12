Return-Path: <linux-arm-msm+bounces-41867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD73A9F0091
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 00:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BEA718872B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 23:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E868A1DED73;
	Thu, 12 Dec 2024 23:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBe17nea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862841DE2A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734047748; cv=none; b=Wg4b3mtx+2w/rcfbJ84TLGpB53z0P+mbl8gDtx/J4QVyfetXojVvl11XvLVG4tsDzmleln2214G7G8hfGujXvZJ7EmF53JG4PBMpKH1feRMdKN9ONJ/gE5bFQR/qHdsExy5sfOWVN/Py11Hz+K50TYhV6J1Fn2+immqLGs4xYpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734047748; c=relaxed/simple;
	bh=oVg0v3rHyXicuVAXamNoc38i97c4urG7OffM7x8JcOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xyt61YJ0F/2xU07vB7An93GWalPOt1zNa0+XETk7n5uidmy2KvLlYRwpg5U2EIkP+UDWY08Ud7LBg+nGzXiMm+g2wuptE2WNXCePViKWf0SovxRfgfiZQVFr9z2UoKVOl4UsqBeC02pVsYUc1/hzkm9w+2VivYmfC24/sTOCS5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBe17nea; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHCQaa018754
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oVg0v3rHyXicuVAXamNoc38i97c4urG7OffM7x8JcOc=; b=SBe17neaYoTIezHg
	npUBn4agpIQUbGmWUBmnVkw+uFrCxgC83JXvtj666yVLxuJfkCm+zwAJDm0V5fw4
	vnrKeeRVB5n13Bnp11wP0qSwxB/Pv61gl/ijNcglqjwZB8VDf2Dd2CBhBz93A1dp
	pLemcOHbWDwJJR/zT0wt27e/piZdLfEu61TAoxsyBkzuviHWPKlJTboLOz7ASy8h
	R2RLZPTlGluNUkYLn0lNHkwKRcUkiLCzuE1M9S3Ar/NcJLwcv68kptjwk8klNcTQ
	bCmNRofpghb4s6sxfWbB/X/QA3RjwzICXaq0r+4Sv6r6idgwJUKcdRX1/AGcaYwu
	M7ZVFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ffdyv47j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:55:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4678aa83043so2996291cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734047745; x=1734652545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVg0v3rHyXicuVAXamNoc38i97c4urG7OffM7x8JcOc=;
        b=ZSfe+lw+IVc2BKzhpmxXa8ESO+lRiAWF0+1yR3/AHWaoc8AEKQQjVwiXzLFlvcp/vw
         Xsem0nrm4SAm4VGg0XGDDFWaKdQtU6fFJyCL26ZmWtM3SrXOhe3bWoWzsVYQJ5BUNYxX
         JBbIm3cLPZRHvs0hBf4SrRjVoRiz36QawBXyP4z9v5YNy/1clJFocHW0a+ofpq1sV/V8
         cwg5cIWBmRPc7H1rbPejO4RZR+TUBU+bEdJLgSv64zH19IFZvMoU3r0j53+1jKW+zdki
         7bBnziuV/c6Arve4UMSB/bAcEKlGG2dt6mhV4sURzPoM6OP3H77OEbzM/Q3bFm+9CHxf
         mNBw==
X-Forwarded-Encrypted: i=1; AJvYcCUtGeeIegl6PfBIgj9iaph9perYDEW6t5WuOFDGvQu9bCsh/fGT7aQ/E7QuunNksEATDKC+gEz78JtcV7rN@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCuIf7tEChiGwJ1N5Fd3OJzDj0bNSBOyPStsWMHPxQArhQyEf
	ao74mFesjBViYLoMgy3k06qQHuA8MoBfn7bnCGZZa8yPkNOFvlSJWUoRdWbTC43wkl8ybhrJ5Ly
	8U1Kn/Cfg0y+e6+6ns5FE3NZbyBz1gjQAw4v2tTW/ca0mRru3qNjLKBopXyINWzci
X-Gm-Gg: ASbGncv3DHK8Kl4QuLSvzwQwELBmwllbDWCCl2he55FDgeFEmvgR8vDAMcGKgqCNnOR
	/cbAFH4APb2s+gN2LiMrzdd2hQPp+As/dEWrsN6Y5UeIuRiZAmtqZhHmCd/zBVWBQBkt6OKT4ga
	gu7OPmmMnsE2eGijjHYN6v2Bp7Rrttg3gTmZrlRbqBv5fCGE0y2dNaTpN8nFELnMbJ0OSwAxDjD
	m0RAPM/U+XXZxJWYCeILMKAx0F5mUwAkXXmIJWAoUtAmQXX5vy29U+UJD2E9O/q/1rA98xd33DD
	kLFzrgodmjtWdyNGn4yNhgEZqVt3Jut0WNh2
X-Received: by 2002:ac8:7dd3:0:b0:460:ab1b:5ab7 with SMTP id d75a77b69052e-467a5802b48mr3256591cf.12.1734047745451;
        Thu, 12 Dec 2024 15:55:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5IGqhNo+zsFxi3FPjf25AKosCgwvN9y8sOX3gGEAOT3U3/kWq+sQTEl3tjq4dpc5mymI63A==
X-Received: by 2002:ac8:7dd3:0:b0:460:ab1b:5ab7 with SMTP id d75a77b69052e-467a5802b48mr3256381cf.12.1734047745056;
        Thu, 12 Dec 2024 15:55:45 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa65d18510asm861495466b.122.2024.12.12.15.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 15:55:44 -0800 (PST)
Message-ID: <a2f80840-75d4-4380-aa85-d83242db08a9@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 00:55:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: ipq9574: Enable TRNG instead PRNG
To: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241206072057.1508459-1-quic_mdalam@quicinc.com>
 <20241206072057.1508459-3-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241206072057.1508459-3-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vVv44-RBpyqnBg9yYxf9Brn-GuDGu_xt
X-Proofpoint-GUID: vVv44-RBpyqnBg9yYxf9Brn-GuDGu_xt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=648 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412120172

On 6.12.2024 8:20 AM, Md Sadre Alam wrote:
> RNG hardware versions greater than 3.0 are Truly
> Random Number Generators (TRNG). In IPQ95xx RNG
> block is TRNG. Update the corresponding compatible
> property to ensure the hardware block is registered
> with the hw_random framework, which feeds the Linux
> entropy pool.

Line wrapping should be around 72 chars, this looks funny

Please change the commit title to 'update TRNG compatible', as
'enable' implies the functionality is not present as of current.

The latter part of the last sentence is misleading, as both
compatibles do the same thing in the driver. Instead, put emphasis
on the wrong compatible being used and the patch making sure the
hardware is described properly, without functional changes.

Same for patch 3

Konrad

