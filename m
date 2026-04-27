Return-Path: <linux-arm-msm+bounces-104690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G1YLbM272nV+QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:13:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 781B5470B00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 530FF3025387
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014333B47CF;
	Mon, 27 Apr 2026 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocljP44C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCOEhINc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4383B47DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284606; cv=none; b=cnTxoNOhjN2kMrO77WAEeemLSz4f1hkJX3P77QCUV40WK9nAmjoaj2+Akn/VeLVvriHazeUHqW1L93Eg198RQ2PI0lgh+k2/3NqBUaCA9uc9PAxn9c+ueCI3Mx3gteDE7LKZfFKaLmQdCPzpiUZMic4M1WeYEvLdh3xr7PksCwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284606; c=relaxed/simple;
	bh=df59Xk7yR3KlM3Nop9TG33Euc01Wqj3JKaFTj1LdW1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cflv3ER6Cnm4vZm+IMLcQwo0iodY8loJs70rGHoTF6HgUSE1P9dkDA3nLSRTvnK4U85xRLwAmBvultHISk7aDF8qDcok8/sG+TEu5kCgM4mAU8t+k68/mpLIiUDuvQPyLMlqcOLlzXlg2krxc6luN+Om271zI2lrF16BkFtv9ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocljP44C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCOEhINc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T9Bl861260
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UySfCgJ955LJs37rWuiTegFDYRglF9oeDO5PYw8FEcs=; b=ocljP44CtJkbAB/z
	Qoc3gQ2MQ4o2ZXOenOsn5fH363WaY0ST/PXBY0+G4x34isCBAIRNRPi54/JwyJa8
	jtzTY9KXk0y6NuxAMGRSno/IKvfs/Tbn4R9zIK4HqSet5q871lBYyVtX5g/AK/Cc
	gKZkidEgo/MafZTvBt6klXYjBevbgH317qh/JdAj0yPxeipu5ZziF6ggaY+9vAAL
	9G4ueM07g5Wid80WUS7twQfaxU+gjldcZD3hE/FxHcT2vSWx0H/EGJMnGSZeJnMZ
	sRa3XS2Rd/j8Ea2o91urF5K7LA9XBa4F3HtSG96PHtIaIt3d6EJewfT1zc5oM8uJ
	j7t5dw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw5m5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:10:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb0b93e90so22141881cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 03:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284603; x=1777889403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UySfCgJ955LJs37rWuiTegFDYRglF9oeDO5PYw8FEcs=;
        b=KCOEhINcDEqXQndDzbf4Z7MdxHN3KYKnk/HMQFy9x6E8YeGKwyDL6SdMKCDW0FrfGh
         k5U5T6w6fKmYedeJWKUBy/4GGQ3NtITTw0CDHr9uLW5d+sRdgzQ/lnW6lwFSq70AwiWI
         gqMfA8V0cHBvCUTGnmHQHuQEZoBZaNN883s+vp8RDH/iJFT4cIhLEKXNz+nFHqOLyoxE
         J7NrzzM9bXCTeZjd5ibDkFmiqKH13M/CCauKnbwKIICkq//Kc8F494RAnbH0O2fEve/D
         3pC+A/uaoX+Q6KDS1cU1yRye1Djwr8b8TJ4sIoHHBaIlMhyT/ONYZAkcDditMtQ0BxD+
         w2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284603; x=1777889403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UySfCgJ955LJs37rWuiTegFDYRglF9oeDO5PYw8FEcs=;
        b=FA30JrC2TBZXeeJnMoLrafWs8JCwsQ5I68TuZMFRnYid0LobBjokqkkgUXnSD7aL0y
         8wdrTl7keGNR9y/0cfd2Hyojo0mAvck5DfrmXJ7H1/hq7Sxpnqq6a7uouRK5sRn4Ha9T
         JqMWD91CwlrEvjrRexfspI8ceLe0N9w8b9L3BRbHkCTMpaZCxRnXqh2KySUdlLqdvq9Q
         QIeSr3m1AlwyvjDRRb+hslA0IGQIXK1wrPhJTA5hMb3kZPG9mYvP/xgeiO6urEiEQByS
         +VrRl+uI+pbvYVL5kGuGKrzmUgcCXcJGRJ6jcB1ofXMQAPlWH7QJCX4866ah+6cWdspZ
         htHA==
