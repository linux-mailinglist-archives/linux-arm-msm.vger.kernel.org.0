Return-Path: <linux-arm-msm+bounces-113626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E1CCAG2QMmq+2AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:17:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60567699A0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:17:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k5fk6zOu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RstQnuR+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113626-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113626-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D7D1301F1AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063AF1DF254;
	Wed, 17 Jun 2026 12:12:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE35C3AE71E
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:12:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698370; cv=none; b=DSjIfZoUCkh8zdVQKf2PCTPdPncqCzlxIgxbe0N5dN1HjuI+l0o+YLHhzzLMtGL1UQ+vwOoVuZO4FWlV5tTL/6PdRyTABuyy88qb2QGaICoTIHI5laGFa/LuEN0v+ZuYzhDsNLXow4kypNn/egDy8RJXDjPkItdD7wPtVEmFwxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698370; c=relaxed/simple;
	bh=0bBGl8veb/tP96Tez8lUYsFTbml7IYTdlypgvfJVzWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bt6ZUo0kbh9uigh7JRE8otuwsBj4wL9Z9to0txZGSFkmunYH+ff9a4ux10Py0Mrijh6MQJPi7Oz+wIKSDQfmF4dl1zAK4/DeArT0yqiK6IBGeYWjZdge81WqgUQV7hfiNxLo+GNNGtUSCEcdWY8Y0/OBA/hJ5tarxD9IVD/LhQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5fk6zOu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RstQnuR+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UFIW1735148
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BM7xOnT7k39jKKMfHpXEUbFH/ygimJf7hwotvg5lHcU=; b=k5fk6zOurvf2PaNt
	eQVOPo78fhgQrzRrP23NZ1CzWWw4DYeljgbdrl7QJuInWpSlw12AZErCUAFrgscj
	dhgW8CGaJUk/Ibo6ldjXfjQMOLkDq7H1B2wf9gmF66nYpwHsaWJhgWvEwA+9ucTO
	M5+TkW1sz7Nr7M+cB3AB9yIwViXnSX5BxSxCxub6I/M3bsHmebLb00HYVB3M0OV4
	lK3E6+ZMoxPhyVWKodhsqT1BAX8RfJqxQ6t144BwoHfgE+jmwy81zhGoybuTPkYY
	r3b/kJF2UR29gLzML4DXWRgiqwLp1gLMA4jGyoKBPeBYdc8BOTL6ADAz9J2rBA+e
	8E01aA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemk1wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:12:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178ac43d27so14654241cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781698368; x=1782303168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BM7xOnT7k39jKKMfHpXEUbFH/ygimJf7hwotvg5lHcU=;
        b=RstQnuR+oARFcc1c/ueelLaybObBlZg6SyrZxff6EKc5HT4XqFREn0RRrCbLkP9G09
         HFu0wwYbwcw5WmjIuV/r9I9I1KspoK20VGVGerMzcFMyFCaeWf1g6QSdiduW9YbtbRu5
         yndMQYbARNDtK9DX4jrO/zQKoU0+qqxFSXq+1MWuc5bh6IR3xU3OFe+PS2wzi+PXu3xg
         ahgdfRkPYT8tUG0s5fy6xApm8cEXqUnGSZc1yqMXUAhOW7x/XicGhfGPvAy9aI4iXree
         e5Mds/BBGav8lwJ3DkX2fkCDQ5NqIQZyTqfXSjq0wSW1fSea6Do+HVlPWBbdIYKFR8Du
         Pm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781698368; x=1782303168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BM7xOnT7k39jKKMfHpXEUbFH/ygimJf7hwotvg5lHcU=;
        b=JjxjfT/XjzHLCR8Cb7WNBqeZcrVNxENLnhjPb24Gm9l73QdgOr5pVbOqOPSIM7CN3L
         MtZzY5HeaVIQ0UMMiWQ3x3WoD+YGWfZp/vtOSMTZJD9afo5JZo5Pa3mwG8TXtOzkRV1E
         AKTGFUZiLcAGAjqVH/clXwu8wUkJqK1Z4IeQiWqwSQQBGeGkdOfsQX6L0Di4Wu0jlm58
         ehzLs5Se5kwLxqqMq+bRZnztS0jLFmq+beYhW1l19GBsKQUBACJs52yBu9xJVJan5aVn
         I0z8IyUv3tPEfsEBU7qNCk5S1Xg4C6FWl6b3+xutANKRCBUN843lNFDJBNgMlG+i7frc
         PZ+g==
