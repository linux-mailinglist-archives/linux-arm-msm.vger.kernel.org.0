Return-Path: <linux-arm-msm+bounces-111932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ujjA/bsJmpRnQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 18:25:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA20D658AD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 18:25:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hDYXo+nd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AucteB65;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111932-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111932-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1525830344C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 16:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B7D332621;
	Mon,  8 Jun 2026 16:18:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E442533A9E1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 16:18:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935523; cv=none; b=UXdTHaswWJcEQuW1n/dfAbCqAhjNv8RTi3jBmcDTxTdAHW1mEuHY2S5TeMSCYbJxWbBc82nEJHtoBqPZv6iS9/5sHrc6T9heqEnACL6Fv1hWSGDI48X0UOan8q7nXAc5NflwQgotfzrpDtdRiQHbAHaCb5VyPFEAb+4k5/yvaXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935523; c=relaxed/simple;
	bh=e8pZf8plrZyej9TnlAyDOk5VBoL31Gl/oUv8+6Ry5A0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQvm7MQVYm3MY5Rhd92r1AEB6ToYTtmtcdfoB3aigqs0eqchNLLHQgMWNrl3JrO4ATqDwtCgjgAQaLIUTbywMcoPWLHLG02Z0DM7HRzbWFOneAg2DX3IFHRAZza+E92+LaIlJD8HkOZXi+OX4o8kIohhCQDy9knfi+JsEnWdzZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDYXo+nd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AucteB65; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFSET4008451
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 16:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wN82TcQ6qVxJTHgTvwxJ3Z+eIR2T6ucnR+HY21rEwRY=; b=hDYXo+ndaCgs7v2x
	6w/SG6Cpd9D0RozsU4fQBBkpBclLm50JjDibbtZyh6WMRQLukT/Iif5eQZj4raCu
	kSghrhSOnK6q6x4a2X/GTf9AuyEfrhy5cqpW05s6Zm3YKT4ihKRaRJ/UQCr9wIJw
	e3n3VF+2do8u22f5Rz3SGpFIT5ujuTp/g1j8nrSQz7zrRA/DmDnUm5JEI2dlNJIR
	Q9Fff856ERovsvuSlrT75kh8K/i9vPbdQDirKCEVJfMU++bNeAKVXuG2smhD+sH7
	aj9+Jtx0YIPP0db3xCqwKwCR1dmviZNR0JT/zoMuf3wrLQcbgs7+J6FJIKtOGQpU
	jt+rRg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0j142-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 16:18:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84247fed609so2195659b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780935520; x=1781540320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wN82TcQ6qVxJTHgTvwxJ3Z+eIR2T6ucnR+HY21rEwRY=;
        b=AucteB65OFN/h7aWf+U8wFb9nENv6pvkNx9D3lvQ0777CBK/csyT1FWVR1moyyRpT7
         +4Mv3QYov4DZAmZ1vb60vILIUVXeR5H0knZwc1hOZc7Kza5CxGJbPPLR/X4rfL42lt4m
         sbQVSO/ELeCanJ1o9PBJtBjDCn4bkvRRdsYzw8RAn1JaLu5O3gvtZIT3kINuflwlM/cl
         TqZygBhKUd6Bi0hyYRjzSVOLLkAI1gcHMrNHkwuwsqCADB33372cgRZW2zbfssbQMLDf
         b5OU+lVLAIPdzNB0Z9xomun0AFiu1JrjTG/Mzyg59qwur01ZUIGJJuHTeiFw5XkAXqMa
         XPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935520; x=1781540320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wN82TcQ6qVxJTHgTvwxJ3Z+eIR2T6ucnR+HY21rEwRY=;
        b=IFvJGt2sPXLp1eLJUL8TP67Dk4V6DaO3uL5/E9+h/lXGu4k3Vo61KAyGNxYmmn78l0
         Loyd4w94X6TDdXi/2M/8+qJnQ2lqZvipy0uwKFPHF//mGa1D98CXbeTG3yX1dqPmqK6H
         ukdFcHkRKWEhhRHrfFdHJyXCK1WVLhJv7rn/sRFnDqfgTgDj4fdHFOUEJ7TfP6MMaPU/
         MPv0R7guewp1HbSg9nn7dz6wUGuxe59xDKUn820Oc+iNYWAXBEzpzy3G7tXLwGcN9Rdl
         LXX5nwD3ITvRQ3wmh4eTxBfosNfyF0tGgmURFv44vrxDpppZuUFG0NVaWwnk93zuEfae
         O3FA==
