Return-Path: <linux-arm-msm+bounces-101848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOJsD1w40mlkUQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 12:24:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F5839E0A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 12:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 456F33009162
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 10:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D52C2E2663;
	Sun,  5 Apr 2026 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VcScc5Qg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SB9sEUwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FA02BDC26
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775384660; cv=none; b=nVjacTHScYSGmcYI8x3ie5oUjKSWoFYd5F4NQiYUZIIYZNRrjW9PzlrA3WE9XoTlq2DyOsWdiObfc/g6Bli88XZHkzVii2qdfJH8WetxmE/o0vn3v/yICcROZbSHpL0SIVwrIjTc1xC+qevWNOoSN3ftKUXHARC9j+0VkiKkWCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775384660; c=relaxed/simple;
	bh=hrWbOHYPAA3iEPIZbUCU0iZ3rdIbPal/qxpSo3M8OtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERwx5mNGlFRQ13PBzAsB/XcuTJbANNBkPJgfZPz671/GSYTiZ5ZvVXAFWtGnzfNcI0QX9WTMbyo46nGzHOJWvr/zGeUrWfXLRikIHbS5Klyqm6cYK8pbw1RomOqk572LHxcxOP/+IXg3W3QSPGp7xDapz48g8LXA/6t/Mr0PBXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VcScc5Qg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SB9sEUwJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634NjNPV4127246
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 10:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	viQzwuJ5JofOVV3fbU68hzJgpCE/ISX1x5wMcqxbC4I=; b=VcScc5QgC0KK7IHU
	td0sK9z4dM4glhZ1Uo+gLhyfbg72YeReusSwToK5otIQEirfEcR4zqarPWk5WnQv
	GMAWAqVPvRJZeP6xTLPXgKkJs/SOCzVFv6A2CHZp3R3z6V5w9f2VexbhRm0GlnEt
	MZx6DIIDdLq2sGBozs+nmGQ8dLeWvxN0hhbpvlGNxx0DEE7AVFJb+0fTZ/QPIVMr
	ve0QNdVFQLi44FHaC2qLFORYTliLrqGHjoN5CCLIgrRVFOOLv+aAOAXPPpgJfnlp
	tSfA4Z59fWUQCa60fHaGZ4f9jeAW8ENWeCezJUG6akAhRsQvckOhHe+9kXYM2lTx
	nxFbrA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mjj8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 10:24:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c68a134df8so2946709eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 03:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775384657; x=1775989457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viQzwuJ5JofOVV3fbU68hzJgpCE/ISX1x5wMcqxbC4I=;
        b=SB9sEUwJty2l6H0VQj8ENS00YivexYp5QX24pMv1gD5+bYpaUkSpNIjfXtkTy9AgXj
         sAb8nbQ0QrD4wzEfcMRFmbE8hTWwHal0ola0qM6VGv33yw7iPA1ro/Zhrvxa3S9mxv52
         2dMLpFVBn8+WyBUL+dZk25K4RZvTQK4Axyx0AbnE35notaTdiJ1awwg6MFQfo5DgmFXN
         xXOFFyOQxFWY5sL3sMs3Qt5Sb6LZUj8QNFpTuoSkjlDamRSRCuXB4ppc1ueQQjfCsblo
         /+AZ7jnJ8tq9Gh5yjy8iAHvXY7ZzsfS++kOiK6FEJRYcJ0miDyvOpt8PXVShkLPVWVTS
         yWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775384657; x=1775989457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viQzwuJ5JofOVV3fbU68hzJgpCE/ISX1x5wMcqxbC4I=;
        b=mJCVo1dqj90FNeUMh4M7C+375mRRTIiW6O+LxuNQSstcmiOkpz8ebZg8HswiTEFDo3
         SNKu303+1MyMFS7asfqTHfX3IrbwW7Ts14cc30mJNxMiz097r+jVDGPZlH+EJjo0WAhC
         t8NqS22LVULmjA0BlldgMkg0vLe89FjTKxcKP8K6ZXDiCGayttkFNp/SCSNkEzTxNX/X
         TPeZfDQ6JfDue79tFNxmfVPrQo+XNYhn7ZPMVXYVq/xwvZy4+gcM6psDrkSOtl8jn5Am
         6cq4DSy+LjpSLpgSQvrrqUFX/P86LuO/ORI/cq2gc2cUfFAzYxppQoC/ZhmGKPRGxsUQ
         Gr2A==
X-Forwarded-Encrypted: i=1; AJvYcCXejYQnz++992al824INnYLshbbETkIcx4752+EcUAhdE7Hpgy4HALKp/1DYTJXtcpHTJd5JWsIhFoocb0T@vger.kernel.org
X-Gm-Message-State: AOJu0YwKbAlnt36yh7vvzFLDrVj8aMTbRz4T00KuBjtKL3SctogcetbE
	inIACIazACyDifOVEAAjPgkTe6adris7BjlJHgMylaqYPar7zsmy1uer1e4E03oyzW8LC5Srv9N
	m+9ZKdU9AYHo6qyzfUnz3dV8Q6sScXROBVFgksdhhN+wMOMKnRI/A7RuouvQNW/aU68OQ
