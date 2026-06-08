Return-Path: <linux-arm-msm+bounces-111854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id auZ0LXurJmqKawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:46:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B822655D1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:46:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JMvZVAiu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ReeyV7HR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111854-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111854-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0782C3025251
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 11:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4F136A37E;
	Mon,  8 Jun 2026 11:40:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D7A36A37C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 11:40:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918808; cv=none; b=fTC4cWMDGRPtI3iwmvb/mQO5yAB1CbOeNMDYuiClIWXQHmqZSO3cVYp7oiv/IG11Q5eI2MzlCDea64XKhdNC8rq8awMhywXmkflf7zi6REH489ClVys+KqhM8/U5VMDC57AGQfVtv/l43oaAV16ZeWuJBPp3zo646tVvTKCt1UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918808; c=relaxed/simple;
	bh=EN497Hs3r8Tl344kRRZC74q9NgY3H/XPtZgg08D+jHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhGNsOBoDsltabGDio7B5E+aZvyQ9DOwmB8crdR8cXN4OjdXek73rH7QADYQDKbZDZdk3wW9F3TggZQY79tnGyDOLA/mxA5b7lLvFzBlZQqjoxJoDSUUXaGpLKBEhgKx/gmiCblIAxq0wlcgidLLlDikjeoH6tlB/LUirNj7qic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMvZVAiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReeyV7HR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BC77G3455538
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 11:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIgJupkYtH4h1zJNhRGssxohoVOM6fBQci0ibj/UCEA=; b=JMvZVAiuPZUScjL2
	do3A3NNJR6MWJ0SxnQUqi5fciKVfGfzlHi9PIxUc3fPRar1YOyy9UT0OIfJcLrhh
	19GNj1yrD4WbyPmsHUEVY+HWjDxpKd5hoee0CTGsDhfl+04x+suIk7ojdoS072nP
	FaYtsgKLCDAglkuJRYVDNPBI4w05C3KIpdpoDwDzviiOtq137hyEhmdG9asvZWFO
	qm9E0gY5t2DteP3aMpBvdp9oqEvWhMrPeKa4mA3h9ZCaI51hs7j6X9MHt3O8hDRC
	+9K/NWrOJIZym7SklWApVz0QYBxtHj/te1hhpj8m8D/b3M3YywXrBTXPkNERYaGc
	O7i1jw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0gp1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 11:40:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517796be724so8139311cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 04:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780918806; x=1781523606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sIgJupkYtH4h1zJNhRGssxohoVOM6fBQci0ibj/UCEA=;
        b=ReeyV7HROYkzS6hrgxLWkdm+DCtp6aPURZgruriOFlNZbBXY1iIWdMxho4h8zmQDTE
         Lt/FOwuSidJIzwu++obZyBlWE8QaC97ia0cwO6zztCw7Ee4RhI3ceamzQTNRkAb5y7x/
         16X2Uzzr0GKLurLMPxP59k3WFCatvxn7h8OpxLv7IWg8/AO5QPkYBilHfXq1R8UHbOab
         2L6NjHHby+AbubkijemP7YqygC3tlPEUqcQZckwhqdjqwMVTmjEcMkF6suLpBRlyy9WY
         BkzG+NXbp2lT1tpWkZCOX7vDAig/e4kLDk/vcIpjSQd8P4QuQP/QDTRn64rvcYO5nsf6
         k5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780918806; x=1781523606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIgJupkYtH4h1zJNhRGssxohoVOM6fBQci0ibj/UCEA=;
        b=nbrUlc8pE1H+HpmFHuXmd4ozrAjnqd/AncPCgZkOVZYdD2jWzpCB64cRjjShR03lAl
         z8uNhgsyALvdWvw9gFJUYtpNiNUxXiBp82Rvmn4TUcho0QtllmGqEGzySoTtZpEAs9SY
         bqqZH4n8/NjVxU3m3VgIGDOXFAzUPsqOqomHmG2HcQGCehaA9yziGzQCqoLPEMo6cUhA
         l6YqgWjRYjzdCoEbaf+wweUapnIvo86nEDqMQ3kstp8+rSBGn1E98GoDoyBA9q92Q2No
         hi6ys7BzONI2zZfDkPrYYWPSrILHHixGACjygmm0xWylrM6M+h2UjeA55yYhhgBIgOLe
         MFzg==
X-Forwarded-Encrypted: i=1; AFNElJ8GXE50AOcyXWYcqL0svw4OQPNjLJsmR4Kz3Recs1zuf5I/fK6tXC1CdmQUnHdlbGXfLbCJyQQ5VC/eNPfe@vger.kernel.org
X-Gm-Message-State: AOJu0YwltKL9sfNk2eL8oy5gUoQ8Dk7rhgsrX0aD+kU794nDiwg1OoSB
	BSh0Bwk1MfPQZpolwFkX8AA2YKujOzZ/2IC82TLkIPNNFnljPG/e6W2xUc7AJtHqpaBG7igUzU+
	Riadk6aydtKKp5l8vAmt3Qwrrj7Al6Jo7qL+SqcHTkPEk0xnYOmThCRSj6oJMGPetkcmI
