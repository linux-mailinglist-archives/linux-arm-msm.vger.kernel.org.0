Return-Path: <linux-arm-msm+bounces-85267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D31CBF67A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 19:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 238253001807
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 18:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A231D325731;
	Mon, 15 Dec 2025 18:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLwTOGwF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2C8FTKT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4E6268690
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 18:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765822925; cv=none; b=LawXOwoEsOqZ3lnQRVcbesABWp4Hwk50Wq7sCKRpi5tufWCFam2DVCG/fR83DCcVWjb4NcyeSttXn9TasXwUHHmBusSnBQtot9nzHNYnzYOvHiHvusZFnLB4LaWy1GOQbNz/DVl/NVFjb9KFhp5hg8GiOcBZH/4JO6jOrQ8Bszg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765822925; c=relaxed/simple;
	bh=xG3rqT5IIQ5bzBoJUuUHBqYT8edTrD6XGgn/HAns4Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JWQ5L5E8WiHNpVWgRzt37BBxM0ODqEyiuKa+ifGJSZcU01OwzwFhuTC6TCCEQMss99RBvnxLwk8bwWGep2V3ASdaq2Tp2ZxpsYzbhORY+e16YdQkJgVTDNVpS7UMTEViceXm4r/tlSJ3Rm9xU75xZdDzNOwXCQlZXN+VyywE+nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLwTOGwF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2C8FTKT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFI0COB1682111
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 18:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgYpRbpYnwy/0cl1HyCSrvRsRcv6hN75FyqEZ+oAjDg=; b=oLwTOGwFVjoTHlep
	61++Pf6TeUbCPGVxdKmkDLM8NM+q2MPhlr5HIog++259kqyUOprBD+7WP1WEauEG
	B5nnXbidJwNtaJhpgduWKhV9FuMifBaMi4JuVTriHunvxJnjIx+v3EvkXGi96B4d
	LQwONL39vhIHDtxnSFIieoh7EvxH+OsSkWzot+jXSuNrUQV4OFLMhZcafCqVBmVk
	wJxFeyUS6i93I1WDsx18wh7GM6Kg16sdFVDVy8QS0ZDw9oiasFdXAM1+P4ZNUu9R
	73uNbnghagnPOIOMQJEPHgWziVvbRcgytgxKp9P5p/s+h7lo+BZ5l9bwErCLWTUH
	sdvtLA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2q7tg25v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 18:22:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7d5564057d0so10412747b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 10:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765822921; x=1766427721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgYpRbpYnwy/0cl1HyCSrvRsRcv6hN75FyqEZ+oAjDg=;
        b=C2C8FTKTEconQG9b6ocqQrpVn3AS+4kYf83WTlQfnHNlICEoCjcVFj58GV6KoSOHin
         wEzMGJrhs9o3KQ3GKpNdfiabX2aSu76wAEOr1N4BR8P+JBiIUkUHJUcc4q4cwCG68af1
         z5iMeVfCBC0hNXufIwP7bHCr55nguC9hHGXPViq+sYsD2NkGLNbEHKQrrFL/4Zz+mi/Q
         YXbYdwND2u6UdhH9nRsQqfhoEyt+xAx07IY0+HTzY5qMASCXat4xU3cyUgbcMEmK8eT9
         sTvJA6cUNj+WXvEwLCzQteXedjVafe3cnrw1J+jfhl2tGn2OTqV0FWRiKNvayDgeKitz
         bcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765822921; x=1766427721;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgYpRbpYnwy/0cl1HyCSrvRsRcv6hN75FyqEZ+oAjDg=;
        b=eEDxVf6px2x/6nE/M/INUkH4TTmL9xegG/gKl1QVNUNA6PgtnxzEUxKLM1Z2TY2WW9
         y3nrTL/a5/fRp9x3Kbbaj6akio0A9IsBaKuQBfAt1ollfYzK7piDyloLfKhpBJRV44f8
         V3beV9kyKkluYEUyNFR5B9/Pmv6bglJje1ruIwZHk2iUobVS2X9VO82nCaklUfPQt1xc
         gBnLj5i3tkvL+RCeCDhZv2uFrxmTvw16t0kKsaftLFUeq3gfBT2EMzDP7qqj3v9bke2E
         mWBPxGu1MxFSr77nRh5eLG/ardG4UfBxCNKJO6t/QMjbwHaZ7TYN04RhzZn8ZSy0DIh+
         DvTw==
