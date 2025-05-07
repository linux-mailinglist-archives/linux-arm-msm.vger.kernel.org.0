Return-Path: <linux-arm-msm+bounces-57163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6A5AAE2B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBF3B17A777
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 14:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE0626D4FC;
	Wed,  7 May 2025 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxLuGw4i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9571519B4
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627254; cv=none; b=FndXs8fALzYtzBDBzqcQ77slXmg7uoziWowE2eyy6QzIY+jW/+mBSBtLJAwL5QdygwAaBzJ1CLvCkB4TD3YgeRf4SHNs4vAaVUpE7KuUxh8qCfhz7rT477VFDrTgf1royD8cZ9bsZEWeSNBUiPWYfVDDF/wGKeqQa0iakOXbic0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627254; c=relaxed/simple;
	bh=zjA31ECKWrYkvp6T7RqaV1DJ7jIFc604unho5HpCUh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TW8mJAYGRyglG8SCRJkjaCfd287DSXlUiPYkBU0Qjrp3HdOyiMk/kEOqaXmlkA71qy+jlfvGXKIIivWfGBo9WresWZccHkOMy6tLSX09GgAXC03Cwwqs8PrEtX5eDCUw8aRbmpIYuIDncgWvLG0KOLPeT1hAp9j9KtLUqH0VV28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxLuGw4i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547BeF2x015210
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 May 2025 14:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGluIw6NWJNNfPUxDeMzbPFoQEkugMbs6IrEIEEdFwI=; b=PxLuGw4id89E1aml
	6gV5ozGPCswlL9yuIGLr2dBSTp8mzQLJuaK670bAK7VHXfylNPmHlz/kmJkNEW8d
	VoXugREKv37J+sWjuir7/XdG7+eICBODoQfkBXVjC6Q3Rq2OFr8htq9nSaFJRq/L
	DL4WHqEb4ZqE5DqRG6PbXAue7XNJuHwOngGQ8jTd6PiXqvBgfebIWRXYJR7G9uFJ
	Oy+XvCGeY5DO2zLFBQqbwpAWh/TJh6A1Dow5MtaM2RcuBRznoUqwrYNiO/dq1KTg
	LeMoLAATRbcp5S7ynDqzPQ56aL9fZ/OBAY3iif2IAsfj+MUlUNouBhxODjnJ1RZD
	L5pEig==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u462qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 14:14:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30ab5d34fdbso802803a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 07:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627250; x=1747232050;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGluIw6NWJNNfPUxDeMzbPFoQEkugMbs6IrEIEEdFwI=;
        b=mgtRess7hkE/aOakImexJ6w9TZny8wtPlCuTFSXFttjf0GFw4GnW3h1zXiiGK9yCYA
         Ns2tE00Y86GWw7cEqf7HQ304mfeKVL2XmtSeRZvR378Bgp3WWEzIdfzo4SdcpeFSLLAd
         ZsOTBfE3NJfk4mQ4AZDjyoGtlJ6ZPgJvaoZc4UGH8Gw+Ex5POkraerA2PUdzkWDBVRDW
         dwPOPUk915lEWj75RJDGKN2ziDupEcazqCtGg9zAqGopO86v+Oh6qRjWvhYp4fxRwHcX
         ITx6QdXrCKpiQhyvy9iMQWCRSR0vuiBWtzkXFW1n2Rg19qYyvPX+ydQsQKRgPb7Pkc7Z
         ZKCA==
X-Forwarded-Encrypted: i=1; AJvYcCWlZML7iglHhpEfb2aOR9t0M8Z2E4hdfnQYKjFvr5GcUZeKkwtghQeACA/yBornETUhQYTFSJX5TMuOU36C@vger.kernel.org
X-Gm-Message-State: AOJu0YwqjuY9SlRVGpBhia1i5UJCPO/ghBINl6g2o4xiiO22Ongf28u2
	wmyr9xYkGi1CCcIY4WGW/d9CMP3OCWIUqbsyU7nwXmhQqhXBoLbhECnMD/6tO+Bk5dALJQiCN4i
	XqltbS72/vMLmGRHn0E9T4PSnlxLNQGZgXdLqpTxpbtvY9/KNq9fyd9zU6JalOlTp
