Return-Path: <linux-arm-msm+bounces-115601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jhKwHGnIRGqd0woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:57:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1696EAE5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:57:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DJyLHyJz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="FBfaJq/m";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115601-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115601-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F873300B60B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 07:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781ED3BED7B;
	Wed,  1 Jul 2026 07:52:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AA03C0601
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 07:52:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892348; cv=none; b=iNr8juifx4T6PwYQbPiRsCBOE0gYhb8+I2Ja1sjqx0+ViVM2ZdI+DgzlVsCkCJsg977CNj3XFQbEcUWF++2lbbi2GckPUcsa6Rn/pRXJ8KdHEUHGeQmNaq2jk3k1o08Jxfi1ZeLL8ud8zB1gn5e2abi76FkiHYCzdcJeWqCGJ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892348; c=relaxed/simple;
	bh=XX9+R41IO2Waz3zGfCXQCa/MiWGzIhUUWvcGbPET3HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F3QZOUJyWYZCKL1YZ/zTcAD3uxLyN7LbsYhWlotOFF8+tLKmje1eEhFI2xrLmCo7+doL8aJKSuLiq0BTJIviK9TBZ3e3JUWU4IZ+rx9v9xCOSUN1EL1FoRcEDOf5O6Kl0OooeuPBoUbfWIB2CoO4i2JM+lSBWdAU+nFDly1tcjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJyLHyJz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBfaJq/m; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lY77137197
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 07:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPg2mmrIjGtehWgW9WQsfatVGe+8LkRJPKi00NnnNrY=; b=DJyLHyJzqpZeyj+t
	F3DOIOjQW8UYjMmnGpMkTdsRPKh6IikBpBePlLH1TxbNlxLWLBP1cAR8Cjusx965
	JTMRZW8t7Vdgl4MY8Bp432A/Ex++vazJszT5d3zobKpXUTgKsW5E2CANeiA3K4GC
	u2o6h4RUHFXoZbxZrkbJX/rArLdpODLhtvtEDp3NN0gmzoMrY3L2BbJfNTCWz+4I
	pIxHScDr7e+f963vYAENp07x9TRGb9jw99gwElOqlKWJdFbz6Lu0s/uI8nrXx3Wp
	r8Y+gv7rWa5JlU+MMdEvFbPC/+3yYJi/WH9QBAYhmw6hMvhXDqu7G3Pt1lhN3LlA
	u3jQQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0auj5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 07:52:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92aea0d801dso40490985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 00:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892343; x=1783497143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPg2mmrIjGtehWgW9WQsfatVGe+8LkRJPKi00NnnNrY=;
        b=FBfaJq/mdN5nVK7MN7aKVBD3Y9ltZOxbV7OwdcB4/SW+RWAKyk2RVvxvsOKC9dRsqb
         C4xq1Z3U4zz1yWj2yISr7XQS6GxMVY9Yv0LvMgfECX7BwelijjiMNm/zT5OW8Dt1U5Gs
         OSau8hj5lK3CR3J469ADt4NnhchldKcE/77A9TP8mfes7yXw76dQOVANrnporHp4TeKc
         Ap1kE+aWvh/h+RF+qnBNHAHSWxETCpeIvdkn90NlLSrbCh7Jl9WPdFMhhjT6FrENx2+S
         MzaykTDX/QsQkt7VsnaFs7GsuDF/zYswPg+OZqT9pmxAiDfQxZ2tOVXqomZOgtiBpPBX
         04xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892343; x=1783497143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rPg2mmrIjGtehWgW9WQsfatVGe+8LkRJPKi00NnnNrY=;
        b=mzhUz8DsqmMkAoc2JBM85Rd324N5+QX+YjG/9vF8rVlVR+2MRFefJHXFcGINRGHtC1
         fXGQVmMogW8AA97ZWLqqZBZ13e9fZnaipaJSSmZuRPHMN2bDNeL5YeDf55uMUt4ynD0i
         WoNFP6xMru0e6sgmd/3CJx/nTvGa1GMV1OQK5YSVJ+7V6W1d64JkjYkdPePsubvU9KAb
         bXSgu4ZX6rDtDKplAbkHfktWsSfvzH3L8S6BRBfOJzFxxf+wgUjAxjv+Uv1aleFSOufV
         vxwjBrBPEdzgeeduvx3gkYicpcCr1P4I2ll/v4g02uaqWryXq2rnjERmTe1p0Q2NUym4
         LEog==
