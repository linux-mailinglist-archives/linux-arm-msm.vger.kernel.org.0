Return-Path: <linux-arm-msm+bounces-78699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED9C050AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 792CB4E5FF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 08:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6132C3054D8;
	Fri, 24 Oct 2025 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XN2JErJ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECEB305065
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761294505; cv=none; b=HlngzJhLrz9DCqNgtgPxhwgodYNYUbR6PfMkx44o3AsGZT/j4H/pzwETYc3mkYj8QPrNfhAr2jeO0JDCYAqPVx4AMjT7R6I3vfHRbVQK3Yg0Wq3Bdrfa1ubutDTF0clplaL63/LE/dqBLgRJa6M5p5eipr6e9s0WPah3iySW5KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761294505; c=relaxed/simple;
	bh=tYYsV6mTyIUmy9ftJ1Sf7RAebvqW7eDdmrR2fV9OabQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3vA03YC/m0IQ3A6qtdOWQM/k8rai2cctck0fMj9mo3QLoZJjE23Wcg2oP5QIVuBZ/2emyPHzPTY56EfhYK5AfxZFmbxa+Cs5ovwcrQxkzD9lNGDqaBKK9ZtH7jaaxn0q8dIr9MS9KIVkg/G7kFcnDjQ2/g57X/bl9e4KXZ+daw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XN2JErJ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FL2x017649
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j6BwMGQuh4fYjTjzXXoN6FQ7oJ09CxLsz69mXHIlrUU=; b=XN2JErJ0t8PbXSdS
	FV35s137Ru11jdPa1QrTuVPHZSmWXb0syHJebyDC4UNJm3LEgwlB640BojDZiEpN
	9NKSTUlVP8WWwtZnRvn7kTU55LMPx69f63qEJ7n+iWAg+HpMrToxHoIUNJX9re13
	groBCvZ9RO3usDSrLh09RT2y6mbdbhGg6hcW+a54fmN9H+z0dLOHd6VnFq6olq6Z
	LBKhhyj/WQhShwZsbNEYbLc/6v8QBsj3K4+THf6xUyPafcoJ5ijkkMZMe1XAx8OW
	nUHbef8M1FQCmhr+o7p5SnPq2EKHwz+uqNc7hXx0II5HgKUOeyEU1yGubFx9ZSy4
	/HkwWA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49yp6k2kk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:28:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87bd2dececeso6089456d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 01:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761294501; x=1761899301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j6BwMGQuh4fYjTjzXXoN6FQ7oJ09CxLsz69mXHIlrUU=;
        b=EkenE90f9QYkrlvszpPL5ZTNogxLjFeJL7coO0n9tL1DLZedVzTB09j6HnJoTF+qkG
         KCjYNvtkfcree1M+09gcDBZ9vrUOji8uVl/pRckL++2OSitrHEfkFlJa0Zwh7y+M9eFS
         zakYtYf+wdL5DWr1s4/Emo0g+GvQzFDze9KPt9n0RUPNVMih+VL8AfdT4kdzhYu2rL8D
         INLC9A1UEN7+jbQOKfg3YxZ313LbdexfYgYI0Lknzi2c+bWWn0u/2V8z1msTEZiciNfh
         cvLz0RE1HmRqYLVQtQZOTGipERsUTOxnw8Qx579shnk5vVLxZvhajHPzJdV+7W8WG4EL
         Tr3w==
X-Gm-Message-State: AOJu0YwtRlR3bwYPqc8WuHN1ideZybFN/r7u4vv4+Kf+Xjv/u6suyW3+
	IRHXFeGT1IasA8zMxXdesb2A92xi1Rc/xTCxs0H8+7LGx1KOidUkoZA+0HSD9ZF/lKTT7klgVfy
	s6/LEs9TRWyMJshmCS9sa+JuwklqrzY8MQc9aLL0EgprKJ+nFSXmnRvhQP9HMicaosU1U
