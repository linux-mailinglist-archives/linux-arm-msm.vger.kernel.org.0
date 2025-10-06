Return-Path: <linux-arm-msm+bounces-76084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEF1BBE61C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 16:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 40456348A9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 14:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185012D5C86;
	Mon,  6 Oct 2025 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eh+3WwLh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C07C2853F3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 14:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759761879; cv=none; b=aQTBAU7a3s+Fkcd8dDAfM5xkeIKLIGICd1mAQU+ikc1OVji99PI4Jc7IAPZjlE4v78wrSYQtkh3pRLUaFkSScNVwCWzbBfeWloTiOt49Es7M+wiU0Zz+KchLFO8qOlvBHR9URIc1z8GQZVwoNs6uWwm1ANWrxr0sznY1ANH+cYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759761879; c=relaxed/simple;
	bh=SKl03veh+h4x/nhNErowzWbSc7V4lSAyCOpcHFIf2BQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofQDbkiC5VM30NvZ+nmdcv2M4rIyjVJYZfUW/gBHGCuqfnj9hKZTZK5mXQnTdAOLYdFRmTS3Wzo7xLq2zRxik7qiaMRAV/8NvcUgJHuT+2VcNoZMRuo6keSmd8iMeJPapv89uQ9wQ4J8fxTydkUwO4DBUeCLibCvfhThmdxiK3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eh+3WwLh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NRFgD020954
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 14:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	af46UksIWGum3ORUH4u56jYFag0zhbbImyMfhQfQfn0=; b=eh+3WwLhY2CHftTc
	aG2usgRhgy2Qc4ycS6zqMTZH1UII+aUxtnWcrR76qbOhuEXufH1+DXG7Rc0dX2XQ
	DetGR5mRT1BxgOsPrh5yDWwS0fJDb+lBIq6+swaSqVvcRBFIEKJiD+ehuvL2Qw4g
	iem0bCPJFYrWe2zTXVRb2FqoFH/9Lv1R1iE+N5WAd75beCxxnMRHuKyhstlunj+T
	fJTmIkZqt+mVe0aLMpI/EvmUO+7xSKkQsP6Zly38tlLqF1df04/3w3KcPtFrTEs0
	JO2KgGYx2Axlzrxuqqj8RxqYh4ItC3RwORPg9v2wxd0w8X81RKS8WXwGeDLC9Fcg
	4EuZCg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn4c2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 14:44:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-826b30ed087so13722276d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 07:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759761875; x=1760366675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=af46UksIWGum3ORUH4u56jYFag0zhbbImyMfhQfQfn0=;
        b=SolNxoSOuooWReKfNem6RRfkJLGIWE6gXZM8kJ1mgXalBzSP6GSnAMATY9/m5ce1Oc
         3DVdG7KCZ/igTxVKGYZNvfzukyWj4CwntEgNXjUqih6/RBdZRRclW1F07/uv5hQib12H
         ppkVc5KdlwS4zbm68kdz4SUuq7pMTD96/KuGjEfuQR9VmhuoXHDkOsm7TTQVmpz5OT+6
         g8ZX2x+kD0w3qy3rrG0JeOJQ/iQW8ErmDh3a4vbOsQCf8VbdQ8RlTLzNIiEL9VtwItep
         NPDMYwt2aIv2TmKJGZtSqM8JQrnhkoLe/3EgbDK6vONZ1Sb6Rb+1e/9NF396xjVKHQS4
         dy7g==
X-Forwarded-Encrypted: i=1; AJvYcCUCE01qIYkGvfPUhFsRdnnjXX07j35mf8pZerJ2iDtLVMB1B20bDFRyeiw6WlsOaqyaHgBb+/i77xQduc+c@vger.kernel.org
X-Gm-Message-State: AOJu0YxHfV42L1tByHi9Gyp6namzAjCjUXas4Nu9RZpx/M1xppFsI7vH
	wm7VwrVtuAnf/4l0DT6jBmw5dcrChrLxqpVGcyjlxuCiNx5T1Qg4o2nXrM5dyVDfRqOjukxUknA
	/hDQ/+jVaSS0phZWu//pRU9pYvO8pOeOq2bz/YOHHhNgru37EfLca9OZ3HB2z5RjDaU3ouf1L2G
	H3
