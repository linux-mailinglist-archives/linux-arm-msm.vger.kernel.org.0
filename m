Return-Path: <linux-arm-msm+bounces-106360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIcAGfeN/GmKRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:04:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB154E8DBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B62030294B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA063F7AB7;
	Thu,  7 May 2026 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUaWZ3pR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnWinskj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9693F7A81
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159006; cv=none; b=OflqaEyTcwvKuwxrNkkzbwmklhv4CFke2dUB/tkKBVlK7Z3x6Jf3cr/jOH887QDY4mWw/oIoymSgnyqrSJC/q04XMsrogIu+yobM34+cY11hk/mdiz335wDB66oa64+LW/ipNYNTSIA9mkos5VuRIjIEK8UO9zJJs5Cb2r04W8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159006; c=relaxed/simple;
	bh=vJiIH2pewqKneHp31TdZCQ+a0QMzbohY+H1SKY4b1dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Upf7dX3i4OxKCrm5dQNiQxZu+FW/QwLpcx9Enpgbeqw39XXZQUWa2ExpDopejNP4r8POZszVqZjgS2cAbI/ydg/qQcy8qSHGHEwkex93QmzfsZ4OWcC5v4uvUO2eERCHRpZ9pt9UJMBx+lHRTEYCKsKfDlrIVuj5+yR51zQggTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUaWZ3pR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnWinskj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479v2FH1669567
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aF+Unu9Vo3GgQV6EEPlfZ35/SdyjsFQJgg1NBm1vk3Y=; b=QUaWZ3pR8E53eyfV
	pcyfe6Zy7wOmBCA7TQFvnVTgQI1UM2TmpzW2FLlYAHlta6FCoz6zPYcDg01thtLD
	Zc3xTXUY9JACO79ERnp6ETDT0vMA3TEUmPIubUq6Lpfa1OrfCOTG5zNx8E7Brl4U
	jREd6TsABSwTHHYxWkRr4sYXiis6lHmLMA1jABR1aFsIuY2o1ateoGea5YwUWZj7
	u/H4PxyZGIhu+vDYTtkE1h65F5Yt2t+lP4lXAuEsUCIk8D9n1QvpyS2alp5s0fMR
	VgSVUIF25eS6ljUreTVQp52G9KY+nE9wp6zh+lVRXNV0OYnolRBgOewFiLcPloZV
	lX/HKA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p1xed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so848411a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159004; x=1778763804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aF+Unu9Vo3GgQV6EEPlfZ35/SdyjsFQJgg1NBm1vk3Y=;
        b=AnWinskjRUGvofqlpQrlZMaXRqJbXcnM7WnArrpmJu+YXtXvi4M+NT/kQy0ypxJqcj
         1VCbAAsLeprcNIxkGawgQBAU0I7l8pphcLaK8iTS1HlaWr7D+wHFkHlWX0uWTTHrZdam
         ZfmefcXxRd/FQqHU9edYjUUqLnuhQpMAPJhP0+SQlDwfDgBqCy6V7G1yJOcwMwSC0YrO
         VisVttGcm0+V5tjQO1domzafebXrK4phFhnDoXjXK0jxhbAyTnytTlJ8bmijj5D859UL
         j+vY5tututhSPqyPlfsHiRGM/2gpO2Op1Js3aF3HzJfiOLCuaJBpfB5TqtxfFJG9J6OL
         eOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159004; x=1778763804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aF+Unu9Vo3GgQV6EEPlfZ35/SdyjsFQJgg1NBm1vk3Y=;
        b=Tgn/aMG4xrnQlR8yyCoEE1e7CuQ/Yj8MGPwakOT1ENi94NBP2A0G6g1lMQUhXgKTgo
         Fdf1I8b+fJAcID9mCrmZSJ6zaq7Uwc0/dENesxesEYKvlAaegNUYKdbx628sRHLHkP1p
         Pxj5AnTjYhSqQI3KEMcXU3i+3Sm3nPgo6uHIWSXI7r6rigMY1+gTBYP7tqU84rLSxjf0
         k3ou5ibbfsuy2xlhRS8BjG3Ae2jKuLrry1EPC/+qEBSA2tNynK4IMAMY8hRLnxQY0YdA
         WgSORDCn1/krVVX5B330HF8m2XF1YvQbUeE1SL9V5Hd0XiCzzKne6CHvABN6JdhS7+CY
         Agqg==
