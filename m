Return-Path: <linux-arm-msm+bounces-116286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RfnQJFWaR2r5bwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:17:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D108701BA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:17:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ic03lH68;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Hpdsh+IQ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116286-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116286-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B9103040135
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEA737A855;
	Fri,  3 Jul 2026 10:57:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BDE380FE0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:57:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076221; cv=none; b=hUG9VRJgLNLk1WCzy/ovDVgWLZuVR1ZngWFrZdrfuAdJBLzCrRX114U3CfoFFkVy7tecePFp0Yoaj6IKvxAS3CDmwIU1QnllEQ5F2nUPBCoxEXK9fx36G/ueHUPB5+IumLnadSKT1jgcn4FNAANAbbuJ1AT3nc4gffK5Bgn2vN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076221; c=relaxed/simple;
	bh=0JQacMzSRyjTQQBcAIZhimbdIEW+6BxXqyEMkbRDc5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cc7GfRWjrEqGlidKRbCBQO6CYAaAqWvjo9ukmFTcIOokYhkf40+EhvYYgQH4D0KZm4IUy1flgFequIBIHTVh5zNgX0VqBcjcOr06xyi8MhIRbPSGKPAULWG4eytXfRe8oip46IaHXf09MoSzYgyU6nd3r6ySpETxGMqevdUTdlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ic03lH68; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hpdsh+IQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635sCrv3127066
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2RjymqnrnjnMkXGMrr1Wr7oxFtsD0iqenABKIn+vrg=; b=Ic03lH68RGmTLr/a
	ONrW36nAfNOdk9sQPBGHBYuNBWss7dPkk7gBHRpHagkt4cd3Ps7XMDx/EdNQGH6/
	lbiDwOiyhknrfWWMynvXpbqq0MH9LmRUeGlj0U3tkxLjZaKhXnRPezrzr6NWDjbD
	gvZ958EqQorc+LfqZFQWMzuvcN2rW875W6ol49u9YQQqcMD/awLrlFP95H/UTEFy
	4Fd3rzvuwj8oL3sx4hYSeqeuyMGYhKvVThNg8S3kqAObkknMyt0V0tQK9jEBfd8C
	6+3Bf3YEOnOv7+1mftUsVPtV9jU9ui2cqaQNIs45Bd04nuofzaqBDHIt0Hpbguxc
	wlznvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnm2qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:56:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso10689785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783076219; x=1783681019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2RjymqnrnjnMkXGMrr1Wr7oxFtsD0iqenABKIn+vrg=;
        b=Hpdsh+IQhHlHT/Y9F36+KMpUQyS2R/GMLYdPgHdV46fQaywwt2+AfBAryVlUDpT95v
         50Zdy39TEYfk+i/CS/2Xd92z/SWqsBQSqhxwncONLoAB45Ir6rULOuVGA+7eKeUcHEaX
         vbYylOgxpa8OX9VDFp8GaEAju1q6hQmo7jeTm3TxXqDn99RLAbWvCXu1CwbBWse6rBPH
         T10ptOghH/giGQSkLGTODeUsk6fa/1ZrxF6SE4EGpQzWcgJHKJxzCNJqdvGeDs4l/iA2
         okJUtiebgAc6tfSluzrzFpdK69m6vvR7Hmh2Fzu2SqEIoFqxIaTRGKgtNlW/iujOtoON
         FPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076219; x=1783681019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2RjymqnrnjnMkXGMrr1Wr7oxFtsD0iqenABKIn+vrg=;
        b=plKW44UomJXYtslFOrzo6veWLPopW/xMkrKt7p+kLNHQKDicvKTBWlJCY4EIcIjRFi
         y1UsOokB1pIC5UakDbTYP6kIybe+HqMhah4enhYZGxrIWyGg9zPIP3B+3Z0EpcIkkcHw
         8FUC63DWvaQtyiLwxWvnJL4rXPz3LG6vranBEa6mPpxrIHEZP8JgIwreQRs2NWWqy/Ni
         V1gGN/T0GGTUMG37GsVGjRyCcp1WU3aOlyIhX8UqzwEVQhW26wOA2L7Fa6dNX/OBT5Gi
         tK0p+6puxgn0MikpAcBH3tMpHzdrkmrD4Izd29isRgehqZ9oLsTK5jB8lHvR907Xsmba
         hU7g==
