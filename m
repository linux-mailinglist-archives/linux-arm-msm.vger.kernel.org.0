Return-Path: <linux-arm-msm+bounces-68960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EC8B246DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 12:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 091774E1391
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 10:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5772F3C19;
	Wed, 13 Aug 2025 10:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRVX5vJ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBD42F3C0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755080092; cv=none; b=DY9qqZvsCa+va+mxgwUhCNaOWJE3FexzTypREwgn/GkZoSw/v0v1GX8SrcavI8++InTTAEh/ZJBXLaJGgy63pTVByyP6ObmMK36f6mVXeNaI8lhNs9l883Qpy4bmHkYqJLr2JkDxGoO5h2WY71wek3TrIT+O5Sa2MB64aaujwh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755080092; c=relaxed/simple;
	bh=OsF67T9tg31dlx8H+a4WlbXvU1y++zX3+kn0nxjc1eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjgU+jKCC83YLSbFjGLytwtt/EtzM0WG+qEioo1VpO0XrlBu2MTxf3zN34GzZGSrd15SUHvE+lvvQPggLPxsi1hpYK71OsdXlyEtaFQ0v1cAuf6EO6DYNpb8fDIHUS5veBeqgDksVvO7WiCDDFFufysvoNQw2jJ+OrTkaRkvMAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RRVX5vJ+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mS0c027154
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 10:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V3s0PLvJMpjYoDhySt4+zfWb5bPPDz2zI2u2zAPEgq4=; b=RRVX5vJ+V1YCOuMP
	oyruepRzotOCuhyBhgCQBRToHZmo5W699iTDOyS1lnQXX7Xe4I4hLmlDOUaqZsz+
	zXcK7y7XPN5YsQbIUbNJaoHVbWtUQ9eXoIyWHhO2n+tRihXPZeD7W+FAltXifDFo
	qDfk3RFxI3/1vehoqkz85Led4if+Scd+p155xFQO6hPrR8Klcy64p3M1V5gum97F
	S3Z6j/otaIRlR8zMwI7cR8hOlbggLmlrOCIN/XHKIx7G3JipgUH1dlGZrDL2aSRi
	QY7o3+uF8iFC1o0QqBauHXMvrlRFZaK+KrtGRy9QkDodea6vx+R49wA9Nl60yXHG
	Z8Edsw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmbav7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 10:14:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b0adca3d85so10787341cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 03:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755080089; x=1755684889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3s0PLvJMpjYoDhySt4+zfWb5bPPDz2zI2u2zAPEgq4=;
        b=av/wfOAmeo4sGmgW2b6afaDrGHnyOvnE+1gtxuqFPiHRSzOqE6rp1I23Du+QxuCi6W
         jyZ2Q0fF8Du3EdPFTcgOJtbFRyhTx3htwyKiGZvtRGzMcjKd7kf2OmpZ6C8ND4ufxd31
         q3uBFmEF3dBn/G/WgeTIgTHLUlOrtE+RRU0cMnMLElUDfL+S4ZTFqBQQXLSJ8emy39WQ
         pHZaU8xnGU6RQl95b2kroTxQ0u/f0cstzu00ww+U4D7f5+ath0pLghg44zzKIu99XidE
         m/5BN5sykm0SXsu8X6q28+/NqzK+cgT8cF8BWzV7yJx89Rzlgc1Vm12suSFENTv0gHaJ
         lQ0A==
X-Gm-Message-State: AOJu0YxgnOTgYqWGG2iJ5ckJuntglryKdvzVlWPT7EKSoFwlXU15TGO+
	DLgNhx/3jgwLRGLIAoHbntGHE/HQeiQa20+7nE1/lqbgu3QptPRUAQn7yUcmrjE7bGBW5GFnihl
	8X4Mm0/NtyGVV2wGIww3eZUHTAgpnPXBq7qlN+kypH39cPT5llPylijdRSjGNJmFohM/0
X-Gm-Gg: ASbGnctQIBcfiZYpqbyJ3qomIMEBKZpx8LC3gV/KPzeoCP+VornjhOnRVWqkkuAuQtD
	OX28G9nncAUwYfoIAWgf3SPdsho+I1jNO3y+CqdmD3h/zHIvQ0w7NbjPyq0okgeclxpRsi0xjqd
	Z1NPZrQR2+JYu1a40bfRTEilqLJvNcyCP+5lCS5odGcc5DzQ+LBn5q21uuPJM30NnwY/xdg1JaH
	MAW6XEF+LgjAXuPzCb8JSqTdbOpoxjYVcR1jTOfTwuVZanv8OS+AeVAzt4SX6rjcx7rYoTi1TgJ
	Obxp3dRSiCvIe3CoVUcozhT7NshsiIAfc2r99KwCx53U9S/zM97Cz3v3Bf8wg3BK+WnrS2vu6Ch
	yNgpoxzv7FHAj0vYyQA==
X-Received: by 2002:ac8:5981:0:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b0fc6ee4d9mr12739321cf.6.1755080088862;
        Wed, 13 Aug 2025 03:14:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSQ3fe3ZlGQb36R1gfEPkHT1EiLBXa9LUWcbhpTmHxS0wWwUshYGIF3TJUMp3lqGbEvv9K/A==
X-Received: by 2002:ac8:5981:0:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b0fc6ee4d9mr12739011cf.6.1755080088085;
        Wed, 13 Aug 2025 03:14:48 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8ffbdb4sm21449584a12.52.2025.08.13.03.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:14:47 -0700 (PDT)
Message-ID: <04b1a85f-ded8-4e0e-9e6b-c415ce2bd67f@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 12:14:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: Add glymur pinctrl driver
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rajendra.nayak@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
 <20250813065533.3959018-3-pankaj.patil@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250813065533.3959018-3-pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfXzfyMgR6thIJ0
 PtmDMwO2/1B7mqpOmVCZM53SVwzAFAGDprS1qrNo4rFk/fJzQxhfgEkLcH4ZmWWeJrYs5KGxRa2
 p5tV2TNk+flMQrkEw2tKvgY3+IkId2cuY5y5oFXDFFP1La1cAatOv+pAhJ86zjZoXgPyo/PyKpx
 JwxLaRAcQ4LTH93k5FIGELooI/0wPz7JeeHG9LQ7MZbqbDXkPtw74eaEY/MdlzxiTV9uBCYr+T0
 1B3XbfjgRlxNqprlIOmVNrvBZuHblSMUtOcaFXVh9KdfCfCoiH1OJccXed9vmeyeyo9TJOGEUJm
 78T1d3xIHp3i+0nmAuFLHAtr/nK2006w1sf00GY4qSvcW3s9P3vmRDZ2q4jDeMAyNJ+OMqcIp0e
 /SAxqNTD
X-Proofpoint-GUID: zSshx6VV-fHLRp58_0JqHZOeOjZjLnnt
X-Proofpoint-ORIG-GUID: zSshx6VV-fHLRp58_0JqHZOeOjZjLnnt
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689c6599 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=dckrMdBEC3L-f0dnXJIA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

On 8/13/25 8:55 AM, Pankaj Patil wrote:
> Add TLMM pinctrl driver to support pin configuration with pinctrl
> framework for Glymur SoC.
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

