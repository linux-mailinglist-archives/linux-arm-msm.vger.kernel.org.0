Return-Path: <linux-arm-msm+bounces-117644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EkLEEiRUTmorKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:44:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 378AD726E95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:44:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DnaCcWKh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dlH+tVwS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117644-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117644-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E25D730291CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D75437DEBF;
	Wed,  8 Jul 2026 13:41:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4B337DE8C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:41:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518093; cv=none; b=noZgdZwAy914tWKmLsQ6wy9YNsmqYe4ruxob+CZpkRVQbYDhqa8UY93et23CghKoAM5CjlSWoqEx2XQDELYXAR5QoNUTkyn+nC5XTtQyzekK4KQFlB32+pIlMW/2YTmtvXX7lE6rCU7kYqZ3oBcd/S6f5exhxLa+uXpqR42hYM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518093; c=relaxed/simple;
	bh=KFQdtZQUjbmVwnYD1nP9VRox/c9a/BcIswBEt7Piod4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MD2bXLEYGtjgl8FVnz5lw/47Tp7BmkZB7T27rOrQcEurdxS11LYK6C6WQgxHZomO/EgQV8IGDH8UG0VwBTqO8msHQsiVWOjxoS6oisMz7uRhulpAnhIvb165U2+nNM81+3muh/MfNOoHvkF9jyPEY3zvMN+jWtL3846lHt/+xuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnaCcWKh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlH+tVwS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3H1R2752124
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 13:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyzbVXqOxQ0lRxphI7MsEng9+COKL6/2C9LvfjUznZ0=; b=DnaCcWKhVz8p8UjR
	poXCjnT3uYYe0a10krQ49xnRpFQaTZOnO8raaX/F9ayb69pgkzjsZbjQgnrnP/LO
	ZrVDvoOqzaUo4ywzxDNi5IT6dkSb0MKsprEJBUXWCbZ3jNpr1zmH9fc6peN3gdN0
	lKg2K5TupL96NIayGPf4JbQMQ0j6d1mfIQNl1USwrnyryRHVrzwcClOzaOk9x7kx
	X2hlvLOOyLKtW2swBOZzCo6v3F4e874a1kOc59pdahNQ0yhGvBuuuy75R8F+7tTs
	zuQHQAYzeqS4JoyS7ebhqdyGaab7u2fe5O+R8sp7wz58uVDMnDmD0fHHsJHu4Hsa
	Um3Y2Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hhw12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 13:41:31 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbcdd9a269so17755e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783518090; x=1784122890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyzbVXqOxQ0lRxphI7MsEng9+COKL6/2C9LvfjUznZ0=;
        b=dlH+tVwShjwICJDpdZ8Qs3LHXFCIPuRMaukdy1NtL0zPsPyOObDGZ+BHos7MOS/ysK
         LHMOsUn2flNi8EY5qo5N8KQD8Of8rYpNViaqXaXM/INt2cdEW9wNSZjgEQF+nh3IF8oT
         pJdIzEUu6S2HAnIWACA3cP3CbV9K7DCxj3UhNp4CaEIZuxj5sItpvWJUBp43bdgK+T+U
         hQwGCxqJafuZwgw4kKOsoUOEQZGRjKjf3imAtv7wQ2AsyFtKUQp0JWwt3z5KmDakEzF1
         7i/LZzQOBqs9A8MJxhuKjconRrGouqayNPNeMAvH3m8r53OaohpMV/2RjGA8vzN9ToXW
         hCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518090; x=1784122890;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyzbVXqOxQ0lRxphI7MsEng9+COKL6/2C9LvfjUznZ0=;
        b=VtH+OjIUgcm3nt0s6ymdKqa9gt4YF2bv4Aw/vfVfknW4ykmjDRJdHv7CYF0EuRxSvR
         khyDSn/GSSUVALuk+9YaBsx1pQnbkZJl0izBHdenWMmnWIMMRCgAs29yj1NS/VdIdAAE
         EqGc+uwH/9pCxZK69sRls9pBQFUJf1/bx3FGUgwPQ3PzFd88U16nCJSZP0VJoreD3hjw
         fmNAmt/DaXRIX43F9DORbMKolTDBsFa+fG5A7PDW5GNqVHyAMCo9aT5LT0ELpvSqKyca
         DDMUecSVfLQtbUOtuFrnADvzB6+NaPUTIn/d+lNMKdjoFhlY417nCao9rk+mnBmw5Uq1
         Cxrw==
