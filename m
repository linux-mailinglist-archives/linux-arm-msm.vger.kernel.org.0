Return-Path: <linux-arm-msm+bounces-67235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56979B16E69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 11:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B6573B89C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 09:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6842B2BD03F;
	Thu, 31 Jul 2025 09:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSeyS4kk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FD128FFE3
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953680; cv=none; b=CFqeKyOGxDXwzRbZ/g23+KTualUb8Dhaaah7nfo0lIk9Y4hLrVAsmNXF9hU068XgTdpEnMBv9/7kk8HwtquZLsjJvqt+z9VRXUCPHJ7d2USMhD3wkFn9nAMzZeIuYmlXWXeNy7JRwt+amgumyEgUnj7Y4Jh/UxPd3p6CFMMJAg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953680; c=relaxed/simple;
	bh=qlDKy5v33MNBCPwvxdICUi44jXxFlSdLVNybQ4r9BTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WjIVvdLMUL+JIo7I/KfV3rKz/Mv49Q0MTb/PrFDCkLRU0ryCqEmEAqXpQ+7wAD6SZQBsQBYsyZMiAZ9YjHSrbNftkO+aiLxiR5KlYyjiYKrReGfZivnjgf/AtRjaJ4PAQMUL1wkVtLb2H/2QDLQbbqZ7zigcajdHBkUXtBKvbaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSeyS4kk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fwmb016470
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 09:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tyAiPZN05+p3QMCIsbsm3CJ18gwqmsxE7OQUlpLa+6Y=; b=pSeyS4kk+WgAAnwY
	BnB9TcCKMH7aFAq7f4JT8nTSkiiIP6AVWRZ1X+GXkGtRSHQjNEJD1rjszDN1tHqE
	Ig4CmpPgC1chcXjQd+xX9pUKIspPBfQCQdLbZnboz3J9Po361Iwz9rZRiAX0HO8h
	nUmFiqiHXD+8ft8mI+etNuBqHaDfeeBUK6oxAGXeDTMwN1CClupFeEm90Gu28Adx
	ebfkUGVuUxG15rliIYw/9fHrP3e+HvVj48d3SN3PA6f/HGndAPQ52EVZBLI25tPT
	jiCoZsXrzYGNz9yv31Lm2bj/19xS3LXrZfhZ4A2cW1on2SA+fiLncQ9PTDWgjSoK
	JZrQYA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda729g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 09:21:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab716c33cdso2775421cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 02:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753953677; x=1754558477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tyAiPZN05+p3QMCIsbsm3CJ18gwqmsxE7OQUlpLa+6Y=;
        b=qGxWWy8FoFFX4BaZQF7eib/jPLhaD1AfZidvWTvNOiKclH8MUHEvivTf2D9bj26v5E
         KgHObug6E4sEfRHgoc3JhleX3ErWJSZX7i/qEwnqrVFLoWDMxh8i5FfPUNfkAGXVTpS2
         XAwsezE0hwLmLo2UHYo3VF0XBW/JdPMNC6ehagv6R7dJYuRTVDC9S0vZFZ6sc971xb+n
         p5i3UtW9t4CsfvH37CMZj7uWZ/flC+795Uxu6tMWuECbFQT2x9JLxeN752mLOmHQRs2L
         4z2UwfJ/1oWled1lyNJKWYnV5EUFV2415GJ+a9S9zQFzu3LVq7p+vnwpxQKX2H1YS0p3
         H6OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl6yi9mSLuodAAe8PBIf4TXnTGIlQo0bVFiwJEySlqxTY63AoLuL3xX9YwGAzDSlzZHt28WBs/ldxFXd83@vger.kernel.org
X-Gm-Message-State: AOJu0YxEew1ztsSwTySRo2aklOv8a3oiah2Ly3+0wiXve8WMp7hdVRi0
	IfsApdJhjlCigOpaTTkEPyVhTwAvns81wXmz6BJZy8RSZ2JqPF9QTwkgdtLoLic6+1XEvRy0eq6
	xwv/iAPyie+p+bMnvHXSFvLmXLnFNAjCYdgX/pLHKpkVTZTZSIMMHzLfCDRZWW7Ra/0Jv
