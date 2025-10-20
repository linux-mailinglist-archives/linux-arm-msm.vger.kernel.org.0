Return-Path: <linux-arm-msm+bounces-77970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1EEBF0821
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 849B0406D61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 10:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5643F2F5A03;
	Mon, 20 Oct 2025 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pV5CSYP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8C223E334
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 10:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760955514; cv=none; b=G5wyW/SHy3vsio2GBY0JNQtn5Zyr1FOkWkheb8AU2wO9dxYz3oDV9UwWOpn3C+setdWWl8huD94KzW4bPrUpkDueAa/2ktd4ZcjN2BfXIFUOVyZFzD84llmrPbvzRTcdG0CCF/kgAGjThYa4H9L0lZ6Ih4v/BQ1uLfjhLHPM/C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760955514; c=relaxed/simple;
	bh=/E+SfbR33yMO0mxzan3DYGlz5eyCLJVfKAVH/2EScKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SB3rsvSc0wetAfkiO1EkJmc7E04GJVUZfzpLMwl8DgEAJ0yq/Tipvr0op/31m6Nqciv3alFNSvnVVz1FGHcqdKMz3lzzqIsxHjZQHmxAVYxPnuhkBUKxA1lykL0J8eI3fd6usUyysipigXqMDWXrfKGhwMGTGeScDV1XYUFx7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pV5CSYP+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JNdQGo030282
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 10:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKPdzEZBD9QZXB2s1p9qSuBi/92rUnMqY86HToXptQI=; b=pV5CSYP+uzFp1Zi9
	5u/T6O6qsNm4Ccr6Qlq9YWvi83O3re54PZcgni1wqoNDqTOTz5mflncHE2xmA6d1
	UcQ8+wmxF3THLY1ABL9vTvg4kFnKeja2tjEbsIkt1I+Wu5hb0Pp1b6v8mTTVOQLu
	vLChCG1QOfq9imXdzdouD0lkcDBXynkJDqysl34r9BhwKsVW0YHOL5hOw5tTx7PG
	7hmratWjUkguKkbagd7DkOWUOodzueujtdC36/Zg/jtnFTFXXL13oBZ1cbVKj41H
	4gbBhUE/VALmRapKMvPGmdEwbcZDIDOK7QU2hxd4A3tY1BHr3MLFAnUJDLDl3LDC
	x2GP6Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gdveu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 10:18:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33bba464b08so3928925a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 03:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760955510; x=1761560310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKPdzEZBD9QZXB2s1p9qSuBi/92rUnMqY86HToXptQI=;
        b=fAT1iE+X0cxCr5yFtgCkJnDCFQIX9/tPF1q7qe/rLi2lsPTGKgRJ0IG8UItVw+1Z5x
         JplUErlyhAzzUkCdImc687BAm8690SAzR4pW/qtVt7v1kHF1j+OsK8cmzalmDVQg8xUd
         4hMilvdfSG+/lhVNfLRF3WCbfTnRZ2RYGXo2/LOU9QxmFVv2OMrX6OTPfGZAq80OmNXA
         kbS7BHJMViJViJC0daPFpr/eBWepp0bBwU68KViKOZy/SrPtRY7D9B8q6lixxIjC1Y+s
         7pFZtbaC11GlAEOhw+4f7wMWOl4HVpbOIbOJ45IHrocmGAugMaY1d18jLSCnUkHTTLQe
         291A==
X-Forwarded-Encrypted: i=1; AJvYcCW4lcCZTIuAt7YHqjZm8XXUW2RPZB+6aFK+pug2VQHv2OxgCFVho5LOK5af7hbo9/6mXhFeJxdd9WJ90TB1@vger.kernel.org
X-Gm-Message-State: AOJu0YxtQ3QKrXx12zLE4qX2G4CM5vdxh0qGg8vsFZrDKkFxnEKc7jej
	OhivGf3wozLDxfew8HsJYKtHHIDjr40uIYWtb83XoeuR7nfsjUpnYUHIid8DoJJ6qdPh1zIBc92
	QNTdte302svIDZe+hkZwzU96nhIdpC3Hr2s6qzbuENRj35gwrWWnepGpr3Cr3231OXDtc
