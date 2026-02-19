Return-Path: <linux-arm-msm+bounces-93429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NxaJmxSl2kzxAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 19:11:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0301617F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 19:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD8D1302DB7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 18:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40E9352F81;
	Thu, 19 Feb 2026 18:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uh/6F4eP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5vyEnZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665B5352942
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771524676; cv=none; b=rFqrPQSjuowj65d5dz3LtWj42GIdkhkh+6wX92JSGVnJpycKKDEFIjDLVvygm4uWph4XqCoXXMsPyZERaIECp5MQWYJmhyDg6E8fFYQvUKJqhiRCdTc7XFQgFX1gYF09cVXDhW0vpiFjlcnidkzG9VpZS7itfbg1w5eYdEoFPYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771524676; c=relaxed/simple;
	bh=xvacaW1OysqWLNLZP3dNcuFwG95hURiYLwx+uhqifTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoCE7fb0HWenJ8R0Xk20XDrQGdyX2yQGWav7BIMKz54VU6LarlN0qppCRiGEsmuiq14riIUvU3r3Tu1AbKSwmrYcUBhjmeplGk3nRK7bFIq+JDRerhP7ib0zsY4FTUHGTEiRevBgh7yWJmKUySm5ZVu3eA5YcWNMK0idgRQa/xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uh/6F4eP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5vyEnZP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JDkLmZ3232829
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 18:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Li8aKO5Qa+Wo0IPQrn4AlzJySEcAv189KWIISoGMojo=; b=Uh/6F4ePWccrNfmM
	zo6aKP7rs7j6P7BaGFBUlOirMyBBy5CPoXzLbvDZl1vmH3msxUcDwLI7o0vCRaXl
	90QjhPmZ530rrMT0j0dO9ZQ5yc2Fa2N2VyUr0F7NuNt15yNhmgnZYppuRit+x+kK
	PZKmjMZBTeAmqqtqgoAysBNrYiDlP8FHfGdO7YTEfJwpRVydPKXvbJJA+yagR5DA
	zXGwzNWss5ZWCbvEUHnAb4aZsjECV5KOYOWHlnElH59WhIycPUsSEmI3QuN86OiR
	kGqTAHECycB1a+qf69QwZUXqsR7Psm5DpXn6HqDYWO/Zl2sSnrutq9DZrK9+N+Om
	gDawaw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfgakkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 18:11:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a77040ede0so13733715ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 10:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771524673; x=1772129473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Li8aKO5Qa+Wo0IPQrn4AlzJySEcAv189KWIISoGMojo=;
        b=S5vyEnZPI1tYyehtxyKDcAG78rLPe2AJk0JcBG4pgfH770+3nJWV1jQM2gy7jk40bM
         w1LhRtLBSOSyKrbm3JduFx2k4FU7mP9CkTg66BSk/5WuEJ3YgJoKOGV1Bwo4+vHt0N6I
         uGDT+40Z6oxs4/u0l45jmNx/WL7sNJCMeqX/7VzHMlwbMRb8PwGRBeJFioVYEWJt/1OY
         7rm6XpyLFpLhpJUf2YNEdz5v3L1DSTslHeOwtxqLyPtroFeIM1d0VSz1OnXxFpVLH8Lr
         re5GJbn+ewxENqUiEbJztwtx+o9j2PVCQmrHO0i4QsztTvpMHk1ZKw0+uaGsF+k+AQec
         92aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771524673; x=1772129473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Li8aKO5Qa+Wo0IPQrn4AlzJySEcAv189KWIISoGMojo=;
        b=WaXFEDH214CdcbOhlTh0zQIpFnhrb6m5apz+wX1avGnoalhFUwO+IpQlB+2LFfG+OP
         EUzruShZP19XxCIrkARxrWFRP7xTWmJzYenw7uzcAhLUzjFs0/2p0ESv29AdfAtEaCKh
         G3l7SzrVrKaBiO907rDVVoQQFJ+VhyQeed6/KrhcTakUMUKiB5lltPH71JT+YixhGEgW
         wDzNePPj4Xmb033rjp23rY6Iwgc/FXzUZtsy85DfYvzuBrET7en81QO+9x5Hlw0Z68L6
         69vh9PuWptHpFQ7uaa1xtYhKw1yokRKBOLqhXSfvK2tfyknl1zWb7MVnWfi8bRkvkXtb
         Pxsg==
X-Forwarded-Encrypted: i=1; AJvYcCV8GCUUbSXAzPMO78npWwKka6W3XzkSStxZxQEZ7UTrzVeHgxCZd4RwpI5XmJWIKZ2aXaWCi3wfgIhbCLRO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9XKTObFbp958sJNUBrde2tZbk9Uui1vH92H5ruEXJmlPxfjk4
	AOY3epf7KNfC0cb5y+h5Lo9h4muw7PeFPH2DrLUuKgTmlLYimEXGcSfKAMnepz38oUElrQCfZrb
	lxzppi/L+GNzBswnesgI+XriYMBGHwjxTQH3+gpMPdT9AQy9xa22rUgRCJgXSEZjaKCa4
