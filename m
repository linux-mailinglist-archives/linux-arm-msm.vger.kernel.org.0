Return-Path: <linux-arm-msm+bounces-108710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO54MayUDWpczwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:02:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC9258C0B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06055300F279
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D7B3D9DD4;
	Wed, 20 May 2026 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl66O9O6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7w+VHH/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC631351C2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274914; cv=none; b=tXJzHtO7V34ooJyNaN9gLiHkuYX4hpfVtRE5Fv6QOf+5VG88QVnTalW1HOcrI7bFKkUdMfm0exniH9rptjoQrJ95G0XtUkA+30KgPivStwqmhYmyK5ncs2kNTehdsghp47/BMCbupoN91F8g+k934TUIJRBZRmn8BiZ+R9dOpIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274914; c=relaxed/simple;
	bh=sxTOeNZUCJiaLQF43tM6RQQ8yErITtuQ1DjdECwZa5A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ndet4zWr6qf4R78N2FNX8n7O9vrQ2632JC97X6RcMEYIusp+Pev15eFvYD3C/BJeMeLHqaf3pknMQ/jXlpcDkXmFctIXMZDEeSjD6KodFgBf6fd9X/0HMKhPeBKj4P+Y0SLVAFIGioMGVqRjkq06pNRwkz1M/XlkmcGM8aUEGXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zl66O9O6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7w+VHH/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6kNJr1725321
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sRQ+frqKGg6yviczCOuRmF
	JXb9EFREKQHuap6tZIl1Q=; b=Zl66O9O6yQDMjWRBijau+OX8I//BUkL2xHKjp3
	DZHD7FATKCZqIvzrFFGBxIgpZaYDkN6Unl/KVyYaCCjpvaedOdKeeBYPMaF4DEep
	HmZBY0+BCn08IELNaQGFTSgiD+yaSjwA3LjeGslunnlE7LVLAhOzeYGKZeJ1BQMy
	TeWfPVGKGULcnIY9SlTl5aJm2AtZVIHSzZPEWpKmpsyIdZt1esF7SZBDsKHZ0UJs
	Iuu7DsNbqnUt4UrRo3w9hgZ/AhsKD9g7VEhQiVNIjP+yxKYQ1b0LEt7TBSLXqOTy
	t2D62+8YJkVCqQMQv7gF1sxw8X10ZnRTq+9fh1VD5f4eUSIw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qmdpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:01:51 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7dbd4fe0e15so14859809a34.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 04:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779274911; x=1779879711; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sRQ+frqKGg6yviczCOuRmFJXb9EFREKQHuap6tZIl1Q=;
        b=g7w+VHH/91UpwFkDEMysBQOeWdTRzlONCfoJSLaLu8Ijy78OGGsue5RJ9O955YCifC
         RS2KCkjfmWW/cwLl6ZznEz6/OmSKAwfAFikQTB05oGRwqJ29uGcwkzowUmoBiBT420WY
         nb2TlHFIoCYpDYHxun6ZTkF/wzoQdFkkNC4IcnpUpTKnIwhjIvV5K0O0IGnLY4uZK4BL
         5kFZnZH4XzBA82KJTHbWIStRe7QfES5D6xZqmog0tjZXl58TE+xyZjGJhWzXOG9O25Ji
         FYCEJLYzbHjvWZ+9ORi2mROvbXJbt9oZbV1G1rYAXkfIB6Da91vgWpganmfLSqBWjQmq
         JFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779274911; x=1779879711;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRQ+frqKGg6yviczCOuRmFJXb9EFREKQHuap6tZIl1Q=;
        b=stPSiZA2vBntHuNC42SRKo6TU0ys5bACSL32tT/9/3C2j7Ghb6djZ7CZT4bEvVxlRT
         WX5qTHBl93s7P2ruXlpYtfilSDqpCOaOcLca98q1c9f1xTg0GOqB74giWK0bvWuwZg5M
         x6kZ3ArwGiND92zWo2oZG3F+E0BF/2yRWlWPWNrNgFzQzi+pAq1RnN5NBp9/63lRCBlQ
         7I/maNghxNGsLkPU/qVtK7ApQt7nftOWhPTnu0wQkxl6Lf8UJkjElJ9FMV+vlc/HIOzG
         yfSW41pyUegrnWGjV6N4mRg7fMYdIf7/5I5nWLjORu4DKh9xAG8PPy0buiTU0XweCZCu
         cDSg==
