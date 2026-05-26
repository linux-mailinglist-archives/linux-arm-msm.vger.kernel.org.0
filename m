Return-Path: <linux-arm-msm+bounces-109742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPr0L3tQFWpMUQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:49:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2188F5D1E54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F42F3004601
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482893164D8;
	Tue, 26 May 2026 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5vfJWXE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7FplO2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A773CC7C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781594; cv=none; b=Q+fgsYjyzotFKbf6x6FQ09/kLpUtL+/yAmTyll1B6dkTUMYSGhdUVtXIdwkZIMFrEecezqU1wgX8yaQeXlkqEGotk0hBl9GfLg3vJs/4hgcSrA7sUI1V2RSxVzlLp2nh5T8+hlOmi3KP37L5szoZnKNcD7uIsaTHfHosOIUywi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781594; c=relaxed/simple;
	bh=hV4EV/MTPp6bOQBQdWU/yh/7MhsUzUAaU0yrMeO9FEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ95jMTgbLX0m9c7ZUf6WaS55UxwIgw5Bp/sX1b5iDMACWReykaoz8bZw+wLcmmnrzDO79M6nzwtgyFBfKJ+fccH0KUHJ0BK5b5MnQDu+p2/RwZRJLX3KK5Cif8o3S69WWh4Y3N+OQrYIa5eA7s2u/zUbcmvCe192LXF10nhUx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5vfJWXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7FplO2b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2pQ1p4117468
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IXr/2Ris8NgPAriOtxZy4dQ5GqQXlwijnrhW7sGA0Vs=; b=V5vfJWXEB+QNM9wd
	newTZ+Yz1IXR9Ewu3yv0d3QviVRTg6uIw4KxQ7xBpl0LCPEf9YKc3KUC+kHRngn0
	wkjYjWrVmbQ/PZfzbTA3l4mP4thjFKInCUThtsULQ9jN5M7uzAwrNMLCi6LLUVOd
	ZRusJVv2pieSnDj9vjSh/6gmidmmIGdL6ABrmkaNIgPkje8Fg5Xs75+xx2Y55xF8
	Pfijpesabr9SSJKPY3c+/FgiEjBdZdCAXvmWY381Hdc8batvrKIemDLldw44AhFr
	joVBpsepHyx5D+Mnz4BBwf4TrxnBM3Ka3+8Ki1/D4pxVetxq56Tuymv/Xy/To21W
	tnUMRw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudaqv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:46:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso6576822b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781590; x=1780386390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IXr/2Ris8NgPAriOtxZy4dQ5GqQXlwijnrhW7sGA0Vs=;
        b=E7FplO2bZAhIMUd5xMCc8en5dM9jyzpc/wuFtx/9KYGXTbvjAKC8kFkVQjrrkOsmxT
         xSRB/O17ofnE4dEazPUZjRtBOSALx4CfnRpx6wMCD46M3/P1TgUEKgm5XDFdHX0lHQsH
         iVP9eTICAA+uRkHciYWqUQ/gE+OfNJQPCkEFsTkrquR51wVLyIslMH8r6sYzXWjQGEm7
         VYwil90O+iiirSBC85JAQhsMmPJOCfLGlubTWRUN/vkxvyPsoFOZTvpKzEL+PkMCicW+
         WWuSLImzaeLLWGR6/F+lMz9WRB5sKqrkjYTVmbdwym3rR4nSfrWXsa+FBgw8SpJXGtKw
         /6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781590; x=1780386390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXr/2Ris8NgPAriOtxZy4dQ5GqQXlwijnrhW7sGA0Vs=;
        b=md+JtGzTry42DA42hrg0X/K8vKpNfgJRLCwYeLE/6dyPTs7nNpSEOMgajPsBJIidVe
         okiBwPxfJRDvecKwgivs7Br6kc3qJ3eRcGiVRLteJBT6HX50g3MnP0BuEaey8PrVES2b
         XiSLYWDlkbsB5zfOl4sZZ+EoL6bMzFw7uEQocGsIeLgAnHH5vjR6S4gTiA+JJioFiey/
         nXMEffO1wdOmyNbZO7/vgpJFZgH9VBNZVRIc0Wf0SGEQun64oXPpsceOBiUhQHmhXATL
         fNy96AwcGKL2jadVAFuCPyhsGwbV29MBOjlep8J0b2BUL4F+uGzwwcmZTLLYHuxxLFFX
         qtvw==
