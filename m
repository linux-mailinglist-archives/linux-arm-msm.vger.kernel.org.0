Return-Path: <linux-arm-msm+bounces-113937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3KgMAcbZOGo8jAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:44:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 722176ACFE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:44:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fGy4htsn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d93co3lg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113937-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113937-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D11533031031
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 06:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE0135E94E;
	Mon, 22 Jun 2026 06:42:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD135E953
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:42:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110525; cv=none; b=XSEJYe0oRkGbV5fkmp3Bclm66eZ47PBpZS3nFF8bWmYDaR+ujeZttic+qRXBlMQ+CMUVMzvMZhTkDE2Ndm8mxLwCqAi0ruoMzvEceWMkkVhzVS1dsUfuM48W8JYg9P0DYqMrQdR46mRSrBS2dfgETjpuiFHK/aILDgjCkjkCRbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110525; c=relaxed/simple;
	bh=JTLUtADmMrSSbiBDyHOMvniy7JEjK2Z5L/2DOJuy2jk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O4gl/JbwoFaV9s7nBmfu6y4L0Cn9kxWbQq+/IVQxq+BzUs38gunt0dDIjfjQNpoKv7rSYAuxmBpFS3uf+FaGKms6e1bs8g2qoCkM5hqsrCDiw7Hx5lvUGct9Wlh8PMx9zoDOofgsixQFbGtGmzLGoeFv9g7GxHSaRvVzFapgg8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGy4htsn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d93co3lg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5Bp6n172811
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4znBvLowOIUes7nt6h5CCf
	8tAmfqX70+loiH9JDSFDU=; b=fGy4htsnjx9YINciSk/UWWm7BzyYd3JJG739O7
	0XoiTBkfEMU0AysqxqdIAlLc3tjcrFoknCNrJ1H1HkvFYLRccjhlXgwBQ0Y6u8V2
	E6HFUtfpa+g8xkYCApAr3a564FkPaZ9IZ1sgz2Qvv2pyrq11n8K2CEC5x1v1xPnJ
	Tc0Nqir/RFxpB+jif1OzAhwS+haM2w3gHbTNGilvsU+TGv3iSrqOVmsGtScpII69
	90NX/LwsFV9z4nWSy3eNHObt2uRs5mfBLkMrAlilxO64nVE7qBCaiFuuqGH55YCs
	LO7/0fObsJiKVohV+ywtc6z7/egCJFobDKMprwU3RkO0V56g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewjexw62g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:42:02 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137daa666a6so728589c88.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 23:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782110522; x=1782715322; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4znBvLowOIUes7nt6h5CCf8tAmfqX70+loiH9JDSFDU=;
        b=d93co3lgy4noCDLMeVPETY3+C7ABHentyaCm/sQqluDCEmVDHaI85mfA1Rq03Q03jJ
         fic/22GpJG9qWtuLfr2FOQRHHDSY991SggNNM1BXlpH+ZrQWVc/x7rtNQiD3x2Og9D9p
         /ZGPdazFlk8VA3vna1ROyANLnnwd0iGJKEiaoDJUweSPBoW+zLFk/0aWQDLISw+xCyXC
         f8fT/fg5jcjnOd3XsOgyKApz0e2ZiNSjQe7KG9Ce2CXBt3TUhTwEcNSm3fKJHpQKYU/A
         SXu4IxUCLtBjtUm6eicIP02HKZNoVauxx6JuPBwGZeDe4FwoP0KZnQ4LFphEig2cFXqH
         2jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110522; x=1782715322;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4znBvLowOIUes7nt6h5CCf8tAmfqX70+loiH9JDSFDU=;
        b=PQLfsZ92F2A9qxLGlZxCh6equrQOn8kn9s5khQB0nMp1xCL2zjY+IuYE/m1kbNj/sw
         LlQXxQw+hmFPPuaVm7YSR6KMGtERF4vvT8EiBpNOODrGCCzDodfc/Mt0z3QRi74MfCW6
         QewnSK++0HoxrNK+rgorKzpyJM2ZKXfJtjAYKxiKXMWvl/OzhGn6Kji1OowEtz7FMgqW
         r0+plfCToIjHSQ7vj5vZs3TCyuBlZ6z0bXiFEdHIoMgSOep4GGPKQODDnSJj+cRm/Fg3
         eoyreQ+sCxppHTU8gPKm5YSXlhWIyxWF+oykt9XAkgSZfMwM86ZdACbcPlxHJnEYLZ8u
         NXMA==
X-Gm-Message-State: AOJu0YwRf2MggnY7ZesSZ62Y7mu0pJH6BIojV5VJvfbnQuuH83uJg06Y
	gE0q2GhACcuBlnI5l530rNqArMD/nwPbKzHhOBQibHTM/NXFUeOY94k+pxPufamey96D/iOW+WM
	re645HtB/SYoXD/oOC7xaCYPTZ0bFXOkUYJGUbb9m8XhFvGr+B6UlC8IFN12kuOKnp92m
