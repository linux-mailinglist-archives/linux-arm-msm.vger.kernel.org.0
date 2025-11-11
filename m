Return-Path: <linux-arm-msm+bounces-81275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CA668C4DE81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9999E4FF06A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10EB3246EB;
	Tue, 11 Nov 2025 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYPM6PqL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtGIjSqv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743733AA1A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864857; cv=none; b=iAHWxTjf3J+LJZKMh6/wiVyzU+RWXdqLQHrIltzsp6bhSwkkCiyC7rvalv91WWz/7Moxo9SpMG2q5Mbe4ya5L4/+hoMbPhTbzDvrcARNHXDHjhdyldbGeajm6dDhJGuldzlzAHpB05kgQdgyKZXzGHpDFbCfxxUKzy1x9lmsKFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864857; c=relaxed/simple;
	bh=LQ+oitKANKLBtDaXHdc94NsTiFvhP0RyR81S0lGkgIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMINmTOu5Xzium+sCnNLZQmWB04XbSr9PCHICEiERRmBDqsWH56xcYxFm8PXYXdA2AfA8aaicVjY4I58jMlLos6E1WSEnsluan4NeLeD4/CH3LumSRjyqGxpfEJ7k7mY5Ui7pJAooplI7b0Q9TKFUW0LD66vDtqPn+fjj67NX2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYPM6PqL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtGIjSqv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGPF12027672
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=thY8JpY4WG0U4x5IdP6IL3ws
	rK/h8ku1aY3ImVMowUw=; b=hYPM6PqLNY/Ll9CBjHos/+7JIxsqLpMnNb1qrjSK
	EsekTfN1H66I0O/8tCNhjOMyw9tWyZ+mLumesAcUxJKLJSJy0ri8BUQPnEoZufa6
	Vgy5YHa/OnI4n4O5Xe9+CWv6AW2eYFIXMd03W/S1LwJ7ZnHE9E/T2v1z5IFvuBXM
	27BaeF480zK6fQYld4YFrjuKnK3jhgRNy3OVaf1+fJv+peEDGAGfgBf3Swu8AZW2
	6UcyDWOCcLyakoEYVJWbywpAjqtxMkuk0NDN71TT2y24fhoO0Vv4CJEPjjmz1hPh
	8M9S5Z4bmw4Y9rpdu9N8rvn5eEO5SQdIzED3C+bdgS+nEQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxqw187c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:40:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb6a94873so44664901cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 04:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762864855; x=1763469655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=thY8JpY4WG0U4x5IdP6IL3wsrK/h8ku1aY3ImVMowUw=;
        b=jtGIjSqv4zlVsYNp5UVDNBJl1i/tN1g7PhGBK425+pTjOgYEwQ8OATrS1PKgIDpruv
         YE9yyokN2cWcSiXfchrgmB+qudLAG69iL9haabUVibHZjDePhjW9wt2YFqkMSEZU4DMX
         JPf0eACaMnB+gmfFnBfv8Ep0Ma+a8B0UN6vzG8VbLy+o+2ESblyPKMyPBXFnDG7YFtkI
         g314eu5wl/OAlirl8AZFMCHwE0phbYAUWKOqCCMdDRdK3YIJcMSEmmv1PRI+mzpw03nw
         7rQfq4wPZeB4cjgHMW3YIkrGVivktxO7eb2hD8vKSfGOQj+HIXrbAeeUZDqbCwar1bm9
         k+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762864855; x=1763469655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thY8JpY4WG0U4x5IdP6IL3wsrK/h8ku1aY3ImVMowUw=;
        b=wsXc1hpmEdeeQsj6eBboGNb/T+YhK0LYjs1Sxg//RSS4NmPGBEX4Xel8IQ05OKQSsM
         SjzUj9ejl82vzu4/dA0mfmVlNvi2PnFAmBYC7p5p1gaoHI1Nj+t46Y4wnr9v47bUQTl0
         55Y055x+snlYKiu5L9VqNBRqw0CIJYq4dJacGPa7v8tJ40iSCVtN5kbS1fWDt9WLdJNB
         AeoFMKKSgPUqBLY4nw3/r9jkHxSXQqidZYpaZuTBS5sLPBnFcPYzYzO+vyGzqRuGWGVA
         TjpaFOfVz5Vv6DjpSVl1KcMRjiIvMLar/2xakbPbPtnul7WWmB0AvUc1XcQBHAuvxLgG
         J0dg==
X-Forwarded-Encrypted: i=1; AJvYcCUYnY+z7Zh+42HqOdXrjxww6yOy4vrQiIUar6LWK92Hn9kr0Yx3ja+oA8beG+XW87B2V6/wHEqw3/ANw9ac@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Dg14QD1NWcgf12aVYdMxB1UcUajsOH/cOn5CtsHiGzmaGMz1
	UcmY7ewvelPCc9nTvbNxwblz8Lg5Ge1eoYR/on70FzqXJFBECtrElnCBs9Vlyk301uu6ssu5rju
	KJT2VzPoyyNM29D3O/jDgMBqehlRhK8LG4p0hWWX2hjGx2c951akpC/8JSo/xgJFdbyPK
