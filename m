Return-Path: <linux-arm-msm+bounces-118786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cdoBEODkVGqlggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:15:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C405874B6A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:15:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=az3dOMgJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Mv+Jfm+A;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118786-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118786-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB2D130333E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE8A40F8C4;
	Mon, 13 Jul 2026 13:08:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7820414DD4
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:08:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948121; cv=none; b=fWL2ZTeZ3pSPmlnFnHOfJ9hBaC9ONw72vE5ppxHdvI+BCBgemETEnhHlxTCkUPOcQmu8TSd3/PTutT2O7NtOozc/trqOSv1XWdwcjfbIsLdd01PKYUlw/+UFsq6MBk90lHxNkUTEs++IhQvLps4MM6e28ayPcsSKy9nfh4sFGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948121; c=relaxed/simple;
	bh=jE7CekFZKhgt5cmGhG+WSkEJKcvyL7RUq/0SKWptMQ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qShdTf55zRyibXCDCoQ6POlsVeSs6gEs3nuHe9EbFUvnyD5aIopIR76HuJv3x5qaT27DGY1FBsaEErdsB/BeoMe+gXdR5VeNwe0kUCtI/AJHNV2zY226cEX1a1w3zHSo1kQ8KfwZayPEvpqvOB5Gv4l3hK3U6xDdXMtFcjbmqHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=az3dOMgJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mv+Jfm+A; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE3KM1561385
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IbUQyBiTJhaPWdaTkK+imr
	RU+C+1Z31myd23GIEMc04=; b=az3dOMgJolpqHY2doKxRrXU/JIWohP4cNWjaAi
	Hu2hfAlkU+clmYtARs2WIW7+H/+OijyleSyIAJaqyQ23iH8g/fwwqprTwv+FKZW8
	aaxU71/7ZVqsXyIYlWWeXhywyrZXdKAIkUH5YqhXk9l+zEO5dyOoOZfzAKIleVko
	r+S+g6HQkEqobPq+g7EV0q1GxYzC+HEhdwjY2D5lu2cL4LntWQYM7duH5NLyNecU
	UA0d2TeTPGhQKVs48m3g5l2Ub++D+3j/VPcQW/tcmlQ8gEV2pgb7xoo8bNwZ8a2j
	weuXW/uqvyZjVUQC5e2lHYF8Y3k1q/uONB9e5FtLjD7M7duA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3amq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:08:39 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9dc0f5900so7421957a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948118; x=1784552918; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IbUQyBiTJhaPWdaTkK+imrRU+C+1Z31myd23GIEMc04=;
        b=Mv+Jfm+AJeLuZAaDe+Q7ZpBlDMcY5+9EpeXIN+47svGzqibtDHZLBSvYuEiw9ITQo8
         OeTbyZvcZVGAyhpJ8fjIzLdnmWA1l3SbGccQTdauXOXZxfkmSaoUZ5udGQwXIvVVoUib
         MCnNprRqEAgb2ew6PYYeD3AyP/ZE8Oc1oqfjyxCKMTinbAYuOqOtnUN6JkYAY/uj4S14
         ltqL8S/zMXxTKhUag6VHXycsfB/1widu4Si87RYowJNzH/haLXafDkSKF3lXEffb6mXp
         0ew0fxnm3uKkSfvdC/bI9hMJ5M4i8N3gYdO9KzMBQSDJJFj6Sr45YiIgSoFfBUWIFcDZ
         +R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948118; x=1784552918;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IbUQyBiTJhaPWdaTkK+imrRU+C+1Z31myd23GIEMc04=;
        b=kSrNpiSG6ADYlYuGHuIu42NwaOTZEaGN1+1OUrGWVIHlWt8rF9THiK3f1Y+oP0mLcR
         hvMWr1qxralTW06wkdvHs2dodEb3pEe5NoUwPLfOfdvyLsSsG/ejzMFq45ST0QFeAqZG
         IaXDaCcqy4wUDfKl3ROJhS6ixpVQVrykhUIslmrC+qazLQXGU0yDq89PZFLGawPBO1Ja
         nxvaG6kbZcwc3Ae+3x9KryHpZOb/zwnaPM/W/S7hR3hShKxLjWLixtX3QVZzcdZu60ZJ
         9IOonRWshRS3sKt2zYCtXGtVhSa0nxczlxZa8pN3rCzDTg2SkS8rJS0FQzByuwO/2otB
         nVPg==
X-Gm-Message-State: AOJu0YyevmUqrqMuWikT74duS6eiQh0plzw7dY+PCRZWG6VAeUQU9U9e
	VWQfyOruF1V0HwlrJ2H0bEzJ4flbHCTZcLSdU3YaGaWKJEZpjcO8kIEhxHZiWGROZ7CKKkKQvO+
	DOmilraYlSZRqVwGiSQ0Fjs0fJdQT2SLILh6VYZLlVwum6YelF1tAw4hP07cAk39O9K1l
