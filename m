Return-Path: <linux-arm-msm+bounces-116664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fxdBJvxfS2p8QQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:57:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F370DD59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:57:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mFECnX15;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FbbWsSPn;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116664-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116664-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CADF329DF37
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4C73126D9;
	Mon,  6 Jul 2026 07:03:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D6430100E
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 07:03:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321437; cv=none; b=VrvBJ8DEoo32lxZJvXlameTYfin0eIbD64kG1R640pXFPug/L8HBOrZsDCxf3ILK0sSpBgax7R2G5X826JY3VZTAiZiPrQxRnd+xM9RQEQ61TmQEzYPQpPBPnZDxgZhvr3Ak91Yxp9ARC8yUAg91IA4OFh3KNFJNbVWMGwsB1lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321437; c=relaxed/simple;
	bh=90fy9d5GmTVZz/v6mrbM1M6AFz/uQWJQD+G7gHwuUVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JkM55PATcJOQAqujZqyuVxtkhrThawmQz9+XToAC/sJ9PYVMl8vMXZmlcQWQWEWqVr1MxN14Mz/JGCUaQUvcq8TS4/cU1QkF2461okNIUupIkocqtHNODXSldelhvAv69hIGw4VcIdQlnqihDwPmtDQTflxTU3EiHMKQdiMqcss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFECnX15; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FbbWsSPn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641RRv3459034
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 07:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0gTvHMfY+WcSALPHH8RP6TsH7RZoKoZ3rhMDNn8rAI=; b=mFECnX15C7sNULUx
	+s0LbOTgTPYT3AyAmBd2BeedsVuAbvzRKm9wGYCTNgZTrwd5i+TjAsCZy3aJMmbc
	FGnZo+Ty5boCaI85NmffaktdMucPZJh3TMp6SFZS/IbX7c1aI5o8RkgoJ1XXj8/J
	97e2hDY5tbldiGt5mxbrtHQKLkaZfeuX6ZT08fXMHsjAO7iCC6J3/NaJAHdUFuRr
	7iNPoPIPo7lwixsjC37BXv062A4Lx5dfEbhwyEiiyZOPG5/P82SzgrnJNRthLf+H
	nlIY4HMZkozEKcPdkxBt+REDkW0Bd14liLaRA+hj5D8pc4pq3rTOZMk61eBXwOp3
	Q1Vi+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf84su8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:03:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so273012685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 00:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321423; x=1783926223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0gTvHMfY+WcSALPHH8RP6TsH7RZoKoZ3rhMDNn8rAI=;
        b=FbbWsSPnksPlkrAsL69rf8rClwQ9OW9sDNcPQaX1wHXRRH6KK5q9CPY6bwpmtaU8fr
         2eyLaPDBuBBHk7Z3gGrsSmUF4Z7OgMyEsXhRy2NmPJ7gBoak+VysAJypfchozCjdyQJi
         vluavoN2/dVYfYnODKD8QSV0llo8zh2tlSTrey5gQko34uaTF4N/mDR7IsF0/+pMRJ96
         /RuMOWUbcOScnHk+dFyW8xzLXpgWcSL8gfNGdmqpwhQfuI41esiL9zgocRzhhlsOYWM8
         8nGbILG41nHKolDhjFLQOzuvYJmBs8RcAHhmKNSkbFeuJP/SW625CHWyxFaNQmUlnxHq
         QiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321423; x=1783926223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0gTvHMfY+WcSALPHH8RP6TsH7RZoKoZ3rhMDNn8rAI=;
        b=aX+0HooaSQKCz/8SiWgdtOO6qUWPl8MHynAYP+md0uJzFdUbfGAfOI1aDxvVZjrGjK
         B3WRSZbOTg9LC7BKZ3arTWNo+RsNUSOWv+0UTwacpZVmVr/IOmM+oo3wybtv+3gl1OGV
         nb2O4NFxTSrE+e5Btwiu1590FuRNhXj2BTOBUxW8TOdWE4EyfCBag/I5N+mpfh3qcZyE
         tkemAaV0R8U8G3UbM9MRkavs301gxoFQQpQsDEdesNNf7w8ACeQtbUjCit/D3MB0XkHH
         yL+4Ng2Dn0JDedB6hqQT0Z4rSOeOjxeIuYGt/ACpJ4qzFM2QFvOUEC8xmn6C+wuG6Gvt
         +mKQ==
