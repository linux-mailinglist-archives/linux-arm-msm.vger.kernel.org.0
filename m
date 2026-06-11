Return-Path: <linux-arm-msm+bounces-112799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D+JzD+oFK2rR1QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 21:00:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CBABA674A5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 21:00:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MqdLMbtB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Tn7/7lUC";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112799-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112799-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B83A302F259
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 19:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA9E284883;
	Thu, 11 Jun 2026 19:00:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2C035837E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 19:00:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204456; cv=none; b=MwEqsgu2PEr2T9GVplZAZWvxVQ3gz58En8gIu5B5BgWIw6Z8e5Se+YtKQDCOMohN4Ibq33Exu4qjukqNFDtAWmb27jl713nln+KrONclwlknX5IDceCCYdYDGccBT7lHHUY2eoeKKz3QDXWQIyrhqQoAAgSXID3LHwUkvzEOG04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204456; c=relaxed/simple;
	bh=dNJQoite6AIg7TYkGXQpEcEOt87bY7eJFMNvUxKib2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Eo1UTxTKtpscPj4QYgPukRF99xtahYzEWOUDI5rQOt11ozJ6fwjT6j6b2284JxBFGBzFv/rBcexBlttsF10VFBuAeetSW5UrOgq0qgYca/WAfBaku9CbGdG6YcD1O4dWN8owmN3zRSUwk4XTX/vYUE9KSG015nfGi0++zn6Wayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqdLMbtB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tn7/7lUC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIucNK1484071
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 19:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8GKjJL/Uiei3OZXuy/oX4Z
	O7laqPRfNHUXY1uQc5X88=; b=MqdLMbtBRH3SldMOmZO5e/Sp9kjXoVFIu1ibuY
	Ufw/DB5/AND/WcCFdSjfMEY5RkXg6PiKIO6gzEGm12xllYyX8umIey3p8YzGlLde
	oywgxsjjTPEFrLwp767wnXRMbr19Kzpc5CbexzyzOYRyjrMQO0gKwTc12ElzMCJ1
	89S1kmD4AUyGiYwlTjJd+7M2XEipbqoTwVMlGX2VwlrDvPneJmGl/hEPT+95+9O1
	cb40jY3lsWYRay9Arxmny7ie/NSRiHTtZ/Ofj1twmb1gqXkH9RRFx/94IYqV6ODb
	9YSc3MEojHfzNv+4TmKX77xa6qaGC7DFJA3UE/KklKt4yKCg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r700r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 19:00:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-307fd7138b1so365444eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781204453; x=1781809253; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8GKjJL/Uiei3OZXuy/oX4ZO7laqPRfNHUXY1uQc5X88=;
        b=Tn7/7lUC7jT1d/C0mGskOBdph9vl8hLNmz4janv8eeNZk9VgZ8zh1J0OWotMD5L4O3
         LtN/9JtYtzVM6HVvBTxKQbm2d5iSHEd6Wte9X9cnI+aH6qauOThTMarEXrnpUne7eZLY
         YRXMUiYoLR40TFz9NLGTLcn5tUq49zpCF0dvVcODGVoRbquF8OpSWH00bfDzTRyGa1Yg
         f8omURtgD89j6Wgs4FixSOfRAxWlSQCD0vdzGj3BR/9EMUfBN70qWO+MCYKyAZXokykk
         JSFdzEsSvfzL7dMzISny5dUPL2of4Sws1PlIjRM6NZcWxmIl9pIL1abXTGhDe/zB1LnQ
         o7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781204453; x=1781809253;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GKjJL/Uiei3OZXuy/oX4ZO7laqPRfNHUXY1uQc5X88=;
        b=L4snCDFzF3vawYavu+6vXEe/pSJnCYRb6XozF7f32uYv/Tr7ZcXDwD6h0hNBPbA74j
         jYSgffvKKPZMCiTmvH0YkOCj9Nh4l1Us9FoY9t2MJ6Ul2r/35RNGnfpcvrbM7uPkUV3X
         h1u2rkHFXiu6wuCnvq5YDrAvBHQ41izDwiVmggAS7aVqww7z8xdM1XPhLf0TfHKhvXW6
         R7OuatpgWcmM56Re0Xdnb4OdsdvO4omuH1TpHnBQpwi08fGKQZvLU8SEAd92TqbJ7zM9
         +9+Y3KtjcWTYRwXYT/MGPHXJwtDkD0YukRvsIDj1J51ijN1A6wuONXepmmxiJSlH7Bdl
         By6g==
X-Forwarded-Encrypted: i=1; AFNElJ/ImDKyoBXXtubNcpLkPluJE+twA1oNdNfBfEaInqXSzXbMuXM3QHLmC+ged3Cf/CP7zh0p19JKH0CEDwwl@vger.kernel.org
X-Gm-Message-State: AOJu0YzTw73ge96uvbN5UK65ARrECwJ9kWbdVbTYkL1jfn6az7AG1YOM
	QOPvrjAUfSu46xv3k62t8km7UU45AGgdLiNGcLkrVp50J6HP9hHGSk85WBGkP5gkZVp38KtLDuj
	CbZIq5F/QopG740aC64Phx/UOkDMmyXY1p4rGm4tUtH1QaW8ie37N0eUsgvvm4tabHdFx
