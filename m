Return-Path: <linux-arm-msm+bounces-113980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r6WHHccfOWq+nAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:43:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 166536AF305
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:43:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XNpetfc4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bUb5HNfj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113980-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113980-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D0183044567
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C12153E0B;
	Mon, 22 Jun 2026 11:37:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7396E2BEC2A
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:37:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782128233; cv=none; b=Zi4sfKWAbdXv1HAA2wTJwDlraSUH/oyjWVqsC0LFdjSDiik8DAdEAxw5pqSimEgcHwxXyuwwD33uj+laiD/QKDPwur/ubNI6YiUSv5U0ZhqRU2WSjvq3NfRa1OiWFaN4EO86dL801uziQ4DLkdkeXI9qq/GhKR1OghN8ZSDUM88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782128233; c=relaxed/simple;
	bh=AZgc2b1F2/u6RSI6QEKCgbFDh6USJtktFy94PBtnXL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8ivN06sD4cNESv+zY99h7T7H40Ny8GIkqk2wDsopjeP7WZz+lgyLp3a+2bcD+gNmg1tyTZIRyshNOPn7YMttEkA/+3hvjgK+4uD9brXWAemzwf5rqOT1E3HhiI663305pGUjO1COAjBZ7llknn+S8a+u1jnZAPMA36HluNbKB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XNpetfc4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bUb5HNfj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAoZ8k740689
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssvR4vEpREl1pYHrgYMEDZtfjBW6oxYrmJvvewMEy0k=; b=XNpetfc4bchl+Bo6
	b8ZpG2c1yy4zneBUentp+i3VHfAv00IjnfKZS3lB/1KJpQ0EsM3pP8Bhlqx48CAG
	p5+cbX+UrzOuh6i6figo3M6vkZpWXoGwyKHM4wukaXMtx5NvijZegmVU0YNW544e
	eDCy6ouVQnfY0i93yKsl6M7PS/rbiRoVVJEJpvH0HVuF0NkSEisWkIVd+hW/sQw0
	P+apwlV2fNJLRatNttQPZamAAzhetHCBBKcJID4uvIPPqMgUaEm7BMfDfFV+Hcxb
	trBM7w9YbfkR4bTdqcE3Jjij5xY6mcj9J2xsVbzlWaEnYYyRJkS2mFqZoWMR5XYf
	0EwhAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1safx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:37:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178ded346eso4004661cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782128230; x=1782733030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssvR4vEpREl1pYHrgYMEDZtfjBW6oxYrmJvvewMEy0k=;
        b=bUb5HNfjr019HyEVaXfJM1bWmFjPc2Q1ZGjn5QGtXgo2VRKi/WP67YD3dtuHi4uusl
         evbJC3KAAmV524U+Ic7YdEQN3hISOOc8mgtdsbYOanxnGSTWF5yukgyiTrEvfHPwsz/U
         OADlCG3z2r65ZvfywPqzomBWTz9Gu2YYgkEFewQYian4bGEWzgDxp5xc2iqJpNLHcXO4
         pgWJCs9UOSJSGXzCdNWfxkICJGte4aVvYocCcN1bS1jvvwcEQANbVdkElN77Rc60JHRE
         8UkOm2OCVFMvJQzdMM2294jOfGvxJ2NVkNVanp0HCog6PxayhQ4JYFwqyfA9puh8caKt
         i7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782128230; x=1782733030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssvR4vEpREl1pYHrgYMEDZtfjBW6oxYrmJvvewMEy0k=;
        b=IfyrMQogTFsrekoFaqXfTgcUGHHkgxlkG3ysfj9ax0ljkAKPzNeerYoWspuxBwsAph
         nmBdI5+B6gX5o3mRr/GXqo18ksimmS/3WixTricuiD4I1Ua8xQXimg1tzWEsLJoCndYf
         vPOhdNz0VxUEyf8xbCHzcLah6O/AYDVjx/vlURHubUyOYblLpyJTkc2m5l1ooWmvM+80
         BUVAbLJ/QbNZv3t7n0AGkCD5CECTc6TFNbVutmTyhtuhthe5TcAO/WWylfOMXt9VvHPd
         Hp63IjcDujOYOBVxMM5J287ZiXIiSKtLNw/5aChkXZNeen0QQjFJEhR9KXTj9LjxCLIM
         EWcA==