X-Forwarded-Encrypted: i=1; AFNElJ9hQNdPy1CXHP+M9ZGFhlYZeN7nM90E6Cdw4xjl93iybhOEd3MGsk2y0F1C+6V8iXeKQoT0qedMorfkgQUz@vger.kernel.org
X-Gm-Message-State: AOJu0YyEz/u+ZcpH7fOu/GXeSs1Mxtkp4TeJwf+5ng4AF8prgxwTWz3W
	9jyyjB0c+X+LO2wAWLOfqrIEsQDzY0r9fiIyLxc42LlNxQ4h0Myiip/NNrYW2RSNk9DGm7fMQ8g
	yX4k0A81EcBVXsfcPOexPaaiREQf29IWWWQ6T1Ci203JGeLOYih8QkR5atXSykH3UuGK3
X-Gm-Gg: Acq92OGVDU+XHkQPbwhbvVpZE/Iyrt6zGS5vuRqNEldRNSYXuquSp914m5/XzsDPY5E
	lWviY1I2yFEL4D1NKOGRQmsn/3IzNgCa8Gk8uWdvLID0Az7FaAksw3HOanFBtglTnXPexqTJcNM
	JiP6BSoNchcygiQO4K0yg0yBR0+2Wbj/65UNzIP3TYiopClAp2b6OUxr6B22Pnj7Z76io+rR5d5
	EUgKDOd81mg0hhgxKzb5zfIzXT8nXKen0T58C8yDAJdrUg/3ApJzy2Yexzpk85TPc3MYxDfgVlQ
	a17aqnMGFJPPS6vkxt0URYesrrjTnBNJppYxHcpMSxJaQCV/v4t65ulo8tXSZyJy8L4fFq4Ftw3
	4IoINyUyQFmSVRRDRJ1PVzc/Jk5XSgNbAQYw/VsnEHsYVH+dojO6wy82aElM=
X-Received: by 2002:a05:6a00:298f:b0:835:3d5e:1dd3 with SMTP id d2e1a72fcca58-8415f586b5bmr15660109b3a.42.1779781590222;
        Tue, 26 May 2026 00:46:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:298f:b0:835:3d5e:1dd3 with SMTP id d2e1a72fcca58-8415f586b5bmr15660075b3a.42.1779781589739;
        Tue, 26 May 2026 00:46:29 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8419a140893sm5387763b3a.46.2026.05.26.00.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:46:29 -0700 (PDT)
Message-ID: <8aae23af-152c-4f2b-8c3a-6edd61685ec2@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:16:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power
 Management
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
 <20260520-hilarious-tungsten-giraffe-5f8cc2@quoll>
 <18b19e1b-8eec-4578-90d2-7b2c17aede74@kernel.org>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <18b19e1b-8eec-4578-90d2-7b2c17aede74@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2zOmP8eBrpiRHFi_h4SC1_cxCqmQdsY0
X-Proofpoint-GUID: 2zOmP8eBrpiRHFi_h4SC1_cxCqmQdsY0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NiBTYWx0ZWRfX5qTRzy+Jm/br
 ov9TJLFeTIgiR0ujUSQdwswDCso1iwcXizs5/rhK1id7WwCKPWj9ZkzRBMAealbmkhnwrB0w3UG
 IW5TKeQys/0kYu04Nhh+voGL1ZHS1OU6m3rgspVeD6iG89K8kVM9/62Lyge15fUs3wL40LFjKa7
 IRkoAIwKMY6M1MDnXQ6Z8TFUZqUgo4w7yzLlAaQtL2ebxWmGdbbKGpKYsHydd9Ae4jcyfO8Zs3h
 O7kywori8nSqCty02WDmFnNqU5Y28q9hjLbTkjPHb/41GPPXeZdXsUlT9yEFlwb//++7gE6fBda
 +AjnTWdgzlXTJidBkn3yhVWy2vHj8GP4ovRVcfZuMqPRYSAttDPTyYu0vZ1jd4sDL2XrXY7URre
 XhDiD+ZcpGZNv+JaOoPXv5CsiVervDUYYZZPAzE+cxJ2qIflVOsM8NlWRg90+iuteOrEK44gxPM
 5bZyY803V3ba9iNCWxw==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a154fd7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=-We1AT7ZfJutN8l6OzEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260066
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109742-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2188F5D1E54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/2026 4:16 PM, Krzysztof Kozlowski wrote:
> On 20/05/2026 12:43, Krzysztof Kozlowski wrote:
>> On Wed, May 20, 2026 at 12:35:09AM +0530, Vignesh Viswanathan wrote:
>>> Add documentation for the CDSP Power Management driver, which handles
>>
>> Luckily we do not take bindings for drivers, so I can stop you right
>> here. This is frequent feedback, expressed many times on the list, said
>> in many presentations, including DTS101, explained in writing bindings.
>>
> 
> And you already received that review during internal review, so you just
> ignored it.
> 
> It was given to you with a purpose - so you will implement it, not
> ignore it.

Apologies for this oversight, I fixed the subject but not the commit message.
I'll address this in the next version.

Thanks,
Vignesh

> 
> Best regards,
> Krzysztof


