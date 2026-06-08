Return-Path: <linux-arm-msm+bounces-111835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dliFFrWiJmojaQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:08:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C88655816
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:08:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W9G80LJ2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iAkJixdP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111835-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111835-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07F2B304A867
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB0A3AD51C;
	Mon,  8 Jun 2026 10:38:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB5F38D68F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:38:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915119; cv=none; b=S2zohcd0kkYoqjNxbg+iNIMXAl5K5QMJ7se+d0Ip2STXBpPjXga9oMkBhHJisWUJZwpqAOAyZg7P9v/1P2FvuAu6tiIMNV41C9FH4mBUd3EUBmzSLoM/VXyBSp169Ivcx1A1/32iDLsQ9fi0RXzsf1H6JVFabUll5KfsYoSGvJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915119; c=relaxed/simple;
	bh=+JH/Lqx66nobpXxb9GDa3eqxe6auJzl0KO4iyji7wM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+8BI0zrhmSJZaLRnlm/7o1e72vz/kZi/ohFYXFwpipwB18+tgcH7+mFiEfNNPNvUtv6oj2kfyJS4P50duuQ+WBNyXUxim3D3FOwpy9hmT7cxR67WBYyWJfVlfhlwcuSxYJrc9rrN7Y2r8Y8nU81uZYZdmXwhwpEGz8rN/LcBw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9G80LJ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iAkJixdP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658A3NAK3308920
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrvLWMsY3vuvBfthbzfCIdNmvnVMetuf4JkQfO6nt8E=; b=W9G80LJ2RijGIp9L
	AER8mJzbdY+0yxLvanQZhULwwyQeQEVdQd4XpHma/UYeKEslPdysAKYoBVu4/M8G
	RqvG5TMmuUSZ4ME+99s5k9AE9ZUIM5R85flkwnDnDFgH9YXN85eW2mk/kTxE6JuP
	1j8f8pKw8edYu7pa1VDxAgZfExvdhMgjrxa6zRQ1zUqqsI6e/TnQDmX3kV57gnB1
	ALXJq1L+TmfQlnZjNzI1HQBW3v7Xxgofo7OLSjIYjbZMHa7dpabu0PRaTxDXbaAV
	bBiws/gMWVHeRogbf04YaaSxdxE2bE+bz2gfQfvIu04ekX9abkmUQ6mMcd3GZtJ1
	hHJP4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8g56s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:38:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156dc90fdaso119653885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915116; x=1781519916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PrvLWMsY3vuvBfthbzfCIdNmvnVMetuf4JkQfO6nt8E=;
        b=iAkJixdPkO7tYEHCuXsX9sn0Be7wJUaPn2UTLLJ70XiFZ8k+57qQaBXhv47zrtDfTx
         vNY+Hb+5j3DgzzQKPz9RgpjVu271qyI7DfQ/T00zPE10YvfSZ61GZ2GbYOe8JdtCZ63/
         PvycrwALwedJlnHoPa5oS1mgnLbcl2R4ylAbjmIEXlVt2/t/oUjslFt+nBcQMkF2vqG1
         6ht6tTViN3EMlKOYzdk0ocqOjG5eimAtZDD6TrDmlbHkbInq0epI1KgOnVHmnc2L3w5x
         iGoeAEhr/onnHSI7EsgFajavFGXTqJ+h/nGJdiGASXBsUMySci5vxbf6mnbefAK9ivxu
         2tWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915116; x=1781519916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrvLWMsY3vuvBfthbzfCIdNmvnVMetuf4JkQfO6nt8E=;
        b=Q9UkOfxxRKrX/Zi8ovdx3sjWtWFhY2420tJLG0Fkq5zvQyVQgTMbHNL2qQlJH+xDcE
         GqEIad1JnMHppXlmScnbxNJuFsMaK7huyK6ysKiqLnsUiwQZN+hoveaHxjuLLwE2EGRl
         QLCLEjFzgnyau9Pbe2Oug7OaMhvmnlvU0sKxQRTY/AY0+XlP52Ll11ctkgVGEJbarxzp
         nk3ESCC+wSTqoxVaEIqXus7ohYjY12Qr6M9obc4skz9xuh16BkOlB0CjpXbSL1GkMC7B
         +T41uBFJJbHzvgr7DFHey+LH0NAtNOIi+nTP3+uvqkcHyrD+HU6wts52Z79O21JSG5v5
         znOg==
