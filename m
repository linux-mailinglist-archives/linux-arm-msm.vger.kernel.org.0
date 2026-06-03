Return-Path: <linux-arm-msm+bounces-110888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cnE8HOybH2oXnwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 05:13:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B6281633CC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 05:13:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MzrXU+or;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZDvPRSW8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110888-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110888-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E3813038D8A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 03:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5D93E638F;
	Wed,  3 Jun 2026 03:11:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E143E5A0E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 03:11:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456313; cv=none; b=GuINvX8H+79izgHuqZIn/a6A3R74sMAaaewrfj66MTw4eQBJegSEO92053WoY2ijHv3gUXm9zKIXhNaAM1tySsQx9Y17CTtiZUl0ceciQCcaK525wYCLgYJOJdY4Bu5d0XVa8NIlADVE8j/jaiOLvmgA7OfVSH0eIdNtfTuQoOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456313; c=relaxed/simple;
	bh=AneU59lXyef9SIW/HnDmRQ2mhtnL2MPLR7a7poCmZEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j60lVZyg2sEowNmyp+ptXF8eqshR9LfHvWi5pC9OCkz2Rz5zwlPrWzPeg5KmwoK2biqS6M4uDi60/+jSfxrS9m5KXNnuSt2SbN+u3NrD3RopMw/vk9TBS8smL26PqglXHQNXSSeuEXLAL6SDdlEavliM9z9SYr2vkcEg4v43K3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzrXU+or; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDvPRSW8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652KlT5u2884626
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 03:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EeKOX0X7IWJ16loZJh3c0OuX75DD1qqhyVbH1dmsUeg=; b=MzrXU+orfWJlGind
	4zY9gqmd0gn1gxCYLNQMXhWdLr976oVl9vZxaIshyCB6cf3pNsWnDnvMxJ4jLN18
	Wseb9yXQNPzcAsLQpGYQnf9a10mIhdcjNu4GvxjoGozX7HBMED4kiMxRXC2PCBY5
	MHFJBn9sCJdxpLx3eiTSzeZlpBs5FoXrNaSGrbffeii6JMaOmevPjMIOtuWX+H+P
	sfK0HUPP2Ox6Recqf2Xzhw7JzPRzdQGP5lE6PmbGM7dVMFS2j+b6Was6iHqOODDG
	JhidQp1EheyPZE+6wZX/nfmw+bC1CGwbdV52Zu8brbwOHd/yHbaYvFqHUZyRRwUC
	bKGRTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsu14t7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 03:11:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so310133a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 20:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780456311; x=1781061111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeKOX0X7IWJ16loZJh3c0OuX75DD1qqhyVbH1dmsUeg=;
        b=ZDvPRSW8nV0Nd4y3Rfn5Dpot1kuCFLtmdatM4eg150e7JvE/Eu+fTEEir4vPdgidrI
         niwVrWRGj6yncthxNAFqG6k3ypbr71i5PGkgovLGPYQPL+wCRrigb+IMv1GR6VaUSHiL
         HJdweBu5N2gnXiPtdHqet62unxnFj4gAwK/MCY4ELKUorJW6hDpW1/hZ+xAVpFsQpAVA
         mU5ibcRNqiZVT7wgWu/2o4422HrIymLgnHwpWjwsbhhU6z0haPjGWNyTpv0M8vPujk/3
         eQ9wmpkIeSqNqCHZmjrw9NgbXAgLNexVy6cwORA9Q8TYUxEJB0UKM7AjJGPxFp7HjS32
         Q5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780456311; x=1781061111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EeKOX0X7IWJ16loZJh3c0OuX75DD1qqhyVbH1dmsUeg=;
        b=EIFylNFMr61j3NpAqNYOavgFbKbmqU5Aeng0+JkutzNZE2X3F5OVV2LaZRX/jTGmoo
         GqlCz4LvJf4oszTTO6KUeA6NGmXEfOeMtZTahS7Z/bm3zd8aAbSltiSJ7mfwR9B9qo6G
         W/YkMT2YEt8LSDZCtdwA1GYRyja+qLgw6H2ynfyJhNQUBhL6xZQULCKQew44Rlq4qjX2
         HlCWm3HrkBgUs5YzpILw7ZYpASB8PIMyVdG1tyF0Zt3jzeXCwVbgHgl44ZpBaytWtsBX
         iMbu8ICgJOXumGINjRx3FyCAucEYE3VjEV5cieUS3bPrm2B+RlURfXQDh7832ILlVeTh
         tGQA==
X-Gm-Message-State: AOJu0Yzxu/jEqjk+GewmQlyKZLsa6RXyuJo8nmhqQJSltQvrLM813yy1
	2g5kCKSFPlB2MIOn+gCThA0RLtnRZHwEb9dkl8Ziys0rZ4IyjN8OVSUw27NANxmZlQxImd5DJvN
	Gu/qQmDLSF/uy2r3HSCIBLXF8vpmPAINZIuBWRXbI5E0kXg2qr23evNlkCcwp+6LJeG+L