X-Gm-Gg: AfdE7clZSCyvyPRj8ONN8FQ8lJHe/AuzZQaIOi0TOC6bHUfjRGgvPakcTfn2AVWLIMZ
	/rXAF8UosLnx46Ep2qpNZO6U0TBLH2aTU7QQpsn/ogUDbn/IVfLlvUYp4liSKFvYKpwQbmw+iTw
	LV2fcyUsGEe6oVBeDYioEGsQoTaMV9rpOIqYT2OzOnwkmaSTUoXCg6+HWTZ2xA09yKs/kXcD50R
	K35gn1tW/vNtULNvG6Ptu1UzJCQ4gj4uSdQ5Dmz49kyJaxEhocGtldwa9acx2PCL3CFM7wA2AnJ
	05IS3XmT76u5R6c7Xh4JCLIFlpF4ypwczZhE5gNMg/GjY+o5gNgy99wY3I+3zZU6kecp01Z0JDa
	ZbKQKyuTDdlMpdIJD2fgQqJs18w0hWQrHrUHlLOQyzUycmUlTkf4WVlmClOXXl0d0FBeIDbFwnc
	837SxV
X-Received: by 2002:a05:6820:4df2:b0:6a3:127a:bf27 with SMTP id 006d021491bc7-6a39bc515ebmr4445657eaf.11.1783948118258;
        Mon, 13 Jul 2026 06:08:38 -0700 (PDT)
X-Received: by 2002:a05:6820:4df2:b0:6a3:127a:bf27 with SMTP id 006d021491bc7-6a39bc515ebmr4445645eaf.11.1783948117847;
        Mon, 13 Jul 2026 06:08:37 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e16c7d8sm6415913eaf.9.2026.07.13.06.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:08:37 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] phy: qcom: Introduce USB support for Maili
Date: Mon, 13 Jul 2026 18:38:27 +0530
Message-Id: <20260713-maili-usb-phy-v1-0-3285da11f148@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzjVGoC/y2N2w6CMBBEf4X02TZtuYjEGP/D8LDgKlVKoQtGQ
 /h3K/gyyUlm5syM0BskVkQz8/gyZFwXQO0iVjfQ3ZGba2Cmpc7kXsXcgmkNn6jiffPhWmXJIYV
 cQlaxsOk93sx7/buUG9NUPbAefyf/hsdhCqJxqzGLRLCKiui4elKZaxXrOBFJlsRcce86eAoPD
 T7g7IjEMEFbO2tFiBMrl+ULfVV/WMkAAAA=
X-Change-ID: 20260713-maili-usb-phy-216495a80a6b
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783948113; l=1143;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=jE7CekFZKhgt5cmGhG+WSkEJKcvyL7RUq/0SKWptMQ4=;
 b=Q4FD0ucJopGcsAl40GSBbU/a6doNSvbPxBE9+kqKsoy7utWRWVseNQ0AIvjBywrPj5uGX8JNT
 xFEoWOZPnNnAPToaDmRkDPrjfcaF90oa77iwVSCwyNDJ3XXSzC3Duo0
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNyBTYWx0ZWRfXwvWyeS3u3agT
 sEHMXMFjcIGwOl/R4N+WcRyAK+MxO0B+lelkZKaVcCHF1rKyDKzZYdWTISit99t636voLYHYZdD
 XhWLThDRfTZ7NGJXDZjkGQ8G5T8JxGrJd8OoW/JkYhAxfrbiC6YTNEtufdxnmg4Wynkd0nB1OwG
 SmuIBHOyyp6Bb5V4U2Y44Ezjh9vwiT1XKD2MIFUW1dvOK2vsAmQ3Wgp681h+zOzN73bW4W0uCoE
 0rQvhirKZSsTCtNits2HqdVPid0VjNo4th9F8r3iTO36E0VbHbmoWhQfiI6ae5Y+ozXzI7OQ2Iw
 NQufqr3BmuRwRDQ6LWYXipYRIU0HLInLvUSi1mRslvHsZHSaZRQoZQEGQLlb38RRTPo+X5Uq5C8
 y5//R0KigM5tqOtvyRxQXzDTorqrYPVTvt6mGeDGAp0I1sBVCKTcP8JT7F5JFHbOTEDoHzALIa7
 xOBKW8pmWYT59/ka6NA==
X-Proofpoint-ORIG-GUID: TUzTqyEbeDlmkH0qNrQGUC8ePVOsifF6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNyBTYWx0ZWRfX303wbAE0DUOu
 FanQPN+p77cn3KM5HDLVmFCDvHdZzC2i7OvXlr7o7pq+S0/nD0MJjaB0p+sc2BwFXAQxUDZ3PmT
 9G6b5JgFq3RU0YfJIe8PNwtwVVBzStc=
X-Proofpoint-GUID: TUzTqyEbeDlmkH0qNrQGUC8ePVOsifF6
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54e357 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7E3VzwZjn1rR5_zOvygA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118786-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C405874B6A5

This series adds USB PHY support for the Maili SoC. It documents the QMP
USB3-DP combo PHY and M31 eUSB2 PHY bindings and uses Hawi and SM8750 as
respective fallbacks.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (2):
      dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Maili
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Maili QMP Phy

 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml         | 1 +
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
 2 files changed, 5 insertions(+)
---
base-commit: 9eab4ee76654a970b27e32ef8db5faa0e0ab1611
change-id: 20260713-maili-usb-phy-216495a80a6b
prerequisite-message-id: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
prerequisite-patch-id: 67eabd10459a30018201dc8e1de5d92afd66a65e
prerequisite-patch-id: e6a3b60f5be496990f4e20b61bc4e7d95a9ed6e4
prerequisite-patch-id: 2c8c33235fa26efbff7de1c1fb4fb4a914c669f6
prerequisite-patch-id: ad18f334a41515aac21faf5d684206657ada699e

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>


