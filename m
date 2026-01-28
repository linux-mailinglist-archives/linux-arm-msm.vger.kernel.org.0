Return-Path: <linux-arm-msm+bounces-91028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGS4DMsOemmS2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:27:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E590A21E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92619301454D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C273352C31;
	Wed, 28 Jan 2026 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qv2nX7eG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjxZbNsn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D4E352FA7
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606790; cv=none; b=r6GAkHvil7oheuIEHvdd/ARvchCHUu9bxepdIhgbnd9MPmoqJS0V0zOW8E1MNAc5NJ81emqgMj7VuHghgGIv4RAPZasMbM+jVHP057coHP0m2D8EZFoSsKtfWEvtTbKGDS7KGJLPzMQEebbCpoCLSbimVfLjFrh1blIzQb76EzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606790; c=relaxed/simple;
	bh=EMw9kJui+iHIIPj00fXGzciiKCMKkCyhuHi7tyuE930=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsttpL463OkJzxrHF6fgiwNNnGgkPaJeVtCXWk1NTNYYtIbKA0i+oiAYA8yNc85B6eR1UFUJOQ40a1FHCMofd4RCvdkbVMKWU+1t0hqpA7pP7vqHHFEe5nCkdpG6UR5rVZlJUptpHINXXAMH46cloywBGPxN8xlsskXptW29mVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qv2nX7eG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjxZbNsn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91pQl3879056
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hel6cjtVNcRk3KfsQ1p0whcU2fVKIAOioRDHS0NA4sk=; b=Qv2nX7eGha7JSjeY
	tluBpB7vqNtjrQYw7KDHEhxNjop4afXAIu3dAK4iLjuO6HPw2kYMb9D0o6yVxrdm
	RqB/Pym5eSfqYcWOdzfEyOCSOBSfOxhoprSXwPVpELCeCkEQiAhgcnckqiZi69xG
	qO6YxAsUnsQrUYJoXtWYCo/2K+IlT6cNkE3RN+sVotCjPRetFC9L8o1Uaf7+lfk4
	taAZzY1DHePCFR1I/Aj7ugOMlSYx8zrxUjkqzFZH5wv39XgSs52jXcEaAhn4NKeS
	Uy2jK1HVStAfRd+9B1EIalL0o6NnXRYPpsl5DCoSFVGwCIzwptrJTWx0W1h9UO17
	UmbL8w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv1m95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:26:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-501506ff58fso20260781cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 05:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769606787; x=1770211587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hel6cjtVNcRk3KfsQ1p0whcU2fVKIAOioRDHS0NA4sk=;
        b=KjxZbNsnkKgjRyqPrB4YvRvek6y3oC2fH5lR69BBqD7H6obAYwatgsdbG39pyzFNA1
         f8vptELWyVX3LjNDhaoS+QJTzIUrh+4aavyp7WxkPpdy9fM0hwhLfc7EORXVfwnLrdu0
         v66SLHoG0ywIS3N/xyVy6HTTKkPOAqvIWS1bFefQo2REaSrJZL6it2ZCm3ahK/GNaRiz
         hEdzBVSfRuaV0akCyDtCGuxXl3kHfhhpvn6ohxZlrjTdmCfg3CCxxNK3Hv2HPyLMqV0d
         jwpaB/AH/tJIsLb9MvqEqD48jtSj5gWy79Vc6cARRTwFzRVbeBHd6TrCu4CKCcYYG72b
         GYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606787; x=1770211587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hel6cjtVNcRk3KfsQ1p0whcU2fVKIAOioRDHS0NA4sk=;
        b=BtgpP7LkUX8ozdh29HsTeoll+nRXGsXDdf44Bg5nid20zQnetETyiWwbdakjl7cA5u
         N4I+Uriphf3rK27y3xNVU05boXgV1fURpj2weI5jrszcFvD3TZXIN1wURKoh4QikgAqU
         rC5YETnvHPHQE6jfSLBV+a4i0h1geNvrJ93iExUA66B7P3vaKeltLwRWhahuVyqxSbJt
         Ottt86aOmu6Iyv9l+YgYxHCX17AVgEogTMKKemHzYJokKLnaozLtU5yzALmeMiqny4VJ
         DO/Sy4af91d8s5q0yhq3J8KuOlVf4qFW1FbtawgqLwdjj3YFF7bjLy+bP9/P/hQvC04e
         LsSA==
X-Gm-Message-State: AOJu0YyCbRNrygUtogzACxX5UBG4GZOxb8zELJqXOCi0DLp+1Sg1EZFG
	rhqD6+EY8V+WHCPdsIq+gOOCmp6oE5gn7pOolmiLTWajNZ5vaM4cK3SQrU15pjFIyQWhISDWPgd
	WHZk0QEeT0/hsRVppxCBJXpGBKrkg3DkOlK2wtkFyF9M4FbpPmwalZKZKto2J0HPbXD7H
