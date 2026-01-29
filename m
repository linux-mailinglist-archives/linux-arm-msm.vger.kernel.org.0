Return-Path: <linux-arm-msm+bounces-91167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ImrDipJe2kdDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:48:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A28C9AFCBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37A913002929
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C84D346A14;
	Thu, 29 Jan 2026 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l517gSHH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0YE3QMR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845EF385516
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769687334; cv=none; b=fbg83O1GAkBB78ufymP6S8PrSDo7edJtyCAWQfOEIzVneeRAKE6LNbQV/g6ckVLvi7G06enyBWJTxJsuKL5vvtYRDCzKs0W4JTv2/KAUh6MNAe7gC4kp6C58p2IBWt3zxsAz79QGCj9FLtZsWv+ssxVZx9uOB2X2ZQEoqo5rsiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769687334; c=relaxed/simple;
	bh=XGtEW9sYxxEQoEJ86svblR5vBIkLxNGxvEMFBIp++AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IKAyGTgkdDjR8VOZzxN+YmtOvolRC10aX4JFrV9DTwUVBbwkFJh8mPYnWPlHLRSenmp28ZzMu1FYZQ6BKmz/Bss5Nf0V49vRNjYtIbcC02mrd2EAcXIxXZz5wcbzR8LuDOzP7IIbk7nnFbb/nPLuvMTqt3FvgT9nEua6ck9hPgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l517gSHH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0YE3QMR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAQwh62501987
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KT3r35ycF4+0WV4x9asOenPmmgjU66IYBmCFl+LsQ8A=; b=l517gSHHnUmEKlFG
	zMk8IpdPpRaZcfcWD6U3gb+4JvEfK1Jj8W1g4rgmcuYNQMJVcrLriF7/ya9WHtvK
	A2M02/z1g7fDSlB0Ej6giLO+WImEzNAO3i0CD1cur5ddHlMvTDPqtFsb4ADe6Sdw
	ZWJZjkrL5NK4ppu+ERR02KYFhlk9hrqAV0z3qf9GxNfr6KhY+ODG9NYAuffqGlsF
	HuZ8T0WUaVtTCZiv4b6euako4T/WSnTO/GDj2PSX84YePQhjQBCO2WwDqOE0D+TK
	NOsY1Xh26PTpQeLpvk/qi8x6iH8TAdNeV5pOSKWD0gA+Nq2Xvnz/maCz4fGXAf6v
	1Fl+iA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05tbr7cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:48:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88882c9b4d0so2625616d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 03:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769687331; x=1770292131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KT3r35ycF4+0WV4x9asOenPmmgjU66IYBmCFl+LsQ8A=;
        b=g0YE3QMR/3wW1k50TGq0xtcb4Sjjo3CqrzCdkYiIOQzm8XNv9QDqg9YkPnYGwQZGzj
         UT99i6wooFeBIX+lvv/07kS5VEs3GYHO0+T0aDE5psVjnajoNGtWPy9qZPCfzOmqaD2R
         XPGZiGh3uDMLTn9kcM9x9BqY+q1To04EnY8Z8LtxtfgpOCjtMer51P9c656wqIeh2sdT
         C2TrlUHuZ/bNrtW5/5Qb5juL4LQ9MRhHUBCc16xD/9qNYLyb/R89L7+7dpGCXEiIjXby
         dD6+sB4kVAzePRxMNqXCm/LhHjJOvK9RPPCNDijFgBohEob/QG/zaLFBl0yCW9yhxLXU
         PlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769687331; x=1770292131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KT3r35ycF4+0WV4x9asOenPmmgjU66IYBmCFl+LsQ8A=;
        b=l/9q/LLe8vKW8+fnqobUj9DHOkK14R5cnMzy8sVIJ9U1+9oh7Y6Ki7cpGDMILitvox
         csUcKVPGKsbB6LZU8f9Y3u6zqv74YSStlbPr6wXCeuNbqwoV0PeYk2GaYro5mH8j8p2S
         HLyuLZbZk3SS5QkweQMW3SBxdoYnTYHMCHzY7DmrALTiF65tnKiJPZU8hMtirehCiac6
         q6IgdudfTjL4w03pk76oh0/W+h3eL8ZbkOLFL1LbjKpxABLogHgeA3e/G0QxWkRbP6Vt
         cKb3edrJCzM/JzQuyiTbhxEfS4XoHsgM4108n2ZbiSNOhXx9CnQ49UGcnlPWQLFoXwoL
         5aPw==
