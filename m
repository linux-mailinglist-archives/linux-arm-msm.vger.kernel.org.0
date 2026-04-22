Return-Path: <linux-arm-msm+bounces-104118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EEDLAbA6GmEPwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:33:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3096445FC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE7A430BFDBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04813D34A0;
	Wed, 22 Apr 2026 12:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBwOabCO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KlmZX2w3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56773D1CA0
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860814; cv=none; b=QqmPB2qD5Odu6g5yqfr9qHWUoWxVYy7gSh4UrRjUXCJPXaAHSN4yTJaris3CryQY9mqbci2YQ9OINUFtII+dq5GNxxRj7LHImgWJGrVSCDqq6h9+Ue2cIA+zyVS0vaatMGy0CAz01NXgAIpQmhR1C2b5c5XyFsSRu5d6oNJtv1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860814; c=relaxed/simple;
	bh=kIXM+3vdgbFxo+rAygXapgy4xxikL7RIYyN1mk7PXoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L5ghQAhPn8BxL557unnWHmoRnMSjnHq/pnVHItkWjGxrQPh9/tc31cT0RT0aCQIt27tPzDjpgBKZqrwXdLARbYCExgc24fibu+Lq2RC0Wr4XKLE09CsCCKxTf9otFleNvWV6taKr8xlQ4xa5CtNYsd5M88AEW4kO7GOWq8Q9gHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBwOabCO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KlmZX2w3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MBCKpS2936186
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Yeio62BaE9B9cPcrqHKv3p8AalT4/2O4ECgzsrY6dk=; b=GBwOabCO7Nqc0+iU
	sHeXPuCKi3x5eX4K3D3NZA7meIYlPzYiLxd5Z6RP/UD1CcLl26XqUT6iF7P1PfHQ
	HgJ2wGbp9W8cfGsXFN/ELqpHUTVUK64aRjNPRbI35OuRG8nxSg7uwbvrU81SmHLT
	OSuy8X8QQWiuTlxkjF7JYLQjbK5GR34dl7w9L966nAHjHSR5rYpKJtn+HFVWL1M3
	C5AZNTH1GkwGaWhvL06AGtkdzGLROcgWNwF2td6Qycf2KO/hoZD4fWER5j+UrB99
	Ck7TpKVs/CUkv7sbtwVZjd5iOKfJ7t5AsiCRvOZVO18/P4YWKGuJ15XXm7Et0BSK
	Tr2nSA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenkb91f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:26:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f1b94ac9dso9558391cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776860812; x=1777465612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Yeio62BaE9B9cPcrqHKv3p8AalT4/2O4ECgzsrY6dk=;
        b=KlmZX2w3x+U6AIZ+lCyMEpxTRHuvZIQJVNvq3xXFSseSHKZj5c9xeUusFiBCWmjRcb
         Al4Ntbyz4bU6H8CFEBx0uQl+zb3tsdCvVCRKhTKKhMM9e/OscfiadP1DoWxwxhsrZsrV
         vAcmHBFPM8ci2w44Hn7QjpqrYF5Tbc76nxUipBVWJL2reGw4ua3ee9jLLxdQXdyMclG3
         vXNpQ+3ePCv9UhbGHmxgOmRRBlTZmxhj0Txq9dBBggjiou5MhNr36d7cy1m3GGL4e8YX
         n6rWZlJ3uShKfekrY+OSG5NkumRRtpnDuHUujNE1G3qFLwgUj0vVV2XExuMEEhqVSvVx
         oEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860812; x=1777465612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Yeio62BaE9B9cPcrqHKv3p8AalT4/2O4ECgzsrY6dk=;
        b=Qy5mQKdyzaSqkGAsH5ABs33th/CKd7122L5e/3sHSXUYGYpPCpccAQxvU1My4qpCLr
         HavH4HRNsXWZEd5rizS2KXf51PvSOLLP8xswH1IWKriFQOFBSFt37Z3/3Gz7tIY/DQP9
         2My8ObTrP1TKAmi/cJE3jbcRkgk5573Sp4E3nzUxTdGSGPahBv28NcS4zT5qIgpDQgOJ
         lqxORqMLSE2CRVGLQQDYJcnOV1nP8YrN0MmvNd19h+xeK3bZ0fJU3qEX/DBW3NpAEysJ
         kUVJp8ZtFLRPRAZkPLYBvgIiYUQpWnZnDF5npl0syvKFjwkaYfr2ofY9NLE0N7UyC9Yd
         6L6g==
