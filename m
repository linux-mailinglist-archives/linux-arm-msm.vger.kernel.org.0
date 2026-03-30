Return-Path: <linux-arm-msm+bounces-100759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJKBFL1Symn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:38:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 357903597FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4106301AE4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D343BD640;
	Mon, 30 Mar 2026 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3ypco1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LS1p1B1T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE37C3BA24B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867030; cv=none; b=oXv9g/Zof1WWSpYWNUtplZDyu2B6lHFx5rC8mFlSNABGbfkrQXMdCAm1xUwOj20g56KKET0n/BieISd6IqmDfue4DabEfoD/PS2IHjE/EQE2Z+Y4OkSSWI42pml0VRroxJsecTZ6YAt/aq5tuX7Exdk815hVcCKekdCvF++RV5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867030; c=relaxed/simple;
	bh=PH2rf7NU7H4QZ0yNX4oZF4lcydxQK2AJuZ7Vi+f7mJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cox6V0oo3zvpj3Ot9Uerc0163XDKv9j7pjY3J+B/GqWzLQQ3jwWFc0OC9KryEm9bHTelDeMndVaf7IW7VUqZZ08FuSzso9tQpYAQMnfVQSgwPqu0Pkkni9wYkLmaZDu2Suvg/dE4v92nQQ/LAS0fBKCgufWkzU2dE2onikzTRuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3ypco1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LS1p1B1T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UA2BAj1756012
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yvk2IGgI2AVf5dAObXEYM+8zWQ46Pknu0lBsdwBj8rw=; b=C3ypco1n6kElFmha
	S67qHbM5Qo8zJA92+x+fKJqdd90pl2Roij793QhB16fZutzv9lRXlHk2zS+dVjyP
	X/lBSyfgbsmGeZiTlA70gbaVmZp7iTGd9QgPjGn4zIWdGKMjbtKkMuyuUlnfRGOi
	dpNUvjsiua6CGDCp6x0etBAinN4lbD527aMLbSNuY0w5zUNbXhPE2V4cxgq6LQqu
	fZaKt2/usIhSOppWBOz9d+K1Pl4S9or+J4smLyjV264WbG7AexPbGGnUf8v5sA7k
	iVqLR+75JY2gtI5NvRRFTb5TWCW6QzMtz9cWrQu1elbvVeOS1D/Y88yarAToiRgS
	meeTkg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmku6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:37:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-895375da74bso15330036d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774867025; x=1775471825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yvk2IGgI2AVf5dAObXEYM+8zWQ46Pknu0lBsdwBj8rw=;
        b=LS1p1B1T2+3UMGk2eZL3NZfsW3rIwrziQT9Q+1nEITvO0cHxifm41oXrEodWzwvhtm
         ngT6CEF0aBAMhZbjv6r7EzUCjNKTbz2MbH67ZiQkDv17IRd87k8IpiIbWYDY91zDLUBk
         KmcmESrIv1cG7zmmMImxgJlg36+vft94V7tqZvS8CV1ApcpUSS7WW9IVebaivOAwyjdM
         rGZ1HpwvmRJ+0WoZGJfT3M78NVUoIa0FIBfnBUZxplo8r35MQx3h3eamfILryPXoIGSe
         CE0nbcc0YB5Zmp0hWU+trrij1WrwG2gu0htFc7r+hnvX3m5gDMTjecxOElSGqYLQ51uh
         TbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867025; x=1775471825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yvk2IGgI2AVf5dAObXEYM+8zWQ46Pknu0lBsdwBj8rw=;
        b=q6cEz14Ed2L+Uj2q2wfgi0zMVkKwRFKPVav0iknX5371u71WlwBGpBO47SzCs2HuKx
         Jio8y+eMTBSwo3ibdW5x4S+N0vbVhl6HZJ1DHmPCUkmG6cYifhJunlNsN8RYFbTyuf1j
         +IkgCTVamx1A549sQAocsaAezrCDanJSEHp+awhwuQPknGcWr3qncaIlswBPzkQmrExv
         JvqEyoJpli3RTooTSVwJ07LnrjbWxl6UCL80jJd/W7AtUxygho6zL+hVB9ZSnvlwsLLJ
         9WsveqHaj0frTq7mPv8k2c2e03IaYSRztVR8EiO+Qwvm956DHY3BVQkkcw+wOD1nj26T
         ZF1w==
X-Forwarded-Encrypted: i=1; AJvYcCWqB/LhWtrfvm6SFESrqMmmR14AsKi02pYm/MyPrpgXz1Owuv/X5fqmYcmlrSNryHvJSKRCgvomQrGbj3CK@vger.kernel.org
X-Gm-Message-State: AOJu0YzmyFCJfno8Rg0xK3muVJF3CZ+4JWgOZaHHxm2NSdkcxPFBlN6R
	DlFZO7P58rbzczmYrizsvPsTcFrONqK39j8sWooInTkqjjmnmKknAz2cOT+7vRVMbmSmUnlVXAk
	4Ftdh6y6QFMSZW0T5CzxdmtqM5R2KxBGQcyjdsk/jzCIBzSu4k3GUmTe3R1/IokXpYIL7
