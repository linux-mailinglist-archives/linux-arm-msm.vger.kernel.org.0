Return-Path: <linux-arm-msm+bounces-63101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08827AEE5BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 19:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39CC5165672
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 17:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99C12E3AFE;
	Mon, 30 Jun 2025 17:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsn8DnSB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436B42E3AEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304362; cv=none; b=WM8Hc4WUhJfCrqlAI2e2sDmt61Y8l4jqnxlR/pFCbVtm0QjDEQ6R6W7fShIfqbK4zpj+kb77nYZQ7eIJrg3T0LlOFiVjMjUtgsQSljZm6wz1GlxNyWR5/pK59D7g6scNz4gmF5crvoP2/n0fSIzy6XOgvmunr/z2tUMMybc3Jn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304362; c=relaxed/simple;
	bh=RKLmE9OopTDP3cDIv9UafaAGfHR1Ncw27fpbfMQVZW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQaF4hqjdUAoCyoIUVFphgIWiwBQodvGms9nCBG4S44AeGnTCG0r+sA22lvE8omTKz3LMDuTOyzuXywD82phK0YJmDFpLyKl9JG1M4Rd52p15ZHwIM5WmB7eHgqSWYp0kjK/wm3LBuH+A3JqN7pjG7xfli4SYRKXmYa2jsk/Ido=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsn8DnSB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFDV0e032399
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 17:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eb6RGBwtGwTEMjhKa7qwq8iOnfUnQEEqOjqHkByNNI0=; b=gsn8DnSBJ2OPHHDp
	pIiMKixJUsPFbU62X1TjUACSHdNrR4nact67Luyb3HHbfBkCQIvHYpTdZAwRR/ph
	4lofHxFzd1RJ+PmwOAjS9mR//u/8pgFj6sieW7zriSUOS+0s1EoqUgGP3ZsZRmkI
	Y4wm/d+sHKYSR4+2AUDefx4HVNjh7vGMI/JMU5sqd1F8ohllqTzp7lXJnzpgQeJB
	fWiLiT0nZsBr2R2Dh4oNfDxZXHenL+dNvznHgDweNQG4oNb9Q4SEJEZ0LFa580ku
	1sgjB7OPkfFS/joI22vFNUfWccgE1q6GQ2DDJzrZ3TWyyRf4V66jVzD90xYjus+Q
	Y68R5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k5tjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 17:26:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09a3b806aso108388285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 10:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751304359; x=1751909159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eb6RGBwtGwTEMjhKa7qwq8iOnfUnQEEqOjqHkByNNI0=;
        b=UTRlJnm6cvI/eMetQ/8UnEi1CVNXsD2gvFtcY0++q9EZPXynDYEfRXTEFH2E3Onkgh
         +rD8stki+RcRATd0skhzvcC5uCvzToVwtvl0iazNuANrESPS1tgLwJhFacRCif2eCbQc
         ryGw3x1CPScQZnfMw9Dy0H2HthWfwtbs3mc8ZbdvILU2EgwOrgqoxEf+9Oha5/mg2kB3
         ylf5yhwV6ILQdM7xT/+YS3fe4g1ktDu/dTGg1vnSOOymLlw4D9IChSMoL04lC0TooLjD
         vS8ArJOIW8pf2HBh6Q7nWUwCouwxFpwPXFwnwfaeGdZwlQ22xbUfGmwjN/N58Ct3Eyda
         +Brg==
X-Gm-Message-State: AOJu0YwXbuaNapp4+Fh77zAHg1SW25rQimP1ohQEKg59umsDn+nssC7L
	OUmJ6M7oQoj+mHd8c786znb7ZJtqFFyJEDMdfHGMnam3IHGd4gE82nMzX4NbtyP1zIG4hVafIhF
	eJvSQ0t/Ikr82eOZ1vE3GPyQA+QpqIkTd1l3uFkLTmfz8g8JOtVLRRa4OD9CuJZorfNOQ
