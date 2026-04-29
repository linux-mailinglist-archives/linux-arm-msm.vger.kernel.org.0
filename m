Return-Path: <linux-arm-msm+bounces-105146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBrdDdnH8Wn+kQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:56:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 359E44916C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C74433004D82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0C63AD509;
	Wed, 29 Apr 2026 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8QiDHD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AY4HH+kZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C40359A6F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453009; cv=none; b=DOzcAPgN+bsQHN16+oBen6qCk8EkSSoQrmMcUPY3Ig8bEWPdThA1dILeqON3GWUXAAsW6jWasMbnFBlk8geDHuB6HgeW8nHheyXVVWAKnmLoSbvikufNUdYa+fTo1RsW528J64K3855OmVWpKoyfgD1xP9LYreHhAgUSUeVNxyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453009; c=relaxed/simple;
	bh=08rsQFVR+3hYiuMMX57tOBkvtDLUJJygy6Gkb2VwMps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kpSRYIhAJWDtYL5uY6tD/B7YcWPZOUveJZVKAU/u+D3SZ6yrU9bBaK/1DtYIAzNm4cX0drdIdjEcZA/a/roOUk+Th5jq91uOxGNU+S18oEtW3F5qHmui9REuXhFp6AXIxj2Zi5uoUw8jOARUKn0VOhPUkymiSeE8QZLmUHVNccE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8QiDHD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AY4HH+kZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7WC1721222
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fSfYS9NBScKl9paIPDmCUa
	nsHZ2TO06mQJaHt6Oyln4=; b=o8QiDHD24PDmRMy0glEsG1Bn+YzgkRLf30dkiL
	wRJ3Adhr62CSWZWxLCV8oxBv9u+r/86VOtU09VdKLFMyqDRDM5yMdhp9YCwQm1iB
	UTSgrnA4KPuc7Ma0/HQ+vNkHRyHHpemNUtwbdUG6gzdegm1CMKumZ1PMxCtvQ0mh
	4alkGCcvPLXuQp60AhUVTN1x8EzXkdUAn359JOvZPig2m6+FxwWujTK/ZS0L9w2u
	0yAKGBa6Fyq+9TztnFWbiqcxqP4awlKMGdDk6uEwMJjzoXHkos8R7HqSEV29yxKV
	J2ptQzYGXIsdGwT/xfKt99Y7ItXvb981uRgWDOX5L30LHdvQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7317h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:56:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e423a05c8so13970651cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 01:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453006; x=1778057806; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSfYS9NBScKl9paIPDmCUansHZ2TO06mQJaHt6Oyln4=;
        b=AY4HH+kZEUrV2kRHHEErtKDvK5HpmxAhBeiHayjNcyWo4jsxCh0/nbZfRmZL//3Gug
         pvYdxQqG1ttYqzoi+4SIEE5+SH/0iwI6vPFz5fOWqCcsu5vjfKEPK//4wISUSLmMNbw/
         138E1Gj7E5ySAB6Aw2e2HC7Mqjx3L0ZCl2+P4Q8q1epBMhkNtDfgDC8Ghrze37A3m8hd
         b6j7BYif6g26vG70grIuUSZssQAQQbo+q8weNU4O8EVFvMw+rIwknH4uvd9BmmhRplt1
         mxKSwL0Ve8wQSu1MfbukibbGeuaI4oVu1rlD0eflSbCEGDIFOU+8qYPyvFKcNM6NbQjx
         3Ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453006; x=1778057806;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSfYS9NBScKl9paIPDmCUansHZ2TO06mQJaHt6Oyln4=;
        b=kXTcO6jlph+skspUmmwLdyubxU6m/sgoreX9T9+zmPo+Qx0lWgDcMPVukB91kOXnYJ
         wvkKH2HqnuQJ8mVYZlUu8SivCZ5ERgQxCL9eFT6REcnbKMHb4jnq2IrB08EBuaz99eri
         8IGDcQRZRy0aTuM/uEN1vCDa0VGFFzF7eMLk9iBoPNAjpVLPn8l4THu/Isfjd462Afrr
         G8oEDOyi9FddUlgG3dA5j2K1meqAAnuTmdXaNwvoRnQPOXaC67h/9gvYsUmBt0gFgRxs
         mdvqQQuo+cEaswnD8DgowBIZtqxa2dEVmo7ImnmaFIF+XOitEzYs1zjnD6LxSrxblRES
         uEpQ==
X-Gm-Message-State: AOJu0YzUzgvBCldDbjZQd5lLVyMun75QFIE80X6Y6KtxOgeTvv4YbUSN
	TGfeMik30zrBCTu5mfrbmbbZz13OGGQ7q0NAPLnsHVFY/2Ys8oCDU3dU+GabmTbFsHzTAmhTEqn
	7Zjhd6/+0FVUJwan0P3l/4drjSFXyAVcJHlKqU7ggZGKfpK/9e6rCrPyQbHOCYxygxM/v
X-Gm-Gg: AeBDiet2CYR5W9IPTXZHdwhSQMA5ufXlB+j7puP3Hbv7MZMsFAGJAKit2crAmXs69jW
	yhX3D0g32xNHQV4EMwFSxPb0jz9/CPXS/tRCc205dtDB70Oc5vdHNhdiwZwEPPQ0TdXYXKS0tBJ
	BfqK/qrKRhLN0psTROsoPTYwS7dk1RUtxFYEw3/OImJ2Ts6zaR1k5pQsVcgtEejZVlNnLoY3Pay
	8Gqn+Wq1d1URtr6mWT5Jrj+ihrbX7wsWSmpWI67cnL7Hah/ypDCHsOzMpvsFKUpo3wF6b8zsT2H
	6bNu24lPdDJaOXyWS9HuuXEZeMsFfv/ZFY2eFFw3ux2H6WbkWQC2v/ARG/IxF3oj0Kedva35xL6
	78h6vmMgboC+chCs8o0irGyp3JnyuTUMaz7sFuLD2EK47SrMUod0xQjU=