X-Gm-Gg: ASbGncuGGfju4Hg6QEPHSqewteDPAUMx/dNu2I1ktW19HnBNlu1tb72ep8JPTMrooNs
	rSzaH9s6QFHeVVK1IHMAqg8JSL0FMNqszMTezeALnfWsigwNakOYKbnbZ6D0xbLFtXgqmnfiYEx
	4p2rQ2bjJ/nu7pnKNTrqHJRG0HqD5p6GF6albutx44Pcgl5apGbQQMJAzuqkiWsiTUm855g555p
	y1O2ocQyrtEmdmN/zR/xk6dxGwfjVWrKYyKQDGiLALY9i6LrRnoSpd2zO3iyue5sh56VbagPHmP
	0+ZAAl8jpLnVpB6UGKlGSCp6do7MvN1O4HiRbKAeCt1mjXB1U7JDSuZ0BoMsCBmpt63Ttc1YdtT
	447T8pmwxxvO7m23Ecdl6XaRiXxM=
X-Received: by 2002:ac8:7f41:0:b0:4d7:6c8a:4792 with SMTP id d75a77b69052e-4e57695639emr106250681cf.0.1759761874541;
        Mon, 06 Oct 2025 07:44:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+aHHsdEeKXmX68xZhFRxeaNnJWO4fGCZPoBoUF9e7Uq2Xf/6cWij6SLqxtr+sHppcoZftXQ==
X-Received: by 2002:ac8:7f41:0:b0:4d7:6c8a:4792 with SMTP id d75a77b69052e-4e57695639emr106250271cf.0.1759761873728;
        Mon, 06 Oct 2025 07:44:33 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7e8d8sm1169370166b.41.2025.10.06.07.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 07:44:32 -0700 (PDT)
Message-ID: <e6754738-76c9-4080-bbed-17f02e6535bf@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 16:44:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-combo: Move pipe_clk on/off to common
To: Val Packett <val@packett.cool>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250927093915.45124-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250927093915.45124-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX4JVRQN9YHvJX
 4pFVFVTa+YlcKD6GGDtc10AXmkN/nIWFMeDT3qWX5nqR0Yy0ALOon0m8o+c6BavaMPwPyezirbj
 ooryOO7RiR/CuyrKSJJyMB/vtvGHfRZzJcM0Hd9scTq25myeFvom9j4lqwZGfWUIFALw3hrm9E8
 NmROkhxnHp7DajjDcLtFwsr+1hdobDRhhwVsNHOz5jU6AtXNcAVfpmUatAaJ5q2WIXPz/J+RF7F
 KruLHZYG7QXbd0yTjUt6CnEqsJRpvxQElfaz/Bs6/9h4YQg9+3PaKchfQKZQ7qLGcAJfE9YfjVn
 DhqPrw/zjc/sfkiHS04RTmABBa6/Gpq08aRZZMCe98z2F+h+w1oCa3guZFrzL8eNzgVjvczDT1A
 71ZmbGs8NtYgp3yjXa1wuCKcx5SZMA==
