Return-Path: <linux-arm-msm+bounces-77707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21ABE71D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 625EA1A67E7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39AF2673A5;
	Fri, 17 Oct 2025 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MtFpMQst"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311C32741BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760689041; cv=none; b=sv2D05nikjyaXXMbceRAPkddoLwsaNsCteiqC1lQGx2MSu26etPMApw795FdN2T7J2LVFl1DJA/ryuNglA/4Oa5KFvr831Inofw2ckrZ8WyVYsSiqAkS9rX7dcLNOvBiU53Xva71lvbrUPpEriRRc8hgQrLEezqygtvYupLi974=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760689041; c=relaxed/simple;
	bh=yqGQ8OTcXmkgvbvXXIDW3fgtfORClcNs4wdWbHE74dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uldNduInlMwdveKFIESZ56l5UVVbcOy/KQaQWkY3ggSLt7Vf3fu33e2hudBOOEH8PeZeYkxYXF2XsFkjDPatYuZw/x2wUF3eH6bgPNse2bQGB5SdxED+jpcGqKCJtVSmYnM/qj9h+IrnTN0ad3ZBQQUnfQ+lswtiGw0e5xwnTqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MtFpMQst; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H80kN8022163
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lX+jVvJZQYtCmRARp/2G8vlFEUblGOHVeBMwRzmLa5c=; b=MtFpMQstJ6gO9so4
	lghcgYqqw47ulRQaorDPSlC9o51synLQK43V27Q+ahVhydpx5yecl+9PHyqymKpW
	bERG6l5jO/v+326Zk6YIhHj/H3fTVk3V7Z22EWxlhZlDgn3Nz6UTr2yUI4ljbkj5
	1M/9ArjO9RDdHI/aOX+6IP0nW7SUs5qFFj7/dgSiDai+v5aT4E0Hs9A3Imxj2A26
	eascjeoah2571hRDnG/7bWA1EGdn72QiFADLRMSWUyko0b5XOcsHrX0988lcWwdM
	UUSrBDBR+EYHkPlp5COVIjSNGn5wsBISwkx5s/UcT6xJPgAZKkZ0bj5rROAZGEgu
	tfr8Ag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtgdmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:17:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-883618130f5so72176185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760689038; x=1761293838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lX+jVvJZQYtCmRARp/2G8vlFEUblGOHVeBMwRzmLa5c=;
        b=SZU6Gvml/7BjrhgeGO8Gan052LiRcm8e6jqJ9TxedNH5cK6oAB+YLPy2OmTpWR2iz5
         7bkbNrhGt5xjO7xEG2eTCmnmV9RGGYvRRBo1abEilINUVjP8VNsYWv1x6KZiG9Dc48Bb
         qvh4RGH4BXUrIy3Waal7eyp7POOgqcUC3wESuqBnJ1Q8c0e+xay4+vniGCQQo2foDv9R
         6LtgKzBs4B4OA70Nir6YgUSggXaJ/mcCeuTXXcAzh/VDhW7FuG54zBsYhGDIGHGlISG1
         VZ3bSsBMXiaol5vlh8krhJUgKUQ6MHkkdcx8H6hkUTvdRjivSSpfy3u9l9LRMTxRwDSK
         qT5g==
X-Forwarded-Encrypted: i=1; AJvYcCUa4SV/aAGtv2gaXV5OE46YQKQdzmbE0Iuvy6YFT9Yn9Uoa6t0SVGF/LYJLGjea5akf2gFhxOezGdQJVC7R@vger.kernel.org
X-Gm-Message-State: AOJu0YwdS3J8DB2+AoLiVwsWFWwyHFgWRkQhpeeZ9aHcMillGVwBqRM3
	SebsTO+KdKsEo/gU7k4Cxc6PwxyTnBFIzb1fD2B+N45lwMKB2D0i6YEm4IcQ1nHXKgqHBNMr6X/
	+3mPFUuRJKUfUk9WXXRht0HrE5ItEG44AnJklLETwpKWGREOWvutGDhoBf49SyACtUQhU
