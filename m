Return-Path: <linux-arm-msm+bounces-87963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBD5D00313
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 22:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7273301721D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 21:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0A3292B2E;
	Wed,  7 Jan 2026 21:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ic+scCvs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7CLFN/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CFD27F18F
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 21:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821947; cv=none; b=qX1yo2PfetfHT2jb75zFzR+COsqB907P0CbaurYNexk2qzUkRA66m1cpAhk/djRd7sZ4Sawo9/GYraa67FcebM3+0hOlYQ3alwE0NLFgJhhEgb0QTTswr5hOB76Ja4FAfUPqoFCfDwlcF6lK6AX7hw9QP6IaGIkjI4UXKB+VF/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821947; c=relaxed/simple;
	bh=BshCGRZul1xfGoi1WWXeSLGkpKuYRktsMEtNLxg7TPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rp6MEA/l68gMBPMYD4prxwvsDKpU2DYD3MocqdM7Whm4uqonfz0MSO/u+uUnrd/cQ4bdVNByA88dWCQsH8sAcdczAB4h1eiA7U6vUs8PRlbxZBQvBlqRWcKKKTJbbDzuNBLninEccht/7xENqSrlFsGmu/vcy1+QL17ZuAbATWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ic+scCvs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7CLFN/5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HnRSJ218515
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 21:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oe6y0Hk3miqbJsVbXXA1o3qPTG2801+ju99fJL3aODk=; b=ic+scCvsSdxY+o94
	f/uxFfEtQMjqNjrGg7cklTsfyvhxmY6UVREmoA51Dmm04U7idj2EOJyNHsoYBuKv
	Wflx5iklFdTZ8fPEaceTkJUrzvNjpYNK77DKpi/T4IJb8nQHEws1q/f7YKp3DnIC
	8qvBZcrYeo6rnZLFmSAIPX5+mh1dJ3guNQMg1J6fhN0/GwHBESJmyGDRQVfAKQ5j
	vspDgEkoMpO+HrkdIsJDUyMoOT/JPgXTWkxYKJBIVrBAEIn8ryKOnGLs23xjgyCx
	GUrbAGc1AJslrtj2SEIxHVK9e4feJnnceySgOk+342k6BJqho42mnoKKIxpZusHy
	YmbCuw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn80a617-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 21:39:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b0530846d3so1760307eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 13:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767821943; x=1768426743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oe6y0Hk3miqbJsVbXXA1o3qPTG2801+ju99fJL3aODk=;
        b=C7CLFN/5jix7E1ATzzKaf+Gq/qIk6BgNg8AEquqMSi8Iyci6pgvpZ/oOJ56HERkDZA
         nWlPQ6bGX35fNiPlG6NISimrP4sTDZuMlRl12y9fkE6jThN2Q/RseBikR61QsNgjEBuQ
         AzhZxUIz690W4DZ3FizvOWWWtOL7oCYAj/xct6y9iPpN0UFQTdSFFw3+pQz2CVPYYnR5
         Q3/3sLm0+OFKD/d3KD1aa0pI1AAsDl4S/nwbruVTNPz8bv9yu3m9v0gQiYs7sh4Ir3fB
         Vb5kryiC7dBN3dJrzXkMKTaKlOzxn5fJyhiounoUsoufpAihB+Lfkn0d/lT++XSqGm2V
         Y2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767821943; x=1768426743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oe6y0Hk3miqbJsVbXXA1o3qPTG2801+ju99fJL3aODk=;
        b=OmC9yPQJrnizdI5RawlnnHbrA/3n1IFYpdVhz/s/q5z2rnlySKwBur0bLuW6edBt6T
         GK51wvoxAqJj70Gp6JWR4Hta4V5F9fK00G/Rpmi4a2xTon34TaacoJduhTJRzu2dwhy/
         GglwCZ0Qfu5oEgxge+HrffOMWgxuVJlhnN43CbJttJCGrZH7npsPbQqzU12W5tFieaJF
         VT6YWGDJlvP4B1yV0HgM1NKNYJ2hH2luh+zNyHpKf9ZzgehTHOHJs8Ahs3ZFCZZfT/uh
         sihmLuuLuIsc8/Obu81EOkFmU1d0rTPFUA0qHJpGIOMINj2XZuXqPpTwj99XaiUOwEed
         WNAg==
X-Forwarded-Encrypted: i=1; AJvYcCU6+PETIk0vADtC3nuvDgH8vIvWS/w137hQF69yn9jDBBbe9WEhNCXJ1NwyGv9LerXorIFkT6Gf/WCg96iv@vger.kernel.org
X-Gm-Message-State: AOJu0YzYe9dse4Ys0/uo5AppxCWK7aeFbtkKtmC+VbPSVQ56A4cUdAZX
	MzeExsXdsfEV4JYQZeDeF17NSEPqWgQ7kvJ2FDZ5Gjm0VJZyF8+OXu8yBzgV0TPeavYsp3j1NCU
	GlU7ppcdDZ4qk3GqpdYgWdvIqd+av4sv19LiOh0+TICEFQ3PSBzk2OSY259Na4ePZAN3h
