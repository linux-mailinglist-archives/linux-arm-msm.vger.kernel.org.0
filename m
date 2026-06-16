Return-Path: <linux-arm-msm+bounces-113327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RPuCGrrtMGpqYwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 08:31:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD5F68C870
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 08:31:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a6yjpPt5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=e3EcPiaX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113327-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113327-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AB47303C4C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 06:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C893C279B;
	Tue, 16 Jun 2026 06:30:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FDB171CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:30:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591444; cv=none; b=rHT3CI9/GyQ+2O19bCdgXYHO/bVmTyCWwPJseEsurqc6O8dqryyX3QgNTHAAqODWRoVpmc/tKHS5ZfpSpEyo8XeXMSendX/ru7vnLgYZ4qaRzLGO0g64fmyZh+FYs2MLOtot3UAIE7qN4T9F66I1y6V7Qh7MgTp/jGbTqtdU7dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591444; c=relaxed/simple;
	bh=d0PyyVSRbSP9Kr0Dy6OM19mxr39eIu2S6iW1opMVtVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDtvbYXuBsSGPF6qcqFE+ejZA4ZkWPn5eYkk89w7BPNmyPDoTkvwCpAAafLl36h7BGA0Zkv2d4HU7in8ulaKIWUJNpMHTIruCXYiFrfaGtXd2+N+l70BM0LjEdPYibsUnd2wAqOy1ZRcMeyXUJbKFFGak6eCLbmFcT16RARf1F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6yjpPt5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3EcPiaX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G64VXF2336910
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ut2EE7DkqBeuZRCzWLedDy6SAnUsmxkY3D+ggtgilwo=; b=a6yjpPt53NxJBjEs
	ruOxtILPBDDXb5vZ0nvoH0Cim79CbVXAHDVuwWsXC5l6Pzthzrg/xMOaFEB4hUCB
	3qRQgpmF7JRzJF9wuFvPPh2SEGmcagW7+mGFZe0OS8oVPOTtmZK47e64TGkZ2vDm
	rctL5a/k2wX7T3rN9KkK6UA2S3+//ERqQwCCvRIKiCEsCUMMh4ASFp5cniF74OwS
	ruZANZ2C9dF0o3ss9QVU0/6ozPF66P8c+wMoTv4gMUt+OAhb+QmYN7DR1gdXz5GP
	9/Y/vsS3tVMgn/HbnY3eT9p1W1vdCPjENezooyVdMuGrCYmrubADyKbqQnRWbvtZ
	Gz7xew==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0n8t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:30:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c354050c34so38545045ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781591441; x=1782196241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ut2EE7DkqBeuZRCzWLedDy6SAnUsmxkY3D+ggtgilwo=;
        b=e3EcPiaXU8H6yewOphwz3JU5Lpf6VVP4wK5FgoT4ypbIP1/XQgcBJkTV90ixqqxe7I
         7GHdoM4rI/8+Dg792iB9wmdo4w3DnFvvmyxghY+7IzJqzL2yukNEGKvBwt48q9pJzVWK
         3p6bN9bW1YJFQIVc900+gfpUn9fjbYhzRFTcbSOiAfIkjdBbRix3cGuV9Mixp9cwqmy3
         5c4O55frQRHMrrToKpqJ/OoOhhZQLwe6g88Jwln7RKLAIU0V1Bo1X4Ua3Mp6Yg/NHDaO
         do/4Q/sz4Za1vrIVJIBdftxDPiXVONCPypMZii17t6r9ChaPyA9SZltHdWM0z6b7VGCl
         jyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591441; x=1782196241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ut2EE7DkqBeuZRCzWLedDy6SAnUsmxkY3D+ggtgilwo=;
        b=gswDLpj0rl0YFXHooUVJmNemFbrw2U47CNtyPvt37zFgNLviOpOg9sTaLYnPBYZtr4
         RLnSk8ABkW/UUlpsvHRR66PnRBEiT/7ZMjvdgpYCU22aK1PrMjeFA3Masn90tVh/dCqc
         TGJzHlLK6X/BpydUMO6Nlubn8vcKS/EhTyzezMusIdK1fmpCT1FUoVpHoVDyQCoPb0zO
         Y7fo1kJ4poTs/H79kg/Nvd1CpHglNScKLNk+pQGbIUwEnneSCflo9XNVbcwwfPN6HD9k
         GIiZhWyVIq1QiLnqp9tkvlsNghq9a75WLM6Rh67upQgUfsTqQzjBFqh0NyznjTUl3vk5
         zqzw==
X-Forwarded-Encrypted: i=1; AFNElJ+0J5Mn8Pj01z7EKFUylhn7+nUxXZ34fnH8rCAyPpW5WGHSc3XVDg0muy176se4kYbEr0j6UJRJrjyrrcgg@vger.kernel.org
X-Gm-Message-State: AOJu0YwZB6qghJ9L9Y9MfevgZG24+FZmMxsoCMJAEiUD+Pvy7PGLYQT5
	OY1lEhECwHP34Uqsm66wA7ac9DBXHYtHlbnd8avzThKZk4sMHH0kh+CdJgJJOqX2zYQsrBcAXKu
	GOdaGng/XwnhEsLq3/Xp11M2s547bJY4v0/jV49FEMljSUUGwdfxXClyIpdO/iRNB9Ydz
