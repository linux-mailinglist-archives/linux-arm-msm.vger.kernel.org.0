Return-Path: <linux-arm-msm+bounces-67950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6493B1CC48
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 21:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 069FA565423
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 19:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A99129B782;
	Wed,  6 Aug 2025 19:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JeWbuwM7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61EE1FC0F3
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 19:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754507232; cv=none; b=PBfXHwAZjkV3LuLpANbXC2TKdfV/uNjHUluPztne2EZ+r7WvsSRe4vXQYMZxEP/RiiD9gBxXs5wbzJaYFVy9/N3VktH/AkROg1EUkKPHrATpHHjSzbHat/HSmnuVXx/URiIsHiDIzkC3tGbmRgzsWBaUOJGlyPnbpVXxv/qWDok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754507232; c=relaxed/simple;
	bh=D2fRxsjumskahvRxe7m7fBnGGGqxjZOKk26cSPbI7OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dXOM65ATPyq50eWS8cnhYNS9sHFOdMwfarHuLfxHjUNMkklHH2IwZqWzbGXGnC9T0TrTSTfJMSlzN1/pmraHsAc9CkH790aIsq/JRzn3eU+TZ19o65y2n1RRqSsZ2FBS+6iCWaR8bc0awhmgy/pk/oxEkzjBfb5qoT2D6ay8fNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JeWbuwM7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5769enI8032281
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 19:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLFDFgtgIMICdEJ792w168OyKixfYM5BYvfWCMHrn0A=; b=JeWbuwM7PL0zAmGW
	+VETreTAUCzm2n053JSNWrko8eWL6LoLI1ezrYAhMJtsVrM+wRZeh3pnIl5k8OV0
	IdE5Y4F2MyaevZLKAcQ5sd9PyxGj8JmMvTgHFxoCGMdr6uUrLo2EfuBT6qdkmKYn
	k3+ifV38vlVJr9NPx6atLCZtMVPbTRo4uzBIFc5v56+rn5NAkjd8IoUV+x4CjQJy
	3baZtNqsShLgsD5rEk8GJMOSGW/wvI4FMys+cNtla66buSDnWRjtmeOMbIKleOfw
	k7X1v0BMLkW/ynYrT1WYBtUCTdbD+D157ShPCNbrdk71zyvtHVbk19hHLzU9mLHs
	4P91jg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2uukd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 19:07:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23fe28867b7so1885575ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 12:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754507228; x=1755112028;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLFDFgtgIMICdEJ792w168OyKixfYM5BYvfWCMHrn0A=;
        b=UwWJ9QcRi7KgWdF69ZbZKKZPjpuBV5Qnjrj0z0Um2T9tVmnyWmaXNI4LV2s/8KEeOI
         mLJL5k5cULNKpAr6to5bVizbvzyXoD0yxNyZdv5xZJGELH8OilpHyDq8QJIZvQZyHjWe
         /Q5GNwIZEJl1tlz6S+N/ZVnqq5tflGHxmn05jJY9MfoMfiZ+Chlo1R4kBNmSgb7xYSWo
         f6aqqUcM0mj6r9xwmoCF+yhUDRo911+brTEMqpemIL7n9jdjXbci421bbTAls1OFwS7W
         LFkv1vOc/Ta9O6QuZLFSLFjA3voTPEs+g5RZ6V3xC24qNdzcyfOYIDQvrCteIev9VkAA
         vsqw==
X-Forwarded-Encrypted: i=1; AJvYcCW6AHG0wBgB/NssbXHuBrFpr3Y0w7QUzIqthCFd4wWZ4IA4YwtTZSprs5hgSYQBU6W7m6keAM2XXji3nIU1@vger.kernel.org
X-Gm-Message-State: AOJu0YwJk4pBrXlibP2qCzvIL3ByrgjkTLhPbvR/NYavhf75nXadsuDe
	DxAF2A+dnAgfmlfznl5eWPkjEjblRPyHMkvl+pxKjv++36DlikrzvEpOK30G9bG5tWRQcVlJ4NM
	tv+3ouCU+wBCbHVt35zWgrIys8SH9IBeuLGIQPuY8TPRdwLL2plu88tgDX6lzLQkha/nG
