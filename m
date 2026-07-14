Return-Path: <linux-arm-msm+bounces-119043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yF2ADHQ6VmpW1wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:32:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C117552B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:32:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ShO+cN5y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IqpMv0uo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119043-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119043-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4540430A9CEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C3E342532;
	Tue, 14 Jul 2026 13:27:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AF3333429
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:27:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035633; cv=none; b=cFkVH9SWZvflpglcHnm8MeK4hQNTGYI/3Md4eyFM+3oJmfgcbC3MEJvIMsHTkU8NEZ1ZWZf5x4PFqvbsNom5PIOSZTP9z1XAxJwHKBVFLoIZa15tL8bCWmk2lCsLlr+DssS8oeZvF8ixlxg5kEE4P0J9aptuH6m1BuOKjGkVEbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035633; c=relaxed/simple;
	bh=iHnQjrdhkq0yToVO/2sP88yjAA/PrFDvh7chWWZ31h8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixDmNl0UYEjBMq1041QG56nYlXK7JtQl3tMjYZyqbJ5xNZm+AMJ+7YERucBB7rjjGMeFRY5QL/z2N7Yv1ZGDCtbbNp5lPzPJQsTWRufNf0rJd3N4x5AmWUerN6FEmvnDX8Alj2dd4iqrRQJCFWjiI9QDLI/+3gN1/ixt0i7EmmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShO+cN5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IqpMv0uo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ED3dsQ673993
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHnQjrdhkq0yToVO/2sP88yjAA/PrFDvh7chWWZ31h8=; b=ShO+cN5ywcm8pBTw
	OnALHQ/MHbxlO5oPszMFb/PC2HwHCoolKPV0I7qHlaLKNN861PoLeDu2JETP5fz/
	o4r6bfrbP/7UZBIAxCL1xkxyBn/imhu58+OpAEvLEc1/SchDzzwzcaD0bsh8Vsxw
	aGtTlR0Wp6CrXni6J9Ff2i5sI4ep4XtrIs3KmIYcR6TDO4yGA1Kr+JvKCkM7uiK0
	4Rao56yhhSH2LUY1XxPGG0MkJBNguq5Hw2Rs3K2IGseFbtXSgRPebbVeK+K0V1wg
	m/asjob9YLkGke8lvWdYHADDqvYh2nmN+QPNUITgsWHskiEAedmKqjygK0hArsAe
	tufEmg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqr4fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:27:11 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4488f192768so4460077fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784035631; x=1784640431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHnQjrdhkq0yToVO/2sP88yjAA/PrFDvh7chWWZ31h8=;
        b=IqpMv0uo0hAUwpvpcKRJUf695JgKFZjEHWN6BfqZeARD9kKE/kJFSke+oQGlj5n8bm
         dS8mZQsRLanA2DlcaABHiTMoQPpIo4OAWAysuT/x3Wxwsy6F9KE46kxBQHP41cOSv7sy
         Dvae7pTYjULBKxktHRbDa0ulFhLXxH1jkAxjtN+gJGUUD9kpHGGUFqQAuZvOHOqN8Nua
         bAO594cosG7YTuTtaD6/TjfpMECDAbPJD6GkKv/HANExHWeZT78s/8Oi3O62220acEOw
         3P9yW9msFaU1FtVaC8Ms+Nc/xPumzClqBR6KSHEincgT37NBF7LvOEvU5zz8JLcrzTeh
         s+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035631; x=1784640431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHnQjrdhkq0yToVO/2sP88yjAA/PrFDvh7chWWZ31h8=;
        b=iSunTAItJ4au1AGZVomPPtSa/msu8vETjP+nUzsVlBPp41BK+OEAD/znhx9ogzhoO+
         UB4SJOy3EwmXEJobj+gAE8y0WUjxXEd2AZT0/WfMutEV1nPL24q6WrksUPz89KRah0qH
         906zLAdP6hmDHdnJLnz8D/mHYlfQdqcQI/VHwdrvfaQFh7UYMCe+iZlkenrvVJEnmQbj
         8YLbDP0b89NoD81oC6v1BLBfwjrMF1SOhqEKUyoqPgY5W7TFYpfTJjtm2bVcePTw86Jd
         Q742gBzhYOuRE2gTz0WBF5bVy4ptTXvjMy6GMtSdOBNLnvbyEVmqrIF4MRb9Gi2ByMG5
         TkRw==
X-Forwarded-Encrypted: i=1; AFNElJ9Upz8wCP9gCTo75TVDL2Gw/wSE7WA5eKkg7pa08NVK0di3ZMc2lu2VOv7mH4JTaOqIwWGeoO9ITdEWGhst@vger.kernel.org
X-Gm-Message-State: AOJu0YyOamhLv9bN35EfhLJeiKETV6AlxPUVFvZuMsd1e3x47ttJT5Hm
	zjZlwFVyhq1HqJ3p7tWFv6CWi+hu9CYUbY7crGTXQeS71XuWoPv5zpe+oN6yojApTCPbxtjs9k3
	uvN7HdIyE0sS35JqXSK8/k0JYlTNedHxvYl9jiD9ZCqstMBmdxaroYvg6cw5uHfbCJJH9
