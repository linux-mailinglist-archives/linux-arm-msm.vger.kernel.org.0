Return-Path: <linux-arm-msm+bounces-113859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SeXNLQteNWrNuAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:19:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 388A36A6A2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:19:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gfF9tayj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NNxbSVVy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113859-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113859-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E78B5301CC00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDB137FF50;
	Fri, 19 Jun 2026 15:19:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59101FA859
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:19:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882375; cv=none; b=hKqndEMro85jbMCZCjXPhTMuKzb0f1bMTj/zL9g60WHXss4kx1orXvtElUwDczkzkCIp50HuVvfDb8K83S2h12be90ImO3MI4jJWVO+N4MkVmjPGF7vKHVkQSwAQVH3nz3z6dLpCluaNERudLus5uLDyGd1PMRi4cGoEzjoieCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882375; c=relaxed/simple;
	bh=Gn/hPFJr5t1rgP0GF3RzepU8JJdeCMud/+c4GluX5cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ipRVaBPlcMGmcanscaS2cu+f3s9ALsPlLQUV+rrWRh6nweC23rxfw0k3m+kwVQaxDGuTQvwrMjVp3rCTiD6uIRa+UeFOmSh6hJGpUm6Kfc/I8ph7l8S5Y/3YhjC6jTe5a6A6GvdrQdFpjD47xHYo93I20sHunrfTCGs1SmE9ORg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfF9tayj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNxbSVVy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JD9ZIw259790
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RgkNa318E0hGyk+6faDmJPCI0n1qt47ShpxVzQ9DSWw=; b=gfF9tayjiewLv8OM
	ZdlZDR3F0kJxIOUXWDmXEEWE4y5nxwiYcEc02sL6a1SxOdkl2T7TS9PTr3gV8irF
	PkFWYyWCCYvparDoKQUCyw9hiylQooJ3+MA6akV2L7XpOBblPlpiEW25dKhEkHtM
	m7uf0oPRvV576rVfbKakOLMcC6L196Fzf47iaLrF7xJI+pH8C5x0vz9QB86rHfqb
	5NHDGDHxTfdW+ekLxL4ao6+hkqK1Egb6QYySiefs3NXgZo6+LVf2mJwO5KeaFiZC
	syzO1ZxsA9GUi5DbfXUlEaZIyj24WaFTkfCmGDvVoEd5DlqzUM8qPEtRZAW9jMUz
	p/2a9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp673nm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:19:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157263095fso47430685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781882373; x=1782487173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RgkNa318E0hGyk+6faDmJPCI0n1qt47ShpxVzQ9DSWw=;
        b=NNxbSVVy0CZtdK4G/hPwq2vWwrggg+wyO3PZrfadVolp6naS5GKNNnxtfdYLSSv7ng
         k/WpMe0rEnyeOkVK8fB5Vam5ZIY95APDy5g7WEn1Umylnyv5uIZoSehYOu1rbw7wuWIY
         cuf/QQVAd88yZnXWqPSb8koLa/X5pFRKE+1ySLf9TVHnZ3BtMghJekgAiYlW1SKa+H8+
         VjYei0gyF0thHRiotXxOcepuJSY1skItKrLqVqkexZ7kyneXSodnYr5nLcX1pffll86G
         3d6gVGWPyRIiIOJ44AMJEADlxsg4cDAEzz09IuNWo+3ewjjc9IzRUIQTyfC8R94oB0FF
         ZSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781882373; x=1782487173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgkNa318E0hGyk+6faDmJPCI0n1qt47ShpxVzQ9DSWw=;
        b=CzvTmRTkrwTWuZOV24fqY7eTAmRvdhRqyVY75D9gaFj7q7ZBS3NXhZxMZvp/XeX6ov
         BDc1mP60arS6tmZD34ke//lFsOFP+PDjuKHOKNiOoWodvGYAjm3F29XI9PFd1CPe3KBA
         lXauG2Z5AmhFqvxo9JtkxeKBxYb4zqtyepqK8PDz/4y/xYyJvNeMJ9UB5EujjQqNRmf7
         GFxbAQdP/4hji7Wq0UlrW3rTQOmwYnsvBB+HXaVf+rByz734QtBBLacpEPkVuemmd2xY
         FCNJvzmEgcLbTmmg78QiADqAeMCoGOS/UoD1xaNXd5g3NvLpuAbcbBjR7i/iQTB9oltj
         LSbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ErSq+qevZ+XDGko1EOreUrqN/71YKx5TBieiX9rGpttwIGhUkTrGLttR31CDJ5EZIY8ikJD3dLF8nbyHc@vger.kernel.org