X-Gm-Gg: ASbGncuobx8ZwncctWQqf1wnWTnNXdRcNgV3crxNAh1SfOSTCYbXjITtho3eRV5dt4R
	HSCnClGFi3HL5OGX0MXf/GAHNMdSvXYgwwgUIPrBX+A0+m0wn+6vxP+ieFxMWnjiIazAh72XGWw
	Z3M5oM5PaZshGD56GwyNkdRemDIsGOjsqkIk6wb3mPItZF30jqEeYD0XTDuaWixMaXEK6HybZ6b
	T9nCTSc2PYXd7vxzxFe0hmoAlrAitI41DALL8BhwENOHgGbLzSNKUK5Fni2qNxoZ1T8Zy84YlsE
	BO6aN+JNe7cJzeB13Igf/SyfFRsBL6CoNSq2rqiv2L8d3XtOLEB9T+8QgsDHsOv4OGsxXJbKmrF
	NMqs097fEzUdDY5t5qqN+E5qoPEZUN5uhT/a9tidwN2OKMu/ZNxs2LRtB
X-Received: by 2002:a05:620a:4405:b0:866:6f75:5928 with SMTP id af79cd13be357-8906fd16ebbmr230159585a.10.1760689038361;
        Fri, 17 Oct 2025 01:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyJx5hkQdQS+Y5PkIf/4c+WZ0H7bjNJmypS2nW+qBWl8HiKuB1yK0Gui8Ybc1MRrCpPhTuuA==
X-Received: by 2002:a05:620a:4405:b0:866:6f75:5928 with SMTP id af79cd13be357-8906fd16ebbmr230157985a.10.1760689037913;
        Fri, 17 Oct 2025 01:17:17 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1b0287sm760582366b.62.2025.10.17.01.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 01:17:17 -0700 (PDT)
Message-ID: <dfc03399-d4f8-4e52-b097-75fbbfd1c8f7@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 10:17:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: tzmem: area: fix qcom_tzmem_policy
 kernel-doc
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20251017070702.1637092-1-rdunlap@infradead.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017070702.1637092-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: W36rvmgiqmtIEcrGzzc0DJ-qqoDQ9_ib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXzR5lrn+Tc6SP
 pBuSHk2cnyWg6kfVlChMbmTkWDqLw5nJo4zMREYxTlvDF07XEJEIYtuEq2jFsbkfasU6h38IrRw
 MRR7IyMynP3tUvWL4PhRiYujLsf40ekR3Ikz6hi06HSbUHGsBahDhrqgRgoqRXyD1pkmKoBlTMX
 gLjpjCZD5Sxb6ul082qnV+X1lhRPC7wwzpXOCgvJjkvMRja1cR0S0gedofeCalo3dFuRRVSN+MA
 6oF4UxupCBKO9HfFInA+pnGLwmtiTb57WQkC+Dji0WrgA9f7utNnksyLtozNA0ueXszrqFcVY0x
 ZmRl/NqBZ4guT60+WS58pyyRO/MLcOoNgLBkVH0FvSuJbfUjvUX+A1rp18B4Q3Ms3KzOpYqMFgb
 CdvMeNGHmiKiOkH+2sT3s5rSZINE6g==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f1fb8f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=3A0cz7Tt2GQjipOb8Q8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: W36rvmgiqmtIEcrGzzc0DJ-qqoDQ9_ib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 10/17/25 9:07 AM, Randy Dunlap wrote:
> Fix kernel-doc warnings by using correct kernel-doc syntax and
> formatting to prevent warnings:
> 
> Warning: include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
>  'QCOM_TZMEM_POLICY_STATIC' not described in enum 'qcom_tzmem_policy'
> Warning: ../include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
>  'QCOM_TZMEM_POLICY_MULTIPLIER' not described in enum 'qcom_tzmem_policy'
> Warning: ../include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
>  'QCOM_TZMEM_POLICY_ON_DEMAND' not described in enum 'qcom_tzmem_policy'
> 
> Fixes: 84f5a7b67b61 ("firmware: qcom: add a dedicated TrustZone buffer allocator")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> ---
>  include/linux/firmware/qcom/qcom_tzmem.h |   12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> --- linux-next-20251016.orig/include/linux/firmware/qcom/qcom_tzmem.h
> +++ linux-next-20251016/include/linux/firmware/qcom/qcom_tzmem.h
> @@ -17,11 +17,17 @@ struct qcom_tzmem_pool;
>   * enum qcom_tzmem_policy - Policy for pool growth.
>   */
>  enum qcom_tzmem_policy {
> -	/**< Static pool, never grow above initial size. */
> +	/**
> +	 * @QCOM_TZMEM_POLICY_STATIC: Static pool,
> +	 * never grow above initial size. */

Didn't know inline '*/' was cool, but if the checkers I'm happy, I'm not
going to complain either

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