X-Gm-Message-State: AOJu0YxrjdECojZ9BU/wNVWkdzGiHGKPQ4qnwxcfenqELfzSftJ8D+GC
	n57arNQGI0xvVzQAcwApZ1gMsK/5GX+bNWAcnFEq+ry3gx9oFm6xKQrHc75o+ev25mytIA4mQoG
	oQW89rmuO04mXaNysmgXyTtSTUKfG3uO02k4cEUlxVQKwJ3mBhYTdvJHBZAeCtUf0ee/e
X-Gm-Gg: Acq92OGllFQE37XqWY3ZiqrMAoUCMv0Uyw51EH9AVt4Dcry3YNVVpUSTn/icHv6YxK9
	e1CxLa4B8BvxNTx7bQvKGL299gkb+BdvhuckxG+oIFJd1D6I75LuXmhzk9dWFpiJl13eFOf8+ge
	shkZuu5vkA+1hM942Q6o1/YcZeDBdjpLXjVpmz/zU9XaxL3ioCAIaJe7S/MfUmRWXQx8Lwz5Dz8
	y74gTS+WQGmb/6HzBQs2+VAGpOkoAzwz6X6+Njm1BAxVgVg7uJ+65wXTPGTdjFX13gtl/WBjB5G
	8feKdeiWVcDcLM2/58w88MFue4tLpvxIsguj0c8l+Lcy3ub/EFKhF1URn4E0cXzumZ/hcxjdTeh
	Wu0gCeXII2PFl1/RdWbsRh1leu+lELGFvDl5cTBa8vHffTDpRHPBnFXrA
X-Received: by 2002:a05:620a:4042:b0:915:8055:3f9f with SMTP id af79cd13be357-915a9daea76mr1414089585a.6.1780915116326;
        Mon, 08 Jun 2026 03:38:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:915:8055:3f9f with SMTP id af79cd13be357-915a9daea76mr1414087085a.6.1780915115935;
        Mon, 08 Jun 2026 03:38:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051d82a78sm839136966b.18.2026.06.08.03.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:38:34 -0700 (PDT)
Message-ID: <040737cd-60e3-41ec-a693-4e4e075808e5@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:38:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260527-expressatt-touchkey-v2-1-049dca41fc3a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-expressatt-touchkey-v2-1-049dca41fc3a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMCBTYWx0ZWRfX2tHrNZCEd+OI
 YJJNU5t/XkyJP/E3/26e2bSk1YxaTB6Fb9qV0lvYAb0ui2fhmjS3oD9dcZ9mNEvHmJQA13s7Czs
 8UZJccJiDgCmM2mmYDHU+aplayw11VGn5rzHkI4F9aDg4kxOTa3t18w7/vlZ4kq1W7VRoeEcYrc
 xcJNZrb+lD93q7DmKrVGD2jEjQdeKku0E6NEuyjRH0AvUPd1GG40XI2Ogwq+X4WTi/Jy9AMsL78
 X0vlhREgIA0ZRf+Z4C3Wc3K6Vhz7CeoPvKMqPp72HeTuTbRQsCQQVTWE9H0kStYqDNLvl28jHCR
 ZLvPtrcS0ZegOd2lOE+NoEfKRrsJXz7jTkbhguAoX4ucQ/xFoyRUZhfdpSoiMU4oTZZM7b30gOf
 1Z9uC8rTB9BbBYdqi7suBgea5LRDMqSwHfY3CGcfTrJXx0UjdWe2peZ5/S5GrvanGOa1bzlAjj6
 tdNzu8SrJRRUwHYgcVw==
X-Proofpoint-ORIG-GUID: _1UEiWYKac7GaM81h3MRvOocN0wvk4Ie
X-Proofpoint-GUID: _1UEiWYKac7GaM81h3MRvOocN0wvk4Ie
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a269bad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=W2_YLVZPviVWVX_7ETMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111835-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:guptarud@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0C88655816

On 5/28/26 4:13 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the tc360 touchkey. It's unknown if this is the actual model of the
> touchkey, as downstream doesn't mention a variant, but this works.
> 
> Link:
> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5
> 
> Assisted-by: Claude:claude-opus-4.6
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


