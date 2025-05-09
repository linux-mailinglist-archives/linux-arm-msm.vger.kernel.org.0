Return-Path: <linux-arm-msm+bounces-57493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A81F2AB1F3E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 23:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E23DA21C88
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 21:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1D325F78E;
	Fri,  9 May 2025 21:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTgmdQUT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D63D42AB0
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746827260; cv=none; b=FnScEn97IF7ccczD5vRV+QxhciQLgDThocRyHMhwmrvGUEPQ/4tc8ac9VnOfYpDe7P5AXxefxhC1RAfc7oli8lYfIhPO23XP+cLpr7eJhqjDJ0CAzQq2lMNJNo0wlHmEHjIna8ofrR/dQpaApTApbbqmqbqiOYQ1qskHpXTPebo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746827260; c=relaxed/simple;
	bh=LrWZlx3JipRZAEsDNHeSY35/RAjGPR31bHo82ZX/dro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBF4hpY1HvCucAdxj/G2zI8b4z8T6dYbzwuTBRIeNj90gvDlm8xbGT0IukNIqToT/UXQk3oR448z8S9kzA3hJeLoH3WyfvkuePo4NfBg5twrDu6bBkB9/6RTMbWgyINYDJ0XaLAk0sBLJXm7cAsSu0dQdoOp7b324vGAJlcf7kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTgmdQUT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549CW4gk031336
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 21:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qw/zOKbG+s9dSKA7ogOJ8aB0qk0go7aPu19+W/cL31c=; b=RTgmdQUTW1/TVMbL
	8ZUV00SmbEK19CHritlWQxkuwQanDKu/cLuJ6Z3MlC8m+tg+J52fvM5a7Vjom/tD
	d1RlScq43aoJa9PrH2LomMeIOM3uWAmDgdgjXb7DyBS/uh6vlFA3cl8ISuQQFCen
	imctM1QaCfRw29k6iDRmdMEUdeNVp3MNe6jBpnBpOlU+jSyJKSflzUmWFe1G0MT3
	Ac8gJ5P1HwaFh8PCq227VBwf1alkOTsSTqG7jcvvNIlw2qK6BJFhJcZpE5ONvbyP
	RWM2p2ZtYqqf/+3KvFSNjiZIyWwx3NiP6K/GeZlGV0Fk9K+LGN8QnvSb4bRhlPim
	DlidOA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgntk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 21:47:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f54a12cb4eso4570536d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 14:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746827256; x=1747432056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qw/zOKbG+s9dSKA7ogOJ8aB0qk0go7aPu19+W/cL31c=;
        b=O3tfi2asWlfWusoC4oqNxBI8g8wLizK+p37nBu1X8nBgbN7xLZ15fVhnqgj2SGmYBp
         dSS1qpgQanMPNDN9uvluTmbwrEB4ySa4gi1IQ1gt+XByV4F0urtqrUQB78n5TGFqqK7e
         p3iLon3amyW26wdjnqv9i8Hk3FBcPC21S9Gvi1y+onjeQ7p92RCj94KoCZCTgLtZf6Eb
         o6+ehtcS6BLvU7BeVHP9+zq1nkedozUoFC1yr+56cWTJaaZJ/Mo7YvnXmfJpes6NhNoV
         6jMc4H7GWvde9XE4dJrDgQClRjOcxzox7pOj9MbSucVOeFbuinCSYoxiwNSEJWSoN9IU
         NmNg==
X-Gm-Message-State: AOJu0YyNs8SRpBxYs17GJfpMmsMSV+//9dma3LiGMIrht2hukC4ijHKP
	21oeWctTzirgCT24tdHdtZC7Ny7yTeS1pJRzX9PgRuyNLDnVioGQQZoRQwsVVcSqGqMdCMFpLBa
	RYhu5ST35oCsuYTCEf3OdAomu/Y1kPsiSIQrzfsIzQnyOXaGSL7osnQeTyW+K6R4G
X-Gm-Gg: ASbGncsB1a7jCzYMF/amx+8p74t9yoqPOvGuogG9ANAHlXBT0St4GkLxLjJXAndopCL
	ikHRyw7YPSugemPj4yV+fUiWcig5jwXiSkSCWhPSGugy+ea3sazzYl57klnuamc42uUj7+fDEAd
	Z4Op8Y1gSTxJTMhjEgPivdz2fE//Z2iNl9l6wBpcx1OzpR3Meirj41nSb07WKfp8QRX/cYWvPJO
	d4ZxsS2Wb4N+2FSL/Qa0uTnfJSzP1ffigAC+kKKWXFm+UDscPzyqRrCMf7XdD3bXqbuy6D0CDYk
	FLKF+aLrbum7ar2ltniIy8mRxIRo0GlnU3HYEhU11xAP7FdpH61OCmIUtlM0Ivzfdbk=
X-Received: by 2002:ad4:5dcf:0:b0:6f4:329d:d3e5 with SMTP id 6a1803df08f44-6f6e480ff24mr28928276d6.10.1746827256383;
        Fri, 09 May 2025 14:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4kVfm3UKCIez6pugUGxDw+qic6FGMUITyhMEPjM/ZFm11+v3bu99CrX3yIWV90/41JaxfmQ==
X-Received: by 2002:ad4:5dcf:0:b0:6f4:329d:d3e5 with SMTP id 6a1803df08f44-6f6e480ff24mr28927986d6.10.1746827255955;
        Fri, 09 May 2025 14:47:35 -0700 (PDT)