X-Forwarded-Encrypted: i=1; AFNElJ+5GHPGjzUFv0LIcSSN9xk1DaGZkvJhzF0UL75fSd1XFb/rUPzgaYgKKk4DcF/lvTcJ/wOBKoYFeC3UXOHY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4iQy7ExKG/Q9EPOsw6DueG46z3Trmi0swVfjvu3bDlPtxNqpv
	7wBB7Y1rX7N/rxr837QU3/H77zGBdT2ODuA7v61u5YkBKMDkRnd63g0Zf/8yeiBcae0u139XP9O
	rMMoC8vNj31QrPu44LAnB8EyHdYVhxRD3hCE4+o0O04EqTPF+ylC+NlfWa8zh8Jl9FHIy
X-Gm-Gg: Acq92OGmHrUdPzIJB/K5jXZI1akrv69UdDWpYN/BykJI/uAI8ZZBC+D+9acJc4qUX8p
	gW1Rsgo7foRHCAWPLp3KyvG1RLbOrptn89X6WWD7Up2iueyQody6bOlpO4EzDQrjptItfiEqrEr
	xjRGzJ3GJHGsiBFp7UDDeK0BqL+k9KciZkltBjYhesVpKnrK/zAurspnLPPK9+oKRWO5k8I6aR0
	+FVKB3Y3YTwFOVLBkbE194I58kV8PPulSQUTKgtG+Tt5P7ZroVdY1L4o6sVnq0tArRJUiUrAWON
	EnOit74G2YHgZAiQxN8KlLgILqPg9pkv4nqjjRh02NqvuvQUeVECSIJdfI0KFlPBJNOAqLcqrR6
	fzmBdWoVITrshJZVXqQcO7bXkvDGM5/Osw0CZpk/jWSVoW2VDx2/qWUMz99Hf3fsMJepe9qIABF
	muyW+uSYLN8IINEKio
X-Received: by 2002:a05:6820:4cc2:b0:69b:73d8:60ba with SMTP id 006d021491bc7-69c942e0844mr16305575eaf.21.1779274910944;
        Wed, 20 May 2026 04:01:50 -0700 (PDT)
X-Received: by 2002:a05:6820:4cc2:b0:69b:73d8:60ba with SMTP id 006d021491bc7-69c942e0844mr16305529eaf.21.1779274910402;
        Wed, 20 May 2026 04:01:50 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d48:e1ec:d837:6344])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eb6320sm840310266b.59.2026.05.20.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:01:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: monaco-arduino-monza: Add support for LGA
 WiFi/BT module
Date: Wed, 20 May 2026 13:01:41 +0200
Message-Id: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWUDWoC/yWN2wqDMBBEf0Xy3JUYL7FSSv+j+BB1bQON0ayXU
 vHfG/Vl4AzMmZUROo3EimBlDmdN2nYeokvA6rfqXgi68cwEFxlPBQdju5+CRTv8IBFgVqNseRS
 3cc78qHfY6u8hfJYnOxwm7x3Pkhk/U4e3CG6nlkvoF0c4gBFQjTAL4BDJhFdNIvM0vj4sUThM6
 lNbY0If9/2rUoSwN3osglmGEbg6YeW2/QFWRIry1gAAAA==
