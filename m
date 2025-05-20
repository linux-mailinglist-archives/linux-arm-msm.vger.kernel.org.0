Return-Path: <linux-arm-msm+bounces-58752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51043ABE117
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 18:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C36131BA3275
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD2F21D3F3;
	Tue, 20 May 2025 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NY40pvZA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141C1252297
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759729; cv=none; b=bcDPmQdj+V6+/Mj6/b1N1XDQSibsQiUNbSESh1gYBl2wt7EuSRBoRmd9ZfmKY2oHTzuMNR6TD/rNfsOflaDLSWkfx2h4q/ryQpO+rVk6DDLY/519DM26JipQ5nDVQKm8tk4x2Uq7q2qiWrGBLMCv4SdWAsMYSWpalpDeS0ReRkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759729; c=relaxed/simple;
	bh=X4+btThmKvIhjE0qAfhLumAaALzryTgL0hvFCGxRLxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3iUO8nm3XgYUtYc2hCsEO+4mlPEbUZT/xMfa92w608cV6XqgglyB1KPrtIoLAbv2OL54uTfcEw9Ofonx1BVee75xLxyMgXtlDOaA4NbHn/AXAWRcD/6tS55LZTD2CYMpUJyBUFm7yeNVqdPqupxy7100TL97n5ma4gJHJ1Vp70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NY40pvZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGentc016533
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ho35WoPUyH3gxfEwkpGcPljNy3jZF5gHV8aJ2JxHA1E=; b=NY40pvZAX6r4ynz5
	4ET4ml+TnJzRKNVvWI209DKeBNv6uKXPSHVDXR/15HjZuyKUkI/YreBQki9pL74z
	LL3QjOuOtAhr6mr/nHuY2T/jrDLvCsFwV21o6rgp1TQaVUQWocMXzGg2z5y8QzIh
	FIntJnrFs8OBL2j9gN0eZj19pOBVI/+rt13BnumvF+Vqgo8Yt+/jmvuuPfbC7C7E
	pmxfYMdmoNHcUuqZobhJXq4QTwkbuqfyFfGQuDniNVY6kqRw6ejub1aR6jyrKlJI
	DNsgrlyRb2AucPacWP1NVXf8/zJwx52awkfJTXPySN22i4mgwsx+/qhV+kRDpC0e
	TxL0+Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb00qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:48:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8b297c78aso11875106d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 09:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759726; x=1748364526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ho35WoPUyH3gxfEwkpGcPljNy3jZF5gHV8aJ2JxHA1E=;
        b=WJOVuasHrlSJF1Zm3hR853ETwMPOHTai1b9XhrwhcGXohCf8nBA+8/pWnA9bPgmuDB
         wGYS4WDZb9iGm3hDWg8eJ1386KNf16k6qKXxFMlsXskF+mDHqDWQAzgc5nKbyiKv2cEw
         8oPZxz7+BWq3AP2+jjgDHHTMt5yby0ApTBkaqGn4+g4K/AXsBV2ihWnRATU+4PPqtpnY
         SjMVrO4wjAO+umQi6AJjSbBA74QeXt7x1UhWCdBhLwJrorxkLvmDzS9IJIm00LXakZzS
         S5QSRQpSctpnnZR1EnGLofilhPBqr5z1nFvaqi3j2hcAFRltycI4GrfQ2oJP5K3eY9DJ
         ci6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuTbiOIpFzReJuqWsvP7IrPAK6HXiNCn8jXvpeKyWTmBOk/QUQIqy0tDcCdQfSfbxtgZkkpDpgDbU6flKF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfb7d7xvj4al3XicjnqKGgeAEAg7xMpakIupTq9pRkobu6g49d
	OKpkv912JiXiGDpF/nDtau7Lw6KGUmwZFmuC4kIuiif9LPlNIabu0nkaU/TIADJlFAbWmZwQMmu
	pzDao4H4ihBWZVJj/npvgicm6PVQxYGoGlmJZvb2WMx8OIiIjQa4JpuF0sY458ELVPaDZ
