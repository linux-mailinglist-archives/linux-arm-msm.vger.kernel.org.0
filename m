Return-Path: <linux-arm-msm+bounces-62211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29910AE65B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 14:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6CE13A8100
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 12:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3587299943;
	Tue, 24 Jun 2025 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NU63bKQL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CBC28DEF0
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769822; cv=none; b=QiCXdGW9mf1BwNyWHuRFkVW4hKjPqvTNrhV6mHgXrQQOZ8i1k2Gq7JIgEeua4teL0fVZuGCEVoyBADTbyZfp8y9FxsNbslxN0mHwLTHrkfT1hdR1kCGuGn9qAAYvJEU6GKJbO/Mnf8ce1UvTyo0EaSwVp1Ts+utL3Ex8aviajFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769822; c=relaxed/simple;
	bh=N+HKK2qiEo4toQruchw0ESiDROQO/pd4T87mTB5Xuf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkLte0TO/5BYFCdStd1e6JGrwEohDS17C2FX7shmaoKU/SQ3NLbwKeCmvJZmBeju/5pcVigYDzb2d+vLLObQcRxhSfD8lESN9A1Yfdux6tIqoyyHe5I5g0csNJYoUBZDWCwUB49ppQzvgog2s5CYTkTQRfRfDpCh4USmTegNvkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NU63bKQL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O77GP4015721
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGrSPNV0AkW+/pxO0NzMJP3MsnaMmBqY4s/rKDI8CE0=; b=NU63bKQLaxX/u574
	FkCHrn1L1VKjT/Aqzhh776KsaQ8P4h9FQ+vCUkxdiR7BFSLfj9GTycKVUnsLDivQ
	rn7e6dkDMr1brwA89079MtqRChDsXq+eY75WDhX/VxD5F5S3kPxU0qbbmJ//Acj0
	HBoLpRN7NtVrDRSa7L8wn5Y9hSiYUMTR3FAF0NzKFh8FAJj5xbruv+o4CbwpPPZT
	kF6uj8Rtk7GE1ZTFLCHbvg2BVO+nZABS9aVZBemYGV0mLx+T3EHlk+ib39eOB/Tp
	elfcldVkIJ9j6cKqi3TsmGvaKgcjZxzrNA9DslQARKfImb2pVp2hi14KJloJR1qH
	kfvMYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5n99d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:57:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a517ff0ebdso16085931cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 05:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769819; x=1751374619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vGrSPNV0AkW+/pxO0NzMJP3MsnaMmBqY4s/rKDI8CE0=;
        b=MwZwVTpNznbgXoDtnOJuSRAKsRkSFwWOA+ZYXlkrh2EwwpyZjeZH7hc6Sm0z+inHb2
         tu5CrpWB7Cm/Wc7PEs47jZvuJRA+E52SpHHSrFYg/BH6F6G054yjOtzvTYN+y2uYWOhf
         SsmZ5Crsbw2eoymvhOh7fLdqf9XeGLDP3JmNQfm/iJPun+5OLn4ITXd+3wGP0uOTFuUw
         cxps5SEASvR2F5FUlikvqMgGJPfSgdRN6t3RkoFcuWxj+T2tXBQEy82vow3E+2OmX+zM
         PfX5dvAs0mf9XMc1NrxzsqfDJihIx3GwBVuDWTYjrzGgeVMzxCTlqpV1tpo6AxBoR17M
         nwjg==
X-Forwarded-Encrypted: i=1; AJvYcCWPV4u/AWet+WaiLopiPKeRUFDkP+eDMNBDBD9tpyqKjyEcHQQLAyjear8YkAELCvSJ7hvBXzAmtBJgNV74@vger.kernel.org
X-Gm-Message-State: AOJu0YyLZjJDTRSDgccRF0/a2nfWIJL7y8oflPrdjJ3V1DQkegsUdXHf
	XBKUrPU2/oQqDqcOTHU3YhtoZ/1XfkHGiWnvmKHTqp81rFLTAMuI/9Bd4ki2WbqITK9OWrKgxA6
	nlN4SH+E2Cm0XUh8tiD+CClqcS5uUAaJG7UaRdIarO1GExXl0wTmzbDge+wGItrY3JLz3
