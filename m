Return-Path: <linux-arm-msm+bounces-59512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44132AC4CA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8433717D58C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 11:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217C9258CDC;
	Tue, 27 May 2025 11:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fB9yk8K7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC62E192D87
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748343646; cv=none; b=LLWuKcNt3m4Tp0dJeB06EyVXZyYQL0AQVMQ0S5gwufCxBfht0+rmiyoD3Xv2F1aHziido3D1Vny+OCTW2X5BFJp5xJiZsPpBGkjxoFWMQaJFHCF9kdeFNs4QmfXGJFo2oYhdMrD1XMSa71oCABW8X3T+6gZSS4ww9xx6q2xcFp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748343646; c=relaxed/simple;
	bh=U6pKDs2mOQBNxfLvwMT/KbWRi6T7oO/1foUXXEwPqko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSUdG++Lk6J7DQdsuSXK0O0vWw/0JRB/n1xbEeaBYGz8wNp+uByEfmyA6+ZhI7GM5541BD/RCsb61GcrFhKWDQEl4kC7x9Eck5HTyCyYVaws+pO7yPYhyfZqvOm3pG1nMAtSegxpGl3IO6qwCUcU1NXbXW5JsW9N62FGr381Iy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fB9yk8K7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R7ilW4028172
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgVk85DAmmpZs++PLF2UBmQ+DGiZz0Emih1vTSs5OXU=; b=fB9yk8K7uV8T/fq6
	DO1Ni/h8nKW7CNmKL96zZ1bf0epG22PvNYkhTmno5rDgk2+OzHSmXigIIm3o6foz
	To1Zppqw6y+7fKH3A7LscpMUJupwr8dawfyi5Bme2vi+Kpd710uu6Q+xnccmYqOi
	4JeaueW7dj/+EOHecWjN+hTYCctbSWZSwPDu1rkYZM/EjDp3tKY7Wzq/YVi+sN0U
	C09I7hiprznbgkEu8dGez2ivfULrCi6jNbVXtpMJnPy5pi4se76oAOTQg0Q4o2BC
	gt2NzvjoRe2w9fdG+fFoBsSEiz9Xgr6XEf3fC1hQsaZX6gVzenwRUZu0BunRdCNJ
	2Z1uzQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992ghr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:00:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4768b27fef3so2691581cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 04:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748343641; x=1748948441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgVk85DAmmpZs++PLF2UBmQ+DGiZz0Emih1vTSs5OXU=;
        b=s0bcMvMshgGuV4Fm573H3140/IDvqbEqmNaKJG59OEumI44i8yWA0PMovWo92sbey9
         LDLAXrRIcLWma3SJQOICiWlPMydHwPDvQwZ6DucnTmLv3vJHEfM51h4B4P947ait7r08
         NfJbIuPrpRaxsVPuELji4GetUkY0KPYNrG3MM/eZvPGhbB4BmaRlBYgVkyf/ZCzDGxfv
         O/o5W8Yb6QVmBz83RX6igiudz0m6E4uJyGPlXts2GtwKQ8zcdNX8fFGg2ENReHfUSRev
         tnke5G2STXWG7xQR7Jh6YO7x8LTM2Nat6uospQmX8ExBHeSKiIIy0PojRrxUP5FjxoAu
         Ahjw==
X-Forwarded-Encrypted: i=1; AJvYcCUP0QuN2Bzx08oy9H37fwuKB/2MkNmD7495TeRyG1Jm53MfHqVSuL8+TX+6T1cj1LouiIdyylSRimFKoBOf@vger.kernel.org
X-Gm-Message-State: AOJu0YwMboN7URzrMDKyBcZCYEyNxN1BERjD70nGtNZmSANUVHxjdp5o
	pJ9LnOUKXVY4iHnOseAu/+o5WZKDJ3JTLKanZP81k0EpeZcCnYy8AjVeMn39C2l+OsuPe0lt4Sl
	DCKJbWEB+n+aenorj8J5EIM6+ci2yJE5mcRczq/kTzCUi89DhpV1uWsaLFkaqYBT90P+k
