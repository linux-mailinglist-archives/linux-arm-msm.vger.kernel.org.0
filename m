Return-Path: <linux-arm-msm+bounces-114832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZWH5I5kAQmppyQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:20:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B56D5FE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:20:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mVu2TdCw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XONmzrUT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114832-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114832-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D424300CBEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E68B2DB7BB;
	Mon, 29 Jun 2026 05:20:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A062DB788
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:20:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710423; cv=none; b=LMxBSjw35W5rFaSMvSqZg8cV5+2toXAPLJyHVCbYpHZ7EW+JOx0wYThU7/Hh1XNLjPwWoLiQSqBFo0+l1Of2caPBH9gdqSRWfOmmkJjSKavek7+ugyU2Ihk4IK0tr8WkIKQBnOc1MjzyxHrTwCjwWvuRXZ+3AcMVYl5SPZy4ILg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710423; c=relaxed/simple;
	bh=M5cCa1iVKpsWVGIuNxKOhrB+F0tmxzUPYJVS5X/XoiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNxno14+V4s+EYK1OCc8g9+fo+l59yfTomU701ZmEKkaFBqNXxVaQdPhm+mhh21vFlUVi/QOw2WFWywt7ZLqtMHE/AEZgzMLpZt3seISGvk1Bw1WsOt7x4VcAIdpZqnDnaDjKxFH3PK3FnkwoDVdNaBrWhfIWpSVd6afZi1xA/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVu2TdCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XONmzrUT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NDLb1718813
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/bHTWn5095hiiBCyKIFRDLmQgURSRR/pfBthFMkhQQ=; b=mVu2TdCwyS19rlFR
	6KlZTMiAW9qLp7Tm8Q8PAy3Tta71wOgGy+PhpIEGDNQ57zkvyM7m7J0SyB/X7TEo
	kfVNjzbrAbB8m6dbRnYuo9ikIANZm4oMbaMyv+HGdZDfn4WrieJxL4a+VqotNKvQ
	lyNMoTY5Z6fbg7T6LaXmYyHOvitggSVbExHHTy1cc60x7ZZZ4o5Ip+unu5Fwrjo9
	H/MyS6L+6UQf1ccUag9VazIYxW1o8T+aEiTHAtRj3LzJ19H9rNMMYqAQEjYHJmF9
	ACeP7jnZ7uXel6aZU7Uy8LaMVp/mhUiQsaIYzKhLHQzL9cqsaX/KyvILRiZPQWxX
	7F0UpQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf4ehm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:20:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c81db324caso20804545ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710420; x=1783315220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/bHTWn5095hiiBCyKIFRDLmQgURSRR/pfBthFMkhQQ=;
        b=XONmzrUTUljgsln3cZqcdDP2hnUVBlGlL8rOt+9P4Fe+cx6rC1XyEXwZ+zm9EHgWD1
         aP9wzg26sodr0H8d6+kIUrwTTMNsWKzpZJZGFBILegPQNxg2vXBmWQxELGEt8zIZx9Y8
         IARPqce7qWgr13hOxO1FTQC5n3xTcMBQlENghnXmd6GbCRXMtHrpeOviYJzsJSwvPZAo
         Bd7Bel55C6nUaBwwKvjHRIdNlRyWf9cIxzpkLA5YV3txx5305kHFnb0LS8YOEJNq4M7Z
         So197x3UeNMlriGrwe9UJMvmJ6v2qWuHdzZisHG8nWbRGLNoqZLBQ9Q3dtKVWOUZNv29
         mooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710420; x=1783315220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/bHTWn5095hiiBCyKIFRDLmQgURSRR/pfBthFMkhQQ=;
        b=Q4e8vEmuvfHpEnuuav3AII3U1rk9H0iP6+ZCOrvLGfT4YOo0F5ThlTuTx7DrX9ngIR
         GK1fgJljaU7e1QtizFYtPFoakV0S1bxxO/u0AtxqirXu0fjFnJz7ioaiSSQ7H1q4OikV
         RbpvUrYsJ22pX1w7uaieNGASo7eKe9EiifrRA+2gzR4s439NVQOL3kaRL71CoPo9Ijt/
         /K3ej4oyck0YiDe/+UJe9lf1Zv4UQPSPnOEyk8OCg8HHeyZM0fZbCJ+eEj+Dy/z2Bb11
         75grLB6981PhmuCjHEw5CstWMjxFMXq/XCzMwnCk55fxhkOpxC/W0ai5fww/lEgdgo6Q
         mYJg==
X-Forwarded-Encrypted: i=1; AHgh+Rreao79yb0Iq4bK57A9eHmVr5kE6U/P7/a1zy6tc1o3tKVQ32SWCAIBhZxGzz1A5ZKHaKSAmmSH/Mu4UVPV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4jXFFzZx6/JlpRN8tIsc5YlECFr76FGxNM53oNybq9R7NvDPj
	WCyP4ilTGyGN3Du+BcBy/W2c4wNO2BOtw57YAPXgE8sp2zYTKe8IXRcSvTbL8k3snzbu6aJ+TT/
	EKlgZSmBLGUUo0lTz3Dzkt5mox7gsHer35MJ+6ydtN26VAtWu+L4BzU2DH6QZslCqdgdY+sMPh6
	SA
