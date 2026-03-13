Return-Path: <linux-arm-msm+bounces-97544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7ByBOawttGlnigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:30:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF4286051
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFA4931A6DC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0753AE1AB;
	Fri, 13 Mar 2026 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoxPXmVK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8drWDri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB90C3AD503
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415639; cv=none; b=ns21Lfpwon2C6vHE0Np6sqfrBSPwBeEZUCpJ0n3JjktFReJSn4ZW2aqtDj63DNdDCBOpU+YqcZwpsXyAYPCeUMnrAdOq0w5C85OYFTMLTvVr3cYkcX+iTlhz3lkCB61hvXYgj7PF50smMdUwGvIbNZ6iQOqgrmoW3+QixF/AKUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415639; c=relaxed/simple;
	bh=VvqzFPeDvNeL4Q4DRfW1+AOrn9S/Ny7F6jrg3xBzrRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CbmPbnxX+xRF+8owvUfw7pGDg8ICKspl3dzBU+pPBr4/mANJMYEYUj0/mpgdXZ54VBdzyACZjGkJt9M6izawnCp3n76UE4oT4qgNeH8QlJhJAqNqtcByzhi2rLS6nPVq+sSei6Vrjj3SU3ovJRG22fzlqaa2OoFUkdlW22YrrmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoxPXmVK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8drWDri; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCqZO23342938
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oP5F3x/fQ3WYPiG4fUZkJ8KJ1VdAsx8QhWNEVmgIrss=; b=OoxPXmVKq16ZYlkF
	7D8mQ6olHsQkx7Qbf4xT825rZByzo3AlGw1qyBzAqwEVyPlKA/eqtWrtEwbqGZPp
	CabLl9XnGQ4bxdDQ1GVf7huNW5/EYrBEzHR9p9BiKO1SsywYuR1r9na9iEsVvPOj
	Mtxo7vu6Rux7YNC+ZOAHPjjTv/CpZ2O2ZwcCp4TO0xG6k1yXtJhNWX/qTMu99T8E
	aam0aeQNiTa3d8hG8VpQ65dAkh/86eFULvbknrXxEQxHVTAbTFHGbOXY/16sKQl4
	JkpXLAoD/ZnABKyXiSIC08WXUa9IMuWxxigq5xfm7nbqS6pwEozNip5jTDg4iQSL
	F1ueEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w5ddv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:27:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd77bc8186so2107415485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773415636; x=1774020436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oP5F3x/fQ3WYPiG4fUZkJ8KJ1VdAsx8QhWNEVmgIrss=;
        b=W8drWDri92soHGbafJWP/pbV0zcGPEhsC+nSLxkS5nnfy9L3zWNG9w6iIh7RVOHQiO
         2KmlDv7RUdIWR6ydGzqKN889sNlng2VaSLZC0cev3D4HZ3xYoJaEbXXb8QT2PwNnw/we
         WFpQ4lXOGTSckncl4BRloh10VPKI6yQ7KZxi+lewKGrkwQUIgB0763xlsW5tbfhPBema
         yfRjhGVohi88DCqtmSIuj0eNoj3t7ixsC0B6jTq6Yo3QB0DKUrXHmE9bkAxdAWYTpk4L
         I7h5/58I1hjnZq7ZRDwe2AIdW2WilN+uE9HQUeuI071gHPCZ8zwYRHl2qmafHibBX2qm
         jX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415636; x=1774020436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oP5F3x/fQ3WYPiG4fUZkJ8KJ1VdAsx8QhWNEVmgIrss=;
        b=Z3Cwi8n0euzIcS7ukv0wUeMRu5W4ZYD2RUfrPYpHFIDiQedxjKwTYjCsQjXovM83Kd
         3zWhqxtreInWGM4yGNb846pYlZdWl023C2iPswmbgL2sTWYTHUg92aZ0Hfj8L7I/nFOv
         YAhLRopbG4nEJbONdtd9URwFIJnSf3bdPUidl9bxwxTp0kqlZlkplCGIubLFHpH7BvzL
         Pb2sc3y4SD5kyeU24lNRRRHQ1qEgyafdhoKKJDudcKbt0eAPJn6xBFiiCTqJG4ZddGup
         lZxnbUZlBiYA33vFR6EwcOZhD3yoI+zrktVsiFM4fay1sAgwBmYwpAHnal6UMN9NPZr0
         ouHw==
X-Forwarded-Encrypted: i=1; AJvYcCX+pmh4IERYt6dGlGCiBDwg5hZDBjmFU4DuRQFab1Brywtco+VSIORBYdINUnPDBayvdEQPcKPnKAG/cYjp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0BId3EQaEUe+evHb13L7+xG6Xr+25TAYiH5JbAOumk4UbSefP
	UjEUINW32GHj/Cf6cBWkrQE3ByYVO5TDbAaycwaV0eKwmKoqcgrNA9JqnNkwMHeVixjk3VfVqkH
	eOh2R6VyQEfPultVVYr8QjPEMBH/uQX7a7n34kUK8K4THZYwcE8FwX1rVNUC4vWVWcjdv
