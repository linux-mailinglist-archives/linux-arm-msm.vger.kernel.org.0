Return-Path: <linux-arm-msm+bounces-104664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAgZFYIq72n98gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:21:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEACA46FC9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF4E93026AAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A872E3ACEF3;
	Mon, 27 Apr 2026 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXivKJ4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDj4a3Lq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307883B19D5
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281533; cv=none; b=JRW4+jNNEmr6marDj9zdUg8hWm/mDOsta1kPe05uy60MP20VY1aqO0+3kZMjxhvrd7Xz8tKUkeAiIYhxz7j3mMwpsBXDb+Bkf2hOHwhg7G/qRgxFmRQgUJm9UCAQHoU05CFzjbPoU7s+OnQoKW5vbQguWRJsirr2mzSynRPS/4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281533; c=relaxed/simple;
	bh=iaihpzmQLJaEJXDgYPIIeQD9PzsxKMVKLHW33rYRxrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HEIFg13nWr0YiVhHxSqNHL8uhIH53YqyyeuopntoNeWSUZ0LNfUh9v+G3Z26TqicGVwP6+IFPTROZFwDuriBzsjne0bkCQzHF2aLtRSajWkoA+PE27abUZPKCQv22oEGK5z9/CU+/rphRqJwzHwfadP9hK0V5wpMSxo8MngIsRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXivKJ4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDj4a3Lq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TGeP3682620
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+NhQmVODRKthYAjn4FjHgsGJoSWaHBLQ4E9hxLiPbk=; b=OXivKJ4XkkXaxrPd
	NCq9XPIVlvABrqfc8xHO+CvO98Pr+FwOfAPHhGhfTQpdjbo2EctfkKDwr1UmSjZ1
	GBnQ8LHQEbBxIJ5Pe7vD0VKQDZh/u4umFuMNsXFxC16G1oKvJjqShWGQDhisG8e1
	zVCtpCdbDleuT1WcUc5Vd/s8bOC5ctfnr1kiSFE6wuj0cg+aWWqV4XtDPOm470kD
	OyDsU0q4fsLCI601eluPgGDyhl3IxlD+n7a3UjVkrTlZBF0hcIf8akNkR9oWBYHc
	VlDva07vjAsrBEJmXMlFc214tNPjlHB5VC3kB1zm7tmW+rAeP78MkJum6iDwiRHH
	NdvP7Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr5dj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:18:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbb5779e8so10810950a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281529; x=1777886329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+NhQmVODRKthYAjn4FjHgsGJoSWaHBLQ4E9hxLiPbk=;
        b=PDj4a3LqDwoXUXCwQAfP5HM+Vqwl2laKaJ/JLB6FzHLYOlfpy6QDSNvSsm/miOk6HL
         Zj5XbDAP+Weu0wErnex8BafpX3l9d5eZfMRJJInGzgfi8b1EZlRIFmwptFHLTFlSnfii
         0GhSMmr0tlVd2l6o33YoJSh7nHcGhCmaJFe/W8YGKh9fr0a8QpgwI+i/dSx29B6Xy+Ok
         BVs7oS1Sp1AoC7brF4ttY7Vd0ygX8Cc9ffMV2EB7xuENY/nT+3zCFGRGH032u8GfWUtC
         AnYnvnwXnEeJgdM+sVsFuCgX74OZsMPhlfhpYud4RrtPY19YyOEEfC5bSt7V9iJ689ns
         W1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281529; x=1777886329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+NhQmVODRKthYAjn4FjHgsGJoSWaHBLQ4E9hxLiPbk=;
        b=mNX88DzKpn1dCd4QrrYjLO8rFOq5nqfg+0qYZwKTm286LljV2glEyymoe278yPaLBY
         L8dUlU1UcRti0wTP0kdlvtoNrcfMn4tBYE0B6VJwdPGnX3k3lvrPEynLVHm40vBsRwdC
         tA/X3UOj6I02rbjwSjtd5PEaiFGvxM1JrcMCTCLQ6qQcxMCMZhnYKxBu2SdA2R2aI8dH
         FVxIK0ODPxJQFPbOTdtZ/yAHqh5o/OlWDncj9iXZEgNqlAx9eoS8uHnkt1rO5EM4Z1i6
         XCLugSC+qOSJ7dyaG3iIxLmLeuroXeDLrf07/AW/ikyc9ttCNUXSdv0io9r/Fn4+5FJY
         HhBw==
X-Forwarded-Encrypted: i=1; AFNElJ9y76xT5Rkt3tKCAh+tNJRhh0GaNX6tck3RQc9uxYLC+GTn2lJscYupKP3QrdZ4+9M41P32I0kBka2afd5X@vger.kernel.org
X-Gm-Message-State: AOJu0YwBH1NEg+Q+nv7rwS3RZEjQI7U2dODwQXnocKN8hrvkGW8J4Sbw
	MqaazW+iLUMb0yVe2B+nNvWKd6yd/YSa2Ue/AtZOs4AIaWTlXMf3JGkRFgKQ4YbKLafE0OnpXlb
	hurm2DKWe0vCeyOXAqYzjDSSkrQte1JxzQvrK0Tyj376C+mVl2+bpu9yi2fYRg/7aqLO1