X-Gm-Gg: AfdE7clxis1Ehk0Ieq8j4NNIdvRBGUpWJ85x3d4sGxUUJEcj/i1Yd3e8tWPwMbbeY9U
	TP9j5rCUCZWrsAlzm0JTTVR/Yd20LsfsveqjVDetVeQ0ONmRKDkmSWa6EDsMv/IfdlhJIf/t7Dv
	m/s/k1UNpokoeDnm1O6JOoKiD4fTjuafg4/kFqiyc9RqVzL05WIEpaecrJ8G7QKV2k2xd7FRQzL
	p2EJmabV0s8BOYQQZt7mA5mzaUbZA5CEMI+7pMm8aiwZ0HPc/wewJkDBK/bOLoUmP/nk8oc7bwJ
	PR1jtg+G345FqqVtQZlhbbecF+N6wBVqMQNRySHMYiW9i05sywop7XiJrZgeQ0x9LeiyXAVCL6F
	VMHBsxT/nNtn9hCdA/IaYj3Wq81/2KxJQHhUiqiMZ
X-Received: by 2002:a05:6820:6ac5:b0:6a1:7644:7728 with SMTP id 006d021491bc7-6a3cbc0eb8emr1157687eaf.67.1784035630736;
        Tue, 14 Jul 2026 06:27:10 -0700 (PDT)
X-Received: by 2002:a05:6820:6ac5:b0:6a1:7644:7728 with SMTP id 006d021491bc7-6a3cbc0eb8emr1157654eaf.67.1784035630055;
        Tue, 14 Jul 2026 06:27:10 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4546f12a6casm8842235fac.8.2026.07.14.06.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:27:09 -0700 (PDT)
Message-ID: <ba15bca4-2cf7-42f2-a937-9c2b5217a2dc@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 18:57:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm2290: Hook up MPM
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
References: <20231215-topic-mpm_dt-v1-0-c6636fc75ce3@linaro.org>
 <20231215-topic-mpm_dt-v1-3-c6636fc75ce3@linaro.org>
 <CGME20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55@eucas1p1.samsung.com>
 <dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfX/4dg/0+N1NgO
 peXHwjJ8m81MI5k9pT6HY57GnXyX05X9/Vj4mGvNR99h0wxQ4QAASuZviggydodBMix0fgWbjF4
 OZ6THsfNOaPbM2hEDQ24Q6DOYygL2+lTMqJCg9d1NR8iQW0y/rBE29EkIdNprZT0emfRha46BIC
 MG3t4t7LOcg3oRf0YumqtmPv4V78K6xZQr+ZMp52FJYnfTiw+L1xshes6ykYi949Wm0Qm/Z6xZb
 gFGxDALClPxAsJ9Sp2jolmRouqHga+PIxMaayFJZGxx1GiZMn8frYcv+mQEnxwBKTHJ2ppx1CWx
 R+qF3u++GRGcv1rSB8dleKF/B7sG9IMNezMs+RX2v+uqeDk9M1Vtx2Id7HV0l1C71tvH/bL3Rdr
 V20LdbzLC6eIcWnWYHBGDSia1HZ3608RgK6YN9+LjTuFPxDmYqrWS4UuI7DXPFTcb2Z0fQ025jw
 RrNfq+3tMfSW27CbJnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfXxQkFlK4KH+bB
 Ek6B9LmlihDwt5iiBx4RACyXyCHBrJJ/u3EqFpS2Efrp0XxVKbCNfoZ+Th3s8fcXk4QZiJxWzTd
 6Gfto1rhbCY/ewA61KuW7fbcYIyKlFw=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a56392f cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EBkR1DUde-yCmfESiaoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: 216qq23YgB5Osa0xsfhJ2fIV7236_99b
X-Proofpoint-ORIG-GUID: 216qq23YgB5Osa0xsfhJ2fIV7236_99b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119043-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:konradybcio@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:robh+dt@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:konrad.dybcio@somainline.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ulf.hansson@linaro.org,m:linux-pm@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2C117552B7



On 7/9/2026 5:11 PM, Marek Szyprowski wrote:
> On 15.12.2023 01:01, Konrad Dybcio wrote:
>> Wire up MPM and the interrupts it provides.
>>

[...]

> The question is how to solve this issue? Is this dependency really
> required? Would it work if the "mpm" power domain is set as always
> on and genpd framework extended to support such case without
> triggering lockdep warning (it already has support for irq-safe
> device in non-irq-safe power domain)?

can you try with [1], which includes changes for agatti/ qcm2290.

The series is sent for other missing timer programming adding in MPM as well as probe dependency issue, but should
help in this case.

[1] https://lore.kernel.org/lkml/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com/

Thanks,
Maulik