X-Forwarded-Encrypted: i=1; AJvYcCU/cvfoTlJjD9PyOc/U8MqCUIYu4jjjDfQ4rqFLku1hd4jcVpCVpJDzRgtKQpdjGh6dJiNKA6uczNdPL9SF@vger.kernel.org
X-Gm-Message-State: AOJu0YzzSb1g6VVZJw1GNr+CWIexZMa9K4URALJhX+2xi/AWka1WDC+f
	LfBJ1bcXS6sqwP7aeSmhc5CNOf4LozAnxOqHRjIcOYiwvHWFhNWlHul5RE1yFpOFoX9Ksvb6tki
	8Uvgz6nPnXBBBuFPlE5RaD4ps0qnJZk/CoBREy69s9jHvdKnRYJzYPTRMFZaQHxMIAxeA
X-Gm-Gg: AZuq6aJ8WdhL1BhHDiWRo5rgQt0QEXnG/K6Rr+8UisC9vAqTLkr5mp10FCWPxlnqxaM
	w+Hd2BK18RK5ZaHzdlfB8aNVNv0iIKN8uyJ4mMKX2p0fJne108/N2ZuWm3CDQg/SIl0vhc4s6Rn
	1n0K5XspRg2oAy9YUDNvKAA0hLzwzCkIxkvqoBjLL0cE+htI7PJfV0QUAYh3rqhVkJjca2YTSUx
	FsD70Gsr0oOzZXFQJsPbLrG2L72N80j+FkjXX3zNTXNZ6AJ0Uv6ZLNsypKByqeI4Sy/Ybd09lcr
	/N2IvPtBhMeATYjORajivzD4K6r6wSEV/5ZgiXGph0RKINF+HIm8BhwbNDhZy/iwwhJlrE3RS2u
	o5fgZS3QYK9kLTxFA/Gm9sg7adaBdubi6abEJxNuMPl6XS5lVOjo02FcIDklijXH44Gc=
X-Received: by 2002:a05:6214:600d:b0:894:6c97:691b with SMTP id 6a1803df08f44-894dcd48128mr40187906d6.6.1769687330675;
        Thu, 29 Jan 2026 03:48:50 -0800 (PST)
X-Received: by 2002:a05:6214:600d:b0:894:6c97:691b with SMTP id 6a1803df08f44-894dcd48128mr40187576d6.6.1769687330151;
        Thu, 29 Jan 2026 03:48:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4256a4bsm2782251a12.2.2026.01.29.03.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 03:48:48 -0800 (PST)
Message-ID: <0fddd038-185a-4cc0-b080-d12ba973cce3@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 12:48:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] spi: geni-qcom: Fix abort sequence execution for
 serial engine errors
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
 <20260122151008.2149252-3-praveen.talari@oss.qualcomm.com>
 <9d9d4d3d-42bf-4f4a-99d3-19df73f89c30@oss.qualcomm.com>
 <95bdb386-1635-4f8b-84dd-b5123d271b7d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <95bdb386-1635-4f8b-84dd-b5123d271b7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wgWfXrlMNcH4A8xspY7Q_duulSZDKhee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3OSBTYWx0ZWRfXyUUmnOIPsSis
 lXb96dsNCql6/KgAx6cnSlfbz7rC6JU8n8R9Xjf33g5/zGra5rXpTIwcan56/g9qEdtkaAKZqJE
 9iqztgSz8S/wgDseleLjmY4N37qvsdzhe04XlZromg2VQK0ysaMsgytsO44plZ24sykTbffiAK7
 kA5O2tqznorxYaBSBE0quc3Uku9xkUd3ofxaM8wXQBB3Z+03g7wfkHQ/2ryMATE5naTG/mKTX9E
 B4uPGgPjf6xhZxedfuaB2w1NNI5Y/wQzvymyn69GuWnw41ayK60pnBZ/rlL7fnnOwp4yLvARCaI
 3gWxekuEJsgFwUaazEWbWDc3NWIsvD2tdsmQz6qQtUwtVkHmwsGlsmRdKq3escsv4yKWGq6gXOC
 98c0I6bwfcI0DHid9DOpLsgo852pMjxuqmQjRULlPN+0ViVyekXs1Sc+Lukvkt/ZFSvRSR0AVAn
 PEGSkkvMiHoG/1HnwzQ==