X-Gm-Gg: AeBDietlf6AxYkuo73WfmLnBCKviTFYF1vfx3kCcv/jBCfc74d9fjq7pQdtbegzhCsZ
	KC0Cl67w7xpRtCaGrW5uaw6PyD3Oj/PupHJKW/J110FukLs7c/oTboUmiN5WhjhfxncE1Qi6LIW
	C58GrQFJm+dLZWXsKqCu3ec616Zi/VFxU5hCzGfMnYTJJ4aOundF37yrAI39jb62duU6blTtflq
	W+5j57/aWx6JVw7MXNvkW/4YpA0w+XYowPl9JDwd+kyi0RsqZA6IMSOYonCaw/wcLsZiEZx/rj8
	dkB2aEZ6MtTZpal8MYfd/zFF4LC16EIJagmdlggI5b65hHnkvG66WVUgnpyGsPGNxKlehVF/mm/
	WGS4M35yiIn+bQwnCxRc7dXfmfYGHQnP5zVLbMISXFBLWQ30DBEDisO/1kMtMIAo=
X-Received: by 2002:a17:90b:37cb:b0:35f:d56d:1c45 with SMTP id 98e67ed59e1d1-3614041bc7cmr38625200a91.12.1777281528909;
        Mon, 27 Apr 2026 02:18:48 -0700 (PDT)
X-Received: by 2002:a17:90b:37cb:b0:35f:d56d:1c45 with SMTP id 98e67ed59e1d1-3614041bc7cmr38625158a91.12.1777281528337;
        Mon, 27 Apr 2026 02:18:48 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613f56ecbesm11810292a91.0.2026.04.27.02.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 02:18:47 -0700 (PDT)
Message-ID: <fcba4863-2e09-4326-ba39-b60ec8788420@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:48:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom-geni: Avoid probing debug console UART
 without console support
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, anup.kulkarni@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
References: <20260413072501.263871-1-aniket.randive@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <20260413072501.263871-1-aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ef29f9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8N2UbNoKPs7AJDuX-gEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 5FFt-u-DBaX1D4Xz2KTHRfQpgGgc768L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfXykOK2TrdWEGD
 pdEJXkTya2pty3yWLmpB/k51xw37yxTTcV+J/w71aLwOyscnynZ/RZg0kYxiSnAuv98DF7M2vVs
 UJmRk7RsybCv1j2+DCYgpKh1UDl+jrWnLI/ENNDXUr4Jy7lKMxgf9zAHoT3n1EGBnilru3CHSjj
 sD5PXka9ZlI7IraJ06vNNcT4RhYlMh8tl6Kk7TFC1wPS3HhVylaIdInm+tEUtaMe8mdAHt8oEnq
 zyWnAA7TQIA6UDRgJypvmUYoE9aE2PYCtKZu71G9MLzFeOw2Jj6Vd0BPCL1/nC4s5BzUnC0Iecd
 I3bY8JgTE3YAm2ktHAUQ1xZmHmOJODfpITUdYbyZkvKuTiddwUotPt/16E5ed4FPF60/tufJizy
 KvTAk4OXA8k71cFt6Lt1Wxw5X+RYSumhRWm0JD9u2UnewCPqH/XrPbpCfw7Nc/AI5f5YKeMPmA3
 DlQbmj7lDr3PuXkK9cA==
X-Proofpoint-ORIG-GUID: 5FFt-u-DBaX1D4Xz2KTHRfQpgGgc768L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270098
X-Rspamd-Queue-Id: AEACA46FC9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104664-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]


On 13-04-2026 12:55, Aniket Randive wrote:
> When CONFIG_SERIAL_QCOM_GENI_CONSOLE is disabled, the driver still
> advertises the debug UART compatible strings ("qcom,geni-debug-uart"
> and "qcom,sa8255p-geni-debug-uart") in its of_match table. This lets the
> driver match and probe console UART DT nodes even though console
> support is not built. As a result, the console port is never registered
> with the UART core and uart_add_one_port() fails with -EINVAL.
>
> Fix this by only including the debug UART compatible entries in the
> match table when CONFIG_SERIAL_QCOM_GENI_CONSOLE is enabled, preventing
> the driver from probing console UART nodes when console support is
> absent.
>
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 9854bb2406e3..b756e0c07c16 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -2039,6 +2039,7 @@ static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
>   };
>   
>   static const struct of_device_id qcom_geni_serial_match_table[] = {
> +#if IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE)
>   	{
>   		.compatible = "qcom,geni-debug-uart",
>   		.data = &qcom_geni_console_data,
> @@ -2047,6 +2048,7 @@ static const struct of_device_id qcom_geni_serial_match_table[] = {
>   		.compatible = "qcom,sa8255p-geni-debug-uart",
>   		.data = &sa8255p_qcom_geni_console_data,
>   	},
> +#endif
>   	{
>   		.compatible = "qcom,geni-uart",
>   		.data = &qcom_geni_uart_data,
Reviewed-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Thanks,
Praveen Talari

