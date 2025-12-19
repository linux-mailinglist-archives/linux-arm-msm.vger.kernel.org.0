Return-Path: <linux-arm-msm+bounces-85891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A75CD006C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD766301A1AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9443133A70E;
	Fri, 19 Dec 2025 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQVhQElm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfngV53f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A8333A6F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766150411; cv=none; b=EYcuO+dztt1KKylWDG/E4EpYVeGy7ZH7jxVRGA9Ie57y2FRdSk5f7fhhXGT3xdMaJCue5DYDmEhApUnmEJlVAsXilFYa18oEJ1eGYb93Qej3KWhF6BNpTUSp2XTzEuB2yq+LYYn5opoi079mXQkiVCrPwGCp0rVVgnYvCMUQhyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766150411; c=relaxed/simple;
	bh=zjKB33RlUbRzcrdndMZQq98gGCeutmGNS81+D2IARVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LIwEUnBsp8AWuO8xihnjXFfdeh2jHy8kd23SwF9CUqny2tWtTu9NLfGp6uIHJimuqbEk/to8ER/9mp6/F16UroHaiViJIOAptFPQAu/RVhe7eBtlbwIo7An0Gcx3FzTbPUasoGvb25695hBYoGq4HdlT5fncy3SKhj/CxE8whes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQVhQElm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QfngV53f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBufrM3701008
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFN6f4NRjPIC2rW4r/wJ27keOEklNt5TD6ozXF77R+U=; b=CQVhQElm5WCRdfQd
	ubupg8YGjPuMXs8ZmDwNl/Djy16LdjDotvMl8dgZPRCy9u1iRPy4TxjAaqlKwZXT
	WqyOlaz7gNtturLGhAZbk6mTZjSQsIo2R1fyCFPU6LK7CtwaS2ofqyH8/kYyUTd3
	oqjBI8JJ/j9S+74UO4GqUbdluV3e/gZIuLDrlWrywkmM3aNOYN2LAe3ibnGuMgL5
	WyXa2DmsF0MLuFUV0Qe0jQJOKBynL9/zFAXOhGshfl5MRJTgpJgObRrVmWJ225SJ
	FaSdLxsZ/PweIFmx+zIHWDWRVuYk4UDQh4pQmxokRtJ2AzF9Asr+xRD6cHNw1kLA
	Snw5Ew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ejphp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:20:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b222111167so19335085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 05:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766150408; x=1766755208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DFN6f4NRjPIC2rW4r/wJ27keOEklNt5TD6ozXF77R+U=;
        b=QfngV53fTjY64A4xYgMN7m+MYrOZDdCi6uEoA+sv43INAUp/T17Tx9ZfsZdmOy3u5c
         L0e5Tb/D0P8dxy34UmDR+QHVouSGAW3FvdFxc+0q2XwTiXQRkes5IilpJhzC/ZxaQ/V7
         pNGQR9WbYQde5uD6N0CFrrx//sxpxq/PCS7AMnrFX6ngy6h1HIhBAZgoNNo3jZmTJKF8
         DD7hjBIlfEIfBFjT7tgh8O5hGtVXypZbRvkJDIbOTSVgT1ytseCQt5gi1jA8cnBp83Ev
         Js/q6HFz3qIcFZNOS5d20H5ZxQQfgPR2e9UGrqjgh1SKkVCIo9pIcm0JUXkssqgCXTIW
         m97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766150408; x=1766755208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFN6f4NRjPIC2rW4r/wJ27keOEklNt5TD6ozXF77R+U=;
        b=vIjH9WNd0veIoGtQ9fy5InASQOCFcp61eSNqtp0ahSpbhEudelyBvoeK/xhMwqOnNh
         0JDrAaz4jC73NeM1+hCwoqFCAySaepZ6qtP4wrONjDE4qu2Mby6TpLu0/4kJx/sbrUVr
         HOxP8TAWTmq4AoAWJVEzMPHps1RHxVNvJnel3ROfPgFYUSKn92fLJLzX2JqM5G8Sy+mG
         VuwDs9uEV/yXIa4Qda3l+sg0QVg7cxQAwnSK2dUyzWjmujvoZ2jKPxSGihXdSZ8gzaXW
         NyGxr1h0YFVMWpeKmeflzpX/vX5MVORJBpchRcKgwcO5KTzP51PfCfrq94Du+t+CBzUV
         kz4A==
