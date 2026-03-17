Return-Path: <linux-arm-msm+bounces-98073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB53JwHvuGnflwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:04:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 198402A431A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75610301D31C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 06:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B1E330B11;
	Tue, 17 Mar 2026 06:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FqXQTI34";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETwqxR+R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0D71D5CDE
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773727487; cv=none; b=NtbkfotjJ/zLuNTaZEg9/5SJ7TQ5cv/L4zuLp4CvohmjsJMZiQqlU3lhjwimroH3hJBeG8fIF0/Yei5poxMjMidfz7MEnqCR+4hesYigsTXRH09oJ91rFcWc195Zdq9p8U2YUIbbeupSKW3DfAKJZcpwIvoBb8q2Q2K7FYDiCOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773727487; c=relaxed/simple;
	bh=zDRGjOp+VDJGHw2WaVWG/3dySxzfHzE+gicSq7Tzvjc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BeFVH1qqc2W8bCORlGWOhdPaJm3GibqXGmVg+YP/tjDUvcJV80US/CMmqtZQ389CXfdBcYmUmiMzGqqXSBGkPP8iyflGe01RE8T2B8LQ3imcRcJBBNtlQVdM7SWWgxH2ODKpUA5HehqZAGvU5P0MFZgAF/wHobffMayyh+CeWJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FqXQTI34; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETwqxR+R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4TkDm1428783
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qf5Mk9+gd7j1xFB/yZvtqZ
	VV+UqQoleUZ364uomq8Iw=; b=FqXQTI34YUsexqNxeG2vFX+KlK7JdHzfiTIZAY
	qlBin2X5jnK2cQRv/KtS9XmAJQmUBSmw91Sgo7YdxkVs5tmXf3PiZDgAEmF3jeDM
	g/0LiJitlan7IneMZbTHjxoT5rdWeKxombO33LI8vP5qq/1hbmi4orzmtbLit2et
	V8cFik0I4ColZzMOFx0QT6suadvc27qIsrLNq19RTbY4ilvz0LwL2cExQ/VH0RBY
	npLLiLD1QK2QylSQc8jhcoNFufT/2yTk77+miL1jaTBT/5PJCPfFNgUyi9KA9dXU
	5+ekoGXlctZ6kSUPc4lbFuqPbsfl6yPUPlA+/xZeKrn0jKvA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh99bcyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:04:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7b8fe7c71so32537065ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 23:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773727483; x=1774332283; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qf5Mk9+gd7j1xFB/yZvtqZVV+UqQoleUZ364uomq8Iw=;
        b=ETwqxR+RmNyI3pA+cMLGXAftkunN3R9hCZBop/bcG/n4PaRFBRSM++teY+/761GzQj
         vxti6vrBSQM5vKO4xYRI3QAo7dB0gpWG+DYN6AJL/aRt9NSFAbWCw9NzKGNLB9jFYqdo
         ENNXUmNSNi+2Xp12AEdkORK4FzW8ZKMC6/OSQ2RUdwEKGgSOXe4mci/hgQFuEZwjfbsH
         oWhf6FpuKp3QeEDPgLOrnP+KkxAsBmGjK55/8bTJ/gCPug0pWtcTaQdu4uIBMJGSARkX
         8S1no+2zG43yoOcxl0XekDvERWVQ5n7G5YovmHxgtJabUNMQ9eJCs/w6k0JM9JvxQs89
         tPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773727483; x=1774332283;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf5Mk9+gd7j1xFB/yZvtqZVV+UqQoleUZ364uomq8Iw=;
        b=dju+LPWf3z6oSiHaliCNKOdkEFJn53/gftz5kKfXcB8AOfsPl+oiw8kzjHDQPUkQcN
         Mka52FrQ5NeTpTjHL7SVzf5D6b69O6ijdWXXyQq/x14OnQNG9KTk8lumnSin2hMIrozf
         /N+aDNZgSH6+wl5RAwr6B8/itZfoeGw1jRFgf0Ule+QNgCfFU+P9uT0Ne0usxZxnOCX6
         pLwk4P3VYO4effQycwXOla5MpNiYRMwow+Z5jeknflXvm0FTXEyUequbJ8VRxwQM9BRS
         wLX5vcyK+uRK8n4Saz10VY0vyTJjEVw43xbminKz1Q3j8hVpqYdoINjFa7cQ2HoRmCN/
         5R4w==
X-Gm-Message-State: AOJu0YwuEI+6MJ6IFiO3AjALQ5S9zCby0UkThxk+gtalWh1YJ1oEv5Ag
	FB+9ApDqYe9f8yMM/rNYSkIJLMszJ3qmMAgGBxMIc8E1MspWVVMPsAlwlTTQvZsEr+aNZyijlYa
	4dvMpC2B3g2b4tA7coau9KPrvJq6zTkFNydACv5FUC9WXbE5A3tNLcf7L0OJcSgPRbF86
