Return-Path: <linux-arm-msm+bounces-47465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A7A2F675
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 19:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9403618836AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 18:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B771C302C;
	Mon, 10 Feb 2025 18:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rq7q2rZT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D717E25B67D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210910; cv=none; b=Z8UjZDBYftXdQHbEzjEzlpoKNiVUz8mBD1Nnmhsq5rwpPwv2cy273OSQNbWQowI/3FnQLRQzzMyw0G5tbCk8d0/T9MA4ZaBeIB2WwvMHLnFGd22eRZxKrmcOmz/4tWc2fxYXCY1FvtxQJPNuenXfvrp9oWdFg6uEiGkoAKis4Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210910; c=relaxed/simple;
	bh=OizxFAd8Ml7FWVe9/a0dRnpl/BRHIHyYnN/mYC7JJRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ermlJ07NDta8hJgC0ooBJV+vCPjEqNVLanUGOU8CN7EIFOaLr1YNBKBJxlyyMivU2GmgplkhZaPzNY6KZQp4IpFkD+GhPqkaLDPPiUXjsP9aNG97LdXe2pbHKUG1BeYZkB6XPCG6mbndKirOF3sNMXgW8TN1WL7ICXTPUIlFf/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rq7q2rZT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AAbA5h011114
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aVEc4MQ6CdO3X005rNysHQSMC6MxwNXf4vRrEItGde0=; b=Rq7q2rZT7t7BdYko
	JuUD8+Sw+Aqyry2pdzAPeAWj5QkByFsGln77OP1g7dXHuBO43xUKzZnoj+yNEXC2
	XMoKO9sJDjclozaeZVqP0qdPIWljYQF5WGTGa3NvnxvV/brigMJFaoOITFSNaZx7
	K/0J7037cxceIyWtphGFNVe83nQcYgOhlXgBplA9rqYsq9RooCYXrxW1e5mCIpIl
	EdS0jRD0pWhOjO8rbcZ/AXJ4jooTUHLJ1TBV3jN7ZewekY7DSVzBXu58ioyMmI7B
	MlSO0UGzhDhIbY4xnhCmXCwK3q5bWN6nrdOU+kIETM1zxM/lCgoeYeFrhbUqb5Xl
	oWOG8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44q8kyady6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:08:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4718a18521fso2387101cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 10:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210907; x=1739815707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVEc4MQ6CdO3X005rNysHQSMC6MxwNXf4vRrEItGde0=;
        b=YH8avDsouE0kuMnFvRNKQNkv/l96vRyx4z34PF69RqSOeVf2dMkt16p13WIn9ikJA9
         TKIJLDj306vIUflMqtCkbm6wMhEE79gM6l/cL+70F6Qn2eGR+NRWss1bJpkS7eyQu1cX
         odfKpsMSReb+G0kee4DvdrS9uKRLjBLnVVhFoPut8UzuqFVGB/eslT4kLfJP6WoB5EZP
         ea6tPbfn43hX717vTVzfJL4/Up9mRUkIT7wd4yDDmus8vDFm2tpTFNjB16jWfcVOcnHh
         Tn8UY8AwfvCjRwyE2XivPM0/t/L8Y5svqwPPq9MINYCwVQvzFe/06PsFXSOKNF4kmt0c
         xchg==
X-Forwarded-Encrypted: i=1; AJvYcCVN+zpYLRxeCKLoRBOtM33Si47Xi48OqjiVDCNPv/MqWVYLxRHtTMUh8513AdnlMpr+F8l1O9Q/w69koA+I@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0DcMeFR294jcYkYfrNwgwq/m3cBS2mYSCdSuoLU4DAkeYUurj
	UL/8JwkxErjhUyFOc4ZQSzv0F4DiQzKFCsfOkdbHymmmbWH4KDRrCDviCTB6ur93+bO2Oug+ImF
	j7wcAnQkyShm0cB7Cm0Egq4HaoxBaR6bWkA5VOqHVM5RXt8+rLyXVwrb6UFINdbmB
X-Gm-Gg: ASbGncs21yL1S1aW6oawL8vNgCyJRlQ+GUCn0Va0ryHXpGbOedo9dS3uHV5RBtDK03J
	M/JKroUYzxCMp2WtCgLLaeugsB/4/L9brrYTte32iQFMWOSezU1CUZGoaDcTWg5ohV5TVaoolOl
	SG5g3bjtJxjM7+SZtVp2d+fYUlQ8sY9/qIWsM7Ok6+RN1+p5xIF8ujeSg7u0KNXAaDuKdeZt7Yp
	wSjJ91t+GyQDRDgkljq69Ec6ar/rHSxquWApuIbdKE121wLbaovWPyq3blmL8vqyvsQ0tWy+6nV
	9jMdY3rX0Lwc+V9ufM++BXenDP6C2tDHD++Gf0AU/YlsIIu/lWohZ3aL74M=
X-Received: by 2002:a05:622a:149:b0:462:fb51:7801 with SMTP id d75a77b69052e-47167a27b02mr81244361cf.8.1739210906687;
        Mon, 10 Feb 2025 10:08:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdrknB8s0TEZ6l6OxgfCx+ee/ErwU07AWVUGCwldaYl2UrQYfRoVCq+VbLfV+XOerh80eF2Q==
X-Received: by 2002:a05:622a:149:b0:462:fb51:7801 with SMTP id d75a77b69052e-47167a27b02mr81244181cf.8.1739210906224;
        Mon, 10 Feb 2025 10:08:26 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b43ee08asm374138066b.88.2025.02.10.10.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:08:25 -0800 (PST)
Message-ID: <a37ae05a-5c9b-4c48-a321-08c26ee3205d@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:08:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: ipq6018: add LDOA2 regulator
To: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Robert Marko <robimarko@gmail.com>
References: <20250210070122.208842-1-amadeus@jmu.edu.cn>
 <20250210070122.208842-6-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210070122.208842-6-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aeQz-WednNVApFrAyGnrxuFmXE2KV8LS
X-Proofpoint-ORIG-GUID: aeQz-WednNVApFrAyGnrxuFmXE2KV8LS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=814 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100147

On 10.02.2025 8:01 AM, Chukun Pan wrote:
> Add LDOA2 regulator from MP5496 to support SDCC voltage scaling.
> 
> Suggested-by: Robert Marko <robimarko@gmail.com>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

