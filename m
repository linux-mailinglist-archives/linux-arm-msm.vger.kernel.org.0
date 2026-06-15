Return-Path: <linux-arm-msm+bounces-113081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ttuAK3WPL2olCgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:36:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E4F683852
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:36:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=osoMbfcQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HHXouZaQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113081-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113081-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D97B3001F96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 05:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48883A641F;
	Mon, 15 Jun 2026 05:36:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA0E1C2AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:36:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501795; cv=none; b=PIMNxJa3oh9du9L0oi9PGHAnsG+jmynGB6D/+OThypvoGk0nGr3naRULYSRBB8+20aDHOjRPGQj3FNIIRAbRPZY4GoTIWISeJBby1mV10NW/e45LbznzVRfOIqYgWdsCP9GGUF/A5s2LgWXuI+6OwMgZktOf0KYNSvFIfCJDpro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501795; c=relaxed/simple;
	bh=dNP5/sUUcTWoBKBcTRy694X/+WgUZE4EIoX88E+08J8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvyjR6RsCZRacunwdrkZa2qgXfMgvR6rORlSbMs70c36/kvDAJYjHRH0Cf/sEmuxJzRj03G0pXscRxF76H1lNi/lqehlcNdSCYuStlzaiHXFT/ZQRrP8zB/ymK6jeOz8t2+GaLhdYikpgTPpGqRhQAsjeC8oq7fv/C6ojxJseBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osoMbfcQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHXouZaQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1hrEo2727522
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o8o0It/OrdXLPNueLkoJTCzag1qci+lqYellgsJwjJc=; b=osoMbfcQzSahrUNT
	CvGeXpZxqQEAoYKL4/YqmDWDD4pH9L30lKXrjRgO9ua6ofpF57K8yDH2oL0mf4KZ
	KPZHGLxVuTIBLJ/de7/VG6IZN2HHwT0ZLwcGrRMrwMtRbTRouJPF/wkAE7ZXwXkg
	d13gZkmSUpDjpZb6KE+BRJe8QKBRfMY4Ooj4OAj+fAg539eijnMgasSWo/kxGDai
	8/XlkbOBq8hC+LtBOXpmhBFgTgQ/VW6eYzXbqSMrzyB3p/SYL+qy06bgI2sM4RtR
	UnQSHZwCxSXkTICs4h7ugbDGpKd+8i4HfcymRVzYrBk3R5FwqW8EUjuZ1S6FBtpx
	VHymCQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye15r9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:36:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso3556576a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 22:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501791; x=1782106591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8o0It/OrdXLPNueLkoJTCzag1qci+lqYellgsJwjJc=;
        b=HHXouZaQlmActQZ308tHnHmjPOeL4H+DfZRvxPWMmLYB9poY7pBmy1uxmBH++iwdS9
         r1Y/9PvimdwuQCwOyoGpkbAZplZgQljkol15CjY0R/pZuMaOYsgsGoyQCpyxyaPR9RoZ
         784/OLpFjvY5Ts9pj77nRzA40EMSbARh0dV6RwW7ZoUcqbFkZYgcYzm1Vvxy/DTpPx2Y
         SvbiQnML9Z0l++kpfnDMQLMRh3NyN3LVuZ283DA8I0iqL/5xo0kZ/m6KDKg/Njn+WRu1
         0lz2Hos51hfPZTD9JNTcc9WKkWLsmC97ITbgGVSJ+jwB7jGBt2D53Z1+ywn/x8E1x9p6
         faxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501791; x=1782106591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8o0It/OrdXLPNueLkoJTCzag1qci+lqYellgsJwjJc=;
        b=Drw1oHNzul2DM0ysJkBzaG0fu1w8WNwSkawcgPB49CZCkZfOjL9nts107hKLdNVxQb
         bBHa0kPsDTj/PwMzRIdPlotnL7eEz+f9tQZqLa1JUlgJBOzsTILPFKDvfuaJk/NQ06RI
         VUFlURPvjaP2H4EXmO7HuFzHjBgm7/TzdVg6CT+BHA6gKM1/jLT6WvF2oQ5GbIj8e3Jr
         NMG27f9WamR9HuifNegyeqEDVdZmPutqDyyZhjzJY+JFqH1K6zNoXtwmOUJOKFDxerig
         iotCdQGOKvKjijrXnHkCDWan7y1+Ce48pNVeiULVKrAYMsmTeFgAsH1HP0OBH0NWJOSi
         KdMg==
X-Forwarded-Encrypted: i=1; AFNElJ8x5RkdhWs4mZie5G029FhMdy7nU7kPDlKTD86MQ06acmh5J5f7n8ZeCK9IYwP3I3TEAYphx3m7RevYdoKT@vger.kernel.org
X-Gm-Message-State: AOJu0YywwzPne61e45Umwoo89Zx0WRXGns4BE89+R+gRMKCZEaoztwO2
	/Dxli94AL3fFAwe8yxnW/nQCBAEQH2otnE/HYtYDKGsWZ+7yY2Afwv+xmS8iSdUQq9JJBSjmQSa
	uvnwntDclhJtkI/XWy92OevS6/eyhsZnt2yqWyxFjD1YfVx3T9BRiPhu1C+LNS84/dSdP