X-Gm-Gg: ASbGnctr+WQHnY1TfVSh0oNG8y4JtAYcuggMNYM4dyvGWpEpCQj9+QeV43ezt64QrmA
	L9i4HlMimRGm30GNChHZqZy0nFLEwSkTVhAtAo6n7AWxMbQu3QSY7Sma1+wwWpcOdvbCyqH4XQl
	8mw3gkHK2sDmjx6YQ1/g1GsEJ8d99GhBm/7gKXiE7yOztfQ/WDIYfrx8jHB8U0ndmRVV9vLaJKD
	ivK/I33O6qk+2UuJHz1xlFI+K7JQv9tdQnRpg7ahgZM6r3vVQufGFU6Q+tqoKw78c9J0/OCfCdD
	mzRYt77oZr5FYdp9Dd5poZNaRTlUVD6FO5c9+8d1PrAlGDeqY8htHqU5xzYgXdLd8lo2AYwvAHv
	TgzoBDtliU4LNBj+2kyXustBR9MWzWqwYDwoxVy928V9ArhQJ0M8d2Kykij4ES9N2X0lqn+t1lB
	7EsAGffyrYxLg0
X-Received: by 2002:ac8:7f8a:0:b0:4ed:3d24:9581 with SMTP id d75a77b69052e-4eda50187edmr150666521cf.83.1762864854753;
        Tue, 11 Nov 2025 04:40:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4xqPrtA5f2hoQPM4eKGkOSTFok8KYmyA6XTLWJcrYJQwoqiMBmQu5PmYefTtm3ql0EcPybQ==
X-Received: by 2002:ac8:7f8a:0:b0:4ed:3d24:9581 with SMTP id d75a77b69052e-4eda50187edmr150666241cf.83.1762864854262;
        Tue, 11 Nov 2025 04:40:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a03459bsm4897371e87.48.2025.11.11.04.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:40:53 -0800 (PST)
Date: Tue, 11 Nov 2025 14:40:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
        stable@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com
Subject: Re: [PATCH v2 2/2] Bluetooth: hci_qca: Convert timeout from jiffies
 to ms
Message-ID: <3xsuxm3jy3lvpjaahyrp4qsjcqyrxbchglaszx7ccyu4eq4mmi@557ienshr2ki>
References: <20251106140103.1406081-1-quic_shuaz@quicinc.com>
 <20251106140103.1406081-3-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106140103.1406081-3-quic_shuaz@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEwMCBTYWx0ZWRfXzCUU5bVC8Nke
 up4YX11bK6sDSEugIxO8+jxDdTWecYepPtn+Bj5uJA/F3D6UwRp5KAr6lMlP+4XZpcarhDYMnLn
 iyJ3rtyF3jVu8e+EIQ5iTNsoolHX/Rd4gfKkd331qJ2qJh+ZImj5smeb2JbuvIg7EZGmeUqb1Dy
 U2CqR4LeKBPMSRnjAOX3Cuy5bxo12yU4rzB61OhmCk6C6ZCMAwq1KDgyBxGFAVluPciUUWJYahV
 8+TT8veMCE8sNPwqZ91JLPu/LU+SZkqA7MQNQP+yHqrQGulIv2ndJoAQ+fAflYQOvsjeyGNJbnM
 IbgjPmtqEP25cRMT0rAkd57TVAFVqPvUXL88PGC/aCkK87aahQNyiTtT/JzqKv3kHw5I65riTlq
 0QdqM/Qy66BEJJILzreSrynaAjoGrg==
X-Proofpoint-GUID: A23zO7olu4ZnDP6JTfYFlx_QYFb0bEl_
X-Proofpoint-ORIG-GUID: A23zO7olu4ZnDP6JTfYFlx_QYFb0bEl_
X-Authority-Analysis: v=2.4 cv=CeIFJbrl c=1 sm=1 tr=0 ts=69132ed7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=w88ekMslnmeFjZ9C8RQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110100

On Thu, Nov 06, 2025 at 10:01:03PM +0800, Shuai Zhang wrote:
> Since the timer uses jiffies as its unit rather than ms, the timeout value
> must be converted from ms to jiffies when configuring the timer. Otherwise,
> the intended 8s timeout is incorrectly set to approximately 33s.
> 
> Cc: stable@vger.kernel.org

Missing Fixes tag

> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  drivers/bluetooth/hci_qca.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index fa6be1992..c14b2fa9d 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1602,7 +1602,7 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
>  	struct qca_data *qca = hu->priv;
>  
>  	wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
> -			    TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
> +			    TASK_UNINTERRUPTIBLE, msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
>  
>  	clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