X-Gm-Gg: AeBDieth1OgqbUXmHQA3KpmR9iM+QgxtddS5/xbi+AI1SPE+VsndcWUv+zVIkM25mA5
	qCAnkCH5+Qris/gW+U/LQ2WKI/+syCSUmY/IYLjAXDiRdunjgzWENLNR1YSrz+PfWkg6A7NWupM
	aSob8ijFHWkOUpVVy8dUuwpZZKeUpqfTLLDpVu98ZKeggReO6R5Hm5x6FlyBiAEjlANpO0wQJfH
	pFKKkppftolhgLjPScSuIoOgOXTNO3UaCIEoGUB43mQOAgF5mFv+DQDBhCZcaWiHk6AQgWzMaA4
	xsjsx0LSf3bFjiWcQ6YXcgflgP2EB8mKN7lod1VrhYY/uuXdfDWksxwh3s0uoQplaS8deu/cpOU
	ntk3NkEm1M/9metXMJSQ/2xmY97gcmOC/9LRQRcE+kVVR0E+AxhlAFUdg
X-Received: by 2002:a05:7300:6d05:b0:2ba:a60a:15e6 with SMTP id 5a478bee46e88-2cbfb994665mr4637756eec.16.1775384656813;
        Sun, 05 Apr 2026 03:24:16 -0700 (PDT)
X-Received: by 2002:a05:7300:6d05:b0:2ba:a60a:15e6 with SMTP id 5a478bee46e88-2cbfb994665mr4637739eec.16.1775384656208;
        Sun, 05 Apr 2026 03:24:16 -0700 (PDT)
Received: from [192.168.1.3] ([122.177.240.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cf2be19f85sm1116968eec.30.2026.04.05.03.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 03:24:15 -0700 (PDT)
Message-ID: <23755291-8b53-4926-899e-8d3d1d8ea91d@oss.qualcomm.com>
Date: Sun, 5 Apr 2026 15:54:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: dts: qcom: Few dtc W=1 warning fixes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VFn4rl5rz0OxZHovD4ebB66tlbYq4o7Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDEwMyBTYWx0ZWRfX4zlocN2UhO7H
 qcULwnBe/ppsGrGEASd2P70U2ez7hRlzMTueB+uNbLDFY5spIzd1PpdMGa+e/axAv7v0BWM1X3c
 +ALqmq+Ud2UofdFQdBysFaFn19c16cdPjOB0UuRoJQp5gJUps5g1MOSa12pecOIZXqMyY1txhzp
 oQjBpxZkhxnTQcguKLVs53MDL34oNBF5tH2CVMj2qDDBejgpWPEeJleyluIa0Us0kFarrIQX5js
 wHPRj05Ghkoi5fLGtp5Nkq0RjAv3pRASbwbAHmiukSqCMl3dfaA2Bn7jN1oHatTkRHqzwgacoYd
 svQryV8ev4yxTzXBQ/LkLY0jQE582EuqxlmYPo4mMyjVgBulkVWZaLi4iaF3OQrOn3Umr3yqOxq
 Bs+pk//ZNCnPFnMnbD7U5i2kKxAkZBqzPCpsATXEUVqu/ON0FaYS/yAmjWztnQ23WxHhBmBbZ29
 wRAjCKfHFqZed1f7G/A==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d23851 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=WwE2FERyN8QvVYJ+zedRYQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ICNLo5bXlKK3KSsG99YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: VFn4rl5rz0OxZHovD4ebB66tlbYq4o7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050103
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101848-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90F5839E0A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/4/2026 3:20 PM, Krzysztof Kozlowski wrote:
> Not marking stable as these do not have actual impact on user, but still
> warnings are not desired.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>        arm64: dts: qcom: glymur: Fix USB simple_bus_reg warning
>        arm64: dts: qcom: glymur: Fix cache and SRAM simple_bus_reg warnings
>        arm64: dts: qcom: glymur: Fix USB simple_bus_reg warnings

This third one must be "arm64: dts: qcom: ipq5424". I think its 
mistakenly written as glymur.

Regards,
Krishna,

>        arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg warning
>        arm64: dts: qcom: sdm845-mezzanine: Fix camss ports unit_address_vs_reg warning
> 
>   arch/arm64/boot/dts/qcom/glymur.dtsi                             | 6 +++---
>   arch/arm64/boot/dts/qcom/ipq5424.dtsi                            | 4 ++--
>   arch/arm64/boot/dts/qcom/sc8180x.dtsi                            | 2 +-
>   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 5 +++++
>   4 files changed, 11 insertions(+), 6 deletions(-)
> ---
> base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
> change-id: 20260404-dts-qcom-w-1-fixes-1a25bbd0519a
> 
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> 


