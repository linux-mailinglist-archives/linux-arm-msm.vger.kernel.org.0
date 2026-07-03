Return-Path: <linux-arm-msm+bounces-116243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GvhmCVF5R2qCYwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:56:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF908700584
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:56:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R+KYOa2D;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HBpTAjfL;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116243-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116243-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE0743030485
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181BD3839AE;
	Fri,  3 Jul 2026 08:56:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD0B3812F0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:56:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068986; cv=none; b=VcpA968CkXO7cat5T/h2CyZa2a0MxTc3zqA4ZYEHVlpmdP4ZKsb4P1eJBaVs8vN2boslHEiHUYCNdH+HMGY6YJU8/zsNNJn1o6gWM86m2XhOvfnPEyFJwymcQVesCU2WbzE9E/IYYHtWW0/rcrZsiWNPn6361IClwI9uvmmej2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068986; c=relaxed/simple;
	bh=OLFzMuZPdcWNnX5PmC3ua9u6pd2lL8kZlZcWTGaIqkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDj1I4VUQjH0fmmrUFtjx7+IFwsB8Uq7e5vcPtoMbUXOjAFdDAAMTKlBPxek4sBWHZsrJ0my5nDyhkG1Qgg0e4urFb+idEOJA+VugkfVQIfknZJkZPl47SCt5QTlH5LDDdZFEpAS6SrzAemkV7MYALdTuGKYGxQLnC96bwvHh/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+KYOa2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBpTAjfL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rlxi3123714
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wl5tAH2CAN3mmlekbOVBx73EQnsZFSJDZpmN4ENmcAk=; b=R+KYOa2Dc2dM+qws
	fu6KRNuRqdq6Ze/7iE5Yg3glPymA8tU2B97B7UP0dLf4MS03F4gsyh5E2hA6dOun
	4oXc3JwJuFtud4oMrFZRlQqPhHhgMpqe6lybGKFZgUOKa56Rb1GZqNapicFsGEAJ
	ooSYqE0xBoJLM5V4weXEzsQnCMagapxJYgxiWfD53GblZadAiD+unz0ZEq7oOu9N
	Ef8rfDZEYgO/rbkucLROEy/omo3Cp0nC+nVb669v5xsAS+Xgw6bVJqTnA7WX24Bt
	drpaiE0cFnqhbMj7fKj00Rxw7W32xY9V+TPpLnO+NFCEERJyPZVkP1vuGICpUnaA
	6VdiLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpches-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:56:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso8486285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783068983; x=1783673783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wl5tAH2CAN3mmlekbOVBx73EQnsZFSJDZpmN4ENmcAk=;
        b=HBpTAjfLeefh+wcNH+rPa50Jvdx1fGDnwHdZE9RN1PzPAuxsSpWTTt0s99SErQww7l
         mv+wKv4vdOWDabmin9Gjluj8DBK5NRNWYaji0nvHK0bbxg20381tq17h3V8IrP6TFkp0
         ep7lxKLjcPuYWmU6cZuCVnWZv3oNPVXeDh0ME1TxMr89zRXSZ1dQNri85PkIToaTJPtV
         gOJ9oQbigB00nSdUIioNL0yUC7lzzb1K6i0GMjUD1TFHNuFWjDtNMiaeq8ZElMQIg/oE
         750LBQn6HmNhcJqgPHsx9jw+9rzyphBjvrJkavuZYXavtdJ6yGFUFuIfby3GEoxQBCxa
         W8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068983; x=1783673783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wl5tAH2CAN3mmlekbOVBx73EQnsZFSJDZpmN4ENmcAk=;
        b=p2l+W7Mtb5/GGUwGP14mGjz54QhnX0km2kuA3ln5mdWhicZwGlHPQE9CEABWkTYobq
         wAGQpkMWTMZdt7jYrK6GB+8PB52CISdS6rsHLpVFE6Hv837EEvdi/YA5jH5xZlHC0czI
         QgO/AZSTr5SJPWHEvV61J6Y6l8EGkvgp0IDjiHJ/tYAgU6BV0ClIHkwR+Hpa3qcNVDsn
         x8jWw1yp5D+GwFfLXIkvbHMDZj12h4Vi2kz3Khq5WUYGBsvhZPjXlQ/nPBI5f5pXw5Cx
         QRnrszbWEXoA8SySiQjsgxWIniK45ReRd24M2mxRG4SU76lrdCKkUsHt3Zy2LTnrwMZz
         930Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ERBiFDvYbM7beEVUh59Wi1R+eXfSwrUsJyqL0dnaho0O9gpbbNcIfBa1UbGAuwPMzEdJgJeywAjRecfa1@vger.kernel.org
