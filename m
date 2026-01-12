Return-Path: <linux-arm-msm+bounces-88541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58658D1228D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 524463028D42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D007735505E;
	Mon, 12 Jan 2026 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5ZYtTpZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQZLeUHm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F2E347BDB
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215979; cv=none; b=CHUd9/pJ1HjAzHhJoftnQMlT1xqQmiREPNjk0QYUKLLHRzKP373BGS0qwXlmKEwaM6m59ZQh7otO5dGHRnqz0aaxupE5TBf5pEuZE2sXaNOFXZZGdat5HIiAj3BNS2TIX62W7sJKCQ++7k1iWrfltGyZNoMmEMy8g1OkCvX/UsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215979; c=relaxed/simple;
	bh=jPrW8dy9yhomlwRk0yMvp69HdNqXkBKMtdrI4ho1R4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwK80NES7YdOx3XNNulIOrZ3RspKDwv4Ftt2eVGzhm9/KOP88x4VOjEVwp8stFGRYrZleH9PkOcDEnqLUae49FTj5s+wU4HB5K5RmNsnsKMLmYc7mHMysu6bh3+ivrB8pC6Q+9xIOBwoMyfemTEBiqlNsd/bTEV2mz66Hdx91Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5ZYtTpZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQZLeUHm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEXJG1315841
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8afs7XBatBRPfjZn/K8JHD8vDykz785GYcRAb1f0hO8=; b=T5ZYtTpZSe2TzbqX
	6JHS/5mADeL3Am90SylVsj90XQWwXfZbUbNv++j7poNfVC8QaJnqJpzODV8Rhcub
	7fqY4BTsGRpi+33pBSLWW/1JjiFc/8+kPP0yCui4u2tXdofpvUTlVMuVN1QNCisQ
	+8Y7AaGbpxLRkX9PiT1aXYo21ia+uZVvvIYYs47aCkV/MQVq76fJrwE/29KSllfj
	sIvpOECx4kGx6d8IEWtnMJTkhyZQdzQQ4hJ2b0ehBqI6YmSbhx2L23LvWKJJs3I7
	tZB6YSTpsIwF2ir1kOQACDew1mqI3d5mHns+QJSAP8BUp39JC9B1reQ1LJRSX1Tp
	Kg8NlQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg4dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:06:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee05927183so11588531cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768215977; x=1768820777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8afs7XBatBRPfjZn/K8JHD8vDykz785GYcRAb1f0hO8=;
        b=aQZLeUHmEnWYLwuR9AcXCpSCGGdG9ykrwwsgNifI9now0yx42Keba/I3ECl9cqJtW+
         R6aL8LW/zCzRhy01ByZaL1YwRolwksZvI3H+oV9Rkis2NTM9cTJclgeHYD+qsguIMTK7
         d9tv+bo2jbIzkTRt/+a1KaxsaBHrizrtDHbSEJblrp4b0h8SIwyRYDQzFwqfxxLpFLHc
         Yf5XGbnLckfuziWE8al5fZ+iFX6igwTdaAaYrjTgIChtGtBTyzycnQGsL5yzFQEOvxb4
         ujs1m5F8Pvx0EhjgY8hbqfUv6E9YLJ6vLQqZv3r64P8J5mg4zRDYXnhHYt9ULVVqFtYO
         NKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215977; x=1768820777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8afs7XBatBRPfjZn/K8JHD8vDykz785GYcRAb1f0hO8=;
        b=k1C8ZwgPAS9/vQBRrEhAcWHfrtX/cDDS5gPQSZcQ6JEZweLgAtEH7t4/yDrQxx++3J
         1otYJIMaVCygc8DIVg3VzSzROI8Bqs4kWz25QczweN/kkUN0ibIGPgoUO6Vsgj+k+34v
         yzct8S7kHQW5MFymsywLR4KTh1z6hEmYYqXACY23r2xYZMxqGvRnJ5ZOEvo2Ik9IgmTj
         qSBawKebGXtJRRbocGZ3RFoVgLB84ojoJEJZChl23Kygvac8GGyjg06BGCW9s7n8LELc
         BLGJtficAfT1hwHr3nmkUEr4uL8GMlQpZHS738Oq+nipXZPGVf1cSymbxLkV/GMRR0tJ
         Dc3A==
