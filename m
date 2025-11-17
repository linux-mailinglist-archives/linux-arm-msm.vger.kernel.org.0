Return-Path: <linux-arm-msm+bounces-82076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B7FC63DF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 309973AD566
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0638B32ABC0;
	Mon, 17 Nov 2025 11:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqRCcdvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MqRX1Sj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB38328B50
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379314; cv=none; b=SYUcsE7SiD8tzOHaSghrtr/p7EeLLWdmWeo8dKyIhJWorje56ABwzS+mfXdhmWsHdU3U8cv86StTn7jreJla6HRHqyMB1ZnC2+uHGwwwlax9VnPb7EbjvBOLP+YlKwBoek+PXAba2XbUoqgQUOkCB0/lX0CuUrr7ah+ycKjN7sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379314; c=relaxed/simple;
	bh=XiiXX5FeEDE5nakZCSo6A+5YjULmb5TojDhJdzCPNeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMe7irTwid0Hud0WkCGDRVFCYusfsBm/fCQyRYWubxT75jxn/06Zb4z5YhfB9Fi+2MhQa4FoImFxHwIjpWNJrQcKht4SEZhDoc8UNm3BaR6MAfYJzIT2dH0S/pravhd/XKekc1oqSgqFIvYFrG//bG6y3/cjeHu90IpjyZqfe/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqRCcdvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MqRX1Sj2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAkMs82790796
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYJCymEK3tDkZYN6f+n2GT+9AceYQkLOfVr5aReiAPg=; b=YqRCcdvM3L2p+A+G
	N4c4G8QsCQenygogz1nV2qRkXFapbeN8xUMRjcRycUZ0cDOkJm1kIJ98rMCtqrFb
	06MjUr4p2rtvitjCKy0/FFpmKtaQUsrh1lNXp728Hez2hbjPlzz+9gDjipqmjpxG
	UXzm1e2OYGx5oZyArqrgITAWHD5iMKbeKHHifc+//qM6WYV1dG+oN8R1BCCG7gLh
	HyhLu6D+EVGi0HGWKrX7KxTiUAAmw/OpJYjveLzrIZbYjlQm81BUa/J3WWDgjlp/
	4Rn9LeJMScr2UEDWbAtTgIorpS+MOE/xJTHcai+0Kh+04g9McFxWEvamuSVSAkwZ
	xkR1GQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bhdm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:35:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso3036361cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763379310; x=1763984110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYJCymEK3tDkZYN6f+n2GT+9AceYQkLOfVr5aReiAPg=;
        b=MqRX1Sj2josyQxEUiOlKTd5mhXzJ078V8r6U8x3+ThJ03vIWlGV4rgfjYbOcIMCC8+
         d6v32eRyZTtovBgckFlZUccfksNkZnShsl5I/f3DTK2i74n7RPQ83TctgmiTcbthF7Tp
         CHYWBGRzT1nbKSPxb7bPjCCc7xoM+2efjPcmlOwcbB1FqRnnsuqkituuEqzJO9RjnQN9
         sJEJ6/4poyoSmkOOINRyIgfE758me6EK/BAyiQZgeY92NtcDAhVsV76bnIqCBlbCZgtT
         VxBp0Fkqy5f/blkAyMWKqMOh83yKxYGaO9v1il4zyKrPNjmAQimKsMkaD+oFLyxDFR7O
         kX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379310; x=1763984110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYJCymEK3tDkZYN6f+n2GT+9AceYQkLOfVr5aReiAPg=;
        b=wZdV9qnBcS/Qi3QLxNKqwpf1juWbG5D5K/NEDFZpng12vtp5UW7sFr/n4gHkMcB1v/
         nT5kM2dd/8cEwMSiBGA8GMOCNhpXp2VdCp7+MnOWTaLIy/FPC09vPRonNRZnqFd5r3yS
         DCPdIh0kPyAcqE13nrDN2Fc/uQjVdm9Lxj1tY4XIQwS047YAdwdecoY2WCRjK59wlaFv
         YzBIb+D/gYLW/D02Uwsxs0y5WJI+T3ElrGessxAW3UWTI4cQk+TM/L6U0Qb/JI304zqZ
         QtOSXowfRfwa31ChS5ehyM2HUIwGkmmU+oSc/+9HaoQoPeCN4uAtED4BSEtLL2Wg43R2
         dwvQ==
