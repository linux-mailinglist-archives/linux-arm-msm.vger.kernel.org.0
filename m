Return-Path: <linux-arm-msm+bounces-91301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEISHbOffGlSOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:10:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6704BA588
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B81BD3007966
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5BF36C598;
	Fri, 30 Jan 2026 12:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QaEPRCk7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EgYj547/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCD036CE05
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775024; cv=none; b=bdN9T71vnSldYefE3vGr7fxZ83IOcHTNfLuR0YEEnPca5A41BBmL2KrmsXTUqRaCXH/hOUPkshxJDC3RkmYxJSxyy2wD9IvHhQlNFtaBTX7CUJWjNCU5l0+nrPMkWFK1F8Ab3zy/vvFeQawCVGWJ/9g7vv/qc63nmwMZFYMviIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775024; c=relaxed/simple;
	bh=HzZiHDlrOr0vI/CQUVVtqO9fYzHLUewVnOb1g+k7v4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2x/8dbR+ss88HkF/AM7SlPztDNEwZv1chR7/G4+cCj1uflhKkQWDa8jHX9vYxGwO1RgQKxnPDLagv8pI7Vcz7iBu9fotEs05EzM24dFPUj3XDsB6cu0oeSDInO9kL1tRznKxG9dbU6BSeu4PGC2JeasUfXabJBhq6FjGtqfBog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QaEPRCk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EgYj547/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAkvNr891218
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5KrQEShWz4+X5gzPbDvb6pqebx+KGMIu9EIvQ3m0nDk=; b=QaEPRCk7xYhOOINL
	7e3SvpalzFWMppl4cy0a5KeatAPdekZ9LE91Op0fKmugXLt2OuDxUP4/WQkiW299
	ba1VpMkDE8wwCSUcFKYlXjzIy9Nw8ds9RAnqyibAVoEI+LT0F7z+H26iSt2ttBF7
	xWqIN0nFcvyaJL3RxbWCxpILiHNARBaiVxD3wuLWLfB/HS4Xcy0rx22xO57pNdWY
	7/tGfN+qp6A8zPZROVlIyUdKJa89y07AjaT/29xuvEmJ9Rc4gom+ptrSwxve+6o9
	XNjNfPJDNVMRJ2YEVOXBeopF0aEz5zX5H6uExuM5Cdhy2e3g/8C/gmUgQUfRZeSz
	b9wfDQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gs7t2vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:10:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f540e6d40aso154867137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769775022; x=1770379822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5KrQEShWz4+X5gzPbDvb6pqebx+KGMIu9EIvQ3m0nDk=;
        b=EgYj547/n6EzRT46cpm9wes1fzxmngHwGZpRMsuSlFOmo8PiquZE0Ytu+3cksAwi9/
         e8pspKn/RtixOPoG/eIZbmG8j6Ey7GAdSY4em+dxAkl0KPI6Au/DVKeweGk1H2XZDy9l
         xu2h8XzMZBUS7JUzjlrTGdGRpJCZfnUKCKhlSSMbiqYn1+lup3o8HVGKupP8OtWWEWmd
         XcKJf0P4vm4JR/tDrqinm9InJWOfkagJvkZT6NdlqwsoqGevFVOcy/J2Q7jYNvOLXHsF
         6jJEGwmVFNOW4Ki3Wo1i8Givpf1HemVoPL2UK6BfJXM7U5ZrkDSxKB/JEiu9GLx4+03R
         m7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769775022; x=1770379822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KrQEShWz4+X5gzPbDvb6pqebx+KGMIu9EIvQ3m0nDk=;
        b=jchfw5cmNm+JcNQBeYG3NUjgvI8KJK+i9vzHlZ+hxmntT0aEfXY5u3B4ioY4oVL3qh
         ve0a7mq7H65YD3qJZpApKYaauQO5gCQrIFNZuCxyQ8CKbUdGpgXgWSp7E/Tjmkvu6PqF
         JQCGVcqy+NF6vUAsrXXq98M2WA9QsEl4beJM4GCPrJZi/MuIhcKfS5Lv8CLGDcJrxLsm
         nnH8YqaDw8FwvMlRxqHindAbMjsR/Abr67p7uANmLmu/zRmBErrvW6vNkDghJ4J85kWr
         /AcC6N9LM5FdXWUWq7zsHosSM6lOk/ioo6dOwmyxMQogfu0xm1iLygegaViuUS0yZRBQ
         6y3w==
X-Forwarded-Encrypted: i=1; AJvYcCWorXCt+vogB/+hvA/12u+SZc0RmNJD+hDEOPU4G991U1sldKHEZD2EkqqugwErN+/8m6lBm38c2W4nLEg1@vger.kernel.org
X-Gm-Message-State: AOJu0YwXtScw3wc+eUZsjhnFNF1waIUOmB9gNZUXjeKSGi96Lrw2hwk4
	jcjpp8h+0MZE080TWd8huEHDTEjasPbk+rHiuEpgxaN7AT35oHiivTJRnLHzevkGjBjz1cVq571
	0/oK7jfO/mpX+TcU+Ho3qvjN/6aAs9GzlF186spQL0AA04KVKvkzrI2xu7qghiB/8B81l
