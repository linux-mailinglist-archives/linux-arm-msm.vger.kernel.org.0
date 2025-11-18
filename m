Return-Path: <linux-arm-msm+bounces-82264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 440D1C69088
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 5B41D2AA4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42971339701;
	Tue, 18 Nov 2025 11:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbCQi1y0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNQjG4eW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D4134E768
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 11:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464705; cv=none; b=IK3HZUNjsu3wu7ALq1cFpd+uoUfvn49I4t+bf0JN7GYE0QGJQe9ST/QldJNlqigpAmTaMyddSvFIa9eRUVF1nxQFVkoQrg+hgzE70xKArH0k4yk9lkOLs+Miap8787iD2sarxmkvkqKVZRxeCYCZb+9gzt9IhgcO4o6Nf+QAEro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464705; c=relaxed/simple;
	bh=j1X8Bcz0tw2PQAuMnopNpJHPrzfuraBENhrJ0hqo3H8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2hmmncJ9KiwfyO4cIxms1iwU3q2xRSe1jLrw6L6KVgcPtboeg8lS2tzVmeS/FV7XX46PUVsqxNlPhMX2c9KP8g6gY3UEI298S1Qn+Y1BmsIhhEKGoLp4li7rcCy/tcBTbcMXnqLqtUQsdEvsZgOFolhsQM6NAstx9r0yvxCOhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbCQi1y0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNQjG4eW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAR4XQ2927168
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 11:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BT6MxSCrefLxE5wv9+3d366R21cpjkB5npT66y5AUFc=; b=kbCQi1y00SlDlSVz
	UWKyI+N+b1O32Qrzw90az9OtW28Km9edlZ/8UVAd6wdO1+dWx8/hlDUMFacaUcVd
	s9W7FlC4V4t96OBOPodVnnRjeY4pG7cjpp6fy4x6Fe1WaC/QncEEdxYSdkmxzCTD
	9mmSN0NTKxc9oBmysZxa9ILofLFwy0Y8ejKHzxbOAAaCkXbB87/yADuGszZ0Y1Yg
	s5YSAc4Fs2HfpkfPFeC9fpVMJCS/Af4UDPsJvLtXsfMPV1yRph86D9Q7yzYaopxr
	Mqo5OgJVBB3vkGwNCgZXPwm9+8dpvFBwfaenrmaTOS6NFjAurX8nSyHxg2hosYoi
	PtjCCw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq2904a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 11:18:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so5885066b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 03:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763464701; x=1764069501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BT6MxSCrefLxE5wv9+3d366R21cpjkB5npT66y5AUFc=;
        b=TNQjG4eW9B2DQbdkvXQbHHcP/dm/yTpxywk7gIUFO87rK7SekzG7/D3J8qzN/m6Hmx
         RGiecJrp/sdCzxy9A3FRB3wmFUeAS03rgRj0SiThSWjn9gQ5jp2JC10UHBRQ1RIW1vFD
         x09lucffgML1C06T0F7LWtfqkbKZPC8O0t7toFS+ydg9dlhmz1P2IMSYWPo/1dpjg10d
         ZSebto/xuaYAg6WK1OtpELIGOJPZ0fA0n5YbxVeQvTr7wP4OagXs/ZPsY73pL5T/viBP
         cSTYdR/hzBovPm3pQAbItLjj0T+pUYLbbzuPmpK6Jjekvxc+PWwFbBE63x4lr32IPYG6
         noow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763464701; x=1764069501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BT6MxSCrefLxE5wv9+3d366R21cpjkB5npT66y5AUFc=;
        b=LEDK0E3dSQ0G94r0vRZbR6AZ0DOFPn+zvI2oZ0d/yvTWg6ZP2Zj+yaxu52N42Hbav+
         xDmoJpvCb1M403V8g4voBCO2Dk3tcLEzSKY6mcaJXz06557PTFtIKy2pMD2FpAhb8gvM
         cgjnMvGYOlJ5AwrKBV/WqItyvOQ4+wPcEw4FkjqkYi7oqiR27iZCT4Y54b8MFkEwB5+W
         XqbVRskDf6BH2VDNyGuyvH3BWU6CqTVCGWKsWUdY0cvKwtCLIR9sSFVp6ReEUFTy7492
         uGx73X4YHhthQhCezEZ7CJPzgb5IKmTaFuL162vD6UUbdKykQotwdeOemYy0v0txRcBq
         TGIw==
