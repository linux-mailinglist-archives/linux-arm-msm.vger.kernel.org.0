Return-Path: <linux-arm-msm+bounces-98149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDJzJ+YxuWnsuQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:50:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A378F2A8433
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 712DC301023A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D2136EAB3;
	Tue, 17 Mar 2026 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCe0TFF8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VC+i/xcu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC330366DBE
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744375; cv=none; b=KDfV+8pWt0e2s1p0xT49SufWtmV1SvarUTlptJqYPKbj5LmbhCQ8D4rsdsFgFpOjSqp09FR8D2g4GlOoFNbq73LkQRr9ymje9MmUnJ2+hJpDMgYOmutsaobJHc2qfq0lO50PWI6r+wTPFkyQW9hrdcRFlfmPvjtTrk00fhl0J/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744375; c=relaxed/simple;
	bh=A1mIIJEaqrCodQu92vygvb9wqCqBodsOpiZXKvehQ3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZnxpro11Tmt6Q7SzBXQ86insMEBooC/6F5ZAcaGUWOWITJmXWJT5Ukwsy8k+whIT6ICE7vYftudezXBnP4caU7zfIVI/5gMP/JmFk8KhyLfeKKeKoRsitcYM2A6Jjop7SsOduumSd1n6Q0w7MfxW9ZrciDpwEMVFt/czhgTFtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCe0TFF8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VC+i/xcu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8mYQ83102514
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2pCwTXBGRp2O/7xv+6yHE0kSyqIKsd5DC/D8aY8o9g=; b=ZCe0TFF8W/8oe+Ks
	O2JhkP7baPVZhXPtQFOgz4Zz5aKUNacLHpt7pXmRLGWyKVVppC+G8mA6E+ZX4nod
	ng8QAdg6yFY/qrKqBu1WEcO0tHobpHLIkrEClWpm+fqMED4MaIhjZu04RopxUr8E
	chrkWcyM9j/ff1dvvuozkbg+pbjpznk/8j9wankx+pdEeoU/KSUDaudaj3aNXEen
	BZLfBlLKBtoi78UmsG7Zp53zvAMVCENgndG3lmISTSEcNJ8wY8FmgjO8TwEf4GJ3
	7z/pcfRaJH8mKa+ZksKs+vGzSO45gd9m9G1oxOvj9/RQ84Hn3Ctwa2z+B8Mh77iB
	ierGyw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb7bdh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:46:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35b8da51b3eso3270986a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 03:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773744372; x=1774349172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L2pCwTXBGRp2O/7xv+6yHE0kSyqIKsd5DC/D8aY8o9g=;
        b=VC+i/xcuFWcKxNXSGnF9pfw7y5TBFGLI5rs0ptbKLmWZoJICUg475TVrL06A5+Ca6w
         E3YTn6GIf1IqQ3A4PsBUOERsxPeQCmoZ4IdZWJodejLFhNV2e3h3J8susQGMXyTuYjuF
         +sL9CZ6JXD2voNEzyI2toFsg4FdxnvZlt0tL+OQMjiL5CwAfjv4OUOe1dBnE9PzCsaz7
         90pnKJMQD9uqTXUR9EMCaMDvtPpWePS0kWI9wCR+KmH0E4C9p+aJ8J/uY14y0vYEylML
         AydfwOc+2y+U3X3P/+BF9INp8lat4VVyx98hugeh8F1iDZUpiY1sxt4zSSiwXI86vVV+
         JkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773744372; x=1774349172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2pCwTXBGRp2O/7xv+6yHE0kSyqIKsd5DC/D8aY8o9g=;
        b=nFHsNHvh3/KQW9q7LSZYfEu37+aBjIKnIq1rmblBEkfbxDFgYyG5TEhTCO/PYDhAMH
         UXStJUxsx4fbz6K/+GpIXAPQnAcmCnOAwFQ7lfFA8KjtZ7Z4zyqiX8tWo/X/rxz8/gW9
         sVS3Y9kjHPl8fcBTaf59wXxGflVJfV3kVgccBFwIu2Jnhh3LpJzT1WBr75uHiwlIYr8l
         RquY9PKZ0UklLMC3NvO/jVw82d+njHT1PcALpzDdND7dADYkFZa9n+SLcH/TD4qXleod
         c0GrsbXeuZYRIDM83Lee9PYYpqKXgZ2cKBdHXzWTOEWmGL/6IdUvWn/VaWccxZCTCXUd
         v3ZQ==