X-Gm-Message-State: AOJu0YxQ/ku/CKF39G4z9uqMjb1IkCZidDiSRfmV+vQhomR6IkYeGIp3
	FNeBI7MrweNvD3dkZ6buTmF5Op/fQsZ/Lfcyzvj/++Q8S38rYuuODXAMRwTxRBpCMSVjPyPFeuP
	zh9wf9/QMi5ZlMkbkYUfiJS7D9YwD7cx+/2yX8FiV54Vw5HeisxjvXwtgAf8mRQtSU9uC
X-Gm-Gg: AfdE7cni3dJp43Wvz7OLYj2flzBl16F+frQmqUO5D7fpeYq1Qpz27g+IuuUHFblBGcf
	vQjSDuX2IGrbE4paBOlInreEjdDnRUFrN0Nuf/uhKvDfTOeAUz/phzXHlrCy1Pt8zY1sB5Q9tl8
	S+FbsMdiCK9Kz6PZi+dd+d5z7lak8x47+hMAIZjxOIvnreJZaN7rN5/vooQ6Fo3eRrJZIL3WRFI
	ZTupam7q4ChpodwhFHVc6MaQr5oLOLE2h1PR8dlSFyek/qsqwpo08gUEDx+Mww0cuxbE2v5BZAf
	eMne15W+StZ7UNUUt1It0EAVZpFsHuJXxyw6kXK+3M/T22verSW9i+3MSQjLeNTxcnIFzhyfNtt
	jOLPVOuszfBU72jKAhPr7AarRvItAVT5JErU=
X-Received: by 2002:a05:6102:c0e:b0:744:ddf2:afdb with SMTP id ada2fe7eead31-744dff8e891mr447029137.6.1783518090117;
        Wed, 08 Jul 2026 06:41:30 -0700 (PDT)
X-Received: by 2002:a05:6102:c0e:b0:744:ddf2:afdb with SMTP id ada2fe7eead31-744dff8e891mr447017137.6.1783518089586;
        Wed, 08 Jul 2026 06:41:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb417sm4432418e87.50.2026.07.08.06.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:41:28 -0700 (PDT)
Message-ID: <cc934e7b-25bb-4e57-80f6-dbde3b9e263a@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:41:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzNCBTYWx0ZWRfXz3CODGtiwYKH
 jB3rXmb8tFyf2PHiZIokokT+Bnw9ASvDBjOqKPy8KWQ/j0O2hFZOEyqC75lPaarEpmOoixWWnUz
 m2pKH/Kze0NDdt92euAYr11Mqh1w8KZFRWnrbKTxseMvfICwsGSt9XCk3kn5kZAHM0vEgFLQOUT
 TzCAJ856S7E9/X6mJEtbi9MZfH9LPgJ5WuCXHm/QL3P0HhWaP+uuj/m8kIK/FA/Ih6PO+z3WvbS
 ux/7wKEgQh9yVHS9NfDxjVaWra7is1uc01vCh/UccC0uo33bjNeI71AOEwMLQu3gIp38rriT+4z
 QHNUpna6wVH0NuGA7FxR5kkRiyttFHb1iryLZCzx+RrAoHLu50e5BX0PPL6vxfD23DXk9ByAq4J
 0d7229qMEdDqHgin6MtKxpOM239zWt2kcPW/5V5u6k5MwVoPT65oq/0RNHYmB6xYDpk5CBh/IPR
 tPlaxkVJz0VFiWEevmg==
X-Proofpoint-GUID: SjOJjOOOa6Uaq7GpbNPC7xGLiDqgYM8m
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e538b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=T3cQ91Bvcxg1os4lQNMA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzNCBTYWx0ZWRfX0hOhPjShR/DD
 k4irTBUidgMyeY6YssUSCiAZylhsIFt2GlpcI2dbBFN062pn6PZthizKgHopzdjPZai/9/2neNf
 MOxAga09ncn9IDP+Yb4BI9XJXHLWoME=
X-Proofpoint-ORIG-GUID: SjOJjOOOa6Uaq7GpbNPC7xGLiDqgYM8m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117644-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 378AD726E95

On 7/8/26 2:29 PM, Abel Vesa wrote:
> Describe the CPU and LLCC bandwidth monitor nodes for Eliza, together
> with the corresponding OPP tables.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

