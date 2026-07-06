Return-Path: <linux-arm-msm+bounces-116749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +kX9OS2PS2oOVgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:19:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F1670FC0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:19:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nR3cbk8k;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S2CWR8LF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116749-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116749-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A16F30A3DFE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392D9371CFF;
	Mon,  6 Jul 2026 10:30:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC72B3A0B38
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 10:30:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333818; cv=none; b=MyJgmsC7A6plRhC5YxOy/hp98KKM2Cg7TEb1ILAjptt0bOlR5r76+hXOhR8iYksai03/1d1G7zVxLOABLeo+wfwJDUunxuwyJCTdfck3uJ1catZ85KdJfmG3gCk6EuMAmxgZ2R/hdn6GkhHez6FT3qh2CCJ/2L2hEcDquXqHxe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333818; c=relaxed/simple;
	bh=j7wcoQluXVOcZ+Ui/qPMcNR1A37y/kiIsDuGK/dfnVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIRaFvRu/0saJZIZezY3fMPpRw/x53Z3Uh6q3/yzIts8sC5YlzqsTdi8rgiFU+n6vE5J9ra7ThpYFNYpDLvAgikd6h2Yvsv0BHkM61BP14clnDQCt1GgWIsKhtY9z1AF85zUBRWI7fc1GCD/SqrTk57I2uCKICE5gpRDoxnvSAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nR3cbk8k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2CWR8LF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669H2S4160197
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 10:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJzzmv4Hz6ml1uWYSEsGdo9a6gWmRtyUBQBeCOeGHZk=; b=nR3cbk8k74n6rshK
	LxJNFEA1UJpLb5OBVVd9Ckkv8dmI+AnIWBai6JYUgA2G+agux92Knf6zvW7A0oCp
	rYugmTPOZ2hfmt/62BZhw2q61QgD2dHOMMI0/ALwMfG9zNSHowPnxWb0N14c7LqQ
	8jtTRElofaKl3BGqgVRReHRsoeiSSUJ2PPKSdIWKnTRMizMKmBxBRhGR/0lMfwYg
	bb6GSgD6W7FlG/qb40LKq2eN4QcHxk44iLNHNss8XgeQT9qv8yvAe5+LRxgm12F8
	BrCAOHJkmrCZW52f3yiDUyFOVJxtgDBKApwYdcY9v527z+2t6f+nJ+f3BynLA/S1
	iIXgsQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgr9ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:30:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so9070346d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333815; x=1783938615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJzzmv4Hz6ml1uWYSEsGdo9a6gWmRtyUBQBeCOeGHZk=;
        b=S2CWR8LFIeLs4lz08mzxmZscY+f9fdJ3wS0KHmFLT7KuPL6fKU4GWMUHT2mxcwBrc7
         JQC3x8+N7LULN9NIxv9ob1+9p1Yme2oZ7SQKLaQc4xzCHWaNPrUIs5kznQ0/jE87aGj3
         ld8gpGaIsZzYl04V4DfAeLU+TqzC1tcbRdDzgi7ooWCYbMG2S0nQ2sQ7UyvIJvsIenZu
         VwM7hA+mLKMuwLMkfTrrvo1sQ3uVxOHneD3Z8LFUpuWHqobRx9I79vxENMnRAX2lKPId
         ky98diS5TUsp4pMNFm1oLI7kJnZ5nkEIDzz87FxfqwKIxTigRlwbGd451gVAUdeBACWw
         owSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333815; x=1783938615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJzzmv4Hz6ml1uWYSEsGdo9a6gWmRtyUBQBeCOeGHZk=;
        b=ozxEHYBURLrE1aJvjWXiI9XtCykaw+6s9+tMPObdwmvTRr0e/8KJD4kki6MR9eGLZe
         ugNzRJjkfLpbfdUFS9cC1JPbqW4w9koVIWuNGJ0ehTovkSB9Q1euxA8GEohu2ifxbIQm
         WnZAEBU/+d4RDoik5bRtcoKQ+qb8+NKd3rSwqPzrgOcCMIQek3qj/3iKF8JlG5+J8RY8
         nUP56SD5iBHybT/sxCaLboHGDcP3GDVT5fzUp/VqqznAzJ+bDHFCs4XKI2zzQf5xPpt3
         +1kl2mLNXP/FQxfun8nFmZoHbImG6Jh/1c4Ryb6qrAzuzirnRje1X2wd49efTD0X1ken
         VtsA==
