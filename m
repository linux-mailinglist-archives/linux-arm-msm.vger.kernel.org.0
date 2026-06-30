Return-Path: <linux-arm-msm+bounces-115475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id catDLS3YQ2obkAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:52:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ACC6E595D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:52:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SF0ifqqp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=baQ5unVy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115475-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115475-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 086CA304D9ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6953743D4F6;
	Tue, 30 Jun 2026 14:52:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144B143D4E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:52:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831144; cv=none; b=uu/ZZcaFAYdmokcDzhxVB2zhG34ag1B82MfTVdEaAJfxkB1oY9bPUUCRLzMX8vt/1O5N0Jrtp8EMiIcFxzxcQX8xyVWhnXU0pEvHhXxAUFtWHOyiwDlCk9t4H2LHZYq72N2GS7yDhp6rLnYnQf6vKBcLDUU1seEiTQAZFgiXa3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831144; c=relaxed/simple;
	bh=G4mAqjeW0Dw8GshNscbJq+bhUDzpZFvHqndA/HuJECo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJmKmiexGRQ98jqo28DwjkNM/57gOie1NHFP2s50nHJtlTVMqR85i/at+LJHyQ2bfREX9iGiJ80LN9ydyvCUkore9d2WrwdXymgllC/8P/mDc6zsURkN2aOd1VciJ4r1auSo8a0yg7Gns0+LRkl8Rj8w+6nFaOx9NNCG1SK6TE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SF0ifqqp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baQ5unVy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UED35Z2198793
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voVL29loeKaAD2u6PAs1O9nFDwmcBaWGfJBn2Pq+Dx4=; b=SF0ifqqpwr6EsuGf
	XdHyTgrTPint3gmAHlIX69MM0pVKjBcBpV8UKVKJTaHLABVahL6rAlM/iSRXFBH0
	F/HNcWzjNZvzgQi660avYNU7JR+4ZJSZxzEvNDgMDS2jrmLw1OOlbq0qpzlj4/QF
	qA+Tl9Qyd8QvYgjM69kCeRsEcIX5uiXQfM0F5l2rkTAujmOXAIiXHsZL8iEu+fV8
	ZyQJxE8OKJHqMMReJRMnry1fHcAylHgq29hXgfdSag5UP4sU1vv6QQQdB36bGyRu
	1Q2y2ieUtuiBaaJum9Oeft0omwhLPQJzuOdONiLR07fKamAgy9jEY4zyfRIalsqE
	GhEFkg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc085bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:52:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e663c29f2so158029185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831139; x=1783435939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voVL29loeKaAD2u6PAs1O9nFDwmcBaWGfJBn2Pq+Dx4=;
        b=baQ5unVydVpsUTTSFlQIrj1ptdsmJDIArJP4Vsax6KMJn73Q/wM27V7847ZmxearSj
         XUJNl6prmtvrikIhxPLIPKHghkfhdNYqJX6jIfhjXaAx0cAxuvj0SPQVEYESiAs/+MZ2
         lehqVfmcUH6w9mPnGktWNhZToY01pP3BKmkF8qSw2LySzUmQKIgwtGCT7RMF22h4SZzq
         pSoxSoLEXCeb7mIVGfNZcu+2vcZExJTcAAbdPXpjuCcuCTd0WeEaZE/MYhrPeeNvW4FV
         zLs5oTlGiPAqNeHubojJp8DZ7kATB8xAfynxlDZ/HvP0tELr13aW04Tk3BYdUGIRtbGi
         AKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831139; x=1783435939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=voVL29loeKaAD2u6PAs1O9nFDwmcBaWGfJBn2Pq+Dx4=;
        b=iWWxqhVIL9xVXrGOH6NEDUca7OqBVc2JMQ/WQZ2sqAP5nhVHRACdJf1m49YHEgAPnu
         Sa6+kvLAD2yQT9EdeyN0v89WjSUi2si69B6wDEZgSHSvMe+7T0btsXk84Jxb/dZ6FSmd
         uLepZGiIY1kRymUuFXhMu3IZvS0PzP7NPZxDbHxUzTY55gz8HHANkchJAi4PN7/eRaj2
         srJmgNQfYUCCvSUgEf+y1VFag5y8r4fvz+FGIqvw2yApz+YB8EquQ9B4r7xgrW5EDM/Z
         7RO5lrA5M28ZM5AaeX6RJgtZ4yYXjqd8SaeKUAkSWrlxfndL+gE6hW1VvsqpqAW1Erjr
         RjCg==
