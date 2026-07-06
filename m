Return-Path: <linux-arm-msm+bounces-116950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WHdINkrZS2qRbQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:35:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A171358D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:35:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZK0kGXxM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iDOl8fYS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116950-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116950-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECFC9309E5CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC9638D40B;
	Mon,  6 Jul 2026 16:00:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D65343899
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:00:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353641; cv=none; b=qaqj+1PVGis82xpYR5MEibzyt+jxMLM2BZ018TQFs/kdazGjxRXNBN0FP0/nP5YMg1exCvY4cxkSmguedNtzDdylCI0HP8IHr8i2YeNNg1gcDeZfV6rjdG9hIsGdAvUybsc7MWOHBpVsf2YyKpmUkOOn6U+mCjIuvJyRlUUXbnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353641; c=relaxed/simple;
	bh=GkZB2kFkducGYXvPaZYByw2eUSJdtvjP2KUbiBQT+Hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTjDoo8Od2qAoaJnCyZxXGQyOX8UmPUPxeH3e0L6aQaqx0dt4/yFeVw66IDQyE1mm1WoAbe+O936r9NMpGu9LbLLc/9C17PWJ78eEW6AT91b3jKUoRbmdaoj+mt66ufPG17Zgb3hMKtZGhCENj9NXgbqV/a2+QzIjuVn9b10Jpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZK0kGXxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDOl8fYS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFAfm958540
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GycIZkc5tJBR40OgyU0h+N+3BJXNBJqmCnBI58QvZyA=; b=ZK0kGXxMXKyHEEKQ
	eY65aAB76x/z6AzUPFjhbuA7L1aI0oGaB/VpW/mO27XwWO8o3Wxy0kPUMubC+Sc4
	aQ8cHyEPIPnFlAo899tKNGdMpEET3KaXdgNTxxHb2ophTgtKgR6U6Zkaq7CmMwh1
	x2ki5gvsYgRL0Gom9MVtVZKCAegqQb0Ft8sogGc4Exir3SB+w/zEzlco/dsvZUrZ
	uG1Dn2nLAFW0xBg7gqjur0Q4ycgiawqSj6rR2ndgOAiBUkNhqWdLlxc28daa+728
	y7nzSxgu3GIJSPydaoKdW/N5z2ppV9u89zabqJkDV9UMktn3uxGP9XVbKSNEKuwb
	tJszQQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9a4ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:00:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c069f73e4so10482491cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353638; x=1783958438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GycIZkc5tJBR40OgyU0h+N+3BJXNBJqmCnBI58QvZyA=;
        b=iDOl8fYSURCkKwoHJUglllUHEFdpO5lRC9yh/Cq0OQT25ghXW7PIGYY7ApcPYRQx+o
         59+FJCfrNxIwqSj23h4zuNcF8c21qQ1tiMhmBzNQUuFZh1tczC+L+EvDNOW2ZwB+lPnD
         JgHzqsFlGDHWtTUxVS4EDH7gWaAICpsb4kwakLGwATXBXEomAjebnCrykG+BA1kpsUD6
         XhiobUVcTzr+7D6G4iQXlhSUwzcqqW/+ZSt5eaxxFZRyjxJL8ZE0kPwnequBcHaBzJqH
         YQ5ZWq6m3BnE26g7Rap4k1uGXPgC6FPzBtbc8UXTKxCIoW9SXu/EYYdy8+Z9tvkGGs7n
         CdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353638; x=1783958438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GycIZkc5tJBR40OgyU0h+N+3BJXNBJqmCnBI58QvZyA=;
        b=GUcaQRvZPgmDqcoNIi4yER+9BSgmJXO9Z7GezD271uFL4Mdk16KUf7WOJU741VFuVg
         tO2abFMvIcOPJKvH1K6YYTCTyQHMiDLNbrnn7ZYy1zKsU30UCIEDMGabRCG14Eukztoq
         IqQ2/One319wH6n3bh8/u5lGWsNpI1T8sMRP6foA5xV9Vf70yS0zuUrklmyzEimweC6O
         lAH6xgCeRbJSDWUba5YVc+074DGyhUBq7oKyD+t8TI5jreGnyAyGxpTuwYSVNFPUp/rd
         V5XU+QOSf38G8R9XsD9KM6Efyn9kpW8vpvsiPMMA714wQLk1GszYvQThfnPr8VctUxT2
         QJAg==