X-Gm-Gg: AfdE7cliEl+xVdcAO24Oeu0p/6IaIyZLFX/ONBSRJIF+cWySubSDcdOclgVHYpl//+/
	KegjOVcrR3jroSJJLZmuf3X23ooCQSm8q/n1GaidFJjq1x0/oTrw+npMBJdA9MxB//CdneuRAM0
	k4ux5vDhem6+vG6pGPlePZU4lhUF4I2P6Dup6NuJhADq36CSOq+9+INiTfuBKeCu/PqGkzNwPd/
	ImHlpS6UzSGW46XGImu1o35gewulRHrafjxK6XRvSWkgZYbdDWJKsUNPedUjqNhi+gLImooq8+k
	W74O0t+Hj41ihtL4d12IFunggXjEILiUMLNoNsQScjM9dNM2D5lubKwM6A8uuoQgPdFxQEuxfjT
	2sbiL7JVRJ0isdkMWM2ljMgwfgGn+BlboT74icQvczGRo+6jduRugzvM3MF3lbw==
X-Received: by 2002:a05:7300:e619:b0:30b:d2f5:d503 with SMTP id 5a478bee46e88-30c0750d8fdmr3985062eec.7.1782110521767;
        Sun, 21 Jun 2026 23:42:01 -0700 (PDT)
X-Received: by 2002:a05:7300:e619:b0:30b:d2f5:d503 with SMTP id 5a478bee46e88-30c0750d8fdmr3985042eec.7.1782110521191;
        Sun, 21 Jun 2026 23:42:01 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be95ebfsm9357803eec.31.2026.06.21.23.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:42:00 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: lemans-evk: Enable WCN6855 BT via
 PCIe M.2 Key E connector
Date: Mon, 22 Jun 2026 12:11:55 +0530
Message-Id: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADPZOGoC/x3MSwqAMAwA0atI1gZKihG8irjwEzVQqzQignh3i
 8u3mHnAJKkYNMUDSS413WOGLwsY1z4ugjplAzlix0R4eQyy9dHQjqAnVuJrqpllHBhydSSZ9f6
 Pbfe+H8al/ylhAAAA
X-Change-ID: 20260622-v3-lemans-split-5e372766ecb6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfX7ZWyrWqdhgth
 G2UAM+xYKrUaA1SKpYByPkE5lYZ7qxgcE/Nm/UkSdCvHZJfjdi9hDh664MxIKyNjCv+ueSe0G3h
 TDTjDinpcV6XoPYrWUPZt0QTeHoePpQR52PbagXHXrw/dH7Is+m4fQNny3VcLe899o8ytAKlkaY
 jqeWpUdFY5WxB9CuZFXPI3nfKQ32guTBvVV/DE1oMSCCqm3/7cNHvvY1Rw6LznEcCH/fOCWcDb4
 9++NuSS7Qn0QueFSN7Lu9/zWepgncrJSziiv3x8KQEQS2mWZBmGpfzX8mM1ZaLbmfroEVgqblg1
 W4cUd8B9F33z0Q99GAQkUh/CTPh+EIuja4LAPAr/LwxGmKljmxSUhui8bkTWSwii9V4xYDuSxPX
 f61mWSKFTJ6iK06ugf3aM5BtegbJtVGtIPVEhwxVSY/iFMiHuxEYQyn9O8FvaA11xxOe1F/EiMY
 7mWHhHbiNgzBg06HSeA==
X-Proofpoint-ORIG-GUID: DiCBgjH7GY3fGPD6JY6n6BJ-aOnzLVzT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA2MyBTYWx0ZWRfX1SkHnL4rIX5I
 hQxABE9Uzvt7ICpNQTfL9llLmJB9xJObZfjz+TKnxZMQfejmF6zk5uYJZ4gTXGfBsPLI3hI5beB
 RugGEcc6ZTR8UJwna8SGGdcUtCG2wQc=
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a38d93a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZR8elpf7WTrouCj69ZoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: DiCBgjH7GY3fGPD6JY6n6BJ-aOnzLVzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113937-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:wei.deng@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 722176ACFE2

This series enables the WCN6855 Bluetooth/WLAN module on the lemans EVK
via the PCIe M.2 Key E connector.

Patch 1 adds the PCI-to-PCI bridge compatible to the lemans pcieport0
Root Port in the SoC dtsi, which is required to associate downstream
M.2 connector graph endpoints with their PCI devices.

Patch 2 describes the M.2 Key E connector on lemans-evk and links it
with PCIe RP0 and UART17 via graph ports/endpoints.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
Changes in v3:
- Split the lemans.dtsi pcieport0 compatible into its own patch (Konrad)
- Send as a new thread, switch to b4 workflow (Konrad, Dmitry)
- Carry over Reviewed-by tags since the diff content is unchanged
- Link to v2: https://lore.kernel.org/all/20260615103228.3104083-1-wei.deng@oss.qualcomm.com/

Changes in v2:
- Collect Reviewed-by tag and reorganize the patch (Bartosz)
- Link to v1: https://lore.kernel.org/all/20260608091702.3797437-1-wei.deng@oss.qualcomm.com/

---
Wei Deng (2):
      arm64: dts: qcom: lemans: Add compatible to the PCIe Root Port
      arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 75 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  1 +
 2 files changed, 76 insertions(+)
---
base-commit: e503fdd88e7d8f1922426bca1602049de010a66c
change-id: 20260622-v3-lemans-split-5e372766ecb6

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>