X-Forwarded-Encrypted: i=1; AFNElJ/JGjyukiiwqGC4XRFA/oU1ydqFsNQ4At3tJ/E1ggce2s1IDcEVF0FT+iI18oXCiFfP2LDzBNOPIq2FL8aA@vger.kernel.org
X-Gm-Message-State: AOJu0YysHC8gMVr7JlG+i9d0e9RcSyi4Dj19bRDXepZ5zd4ithBI94kh
	oq2Y4ND+1lUb3DTmUGCINKwoVBe2CFx8DQgPJwoHrRGUG3fBZLZPxebfsvPvp82kaWl8pk55Lx3
	mjCbnWwo43hw0pitVwjQAQ+sJQdbu2C88sQJgs5eYteh3Xmr7HNMIPCuDXkz8D4OP3JdV
X-Gm-Gg: Acq92OGmelIBhYPAjs1qjuf3ydUPHR19cN95LwCsos0RqRrTlzOSNkCXAAJi0t50k4q
	l09I6kF8vZ2DckW2BNbWhz8W9807mH1PMeZ2cUcI2pJKsCFeF6+BRepmNc3sqF9KSCpsgqDNiEM
	L5L6diZh4iQRisTmP/Pjf+JftSzJ5CbH+lHIQsdwmbF6jMG1VYzp/aRscKT3AtAcpAIq14SmEZD
	OEdedzZLBn5+aL/Nc2tzW0R/FvDrJX1doN4SWpFzbmdNF/pJW+K1ifnzf3Ypof5T116cflWV3sP
	iwWxMrheC2wcvxU9Gt2mSH1e57giK3FUUCcrlKa+0Ky1ola98e7lmidZXlImJFQ0WMfL7sAYy+0
	XT4NTHfVig4WCMqfm38EC9375B2X9CvbHdqo=
X-Received: by 2002:ac8:5d41:0:b0:519:51a9:ff67 with SMTP id d75a77b69052e-519abb5394cmr27927281cf.0.1781698368172;
        Wed, 17 Jun 2026 05:12:48 -0700 (PDT)
X-Received: by 2002:ac8:5d41:0:b0:519:51a9:ff67 with SMTP id d75a77b69052e-519abb5394cmr27926871cf.0.1781698367625;
        Wed, 17 Jun 2026 05:12:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948dff8sm6308440a12.22.2026.06.17.05.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:12:46 -0700 (PDT)
Message-ID: <af46a084-0544-49ec-a75c-70eac0d0ea49@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:12:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable display
To: Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-4-e09cb05651cc@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501-fp6-panel-v1-4-e09cb05651cc@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfX7/XExUdqbny6
 mul0xpvYItmdCqd4+jtSEskPf/1d6XyvZHe9g50Svb1o5rpZUpcmJJt+wwEsqXwL8D0ShTxaPsj
 hVXLDkXYSQnpLxjvVTzEoVvg5Y/lWP8=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a328f41 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=t_WoDEAhxH4J7FjSGWwA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: gxs2NJlSbzQ7K4p43zIrlpDlEOmLX-Ym
X-Proofpoint-ORIG-GUID: gxs2NJlSbzQ7K4p43zIrlpDlEOmLX-Ym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfXxxQ5FdtLfOTb
 rK+jQeny0GU1/SsGjj7M+NQQQdE3E59JBAc/ezLiMkhgKWcsWovUNWplWwe+tzTTt/a0tpcjcOQ
 Ny5+DKTpKBCMOvf7blZi0qjETpJsCl7uZRmcQUkArlfe3QoV726pZHUrClZ9blYwOjo88VKWsZZ
 WEJ0oMYfHKM59tiJ7pGYEi134n5ekbhgGRHsQdOJ4ejdqDSnOnIhK21FyzBV2X7tC3z3wm5z1Yu
 4j5GE2iPj0D47x9IW5rTtlJJD5hNlMeq86QjfurSHeYGYB08qzHvFdWbq3mfH+1F1ygFILSfezK
 SEmv7lX2o8OD3oA7btbhFnwQfjHctlfDEVCFJR0z7F84b4p+v9/Kzzv7Fxvl6tz2tTX9oHSL0IB
 27eXgDxFrJdQRR+3OHazCn9NNv85OtSUDRG+xQdtNKyeEmUMNrtDyZhueznr8CemI8HsHhVbUQQ
 Js6cbxA0omwREInzUrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170115
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113626-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[fairphone.com,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fairphone.com:email,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60567699A0C

On 5/1/26 3:52 PM, Luca Weiss wrote:
> Configure the MDSS nodes for the phone and add the panel node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

