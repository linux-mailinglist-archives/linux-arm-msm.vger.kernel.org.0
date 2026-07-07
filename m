Return-Path: <linux-arm-msm+bounces-117273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CT3HNqHVTGpBqgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:32:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E171A696
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:32:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lJpWpVRl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ikf9hyJV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117273-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117273-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C813230DAB40
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF14A3E5EC2;
	Tue,  7 Jul 2026 10:25:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160773E5A12
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:25:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419949; cv=none; b=IMMuNbl3YKkKlZZ/Q1dslPNbZ+ZPyHbd25BIh1iQjhC5yvqimlxfXUuMCDAGG22Jdd/LsVlZ64p1Qi4y9crCPnwgCB+LnMP6qPAXyuVMYiyV6Vd5z0hZ5s8Yu2DpUGE2udeaONUdgGpA1HCYDmOataU8cDhiX64KgeMkrG50oVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419949; c=relaxed/simple;
	bh=enrhIw6VUqzjOJdsvB8tYAkfj8nD93Ge1HcbjHE/C0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBLC+Pl6/4WBDPqbduDnxbsy+nejj9bi2Fif78CoKEbGBTQdKu1dS2AYbU27qd4O51MukpQiiHL19GHoN/89ca5b7lzRvfnylbZDEOX7zM2yAUof2TrirvxdyB7QxTCUxIHwAVFSzb5JVsRaBOWlSKC0WGuohjTvvkF5RJ/sSfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJpWpVRl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikf9hyJV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dmwb3182193
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qeaD8wc815Qj+RilTlDae/cpdONzOxPD0KBYyhtTgLo=; b=lJpWpVRlER8o5qKr
	UX90TVwm+6/lAFFlUjrPpQsYwHHksOqZmWIO4JYM2TVCL+gRf92qOnFp7FIy5AJc
	DRa+8mfw+nROxf8lT3UGDKFnpiwH9RQuecKHGd1yAHrWd5hqQ6/NA1GRGhJAwTXH
	sxZKibAXXPlXucHVc1XyDCvZo6Shroyj4hANFKJ8I0Jgl9VBwdpmafsLUMotxKyX
	lr93ijJhIjV2E/HkafjVojTgUhpkEeh0rclbVcB7lWzjGC79m2PrldRWVjJgz0mi
	aWpmf5JtlxuRttfLNQ2yLquxByEyazsE4fL038gOzxl7h2oN4lBAr0WwwfwuHJzV
	uso+LQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t9039-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:25:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c267931ebso24322991cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419944; x=1784024744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qeaD8wc815Qj+RilTlDae/cpdONzOxPD0KBYyhtTgLo=;
        b=ikf9hyJV18dcyr7W4Oonr5/w7xxSSHoI7V4MPEwEeLQ0aUuhWqM29wNouH9AmaMjrl
         EEc4SkneNVr0iymS/XHa23++q/GnFRtn5fjI5exU6W18G2ysQjl3Afnv3ulAaDXX50Uj
         qs1WCTDfgf4ebld8/EjRHacGXpnHcfq0ZoRQdEt8XG4wXTrfTrNTVwLtDriI+wnhuQhg
         qYmLq6OCh4HdrnpY7dfVvHwD6fBmuIulNaE4lzq5bEDjiuDoEXvcYjn1Yg9DXOW6SbAx
         vvqTaguhSalMjJs08vx69vM1cAG1SlyMjP+EhUf4UzsHHmkWmB0DQWC5MK6o+bxMGxd3
         +NzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419944; x=1784024744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qeaD8wc815Qj+RilTlDae/cpdONzOxPD0KBYyhtTgLo=;
        b=o7gK5CJX2ZN4tUn3QX/xpoVrAGLXrriSQfXOYEGsDtLKVjUzmoebf7UB/ziW1puCiL
         gAgLMt420J+QxxMgK1Bg6mlCBB3pHqyno/DvJYpVIP0Y9SFsqQp7Zek2PiPbAnlsEwTI
         zU+oQpMMH9R9Hk9j7DXqjuN6L99oIEEUNQwRmkvRD2FcOwSD3u+bqC9UKwXDwzE4Te7o
         An1dPDyUrX7rNIdsbQ4YqgcVyJxzUXW/2xvqydJiwgJXW0Hr8vJFyAzabKR2gX3yMopo
         U9d2CW0ebKStLP/vt0WY4NszfSzvLiszW+2CGoKAKSBI7QDgggGJA7/cG6gto113tUox
         wDmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqie2lRWn/g2/f2dmCSpS8nSeL2iMx/PlTavpFN1vpb0DnynwgHHLsXnSnUO/fMnGOXTW0v28lyYQhcNNLh@vger.kernel.org
X-Gm-Message-State: AOJu0YxC3PCpl7YSGNBt1JYUB2G7NSTYTV0z/saq7zTujgj62KdS/8x4
	X3LSgtQJ9ZVwfaG74wME/77EXktUXYAm0+0gqRBIIAukcifwWLtJbxAbDUNlty46BzvSHd2sdYw
	Wdt0nJiX3DeVdsPn7GCWPQ2MpxYZDzDvvNxiEjpMRjc6SsUtK0yuBDxYxF+OBTme6lJ7t
