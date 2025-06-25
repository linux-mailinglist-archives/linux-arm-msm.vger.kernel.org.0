Return-Path: <linux-arm-msm+bounces-62495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C01AE884F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 17:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E40761C2106C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440F12BD01A;
	Wed, 25 Jun 2025 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bw2ttHAH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06C2291C31
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865539; cv=none; b=KtXBF7AhK7bbv7Psrd0qkvDhP+lt2WUM2OYjPBC5OESmL1w2tyFgB966HiAs+9Y0OH8xFCyf+3K/8BIiagBOZe7DcQ/1MX/4qcg5gdZnUFFJmo1xcAWhZ1tZ5IL0cRsXh+BBrZUpfE42pEuIT+RTlsPJzHlBLQowx9q/MNyhkBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865539; c=relaxed/simple;
	bh=I813X3EiTRqpw6wo324kYvor4rpxKNGrNGbvqJoqGYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ea4bUQQM77csfvc/w6oT/mZUCvnysnpsebr+v9YvOjpq1QW9NPBf8LSR4MNk+0waZyL/g9glWFRqpKJPjyI9yoyrGx0+7P6UUlebMlT9Avnevr+XO8uhyyXzvTfznIgTSGy9K75usA3ow0CJ71kg284CVxw1f5r8vKbMj7qsZ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bw2ttHAH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PD19XC022368
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 15:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2bRqJKwszvjn9ZfGyF+gPi3zgUpm+iifoMBtv8JYdic=; b=bw2ttHAHNYzMxnOn
	hOLUp5wwm0y0ZTcVIAimXepUCyF0A2YfkqHE8xOau7c2c6X1jCrrr5VZJuCgZ6tF
	OzJoJDrzDD5XMfPCdDzUlS0wHv3/DmHOcgQ+buld14vkQkj6TykjMsgwbcM11Tnn
	cAOyzJeY9xnRVI1FWb0OutxSmrvzg35lUey4edVCal3cmDzIcFGvbB44y+uFVEBy
	y3r9eX9IxaGN8ZF5HidYKkzeKIg2gAM3cW7L/BHAGn8nLxTu7UK/8XdWb/OTn82F
	xbYiyFW/uxk/B/JBWUzju8gyos6uzEMfUpmwuaSpbGesasw8dNpL6ckADKsTW3io
	HaTgoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b407nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 15:32:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3ba561898so117238385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 08:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865534; x=1751470334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bRqJKwszvjn9ZfGyF+gPi3zgUpm+iifoMBtv8JYdic=;
        b=apLtl4HzYCR0Rm5nTXgnw6P59pyR/18a1LmxKb01D/sNh2mgi6HAzP6cucQtrMlmel
         Nz3ZQg5/vxPqsncjaFBtc3QuTftAUSWfz33YJdnXCJA+XF5HjcfTVi7OFPo22i0jkxF1
         /Ql5rmClULDpEtmKiSRzkX1+yee4BeM/Hdb2ijDDyjQwa5BLOCcGOKJojKbLUVFampTu
         C+oTT3a+AwISqiJupiwH27Wj1htv5GpkGcbtOocAaaUWkPJxv2GU4e2TVnG8kMq15Dg9
         MhUX4sx7YsmUcmmPkrVlCee50HjONeRoOpSzXxndBblGAJ8iAFVRCMdaW6qv6QzoPZV3
         APsw==
X-Forwarded-Encrypted: i=1; AJvYcCVHgftf4MMbE+bUzR+vvB2KpWbu5YjXuyWo+c4yMLOzwwwwwjWdpML5L0WU2rcOeX095XUCxW6aSMPU0mnE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6yKA7TBLDbzXVVHvQ5vSoKmtAbY8j6h13WvHki+vKpZrAZFSK
	2m5T64yxc3rEPn4a+Kr5f6eh8LoxHXdIgXmkOkEMCZqbwiWz4BVF1sCpMLJ7bIUZ4UxoWmZgGFu
	Pp3tnM8Eag6b28zm+0b/Mn0OThioTbxp8jzVkVQZ7Me+xTqJuCFAA2+j4Vt2x+GkKyJIb