X-Gm-Message-State: AOJu0YwPubjgAJbCwIfsfcC3iBScpqolCqr/+y3ydSzk1c6Z5V4c9XPT
	5a5Xy2CWFO1F46Tug/+en3r1+ZK0P1UstmU+hE4lxgLJF9j+iVspNedeJ0Z4XUkxS9hvsjR8FeY
	VYvYkbnKVereSEW0fUdxpS0zwiqgq26kC2RjJU+Aiz8RKnB6AjMKbyJtfjSfZcdBhEEEW
X-Gm-Gg: AfdE7clnIHhelKVFR7vRkXl01lW6483c68u3ccwdx3wK1miGmboyzRGKeEPTL6tvwtu
	LcelwY7A0sPpYfJu23AX71aDiVfeYcMjAh5ReAhv8KS8BQQl6oBB9UjkxAQ3HkwShK0Zu25RaEH
	BUQf9yy4+VrTRUXQEDYq2DvD4B9CtfNTRu5hW4N6tS73jVkPvsInFyybFh8VjcHSh4U0k/T/+gw
	XSMh9Q1mfxRYW5DlIeQ/3wDQ4nsy719O2Cjy7sx4c5tzAc60kttvaExDWlRWLBPH/AHQwlUbnTM
	JIu5vsB81OHhziMMYopJJSO8bzNuLRPfVW9RarJvJMyFD/6yn27MdZjQ0Y7xSeO6FWzadpA5o+x
	0Jr2pcbg9EujT4LxQvMUqY4Jbiy++bKlReNI=
X-Received: by 2002:ac8:57c2:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c4be98f79mr92150901cf.9.1783333814978;
        Mon, 06 Jul 2026 03:30:14 -0700 (PDT)
X-Received: by 2002:ac8:57c2:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c4be98f79mr92150561cf.9.1783333814493;
        Mon, 06 Jul 2026 03:30:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d786e7sm3979074a12.16.2026.07.06.03.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:30:12 -0700 (PDT)
Message-ID: <90f35f11-abf7-4b45-8530-18a17176bcdf@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:30:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: Use hyphen in node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v2-1-90c781ae0417@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v2-1-90c781ae0417@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8Q8G8Phsw7mJeUB1UK-pgbIIvq7KqfTD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfXz64f9VY/ZYXc
 oa7GWW7xq6LIurrQcoCf1ziu1Wa7G5ciFEPa0qvYH7tSnFoLD70sTjbPNyfFEquzilvdtoIBydH
 460+Qm9N/5dRcu9gINoEUEjuquiCa8LOSpSGSgkJ71pfcXr3n3jsX27pkKVdkP7wto6WrKBhWgp
 DlotPmw37KwjvmD+x1Ga1VqJkMWCVfj8b7qIsrmzy6wBd1Rehfh0u7oaNaAadccaQN/UFs+ad1g
 pSHjzSL/hIUOU4907+byCuLsvzqgkRTCbCCU65CVDBxBK4v0+R4/j5O031I90Od2KuQvAwLX4KG
 +38KhPDvMfcrvsJbgzYVOe9nNVxdRx7KT4wyQj7XC27LsnarJFyvSNP+PNHBEsqyWPLZIbE5KwI
 3Eis/U9xF7dOrckUHz/r5TmM2o333deSEF/DyG5xRiNolfr1MvzGGPwmlvss6+ZL9sRfCv4k4op
 a0GoZTWZh2sYAu6nVDQ==
X-Proofpoint-ORIG-GUID: 8Q8G8Phsw7mJeUB1UK-pgbIIvq7KqfTD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfXwYOj2rHQXhRq
 235vr7gIwXMuklzmg9NHaJIBQyD2pVhf40ialZ0Hff9q2X9D0JYFsfBHuTyarJmg0lxtgmMClhg
 Qrq1uVDtaUBO2tGFm2C1MBmSzcixFnU=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b83b8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cxglbGFaQTsLusRpAB8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116749-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68F1670FC0B

On 7/6/26 11:39 AM, Krzysztof Kozlowski wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

