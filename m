Return-Path: <linux-arm-msm+bounces-116270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3eWPLKyKR2qyagAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:10:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 26331701053
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:10:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lKG6cpcv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DFCBw+xi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116270-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116270-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F3D6304C6E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EFC23FC41;
	Fri,  3 Jul 2026 10:04:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5714B3C3BEE
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:04:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073073; cv=none; b=V1Lr2STmBeAa1bc2VQRXpBLUdTvGhf6/97AGJ+0lQU0RPEwYHk54HqhdzoQ0PTSWN0vLxG2OmTvJBvvIH7PGGJkioTraxGIiYU5oPcSiF46pqRvymjMJRUSwIrzlUjyibuGXa1AuGfXq8EpwP1t6dDJkv/5ITo53Wq4EMDrzA5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073073; c=relaxed/simple;
	bh=XvPNC/3TSLWXK0qQ93RFWay5rDBNmpp7S+fJKAkwoLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KEHjt4Qltz48KwH0EhN829Z1YwHCPcDwc2AGNCQhcDEA4bUbgEf9Tghv1Y9HOx3gwCqE/3534twZA8wW7A8H18Uphom0vso7M1/22OYxkNWCNstJyF/YPARyMcM9H8ZGyeeVd7heu9xZjyh1zTwmjeY37cUCceI2twC93h+gbwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKG6cpcv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFCBw+xi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rqOb3135225
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smkcd0eRrWOi7xcIysQwdSct7gNXuzCd9k4WOantBn8=; b=lKG6cpcvcQ3h8tet
	HtGjL0SGLJYrUoqDa1nzpVnx43ACWCpW1Sc+p/i3u9MNZnrSyeamEv+16o7775OZ
	ZqCaHNhvS2Rbwtbp1uSW3jGemO9ELLcoZThD2MQSj5Ncif8dnT/3SxjDQutqvljr
	RBPhojrdUcfQr8YyduMrnhcFBasN6nR70R4v9BfxIx1KFzh9hLRuY62wKBPEcTHH
	xeJPPwFc+p7a7OI7dJPy/jspjtH3vKGQ+kTzlh5KXQVePNQDFzpuPKBuIGwQy6Wy
	DLkDir8f1rd2GLvI/bhCD4+PH7NaFGOY4XXfGgWqlFwEyL2kbubO0jZWKNTgGgtD
	xGi7KQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qchgws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:04:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so42462585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073070; x=1783677870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smkcd0eRrWOi7xcIysQwdSct7gNXuzCd9k4WOantBn8=;
        b=DFCBw+xin/QCCBJCsq8cXPDOrZ0wErR/MPc60OKxAdR+5gi5Wdbktqv+ZFQPRz7SQa
         Kx1xR/XtmnLuox+Ze+ej2wP/J3do4gHNX44GMQ4IkNPGDx1TgpucYS0yvVYBbG6yAeF9
         VJnszaskPMhdF790KPAg2Yzf3Zxkv5rv29evVmwB3EqWDjAQCeq43HmbHABK2WCx2AeA
         b3/CdVNOtktkyySm8Q3gZ0n4WJlHdSYfO5OhQWZDTpSLPqctaKe+fuN4FSXz7/QO8+Pg
         ez649wi/+/1pv4IciO3A4aY4wy7zinstly/uYfW3MMs0Kc36VvzSMCNYLhTE1A2BTe/o
         f+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073070; x=1783677870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=smkcd0eRrWOi7xcIysQwdSct7gNXuzCd9k4WOantBn8=;
        b=KdKs4emhmNpDGbV9vknow4lLhb9RF0U5285mn1Iyr1SFO6MYv1Zk39id72eBO5zxYu
         HwuEiI0SGKq4Tn1g4KBLdBj5xKzIA/SEfVwPvh1sWm03QCcECyb7FculLtFS0Qu0XvWo
         SZPnDInwgUxNVXhiWksVAfrHtQa3isXYWgGFXEGNN9yy6x3KC0IKfIfrYYhs7y0wdNIS
         d/bdvvyn2H1EtADg0G8ZxSV+NZNFnL+I7szxicJiibTxS7uqQrXUYc1zixLeUsT0tO0T
         P7doAox6RJykOjQDPm4CLMXSRydVUluHIdO0YfxuD06qRNu3P/Fzq8fwDqJEY6ZGlnrg
         uf8Q==