X-Gm-Message-State: AOJu0YwB273Y6LMh+8JOxjae70quPo5JTHqBKszqskvVWXu0HWgysR1O
	26iMKmYSnfc+oFHt/WmvphESQpnyi364b8qlrcOWEqa2uxgnhKlDDkIZzgkmVaLocpcEyz32Jxj
	s1DEzdK67rOdseIareBfUBgQy9ty0WgXuJw4uTwSFLKhmURoN+MN8F2lx3FwxV41cQWac
X-Gm-Gg: AY/fxX5qAcFP32yvzJDeN4ILjPxkVBGibywW+sC3+N8PemFgvuhywfVtGnm2LIbyVAt
	SpT14i7p7nhgSkTHJauV4CQ51Sl9X+OY92GK7KmabLKezDCD8ZzMvVzisFz4KAqH7J2fZjD5Poz
	G0dqlNmoK400m/TYMMZNTXwEIhtxJLZ8QaxrIvfwghZH5K4L8I63h+qGLDHEba4nCvsXsqCGea9
	9750jhDHAHeFnZGuImdARhrZt9TryIOy2nWlKioeF7QQbG7G9PVrWWx0fcrCilA2vhjtZWfzjWj
	Jt71yM89ATyzm14S/yhv3GPuopsK98JqOahea9fAd3MlvpktTXwajAPcPmX5eyZB7wpRnfZufj2
	ehQyH6miMhoNs9GklPVMYDAaQDLVrXuy1uHHut2J3dQ24J/BJZsjmkhzExj2OKS8bCu0=
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4ffb49f6842mr188340991cf.7.1768215977117;
        Mon, 12 Jan 2026 03:06:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoROZPkrFaKwWGha6CXTBLtHxCU47doHYO2L9KQ5RvLt9XOFT6EtYsvfRFTpRB9pmoi7emoA==
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4ffb49f6842mr188340531cf.7.1768215976475;
        Mon, 12 Jan 2026 03:06:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8713416418sm381115666b.49.2026.01.12.03.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:06:15 -0800 (PST)
Message-ID: <9c9ef8f4-8305-4151-b079-f24c8cf8d51b@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:06:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] media: iris: drop remnants of UBWC configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-9-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-9-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Gop_-DHu1nsLQ0TtICqHfWjVt-2rZAgh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfXx6gC4A0gkk/a
 YqqIdeTdssiqjD55j17WG3SuG758fs3eQ+yiphuAuZtP+46DoeNSF6AXGVBMJ7O4bVbTmXhyh/c
 TGMPRWJz+5yuuLqgf2PIR4FmYmXdJ0zfOYXb/8l3EBnmBo59gqet649GfOhYtSazsSKoSWmhVE8
 JyOE443K4djHBZZzl2VRw4urX8KxpPISQIaW4M9FyzVfrN7SI2liJERv0IhLVZTAQzt2crW2V2w
 zqTKVFo2/w3eUqie5P0CB+aAHcNOwtBv0q0A+OdHHxMQfOcE0KHFtdjfANpKOAIov+Yk6PdHEy6
 gUJsr3Fe1wIAxuVPRa3eXzbExWrkkdiFqnuabx1bKDKR8fK4uLsxLMI3aANUDgBcmRigtE2iB/a
 jB3Ory6SOayOkqMDyeBleBd55t1CdvEgLW6cV/JSSK3Ug7fjysi2grVptJLL3O57KRGi2XzPDF1
 OZCtjRtHqNziOXbAQmg==
X-Proofpoint-ORIG-GUID: Gop_-DHu1nsLQ0TtICqHfWjVt-2rZAgh
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964d5aa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FQNS5iDjU0T2HGSwfYQA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120088

On 1/10/26 8:38 PM, Dmitry Baryshkov wrote:
> Now as all UBWC configuration bits were migrated to be used or derived
> from the global UBWC platform-specific data, drop the unused struct and
> field definitions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


