Return-Path: <linux-arm-msm+bounces-100190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFBHOTn4xWkjEwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 04:23:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEF233EC74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 04:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83B4230C74C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 03:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5D136BCFD;
	Fri, 27 Mar 2026 03:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtzG7c0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNm4a3OJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276AD36C5AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774581651; cv=none; b=lavGK2Wme8FCoApBeBDLnwpg1yx4hWIffljX6VwIyLpxxLpc+ln0/WMPrljLOf2mOS43tV+0sDsqZknzb/OQzkVVf035/+NULrn7HMHlMpBVd3oAr3QF+6FQu+t9hoEuSEJPveJttBJtjbDJAPMnUPE7+haJfBgri6Wm/jTDPIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774581651; c=relaxed/simple;
	bh=jnjzuVtelo8CXER0TM0K0RH4G54o831qlENc7Khgyfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gSn2sz+eEqUZbApMED5dPKoM2VMs0Mtnvmausbr+FUzSbnKC49uFGf20UcEzf5+NwWUW2dsIp3Ozoo4U91xfz5vEoon+U5welufsJz70qeYd7Jpg39mAIUCgPJNS/RVdhFgt9EpMfu2KLl57ZY9LPt9p5qg6ogfmcffkVAHPRf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtzG7c0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNm4a3OJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R1JX2T334195
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+1qADo6v2Md76J2yLTczcWIKgouJ7vkv4JBXiCOewo=; b=TtzG7c0bVVQvZtoe
	lyMWy0jdnyzfst7UGxk+/Xt0eRlejVjKMLcTOe+0JCQOdM2HdIYMTsVpJqk7sQbu
	ZX0dCUD555k/edaA7ZGrsuDzx5X/kegrofg7WcrFgsOhbb/b9ppnuSSMAhHg4CSd
	H3sRlb+HTDj+oTk7PkLV/cqP7bOcyPdnJtYMyreWX/RSEBTY3TcnenCowBpJplpK
	5319+WgNJl5E3kSNV7++x/YjWKhZJeDA/SrNa8xAPd8VEYimu5h5e8Zgf9DtPhM+
	yw8Y4QDj78BEhUKtNaGAQN16IhhU/PnTVuu5GdvF1PYL6iO6EeOFh3VA+Ds2mtqt
	ebMTlQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d527yubjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:20:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c174d40580so1551869eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 20:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774581648; x=1775186448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+1qADo6v2Md76J2yLTczcWIKgouJ7vkv4JBXiCOewo=;
        b=GNm4a3OJnBYa2MPtjFrTEQoNrrWELwrv0e5zVR0Pz536b6hfV5Np61W2CBo1BMLmyb
         HxVqFqq4G6VHlbt+aEsdMbXybshPBjbSyjl820cYWTSgIGchBJWhD6FQdzZn/hHUyqV3
         8BrO7DgwYo5UEWI8qlbA1WviQbk38LEMYabGybXZKw8cGpfhOuhSgxZRrnmbh+KJQxA2
         rzl7994vqajkV1j0ReBVgBpXcAa7UYb/TMU0SoIUAh1dmibgpUL6GDHPxgsIvV0u9Pa7
         ouW7wSDFUTnxjKQ/02+pQNtld2lKNVsONN33bp/VA5ciBLb6tnlEOTLTuv+VhaZ6y8yN
         nLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774581648; x=1775186448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C+1qADo6v2Md76J2yLTczcWIKgouJ7vkv4JBXiCOewo=;
        b=JGW4Km9/tnlPf9C1G7OGNO8AzOKB2rAY4NcVUKeW1HneglYY4tDS3LBwsJO71uJ2Yr
         tEbgNY3C0hYyzenOY0CBt6j07CYnaf2OhA+wM16cAmFpCZm9DVF+e7RUxtgb+7vk7kT5
         DHPqp6diByfNSUGmgCjX1HyXGrKYSLv+eIJN2mKhiM7W9kK/8iUSuWvV9Ti9bPHkH2zM
         4vMP+UQZ6VN9z3NmRfTw9yiVW+ozR+rUVt7LdDn5AGy9uqEnZmopY3ZCFk+FAK4d9SOj
         A18N86gDRE2baafgAopVR1B9RjUnPMmjzr8IjzObb1svuy/MhhW9BMkE70EccweJzkNF
         fv5w==