X-Gm-Gg: AY/fxX5VfvhSL0Bwu8Yf1u1jA4/fKrlaGsx3J59u15Yg/guFjrAIbVwhUNyjtpBuV+Z
	Tl2+M6evHZCtp6wS4+VE7E8smF/PUaXSH1emTBMSSrqBcr7AQmZRomoiTYvXBXSHpbTSILwGQ5D
	n9WEdsF/cdCBPNWTp4ifDEWZVJFD7ZwjKRxyBEUJALyBYHbJwuviQm5WXWM9ezDS33rIUZSInH3
	Cx0MevJzcBn9evF9ZaFKRWIH5O/5pkDzInJ90hCoskuaMvr9QS9VxPL72I7lWSAlK+NpRZOQEak
	shHBVUmmWB70Sqdq7V4V6Ea2J4uHdc0tNMG1P3kuceWzbrI6dRP8aiA+39Im/o7M1yOqweHxx7K
	KdLgjx5+xLYrRFyuRkKWqiRLpB7pR+QeoufQCMK1urclTWGU+Uen001l/
X-Received: by 2002:a05:7022:2388:b0:119:e56b:98a4 with SMTP id a92af1059eb24-121f8b0db72mr3330792c88.11.1767821943341;
        Wed, 07 Jan 2026 13:39:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPMy0/7sGW7SOXWkWu5udtx791GshH9QWhvKrP5TjbUf5GXgwI/jJsTLo1dJz50L5BXWzMqA==
X-Received: by 2002:a05:7022:2388:b0:119:e56b:98a4 with SMTP id a92af1059eb24-121f8b0db72mr3330750c88.11.1767821942546;
        Wed, 07 Jan 2026 13:39:02 -0800 (PST)
Received: from [10.73.112.254] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a5d3dsm7057862eec.13.2026.01.07.13.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 13:39:02 -0800 (PST)
Message-ID: <0d214cab-1844-4d0c-870e-13421f4b7ca6@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:39:01 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom_geni: Fix BT failure regression on RB2
 platform
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20260107162610.1582626-1-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <20260107162610.1582626-1-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695ed278 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ZHptVDrsI75BloTeMH0A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Igd3M24egD3S0vpqrbTK-EIiyktXKtA6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE3MSBTYWx0ZWRfX+BD7OzNJUdD+
 47f8XfFRhHIHB7xMM7uR17hxOBnUnZ5BVQdAVUNEsX9O/CizQnqxh5o5Lkispd85KzJLvQR9EXD
 LURwECYyt5ks7wKG7TWpym8y6xrUQp5rpTCuoggtgXz7ViXIRqalsqZT4da+eEuDWN/5X435Hzz
 JgunTTJy+m9Y7gGBn5rp8lsaK0q3QS+mgoS8fGNnRfTUAuBLPRUbrruHmMD5PBRG17OtbWkKczl
 He4BKY15x5JM1OrfKpMxACmTuCDHodo9q7aAf9eZF3hVIfhqsVtC3SoOlsu4KYvNUsVC+JdEVAR
 7gnwEUEmpAu56i+I05z8uI1DZfe5dkT0lUFGHfoz8TOmHJMvmXu7uL3IJJpkMlU8JxSHf2PA3Cv
 1XgHOTq3MDtxLAozhX3ceETGwGwFYCDmOddHqJ+fWpJ2ATahqHjNCIJYADMOJRwS7jnnp5XBYtU
 QO65p5vM3FGVapFaN6A==
X-Proofpoint-ORIG-GUID: Igd3M24egD3S0vpqrbTK-EIiyktXKtA6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070171



On 1/7/2026 8:26 AM, Praveen Talari wrote:
> Commit 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial
> driver") caused BT init to fail during bootup on the RB2 platform,
> preventing proper BT initialization. However, BT works correctly after
> bootup completes.
> 
> The issue occurs when runtime PM is enabled and uart_add_one_port() is
> called before wakeup IRQ setup. The uart_add_one_port() call activates
> the device through runtime PM, which configures GPIOs to the "qup_x"
> pinmux function during runtime resume. When wakeup IRQ registration
> happens afterward using dev_pm_set_dedicated_wake_irq(), these GPIOs
> are reset back to the "gpio" pinmux function, which impacts the RX GPIO
> and leads to Bluetooth failures.
> 
> Fix this by ensuring wakeup IRQ setup is completed before calling
> uart_add_one_port() to prevent the pinmux function conflict.
> 
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Closes: https://lore.kernel.org/all/20251110101043.2108414-4-praveen.talari@oss.qualcomm.com/
> Fixes: 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial driver")
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> v1 -> v2
> - Updated commit text.
> - Added Tested-by in commit text
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 6ce6528f5c10..46a9c71630d5 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1888,12 +1888,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto error;
>   
> -	devm_pm_runtime_enable(port->se.dev);
> -
> -	ret = uart_add_one_port(drv, uport);
> -	if (ret)
> -		goto error;
> -
>   	if (port->wakeup_irq > 0) {
>   		device_init_wakeup(&pdev->dev, true);
>   		ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,

do you need to handle error handling part here as calling 
uart_remove_one_port() shall result into NULL access related crash while 
accessing port->port_dev as port_dev is not allocated 
(serial_base_port_add() add is not being called due to moving 
uart_add_one_port() later)

--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1901,7 +1901,6 @@ static int qcom_geni_serial_probe(struct 
platform_device *pdev)
                 if (ret) {
                         device_init_wakeup(&pdev->dev, false);
                         ida_free(&port_ida, uport->line);
-                       uart_remove_one_port(drv, uport);
                         goto error;
                 }
         }

> @@ -1906,6 +1900,12 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	devm_pm_runtime_enable(port->se.dev);
> +
> +	ret = uart_add_one_port(drv, uport);
> +	if (ret)
> +		goto error;
> +
>   	return 0;
>   
>   error:
> 
> base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
Regards,
Mayank