X-Gm-Message-State: AOJu0Yyuair4Nwi4wjMjpEgOeKeQTEtGoM+Ag3YXQ//SYZlrUSlVODBI
	rr8Br11775MdDfsBanuTfIyaHre8k4kPTCt1kWHSQeBd8nIUbAKFCzKPkV/x8B8Csgms0q1jLfl
	0HhoqniY6xwhzFo66zLTBwQVIhZnMrq3+la6XHptKcjV6xcEPGSXUX3970CSktCgNirZP
X-Gm-Gg: AfdE7cmd9EEFQdk38r5Tj770QkMX5SS0v/4hoTUBooPTI06AKiu2qJi8fRDP36HUZCr
	2d5SBNhz8enPktTDriSh33aM2fEd9AOfFD+g9fdjPMLWlg3uJhBmdm0NXr6FOkA1yvALE3o9aji
	JgAxm/zMX2opCQtjASBkTY5sNzn+MbIDB8U+qT7v+IY82wnMRs8GDVM33KU15zUPzTlmildBaMH
	WO/rfzifE65G/66J/AhiSd0dKEg5DlD3+l60j9r8g57F97siaau+pTlkgHv2FjZs/amisWsHsL0
	gpGLaZY0lN3ZKCNTdTjiEYxpvLMidIcnMXLCSkAe+nrooZUQuXxAdeUy1dLRfRrZAXeQ0adV5Di
	1yBnXQtKQt68uGC0xQXexpArIQa6jRJTjkuU=
X-Received: by 2002:ac8:7d49:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-51a4f417a57mr1324081cf.2.1782128229761;
        Mon, 22 Jun 2026 04:37:09 -0700 (PDT)
X-Received: by 2002:ac8:7d49:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-51a4f417a57mr1323791cf.2.1782128229323;
        Mon, 22 Jun 2026 04:37:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99978asm339221166b.21.2026.06.22.04.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:37:08 -0700 (PDT)
Message-ID: <a9506482-aa46-40b9-830b-afc259f9e47e@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 13:37:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-8-c939c22ded0c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-8-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ude-iDwlgl5IgO_RmU-W4bXH7Fh_XXdy
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a391e66 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=m8DMhdXBI9DFSf28WBgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDExNCBTYWx0ZWRfX3OtuoIcD7GKQ
 ZYfEo4QgadnSUCPKwx96FLWFz1xREkezi8TsmgRc9X2q54omW/dWGCFNsDV4FOti9WLLNHXWWLe
 ZdpOVUHdIprY0pvQpKNuQlhDjsbBW0M=
X-Proofpoint-ORIG-GUID: ude-iDwlgl5IgO_RmU-W4bXH7Fh_XXdy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDExNCBTYWx0ZWRfXyYV6HQqQZF2I
 ZFvYAanwuVE45xbZkcpHyO6uOll11ej6df/WEPB4SIW9tkI8l7K09IYqDv7yWQgQtxUfPqjoj9V
 2RE2ahNhGCPgcf1U3xco/NVY01PM86HgDxqUSXJDEs9V8QVr/cJpllvPCpPFQVtM73/28MsDty3
 0M/Y4BEifX2dgmhaFKHazq8LZiiEnK7TORJGiS6eHura+x/BW8usefrp0RzFNq4IDjjnqO0bml/
 2DMWzWXTgT+TSgb7VypzOQ19Qi5udyJkzBO/TX2DrD68LsHGiUVvVwC1Yvwr/KID56uJgi/93Ss
 gc6HKtQ8PY7n2ayk4MW0N3fTsZu6eCo2DyCLTVTqg0HBsYwIn4z21fulssltf0pbn+OOWi9QRez
 Ix1iw8GlXCq2wD8RwwBgg+DF/EujLZimrPMoty3ivk5N+VssOgXDVyZ0FhbQ1kZcG5VD2sAQsEN
 AiCCs4LbYXlSirbkWRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113980-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 166536AF305

On 6/22/26 7:11 AM, Qiang Yu wrote:
> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
> directly instead.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

This must be squashed with patch 7, otherwise PCIe won't probe on
Mahua

Konrad