X-Gm-Gg: ASbGncshl1fphSgiOsU5OierKHS9//abFi60elKk4cjOlKViZlFzAL9vY5xXJQLNGk1
	A7BjKH3HYxTNhROTgWHKzLqKc9gz2zO9e3OPJ2Qb0Jn4+/D5zNwfQQlKeghhfDxa7ASfxDXJoJC
	RMe0OeJTKJih2hgRpLt+3mky8ABYK+/ufkC+ao5NMgoZsZJu8L/2fvO8iBiPXzbIaEQa/0ZK8Rf
	aVSuz1A1mgBIzzRJ+GgxSBvYML+wa7oNsr9eqwnzRAeANH7RR67JC/46qJXZU0X8z3e0Uunyu8a
	5oAQ8QkBv/IAxZHpcebeUdfO7WA6HqW3XVpto4uu/bXCDV9eApzYRUBIC0nzGhnWkw==
X-Received: by 2002:ad4:5941:0:b0:6f7:d0b9:793b with SMTP id 6a1803df08f44-6f8b0944b8emr93780896d6.8.1747759725647;
        Tue, 20 May 2025 09:48:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPLddRavjW7T5Aifs9O+LKyxFQH6Bk/4p2Fk+pp7h3r2EbU91L3XnVOfAD+U2L+jZ1PqXF/A==
X-Received: by 2002:ad4:5941:0:b0:6f7:d0b9:793b with SMTP id 6a1803df08f44-6f8b0944b8emr93780726d6.8.1747759725166;
        Tue, 20 May 2025 09:48:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ae3888esm7381058a12.65.2025.05.20.09.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:48:44 -0700 (PDT)
Message-ID: <6cd1e3df-5a47-472b-98f3-468b8e86de5e@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:48:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add UFS support for qcs9075 IQ-9075-EVK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sayali Lokhande <quic_sayalil@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250513084309.10275-1-quic_sayalil@quicinc.com>
 <bhu7ifrgg4fgy56lc3ix37drxyciyzl46qkicv6lr4svjejcgi@dqdv63ogxtjr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bhu7ifrgg4fgy56lc3ix37drxyciyzl46qkicv6lr4svjejcgi@dqdv63ogxtjr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YsAQJfbmk5bLl3aGi2pT0UPqaNXjSEN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzOSBTYWx0ZWRfXzdUG11uxORXO
 XsjnyxUXoE5KO8RYM3SH4Afh1gCG3S6oOGzS11k/v/ERQ3zd+NmCv9FdARysFdLnA+je2SN4eJ9
 hiKIFDKlvxmS6e1WYzlfleTl8c2fC34cnHMcQHmPyEygp8AtxuMcMzlp5hP4R9uK6HOGGmInLAr
 3LiWKbH+he8pig2xW/tVtL2f+jJ7fh/1CJarpwhc/SmN1LxdZLL/n8H65mtSWoeW0Ho0vxRt3Rz
 egyCBrmdMZ2hpHwqUlbkM2EK9d70DqSqzcKil+/GbPVnQB9QboX/ZeJEWWXjA4y/BzKQ6Fu+8Og
 3VgddPIsWqBAOiTvrGzbT1uZg748bHwgXbP+FBE4CK5ijSb+30bnKzFIph3/tAfqNY99UgFnwM6
 +nELmjqvMw37JhT92CiAqVKFh8mKNZHUaPZ99hvfc/buFkjCLf/9ttRvCo8A4rlpDrPE2HLQ
X-Proofpoint-GUID: YsAQJfbmk5bLl3aGi2pT0UPqaNXjSEN4
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682cb26e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=9KQU9hNs3Guf2Fy9bq0A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=992 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200139

On 5/19/25 3:07 AM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 02:13:07PM +0530, Sayali Lokhande wrote:
>> Add UFS support for qcs9075 IQ-9075-EVK.
>>
>> Rakesh Kota (1):
>>   arm64: dts: qcom: Add support L4C LDO for qcs9075 IQ-9075-EVK
>>
>> Sayali Lokhande (1):
>>   arm64: dts: qcom: Add UFS support for qcs9075 IQ-9075-EVK
>>
>>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 27 +++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> Please note this change is dependent on [1] which add
>> qcs9075 IQ-9075-EVK board support.
> 
> Please squash it into the original patch.

+1

the patch contents look good

Konrad