X-Proofpoint-GUID: CGKbFwbRxENlWgBiPsKFKfWniEcXtZh9
X-Proofpoint-ORIG-GUID: CGKbFwbRxENlWgBiPsKFKfWniEcXtZh9
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e3d5d4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=N_By_h1aGXBmJSDtN4kA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On 9/27/25 11:17 AM, Val Packett wrote:
> Keep the USB pipe clock working when the phy is in DP-only mode, because
> the dwc controller still needs it for USB 2.0 over the same Type-C port.
> 
> Tested with the BenQ RD280UA monitor which has a downstream-facing port
> for data passthrough that's manually switchable between USB 2 and 3,
> corresponding to 4-lane and 2-lane DP respectively.
> 
> Note: the suspend/resume callbacks were already gating the enable/disable
> of this clock only on init_count and not usb_init_count!
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> o/
> 
> Just got my hands on a perfect test device for DP alt mode: a monitor with an
> on-demand toggle between 2 and 4 lanes. (Started digging because I thought
> I needed 4 lanes to use its full resolution and refresh rate, even though
> it turned out to be the dpu adjusted mode clock check rejecting the modes,
> patches for which are already posted.)
> 
> In [1] Konrad mentioned that "the hardware disagrees" with keeping the USB
> PLL always on. I'm not sure what exactly was meant by disagreement there,
> and I didn't find any specific code that touches that PLL in the driver,
> so I decided to just try it anyway.

So what I did was playing around with the RESET_OVRD settings, which
dictate what parts of the PHY (and their associated PLLs) are kept online..
but I totally forgot that there is a branch/gate clock in GCC that sits
inbetween!

> Before the changes, 4-lane mode would actually kill the USB 2.0 functionality
> on the port, no recovery until reboot.
> 
> With this patch, I can switch the monitor between 4-lane and 2-lane modes
> (with an unplug-replug cycle..) and the USB 2.0 devices attached through
> the monitor keep working! (I verified the number of lanes used via dp_debug).
> 
> I'm sure it might not be that simple but from my limited and uninformed
> understanding without any internal knowledge, the "sneaky workaround"
> might actually be the intended way to do things?

Normally the clock which you're enabling is sourced from the QMPPHY.
The other option (bar some debug outputs) is for it to be driven by
the 19.2 MHz always-on crystal (instead of $lots_of_mhz from the PHY).

For USB hosts without a USB3 phy connected to them, there's an option
to mux the controller's PIPE clock to be sourced from the UTMI clock
input. In those cases, the UTMI (and therefore PIPE) clock runs at..
well, 19.2 MHz!

(you can actually do that on USB3-phy-connected hosts too, at the cost
of.. USB3, probably)

So I'm not sure how much of that is well thought-out design and how
much is luck, but this ends up working for us anyway, with seemingly
no downsides.

At least that's my understanding of the situation.

> 
> Thanks,
> ~val
> 
> P.S. if I'm actually wrong and this is not acceptable for $reasons, the suspend
> and resume callbacks would need to be changed to match the logic of having the
> clk on depending on usb_init_count, not just the overall init_count.

The suspend logic is broken and unused anyway, but that's a nice catch,
the PIPE clock in question is even conveniently called "usb3_pipe" in DT

> 
> [1]: https://lore.kernel.org/all/f21b7d52-4c3f-4e5b-bee7-f8b2945b5b02@oss.qualcomm.com/
> 
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 7b5af30f1d02..c4bbd738eba1 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3035,6 +3035,13 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>  	if (ret)
>  		goto err_assert_reset;
>  
> +	/* In DP-only mode, the pipe clk is still required for USB2 */
> +	ret = clk_prepare_enable(qmp->pipe_clk);
> +	if (ret) {
> +		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
> +		return ret;
> +	}
> +
>  	qphy_setbits(com, QPHY_V3_DP_COM_POWER_DOWN_CTRL, SW_PWRDN);
>  
>  	/* override hardware control for reset of qmp phy */
> @@ -3103,6 +3110,7 @@ static int qmp_combo_com_exit(struct qmp_combo *qmp, bool force)
>  	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>  
>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> +	clk_disable_unprepare(qmp->pipe_clk);

Let's disable this one first, to preserve existing behavior (and it
makes sense logically - if the PHY doesn't have its clocks, it can't
really generate one either)

Great job finding this!

Konrad