X-Gm-Message-State: AOJu0Ywwvl6ryRVVN6zo65NuZYlioqzDfE3nJB80R6fx9gyXT4twpeEW
	WeMQUMJ9fUhw6KEfOcom8gxJGznNm/8YVJKYsINNeRNTy53TUBiEKP7S7s322JvCxeeA6BVpcKH
	guJQo8AxIvsZjGY2hVPameAiRCyBXPaU1qsanfuO9VbHbjsu6gIhbHOjnMGtzQq09uqtn
X-Gm-Gg: ATEYQzwvAGyOT0R52H4Gi4fARFLRQxqxhjuTqX3eG+3PvW9xznGAt13PzHC5Q0/81H/
	GTkJZOf9Vr3pRU7nlV53AtDkpXWfBwjGRxIU31p4TCVyi5nRup5vyXVK0zzvjGN66HGJ9/d+J7s
	8YuQAnRCOnsM3MUKqrLObDzh7lL8RbTu3mgqgkDPLc/3QoysW0CxjqVoDVS6HBqDkx+tPMfvULD
	7u6tunm6S/tTLokDBCAS8DVxjtGXuXmRzJJdRyPtcWF7JjJD51wiqHJ6wGbdJzA+d/0sQ1FgAQC
	Jmkn+2/VtyLa+8CsZyI8eop9hMRzhc4uWXYdMvrR7Wjv2QVjLW1k/Ow9SzWx11iMIg77TjqP4C7
	aQLh88d2zozAoESvTE/Ybbmnvtg7sJ7GFPEnyT0QbLbgIqwkamQ==
X-Received: by 2002:a17:90b:4a84:b0:354:ad98:7d1c with SMTP id 98e67ed59e1d1-35a21e62c02mr16319847a91.11.1773744372238;
        Tue, 17 Mar 2026 03:46:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4a84:b0:354:ad98:7d1c with SMTP id 98e67ed59e1d1-35a21e62c02mr16319818a91.11.1773744371767;
        Tue, 17 Mar 2026 03:46:11 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada5c760sm2581103a91.5.2026.03.17.03.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 03:46:11 -0700 (PDT)
Message-ID: <0cad34b4-16fb-4820-a051-5e217d5a738b@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 16:16:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260317-clk-qcom-dispcc-eliza-v1-0-be4b0e4eb24a@oss.qualcomm.com>
 <20260317-clk-qcom-dispcc-eliza-v1-2-be4b0e4eb24a@oss.qualcomm.com>
 <bc90669a-652c-4a10-9755-f4c202506318@oss.qualcomm.com>
 <f67c126f-b5ea-43e1-9f68-c8246e641f17@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <f67c126f-b5ea-43e1-9f68-c8246e641f17@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA5NSBTYWx0ZWRfXw34Rhlv0/LhK
 yHTuaqMqk+93XUABBQcPKZzZqAcCxLNHKt2geLcxsO+c1V5hQqVYi6bZkepew9hiZu94vfyOWGE
 7HFjHu4SyH0AJPR1Gi2JIzbrkKB7fMqWydTylmU35TVxLLVPe7RFhIVR2F2bEerXhqEu1tFKJ2O
 JhOvOcFzgOse2QU8qV4y6KfPTzCo+ewaxA6Sqgfgwu7433XeAGfj9b8qPLQVM7fI0QjoiEUkpG+
 m5sMdjAMLLsLH9CUEdObhH52ADPvhoUcbF0P3LjVk/wcg7rWjIBw/4e8rGx2DwjmAz4Bo/qx2M0
 oh0ZwZqc+HRHYY+gO+iKqjL5NtF3qzAHuIWP78Hoa/PjIRib9629NPO8zfpGzu+zyrWcNWNGHSI
 HTr6aQ0nzcUPzTE/dX86ple3TF5SCuNJupJ6lSe+z9cCbGzxKYHd0hp3DLjhpssKqOlZmc3OrwH
 cfFfeineSr/ZQ8EPy0A==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b930f4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zVrBNZ6YtphMyaTvLrUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: aF8hqsZ3bg3DBxBaJbpaZeRXXCUcl5C5
