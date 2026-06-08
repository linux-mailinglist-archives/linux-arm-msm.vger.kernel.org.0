Return-Path: <linux-arm-msm+bounces-111853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A5TYOZ6oJmrmagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:33:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBF7655BF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:33:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I8K6eQUg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=POXECiVE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111853-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111853-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DE57301A295
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 11:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302DB36828B;
	Mon,  8 Jun 2026 11:31:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC22536680F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 11:31:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918295; cv=none; b=owUNZQUXJ5QjV4er6aXvExDYMqfe8YUkI7+XyLTeYPN5jWYx7v4KSLhboqGehDEZfbAU8Qk58yq95SC7DzvcDiOjrsvZuA1HPyyz6laK/2kpQkg06SpfALXjKcdzTUqoT0Iwhcy4BzJ915rKyTwUh2SRc2mP3wjFIJ1vRkagfIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918295; c=relaxed/simple;
	bh=rD4WUl8Tw2dxSZ26CPIJak0rjmDn5VzPQcXVvyW/3po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVD1SgRudrDlze5m26yq21Zg6JUtRG/w+XxkdYMgwOsieHuYeOsLCQ2G3rXzk6RRGfnQTbRTd/8O35vIQxIT1DSjy+nFJBuPerKbByxXCqI7HehCZ63Edg606Lqe8XBH1q3h8t0RM2D6ZUkpbhxUpZMJZFn3PdSakYDtTIxqdfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8K6eQUg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POXECiVE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BClfr3381773
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 11:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K4C4mnAl/QOpNfK6SglLqnWluPwGKCGjBTeeDnIrnfw=; b=I8K6eQUgDmlHQOOm
	zGLmuXJmwzcvGaheXF5WgHRf+gpazn+U9kCXBgRyQ0bB4mgX0CZSN83czl7f8lQG
	DiHGoeCCDDYVtDFSdwjYksqTGd6Ge+P0lGzUgpdkc20+tqv9QrdWyo8+amUdYTRe
	ykJOaNGGwwBwjkCbTj++iNxKgNrk2txnM0A3Zro7sMCHYFW3SdpZi5++TOvGr77k
	RNfYaO4mM+WuUwrVPYoEyn+/cRhsndFqDN4pLIGYgRlrbDNyBRxSYmuIVnbcoTpx
	K6sKu1H0hiUDYJ1fRCB4gI15n+HijeoW+12iLJ/WUWUh5veLOjTgvBZhNWY1zHJG
	HYGwbA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf7qdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 11:31:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c53e2dd1d6so168721137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 04:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780918292; x=1781523092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4C4mnAl/QOpNfK6SglLqnWluPwGKCGjBTeeDnIrnfw=;
        b=POXECiVEG/FYXzGQFWJYA86K+OMafj4dZsdXhc2IowwwayQdqA9pS1ueBw6z1eUOVU
         wrTbLGBkw/+wdJM89NiDV4k/jUVxehczCO5Og91WyWjrToX0TM6+0Vj+GvJrMf+FsF+4
         gtJdXCQJ6zbFRsvPvCDgHio3f6CJdzVtw6gTX8a3XD830AzKhoLXQYSib1ZN9HfnJdac
         ZGJLkah0SZQd53tqDyAAFQ5uwRR0r24g8XuOydABTFqlTlZNwsycwwZlhio8nhVxR4mx
         QwJvf2Rgnc9ZIqpWRd1zpuwJphdAp9WA7N8w65kLr7JA/Lh5jAFF4lIsvn67BUmtcTmQ
         WO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780918292; x=1781523092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4C4mnAl/QOpNfK6SglLqnWluPwGKCGjBTeeDnIrnfw=;
        b=aYR8odHytcqJhoEXoVpUDvRi7ZEzfiNTpOvdCa4//RCkhyOlkcLn86sNluZrlmBJAc
         i6x/nzfbK9DaHeR0cR4X49J4J/ZfI16s/89dpgMTBG7bFFBZN15IGAtQrhAD5ORQPa7W
         /8ql5UqyNWFr+dm0mnByg0iqppFCKifqb5ALlUQfwB2MFw1I/ncwz0Zc1qXZal/nn3sx
         Nm4lWhnE55rpEBaMn2mkN5KQ3XYS7qh7AcsfRuWSucalZAUwtw/A+bp7CmnPr6iOkyiA
         N8DM/TaH+GFIf1Jru7+CWbMikQPTBp/G+1Xahe5uf5Ckp8spvn9gHsOHNuBUK8y6nqDf
         8eUw==
X-Forwarded-Encrypted: i=1; AFNElJ9XzxPreY+5Gtg83yxhXsCQlBTxf4T/8tNjDfxeeTaxUFEJg18YOfDByniJf0NjhuqR+LWCYh2mvsCcdog4@vger.kernel.org
X-Gm-Message-State: AOJu0YzvcM6K1s/UlgErM6gjJKdlRiJ/E+mMu8IKhZTqlNXeKMYsn6NX
	IHLxNPOksrvWcMhtEOZCuYTPS1I6U+hTsYApPZNA7PXcjuHkOeaHRb/s9PnkgXsDIU9re1Q/wgp
	ap0l7J8kiVLWHDNOY9FIPicwPCfG/u6+QFVdmt5d1rTLx+gk//7z4a5rfQFj0kcMJy6Zr
