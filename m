Return-Path: <linux-arm-msm+bounces-88668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88257D16D85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 07:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF3F7300A34C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 06:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF3723BF9B;
	Tue, 13 Jan 2026 06:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OV2sO88P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxRU/RA4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2957F3624D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768285801; cv=none; b=YkjPkz6EN6Pk4yGTmjJ14c8G8UbYx9CbaGMa4ajqObkJhfz5ghzr7rIYteBG+CYq7KvtIsP+5nXLLPVKLwzVefG7jZ58RdvBJjeJZww8CYywVWcr9yIh7tln61MmHybGSov3UGElaXxAAfp674yeYpEwMddhVkWqZ7dKOtOWoDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768285801; c=relaxed/simple;
	bh=Mx6pTFExw8gPMHpw53t0HCwZdh8m0w0yz/ltsxN5P3I=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sWWMVN942iIVLPlKwxGV1qUX7dWbXizv6s3iuN2r1w/V9p3bpK8rqRYWNK0w76RtgXyDTXtneVGnwguyUKv2qoW56DNX5fxEqG5J9w0vjZY9JDnJx+pZqIbC0xxrmb32525fDmaKaYDt5h/tqDqb4ZNOFPdhoSuIQ9eQApi6YlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OV2sO88P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxRU/RA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN5Avp2513676
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h3NBjLlMfndRt5hEY4bT8LlLMaIoupH7i0xqwnrQSeo=; b=OV2sO88PPE1+/1TT
	Eu9sdUlzbZ5Lz8bZop59ngmW0790VoPrWx26KGP5NVm4yOaWWioExZziaugTf5la
	K0DzLS4ujNxKvLLYQVDJGDEwuM6cJ0UHXUmrHogB86nKUNjpemPDBbH7FqxQTnYP
	rI0KJljGuctqySJHWxdNjDRIUNFoSKcfFD20Vv8yZsq8Bit2Mxm8eL+M7/0APa1Z
	t9SqXEPTGaAD8w3FzTz8u5n3GzchgR9ib0stfutxpD0nsb+xOu+1VdNXbiNlV6l5
	wSWv985pej34Ykkgm20ZEfnE0QDkxbyT2coRZ1A8/7KHvSKTE66YsbIfd8HFrE6E
	UXw7jg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6y8sn7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:29:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f1f79d6afso87292685ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768285798; x=1768890598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3NBjLlMfndRt5hEY4bT8LlLMaIoupH7i0xqwnrQSeo=;
        b=fxRU/RA4RjyVbBBs/2N5VggUmdLOjtdn3vHE6jcx10KJeP4D6nUgjyrZNPCmNQpseZ
         1D4+nNd/zmGN7Nb/i4HqJI/Drd7zFQb6wEiucrn/pVJgZMuWMiC+OS8GiGRpURYak+TC
         sVXuSl7SihUWtlfeCdmYD+/O2PgbfQbeSEQkqwtp6eiRFuJmdB6fHihCxuB/TGZMcyb9
         i3cp/aP5934n6eR8FL2FKIqhOYQ51m7m0FsRjzAHCdu0wKRtp7WUyMHjfuozTntEOJ1m
         vuLEv/XRd5rQ+pXXMUWN+RzI6kuu0cIWRhgQecDfeosCtVQmBOIihvyDbPaa6NYTM2Bs
         +ltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768285798; x=1768890598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3NBjLlMfndRt5hEY4bT8LlLMaIoupH7i0xqwnrQSeo=;
        b=FUJ13kkAGG55hVs0+ZIQ/NXSf1SZUxnAPlqTyNmsrJAVWssKgKB734EHmg8C9XE4n2
         JThvtWIvJlx9Mi/PWXSwdlzA1qn0lvZ3m+LFxEr56jo5B3vGc4j6y/J1YbaEtoDB2tBZ
         iCoqQbD9S//L5tYF6pmpudaYLKhe7VgztZMOmR5WLTUIJzg6wN4Yy+W6Ey0hVGnhrC9r
         rzOJPDYRIKQgoHpDGRbyrjn/059dpLsv5Alc1XvhXTzWQPucYJNrM+ZRAuFYQwXIiU/h
         SlLTSuq59ffcKpoWdbCDg2R1FzQi/V2ZR+sexiVOHE2W1X3tXs+Q1gPwVnwdEHKTGSP8
         ah+A==