X-Gm-Gg: ASbGnculUcQg/At8UOVD/Auh6Ne8000aojMVky875z6eh7n8BnUpqAglsh5QVEmRW0+
	wFuy0L5j8XqqAHTl/+HLVRrJ9T+kN1IjcFiXqLlP9cV4PisZTalOMZPigXXaqc2h80JhhAA8hxL
	pbr+oCaiWqz9atUiLyyuwB1b8vOzDhX6pIxFANWAxr9Y8hEaN1BWbGg/x+KDvYallbf/ND0czDV
	GMiTVHeemqAYzsjgz33RsXQC1KCU0YJg5+n0bmT/amkHgfvdxcG8oY308rox0LQfz74wk/v5gnW
	8Gbw2KiZ0XeAyNHnhSYBnmR1zIuEhXlOYv5anVeivDS5VkgUzGd0lxB34RogUyIHBBDPitrCUBP
	DCzQ+ZNi4w6AVF0ifNQ==
X-Received: by 2002:ac8:7f4d:0:b0:4ab:72c1:cf31 with SMTP id d75a77b69052e-4aedbc5d109mr47967011cf.11.1753953676644;
        Thu, 31 Jul 2025 02:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg7y3Mzh8kLpvXdgFmJK6NcsIZpRA/EOh3rdkLqhLgosRXc0fkF06g5WZgKCLXL9Gc73OGlA==
X-Received: by 2002:ac8:7f4d:0:b0:4ab:72c1:cf31 with SMTP id d75a77b69052e-4aedbc5d109mr47966681cf.11.1753953675720;
        Thu, 31 Jul 2025 02:21:15 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3792sm79613466b.50.2025.07.31.02.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 02:21:15 -0700 (PDT)
Message-ID: <304124f3-3686-4a04-808c-7ee84356966e@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 11:21:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2][next][V2] Fix dereference of pointer minor before
 null check
To: Colin Ian King <colin.i.king@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250731081854.2120404-1-colin.i.king@gmail.com>
 <20250731081854.2120404-2-colin.i.king@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250731081854.2120404-2-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xtQlWrJDLv5ECOSeDkHbyjC9H2B2Rmrf
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688b358d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=uhsglmO2XhRCQ2AnPp4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: xtQlWrJDLv5ECOSeDkHbyjC9H2B2Rmrf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA2MyBTYWx0ZWRfX4GlJet25xhzx
 buBIJjIVvmo4AovPKzIIZa2auM2fKEVdyKPLk3ASDfaLKUzUWcJHnltdN+au77RMMZ0dzTAu+Yc
 nylpIiqgUzihk4/a7uCd8wz0RxxRycVHogflFs5fl1rKQlnD0+XbjlkVXjU9hlXbRIiZyLZHARP
 GZmfxdNcu9DlTfd4yT7cTNNQblN6H8sAH7SkKOfUvbE39sVyuFwoAe25Tf5op1t/EdsXAc7GaIY
 DiyQS4pj9w/aRtv+ZBCVEt3Ru9cs3csalGTIV9OsEmbOY81++rbOcThMpniskcKrO6nH9h59lIF
 ynre47bzBlPHoLBc2iboKiC1B693juG+V9sDeVfJ9NkWWCL2JE4izcUvmOuCE6xxpImkyAzAw02
 AraY8/w6jqIZZMopNDyAphoFi5RYnnkowYjBFybPJEU8eByE3dU51dJaP6e23eBpQECVYKSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310063

On 7/31/25 10:18 AM, Colin Ian King wrote:
> Currently the pointer minor is being dereferenced before it is null
> checked, leading to a potential null pointer dereference issue. Fix this
> by dereferencing the pointer only after it has been null checked.
> 
> Fixes: 4f89cf40d01e ("drm/msm: bail out late_init_minor() if it is not a GPU device")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