X-Forwarded-Encrypted: i=1; AHgh+RpepXuKMPb4+UufiWHQyrR9AX04p6yqmcEHDMxI+FuGip1Q0aRr52D73PYU0YGd8sTArGlstSVyKkb6lCfR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq5TlDupf5A/P03AEaLetcE7tLTxcJ/Ijudb6mxT1/cK1ti7nw
	AsL6UdrX82Cs/kMPgJvzXqkw1QVoWDfPvUE6wZp12H8rvARi4GYo8E31C1N5CHyXE2TT/Rm9QDm
	XI8a5ZH3Cx2ozAGuOHJCB9pqx3Sd0n1le3YdPshG8EwwMOtjok7Xl6qgx2TUe/lMb+sZW
X-Gm-Gg: AfdE7cniPWuhKapLKu8EE1PipQpXJrFDS+P6x1ZXmiki3lMBoNepyBb7cShl2P13mNt
	GUYyuQWTitN9xgAasKAXvuQ98RDaKJKCn1+O/JnZa4ebKO5s14pbPVzphgUQbe9NiChc4MQd6sK
	vuIGlSvGlJDCdBvNxtwdcNIUUlnzZ+mJl/iL0VYFWde3U/slQ9IfO3iZo//QBUlwvtOSd9jfMVV
	NGrDjncoP8dRgtDmPSTDbxoVpirvQRYOCFYSHB7XMQFDDdJ7bo96TT7litnjm4YmHSx5jx/5soG
	bPt/CKR2ujJ43RJoZdn1XSrd3mCYfFZT31V75uV46hnjMQ2ZDIjzhp4I50jdtFVRDfdvg8vrcDM
	sAYeALReeF20DuJbzyokaHCS13g5mJpaDSZY=
X-Received: by 2002:a05:622a:282:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c4bd95127mr94396141cf.2.1783353637980;
        Mon, 06 Jul 2026 09:00:37 -0700 (PDT)
X-Received: by 2002:a05:622a:282:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c4bd95127mr94395171cf.2.1783353637311;
        Mon, 06 Jul 2026 09:00:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5babsm767201566b.60.2026.07.06.09.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:00:36 -0700 (PDT)
Message-ID: <901f6be3-9c13-4168-8233-1187f2f2767b@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 18:00:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Make ssctl_id configurable
 per platform
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
 <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xSSnsK7_OSG6isDJwQ9D1oYP4AWxkso0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfX64msAuyZiFko
 27qw8eJvCoIo1bhwxONCEVU/9o1qqPFmk1494CL/1VMnHTrLVtFvOgtjzwSiAW1vB+/9MlDuPx8
 9qsFsr5bjzt228ubZCNZ34tH3Ywtnak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfX0MIHRkquUAkZ
 eV7wvAARCF24y4SArCGvUQZsoKRfCCj+Z2+lNE22DAoVHHZ+EmuKKRwkkDyKQnd+s4t0igY7ZO0
 Ez+peiosIeMgIY9TEZhV7jCnBlnNrdcEeNSCOszufDmjVNHzl6BdtDQXZ2EXt/1hZUOwF3jR2gt
 5Nc4cxP2ahK/+sLRRmEsOM2vYc1A1yLY6nmZB/KFnkrfXRNTnZiCzn/odoBvH495oHJNmLBeQdf
 xhrsXWlfCHZMmcLnxCWC5+zDg+Eeie1J6cI6xnRWuU7Tk8PO4xcrZOQ0wzb0VRbW1D/T5fsZg5q
 55y92ltSSKFOET8BmHRm1qpjsN2jgbhIK0UHtSKXbbo5TmT/XdgOvN2jYKe68muq7S2EdlJCO+V
 OcIFnMl4rYdaXS5Iv2UUvozQemdRUmxtKIG7yTzC4ApeHWUkprQc4TJrclZpK42cyj5uMp28pxT
 VZCmovKy57kAhWV/C2A==
X-Proofpoint-GUID: xSSnsK7_OSG6isDJwQ9D1oYP4AWxkso0
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bd127 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bjVS6o9MGAhJDIbh6jUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116950-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:barnabas.czeman@mainlining.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 517A171358D

On 7/6/26 5:37 PM, Stephan Gerhold wrote:
> Currently, qcom_q6v5_mss hardcodes 0x12 as the instance ID for the
> subsystem control (ssctl) QMI service. However, some platforms (e.g.
> MDM9607) provide the service with a different instance ID (0x22).
> 
> Make it possible to override the ssctl_id per platform by adding it to the
> platform-specific rproc_hexagon_res struct. The same pattern also exists
> already inside qcom_q6v5_pas.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