X-Gm-Gg: AfdE7clpMVo/NyX5+W24D84J68VGHXDxYgEPnEU+YgAaJGgtgdwwhnRPLKpuNJBU/Ag
	zYk3UFF/DWkYbIwsQla73P5SCTX4Ra+tl/39pd77ICARa9uuaFs+vimYPPzNoXtaMYuxQ1aAKVJ
	LxfhmhsADG5X8FUZbMVvj7P/GwilOF1pVDHkiE4pU+7x583VRFFVnoi0D/ZEwF2qjqoIRBcq1x2
	1wgYEJPP30IMajPB71drit5/cTCyII4aFBNNBJRhDWK9nvCJ7kE3t4y+9JhNxLo6LSS2FcGY53L
	zOIOEznQoGqHKVuATMM0hMhNkeNDfgWrWIAzovhbZm7pi8jcqM7ib4cjyVRuS0w4hED6ZPDUDqb
	37EiBjgNepLB/VW6XZBeHvqdGiib/g8a9oVuT9w==
X-Received: by 2002:a17:902:f644:b0:2c8:e13a:f23a with SMTP id d9443c01a7336-2c8e13af2bdmr84668635ad.28.1782710420473;
        Sun, 28 Jun 2026 22:20:20 -0700 (PDT)
X-Received: by 2002:a17:902:f644:b0:2c8:e13a:f23a with SMTP id d9443c01a7336-2c8e13af2bdmr84668375ad.28.1782710420014;
        Sun, 28 Jun 2026 22:20:20 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9b3ca81bcsm36277785ad.82.2026.06.28.22.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:20:19 -0700 (PDT)
Message-ID: <78abffc7-3b3b-4fed-9d9b-cfa9fa3778cc@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:49:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add Audio Core clock controller support on
 Qualcomm Shikra SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-3-7ee6b5f2d928@oss.qualcomm.com>
 <191c4b05-7d66-4338-8321-ebc593379f73@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <191c4b05-7d66-4338-8321-ebc593379f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX/UOmMrnDziv2
 eNgdhtzgSCoHpY6jL4hrcvekmX40o3nAT4rAuEVV7P56TP3AYuj2ezwa0M4HaB7vil3qtYcWYOJ
 bKRPJoeLBfEqpxvLQxoQcbIu8Hjn4xg=
X-Proofpoint-GUID: v2Lzv1xz8j-SRR6pqgGcq1WRcCEjZusX
X-Proofpoint-ORIG-GUID: v2Lzv1xz8j-SRR6pqgGcq1WRcCEjZusX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX/xVN6Oe1luSR
 /2s8SRJm0U7rTZouJwsbXbwUGnyFnb4nfpEjxmLtKEnY1tDDQksOMGwQSM7SSAYSD4X8Ghtolmm
 /ZsiCEmPI0jrtuuN3j/Y3aX6cBGDPaLXbr18KaHCZpHB+NcM4qd7w10DIZX1ZkUVMa+wrYGOx3R
 RCGUD/0l7GGuTzxtFfFcfjCu1vxisjlKvWOlnrHjRCve37LCiD/xUkXMnXfWpmEGzyFJR+UZ35o
 SGZpvQZyzgL+4eGUblDbySuDONYNZqHbv8ELOYe0TtIehBbChk1dj/FRfNKgAPVT+FGXBpRNR7N
 kO9Xf+igcRrJ0I+NNuIkGn2YgKQqLJx4UQBahyERoonrIe3PUl3lyH/AD7ps6L0oW3+NdK0HEbE
 EMphxNwuUKazATXDM8lZB8Ob9UQ0aPMlvyjKUptuTtufu+wOPWi2+AG4G5u3+ursl23ogkiSTLK
 jE4Ilu5L9GyS3dKf/ng==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a420095 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Rk4DF2lalsHHy-5JHz8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114832-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E12B56D5FE7



On 11-06-2026 04:57 pm, Konrad Dybcio wrote:
> On 6/5/26 1:26 PM, Imran Shaik wrote:
>> Add support for Audio Core Clock Controller (AUDIOCORECC) on Qualcomm
>> Shikra SoC. The  AUDIOCORECC clocks and resets support differs based on
>> Audio subsystem enablement. In the CQM variant, both clocks and resets
>> are required as Audio is on APPS, while in the CQS variant only reset
>> control is required since Audio is handled on Modem. Handle these
>> requirements using variant specific compatibles.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static const struct qcom_reset_map audio_core_cc_shikra_resets[] = {
>> +	[AUDIO_CORE_CSR_RX_SWR_CGCR] = { 0x1c },
>> +	[AUDIO_CORE_CSR_TX_SWR_CGCR] = { 0x30 },
> 

My bad, this also should be controlling the BIT(1) only from SW side, 
similar to existing drivers. I will update in the next series.

> So these are not "real resets", but for the sake of existing art, we
> can keep pretending they are
> 
> bit 1 is HW_CTL (1->hw controlled) and bit 0 is taken into account only
> if 1 is cleared
> 
> existing drivers toggle the HW_CTRL bit (meaning it's an
> maybe-on/surely-on switch rather than off/on).. do we need to rectify
> that somehow?
> 

No changes are needed to the existing logic, as Audio SW only needs to 
control the HW_CTL bit.

By default (PoR), HW_CTL is asserted, so the CGCRs are controlled by 
hardware. For the audio use case, where HW gating isn’t required, 
software de-asserts HW_CTL, after which control shifts to bit 0 (set to 
1 by default).

Thanks,
Imran