X-Gm-Gg: ASbGncvkjJpbXkaOC+8vdfbOU436P/tOxWs5Z6Lisv3SzRdm8DquyX8hBTmU1/ezVQf
	kxds+NBdlcAx/wr0iVd+CciBmk9Wac86p1pYNoB2gqlrRivwNE4JiL9ESrTGG88zoG+PmcvwBlo
	bhIvZlbWwwA6Uh0dzIT7nkKcuJqIMMji4B2Ve+1gbQUrJrUOwiINdJJdEZPkOPcCcvPE+9pd5jA
	ZdsqqJ7+C+ljryRz0KRUqD2fYrzFsP/JOHfalzx0v7vAZNYbGOyoA9Ysuluy+L2sR5nN5sdlVmN
	srQeJj97mk7iBpPEvJmx84EY5tKWSnmjQaKeYgjjiUzpgOLFrZC7DWDw7TPnsbKMPR8z83rNkoZ
	IKH0zA5tXgMxAtQ5WfB4DQKhlyAFs466EQe11lQJgMncrkz7MASByRa1u
X-Received: by 2002:a05:6214:5001:b0:87c:13aa:b408 with SMTP id 6a1803df08f44-87de6ff172amr111258156d6.0.1761294501407;
        Fri, 24 Oct 2025 01:28:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeT9a0G26pmu3kuZNUTSDHdkV6SdMv/bFpa+lk2a30aD/Ti0Uu5aCZLttJNVboHfIaiNKZ8g==
X-Received: by 2002:a05:6214:5001:b0:87c:13aa:b408 with SMTP id 6a1803df08f44-87de6ff172amr111258006d6.0.1761294500924;
        Fri, 24 Oct 2025 01:28:20 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3f316d93sm3603580a12.26.2025.10.24.01.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:28:20 -0700 (PDT)
Message-ID: <07066c46-4121-48da-846a-3a180d245589@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 10:28:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEzMSBTYWx0ZWRfX6J07kTPbKcxf
 rIKnoZcisqSf64q2d2NNdiuB1nsp2op6cNCi7ENJ/JMFHh44sJlFBDGExBu31TV6VSiiyMb/zu7
 ivhALeLImODfithH6KVYCFhFLzfgVJn9UFxMiwTXPypjxD7379mmAzmRUsbtPBS7bwtPQjybd/k
 ubpNGY4GCyDBBF0A1zVCSrPU3SAXVypwZoFurPRPic/LVv8PW8i9/1U/Fj5Fd/FUB/qgzjpOdXb
 GJ9+nGDTJEmIbJtOuCzrys7Cht7skLxwuUqXVJquTfCeosTlRXVsKJimw5YLgwtVYw3MvxUDtz5
 r8qOgKvE1anTXgLAICnpSfz82944cHj2SkZTJynmIHW51ZFfDCDfzJwUSgUt3PFVXGC+8WAXqjZ
 Mxd5yoUupE+gFkiEefJE16nyttQxDQ==
X-Proofpoint-GUID: yparmw-KoiPB6zYfbCYXmjKN0hs1MyKE
X-Authority-Analysis: v=2.4 cv=bL8b4f+Z c=1 sm=1 tr=0 ts=68fb38a6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OuZLqq7tAAAA:8 a=7Oru3VZ2rc5tXTzVnmAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: yparmw-KoiPB6zYfbCYXmjKN0hs1MyKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230131

On 10/23/25 9:51 PM, Nickolay Goppen wrote:
> In order to enable CDSP support for SDM660 SoC:
>  * add shared memory p2p nodes for CDSP
>  * add CDSP-specific smmu node
>  * add CDSP peripheral image loader node
> 
> Memory region for CDSP in SDM660 occupies the same spot as
> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
> cdsp_region, which is also larger in size.
> 
> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
> related nodes and add buffer_mem back.
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

[...]

> +			label = "turing";

"cdsp"

> +			mboxes = <&apcs_glb 29>;
> +			qcom,remote-pid = <5>;
> +
> +			fastrpc {
> +				compatible = "qcom,fastrpc";
> +				qcom,glink-channels = "fastrpcglink-apps-dsp";
> +				label = "cdsp";
> +				qcom,non-secure-domain;

This shouldn't matter, both a secure and a non-secure device is
created for CDSP

Konrad