X-Gm-Gg: ASbGncvM9wA5F7fw+ulrP23RWSa++2uweWCZjQhwpcy4QcwFapBrB/la8uljoe4QPe0
	JmDCMGBDroP2z+yFvlAJq/BzmhU6UfhT+9qNhqm4fvxJUHg//NMTqI1BOeYtM87ReGczPl6Iqn3
	QlEWetglHpOBQmv1v+ogFXMbrRFMhy3Im5xQb/68YT2fTlqT93gqJluq5igsaGJKkInUU1dhy1a
	F/+XUra4w41KTgaeixQJXPGNHV6R0SmPKxaziEwm8ok0CkB48Yc9ikevtGe9MB1Iur7XUHz8ztq
	yyLGg7j6DhPr8w3+m3Vnxzf2Ji46/HVKZvtvBFTuUMsN8/UO5Gtx1RBL60BgpopiZWfGfJyJswn
	QWKXimMOY2vGlnapB6zxxwM36i3oHixVMSHn9WGF2EnIq/op/01bgSdbzW4kBYHjP
X-Received: by 2002:a17:90b:3fcc:b0:33b:cb9c:6f71 with SMTP id 98e67ed59e1d1-33bcf85a9f4mr15151455a91.1.1760955510392;
        Mon, 20 Oct 2025 03:18:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFILSIB5MLwkoW7cfHXg7NftIz20LOIacIG5ScdX4N/6wkENYhBKa3PrdVR/37Iv/EgLjInQQ==
X-Received: by 2002:a17:90b:3fcc:b0:33b:cb9c:6f71 with SMTP id 98e67ed59e1d1-33bcf85a9f4mr15151431a91.1.1760955509968;
        Mon, 20 Oct 2025 03:18:29 -0700 (PDT)
Received: from [10.133.33.105] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76673a86sm7181125a12.10.2025.10.20.03.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 03:18:29 -0700 (PDT)
Message-ID: <5a95ad38-0b32-4889-a8fb-af7e79c2e862@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 18:18:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: ETR: Fix ETR buffer use-after-free issue
To: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX+EC42eMa8DCl
 6NjPXVdCNBfrM6yo1dfv2A2I5DMj2cseoin+IjFlRMCR0omUSSVoD53Ov40Y090o67Js8VTgFIR
 zld3UlI5H3QwZ+hfNNJsW8gnaXg04RbN3OM1gQ/BjHQmdUFSdiru7Swsp2M8h2p0KG0tlWBPh2w
 prZ04rosU9EukIbhIxFVwsAfDEiAk2f+xB27wQjPa2aCwWaYv6Dje3fW1FxLyVEPvXggCxW4BCC
 RIDu2DUBKs6jtTp/tNoODzUyBTQ1UGNoUmoixdblfkIo12KgxT1iS3h6sfdDtcaKwduHp5it3Dg
 qSS/hC+SiaHTp89JTmCIGUMXSNku7eRzRQd0ECy4hHS5JDFCeZdeMSuZgzp92x5WR4ecTSKM5OE
 Ku0ImJssM0tAlaMoi+49H58fchEQ5A==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f60c77 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yZ5FxKY4llv7UqssUvUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: IYZ-OIb4NzmhLPNoXTgib7-oo91Ro4AP
X-Proofpoint-ORIG-GUID: IYZ-OIb4NzmhLPNoXTgib7-oo91Ro4AP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020



On 10/20/2025 5:06 PM, Xiaoqi Zhuang wrote:
> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> and enabled again, currently sysfs_buf will point to the newly
> allocated memory(buf_new) and free the old memory(buf_old). But the
> etr_buf that is being used by the ETR remains pointed to buf_old, not
> updated to buf_new. In this case, it will result in a memory
> use-after-free issue.
> 
> Fix this by checking ETR's mode before updating and releasing buf_old,
> if the mode is CS_MODE_SYSFS, then skip updating and releasing it.
> 

I think we need a fix tag for the fix patch:
Fixes: de5461970b3e ("coresight: tmc: allocating memory when needed")

minor comment:
Since ETR is enabled, we can't switch the sysfs buffer, can we exit 
earlier by checking the CS_MODE to avoid allocating memory unnecessarily?

Besides,
Looks good to me.

Thanks,
Jie

> Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..3e73cf2c38a3 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1268,6 +1268,13 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   		goto out;
>   	}
>   
> +	/*
> +	 * Since this sink is already enabled, the existing buffer should not
> +	 * be released even if the buffer size has changed.
> +	 */
> +	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
> +		goto out;
> +
>   	/*
>   	 * If we don't have a buffer or it doesn't match the requested size,
>   	 * use the buffer allocated above. Otherwise reuse the existing buffer.
> 
> ---
> base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
> change-id: 20251020-fix_etr_issue-02c706dbc899
> 
> Best regards,