X-Gm-Gg: ASbGnctql8FhhOgvKKHKJjBX4Lbcr/ar0GcuTn6a84eGMDWyn9vvzTAucpdiefuYA23
	jrD603+aYh5n3zWChAGxmg0BHzgBFcxn2z3x8+oPll7gyiqqUidDbIc+fnSqQmk7fxmVoXyu3Ma
	4kE9jj+ClLsqCqELdbvHlqYR6GePi0afrFgg7z56TsRT0be16VSw62D8bcLYhxyps0o+TKAK6JH
	Oeg9leZ00sU4Y1/4EsE2mR/LbIJTGcNFt1kMfDGunQKfc295Nji87sUO2tF3JsGzceSe+pvdo5P
	LYzoF2DDN1pulZic/rWcHKZi/8OhCooDgSld+bjkncBWKFMSuJXEny5F9Yfl2Qwo80k=
X-Received: by 2002:a17:90b:3848:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-30aac1857c5mr5519668a91.4.1746627249718;
        Wed, 07 May 2025 07:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1V1DpH2j5TQAnKSXjEhB0Z9ZTZtIJQ3RIw8lPQXZTbkyLn3CbGTR63lRfuDo8fl3HrCpE0A==
X-Received: by 2002:a17:90b:3848:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-30aac1857c5mr5519620a91.4.1746627249268;
        Wed, 07 May 2025 07:14:09 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4fe2248sm156879a91.35.2025.05.07.07.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 07:14:08 -0700 (PDT)
Message-ID: <608a5b08-a5c7-46a4-adf0-7106e4d82250@oss.qualcomm.com>
Date: Wed, 7 May 2025 07:14:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Troy Hanson <quic_thanson@quicinc.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Carl Vanderlip <quic_carlv@quicinc.com>, Alex Elder <elder@kernel.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20250506144941.2715345-1-usama.anjum@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250506144941.2715345-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=681b6ab3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=4n9vdfglUG3wgorB42cA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: M3fbUlv5aFSisr8IJSFo2xVsQYE4kiQA
X-Proofpoint-ORIG-GUID: M3fbUlv5aFSisr8IJSFo2xVsQYE4kiQA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDEzNCBTYWx0ZWRfX6A2Hq8vVXX1/
 RbTVNLrOU7hKSvXGzfoWut1KS2F7QRQ8W2ZPaoWhbTK7heIjmPtqxNojDA4uKKLCdiDtEmekIEt
 YiW4W29VtzFNuuyd4o+id3QPM4x7fH8A/nnj1EGfuLmUG4KWk2VwD17FIoOE24p3UUTlio8EHfK
 vJ/xNv5mrHg5UOaEZqOTrtvRFTq4ugJ/RRCvPspMuK1O/b8ItdH1Gr+RpaUVl8G/a4EBU4YHsdH
 m3koL3GoweWIvJf15MEtc2SOFw1AkPcZnaqdNrCam8kH9eK4HP7Cc4MK/MwLOpCd2sqryz1us8R
 79njHb/QYSTPlgTv8IEdSxKS8ioCGmpiMGSbFV1dBuVu2pZQpXTP0wfo2B2aEiakPxsNnP+YAZP
 ydnTMdh4xjdVJ55hwY1ZRREYvWk5ouljhUMjYJKaYvOcEmEHXRZrYS9SUN7yCxiIjLglXwrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_04,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070134

On 5/6/2025 7:49 AM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> The rddm is of constant size for a given hardware. While the fbc_image
> size depends on the firmware. If the firmware changes, we'll free and
> allocate new memory for it.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Mani, if this looks ok to you I assume you'll take this through your MHI tree.

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


