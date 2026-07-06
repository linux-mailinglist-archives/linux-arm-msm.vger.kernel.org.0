Return-Path: <linux-arm-msm+bounces-116731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0PmgEjeDS2rNSgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:28:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1F970F2A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:28:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VYKSATzg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FjB2pIy9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116731-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116731-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CD653025143
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA36C4314BD;
	Mon,  6 Jul 2026 09:40:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65FF2F7F00
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:39:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330804; cv=none; b=WwYwNhL87AJ4KySCURYf6UbT4Wg9Z0uRwfyS2rBItJs0xq+4Si9qps50hQzre/Ger5txttkywkFzqRE6/9E4XVPnDvCodrESY9N/RCcz1rqrvvN6tHwVAbgLm3eHz0BXLHI3+cYy9InjMlXoEwX5kkSfD/0w/Wy2a+p7DMdjhK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330804; c=relaxed/simple;
	bh=3rNwBRoulhXxOAock65faJUYqxy2hdNW/9W0jOD+wgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WN2eJzymkTW/5q4FtEKBhLAvjjGpOnI/LNOTWQms+hRK63ij6yn45so1hZmf5otYJqRVAvGfsfvpWucNdgE9FxaqTSQEOIsCWcBOsnW9sCYcDOHk5qflfkpPAivjLv7mgYET/mEEkCox1IX3lFBs8s10zXVO/uWdTHIwEc/lR4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYKSATzg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjB2pIy9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693x7x4151651
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JqzO794fhsM4zGloJggiPWJBXXiAi6DVnIxpaUFj9cI=; b=VYKSATzgPyetdPUP
	2AWvZXTFPN9lxxD7a+QDbXPygZIfHXChYCR2jU6UkqHgWk0XsSrtbU5827ksCj4K
	jfIXhbNQl2OYGZ6wDGXCGUWKEFqikUOUdf1ovtmrxmDUc+x/6WNoyUmCBLJfx6gN
	v/kU4CEATe56o5sJu1h93knfl/V/9h5qlMfL/4vYM4ZdcY2FS2Zcr1V0/84bbt0J
	CPg943wGTMSWS0ASxp5XaVT7xRHFUt+565rUwFh+EfoylB+5zFKenex1Km9PaPOo
	pWyRVdn6yTsa4rfjuvdsglRVDlI8jRtYwLR6afG7zzN+q8nOK65ewWlLwLMIrka9
	ROhuyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs8d1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:39:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so291923285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330798; x=1783935598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqzO794fhsM4zGloJggiPWJBXXiAi6DVnIxpaUFj9cI=;
        b=FjB2pIy9HrrJarf6QmHCQV8G/zO3xwznXk7Qt+jfwwytz+JClTn9G5WlFZ5aIVJHYH
         Cve6L2RleLoYV/3HkdZ0fXUjriA4t1OJ7anmL7YIEl12Qm8Uv/fuF66Ml6y6atb8Soiv
         5iRnK3TgTOCXvWgcFGsnraP1L2LIgGOwaaKCSjz7ibKN9d8YBeihPUygummD2rashLNK
         Y4xV+jQwUZmn/BqqhwwpfLaeustkBd4P0pmmVivFJo7PBqvcNB1zx4aOE+joIAENdqvB
         FkUTr76QdqJyxTPRLHrVpb7hdvo7Yd0CLovC03fCkifpCIBM0dYkNgvHyiQ9+tMI3XBJ
         Y3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330798; x=1783935598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JqzO794fhsM4zGloJggiPWJBXXiAi6DVnIxpaUFj9cI=;
        b=UxnoXJ7nqUO/vGmEBr0jKtJHTx0WyS5nV6ZVVMFEfZ+1d2Wr+1T5slOiT0/oZabJGa
         J8HqSD2umRo5rvHSyiGooPNqZBMT6k77RIEx27h3DKEwv3s9x7stWDGY2OueVlvOAkTz
         GPd3wDhCxK3jThOEgSMBBni5+5lB7YxH1uuy9oT2aFnrLtOO3uJ2/rx1bVA6dQ+w2qp5
         ep0pAPiFfrNRJpBo/nbmW5YKUouzeAhYG5uOsFkFRPhsLbCNBuJAuJyCJ67fjiq9HNpV
         Qxfx2B4mLRIrGo0vjL+/m8DYa9WbsEPh29N6gKsgiOlVGOWgndoNANmCGtZUIR33flGb
         4pjw==
X-Gm-Message-State: AOJu0YzSblNWBir+ogNZSfiWFFHaLLCHzc2L/VXAflJzOVVcF+MxRWO5
	2RgN2nDqy+Dpl8xYpmxZkAyH3fvc1hwAse1ZKUSF7mks4MFuGs+9vn21tAdsWIEwKhjUSRMswvl
	bkB0+i7QKnk0pMay5fbtIS0PEtHpV86/itGvA/x67u+LoYUuSw7pn7H+nN6FE2zz+c5s6
X-Gm-Gg: AfdE7cmxiXHAdu079MWkZMeEXEDr8OqGbJYafQmEkJINo91HmWH1Swfj5PkwdHZ4xGq
	bUCjDc8RdMd6ux0LmY/zY4RnGmOh61VEIug67zyOS10C+scSAsiuOr5KaGu3GKRISQVmp0EUrdw
	4LvTW/Iipy4p4gB7v1Fvf5ej3kk/CHtYlohA4rAnubWQY5jey1DNh3qpKceSySQtQOdi4VVAdxK
	2u8YCyrXLfobGE6hts8owucDmddaizYcsvFxiARVXcxMNKlA+uoaGRydZa2EQ7P2OTNuDSRPQwQ
	crkVE+W54FGHHLh/wnNoNMO60Kr2DHPF1gCElRVNvrvxcwIKY7gItenU1tP3VXfMzFxKg3Nqd05
	ShWhENhxJMzPLf3vcUzVlrvE5t3gXl2ehRvs=