X-Gm-Gg: Acq92OEs+LaLd93tIyngwwFQZ0JF/WzHExaP35V06n9AmNiWbk71g/n/4/qDXX0/9nT
	eJAxgtxua78ISocqGa9xwd4iWwb4JwfjBbNczDpURIw6+CgD+EIXfk+ZSohgxUQ80rs7ForPAWc
	XnBl5G1rNZOkBd5th0iREkomZXTo8I5pzX65hvkSQ7XerByUfQoF+FetwIa7BftzTXDFqFmFWI8
	lCZFzkNSMknNetXTAd0oLQIoNhDW0ham7phatvkdbGm+NGJHQLPAhEAt1bDyEzGWvAlgbMuG7TB
	ld+Upk7YnHOdX2dwuCGrHoPAHWeSupfvvhaJToNAU3taVsgIWVaHtfyGUA6/Tk0zWovzSemaeRV
	aZZmsKLTsWHffKYkE+3G4A2j9ahWx3VLU7zIgnk3WNtXuZEzg
X-Received: by 2002:a17:90b:584c:b0:368:65d1:893 with SMTP id 98e67ed59e1d1-36e3895f04bmr1113197a91.5.1780456310648;
        Tue, 02 Jun 2026 20:11:50 -0700 (PDT)
X-Received: by 2002:a17:90b:584c:b0:368:65d1:893 with SMTP id 98e67ed59e1d1-36e3895f04bmr1113159a91.5.1780456309824;
        Tue, 02 Jun 2026 20:11:49 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a276892sm1269420a91.12.2026.06.02.20.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:11:49 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 08:41:20 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: glymur-crd: Add FocalTech ft3d81
 touchscreen support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-2-3453ef577bcf@oss.qualcomm.com>
References: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-0-3453ef577bcf@oss.qualcomm.com>
In-Reply-To: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-0-3453ef577bcf@oss.qualcomm.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780456295; l=1732;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=AneU59lXyef9SIW/HnDmRQ2mhtnL2MPLR7a7poCmZEI=;
 b=j/yISeycRh6g5Z5PkZnpcYebHJW1524NW5rnDvUchkPoN3KGC2uRsSiLOlxscRrE8R/3gtxR7
 SPxgfcch8+LAcRC1+8UttHYVA1UUFRDgkx90z3t83RqKOwUNpD38oFc
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Proofpoint-ORIG-GUID: 0yRqoADlSmZvI2JZ-2h9GuOKBcFjGpBO
X-Proofpoint-GUID: 0yRqoADlSmZvI2JZ-2h9GuOKBcFjGpBO
X-Authority-Analysis: v=2.4 cv=MKFQXsZl c=1 sm=1 tr=0 ts=6a1f9b77 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Y23twNOXuKrVrwrtvMkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAyNiBTYWx0ZWRfX8++/I4o7gI0+
 ydBvKpHTngtEcjgnD85O7ekt8v/G2dzXrrF1J4ULkCEQLWRC2yh0cUPY2Us0dQpvIMbjsLdrrOi
 PTwvMSTY2sdqB6+pQg0iMUpjmbeBhT6vHY/j9z8mqOCM+FNdKNBmpqtyzjfljQ/fvWgktV8q2Ii
 jcxsndo9xzm44+aiu5on+0eAQW+4wlE7/jvAzBp11anxPIgWxC3xST+b22qmhfaoFFjxvlaaunb
 Ojg6TZ296nmKMG1dkjn9FWYZzfaU5cve4pwpx2zt6yjDPYRQZQrpxNUUj4k9+LGDvgGqfz40x9L
 wzH3xawfVUebPdTpKxuURR2vMF8EGpXEFRh1n4FZKTzVva/M6QaU4bAYkqZsr7s6KEHdo5pt2qr
 0u/0ACkMVFMDckUh+EsneCfd/T6gXHgSpcXDGdFLLnt/ou2D6vmAUkLxbIzRpsqoGEpCx6Irc8Y
 lzA8++qAGc7vYIuQ2NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030026
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110888-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Daniel_Peng@pegatron.corp-partner.google.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:pradyot.nayak@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[pradyot.nayak@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pegatron.corp-partner.google.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pradyot.nayak@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6281633CC8

The touchscreen module on Glymur/Mahua CRDs is different from
the one used on Hamoa CRDs and requires the reset-gpios to be wired to
the device. Without this in place the reset line will remain
permanently asserted during resume leaving the device offline and causing
all I2C transactions to fail with -ENXIO.

i2c_hid_of 3-0038: failed to change power setting.
i2c_hid_of 3-0038: PM: dpm_run_callback():
i2c_hid_core_pm_resume [i2c_hid] returns -6
i2c_hid_of 3-0038: PM: failed to resume async: error -6

The touchscreen on Glymur/Mahua-CRD is a focaltech ft3d81,
which is hardware-compatible with the ft8112.
we have added the required change in DT.

Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..5cda08bb48bc 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -154,14 +154,15 @@ &i2c8 {
 	status = "okay";
 
 	touchscreen@38 {
-		compatible = "hid-over-i2c";
+		compatible = "focaltech,ft3d81", "focaltech,ft8112";
 		reg = <0x38>;
 
-		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
 
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
+		vcc33-supply = <&vreg_misc_3p3>;
+		vccio-supply = <&vreg_l15b_e0_1p8>;
+
+		reset-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
 
 		pinctrl-0 = <&ts0_default>;
 		pinctrl-names = "default";

-- 
2.43.0


