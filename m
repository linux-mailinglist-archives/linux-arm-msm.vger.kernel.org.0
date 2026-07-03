Return-Path: <linux-arm-msm+bounces-116239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KOLLOg55R2paYwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:55:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B81700549
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:55:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cdcfxvmx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PXAuTFe4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116239-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116239-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 687F33032768
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C6C360EF3;
	Fri,  3 Jul 2026 08:41:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C51E34EF07
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:41:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068094; cv=pass; b=XuHxNJ/FxU1QoS2FFybOy2vucsnd0NHBb0Jj3JU0BaLftZkP0G4WwDds3vxnGeq7lEHH74U9daspqEoP7W32WjLFaneIaSwI2FB21EPJGXtEb2sYMbu2fqsBT9DsnKdWDF1z/vN9af8e9tCEfwrFiGkLBOIKKa5g4LoLXbD2JSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068094; c=relaxed/simple;
	bh=A24/IDMt0yFcSCd3f2pMjBY2SE2mBp+L+hitnBhNtNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODSldf4T6ehm3AvKv289nDkcY2CTrJJq/2nwjmjWhB7r3u8tpjHpWpYAMu4g3iP8v0eOjfb30RsPKOHUcO0cFmD4HCj5SBp1eD02cCP2ujGXjnAjoUuMCxxWlF2sZIXxkp2/qHQ+4IJm4CI4Q1ifI/bES0sotvrHlhtU+2Qx0oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdcfxvmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXAuTFe4; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rdIW3087983
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JgfgskfFOJItCCV398c0ggLI02qLuHDQzMpOZ/nUiLQ=; b=cdcfxvmxsBih+A/j
	fvtwurcdg/gJYSyu5Uig5Gq8wCquo8jNytqD0uu9juFEOtQSfXwjZjtxdQrrTK+s
	M1rWwC22btRXLZcoCOv6/JNy7ImMEvu6mU7onpE62ujvdfACdBmudXFKzXSKk0H3
	SRGOYvTginR0FO2EcdZBohFlBq0WCl7hXURvzCfC05PT+3yBMkMSZ1ylo6orLhcJ
	58m2OMcgctIMwGlXT68/VUkLd9dYqAk7+52jct0dOMaEj7SLsyVye4xcu8vTLW4U
	lCFoR5+AaxXvqlXDqntxmIUnNPAiC8eByWfbz3AwQmww8JOSrqIxfs+yMHpQLRlu
	hpuaWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2544hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:41:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so35498685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783068090; cv=none;
        d=google.com; s=arc-20260327;
        b=R/gLs/fQQ/UhIyur2azMqQ61NsPBwOK220ykUwUtcz5oKq/icYSHWv0iFislbo+UZc
         dvsAszpvJB+beKhMT0nVc2YSnMxOemBhXJicgGLP8l0hTIs/mcPHbtZIVREXBrlzaTM+
         AsBjbyRvxQ8qcEuvUy4XqwV0OUqL6GSQLF7eIZ+pktNZigD0xSPA2cxMn2vZS5BoJ8ep
         j/wU6Ta+rK5jNlLCsoDLRRRZiF7uumiMhNECUQPh0LQPj8rwGpRHk0M0LBR6lipFaeGq
         xlH0Sa2e2RwWuOtQilzyHntjVzKBd0N+6aY9jJRxQ9fa8At1doG4d205NG6JbN3T7FQx
         SXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JgfgskfFOJItCCV398c0ggLI02qLuHDQzMpOZ/nUiLQ=;
        fh=MvezcOnPpCIolSB2MUMO9mdanmSzIXNuSBi8hpdyT6Q=;
        b=VOywenUhQMS8CsAwwrh9IcVCYMoNj0jFqS3xPPrOmXFLszmatsTM3uEIObK73YSHXu
         MRHXcFpy/r+EOTzCEwUUHUvYyEvKH7/FEpTen1jtJ1GcOGrxEuMhPyfaVC8FbPqCE2B5
         KcJeqBqf+V6GUuYzBPLnSUy17reF2+AoB4HmRXQoCOKkdJkmgcRsCm8wPcRIssz5zMZ3
         OlEAcU2LUB9plIyHS/XwAlXyue38jZxdDeI4ZNwcN0ddCTwVXAHBll0T3fCrPVVoXq++
         3mSWgZ5wictYzXfMR74Cf6sMG0UsdfRHvIMvd+xiVd7RCJCDlxC7mpzM1sElsUjzBlUN
         qVZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783068090; x=1783672890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgfgskfFOJItCCV398c0ggLI02qLuHDQzMpOZ/nUiLQ=;
        b=PXAuTFe4Ojw62j6tAUNP9wnN5lQXZDTel/ZAAICYjrRowiZ5eEmVWyayjZMGqtxl8+
         atLp5BsxEKfO7vxs72gziDQC1lz9G8yVkpKHBUAr/GbDu+tVZmDLNCGV0zrXH/oOq9OG
         jyip9EUMelvPSLjC7CrDNIn3mDEkHKapHvEqiHzzt8nsZeCNURY0CynBJguhLpiveQAP
         Iia7zmCqcD8H9uM1yISwaQLUmWjM+YXk5tnYNqPtb9HiR4hv45//C+ZUdvE3GyUwDleK
         709raCFVUcVRCv8v+l75ETeQ/lBce8WfzSoORZDomGpatyxkXOn7k0g93bzH/8MxKXEb
         dwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068090; x=1783672890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JgfgskfFOJItCCV398c0ggLI02qLuHDQzMpOZ/nUiLQ=;
        b=U9/61zFE1WA1TYKmMVEUKvelsa+uQszUe2JhFpxocy7meBWi9+ZBExO4qSo2B8BJTL
         uvVMHjs5N5T9Zwoin9GqamAiiSVR4DQXSSa9BM4AvkwUjzMjal9hlIWbujA3yELl01Bl
         4pguMBSt/9l7x66hQbE9h76svi7MQeNVlVzg3meScpfZLpu6PQBpGe+ecdI9VeB6CbM7
         C4loqo3SaYIwWbcH0TlxZt5khL25t6JfTAc+uKteptxfskrpzL84Z4/QGQQpggrdjvzl
         ZXM3UA5NxOVUqrw2HoguGHAkft95WoiKfYScXkvpnQ+klVAnkeXq1TQaZiiVCd5tzJ9B
         4Jnw==
