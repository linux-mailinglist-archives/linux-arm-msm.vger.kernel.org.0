Return-Path: <linux-arm-msm+bounces-109621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHTHDOIfFGpjKAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:09:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F45C9037
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B89D33018AE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B5D33F5AF;
	Mon, 25 May 2026 10:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p788T9Kn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0Gt+H0D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831233F5B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703769; cv=none; b=IqgO/j/qilWnHtHt/5wetfKD+7xDPStrdwy1mrKgzwFOH4Jg8JqisovDggZevlblRCRoCWgGkPzIQmk4OD53NDKpqrsQRD8L9C1SdFGC/HDbOg5Hg2aFG47tLaciQ+Hvoy5Xvt0Qt3E0IjygRanUsIdlmIoT4jNPmNGOXDL9OZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703769; c=relaxed/simple;
	bh=pL5Je4HEVAXuL8Dnept9BFi+dGF+KXCSL1ZyZpgB6bA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HW44qa/WHkwVlYYMyHxprICA3Dmsisx/M2XUcOY8NsLPjpBBzxG1V4ntDuCYDrAgxD0tu9I4RNyxce9dD+y27tCUgPlTQNNCCVFNovPgiQcrJdE5VWC8xDRdtRnJ8T8eaDOn+poFIGtSs4jDHZXRDOmwUZO1XixaMcyabJbihLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p788T9Kn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0Gt+H0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7QGK53063355
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mES8tIhoFRE+W8uiZK4kjvVI99II0q8vFZyXwvCLDlg=; b=p788T9KnNJ7LO0pA
	BkFJ/Y9VrXQtDOfiTHO7kDeAlLpdV33E4fNdpY66ykC2+he7ucc3kpaRbvQB5eUi
	t+4bd0PMm1YErNlk3x116kOEyeuNt0//f+QB1vtFNBlGqu5nX0WXFZR63XIqA4U5
	BcMvk8nq4KU0i3mpu5obWzzpe6zMiSZMKmmYOgsapf/4LG0Icp+fuTiO4YRAvt/x
	8NTLYafssm4UKovjY3UnxvLurqKvkDUT8K1thBM9ssq8Txn3zLn1I6kEYOtXd4wq
	lZz1KZOrUzXZpX6rhyJvGIo+PQIN+cnHIIu98Ytz0wreygCTxKZwdwc50xAPNf13
	1MIOxg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1ggn6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:09:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83565161a6eso4899650b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 03:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779703766; x=1780308566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mES8tIhoFRE+W8uiZK4kjvVI99II0q8vFZyXwvCLDlg=;
        b=h0Gt+H0DO8zJKahKcMv9lAnTacn31qfaNdOCgy4QMmYEo9jCh4PkpH2cxf3oG0SBv4
         2MXJ5iDcWDYIToEKkC3cbth+saN0lkvKkG93uZ2SBK41Gc0ux2VYkRIWtcLaUtFZ5+0q
         G35akXk/qEM7uuCajZrIz+SsV2SYaR6s6jiiETpN44dsOosJBiEpdTzPaIisDzKh631Q
         6xir/wozIGCObpGeB9ctRco5F5pQBVAFYOYFRTGrGRnD/yV+MqnKogSZL9fP05gBay/8
         in2ADHTqm0IaNo9WAdQfyOANX3arS5wSx69QHce6We9YtHmrychl/p0ldJP9+aBD0W47
         kVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703766; x=1780308566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mES8tIhoFRE+W8uiZK4kjvVI99II0q8vFZyXwvCLDlg=;
        b=ozDT3IMT9R7UFNw3j4wTHV6R6bW7qOU7fvoSEbmcCJ4uwlUijjiDLa2TyRclXQNJzX
         LiSNrXQZlTuuIETZTVAgURQ/xzi3WInZpxWtfLuc6diXgFSsQ2zXLzrDmTW8FUFwVqCV
         WhSpmedHd5CujqeW7t3/CFQXIXNp/hwKUv5B84QDa5FSATZ39GlCt/LZLAAeFVmqUhY3
         gP9Kc4nujAdka3pKiy40MLV9vC50ksbxfzN2SA8AWtICI7nEn1AolF1P3Ht+sO2K9roM
         nY05K67uSMnPkPHjDG7HWPh96UQPl2TRD2AiuwaFnLNcaaFNiVAvd70vDG8QxDmMSQ+d
         oUtA==
X-Forwarded-Encrypted: i=1; AFNElJ9rjeCzPOotppJfPvioUEn1F2WCggiN2nt1gI47lSMtVszFilKTS2SM2gdEtX5a7iKpkrThc80Y6d7WpadH@vger.kernel.org
X-Gm-Message-State: AOJu0YxbatX8iiXJxnvsHW/ymKmmVHWiNJlaZYjhwA4FhFo59EiX37C/
	044RooD/aa3UvGBw3d+99rLCDBxnplJyBXr9aS+xEr+F4yueJZaetko7SCWxQVz/EU4PjeSj5fo
	Yd2QYY+s/BMmg2TP1KrOLqAP1FysphA7Q9Gj3vML8vbcaUeoA0NpP0NxHkkr7Dl+eypt2