X-Change-ID: 20260520-monza-wireless-e6ce7f013f38
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwNiBTYWx0ZWRfX+TBqKHbFKC7+
 rFZ2MBdMSMat401RPaSXzaw+o8+B7E4iyINbIQvboGET8oHYMVt1J4Ekyr5rhxFY+PJt6dBEdgj
 E3GW1xxKggrmJEgY4fPVVBL5CfzN4N2KOUw1HgVjwLpSnhSkrA3L/eCZI8dnjXmEoPD+g99XqMT
 ORSWoMA+U4bPBx04qs4+w8YPz+Om911U363L3fdzL8f4DpbTu+uZKjQcXTnd01ahbpDk8Vd6U6/
 zKvpINiqVmiJMBYjvUahVvtLFCJc9baIdwrG8rd9mJH28HlV27oZTyvmC1n1yLh6Zerbp4n5J2z
 f7EkUHbADZIMzIfjRsW0dtg35bLu8MOI4OMgh9fdE4uv6KVoTqL20rFEsbgqCEHT7eA5j2uaVK0
 Ris/z8n9zZoIK96KEWdVf8a7fcrX90X8/gQlhCCkvWFlhJwG/ArP+rJbePDgN7tPrlSOXCUJOxs
 YfN1W4htNiH/rXRa0kA==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d949f cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pLl2yMwwk8GGFzfygZEA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: NXQ9qBET-3sYtgakuBHkF5xdeN-vwp2p
X-Proofpoint-ORIG-GUID: NXQ9qBET-3sYtgakuBHkF5xdeN-vwp2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108710-lists,linux-arm-msm=lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0AC9258C0B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series describes support for the onboard WiFi/Bluetooth module
present on the Arduino VENTUNO Q (monaco) platform.

The board provides LGA pads for a wireless module. On the VENTUNO Q
these pads are populated with an NFA725B module featuring the
QCA2066 WiFi/BT combo chip. While implemented as an LGA footprint,
the design is functionally compatible with the M.2 Key E.

The NFA725B exposes WiFi over PCIe and Bluetooth over a UART.
Both interfaces are gated through the W_DISABLE1# and W_DISABLE2#
signals, as defined by the M.2 specification and handled here via
the pcie-m2 power sequencer.

This series models the hardware using the existing pwrseq framework
and connector bindings, allowing coordinated PCIe and UART bring-up.

Patch 1 registers the QCA2066 PCI device ID (17cb:1103) in the
pwrseq-pcie-m2 serdev ID table so the Bluetooth device is created
automatically when the PCIe function is enumerated.

Patch 2 updates hci_qca to retrieve the "uart" power sequencer
target via the OF graph and use it for Bluetooth power control
instead of a dedicated GPIO.

Patch 3 adds the required Device Tree description for the board.

This series depends on:
https://lore.kernel.org/linux-pci/20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (3):
      power: sequencing: pcie-m2: Add QCA2066 (QCNFA765) BT serdev ID
      Bluetooth: hci_qca: Support QCA2066 on M.2 connector via pwrseq
      arm64: dts: qcom: monaco-arduino-monza: Add QCA2066 M.2 WiFi/BT support

 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 65 +++++++++++++++++++++++
 drivers/bluetooth/hci_qca.c                       | 33 +++++-------
 drivers/power/sequencing/pwrseq-pcie-m2.c         |  2 +
 3 files changed, 80 insertions(+), 20 deletions(-)
---
base-commit: aa61612ab641d7d62b0b6889f2c7c9251489f6e3
change-id: 20260520-monza-wireless-e6ce7f013f38
prerequisite-message-id: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com>
prerequisite-patch-id: f4a7d1957c1776051608bf3d808b2786606c1ae2
prerequisite-patch-id: 6cd3c33583a9af16b3f6f71517b16b32d8155b7c
prerequisite-patch-id: 0550c57d69cf112fd4830e62f4388db6f8bf397c
prerequisite-patch-id: cc10d8079e37ef0ba0c33d0984c95d76361df9dd
prerequisite-patch-id: d7f4bb2bb4498ac619e67a94f8b59119a5caaf26
prerequisite-patch-id: c00ce9095b2d3a412229796194828b55642d3d96
prerequisite-patch-id: 09600595c2e80b12eda3aae39af192847d0f03d0
prerequisite-patch-id: a6118ed2894c176780ba933750e1068f2819fa4c
prerequisite-patch-id: 1dee41a33e032094e8dda74ac4e0bada928573d7

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


