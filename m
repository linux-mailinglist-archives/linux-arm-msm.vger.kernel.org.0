Return-Path: <linux-arm-msm+bounces-78697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1506BC05022
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3EDA1AA6526
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 08:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E83F302CB2;
	Fri, 24 Oct 2025 08:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYi++WMb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BDD302CB4
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761293770; cv=none; b=n/RJWIaQMpT5k4GDPGMTprNwneNgeOC4U4+ss7t32w0RUaWje0mpATDXCIj+p25+cUR8/wa0WiMT0+/4xD/kkLdLBdqwxlizGgTnmz+BJjH9wHeRMXeYtHOwNMoGyQ8OLcx+2mYFePisD1WfZwlkdEgZvQ2yxpoQCBG2ygYOt/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761293770; c=relaxed/simple;
	bh=gxc6NxuaGmoQ3aacveReooeKLh8kqG5U2uVKhVcqBSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZz0235M0btZ8mOeyFz51hjhUSCLQxaY2nUEWK1Uq30noW8LlXMDkmQ5G1JR2QZ/nptreY7HPIPY0Pdlqy2Y41ovUIqVb+TUmdMEmuSar2hkCz85QXFzLwN1/EGwl9Kk5KJe82oIgpN+IgjDYriSwwqA5IbulFq4qbSbcqnahHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYi++WMb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FTJU003641
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z0nAQ53RpdZhU/fF9OWWdO6pXQTZc4rhlNUi5MRP3Qw=; b=RYi++WMbMt3+m9wk
	0K6Wh/RSQyEjc/3aySXP3rkiv5OUancdRWFNSw+uYGJ8Nog3Z5ei7kgyDgpPxi+e
	pXke2RY/l3rRARFB3tUpvWueX9XHtOgxGe5BNawFacufSbcktGH5M2/cOfaC+v+g
	r+/EoOAX7k1Y562lIyXqoviuz+o+hxB7Hgr8uCuXMwSTVnDzIKwoJY8KKBgRGISM
	VSP5zXGj8uRasNtfUOuUsaa/dqBRcHIgfhVaNflrhczxGhi0OKCAPMkgqAmQtB9B
	Pd2Y4nEtvK43JVBUwYjioDx68WLbsUNzF1rW5Z7CQsK+rYNST3u4h5QgL/tzlL8K
	JOwPig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gebahy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:16:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88fcdbdb598so64385685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 01:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761293768; x=1761898568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0nAQ53RpdZhU/fF9OWWdO6pXQTZc4rhlNUi5MRP3Qw=;
        b=TI95fO45f/A/QKtnMlKFt0NiPlU0hvZGwYBhtTCyFh9VMoYxhqMUr31B6yJmahl7h6
         JUXxbHleDyFNHv2mi2/5IapDef+hhonEt2a1qQzMR1G9JdF/ZNexH1BqKiDSWDWs7QBx
         AEqGkzQfbFqjYnTIWrImUkMRlJjXygj2kVz1S3vOhIIljjPVCVYtRlSoPR1ItlDD1iQd
         11sttQxfSfQHop2sna1Q1tm+TV2jI4hGlo777DsbDmWAakWDzKz+W8rkajozIAcN0KOy
         k0rjsLRn9BbRlfRr85XM4tbBwWnNyVcjeoAhCISCS/Ya4BWvUwdGqasbck/JUO1/QBE+
         CkQA==
X-Gm-Message-State: AOJu0YxERXO6VCvBoCD6Tf/GU0FTKh+rQGhiivD+hdLiwF6F1X5QWXlB
	qB4fwNxq8QzvILchB1GZkxZMBdFe7/B3FIgc/0ZzhcUALOV0hd+IB6YOndqOO1WEvgxFSlTP7f1
	2ivb1WCzmsoAcrVY+NbGDqokiSapnO6izir8L0VTuYSWp+Px33Xpv73nn6Gy/+jkKdzyq
X-Gm-Gg: ASbGncu44Pgan3vTqWsBsnG7K9F33AsEStP5nmqQyWbxHwEVgQ9djYnBtK2kvQeOqqU
	d7bJlKzilsKTdjtOHN3CX+kq9M8tADpX12/akYMt4lBzA4FC/oBkRQcB04qkApJZ8xN2B9FUMmU
	rlxdjRW5XbApScw6az7aprEE8VX194BV0OPmHX2qTBWP7c7yukndKZ5zu1CzJo59BSyKrTYNBcM
	QFr8cFwV5qcMk3ORj+HKsfpVQBMhOW3hIL0/k0XXnVLgydQsXuF2lizI4mtFvQH9AZNUxGWk8nq
	Ak1sWVdkv2R9Vo576TB/hWURapnb/PaTpjrcvT+uOE4nU7KPAcjU630dH5F8vVLgTYBX2TFpM26
	J39CtU3DPbk/zA/wFaxebCMJVsdwsX4u0MS7LKwTddJMQEj4ufkD1bubJ
X-Received: by 2002:a05:622a:60d:b0:4e8:9ed2:790f with SMTP id d75a77b69052e-4ea1177d7a5mr113240671cf.10.1761293767617;
        Fri, 24 Oct 2025 01:16:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqWq0FM45W/CaXbxQcmVEVnt3Jm/2MAAbDo4P1ICuvT3VveOwZ0ajbZdmoXWa5jmDngYDjtg==
X-Received: by 2002:a05:622a:60d:b0:4e8:9ed2:790f with SMTP id d75a77b69052e-4ea1177d7a5mr113240481cf.10.1761293767170;
        Fri, 24 Oct 2025 01:16:07 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d513199dbsm477760066b.36.2025.10.24.01.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:16:06 -0700 (PDT)
Message-ID: <f90c16f1-6991-4968-978b-1d69d7b13d85@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 10:16:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sdm630: Add missing vote clock
 and GDSC to lpass_smmu
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-2-895ffe50ab5f@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-2-895ffe50ab5f@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX5nlL+ASe2rdd
 fEVbULYvHAcjLPE7sljec7+ibwKIni22EQpAY3M8CnvWTCmZjchiBTtJcv584qDFkrnvX+U7st0
 A/pAYr3nwydpeVeMJwKXqvxPHQsU87vvZuhPIWIFgj4SrXxL8x8m2HdxIsOvYIDIv7CLZXSn9wG
 9pg3lgyrbRCTpSIOg6e2cboKb9oUiHGiGPFJX0OS5dqO53cBUFXeP1GL/A7eXJtwsqtA0HSf4zt
 MdUtF3dW4Pvwv/Vx2nAlJwR5GsZSAMPFpVBO5SgRiJBFqrk5MOA7o0OkFxh9l3fO3l6GpGVKX0z
 L6dahTqPaduj8SSrDt/8bMKlOJa33X4i4iHf+TH2/cXKIimSn2UUGuRmKr/PpNV7quqfieZZBRV
 3GO8/nfbXZzwgmtq/UOTp/Owh6KlRA==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68fb35c8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=I8aIJtlCLNSO61fVdIAA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: K_6GgBcMFl7bmlCbnksM8Ua6Zk_lSW72
X-Proofpoint-ORIG-GUID: K_6GgBcMFl7bmlCbnksM8Ua6Zk_lSW72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On 10/23/25 9:52 PM, Nickolay Goppen wrote:
> Add missing vote clock and GDSC to lpass_smmu node to allow FastRPC
> services to probe properly.
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

"to make sure the requires resources are enabled before
attempting to access the hardware"

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

