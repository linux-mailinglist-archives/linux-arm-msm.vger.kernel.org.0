Return-Path: <linux-arm-msm+bounces-105284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBygM6vu8mnhvgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:54:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E4449DC47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF88B301158A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF0C371076;
	Thu, 30 Apr 2026 05:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIoFDF00";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STjD+HeI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6233A19D092
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777528306; cv=none; b=IKz+Nd3rNY+YfDubSZ1UrSJ6ThNCIoTA30UZoGoli1GStzdgqHVAvwIeDaftwdtNmmiAxUPatHjwFPsCO7HkmvhAU2ho/Sefuhf5Oi5vR3mLOWeUc/0FD1wY4ZzkDfByijzqF93xWJlUyWgRvHuWo+U3k+fkCQrad7wqdY/SepY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777528306; c=relaxed/simple;
	bh=CgsL9lPVU9qlSBepqHiQxE4D3Owbkt5paVOqB8gMMOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVvXpgWCFGiBOwE4pc9nNpQJ+NKw2Qi28FAZf51cKTRpnrGqHirAQkEC0OREzIrE45jz0SaX2I9RhXPsWz9QBn3aQ9Idxv9ZQo/YxUp6OuOksuSz2sPzmm57OuRQoLrI/Kz52r1LKV+b77NkBd59fq7VoO0W/g99c0YUWMAXqrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIoFDF00; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STjD+HeI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U59JIP2907497
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBo8ysA1qyB2SNrMg3M4cw+4GiEHzW7353RLYSNaXxk=; b=SIoFDF00jacDCQNv
	i3fu10f9ds0/OtMoHPEFVd/6Qx39sk0UphPrlu07uST1WAn7xgnhza6bHQIxF8wA
	Okq2HyKddErlj0Xj/6dcN1RJi8Y6CjgImTd49bB7GbR7/qiksoB6G3C0xvJ3cR9X
	y76UzzksFCsIXLCXYAm48Ui1GELWl0NyictWSXXP71am1DKRt/QMWJkP976JgwzB
	5ekHsdoajKWjMOHtNlpkEHblVHwH0g2d6KhfdRupL2agjCUJlNR7HAILigz1CrTe
	tiBX91nNXxzT7PdtdSYvPteLEYR5COA01DCvM/mgC4W3OfIiJCkikmuTCrO9zJAf
	NtIPJA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pf84a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:51:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3648018e142so609349a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 22:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777528303; x=1778133103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GBo8ysA1qyB2SNrMg3M4cw+4GiEHzW7353RLYSNaXxk=;
        b=STjD+HeIJUgtNq+hBQVDZgpi4Gb6iHMXiqIeT8mLVNcJP2TJPhCy5o5LLX67JsBAMZ
         Ud2GAsYqeLqpjlG/gr6Oif9SSikPJMQduZwaXdK73r1lgWtHR7KH7ox482+d9oPl/kcN
         XmIDKAArHsn1S3zfkGWRV27t2LEA2/oRec2PvCn17q0xEef4rvaKDp7OsfA77fbMEvIg
         OgaVqOrpUiqX409SbWG9uzmtCsldunEKTkHCEgfgX1meMTiC/fSneVWN+v0960mT6y1m
         qxmv9bq6rG/pwmELu7I0Hh+mrosqepauQZdSBCWTJKzGInda156X07pCeJBiNL1CCVaB
         AHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777528303; x=1778133103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBo8ysA1qyB2SNrMg3M4cw+4GiEHzW7353RLYSNaXxk=;
        b=b4zEVuLBD8LpUnSfujv8pdDinq4BoOT8DDA4MGR/pDpQqjhMLljljyI6uKhKfFGkOL
         BdgTyf4esB9K2md6gyiWzKqSNtmT7pTb2aNLBB2qGDV9qdEi0axZti4kNX9JfCWq2ntJ
         4PhB05Bf3FmLU6j6hrPjQ0g5iF4R5+8xxnWxje5XBmKlrBhhdJ8gCJEzhfKEJtk7G966
         1RVwwnDj3dXS8rV+d9ZpJBS9q09sbfnDfBMmXVC2pdFKpUTwBp4QlL7VUB4huBCN/0OJ
         lX3QThQEOR0LxQ/v8dNEKwDP3pCnrnB1XExfZ1E9/JaqKeS/qSDWyeY+pEPgxMxuRVnu
         R8VA==
X-Forwarded-Encrypted: i=1; AFNElJ/meayA/tVAYm6eV27EAQ0Dv61K+tjAc5hb/MLiZcuQe01qm2KAg5S8WxP2OtCRJf1CeYIeYhwGw5kIQ52v@vger.kernel.org
X-Gm-Message-State: AOJu0YwR7jQGrp/GEoLk68PzQO98ArIDCHCnFt6cObRK07D7f9skY5b8
	5vZ22QP24eEy2l5VEqoILfigw0eLVNmGpoIMyBg7sbAoNhXg3dEUrtfhazV2r1vsDBtDYmVHHiY
	Hm9U9jvko/8Zfe06yILzT/V7T6QuMihgirqPVDmkj1r3nlKiLbAjAXgAvIPneoHC/iF55
X-Gm-Gg: AeBDiesRrP3wdyGzSqyDZAjymtUyLMm8hCATRI1D+U+ULkZ1HKPlpYYkTnl9zAOa2zt
	C4HzmjryRsoeVtACqi2MnsQ6e29cyUjc3cACaSMdcbtZ7dI5bjVyq7GjjwrT9EwwdCzCBA+f7fN
	Q7UC5049ryvsmTpzOKilV4q0vYvL13hBemKftxwyXcZbYaww2KZZ9sbvd2Co1YBOQH/loWyXdPm
	kXr/tyl1s36QTl4r6DCAiLMtLPtE/zNQYWfSvvRufCWVH77O3Jb2C1pOw+6lG21FsJjCqNBzVTE
	zk4tZwhQ8gg19Fl0dZuMJEh3cIqlpZo1jkSXCdL5EnN3Wc//jMjSAhmYlPYTZ+Z41MaHnCNrzon
	OhF8kpxqvv0bwQHnxkN1oglEZiEHbQ4bEqwE1VHZQwm32QUZnAWonb9rV3/faBQwc
