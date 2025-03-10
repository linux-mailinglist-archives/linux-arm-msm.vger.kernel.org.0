Return-Path: <linux-arm-msm+bounces-50805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFF4A59091
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 11:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A22F7A4AA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 09:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4592248B3;
	Mon, 10 Mar 2025 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pgy2XlTx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6306018C02E
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741600833; cv=none; b=oA/iw/FhuslNgIVNi6lOuyz8u54U+LP6PxRMswVeb9luL1ZmAEhUo3c8fkC2DghwXQLEUML+CWiVmiFQQ5bSqfBJBBbyL0fNFR/9axRNMUnt2I8ncY+5pbKvmMI9k4NUviOIrV80ziTLYNeO0uh2jRg3gS5ISK6DOI9zttgxTXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741600833; c=relaxed/simple;
	bh=/WFGkSucmQQVqC4YRwLmx2Q0dcE6jZVaFroVNYU1Qnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ggSImsou2zcFzGjYaDUYb4rjLbVYJbAv4EHDYbeqf/XfVOcIKy+2HPrjkHAE/h5vYG21Pauv7ctFVAdJzobVUQfDyvFwdBR73Fr4aAn8xA6jMiTnH1UxWd2cTStf8QuIAFRQPI+p4RO/1RmdF/WccFcXVKpDkQTSew5cgwzZb90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pgy2XlTx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9gH39029833
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 10:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/gEoqv9b7eMEoqWazb0zYafPZy1bYCDNTUQlmA/QxU=; b=Pgy2XlTxWpU8uLAX
	zx0dbb9Qc1lsGe2Zxn+RenQS+DywssgNwDKqey4AnlfDrU+ZF6VQbInYJ/kurxwi
	nZ+oEUbStS+u8BgvBzCTEBcT9s4wrXpvn6OCXPbfC1Z/IyFMMyDnsBgt56I6EswI
	BfvTFiqCqqwEflpVkPyrozuJDuM8pW3bqyFl7EbySwU2SiByZvjtfwtyoB6QkL7O
	bkLD2rT8JMsgmpn6Vqc7qXiDUpE1jKPVwgTVwzAvuJ6cQYRnD79cf7wyzJbvewbP
	OLzt3PzZwwSjgzDbnzdMS0hG21/9kv22gxMLgby2iTU3Eg+C+o8MBBrV97Y6WOH6
	w7dCqw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eypccda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 10:00:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so4759155a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 03:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741600830; x=1742205630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/gEoqv9b7eMEoqWazb0zYafPZy1bYCDNTUQlmA/QxU=;
        b=v67TNsLpwgtFPbH9QLiSRubdBPCajAawu9kJ1Tz4VUkRlt/VECPuzbrVCLZ7C4oZeG
         2yUfnVN1j4LtufaW9jca9YGO0iIigg+791fZgExZr+xuvnjlujOylN7WM2K8c658g7sp
         fgcYOyQ6BCNze0C1PlCI5H1u2xxXycE3rO6ErkgEODu3i07odVC+FDAWhYafjdnEb6Mc
         CKyMBRy2HD35ovDHUVGkZJAraWoYpFFrK57f1JZWeDivbpOmJMGEU7AyNS/CN7S9ENlw
         TQvK/UmqguqmuqJeRxZ5VVkFULKGqj5IMJGP5DKWIC9k5J0gJvt56YesCNDBVg/KEpvQ
         jx/w==
X-Forwarded-Encrypted: i=1; AJvYcCVAlRdBepTXUkwZIxJ3L6vz051qfCupAFF/8bJG5BEDZVxWl3qYogLrKiv81NnsLcD1YEPKiPaYaE5sp7Z8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe9Ah3CgEBEIZcgguzy4Seb+a40OChRg3iMpPbYh67zOWmmDfH
	tiZXMJUjj703Uzg0uuqy2h+MIqxG7rUHJ7i7srKUKqXiuZK5e710+nFyuOYpKSC12LaUdsXqn3D
	Cp6lR5+5ZGoJ2oXepLJM9kAl30nFWULWMPLGLtfQwRis9qrxsOQ9luOFj3fDBQMIK
X-Gm-Gg: ASbGncs+ER+3Am6nLGmdleebkZ+pCRIgLZlE3wB23HBtieGh8k6O/HNT0R6U+jPUtdM
	YspzSFG2P8GSrt6+h4F5AOjkqmNWr8A5stdG/I0nfWWpecXdG/7JI6hSNfWLLATcoJah7k5jh6z
	cinYJPyCsdKigY/JewQZID9lUb3/lPyl1u0UntKghMk4icGAd2wBMYrGTJl9qNY9w1I8XD8PHeq
	JrCTPaqat261Wz5UMfCYRMRu6AB+UU3QHaU9tv1OZP2BB8fq/a+VIE++tdixlntQmKj2iJ3sOA4
	7x3TLeZgOfApVHAiBrSLumVacT2CYBomNWfgP76B3mVUoOJ9ONck7xMf
X-Received: by 2002:a17:90b:54cf:b0:2fa:f8d:65de with SMTP id 98e67ed59e1d1-2ff7cf09609mr17131123a91.22.1741600829624;
        Mon, 10 Mar 2025 03:00:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2PnlBORgrtsnN495wyn9nxcbur0ZbfXPq3v1ScLmErAorXFDXK/mJYeYf0Bj2DhaFWSa+2g==
X-Received: by 2002:a17:90b:54cf:b0:2fa:f8d:65de with SMTP id 98e67ed59e1d1-2ff7cf09609mr17131087a91.22.1741600829242;
        Mon, 10 Mar 2025 03:00:29 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f9f9sm73645885ad.125.2025.03.10.03.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 03:00:28 -0700 (PDT)
Message-ID: <bf79cf5a-0c50-49e0-b930-1ec5028e7d0c@oss.qualcomm.com>
Date: Mon, 10 Mar 2025 15:30:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drivers: clk: qcom: ipq5424: fix the freq table of
 sdcc1_apps clock
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, dmitry.baryshkov@linaro.org,
        quic_srichara@quicinc.com, quic_varada@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250306112900.3319330-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250306112900.3319330-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A9yWP7WG c=1 sm=1 tr=0 ts=67ceb83e cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=o3auzIaOksCvpTgIIaIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xYa-NpCVIFcXXwNUlJo-2bWxctqPO6hQ
X-Proofpoint-GUID: xYa-NpCVIFcXXwNUlJo-2bWxctqPO6hQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=792
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100079

On 3/6/2025 4:59 PM, Manikanta Mylavarapu wrote:
> The divider values in the sdcc1_apps frequency table were incorrectly
> updated, assuming the frequency of gpll2_out_main to be 1152MHz.
> However, the frequency of the gpll2_out_main clock is actually 576MHz
> (gpll2/2).
>
> Due to these incorrect divider values, the sdcc1_apps clock is running
> at half of the expected frequency.
>
> Fixing the frequency table of sdcc1_apps allows the sdcc1_apps clock to
> run according to the frequency plan.
>
> Fixes: 21b5d5a4a311 ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC")
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>


