Return-Path: <linux-arm-msm+bounces-89390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6F2D30CC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E83A3029C1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 12:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144C717A2EA;
	Fri, 16 Jan 2026 12:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EYUwEjFt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="if3zA7e6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AD9348890
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 12:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768564933; cv=none; b=PAgmSYTe+EX48Tp+QcoO4AMCjA4e6En3BNaXo7DiO3D3DMY9czCY1pT4+CvBgxU6PSTmqnp+UCxsX3PN2VVoR0Jj9TAmVJSfi/8UHv2s8OfFVJRy/SuGsxbqRO1hRGU/+CxI/nHSFBAQo3SkHkt3sYlGaV65IOk0i7sYVXXGedI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768564933; c=relaxed/simple;
	bh=g9yTDMRNF2DODGavKUZr+2pS4X1lADzQgLeEJfJULF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFvBL6pLJgajyY3ZMua1b4N1ozznMwcR8MZQ0XyyQrELbSWs6DXfsROBxV4R2/CtFscuw4YxC+9h8aaQRUDc1tK1A/Vln9+/o4xWFdVTIoG478y5TiSaL/FjG9ZxK+X8Y1bteMAxPzDM2So+8D3z74m5EbyalqyWSTN+5jhgU38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EYUwEjFt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=if3zA7e6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8Y1Z23074942
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 12:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kU78RTYNRRYUuCJk4rxAAozdFpO+FACWKdvbzgwMhZU=; b=EYUwEjFt6xGD7tee
	kc5GDWk0MppKGx+3o4gXLh88JI3xIwdkrBfUI02xhyvaafhsUa3fLF7B5mwjLLSI
	tuU2pL3S3iY0a7TQI2li+EbRnxaidxnmTkn/ucdaSZPuXzVeV5Ky0Bnlnyh7kOdu
	5YCKU5gsB7huI+pLabYAm5ozBT3KKEbN+RnYiwSzsCODDmV0xcWimihUwLntPRel
	Nqz9FiknJVKHql4ww29jruh2jVfAkj5UEcUeHdjGvUS9PKrxFU77BmEkDra4hiBc
	reeV4OhxpOD/n9NJBXE/MxNC7/UQXwMeBgqlfFNBlw6zFGr4DVz6P9F8QNUwhgPu
	PfVf/A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98jt278-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 12:02:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0d59f0198so21474355ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 04:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768564930; x=1769169730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kU78RTYNRRYUuCJk4rxAAozdFpO+FACWKdvbzgwMhZU=;
        b=if3zA7e6FMRgjKtlixC/srggSPgTK8tjgQBCwyyFqdO8TpAMKmx/jfOvrK2AogXZRH
         97vtdWflEMqhF7C4Q4fBkcQDWRCtOLOGuw3RfUGEsLBgVYKL3iI4rc8g7j7du2f1RF6Q
         XPZDcBnSNSywoDw6XG9TtOnZQk96uZPH1tf1oStA9W/WZhdWMqXEFgcPjpRNsNLLFkA5
         4MTIKRuGjLJd87Tc4xwDtauA7Wq3hj+6nZ8z0BGuC5Naw/kOdjVNr1P9e3nBwbXD9n4O
         yEPgbQuG+o6NjaEuuS1ci7RAKY9SzBv3fDDsXzWChTENlx67TEjJ181LgJNHXjS/Vg3b
         oqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768564930; x=1769169730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU78RTYNRRYUuCJk4rxAAozdFpO+FACWKdvbzgwMhZU=;
        b=OAhBf5lKatMkPpppZ1JqJbzK2gYlm2GhSmqz7zmYRCkzGsCUMtm0XJLHy8bJxlcQCD
         pbLMFiJdk9yreP7ubqxnjroDCT+UHGJSDKHXCkajL9hMT18Px9BZAw+/LYSNj16lkafO
         yiDYM0V2K1u/OiXC3y1/DPLXrLTsTgzKhAxKGZjlHSWLBpwqxeoIW93Rw59pGDhhGbKK
         +7ETBXCDGPoKa2ewnMfwtXFleyYmC+uXq/dSnLsL4wHhucbGrEDGbBdmpSYICkfo2Js/
         bu0IVlWM50WXFu3hTVyggoVv1fwSf43It6n/yzSwdo4DXM7qyErWErZHt92MfeYOZE+8
         ronA==