X-Gm-Gg: Acq92OFHYGj3DFX+G3a4eDK9OsKYBHn2mE80N0JbgshEh9Pb9xOKA/HVguw0r0t5xsd
	x6g+kz6MT+KRWM/BRiZWbfjCyBmY5EIsrl06ly4F/fXBBlxu48IWtd0nubHyt8LIxBYd5DWlULv
	5IGbQ8yXi4xfPiyYVY9AmWN/GL61ogLXQoobu9tSUMqCpqqbKM6A0f2y6G6GEgTnH4qYBNJ26DH
	vpyvtNnkJAKqRXWRuiBSNroBIZ9+GQVK9ypH4glIwFQK+fbPeVjgGcziSkRMZnAO2Z4Z7MTy5zS
	FlV0LUXhkQNyhDgNVfIxG5sk/PdcxEZuEACnCDAAd6/74bAexldoWBAnwFDltSewYjJxSKGdrdA
	Czm8owkvOhzKLl9Z0NxDiadyAOsnx91tMN/wc2q73ccsArOlTnaZPuJ+HHSnnJQ==
X-Received: by 2002:a05:693c:25c6:b0:2be:1f58:32a3 with SMTP id 5a478bee46e88-30804a25fb4mr2989942eec.29.1781204453076;
        Thu, 11 Jun 2026 12:00:53 -0700 (PDT)
X-Received: by 2002:a05:693c:25c6:b0:2be:1f58:32a3 with SMTP id 5a478bee46e88-30804a25fb4mr2989905eec.29.1781204452521;
        Thu, 11 Jun 2026 12:00:52 -0700 (PDT)
Received: from [169.254.0.2] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30806e8a402sm3161023eec.17.2026.06.11.12.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:00:51 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 19:00:44 +0000
Subject: [PATCH] arm64: dts: qcom: glymur: fix PCIe SMMU interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-glymur-pcie-smmu-espi-v1-1-5effbaa3e1af@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANwFK2oC/yXMQQ6CMBBA0auQWTMJJVLFqxAWpR1xCMWmQw2Ec
 HerLt/i/wOEIpPAvTgg0puFX0uGKguwT7OMhOyyoa5qXWmlcJx3nyIGy4TifUKSwOhu5tI2g7u
 2uoHchkgP3n7frv9b0jCRXb8zOM8PMwZ1TnkAAAA=
X-Change-ID: 20260611-glymur-pcie-smmu-espi-d8a495bd7965
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781204451; l=1431;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=dNJQoite6AIg7TYkGXQpEcEOt87bY7eJFMNvUxKib2A=;
 b=S5J2B6Zby6ZQDPRc5S57iC0EQBQKymF/ZsZiCN8txeZmeTkCaGTUH9da5AKjCGUs3MRD1GPnn
 MLIiENINJ5ADZwCwA8hNLXCLneC5QzaSJTrvpcn8QkerggsA4J/GdEn
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-ORIG-GUID: LSyDozmiOftBvqOB6gnYiaDfZ-eadSee
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2b05e5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=u7QxXnNj1dXMMgLrEtEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: LSyDozmiOftBvqOB6gnYiaDfZ-eadSee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5MCBTYWx0ZWRfX9dq+jdv51Csg
 LLKHlIdL1XBHc34/AB4fwwS0T79HDJfVEZ67VEal0HNbPp7IOy3otGKgkEhMwW+t5Ik/LeTJ6MD
 ZwNwNGPEIDvuV6iRzlSDlbINL81jDxv5+b8KTFbr72vG/LrPnPncFm4GYegbuYwScriJ2g7XHT3
 QzngEc9QBCKBihO14Mt2NCiOe8dQaiFZ1gPt4+sTuxuVW5lk2hCDNW4UWnU8rVBB/Hd6HvXJkOz
 SFXpHIIuNbs/Yuc4z/Ge5EwtjRR9VVyCFSm0A1s2O4AqwN6REUw0KDztPtg+O7EIr9vgSgwEgxl
 1Fhq6bxnx9XjEbNy79rQNvpDqM5M9JfVO8c8Bt6I1T43Nb+1pYLgy99LIlUmewuckKG3EExrh6i
 5xHqs8qKx562oEgxXTDlv35bPyBoAf/HHJerkqSI164IiXFLpzRS3fo56KYibkuMhY9jDIXQHo5
 mj/BzOqc0/JD+mt+Swg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5MCBTYWx0ZWRfX5jpZ+dOFBzLa
 Y1wwN3KBR4mszFkoD1haZVeVe6gWZEIEPbPiNiE3GpSRNCffVwDIpX37lXPiwvGgDzyCl13o4gM
 mNvvj+P6btxQE6Sb4I5zawwg891empU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110190
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112799-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:qiang.yu@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBABA674A5C

The PCIe SMMUv3 wired interrupts are routed to GIC extended SPI INTIDs
4100, 4098 and 4096. Describe them as ESPIs with the ESPI-relative
interrupt numbers instead of regular SPIs 964, 962 and 960.

Assisted-by: Codex:GPT-5.5
Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..c7edfa8156f3 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6874,9 +6874,9 @@ apps_smmu: iommu@15000000 {
 		pcie_smmu: iommu@15480000 {
 			compatible = "arm,smmu-v3";
 			reg = <0x0 0x15480000 0x0 0x20000>;
-			interrupts = <GIC_SPI 964 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 962 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 960 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_ESPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "eventq", "cmdq-sync", "gerror";
 			dma-coherent;
 			#iommu-cells = <1>;

---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260611-glymur-pcie-smmu-espi-d8a495bd7965

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