X-Forwarded-Encrypted: i=1; AFNElJ+RfiPA3Pr6UiU58LdWEPjfZUldB832F2T82WXEe8VfY+iTP/aeItZy0I64s8wC6mKh42SzH+6PdtILABwk@vger.kernel.org
X-Gm-Message-State: AOJu0YyEAz3AxBqwUiJo69cF26IfVHAK+O7/2X5jEGQ6GdLPTsDi/4lg
	O+MS/LpiDQbHVbj2rLGzJr0iEheO1aiU6X67STavVmsMX1XFXbJWUKATWnHV/y0pI8OaS57WmCd
	8iaa0jXqOC9DaH4kQNOnd1nOQHv4Mkj+pU9impyY0KOI632EpYXELbkETkfjjilh+4eHV
X-Gm-Gg: Acq92OHbWUavL0dcwrIGV2xti7quFvyEV+6rsdbtEjCFTbGHzky9ZQ7pVkGpL6FfbUh
	j7HxK3imzv9WVaQ1JF/oquB1SMwA3M/aUtufLHP3QetuTqtf7S2jmMprvZt++Sg//lGbo1cRQbh
	H8lTtoRxD7dXYGC/N7tzIiwIoMhCqUAvg0di6CzBpvoulRgKJOdERi8vUhgLGsZDdnEeNt0o59y
	SIPEgI3k1gG3JIRYyhXeDK2bIezH+g4R94HFl+SzCv3MQBt1ze1299mN6gnrKMZ0gbxZnVM2Wtr
	/TjHAvfWF0Cm8MRiCg7cLpyTHwn7GIvPxbcqhX/ing42wxj7rquMjmJlrpe13swkx1oIJCtYh/6
	uCMuQnxRFgaEinMJFC2tmeI30JTj05n3XztfFY9KsRxUFpVIa4Jn5nJzFhD8dp7P0
X-Received: by 2002:a05:6a00:2351:b0:842:5b85:63a0 with SMTP id d2e1a72fcca58-842b1102db0mr16141988b3a.46.1780935519946;
        Mon, 08 Jun 2026 09:18:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:2351:b0:842:5b85:63a0 with SMTP id d2e1a72fcca58-842b1102db0mr16141951b3a.46.1780935519489;
        Mon, 08 Jun 2026 09:18:39 -0700 (PDT)
Received: from [192.168.1.6] ([122.177.240.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fa877sm18865716b3a.51.2026.06.08.09.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 09:18:39 -0700 (PDT)
Message-ID: <d046aa40-3dd7-4fbc-b99a-be8076ef46f9@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 21:48:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NSBTYWx0ZWRfXzMlASyp+9o4T
 5GFBzr6y1CQfMgqcXpY1QoI8MXC/c2u0AD8c0HXcSrKick4xxElc4pzkTAWWZgDicif33Bqw4xF
 OTmnxDqbxUT9RDPwz2JhNgBGV3PCflPtNPu07ritFJ0vOlE6nbeCnC95+5fKhF7DPEX/dQtSRzx
 lXoINQjjV0CEcCv5AK3MZsh24I/AzaaGM1vKCo9K4fe0/45ZHL0KWHGZ7KXl7A0y3BRpk5UhjAX
 z7wVj+1VVHx7WVrze7gmvQnIPQaRJICVDg7PzoC2BetpoVKh/enJyL68Py1+hSSxDR+wlEHUv7R
 1l8xoyPHSa99O4rOu609PHcig1raImq+cyg1L75QWIMb6fB8AV4NkklF7REAnwLuYavTjzL54E4
 PgqfM//2Qc4DFU6GSen2sjIswCf1f5Sf9/TtUeCTtoxIIDuZ5B0Qe0rsS/gIAvlTBTVCm2umjvf
 U0ny2WqFlhapRk/RJ3Q==
X-Proofpoint-ORIG-GUID: 2ujA65mAk6YCRvK49bWgoFWfB5lip3dg
X-Proofpoint-GUID: 2ujA65mAk6YCRvK49bWgoFWfB5lip3dg
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26eb60 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=dTFYtdXiv3wnlml4cWrohQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=G-4fGFNKO6kq0i09DNwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111932-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA20D658AD3



On 6/8/2026 5:51 PM, Imran Shaik wrote:
> Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
> SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com> 


