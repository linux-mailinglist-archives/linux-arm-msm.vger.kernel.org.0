Return-Path: <linux-arm-msm+bounces-90772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIoGHXu4eGlzsQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:07:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C32A794A67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3C80300A3BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD243559DE;
	Tue, 27 Jan 2026 13:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDVdB0Y+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="auIvvF0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2C23559FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769519186; cv=none; b=MWKxQ3XKzy4lEWKaIhcqo2X3c95YZ7E8druMfQBQhTPYfd0seTD6l574mrU9diakozEfwuj+t7jQipCcVgUsGBU30RwjZIEoBqIrYmvE52L9U5Av8bxbd6rQ3/woYRBI4wC2pN6Mr/K5SeXxph2sqGK940qInBLERFDQoYNfcDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769519186; c=relaxed/simple;
	bh=jgA/Uujf10BhGbOSNIE1krgPvsTZ8w0jjl4lzAXYgUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bTMYpGK2K8rXyLEsuDEfB4LPtSC+749a+QpmFjH1v/Val4s+QvuV3F9e5KPLxjY+Slf6+GXnHYhjPM/A1KwjI5v1+LgiNYDxisC+/ZhVYSHG2LhYZ7kpxhiAticHihSmO+qBASOnoBi3vgjDdfrZneWF4htnjZBHJTxn+6WUOUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDVdB0Y+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=auIvvF0J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R9hPYA786325
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWLo9Ea+3GkWbisbwaIrDxm7iAQxoGZnDo5vW6pC4rM=; b=YDVdB0Y+tXBhgd7a
	VPs+WZnJhyirwInsxyHT7uC79jySmwLuVgDU5pD2HFTE/YnLwOYTrlqvywJ3y9dM
	nDVX+VnsF++5AR927VsHANK+o17lhrJ8C6cCLowMix4tKmGryfAEEhiQZVBDaut3
	VD84J2XJUujWy7+OhMKzmvoyBBQTgEMMcvxFahxUS3F5LRDzaeRKhWfvdkePb6GE
	sD7z/xUqIkq1JR+gStvuCJN1TB9EgUbmFqsE4C+d7dcIk91/z/sJqWEb3yhvoirw
	Lw5+ENRIpzDzSVEAkL/IoFFQaOJX+5J4iFGQg4QrKvzS0fiQHjiK2LyptKDVKEvv
	cttsRw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93jms8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:06:22 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9414fc8eb29so1272562241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 05:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769519181; x=1770123981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EWLo9Ea+3GkWbisbwaIrDxm7iAQxoGZnDo5vW6pC4rM=;
        b=auIvvF0JizUz3xx5qp5XXN8EmLsbrJOdkg7dnk0OEI9FDxUhGQBkGkwQEU0jqua4nt
         JP2GOL6lmXWe4kXRCFTYVS3YBzeAVuX3o6bpecpEWah/rY9EIVaT1LC0EQFeUEH3JOZ9
         6NYCGZz9ldwxhy8tFUddSbKFg5AgGbAhRSMbPl71ctgYJqJnMEaw/VUty7povi5zZXiF
         k6jfTyXcGa/mswn2VJcetUb/bfMKjAhUgImVxuAW2a/grCyIrSF9slYkOOly47zR1XZe
         2XBxF0ZMtsHMRe6jhe5ae3oWrHdkoWyz0JcO33OVKf0i0IqV2cPN57bQKebnWh7bje4B
         oHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769519181; x=1770123981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWLo9Ea+3GkWbisbwaIrDxm7iAQxoGZnDo5vW6pC4rM=;
        b=t2jxQcfwFvyYt9qgI3zRaGH0pPpgqA8lWcThJ+9t3g3fKppSab9HEDrZwK0IqJalhD
         9pkmUa3w1cm/8/Vo75huaibTZyYFRukqPWqS24otYBrheoVmdTYvFeWN2yTFbvG0TyT/
         wzpvY0w1rKiBUoDzbOfMQ7N/4K8q4uX6FHq5nVC2pBnBWW20zyVfm5zYULzjCJ0BBfzA
         plP8BMwCcKolfVJh+0EezD1lNsm1z9Y2wJiBNTIr//4iO+NHK6a6ewoOTipXAWcHHInw
         Zfe8czRnlJKFEES9APqwmBo49lBHrb2jRtlhI7N6I0Tk3K5iarlvulYhmbh33d5J/w+R
         xr4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQdn22ISQaReEDP6mkThG4EUr7EEOMKzaI/YfftY9iHXTI7hi/mULbjawy98+Z5isBzDmLDuIik02dPfRc@vger.kernel.org
X-Gm-Message-State: AOJu0YykD/k/+0/eZ7otwpoqwpyhNzgWv8H7FJdyCbqLl5rwBBQYSBu+
	FktDRMAtAKTDEF6pLrA/PTh3+f6HuJ2CNLITXppV2HApgGeHwERm3pJqBocAHVn55hj1zrOlzO0
	eWTr/PH8bPNFb4zSZ6mLa/XY64crplZuxA3uCWfuafGLWyo9Cf1VGQYhrKEGbXg2v+/Ns
