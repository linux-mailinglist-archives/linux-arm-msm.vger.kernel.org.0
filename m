Return-Path: <linux-arm-msm+bounces-82860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3220DC7A225
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BBFB4F143D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8A231196D;
	Fri, 21 Nov 2025 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WdPzE7Wj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8brmyVS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ED4310782
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734459; cv=none; b=I5Hf7/E4JMkps5htS3WmLKDQbr98ZPQ7L7dsSXZdXHwJZpCHc1eSJhnD0XUd+vqrpeeCCUhfipmxCucf2QSE7gAqOB/y6Cf7CHd8ZJrretxNspjOkJBDHPepeKoqrEjYNTPH7ws3Euf5awlboObI1uV5C+uzMnBeMpiTbMjzgEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734459; c=relaxed/simple;
	bh=uK+fB5HD3+ggauDvSj1l1gj+n1YvQAk2cEyQy5A6k/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFQ/qC2N1AG5aiDQUfAKhEmS+nrXpDUAX5oWi7t0sh0jxVh91XU/k2EuzvpIGZ8IVLQljH3CvWt1VJkNrUnGdAMARuGyv2eqM4jJb9oOOjEbTB7w8iiIU4TcNQa6YVP5SjrCAjVsHyreAcOdspjWDEDfKyQZ3BCDa6jXwab8Qxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WdPzE7Wj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8brmyVS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8s3wk3676619
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T/ONy3gNnEDhPhJ+0DWjn/L3
	39vFUiYczHHaPhdjzaU=; b=WdPzE7WjYjz/Z3c75tzOv85avkiMWw3jO85xXP2Y
	oPWRQ5ovjeaER1dZqGddalGQBhhloEhopVDH4mRSdy0l2W5hLOF8F4hyZkXwXD83
	QaeoQ/RtyXO33r/vu1+8+xpg1m8aCfGr9a0P4UzU8lk1gRj8YNUOYhJtzNfN57sX
	P/mM1MpCQSmJi0hi6F5fsxJdI4TyV8U6Mfj02PLh/KwpMlhJJE+Zoa4mWEt8fqni
	GzNEhzXGntVtns6nE2ZYVPhugsfW/ci40Vb7nnwgymHAFzJ6eGgGNdHrgO4scYdQ
	3oF0Kc+OCpLA/yso6bSRhzn3MQszLxj8GpkwTpToxu7THQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmyj91mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:14:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e41884a0so619587185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 06:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763734455; x=1764339255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T/ONy3gNnEDhPhJ+0DWjn/L339vFUiYczHHaPhdjzaU=;
        b=L8brmyVSGc1pi7AhHJmNxTUDGaJeIKqm58wTu4Td8KxkOD8ZbcT4Mp3QCcjoeErlWn
         qIQvC/ddwWKPmOdszp0jSOEUP54hFF1Zvb8cV5u1WgouR13tKi4KCQ2E6rBezIlQZNjX
         7S+nYwdeH7ViQFEKU+CaBOf7wZla2koxd1Tpnok/vaDeczC8vuCmmV9op+zVQ312lKta
         x+lWF9tHChlh4dABpXsdYXGCCOQjiSRgqhXzE5uicIUTC/p9PWdw2OsGTMgG4pymUo3G
         hx53+XDMcSklCfJm43fcz6ab7FNd2bQ7JDd0xmxWvPpM0XvBUzx3lmkatLZ3sp2FW6k3
         EMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763734455; x=1764339255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/ONy3gNnEDhPhJ+0DWjn/L339vFUiYczHHaPhdjzaU=;
        b=E1Xatmo/436bFIKY3ldTHG2WnGb9kmBOQNdD/467LlW6tYGk3BCci6gTOR13IDVKo1
         NWePA96b11G/t1dd8Zs2loIiSrVLXQEuYqcOHHrqh0Sp+GBRereBJyFElfixGJE/B/pW
         peo2EZhvDjHQ3xkXwsVE9h7twtBvzXCL7+xksEZKrSJmKVcnY6FcYge0ENxenluaopNf
         J9U2UodaH8NpFiWDOJrAofBjjBtHI8VhbljJLwtS48m55dEWTfSxonZCaJ5K4DxVjLoL
         56GnoTJwUzYKleRY8IeYbNfclL2Y0KW1w0UXAlzZjh3FG3Lg0+SprV/j2g6gBuxD+7zL
         Fwig==
X-Forwarded-Encrypted: i=1; AJvYcCVtmbtuBj3wBsucJSYflR5ZivArkepPWGDyPiadLOFdveCkHJIYt28JCoCqhKFFxr/Zy9Br1hFqMqYtrvoK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw43Bx/iqhlpq9kFuOOw5KafXuLvPkmHuy6Dqgi1uOw1Xe8nyzG
	ElwEl2lfLSuyhSsVpVMVuCdtVgBnBJ+S3VUMJoUTBXCXFhWa5RlqLou9kfosRSvzsXZbcrrVBWf
	T2b73qLwDs9kfJWE7jxMOPUUtKT0rMuZwLq12K7tisltGBzI4S5er6De6EiUP2fhQaPCT