X-Gm-Gg: AZuq6aJZSL22Ao0VkJS3rU9V33GrHbRjWZOJ06Elsn4oIz925Zru2dJVVzHM9QZmMkz
	/Q8HCqCzJP0bmXE5mLUOc4VqgK/cosd0C0ejHJVDGNENKNfJxzro+hXMZWFORiAYLGtuTuaW56/
	Jmdfi80If/5MZYG4n7+21eufmKEc9f1PcXhhISn8quWz6Sa5ZQB1IWmvow5EI514YX8QhkkHo8W
	vhdioxKbojCt9cLYyZNQvn3HMsZe3hmUgHTpKZuGZkSi9Z2qAbDuolEkAudcsV+e3mU9ZIUo1m4
	Zh7XmWNaNIrAD/YPvKhqwUIm6QhQ+sIsf4Y12F1+4OXpEiCLDW7yI5TxAhElnWXj7w6Pxkew+3W
	fel3qRz1PJ2c6JF/hscW3OfN/CX1VOQHcxyP0JdCJfzRCRrEfVyAjz8566XMYN9zb9sI=
X-Received: by 2002:a05:6102:c13:b0:5df:b52f:58ff with SMTP id ada2fe7eead31-5f8e2657ed8mr399671137.5.1769775020181;
        Fri, 30 Jan 2026 04:10:20 -0800 (PST)
X-Received: by 2002:a05:6102:c13:b0:5df:b52f:58ff with SMTP id ada2fe7eead31-5f8e2657ed8mr399667137.5.1769775019677;
        Fri, 30 Jan 2026 04:10:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b6e08sm1773806e87.67.2026.01.30.04.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:10:19 -0800 (PST)
Message-ID: <f3a47ca9-643a-4885-b8cf-0e32c6a1ea2f@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 13:10:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] soc: qcom: geni-se: Introduce helper API for
 resource initialization
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-4-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112104722.591521-4-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5OSBTYWx0ZWRfX6s7v+rMnR/X5
 Q9DZIGQu1zu4ooR1pTRhGkCqPhNm9ifoMTuLQYefVta1qDEglaLDZyrKjK8eKRkRglHufCKkgrn
 UNzOxEs+yStKakJWCYe6ldCBvS7zcezQnTEtdo9CzyyEYiqJWoed+JhjILMLJQEjhZ9m/uzWknD
 Uc/QrFC56Q4vShL+yPqAIhXmHf5WcLd357+StoSAfddugO4Fhbw7AN0yAfi0J7cFYGBP1Qqj7Ab
 FMDZrWUdnbuy7FEbjsdp151RFX86zL38AwUKEJYz/0PCX+Lt1tSTkDOfv5PydE8N9eU9g9jFDoL
 U/+w0ytcNg/f7aY8hziMJpGBdWN2Zecnm1pcM7MyLOgDw9Qn2cNtBC6iWF4Uv6QWY13k5WyBCIu
 Gg0CmmEDReVl+h2hOVSIGecpz30rxRAudONZAOpNJ4WoeyKRcD9kWV4yNWRW88FrAhLkIfk8+IW
 TA9nLbFwO4PHweJBYXA==
X-Proofpoint-ORIG-GUID: 4co2PrIBzlu7rn-I2hVCsfiP0sLImhsd
X-Proofpoint-GUID: 4co2PrIBzlu7rn-I2hVCsfiP0sLImhsd
X-Authority-Analysis: v=2.4 cv=UPLQ3Sfy c=1 sm=1 tr=0 ts=697c9fae cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d5hKC04Oyf0H4ek5n1oA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91301-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6704BA588
X-Rspamd-Action: no action

On 1/12/26 11:47 AM, Praveen Talari wrote:
> The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently duplicate
> code for initializing shared resources such as clocks and interconnect
> paths.
> 
> Introduce a new helper API, geni_se_resources_init(), to centralize this
> initialization logic, improving modularity and simplifying the probe
> function.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> v1 -> v2:
> From kernel test robot
> - Updated proper return value for devm_pm_opp_set_clkname()
> ---
>  drivers/soc/qcom/qcom-geni-se.c  | 47 ++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/geni-se.h |  6 ++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index b0542f836453..75e722cd1a94 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -19,6 +19,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
>  #include <linux/soc/qcom/geni-se.h>
>  
>  /**
> @@ -1012,6 +1013,52 @@ int geni_icc_disable(struct geni_se *se)
>  }
>  EXPORT_SYMBOL_GPL(geni_icc_disable);
>  
> +/**
> + * geni_se_resources_init() - Initialize resources for a GENI SE device.
> + * @se: Pointer to the geni_se structure representing the GENI SE device.
> + *
> + * This function initializes various resources required by the GENI Serial Engine
> + * (SE) device, including clock resources (core and SE clocks), interconnect
> + * paths for communication.
> + * It retrieves optional and mandatory clock resources, adds an OF-based
> + * operating performance point (OPP) table, and sets up interconnect paths
> + * with default bandwidths. The function also sets a flag (`has_opp`) to
> + * indicate whether OPP support is available for the device.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int geni_se_resources_init(struct geni_se *se)
> +{
> +	int ret;
> +
> +	se->core_clk = devm_clk_get_optional(se->dev, "core");
> +	if (IS_ERR(se->core_clk))
> +		return dev_err_probe(se->dev, PTR_ERR(se->core_clk),
> +				     "Failed to get optional core clk\n");
> +
> +	se->clk = devm_clk_get(se->dev, "se");
> +	if (IS_ERR(se->clk) && !has_acpi_companion(se->dev))
> +		return dev_err_probe(se->dev, PTR_ERR(se->clk),
> +				     "Failed to get SE clk\n");
> +
> +	ret = devm_pm_opp_set_clkname(se->dev, "se");
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_pm_opp_of_add_table(se->dev);
> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(se->dev, ret, "Failed to add OPP table\n");
> +
> +	se->has_opp = (ret == 0);
> +
> +	ret = geni_icc_get(se, "qup-memory");

The second argument is a NOP after patch 1.. originally I think I had a
cross-subsys patch to get rid of that, neither solution is exactly pretty..

But otherwise, this looks good

Konrad

