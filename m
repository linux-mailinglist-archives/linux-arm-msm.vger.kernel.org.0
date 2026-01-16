Return-Path: <linux-arm-msm+bounces-89361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0462DD2F0B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A14C300AAE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1C5359FA1;
	Fri, 16 Jan 2026 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzv8ym0I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2e7Xxhl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4EC31355E
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557074; cv=none; b=sfcKGqHfVbQ4diTfclah4uT52WFibkm8cyjPSpKXXrfls5ZPuJ8nfGUkOYKU5ELy9NlXhTH6Vh5tb3atgoqiHm3+TYf8MLWRdp6SI0itvgo1EWXZfY/Qt3S6RHFXs7lN+V13gfWfEK/v6bfSevDBnB+npK9yhS9aEFMYXTL5gfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557074; c=relaxed/simple;
	bh=SW7TUx9OJbaODdBqBX9kDt83LgGVLSIRHq89fu2IJeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QekgN3eWJT6QGPbYjQ60rHIPKGiXm1k3LRHMz56bDtOEs6ftDlDIqtoEKyBsPOUQ/X3sS9Q9JXOQ/gQi/3G9MnR+X5uB+Jbcw2bQdFfnbqaSrpAupIe6iVaS2ZNZ3VFhIkq3Qe/3O6G2ZGBi6msjKDte800QkgHh1ph7DP55MU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzv8ym0I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2e7Xxhl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G9iFfA006862
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyySEoy4cs4LSscoZXS7M1fbq2iJJdJ7HX00v7rwAvw=; b=hzv8ym0IKZ0ZxlpU
	m+jmdi97m5AkdI1y2bewZrci7G9ye3rGRUUoLjB/KtQlYtU1k253U/hWweCS8sOH
	WhogKRLYsevGHH+cstY214AzhyJsboeo7t7ApVlD1vz93C97rTx6Z+PbkXm6A92I
	Psmoxqwj6jO0oDfRzka/rh6FXlDihlNBkECl57yM0KqNv5/4ZsbWvk2lnd6A8eDH
	WQN6d8fEKKbqS/IMbF8SQUWeEAJHnOcT3uS/O7nW1AmGAi77QJRqFYXV5mEAqGX3
	TQg+6TZgjO5bXuotZaSrG9wQtt0jgeo4/TIVH8Wi8SWVc6ABNmTp0xFGnXIhDE36
	92j3Jg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqjy9r0ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:51:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f3ed6e935so3180198b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 01:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768557069; x=1769161869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JyySEoy4cs4LSscoZXS7M1fbq2iJJdJ7HX00v7rwAvw=;
        b=U2e7Xxhl2yxDjz/w2h3GUURxNi5eKBHRIHrnGlZeZ3gDLbPGrv8XnQuAQ43o0BGMQv
         lB6LoIEVfXe+Xnxdwu1IyuSUgnafMR2HA5x+6+u2/IihHOWqPrLHUtGgLXbDOA7c1g4u
         Rx3tpYop+GPmYB4gG978zpXuidfJJtEhrIj32x4QJsVxfDw7K+gyx/1PCyhO9uKquYTJ
         uk21JghAhGF/8EJ9Kns5kMNNklUI/2xa/ES8uKzfYH5F3ub9N52+UEmbSiALNjjQiOKH
         Scx4a6F6N2GCb4DzG+NckW87XozGbL6w/VDhUWqfdmlNFk/93vN6EoSgOjiMnndmc7cB
         Tk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557069; x=1769161869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyySEoy4cs4LSscoZXS7M1fbq2iJJdJ7HX00v7rwAvw=;
        b=RU6cQmmUAjwygEn2zxXj4z9MXKggf3Z5Y4T6ZLSNX2rGTPkBu6O7IGWJyBmCXdmtZe
         HvNdPTOgu/OtBamJN0fgbd6AzS7D+TWnB281He0g656MM/RuKDl1gS5OI40hY6y3RQsN
         gHkb5MulhOgIZhcQ7uLYA2uTx4/fPmRSC8oiap6XQoIp07hAEy1wnDkuhxixZF2JMpd6
         9w/NHfbcthA/9HhzxVY2fY74RoG6t6LjFviH5Xg2bpy04spTM7zhgs9g3ghaNYLIxxem
         tvuAPD+qd/kVUeBjarN+gLIT+ccXlvuASctAZwbeDF6jqTMV9aN0Ux9d5pJwvxrQ1tUv
         rmGA==
