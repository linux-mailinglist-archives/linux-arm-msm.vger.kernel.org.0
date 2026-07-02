Return-Path: <linux-arm-msm+bounces-116114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PABNDqexRmoYbwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:44:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B026FC3FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:44:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DjY6VnkY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="T56/P66L";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116114-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116114-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C21A30089A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE2336167B;
	Thu,  2 Jul 2026 18:44:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DE63093A6
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:44:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017891; cv=none; b=e4yf/KuXtt61fDToDIPtX00KL8X4jkbmtwATfyfAjZAztNF+seaMLYe43aAeQQAobCqKaS+3P4nwXDtWCEtZW0ia+bOruE0H6ITstOyEC8YzhJ3gL2JXXNMiBzc6AL5UB6KIX12TmOrmAKUAMUWxXY4Ay0HlEmpIJaPOetk1LaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017891; c=relaxed/simple;
	bh=2tsxkNR9F5pO8FNQFuKchWU6sLm5NFEmOJkyNUp1pj4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ju1TYymZN+6pVJGiIYVyqBoKEUK/OjO+yUzgGCuD2iJZQH7WbKg5uTHGSHlTNvp5mZSVSfNOgSMADj4eXDcraJyo9XYWDt7IFxeF1vUR8LglkAmRYDS9NsKhDPE6nncYDdRBcNUGiT4wIRzaaSw2PAF7kt1zXtQzK/SAh2pgqQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjY6VnkY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T56/P66L; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3XB9672747
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6MDHD8hwteVhhiUjTnaS29ZW7oOdQOR/atW
	tDXjukkY=; b=DjY6VnkY3vN9Rul4q0vxLmpCwl/4E4/Ffx0rtpYi4rPZ+QoS5ji
	7ookkELsSSAntvh2O/l0yN4FRQmT0KP9KU33neKsadlTRRmRs+Lb0lh7tIg2ReLC
	IeDEGluhrZcEIZc6l+VPYR+FdB7FLGUwBigWg0Hby+tLe5UI2TKiJIXQIDqRX+yT
	sodXKzzhIfz2LjMx57Vmp3OWvYKdOk22CMFzCZRCRWzB5ZyfSnkDeipIMwvhao+q
	IdjI/frr/wetrJv+QYyphjbniNTxG1ZjAJ9sAKMCAg5Xl2Lo+EMLNcTwAssdEN49
	By5k/h1tTyNZ/jEaaiBql8zcZIvq0wyU2Jg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7nbdnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:44:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c98a4ded1d7so1463271a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017889; x=1783622689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6MDHD8hwteVhhiUjTnaS29ZW7oOdQOR/atWtDXjukkY=;
        b=T56/P66LxVtfz7OcYe7KcrrPG2B1cU7GjdJRMG3FRs+M3d1rNe1xnTNSaacU5tjFhQ
         xeesg+HdlDMcfRuZEXq2SRSJMd27IGH80BV9wVdweaLGfo2XacUxUbLeJ3HFyBIibVvS
         LbL0vIqhJd00VSfad/SDDHxuhSYT7VG4QKdDaYxqAx8uOpDNfIDRmER4SCzS/Fb6FgcF
         GcSLqn4oASb7kKyLT8nbsFHyIqD4JjpytNXqEG3r/3iAia8W85UZ6PIvTwrKNUq6hEIF
         /jvkc1+UNkXWG7Az7qBg8KavGaSfhxyBsOUlWV2N33fZAttC0GF9Tv0xl8ClwRQqvobH
         6XLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017889; x=1783622689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MDHD8hwteVhhiUjTnaS29ZW7oOdQOR/atWtDXjukkY=;
        b=EtOlb4Ta13Pl7a5gX+xNiHC7ddQVIzJPVQLkh+3vyyvnnuOdKRHAaoltH53YVlZYSl
         E0YDxIsMvT1VJaW/ZUqJtx8cw/ett9Tsssp7YiM6t7V8Xfp3jwOMOuo08WJfnF55KAlh
         GbgDjD7PQbM6swKl4kAAw1479yIzzN1C1UWhd1LV9IuAcep+Jday63CRfHqev+m536fw
         dxrmzfrYaYVEKLzZfZGf7SPyOrsu3cDJTa9waQw/7pptLhxg0uL15EZE14w9EZN8v8MX
         w4XwDQ1tcBEl4tXIDwcwmxv1FKuZ8ywP6zQ/qlevyRbv5nWdjgMIGotfp06Vzps1wAD0
         Cqfw==