X-Gm-Gg: AZuq6aI+VG6o4ykd1+5za19lpwzTnTbitm9JlVA3l1wGwr6jBeFzwZUPOBnSamxyqBU
	tzgZkYDJ7KljmT3nvR4WRPGQ9p4zLY+E1T5sCeJJb7xG3diT9T475De2yGQBhUnsc8rqgt0haqP
	y2t4EGKe9klojTUafimt2aUZIQ/elQbNng4YJY8PRlKdp9GjMOHFr3RPRQFqnWD3fdW5BEDGxJ7
	kOWJVOX+MD6dtlmzxEYjbHQOzCT+Zuj0Eg5RwYK+LbJmh5vL6p4frNoNP1iPCKLmyCAze8t0tq/
	CJbFTzDRl5iVpCAQutiTcQXaRknal0kVbHIiAQ8TgZq9DINSrm4yxFFN9BRKcoglGsLpDmUBHGl
	r4WWwn00kAjvaG3JrSm44L46Ya6RV3NM4GJMBk9nm1tSE0vIIQSNo
X-Received: by 2002:a17:903:3806:b0:2a3:628d:dbea with SMTP id d9443c01a7336-2ad50ed2f07mr51585435ad.24.1771524673267;
        Thu, 19 Feb 2026 10:11:13 -0800 (PST)
X-Received: by 2002:a17:903:3806:b0:2a3:628d:dbea with SMTP id d9443c01a7336-2ad50ed2f07mr51585215ad.24.1771524672780;
        Thu, 19 Feb 2026 10:11:12 -0800 (PST)
Received: from [192.168.0.103] ([49.206.59.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6f9d34sm171022145ad.11.2026.02.19.10.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 10:11:12 -0800 (PST)
Message-ID: <857f0582-8b46-4bfa-8c62-5ca6f3d0aec5@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 23:41:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: dispcc-sdm845: set GENPD_FLAG_NO_STAY_ON
 flag for MDSS domain
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
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
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <wiztxwsea2aojcxmcs2q4vskooli7lrw3oio75bij54273mrbr@ody4vonry2qr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -s6FgA21YdcGBTM-vJ-B4S-hytVr_lWV
X-Proofpoint-ORIG-GUID: -s6FgA21YdcGBTM-vJ-B4S-hytVr_lWV
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=69975242 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=HeaAYArbXk87yN+lODdNzA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=3hJzyq8Zk_V8b2OfjNkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE2NSBTYWx0ZWRfX7kI5vkQY1wS5
 c19RjIlEZa/jVCAyDk5yqdR/vhPupwrRsqQhU/hogx4GKE6PeDYSbiwcnhAfSI8ZSWnQCZ7Ljg2
 jodd21zKxjIwp1zi3SHY0qVIHzuG+ybCfa0dtw6FRrKJ5946r0qXagn21ZL0VNRDCqdwyDRJC3u
 lUT0qkFLWh6shXVfSOdoEFAtaOffY2sVn4TdAix1cl446lEINFnlR0Hdik69KZn9hQNyw8taOlA
 nscSB+y0QVwoC/kft5crfrhCZFpthPfoh4b9eK1ssGwaWuVhguCFJ1t8nnsHeHZqlirDLwnq6n2
 VdRY0r05sDb+uMcRo8LKLHB5FkNEnv3EkzrmgrLrfW9AifD9nHh0c/7yDB3tMIISRQ6QKVsLk7K
 a5UE4aBMrQyx6GRKpJLM7oPLb+7cQ44vHLp1r5Gv3PSdiZaGjIyMlUhLZsJ1J4Pc3nTk0/676IJ
 p0C1fZLijAd4Zku35SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190165
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93429-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF0301617F9
X-Rspamd-Action: no action



On 2/18/2026 9:28 PM, Dmitry Baryshkov wrote:
> On Wed, Feb 18, 2026 at 08:49:34AM -0600, Bjorn Andersson wrote:
>> On Tue, Feb 17, 2026 at 11:20:42PM +0200, Dmitry Baryshkov wrote:
>>> Since the commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds
>>> on until late_initcall_sync") setting of the display clocks is partially
>>> broken. For example, when on SDM845-HDK the bootloader leaves display
>>> enabled, later the kernel can't set up DSI clocks, ending up with the
>>> broken display, blinking blue.
>>
>> This describes how the problem manifest itself. Can you please document
>> why clocks are partially broken and how that relate to the GDSC state,
>> and why setting GENPD_FLAG_NO_STAY_ON solves this?
> 
> Probably the best answer (for the second part of the question): I don't
> know (yet).
> 

RCG update typically gets stuck if the new/old source is OFF while the RCG is ON; but
if the RCG is already OFF, the update proceeds safely even if new/old source is OFF.

A possible theory is that if the GDSC is in OFF state, the branch clocks will be OFF,
due to this RCG also will be in OFF state, preventing the update stuck issue even if
the new/old source is OFF. But, if the GDSC remains on until sync_state, the branches
and RCG likely stays ON, leading to update stuck issue if the new/old source is OFF.

Ideally, if both old and new RCG sources are ON during the update configuration, the
update should succeed regardless of the GDSC status.

Thanks,
Jagadeesh


