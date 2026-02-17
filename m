Return-Path: <linux-arm-msm+bounces-93143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC0eK4VXlGkXDAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:56:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5454714BA6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B511430117E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C385A3358B9;
	Tue, 17 Feb 2026 11:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zm3rVc8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOtbN1ps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC6B335BBB
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329400; cv=none; b=YWKPR4Sa/vn3r2ZVS0ECxPzFupS+SQhiqqIWp4xnrIxIl/oPA/z4KUxaERiVMRS7MN5eEuRmFqO+kXWyucwGGandbmAulZmGJMFkIzuSWR2aHnLwpV56IjYpNgtsFj7aT/W9pnEAcvcn77ArLQjvnSIZFb3Nyk5dDz1ObD++p/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329400; c=relaxed/simple;
	bh=CfAR57z2aVgzx0jNoBJko0yuCR6WfqzxE0KUwxCbFvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCtMCFCm6qMixUbCkXeyIAdYuY+uK9UfbS5Cz9v2e0klQb7vdyhJ5w5gJwT/mMROKps8cbl1xSd+9w7I+JNACuVozWOJeAmnrvFpoIz/QHVkaqnjtgQowdM4HZn4aBzGjoEp3W3yHZkgp24P/Lh7bSt/QLVAxsNRZVw+3Ppdi3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zm3rVc8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOtbN1ps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H6sZ3A3393929
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abZVH24cGewfyKGRj1gUBCi7aVoXPrWtU4+xmjBoHOs=; b=Zm3rVc8QPDpY+TZZ
	mx9Ya/bnKHD96jZQGK5eczSQK/o8gIvOYwkjrSY2KkdNxiK/1DPVaUZcU2Wd67X8
	4+QfhNIrp9rykx1aPTurddjDaSTjyAt8EvVxTfl+6NPnEjvaoXvdr6bKA6tvplM5
	gS/PuNDCDzcWVdQb3ZkLZ6i97LU5MM8w86b5TrniPLwYlHcb3kRYw48ipgogMevn
	pZ7o1vxaXjLt8tf1L5QqGgfVeDF04pdc01WEppI12L+rn3HlyRQlbIYZ/6mBOfCT
	9rAbrw6OwAvUMBDasqXfU9AVCFMhIGqXDWBG8EwcPCCZkaLx27mW5anxAkh/byKz
	hfPUvQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5khacst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:56:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35449510446so3996896a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329398; x=1771934198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=abZVH24cGewfyKGRj1gUBCi7aVoXPrWtU4+xmjBoHOs=;
        b=BOtbN1psE/gx/AFwC23yCzFnXNI4UxdfIs3mITGS+c6ZUVPeXI/ly5+kYsUSB9i7SX
         tWaPUgeBSk01mJ9PQw1O/TCB+spWZiyCpWFt7w3kirtjqO2PZLaFoBbWVayH8o9fezoF
         uA+9vTCyN1SsP5hfdtoONYNQfhZz4UYxTVZhZeMLSjnJCKXX83C7+sQ2g9znDSSSjMCh
         SW3Le/X1XFKHYMhu+0MzVxb8VmNvaOnHu0m5KaozuVzfxWHR8nQdPffNRZ+lSipQ1fnH
         8AWj5VFE9E0S2qMEh838qwX9GLV+S1ryPT28OA9e+F2JsW5B7o+6j3YqdUiTcM30EYE/
         s90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329398; x=1771934198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abZVH24cGewfyKGRj1gUBCi7aVoXPrWtU4+xmjBoHOs=;
        b=MRYLMv/TVCKbKDxScw1hxhRJ2QenNoIdwkwV//WTESjpxf2smVlRd/BYDiKgsurDRl
         QtFfwFWXtko0iY8dDK038odMP14z/bV1kRCGDdiGWXJz7Pxiu7KRB3TKQMrJ1UCfKL/K
         ugvn0Tv9xpABiNUAvxMo9C6aLFtcrfcs5Z+J5j/cHoj/4WWAt12446m7ONFPr/+x4sMO
         fmLztPO49jNS4x6ZPfJ9Ou8oyWkYiMmhwNR+EVvq4TD3D1gw1KUUUVpW7OU5aC+vEVQb
         gglPLv95SJVwv+5Hkm8pEGgPyuOk77sSIl8OjxErE36kqkP9fT6TdH29peQd90MMz5PC
         Kn6A==
X-Forwarded-Encrypted: i=1; AJvYcCVyRn/7wHzTY5vTsp6ClnxnizS2Y4klt/MNhllP40HebXwhYSwpthpg2/yPzSKbeVcExpOozcXnwvA0MeNl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7txbZhAIBxjQKidD6fRnhsSKtwMQD4Hyy/kCLwwaUiOqzaFWJ
	Nnxd2JIA16iiTqO73ji+lgI5+1/gIRsAKoub+vUbKne3WAOInYHj1I2iM9CslwhvLSaXpT0Nzmq
	yNiaN2Un+PFhhwc3+wcs6IfxJEAyyeKnb63Fwh2qljxui6ehhhfxiHlSSNmSPJL0iz3/3