X-Gm-Gg: Acq92OGZ5r7PcakTzMx9UaAfsSv2Ky73zmcHIq+zsXWHvY4qJ+sVSbs9YyQ7hf73Rvz
	sw8DPgwnaSX5ImIZ9Yo7sMRoxzSsP4Y2jfvbFPXoOmVqIQU4gbcJnpK6cSX2twSK8Av7ilnSifz
	NjlgUrgLpkSPr9/686BvFjt0SqlN8mVjbAG2tU+TDsuhcD3fn3WSWDifegeLH8qKyaTNQoHJCIr
	i8/zj5VQ4G23x5eL6X43xQs8yAVLvueL3YiAk/RzXxzhFla5gQ2pOk8Fz10ASiOKSD3TMkw6M+o
	P0eYCsGRT9/Xvr8AD88cM05nfs29x7HiMB0aYR6oNaH+Y4DukFG51bD6SlPOvIECfgOd/r9wYT5
	3MjmWV7meTaPOMZJW333whGIUn1TKtzO9Oll0CKabrNeyvX7uZls=
X-Received: by 2002:a17:90b:1b08:b0:36a:fcf5:64bd with SMTP id 98e67ed59e1d1-37a01847865mr13294916a91.2.1781501790990;
        Sun, 14 Jun 2026 22:36:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1b08:b0:36a:fcf5:64bd with SMTP id 98e67ed59e1d1-37a01847865mr13294873a91.2.1781501790544;
        Sun, 14 Jun 2026 22:36:30 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c5dd0sm111774125ad.20.2026.06.14.22.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:36:30 -0700 (PDT)
Message-ID: <c7a84000-f67c-42ee-9589-ddf57fff0f1a@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:06:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-3-f6857af1ce91@oss.qualcomm.com>
 <ahWTZj727RCNZPR9@linaro.org>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <ahWTZj727RCNZPR9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pukefvlZv-PaixFx16lXsiwZuIBogtLr
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2f8f5f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=2aojqq8GJz4wwv9pKCAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX8ollTcAmoDDW
 wP/JdOQDNRHL989OzZH+m4d69f9diEEiLU3yHCDtd5dSueKY+69yAHXp1nNs4cNtQA3bGmzrJGc
 AAma2H8QKzGMTOQr7dPRQPLbSRMEsg8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfXzrINIDd3+WCZ
 3FD+GhczeIrkQCA9ucWYlEEzv50PNcvNlm/d003yE9ZE1ADFzGAdHCDokyRdeVNEBQ5+wn8CGQp
 BN3NNU0X0MM664dsqwrnOFL/Ab3qhhUhMJdiAL443XcHlticeCs/spwK4SY0NM/saMkbQv1Oroy
 fvPt/bhUPM7QZ7TECmOLh7m2XrUYDZ8fjskuVjnYkVUpgPBVN610QJf/T9pi+WHS7n6Icl3/8cl
 PqJYcmDddnHU2+1d7jL/PL7lWKlhkeH7pBMR3k3jptwY9KQQtBKckCDwrURZ0iDjskmVsa+qfpi
 3yyno66tPtcWBDkemV5vT4GeVxeXXU+glYeyvnjsAycuy7UzR6pNnyFopM/FFgZtMcImhoYlEFi
 xMvC4Q/ZRbU/sgtJHVNHo+5TyM52+ggjP1kafpk87pleJaiHjfB/2VtH/LgB6mmmYzKRbspvqIs
 g9Z6U6nDQUiiujQuBsw==
X-Proofpoint-ORIG-GUID: pukefvlZv-PaixFx16lXsiwZuIBogtLr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113081-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4E4F683852



On 5/26/2026 6:04 PM, Stephan Gerhold wrote:
> On Tue, May 26, 2026 at 04:24:39PM +0530, Maulik Shah wrote:
>> pdc->enable_intr() function already points to respective version
>> specific enable function. pdc_enable_intr() now only kept as wrapper.
>> Remove the wrapper and invoke pdc->enable_intr() from caller.
>>
>> Locking in pdc_enable_intr() applies lock to all pdc->enable_intr()
>> however its only required for pdc_enable_intr_bank() which uses
>> a shared bank across all interrupts. pdc_enable_intr_cfg() do not
>> required locking as IRQ_CFG registers are one per interrupt. Move
>> locking accordingly.
> 
> Well, pdc_enable_intr_cfg() is still a read-modify-write. If two CPUs
> read IRQ_i_CFG at the same time and modify different bits (e.g. enable
> and type bits) then write back the modified register one of the
> modifications will get lost. Can we be sure that this won't happen?

Two or more CPUs can not handle/configure same IRQ at the same time
as the irq_desc->lock would serialize all irqchip callbacks for same irq.

Thanks,
Maulik