X-Gm-Gg: ASbGncuoC6+4HeXKXcOjujntZE+a/yMcTGUd99VCSMb7djCAvgBorqlxwYOyjzFpKz7
	/M4nU/mwjsQcwJi7SemPtEkZhuo+lSnjoJuxflKKklqlwz7L6xrf0WuAkp0LqejnMc96rq9NcRn
	5oWuiAEAfL15jQLhzA+lgMxCJNBSejy0tuYgo14DoDMvvLJpswXje8+Gd/Flg3J7vX2cOxpkw4h
	FlSjCns5whIcFqpuQkv8QrhF/Hw0Zq9Q88hFauCFxoM1Yw+EDe9w6LK/z5uyqLEvTpU/qJRmFWP
	Wp4qE4wzHXV7dvGBwz0hmeqOCgcSRq3LMk51NpPqYV5GXysmA7ses0WYtodeCi9FpP2VYQukveL
	D/SmZMTUXmHFg0FUs24kb+V3wQARXuEvv
X-Received: by 2002:a17:902:f612:b0:240:469d:beb0 with SMTP id d9443c01a7336-242a0b6fc4cmr58557475ad.31.1754507228315;
        Wed, 06 Aug 2025 12:07:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw/V0KLHuGmmP97g4XfNxYYUiYQuA+Las853A79Nu5Cd7FLuHDuerRqAPRejldbNHXAC6rXA==
X-Received: by 2002:a17:902:f612:b0:240:469d:beb0 with SMTP id d9443c01a7336-242a0b6fc4cmr58556965ad.31.1754507227919;
        Wed, 06 Aug 2025 12:07:07 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef75bdsm164814515ad.11.2025.08.06.12.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 12:07:07 -0700 (PDT)
Message-ID: <c9d761a2-7121-4ce6-84c7-232a6c4ce976@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 12:07:05 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] soc: qcom: mdt_loader: Remove pas id parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
 <20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=6893a7dd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=IDvrs2r2PCma8_SM7s4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 0-Oyczxq43bI6abfpN6zQfbO-L5KxMSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX8P+NZ4LrHg9S
 HsfDRMqTplTuRDyXQpvrTaWeJkgRol80SJeSAiChQdan/zLJxspwpSIM8lVFwkc6TMkkdz1z/yb
 6PhPn/6VsyrtNBmQsqU3K8b7Knnw2JZW4kk9Qns9dBioHgzrsCm4NpSaarJFrS2eiWw65c7NcUw
 54wMDx76x57byhBeJ97DgAN1oh4iLG5Vbz1GGOoXL51GXSbyfXXvW7rcVRPa3GE0gOVCJRA+BIA
 sgXC5jfl7EC6P+AVQWWhIZGoXKsEv/SU8nfKr1Lk18p0uCefMGmhM7TTv8D7rdYaAHfO6jZswxS
 NSumvjIRoIN4A9UiR2D6OfDwqBGDgUhHApKP4/qe5YwlGY2uiOkuzu9R4zBIwCYd6Xco1fm4hd0
 qp3/xjfc
X-Proofpoint-GUID: 0-Oyczxq43bI6abfpN6zQfbO-L5KxMSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

On 8/6/2025 10:25 AM, Mukesh Ojha wrote:
> pas id is not used in qcom_mdt_load_no_init() and it should not
> be used as it is non-PAS specific function and has no relation
> to PAS specific mechanism.
...> @@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const
struct firmware *fw,
>  	if (!mdt_header_valid(fw))
>  		return -EINVAL;
>  
> -	is_split = qcom_mdt_bins_are_split(fw, fw_name);
> +	is_split = qcom_mdt_bins_are_split(fw);

this should be in the 4/4 patch


