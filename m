Return-Path: <linux-arm-msm+bounces-99958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKa6LVNjxGmBywQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:36:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E732D140
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30946300567A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842C1372B51;
	Wed, 25 Mar 2026 22:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5IJN+9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKtUPv/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE21637104E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478105; cv=none; b=KoflHx3QOOPp75H1NSoU5731fDuFx8Srfy2NFs/oeFVjSlyZO6zIqrBe77eGzonINp8nx1FjkdrXmqTyiX7zkEvWTHQ7O0+ul7dnUD37J7WjR8YulxBniPMgjxaewYk2fdFb5vQ+jx77jtmyGG/FJkQ9sl11NdXXRMrRHIusy1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478105; c=relaxed/simple;
	bh=6/vfd3lXwM2YKzs0718Te0c9REDR3N7Ps5VQj/TGXDs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nsleW8UZVYBbxqTjUzy4UAOL1jRbrrgEwSgHg2GX8VCYk01GI0fnyE616qsjJAUR5G/w6daPuzmW/N3Do6ZheJPqRav1UNLw8OQ1vt9Ziz26iT0RMoKZpPNYiouHT6eXfmnavxprgDns+rL1e4hbFASK7sav9JXVhFCWCqB72WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5IJN+9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKtUPv/N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PMI2NT3069807
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z4nLBjlgqed/59ynt2cvrT
	0ZDaT2xiy+EoqtN2N0XQ0=; b=O5IJN+9I3+b8JibgqIRTqkbqnaFFFtwetGT2pA
	WOTkVKUZwPfBgB3JAgF4MwKW2YumQg5TjRpTZNQ7LWZkbeNiMGJVSWwHDHyFxBK+
	ipdfH0ALnXeabHXBPE655zQ+skAWDRRTX2QryN/sMbHwhs3Hv7WWfN9wsaM9icYc
	VBUPOaq2GHv/zCaAjuXq4dr6eJS5a59YoSIRdxrUsDz8F7Xd5C+dHFWeA/VZbiqQ
	2Ctt52lQR/john+kWg3wekbBnPtS/AzgPF1JqvNilrQrMkfjugZySurMOLQeX9iP
	NiLY/efkLF1DpAnAPTX2gmDQbDKDtS/Gae9A/aekszU9Dh9Q==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn01ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:35:01 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-467ec73eec1so624172b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478100; x=1775082900; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4nLBjlgqed/59ynt2cvrT0ZDaT2xiy+EoqtN2N0XQ0=;
        b=fKtUPv/N9j2e9O4wHLdIXjptx+k/BxORygWSR1+R5SA4MNMgTFAmFOJXkHTjriT5LP
         IpPdToLElMgAGJiwB1tbxBpDqwnYwn8/17AUixKfM1QDQxomgW9O/E9IhJNouBTL9Zvv
         OjE4HLZylyMfKl6bAr0DjJP3yKOA6gCf+ExIgAoe8zhjQzOs48IP6ait+VUDD8X5wI4L
         gmhfh0awUgnUkbMJf1nyhuVxYl0ZtCETFU3Km7S+09K1Q998awiik+mjOBd27YredfsK
         aYAZNsMst2tRk7ZHhsmGfHAp69Db8SD3OYcNe0qs7V1e9V79yCh/2UenCnPCuvDZqPO1
         vEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478100; x=1775082900;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4nLBjlgqed/59ynt2cvrT0ZDaT2xiy+EoqtN2N0XQ0=;
        b=aekoxFVGOUEowZ4iaI3ZLj4Rgbxl0mPq4Hh7OwO5edx/IhoZIqlDNoFO0+DP+XTICF
         k97hjvJCxTP/AJVt2eZgq10yWCk7FnHOJAflKxWsK2HL+sd13CFSuoSHdJJefLNeppKW
         nP4fANa5FfQIV7Hdvu+7pGQLZOfevK1uwNkfl4QeGOSwNNNfVFo+62jEg1p8jsUUV+cw
         VG6UFO7CctFyvwUjU4pLEHzO2QkqYu61nNvJpaYdJqP0qH7T9XW5PkYRz1wpwDdpivSv
         FyrlpRBjD39CJTNFd64c9fA2xXktY/Ejz2Vafn6bmuUks8GH1wwl3R9mksF6+FNOLAFM
         Yoig==
X-Gm-Message-State: AOJu0YxV+YehujtPZ5k+fN5nn5D2MPCadXgCSGn5PHWRfBq1OIoj/OCX
	5Wp9B9vI5KErw2wvn1NNsv3fhvt2DZCVGmotL0kYruAsyFW7yWG7jZEMeev0LlX8GKi1bD5JhBK
	It9urJPp2DHM0/RnaqdrDiB8FY0cfDg/Dh3NdDFS52MzcVk541y1Rn7KP72u/YRA3n2YFsS8+n+
	3i