X-Gm-Message-State: AOJu0YzPlBAwWX6u2yodaqn3EAm/XZL38JzgNYpoYmj3iOMH+0yjJQAe
	zgeZTsAb0CFK8m3j9FK029bmb0HvLw4Vva4Qh5fL2GpVHz3tbmfYx+lauB/WYd4OJnvcYYGrRtB
	5rjLaSyYVxc97MH/AJHRK5Q1q5Z6D0YlOJKQNlWav5pxm35Oas8zwNciI8edLQ3dRA1+W
X-Gm-Gg: ASbGncufof6XPA92xgO6N6otXjnv820TSVR5F1ICu86qyI0bcLALf2Q7kW+bUNHCVEF
	l8loNlTvHojRutaMt21BoAeB60cBo2mc1kHMsIz4hfjTbbm23tJNjbnAYAzbHtbGSq/LjfYRrHQ
	4mBlkg6Qte/0+7CHu7HljAVSL0RsRjS4+fc5g6ewaMSmIftAU+nzaQ8MGMnZJGwy4uqBssq4CI+
	veAIqPLamikP6a/IZsT9J1lU2FYJhUbsZ5pFu6+u/OVuGzT/XQL63ylucpPx5OxlecL3UGiUbEq
	vwq0shpvKJWwnjezdrlSqnt/SMsTvfCqpFcjkUB2vA7sG/QaQTkue6nNXPLVlKePmyibekq+Uf/
	KFQcLOSkBO88ZHQyLZll2YeHHHIrC6s/suxpoX2fi/gmejXkd/n3byywE
X-Received: by 2002:a05:622a:508:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4ee2339a1b0mr20693621cf.2.1763379310080;
        Mon, 17 Nov 2025 03:35:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLbys0gf7Ny48urtFFuqeh15/OKHj2QFtzoDqaLK/f6ahKgqzkX+zUhURRJRTKV2KFOHCILw==
X-Received: by 2002:a05:622a:508:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4ee2339a1b0mr20693391cf.2.1763379309695;
        Mon, 17 Nov 2025 03:35:09 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdac68dsm1059980466b.62.2025.11.17.03.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:35:08 -0800 (PST)
Message-ID: <d9af64c8-f0b0-4e2d-b182-824078f5d185@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:35:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] soc: qcom: aoss: Use __cleanup() for device_node
 pointers
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-1-5f107071d171@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-1-5f107071d171@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Xz5EI_vn2pNDYlTs8lpYBhixUvrcp6qb
X-Proofpoint-ORIG-GUID: Xz5EI_vn2pNDYlTs8lpYBhixUvrcp6qb
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691b086f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RPb0pFsHJaJ-IBpqZ24A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5NyBTYWx0ZWRfX5c7xzKFx5EIT
 70s+wt/KJ+pJ+NI/LMSkuytW9rBKB2U9OVB9OfehiJmWFmU2575r178jQe/Eb0z88Tx3Rwv7uOD
 xXb2AwGUedFeU+qjVaIRtCjzoqMcjcJZm47b0E4PdFRHwdSQc1HKjeBBQd1KDqZ7j2UrZ9yVsrt
 3S0iQVOhxhub4JH3WIgiFVmcAXEOTZ9Sdjn/z4Q2eObxbIKQcGwz5gXSMjsEnbS3rYqXKrVy5Bg
 DpxC1Wl+Cgtm703JEmyj1TtHzgvJpu3/FlgB4/7gTx0J5rqJRZhGAPnnLoDiiI9LTF6QwKY4hPm
 V4rGy5rq6xfGcPUZjbmXwJTP8K76WL1TV2XzY1KTt1DVMoJ/AeYUhlhumNqYH0JbPB8kmPuVSs+
 LP5M5XmfaLW4/RZERqwjGcyqohRZqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170097

On 11/17/25 5:51 AM, Kathiravan Thirumoorthy wrote:
> Make use of the __cleanup() attribute for device_node pointers to simplify
> resource management and remove explicit of_node_put() calls.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

