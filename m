Return-Path: <linux-arm-msm+bounces-99073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EsXXK6iUwGmxIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:17:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C9D2EB5E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 874AF3007AC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 01:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148151A0B15;
	Mon, 23 Mar 2026 01:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Np0JdmM5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EvxfoJwU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE07954768
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228646; cv=none; b=jFeA+uwYZVFQEyXCJOVJy6owGBH4YBKpSPPV2wS2Dn7vJ3UfFZbpsjzgxMmVJ8hTlR/Lep7uAeXVw+ZTg6Rq7igq3x/YllYvZFY8KEZEKZZPOPewnfLYEd+AprwtmpmmEF6MameO3EaKRXXr43ThR4Y6/1IX/fGlpSDIT2nHmuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228646; c=relaxed/simple;
	bh=nooIqcP1KZppGTp7stNNhr5DaRnd3a7QK5NHg3OEPJo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q764C2oOIUh98VRbEP3sFDGXGYowb6NBr/5gBxJ5H12P0yOtfNuVV6necUBYPxgYonNkhH2VYKilkH6Lr2QfvHanB0l7bXgvbI4kSVlSaDFNDvsVSbjGr0PcTyxloIM6V5MofMELDhtVzpo820ZwImS/8Jnydjx12wWyIAF3NlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Np0JdmM5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EvxfoJwU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLpraD1301211
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FbXvEP3nYVrkLWj+0fdWcG
	adpdPA4IA0DWc0/CaJGxE=; b=Np0JdmM5gxcAwhi964SCGyuoFNLYbQ8uiU3JDL
	Ep++3ZL9RRfVzJZz/tCAwr0jkrWcYpTupp+RCCp7kRbkASV7psWtsFA35Lp9QoyY
	HQ+VCDG2wK/bjwCCeHXLa0kZtQJrEzlKvvFmxtXHb1y5eGRSYaRRlnPoZqVCQQZz
	9R2b/AoUX7uxNg5hdDG/7NhcY+zhjvIVH4kLswp5jipO6FVteKzug2wWfRdWTqGM
	Khu/uX+Ly0d1DbholO23sEmFJRl/o3jY9Yxv51eTpv8Du5wEnB+a2qT00vb07Shz
	XcCfnWTrp5MCeTbaWS1KHAEAjXBLaz09qSQednA+Ep1vOk4Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghb4ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso33028491cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228643; x=1774833443; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FbXvEP3nYVrkLWj+0fdWcGadpdPA4IA0DWc0/CaJGxE=;
        b=EvxfoJwULJSO0tfN3u2KPb/TiRSne9DbN0RyIBv/CsAAPCxAvv3T15XeyDQrX9AsWW
         18umbSkgW2Dybccn70L2F5e/OZkMjRoULXkbiX4CEQYyQBr5MW7mWIbwdQizQ0LS/E6r
         UU0kZhI2sdc6szolV6Qb2psnnnMq9VJe1ucbp+2U/kW6zlJBEC1R/+CQ2J59oGZe2Er0
         vcmhYDnuzweiizjbDM9/FwSMvjZP/54bfeDEJL54ulX1k3PAvPD3vkCC4ABbbuC8bEYP
         lCoAunnEBC1fGwPvSqCcowWfMAmrJz9duGYnBQz6AiDo1gT7P09SCyJquXpupMFOReXP
         k/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228643; x=1774833443;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbXvEP3nYVrkLWj+0fdWcGadpdPA4IA0DWc0/CaJGxE=;
        b=AKqAiOjoU13U1wAk00W1bRzRGtrN/5hUeN4wkXnoRxtBxw3IEz3lGcdsL138bG4phk
         kdgrs9I0V1KTQTZ8/+LzKu25594KaBZTDsHYCLAPhAHQdPQ7eiv2zqdfyb7+bO+rpeAc
         iern1ZQ4R+xgMX49+udloV7HglaMDp/zZKbIueKG3FLyiRCMOefDSkncPuikBYauk0VL
         lsDF/0bRlP5XMH0Z3x1vpuX4aCt9UoQabWXjlKaScYnQyECE6Updm4hDq2li1ot3PJEH
         aat3XcDuBUEPVJaD8euQyNUH28ynNRA+YjPkapiB5zMj6b+pAlKDjl3nVp0sY//AtQuz
         C2ig==
X-Gm-Message-State: AOJu0Yz5IVEu/EToO2zWXGnSQL4VujGkOcLwFoDCMD8UuZqXyFKdvXoK
	AWqzMHyIkZ4c4qvR93Z/YEmKBhqX3n+fim1qz79V7tlKEFSWr1rqKTHh2ZaN5DGVXTw21D+FUMU
	8LuR1WIHc9xZ8qt+F3MPVNztcXnrIRtBJJ8FSuopdlXkjDQpAMwyyeX/iwfXPfRnos7/I
X-Gm-Gg: ATEYQzwaeMiHMJ9zGzWNXs7oiGsXkNct2rKaup+ApFiWWECUPugqS3W9Zet+7VJbfwl
	lkV4QsvWhy0oHL84O+U5dhAfvVf13NumcXsQ7LZWA9007UGH5jAY8jBkkr1neU38R79CaQsbbyg
	OhA6cqIxmpAXxxDFHMhWosxlZaoZAS7cnsgrNsj9x+6BnOgv5uOJlZ8CJNaeCMeBBSgtUjlFFmn
	CKIzmp7DZ/64HtQr9fFTiQMcc4O4slXINo4lvscyXU0p9oAxZ/5IkRdTZlCCf6uE0o4u1pJwL+S
	+rekVaFWnHuBdu7UPdHWASm7xUaovs8+o0WCxLL56OHLEPa68UrDB2/6qNtrN8vuI1rf3RN9xwx
	V5pvE+mWJKDc1Q20QKx9uhIAGGqvxsNhIrOjMiISdmmOInwFGs5Zg4f7d2LMWOghGW/ZebOHlxB
	+5jSxVIZTFP1wNG9w9B3fQfjVGCSpHMzB4aOc=