X-Gm-Gg: ATEYQzyO9GP+ajtJLsA7FpElTwYoUZQVugKRHuw+Ukt6DN9ZRW1NjWSR1cTGx9IxkBQ
	zEy74DjegCQ+rRYCJkElM/qJw4slWzNXMC+SvGjJ0/l1EfnKwlIDnUeJIXyv/yozOGi1cuMP/0o
	MWTTJscfk/h+tUBY0lM7QSLbHTjx64Z3djgtiMS6cnx5Td++7bmZHX78jNv9y7VsfLudWeqE/Mw
	yCT0ISByc6wOssaA9MiEfSdkivkXV4Zu75Ff6Vgjqz73zj88w6+ioOi9FYUtgzG+cgjbcbGVkeE
	h7TM28o4jOp/+skMGmv+k4/lor+zQyr0qzBiH4kTEcvnSOAdp+4E3ascNYhERfviSp4TDs8suOg
	v3tr/D+RoDQV3E2PNp0gSN/CQwRwFKTEwgDKiSybcxr17JqVVE8VDmXh5Z3e76wcTFAdw2lqffL
	t8H/PmHon4Ta4kx3l924SL/WMk5dw5urVRudognv9ITA==
X-Received: by 2002:a17:903:94d:b0:2ae:5d79:a163 with SMTP id d9443c01a7336-2aecaac2c0amr104972045ad.5.1773727483405;
        Mon, 16 Mar 2026 23:04:43 -0700 (PDT)
X-Received: by 2002:a17:903:94d:b0:2ae:5d79:a163 with SMTP id d9443c01a7336-2aecaac2c0amr104971805ad.5.1773727482933;
        Mon, 16 Mar 2026 23:04:42 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05db37a8esm58125785ad.29.2026.03.16.23.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:04:42 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable lt8713sx bridge with displayport for monaco-evk
Date: Tue, 17 Mar 2026 11:33:56 +0530
Message-Id: <20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM3uuGkC/z2NW2rDMBBFt2L0XQU9Klk2oWQfIZixZtQKYruRF
 GMI2XuVGPpz4dxhzn2wTClSZn3zYInWmOMyV5AfDfM/MH8Tj1iZKaGs0LLl1+JaqfM2YBnCkoa
 ZtsJbHQisdRSoY/X1N1GI21t7vuyc6Hav9rKXbKKc4W3vm+MuF/pfzscUsV4xxZUSXw0X3Hqvw
 BkDEOC05Hy43eHql2k61Ph6rY6Qib+aWPpmtJ1EQUguCLRK0QidcYheK7JCdGg+nVZBssvz+Qd
 wFZY9BgEAAA==
X-Change-ID: 20260317-lt8713sx_dt_for_next-73fea668efe9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773727478; l=927;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=zDRGjOp+VDJGHw2WaVWG/3dySxzfHzE+gicSq7Tzvjc=;
 b=zMHviYNL9+iqZ6tLEPIyxZYqWqamF1/qkAF7fU0uPZ0qXdzx+3PYneLCphTodch9aZ9MAXq5F
 1pBIhFJYJd5C1IGQTl8i1mFyGmJLRNXoHMS+s3ObUeKt7xoRW2WeQpF
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b8eefc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JQEJCi2ktMuGxaRo7TQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA1MCBTYWx0ZWRfX8xbu/QSzCl/w
 e3dN/bqgA/xUxnLT/bmnzZQMRaYevI8YCfLUGtMaBbLhSXJfj/FI6QITpvdK584frf0NrAgSRHk
 YVyx48/Skk+c9OZR+p4jKJ6tVjHD3dNbqYXle2Pcbdt7AlZRsUX+2dKcKLbKI0Y6lmVoU4CYFU1
 wspBctjflYk/SAgeGKp9HsRSRQUkUfl9Bc8tJXN2KOVn+CUedUaJrMj7gRR+UFHciGl5BdLCJpg
 5oQ6A29B25JV/VTBjOi75ZFzUG6QSEsnZ0dJvbydiQaef0HzmcQUs5uJGOEuWqM3NUJ2yls06Mo
 D4mSXQreD7lsU0+eHOcR5QVxtLFRt2K1hTQZtaFxMIGu78gN7k8Y3d/+lB6z/HAgcwBdZvbMtPq
 UOPVMGjlX9C3CekVXg6R8sgig26FqYL01fy9mspgFyV0YzFr8QoKq4cw7YjsGt+Mef8GV4PIcl/
 r8HodawAdMuCN+NvUpg==
X-Proofpoint-ORIG-GUID: --fbQfcpt1BiakzVwkIVDFhMDJ2WOo-a
X-Proofpoint-GUID: --fbQfcpt1BiakzVwkIVDFhMDJ2WOo-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170050
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-98073-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 198402A431A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enables lt8713sx bridge and displayport on Qualcomm
monaco-evk platform.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Vishnu Saini (2):
      arm64: dts: qcom: monaco: add lt8713sx bridge with displayport
      arm64: defconfig: Enable Lontium LT8713sx driver

 arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
 arch/arm64/configs/defconfig            |  1 +
 3 files changed, 96 insertions(+)
---
base-commit: b691d0ede8f0d622eba958ddc32e6009d54832f1
change-id: 20260317-lt8713sx_dt_for_next-73fea668efe9
prerequisite-message-id: <20260303-lt8713sx-bridge-driver-v5-0-6cc2a855aafa@oss.qualcomm.com>
prerequisite-patch-id: c5155e9804a0e30aba47c54471cf6870482d0738
prerequisite-patch-id: 44e87c690845b24fb4dd88bba67e89fcfd18048a

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>