X-Gm-Message-State: AOJu0Yzn6fct6abn9atDKTqYBp4JCnRboZnH8C/8QrPLidB99ynpJMBf
	i4kDx79oMG6RKv7+1Cogbh2hJ+t1Wmlkd0slwGUwuaOtCWnKqhlECqhlYsjRIUJVQzZHaG5tuAu
	qJZLObQGxNfn750DoSVfzkpALNFFiDwLa/nQCgCxUivdUdGHWZUyn5cwB+qOgi7VLnkPSC+rTWx
	T4
X-Gm-Gg: AfdE7cnAgMms6lZPvk3z0oUEG4z8NjucSQrp/FyqQ8asLaMphdmRHLtE8Lf45/l81mw
	93R4g0jLR+vDcQfD8meEBO2Q6rJnGpCGVy6jl1BkqbWQTxgiZCzUjSWpUjJJH6HdvQ4+ihL/QB4
	5jVOC5MKm3qJKfMb9xRE/wR+Dypr3BjD3J/IcbQ9ujXMp8fWy/NRjm1FpX0grFyn4a/yk2BL/WB
	064WRJQGFyg0kMSXfLejS4yow1Z7WqylP7WbLpsba3gXRtWGRAHzaYCBXNvv3gQ+07t2/9yLTJl
	erRndv7Ya2HV4J0sYcKMu+Mww/m4Iol4IoLNH6o7NrhWRrnf4KA3LhWCncZTyaHXFaD6LCzet8Z
	vwIssnGUtAb7ljQ2gv/jnnXwkSVNVHxx5mig=
X-Received: by 2002:a05:620a:628a:b0:915:7a64:cb68 with SMTP id af79cd13be357-92e781c5c78mr755176785a.2.1783076218980;
        Fri, 03 Jul 2026 03:56:58 -0700 (PDT)
X-Received: by 2002:a05:620a:628a:b0:915:7a64:cb68 with SMTP id af79cd13be357-92e781c5c78mr755175285a.2.1783076218537;
        Fri, 03 Jul 2026 03:56:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm266011266b.44.2026.07.03.03.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:56:56 -0700 (PDT)
Message-ID: <67825b75-3632-42ac-be73-1712b3933791@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:56:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add wakeup-source property to
 usb controller
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 44Q-Q1oBloAvcgfypbjAnc9PDcAnvSw9
X-Proofpoint-ORIG-GUID: 44Q-Q1oBloAvcgfypbjAnc9PDcAnvSw9
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a47957b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=i8nJ_-aNT86P3f_d1rcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX67THj+E/d6uK
 gS5Zo3fKfIK7yqN2F1MPWdJBH08PXuc330KE2uQ51+1HqDggTNnyYivu/ZuOcnkEv1dTD3/t9UU
 p3BAYLBr6TkjL5CjQuYI4GKQpOlV0QE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX7r1DHFiBUFe8
 9cgSkXDS6NimiDPLCF04vVJV94NKtiYA1MxTHMV1qsASE1fWvLSM6iOTbWkcdZMxOpD7U6nKbeU
 gPzGJv7xQiotuTKjbgkzfVFj+nr8wKspTA8doub2lWeGYXvN5qpBo+Yxe+va/X87nU2uhUAfvnJ
 oJvDTjaEZrwuq+eajAmc/hoWRyVMEpL996rQj0yueWsabLIVtJs7vr9D9K8RD+UhM4owaXIf4QY
 //WgjiW8IPi+H64E68JRgt1j+1dVoJpc8BlC/Cl6UlNbK1K/3G4Z5ei9nM4+pIDE279P/J94S3x
 uYATqLWLdRs+VB4Q6vMyyVWADIbETmm413XEQkaT3/+vTGUBMx3nhymJW8ICdDUQ9XG6gyNSq+A
 cRE+ZFzCbNtE6MVxotATBNKef729kVP+1L/67Bi5a/WirPaYg+muszoGHRLEBpbNQnyaeWf6d+H
 bBTptfIZ9hkHFzQ++/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116286-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krishna.kurapati@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D108701BA4

On 7/2/26 8:45 PM, Krishna Kurapati wrote:
> USB controller on SM8750 can be configured as a wakeup capable device.
> Add wakeup-source property indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