X-Gm-Message-State: AOJu0YxIjeUxHzpAyoE73YEM7F0OgxUasWgeajKsFlFJ7P8n5oSK6oYd
	1d3s2XPgYmAk9eLdZXNuDj2Mn2OGn324/wREvA8oilVS5IDy6xjsvKbqbtezcpoIB5p6c6EBEyi
	KYDp99v/k7y2nODv4uOAxcrh3TKgsvevtaj3mbZeT+8Wr+bd8ka9pcV7dH1ZGuBBAiO4Et8eIV5
	to
X-Gm-Gg: AY/fxX6y2flqp+HqomY8aYGsk4fopJOgBEPlf6Uo47s1LRjxpKn+67dWPM4gZhMMgp5
	4V4PbQuUPYjc6EZYwDpvZ3+keqdwlicOBEu+lHMqFTZjuuXPu0fr9uANiK1ZfDNT8OmQI/jCORV
	rmH5KmZdKHueyMVJVZS7e3s3/TmqiK9nn3DAHhVCxao83hMSiPn6EY95a6c5OgTymDELUcnrgQd
	zSRthX5cSX02B/f/WnM5Kh6xjJEe/Dq68EiNOpf7Ht7eZt9X/9cVtFQWNELU+VcElXCuQtBBaFu
	nCV7p476RVzSsDh8AKBypvJW+OwCI2rHHOkOMAp4La53fc0Nxy2i24MCmpLDwkqVNErxxgxcnn0
	7VfW1Cakm2saqjrRnKrEdBiWJ4NvUykJViOio+zmvL8MaesnTcCeltTqaGjKDjiwYXw==
X-Received: by 2002:a05:620a:c51:b0:891:c59a:a9c0 with SMTP id af79cd13be357-8c08fbc886emr318390585a.5.1766150407495;
        Fri, 19 Dec 2025 05:20:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhYQcJ6Gqcir465w5PNP0CiwlyTXjZZMTdo1ApQD3yP8kqvXQJq0aVVY9WpORsBeTx62DeiA==
X-Received: by 2002:a05:620a:c51:b0:891:c59a:a9c0 with SMTP id af79cd13be357-8c08fbc886emr318386485a.5.1766150406902;
        Fri, 19 Dec 2025 05:20:06 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c16sm2164381a12.1.2025.12.19.05.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:20:06 -0800 (PST)
Message-ID: <a14e40b7-b70b-4658-9dee-7e5e6265ad5f@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 14:20:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, krzk+dt@kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-6-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219043425.888585-6-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JcWBn8gEmWcbFUiWo80C6EPvCzGF3rbu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDExMCBTYWx0ZWRfX39CIriuIYj12
 lgrI0Kwx/gatOIWhp6UXqDUsnEu9zEZf/BJkDamewkkuB8x2mK/GtEyw+LI0fPMPn5wIdIq3tN+
 4fOMl4FHdNWNNO5da9Tzof+qMmi/DZRl75iGGOX2/G4tcLg0AgU5TMul3CtTnjC/EdcLtUs9i3J
 jkkBxGu5NEu0TLLXc0oh5BhNKkPZ4A+Di7mt4KCyfLx1q8F/SEU23movSXLQpc8tQBNhxq+5l7Y
 43OTgJ79ygtGlaH2QQgysAHstFdahvVkKCoQ5InK4ZMedN5Qb9E/CE73egXJ+DTMPHB9f/uIT9U
 2Agw+41keda0nX0E039fT05SUYcRvO1UmpgEKVTO3q54gBrqryX7hguRjmM4ElTEyBTLgHLMVMb
 eggVi0x1Dp7m/p3GJF3pDkijcy/co1MWufowNJYjS7uwBQMhFf8XRmfzFmEK8mw6yT5mMWDi9Bu
 TJ+xIaBVv0kZRpi0fWA==
X-Proofpoint-ORIG-GUID: JcWBn8gEmWcbFUiWo80C6EPvCzGF3rbu
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=69455108 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=qobCRDE2p1pS69ETF_kA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190110

On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
> Q6 based firmware loading is also present on IPQ9574, when coupled
> with a wifi-6 device, such as QCN5024. Populate driver data for
> IPQ9574 with values from the downstream 5.4 kerrnel.
> 
> Add the new sequences for the WCSS reset and stop. The downstream
> 5.4 kernel calls these "Q6V7", so keep the name. This is still worth
> using with the "q6v5" driver because all other parts of the driver
> can be seamlessly reused.
> 
> The IPQ9574 uses two sets of clocks. the first, dubbed "q6_clocks"
> must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
> register. The second set of clocks, "clks" should only be enabled
> after the Q6 is placed out of reset. Otherwise, the host CPU core that
> tries to start the remoteproc will hang.
> 
> The downstream kernel had a funny comment, "Pray god and wait for
> reset to complete", which I decided to keep for entertainment value.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

