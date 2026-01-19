Return-Path: <linux-arm-msm+bounces-89688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB01D3AB28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 769A73008728
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 14:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB9936E47F;
	Mon, 19 Jan 2026 14:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5QyGKBg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zxw4HJP3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EF235EDC2
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831452; cv=none; b=nS32YciRXqRmEOvJudCTf190aZRdW2QMnC5Co00vz3N0ygUv8oDk0cDPqJmhc8bEvQYBMetGJWt2DP0D5W99DSqcS6SMJ91h8Udt00B7+5PlO2D2c21MqHC69kFzZ10d1ItIqnaWZUydyniyVZ17XlBOlL0F7KvpsT+2xni6f18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831452; c=relaxed/simple;
	bh=cxGNhGwfKlrEd+GD/N+P4uyblcaubtTgID+p8bZfaik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hq7EgUaA3PCINMn1lVHAOvXQDtlzDMJqWf8PyUA0YhSfrTMkVuSeJORBSGtemNh5ogg/u8A4n3alB7qyc2OOV4Nq607NT/HSudIucHwJks7oQ3mQtrC/8gO2R8Y6b8yPOK14588FQFOzvzzwddGMoSixkNgK9mQdVpDyHwCGjXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5QyGKBg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zxw4HJP3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9105j903101
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 14:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Gesf2CcadYT0OjZRyHyxnUhzPAg7xJTBsZqe55V8lM=; b=g5QyGKBgMJtYUrMj
	CKbYS0Yrwl9IxTAzLuhk8aZo+iEpFMNh3JkctNZ6O/J18ho6e5xQyeSXS80mvSEn
	wrJOUbmMdkOvT2NUGaDl8Mwg5NxnDs7wBGFl+JHAVtTc1anhXqjf0SgQHiGLk8ic
	0GV6yP7D5k10IreQiGmaTVhvi0jkdaozPwQq+uWw0OJhrTq8io1YqeWJt66UWGry
	1nF+GF2XZFPyxzSmvswsEE8fDzVO1Xs8Dtd4Ysr5mMIui6a71If9tJZXJns48p+5
	m0iiY3+ZvCIr3sVnxcPNd2CIo0NQsABHBlwBbQd9ks/dlqILGOQCeXcEoHCh6DA+
	v21Rsg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4yt281-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 14:04:09 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-943e69ddea4so864397241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768831449; x=1769436249; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Gesf2CcadYT0OjZRyHyxnUhzPAg7xJTBsZqe55V8lM=;
        b=Zxw4HJP3PxJugzGEA/9chEZRcOKA2MMvy58xMrWW/LFZn6kJt4ucJ6S85+fAhcmai2
         1F+/tZg01b7zb5BTzcoekJQtu/zqnnmyTyfW+f1dkEoRehWSIll6ervPVyLr/Z/BKEBJ
         DFZqANe9/jK+Idu59sN25aXaWytGXAhqmcEey/Fdlqzq34Y4L21eQ7Tm5ZJRjOcN8FZ9
         Y/EFmmU7Ne+7s4X2I3QbpT9IEcLpCZxGIjKq4X25hWwMmfqv/fSmrSMo/7tmfOREYm/y
         fyElOhdkM7+i3fPKLphov45C315ExrQXI94xI/3B4svuOLR3VleLBSlFE6SMhDNiDAB/
         NOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768831449; x=1769436249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Gesf2CcadYT0OjZRyHyxnUhzPAg7xJTBsZqe55V8lM=;
        b=ntv6Ub9St0DU0e7ha/2qpj5ynjVmnYa4+com2ixt79Fl8cKCzdlmNMJKw4fAfLw73i
         vo+qz+w6qmxF70xmXWF2ilil02X5V3lKEvJV3xFiu+BcitarxmWPfyhH4aPzQaUiUx2f
         DIAXDOsEIUtQP7PaJ8aqFlCR5X6rK6OBjQQzmiMDNKpsfT26iZ0hPHE3X8AtmT1SNCf5
         nfujSUlr+Y9sjA27BcA0loaGeWYi4RZHoOI3+cxl88wHxvuAjQPb1VDt1wS7XO9XMCAz
         OoEA/Ng7sdH2r1nmr3nadk16Bhe8gGTi7gieOLcnOP3dZwb3UJoZhOZD1bwXV285OhVv
         66qA==
X-Gm-Message-State: AOJu0Yyuym6nYehs2cqyCTD2UEjYsciPsipXkzbsFHqVva/OjR0EUFlm
	cCuteRXhbrO8RAigC83G78ZFA9KdfjlMd3RuAo6RZanFZB+HK165r6Z/ZYlzD/8vC4jsbkriCMq
	RtMr0sHMjUmoadAvfJXG0hnRHi9nH8cywdxBJbi/I33dveTbrGEKg2LUxlvCdbk1BLb1n
X-Gm-Gg: AY/fxX4I7k4NLEwR6ilR5zc7Y82MyQ9yHir4+X9sakzljHwRuBiRvmzm1EFLHEC5wZO
	3B+huhEGJIjHsqux5qZzbqSePM0EfgEmPJRKkmTqLDPUOWPFUReAeCkGCTTraTtwiUBDr/EZC44
	M/PCcwRl5OZAMlPh/VsjxdQXHw+qOnzlnSnh1utBbynCEf+1PG1Y9+Cksv9mmGTOOySP8+48zHf
	+IissJZ6E0zX9KAKZ8SZKBT71xTOrFgVDRkkmLI0M5clINIuID/2wl6tee7KrYEBoERjN1q4lch
	mURK1gYtANfZrXP99sVqFQUEkRiFJ5lpgT2ek1SXFGBqNGnjL/1kWTiAMS64HdMCuPSF7bl14Ss
	RwgVZGUg2x2PMb9YYJn89icSlyUDiGnZdROwFKzw2TvroUIXGjOZD0oCxyxWwXwc99xU=