X-Gm-Message-State: AOJu0Yw6cCpGjoy8r9MGHDWSDBgRwcmuXcM+y+qMbQlzaDs2+cmK1Rt9
	gma9f31qcZ6PFhR9qEqkMYiBNzoSgUWYM18Qw1HPDEqqskc98/JZ9vG7VUqao+wBkk4+J4RgDu5
	RBqV2X1Suwaz1cXLi9HWhbblslTaz2FpxxO1Pe7Goz2iE9OVtJVBwtOCrQCUUGoHlWw+l
X-Gm-Gg: ASbGnctibxvUy5OjojmSXhXLYVDtF1RpiEkrbycWyVuWgQkFQ0dF2Wi7SvFYHq4+pMx
	tRz9I1NIygs6oX7KxARlToNhLntf3wWjwePROWrUVuexjpoBRfZ8oGH7pPBpZS0+upYQN0hD3ok
	Z7Z7/msU9oR4gcQrVdCsic95svEhXR0QOmkIgJxhtbo1ufBil4/bzmG7iqVtzN3ySPw1k1ZGC1x
	y/m1PTzS4qvzflPRSXgFibHR0fPt6M1/Jcrjl5UAjnSAw4mdyPRVnzNFZ8B69xktqJYbhlLT3lI
	5bn6yNNO11g49I0AefobL9AMnNWoSJ9DuAQKdKZ1QtUnWaqSD04dOeodEnSS/cCCuM6dS9PQNUM
	6Fm6PAsUubDY+3t/pk41M4Bk0upwsGnSjGXgzHRyGONTNX1Xmjdi14w==
X-Received: by 2002:a05:6a00:a28:b0:7a2:6eb3:71ee with SMTP id d2e1a72fcca58-7ba39beb4dfmr17045014b3a.9.1763464701113;
        Tue, 18 Nov 2025 03:18:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK4YICEHIj1nlKnQLiop2iPzyANBvxiVZ7gJKumRb5uJP3w+uf6eq9GE2MS8ZF5xQcO4gnLw==
X-Received: by 2002:a05:6a00:a28:b0:7a2:6eb3:71ee with SMTP id d2e1a72fcca58-7ba39beb4dfmr17044997b3a.9.1763464700610;
        Tue, 18 Nov 2025 03:18:20 -0800 (PST)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7bedbb2a1d2sm7339512b3a.41.2025.11.18.03.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:18:20 -0800 (PST)
Message-ID: <88e538ee-9e70-4249-bee5-5127d344edad@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:48:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
To: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
References: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
 <20251118-gunyah_watchdog-v8-1-e5de12e2eef5@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20251118-gunyah_watchdog-v8-1-e5de12e2eef5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691c55fe cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=h6q1wd228mELy5tlGgAA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: H6RA1MXsn_K9KtlJ9Ryljad1n3sZ7m0o
X-Proofpoint-GUID: H6RA1MXsn_K9KtlJ9Ryljad1n3sZ7m0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA5MCBTYWx0ZWRfXw0iibHQwRHx8
 WRXTaBxxDYejlZ3SuO7kb209bTbQMZDZ9D8hNJmiPduWPqVY4lAlAScWT2dlwLOpIuVzqOKSRIe
 Hn30bDeqEtN3fPh2cHxR8HOA9gahKWqBek0XqeyI7rSUaXsMcGWZwuMU3uFbcs89x63RQSdIUIh
 ODDxIIetr7Xx8czL9mHTS8uL4JyuAJ7yW7zBh1mqW0/OYdzCeC9FdR1uPY01nGfC35i4WohtI3K
 7cj4WWLx7egEndPKcDdcUoXroRXIqLbuTgZrcqlrAfIqbkeRve3XcIODiDiHRV+LhtwRoFINUBl
 9WlwYlsvS3K3p63Uggnp1AKvRT73zLYLQbEx7PNkY4KsATdW29IpLqaeLZfdKzdZPULQ8yb14/Z
 WNqJazi86u1J1vhUkZH3os4DihdMrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180090