X-Gm-Gg: ATEYQzyU0lsb4pd8b3MTq2Q2QIOu8EyxSEP54WD5F567koZPulQBqWPY2ZzyormxCui
	tuxthk8bXg/nQyKqkBvEMTi5EQJCdWGDxENlQkGsMTvMNSR+ANxlFtpBYI8/BVlPRrOEPLXPcM/
	ZpLOwi/8bEhmcpmKwRtD1Q8vgQ8svjhXlxtMqq78tJy8kKt48Fny1czm/IxUUjbXgM3konlbKDv
	DyIePfLMTmVFqyFScc36h5+q7psUkmJJ6nz9N5iq4XbbgEiGRA6UMDARGfXJ8FZSoEL/cy+EjOy
	gMhKur6TxqcBV/AReUMVojI78BpmecemDRJ0YbjjHJTuLJ6mgxry/H4k7RO7IdBzFTk3KvB4Ygl
	Ma6v4d/4+3rOpK3Zc+/Noz+tJwiscqdsLRvulJjP5ph/5ItmbBwgPpA98xZfobFK94v7sYYjM8r
	RThuiL2S+7aZT/wHp5u2deHEsmpOshWJWnTpA=
X-Received: by 2002:a05:620a:6910:b0:8cd:8ddd:2699 with SMTP id af79cd13be357-8cdb5a60479mr519679185a.24.1773415636023;
        Fri, 13 Mar 2026 08:27:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:8cd:8ddd:2699 with SMTP id af79cd13be357-8cdb5a60479mr519674685a.24.1773415635581;
        Fri, 13 Mar 2026 08:27:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c0asm1603328e87.18.2026.03.13.08.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:27:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:27:08 +0200
Subject: [PATCH 1/6] arm64: dts: qcom: hamoa: correct Iris corners for the
 MXC rail
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-fix-corners-v1-1-32a393c25dda@oss.qualcomm.com>
References: <20260313-iris-fix-corners-v1-0-32a393c25dda@oss.qualcomm.com>
In-Reply-To: <20260313-iris-fix-corners-v1-0-32a393c25dda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VvqzFPeDvNeL4Q4DRfW1+AOrn9S/Ny7F6jrg3xBzrRI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptCzPpjuFqY9EDH44oCBv9jtT85/xrzWJ0wo3y
 obtllDwPGaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabQszwAKCRCLPIo+Aiko
 1RbjB/42NWDNBCOrWt25J0NFGaGARkzsWgImg7nDaVBl7ayPcQilmjqo3fLOh0ZOmuX7p5YNl6X
 YXaoXhjd/I8Py2LmImzUG7xHJUAxHu+fPMAYRSLang9bhIivQWakyMkZ+6KzNRbWDd5/pukDgen
 J897T7lzMpHtrFu5/lqF1G63zP/u7s/Kme3y+HLs/XkU5+/gOeyZBVxFkikrdzwSbUJnKoxWkK7
 xqF4FebAmYEzPJvAHEEQ/717DedIjBCo5IdJUxKhrB6HIB4HaiCxyRG0leYcLYmRSgR6z4b1d+V
 9YZcXtF13qSThNXi3W7aR6u5C0MYRmyfNb9zCGgSsxROuMGr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: G4vo_tWxOoFN0E1Lg0N40HcXnPICep69
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b42cd4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=UouAheEfswbHdU7NjTAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyMiBTYWx0ZWRfX41YyVEIh4n6g
 hAlaXKKOKp4qZcs3KPikQxD2aMYQULOmI17UITI6LBbNszTCBJZZq0RVY2O/U/I1Zp9xscOP/tN
 or0VAtF4kLng16dZjC/xsYCjQFQyy3/sMdJFhDgmx+2yeALhFBVRFMQ5t8q9GuboyBoHvliO8fL
 LBzP+UaEo36Q/EO6zWt4xR1jwyfOInOO8J8kahTAv7aqPFXdvhribQmE5ruT9COu1vtaeNezq++
 Io+8rKlofeBUYYYDo9tebSNLT+lbpJb0EllOmp/heoB0BtVGhG6QRGV4cSia7YfOigJlxxGu+K9
 FB6UuUKSFuF1EQAJrATIErtSy8WY4aEJ/z9c+3ENybvPs3XSyGZDbvw6WEqi0HMSx1G5qdqtrlk
 SaLU7wzClZW1wzpEDu+61C38WnWVwPJyi9vZU/Wz802KIWP7L2VPyQ7/1EqSZmAM8XjuOLzBHPn
 keD6fMpR45uvpQHBnPA==
X-Proofpoint-ORIG-GUID: G4vo_tWxOoFN0E1Lg0N40HcXnPICep69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-97544-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3AFF4286051
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The corners of the MVS0 / MVS0C clocks on the MMCX rail don't always
match the PLL corners on the MXC rail. Correct the performance corners
for the MXC rail following the PLL documentation.

Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index d7596ccf63b9..0866e9e2874d 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5432,19 +5432,19 @@ opp-338000000 {
 
 				opp-366000000 {
 					opp-hz = /bits/ 64 <366000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>,
+					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-444000000 {
 					opp-hz = /bits/ 64 <444000000>;
-					required-opps = <&rpmhpd_opp_nom>,
+					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_nom>;
 				};
 
 				opp-481000000 {
 					opp-hz = /bits/ 64 <481000000>;
-					required-opps = <&rpmhpd_opp_turbo>,
+					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_turbo>;
 				};
 			};

-- 
2.47.3