X-Gm-Gg: ASbGncuq8cSOLD0Sj1FkSudz7Th/oi0+d0kgu5BxV5n6J6qgjz7DDCAE2CAOt9/QvYq
	IuneinKm/Xzb6GJ4PAzEejVkzvuv+ycHnK/SfEhwjGVACNe0XJyG31vT6ICsa234VC7IEzUIXZ/
	JhAnmh8Qf2Y+OfpC4k0fxy6t0bgRCYScDjJ3lPsJXEkPrOF+vcTcP/MClH7P3QymEhGVhu3GM30
	QYHRcbXfRPOXiT+YKejDQtZ8ipaFGpc35v4n4clx25zNw7g/S717RBJ+EBpdzwHFEqCnzLXXVXT
	iEgymMbrMW90E3yUOk60K+z74E3xWTjNdZF82lPo/rDE4urcDGstRQ0ybWdRw8P78fJSMxai5AZ
	wdBU=
X-Received: by 2002:a05:620a:1a22:b0:7d4:1e05:ecae with SMTP id af79cd13be357-7d4296da9c2mr193092485a.3.1750865533412;
        Wed, 25 Jun 2025 08:32:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuBJ83h9G+qwXCNBTSoc+BDxPk02mWPCES2uC4O7zyFAuSLARJnDW3VJXs7MFVpfgTejIuwQ==
X-Received: by 2002:a05:620a:1a22:b0:7d4:1e05:ecae with SMTP id af79cd13be357-7d4296da9c2mr193089185a.3.1750865532427;
        Wed, 25 Jun 2025 08:32:12 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cab0ed04sm63243066b.135.2025.06.25.08.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:32:11 -0700 (PDT)
Message-ID: <e24c7bef-e94d-4deb-9ee5-a8e91373716c@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 17:32:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: mdt_loader: Fix error return values in
 mdt_header_valid()
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDExNCBTYWx0ZWRfX7COMwdrS40Vq
 t+vJfEilj4E3fd+dPDtcYg1qtoZzBo7QT+9kNWwRein0SF6SSVzOiF7bPYIUy7s72eI81lRhY6Q
 bULwnkGPFSizHogNuuAjoZIBPe/8CngKanEsi8MAXkV3ZaBWGXW4eh4fe1UnebO4OffRwVqoCHF
 zYyXk62Ij/Z8v0InjEyjeNjtwYonLG8+7izu0Lc9HvIW3JMEB+/epATKOmP7tYp7VukzuwrrrPt
 8mXGff9Pn+cs3uIDos5cEOqeB1o56/rrhZfrVt0MV2CHiNBTxp5SY96fplcN1aueBsLX5X/j24p
 VK7LWjfr6eK1yuTp5iYyH4Q72wZ5uNEssvjQKlwRjcnJL6i82GYKBEK80DyJHmDZrKnlqKKk0l5
 sB9D0YJBxNJhVVI2G/AWccYVT6WJ+jgls9zrnuntwxNr0GeeUzrNwUWGFpjcIpN8pmjoQVS6
X-Proofpoint-ORIG-GUID: _Xu5mGuWaTWSJVaXXwFcZKpnDjbbg4QP
X-Proofpoint-GUID: _Xu5mGuWaTWSJVaXXwFcZKpnDjbbg4QP
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685c167f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=W7YHIwnd5pbqMA7mjMgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250114

On 6/25/25 5:22 PM, Dan Carpenter wrote:
> This function is supposed to return true for valid headers and false for
> invalid.  In a couple places it returns -EINVAL instead which means the
> invalid headers are counted as true.  Change it to return false.
> 
> Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

