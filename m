Return-Path: <linux-arm-msm+bounces-40610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0869E5D89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 973FC16031E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02308224B04;
	Thu,  5 Dec 2024 17:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6Fm9oz4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E07521A42B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 17:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733420582; cv=none; b=TwIDT0lym3PGS1UPRxrB9mq30pCNMSgs4iEQ4hstO8fgnFsCj0B/TYjohChQeq8elTpGNSvsI8E3aEJOEIP0jibwOj+76tkoupEPuTKwO5cC80tC9/+ivg/BDa1XCjFS/LsKbUTWkdDI26shIT7p+t2XAIQX7C9ua7u6jjDUkyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733420582; c=relaxed/simple;
	bh=83LLzNzqiW7Cv7hs/AaVSW4+DKsidQGfdG7Ia9j+bnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXtZoFSTlTTtV/Rcq7U2cSFVy1rrqi8Gfm+bAj6IA6CgC+WvO0PhyNdakeMzj9j8n9SMimrY869D5bxAFbaSt1G2DK8I+fpZglST0v5wOmhonvDUIYKCZjoY1/Pv5fAW9pwwc+f4V4kOfjvc8sOzR/lNQbt3h81f9eTdi5vqxCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6Fm9oz4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaCsl019116
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 17:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hx57Lu41ib8MxOqYtwF0SnxIqxAgV7Fue5Y4OtnFhH8=; b=I6Fm9oz4a1EJ7ENG
	PsbiW0IRJMvanLT1b9O8hYQ4fjnKE5m5MnpbeVEjgveE9lo/7NOchAiXMv+8Iu4K
	i7iWuzZ582HcXBmKdY/07iKVFf+bgv5DVpRHBEcdH/1TSGMVRk750D3jtEOHEeHf
	9e6HAOEat3PO6YoEwX1HoDEZs7JRj/FUuezoSRSLIEPka8mHcrNP3u8ulxkVDpZL
	83ErgxQFuDcEdaTCVMHd0lzTbLaleatr+fK+J29Dgg9wWyhNa0WmVUzC2NpADBeF
	sh2xeVw8yQSBe7m3xmDGcLDXSUWtecJPRnLBgXqG9MUi4GGeNZ36p9ydt9paBbak
	bnBO3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w910eh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 17:43:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b66cd9b7f8so3737785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 09:43:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733420579; x=1734025379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hx57Lu41ib8MxOqYtwF0SnxIqxAgV7Fue5Y4OtnFhH8=;
        b=Cx5pFmLiwwn2p1bl1etawRmTbO3v6KrdenftXfUl5IhPu94RV+sCnri7MXUCtLQMoe
         9Z702CvVm10Wux9ol4Pvb5uHFVVIoXlxA0Es/s3w8NnHK5OP3y97AJJc1mJFSFAd3nUN
         GnWgcwZHWDFHXUjLamyi+GfXPNP7Pk2N+LWasrDO7OWak6wA4xErMK2KsV0aGC/fHFE4
         a4R5l6ARziZJFsnKHy5mvV6QHiXiiHKvD8fKpJxr0TmyWHmk7PI8h/BQdFV2AWYtGWdd
         BxSrQDOZE/CZUH0/xeSdTKknBNQ/Zf1f4v4Nnlw+B/qiHjU11DNc7dTaJroTBQ5YDc9m
         aAoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtfcOrMk552DIWphyHL8GRwrbu8eVHCK0hSZYsJDjMnyVWnPcfiOzNy5+zxGrMt3hfa9PweET6lUFaOjW9@vger.kernel.org
X-Gm-Message-State: AOJu0YxcO3TKIzJW8Wt5rAakaQoFrMhHV6QO7zFIBoji4MZGiebQerdH
	VQtewoWOOmQL3K8Z6bD8FNO5Y6icSl6axRCEHTL9B1GlXAOD7lphUqNsdRlY7I2OF+eJl233Uwc
	UIvixxZ7/r6ecpZCV9a9H1GEJqxUc6v+MbPXOo29NUpxB3TgFqTW6mCugeOfZHvdz
X-Gm-Gg: ASbGncu4o+x8YPMxWblYMadxaDnZbCXBFSk4R5w4Y2J09BxOO/li8uARyd6X7Ur9Tu5
	ocN/PgN36Klk7XD0bmTf7NQMpUbtvhZhKTtXJ0JT2N6gP3J50UuzGlCfkozTaMtJ9/5xCwsoGQW
	60DS7+3xFu8H6rlCn3APtGNkEjITmMjYP3VNKGJW583nEOOVx9ga0PSaddSECu8CZfLEk2a3Shu
	UVMga12ABFncLvCzYx3tPAl060Ffi4XDbAmv3vwfePHIWXRBCOMgqKbhMFcu0MaR/HPmxPOZjYq
	PB+ZxBikLktEoypIrkY+dx+UWliT1XI=
X-Received: by 2002:a05:620a:2a0a:b0:7b1:3bf8:b3c4 with SMTP id af79cd13be357-7b6bca1437cmr6493485a.0.1733420579475;
        Thu, 05 Dec 2024 09:42:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqTIBVAUtYMFwIH7nMUAnsmsAxJGz+whkQJCNEPVEIPV7Fzd+DE/MjzrxB52NAzHD9Q0SRpg==
X-Received: by 2002:a05:620a:2a0a:b0:7b1:3bf8:b3c4 with SMTP id af79cd13be357-7b6bca1437cmr6491285a.0.1733420579088;
        Thu, 05 Dec 2024 09:42:59 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4dbf3sm121879066b.12.2024.12.05.09.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:42:58 -0800 (PST)
Message-ID: <83d216c4-bf9e-4eb4-86d3-e189602f37cc@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:42:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/22] wifi: ath12k: add BDF address in hardware
 parameter
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-16-quic_rajkbhag@quicinc.com>
 <142f92d7-72e1-433b-948d-2c7e7d37ecfc@oss.qualcomm.com>
 <0796510c-20bd-4a81-bd60-40aacbcf61c0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0796510c-20bd-4a81-bd60-40aacbcf61c0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UEoZFkPGvIOscrgDYT_3V9NTgJRAiWEV
X-Proofpoint-GUID: UEoZFkPGvIOscrgDYT_3V9NTgJRAiWEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050128

On 3.12.2024 10:18 AM, Raj Kumar Bhagat wrote:
> On 11/4/2024 7:46 PM, Konrad Dybcio wrote:
>> On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
>>> The Ath2k AHB device (IPQ5332) firmware requests BDF_MEM_REGION_TYPE
>>> memory during QMI memory requests. This memory is part of the
>>> HOST_DDR_REGION_TYPE. Therefore, add the BDF memory address to the
>>> hardware parameter and provide this memory address to the firmware
>>> during QMI memory requests.
>>
>> Sounds like something to put in the device tree, no?
>>
> 
> This BDF memory address is the RAM offset. We did add this in device tree in
> version 1. This is removed from device tree in v2 based on the review comment that
> DT should not store RAM offset.
> 
> refer below link:
> Link: https://lore.kernel.org/all/f8cd9c3d-47e1-4709-9334-78e4790acef0@kernel.org/

Right, I think this could be something under /reserved-memory instead

Konrad

