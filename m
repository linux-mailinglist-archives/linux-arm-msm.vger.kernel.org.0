Return-Path: <linux-arm-msm+bounces-68957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F3BB246CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 12:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA69D3B53B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 10:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3EB2E9EDB;
	Wed, 13 Aug 2025 10:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPoeXl4I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E172F2918
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 10:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755079626; cv=none; b=D25WyHeTqwNndTr4di0ALdo9tvINn3j+enF5onfEVj4yJYkye3Sp/8bYKRUH2lZ27qmYvBksxy+uvJMluaJ3z4EP2M9cCFTexyO8I8WA3BoyeZGucmM25bkzL1R9IRcOpA3uS13U+y8WK3yhgs+gNgCUEkZ0u+9qgyMexX7LgC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755079626; c=relaxed/simple;
	bh=CRPKsVAhqXLyl5B9IWZbInaWZbGzzt5vGVn6BvQJQis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lCDa4DsrRTsMZW1szPBG4qa3wFD86685pBYjn1YWXD+6x3SlHzUDHlJFeX/5/wY9D6flvjopBm5BFr9j6ASeo3VOutud/YoAQtdwN1srE/VvgHlOzFihwNDBL3+yQxNo4xUGZD6HvXtXCRQxU+UoQjVCDTWg2CNeEUV/JBLnHIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPoeXl4I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mNdQ008768
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 10:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lo/uyCg8eI45CIAczel8wExuTSXtA1VT9FQTS1gDCiI=; b=TPoeXl4IjXVD2YQV
	7PgGj9r/3vk0QoRPKTnaIosHjf093O/ALUsVq61RqOpmDap4f+w999tmLJ9urEst
	Nl7bDUeKgmBth6OefCysUvALMPvErT66ikBQ3GRPjzM0c21pZfj6H7pUbnLkUlp2
	gzHM4yEy5pzomSygB2CLW5ggaKuY8TiOJmkAMhHp+jfz5z0el9m1cbsm+IaaDiWa
	Y1R8WWMZwz84bWml2GpnvdbBo3sb48jZU8MDTVBYu6AKnzDOtm5C48/hM/iXu/Oo
	sxNah/WcqjrvA5pbCeYWSOeMIYin4eFMs4IcVl3hkQQnrhkTGpE1/sHlh5WWjSMJ
	wFZHoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4fbea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 10:07:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b0dfcd82ebso5938431cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 03:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079623; x=1755684423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lo/uyCg8eI45CIAczel8wExuTSXtA1VT9FQTS1gDCiI=;
        b=XO5A2cOG+nnKdqXH319CSj9SgfyWbfHHnPYuU4fApuudIX/+JAqp6FUOqXvct8USMK
         rAGVZor0lcPdWuvT/U8mUD/jafXz2lgJTAcZDPbc1vzi6rp/99HOjg30G0PA0PueEXfX
         SvLVHpmuleyiu8yuDCquME9FC6SOsh8Za+blcB7IZReoNFmic1CIxWjF1CX2/YJZm9zK
         90+qzWp2G9zsT4LwWxaSjFHiqcImft8ShTrXNtHPF+68AxZzEqQ7zkzDi25VA7ImuOy/
         s+GWMBxU8H6q+7oaN08W2MrHlkWHJIXX6UC54QSHm1CiwTAjk6QkhaixxqBhT1cTKN7I
         A0Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUyE2cZvYnStFmjMquoLwxPJSsihT6wLAxuLar1wuXCiIxwinoHnBL0Zwnyw/A1gd+togNY4Fe/AZ0yBQV6@vger.kernel.org
X-Gm-Message-State: AOJu0YzCqNIuWmqaIa1/BOB3iQhE0Arrm9IMJHNas5bfAaVB8IBzEdMo
	/D1lr2zAbxHaRIyeNU3aNmrpwWGA/YAyunySLYwjYnQDMA48tf1redtSDpDNbDVM6FFpyKqWJ3J
	X+zO2tuyTIinokdf7v4SqwPXuQkexGBibGKtnxgjTr2sNxyTL/Bd3z4CmQ96LsDNOjT7u
X-Gm-Gg: ASbGncsZPgMd7JF9xKd0tTtpI9LvOgC5j8lvG4ZmlDvp7Mx+hv3LPxhvbDAn5/dO3/1
	ER/pXIQ+eAAniPndyFocU7Iw0s6TFV2xmiRzVjfqqxhfNmuvpT7XiDyACTo8sV+prk3gsVW0mzj
	6nrclafMwic9l4P/EMSgvpgDx8Gc1rIFbSQlONQwiTT7nn+l4pSylIqdBmBWJCnIiwdmdrcE1zL
	SaLTx1uN+OuROwHYdbPcIT0FILyY3DIXlZuUDnCrqDz4h/YdAMKGrdtnC+dPrE4mS9M3hyQJfJk
	gnDQOTqC26BxqUNOOoJA6S7y5A5fJ9o5Ozfo5lRU+qdPWxJHZgSDYl4FdQ/kxMspa+cIc5V/4z7
	pohYvTmr9gQbtx+2/8w==
X-Received: by 2002:ac8:5dce:0:b0:4ab:609f:d7d1 with SMTP id d75a77b69052e-4b0fc6cbd31mr13706721cf.4.1755079622734;
        Wed, 13 Aug 2025 03:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbEx/52bIrz3cKGljrcyVxad9pOt/IN1rRcYfZiJuhcUb6gPtWuoMusDjEvu/er5MYTpmlKg==
X-Received: by 2002:ac8:5dce:0:b0:4ab:609f:d7d1 with SMTP id d75a77b69052e-4b0fc6cbd31mr13706491cf.4.1755079622218;
        Wed, 13 Aug 2025 03:07:02 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b6csm2371260366b.48.2025.08.13.03.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:07:01 -0700 (PDT)
Message-ID: <f10f1602-972a-491f-9c11-95e5e7bd80f8@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 12:06:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FCwwu0-pf1Xhby8A82KNVqswkN0Gp7UY
X-Proofpoint-ORIG-GUID: FCwwu0-pf1Xhby8A82KNVqswkN0Gp7UY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX7A4T7HK0rvtk
 qIbKSF17x8STaJsCrIu3MzAf+53blcygJD71AV1Jr6NlPhMTCXerZhQEAGKqioKaaSa/5EGeXYF
 wZFQsANg9iRmn/yA4ToxLBjBV9pTCNSNC+DHaqCHIs5poJfeWCRfFIrfwWFCkw854ypaKPVoB33
 btuHYGvIAiiBKXtllRI5yyc77iwKo/HRfVHO88Ip+BG1vMexctJjSIAOUbKMNB0N/t5l/DTshyE
 OZpk9oy+sstBHN47YhAUIsx7Gn2tdJblVjYg61JfDPFkZqfs8CpzbJrYQRbh4LadBRP7PNDT7Hk
 mpxUt616C0qbk8otfueezZA2t4M9Ihtg/XwVGYXykH2FkJqq/g04uVS/FpHe2XizE46fc2nxPqX
 MKQAyK8N
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689c63c7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=clTIM29CJtwRRT_IFxsA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
> Anyone with access to contiguous physical memory should be able to
> share memory with QTEE using shm_bridge.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---

Hm, I thought the idea for the tzmem allocator was to abstract
these operations to prevent users from shooting themselves in
the foot, and this seems to be circumventing that..

Konrad