X-Gm-Gg: ASbGnct5s6U9Xvt7DLQzZrEFAxMM9IjH9l5TfG7aR0dOkBrsQCVgjUyVy+yQ0FxPnBh
	lNog6NtM6mmHCUIVxXzDjoTnoVhX7t0nxzDMIIn961xeitW8hfh2UyMmtGGSpD03VUGiDUWLXF3
	jRzeMXPFnYWUwsbxLgklnM+kNYc87bBhkSzKD5Yo3GqXp5GXEsrlbiaQXEPo17JJppv2ib6Bjd7
	X41bWpTuTA+oVulGvgY2NhkDg/871Lm4zpDM50KIm6ye5XuCkmXClHn+S/s5K0CriU74e7TPCXc
	xJrxS6SmXSGCqZsRZcb0vncqQ2923nOrJdi2suryXxf0A51SDva0ZFdrUkmCD6+Jlg==
X-Received: by 2002:ac8:7fd4:0:b0:471:f437:2973 with SMTP id d75a77b69052e-49f484b59a0mr63741591cf.14.1748343641567;
        Tue, 27 May 2025 04:00:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+5TD+MYI12ASNGgNhrVbg3teRggfUA7Nt0ihpblmSv3AXfO5j1mU3F1jH13ruzx816Fmvxw==
X-Received: by 2002:ac8:7fd4:0:b0:471:f437:2973 with SMTP id d75a77b69052e-49f484b59a0mr63741331cf.14.1748343641067;
        Tue, 27 May 2025 04:00:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad88d055609sm100472066b.28.2025.05.27.04.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:00:40 -0700 (PDT)
Message-ID: <337068fa-adc2-478e-8f3f-ec93af0bb1c6@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: gcc-ipq5018: fix GE PHY reset
To: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-2-ddab8854e253@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525-ipq5018-ge-phy-v1-2-ddab8854e253@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MCBTYWx0ZWRfX05l5D0QkEtQ/
 p0pcabmJqC2+6GszslX3PG3qu7daBWNEgbJwAByxuoYeptsyap99/V9XS0GiMUTpu034M/tKc3v
 C/jKiwZx+BaNjUk5/ik7Nt5K3AxMpy3CZnIjHzIfuqKWt+PVs+Rmoh/+Y7Xk0P5i1X8NhcraVPT
 vbzHpTqgLWq27xM+apk8vuPz5OuXGRyHFICsZLkGnMDy8cTgvpgF20/EeyaG4FkphRDgr5op7Is
 VCrdSv+wVqhEbeyMOaN120etasnXB9jEe0tJ7fdcgOZviWGr/rgI4uPmlRXwflFupoOgyWbA3tk
 pc4aga/2YE9qCQ7yvJZLY8BMNgkrfr+38KDlo/m8eGWYQtBMsSiWRequdJu3AIIhImIoLHFS4RF
 iae9tGRNejfzUMrE19lTuqQvGTAPfInDQaLwke0ZIcrOJ5V7HDRdetsSXh+5u6gX/o9KwGRo
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=68359b5a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=UqCG9HQmAAAA:8
 a=rZqdB0JiAKPJAkIg25gA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 6TmBsvtqzxuwF0G35O_1K3eTYhLwxr9D
X-Proofpoint-ORIG-GUID: 6TmBsvtqzxuwF0G35O_1K3eTYhLwxr9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270090

On 5/25/25 7:56 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The MISC reset is supposed to trigger a resets across the MDC, DSP, and
> RX & TX clocks of the IPQ5018 internal GE PHY. So let's set the bitmask
> of the reset definition accordingly in the GCC as per the downstream
> driver.
> 
> Link: https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/00743c3e82fa87cba4460e7a2ba32f473a9ce932
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
> index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..02d6f08f389f24eccc961b9a4271288c6b635bbc 100644
> --- a/drivers/clk/qcom/gcc-ipq5018.c
> +++ b/drivers/clk/qcom/gcc-ipq5018.c
> @@ -3660,7 +3660,7 @@ static const struct qcom_reset_map gcc_ipq5018_resets[] = {
>  	[GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
>  	[GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
>  	[GCC_WCSSAON_RESET] = { 0x59010, 0},
> -	[GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
> +	[GCC_GEPHY_MISC_ARES] = { 0x56004, .bitmask = 0xf },

The computer tells me there aren't any bits beyond this mask..

Does this actually fix anything?

Konrad

