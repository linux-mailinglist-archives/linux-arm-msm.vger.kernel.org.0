Return-Path: <linux-arm-msm+bounces-116755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cen9OnKLS2rjVAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:03:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A80A070F9BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:03:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y4O924DG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="g4HVKG/S";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116755-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116755-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 257713003811
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C604B3ED5AE;
	Mon,  6 Jul 2026 11:03:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A2A3CB8F0
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:03:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783335792; cv=none; b=IhOSXbDCT/GLDS+zbkUW+y2cdF1zNJSKjmisQ90f/tHMRyI0jOla6skWFYz8j4giPzSaydjjh2VopwLqFFbz4isePPQVeCy0iUmKp4vQTN1+1YLGGj/1p7HsyYijWfQ17w0wfnQAYvKo8nYxN241IOCh1QEfl6dMVvQlNtdNby0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783335792; c=relaxed/simple;
	bh=LsceVXmIVqblkEsqiJDufoAHGgW1q0gMF8K35wWqHws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awnCfKa0rsPbjtGB4uvG0lU4cNq4Jx0T7m+A2ubcBuwG/IwQ7oJMjFzD4d/JYlObSTBKip06HdbnymB1mlmIYxU9DkJogKJrCQ1vo3u9L4Ead4Yt0AUhSHoZTWsytD2PwY+cH45Rt2DDpnWhnI8VYM9ZuV/SRjOk8t5aNg68oPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4O924DG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4HVKG/S; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxCjj238124
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBvpUaxM4cQy6esLgv4X661iQp5nyh71jp/dBjXyluw=; b=Y4O924DGE3oaXZuB
	N0C/2Sb3+oxDqQ6tu9s7LXtmI0FcDs70HxQwTZR+WzzB1yoTmgygljGBod6ttdpq
	xCzN2sInMe5oSwaOpk4qdmZzhI2lnhrHiWo7E/3aG9UIZKm6M5QamwOnmBEecHrk
	eSnnlFcmuVXFLJfOpRJtu+grJiBtgvaYvlOCibjSuEKkVEm3kdXgQN8083YA1dWN
	/K10PxE7zIRrPA9cfRJYbB8UbgB8UZPI8KYspF/qP/C480N6zD+hB+scnA0cKyFl
	Jh8umsPi8YBwSg7B/Peg66PJ6HhkhC+wfGD6Xo9k7+JTphKKENKjfnlRvKvyP7Qm
	jaguEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88mbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:03:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6a20348ceso40500725ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783335790; x=1783940590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gBvpUaxM4cQy6esLgv4X661iQp5nyh71jp/dBjXyluw=;
        b=g4HVKG/SAnxTqOQTDMUlJZMcAALJ/+629S2pX/qBJ6o7X2UsvXswzqlQCqAaRs15P6
         Y5kac9rntlm78wF5aLLOPzy4lZ0ZjQ+rKv9ve0PntsQaucCeUmE7s6w50Bh2sBVUbiDV
         yM9YiVqaaBVoe7eo2q2js7ap2GfYfhNlfo9tm0VK/1vb+VmMkljV8DEihxNGkhF/doI4
         RqXu208MvppR68bDdPXeeFQP0muCGbYmqxesJQ6GLjPlS6gWnBAFgqQw31VSK6Al4pSf
         Cj+Irfu+1d+GuHqqxZrMQj3oVw4ZCab+nQLBIMAWi5YjJdUWyGKSlYc1t0OquLwaqhaB
         C43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783335790; x=1783940590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gBvpUaxM4cQy6esLgv4X661iQp5nyh71jp/dBjXyluw=;
        b=ImjCkQdOTgeJD0hCevkNuINDN46Z7inJUzaBBv2+TFaHaiQ7qKAKpo15SZ0p+vhPXI
         Qo7BiDSTw3kIoNd5iXLb6jlZpScWcbGM2/lKUliZ1LIiG3dus4phJ2ZKy3RhDHruAH/X
         bafD14oJ7AOkICsWhQlc4Ax8nw/Qdyv/PCJhXzt1QMbD2MKFtQ8llKybEY633KkJkX9N
         vimaB0wc9bwAJgEGX+J7teL8Eve5gaartdygKoFh4+F3qUQJlROwgb6B4LhWWxJvmYSs
         f29ZkE+HBg2skEefEXDn8j5meDHfaoAELErY0I3gELA4cnRvxV7sMI9irm5PAVOgpM/a
         TcPQ==
X-Gm-Message-State: AOJu0YydSChr6QuybI/nlMaWNuuv5SkjelwNEbyKsY9OQvdeOHnTYO3D
	pxUlAF2ExLPWT1CvIUH0wEcUoyKgk+epGUbcUmpJvgrbCMDGQLMMj4z+Dmz3my/8Y0JFeVDCg5G
	oo6dLuAMdr/oui6eBqavUmw02xVdZh4uoY7YxgpaJzmvFBNjJcnQYEyZPPCCPDOzggFxM