X-Gm-Message-State: AOJu0Yy/ugwwqA1km6CCS5bdlLsgAx+9Fqud+70gCPrmSHYBtdw9gJiq
	NFvZ7NEEgYK2HaPcCpsTqx8PTx6NpMVInS8AWYdMMll9zAl1CoLTzu9SoRZTtaae3fUwb0t9Jw6
	fdfrbZIuFj75JvguS6KRrcSV+FvS5gD5FIX9iDkzsLYJ6wDGDWXxz0sGaEwlLAI03V6WK
X-Gm-Gg: AfdE7ckanuiOtnbTlL510hMz2cSDmkJExs4NTCAnbrJJIlkBCoFCkY8NsFXhQsSlJkj
	zXiUX3eD/Os6FUsoFz6g1gF1xXBorYrKoW4gKeIMYLk9ioHQ9iszu35QYlTk2N3pKpk252IPKss
	PwhYVwxmwV3vFWXOERDeKsh9UYyijRlQXS2/dYJic9MLhyfvMDujO4cD7JrPuA66RtJGJs5H4aH
	iBoIWp1ue44RgpnFxORIvBk3SJXMHT9bq1ib/AxS+mYuK9GWW6uWgS60EEy4gu0c3neGcHDoz/N
	SSMcEWTi4xinSc5Wq4EoQG1UxENtKW9f/gMhLejY9m2W2ZvPFRHN4FE1kLX9cOFYlm8IEdtASU9
	mLj2CrzGaeMf+i6ZmCS9pMYnrpHMoGMF9HtI=
X-Received: by 2002:a05:620a:470b:b0:92a:1b20:fe0c with SMTP id af79cd13be357-92e9a37aa92mr1206541785a.17.1783321423366;
        Mon, 06 Jul 2026 00:03:43 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:92a:1b20:fe0c with SMTP id af79cd13be357-92e9a37aa92mr1206537885a.17.1783321422875;
        Mon, 06 Jul 2026 00:03:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm397143455e9.15.2026.07.06.00.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:03:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 09:03:27 +0200