X-Gm-Gg: ASbGncsQBEeS5LGVwN6jR34KlOgSxST61QTkKEmedAcD3ucO6fvAjBOLtY+INz2Wxy4
	em809v+/nxwNrasH5UIHNOsfLyTuIKOjXUpoDpbvpZkqkjNxmG0eXuwMXL24uBDL4IPsxWMT5on
	8/LvvdaNSc4lbHh2kef3ThgSPoG1p9LI1z/VaHKub9hZFXFdJ1/X1FeG2mdMtam59iCQtUFyAYC
	7+kG/PX7zFRaRUd7EhwGagv2TV8OeQ5qSjGy6npkTy6mN1oSM8KAirRt2jV9weYikAx7A4xShGr
	xEb79Kbjz+9ZSav6N8PnFT4jOJm4J/4+j8Q6D/MyR+O8iOZa6i/G4V26AVS3qjz4JVLci5byTuU
	zVQc=
X-Received: by 2002:ac8:7c45:0:b0:4a4:35f2:a02d with SMTP id d75a77b69052e-4a77a1e7146mr97580951cf.7.1750769819242;
        Tue, 24 Jun 2025 05:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHyHh81fVxV7HHXyMJ4tPlwaAkz4BjJUrdJoA4XGyb3qT8OL8kxhikzSXPBfp4fMeHgjLsSA==
X-Received: by 2002:ac8:7c45:0:b0:4a4:35f2:a02d with SMTP id d75a77b69052e-4a77a1e7146mr97580791cf.7.1750769818842;
        Tue, 24 Jun 2025 05:56:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b672e340sm33610366b.180.2025.06.24.05.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:56:58 -0700 (PDT)
Message-ID: <cea1e9b3-ab14-4383-a710-50bbaa509f1d@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 14:56:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] firmware: qcom: scm: add modparam to control
 QSEECOM enablement
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
 <20250624-more-qseecom-v3-6-95205cd88cc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624-more-qseecom-v3-6-95205cd88cc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FXbDmf70maLdpNi52cosvwhgWivc8n1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwOSBTYWx0ZWRfXyMaKpXP5OW1R
 uqujv9tfFfC96USrin5GeGMn9MDLTfUxQQ1o6igB5aBX4O9wbIk4q607ErS8Beu4YlXTOVIb3rV
 ko2ZljLO2oqQmJH2YHFB37o9vLyEqJ7DyMHOS1htLHFFdVpil6eF0AxrodfnhM1XfSU0nHR0ssm
 SZ2rzf5UflR6aRYr3wneQkYR/ac2szzoSJ8PvSCu7XfbIzGnro28bWCjNjnug/bthMXkgYWe/FP
 j0FXyitPeQePSbcbmNsCkjEVH+t8rqxWFUG3Cz20yypzwWktAlLvc76mk1Y5VHgg7tsh7EiiqdH
 hv5W1SWqlNUbE8uwwAZ8ETA+stJcwMWWQ85ie9nhKa+7dC3AY1mYgD4Tbl0rcDGipeTo5gN4obq
 B866loX5Zw8dGnquoETe9tgRq1qanVjoa5L9KzqopnllZTNqu5/ePdAVl60wHE1YWrMi3gei
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685aa09c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=jdsnN0qd_4ChqkIFV8EA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FXbDmf70maLdpNi52cosvwhgWivc8n1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=925 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240109

On 6/24/25 4:13 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> In preparation to enabling QSEECOM for the platforms rather than
> individual machines provide a mechanism for the user to override default
> selection. Allow users to use qcom_scm.qseecom modparam.
> 
> Setting it to 'force' will enable QSEECOM even if it disabled or not
> handled by the allowlist.
> 
> Setting it to 'off' will forcibly disable the QSEECOM interface,
> allowing incompatible machines to function.
> 
> Setting it to 'roefivars' will enable the QSEECOM interface, making UEFI
> variables read-only.
> 
> All other values mean 'auto', trusting the allowlist in the module.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