X-Gm-Gg: AfdE7clNwFVMrFbl7U2J2nFrTTBNLbATFSSfnUN9h/9RCnlnzGgiF3Bab9OpUOyTp5q
	OxqZFHlwuRDLSJI4b+O2JXIneFGhX5iYI1IRjjDYrgmFt/iAhSFZDJ+mUAM1NO5OaIpoziO0icM
	G0qVYbXigicjDGQpOeozvj/zjknu4zjca2K42uBM/TQ8kiCH9gK7jOm4eegnPPVZxUpvYWbwJQO
	yd1r8KMG8BzhO103s4WQ4lAVDIYSPt1XV3PKIYBiT8znsWz3otQVgCuolLooT26x3BUNkXlHR6B
	NZFQMNwsc/2HnW+RDncXYf+TNpPrxBgIjjBf1uSgJR7LqbIBD4nJ8QqcgLp1c4j08soB/H2Fye2
	QZnq07Ewj/qIRA+nF8uDcvKThbiq8uYKL1kuzZI+AioM=
X-Received: by 2002:a17:903:1208:b0:2c9:e9c7:2b59 with SMTP id d9443c01a7336-2cbb9ee5fafmr89800075ad.35.1783335789767;
        Mon, 06 Jul 2026 04:03:09 -0700 (PDT)
X-Received: by 2002:a17:903:1208:b0:2c9:e9c7:2b59 with SMTP id d9443c01a7336-2cbb9ee5fafmr89799535ad.35.1783335789224;
        Mon, 06 Jul 2026 04:03:09 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad77651c2sm48462225ad.49.2026.07.06.04.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:03:08 -0700 (PDT)
Message-ID: <48bee604-53f7-49ed-a757-554c4a83aa23@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 16:33:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
 <ba96f5e3-6b6e-40b6-b6c1-300e862e8ee4@oss.qualcomm.com>
 <d3be45ab-0390-4d0e-8d5b-330a48c529a1@oss.qualcomm.com>
 <1a0b91c6-5e17-4330-a8ab-ac14d3339024@oss.qualcomm.com>
 <ffca92db-a3ac-4345-8477-1f53ec61ef16@oss.qualcomm.com>
 <56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMiBTYWx0ZWRfX6hqiy6P9vQOO
 RLzsiUj9Wtek49BDT9h9nfpeHclqYscgIOFBhyKVQ5YueDoSifnQodGDlZTN3HGR8Ym0ATpJjRk
 YtzzoHNx23lmtHOEDkbZ8ZQFc+zaqMk=
X-Proofpoint-GUID: qT5JyT6yoIJvaUagK-iUT3lcwUmdle_5
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b8b6e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HXWJYtWaUMqhmI3DdLQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: qT5JyT6yoIJvaUagK-iUT3lcwUmdle_5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMiBTYWx0ZWRfX5KbnSRVGbt78
 7XbyZwZKmuZlvPDHUAtpnSVvjH9qwcct8HIlDCkrCYraLeyrOXdEySrjpVi5vL23nSQpWk1fE4+
 kMob7vsjLdlVGpC4Vp01f2reUje2BiqGQMw2mEq1Yhspjxyb03csoebwa3PDhI6MQGnt5gkJ2As
 cjhT6CkjVbUlqsRrmInG/9lca0Xv5E7XVGX5+Nwq+5Wumv8nmyMlIxb0NRSn54ttZAjpZl6merV
 RdUtHCe8m1IeSab9JxFzzZp1ENoprqVDaK/eQPjEedmDWsMzyhLVirBCIJEhihUkA8y+1bs7mO4
 UqsndkptP18f66loq2GKHvskR2ruhCvmTjLPBiswHC9lpqw14UyvjtlwGS1b8q0qXM6V4kUeTqg
 u548PSb/853UE4w486JBaFXpCiQTIACHXokoL77qlQZddLXid3k17Kl7Rqq8t9lOkCs/Tf5Qh3G
 rqGTFKcyf/f1AHPvaqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116755-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neeraj.soni@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A80A070F9BF

On 30-06-2026 16:55, Konrad Dybcio wrote:
> On 6/30/26 12:23 PM, Kuldeep Singh wrote:
>>> qcom_ice_probe()
>>>   -> qcom_ice_create()
>>>     -> devm_clk_get_optional_enabled()
>>>
>>> If we remove the _enabled suffix and put a ice_resume() in ice_get(),
>>> I believe this is no longer an issue
>>
>> I see your point.
>> devm_clk_get_optional_enabled turns clocks on, whereas using
>> devm_clk_get_optioanl will only get handle but don't enable clock.
>> Please note, clocks are needed at probe to read ice hw version 
> 
> Right, but we don't need them afterwards in the probe function. We
> can simply gate them. There's a parallel effort to enable runtime PM
> in the driver:
> 
> https://lore.kernel.org/linux-arm-msm/20260512033750.3393050-3-linlin.zhang@oss.qualcomm.com/
> 
> and with that all you'd need after getting the clock is a
> pm_runtime_resume_and_get() before the version check, followed by a
> pm_runtime_put() right after it

I understand issue can be fixed in driver too.
My argument/understanding was just why to even probe and check hw
version in this case.

> 
>> and then
>> later ufs/sdhc fetch ice instance using of_qcom_ice_get() and control
>> suspend/resume path.
>>
>> But my idea is, if storage itself isn't there(like sdhc on
>> qcs6490-rb3gen2) then why sdhc-ice should even probe and check hardware
>> version? as there's no significance in even probing ice.
> 
> On the developer/customer experience side, would you expect having to
> manually enable what's essentially a sub-feature of the storage media
> on every single board?

Umm ok, I feel it's pretty subjective as enable required featureset(and
it's dependencies) only if user is explicitly enabling it.
Controlling from driver/DT can anyway fix clock powered-on issue.

-- 
Regards
Kuldeep