X-Gm-Message-State: AOJu0Yy2fpB85nL9XbCl1ggTZ6v82xvAbT2eSSRZUyvrrchc8id7fly7
	r2pw3bc10r8gMdWviGKpnmJ84yRkEdAld7QD6C6O96DJLurYH1sh9gcB8p+jcewlQzKjtrxgQeC
	hzo//2b9C2JsRvVaWJKKUO6fn33ezDsqFgdtgW2mEBlDEA4kE0PUL71rL6MCPsiOzHiEe
X-Gm-Gg: AY/fxX4sLZCH0HFri5+wfVQt8v9guVS1zqMJ5moITEimis7hphxrTdV8BuQXJwL3m89
	OuZKFXrmGtHIPU0fAmYPEw/or5VtP1z7iFmO9SdmNV+Ev5a2gb4Dy8DieDOAWSoozooqk9Nd5Wk
	3v/3TThUiCknFfIKA0MMGAD8seXWKW+olkzI2ZcHGTY+iKJgRAwK/7nx3oAf1nQ/7xKKObrYPQ0
	3gUx8c5GURwZ6N/mrx9iB6VoYacLT0ohufMMs97iteiGDP+dcLks5BEwb3X2y0IJpjj4LMhkl6G
	F/wRisezBK4miU8JBM9d/JffZa4bea1TiRZoFjceHTZ744Ne8rqmXS3plqIeUNjmb/yUXpemEeM
	vaWOw1BLjx2gybOZ4kfn/bRwudDp7aYcEZvQONghIKA==
X-Received: by 2002:a05:6a00:18a8:b0:7f0:ead9:578 with SMTP id d2e1a72fcca58-81fa1780ff6mr1812576b3a.2.1768557068639;
        Fri, 16 Jan 2026 01:51:08 -0800 (PST)
X-Received: by 2002:a05:6a00:18a8:b0:7f0:ead9:578 with SMTP id d2e1a72fcca58-81fa1780ff6mr1812555b3a.2.1768557068045;
        Fri, 16 Jan 2026 01:51:08 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10a03ffsm1625170b3a.6.2026.01.16.01.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:51:07 -0800 (PST)
Message-ID: <54b29b03-4166-60d9-d553-d0e655749da4@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 15:21:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 6/6] media: iris: Introduce vpu ops for vpu4 with
 necessary hooks
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-6-8d11d840358a@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251210-knp_video-v4-6-8d11d840358a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aG4qdils_Ws-vKQF_emFx5EipjGTytfF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MyBTYWx0ZWRfX89bIkjStZ+fj
 jIl3u2BgyK1AS5zf3498UJehwbkGyyvIESnziQHwTQlEAU0r9YZ3Sq5/PYEURGDeaLDWcUp7kDx
 ARW7//C3ySeIraTiJe7AM7d70cHWNfhPw6wQpV4q47YbJvD761/XgcQ+zDwjNywLSqurzJwDMWG
 hIWmnNdtah2yuvisF5gVrqdU78oJeqpQl7CjwvszIDNdbrLM2lJIe0JcgXaf8ChcaxQLcf7uQut
 57AVOJ6QxhjJfjS52cD7hkeDUnIhOcTWqVSr6kpLQ5JKXU3fgvOZjXu+ZjzntWqSelrYuHYpzPP
 pVa4tvy8hK8bADfin2C12L8QXwWE0xJGDwCnuyLAMT2JUiA7T6U/DMs3O1gwCYCTpcp5dVs+ZDl
 U+OOg8DtqemMfuG3xGfvh+bxdsxpCl0d/V7Ol59uk764mzIuiBs3nWraFdB+xppe3ff8xzAjPuh
 HxoPwHNF8jaRm9tc7ZA==
X-Authority-Analysis: v=2.4 cv=OJIqHCaB c=1 sm=1 tr=0 ts=696a0a0d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=blWSk0AuXjsE0o78ys1YMg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hqVnMPCZWYgSQcfks7QA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: aG4qdils_Ws-vKQF_emFx5EipjGTytfF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160073



On 12/10/2025 6:06 PM, Vikash Garodia wrote:
> Add power sequence for vpu4 by reusing from previous generation wherever
> possible. Hook up vpu4 op with vpu4 specific implemtation or resue from
> earlier generation wherever feasible, like clock calculation in this
> case.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  .../platform/qcom/iris/iris_platform_common.h      |   7 +
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 369 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  4 files changed, 378 insertions(+)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