X-Gm-Message-State: AOJu0YxIos9VlmKukqxiKv6INHVlyTGxjQc5bf8z0UuQcbl35o+iTso0
	2HfTgT7LwaI6EwsWeqjhF1FBWZGKQvIKOQTiFE7ZQuvu2+f5L6F/NbaZ5fZcmsftzLvEv+uz4we
	yloVJjxYhkWBUAQLqoIclmC6Dj77XxEZoNaWImC3ozlHwCHrD12CoD3R21DjZwYvAkzuO
X-Gm-Gg: AfdE7cklUcUFnuR1kTYu0tOsQ7rCtowOigQEcV+doPUPec9yiAtkUtSqdlumktTqZcr
	bwxxJwIq2gGqrPTZvIx1CRyoCVytdWlLpWIuSnyq8UslEAZHTmWmPozKOvqj/bGGmqeVpvCYTey
	eIijYTwX2q8eMvc1GD2M5lKsW9QCdVibFB2kC2X1LLtoyP/Q+PKg+cNYnyt8jZHTgvhNWCKqlCV
	7Owyzd6DG4o1Jol7GZSYVu15igYAZlJAMzurQM5aQfExGoZiqXO2j3hRMvFUK7jPjLwHKx+Y1L7
	3VCOURH5GpQzch14aPgHvWfstgChHk7lXLaOEqihS0A47kKwXVMJUCNNDik2LUaaGpMVnY0E/qn
	bXxfyqvWdERmiIhGQ21pgianLp9Dyfy7SeqA=
X-Received: by 2002:a05:620a:19a3:b0:92e:5272:4e3e with SMTP id af79cd13be357-92e7809ef8cmr769285485a.0.1783068982939;
        Fri, 03 Jul 2026 01:56:22 -0700 (PDT)
X-Received: by 2002:a05:620a:19a3:b0:92e:5272:4e3e with SMTP id af79cd13be357-92e7809ef8cmr769284085a.0.1783068982565;
        Fri, 03 Jul 2026 01:56:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629082dsm254187266b.29.2026.07.03.01.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:56:21 -0700 (PDT)
Message-ID: <2105eecd-b2e1-48b0-9795-ddffa8e43937@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:56:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <20260703-manipulative-mauve-centipede-f8c95e@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-manipulative-mauve-centipede-f8c95e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4NCBTYWx0ZWRfXwluV5aRf31ZH
 Q1Nx7INjA6Ewx0Du98dzDdaTrZgA541e5QGlgFVWZxdzo9rYiWHZzcYcmkeJYwWKGFl3qrYsexq
 m38mkdyArUQlY820S3ThzJXft0NXK5E=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a477937 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=q0dMSk5aKnwmW5Wxa0IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4NCBTYWx0ZWRfX3ZS5yMF8tNEI
 /9e0YLLeVPBdovc0EbfNBe9JcL/6Kzu/Zoc7pJFuo+yLEqKC1YyfalAjMPEoDfitmmg2aAD+XT2
 u7Tv/9nmRO4/CTu4NLWN1dGW+eqsKE1aFsx1FYU+zhAM2wEF/hU+Evxm6KtXLd0NygXev5oFPW5
 YcU4PWQr7Ul2SVt+TPiZlb2tBuwPDN0rrANyu//bCvwMQES1nDSbgcBcs4hdwa2Qvbjn/hUgcDm
 oS8V3YcbB5WT1U3J4QHYodA9OrYJ5v0lnykR7naC5X8ZIhkuQ7GVdsCup5BidG/6sxAk5pxmsOX
 oxeUNHQHGe1M+r0nbxUPZWL1xRXipE77L0mTAu3nJgX8hHIXjh8f6moWDoAKNpc0gb83dLkeGFV
 VLa5tRS0IYyluQtU6rY3oOexmT1zjMv8KZ7xKnHTkW8G64RMuU2/JrjEhPcIXPd4MVXrt53BszT
 pUhgBEmzZ02eWiGPmCA==
X-Proofpoint-ORIG-GUID: 2wg6TDptqIb1NaT2H5PTEHDu5koOu1MV
X-Proofpoint-GUID: 2wg6TDptqIb1NaT2H5PTEHDu5koOu1MV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116243-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:elson.serrao@oss.qualcomm.com,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF908700584

On 7/3/26 9:45 AM, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>> independent High-Speed UTMI paths, depending on the SoC configuration.
>> Each path is distinct, with its own connector/controller connection
>> and role-dependent UTMI routing.
> 
> You miss SoC specific compatibles in the patch. Binding describes ONLY
> SC7280 but you claim here it depends on SoC (not sure what is a
> "configuration" of a SoC).

The hardware configuration - some (older) SoCs don't support muxing
to another port. The binding only says 7280 today, but after some
version of this series lands, we'll wire it up on basically
everything that came out in the past 10 years

Konrad

