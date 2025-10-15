Return-Path: <linux-arm-msm+bounces-77441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7333BDF859
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C678E4EB3FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEB92BDC13;
	Wed, 15 Oct 2025 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwB9JrAH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D21927144B
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760544144; cv=none; b=HFtYksCMBcyanItt65hEHm/EeHna52tGPGfpnuJ/17RPJ6tkNMS+pOWvxnHfJLz4EiB+reULJZjJxjTR0WEA2+HGMLgDSVE0F9ku7hW3JCYzlwS9HYUdu3aESJv/Q3mgjXWlIGEJLAfPYOwn5hx33XRbv/KNnNJWo5oDvz+ZhiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760544144; c=relaxed/simple;
	bh=7maLi69QfKBdePsnq731rGrLH2jj12Tu3YnWssvIzrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ope+tRIhfNtX+l9XN9fVnnU07E6PERK1f6tFeXirfBwpD+iSYnQEcGJhtm3oRmSigQNbyD/9Ei2FBw3XFlcLNDWAG0iwjDWQnj1Aw+w4m0CXu4mknuJAmYQxTUAAEmaMdaGB6pA7VCJzcBWeQMnjE8Ifocg/TFmHQATL9a3BbRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwB9JrAH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAhq2A003414
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H199RkECw2OR7uIxDJjbVgfktA/lOVmfTufkUpWbTh4=; b=RwB9JrAHXcUK03zt
	bAaQSBg2mIoEULLZr8wm5/XAgy+71VjzkUTxm4tyu05e4YbkGcGmGoWW1eCq+CJQ
	hKSn7JvQ/XxFP5sYymg26DZcoEWP9TfMqS3ZhPo5neQS8KRXmNFMuR4ZO7ouOKf2
	jXiZ5Qo0fnJNl1ZelM1z43E8XmnBqwXqOUs4hR9a7gQj4bso9y+YeMws7jUwqqnW
	mfyi4y1AKwR5X+REj8fbReQoFIcAj5T0aDOxri4QXRUFtpRf7sDHYO7eKmSJexXy
	DQAvLze/t8NKHMI2jCTN2FxCWNuYaHe24HA+Rut4EuJf+Fng6t63dcq0mN9Kc7MJ
	7+tpCw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8kmqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:02:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7900f597d08so9154763b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760544138; x=1761148938;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H199RkECw2OR7uIxDJjbVgfktA/lOVmfTufkUpWbTh4=;
        b=SGsHC8qpkGy1y6PnahqixH9gJDwR946ruGeXuBMRxpJsE9lc1rVg2Mv2CR+x2Y4qdV
         jlhRS4Lz6Zss6dhzZFipS1EkOXIptNJauYtes9jPuqAwYPgFTxFCfQjT8hmCkiB5L2tB
         9v2EXnMkbhCnzxLAQlxqsyaIh3r9FplWrMA9aqAwdAX+tgK59GlNWiv9PYZLtJutH968
         i0u7oxiikhzfsTMVjq2kvvezsQNB865pCFnA68zox86bwXNhxMJ9HMDKZDoFIOPa8UNO
         UWISOBLtmKnpbHDRZ8w+cHkQxmAFuOWQJMTsF9i2W39xDKDMkc8DpmucDYYg2zRINEIB
         F5oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdTT+i6jyql2RlhV+IaduCwYqEkVpCZWYESfn+UMBLN2Stl1ISVGsEIOr6J5+m78+70NJqMXFjse6O5xxK@vger.kernel.org
X-Gm-Message-State: AOJu0YytlartrRPq/mkblb6OqKHLIvDyIB/bXl30X2iZ/0kzr1rPoarW
	PmtXmLFrYBWEMiue2BGO0Z/F2a8dkFxaH4fyeTre3orIfzXOovXbW5lfCDTfCzSLlZOilCkUNFl
	M7KJ4pr4K25Ns1ATWWyvMMxnnhP+xtVQJe4wEGEVSvMJAxkNpGOieIrLhMqEILa2xwmDM
X-Gm-Gg: ASbGnctrQ+nTA7MhVZvlBty+sW6XtpSOXZ5v21gyWCq4OD3QQyEsfGc+ng3e2NmFaen
	Wyuet8WtTSYnw8VcTPniMFNfuw+oTTmcYBHZEIFYheCkmqazRnPbOzgHd4BRP5+iOZS3HQtXfZV
	LW6qOAMRJdAY82uPfmRdStRkYLZzuMAt9S5FCrTbZKFsx9UoD+h3MeErrZh4yRjZbDIj6y1aHPx
	XZOpSe+NSiOxBE5SHjp5y8zny3QbWY1DS4iiTd4ydIRQWdRHi3D8sanC2xxq6HvI4BTw3lBJXyD
	rN5yxaChjFpK/6vbf/dzU5pB5++rAZwVwm5FmkBGqkJ28Uwtt9xbMAyGvyWiQez6gRI8I6PRx95
	KBF0cmhZ5tYRhU+7HQ9ARxhHHdmg=
X-Received: by 2002:a05:6a20:12c4:b0:262:c083:bb41 with SMTP id adf61e73a8af0-32da80ba052mr40371071637.3.1760544138130;
        Wed, 15 Oct 2025 09:02:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwbSLk+sDebSEJMslHAryCuVQL9jWNZyI4ZWGJJGMTPCmydIy2JaHIzffCLni2E/UTDZbLNw==
X-Received: by 2002:a05:6a20:12c4:b0:262:c083:bb41 with SMTP id adf61e73a8af0-32da80ba052mr40370570637.3.1760544133011;
        Wed, 15 Oct 2025 09:02:13 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9932edsm19069125b3a.73.2025.10.15.09.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 09:02:12 -0700 (PDT)
Message-ID: <93ad648c-1a40-4c4d-b328-7b9b7ecbaf0a@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 09:02:10 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix mismatched types in min()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zuWcduBfyI9zeIjx2Dsh8HnGDndjnFaY
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68efc58b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xm2fmmAW1NdyyY9T3qUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX94VfjNQQwFzu
 XtdBVKjBwbgVTB1EQWHQolusipc3D7X/kFHS6u+Mt9ieM1C09hftvamrRYVZDGVp3OUOg1tYs5i
 B+K3ONT4LBw/ih4bm20tV7XeR1iQ+pViU8YkwqG0vAG2uT+975kQygvvuJh5U5FPsTR3vsZfR0u
 epdFkZCHAmRco9XO9NQWmOGLJUSWGznkXUW/xUz+XUeawbcDPztjzTEMm4nGKNMzzsD5NMJZkDd
 x5HsGb4FR4SOm+FePPuQeqrl3FXr3oVwPQQT+BxpS6y0onFRCXZQOysZnxYsgd6p5G2koX4zDpL
 Uid2LyW7AaVacXTaHFqvXYRUsjbpsTXPJ+0FAzBGCnZPCmBi/UDt857rgm/YEaYdzVQSsjKZi9I
 thlfgdcZICEwu7V30J/fHJLaVxoeaQ==
X-Proofpoint-ORIG-GUID: zuWcduBfyI9zeIjx2Dsh8HnGDndjnFaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

On 10/15/2025 8:37 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Use min_t() instead of min() to resolve compiler warnings for mismatched
> types.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