X-Proofpoint-ORIG-GUID: wgWfXrlMNcH4A8xspY7Q_duulSZDKhee
X-Authority-Analysis: v=2.4 cv=betmkePB c=1 sm=1 tr=0 ts=697b4923 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0IK_tM0JmRZ4naO6_g0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91167-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A28C9AFCBD
X-Rspamd-Action: no action

On 1/28/26 5:22 PM, Praveen Talari wrote:
> HI Konrad,
> 
> Thank you for review.
> 
> On 1/27/2026 6:47 PM, Konrad Dybcio wrote:
>> On 1/22/26 4:10 PM, Praveen Talari wrote:
>>> The driver currently skips the abort sequence for target mode when serial
>>> engine errors occur. This leads to improper error recovery as the serial
>>> engine may remain in an undefined state without proper cleanup, potentially
>>> causing subsequent operations to fail or behave unpredictably.
>>>
>>> Fix this by ensuring the abort sequence and DMA reset always execute during
>>> error recovery, as both are required for proper serial engine error
>>> handling.
>>>
>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>> ---
>>>   drivers/spi/spi-geni-qcom.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
>>> index f5d05025b196..e5320e2fb834 100644
>>> --- a/drivers/spi/spi-geni-qcom.c
>>> +++ b/drivers/spi/spi-geni-qcom.c
>>> @@ -167,7 +167,7 @@ static void handle_se_timeout(struct spi_controller *spi,
>>>            * doesn`t support CMD Cancel sequnece
>>>            */
>>>           spin_unlock_irq(&mas->lock);
>>> -        goto reset_if_dma;
>>> +        goto abort;
>>>       }
>>>         reinit_completion(&mas->cancel_done);
>>> @@ -178,6 +178,7 @@ static void handle_se_timeout(struct spi_controller *spi,
>>>       if (time_left)
>>>           goto reset_if_dma;
>>>   +abort:
>>>       spin_lock_irq(&mas->lock);
>>
>> Now that the jump is just 5 LoC, you can dispose of the goto and change it
>> to an if-statement
> 
> Is the modification below good?
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index f5d05025b196..4feaf24d47ea 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -167,16 +167,15 @@ static void handle_se_timeout(struct spi_controller *spi,
>                  * doesn`t support CMD Cancel sequnece
>                  */
>                 spin_unlock_irq(&mas->lock);
> -               goto reset_if_dma;
> -       }
> -
> -       reinit_completion(&mas->cancel_done);
> -       geni_se_cancel_m_cmd(se);
> -       spin_unlock_irq(&mas->lock);
> +       } else {
> +               reinit_completion(&mas->cancel_done);
> +               geni_se_cancel_m_cmd(se);
> +               spin_unlock_irq(&mas->lock);
> 
> -       time_left = wait_for_completion_timeout(&mas->cancel_done, HZ);
> -       if (time_left)
> -               goto reset_if_dma;
> +               time_left = wait_for_completion_timeout(&mas->cancel_done, HZ);
> +               if (time_left)
> +                       goto reset_if_dma;
> +       }
> 
>         spin_lock_irq(&mas->lock);
>         reinit_completion(&mas->abort_done);

I think we can make it even shorter:

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 231fd31de048..59567ef6759e 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -161,25 +161,20 @@ static void handle_se_timeout(struct spi_controller *spi,
        xfer = mas->cur_xfer;
        mas->cur_xfer = NULL;
 
-       if (spi->target) {
-               /*
-                * skip CMD Cancel sequnece since spi target
-                * doesn`t support CMD Cancel sequnece
-                */
+       /* The controller doesn't support the Cancel commnand in target mode */
+       if (!spi->target) {
+               reinit_completion(&mas->cancel_done);
+               geni_se_cancel_m_cmd(se);
+
                spin_unlock_irq(&mas->lock);
-               goto abort;
+
+               time_left = wait_for_completion_timeout(&mas->cancel_done, HZ);
+               if (time_left)
+                       goto reset_if_dma;
+
+               spin_lock_irq(&mas->lock);
        }
 
-       reinit_completion(&mas->cancel_done);
-       geni_se_cancel_m_cmd(se);
-       spin_unlock_irq(&mas->lock);
-
-       time_left = wait_for_completion_timeout(&mas->cancel_done, HZ);
-       if (time_left)
-               goto reset_if_dma;
-
-abort:
-       spin_lock_irq(&mas->lock);
        reinit_completion(&mas->abort_done);
        geni_se_abort_m_cmd(se);
        spin_unlock_irq(&mas->lock);


Konrad

