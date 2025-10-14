Return-Path: <linux-arm-msm+bounces-77227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8E8BDA3D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 17:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 255D43B2878
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 15:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665ED3019A7;
	Tue, 14 Oct 2025 15:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAIqTX4a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A31F301700
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454310; cv=none; b=XAuSw1hSoVpmyEny6/R4RL50UlIIskA6VYtt6m7Vxom3CWiKjI6UhmsAFP+4wfi5d64hc5m8DOTOZnfux6JNPxdIyZCrHbrN/yEu1YQzW7Y8zlmF/gph2aAVOv0fJRIvIZEUibyuom+K+s+bKVGqy+DN7YJ4ew//AQnrYA7YD/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454310; c=relaxed/simple;
	bh=ZxT17JkKyB0Js7fuAZeV50vH9UJjMDaDdt/19hZZGro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1T+Far7o9Z9Up66qYxQkePpRNB30J/TRid+TDTP9JlOVCvwaDjrSIv89j0aCcog18Cs2BiTLBYDkacLilnWiAe6Aw7UGzMX0occyydQcCUdmsdPbu5Do7Sopg3buOYpbxo0kxnxapcwlNsmf+6ZQbnmISDGo1AE3EkFgJjCWGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAIqTX4a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Jxw025684
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqTpYhfGVvPz23XPvHbBayg5ma4UIcz/b/SwtDOy9b8=; b=gAIqTX4a+rjcVNW5
	ZAEa+YqJyLxStAgdreZds+CFETyK55mAqdktQGAFcRik1rbuDXJeJr/MmTQO7xW2
	k+LFoD47juOLh7RB0qIW0tO0jphVq0ZBJyz9LUeJ417mT/7lTpZFRPbayGIFnRQk
	h9phurJsIp7L8y7qGQmcThLk1TsydJlQZ40MplOIEXLIhhT3mLZQAuxnIcK9+nc4
	bhF5pUlr25hBmXnBheGA4vyUmPgzC9KecG/HS/uQWfdAVN5GRDDZW5FBzWP9IVmj
	HqTl3atVrZgz+kRaeT7cbNCHeTWkGnGGD9TbPBKLkJ7Pmf8Rkw3F9KTgw8LICIbD
	WoUfuA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg0swj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:05:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-79538b281cdso256727226d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454306; x=1761059106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqTpYhfGVvPz23XPvHbBayg5ma4UIcz/b/SwtDOy9b8=;
        b=k/u5vweawfqfQ8bflOGAlTxFFj7In8TmfPRHBfsl22uU8bymoRBAuQKylafeSMDwbv
         fcR7Wf19DExL2DV18s5pI08C6nMu2u9DDzpgmsaLy6bRCd7ZOmK8/6O1qGVPXY7ZcP5D
         sDc5r9NyFpu5w7YI1ITMqQ4l24KC1k0dL638AS5szfxZhfizxaO7Ib+/zhNNSZC2qxoy
         v7QGNh6dL4VtRub4NhjV9jBdhbbUNTDVYnEVXnBwL71ydsZI0QG/8Z3ZPgJL1kYhpvwb
         3Z47wrDx9tEHkGttLbnuXo0wa72B77Tn4J4o0T1cbeQb1x8t9e9puXR50PB1PDdP0ZLB
         g1IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRF6xFhssmhyBlbZ8XxnEDUcIgTZPYVYsV6uoOQ89ru1j/gxe+KmjECyfxBUh+o9C7r+XuxJzMXCwMpfxf@vger.kernel.org
X-Gm-Message-State: AOJu0YwKtf85UdzeLVzdR8VlIPNAY5a7KMu+TgaaHeCcZ2fFJWads5bI
	K5qzNgqpdqOnPkJZsrQ9iMurYhoQdVUHG8QOZXMz1rf/1qSlFx6tTGUba1uN+yam65Nm+4EBL5X
	J2jNsyZVAym0QRx856ztbB9A87Opagw5O9vzg6F0WOzimSPZs13yM84BQKTRSEAaUDYFmvCUOqH
	I2
X-Gm-Gg: ASbGncvMI7PYk3QfVFik9gSuG5PlLE4dSr8RFgO/0ecKBQk2geXHcDss4B8ojonN6dS
	09ojQr28J5YFrZjYaGC6HrQPdDMFUxc6hP9zlZE++zzWv+LR1FIuqi8Wmjs5E14zMX4LOprz6Vk
	JolWKgOAIkt4JBVIhcXM1zLbS9yixNlJtUKj8k+GjSCQ7f1y70vg0jrfSB3z8U1FgRtZ1UyqoE4
	bZ4NKbVF2Hvmn/3ZUHAqZvxF3EaXp7sJvbd/3xRIqPipIaKDV38oFb3XxsMtSBN9Lbm6lZn0fpW
	Rw73UhkO2LeYClJ3InDtAmZshHli2ynjXLPXUvO+PYUE/PDXTQtE7PB+IbFFZwL4vsFJ4Z1dOV6
	D/037XEBU5T1vpA==
X-Received: by 2002:ad4:5d43:0:b0:77c:7fbc:281d with SMTP id 6a1803df08f44-87b3a7a21d9mr330191726d6.10.1760454305667;
        Tue, 14 Oct 2025 08:05:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+lLsyFWuhRG3zPzhlfVw66+28BvmcDUrGr/KCwVz6Qz/aPELfhXLgA4CxUcaThNlgD5ty0Q==
X-Received: by 2002:a17:90b:5824:b0:32d:fd14:600b with SMTP id 98e67ed59e1d1-339eda5e097mr42605101a91.7.1760453888330;
        Tue, 14 Oct 2025 07:58:08 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61acc413sm16364892a91.20.2025.10.14.07.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 07:58:07 -0700 (PDT)
Message-ID: <86179c55-c9c6-4921-9011-9cdbad3b7f71@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 08:58:06 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Synchronize access to DBC request queue head
 & tail pointer
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com
References: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX0hXtxR6BZQaK
 SuVLhot2hhj8/h7wJkr4QR6/Mo+0hta92VRbqIN3LUBwMKoLrEvykzDeFizLEkpQMLpUHHhIJSp
 APn72YOKT/lO297VSem5JFpOl+QuQeg9k6aR6HOFbGXLyuaIeO9JjXC0yCU9Za/7TiH3KmiBGlP
 qasrhoA2pLSolruYVjGeUKXfvXT79k5exdp+1KLivbPsFXjjpQevUdawB6KeXAHNrs1vcE4EBSL
 uaXCytu3hO7KQrlfEIOqoDq2M+Ggfx6Ekg6E9y9hDdzJyBdrxqP2XL4CXtdy1IvPuKpqyorSPho
 IY4r8G/QzQkvBTgUgkoP7P+zL6IC3hVOl0M+T7zV4X4+I6dUUaB4mdx7jy7ptLhwyA9kUxyVhk3
 ixQbQmq4ctj5WadiG2OsUO35FMy4MA==
X-Proofpoint-GUID: Fds6KgEqSGVwX7E0BhpIlhppaxB-Mf50
X-Proofpoint-ORIG-GUID: Fds6KgEqSGVwX7E0BhpIlhppaxB-Mf50
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ee66a3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Oh1Qi44SMlBjVNmzfBIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On 10/7/2025 12:18 AM, Youssef Samir wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Two threads of the same process can potential read and write parallelly to
> head and tail pointers of the same DBC request queue. This could lead to a
> race condition and corrupt the DBC request queue.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Applied to drm-misc-fixes.

-Jeff