X-Forwarded-Encrypted: i=1; AJvYcCXouIqmZN9Bp8CuIhX6V+EqIdIi41Sm652sgqhxiRNPD0qq10W94ECndKCxz/3olm76y5vTFPO9ClX7SmaR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ZGUE2JZdlpyTbUAKgO8PkLp018ZfGJSJz84QKvvowUy8EiYE
	8ZMIfOgaGERbUS+PwcGTvdJgMF/KmAkM1ZEabjTsPy+0oKfMGxYhND5dAc/qEgoP01buS3hOaPA
	gq3rPnwk1wW7q0+HL71PD02UjInvV8GdMY+caSZu2ZWSxyhPA4JgLJqo9xOQ6WJSP8p8D
X-Gm-Gg: AY/fxX76HxPe9D3Muqny00jsSy0bHG30R/x8PbhADcHRdmMzFYUakWZNE2UgT4awczm
	7BymiMvRXyNzFDz/DmtfuvAYaHjj6QLacZBhgFGuBBILN2I1V2dYg/fEMcToG37rhw+20QsNl8/
	wE1kltVb8zV4moMIfddNmomRI7OTCmBVy+S1ojaUnJ+omnxTEGyGmu3C7Gl6gEWo8TK+tmh2ywn
	EtyMcaPXr1mgj/HAPHXDCg2i5ijccOIoW8DEJT7xyr0dr2GDOVdKxVpPGEPWgR1NdYDR3mApkgS
	YBgqNn9lOy9K2VyRZOsThz8b2ZzASH5AuYkq0u8Zb/XRAzSscQNZfoWzkEeyW0Ma/47/lFRUamF
	zF+G18Os7y94AcNpooJXtlwEeThq8RBLRtutUt5rjRQ==
X-Received: by 2002:a17:903:ac6:b0:2a0:abba:a2f4 with SMTP id d9443c01a7336-2a7174f9377mr30898865ad.2.1768564929705;
        Fri, 16 Jan 2026 04:02:09 -0800 (PST)
X-Received: by 2002:a17:903:ac6:b0:2a0:abba:a2f4 with SMTP id d9443c01a7336-2a7174f9377mr30898325ad.2.1768564929118;
        Fri, 16 Jan 2026 04:02:09 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ab921sm19955365ad.8.2026.01.16.04.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 04:02:08 -0800 (PST)
Message-ID: <da56729b-8829-13de-6e16-de5f116806d6@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 17:32:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/6] media: qcom: iris: Add intra refresh support for
 gen1 encoder
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <20260109-batch2_iris_encoder_enhancements-v3-1-196855ef32ba@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260109-batch2_iris_encoder_enhancements-v3-1-196855ef32ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=asW/yCZV c=1 sm=1 tr=0 ts=696a28c2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=blWSk0AuXjsE0o78ys1YMg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hqVnMPCZWYgSQcfks7QA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: P2VcN8mzYgaGvP6ATOYSmMYd-GWLiRdj
X-Proofpoint-GUID: P2VcN8mzYgaGvP6ATOYSmMYd-GWLiRdj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4NSBTYWx0ZWRfXyjGQmzlkTxTr
 YZEBl+6RDu85wFLWn8kZhrmVIdlvbI44LdCoozlwQ8oLyMlDM1u4l19Yr9n/ZPDXDTO7KQKIJRP
 P5CRYM0W+W0GkFYH8rYp0T3pi7o2uBYh4FWNnVIbijzcjpIu2b2BUBnzru1dJuBC5c3FOOPAWLa
 UFZQ+kOQNa+jQwxIRJ1o7lG4J4wSEUmGxUxuvZwOadUcImQhnFAl2HlDx2SrRctebrZOLUzFyFW
 mdd85TweCSOlro5hQW4MdfILdM7wZvU2rdITRUPOBMFJihQYhQcUJ8OZXzSbjFiO9SyASnlPlxa
 xat/rzQQvzZLbWXznWtGTy5XU8DdOqXDAnai8hzMn9KYN4APaaTC+7YsKfnhbVKUlW1Yit6nV9A
 fQyfWrfdfQBf9G9+yS+cIqPp79feK8Qy/664JiJ0a2jDX3YwkCEArqLr+KAJJHme3P0J9/ZqDXI
 SSKti94qKHdjv/43IQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160085



On 1/9/2026 1:12 PM, Wangao Wang wrote:
> Add support for intra refresh configuration on gen1 encoder by enabling
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 39 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 13 ++++++++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 19 +++++++++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  2 +-
>  6 files changed, 81 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