X-Forwarded-Encrypted: i=1; AFNElJ/ub4cH0R5YR4tVYuBMPG1LAYG1UC/t/FaIa8dqin11SBcVbeZ3WQ8oKI5q/ZFjFjyh0w+hYdIUDYb4mrT2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4zziVdgXCovQvrGus4+SEkgj/god+vBaykvUIWa+MhlxQfpSL
	L776CLGp4fGvBlkQWvd/kQgaXJiGt1KECrY22n0yHF03mRASBgo2v3CrnyvEjXRo4QgTap1C+9N
	16m4b879qFAHc8qE3DvcoacFb7NJqjiPjkCYgGx0DvIG46ByOv/WPXNuQMwjmfocjhvTX
X-Gm-Gg: AfdE7cnLpITw/+SBNW7Kx3cWihgyR7TsmI/VaOjwWEhZrDue/w/mwSByT7rxBDLO/z3
	oe9DISQYQaBUN4subSOFep0WDZUKHypYaa8IU12xnxqjCUvO2SIcy7vro+okR7StPFTkRyXDtTv
	pDjxV2IECpFup4Yu8k833XcnwgQQyZ+Ghh2GLMJfppJrZV4GqABGl11LBkU2le0k0TulpmFm7fB
	q+drE+v28EVek6chyev7ajSmZwn+5FC4MdbBPhz51nTMviy6cdXYxLWyxdZgzhslMYhhrApYXWP
	w5idwQo7tgD8m33deHFIOKAjrVpCaVz24DIVK7HSzKeNodw3AuMgPYtAPTYv8zGJ1xWKFS55Hrf
	xTHz8UNPVqo+9cIyLnp0WVs6k5CBmkPrSr/J4dHI=
X-Received: by 2002:a05:620a:4149:b0:914:bfca:7d12 with SMTP id af79cd13be357-92e696afe48mr267965685a.5.1782831138828;
        Tue, 30 Jun 2026 07:52:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4149:b0:914:bfca:7d12 with SMTP id af79cd13be357-92e696afe48mr267946785a.5.1782831136817;
        Tue, 30 Jun 2026 07:52:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bb1bcd1esm41326815e9.2.2026.06.30.07.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:52:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
Date: Tue, 30 Jun 2026 16:52:13 +0200
Message-ID: <178283113076.37349.4420730863475722984.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
References: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzOSBTYWx0ZWRfX9ct/0f0DJV51
 WHVd8EuegvMI8J/4DSTyDw5Xw91cTNEk339CAJ+ykY8pCTI8lGSd//ZLHArho0/l0BLecXweSEy
 GaVWgsCKW3FiL9PVnIxyjx38+qa5JmuExTAwyd/JKR5Fxmsf1TQqGRaZfAMgh2Ddr/DBMkzaNm0
 ZGs1VMxruYlyE89V9/juGpc9F3I7qQ6srXCwUmcRMF/UALDewNROzu3OS4TqK4iOqT3vaxuNT6y
 yV9RaeY/8G6B25h89cbW4AWTQPdzDWlXjsUX7BaJL+JM/EBm0x4bmOWblU7lynNLxLXHXIiPHDH
 6mCmLkcaFhFvRQAToMCGAGsNoSr4fI2/80E4wrJiqtwV5sfwfDT3vMMs573/gRFggMJ7PXXhCf8
 PqaTkKmZTmwwwcCi8zAxRxlgA8Z8sR7HU8MbHIwJIXZJbb6VdXold/xVTBcxVEgpzf0KjtuCwnj
 73qcoCT0ggnAs6CoKMQ==
X-Proofpoint-GUID: f_wrIT2VGvtvno4H6m3m7dRV2dhbMWQN
X-Proofpoint-ORIG-GUID: f_wrIT2VGvtvno4H6m3m7dRV2dhbMWQN
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a43d823 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Kpg7wRNn3CZZSTE7MwYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzOSBTYWx0ZWRfXxN+hO/dieFft
 BbKElsLCEx7Q0ohjf+w9oxaD3nVu0i0dLuS83McJ+fgeRKENmqBJw53qtt+vc2wvjiG3VPeu0Dr
 ciymhdEIZPccudgjM5GjCsR80spQHk0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300139
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
	TAGGED_FROM(0.00)[bounces-115475-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:sneh.mankad@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:maulik.shah@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28ACC6E595D


On Tue, 16 Jun 2026 17:24:53 +0530, Sneh Mankad wrote:
> GPIO interrupts that are wakeup capable need to be forwarded to wakeup
> capable parent irqchip. This is done via writing to it's wakeup_enable bit.
> 
> Currently the bit is set only for PDC irqchip by checking skip_wake_irqs.
> skip_wake_irqs is set to differentiate between parent irqchips MPM and
> PDC. It is set when the parent irqchip is PDC to inform pinctrl about
> skipping the IRQ setting up at TLMM.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
      https://git.kernel.org/brgl/c/859e02a369ab328a77dfcabf59562100e55f9c5c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

