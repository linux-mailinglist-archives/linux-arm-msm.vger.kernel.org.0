Return-Path: <linux-arm-msm+bounces-61906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D66AE21ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 20:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7C097AFF64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 18:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC662ECD0F;
	Fri, 20 Jun 2025 18:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxP0bv8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3302E9ED9
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 18:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443251; cv=none; b=gc9PiaAiIOgv+onGEshFDhZH+FWMezKzAKw4mk1I93/FaKyyXfC4fH1hi6sFA5MqL2HDhjtcr0U8Ko8XYKGC+m/b8k9BPWDYTn1epycHewxUOk2TMAJKa1RNZw9SW05ei/PKKHHve2KlOVCxHg3sIG6YBAaT4WUKuSa9+yjWJUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443251; c=relaxed/simple;
	bh=wma8aBcQVPtFolGMnjfauIQiWhVZMbB2XEEP2UDVV9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NFfUQejZFwRcJKE1GApxU1LkDFSLQVETyxwO/E69+k5ffEHXljA+SblsXyQn0h7tBV22DsfYQhLtpGvgi8KI4vSzxMBEqi9NdDWK2goXuxJqzf4/dPy+6H3D3gd9qEFnLMPR6R4wzgDsd6GaJhSET8nluTGcjJm1H+KJnkRfdqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VxP0bv8W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KDwgIo019473
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 18:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nO3sfnzlB67rNBuLuCNg6x8OnrGZzYrJhAxTg03f9r0=; b=VxP0bv8WbfY8U4LN
	fz3P3sNSRtv9aHUEX8uI5HVwpCbuTh2nh57emOwXMLWoqc3NtsQbiJVwXLHmyUuu
	Sp0abie7Q5dCp7+uBvKijNrod0gUZHqSlKtRskPQh1MvPAESaydqxXZHnOEZ1K4g
	GDlWzGI011dSdLeOUj52O14zj79MA0QDtRg+HjEk8LGx8c5pcqFG5CGwK0oBGu8y
	KPrUXZCB/79osM0o8OHQ7kxtPNO7BGRk2uVXDFJXF+l2lgJxsWIUb6i1B80deIyN
	StatHysBMFiY7KLKP/KuA5vUyf7UGJaEnoPrD5yn8+eK/syrV9560Gs0r9r5+qXL
	T2BsAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9m4pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 18:14:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5bb68b386so580798985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 11:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443248; x=1751048048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nO3sfnzlB67rNBuLuCNg6x8OnrGZzYrJhAxTg03f9r0=;
        b=vUUJ6zAyIMHuxvCkrXSHL8rdlPU1ub/nhlrOiNkZc6JGjXG51gMg0MEP6Od5VkN9I0
         z2RqJd83czgo/yjlFL2+Oyw/DveYKL47MhS7XNy0ajaaXFFsDCbL+i1pj8XCTJHQ+BTe
         HzVCMbUD84lF4Llm2ICENcEDk5nQWbBmsw8WYK1BVfN5XND5RuRV7drjNNxPPWZCPqRM
         8kEyMPAc6vnOsUJKh3P2/rcVB/7ELjSRZaiIB8bSEKoK+OuZm71dcsVGA3aMj7l5IKNe
         AYsIJW8TOnuaNROviCzZevRP0CoAjvBrCsE27atLTTuKNHoOpWuaKRw0sgOyFWOxjYWb
         L7sA==
X-Forwarded-Encrypted: i=1; AJvYcCVbdkVHZhvvqlXzyRr6i6hF9fGSnu1sEzW6hVn+ptgmv70CC7e+VRWhKi7qR2KdkEV89EO/ZsV+RA1+tWAB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1GBX1jgu7ZcgbqaRHfLJxV+E/UZjxb15e+NQpBipOYFFNBsGV
	pA8nulTAWoFshqfHFUEGdMqm/1rLmQp9bDZZMcfGbWurjiQjc+Si+tci+Q4HRpK31tGrSFMVNhR
	BEytafFEUXKzqMWgW3z43hR7KEXWmn8vyDYIolYaa/iq6MjgYs6UDA3XEypupISBDk89u