X-Gm-Gg: ATEYQzzeO0O0rZ3X65+ycp7FqtKVeSHMyyahnVXxDrjHweT5vQNMi9MoGrAg8IMqYo1
	flwlRdAc3iAfl+OZEdBAi2q45HvmLu8g4wV25uvXcgrA0UeLdoFHu0EPKx2hICXUhMEdGDL9V5K
	1Obkxp8UbfE8T14qlNfhKAs2tRI7A28HS9RgRQOlnoELOAAwtZTw+oEmDjr/UU7q6fXnYFsE+YJ
	OHXtKe5c0n22ahjJRyCzgUW1WbCmnqvWMOkvc1Wt9Mnt2LIfTVW5hV2BUffv96Zd6qtPaR8NI8+
	P7AbXosqwiIR5WNeJuofvZg6X1aYCJCQcREA72g2nw4sdIgelphQO/FxbATsgIULmZpZD1ZW+at
	jX3bDjIdVD4BK4fs/fczClvF8lx1R5LVXGIfXAbtaC6LwCCbKeXRVoY0n32gwlBt991j0Dkjqx7
	yohPc=
X-Received: by 2002:a05:6214:2b06:b0:89c:c7ee:fe96 with SMTP id 6a1803df08f44-89ce8ef7aa7mr130720986d6.8.1774867025028;
        Mon, 30 Mar 2026 03:37:05 -0700 (PDT)
X-Received: by 2002:a05:6214:2b06:b0:89c:c7ee:fe96 with SMTP id 6a1803df08f44-89ce8ef7aa7mr130720676d6.8.1774867024499;
        Mon, 30 Mar 2026 03:37:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae527d6sm287911866b.19.2026.03.30.03.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:37:03 -0700 (PDT)
Message-ID: <3447efbf-2720-4c9f-9a74-ca9baafa96ad@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:37:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: enable FastRPC on the ADSP
To: Sumit Garg <sumit.garg@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260113-agatti-fastrpc-v2-1-b66870213f89@oss.qualcomm.com>
 <acoCFMdKRviiMZRp@sumit-xelite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <acoCFMdKRviiMZRp@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MyBTYWx0ZWRfX6VHj9haCR7Kq
 UaycEWS83KnUo6v8dSYmqoMANiW8hT6CrE1+bKr2NByLHATP78ZKm526mm0NYUf7Tf46Dxsj1Hh
 JtvxWAUOP1Jnvv/ljx96NDKjB4WNQ7p1CbVk0rvalI5n4m3W2wzeD6vwwGRcKzyDkTMJsyyakte
 sa7ci3mX5oDnzigoCwE/f4YUZ+xDRKUIp/ZyDwxQ+EjKHbayYErrljrcIQZd36ZuQN/5vESYqe3
 4Mi/X5+6Tnl0M1TdKFCh7dIeI/lvHxAfgopVrw7zVSYLMlbQ/J7S8oMJge0OrgiwbQ0Eqzg1ckE
 r/VWjwl7aE2g0lVAQZ8iv9E/144UT9n1BAvzDXaf6gJFsZXj6nQQ+qofTSj0NYdqCuQAbQpcngA
 NCvIm5jMsBW3mD73D6MEoOAhXoa5JK/FvOsY6FkX0XhhBL9rvIs8a5WeTK4M0ot0qJ/POnacYa8
 /UO6jo+PP7kuny91QZA==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca5252 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=CYZpdnPDpq_JZXBEtmsA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 6s3A5p2N7JRcCTXxviTCYZAdg7H7bGus
X-Proofpoint-GUID: 6s3A5p2N7JRcCTXxviTCYZAdg7H7bGus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300083
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100759-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 357903597FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 6:54 AM, Sumit Garg wrote:
> On Tue, Jan 13, 2026 at 06:41:59PM +0200, Dmitry Baryshkov wrote:
>> On Agatti platform the ADSP provides FastRPC support. Add corresponding
>> device node, in order to be able to utilize the DSP offload from the
>> Linux side.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Add more FastRPC context banks (6, 7)
>> - Link to v1: https://lore.kernel.org/r/20260113-agatti-fastrpc-v1-1-e210903ffcb1@oss.qualcomm.com
>> ---
>>  arch/arm64/boot/dts/qcom/agatti.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
> 
> This patch causes a critical boot regression on RB1 as per the CI test
> report here [1]. I see this change already landed in this merge window.
> So, either this commit has to be reverted for v7.0 release or an
> appropriate fix is required.
> 
> [1] https://github.com/qualcomm-linux/kernel/issues/359

Why has that issue been opened 2 weeks ago with no action since?

FWIW, copying the broader log from the LAVA job:


[[0;32m  OK  [0m] Reached target [0;1;39mBasic System[0m.
         Starting [0;1;39maDSP RPC daemon[0m...
         Starting [0;1;39maudiopd aDSP RPC daemon[0m...
         Starting [0;1;39mAndroid Debug Bridge[0m...
         Starting [0;1;39mAvahi mDNS/DNS-SD Stack[0m...
         Starting [0;1;39mBluetooth service[0m...
         Starting [0;1;39mD-Bus System Message Bus[0m...
[   17.318840] qcom,fastrpc-cb ab00000.remoteproc:glink-edge:fastrpc:compute-cb@4: mem mmap error, fd 11, vaddr ffffae380000, size 262144
[   17.327877] qcom_q6v5_pas ab00000.remoteproc: fatal error received: SFR Init: wdog or kernel error suspected.
[   17.343248] remoteproc remoteproc1: crash detected in adsp: type fatal error
[   17.350567] qcom_q6v5_pas ab00000.remoteproc: Handover signaled, but it already happened
[   17.358869] remoteproc remoteproc1: handling crash #1 in adsp
[   17.364730] remoteproc remoteproc1: recovering adsp

Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
<ded>

It seems like this only ends up being a problem once the userland
daemon starting poking at the channel - +Ekansh, have you seen this
before?

Konrad