X-Gm-Gg: Acq92OEyxCGN7qXVdlak6uJXrSrEz1XuvzYf935njwMVT4eY9OHGREzImTRX6K32QtM
	lYYX1tobxj1eFhYpuQdCE/2Jr5jmozRa0AewUtdD5CYMx75pG05BeUPR0avgQClUjrWSz2kQefH
	z78lR9pnbiavIzknosgxcOt9AubQao5JuuulBjkrDlvLnMSCW8X3RLiMEt3G6nT2Q+4GG/LtLe4
	M+2rZHueLOHCL0SQrMSQQ1i8CLrRiziY3Z5mir1VRoP6faDbTBOd3+lSlL1ef/v7aNLpOkBjP9Z
	saMmoQ+bzhZC+JeAIQKSUI7YSsw25FvurY19klXCQfSJzj/44EMMfrzR3UpgusV7KacepTTBnbU
	0QWpiMmaTLmvYWzIU1YxZzLbK40FrYUmGATE9DLziwyp2O4tk19Amn68m
X-Received: by 2002:a05:622a:11c3:b0:517:6162:daf5 with SMTP id d75a77b69052e-51795c1a37emr115237171cf.3.1780918805810;
        Mon, 08 Jun 2026 04:40:05 -0700 (PDT)
X-Received: by 2002:a05:622a:11c3:b0:517:6162:daf5 with SMTP id d75a77b69052e-51795c1a37emr115236751cf.3.1780918805216;
        Mon, 08 Jun 2026 04:40:05 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051770994sm869891566b.13.2026.06.08.04.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 04:40:04 -0700 (PDT)
Message-ID: <2fff4ddf-ea2e-48da-8a7e-e58075597b00@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 13:40:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: dts: qcom: hamoa: Drop cluster_cl5 idle state
 from CPU clusters
To: Marc Zyngier <maz@kernel.org>, jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Steev Klimaszewski <threeway@gmail.com>, Icecream95 <ixn@disroot.org>
References: <20260604-dc_zva_mitigation-v1-1-d1148c1c0259@oldschoolsolutions.biz>
 <87bjdp9znw.wl-maz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <87bjdp9znw.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExMCBTYWx0ZWRfX+2k2xbzVU4YC
 VEaN1PxuvTan2pNHDMsiaPBC59CqWomwa7+NsP846q2ZXIBTxPlPjyjFTojizA5XnkxpgybhQgG
 leYrqV8ln9H+t4PCPKGAqFPZ0v9QgW1Q1bTvayzLYA5KeIrsOyqJ6+zgGwHfDu1peBJgK/w4Kut
 RkOBC0l4HK+yReWP+G2atfSKrj+/nyJrJb9w8CgYuIzmxFf/DpEl72RW2Dar2Wtxy/dWG1fd/gt
 x5C3Ds496UINH9WP6OdUJ1caYVVukUfyJW4b7ZbMkBz2EAb9TGpMBT+SW3qHRhJ2g617OZOcSiP
 vpfTa28Rkf+p5+Bo7FcD8RJe6Rat18S5bR1b/6WD4oySfu7Gr+GvHZ/Nsnr5CKsV0WWYj72MVJN
 B3xc5OmdR7ZpVuzoQii5coOrS+5Bc3JiSO/WT9LaBFVMbHkIYzvkPq5RIMBnqcfTSR9mdk1QEce
 eKAxIAiowXLdqOWka6w==
X-Proofpoint-ORIG-GUID: 5Rj6aGDUJG2gMFUL2NA11VM0At4YVSQl
X-Proofpoint-GUID: 5Rj6aGDUJG2gMFUL2NA11VM0At4YVSQl
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26aa16 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=2uZjxnYOmBivvt3MPt8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-111854-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:jens.glathe@oldschoolsolutions.biz,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:threeway@gmail.com,m:ixn@disroot.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,disroot.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B822655D1B

On 6/5/26 10:09 AM, Marc Zyngier wrote:
> Hi Jens,
> 
> Thanks for sending this.

[...]

> It may be worth adding a comment somewhere in the DTS file, as
> cluster_cl5 is not referenced anymore.
> 
> Ideally we'd simply mark cluster-sleep-1 with 'status = "disabled"',
> but I'm not sure Linux (and other OSs that consume this) actively
> parse this property.
> 
> Overall, I'd like clarity from the vendor on what can be done to
> better mitigate issues like this. So far, we have been randomly
> disabling features and CPU capabilities each and every time we find
> something broken on these machines, and the list is getting long.
> 
> I don't think such course of action is sustainable, and maybe we
> should simply consider marking the full X1 platform as BROKEN so that
> people know what to expect.

Many "Linux-facing" people have been OoO and/or attending various
conferences and an internal sprint for the past 2-3 weeks in a row,
so there weren't a lot of eyes on this.. We're looking into it now.

Konrad

