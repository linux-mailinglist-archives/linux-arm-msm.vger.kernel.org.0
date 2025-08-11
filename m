Return-Path: <linux-arm-msm+bounces-68316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF05B20590
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B1ED422081
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC68D230D1E;
	Mon, 11 Aug 2025 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDV5h0nd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510DA2550DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908435; cv=none; b=t+HVHyyGVX7xSTUtUhrgFKxo94LAZ1/YcdVXQREkhEoiPZ6ntjKr7sdOtS2Qn0KigwU2nPYW9L3tOf8I5m5Jm1aXP5sDTsAFTHJqSWhh0ATTwY4C9Q0bC0ZNvUWAftvMLNz+oyZTPUsjqCdR8QfZBUmWUrHybJxUyeWHpcsQM00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908435; c=relaxed/simple;
	bh=n6bYWBbuvYgd7Of4AkNGNr2HVdrMAtKaVoR0TN1D2LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUeUr5/iT2cRFgE4+pOeKNL5IIOQO+BLnquhNTpL88hRKiU51UyM9WcLwBL4SxVKepIT6IKnAq7Qq2mYdOg8+QVC/3G5fKeh99TYl4ITCpgKFZ6FALID8ewmh8/VN2vPQ+poJ1QDgiH2Vi/SQad2db31vNZK+ZFcPBQa4rYkwzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDV5h0nd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9js000643
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=lDV5h0ndMZZUeAuz
	0IysO8UnRQboBN6aqIGD9Jg9X3+MijLbMAA+Uab6Nf7FA82Jv8fXiU+QRYyzzXTY
	MpsLtYG7yHFlGthLlH+RamQCEAmEXi/n9212GiRtUqe08WkkXHf31r8mfulJqSIH
	hTmRm5xTc8JmaG8LynS4/k73FpXTWEkJVBI5s6YmNlVFYVMS42nydyWej9nG1eQO
	yS6g3wRIZs+UiPdwvBS2gad/iNpqa8sQ+nORwYYqurup35SULgLo3vfwICoO3EO1
	yFP6OaBQ4C8f2hbrbohrj13gelABMRCrN9BuQ3FT6j7hlaLWtmD7FVZlZNfLttQU
	S1enwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxq6uyqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af23fa7c0cso12398991cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908432; x=1755513232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
        b=BS2VB7rM2TtmoTu5VLLY6DjEweCXvJVMzsZLfdvLH5BX3lXkBkZalKyEwvTSw8qVPc
         ctedPK652/jrmUZ/WB9Tpy6rAbL0KxDNia8Kg9X/4DvCuMg8U6b3z6tAqFaTu1LNCT2k
         VXS8GoL67Ku2gEM9CWcgOhgxkoxnR9xqOM9gfawxKMtHS2V2rYV2GKRMCsMaqQF1V5gn
         OMz5WVNeqda43VAuF0q8pbrXQ31kajgeIrbRo8awK3zStuvIlEmMd7pQagm4eKYfYd+n
         44+HFz4C7w4erIvt2xyx5EJQY4cip609rt8Lz5BgwYRShixhdDZHzaTZnJQU/CePD7CW
         A2Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXBkbs+KHsgY7BMp7mfS4Mzck2SsHhiRm6fica4BsGQotED4kCRp3Wm2FzViQUSn8M/rpZhRqOU919gs+GL@vger.kernel.org
X-Gm-Message-State: AOJu0YwbJ6aZsJxBOtrmDcfkQBSkDz/1JLydMLP+Dq0Yfs/DfCWR5VS1
	D129axdeKNI63dMA0vaEj0ZRotdvNKi4N4Wery4pQiRr5gtMGJKn01XFaln4YgSp0NfS8oGg6l8
	xoLHBN76ajkehbU3dxCTC+2JUs5IlcCLIIMj2cV2kQoDiawDd8bxQ+Kz1ZHJmr6Qv+OVR
X-Gm-Gg: ASbGncum/8hlwUKT/ui+mj2Yv/FK0OFi7lIZPXsmYof4h5JGHKqgQf3dvwnvljIJo6y
	RlyK4JnV2igFSDcNIzBViywg5cY4i1oUOxwbtAhCYosOGrmN80P4N+f16J0RFEpWwn9DJeMMxxc
	jTryNGTGZZMAJ+mHXyYWy+4TAtWi2LHEuFx8VqJ0bCiHV+33KB97KBevALWSuoKcxACTzALyvhc
	ymdjbzMZ7v/iZfQlRE7DWgt3NcBo6FpWSnMT/jWOADEA3GT1WRcHP/5cYHtf5hOakZCMgUQXp3w
	RpbQ03hhaKkwaP5hdeIPyKdbQrzbH/1fDcuCOvfascoo34jRADJWrTxsLNgrSmC0SBcGtNyOQH9
	DRQVEtwT9cJq/GsCC0g==
X-Received: by 2002:ac8:7f83:0:b0:4b0:af21:80b2 with SMTP id d75a77b69052e-4b0c16c4306mr54913871cf.0.1754908432534;
        Mon, 11 Aug 2025 03:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFWzMOx5lf2Y5IZtNHNRwVFoW5v7W5IA4jlN1pRSARbMIRwDiUHjzbS30nEqXIzqvbxbYx1Q==
X-Received: by 2002:ac8:7f83:0:b0:4b0:af21:80b2 with SMTP id d75a77b69052e-4b0c16c4306mr54913671cf.0.1754908431941;
        Mon, 11 Aug 2025 03:33:51 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:33:51 -0700 (PDT)
Message-ID: <2a74d3d1-62ed-4a5f-823c-e1ca376ba104@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/msm/dsi_phy_28nm_8960: convert from
 round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyOCBTYWx0ZWRfX581HberJtBRU
 xG35Lo30zM2Xo66iKV2lVoCaf8nQ6o9fw6QJQjVANzdYDef7N9KuRGY1MJUOWUmbd6urm+R7cjZ
 xYKzwYY7TMYQ/u7rgMgEJEfBQhcqn0qOeBCam1Xg3iRDNWpghSh9K7MQ2S/ZINYPrPGKP+T5bqY
 klODJ1Fu0F0M7NwnJWnmMXrZbwb+Uf8rh/AogmPrW28rgBxmXDJUArgIoUZRrBFh3+gZFanMMR/
 bgBNDMMV3rUnxqZ4aqnjQ92Pf2CwNY+QdFhHKy4y3dXeBzYLMs15uctHAYW8pIw/5RQGO/jw6us
 lXLqjDENZEobVNn5aFMH40Ij4IOLDXTgRPfllEHPn6lOC3iOGWtdl6rqwnACQ1uJc/Wlc9EBKQ2
 khcKyoVj
X-Authority-Analysis: v=2.4 cv=QYhmvtbv c=1 sm=1 tr=0 ts=6899c711 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: vi_Fjwse1z2-R16Tszh0eNl7uNhgOKtw
X-Proofpoint-ORIG-GUID: vi_Fjwse1z2-R16Tszh0eNl7uNhgOKtw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090028

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