X-Gm-Message-State: AOJu0YzjNrkwe2ZpSE06ubeGYelD5PWt6jYdG0E3FvgM/UNhrDnkx1ib
	QgrQzSpNgU/1ooFxHAB/8TGJ3AYsFbdO7d1hbdifpySIcX3KnvoUotTjNaTlLBkZrP6pqNWa1aW
	avR14h6/2iR5oB1o3KHGIqUK60JOm+4pODidrx5bSg5opJ0ebqBTUYled9b4BCarLIW7w
X-Gm-Gg: AfdE7clZrLrWtriQN5TBDQASDB8JYAvG37ITp01LexMOZvbArSQQYzO1CyWw/vONoDr
	Lb+RiDXL8p20U7QUcVE4B4gd6uFZGqdvP/vgb8IaEcqEUnsi8u9N7W0Yy1SosNYHRYTWytfUMLu
	iTgGyGNlD4BUN/y72RicenrjGnpWWgJtvfZVTqulSer1rJCRw2l234SIe35lLvfPz29n30hgqaS
	uo1yTElOPswDUSUcMBFW5od/KoBLIbQZ4ekpYwPjct15113j0y/1HZaIQkTobFG0pesnUl7ZTEm
	shxpqZVdeWcTo+dZhDTwLeZGeEECS4XRBAt8MTR7smzrLJTbG7s3xmMEXCyooW7WqShNvt4o23Z
	Bmtrd5ijnVzBa42PCyabgrSksF006b55sy04=
X-Received: by 2002:a05:620a:2552:b0:92e:5949:3567 with SMTP id af79cd13be357-92e8b29fac4mr405500285a.14.1783073069523;
        Fri, 03 Jul 2026 03:04:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:92e:5949:3567 with SMTP id af79cd13be357-92e8b29fac4mr405494585a.14.1783073068923;
        Fri, 03 Jul 2026 03:04:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:02 +0200
Subject: [PATCH v3 4/7] clk: qcom: Make important ARM32 drivers default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-4-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5676;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XvPNC/3TSLWXK0qQ93RFWay5rDBNmpp7S+fJKAkwoLk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kX1Galk0cSKgQvqOBW5wQRmDqrV3b1EPcbS
 shBOczEutSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJFwAKCRDBN2bmhouD
 18AfD/9R+ko3brYz/jvagH2FriBQ4sjlPYxKzZj2g/UTv9oLe7w5vjzOavreVEM8nJwr2hhrPEa
 cqQpUJESA9d9UquLIxMHlF99nc0yOuAHKYIJ9Is9lxUKDP/7fu1bqgOpxESw1g/mpdcTdkMgJmB
 2QxozmR5+LE39EGwf6sFoxEaPmlcRWF5dWHZ2kdjIV1/g97XUujrdK6itWxuFKRq0afIiDQ/Duz
 aNBV5xKAVtwBQ7wArGoaOaGtAdgejT1TG4VIjnt7vkSibN/3hPXpDCGgh7djInbyxUF6lVXUA9L
 KJkU14TVtymLwQiyqE8HqNUdjbF/Zyfwzx8bnC03UoXQLIph3AI2A3+H75R7RASUM3zDocCi5Kv
 zZcIljg1kKNkYEcpn1xre7Aq5ndZOBNIDPNxg0Fdi5f8oDXn5qTLgyze5S/b1e4ldhJmiaFQJU9
 zBPSNmPO9ffSVCYegokFgrVVErcEkZqMGAbJXD525CfkTFa237108ZYC8EiVcb4gf/TdGwoiemZ
 r8/gfS63U5snyikGiMzDgTFqeUhPxTd/Zv5sMQl/OyJ0ME/BsyFIN85ODW5tISAAIfX2DFtplvU
 546GW+MA814COXMizxcYAtyOHlaVuqgsir9pL0VOiq2ejJq7bwrBId1wa2/8lMlJBmmm0En3pfx
 sXQPegWpKoIUwag==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: AXYnPKMYM5KBYIFXFp7DcXoMflLY-5Za
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a47892e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nVu6gHFLEUU7Sl8RD4kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: AXYnPKMYM5KBYIFXFp7DcXoMflLY-5Za
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX8OmqvgqxC3J0
 nXOwb6A5BUMNBgQSFcb50wYlWSdppPtcEtvpjGLcEtvUFFwvH84yEZvy2+ahFC4nZ3oWDy7BPZR
 8dMTOwxpVWBgKPCqg83ETOrzZwF0AOcB6ng0Y085FdCJS4I/4M9NY5LGi+zpUTt456g7zGe984u
 0UBOIsxC8iTKAUL8Pu4WtVzIgUMuxI/eNnGlT4YV+YtsHve/V8Y0L21x3799VBQctcaKUtIOjte
 Id74Sw5bQPwWNpmzEnNI/Yd5iHx164f/i7xXpQrnV7KXXKTO/nGUedMSWw+/gHYh1wtB9PZlZfR
 p/jKPhtu8/E00aXe3uDm9DwXMfPNQINIs1AcUvzLqCbimuB4h/D9CmAkT5zHmJ1HbVDTdv0czSw
 ggoS9siKC/i31gAun34i1U2Ef4yL94bjYWYRiFBOu/AmBPJ0Asx7IkGOwIUVE6rqtbJRMcJUATs
 6JL5Fc3cK4/C6pCEvyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfXyHLs6zyF8twA
 XNbIGvKVdWCj4mr4rliMrwBqY3Nk8nxSqIEfhcS3StWOBUy/KFcTUecD4ZWb1RgDr+cf2pKx+Id
 /K+Jk8il/llKJSx8RrZMN4DOOKuoQw0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116270-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26331701053