X-Forwarded-Encrypted: i=1; AFNElJ+KE5V2+c4vULLgwN+bnzGDMqUglwXK+fPzjDoLTgYG6C4cZ6fM2ab8LZND9/fTqOG8t+qglOHU1urTqUU8@vger.kernel.org
X-Gm-Message-State: AOJu0YyrAYfs3VNqPq8RFP1TbUH6DTKd+bs2GBZYZpsgpA3h/g5VhvwT
	wP7h6evijSg9VMRZ5Ox7ZlnbncSA/nBHYZG7b5En/AVmYHfKCgDFVlsG65Xc5UxlfpLCyBjMakf
	4GOP/kz8zZQ9RF0IdU/ig4V4sKqsuBDUUz2G7DECLx3VZLJuvhHYFeetg0B6yBkmQX4BG
X-Gm-Gg: AfdE7cm2mr/5bB+NuDj9jpl4RP/+NJIWRkjap4QZMif/vv1ukCXK5RnAipoaAkVekvn
	Rwjsj+AVpI6lSRuV7dt15ADMdBJ/Aw2sDzfCx/mwMFZEtnuZuRpy+HntJHJaN4MWZtEAdDv8rKF
	CvXad5NTOxoIhsNUBx85C/LyKsfbZeWYdXWzWqleHnkc5ohLqzdGXODHjByv0g5Ilj+d2Mxosvz
	pl9DI2W8o8it/7I8zklyeaaXY04OgdcbH/usIchzdKt9KqYpNNlTruVjvx/v9BhAQjGAgmA/Duw
	UA5E4cLVst1Rm+gnook4J/I7gYi85p4goXGmenx6x+MH9GO3dUfhn4VrqcI58XWTiXvWMcu4ZZ3
	fkLFnZezEl1QZfwRZKYzhQbMgkpjVsoWSx2f73pQ=
X-Received: by 2002:a05:620a:6497:b0:915:b852:4361 with SMTP id af79cd13be357-92e78227432mr76176885a.20.1782892343593;
        Wed, 01 Jul 2026 00:52:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6497:b0:915:b852:4361 with SMTP id af79cd13be357-92e78227432mr76172185a.20.1782892343039;
        Wed, 01 Jul 2026 00:52:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4718:fd49:e3d7:676a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be45f244sm64974065e9.0.2026.07.01.00.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:52:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming Maili SoC
Date: Wed,  1 Jul 2026 09:52:20 +0200
Message-ID: <178289233634.6073.9735895489826233582.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
References: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44c738 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A8WTr56GNT0h8z-4O7wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ImEkUAxETxtjNvebDKZusoV0IWP-Hxr3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX5ipQNU+OP0tN
 CCkWIFTfwKY3fvuHz7ao3MIOjmpgUxpgm2BpZsv7SpLH2mV8c/iRcnRLnths93apdGTzS03TgH6
 +DwTxy3opNByVS9VRQXpDaYQvHNj09s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX4C004YeCXwid
 p6BI1ozfN1a3oUBj0RjV2lz1knlTvPgwHkCzvgxVHGsfq0/AZZuDtuHx5jAVycP3j8QSe+iqKJn
 9pSKeca049/UL2LCpUj5EDBOuwKYrqXYgeN+WUlgkW92PFEoMXqi5io/qHUW8rGDWeE30MSx1j+
 vJdBZxIJvqMLK4DFnsWAvYsUuW0m0z2qfS6xvq5oEU4oaL1oRnGsMQdi3dneOHjmMPE0EPNkmJL
 I6oKQCV84R6Lr5AxIPXOQzQEam2Em3RzoIcpgD7Dm+1XNJjZiM+TEy6qDsNfgPAnilfUMfmIsF6
 uaWeSnGXSF8OrPd8Mg85W1WmqvU99jeli/ibo3vO3eFxBo3wFFKRzuRzFdzPInC2XZEw0SRAiTR
 QDYQexQEDjOojq497bGDGi0b6i4ulXsWYzs+rigvVmPh+6W4CbRS/3ANn1BzVazCxA+iVXRCuGt
 OSA6DRQbDEtURfEDosw==
X-Proofpoint-GUID: ImEkUAxETxtjNvebDKZusoV0IWP-Hxr3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115601-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jingyi.wang@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE1696EAE5F


On Mon, 22 Jun 2026 01:35:31 -0700, Jingyi Wang wrote:
> Introduce Top Level Mode Multiplexer dt-binding and driver for the
> upcoming Qualcomm Maili SoC. Maili is the new mobile SoC, and its DTS
> will be upstreamed later.
> 
> 

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      https://git.kernel.org/brgl/c/e95f2b212c4a8ec422b1627e36e951e778809965
[2/2] pinctrl: qcom: Add the tlmm driver for Maili platform
      https://git.kernel.org/brgl/c/251b53103a2e5770658ae106c490cdd2b7512c3a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