X-Gm-Gg: ASbGncuPhHmkkOhpw0ztw72GFjykfN4b3bq3VDXdMQ78Pv8uqqrfs4bCQyfVFfUbCMz
	KvWOLcwjQ8LBvUWpP7sdyUwEDchjhr8ZLutrsp83Z31dPwKTPTPufIetWet9KgSVTVCG4j2K/G3
	2sardGghvpJHLSj30GGSBd3o7r7+mWg28DyaJp8e6I0nNrjDT+gBCTT+RjyqYEZGq2pFNG7WBS1
	u8UKrLJO8JylLp/ZBnjxZvMpV3bPlvwtwyR2uzyVh6rN3QrO1Z0l7hD5uhcEMiSkA/8z1ZZOoHS
	aLOksYVOSRBWyq6ncZ85s1/n3BebfxKA9HLh36PHTcUKusm6QNA3RSPn6EL/ZtdnHX5SBPaTAae
	nHkAYbFOph3+IAVsE57dH/F7xsJabJNh12g8aJS3q971kpc8mk+pdYrGH/PeE3l4aPBtjIGaIjl
	1gQPCimWTUOkY4w/ubgMsJZhk=
X-Received: by 2002:a05:620a:7108:b0:8b1:290f:657d with SMTP id af79cd13be357-8b33d49c642mr200111385a.74.1763734455264;
        Fri, 21 Nov 2025 06:14:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ7y4IsLIrqzRgkMo5ms8wceMnMD4lw4SOMAewk8MbSAGLVs7DA6+sxpi/xpZvJ1ye7HraPw==
X-Received: by 2002:a05:620a:7108:b0:8b1:290f:657d with SMTP id af79cd13be357-8b33d49c642mr200106285a.74.1763734454727;
        Fri, 21 Nov 2025 06:14:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75705sm1663483e87.15.2025.11.21.06.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:14:13 -0800 (PST)
Date: Fri, 21 Nov 2025 16:14:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: venus: flip the venus/iris switch
Message-ID: <42hwoxn6rlcm5hyybsxhe7ehhha2kwms5l7o6nw7vrou7ubz72@i75rwqudt2hd>
References: <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
 <aSBnpm1VduuPw9pW@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSBnpm1VduuPw9pW@linaro.org>
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=692073b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=zJ0SteroNxL-5b_g9u8A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwNCBTYWx0ZWRfX6fYUbiih2ZSY
 REgKVyxBY0WWIq8BWChiBLJqOVqP07UPRFKLX5ihO0v5B+Cz7XjG8n2wRgRzyrO5h9Oy1iptP0c
 4TcYM3XuMT00uwCZpWz6xD44/vcz/96RJMtvTLix9IwFfJgCcCT1QXiM+buPf3UEKxO0n6gjXiD
 63Tz3TbpA/5oGhy2msmnJewW9Jy/XJ/B2wgADlcbXS3el9lZ0n03yiDmAstGNFPj5q93V5Mpv1K
 cOkWJ9vJMB9Ef30qSr/mFY4d7/finC1fBLnOhf3BSTNF+86GwuBCFaM4wec74jZxfkLYj8jCBPP
 XEVZWShbc0xwwjXBMD8OVH22auNnZ9Vv79kG+8HJOqm1X9x/a5W7bqTuPgIoh+5sc6RkCf2QWNp
 Nbal5AyUocBn0F+u32vrL/FCsOtXwQ==
X-Proofpoint-GUID: 0YCyxs816fxkdvR6znLttQ2yJIwAxiKt
X-Proofpoint-ORIG-GUID: 0YCyxs816fxkdvR6znLttQ2yJIwAxiKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210104

On Fri, Nov 21, 2025 at 02:22:46PM +0100, Stephan Gerhold wrote:
> On Wed, Nov 19, 2025 at 05:18:18PM +0200, Dmitry Baryshkov wrote:
> > With the Iris and Venus driver having more or less feature parity for
> > "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> > switch. Use Iris by default for SM8250 and SC7280, the platforms which
> > are supported by both drivers, and use Venus only if Iris is not
> > compiled at all. Use IS_ENABLED to strip out the code and data
> > structures which are used by the disabled platforms.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I think this will break the ChromeOS SC7280 platform, because the new
> Iris driver does not (yet) support the non-PAS/TZ startup sequence.
> Given that this is a dead (never released) platform, it probably does
> not make sense blocking the switch from Venus to Iris, but it should be
> made clear in the commit message at least. And perhaps the affected DTs
> should be changed to disable Venus/Iris then.

Indeed, I totally forgot about SC7280 ChromeOS here.

> 
> It would be easy to add support for the non-PAS/TZ startup sequence in
> the Iris driver. The changes exist already [1], they are just stuck on
> the never ending discussion about how to model the additional
> video-firmware IOMMU entry in the DT for newer platforms [2]. Perhaps
> the existing legacy usage in SC7280 would be enough precedent to land
> this patch as-is, although I don't have access to any SC7280-based board
> for testing.

I think that for current platforms, which don't have that ABI defined,
we should use the upcoming iommu-maps, once the rework lands. We should
even be able to define it in the base DTSI, making sure that this entry
is ignored if TZ / PAS is available.

> 
> Thanks,
> Stephan
> 
> [1]: https://git.codelinaro.org/stephan.gerhold/linux/-/commit/14db4bfae9279a0e69a0a9d2ccdd684658916431
> [2]: https://lore.kernel.org/r/20250823155349.22344-2-krzysztof.kozlowski@linaro.org/

-- 
With best wishes
Dmitry

