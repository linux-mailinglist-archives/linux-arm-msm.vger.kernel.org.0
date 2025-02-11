Return-Path: <linux-arm-msm+bounces-47506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B46DA3019C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 03:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DBCC7A2706
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 02:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2D91C3C1C;
	Tue, 11 Feb 2025 02:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfDz4OQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21C21B6CE9
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 02:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739241661; cv=none; b=d7Pnq/37u2b86jMBJMlaMbCC92X5xSP8FEYwlVS6Lb/hi62FITDgqP6B4POIMWRP5EQb123D9z3K56IMmC3rh7GKnsEwx9tzlET4loriRw3PxjGvdJOTY5Z8npgcM2a/2fGHNhOKYgoFlOfy9UR/t2MXPP928YbkNqyTBw8lyOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739241661; c=relaxed/simple;
	bh=iP2ZFd9mmNM0UOkLQXqsOjEl6+6YiCtrboCdTCrEnOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+mn1sCppNGiuJwrmq8uCHGJnrEVZjNuugpL6zT0KjHB24lVC2eOXDVXyDsT30VWtYVWRgoQLq4dgKD/nfpm86ZOafxSQiJT/oeX8kXFgK+qBetAwrh6auBbt4pKicgeoCUttjzZ0H09e0tw3/jQGt3AqDS96buAo/C/52eZHl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfDz4OQU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ANSgwL031872
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 02:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5WY8N5ks8GYUyNu1nsdKVcNatvt1ZRhBofnP73+/Cc=; b=bfDz4OQURTIWt6vQ
	wuUL9s1UUob+eLYOJ9ktApZV/AK4m3q6MPe5KKDL8OUhn7ShzF3YpuaF9vBvBTHa
	qacOs0HFSpqJB0EXkJ66XQQhXsgEubPApLF+jEUyr36LsqM7s/WAICDUIK7evo1D
	8CeJU9ABjGvFPOkWbWZ8MJUN5PFu3rdalVRHqb4XBnEm/8NTaCUMWNdk86tuyUUP
	r3fXPvavzKcXmkTN1/FMC0JWQXItKgqYrfqWfCvJRyZcyHT9IDrpo2lyW1TkKbV8
	O0+QRZHA9g7S7cPJ3NSYb/7LkiHxbCgvUW6usKflmqzaGuHs0olhOyFoJ7DCrzRM
	gQR0vA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk23b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 02:40:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e44e248dacso7437346d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739241657; x=1739846457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5WY8N5ks8GYUyNu1nsdKVcNatvt1ZRhBofnP73+/Cc=;
        b=jyIaztGG/SwLUEgcFUGwgijUcrOGBe6vuL1TrJaAFonM0XxLYHjMMy2xQinTuvLFVr
         whdg7M6kgTR78FVttrniocP/VaQCfw4UKKUFBw2Rn7fDQpaZx217sRYV706uJeSigVdM
         /QulaKZ9uU/o+cjeKpb9/OHU9IhzmBFSlWpaUc28LI01pv3XNKErEl88TGcRSiWI1wrE
         I55wGRQ15HkLAHtCDbWAyAXmfC1tr0qd2DwJ6lN4GHWRN2arl61xsNEYm3yR3Udc2iIw
         DBt6ipBlo/ReQ3CbpUDy9nFuxhg+2ANLl47qslenpuzsVkLjLAu9OOTb5F6rAa5kiBzB
         g5oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB45ioVnzlHATkGuiZmIB5c9e8vTKnU8Q5sQjQw41PU3TRulS0moV7Yi1B/WHsQBDMkBNDn6igpjwTUXcZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwdoROeONV4oq6M1/T1wV18Eu0DAnlMlK54fboPGqUu59kjKNVv
	2aJcE99wbCRahNTsdoeuBxIJ7gQWUIVMssoPmK0R8j/G9FvP77bA7u7jEPkQYHuZ+/DfOntEFAa
	aCF3WXQ0+nhMCIE9FKnNkPYNNM2PYqLnsdB8TvvE1UMt49cGB38tIszin2dvgb5Xd
X-Gm-Gg: ASbGncvqac1Qpv9OnsRJmZnjV85hlJC08BlgSKlwDmMGo0QP8QEin7wc+W0R0XLZBtQ
	WczKWsRGLUvIiZWAiAxILYv3glB4N7TntzLb/xtFVc+fL4DRsu/wpXbkbdr8X3YYRINpYB04uLM
	zZYuG7TAhig1/sxRfMn3J8yFKqoqXc++iB6/cbD+9W30Aurp068i/u9Kr/b6stqej/gfOSfBVUE
	r/RdXDPS/uG85tzx6XYbMyTvruDgwMBOqkdWd3UWY+FQnlVPRiDwqa+0UXvfUtieULsNpONvAwW
	Ro2zPxAiyZHRxXZS/6X80Sk+yjLYOQ/U5cNi1pvtzYh/PX9V22NLMwYE37c=
X-Received: by 2002:a05:620a:24ce:b0:7b6:dc5c:de2 with SMTP id af79cd13be357-7c047c582c6mr862203785a.13.1739241657145;
        Mon, 10 Feb 2025 18:40:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXTZRkXlf6H0uaJ0li29IfhwzaEgg+uIjLZ5thLqRq3AgGpVeEiHBLdGiJWI4c0EUhvnEVXg==
X-Received: by 2002:a05:620a:24ce:b0:7b6:dc5c:de2 with SMTP id af79cd13be357-7c047c582c6mr862202685a.13.1739241656794;
        Mon, 10 Feb 2025 18:40:56 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de61830117sm5320653a12.6.2025.02.10.18.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 18:40:55 -0800 (PST)
Message-ID: <03df88a6-91d0-4504-b14a-223e55208162@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 03:40:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Don't leak bits_per_component into random
 DSC_ENC fields
To: Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: I32IAgFlWQara7MOsodHNQgygXiBdScc
X-Proofpoint-ORIG-GUID: I32IAgFlWQara7MOsodHNQgygXiBdScc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110014

On 11.02.2025 12:19 AM, Marijn Suijten wrote:
> What used to be the input_10_bits boolean - feeding into the lowest
> bit of DSC_ENC - on MSM downstream turned into an accidental OR with
> the full bits_per_component number when it was ported to the upstream
> kernel.
> 
> On typical bpc=8 setups we don't notice this because line_buf_depth is
> always an odd value (it contains bpc+1) and will also set the 4th bit
> after left-shifting by 3 (hence this |= bits_per_component is a no-op).
> 
> Now that guards are being removed to allow more bits_per_component
> values besides 8 (possible since commit 49fd30a7153b ("drm/msm/dsi: use
> DRM DSC helpers for DSC setup")), a bpc of 10 will instead clash with
> the 5th bit which is convert_rgb.  This is "fortunately" also always set
> to true by MSM's dsi_populate_dsc_params() already, but once a bpc of 12
> starts being used it'll write into simple_422 which is normally false.
> 
> To solve all these overlaps, simply replicate downstream code and only
> set this lowest bit if bits_per_component is equal to 10.  It is unclear
> why DSC requires this only for bpc=10 but not bpc=12, and also notice
> that this lowest bit wasn't set previously despite having a panel and
> patch on the list using it without any mentioned issues.
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