X-Received: by 2002:a17:90b:2ecd:b0:35b:e550:e68a with SMTP id 98e67ed59e1d1-364c2f8cf70mr1346451a91.3.1777528302987;
        Wed, 29 Apr 2026 22:51:42 -0700 (PDT)
X-Received: by 2002:a17:90b:2ecd:b0:35b:e550:e68a with SMTP id 98e67ed59e1d1-364c2f8cf70mr1346420a91.3.1777528302532;
        Wed, 29 Apr 2026 22:51:42 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm361576a91.5.2026.04.29.22.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 22:51:41 -0700 (PDT)
Message-ID: <a4825fa6-bdeb-4d2f-b7d3-050bb37ff7ad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 11:21:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: dispcc-sdm845: set GENPD_FLAG_NO_STAY_ON
 flag for MDSS domain
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com>
 <vbmo6qvepw5sjmtrffkdiaqulgqrhxlo3lrlzxhjz6i252efvg@uyhzdskc3jut>
 <wiztxwsea2aojcxmcs2q4vskooli7lrw3oio75bij54273mrbr@ody4vonry2qr>
 <857f0582-8b46-4bfa-8c62-5ca6f3d0aec5@oss.qualcomm.com>
 <mgsigotfsu7xbquwgsrrm2rctx2e5xjmaijg6b7nzaedqerefi@oxvufd72novr>
 <c8425943-850e-4665-8d23-f5257473b793@ixit.cz>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <c8425943-850e-4665-8d23-f5257473b793@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA1NSBTYWx0ZWRfX/lZ4Ckxs8WyH
 taqGMuMbcf3tvsYkCUuWaE1nVB4PkHtC+Yj0iQQlEfgu9a94KVUJvx+nU6y9VP2TOVgG/Pzuifd
 kHoD5COHJvMRxt5/n4oG+hPhT4GfEi1tkey1gvdK9NSbEOuWmi3iMjBKfok6XO3m5EcttkO8LMz
 FxeMu4i8Ynw8rdd7XWlsDPcz8dtxjq89R1c5/UqpRZfmGCUti3R7Il/Ahxma9/fqFEsqCIvTkWq
 JREffEeeOrnQ+s69X7VKckFJuvtB8VYIbe7s5Sa8e2ubA4L3kgeOlbpGPD/gLyLWY5WH2ELYa15
 1FkmHZ41vWjtIpHvBE9e0QG3d3jd9MtOzwR1W71GSY1g/W6wm7xh7O5OVwjtge5CFE+gohJ55Du
 2eALveMxc2FFH/A/ydnos34314dNB2iIHCCIuA+63JsH4j9kBA2dRt2s4S42Wt0+5TdTj5MIaVd
 3vozaBfcBNswITACHvA==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f2edef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=MnzUK-aiO01mxYzieDsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ph_jD37kfFsPJZEjdpUf0OuDEp0C-I1b
X-Proofpoint-GUID: ph_jD37kfFsPJZEjdpUf0OuDEp0C-I1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300055
X-Rspamd-Queue-Id: 55E4449DC47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105284-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/29/2026 8:52 PM, David Heidelberg wrote:
> On 23/02/2026 02:27, Dmitry Baryshkov wrote:
>> On Thu, Feb 19, 2026 at 11:41:06PM +0530, Jagadeesh Kona wrote:
>>>
>>>
>>> On 2/18/2026 9:28 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Feb 18, 2026 at 08:49:34AM -0600, Bjorn Andersson wrote:
>>>>> On Tue, Feb 17, 2026 at 11:20:42PM +0200, Dmitry Baryshkov wrote:
>>>>>> Since the commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds
>>>>>> on until late_initcall_sync") setting of the display clocks is partially
>>>>>> broken. For example, when on SDM845-HDK the bootloader leaves display
>>>>>> enabled, later the kernel can't set up DSI clocks, ending up with the
>>>>>> broken display, blinking blue.
>>>>>
>>>>> This describes how the problem manifest itself. Can you please document
>>>>> why clocks are partially broken and how that relate to the GDSC state,
>>>>> and why setting GENPD_FLAG_NO_STAY_ON solves this?
>>>>
>>>> Probably the best answer (for the second part of the question): I don't
>>>> know (yet).
>>>>
>>>
>>> RCG update typically gets stuck if the new/old source is OFF while the RCG is ON; but
>>> if the RCG is already OFF, the update proceeds safely even if new/old source is OFF.
>>>
>>> A possible theory is that if the GDSC is in OFF state, the branch clocks will be OFF,
>>> due to this RCG also will be in OFF state, preventing the update stuck issue even if
>>> the new/old source is OFF. But, if the GDSC remains on until sync_state, the branches
>>> and RCG likely stays ON, leading to update stuck issue if the new/old source is OFF.
>>>
>>> Ideally, if both old and new RCG sources are ON during the update configuration, the
>>> update should succeed regardless of the GDSC status.
>>
>> Both pclkN_clk_src clocks have CLK_OPS_PARENT_ENABLE set, so the parents
>> must be on.
> 
> Should this patch go in as is then?

Yes, this change keeps the display GDSC behavior similar to earlier code(i.e prior to
commit 13a4b7fb6260), so can be mainlined.

Thanks,
Jagadeesh

