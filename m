Return-Path: <linux-arm-msm+bounces-36002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7497B9B178C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 13:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C6FB1F213B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 11:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547C21C6F72;
	Sat, 26 Oct 2024 11:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3k2UMFa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DBF217F47
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 11:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729943151; cv=none; b=ZGUYiTrcDPXI0KPnwPlhrxy0beTQnlFgaXsgZCLnWOoWQ4LTJzKBxd9KaDiZMNkqMCuQRxSDjIuf0ZT0YDRJy2CbsUEoxBmalqsJxAATvFK7c1X1w5+GL3kIInjXW8p+d7WMO8WFziy80g5IIsgfIoKZlligik/lttxfQDvucaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729943151; c=relaxed/simple;
	bh=A6nMVW9hN67nOqMRudXXRcAOa94JIuRJn8Q0NML6a+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8XYMPaVEk+XeIKmhGhYajMh6ayvEguz49nVWDBem5hEcJrjR4/HXAznVnxmZM0LPtrE2csQr8XqkNhK1zOzlOR/dfs3162dsICl90LBRFE2IKHe1J5ujwi8Q3R9GvYvXLS1+7wbM3Ql2KzmWyVl08Wn7vpG19EDxCu7whExBlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3k2UMFa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q4dxol022378
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 11:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wA68l2lf8wyRrI4R0eE4ltYNmKHxDtsxldAExe2fGzY=; b=H3k2UMFairNLtfHM
	v9W60fAGmcec5NDWUBbQWauBq6grJNNxWuCTckmZO8d78fjZS9N4T1vy29ZCtCNf
	SqOWU0sdnN2g51KRbGko3BvTlxrYvRsPls1sJeLNOxwQz2yWIAvvLOAsbJLakULQ
	cPPrnoj0xwLH7yZr8vRzlT5EQLGqkuHqMzLaxjRjsWU7BRnstoI8c/+fBavW9D/5
	uT95n7F4s3367AHG/iRDVjhjxJGTZ0XS/uSiIFcwJsmltNolhbq6LbmRFNtNAypB
	5nx0IAd5Ig1Cc89C82TdGA6U3X+gVGzkn1zEljjhHKTkgr4mB1MLEa1/lGpGN2Lz
	LBjJwg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gskjrs57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 11:45:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbe5e8658fso5983916d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 04:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729943147; x=1730547947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wA68l2lf8wyRrI4R0eE4ltYNmKHxDtsxldAExe2fGzY=;
        b=ffVfVMQYWmPwu/h5OUmTueAqhdP6LE9KUAxKn187CFCPTEm2irG46hYBZ+lGBOYJf9
         z3JTeZ8I1JSbt47udOzsCQqcIpQSchEMwGC/oVaRHXEHP2H33otNKM0z/ENldtSdps4L
         niaFkT5TI1eRsni1A1HK3/wDVvG6dIf+0cCltDXk6TEfmjldJTdH3yq4VA0vOgvBLFr9
         NVhNgDUVLEICej4fsVSTTpRzzhV5fzzUWfB7b9efDCw2Yp6FMkAmu0f2p6Fx1lQqmcjs
         bLNtyYjtHu1Zr2aIKrFz2qA20NC4tNI+ZOl+JoqnbgUgiD1RouCUeGzP/r4tJTZeJWaO
         s1Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWP3WUhTqnC7vS+wJe1GKO4yhFfB/MdYbAawnwZnMJPfOWd0BE6DIM6S3ZN+NFzd46nS6KrpCEyOBm72r/y@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmlh9AsSGEoucW1pz+ggnfC5wz0fs92sXcTijlwOKdF72oMumY
	Or/D6Y5T4b8zeA8N5w8PcPpg6ph6+YRec+TYHBWFn/JlpXetC3CzttLMV1YJKjprqRgovUVmTbD
	ZAjhTrTFfnuxX8KDRthmIwJry4xjuMdFP0hg/CglrNtCzTIxnO+A+CPfuD1kpHg5J
X-Received: by 2002:ad4:5cc1:0:b0:6cb:4e9f:7370 with SMTP id 6a1803df08f44-6d185862964mr16327866d6.12.1729943147551;
        Sat, 26 Oct 2024 04:45:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWADU17TJTVGXKCcyZaOhFfjzC7J4Ij3YUYX4KBl8kpdlvloYKNu7sa1t17L6IFUTcv7yxJw==
X-Received: by 2002:ad4:5cc1:0:b0:6cb:4e9f:7370 with SMTP id 6a1803df08f44-6d185862964mr16327626d6.12.1729943147166;
        Sat, 26 Oct 2024 04:45:47 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30c7b5ccsm167348266b.152.2024.10.26.04.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 04:45:46 -0700 (PDT)
Message-ID: <b153229c-3cac-48cc-8f85-7eb9bb0ff79f@oss.qualcomm.com>
Date: Sat, 26 Oct 2024 13:45:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/8] mtd: rawnand: qcom: Add qcom prefix to common api
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241021115620.1616617-1-quic_mdalam@quicinc.com>
 <20241021115620.1616617-4-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241021115620.1616617-4-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VY4d7I5oaXNnHsEYx68ej9Bd65ajeWRt
X-Proofpoint-ORIG-GUID: VY4d7I5oaXNnHsEYx68ej9Bd65ajeWRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=620 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410260098

On 21.10.2024 1:56 PM, Md Sadre Alam wrote:
> Add qcom prefix to all the api which will be commonly
> used by spi nand driver and raw nand driver.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