X-Forwarded-Encrypted: i=1; AJvYcCX+XTS29rd8QpHvuW/cvm9O3g8Y3bAcwbGo5d0u+CeRZ8Pfujzj9K6V13veUtlq4UXm88/AF+8glCDehYVE@vger.kernel.org
X-Gm-Message-State: AOJu0YwLHbD8/WaRN4HRQawGWBcBqgUF8118WTY7sUM3tyUe2z2/yiHJ
	+GcBETcRkcQVwDkqBr3rKUN8HRoZG8sZrBQ7vJ4hEq481ZmUOO95t7+vfIN7V3Xz8HLObd5O64M
	EOs74AkSEeKz/13jlwPZF/Hw8PjrjYUOr+OmFmXa/b1VEuzrVnFPm91roiSYiovcx0WIy
X-Gm-Gg: AY/fxX42VyG6KsxAI8CD8UnIyCUahf4CpNtAxu2M+hiBHgNc380tx2XvBLjDwghMSeo
	ce84Zu52ZJXiGQGBAy4gN59bpLRKrxfLrVrp6DJnB1w+SyQ62qmPlrg3QZwlp8vwtLla9ptXE5j
	AYWugcKxhhzgwg+9grEBl3BbTWOEioieMv/aN6swUfgvOQl4uvAomh+zakga8y8kcfTAgI+YEE5
	I7w4gQ4tKbMfB73lZLj7jU8Mi7bLZBIq+ReO9A8jsN/81zqxWQDqyLPHCVzolK5VQ7C5W1qle88
	MNHam+Vn+TNc+sNET8CVVdx6kZThPYNtdaJR79FvShrKG3yZTpppXTXEjHARoqLMRlHvmGQ5iqg
	VlfMmpI7KPNL3eSqN7CeTAJn/IMZ7L7AsKtT1hU2fZtwrIHpGUceIy7pbbcXciNN3m7xNJ+NR7B
	Vx
X-Received: by 2002:a05:6a00:2:b0:7f7:3c0f:5785 with SMTP id d2e1a72fcca58-7f73c0f57d8mr6920481b3a.2.1765822920568;
        Mon, 15 Dec 2025 10:22:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCex8IyC6kthFfyJ0iaAQmLqbQSxWTKJHI97ovOAoGrbI3tTx1cdk+ymXiVPJx4fH/oJFJuA==
X-Received: by 2002:a05:6a00:2:b0:7f7:3c0f:5785 with SMTP id d2e1a72fcca58-7f73c0f57d8mr6920464b3a.2.1765822920039;
        Mon, 15 Dec 2025 10:22:00 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c237ee5fsm13246289b3a.4.2025.12.15.10.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 10:21:59 -0800 (PST)
Message-ID: <6b115125-17f9-4eec-b10c-0722eabe517e@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 10:21:58 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 296yhjuUo8u1MYLitY1tdm7TGO7wK6ov
X-Proofpoint-ORIG-GUID: 296yhjuUo8u1MYLitY1tdm7TGO7wK6ov
X-Authority-Analysis: v=2.4 cv=Qo1THFyd c=1 sm=1 tr=0 ts=694051c9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=s_66Iy6SLP6N_h4NTPAA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE1OSBTYWx0ZWRfXwLc9tpRADsFc
 qDgI1oj0Nd+O0ng0ctg4muNL5hdMWpIZ2BoAdMHUDh4u8UMpnr9AU8lo5FlkjNY1OCj8sHGmXl1
 mlNA75zd/TbrBfzaRD/vWQ0BkhB8SQQPZULc3XfCuuaZvHJBzRik7g2OCQO2xinHXM3WxfEFpp6
 Gx3IqY8/BswJcm2RVrA28xM3IBRdnkm3fDacl59EOJlD2eJCU2pPErjNnW+VJ9qi7FbcQQjjtc9
 tp0NZspAEVqufxKzfzzfsqzW/lQBHW0gYoW1GVA687mV5J0qShoZ1dx9/U/g9kb46Pw6Z4hNNw9
 0ZXLBDhVKKiO0kvb3JhPEuF8KgEzcyw6jS+JF8JzKltPcnUXCZuvZRMtQe2fOPggjOPb3JjPmt/
 kiItpnJrUbLVXl6Lr3/Z7nXKVxmExg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150159

On 12/7/2025 10:35 PM, Qiang Yu wrote:
> On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
>>> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
...
>>> @@ -445,6 +448,7 @@ struct mhi_controller {
>>>  	bool bounce_buf;
>>>  	bool fbc_download;
>>>  	bool wake_set;
>>> +	bool standard_elf_image;
>>
>> This flag is never set, making it a dead API. If there are other patches
>> setting up the flag, please include them into them in the same series.
> 
> Let me discuss with Baochen about whether he can include the patch in his
> series that actually sets this flag for QCC2072 device.

The QCC2072 patchset under internal review is already 19 patches, all of which
are specific to the ath12k driver and hence would go through ath.git.

I'd prefer to not bury this patch in that series.

Would you be happy with a commit text note that indicates this functionality
will be used in an upcoming series that adds support for QCC2072 to the ath12k
driver?

/jeff