X-Received: by 2002:ac8:5745:0:b0:50b:40a6:29b5 with SMTP id d75a77b69052e-50b40a62ae6mr149085471cf.42.1774228643083;
        Sun, 22 Mar 2026 18:17:23 -0700 (PDT)
X-Received: by 2002:ac8:5745:0:b0:50b:40a6:29b5 with SMTP id d75a77b69052e-50b40a62ae6mr149085101cf.42.1774228642472;
        Sun, 22 Mar 2026 18:17:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853050e7sm2216150e87.61.2026.03.22.18.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:17:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/9] interconnect: qcom: let MSM8974 interconnect work
 again
Date: Mon, 23 Mar 2026 03:17:16 +0200
Message-Id: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJyUwGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMj3dziXAtLcxPdzORkXYPEZJNkI4tUQ2PLRCWgjoKi1LTMCrBp0bG
 1tQDt+yopXQAAAA==
X-Change-ID: 20260322-msm8974-icc-0ac4c28e139a
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nooIqcP1KZppGTp7stNNhr5DaRnd3a7QK5NHg3OEPJo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJSePZCmbogNPffCLDsq42MUZ00v/ISv+zfOH
 m4Mx4wGGmiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCUngAKCRCLPIo+Aiko
 1UPUB/0Rq2hu5cvPMVq3jkrjU86m10XlmEzDN7e90QlTBgpcXed+w70eEa2m6L1k9v0kQldVo3I
 k1RX9RweiRbaYG/nGetblxpKOWSD8QK/7J4Sww6D2EUozmkycmfgzYYhxAMfXMZ3NwcCkIwuMbV
 VpT2s2ROhgAP4b5RiEKfjaHWMCFyAWF2VB0Jmjq5VLAlP8IR72XwI1UF16MoG6NNNpeWSMJ/hjG
 2f45eibc+pY5pethZ13wpGQ+3zIvOuWr/UI+zM+nnbnRfX0vlX3mg/nLelq0NwKBbFWpIvo25nZ
 USxsLuIQjXj2yM/d219ZpQvu6VGWJn3oUqzQB7I0IhHCFzOh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c094a4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UYl0gxALbNRs-l06lEwA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: SXC8cIt_nJsOgYYqSK_WQnVhNsPIy1Td
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfX73avdLPgQTDk
 PwGsLbYnaqIepWlYdbf673j5BKFyS163lHiMRhKLwrgdMV2W7wY+aSkgdVwmkDRa6wfWIGzpBPm
 FWc48/2uKIdWVDdS5ZdhNHDg4rvZonsBNRzCjZHimG0so1CoD/ekgD+xhfuoJVict6+9H4CSLCv
 gQnxteMYgrvNp8InuxjZcQyMKLmZscIwn1KrJIfzpl8Jiafm7zC5/LeJEfIDhv9A9CYg9tMhVkb
 P2kyk2D1UFke23J62/6vP40QlRgrLgXEgNNTeVSbl25ZGXSOL5fmv020aGOFOEf4yGbUKD/FZ27
 TNQD3IT2gnP4eAcKskO7PJ2lFscS1DwmtTIbOR2ebZkVyzKDDETNt/I8tSuf5QcbabbosN3KASA
 Gzy2hxWh2AloeQoVumwyIpgSLibgfhygYZYsGfiIrGSDKlL7HZuXRjTmEXNqnWKwfQe0/6ZZgXs
 qY9oY/ZhMPxmQ9KHbSA==
X-Proofpoint-GUID: SXC8cIt_nJsOgYYqSK_WQnVhNsPIy1Td
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230008
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99073-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00C9D2EB5E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus
clocks") moved control over several RPM resources from the clk-smd-rpm
driver to the icc-rpm.c interconnect helpers. Most of the platforms were
fixed before that commit or shortly after. However the MSM8974 was left
as a foster child in broken state. Fix the loose ends and reenable
interconnects on that platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (9):
      dt-bindings: interconnect: qcom,msm8974: drop bus clocks
      dt-bindings: interconnect: qcom,msm8974: use qcom,rpm-common
      interconnect: qcom: drop unused is_on flag
      interconnect: qcom: icc-rpm: allow overwriting get_bw callback
      interconnect: qcom: define OCMEM bus resource
      interconnect: qcom: let platforms declare their bugginess
      interconnect: qcom: msm8974: switch to the main icc-rpm driver
      interconnect: qcom: msm8974: expand DEFINE_QNODE macros
      ARM: dts: qcom: msm8974: Drop RPM bus clocks

 .../bindings/interconnect/qcom,msm8974.yaml        |   28 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   21 +-
 drivers/interconnect/qcom/icc-rpm-clocks.c         |    6 +
 drivers/interconnect/qcom/icc-rpm.c                |   18 +-
 drivers/interconnect/qcom/icc-rpm.h                |    7 +-
 drivers/interconnect/qcom/msm8974.c                | 1637 +++++++++++++++-----
 6 files changed, 1274 insertions(+), 443 deletions(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260322-msm8974-icc-0ac4c28e139a

Best regards,
-- 
With best wishes
Dmitry