X-Forwarded-Encrypted: i=1; AFNElJ9QUhqhy6eg6FJjaeykFzr5rGWZwVoWvOPV9oLMXeiANz+RzL4JadHtquZ1OonkDBOJYwdK/Gif2cXXyBwI@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ1MZyJ3RdzOn5G2+OHp7bLHH3rFWWz3oedd3veQ5hU1/JPXIL
	/e7aZVS9vsFRPpAJWvirCySEPBU9Y+EgKCb/XKrXwPgBPzjFYldgQIBGkH7agkUlAjx/2rN0EOC
	1GVSFv8+fkO4bjwZecYI9CZnJGHK7u+kNTJ9ZORBlo1e1s/IAfxpj9pFgpAO2ZKep2tYs
X-Gm-Gg: AeBDietwmnYHBtX5H3zHnqg/xZ1VNDiKxRlTJ9pOh2djUqoG42d/B+zhLw76vrBpPaM
	d4ae4P4y7BQv0FJnn7kYh0u01qlRhuYJQvBVwV40ODKbYo/7gYp1h84LQMdr8mM39pS1Bhwg0Tf
	DF0jeU7u1OrshZiXm3b6ficulUvRqEPVSGHDpegSS1iR0YMl1pDjfMhIrbi9GW+CX3XHcADeiP2
	8UugDVkcuMhbty+Yso6HRiEzG4zePOTxs4bvoaOlflv4eqssHONDgC6MeuVHU0fEYiUygVOdNZJ
	a/JZ5FK8a6AnvMw7Z9fZZAyza0ml3LGI2k9KBbaMGuL0SbN4/LztNmg2b/GZWG/pyQmgpJG+V8r
	J0tKu+VIJ1GkE0kOApZHecvJoINJBVfEsRI8otuq+M69GZjJ7C1eRqv2K6gSg/dw50uw=
X-Received: by 2002:a17:90b:5683:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-365ac080573mr8033180a91.17.1778159003681;
        Thu, 07 May 2026 06:03:23 -0700 (PDT)
X-Received: by 2002:a17:90b:5683:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-365ac080573mr8032897a91.17.1778159001761;
        Thu, 07 May 2026 06:03:21 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4bc7558sm6142429a91.2.2026.05.07.06.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:03:21 -0700 (PDT)
Message-ID: <f84cbfdd-4f48-4554-91f5-72c90384316b@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:33:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] media: iris: Skip UBWC configuration when not
 supported
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX2/umDj9cs70a
 +8q4ba/vfAcNJsPvDJ/PgsgLYOVz3m/rKKbVpFks1F56zsEH1+1Vf/YfB366PHKQdvMCMjh1fqm
 V4HkxGhvhNxtzlbSgq1ZFvPH63hCacE0HnhzoFLblT82EaYGBRIi8x9gGfYKcoCFnZniNNCQCJv
 svTCeozeH0kg/s2a3VzlD/5zrTEduJRR2c+vnEfMcCOomA5ft+SUtExxIeXAzr+eZMeV6wgi2EQ
 1s4vxHDMXsXt7BJ35orjs29m6Ue1bnfoMe53mLCvW0pqNWGSJbDeDVeo+eBlbHT3AlNnyUOe8Jz
 ogCSS2zL68ileuZt4ezK5XkqmZIPQosySbqtQnxsOKKOtDKmVWiNCjGnfZC3teLRIFvfnwOBIeg
 5vCmgF/04FGbVN5qlHz3SDVIVvFeAkIR1m+Og3a+L6RHvDQ9KyFYkIGIFkx6tP97H8Ppgwlixoi
 q62wIhxnhkHUTBd+vGw==
X-Proofpoint-GUID: gkdGdnxpUVmEG0rZxKX-VdS5Ucs0g8Yx
X-Proofpoint-ORIG-GUID: gkdGdnxpUVmEG0rZxKX-VdS5Ucs0g8Yx
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc8d9c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dl9dPoTF8b8Ju4ANzBEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 0AB154E8DBB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106360-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> UBWC configuration is not applicable to all SoCs. Add a check to avoid
> configuring UBWC during sys init on unsupported platforms.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