On 11/18/2025 4:10 PM, Hrishabh Rajput via B4 Relay wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>
> To restrict Gunyah watchdog initialization to Qualcomm platforms running
> under the Gunyah Hypervisor, register the watchdog device in the QCOM
> SCM driver.
>
> When Gunyah is not present or Gunyah emulates MMIO-based watchdog, we
> expect Qualcomm watchdog or ARM SBSA watchdog device to be present in
> the devicetree. First, we make sure we're running under the Gunyah
> Hypervisor. Then we move to check if any of the above mentioned
> watchdog device nodes are present, if not then we proceed to register
> the SMC-based Gunyah watchdog device.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c | 53 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index e777b7cb9b12..14d0663316e6 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2182,6 +2182,56 @@ int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
>   }
>   EXPORT_SYMBOL(qcom_scm_qtee_callback_response);
>   
> +static void qcom_scm_gunyah_wdt_free(void *data)
> +{
> +	struct platform_device *gunyah_wdt_dev = data;
> +
> +	platform_device_unregister(gunyah_wdt_dev);
> +}
> +
> +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
> +{
> +	struct platform_device *gunyah_wdt_dev;
> +	struct device_node *np;

nit: Can we use the __cleanup() attribute for device_node like below and 
drop the explicit of_node_put()?

struct device_node *np __free(device_node) = NULL;

FYI - I submitted the patch which takes care of this in the SCM driver[1].

[1] 
https://lore.kernel.org/linux-arm-msm/20251117-scm_cleanup_of_node_put-v1-1-307d36d6b849@oss.qualcomm.com/

> +	bool of_wdt_available;
> +	int i;
> +	static const uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb,
> +						    0x92, 0x65, 0xce, 0x36,
> +						    0x67, 0x3d, 0x5f, 0x14);
> +	static const char * const of_wdt_compatible[] = {
> +		"qcom,kpss-wdt",
> +		"arm,sbsa-gwdt",
> +	};
> +
> +	/* Bail out if we are not running under Gunyah */
> +	if (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) ||
> +	    !arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> +		return;
> +
> +	/*
> +	 * Gunyah emulates either of Qualcomm watchdog or ARM SBSA watchdog on
> +	 * newer platforms. Bail out if we find them in the devicetree.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(of_wdt_compatible); i++) {
> +		np = of_find_compatible_node(NULL, NULL, of_wdt_compatible[i]);
> +		of_wdt_available = of_device_is_available(np);
> +		of_node_put(np);
> +		if (of_wdt_available)
> +			return;
> +	}
> +
> +	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
> +							 NULL, 0);
> +	if (IS_ERR(gunyah_wdt_dev)) {
> +		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
> +			PTR_ERR(gunyah_wdt_dev));
> +		return;
> +	}
> +
> +	devm_add_action_or_reset(scm->dev, qcom_scm_gunyah_wdt_free,
> +				 gunyah_wdt_dev);
> +}
> +
>   static void qcom_scm_qtee_free(void *data)
>   {
>   	struct platform_device *qtee_dev = data;
> @@ -2448,6 +2498,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
>   	/* Initialize the QTEE object interface. */
>   	qcom_scm_qtee_init(scm);
>   
> +	/* Initialize the Gunyah watchdog platform device. */
> +	qcom_scm_gunyah_wdt_init(scm);
> +
>   	return 0;
>   }
>   
>