X-Forwarded-Encrypted: i=1; AFNElJ+ByU/Kn3ZQRURROqxcxfDyAYgDjfp3c8XoZXEgo1LMN1s4MqT8r31RyzOP6PtZLRgwqEEfzfQCFAr9kHKn@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZXAvWmQqmPnxvbmd24l400GG/sRwKdStNzv1E51QdwKZ6Qan
	ZKNnaqSZZ7Rv4ioh4E7C1aYOGoKAulRBAp+6ddxA9hGYEOSVv34mBcbon+y7kmHDmOcWu75/U9r
	D8NOVMPNh1fwsFSQ/6z8KZQGMAzUPZXtZuUzOHrA8Cfd7W4F3y5eCwuChsMY5myUScn7lTEkctR
	dGtdip4SY2xiNW3mJ9k2soWy9KrVqRy9+/RLjQtpOF9J68zN9gYstNaA==
X-Gm-Gg: AfdE7clblguCZ9Niokv7V/dsP7dXXQYVTsTQGtoYFylY/z3KukGnwTK2Zg23SJvyp6Y
	r0O6jyDrMS9XCtNTLJk2SeF74WPLdHzotgzQ/GDnZKKQdzzM3bCueK/1o2+meAeuoe6yen1mNmF
	/Y6LYh1hztUra0dwVE5CSviUicOiJTn0T6TzljFMLnNeJwLPQr/PMACDCTM2uB3egMevWOmQOcG
	Qf3B2fLFY/2IkP6EmLRH2Ocw5BGwFqh6b9XcuUDJp4Q73l5b1KLcNW474HkJTmoglP5u0649Imh
	IaoqBFR7dw==