Clock controller drivers are essential for booting up SoCs and are not
really optional for a given platform.  Kernel should not ask users
choice of drivers when that choice is obvious and known to the
developers that answer should be 'yes' or 'module'.

Switch all Qualcomm clock controller drivers which are chosen in
ARM 32-bit qcom defconfig to a default 'yes'.

This has no impact on ARM32 qcom defconfig and ARM64 defconfig
include/generated/autoconf.h, however enables a few drivers for ARM32
multi_v7 defconfig: IPQ_GCC_4019, QCOM_CLK_APCS_SDX55, MSM_LCC_8960,
SDX_GCC_55, QCOM_CLK_RPMH as module, IPQ_GCC_806X, IPQ_LCC_806X and
QCOM_A7PLL.  Enabling these on multi_v7 is expected to properly boot
these SoCs with defconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 drivers/clk/qcom/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index db3b67fafbc3..11adab354eb1 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -271,6 +271,7 @@ config QCOM_A53PLL
 config QCOM_A7PLL
 	tristate "A7 PLL driver for SDX55 and SDX65"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
 	  frequencies above 1GHz.
@@ -302,6 +303,7 @@ config QCOM_CLK_APCS_SDX55
 	tristate "SDX55 and SDX65 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the APCS Clock Controller on SDX55, SDX65 platforms. The
 	  APCS is managing the mux and divider which feeds the CPUs.
@@ -311,6 +313,7 @@ config QCOM_CLK_APCS_SDX55
 config QCOM_CLK_RPM
 	tristate "RPM based Clock Controller"
 	depends on MFD_QCOM_RPM
+	default ARCH_QCOM
 	help
 	  The RPM (Resource Power Manager) is a dedicated hardware engine for
 	  managing the shared SoC resources in order to keep the lowest power
@@ -363,6 +366,7 @@ config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on apq8084 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -373,6 +377,7 @@ config APQ_MMCC_8084
 	depends on ARM || COMPILE_TEST
 	select APQ_GCC_8084
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on apq8084 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -424,6 +429,7 @@ config IPQ_CMN_PLL
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq4019 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -478,6 +484,7 @@ config IPQ_GCC_6018
 config IPQ_GCC_806X
 	tristate "IPQ806x Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq806x devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -487,6 +494,7 @@ config IPQ_LCC_806X
 	tristate "IPQ806x LPASS Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select IPQ_GCC_806X
+	default ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on ipq806x devices.
 	  Say Y if you want to use audio devices such as i2s, pcm,
@@ -555,6 +563,7 @@ config IPQ_NSSCC_QCA8K
 config MSM_GCC_8660
 	tristate "MSM8660 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8660 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -599,6 +608,7 @@ config MSM_GCC_8939
 config MSM_GCC_8960
 	tristate "APQ8064/MSM8960 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on apq8064/msm8960 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -607,6 +617,7 @@ config MSM_GCC_8960
 config MSM_LCC_8960
 	tristate "APQ8064/MSM8960/MDM9650 LPASS Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on apq8064/msm8960/mdm9650
 	  devices.
@@ -633,6 +644,7 @@ config MSM_MMCC_8960
 	tristate "MSM8960 Multimedia Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select MSM_GCC_8960
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on msm8960 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -651,6 +663,7 @@ config MSM_GCC_8974
 	tristate "MSM8974 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8974 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -661,6 +674,7 @@ config MSM_MMCC_8974
 	depends on ARM || COMPILE_TEST
 	select MSM_GCC_8974
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on msm8974 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -1234,6 +1248,7 @@ config SDX_GCC_55
 	tristate "SDX55 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SDX55 devices.
 	  Say Y if you want to use peripheral devices such as UART,

-- 
2.53.0


