Return-Path: <linux-arm-msm+bounces-75670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C17BB0007
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 12:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBA9F1894D60
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 10:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE017275111;
	Wed,  1 Oct 2025 10:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFYnG04l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB36299A81
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759314400; cv=none; b=ByhfdKqI6N4tqfg1foD1kI1PzIgRazRWWM9ivLcFk1YdNt0uH7dv1lsZc22V7iK//LrBDOVQt1p7l7/O/RJ5Pu4AjwCBmskm/EYkgsPl9vj/ZWSvc2ZA2qEGtFIyRD7SfCJKdGZCzgivttejd/72X8AvvbCLXSqfaZcUDCR1NPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759314400; c=relaxed/simple;
	bh=P9Fi1ljGmUThr+8jSoJFfTtVJvJR05niVpmpkyA/Ack=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tF8M+/MZzOA5L6VLxSueuK8n9ahU5dkxKD1WaJWwXzw4wPRpVIgV95MQ+F0QFRfUKrTwe5fAyywomTTfven2svWL5a2CbtFBejrLwCFTdtro+TaFVDz2ila4czONDXOYVEbYSDCsmFYKOAMaAyyTb8cT1+wax1etbLW/co+7CyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFYnG04l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59199ZWn030612
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 10:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DoYbUoPn5h4PTq/YMlb34TeBwVEHQG0ctNULUvqXlU4=; b=dFYnG04lUAn1n3pJ
	kr8Lw2MzF2HEuD3idQKToqoMGycgOC0qh/5s8xl8OtIEISCDnkGm5VF++zLZ9hCq
	TmOTmb9jZOg2qg9DVoxZG+CDxF9EnH/ZET9FKO3TMFUP6xYq7a/3TarviUNU+oaw
	DnPWz432ZOZ4haFZnglikO17pBSZIuGh3x7UHckGZ5jLjbJUc95au523eiaRJZFM
	/zelny9foSERCefZ98ZWPJjLqiLuS1j6Zv43G4QfA8uFZSmefmn5K7aD1Gsz+f8p
	KhgTiIEnvKCQD2D1BHyHEgPeDb+3ErQqinndDsPyAgFw0+n0FGzk3iag+k4HYXYE
	DVPc6w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdkx5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 10:26:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso5743064b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 03:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759314397; x=1759919197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DoYbUoPn5h4PTq/YMlb34TeBwVEHQG0ctNULUvqXlU4=;
        b=ZBNRU8+N9AHG0fWQTCVLqx/wxIiqr/qRQLYF78/06IKxaEJqfFl6jssSQI9AtzHVOA
         Fi35fYX9w8oiyxnWClM3GaeD91WmdONnG6BEzHW6QfgkHlfHkNPhue6X0157B2Kt6e7y
         AxgnU9xnHtMeHKYJ6jIJHnPclosi6+Ew6Sve/FYragSGyZ+cb0UBkPtHDf+91MWsFkCU
         Yd0xUeym7AL02KQfyuFhsK9RZC0qxiojSqAzb1qcAfWNoMA7Lh3lU7VIoD+3zIvlqH80
         WK7TgC3221954/5AqkdhvUYvmv2fzhaE6uJKppVpdAHWd/YqsAJlD/6u6kUN4rqTAzuC
         /Fig==
X-Gm-Message-State: AOJu0Yy6LEJOOFoJVhzDYRUG6pepVmWf3T3GQ5RRZ7QJUb2e+ng7k329
	10c2+5Ovg4gN5eYn1nJx0dzBdPMG83uE/DoYXKVJe2x0qvklkjeBU+DxMeYDU3op/rgusROlmqb
	Qyvmrwi9+GEtOyFyjZNPwI12y4KouIXkHZOsyKTJKw9vHLCQgDYedMAlWkJVo01cyXVFTmL4MRm
	dM
X-Gm-Gg: ASbGncv8vD1SS1QBnRdMR5iqZJRX3ynTats6fI+bd0kHfy77enPN8IGBo5vhm9CgV+g
	fwhyMHn687QL5sPQemy4UjmAMB0TTK+ODzD3yYvBKyA2lEwSZUa94pHJdioC0RzihCaaXauMs46
	j3OtiRld4tLoRePxturI0ae5wZxwCd/kZIWJrspOwbZUs3i/tOCLOMFrmxA2bUXrUd46hhBC/6d
	ndFy9yFx5vgqKZJR6sJoQSLAwAXCoKqKcqrrjtJHc3DS6P4PjPpAmRZc3vYxp3AqRQMr5ikQfDu
	xwvu26Kez7GhkRa2jzEKR1M/GEcoqfbWZe3odBl5cPdsvgMKgp5omKqFGhT1Qv4ho+UBKkm9xct
	e+qyn
X-Received: by 2002:a05:6a20:3946:b0:319:fc6f:8afd with SMTP id adf61e73a8af0-321d8b06ce0mr4302613637.6.1759314397524;
        Wed, 01 Oct 2025 03:26:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2JF9jYAQs7P21pVRc4kQw9xYk9dAr+RziIcU6cRwEF5tEhV4BHPHR4FxDdHvAHzFGnPlBNQ==
X-Received: by 2002:a05:6a20:3946:b0:319:fc6f:8afd with SMTP id adf61e73a8af0-321d8b06ce0mr4302582637.6.1759314397056;
        Wed, 01 Oct 2025 03:26:37 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c057ecsm15876881b3a.80.2025.10.01.03.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 03:26:36 -0700 (PDT)
Message-ID: <671c517f-c04c-4f07-aa65-a93e1e1dbce3@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 15:56:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Mw5HoxdelvssP1DZXTOuIaUZ25gMIahH
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dd01de cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=fvgdV2PV7z-sFcuOFeoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Mw5HoxdelvssP1DZXTOuIaUZ25gMIahH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX6BANaf9WkRD/
 NCWAzumWA85OVf8yrl7rpQD8Vq44/hKciRqQ/ce69cQ/D015IYaQy8ffy74aWzrNXc6YmCaUVss
 U3blgDLV82M1UgeWzo+udsHDcRuqoZK2jCpPJ26bdZKRDwuN7cs19ctnxoe57kbyhmcRfD5vdmP
 j8RHnZwUQkqvraXGIfl0TYLXkOkyIUsZFXOLZ0JqlGpbTelGsQHLwdm2Zt8CZJ4jOhXgIB/swEb
 yu6NXSfmny2WgaeP4CxWsBcL1xYDWddCU+F9nfurkwIkeN8zE9v/UhNhagfJPZ3kcXSjxj7SORd
 bBM7mA/CxOW/dlN9pEwNGzxOXtHLHHtNPbEqVJ5iQ71sjAWJFaNnGJ9ld5KCcxIUGAofgEZdGjS
 HSS5zPcJNjuRAQsj8NNp/MHKgc+LSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036


On 9/25/2025 5:30 PM, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
Reviewed-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>