X-Gm-Gg: ATEYQzxkvzn04ojRWx7x6T6e2kYwgZf5RdVXmCJZ8V+Tt68RrP9EB5BfKsflRrmtup2
	0F7ocoAdWBeSjtD133SAzRCDDSYvK3Ypb8L+bvWtu4Nl5o79Q5tcgOtStBn+P6OFPAu+bLEaMrs
	etkhTlOkUoB+ybf4pKn4Le/RGN4XtGtkykeVzLzOP21s7/x30dP5W2S1zgLDRv2FMxuFnbEtzYE
	qxGzX90KrglgWaefzdpP9u9axdCuZ+QLNLMAL6wAB+oHbKp4usGBeH8MUqBK1dYGT7Kw6XyCArH
	cw7tCC1c5EpRu5gqtJbqjwoz+5o+YiPKjDqhUYx08k2IqFSbTTiZ7kLEqvV30/h9k3baCa3p+ga
	P4PyXEWpzn598jFhm+sKxNHrp9ZpzATXndMSs02ui5Ao=
X-Received: by 2002:a05:6808:1409:b0:467:100d:22c9 with SMTP id 5614622812f47-46a5c61022bmr2112935b6e.19.1774478100569;
        Wed, 25 Mar 2026 15:35:00 -0700 (PDT)
X-Received: by 2002:a05:6808:1409:b0:467:100d:22c9 with SMTP id 5614622812f47-46a5c61022bmr2112926b6e.19.1774478100113;
        Wed, 25 Mar 2026 15:35:00 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46a70634941sm565790b6e.3.2026.03.25.15.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:34:59 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
Date: Wed, 25 Mar 2026 17:34:47 -0500
Message-Id: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAdjxGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0NDIDc1MTk1r6QoVdfSwMQiySI5yTzJMk0JqKGgKDUtswJsWHRsbS0
 ADw4z+VwAAAA=
X-Change-ID: 20260311-ideacentre-9048b8cb7b9f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=777;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=6/vfd3lXwM2YKzs0718Te0c9REDR3N7Ps5VQj/TGXDs=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpxGMS+Gnq8jTfBEUehPIGqzXHvCkZAryiEtZ0H
 l3wI38DjZOJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacRjEhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVHPw/+JT9pNlPHAxutopYBRMElKa2zf1iWhN9qxpiJRtC
 So538S+vofujE6D2OkrFV/Gz7l5387dWI1ngq+pz6kot8e79P6Lu+vB4lo+cG/IfeM9MbGdPuC+
 V710YbWYMU4y6VSNSMhc4Lax4PRrB/axXOHwbgQ0dIrbiAvyPHoJz5bajuK13wIRJopdVTlJxRo
 lVMeqvvPFQV+EF0btle5jniaOHmJQSteU19z/MHO/3gGlpcZimDVMekDaJOHWJvcAvm3rk7Zn/3
 PKgHNj5xiARarDgRjCuDeWDZdOB6ALCqrzJSWhjHitfr92FNwXuWJw8wyVcP+0zdNzab2qhp81j
 wtuOe/tcZOGpy6YGl74jG6xPita25dLqXojj/6jrLJKMvcy/RFmrWP88pr5GOb87J55CKIpS+M+
 Nk8/uScKXWHg15FHLgLFVhr4uekYBFX6yZBu9klkIYL/fY7vOHNsnvY0nEwLkniLk5Pc1YuM1xh
 vZKyCvNNTmLwj+G7JDAK9IesVvsg1B63G2Gzw/lDRR5fLIHzqZcRrNK1YH/XfSJKnRvWyq7X/Ul
 EGnStWqaJ/ZbMtcUUFAbEZdbR5ooHlF9b/N2MGOgeFjI8+WvWXEkrdRRZ6fV5EeI9rNfh4sp4g3
 x7IztD7YI0O7tBqG/xe24nUP1oABHYC6IkmZOJzdDkUA=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c46315 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Eo5HmAVCleSnqplLZ4EA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: -FkOig6IHKLR4VBPHBXt-NvqYN8f38CQ
X-Proofpoint-GUID: -FkOig6IHKLR4VBPHBXt-NvqYN8f38CQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2NyBTYWx0ZWRfX8okinGrRVH7Z
 5xvXhZBloNExv4qq/ojNcslul+Q3214VutUxMIEY5bZVQ1X0mqhCblypzUEbpUeZXCGMYooorGU
 qz4unwhtXK78YyvAAWdfpriwpC+0+xhQ4TYqLmzrTE8gJza8GfGOqaW+uf1v8eWGW3pyVkFBBAG
 do7sPdDSDnCIcUGleh4kaGU+XXQn48WivqtF+mDVUKZ84F1SrNjd64dkA7QHPHIgWyDVOp5DF4W
 wZVMeBGDejXMo/Xgr1/ihxKn+nEC6SRh1sLiW77RYWF6NdAPZcitwI2y9F0kPtaldFgKtTGl/4R
 jk5eeoRWg8kwRC2xXJHCMKjrecXVD4F5Tge74wYDake5iPJwiIeQri1hrR5AiX4Q27uUGZ0PVEt
 YeVcp4KY1MPdNm5biOisMcZBnrbxuS7/eO0cd68qXq8xa69Ykaih1w7ue5F17vJcih9fahaIG0/
 IqeCQ5SWM0JY1uBefEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250167
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99958-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 310E732D140
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (3):
      dt-bindings: arm: qcom: Document the Lenovo IdeaCentre Mini X
      arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
      firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  | 1199 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1202 insertions(+)
---
base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
change-id: 20260311-ideacentre-9048b8cb7b9f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


