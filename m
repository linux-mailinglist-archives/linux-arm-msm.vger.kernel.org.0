Return-Path: <linux-arm-msm+bounces-103492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFkbEbHu4WmKzgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 10:26:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D264189F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 10:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E97D33088C30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 08:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487E33AB28F;
	Fri, 17 Apr 2026 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jx8CbxBe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDLvoHm9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FCF3A8759
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776413933; cv=none; b=n+xbJdHMMOhnIa+bRPYQBCdXOZtw1n4Heq5qErYaDTivbvmAKXoCjyQw+fAKnt/NsQgi1Pf28Wrm2wyd5fKks78nZeYPkGR34QWtg5lDa8Ogf0JzLx/ansxW8lwFBxYrP3ccwUwJd/BjsSv9ZEmIS0b7H5KTLPc1sdU81m3n4xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776413933; c=relaxed/simple;
	bh=W4914ijaHtsGuoHjyImIfudn9Ri8THvzUCwLWPpH4Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYcqvW/xjltn1rHileg8EPer5y+CKPx+oOMomM0JcWQru12xjnF0Bjx0t3WqYM+RhKJQYnS/MxwgG6jZhSlX7tyPKa9rTo73I3UPcIeAYmzeUTfOGY9brrXckgEqWXCLhbkaQZUqE1zsGCnSWXMqlEWMtt3u19Bsf0Oam7FEPCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jx8CbxBe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDLvoHm9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H7vlOv1092086
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OEJHzpxMYyDj5Jhz11ilEri4H4j79upCGVF2YTnnQAU=; b=jx8CbxBegB94t0x6
	yWX2tBQ337wcaXkrH+wP+NTqWMbbdMM5Maxiqv+3EJ/ZmYPNd4eoKzH3qkMnrAy/
	MasjB+2PIlrLPqpHYUJf5UYWSYulLwxvwIazN5tOgDcy96NyUjY7pIsNdwCGXuUh
	uxnPMHFUkOxhn5wJLUkzqjGcL2FiBQsouES4Sjmu0e2V0VdT7n/6CMc1a5hxafB5
	16b5dJK0vDz/F+L2S1jO81tg2Hq1g66O1qlWgmm8eK9nXmk9TAkfXl/I46nQ88CT
	wK2+S2XNgmMLmhL/TzV2vKi+CTy6DsNzy0G3jKdRFJZGAFCVmmNNlc9/0qJB/M7d
	LX7Hvw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk227u83w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:18:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50de490b092so1055121cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 01:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776413930; x=1777018730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OEJHzpxMYyDj5Jhz11ilEri4H4j79upCGVF2YTnnQAU=;
        b=dDLvoHm9f42D2GfAAgflYhmjvedR+hV1Jk9rKHoSJeLDjiv/ydRsrz6hwtifuQzLwC
         K92AVzHKRRN++RTT6dvBiJtJiGtA4Jh/aj803Q1DDc9dLnLMgOWSjgReZuoiqw6xi134
         +F6JOSaMdq1KX8BFuVvEm2T2wPcxW9f8DNQQWG3Ix5dIrCawxhxAOxmC5uehmDltoW0h
         p62/mjPPpwVYB8Dt+7smEznpk7YJvjXs+dB5yMXuamZa4D81n2igjA5FSN4oZ1a7OCfK
         QmZr+EUBRW0MwrM21qMHeI2g6xBnL07Qvm+QgRUPN23u3D9zDFAAXEEAYQwbxWx8CPRe
         aBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776413930; x=1777018730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEJHzpxMYyDj5Jhz11ilEri4H4j79upCGVF2YTnnQAU=;
        b=JQtpqG0lNzK9Rbr/N8/R4QAp7ZbDaBkBb4xtRREYNYG9XTW8y4eBT0q0wDcyOstzdQ
         G8zJMxparmlsUSZro8m1hKwAT/V1ldxv4TUYC/5f0P7M9YV++gFQIUhp6Om7q9WIK9i9
         zuIM5Afbt/DAwXJOSFLlKYMuem2q1d3eCZzrWGXCVnyUYBK5EiKfDKt+rSaVoy5gZtVw
         LvnvnAaDa7b8J+TYUZiSIxYBw9DiAjNQFneNroY2aPgKUL8pABoZBAQYjlYxQoF90rVn
         drhKLtAAkN2xIPKEgImz+Hry1F70maSAXvBVV1gtphZUzuUTE7rT1Dj0m4VdN0jYTV/n
         q3gw==
X-Gm-Message-State: AOJu0YxePpXntPdujDlzi3MYWzMFU82StiH8TNq5XcGT0E9yla93fxnG
	wgFUntzyXcNIrfZxs6jFsPpgwlwExAqL2jndEk8SetofRzh9JUvTMEJzGZ+fbb9XvsnWBU9XXA/
	1FJNeNaVqEToWgfXb5+84Q27g5KqCuhaISKdv9hqRF8sgAdYVIEbuR0GvX+uKfPtO1Wyc