X-Gm-Gg: AZuq6aIPu9EKWF1diCUqwQ5Ri7g/H3/Wp35zVMN/2VHEcThvHRYvOgpms27K0FZnpgR
	Igjq8yPG/5wy9Hbpoaidfaz3rBVP0+QI4YS9Zhx4TfPN8XULLRZJW1KGaEKqaR+uymbiu+cgWm2
	HOTQxH1meXQEa/ZqD7IoPhNZHipqNNcmXGKk0lTln3vvRfcPLZlqin7fshQagSjBNSB3LxupVBt
	h1n8HUDkDEVZlSMRcXFI6Q2j9DHWaZFSDLfzC5G8tybSGNcARR2WVmwXfUA94/PCXDPn7UxPeeP
	P8F5tYIjuuNJholGXVsy3D5P8sGQK9AN4M6tAfvIGjHKp+4UuyWGVVppGAiWDRT6LDV45Y+0Ry3
	l6SaUKi4qNm0YTW3zC/+BiL5dOIUM/QLx3acydks3xZstUz4w5w==
X-Received: by 2002:a17:90b:35c6:b0:356:23be:7ecb with SMTP id 98e67ed59e1d1-356aabddce6mr13377689a91.12.1771329398125;
        Tue, 17 Feb 2026 03:56:38 -0800 (PST)
X-Received: by 2002:a17:90b:35c6:b0:356:23be:7ecb with SMTP id 98e67ed59e1d1-356aabddce6mr13377670a91.12.1771329397655;
        Tue, 17 Feb 2026 03:56:37 -0800 (PST)
Received: from [10.92.215.127] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-356a69b38ddsm10428379a91.0.2026.02.17.03.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:56:37 -0800 (PST)
Message-ID: <caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 17:26:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add CAMSS support for SM6350
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <c83ce76a-1c83-40eb-9c67-d26b7e6f68f3@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <c83ce76a-1c83-40eb-9c67-d26b7e6f68f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=69945776 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=yXsjsA-mUSMGIjApI5AA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 4SFkMKYiQ4L5vfwCNORmLrCsgir82s_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfX3q0pu0pLCCl7
 25SibKDJLPzMAxn7t7GIlNNeU60A21ukBBu2GCk2qWVd3yhPqaR7mua2OK12NeJ/X8fMOS4FCgN
 AvTpGRtvN7NxhkFKVKzNy+kq0T20nz1eYwbSI3yxVpbtgyrMqNBOW9ap3tC9wYq/NkJJm6+reCg
 QstB7MRusKIE23bvXSLLZWLDpkodluWYbCFtGTCl6YsT8YULJvLxNpsBv1NJM8EiRJI7ezGcvSb
 lCDahZUZnk6MxFygMGfjFN4Yjm9MihTHjOP+33EKorl9oRB1nSIBZWaSAdqq3ThyRpdeErVXC6f
 5oEW0/Qdn+tCM3pFfohmN3mcW7EwNkx/DS9FTxef0e02klJXzeCYVKoI1G7l7pGUL+h2kskZrPR
 vmGZp49yhnxhkzNhb5OqtO5+/pG2FCfETwMW+8VDh7/MqkzJyio6u4iuzqkgchORVbOlCvCEHky
 LrH+UhdBP+yEDvPz6nA==
X-Proofpoint-ORIG-GUID: 4SFkMKYiQ4L5vfwCNORmLrCsgir82s_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93143-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,fairphone.com,kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5454714BA6B
X-Rspamd-Action: no action



On 16-02-2026 04:34 pm, Konrad Dybcio wrote:
> On 2/13/26 2:15 PM, Luca Weiss wrote:
>> Add bindings, driver and dts to support the Camera Subsystem on the
>> SM6350 SoC.
>>
>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>> far as I can tell.
>>
>> Though when stopping the camera stream, the following clock warning
>> appears in dmesg. But it does not interfere with any functionality,
>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>> while the clock is on, and 'off' while it's off.
>>
>> Any suggestion how to fix this, is appreciated.
>>
>> [ 5738.590980] ------------[ cut here ]------------
>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
> 
> FWIW 845 has .halt_check = BRANCH_VOTED here, which translates into
> 'dont check the state at disable', this one has BRANCH_HALT (i.e. spin
> and keep checking the hw state)
> 
> +Taniya would BRANCH_VOTED be fitting for 6350 too? ^
> 

The parent RCG of this clock is under NoC control, and seems like there 
is no vote on the NoC while disabling this clock, hence this issue is 
observed.

The BRANCH_HALT_VOTED/BRANCH_HALT_SKIP should help, or if the NoC voting 
is removed after the clock disable then also this issue should be resolved.

Thanks,
Imran

