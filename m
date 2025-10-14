Return-Path: <linux-arm-msm+bounces-77113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2091DBD82CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A38C54F9E14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313B230FC09;
	Tue, 14 Oct 2025 08:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZ9wiWkT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AFD1EEA5F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430459; cv=none; b=cpMdTABuXyFRBPTwqpxL1zbM52zl7qZI0E9TeXCzK8F4BWMA/LXI3PSOEjvGf8s8c69A/JOtBd9miV2w/CUxqThac67XffRCVXyCuadRk2/27/sXpsWo+GlpMeziAUhPvUNQSWTDPWA1a2uqdqE1IHi/SyXJKDUSWEkJn5uq08s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430459; c=relaxed/simple;
	bh=63drt+Y0L2AmHZ2njRNv8YyUNEFDYX/MIBoZ/DyBZgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pba9GBMh/yjxmBtop1o5ULwvpirTf+bdgRY6Q/9JbEghgawk8XEuC4GUwcrof88OBfxuvxCFh3trTK5B+jSuDTAazKuu5vZaHK5yQQvOpWxWfqwbgBARdnTMsmDBaBjUgKCzaG3mSLQZHLc9uEXt9o40LemX1mAKyU3nuLlC7e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZ9wiWkT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Ush006284
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6wXrw/9FqovJoYHuRJUtoPyXQUuX2rF0lSfGJ0TL07E=; b=TZ9wiWkTxOeoXR7A
	7JCYYQtiFX8iQfvJW7tZ8KxpW2XVRqwi52e8ta+465Q+AZl4r5Y12d6oANGtkBsJ
	4a7EjjmCEhqFdH0fnsRoIZJNUMdUCsG88QGrLg71H2doLAocgwPt6Wr0Rv/zLHJY
	5wgUGzTdwXJZIrCVXA0jjn4He4hQW52TetqtybidipRttBdRWwZZnYDhwk8i+d0K
	wTywdcVmQw6eBS6fkpn79AA/VuHPk1L27R9yWdrI9HcsxMe9PxtSajOby6I36gqo
	9fifBVX2GvGOYJWhAROb2fk+lcNbG9vVA0KRdAqwDJbDV9Bg/UfUu9Mqtw5hPLru
	v3HEUw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbhyqfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:27:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-339ee7532b9so25226908a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 01:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430454; x=1761035254;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wXrw/9FqovJoYHuRJUtoPyXQUuX2rF0lSfGJ0TL07E=;
        b=G2EhwZnlxkO3noCH8XoBX1U3Ye/NMQXIJmMICCHBOC+EA0106kQhseC5sPC1AF5cLF
         Z3JUvB4Ok0YvJkRLWkvMqMq1YFExllBxcB6srd+vVRCr3YTvyWdRKABmUxZzxGbdM8x7
         QGZ3/uPDQep0/IS3+Qk4wZ/2fJv8rdLUxtl1+YpwTFhwbBkz4KEoHBn+sIsgx31Zk2Lt
         4Q59RkFeU1wUWOGeK9qsv799eo8uVM60IyLD55mf1NfT6YZD97oCbYH41LF4jq/DcZTZ
         49WowOEGYiAnzDXi051h1u5+si+LnclyLbXAZXhWMmZoMGGF3OZWwyyAMyO5YJNWKNoi
         aaaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmReNm5qHhv1okRTlQsdAdDM+AWycxh/CQ2KFYxNGGKzQLO9kBV8kXp+MdiRgH3uDxJvQ7BneJvNHuKuxe@vger.kernel.org
X-Gm-Message-State: AOJu0YzfWj6zzqhgVbjlNgtjno3ZZTHqO83zKIVHPScS1zW+5VoSSSf2
	TaBPoEoXrSL+x0kUrhL6E7+rx3wyG+Yey6WIuySKuhLADeyDIVRt5Q0Rid3teNTvO1NAfrrorjB
	03tN5gPkal0en+BnbLFqkqgU/WPgjAYHjFj9GGSjsMhuSjHfLChaCnjmjfc15+qeKju4z
X-Gm-Gg: ASbGncti7Qn5Q6e7Cdvs7LGz3hvUdK75YqKOhzF94h/GtYAfvNj85k/EzKCHw6MyQ2K
	RME7r4vkzT/OrTJWZBqMOAF8DvJeWTYtmZc3UK2xiE8o0b4GjGSuf9ryhQLjg1DGBhnKq8/ZRaz
	tk2/kQTahy1UlBYUNM4sf21HX3aTwx9TR8bSP1SGrJ1Ao/BUGnFJS87qRZReOQ0P5GCM5rWVNIS
	Fmg1YFgbtgfLsJwNkEI6+Qs7JbdIzYvuoYT3yMKajnWNtAd1o0ecsevzJ7ER7SOGyfX7PLbpvyd
	h8YmTYlBZd0cQERagAB4t3f7y5nbLtD7sZCoEvfVIO6pbzznzHp+Xj9lMH7o3gMCqxBBlpXu
X-Received: by 2002:a17:90b:3881:b0:32b:94a2:b0d5 with SMTP id 98e67ed59e1d1-33b513a322emr32936934a91.37.1760430454075;
        Tue, 14 Oct 2025 01:27:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2qatucYyq+zixxTIuFLs9PC4U6NqhiAm3Cbok6ZrGfZvraa8sbxAwHtKleWsNsu2tad8Kyg==
X-Received: by 2002:a17:90b:3881:b0:32b:94a2:b0d5 with SMTP id 98e67ed59e1d1-33b513a322emr32936907a91.37.1760430453634;
        Tue, 14 Oct 2025 01:27:33 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df916d0sm11863256a12.44.2025.10.14.01.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:27:33 -0700 (PDT)
Message-ID: <a4208d2a-e9ff-9b34-6477-54123ccce89d@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:57:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/8] media: iris: turn platform data into constants
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-2-f3bceb77a250@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-2-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXyKbOJZDLusHv
 9giF+8jwFsiynLNzlNwcrCiCuRFZESrwluRv8tHChPtcEv1e7qsWGZngb8rqEs+A/6U5cGe0q0B
 JkqkxPAZ0J8Er/QFeW6V91kZmbeqgsLCZwr5Lq+j/L+Q4FKTHp0YiiGIrN7SaDc3l6atR0IiUPW
 7GMaSuESUZAbuTWafu1J2U9tq47adSIW30uuPkdX5iK7w04QR6/7piQ/CrRpX4+lw2ssdufdRF+
 bLgK4Bq2uS0oLVW8vHpeTrYNQgrauUChsIw2leSb2QEQIy2Keg9uHD1oaesJ4lE6OllitUnkVEP
 4iApAHxGEGeH1CDdGiEEiSydbN6Gss2rf79Aec7XDQGiRtWk5ss6mB2GWFqxnUqk4oeGdxx/tsz
 ++Mv/Rx4Ox6SjIxSznF3oiIWqXO2Uw==
X-Proofpoint-ORIG-GUID: wm5TMzP7L6zgpdApaYRsOw3zSL_tx_oN
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ee0977 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5Kv_vQZlazJxXpBqwIAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wm5TMzP7L6zgpdApaYRsOw3zSL_tx_oN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018


On 10/13/2025 7:38 AM, Dmitry Baryshkov wrote:
> Make all struct iris_platform_data instances constant, they are not
> modified at runtime.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 10 +++++-----
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  8 ++++----
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