X-Gm-Gg: ASbGncs5AP6YJy2PhejH3UJ2XP6oVkNafCXqejJE3QgwRreVxxVexTmm5bU/mvBiWGY
	pTHmQ9azXj8reiyZtJ+/trv9d+HVvj0Nn8FxRlcqk438dC6B/zkUp6PAwcos+tG66dMKfli/pUC
	fJ4Rt/rabuKnW8Uj5jZtobkov34AM3ez6htrcUBkU3Y1Rl1ciXwUkFi32dM1SA/oDdHAEgPhJMK
	EJwM/ICmxx+0iI3xAas9vTdNS1GwZ217gI4ARj+o65mY2mcGRjVqHaAda297QUVCR61YqummVFA
	vEcnXpFxZOCpeVBD8U9ZTyxJQxzGtEQSSv9qyiI2C7y/H9tfBzBD/X7jJHkeIpcd2OYIDXj4t3o
	e7ZBB5nfSa6GSo6Ww0Yo+fAtnayEd804LUWs=
X-Received: by 2002:a05:620a:1b90:b0:7d3:8d16:cfb with SMTP id af79cd13be357-7d3f994652dmr464231185a.39.1750443247772;
        Fri, 20 Jun 2025 11:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE58pSYF6MxuiRzGS1LvzWtsB3m3BexOiTThz68ytr6Mc+HTEwb5RlSh9XRTP66yPct1Sc7bg==
X-Received: by 2002:a05:620a:1b90:b0:7d3:8d16:cfb with SMTP id af79cd13be357-7d3f994652dmr464229185a.39.1750443247411;
        Fri, 20 Jun 2025 11:14:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:14:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Cc: patches@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/msm/dp: add linux/io.h header to fix build errors
Date: Fri, 20 Jun 2025 21:13:55 +0300
Message-Id: <175044313807.2014621.18142017999140082135.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250617185611.2965223-1-rdunlap@infradead.org>
References: <20250617185611.2965223-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RD5SYKNTTF5tF8UlIfFlY0V7Eg5kXyTM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX4v7QJd3UgqiY
 WrwT+KmHssOfO0/ywCYiSjzxVIi/JT9UO8LTpsGyPD0LQUASxGdHfBJhoogB/hFA74CWsBRFpqh
 UEvzXhP1HOvRNJSdpRHtiJvGq85RZj5+wZ9p40fXnZDi+VtYTfQRZAn7K+HDw66ggC3X+UUsyLd
 YVKnKFubXRPRXkQh0gK66qnM8hGTzTxNFrgHmOwd439aV/W+lgjAINoe8WQa2GvLbW1tjcjPfz6
 tz+tSuZxLtoeQAZvBMHnlV1dEusaFhXHL5GE67m+bPXAZPO3wMZChKWDzkdkShA5E3y04avg10I
 YMVPmKsM2VJEEZbRz9/plklsBh9J7z6QQaPvokSFiTcnjscWEY4U5hdkNNgLg2iylL3b3pwFlMP
 dwpNmYa0ZmC8QzWtogzTZSufyzi0fNLdSyIWrxzkAqZzlUc555b/fu7G34nWiiRSiMCoPegu
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6855a4f0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=QBdSVzX5EUQIqSI3YyQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: RD5SYKNTTF5tF8UlIfFlY0V7Eg5kXyTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=985
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200127


On Tue, 17 Jun 2025 11:56:11 -0700, Randy Dunlap wrote:
> Add <linux/io.h> header to pull in readl/writel and friends.
> This eliminates the following build errors:
> 
> drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_read_link':
> drivers/gpu/drm/msm/dp/dp_panel.c:33:16: error: implicit declaration of function 'readl_relaxed' [-Wimplicit-function-declaration]
>    33 |         return readl_relaxed(panel->link_base + offset);
> drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_write_link':
> drivers/gpu/drm/msm/dp/dp_panel.c:43:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
>    43 |         writel(data, panel->link_base + offset);
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: add linux/io.h header to fix build errors
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ee1c98ae63d1

Best regards,
-- 
With best wishes
Dmitry