X-Forwarded-Encrypted: i=1; AJvYcCU6ZYGm7Kq1n2TufOuPCN7l5Yg+3q/0hjf+Ypuko1MCVrtSpI9lF8zX5cDWVrD64LGWS+aRPqdxteUIakap@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQc0IMqHeHH4Gsn9WuFVy9erHWiV5t1J1wqW2nbJKN8g0yU+H
	lmJLN+v532C8ED3Ey+Eyvg/oioXqZh8yjAU7c12arElOlZRFwdQdRCX/iydbilNOLh/mOtlHEP5
	oOVEVx51fbsc8yIo1R3OfV+sG5U2x31qNFkz6hzXDZxwL627PUoyjCb2sDoPozoLiGfn4
X-Gm-Gg: ATEYQzwvHcCRBMqoTO24hZ87b8ikO7Qcmbt/AzPbDrFrH2lv36medp9/IdRBsOBfUVd
	ptF78e3BvPEsEPnl9Rjxgv2zkDog7q65VISKg0c6NkUI+gQrzonkrK+iF/l0jMi2D6yurybFyZ0
	4a6oqhpRH6BmqnAuFYWxHcrxkzqDI9Rug+YkGIpruletRerhkC2ukgcbXUSjknJo1GdE5UwVmN0
	OQRB2+WucLkKg8uRLpcRevDdq+kP1FQO/MPM5ENa+SqIKhhUDRKycJ8oCws7VAhJbO48xGyLrX1
	MRT8lj9dHQvtLHLuY5TQpgoKa79aykt4x3yeOOVvbC8kNBDRcUHvjKu6mRgNRlJ/W1nDns3aku0
	PKdCmxF7tmn8lyvP/XAXJjcqvUhplpc9gE9YM3qN/01ZgFD07wm6xSp7wGjNUi9vYBn2DhG8b
X-Received: by 2002:a05:7022:4388:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12ab28f5463mr583345c88.28.1774581648235;
        Thu, 26 Mar 2026 20:20:48 -0700 (PDT)
X-Received: by 2002:a05:7022:4388:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12ab28f5463mr583321c88.28.1774581647715;
        Thu, 26 Mar 2026 20:20:47 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edde435sm4361337eec.25.2026.03.26.20.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 20:20:47 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 20:20:30 -0700
Subject: [PATCH 3/3] arm64: dts: qcom: kaanapali-mtp: Add SoCCP node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-knp-soccp-dt-v1-3-a60c2ae36e9b@oss.qualcomm.com>
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
In-Reply-To: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774581644; l=697;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=jnjzuVtelo8CXER0TM0K0RH4G54o831qlENc7Khgyfk=;
 b=JaMY4BtQlzEjsRR8lzM8GpD971fvGCLww7uSRsx1GQ9xwabiYwJFns6gxmepUXs6e6wURnXqF
 AsgxifALQRPAf/gH9zHJk48sjb5mHSATSMhjxnPoZvwaZVK/xjfVbkY
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=dLurWeZb c=1 sm=1 tr=0 ts=69c5f791 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cQaW13XGgu9xvPHtD3cA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: L0STBHCh5oPl0OEc1Mb_1K_WV-_eCIWh
X-Proofpoint-GUID: L0STBHCh5oPl0OEc1Mb_1K_WV-_eCIWh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAyNCBTYWx0ZWRfXwQMFcSyzRl2h
 Oa7LBG88Pi47BCviZP/P3fobNAhSQTJGiA4TbQ6GStzbcnD1EHZnDe6kjHhBs5kdrSUwuSoBO4Q
 AKUPT9zL25PM2iZFYIiD3s04BIgAYRdUvnI0XnwxuX6bidk6EkFw1I6W9FrKxQrMfF4vE6x3oTU
 PTzeVGj5k1dabrdyTP4Fv/e9fOdQxASZjA/K8QX+ZdvscdsgWIi7yLXbXo1n5scTzGW7sZ6/Oa+
 B+y9WL14e7wxkmclfxFznVV9Ep49H+MFLV/mM0bgUpJHtZqcyptIx8+nd5DLdPLl1A79j0aZ9NP
 Y8ITj5QupoSKMBu79WykveARUWxJ9J4TbhOVFBQdlkSmzc/H1sOdOq3bv5E99GmrlwHON68RYV2
 X01qxmz3osPbc0T3bR0bW4+aEXZ4JeENzDEV5uwhfb3Dj8ZRGbWmZmimhv9eDGdTzjRzJoosnQG
 JH0lSBDnwAJjsNjKcWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270024
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-100190-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9EEF233EC74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add SoCCP node on Kaanapali MTP board.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 07247dc98b70..a603f3056d83 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1071,6 +1071,11 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/kaanapali/soccp.mbn",
+			"qcom/kaanapali/soccp_dtb.mbn";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
 

-- 
2.25.1


