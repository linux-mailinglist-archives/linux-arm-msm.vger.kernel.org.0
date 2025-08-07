Return-Path: <linux-arm-msm+bounces-67994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F397B1D65D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 13:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F101618C2983
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 11:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F98238C16;
	Thu,  7 Aug 2025 11:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fw4D04Ep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50401F4CA4
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754565042; cv=none; b=u8hX9TqhxFcYJRUIGU9d7dnyaa6D6d3E2jwlwTABjrhUuZucBybamHJw93Jnqx9Uz8VXGejKN5yMu1nLuFd8xzhl/rdvFVpXpA1a1fdq31uyBLIVb3E4PguiFaRHOKZ2z/sle8XI9fTa7TZf1CFdC5Ti86sc/i1hRunagolRTAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754565042; c=relaxed/simple;
	bh=m5jWNEvGkMzDuErMr4s4xW21ahh0JKQb4e3hPiNzJGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIeruJ9gLo5Qv/lwIcFvTxR1EzDW/rxN7NPNX8t+B5PwaVDV5ln1erxb5DUZLP0Hcif4fqLyrnoUvG3qz0EYb3momeh98o36Qd79HYqb28s/kpbwplJWLGrPoASgW9GH/XQ8dSUUMdj0G9IBu9lyt/pt3JMWozHeet1dyKW0fDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fw4D04Ep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DDdf003806
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 11:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6QbTd5oBtfokcdGnfaL3ss1dZtp3HHu7abxC5K6Xgs=; b=Fw4D04EpYVpdxFyC
	bM2AUmSmJA8+WxuGhswRdnZ39HAZ6qQuifSBmNHcr00zA5bo/oUZY5N4kG6fpODd
	Lzov9pK6fQyujbnQzGgZVhLgecEVgWV0cK/U182my6Yy1h83r1RDH6I4e4MP4rrD
	oPiGYhHpT4Ox4ql1MahzP/pUDZPM1oQaaVB2ja2+vB++Oyj/CRnQVMkLEbmypAaE
	erWiCb2JOYsjxt5Pzk9izkG87OqaHRvNDRm3lSGV9Epa0m25eVC2Z54n/lJvRGOD
	V4XXNixo1gVRuLBmZfXARCGIUcbcya6LRtBHZK+pAXvp23IWqMccuUgP69/PwBDX
	40yaZg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyae1qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 11:10:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7092ca7dae0so2618736d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 04:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754565039; x=1755169839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6QbTd5oBtfokcdGnfaL3ss1dZtp3HHu7abxC5K6Xgs=;
        b=JrH5Ve1Cwii4lXQSLO67FSscjjMe/BWelUQhTBy+xAU2H3omtVtoNWmMyvLCSMjB98
         RaNC7p/ccttcNZGkMhvJrtZEBOdr20ZC8vxl7H3Z/VM44u22jTr7etLQt7iLdhdMugIL
         jFHpMotkbMlVRSAHhPZu6oRWqIyx+HVeZgfNJOx+10mIfUkCvhSmtULDvw+tDlU7h911
         Rfll+aQ5Q4yMDBw8d/2eLWNc8OJy3irfNCH6QNxUA7bwytF5T+mJWn9+aHFM1BGdEaDL
         xW61ZeOWK25C7v6EDswFtmpGHs/6Sif8F3qzC5NN1zUbZJ3UZObfx19on3SXtQdphEle
         jb+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWktALxnj3RIEbSwLj69RCPC2JTYR8+Bpaa93mUfE9lhsSzDovyHzziJ45CawN7ho1Tt9O9PlMyIGD3S99t@vger.kernel.org
X-Gm-Message-State: AOJu0YwW3+ZpTnSFlmZpdNjlgfCGYuEtnMOWrcgOXqsN29gpX4p0Sm/r
	07O2KtdpP3ci5pSROTGvUZdh29xFHr8dOL37MoD81VTqvbq5A4gGbozlDVBIIqEKGoPaBGIgjHd
	dCUXuYB2RWTSXmzjoXSyS6xlMVRxohDl/dZ9PkY5Xv+kI41MT7UaDln6B2rILhUxAed2d
X-Gm-Gg: ASbGnctFKDzy1L3Lh9e9td3m0hQaCTVL9GvNnacXtJmydCOUofAX5aW+A7WnrfC1kh2
	7a1K4eA5s3IDPa/pYcOhVtEs73CHVV/rvlak9ZWZneeHwCCM1XRf1uut2w8mJwaSyMQZIYWfybg
	JY0RMvFXZ6uloH/WmQfayzLcTQDnoSCMbAnSRavjbVIC1hj2xahbgSljVa83l5xvvkxyeimDTT+
	JR2KVpYBGmeme9hZ/nNpMbcOpKxV20a2uTa2Nzd0viGhQIc4/ZN4ZbXHg7ikqzPSlyOZHgYqG+M
	yyebQhAJxy5+Hf+O2rxBv2RwEJeceMi9/sBRZBDfYy1sB9bmI068haU+PT1V8zJ9pYZ1PY/cP26
	5DZTLE0yJl1rKjxvrJg==
X-Received: by 2002:ac8:7e83:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4b0913bb1c0mr45527221cf.6.1754565038621;
        Thu, 07 Aug 2025 04:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0EgQGvuGZuwaUug6DIZAl5YiLhPSTetS5nLC8plJAjvhb/juDcAiunqpwFSjSp5lL0p+Glw==
X-Received: by 2002:ac8:7e83:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4b0913bb1c0mr45526901cf.6.1754565037949;
        Thu, 07 Aug 2025 04:10:37 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c099sm1288976466b.108.2025.08.07.04.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:10:37 -0700 (PDT)
Message-ID: <f6432247-7455-417e-9bf4-068b564461ba@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 13:10:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 3/3] soc: qcom: mdt_loader: Remove unused parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
 <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K5s9f3fI6Nf-_YmFjqWrWdMmerVn9kg6
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=689489b0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NyTICe1PHtTOfF-B13wA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX9jYZMHn6a81p
 m0/GoEsf/pAX91m42BjUuiPJnWp4Py9gh2PIJa3ZOPC+nwz3JzvPSZCQJKgt8HjPjfFDW3h5wrc
 sNVd2DxbJL/JwDrd6a9+NvS4vGf4G6BJUCbhnh9e4/3cuBnZma/lq8zvlKmuzU2vCAwGJqBq8uS
 9mrcCd0RsRQnz9r88Tl+3X4G3e9/ABt5ljG/vC82q1NOxtETigiklSxPxhieQdL1wXHq7HdmBxr
 bqx/oENwVHu+ob8t79Nsx2UFUILoymr/UtXngpYOLrt9Xg7BpgIBY0RtDUIgGMdyD8ArTat7FIE
 rDjB6ByoCsmcHvp2vSGjBrd789MS97BQa9g0ScNc7lfR9Dlv0/ULNg07uLF+Gkcg5t0kNNZY0qI
 DSHBsg0p
X-Proofpoint-GUID: K5s9f3fI6Nf-_YmFjqWrWdMmerVn9kg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/7/25 9:43 AM, Mukesh Ojha wrote:
> fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
> used in the past for logging it but due to code refactor this parameter
> is unused now.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

