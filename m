Return-Path: <linux-arm-msm+bounces-82081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E25C63E0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 87E6335550E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6390432A3C3;
	Mon, 17 Nov 2025 11:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5+xGGB8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VHIGTUNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DAD328B7B
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379451; cv=none; b=OntHmv1jhdNgg1FeQWumS6mpIY2HfCRaQ9u/vBOg7GpbRzy6oxSow7SOz2zxIPONXkOnfJsx1TTYPh2JDyk9V2vD92Y+Qti11eC/6xTJwKAYZSLebdCXdF+LBLHoiHaiYwF/e5V9FH/MLmcNs5HB4CmzJT9QcWjfAXILMBaAJKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379451; c=relaxed/simple;
	bh=9Hld+524ZoUz3kdvtJtXMTd4zPqtzlV/D+fYSvB1dRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/UPZBmyJB9lrSDOtgc3tv+LA/o3qvPTl0leJm2a5T0LkgSorq7c0d8uRxybugyzbsuqYkFJqiNseZFFPxBT+HWjHyunJPMl4NEbLg6GnHM5h6nvhfW6mfj3qUI5E6rfwpOZF7ciTjmQJ9jrYwE6qgx6MsV0LBbbt0ZxjYgAj7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5+xGGB8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VHIGTUNG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAKNOt3932614
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=; b=g5+xGGB8Ar2op7/q
	2axEAAMDt5kH3Xb4vZzxlFA2sj2lwvO2q6TYU0ZougSZBfm/O26DSNaFPo0VqQZu
	LCU845D0mKdlh+OdkRJs5PZ1RhW3DpXAEH/pNEJPqiWDefnW5gF3YvNsq1VPGUBz
	lkKGIBTRfj69ndmjK6YX3NPq2eYY4S2UsEazUpN+hlu7K1tJNl2MI79YH24YQyKt
	8m0dS/XZ6fWf2aqxblGMFNV80UFn3hEtLWQDMytbSW7jV1fGpOviUZ5Q1HZp3Y45
	ViG+GLY7JnRGnqwc15iYHbOgVgToJSf3OzDUwVJAbX+V3G3CRPxuAtYU3BIeuuG4
	q2OSPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1v906d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:37:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2de66a28eso82022985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763379448; x=1763984248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=VHIGTUNGF5SfEV9ITJ1vhZI1YdyFaXnTvX52+AZZCYUksLjPrcoLmR0oIsl6hw8IUl
         a9XDK2Vvl9Vbkj9IB/ONJkSmdTypTTvfudWMGazoMvNDSr7K+kiLI6gEeBZjeez1KQNw
         9uQDgFE2JI6JOZ+VBOrMbxlGevX5w5UqI+MOHhHs9RPcnz5NHEWOSjbLRZ2gq3m9aJUD
         ro3oqo4JqDxNNCVyQAL5RSdFL6lTIE/9EUH4dv0WvHxNafkG04OZ9DCqKtXKZ6X8L74W
         /vNc4IHY5tlVTBBXJGfHcp1QsD9UDMTeeu6OxyxsAtFJf2c8b25i3SxKKocxo99iavUz
         g2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379448; x=1763984248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=mJaeu0YCMydY/L0Eeko2Cnw3Rh0SPzddCOaFwHceKmQIFs705I4QomeKJmPOX2U9pg
         q0d5TsBcStM/22Giu2oc0wY5gGRAOouBOuBEC0X4uqxnvFUc1WAeg6RvTlDjMPZzmTWh
         toH4a73KxNiIuYEu+OUwgIEJp4IVESu8Ly3K7LYIRTGAt03rF4NBD9PUnE2P4m1agIZm
         2wyk8IoitxKMXEIyrwAhjyoUXk33zqbPWZsIXQcqZm5ZO+GHMLt9k3erxmocRdDUTxSx
         vwXedcr7zil1SCLLCR+anId2dXyMWzQRNqURo4dzaX0oTqSShuDb8xWuOxwDZ1nIuI2O
         hyjg==