X-Received: by 2002:ac8:5845:0:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-51019af0e91mr28267471cf.24.1777453006529;
        Wed, 29 Apr 2026 01:56:46 -0700 (PDT)
X-Received: by 2002:ac8:5845:0:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-51019af0e91mr28267381cf.24.1777453006106;
        Wed, 29 Apr 2026 01:56:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216ed6sm4950689f8f.16.2026.04.29.01.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:56:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] soc: qcom: Kconfig improvements
Date: Wed, 29 Apr 2026 10:56:31 +0200
Message-Id: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL/H8WkC/yXMQQ6CMBBA0auQWTNJW4mmXMWwoMOAo6HVjhoSw
 t2puHyL/1dQzsIKbbVC5q+opFhg6wro1seJUYZicMadTeM8vijNqInwQSmOMqENPpzs4C/G9VC
 yZ+ZRlmN57f7WT7gzvX8f2LYdXvqFcHQAAAA=
X-Change-ID: 20260429-qcom-soc-kconfig-1b9b31d9702a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=08rsQFVR+3hYiuMMX57tOBkvtDLUJJygy6Gkb2VwMps=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8cfFZ+IKJj7HWvgriNpAi2FIz48fa05gsGcO/
 J7YoJ591yOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafHHxQAKCRDBN2bmhouD
 1xcaD/4t2pN9Vt5h01CPyjXk12c1q1gRIXmuKyOu8g3dHb2AdtJMYw3sxMeL0Pl82TigYmHlTnZ
 m7Wf4LWunCjmWiKpUk0edrswAXV3XfJ1UGmN1oJKDGC1wr23VLNDrbUqwIZuRkx1TukZoNguJUv
 Y+iW5f8R80L6UBHuRJKiX5FRIFJu4Qtln8QaPav9ZR2BKFh4JSh6MqGwXad3W9W8X4fz8WEG5PI
 N664ucy3dW7hcKvlZgi95KmqJKLF70OaqNTUf1WSXbjdNNCo5eoX4ZNuaWh59yp3NpijnlROkdj
 7Qo4VlO0cD8nwNQQ1WWkyKxjHRyYM9FxyGdoVxEtl0m6C4wubwmmQWpy7qXG2OvGPfko2wPDQq1
 QFF8EaEUHj9G7ZF0Ex1xNXkKjuiOU3sN2F8fk+6mAsfs/G/JZaLpk9PfwhNHw3bHhojR/crwBIT
 4OYmzffvAryUMLDp5HK1P03Fh2tl0ocokDe6oXZgHLLUetI8mnnB+tpeNQsGcbQWTI/PoOytqYr
 1eMtUSCiwbymouUuEi8QVckKoyRIcsrrF678mDx6uahfIq52AsMz01b5hcILy9HiGRE6I3ySckH
 OUVGvG3tbRPTR49T/dQQan7MXDP60z0zrbcyoj6RhfpoVnmJQizRhzSh+wmfAmRTvliyG98pxbm
 TIfoF+/jfI7tyVA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1c7cf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9UIuVs7TZjGmRM6JrXUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OSBTYWx0ZWRfX7NpmHU8f6kFF
 OnuIsrcUtuuKCAk5GsBkrK249t7pdXs+k1VYyydGdYCDeeMQkkqe8x0xOxjb9vG+ei5AqugpTdB
 b5JUk08hIfD0jghFknQViT4iq3KyYH6ixrDxBnSMVd6BJFEt/ifeuWWTtZPlw5msAcn+GKoMcT7
 JMKZlwQ5iBM12zgeBMOOqwcJTzSJh81EVYUxiOngNNU4cb/lV7HtM010hmhtrIqfZ0yifEOBnSa
 9be6QlCIqVXLYUWwtcv5aM9PzA6p2zIFYZD84GixiYy4VDyEMX3KEA3zCm0iRbiOx0p8BOcGuqO
 r+FBF2PVSDXzQc2TZpPLZ5kEpMDFh92fjyK5Dy9dKfJM7uTPCY02RLTLoT5HctvjZ73l+KrwFsF
 1Ku5y1GsU4Zk4wrYiqbhGgTFimT6pLIIBQsMksiUt/3qK0bJ97hYvcAl3I+0FaLLTePCOYLVNwQ
 Q35Z8HolnHTqVxFwZ9g==
X-Proofpoint-GUID: fICNLtJjcpzCjaYeCIppXdLUT4xmcwBl
X-Proofpoint-ORIG-GUID: fICNLtJjcpzCjaYeCIppXdLUT4xmcwBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290089
X-Rspamd-Queue-Id: 359E44916C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-105146-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Make important drivers default, so people will not have to choose
obvious things and few other re-organizations.

This matches my other work for Qualcomm drivers (clock, interconnect,
pinctrl).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      soc: qcom: Hide all drivers behind selectable menu
      soc: qcom: Restrict drivers per ARM/ARM64
      soc: qcom: Make important drivers default
      ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults

 arch/arm/configs/multi_v7_defconfig |  11 ----
 arch/arm/configs/qcom_defconfig     |   7 ---
 arch/arm64/configs/defconfig        |  18 -------
 drivers/soc/qcom/Kconfig            | 103 ++++++++++++++++++++++--------------
 4 files changed, 64 insertions(+), 75 deletions(-)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260429-qcom-soc-kconfig-1b9b31d9702a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