X-Received: by 2002:a05:620a:2915:b0:92e:4927:1fff with SMTP id af79cd13be357-92e782c94ddmr1287061285a.36.1783068090224;
        Fri, 03 Jul 2026 01:41:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:92e:4927:1fff with SMTP id
 af79cd13be357-92e782c94ddmr1287058985a.36.1783068089796; Fri, 03 Jul 2026
 01:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
 <20260702-monza-wireless-v2-1-7b56e2a6a6d4@oss.qualcomm.com> <20260703-tricky-hospitable-avocet-dc3fcd@quoll>
In-Reply-To: <20260703-tricky-hospitable-avocet-dc3fcd@quoll>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:41:17 +0200
X-Gm-Features: AVVi8CcGrmUi3s72gNEg9Nxjar9xvqGK0gTiAF8t-61zW6VTlFRO9OOYGSuluUs
Message-ID: <CAFEp6-3BptG=S+NutQpvuS2oe+kjJW6N4u0YjVP=T+tbX8PBPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: connector: pcie-m2-e: Add vendor LGA
 connector compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a4775ba cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=qB6sUIZWhqFJcRNk-TYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: u_LsgdDYngHpVoTT5wIHCIt-Ad3gY5LR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX7MU738KpGtNw
 K4bM+SchWwEZXOyT9YEfcHXihw2oT2X5KY72s3Q2yCwVTj9Zopd1Ex6Dc4PHV/G5g943Xp+i2nO
 3CVg0XAojhFABQVzDcUwDHY5vPDDJ64U/7JgBukgmbINEW/msYLJR8S3UZQgRj5Hrlnxj3/ZQBF
 4xEBRWEXto+EuVH2NmrS+WV49HqeBLwzYq90oIwB26SK+Tlw4mXVkPTp+yetWinUcu4S+Ai1Obc
 bOfyGN8yG5Ms7YEZ46x8/e04Vy4wYUJtQWIUREd4I+KQRtweS6QddCaryiKy3OOan1NCtnZIQly
 m7TT9DV1CE6IWoy3Vpvrz1PZwxP9MXWvNwLAUzcT+UbQECwLVud5KazCz4KWwPh6e6s78zwBtwd
 aaLDkxzRa011jD7hcri7ZMlr0ATJmrIbCYRgB/qnUIEZTjVFtehCvE6jiPB9n++ZVbFnQgVGqjy
 nQgcY/gOABfIRWfUX0g==
X-Proofpoint-GUID: u_LsgdDYngHpVoTT5wIHCIt-Ad3gY5LR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX4adBPWfPt6dc
 mohKrF4z9NaLyB9T7ktQ384edFy15CE0mpOWIPO4ZIR/XujVhV69v9RieGLPtafCYuAYhrwMLFM
 8IKXppW7zzDEAEEDUV0D4tWL+FhU7eM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116239-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:luizdentz@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45B81700549

On Fri, Jul 3, 2026 at 9:11=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Jul 02, 2026 at 12:46:13PM +0200, Loic Poulain wrote:
> > Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
> > Key E interface signals but are physically soldered as an LGA package
>
> Why do we need device nodes for soldered connectors? Soldered stuff is
> afixed one, not connectable connector, thus it has no point in DT
> representation.

The LGA module is soldered, yes, but the node here isn't really
modeling a mateable/removable connector, it's the DT description of
the M.2 Key E electrical interface that the module exposes: the
W_DISABLE1 and #/W_DISABLE2# enable signals, the shared PCIe/UART
regulators, and the graph routing PCIe->WiFi and UART->BT. The
pwrseq-pcie-m2 driver and the graph binding rely on exactly this
description to sequence PCIe and UART bring-up, and that's independent
of whether the module is socketed or soldered.

Electrically the QCA2066 LGA on that  part is an M.2 Key E design,
only the physical attachment differs. That's what the vendor-specific
qcom,pcie-m2-1418-lga-connector compatible is meant to capture, the
soldered/LGA variant of that interface. So reusing the connector
binding is a pragmatic way to model and drive it.

It also keeps the enumerable-slot semantics: since M.2 devices are
discovered via PCIe IDs, a board variant with a different chipset
soldered to the same LGA grid would be handled automatically, without
DT changes, exactly as it would be for a physical M.2 slot.

If the concern is purely the "connector" naming for a soldered part, I
can reframe the binding.

Regards,
Loic

