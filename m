Return-Path: <linux-arm-msm+bounces-67688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2288B1A303
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 442F41897A35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EBF2459F3;
	Mon,  4 Aug 2025 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSBcPGe3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2E325F7A9
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754313266; cv=none; b=Nq+EVG0tpZwJrimGNWwX8VJwu4dyp2Mp0sWEKs+ImNLsFJPMPzTPo9lUDIwi00c6NNZMfR/DL+k6feYH6sua7Q9Rmg++1n1ALwrSHvlfBOuv70x60TSn14zSD7qU9YPF27VjPvZM71+iH+vISVmDzyOBdrB8SmlJ8qtumdeCu1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754313266; c=relaxed/simple;
	bh=nitCmAavgS3eup+SMOcSyyiqncdlMa5i+nammlA7TIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyYYRu3fyUQq/XRoKDLTXilBzx56d9LIoIE8M6yei3/dH5dmXdhii5UbWGHVk/l8ltN2bu3GaApNUDf59qic9gC/muI88m3YS8guLbh42tvSDOxL0/SwL5oXO70uFLQ9F2uajoCD1jliOmGaNp8STskwck+9FpL9V3pIhrZGbFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSBcPGe3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57490XTg015496
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 13:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iuqkYJEHU46HSu5bF/1m8NgiJsyaKNVDD5t0GtyZPKU=; b=dSBcPGe34hwe5cmj
	mNB3LlId72lzaYJtZSgzsodfASxhHgARWwRu90eZ1psCB2Cxis7dqc4ti5c19Bwh
	fS5Ol7nj6L/cPPs+hAdS0M3wuTukXxrxLvwdKWUhaKLuSfgzj/9XQ0ZXkaQ7CE+y
	TxJAZGADC6zvrzGWl+9zyEvsArtjZgCVl9c1z7tUMCfR/KC4VbZaNny4SVONspCj
	GO3WIoaOu0tLyRvMmtdxBoK0Fl1HxZkP8D7KTxc3htCsBBT2kevwoVjKQswWu9pO
	2Xjn7p/TxO3v+qi6ZnXmUO8ed/yL0nckSKO0rKjMumMPR60y7lltL86OcGSro+2d
	1BbibA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4898cjnajr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 13:14:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e7fc43b261so20176085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 06:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754313262; x=1754918062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuqkYJEHU46HSu5bF/1m8NgiJsyaKNVDD5t0GtyZPKU=;
        b=GvIINPpbCUYmkxT5dt4uQckKXokkEw3eqEgCa0SP3lnKn76IDhMEPOp2DC4NQVNiKe
         XQeNa67auK+AYigbuiyMoa43sGTIXYMe8SrP3NVRJ4w7FTupWpQFRU7B24MKsn2gJjvm
         dx8Ai3VKyA9k4iy7x9Nqm/JlNBKew6tIxKmreLFhSw+sk/uijfpgi3rChGgg/XuGypM+
         2lEhnIyN9qV5RVlWZ4Fbfis0XLUjOnuRfC7ocH29NAIif/ebRwAgMx5599IaEQ3bQoYF
         rI0aIxIpcGnwEx2Uhb3drAKTZiAnpJvUzep8QXKokhoqOdJ2vWgEFz3yx85kD61zNn6Y
         pm1A==
X-Gm-Message-State: AOJu0YzoocMmA0QpTyeoL/sUqtp+BhfOflGOTqkhrdgRPeTz0OPFxhLV
	9cLQpxCQG0tPaIlRAAxFrW5gAXdsz9MpJHa8KtORnm+KNBLnGDl5tzY7/yrXMB1a5IDA2rUDc8E
	3h96L6VVhpxJMpgDbBs4yCOGOFzzd7TIS/AqPUYaXS/SJdAqI58QplacM8KH7l7BUD0B7
X-Gm-Gg: ASbGnctTd8n1cOPoFh330enH4kcWCszW8bbdgrW3ZUQts1TDHhfZPB+NnR2RqQaf4bL
	NFbtUt+T+8W0be6aX/gr+k01mRVqxsnp8bebpxXOSO00KSy/Oq+HF3NraAc6xYCHSXrx/N6j51v
	iBhb2rsgtH5dqfcSftdGUxTbJ4CANU9jla/WLWdrOzy5TCYPqEVTJYyEGn1kF7DrYoWpZ2tZU+5
	FPzto2sOv8MTMjV2Jq3+p7MQW3T5YCwTUr0DcgQDj/ESxpviJUpZU+IRAg5VdfW6VZS8kw61Mqo
	GJsMB/uMMAkAVQmtNhhDQuKyfVqyIX0Rldpa45oKY33TWhSGDUqkiIi1bB9Yg5kKvRgUXnCZPQU
	7RoXXpkOOihEdt+w08A==
X-Received: by 2002:a05:620a:40c6:b0:7e8:5bb:b393 with SMTP id af79cd13be357-7e805bbb656mr127003985a.4.1754313261971;
        Mon, 04 Aug 2025 06:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQKfXoAA4iQAVx7vrakGz5rhAfhLmMpyLiivrawj8ql8YqoebUHyRY/Z++bxkV80jn4cAicg==
X-Received: by 2002:a05:620a:40c6:b0:7e8:5bb:b393 with SMTP id af79cd13be357-7e805bbb656mr127000885a.4.1754313261562;
        Mon, 04 Aug 2025 06:14:21 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8feaf2fsm6810919a12.38.2025.08.04.06.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 06:14:21 -0700 (PDT)
Message-ID: <dd278225-6680-4dc2-a0d4-e110fb2cfc20@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 15:14:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: qcom: mdt_loader: Remove unused parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-1-5e74629a2241@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-1-5e74629a2241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNBgmNZl c=1 sm=1 tr=0 ts=6890b22f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=wXYMRSRB5Pq2Cuyld4wA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Q2pkBn88H8tRjVtPeQBTw31Fr3yFKiYR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3MiBTYWx0ZWRfX83SEWB37bdtn
 qSSyw5je2ouvGnRnnKx7WAtJ8SaS1F4LmWVGXHW1goGPFDLkGOV1WQBgWFjLrbzC2dG63m1NBg1
 LjvuOUOgUmd4hf60DvUz1LbllcV1ZJu8A1wN9gcc6eM299iQINfQxR1QwM/C/9NVZoFmLALzN/q
 CKCnlgeqg550NE0isfhvetZziY1s6LejZBmdduG7Kv+LpMcRbJecZji7fSyazUGmXttiJxWjkrK
 rngalzIULB8vLR3lRFjgyH2/RaZRyOuZHukX4CbD0CpeCV4x0EN9l4GSaRzWsWNHUX9zfH4hOyW
 tdmxvffyylGtaVov236CTNjH9OQtmmkJBAq8K1qfIAHEGCMj56ZdhQ5UMjksvGChNpz+DLXVgwl
 5HgnPZWpBcfKQ8d8qzPO4exFrDvrYApjwt2Rlym+5dNqXcX3s2oG1+Y5dA0yK4puIK1W8Rp7
X-Proofpoint-GUID: Q2pkBn88H8tRjVtPeQBTw31Fr3yFKiYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=959 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040072

On 8/4/25 2:41 PM, Mukesh Ojha wrote:
> commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
>  operations") move pas specific code from __qcom_mdt_load()
> to a separate function qcom_mdt_pas_init() after which the
> pas_init variable became unused in __qcom_mdt_load().
> 
> Remove pas_init argument from __qcom_mdt_load().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