[...]

> @@ -128,6 +137,12 @@ struct q6v5_wcss {
>  	struct clk *qdsp6ss_xo_cbcr;
>  	struct clk *qdsp6ss_core_gfmux;
>  	struct clk *lcc_bcr_sleep;
> +	struct clk_bulk_data *clks;
> +	/* clocks that must be started before the Q6 is booted */
> +	struct clk_bulk_data *q6_clks;

"pre_boot_clks" or something along those lines?

In general i'm not super stoked to see another platform where manual and
through-TZ bringup of remoteprocs is supposed to be supported in parallel..

Are you sure your firmware doesn't allow you to just do a simple
qcom_scm_pas_auth_and_reset() like in the multipd series?


> +	int num_clks;
> +	int num_q6_clks;
> +
>  	struct regulator *cx_supply;
>  	struct qcom_sysmon *sysmon;
>  
> @@ -236,6 +251,87 @@ static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
>  	return 0;
>  }
>  
> +static int q6v7_wcss_reset(struct q6v5_wcss *wcss, struct rproc *rproc)
> +{
> +	int ret;
> +	u32 val;
> +
> +	/*1. Set TCSR GLOBAL CFG1*/

Please add a space between the comment markers and the contents

> +	ret = regmap_update_bits(wcss->halt_map,
> +				 wcss->halt_nc + TCSR_GLOBAL_CFG1,
> +				 0xff00, 0x1100);

GENMASK(15, 8), BIT(8) | BIT(12)

> +	if (ret) {
> +		dev_err(wcss->dev, "TCSE_GLOBAL_CFG1 failed\n");

I don't think we should count on regmap to ever fail

> +		return ret;
> +	}
> +
> +	/* Enable Q6 clocks */

Right, this naming gets even more confusing


> +	ret = clk_bulk_prepare_enable(wcss->num_q6_clks, wcss->q6_clks);
> +	if (ret) {
> +		dev_err(wcss->dev, "failed to enable clocks, err=%d\n", ret);
> +		return ret;
> +	};
> +
> +	/* Write bootaddr to EVB so that Q6WCSS will jump there after reset */

That's what a boot address is generally for, no? ;)

> +	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
> +
> +	/*2. Deassert AON Reset */
> +	ret = reset_control_deassert(wcss->wcss_aon_reset);
> +	if (ret) {
> +		dev_err(wcss->dev, "wcss_aon_reset failed\n");
> +		clk_bulk_disable_unprepare(wcss->num_clks, wcss->clks);
> +		return ret;
> +	}
> +
> +	/*8. Set mpm configs*/

"MPM"

Why are the indices of your comments not in numerical order?

> +	/*set CFG[18:15]=1*/
> +	val = readl(wcss->rmb_base + SSCAON_CONFIG);
> +	val &= ~SSCAON_MASK;
> +	val |= SSCAON_BUS_EN;
> +	writel(val, wcss->rmb_base + SSCAON_CONFIG);
> +
> +	/*9. Wait for SSCAON_STATUS */
> +	ret = readl_poll_timeout(wcss->rmb_base + SSCAON_STATUS,
> +				 val, (val & 0xffff) == 0x10, 1000,
> +				 Q6SS_TIMEOUT_US * 1000);
> +	if (ret) {
> +		dev_err(wcss->dev, " Boot Error, SSCAON=0x%08X\n", val);
> +		return ret;

You left the clocks on in this path

> +	}
> +
> +	/*3. BHS require xo cbcr to be enabled */
> +	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
> +	val |= 0x1;

That's BIT(0)

In qcom_q6v5_mss.c you'll notice this is defined as Q6SS_CBCR_CLKEN

If you dig a little deeper, you'll also notice a similar name in
drivers/clk/qcom/clk-branch.[ch].. I suppose they just reused the same
kind of HW on the remoteproc side

> +	writel(val, wcss->reg_base + Q6SS_XO_CBCR);
> +
> +	/*4. Enable core cbcr*/
> +	val = readl(wcss->reg_base + Q6SS_CORE_CBCR);
> +	val |= 0x1;
> +	writel(val, wcss->reg_base + Q6SS_CORE_CBCR);
> +
> +	/*5. Enable sleep cbcr*/
> +	val = readl(wcss->reg_base + Q6SS_SLEEP_CBCR);
> +	val |= 0x1;
> +	writel(val, wcss->reg_base + Q6SS_SLEEP_CBCR);
> +
> +	/*6. Boot core start */
> +	writel(0x1, wcss->reg_base + Q6SS_BOOT_CORE_START);
> +	writel(0x1, wcss->reg_base + Q6SS_BOOT_CMD);
> +
> +	/*7. Pray god and wait for reset to complete*/

"ora et labora" - you've done your work, so I'd assume we can
expect success now

> +	ret = readl_poll_timeout(wcss->reg_base + Q6SS_BOOT_STATUS, val,
> +				 (val & 0x01), 20000, 1000);

The timeout is smaller than the retry delay value, this will only spin
once

0x01 is also BIT(0)

But since you never check whether that timeout has actually been
reached, I assume you really stand by the comment!

(you need this hunk):
if (ret) {
	dev_err(wcss->dev, "WCSS boot timed out\n");
	// cleanup
	return -ETIMEDOUT;
}

> +
> +	/* Enable non-Q6 clocks */
> +	ret = clk_bulk_prepare_enable(wcss->num_clks, wcss->clks);
> +	if (ret) {
> +		dev_err(wcss->dev, "failed to enable clocks, err=%d\n", ret);

the previous set of clocks will be left enabled in this case too

> +		return ret;
> +	};
> +
> +	return 0;

If you return ret here, you can drop the return in the above scope

> +}
> +
>  static int q6v5_wcss_start(struct rproc *rproc)
>  {
>  	struct q6v5_wcss *wcss = rproc->priv;
> @@ -270,10 +366,20 @@ static int q6v5_wcss_start(struct rproc *rproc)
>  	if (ret)
>  		goto wcss_q6_reset;
>  
> -	/* Write bootaddr to EVB so that Q6WCSS will jump there after reset */
> -	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
> +	switch (wcss->version) {
> +	case WCSS_QCS404:
> +	case WCSS_IPQ8074:
> +		/* Write bootaddr to EVB so that Q6WCSS will jump there after
> +		 * reset.
> +		 */

/* foo */?

[...]

> +static void q6v7_q6_powerdown(struct q6v5_wcss *wcss)
> +{
> +	uint32_t val;

"u32"

> +
> +	q6v5_wcss_halt_axi_port(wcss, wcss->halt_map, wcss->halt_q6);
> +
> +	/* Disable Q6 Core clock -- we don't know what bit 0 means */

I would assume clearing it muxes the clocksource to XO

[...]

> +static int ipq9574_init_clocks(struct q6v5_wcss *wcss)
> +{
> +	static const char *const q6_clks[] = {
> +		"anoc_wcss_axi_m", "q6_ahb", "q6_ahb_s", "q6_axim", "q6ss_boot",
> +		"mem_noc_q6_axi", "sys_noc_wcss_ahb", "wcss_acmt", "wcss_ecahb",
> +		"wcss_q6_tbu" };
> +	static const char *const clks[] = {
> +		"q6_axim2", "wcss_ahb_s", "wcss_axi_m" };

static local variables that we point to? eeeeeeh

> +	int i, ret;
> +
> +	wcss->num_clks = ARRAY_SIZE(clks);
> +	wcss->num_q6_clks = ARRAY_SIZE(q6_clks);
> +
> +	wcss->q6_clks = devm_kcalloc(wcss->dev, wcss->num_q6_clks,
> +				     sizeof(*wcss->q6_clks), GFP_KERNEL);
> +	if (!wcss->q6_clks)
> +		return -ENOMEM;
> +
> +	wcss->clks = devm_kcalloc(wcss->dev, wcss->num_clks,
> +				  sizeof(*wcss->clks), GFP_KERNEL);
> +	if (!wcss->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < wcss->num_q6_clks; i++)
> +		wcss->q6_clks[i].id = q6_clks[i];
> +
> +	for (i = 0; i < wcss->num_clks; i++)
> +		wcss->clks[i].id = clks[i];
> +
> +	ret = devm_clk_bulk_get(wcss->dev, wcss->num_q6_clks, wcss->q6_clks);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_clk_bulk_get(wcss->dev, wcss->num_clks, wcss->clks);
> +}
> +
> +

double \n

Konrad

