Return-Path: <linux-arm-msm+bounces-72493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76046B48673
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 487D61899C00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAAD27FB18;
	Mon,  8 Sep 2025 08:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N65Pseld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE2372602
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319473; cv=none; b=sNHWIL09K1IzOQnDvcCs0VGg3C0I+EAUeJhWQi2/jGKo1bOrqNwkE9CZqrQVW+oxHGOZUFuzaXHJTJbOrwP4MwJriXdWRPj5hv8YHIh3WljIZhosgFKICNEXs3OFS2QX5dS5VLpEGuESAOxz85kdGtXz3ase5OeLikKWeeSo0n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319473; c=relaxed/simple;
	bh=GG1pGjSVrpeLM9P3VVwtZPEsZ4X5zLkYIjoPR1vfRRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsRUy+jMoDIoMyY27rc3r58CfxNMR66MUsFBdvHIUALJo7hwKGAVduoDtOKjVf47rxqItvcymvJV3eLlvbdZsCCqWY8XAgFG/dGU3VOEVc8LDcH7JgS1AnEFEP4FPnM+bKw1Ive9/1ZHw5RdBPrkOlksRirpKdnKLOEoof0NL80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N65Pseld; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588001v8009463
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbaA8xj0zL+BI+9codvpqTtyP5KRkSsVEUoJD+vfW2k=; b=N65PseldRNfr3n7u
	m8uOcnVjh+hrbSp3KhPf9tsW9dd2YoBJHU7M0SxlDA9MXMiqTBVjKH7zneaGzllY
	2VpHgbf3XjmwLopSCzyofmzC546DVFFCA1ngYg6GbC47AfQIx6HYc2XM1w/mjKd3
	6ZbyfJs6x2tyzMgWXIoCZI6O87/Rxzas4dE2bbJIf8CMhdAPtvf7omVKR70A2W6P
	Pl+CndvPmXrJbpDdygcdSxm2++jjpQZBKcNOvuGu7FEQRJjUUmloUKdqAGSPhRHc
	roxEkJyEVfkPMH2CxhIXFYtN/Tbtk60iGASLt4GWZ3vevvH4KaQhaU3X3n+ko+gp
	u2NZUQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1vbte4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:17:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b612061144so1960711cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319469; x=1757924269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbaA8xj0zL+BI+9codvpqTtyP5KRkSsVEUoJD+vfW2k=;
        b=MzUBFePZN847t99v6QztDsJxsxPZrSSyF3IaPLkpirxl8bwvRxEar1kfKm327Hytdp
         n8yHo6zpP+ia4AzkteQIQIBWrtXUe1t+2xxm3y4nr2nYhbz7dtiNpLPqHpwW2BzxV22k
         YFvarZ7umgI+rJ8JUzHcdNewp/HVFG2qlxiIGZyDxFWagjxwv42Vw7jebAxQc5awCigG
         IZBQ5wNzSC9YjjovXj1MuXNoOc3GAXJ6+jle7XAWvh0NYpBdOjRm41S60TWz3G4w6YSG
         5xo2Z4EYV5o5UDyvvDwUu9ozRHwBeYZa36zf4BXDa8Xl+qm6ylGNgl5FS1nV1Q6tTNSy
         Qbdw==
X-Gm-Message-State: AOJu0YzT9OeJ2aMlLBa0ahilVgFvuSsiCEcb8+ioh26bcPZqhynZs0Zn
	br3/8S/QPHckFrqzOdiUDMdcBVBtixa/xnz10lYfe7zu/MBuAc1XuIE9n+cOXMbY8+Rxm1rjujb
	rM3T3i5FG1wAFxub2c2K2/rWbg7q5Iyp9NnKQ04CriGtYwcQre4c5p8EWBwPEk+J+gn/w
X-Gm-Gg: ASbGncuUmLqd3EInYIupoAWsFWoWIwT2tx2sLDOLkG7uujaPfc1kKpPUFyooKn0wRl7
	I+5uDZq2DNc5fiBR8pwpD6o8+pJw+437qHzZAv3P0EpNePvk9dTXHbajQ7RPS/C0qik5rhxJhDE
	vAoonHdZPtjahxkRAohOrgHBWF4MKn6ng6bwcbAJX6FstYLRiLfVghOpbO1InENe53pGI//oXae
	hGu5r025uur6OLYpsUKd3iFq+F+iM3cVpDLWKZukrw/k7x2genN3eHRl/I/mAWSn8usXPs82a5o
	FZCY0kNU8venmU/nseP7fUim7joRKlp24/3lGVV77reQi0KXKgOcM25sDLkwP8AZ5IjzhmLC4Je
	ngqyhCgLS0BA39SUwkYkj6g==
X-Received: by 2002:a05:622a:1355:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4b5f85310efmr52561441cf.9.1757319469248;
        Mon, 08 Sep 2025 01:17:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBEfgpDrRtNN4TDghi2eIkkpFAnt1x/Ei5zwPYuhmrTl8KM/5H3CwRozot+PjpnqGD4xAMjg==
X-Received: by 2002:a05:622a:1355:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4b5f85310efmr52561331cf.9.1757319468646;
        Mon, 08 Sep 2025 01:17:48 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04709b3effsm1224560466b.5.2025.09.08.01.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 01:17:48 -0700 (PDT)
Message-ID: <7aeebe52-6408-4247-9ec8-9822c8a96ee2@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 10:17:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] phy: qcom: qmp-usb-legacy: switch to common helpers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250907-qcom-dp-phy-v1-0-46634a6a980b@oss.qualcomm.com>
 <20250907-qcom-dp-phy-v1-1-46634a6a980b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250907-qcom-dp-phy-v1-1-46634a6a980b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lkj71jSMAa0v1jHTGwlU1l6dmBvLueYS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfXx8UTcwz/I1TQ
 xgRtwLEMnAf/A3CqYi45+fg3BE4zSptHtSi+78cgvXfeXzVbsWewDitTOFinybjjXHx7mtQV9Fo
 n4r4cDd8IZWqoIn9Z3vWREw76RExl9ez8/UQVOfAMXVom1TerpG55gzqp4SJseYaDyloJdWHEpe
 BaoVwqt6W+i+6CyzDmkzJBnk/EaGCFXNLuY776MIks0bdF9zO26ECrysfLF3lLAWOzmzpiyTOfx
 jenpKOoHIqJsggKthPcCT4UHh9hYpXQFZzWSZT4bthS3UTXy8RLTJ6tf+R4znrJvmvNJVIv2GSO
 5oDrr+noprMtXsOBe7wxyz28WbOmd6WCNZTnCibWKlCc3o/5z7KKndf8nbDyosloVVM9Y/bObR3
 uZtb2E1R
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68be912e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gE7I6xvdJJFTcp_SK6EA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: lkj71jSMAa0v1jHTGwlU1l6dmBvLueYS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027

On 9/7/25 4:52 PM, Dmitry Baryshkov wrote:
> Instead of having a copy of the common definitions and functions inside
> the usb-legacy PHY driver, use the phy-qcom-qmp-common.h header.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

