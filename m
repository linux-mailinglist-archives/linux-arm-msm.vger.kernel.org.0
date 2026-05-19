Return-Path: <linux-arm-msm+bounces-108565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBieDhCODGpCjAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:21:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E258231C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B71531307C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AF7409603;
	Tue, 19 May 2026 16:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2NDAFGQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AX7f8sqC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A75407CE9
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 16:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207016; cv=none; b=F1XeaedaKvysny0mn4x0BcncreQu1LZBuGJbIj2c1mVFQvPsTZtAFYlh1mm2Ucll9qWFn+W6V1WEsf4MGl9nPvxecd/13Vdd8du9HChTt4C2Vk6CCRsOT6BNGDhOb2iRjw9pIDHDdS8hqInLabXOwbSQWQrT0ScNaJsayeR1MiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207016; c=relaxed/simple;
	bh=XaLFT2fPvjtPhtK7EZGEuC2Ca9RbQSTVzO6T0boXsiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qYk7U1gbXtmx9surbrR73KcJPsgxtUH0y2kKH0VRPDMdCJ1M4hE5uC/1QIHLWs46sGCX6fxGO8/jCrtJMHrr1gCEqjXew9Dt7Spv4BpUfKuy+qpPvX9xI+1Tt8TBTmow6bK6sBBa1U+VmhwHn27PQmsZdUqFQomJ4AN64WxFyss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2NDAFGQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AX7f8sqC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEx6GK2868108
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 16:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	03CoBdgzu91JgB76Y4skx50oH7eLVv6LNm1qf3EcnHs=; b=J2NDAFGQ6vMFWUns
	24ItlkRHfM4MQU4ygdKZr6wW7kWazeAmmiS4Ya6pTgMB4fZCJS5HDJXDDd7fyRY5
	N8dyl+KYSwECpB9iz0mzoefKkJNfgIqu49ddpIWQ5wCDERXW5ZTYtR3jp7Te58AK
	vtbcGPWpDHlzVyqqFoeKRzSvC58MUA8YjjFYzkvB4j/NUIfcVYQWzfwI/gSNAAjk
	bsHwUNFRZEX4VpZ7kJ4cRFXbLxXuxGzia38zaYAqO1GqdJ1tf7K5sZr9cGo+klqM
	2EQz9NhW01k5ESig/BwDyYNrJsTd5JxB225tpejC1bY9yTU6el+SQe/v7kVxsE9I
	7E53Ag==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3w8b7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 16:10:13 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69b8b4075a4so8038489eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 09:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779207013; x=1779811813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03CoBdgzu91JgB76Y4skx50oH7eLVv6LNm1qf3EcnHs=;
        b=AX7f8sqCgAWu4n23LyK+2VrqI12Shk+2oZ/z9nGvGD9S0T+3IUBrOgxoCkmDj9yF2B
         ec5tz9bUjey2b31BALQeIwnMpXvEL2J+mSBdaRsWdEAO5EXp0NjGSQxZSLwq+g9mzFaE
         PRG1EhC9acsEVc0KY/PGdsZdFrrM+sRmIajzpx9te/5UAVngaDRhl9LlInMTcesRFokU
         IXqTZeVksEVMfvMLqjdcG7HdOYKiaMWdfbYENLslQCfzATnVIbnk2z2zWZjwu1JPdimH
         J+lGJWnBhg9Msy8752PsjXrfBtIIzvLpEInepOxe0Ko6BBDWjFiQKbq7Va6X8/EvvqZo
         wKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779207013; x=1779811813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=03CoBdgzu91JgB76Y4skx50oH7eLVv6LNm1qf3EcnHs=;
        b=bBx8IphN1N096QlsAmxQQpO701kJdw25uQztnjA87VPdVKA9N9q/EwcGn9VFeAQupe
         W7Ueek3APNw2sF43Ujm8nveDzAkQoMOwQzBQ8TSQTPbkKX607+Cj1tDJ5o7tzbT5W/LT
         fJQBjxKW91OVI8vbHQBY9tpJ7I9+Czlop+3NaJoz4tIF52dbEJ3NRN7fNG5BEbxlv3Cf
         AnJM6VXN5Z8ceruIlbCoYD9gCdFrnBsSXVglwdJxfmMSfwTmkTfEQKifcpEz+V3pH0jz
         Gn4rSfAqTi2NXR+8CLlVuwf3TCPW+5/A0tnayMPp7C3v1HxsXt3qflGoeqpEvsZoj7Lh
         hPzA==
X-Gm-Message-State: AOJu0Yx4rTWQP1nDJ2TCCbAsadFzPfU9InWOXnT4fPTqfiGA7gvymeKj
	m2VKzb2KPFycw76TTIZb+1G3pNfJUNuy9iIhjs/KCsbCUui3BGfvWl2nwFt1tXqIVGRGjd5vm63
	sTs6gtzfoVyRfEzhrgPCj3W/yiVwQBeJeaOsLBJY1IT/nDzPdjIY+OCCi7ORdSz9v2cdN
X-Gm-Gg: Acq92OFArgBvhYoQ9xtgkvir7DiSXkQ9oPBBFkx8YBqZBu7dnM35I0GXWA5qMTuqQIP
	BtEQ37fr0RmyC9lUkwZtVhioBIxWfJh4TZrtq7Nw3HJFCMjrNvV1mwKCt6VQa42y7EebtezVHCl
	wt/6kqTK1z7UyETfUXcL0upbhg9JnOflmRHoWpvlhJVa2dV0KBGaf7HXcm82HYC6LWWkC46RvN5
	LR4yQfxBk2oU2rvcOxc3wdsIou0d1Rnti5QqFF71uEvkFmY/JiLhJVEXPJ0zs0eG861nXqWMWnb
	dSJNB2A05nfZIyWoD7yxnkQ5ChEaNFHntALAP4NTLOJ+PiQbSMUBoyAsn7GDyRO9iDIPTbBUYfU
	td6Xsj9+i3QWCS61CRc35uVRsBYQjgAgk67znpio=