X-Received: by 2002:a05:620a:1729:b0:914:d65e:4660 with SMTP id af79cd13be357-92e8b5c9534mr1710268585a.42.1783330797958;
        Mon, 06 Jul 2026 02:39:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:914:d65e:4660 with SMTP id af79cd13be357-92e8b5c9534mr1710266385a.42.1783330797449;
        Mon, 06 Jul 2026 02:39:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb566csm259144095e9.7.2026.07.06.02.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:39:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:39:45 +0200
Subject: [PATCH v2 2/4] arm64: dts: qcom: Use tab for indentation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v2-2-90c781ae0417@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5745;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3rNwBRoulhXxOAock65faJUYqxy2hdNW/9W0jOD+wgE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3flFH2mC2EzvJihJUIFT3MtQw4pWau/Tjl+M
 WFi4k+6XcWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt35QAKCRDBN2bmhouD
 18xbD/sHOhziLKI1fGZvFLqZwY01cmxb3a4VDeYX4FGONMk8X0tbjQO//K5Qv9vQDhUfhp8Nu1m
 HLzzPWy74SGt8zR85Xp5qvI8f6ziovIuBEdSDxB+QSGeqT0HmPB3mbN3YftdIXJh6WGGFJOcvb/
 yAfW9JxBBosSmstLupgKwK0lwcltaalv5kfUPB091n5Qw11epKjix+lmb0b2O4cM1FogtyXJfnC
 1OZjZ5M8Og6bJig7w+6fMoQcyRsZr4bo8fyi/FKfO6NqJc6mswqbDuemjl3FY/vFLALfNmWs7V+
 wgtfQtQqPNn7ILa2p+yhMu9QauG1N6nmkKpv4u6VguSK2DnLXMUfDxZRegagTo46xprNjXYodFx
 rLmv6s5Pt+5NWE9PEJA7EHvU3qpDbfTt31pQBHaLvNQBLEzpok17CDNScjrrCR5Sjl+OzQ+ayUB
 wtxEJ0XRL/7heSvQRZl/59iHE/Um3x9Uvg2Pz6cjJrpHSAGRAfikR9xsghKSNVqDz6/vS8Ezihu
 KK/xClVhzcTVy8g9+zHSR5T6VUR9IRXOzMi6xngUbpLjvpMSDLJzqB8zlGlhtFxA7zcXOxXOYUF
 YbX+zaBLN+uHKlh6eCEdjBRFIrI0dkmay+NojLMHqkkel5bU48hzxVSx68DChHUgIB867p2drtj
 pHMlBrYVKHUf4eQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 4RchaG9vNBW8scyVXf_JhXM1vH9F0iUS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX6VRJikZlUtrK
 IBCYLMNUhBLjsBeobta1199Y3rojimhTiasedU+CgHCRoJRI31qW1oBtCcvrT59rxHpN98wtctc
 qnonl+VDxT7OVceJtEJaFC6/DFKzUc8lugVwH78FcPxtg451KXX5W4X1j+iEsOpe70uR0SsV+Ud
 sLF7/ICL4ASqDdJf7pw9eJWYEDi7MfRAbaeXKiD29NU1mrFO+4T8FVeDKJAYIqCrABuEqB2GpkF
 jAKlWKlq1EEXXnuP8cPmOb3HZPC2IBMlW+KyKLW4ge8S6wsqWRArzfsbIvG5Un6TQzMnS51J/nI
 UT7GVGONpoOiJHPncg2rHxc32xSrPvYsBfrqZmwTqNxrHtY9S+80yUnVBouV7wTlBOIVny+Oow1
 piC9ALr5wAo5GXZ7xWezllCyaJQg0DiXtqYqeq1qNm2R2a73XNtkA6qXtsISzb0S0l7oifHQJUq
 qAkp5MaM9jIoCnfqCyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX2VPqRkaqzs6E
 aavLrJHT4J1cQbvbk1LYKJdtXOluP2dOkvOxw/x8c+6ZnpoxpLp2Y1wKs3mtvqirocbHCwGCfdw
 HjmTeBM3UOSB0CZh23YgF0CL9RlwXfc=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b77ee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rVvbQ8FmIT8hJgtOq_8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4RchaG9vNBW8scyVXf_JhXM1vH9F0iUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097
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
	TAGGED_FROM(0.00)[bounces-116731-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD1F970F2A4

Correct mix of tabs+spaces into proper tab indented lines.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso |  2 +-
 .../dts/qcom/qrb2210-rb1-vision-mezzanine.dtso     |  4 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 12 ++--
 arch/arm64/boot/dts/qcom/talos.dtsi                | 64 +++++++++++-----------
 4 files changed, 41 insertions(+), 41 deletions(-)

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
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
index c314cd6dd484..f5e6021a3354 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
@@ -60,7 +60,7 @@ ov9282_ep: endpoint {
 				link-frequencies = /bits/ 64 <400000000>;
 				data-lanes = <1 2>;
 				remote-endpoint = <&csiphy0_ep>;
-                        };
-                };
+			};
+		};
 	};
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