X-Gm-Gg: AfdE7ckc1cHZIwxVxKyQlVDg8abNW45iL/MM2BtOTqINlJPq5tfGNKeE/9q7aYO9UTj
	7v6fi8N7HlJeqyMKzDVrAzykdemObNSuxMuKbIb+KGHMRsAf3TRLxyl0+ARm7K000+XzaeE20fp
	UrpUtyHgRdarK7WwLMaP+76OFoggn7kdmYJv5C2yQMYmPc//lfr/39JwDBEy+gEwgqvlL9fjX/S
	eR+88yxwORkYLMrVVqVdNXrSe/3ooaLtsF2ofgfJzPZg0OduH/cLrpaXyH2rqbbqFiJEd9S1bjV
	6dvdIFv67feAUaBFmYt+6avykuHYeiuAoKlYz9kTzek50Re4vQPmOq6WMGUGLbUucru9WA2viqE
	PaHmRdl9C/cYDu17HMiL00szYY8vOhDxWLuw=
X-Received: by 2002:ac8:57c2:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c4be98f79mr129277821cf.9.1783419944232;
        Tue, 07 Jul 2026 03:25:44 -0700 (PDT)
X-Received: by 2002:ac8:57c2:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c4be98f79mr129277701cf.9.1783419943606;
        Tue, 07 Jul 2026 03:25:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15b1a1011fsm79906966b.58.2026.07.07.03.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:25:42 -0700 (PDT)
Message-ID: <9448e854-d64f-4316-8fdd-4e1e3dcc9ce0@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:25:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
 <rnwgxeuz6t6cpbcrmcggqtzsfjnur6kmkttgymp6cbglzjva5v@q4cyoq62p3yp>
 <a8a2c394-666c-4294-9eb1-911564a32fc7@oss.qualcomm.com>
 <toeqm5cizcnlevonbhpui6277fffqgnio3vjsfwjbl2v2pa4gh@63xby7l2zjzr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <toeqm5cizcnlevonbhpui6277fffqgnio3vjsfwjbl2v2pa4gh@63xby7l2zjzr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7yPhY2Mxsyf12V1Z4DVu4GkHCufcLTyz
X-Proofpoint-ORIG-GUID: 7yPhY2Mxsyf12V1Z4DVu4GkHCufcLTyz
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cd428 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_qhDSAx7fSPv64GxxyMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfX22T7RSqKTdRp
 SKSQICHA5+wZYNHCF1jqQXRwX0A2+4lj+02n+cJ7RmNeoz+4cfOwhaDP7rQ443Vzt07y8EK1xhn
 Au057AObGkF9fjqEZPBP9HiQphi0/fuZlX+BEc5mhCHQQKl1GCr1vvEgyDUajIy7sf0pm+7BQ4K
 l2ElCzkCUXjVXn2LVo8EOZI/1F2AMPR7bbGtJJoZ3B++YDguM+6m9nwnoY6hZraKuROYNA5alSx
 h/lty3u584427uBYhSuuOIW1EHC4ASolCrWNtHMMsCG7mBNZSCQ2Z+44/qzkewR3dQjxoBbVW5B
 thgvL3wkvFJwhd/cN3yv64zpNGoKKdl1xiwa+SZcDiMmpbhfi9OaxdZbqFsJGsZxOsm3fGG+iuT
 E/P4f/AFCVAQq0UB31+E4f0Tb7fjVe2h/IDd68fMs5nju8gKDITH/sAFnJVQXKyb9AnaqKu5V3X
 1erYfNpnUoyHz6DVgzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfX5O72l5wRURhd
 hcb/zgju8mvU0lQWmNtq+jkclKzZrHLAr7tfPrUM7LCS2PWFrsjf0ElJHyvqbKau6UiFZQV57wA
 Ni0UOq4pcd20bvmXyMrS6ZdB+2QIVzA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117273-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 782E171A696

On 6/26/26 5:15 PM, Abel Vesa wrote:
> On 26-06-26 09:46:03, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 6/25/2026 3:42 PM, Abel Vesa wrote:
>>> On 26-06-10 17:40:09, Krishna Chaitanya Chundru wrote:
>>>> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
>>>> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
>>>> the GCC clock references to use the newly added PHY nodes instead of
>>>> placeholder zeros.
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---

[...]

>>> No pinctrl states?
>> As we are adding perst & wake gpio's in board specific file, it is better to
>> add the pincntrl also
>> there only.
> 
> I'll let Bjorn and Konrad reply, but most of the sm8*50.dtsi have
> them. Though some of the newer platforms moved them in the board dts.

Some folks argue (I believe purely ideologically) that the pin states
should be defined in the board DTSI, but I don't think we have a single
example of non-default routing in the many many years of linux-arm-msm,
so I think the reasonable decision is to keep them in the SoC DTSI.

Konrad