X-Gm-Message-State: AOJu0YzQc+zzAcrDSl7ViD+3f3jprPbfQxR4XdRE1wk1jkaMvdqyZZs3
	jJle8sL+7XSNvkFhnr3vrv9flUZW3KQtrAwPjnmnH6vnSVLwTqnVSnGmodqpTMx7aesqjStAmkv
	mf2k6zqq6ys01eRPmhZtLLxLBk3zcl62z3hgXAPAGwrM9o+aV4RO967cne0oDnI3CO223
X-Gm-Gg: AfdE7cl7br9Q+PQyrBGhzpcX+dUWC9MGpsz+EeOZJYj1Nao3mmPGuMV3NPtSFJDwwsN
	HssgTKJKdEpnjIYGOVwOP9yMxVZ9Yeyl3PANdVJ5iAr4XPO9iXqogJLjU5AG4cJhT6B/NiQ44OO
	ly+QueKvCrVX+Tf3WjqcfjnSs6PHXfacF5MEC/JVkjB6pwOWKZ3XPjSmUqs8I6uvqyephb2NSov
	h5nGBOAUEftSZOdeKFsxHLcCMGfnkP3YTd1nJLjNbrq566BrFNtoNAG8Gq01KcBNCual+L7jCxr
	8+W/jZAcmPfMdvQ7WfgMdD+hYQNoO4UEV1OmIm1EGIWfvULp0wfwss/FKQL+WLSv9eXp9P+RlL1
	5FK2M9q0sjiDRguOoUB37O5w+ZnriiL2Eobng17UGXpDxQtHTn/MLSelxEvUaA9wz7MbZeggJua
	Icqent
X-Received: by 2002:a05:6a21:e0a6:b0:3b2:86cb:929e with SMTP id adf61e73a8af0-3bfed41d914mr8071403637.46.1783017889051;
        Thu, 02 Jul 2026 11:44:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:e0a6:b0:3b2:86cb:929e with SMTP id adf61e73a8af0-3bfed41d914mr8071376637.46.1783017888569;
        Thu, 02 Jul 2026 11:44:48 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa33asm12367052c88.5.2026.07.02.11.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:44:47 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: kaanapali: Add missing properties to usb controller
Date: Fri,  3 Jul 2026 00:14:40 +0530
Message-Id: <20260702184440.442037-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NyBTYWx0ZWRfXymWRe1rWCtQk
 vdnK21QJYQU6TBvq8CIpIT5VeXv3yeNB8b+AkRklvZuKyGewK8mVEJj3urB0IXlexkcenCrWQW/
 buWFqnXqD6fFDOL43/v1UoE6/UJcFR7NY1HqYLjBUIcuhF/OifMeG6twAjIQxOgYKeuU+u7P31N
 PKnXjUw7rEH8k4hcbHoVikS1h8infiFFkMkoenUknmvIOZKUlr9yxxvmVPrS9q+q8tWxfj7GesZ
 eeHALvz0B1tpdXozm2lYZsOW0AdkjaSUT4sR7VVYKvb6J5I9C6u65weryMRriEWB5vAReJye8a2
 LpG3ieFCaUdQRv57yYjSKa502K+B7tJ2DhQ1dZ3vBhpU8cy+6dA38Ya9Eiz5T4mhGDBQuBzuPK0
 AuRfq8i5npVBn0foY4g640wqQ/IIKRq5xXg1qQEqgssmAUbpmA1iupNMwHHpJXrkPh02Vu3aJNw
 wQ3vtUiWW7TgNRGvB8w==
X-Proofpoint-ORIG-GUID: Ia6_lqITjjh1cLCiEHVpEG7Q3RUYNvsr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NyBTYWx0ZWRfXx5mxITVl/x9V
 4tYEbN9bAeaJV9ZrAgGBUFWgctwk2ZdwIWDQKIedCXMi3Q7uuRKg4h2QL5AoXVTpm1Qq8mYGAjx
 l/JqIT8PYYZO5yU4DxUNDCCMfxTOt1g=
X-Proofpoint-GUID: Ia6_lqITjjh1cLCiEHVpEG7Q3RUYNvsr
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a46b1a1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=4FngYTFquQ6D0yzj2koA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020197
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116114-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1B026FC3FE

USB controller on Kaanapali SoC is capable of switching role betwen device
and host and also is a wakeup capable device. Add usb-role-switch and
wakeup-source properties to the controller node accordingly.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..c88c5745dcc1 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3557,6 +3557,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			dma-coherent;
 
+			usb-role-switch;
+			wakeup-source;
+
 			status = "disabled";
 
 			ports {
-- 
2.34.1