X-Received: by 2002:a05:6820:6ac4:b0:67e:366b:53b7 with SMTP id 006d021491bc7-69c9bfc2b65mr13227709eaf.53.1779207012717;
        Tue, 19 May 2026 09:10:12 -0700 (PDT)
X-Received: by 2002:a05:6820:6ac4:b0:67e:366b:53b7 with SMTP id 006d021491bc7-69c9bfc2b65mr13227675eaf.53.1779207012146;
        Tue, 19 May 2026 09:10:12 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab7c5sm357874915e9.12.2026.05.19.09.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:10:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 19 May 2026 19:09:54 +0300
Subject: [PATCH v2 3/3] arm64: dts: qcom: Add Eliza CQS EVK board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-eliza-dts-qcs-evk-v2-3-ad7303659d24@oss.qualcomm.com>
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2580;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=XaLFT2fPvjtPhtK7EZGEuC2Ca9RbQSTVzO6T0boXsiQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqDItaZYPiDky5mEpVGRNlrTpCFY1NgsqTEuCUr
 Abnk9DXveqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagyLWgAKCRAbX0TJAJUV
 VgCbEAC0cUSp6TBDbalA3qC29tZsKh/ot1VLuMcO3w6/Hrv++YawBM3h1gY+dTipm8GtfG/zrZT
 Vbv3QSHhUPTVRIxHLP05h8spR7uTxx9vVvNB4RGm3+4uBU305Gu7hTQmQ2up4Kc5NViLGPRDIIH
 11PULt6pwqCn7keUz2zHw60Am9brPmUa4b7UhzRoaJUFs4v8yOZHIASQvTwLivrDwPClYcIjLGy
 PN//feq/dvzrz5/714zDbPYKs3Desi7fS3Ds9O+6axz+TEq2DYZYfzpRbq325nrmeXYppwUP/p4
 jhuK5+X39d7SxDDCdCYFqJg33sejAJM4vt1o6atv4oC9xhrgLQxMSwI/MYkYQRmCLohH3mHGvdl
 C2Nz5h40ICL7Zk7OBUhznpiO8Mza0f7zad4pMkyojL+KEoL54imi/e2UgbRJiqDF4P5E7EozhPR
 FeUePhU8ozzNnnWGSy3CXYYL9mO6kIj+WPiOwzk7cSqtYMbdwL8u2Mk7Uw/aEOj2WNQMmBIkupJ
 2JIrRw+35wo8Va6sfksvAM2pOyAiLPH613PAsLDAAOL+nxH5xRZPR5tS5Tf6n2eEYvxOXERYzaq
 njlr4A+val8G/VaUtqo9oKamfhse1u9TUmyTXcp8aKP1boQ01pgLqBetvJ4MhkvdEK3kMBZdjbN
 L2IjobvFfs8ywXQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE2MCBTYWx0ZWRfX/5Uic9HozMsZ
 jORu+RZ55JXdZLISXYBeSu6ykzQAMXiI7xbJWOKhR+fjnkLjqY7Zu/+rs0PoaMGR9Meutm5bZQ/
 MhU5/tF2oVxpkm5bg/uPNWA7xd7RS3k30rlU3EhIGetw1FtTT0Zn7aHM1xtem0RkiuFI88T4OI5
 VLjtTL/pxD0NUop/iL2f+MhEXJXBjumtLTZjAEiyBEsWl7zsoamh7uv4tOQMGKzP8Kt6MpdrLID
 GaLuYLEhIrGvgVz39EhkRXWdw1YsV4y9SuI4lY9f02zo9WKzWpV4wcOvcniNpE1CdBvG7azzH7q
 ju1mmofDvXNp1WfMdodeOkU19o0CPF7fV/f7N2DZ09snzeLoexLTexRo/ynb0gCkh+gpm58ooqx
 pyAIgvnOxzF0syF/tjx8baKBDLI2fiwAVRgOW/gePjrJ5gNBOVBSWpj8RN1zTGDBoxQXa8x+QWy
 ntIM3GY68rWTOc5HCAA==
X-Authority-Analysis: v=2.4 cv=Q/viJY2a c=1 sm=1 tr=0 ts=6a0c8b65 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nfd1YeTbQLvsyS6wM0MA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: qlIpsd6y5e6IHuj2zi5R04Dfe7TEj6JL
X-Proofpoint-ORIG-GUID: qlIpsd6y5e6IHuj2zi5R04Dfe7TEj6JL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190160
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108565-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E52E258231C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Eliza CQS EVK board combines the CQ7790S-based (Eliza) SoM with the
common Eliza EVK base board, which provides connectors for different
peripherals.

Add a common Eliza EVK dtsi for the base board bits that can be reused
alongside other Eliza SoM variants. Then, add the final Eliza CQS EVK dts,
including the CQS SoM and common EVK dtsi.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile          |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 20 ++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 795cee4757ab..e244e808a647 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
new file mode 100644
index 000000000000..d1cf08ce19d1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
+	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
+			       <111 2>,  /* WCN UART1 */
+			       <118 1>;  /* NFC Secure I/O */
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
new file mode 100644
index 000000000000..e47b24f8b827
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/ {
+	aliases {
+		serial0 = &uart13;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart13 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};

-- 
2.54.0