X-Gm-Gg: AZuq6aIHyxpBY8c83mFHRSTqaQT94zJ8fuEvryJrvk6+fiyPTbZuygo1DiF0Bk3YNQL
	h9ajwy2Z9grBb0UwfzqUbRIOlTY3pdEcIpVPvh6+HDXQeWzOM2yxYcFXJ7uBpwcMTap2MT544P3
	Ne6FkfGdEOJG5FGS/zCRDJg6SLIjVVsN0GqmSsp8vVvqPTlR8rkcTaDalhC5jJv0IswDrd6dGk5
	clOeRo1AT6+flafM6j69hiQC44k8I5MYzvHkDeRLwIQxnVDo7amsa5r78KV5Fwnpy6AN7wG0DKG
	Dc8ndoseThSmH6ol0YWP6qcz0q0rU1lQdPD8LvQKLug76phajJ3TxbRP347v38p7m7D/P3PuYoT
	H7RAGBsGZ4JLhAHpMw34kiOqgVRVwDXHeLKKM0Ov4O0YzZAmY+sbIaxWlR0as9dY5dQA=
X-Received: by 2002:a05:6122:91d:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-5667935b4cdmr288169e0c.0.1769519181380;
        Tue, 27 Jan 2026 05:06:21 -0800 (PST)
X-Received: by 2002:a05:6122:91d:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-5667935b4cdmr288151e0c.0.1769519180836;
        Tue, 27 Jan 2026 05:06:20 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b92b98asm6147030a12.19.2026.01.27.05.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:06:19 -0800 (PST)
Message-ID: <6498dc50-c08a-4416-95ff-06a8ca7db6b0@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:06:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: Vladimir Lypak <vladimir.lypak@gmail.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev
References: <20260126235018.969140-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126235018.969140-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwNyBTYWx0ZWRfX19lE2+kulWHx
 9VfQTCt2FCRfq+fmUwjvX4pJkNtPAjfQ11i5vG92Vm9SvWLNxt5wHMtz5au9APiFUZHGQFTcR1A
 H4gdYeeg3HSchP1HBnzIiNCCPs2+bcojGEYfMk2yHWS4w8QspeSwYw971YoLNyYqY4tkQTKn189
 ef3q1KBUeiWtBvVXigB+sDapEKvkEgRVvMg0ks0Vpx+0oH3hQsCOPlT0tmgIENegR6w+X8NJ32r
 AVw3TeJK8kFmx3cjCV/EQTdw820E3BxBTm5erjSBptslPqyWi4i63suMsOJKsN+gjlQ3a4hSl0H
 OoG6y2CFLjfX9ydjw55DWL32T3MffckrtQsGXyo26SYmAOQ719mXpkHRb9/LulTV80dOYZSeSv5
 8Ky8owFfuUQZyNAP+J9+RMJpog7X8HZETcMiEbJx2uY4WQhzHQRCChN7u1uOUe8JgGLEulWPLvO
 8/MfMjnZKMujM8Vs/Ng==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=6978b84e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q--SMSCEpvHRqS4MLmMA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 1POXlDuhKRIrFpnZluXhsr_VMB7MVo8e
X-Proofpoint-GUID: 1POXlDuhKRIrFpnZluXhsr_VMB7MVo8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90772-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[packett.cool,kernel.org,linaro.org,gmail.com,google.com,lucaweiss.eu];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mainlining.org,oss.qualcomm.com,lists.sr.ht,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C32A794A67
X-Rspamd-Action: no action

On 1/27/26 12:44 AM, Val Packett wrote:
> The changes introduced to handle single power domain platforms have
> swapped the info pointer increment from num_pd_vregs to num_pds, which
> doesn't change anything for pronto-v1 and v2 where they match, but as
> pronto-v3 has 2 power domains with no PD regulators at all, this would
> shift the pointer past the end of the array.
> 
> This showed up as a difference between GCC- and LLVM-compiled kernels
> on MSM8953/SDM632 devices, where only with LLVM one would get the
> "regulator request with no identifier" error, because the out-of-bounds
> memory ended up being zeroed. Fix by reverting that single line.
> 
> Fixes: 65991ea8a6d1 ("remoteproc: qcom_wcnss: Handle platforms with only single power domain")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> 
> I'm like 99% sure that this (old) line is correct and the change in this one line
> in 65991ea8a6d1 might've been an unintentional/stray one.
> 
> Still, please retest on MSM8974/MSM8226!
> 
> Thanks,
> ~val
> ---
>  drivers/remoteproc/qcom_wcnss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index ee18bf2e8054..5884c5a52af6 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -454,7 +454,7 @@ static int wcnss_init_regulators(struct qcom_wcnss *wcnss,
>  	 * reserve extra space to manage them through the regulator interface.
>  	 */
>  	if (wcnss->num_pds) {
> -		info += wcnss->num_pds;
> +		info += num_pd_vregs;

The existing code is correct in that it skips the wcnss->num_pds
(i.e. "the number of PDs Linux managed to successfully attach to"), out
of the vregs table (which on all-but-pronto_v3_data is a superset of the
PD list, since 15 years ago the regulator framework was used to represent
all power-related RPM resources)

I believe the correct diff would be to check if the length of .pd_names
is >= the length of .vregs and say that it's the backwards-compat case
(which again, pronto_v3 isn't concerned by)

Konrad