X-Received: by 2002:a05:6122:6d1a:b0:559:965e:f563 with SMTP id 71dfb90a1353d-563b5b6992cmr1848450e0c.1.1768831449156;
        Mon, 19 Jan 2026 06:04:09 -0800 (PST)
X-Received: by 2002:a05:6122:6d1a:b0:559:965e:f563 with SMTP id 71dfb90a1353d-563b5b6992cmr1848412e0c.1.1768831448644;
        Mon, 19 Jan 2026 06:04:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e6d3sm1116835166b.4.2026.01.19.06.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 06:04:07 -0800 (PST)
Message-ID: <1f4e300d-b705-4973-bda9-0eb1be6059a3@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:04:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gfx3d: add parent to parent request map
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696e39d9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Cg7UkRfD2dEtGca3me8A:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDExNyBTYWx0ZWRfXzz5/Vay3mcyx
 IP6DQjqv0SoYqCDwTSgJ4ZYzAypF3yTn434h49l4gaKeSE7CIj0t/r+r038C6K2AVRvXYl66dcb
 fNgwsQicZqgrTMSICz2BOUzfQy9Y/an9r6//fRtJlFSg57kL88NMHtr+hIIz35yrvmPDpzkmmQV
 nQTQl9sdIKoXRRi+wUMU5lulrvxwGMKssZIX01WcXeJxsVWg5WfPN5jqJNq7ggTcZNZDTh6ugs5
 WLkVCZrqwZ//rvOeD0Os1BfSQs1oStXFrf1ZQWnPoKHif7zEPjZT1qd/CMiB8QKe5TqakEGk5UQ
 Zz+p1Tu2FD+xi8FtGbdscQ6SbSIGNJpVAVpHAx1gI6pFV0wEQfOfUfjVQgj7bOT7J/SyWk/0Lz0
 7lnkfrhDBw6SOrYcTfemNiZ9n5IK7zhvZuItMBXFcqu8sTBofuIb9MdmdKrc07SLr+urxuv7FW4
 kxYur/JOC7WE9T2oSUQ==
X-Proofpoint-ORIG-GUID: dG1jFJ-Iw1pS8k5Qrq5agVrBjaUdsXJk
X-Proofpoint-GUID: dG1jFJ-Iw1pS8k5Qrq5agVrBjaUdsXJk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190117

On 1/17/26 4:54 AM, Dmitry Baryshkov wrote:
> After commit d228ece36345 ("clk: divider: remove round_rate() in favor
> of determine_rate()") determining GFX3D clock rate crashes, because the
> passed parent map doesn't provide the expected best_parent_hw clock
> (with the roundd_rate path before the offending commit the
> best_parent_hw was ignored).
> 
> Set the field in parent_req in addition to setting it in the req,
> fixing the crash.
> 
>  clk_hw_round_rate (drivers/clk/clk.c:1764) (P)
>  clk_divider_bestdiv (drivers/clk/clk-divider.c:336)
>  divider_determine_rate (drivers/clk/clk-divider.c:358)
>  clk_alpha_pll_postdiv_determine_rate (drivers/clk/qcom/clk-alpha-pll.c:1275)
>  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
>  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
>  __clk_determine_rate (drivers/clk/clk.c:1741)
>  clk_gfx3d_determine_rate (drivers/clk/qcom/clk-rcg2.c:1268)
>  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
>  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
>  clk_core_round_rate_nolock (drivers/clk/clk.c:1710)
>  clk_round_rate (drivers/clk/clk.c:1804)
>  dev_pm_opp_set_rate (drivers/opp/core.c:1440 (discriminator 1))
>  msm_devfreq_target (drivers/gpu/drm/msm/msm_gpu_devfreq.c:51)
>  devfreq_set_target (drivers/devfreq/devfreq.c:360)
>  devfreq_update_target (drivers/devfreq/devfreq.c:426)
>  devfreq_monitor (drivers/devfreq/devfreq.c:458)
>  process_one_work (arch/arm64/include/asm/jump_label.h:36 include/trace/events/workqueue.h:110 kernel/workqueue.c:3284)
>  worker_thread (kernel/workqueue.c:3356 (discriminator 2) kernel/workqueue.c:3443 (discriminator 2))
>  kthread (kernel/kthread.c:467)
>  ret_from_fork (arch/arm64/kernel/entry.S:861)
> 
> Fixes: 55213e1acec9 ("clk: qcom: Add gfx3d ping-pong PLL frequency switching")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I'm still not fully understanding the logic of this code, but I
feel even less comfortable having a board crash on boot and I can
attest to there being a dereference of best_parent_hw..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


>  drivers/clk/qcom/clk-rcg2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 2838d4cb2d58..d0a5847f9111 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1264,6 +1264,7 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>  	if (req->max_rate < parent_req.max_rate)
>  		parent_req.max_rate = req->max_rate;
>  
> +	parent_req.best_parent_hw = req->best_parent_hw;
>  	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
>  	if (ret)
>  		return ret;
> 
> ---
> base-commit: b775e489bec70895b7ef6b66927886bbac79598f
> change-id: 20260117-db820-fix-gfx3d-e61329023c8a
> 
> Best regards,