X-Forwarded-Encrypted: i=1; AFNElJ9wweEMLOImUT4LRBkXXwwB3t6W+Xkr3+M+FGBQE/Jh21wl4yvM/V9xUgZ87bP1s+lQuFqEvvj8x3spRLK7@vger.kernel.org
X-Gm-Message-State: AOJu0YwkFjmICApLNC4irr06VWXCL955fICOi3j+gctlPE6W2MyZxoB/
	ch7/aFYUfJ7DWwKuA068irkQqadJu1EUBwPvvNSEZIeLdUDiV1VWR7HkdOwlujF8q7t8yUj00ay
	0BvxnlMr4AwwQg3hUKPxNy/dwpztN29QVJXwGzZofyWq8etqasNc65fdrcWSdJAnbskEj
X-Gm-Gg: AeBDiet60+Wvx0iCykRRqEJjkSEz21219ai67uWbHYULoXSTmy5yQh2OTeYJTZk+u8Y
	NpU2Eg3joRrUTnwYfJrk1l2OwWuJkOscjMo8K3lGglUwRUWcwshP66ru7TwC5hrFOR5GSpVhqjw
	Gmi211CVRFHevH2uYm248FdG3i5+MhuXwDraAxcHs4wTOsYeplI75Aczjp7wh71PSspjVYcPDwb
	OoxHpisl/TzVS6ybsACOxOKHGOBikWk091G/j24FV8FYP7WWBjDlve367B7y0og20gXpALNCOjW
	ozJnZdQ2h5NpOdIE8JmVXW0Yp4kgx2J39iLeFM/O08QfPfXvB9Ls27FosZ8v0k4phPMWaVUvY6k
	OQDK93OIPmNYjFRz1r1iVO0NIrH97cyi0Ggic6ao9n+hWgpt0TCgmH3jkONKLRa2Kj9zml3TQBX
	/8cnzzLyYpiLzHDw==
X-Received: by 2002:a05:622a:22a5:b0:50f:bea5:52a with SMTP id d75a77b69052e-50fbea51481mr36581151cf.0.1776860811985;
        Wed, 22 Apr 2026 05:26:51 -0700 (PDT)
X-Received: by 2002:a05:622a:22a5:b0:50f:bea5:52a with SMTP id d75a77b69052e-50fbea51481mr36580721cf.0.1776860811594;
        Wed, 22 Apr 2026 05:26:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bab1sm527245266b.35.2026.04.22.05.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:26:50 -0700 (PDT)
Message-ID: <f2f4f5b7-d204-43ee-80fd-aca101b9f86d@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:26:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] media: qcom: iris: Make
 iris_destroy_internal_buffer() return void
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <20260422-iris-code-improvement-v1-7-8e150482212d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-7-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SznFGafrYiyOY7GsDTnB4sMgegVSlcfs
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e8be8c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=C_VYEJWI21jkAhOvB2sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: SznFGafrYiyOY7GsDTnB4sMgegVSlcfs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyMCBTYWx0ZWRfX/8l7Mvaz7Qe5
 eguYq8l9+zT3JJOD/S4Zz+Z/fc0OMKyCA/2NhPryQm8vMjD1LaZ/3l9J7cZZoRiCudO1sKuSYwz
 xfp31gBh+Fw3m1pruqWgBPxlLpYJJn6cur1bz29OVEX3YDMHMOrltJbY/BpIebr0a6ZtCFsDnC5
 kPySvVR0ih9rikNpULNnrOqftDCpcUVx+PfCbbyP5+duoEkroDBAmwBFRXcaqc0AdcAYh+ttmk5
 UoyMWXr38Nq3HVCIDKFwFDATLofnk1g8hiXT3nh9JjI+NnUHNjGjrynsGgsaWG1fGPShsDFRb1a
 VJIBZLzBvg1wIARSd0dTNQ/2rigzD2NcvWONFXnESBduedEkmG4n7KiLhoJOtTqH72IXuWLXUek
 RuuDavhV/lE5VwnPILf6Bd6iZAIW+SIMjzoyG6Dfw14bmSbeTm22BPcs0Orjsl3Kqt2UHIn+oqK
 eQpLBd3M+MPP4XTYihA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,oss.qualcomm.com:server fail,tor.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-104118-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3096445FC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 1:16 PM, Dikshita Agarwal wrote:
> iris_destroy_internal_buffer() is guaranteed to succeed and never
> reports an error. Returning an int is misleading and forces callers to
> handle a meaningless status value. Convert it to return void to match
> its behavior and simplify callers.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

iris_destroy_internal_buffers() can be made void too, now

Konrad