X-Gm-Gg: AeBDiesQuu4caqScjr9+ap3+EeUX9zKBqq2cfFU27soEThgysAxjHkT1Yjml6lqKK7d
	vPdeiaG1kpwmOXN48h0CDgNqmc6bT7Bh5xnVQOlpBHYV9NWIwAdEbXCZWM1mpOtYSEbibLlxJEU
	dvzSgUWH+x6W0vBF5/r4egw2q/1zQLT5xNezaJrRv4uiZkMH4NOBrEgrjI3IQ64MbLlX9mrSmfO
	LOCOsOqNKWBPSv0B4RwStj6vwA0z4k9MXmOW4f/sPZ/V8uHn+eWXQ2++lSo4oDQ4uYouO3iDGSt
	LIDqYZonMi060A8cv3DAgAPQV1KFl3akVfSb4j0qyt8L2fNNdgTnEY8FZxf28G50YJr7BGvzJZk
	w9TdC/xUQkumxM9S7lA2lB5uJEpEaJu+KgVe4y1E6WdIBBHziGc+uj002ZuHC6QJ5vNeRSJKm+0
	piVAKQDw0nZ34McA==
X-Received: by 2002:ac8:7f46:0:b0:50d:c190:9059 with SMTP id d75a77b69052e-50e36825b01mr18548801cf.2.1776413930410;
        Fri, 17 Apr 2026 01:18:50 -0700 (PDT)
X-Received: by 2002:ac8:7f46:0:b0:50d:c190:9059 with SMTP id d75a77b69052e-50e36825b01mr18548621cf.2.1776413929900;
        Fri, 17 Apr 2026 01:18:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe951sm187255a12.2.2026.04.17.01.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 01:18:48 -0700 (PDT)
Message-ID: <23078bf0-838f-4a57-be8b-6ba2dd0a27d5@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 10:18:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Set max OPP before DBI access during resume
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-setmaxopp-v1-1-6a74e2d945a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-setmaxopp-v1-1-6a74e2d945a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA4MiBTYWx0ZWRfX4qhqou5Azt/P
 X/hYIzPGhQcv4tJo679GQkAaTWiMfgfFY5VcK3lyfcbQPZLenHYkD3RnkrL33EzETvV8V7OejAq
 M2Xo7Lhj1/d0DDrgASgf5nEjw6+sjyZzHYcozdSianmC6e1umGU0U1ZtCOmCsTALf8Lwhu5KED4
 fMORhLtreLdRq72jLGgeltVhooFiQGhqtKR0gK2ayX2H90Qn82tqiK/GiMdMtmF1SleQvJ7p7Df
 8aNYnW9LUeEgctsIT38UFLVrJvHMPGSrbRPW5rhn735jbKjQjax763lgthiOlhBdDM6IXawU8Pl
 e7V1TLyVKZp1pp84BE7FLbBiBnfLbvWtZmAYy/j1ivQEo5Uh1tDdkdfjJVNpoUXKH4fA1GA7kts
 ypT4nnP3sd/Ibn8pNY7bJXK9zn5yTtFjMuQy1sppwdsglI0fHWnxaB3RmKp/7Qv8+z7rr036L1O
 O6McnB63g6RQ/Bh6VQg==
X-Proofpoint-ORIG-GUID: luHTKB-sMdM3dZpYagjbSbNOTgdiDXCi
X-Proofpoint-GUID: luHTKB-sMdM3dZpYagjbSbNOTgdiDXCi
X-Authority-Analysis: v=2.4 cv=Iuoutr/g c=1 sm=1 tr=0 ts=69e1ecea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Zbnenumca3Z4N3844nAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103492-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79D264189F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/17/26 6:16 AM, Qiang Yu wrote:
> During resume, qcom_pcie_icc_opp_update() may access DBI registers before
> the OPP votes are restored, which can trigger NoC errors.
> 
> Set the PCIe controller to the maximum OPP first in resume_noirq(), then
> proceed with link/DBI accesses. The OPP is later updated again based on
> the actual link bandwidth requirements.
> 
> Also introduce a small helper to reuse the max-OPP setup path shared with
> probe.
> 
> Fixes: 5b6272e0efd5 ("PCI: qcom: Add OPP support to scale performance")
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 42 +++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 9fdfc88ac15120b2b01cad746772ae612a2c9690..c9b201a1c033a9849e97db9ee4d07d26655d5a6c 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1613,6 +1613,22 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
>  	}
>  }
>  
> +static int qcom_pcie_set_max_opp(struct device *dev)

Can this be a small non-zero vote instead?

Konrad