X-Gm-Gg: ASbGncvNKHqur/V038P3whS17Mq9qJMwIBqX2xGnzVxGe/zkRmAiWYaF/jM+4e5HFHh
	MI9Of3YPuAGzZEDCviaOma+lD32LpdB+4DDdeBC6reF6mMVUtinOrqm1qx4jQUWX3n3Xu8oYHzb
	GOP5jeo3cKjV5lagPn29F0YViUOKYbgqb2TTfe4dgZTe1t6KX1YubQslNXlTn3XBWH2pjgVSkHA
	OP2u88lrYxDrTIRbG7NqZ53k0vjfyFt50IZWfQk8oIYKJJ80QM5996Rky0Y48BpfsW5s3pdwr0M
	hmY7moIsVfpOEgkzZ5knvk4v1WC1btBgs9J/W0kGD0aX1+vQy4uz/ocmytgU/M1WsJDEux9DNhs
	EXwiCthtJ
X-Received: by 2002:a05:620a:248c:b0:7c3:e399:328f with SMTP id af79cd13be357-7d44c26d063mr463619285a.11.1751304358929;
        Mon, 30 Jun 2025 10:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb9DlBcpFd5BQk8Ta6Hv/aVwuTAid0h9o086ihbCHZUqtNdSGoEN128bZOwaskTt3wjs5XBA==
X-Received: by 2002:a05:620a:248c:b0:7c3:e399:328f with SMTP id af79cd13be357-7d44c26d063mr463617485a.11.1751304358317;
        Mon, 30 Jun 2025 10:25:58 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01620sm717355666b.103.2025.06.30.10.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:25:57 -0700 (PDT)
Message-ID: <563db91f-3080-4a45-ba0d-04f415ed90d9@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 19:25:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end in
 _driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Agustin Vega-Frias <agustinv@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6862c8a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=IpJZQVW2AAAA:8 a=0kSur1atOiepxKs-vqsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0MyBTYWx0ZWRfX+flmrl0Qd6vm
 VUuSWCaxUO5+/i/hqzpefLciJQYRFzV32/9G8Ft7a6CqZCsL8FVdIrOz3zhwuj3c7BemUZ/eWLg
 7V/X4R0mhYLSdQy48VWCvKpDAz1CRT7kjfbcwpYnYDdWZ9aBTKr1GaCjekwd0myHZWgnJlM9uVB
 +Z6E0VMeBBAw2hSgabQ0eujp+S4+Dl5FloGZFmCEsliRT4TdaGW8tLDa1TO6rtiGtKJD3NdLL6t
 C76LXqcnNH0oe/JF83zUXVUMm9pTsYmQzcw1srgk18u8B/X22xA3P9mkZ4DfUsLoHGL0IHMtY/R
 XMz9iLWRKO36s8aDoyeCMQJYQ+1+Qu/4OkGrm18eeXf3ypAoMbvPeBQ/ZL8NjZxSLhQijjL+g51
 9K92xMe37Y18MiLQl7OP11+/Diw88wyUCosPnAQ5mM+6Qj+c0eBU8iZXZ4p+zb2FZ/2JqONk
X-Proofpoint-ORIG-GUID: Fwr7m0wKdv2cAMCIwIhmC7mRh-0JRk4M
X-Proofpoint-GUID: Fwr7m0wKdv2cAMCIwIhmC7mRh-0JRk4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300143



On 30-Jun-25 19:23, Uwe Kleine-König wrote:
> The modpost section mismatch checks are more lax for objects that have a
> name that ends in "_probe". This is not justified here though, so rename
> the driver struct according to the usual naming choice.
> 
> Note that this change indeed results in modpost identifying a section
> mismatch in this driver. This is not a false positive and should be
> fixed by either converting the driver to use platform_driver_probe() or
> by dropping __init from the .probe() callback. This problem was
> introduced in commit f20cc9b00c7b ("irqchip/qcom: Add IRQ combiner
> driver").
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> I don't know if platform_driver_probe() works here, it might happen that
> the driver is probed before the matching device appears. As I don't have
> a machine with such a device I won't create a patch fixing the issue,
> but if you have questions don't hesitate to ask.
> 
> Please consider this patch as a bug report and better only apply it when
> the issue is addressed to not result in build regressions.

+Jeff is probably the last person on Earth that officially has one

Konrad