X-Gm-Gg: Acq92OG0Ro6EkMm0QouX1KOryBT06dgBxB8GYSkvVclM4QceNfkJuqGGDDV/LEa+Vnf
	N9E2MAtFrPnuju3PZEpEIB0NGSCFq0xVkHlCIkgF1Pf2NqxO1i5tiJJPO5WgLOiUtoKBU66A/cJ
	yTQei4xVMDGqcji+bxwm9bDdLF44YxDs2wScpPwmgd/wquXIO9Tp7M8ncHfbDo9udQ96P5k336G
	8cyGtn/xydWR/JfqIuonDoAPC3HdjtrTRK8J77ULbGSE+v7b3y2TEGSxzLkF+j/xRX1LyfOlLN5
	xQp20rSkB9RzKez5dq1BrmWFPf3i0oRgsnRIkvkt9kXHOd2q0Ry0k6+kQwdGXTm/5/PyGZX6nrv
	uqdKd57+rZSaUz3eu257khK1v4XuqW1SRVJXNwIks9T3KX2sax/E=
X-Received: by 2002:a05:6a00:f8f:b0:827:33cb:c7a3 with SMTP id d2e1a72fcca58-8414b4281e7mr12803373b3a.10.1779703765842;
        Mon, 25 May 2026 03:09:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:f8f:b0:827:33cb:c7a3 with SMTP id d2e1a72fcca58-8414b4281e7mr12803345b3a.10.1779703765407;
        Mon, 25 May 2026 03:09:25 -0700 (PDT)
Received: from [10.218.19.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff71c4sm10428735b3a.55.2026.05.25.03.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 03:09:24 -0700 (PDT)
Message-ID: <8a1d6c78-fd16-4994-bae9-cf75b1e7e3c5@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:39:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add qcrypto node support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260515-shikra_qcrypto-v1-3-80f07b345c29@oss.qualcomm.com>
 <8dfa0670-7605-497b-9d53-db9b4a8a3d8d@oss.qualcomm.com>
 <57c26520-42dd-4159-bd2a-69874945cbbe@oss.qualcomm.com>
 <algvollvttjlu4qpawi3gnhwponwml6pts47ebmcvrjvlryl3a@qjq5ildo4qsm>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <algvollvttjlu4qpawi3gnhwponwml6pts47ebmcvrjvlryl3a@qjq5ildo4qsm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aC4pXKMVEUhWC_9IOzfs5RQohks66J9q
X-Proofpoint-GUID: aC4pXKMVEUhWC_9IOzfs5RQohks66J9q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwMyBTYWx0ZWRfX6cwPc+Gv6Ix5
 yDQGLDcS72zZ7YNgghN8u4MRNHW6bScBHcK/sqYQSe4ybKsvF32bunXlac0Vj34MZzyEqvr2XxY
 9VF4LudavYwPRpjTfqpcT06tBL5C+APK7nNe968Evx3kf2UlNai/MSrvTUYWzjLM+BOtvJulTyL
 j331nhAfGnUsZlFDem8AozZWbKj8Vf4rBLKlLbwp72ST+85genHPdWEcNAHc7V9rC33VHCCYovT
 87WO0mAU7a/JH8n3cPG2I83VkpedC75bRicaAp3yw07/N8k0jfLS2jqtnQXovdFa9ma9HdmjsaY
 BSMe4081JaD8dsO7f0OlGUvbv/U4OFNZI/t89frSeNmrMBofNCtqLv5Qyfp2gzVK6OUIq3U2liE
 OZLDFCnxlgET/UlS2jDXlWjViwvQ1nzdGsSLl17ffxbPb6l6dP3Wallw7z/dgoI23qZP5UW6wf1
 ORnywU93W7a+ewT6XLA==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a141fd6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=tA9iMH91bGDi15m1H0IA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250103
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-109621-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C51F45C9037
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>>> These two entries are logically the same (SID & ~mask) as the first two,
>>> does it still work if you remove them?
>>
>> Yes, resulting sid is same for 84/94 and 86/92.
>> Basically, the resulting sid could be same, it's an optimization which
>> smmu is doing which can result in same SMR(Stream matching register)
>> routing 2 different sid to same context bank.
>> So, 2 sid can be used even though resulting sid remains same.
>>
>> Also, DT usually dictates what hw capabilities are supported and hence,
>> captured all apps entries here to match the hardware description.
>>
>> I hope this answers your query.
> 
> It doesn't. Can we drop them?

Could you please explain more on what's missing?

-- 
Regards
Kuldeep