X-Forwarded-Encrypted: i=1; AJvYcCVwTQ+wfW1Wz0l22P5zOYxnOQtpw2c4/GXJP9O5A7h+ChfLdatKkwsON8Nkqyo4KPYZmBigvN7POgYlKga/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8F0AufOIp7gIqkciLAQ77rcUbDA3dTHHQo1pRtrnmtsgicP1k
	aUe4F5blVlgz5pSbpO4lnhPXtRfhhwpH7KxsUM/pqtlRFQ7tGazxQJL+eiDl68CUI6MgsMU9Qnq
	ZOQoyWqGsuSx064KFt1zxV0tENQOOWovDZdRTYiLjaK5c5BwiT5q+mcoipt8uVNkogGa1
X-Gm-Gg: AY/fxX7KPrJOgjqbQJ9ETScGY/N3HXaziNkJnRSSBheQV+atsOfnYx6aZvRc8HBXehE
	QrFxNoupD+FeT/DiV58y9Nqg5TFTpe/5SxDacLxKY5M9aDONmXfPe2V2cX8O6urU4wSEPCMS9DG
	BxE977qQLN5eHMXjfuBWQwvTLpT/ja+slRkjTqLqyXgiSUQ4XsB0xToKtUnQPu/SLV0S/w80HLk
	RymYxPXcJSM2CY81CHulQ9k3SbqZFy/iKWOgXCnx+POWlhdtb69FIji4ZCaTdIH0Lz1W4y6Owpc
	xqdPXRtNNO736SlhIId95uXbUGHOnVdcS68CrllNu7CSZfswpHXD2Gasd/0u1aPX8tdw9OLEGdp
	SXIy2orrCPiMVcXWGJ2K00N0SJxv8KrgxpVWCIwKmjVL1W9mENJEw0YieeKt0bOFGmLyWP4EzVE
	ALZ1FF
X-Received: by 2002:a05:6a20:72a4:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-3898f97adadmr17512447637.56.1768285798359;
        Mon, 12 Jan 2026 22:29:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHULNdwss15gu8iav6LwsrUNMVjCIONxFLkfJPwDS8zIEGbfiN5Tlvq4p7jMDjhVJQCaith1Q==
X-Received: by 2002:a05:6a20:72a4:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-3898f97adadmr17512421637.56.1768285797895;
        Mon, 12 Jan 2026 22:29:57 -0800 (PST)
Received: from [10.249.19.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81dc51581e0sm11438486b3a.58.2026.01.12.22.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 22:29:57 -0800 (PST)
Message-ID: <258e30fe-7b23-47a4-b3c8-a38227fccdfd@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:29:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] media: qcom: iris: encoder feature enhancements
 batch2
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <e92d8c53-44b0-439a-bfaa-df16ad5d4934@linaro.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <e92d8c53-44b0-439a-bfaa-df16ad5d4934@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DEe76otsAyOPdrqCh5j2YIPTJ6hMY7eA
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=6965e667 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=MxFkaXIYAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=0lm2fl_es3ODOUIfHskA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=bWa-HqqoEbs8MZQ2NTq-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DEe76otsAyOPdrqCh5j2YIPTJ6hMY7eA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1MSBTYWx0ZWRfX/+mGnmhZq2hH
 CJS5JJuiD1RofaUt5/KWjq3rXUOKxVI+40YGO5l/asSKg6zkhejUBNvHnPi5hqMzXu+ectFx1mM
 3nbsYaQGBzKQ4XvUz4PylV4DWTBwUyS19GDizjsQtKBi0kkq+VTlzJtRYfKtkJfLDFd7H4aGBPn
 Jhg2qBz2mx1K8lW4dy/2QqUAzCkoD9ISs3gtb5WyYloyq7uf7VWQ8O03nDuJx52rdsHn7n1j8L5
 SiZk1RpJyTeWh1OMtRkaCUKS93g0UDAtZY3yTH87tOvGqeS8FLiDAgpk4iGjpYWPHQ8BdtfYzQy
 lAcrcriLJb0B7S7+uoeaAZ50S+bDjd8e8/s3FnuoHtn2fCRiPN4TsxnU2y8hOV378GKENT23OqA
 no4AV4tlxLC61kmKPiSx2pGWCqdvb6dr5SBnoSLQQiAjYVCn9e9CGmgjSS7R+TXEC9pBPtVQjNH
 4zNNPCvJkM6o2kvIkCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130051



On 2026/1/9 23:02, Neil Armstrong wrote:
> 
> With the following reverted:
> 456c99da41cb ("media: iris: Add support for QC08C format for encoder")
> causing this: https://pasteboard.co/t8HmeNaIFMDR.png
> 
> Nevertheless, the changes are functional and output are visually 
> coherent with the parameters, so:
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> 
> Thanks,
> Neil

Thank you for helping with testing on SM8650. Did you revert commit 
456c99da41cb because v4l2-ctl couldn’t run properly? There’s a change in 
v4l2-ctl that needs to be applied, please check.

https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u

-- 
Best Regards,
Wangao