X-Gm-Message-State: AOJu0YznH5e6dqHfDge3fmqeyhWzYVouXZ1O9s6TiBXRduAb5jObYcPU
	ZHPFdY+GkJzPVeX+Z0QFihMhTJfuU9iFnPVmrXT1ZZIWwZ/BxoBNusnblWDNP7GBdsXtDc66K66
	MgQpYJWB8GFPcpwk6Wml124qU8Y/xP9nW4XqC1lgNHMcw4lTNik7da5q7IEhL0jlbNu/F
X-Gm-Gg: AfdE7clN0CoE1IZK6I0eQWYEEqOunDJu4OhZJ5UJfkU/Kl8NoX3Ihgo8NWxoQGPeS5o
	CwR6dg2gsOU3SmFatS7L44NFhwrvZUYiSwacocwQmM173qx9ZK57ZshEhDB5BJqduXylzv20DTz
	mXOKFDbn0LhF8y/Pvek2xWYcvJb7p1xWFrUM/EL2pI97d1KYZYeK2AHqk9tk5TuTtwBViz/VSku
	xoKKJ/5U8Le3C8k7MpcYn4Sl9HeW53yH4xx9tKFrtLD/vBPrf880GIAzdLwRS+gqo6BjHStsJK/
	B+Tg8o7g4mtMT0MFGHQlo+Z3e7LXdS1Dhlyz2usxQrGwHfL4VQY56DlYPvhuYlQivGfo9n00Rf2
	apEZCThb3PdyZOyBy3eLdOEQ6Pd3nMBZ4BDc=
X-Received: by 2002:a05:620a:4455:b0:915:fad5:9096 with SMTP id af79cd13be357-9208d8e0f2bmr384069285a.7.1781882373243;
        Fri, 19 Jun 2026 08:19:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4455:b0:915:fad5:9096 with SMTP id af79cd13be357-9208d8e0f2bmr384063685a.7.1781882372581;
        Fri, 19 Jun 2026 08:19:32 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696edc76179sm995938a12.6.2026.06.19.08.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:19:31 -0700 (PDT)
Message-ID: <0ce225dd-687d-44ab-9ea8-fe1a77a64217@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:19:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add psci_sys_reset2 reboot modes for Qualcomm
 boards
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xin Liu <xin.liu@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CHEB5lcUdCYlqiy5v0KfZzZyv9jOrsGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NSBTYWx0ZWRfX+VQVzf7XNYLX
 JdHQ8r42JyujLMtCB7fbTj+DD+mX/2mnheYrOkBt7nxj5ZhGTbLAomXNUywnMwGl3bJ5fX0kaIe
 lWf63kO74qUX6djdFlAPHBgMtyrfBioCrSTDwOeQRFOWjpQmU2cfNp+ntuGscqUtzl3Ley3bvZ+
 GI9bYZBnxY5wKxLQs8f6UuGfvTvehSVLn4hkBXg5TdMjsKKT8ol6Sbz5jIuOTcOMVz9P732YHYS
 MrZC/StA5jM64vLP4R8M0IFuw8EwaU76KY7ZVICX3SBFx/a7KDJKcSWGp4wyg2iPaE+EZRcGG5l
 OH+fbrKmThIdyOOz1erhFNtd/mjZM94OPlGKKWqFv/iUJZHIqKktQwQWKh+jnNX8YWE+boMF9cT
 nL+I2UmDULOedzjn4TktjEexx/pLMtTsi0m6tBY1lLn9SdBxtDDmIGACfOdtpNJrdJ9RG3MNa+d
 i7grMK4DYKrAHKbEhTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NSBTYWx0ZWRfX7pttvleovlTd
 s4p2+eUuIx2qVN4FHDiaJVOpmPII+/CS/CrUFo3Gv1BnSXM375/6OrZg7ER1NMAvm87RC5NwfKH
 lrb8cHDhcbxCYu6zhQN1ybuLM4DWMEw=
X-Proofpoint-GUID: CHEB5lcUdCYlqiy5v0KfZzZyv9jOrsGV
X-Authority-Analysis: v=2.4 cv=TdOmcxQh c=1 sm=1 tr=0 ts=6a355e06 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DsDjnCkRMD1DqEwLxmcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113859-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:anurag.pateriya@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:lpieralisi@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xin.liu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 388A36A6A2F

On 5/29/26 4:23 PM, Anurag Pateriya wrote:
> Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and 
> kaanapali based boards.
> 
> These DT patches depend on PSCI SYSTEM_RESET2 support introduced in: 
> https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com/

This is a very large patchset. Please resubmit once that has been
merged, as this is otherwise difficult to track.

Konrad