X-Gm-Gg: AZuq6aLJGAZu3ZV39Edkz6eeFLsuK/m0VW02CDXt+l3KUPzQ9ka3Fcpgvo6BOdu7FGd
	EUc2IF1IzUmHwLTbEoQh1kjZujnveMp+Arex5eoCarqxppp4yGVVuySAqcZhE2m1tJIk9Od4xiP
	FNTF8vfCyspOUCCnsR0qCCQuKQCmLia8HmOJUb9Yp1vNN0l4+13M8lSTRJqVllwiKzzf64g1EtH
	O+f8l16yxlD7NBuSxLCpCUMGoWb/Vyfn5Feyk/BxooEYxVxSdEQzHJZIzCZUi3+J6fwmOCdIdh0
	bBdMyKFGsv8qwLw0/6SSJ5lqcEmb4bDLA1wbGlV/MViZrcJQw6tKW/ZI0/qNqtuPLJjlI7xNq39
	LH+lewZLk3uaTeM5tdOY70UrbNGZZGivCBMvL7yKDms5IzQ8YBEuM/XFQaSxbFgogWSs=
X-Received: by 2002:a05:620a:4721:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c71ad7d3a4mr13123285a.9.1769606787309;
        Wed, 28 Jan 2026 05:26:27 -0800 (PST)
X-Received: by 2002:a05:620a:4721:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c71ad7d3a4mr13120585a.9.1769606786904;
        Wed, 28 Jan 2026 05:26:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbef86df9sm128268266b.10.2026.01.28.05.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:26:26 -0800 (PST)
Message-ID: <d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 14:26:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Junhao Xie <bigfoot@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lXUf7yClgmZuNW2eo4BwMDWnq0rT5dF3
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=697a0e84 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=x7yhTW8McE9ZTQqoy28A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExMCBTYWx0ZWRfX08pYgb2icI72
 qMHMsElo7z9TDP4eaIV12+KEjm0XbTmeI7NnGtCmVuetphIrfTuyINRxuIsC8KkWCEA6SFPf8Ek
 6Dg+I00VpkSFEqihGu3DBlStQsKia7tjG5Hy7jfXSXFqqdHwXyWN4RC8xCBvxC8jm5aPqQ6+fcq
 6Uf6KgmAsJJsEPDgv/O8iwvYF1jrwMCiZiqHTvJBXzQygiew5Lygqw1az8VfES7Ewwh2WXFW2MK
 CnnLcN+J55wcg9CZ//dX7nFRVgGsY1po6MQX0Cpk1vVpzGjAQhNfQiCebsMs2/52ggl39zied32
 bUebE+w98mpC+b3499rt3JNJeAU3FWjEhMol2S9YsJKoEBea227f4vTEuu7/mt8LyXp9dKv4uJ6
 6a40UxddZeGvBVEQH3q4WMJ5SsgSrL4jnDCgUaQNdzSepFdFXKsW7q0pPXLlpY2y52sn1afNFco
 UuimBktqxyNytv5ZRzg==
X-Proofpoint-ORIG-GUID: lXUf7yClgmZuNW2eo4BwMDWnq0rT5dF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91028-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E590A21E7
X-Rspamd-Action: no action

On 1/26/26 12:44 PM, Junhao Xie wrote:
> This patch series adds support for accessing storage devices managed by
> Qualcomm TrustZone firmware via SCM (Secure Channel Manager) by
> introducing a new MTD driver.
> 
> On some Qualcomm platforms, firmware or BIOS-related storage (typically
> SPI NOR flash) is not directly accessible from the non-secure world.
> All read, write, and erase operations must be performed through SCM
> interfaces provided by the secure firmware. As a result, existing MTD
> SPI NOR drivers cannot be used directly on these systems.
> 
> This series introduces a new MTD device driver that exposes such
> firmware-managed storage as a standard MTD device in the Linux kernel.
> The driver is built on top of the existing Qualcomm SCM infrastructure
> and integrates with the MTD subsystem to provide a uniform interface to
> userspace.

[...]

> Junhao Xie (2):
>       firmware: qcom: scm: Add SCM storage interface support
>       mtd: devices: Add Qualcomm SCM storage driver
> 
>  drivers/firmware/qcom/qcom_scm.c       | 161 ++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |   3 +
>  drivers/mtd/devices/Kconfig            |  17 +++
>  drivers/mtd/devices/Makefile           |   1 +
>  drivers/mtd/devices/qcom_scm_storage.c | 265 +++++++++++++++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_scm.h |  34 +++++
>  6 files changed, 481 insertions(+)
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377

This is 6.19-rc7, please rebase on linux-next/master (the series
doesn't currently apply because this base is essentially a full release
behind)

Konrad