Received: from [192.168.65.158] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe5542sm1910107a12.5.2025.05.09.14.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 14:47:35 -0700 (PDT)
Message-ID: <a3c3dbe8-b73e-40a4-b86f-ff9f371b1a46@oss.qualcomm.com>
Date: Fri, 9 May 2025 23:47:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] clk: qcom: ipq5018: keep XO clock always on
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
 <20250506-ipq5018-cmn-pll-v2-1-c0a9fcced114@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250506-ipq5018-cmn-pll-v2-1-c0a9fcced114@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681e77f9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=6ibG6wpdE3FgK2yJb9QA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDIyMCBTYWx0ZWRfX+b1/NMMHH7Pz
 unp4c0bIGRVDkrxX0AuaaL7+4G9fFIrNAZMXQ2TudLDe81e9Il55zoHzu0G7S+zjB2w/41Yh5JM
 c338sdEmrPiED62NltIRpEKT9wSZElmphxFcehxE6tvJUoCIJfAcIQaZ52qmza+HsuDQC6CwSRQ
 UJ0QQKtiG3S5vOEBZ5Q2C6h+t13PqKv49IZ8aHOtAFZQ4WfZnOjqc1sXvZpi3K6JCXhufDkf7Xt
 QKU9uoR4ynkQZpEhsM3quriqA+bWUanOkcpXSUWyJc2R/zs8LMbxhKqbO2Bb/6CYxwkZKQbNo0a
 QqvJRQk+pnnRrh+H7B8wTbZWHyqw37X8W2UGo+rSYWZevIDXnrr9kYyu6/a7HLOm6ptq8jTm3Yr
 pKFIdV8+u25WpACcAV2mWOFBo7B3TgZvakg6jpd10rrapJxYy4KlZJjuDr2kV108TJPlKHmA
X-Proofpoint-GUID: H1qW_akEh_YtFkMffWhsnADxoEsOsFPl
X-Proofpoint-ORIG-GUID: H1qW_akEh_YtFkMffWhsnADxoEsOsFPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_08,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=780 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090220

On 5/6/25 7:43 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The XO clock must not be disabled to avoid the kernel trying to disable
> the it (when parenting it under the CMN PLL reference clock), else the
> kernel will panic and the below message will appear in the kernel logs.
> So let's enable the XO and its source CLK and keep them always on.
> 
> [    0.916515] ------------[ cut here ]------------
> [    0.918890] gcc_xo_clk_src status stuck at 'on'
> [    0.918944] WARNING: CPU: 0 PID: 8 at drivers/clk/qcom/clk-branch.c:86 clk_branch_wait+0x114/0x124
> [    0.927926] Modules linked in:
> [    0.936945] CPU: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.6.74 #0
> [    0.939982] Hardware name: Linksys MX2000 (DT)
> [    0.946151] Workqueue: pm pm_runtime_work
> [    0.950489] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.954566] pc : clk_branch_wait+0x114/0x124
> [    0.961335] lr : clk_branch_wait+0x114/0x124
> [    0.965849] sp : ffffffc08181bb50
> [    0.970101] x29: ffffffc08181bb50 x28: 0000000000000000 x27: 61c8864680b583eb
> [    0.973317] x26: ffffff801fec2168 x25: ffffff800000abc0 x24: 0000000000000002
> [    0.980437] x23: ffffffc0809f6fd8 x22: 0000000000000000 x21: ffffffc08044193c
> [    0.985276] loop: module loaded
> [    0.987554] x20: 0000000000000000 x19: ffffffc081749278 x18: 000000000000007c
> [    0.987573] x17: 0000000091706274 x16: 000000001985c4f7 x15: ffffffc0816bbdf0
> [    0.987587] x14: 0000000000000174 x13: 000000000000007c x12: 00000000ffffffea
> [    0.987601] x11: 00000000ffffefff x10: ffffffc081713df0 x9 : ffffffc0816bbd98
> [    0.987615] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000057fa8
> [    1.026268] x5 : 0000000000000fff x4 : 0000000000000000 x3 : ffffffc08181b950
> [    1.033385] x2 : ffffffc0816bbd30 x1 : ffffffc0816bbd30 x0 : 0000000000000023
> [    1.040507] Call trace:
> [    1.047618]  clk_branch_wait+0x114/0x124
> [    1.049875]  clk_branch2_disable+0x2c/0x3c
> [    1.054043]  clk_core_disable+0x60/0xac
> [    1.057948]  clk_core_disable+0x68/0xac
> [    1.061681]  clk_disable+0x30/0x4c
> [    1.065499]  pm_clk_suspend+0xd4/0xfc
> [    1.068971]  pm_generic_runtime_suspend+0x2c/0x44
> [    1.072705]  __rpm_callback+0x40/0x1bc
> [    1.077392]  rpm_callback+0x6c/0x78
> [    1.081038]  rpm_suspend+0xf0/0x5c0
> [    1.084423]  pm_runtime_work+0xf0/0xfc
> [    1.087895]  process_one_work+0x17c/0x2f8
> [    1.091716]  worker_thread+0x2e8/0x4d4
> [    1.095795]  kthread+0xdc/0xe0
> [    1.099440]  ret_from_fork+0x10/0x20
> [    1.102480] ---[ end trace 0000000000000000 ]---
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> +	/* Keep some clocks always-on */
> +	qcom_branch_set_clk_en(regmap, 0x30018); /* GCC_XO_CLK_SRC */

this clock is not a clk_branch2 - its control register is different and
this call is incorrect - you can drop it altogether, as if the XO source
clock isn't running, the system is dead

> +	qcom_branch_set_clk_en(regmap, 0x30030); /* GCC_XO_CLK */

This one actually is likely supposed to be always-on too - does removing
these two lines do any harm?

Konrad