X-Gm-Message-State: AOJu0Yyv5+mIwXoriHyKfC7lG7sOc5FG6okxIOSu+9r9+KNbA3fqQ518
	7Xzo5FRn/uIZwoh4ObSIzK5QcG1140dopW1ntMGcO+7YTgvlwcdc4+TPKn5miy6rKq+A1BDCRww
	xnn+k1GH8WiDHVUJmX4k2sYAQc24K9RfGMHztUEuY+Pgq1ZtFtiB7RQQ/hhhhL4eS7bq4
X-Gm-Gg: ASbGncv8+vAjZi6p1rgp/4Q80e0p3G8fV36XcaUILQ30/ymVc5aXY+S7552NF+jdEui
	kxxouwq+zPUqxSMNnGRwhksKG09+Oxv9S9Q2qhOJh6D2vjfe7UISefXSkS5w1Wovb1LhpPEWXaH
	MW5F140JMIhkQV1U6B9yD8LIlSKGBf4xtIx2TqP61z9cpPtHvdjVnhFTTcm8lyAZXbLv5IOQbfV
	8p1r7XkGK0IWJF80R+xioREVWKIAcXw9pjLPlKiILdwKxVP24CM33BxJ7xVjmOQ1eg4n1MWALJ9
	PP2XdgpRVkRVtM2kRmT4WUR1ezdRTaegTU2p3QpttJrMEUN75DiRMg7t3QBAyp/gKyN1UaqEEwN
	+USD6ML1QzjIfF7ntnbq24DH3//cWBn3tQy/nfD6ZU6RNIG1GogTf+nKH
X-Received: by 2002:a05:620a:4482:b0:86b:12e2:28d1 with SMTP id af79cd13be357-8b2c339b02dmr987269485a.7.1763379447905;
        Mon, 17 Nov 2025 03:37:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+9pC243cHSWOOaz5ZJSRNagk7XSK2G0F5UJShSa1gTRxU9blM2wCxbSQ3nA11Fx1HSfEdmQ==
X-Received: by 2002:a05:620a:4482:b0:86b:12e2:28d1 with SMTP id af79cd13be357-8b2c339b02dmr987267685a.7.1763379447448;
        Mon, 17 Nov 2025 03:37:27 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81296sm1079154366b.6.2025.11.17.03.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:37:26 -0800 (PST)
Message-ID: <bb7b3715-5ebf-4b90-ac91-399425a77d18@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:37:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] soc: qcom: smem: Use __cleanup() for device_node
 pointers
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-6-5f107071d171@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-6-5f107071d171@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Xv5D4gLnKAePQXKGh5z2Yxv58-B-5OFB
X-Proofpoint-GUID: Xv5D4gLnKAePQXKGh5z2Yxv58-B-5OFB
X-Authority-Analysis: v=2.4 cv=acVsXBot c=1 sm=1 tr=0 ts=691b08f8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=00rvZbY-6gurv9TMER0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5OCBTYWx0ZWRfX5tOK0zn/Yk3d
 c33RHxRKAcG2gK9LNSHJPwIx9m/860LxXvEiu/E+OpFN98EpPz3bNXfyBjlFv6HAW074zFhJn5Y
 uMQAAEdRVuO6PQ83/Vz4cburnBL+Jb9WFROPlKfii9NHQWx0owG533sJNo38S817eSZFjnEwvr8
 b4gmBTkMZyKz9duQEE3G0yYs5bXSSglxOVYMoVMOmiEy6xkDa5VvNJRvtn6xHSy6l1Nu6BEk6BH
 wcTRaxi9ewmCYdNbXJwSgOE/Js7XHu30G/OytY/10/MmayL+tjxKkc+Rnn/nUOqTlxFoq/rPjyh
 x2grwgAg5RVTVdnqNUsaIuMgrHVeUINTlTMy0RrFlNXGEvgBxJCfndNJt1iLVkv8pGHlkcjR5jz
 uCD5iodhr/eNvrwI1+LCbyE4ZEipxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170098

On 11/17/25 5:51 AM, Kathiravan Thirumoorthy wrote:
> Apply the __cleanup() attribute to device_node pointers to simplify
> resource management and remove explicit of_node_put() calls.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