X-Proofpoint-GUID: aF8hqsZ3bg3DBxBaJbpaZeRXXCUcl5C5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-98149-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A378F2A8433
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 3:54 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 11:22, Konrad Dybcio wrote:
>> On 3/17/26 11:06 AM, Krzysztof Kozlowski wrote:
>>> Add a drvier for the display clock controller on Qualcomm Eliza SoC,
>>> which is copied from SM8750 driver plus changes:
>>>
>>> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
>>> 2. Eight new HDMI clocks,
>>> 3. Different PLLs (lucid and pongo).
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>
>> [...]


static struct qcom_cc_driver_data disp_cc_eliza_driver_data = {
        .alpha_plls = disp_cc_eliza_plls,
        .num_alpha_plls = ARRAY_SIZE(disp_cc_eliza_plls),
        .clk_cbcrs = disp_cc_eliza_critical_cbcrs,
        .num_clk_cbcrs = ARRAY_SIZE(disp_cc_eliza_critical_cbcrs),
        .clk_regs_configure = clk_eliza_regs_configure,
};

static const struct qcom_cc_desc disp_cc_eliza_desc = {
        .config = &disp_cc_eliza_regmap_config,
        .clks = disp_cc_eliza_clocks,
        .num_clks = ARRAY_SIZE(disp_cc_eliza_clocks),
        .resets = disp_cc_eliza_resets,
        .num_resets = ARRAY_SIZE(disp_cc_eliza_resets),
        .gdscs = disp_cc_eliza_gdscs,
        .num_gdscs = ARRAY_SIZE(disp_cc_eliza_gdscs),
        .use_rpm = true,
        .driver_data = &disp_cc_eliza_driver_data,
};


>>
>>> +static int disp_cc_eliza_probe(struct platform_device *pdev)
>>> +{
>>> +	struct regmap *regmap;
>>> +	int ret;
>>> +
>>> +	ret = devm_pm_runtime_enable(&pdev->dev);
>>
>> -> qcom_cc_desc.use_rpm
>>
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	regmap = qcom_cc_map(pdev, &disp_cc_eliza_desc);
>>> +	if (IS_ERR(regmap)) {
>>> +		ret = PTR_ERR(regmap);
>>> +		goto err_put_rpm;
>>> +	}
>>> +
>>> +	clk_lucid_ole_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>>> +	clk_lucid_ole_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
>>> +	clk_pongo_elu_pll_configure(&disp_cc_pll2, regmap, &disp_cc_pll2_config);
>>
>> -> qcom_cc_driver_data.alpha_plls


static struct clk_alpha_pll *disp_cc_eliza_plls[] = {
        &disp_cc_pll0,
        &disp_cc_pll1,
        &disp_cc_pll2,
};


>>
>>> +
>>> +	/* Enable clock gating for MDP clocks */
>>> +	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
>>> +

static void clk_eliza_regs_configure(struct device *dev, struct regmap
*regmap)
{
        /* Enable clock gating for MDP clocks */
        regmap_update_bits(regmap, DISP_CC_MISC_CMD, BIT(4), BIT(4));
}



>>> +	/* Keep some clocks always-on */
>>> +	qcom_branch_set_clk_en(regmap, 0xe07c); /* DISP_CC_SLEEP_CLK */
>>> +	qcom_branch_set_clk_en(regmap, 0xe05c); /* DISP_CC_XO_CLK */
>>> +	qcom_branch_set_clk_en(regmap, 0xc00c); /* DISP_CC_MDSS_RSCC_AHB_CLK */
>>> +	qcom_branch_set_clk_en(regmap, 0xc008); /* DISP_CC_MDSS_RSCC_VSYNC_CLK */
>>
>> -> qcom_cc_driver_data.clk_regs_configure
>>


static u32 disp_cc_eliza_critical_cbcrs[] = {
        0xc00c, /* DISP_CC_MDSS_RSCC_AHB_CLK */
        0xc008, /* DISP_CC_MDSS_RSCC_VSYNC_CLK */
        0xe07c, /* DISP_CC_SLEEP_CLK */
        0xe05c, /* DISP_CC_XO_CLK */
};

> 
> Ack, I took a bit older driver as starting point but should take Kaanapali.
> 
> Best regards,
> Krzysztof
> 

-- 
Thanks,
Taniya Das