X-Gm-Gg: Acq92OHMxqHz9+G7NaOhAVR7catMFcN7bAOo5B1zwrii7E13oSOCFgXgNftMnmMkJw4
	ky0tr6IMM7B7FM1KG+NnZafn8NsbFi+NFkBKbgbop5+4hR93gdNXTIQLLIxCTErWqGCTulGYU4l
	YqTWu7E4DWtmcma8IaCA4KYdKE/nJaOtcw6bMj/MKibJuOTnoh3ZZ7oKt23mktNM6n1IaqV48rL
	vcD+bV6JhmFvAP6ptv5NTNkBDg4YZQq66da1QrVos6IMXTm9+4fmo/gyNrxU+6jSiscb98fNqD5
	j6G2yBRXcV9kBznebKDR2LIq/k1MmHrz3El4W8mnFHT7MIFV+zlU0Xe67dh/+IGp2ATqaHDiuci
	gEz4dasu1gaczytbCs0ZwuBlwIzJTkXr3yRr4kOzr967ZspxsXw==
X-Received: by 2002:a17:902:ea06:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c664271b0amr151324805ad.20.1781591441080;
        Mon, 15 Jun 2026 23:30:41 -0700 (PDT)
X-Received: by 2002:a17:902:ea06:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c664271b0amr151324535ad.20.1781591440688;
        Mon, 15 Jun 2026 23:30:40 -0700 (PDT)
Received: from [10.217.216.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a47f8sm113848585ad.47.2026.06.15.23.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:30:40 -0700 (PDT)
Message-ID: <259de024-a1a8-4d0f-8290-fcf5c01919f1@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:00:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add EVA clock controller driver for Glymur
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-3-b61c7755c403@oss.qualcomm.com>
 <67d7280f-54e5-4e16-931c-92049bee3e00@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <67d7280f-54e5-4e16-931c-92049bee3e00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA2MiBTYWx0ZWRfX/82jpbdd6ZoI
 Wolnfw3eXktzhH/GAAn0iIbTFjxhHj7OnEfqj8rgK0y4/IkYVvGqv1CBOX1bMLOfgyf0aDyAwTY
 qw9SfYJgHtn5cNzNG81ECy5rGJFjO8I=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a30ed91 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DWGL2ng0N4RBUu-NxngA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA2MiBTYWx0ZWRfXzxxzWcYTn2Si
 HgRM8QuxqJNYh3w7sn459dCdYLJzsHbSLZDZX0bN+LSe0lQy4c0Fgxx6XkIbe0B91rnxD/l23YP
 m1TwxcOKTFM2PTg/bhoB2OZzu4NUKODeytp82Pox9tV7F2VD653LhM7fKg/wZjfon0pD8SDxNhn
 CFGok1mbHUdoSg8VcBTjDRbn9D3wmwOfv16Jrv1GLjOUlwWfEgHbnzSgxfXZkkJlLTHn1pycMjM
 AWSNehpEMw54MViOtE0IwbObz+8jOjfPKL5FS8k/7gIo3a3modEEVd+zpeVKBEmY6lljbo8mOmW
 rs5XDcfHdc91ga7LVwv9eQNnp7Km7iPW7wNNIUi92iirs9XpqzLAANUM747Q9lwJUIPma3Ntpaw
 sUZRvklxNJbxB67nGiACAUbEOca/nysCiCeLGdwtz3UphUBT+DfRmiShxmb4q5NXIDJ4WWSdfV6
 ud9UC9egGcZAkjQO/UA==
X-Proofpoint-GUID: hx9-cZC0Adnv5-iE5hIMBpaIA01GqYhD
X-Proofpoint-ORIG-GUID: hx9-cZC0Adnv5-iE5hIMBpaIA01GqYhD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113327-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCD5F68C870



On 6/11/2026 5:30 PM, Konrad Dybcio wrote:
> On 5/26/26 7:29 AM, Taniya Das wrote:
>> Add the Enhanced Video Analytics (EVA) clock controller driver for
>> the Glymur SoC. The EVACC manages the PLL, RCGs, branch clocks, GDSCs
>> and resets for the EVA subsystem which handles vision processing
>> workloads.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +enum {
>> +	DT_AHB_CLK,
>> +	DT_BI_TCXO,
>> +	DT_BI_TCXO_AO,
> 
> DT_BI_TCXO_AO is unused, will it ever be?

Not really, will drop in the next patch.

> 
> [...]
> 
>> +static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
>> +{
>> +	/* Update CTRL_IN register */
> 
> Is there any better comment we could share here?

:) I will update this as well.

> 
>> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
> 
> regmap_set_bits()

Yes, will update this as well.

> 
> otherwise lgtm
> 
> Konrad

-- 
Thanks,
Taniya Das


