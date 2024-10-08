Return-Path: <linux-arm-msm+bounces-33546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2411399489A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 14:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3851C247DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 12:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3551DED55;
	Tue,  8 Oct 2024 12:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvGa0XqE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422F1DED47
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 12:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389679; cv=none; b=D2kd6xXPUT/D4/+I9QdIbIJFLW0lhWfsj/VQDwgIJw53OqAKyyY93wVThyeCXwIL/34exGkAX8azz7Ax8G+x92T6PvXxapplzVR2pr3EOS36y2WMHnM3I2WgiCQTrXr53up5woeG/Rc3M7BPqv3gNICij+tptXjJa23YnebxdTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389679; c=relaxed/simple;
	bh=+2VanDmZsX/1yYxJQI8Wjh0NWyEA0p46uc7xzMyY2e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QNWXE0I2vJBqRMlooz1yq2S/emtHFr+9wCWeGp3vGrcsEskLZ/NIVPlq/hZtZU67W6rM4yf4LwfwXTucoRuZerTPTPx1IDveqgU+3kswDxVvF8aCeBSVTNIKMeXZ0csHu1AFVK91QLE6y6QSRW9kfiWPq8d7gCqJ2mm8eeXbjRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvGa0XqE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4986FAPi017601
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Oct 2024 12:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+e7pWoWMmarmd3axfCh/tbJg1p8KI6s4PoduEnyjbzs=; b=FvGa0XqEwog+sMkC
	iZK96wUTvXwIDjlANYhJNO4m8E2nJcXvoMJjzC66WOmqdflHKoLuAZquIhNKU8+7
	NKsrWT2lb3bYtxvAHTv2iGqLFSGnSTIAN96bWKarS0VN0ksQH+7CyLwGyWJPUACE
	K8qfotOOfvokwKFHpgw+dCXM9PVeftdoxeAR2USsx4+1wmIuQLWGs/dPwbZrqhhS
	kPWwHVIT3/9HwiYb2df1FUkCsC7MDK5LwNnnc01vRAMc9GIzaq5bAB6QPEE0tNC9
	ObJbN6cmeDFwWepcDLuP/ibkUFbUmgQSkbqdEZcqabn+esoNw7oPPfNF9FbURGV3
	8RmGWA==
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xs4fbtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 12:14:17 +0000 (GMT)
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4305655acd9so505835e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 05:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728389656; x=1728994456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+e7pWoWMmarmd3axfCh/tbJg1p8KI6s4PoduEnyjbzs=;
        b=rJhE5tVySzau7qhmLhceIzVJXhxSfqwMCmQqzw1/4edr5CIWPg7Oo56ait10JMF632
         xfaaEM4Y1dDntmn7gIZ5u1rHkwCSTT/M7BwN7OyUtGsunvN/CMTvIMpXiiovZnidoEzO
         84FuHyg77TP2gb5OX/mpYk1AqfeG5LhvU5F1BlqULpuX7IxMTCfFA7i9CNIn8PfY8WYj
         mcnm6eN++wEInzZv296nnagRAC146UiJfT5cAfosrujk/6zBwwgQhJ5zWPobK0EDNG2O
         re0TFVCgUza5kIDvLwimo9rKwcxmI2JAwy7ufE9QUNRLCW3WBKtmnUM4iMpNjvWXmYFY
         8qwA==
X-Forwarded-Encrypted: i=1; AJvYcCVVnGSETujuvZjDUiC29bRJwDjunfRz3SSexIMqhgn3pa8/vOJReUi21lga5utZcJGM3jLMNYHhq41Mq2vK@vger.kernel.org
X-Gm-Message-State: AOJu0YyvUTWUvQs+CzUxaZvS9MpBL7ctTNATx2/2/hlthLNFX5jgig1N
	9G4OD+WlryybOT21RrGJCgLNBoLLz2OfmS5MyrufjnkbNt+LI10ug7fb0Dkq7z9UxQ0lUqvZanY
	4w4VoxUFdXjbNWyKypu7GeTuA3C8rnkSBWjRUJekwAsL/d+xs2sqBN8OkBo5LuSb5
X-Received: by 2002:a5d:5f88:0:b0:378:c6f5:9e61 with SMTP id ffacd0b85a97d-37d0e77f6femr4074304f8f.2.1728389656185;
        Tue, 08 Oct 2024 05:14:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMmMN0wLU0M13Eqkk4PWvHy4b2jFXwqirYx0hgOpjsYbs2+gAOzZ88joL7DG4GzwiP1ewyfg==
X-Received: by 2002:a5d:5f88:0:b0:378:c6f5:9e61 with SMTP id ffacd0b85a97d-37d0e77f6femr4074291f8f.2.1728389655701;
        Tue, 08 Oct 2024 05:14:15 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994b0bd738sm345483066b.51.2024.10.08.05.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 05:14:15 -0700 (PDT)
Message-ID: <c8c6f8da-d7d2-40b1-a3e2-08e8270b833c@oss.qualcomm.com>
Date: Tue, 8 Oct 2024 14:14:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Allow packing uncompressed images into distro
 packages
To: Bjorn Andersson <andersson@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20240910-uncompressed-distro-packages-v2-1-51538434787f@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20240910-uncompressed-distro-packages-v2-1-51538434787f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sGCrfBsHdaDOWEpdj9SKbRndS68_pqC1
X-Proofpoint-GUID: sGCrfBsHdaDOWEpdj9SKbRndS68_pqC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410080076

On 11.09.2024 4:53 AM, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The distro packages (deb-pkg, pacman-pkg, rpm-pkg) are generated using
> the compressed kernel image, which means that the kernel once installed
> can not be booted with systemd-boot.
> 
> This differs from the packages generated by the distros themselves,
> which uses the uncompressed image.
> 
> Use the newly introduced CONFIG_COMPRESSED_INSTALL option to allow
> selection of which version of the kernel image should be packaged into
> the distro packages.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