Subject: [PATCH 2/4] arm64: dts: qcom: Use tab for indentation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v1-2-16ce82a2bcfd@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5147;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=90fy9d5GmTVZz/v6mrbM1M6AFz/uQWJQD+G7gHwuUVw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS1NFDl+jVTDM50cAxTn2byPGBYDTVs/ukrkES
 oBrvo0xXuKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaktTRQAKCRDBN2bmhouD
 1zTvD/9C2xqlWIl0sypFT9GbyAa0oHEAL4nCl+FOb72z634bzTB+Wkg9PDL2P3k8Fk02s2/8asL
 v2exJk6oA7H/PI0tDD3raGPvP8mfUjt0Ib1fIfGOrAM4pCC9gEkx1E+91GgERgi5mvf+vbXsc+/
 YY1DcLx74GbqJP3aKZC48dbSgFtGq6bDmbHM8Gcb0fFDuGWV0qpuq7jFTvGeF/ZHjIRk7fE/rgT
 GDHKl7fsZtaRmxkdhUKgkjb64Nne/rZcoywE9Vk8GwE7EFbmdy9fnvg+zp85UibiLPULpv9eAmg
 KEX0QQQ8ndK8IQ2JFVpwDMYZvFWxQXAgb3eEI7UhhNThFjDFZPpBhHz2ZbV8zGEr3J2FLKFiqQB
 C7W8g6MtM2H7W6/dZPn197RQesepgo1NFQKI12/8Aj71ycpls71l1xdum25bTrGyk6y61k5j8Gm
 E7zNPyY1paWQ5nkrEe81UFD0uH+QXk92LzL0DsRwgyA9okz6nLi5ATe22NIJvyU1M5Bd/6wHSUE
 n6fqascvd/K/wq0VTql9w8qs4htq/sksLOq6x987sjmFhZ7/RuLL0I8d63wuGhihruaDgCegqsz
 JPe/CwVntpk0gTRGrBbvyrrEUOR7SKwP4S7CHlOxOrQxPVo9z+CFH4xXknyrWWmrHUfgOmrP5rL
 r0JFtMKiyha2Y1A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 8sfJiDPJdiMj5yyG2-2_08cuqlhxoWgt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfXxwYSS4luTOHz
 9HuQyJY/OvWHSPAKGIZxXk/lz/yfZhpbV24c+MGH+lUs2MMCc6H8PbKKVv1XekiQISKTG1sk937
 qqRO4jzVOYo3dE2rdDM/despmW68j/s=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4b5350 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GYmwv7oU9F7CniB60dAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 8sfJiDPJdiMj5yyG2-2_08cuqlhxoWgt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX2FbSwEUh8Y9U
 UyP0/Ln0l8nEnYzpB+bN6ZWtZGYu1wxGozaHS3Je660BbgMNfcW5AbNgo6pz6YBVe6NmqKpzQll
 es7tbMce7I7MgSAQOL/chRFNTdpEmXNPQHusClCeQXGCpbRhOkDEs0WzldLKOC5cYYoyOWcCl/O
 05LNLwflaSq8xNQd2pLV3bFiz+vnT8dcYur9oHMk5j9vs2RKDvEqzznIAnuxduW4Pxtox1jJelC
 DIl4iFT8np4zkrV+5zKm62yH2ZgUyLeXPUYVxdlQQ1KMRxjgz3ATc0hP97KJRbrjKzQaKWaR4bg
 HihoL4IOWqnZQ6Cj8Mjf0Qw0TuM7bCZPPYiZmudJWrkgeeQCUN3j86qiMRwhnj/w7MiHhmUQ1bQ
 HcdB7r/h4/9NmQVFUJ+QdzICrKszIsx5D+jBQgMWghpYTPeQfd58U0wmehx9se0dX5nPKaNxK5T
 g7g7NP0Af7MqQ4qeuDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060069
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
	TAGGED_FROM(0.00)[bounces-116664-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F6F370DD59

Correct mix of tabs+spaces into proper tab indented lines.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 12 ++--
 arch/arm64/boot/dts/qcom/talos.dtsi                | 64 +++++++++++-----------
 3 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
index a82c26b7eae8..9872d5cb83bd 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
@@ -4,5 +4,5 @@
 /plugin/;
 
 &usb {
-         dr_mode = "host";
+	dr_mode = "host";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..71a70d051283 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2085,12 +2085,12 @@ aggre2_noc: interconnect@1700000 {
 		};
 
 		cambistmclkcc: clock-controller@1760000 {
-		       compatible = "qcom,sm8750-cambistmclkcc";
-		       reg = <0x0 0x1760000 0x0 0x6000>;
-		       clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
-				<&bi_tcxo_div2>,
-				<&bi_tcxo_ao_div2>,
-				<&sleep_clk>;
+			compatible = "qcom,sm8750-cambistmclkcc";
+			reg = <0x0 0x1760000 0x0 0x6000>;
+			clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MX>;
 			required-opps = <&rpmhpd_opp_low_svs>,
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..b2f9e50ea5a0 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -50,10 +50,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_0: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -75,10 +75,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_100: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -100,10 +100,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_200: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -125,10 +125,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_300: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -150,10 +150,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_400: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -175,10 +175,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_500: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -201,10 +201,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_600: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
@@ -226,10 +226,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_700: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
-			      cache-unified;
-			      next-level-cache = <&l3_0>;
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
 			};
 		};
 

-- 
2.53.0