X-Gm-Message-State: AOJu0Yy5STsBL3Vw1iHCYPmD9mTVisi8i4xOeTq8cBCKjIn7sV27EMz4
	NrMweT3k0DoEwTKzSslv404iJlqZnLIqTZC32JG0XZHRPCIgLd2ux+Fccks2r1mRO0/mKLACWSy
	XcgmciM6JZ/kWiOmwg6ukqIb5RAwU1F9xo/wiEgs6aRrjBQ3vwpFdW9jLW87QdaAPqzIs
X-Gm-Gg: AeBDieu1V1sPsAXusbes1AzLFbDzWf+K5N89Md0U6wITpLlRHj7xAipwY22BenU6AbQ
	14vx2R3mDl5BhFMbpniZyOWtpS9/oF0GuqWWnUrp88DyDobKd2JGhUhtf0fHPZlk03rlU8viYVk
	IuNlSO+AJwPL8ZkaOiM6k+dsNVA0DOdaI3D7KstFPxOmbkKVnA180NScmXDJ0TKIRGLUESTt2qb
	Ojn3xeFR+iRoDGXUYY9qfPvEl9qbNcWsqmpnjNg6zyhsx1i1jpPg37m/VpLmOzia6HIGNLLpkNw
	LU1NB4SFEjFk6lvjMnTta0qCkYeuPEeWGL6c7J7KTbEZDdCEcGh8OPZiH7FP5CGF+BxjAbffhYv
	e5s6yAl+a9P5cwuDlGfkeBUUOSsAfQHmSq86HIBrMq0sxgMH9R+7xehAPbB7nvrdmxHWZoJfuWl
	irYzOwCzouy9YQCg==
X-Received: by 2002:a05:622a:a06:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-50fad4a0f81mr303493231cf.5.1777284603368;
        Mon, 27 Apr 2026 03:10:03 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-50fad4a0f81mr303492691cf.5.1777284602682;
        Mon, 27 Apr 2026 03:10:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdd2b8sm1107652966b.25.2026.04.27.03.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:10:01 -0700 (PDT)
Message-ID: <97c230b5-167c-41d4-9f36-e62b97ff202d@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:09:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: fix wrong connection for the
 replicator
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427-fix-monaco-coresight-dt-v1-1-1707017f20c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-fix-monaco-coresight-dt-v1-1-1707017f20c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNSBTYWx0ZWRfX0L4JzH33NUtp
 BggtomPW5OnMfIo4UQAswed+UnLVAVsgwQWrF3sUcB9J6UJrnGqV32pKrxd3pux8ZSZzN5yGGyS
 y0qfuGTZ3/l8EHJUDXjxQySXzNaDa67UV7Js2hjjmcx8oXHJ/tjjoe4Q369NWhininT6RD5256j
 JtnY6WwfEYN6CK/OCBn7/8FLraXFIRVBRMzjsV18b0TxTNo4FSCrR5VM5mYmnH1jCmcvnkSTeCO
 EVmd/q7FOKWUjFVuaWIk5Enz6oSMeravFb9FPkqPdq5ZIgQM2VrCaJWWf3Mkg//1EFqdsYVraMK
 fsztjVg56p+wys5VBzXrMl23hUHUuNiypeCt+MCDtv0/zq1ji7F/x4x4m6UgI2dkOT3LKcKN9rF
 Rnom1JSlXfYTKz144IhJNEACEkIfv5Dt7y0scGhQqACIICZrmBn662rqMcEYD3VzSt12wQmggEq
 PmCoh5YMHWak/9qVaHA==
X-Proofpoint-ORIG-GUID: elAyDa7Y2WwPRU78F8GojeCmIy0Uf0AQ
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69ef35fc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TcQrU0szjGiQgjDi6ycA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: elAyDa7Y2WwPRU78F8GojeCmIy0Uf0AQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270105
X-Rspamd-Queue-Id: 781B5470B00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104690-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 6:33 AM, Jie Gan wrote:
> Fix the wrong connection for the qdss replicator device.
> 
> Fixes: 0f43254763b3 ("arm64: dts: qcom: qcs8300: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

I'm afraid this patch will miss-apply since the visible context is not
very telling.

Try setting `git config diff.context 20` (you can revert to the previous/
default value later because usually the default is reasonable)

Konrad