X-Gm-Gg: Acq92OEd+5ocOjAI20fidXZ2XnQu28DsvoXCBwGvHwyzHokRaEpw0ZoT63Mtr5oAUMX
	hvKINe2KMQSA3imygC5+o7QoFGGIaDaG6pOlhvPu9txbF872OMXCIgTAY1GGkWqJXr8TPZFsGj0
	CwsrNedAth3AMMePXr6ax6AldIGyihGen8aC3iSO7iVx13SQmweKWH+wyCbDS2WpetC52drnQ1A
	q91o0tlOzuC1jZwdRsLb5R+J7qg5QgTvrJNo6YOGAH+dQDJxV2Xy+qkKT9PQCH7oxbTAoh+wBmq
	Y+s8eJpx4Gr83U/3BDHUWexlyH4kqC+8ckKWyfzdiQlNi+sZhBi7FeSnJN7jk01mq6WeGLU7WXG
	qCQi5w9cpHK1JxJqNpjNjCT0cDE5H4+hvwJmSVpiE8JdMFmlBDsqeC0nO
X-Received: by 2002:a05:6102:2923:b0:634:8685:d331 with SMTP id ada2fe7eead31-6fefce7da37mr1999906137.6.1780918292184;
        Mon, 08 Jun 2026 04:31:32 -0700 (PDT)
X-Received: by 2002:a05:6102:2923:b0:634:8685:d331 with SMTP id ada2fe7eead31-6fefce7da37mr1999890137.6.1780918291704;
        Mon, 08 Jun 2026 04:31:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-691afe82416sm1611489a12.13.2026.06.08.04.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 04:31:30 -0700 (PDT)
Message-ID: <109ad54c-f17f-49ea-9d7f-54e13dd367da@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 13:31:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] pinctrl: qcom: eliza: Fix HDMI_RCV_DET function
 slot
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me>
 <20260423-misc-eliza-pinctrl-v1-1-2498b365ff2c@pm.me>
 <5dae3a56-a17c-4201-ba0b-8591646197ef@oss.qualcomm.com>
 <P33wW6i3eN15uYIbIb8LfIVRvmL0zVdiI_FOKDoMIM_KFi01m_7PMaZmU1z3YJl9mGN2kDtSvXUujD-TWaXXiSOZeEH-kwj3JSjmIRfRb54=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <P33wW6i3eN15uYIbIb8LfIVRvmL0zVdiI_FOKDoMIM_KFi01m_7PMaZmU1z3YJl9mGN2kDtSvXUujD-TWaXXiSOZeEH-kwj3JSjmIRfRb54=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a26a814 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=I_GUxYuSRt8l7ccQOTUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: sDzBX1igClxm7_TUtp6X3VAiO9Z1bwNw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwOCBTYWx0ZWRfXz5+eAEM1LuvU
 B9wMYQ9E1eeCPasofpkFXoSTP5TTT0FVxjnq9LLpQTgY6EnWzjw9xMVaxFGeZqe4sHDLZ41OkW6
 engByk99+6VUY3HXztoRx/O7T7Qt+maoDA0x+BsJzmn3FoV5BU2OxynWplAnhaEm3EFgCsxL1m2
 c4rc2YGdTweSN87cWS0GRmhk5f6MxJ0T9My7/9HRmrSmWDsG2svfz5GMwb2xGVYidfLnBJyGuhs
 s12O7ZC27Q/Kfuyu+7UhrTBkDxwFNl3FRXV1UKQwpL6mA5w74hB6nYn3jfTgvuVA2b8yjqDziAl
 RQMNBNqrMsTaQ2yEkOcXlHHkA3rjSAAWqs+Fbtd88sttnBdaTm5+RWs5RpQFYHj1NwGGsMtrsTC
 62tkEH7SY2HODeuxHazy1/8tb7IuO1zT9m8oVU6GUvho5cMolb8TCaHA4NugmAfZpiLYJqrQzQT
 EPytxrYMCnpErja4ptg==
X-Proofpoint-GUID: sDzBX1igClxm7_TUtp6X3VAiO9Z1bwNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111853-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DBF7655BF3

On 5/28/26 7:24 PM, Alexander Koskovich wrote:
> On Thursday, April 23rd, 2026 at 7:08 PM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 4/23/26 6:51 AM, Alexander Koskovich wrote:
>>> The hdmi_rcv_det function was placed at alt function slot 2, but the
>>> correct mux value for this function on GPIO 19 is slot 3. Move it
>>> accordingly and leave slot 2 unassigned.
>>
>> No, 2 is the desired one per docs
>>
>> 0 -> GPIO
>> 1 -> QUP2_SE5_L3
>> 2 -> HDMI_RCV_DET
> 
> Is it possible that CQ7790S is a special case? The pin assignment I have for it
> here is:
> 
> 0 -> GPIO
> 1 -> QUP2_SE5_L3
> 2 -> N/A
> 3 -> GP_PDM_MIRA[0]/HDMI_RCV_DET

I was reassured that my source has the latest information

For reference, does your reference doc have any 80-xxxx-xx-like number?

Konrad

