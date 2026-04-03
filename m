Return-Path: <linux-arm-msm+bounces-101673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A5ZLBrMz2nT0gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:18:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4EA395183
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CBD730EA96D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 14:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D7D27FD74;
	Fri,  3 Apr 2026 14:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tvtd18bg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMqn4PoE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AE23C944E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225502; cv=none; b=G2jFhnaHWZRx4mAoC9KdY2j440AgJqZPKnVabita95dA2FpeKIGb2jcVHr1DQeq0ZzE0RwmF6dLGjEuxeHQIT9N2r7XXiorI/uZvYN8Ux8W0sbn+Fa+qvIKCVRdEVFgwoFp8V8pKp+LyUQaDg4mj6+Hg3hvEr8gSzw7ZIfxVNtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225502; c=relaxed/simple;
	bh=NE/BWtDG9ClEj4ptQXK6VYZJeG6ezvSOz4tGo2hIKfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVMqdCCF9t/W0dh7ZEjJcOFR/OW1gYABoQscslsJGV6LBi6AdbEBXWsANJLGhTtf6y41/nCtbyHg+LQ9wjxWBOh2fsWT0AHQn9HnsZaDZ23J7rX0Br5bXhHoeHoyxFk8cZER5M3Nt7JNFakYL+MNlTkMCWvhBBcPDytJVnD5hdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tvtd18bg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMqn4PoE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633CUbEl824775
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 14:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ac0/CEwESu8BzKKIFYeyx35WJLc/eeh73Tm1FsTbYVY=; b=Tvtd18bg6Fwzkic7
	7+ijxMwuh9JSEnBX0SYwd4QrOFqzzrpDSiMqqxEM9XM+4d4ujySommXkH/zoIqbg
	n7mFpk/n26WtWU5jeIZFbM/jT5pXMa20LfQCdKVjIafVRFBjsmvr2pmoUrbi0p7p
	dsZ6GcybT9+BqmEsm7f3q7JoCrjV3iNKK8GuKZKn71ThR3Vf9hTRG0gOPNUpusr/
	pbggTF0D9/A5gZkI5pFqjzBO/quGXJ10XxvjiitdNw4CDJRR16GwFAgv+Yjj3wqI
	BbD/FIiDtmgUK3tzC42Nj1BRWcbT7AYhlbkT2+3+bbMSFZg2yuIm76rNUyLaEILE
	na5/UA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da6739mrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:11:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-950bdef305cso691043241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 07:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775225491; x=1775830291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ac0/CEwESu8BzKKIFYeyx35WJLc/eeh73Tm1FsTbYVY=;
        b=RMqn4PoEECnPCvrd7l05kkuRDC2Uhj4IONI/fo5/MBhm0Ec0vL6H0ZSznfeO61067K
         XlAWfTiowJxOSEKw3zE1lZTM35KP9Xa0L/i7BVGuCCyZnQ/J9mdPouG1clnnCetslK0c
         4OIYuo//kyHWlgSutpv++/l6BTroHy1ZXOC1sDOkyRBkoajlx3Cx7qosd/lkwoP9dfBY
         0G8ozY6JJTvJi/+7vm/bDGhZmfIWlJBosWwgfpC44KgSenGsOlO6Wwh7lO2C1rLKZffw
         OZD2uA45hI0Au6igKNT2zJjm5JKu6v7kTlhaU49vRMqGQ2oxDXNKpQmu6liIdd+iF/zv
         ixGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225491; x=1775830291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ac0/CEwESu8BzKKIFYeyx35WJLc/eeh73Tm1FsTbYVY=;
        b=nhsDujlyxjbRgb0Nn81ZqZf5qCvsroUgFQzjvuBj+4F2GoFuRVhrGRQ47HfaKrxYwO
         phZXe45Az2NhNE7ncGaSjlN5Wx8HITJI9QhgyQWlZN0tBOU46RahchGrHboLkKDbDeNw
         I9cu9gJ88WCI/GHr5F/ruM7HfW/pu6sxIRcIA7EWklyMzpgqsvuY+cPKZJ9s4lffKJ0h
         EnDC3bBB1GHkgapziNBB1dKr+v6QrV8JG0OkQze+Af+MFPn07ZPtZtLgALdL0zL6Be38
         NjzhJt/Lz9bAKTvpskd2HlUHfpbkzMqMSgUd8cIEypQK8o1QJ0aAeSARLfkq4qNOtayK
         6H5g==
X-Gm-Message-State: AOJu0YwGygRIYNWHFEBc+aR7MSmFqgZXyCkMOxyROVYH2igh6aQD7hKW
	Pa42sxX8ttd0jlpMSysMJWnAz7QgaMFf/MJgODk4n1Xu5U7Qx2Nwcvro+fbBnmZWPI15KZrvWTo
	uubUH5FC8Sk+09WsjGHUYz0WX4cuBOL9n98ZBdyra04w8w1QLFoprk+mVu85SWspz2imJ
X-Gm-Gg: AeBDiesJwwKCZzv3cf70Qk30Kbol4Fb/BI7HI9w4dy4328ewU2Wpk1t8zIS6vZpzzFN
	skHG8sHahKSjUlD14uOcO0VIOe1DBJcRRqI46KuFQGurEA4grqiKWGTz3L4kbdttZzBb0xzHaxq
	AjBZ6KwHzmxxZQbEfKVgqKiFft/T74E/e/sWH28QKu6xMm+BbYL1O/e9RA0h3zI2OiMpgCH6/X2
	Dgihwsk80lG7vWiX9hVzSHZ83d5An5FaAeIW/qPS0CL101jJVCGEPRIs8dUb9sonM4FuxYj1eNZ
	sB1DSJuS2s6XNWRU3GBntV5IvZ7wlLqBMQUoDnFv0ObhyF6Fho3M2AVh5x1i6Gs/HOq/IoVwfME
	u00qJoUSwkTN1CyXVN9UDEGD2atdfBI6rgy68y/RQV6DnGS7WBkw=
X-Received: by 2002:a05:6102:c05:b0:602:a9f3:74ca with SMTP id ada2fe7eead31-605a4cda9aamr904667137.3.1775225489867;
        Fri, 03 Apr 2026 07:11:29 -0700 (PDT)
X-Received: by 2002:a05:6102:c05:b0:602:a9f3:74ca with SMTP id ada2fe7eead31-605a4cda9aamr904647137.3.1775225488693;
        Fri, 03 Apr 2026 07:11:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1b19esm30127315e9.6.2026.04.03.07.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:11:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 16:10:54 +0200
Subject: [PATCH 6/7] clk: qcom: gcc: Add multiple global clock controller
 driver for Nord SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-nord-clks-v1-6-018af14979fd@oss.qualcomm.com>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
In-Reply-To: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=184418;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sBJ3lkx/5Zu1busHMRzVmMM42yg7DTGOXIsyIX7kfx8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8qACQ+1bIN0QUXZtA99nkX5Skhv1td7lYBX7
 EIf/QWhlFaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/KgAAKCRAFnS7L/zaE
 w8n4EACbcPHJqoWBBFVzdXETp/usRWivSFUlitTpZb+pfFjnwkP5iETbHIlHdNzcdZYp/NkMuqN
 jwWfa3CImWPoKu9TAZXyJ1ovwONWbTghcge1rIWuxomYEjXeLIz7oX6MOdAbXkffTBo7XFx2dJw
 LKfcW2ZO3UAClsb4kwNveAp2L+KYN9pakBOVWPj3VC1IN4TYCoSeDHRVo/nW0dRqZ5K36OaTq4p
 xTS+u+PjvtRQcjwTUlzVSSRLMCkOtAoZ9RqwTqRguavvF5c3kJEwjOyK829c3AJlRUTLuofSpif
 3LmL3s2YIkiB8g39EEHKg7iHPfvcUCEOhjgaJ8YpHSlvo/RrGomj7qU1HmJ05J6zT2MdcnsUZr4
 Hs/45LW5TQI+XhSTW/8Rj40jxE6lkWBhKIx7lNx3NJBJIv4c7vqsQ2NBBNwiHCOhdDUOgVLEVmR
 Rd80Es0AYfPvqFFxQlExH+akuiaU1ydiz/JhvKp2FKBuK7PjtoKAaPAecfZTb58G56VfxWb5X+Y
 tC75BHDf37OJqTAi6qEab7Dl1cOyLI8af6dolHQvEF56PitUPoNxtNLeokfRPZehABOZh+zZi0S
 d+SvJNJBl6IZANSeieLQeMLFc+Cn5fMEwNSL3L+JKwuFnPUcUPoo7lbJKi1ACpii27cqFiEtNzf
 j0pIBlTwbDlBDUA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=erjSD4pX c=1 sm=1 tr=0 ts=69cfca94 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=XRXtaDMbpt7w5nDfEPkA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: gYt9ykP35ccIjMfoS5snUiwMsdsVHFxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyNiBTYWx0ZWRfX9K54HmC8tBQ3
 9DRGaV8v7v/U0EVwm6kHWfrFlPfO6C2UWsXLsioGYT/Fn+Z83x0LvFoq+zxHGIaoKgIT5Mw1DLu
 xFY1W65Cu6unma2XXMzto0sneI6znU5V7JD1dx+8+iVsBrOS3/pHfOlK/WOkQGXp7fYd/WUpHUu
 JkdspwpxBum25hfZrBhnu9rtG0weVOceDv46Xkq7wmXaSpVdKUAVTT9anzAk8YkndtEqFBKksF4
 2wt/CbezQxisj4whum0dOrM781yN4/VQVnQNqGkWnuMCEXUx//arZUWahEPjQLK71qPoKQ6h4tr
 gpq3HJZZujBwCZ0nwkm81z/BtTejwI6mtpehkomM+2ZJ3jLYA9kc1C2EDwrA8kEKPv3LCD5Jq1M
 +cQyVcMbTaJvVg7A2W/Qr9cjQZLb+pA0d07DOUFeQVwGWatxTu3uFNr2bsKDEPJRtygQ0QK/yB7
 7Q8mjHb7Jiq7JW9kmuQ==
X-Proofpoint-GUID: gYt9ykP35ccIjMfoS5snUiwMsdsVHFxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101673-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,quicinc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA4EA395183
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Taniya Das <taniya.das@oss.qualcomm.com>

The global clock controller on the Nord SoC is partitioned into
GCC, SE_GCC, NE_GCC, and NW_GCC. Introduce driver support for each
of these controllers.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
[Shawn: Drop include of <linux/of.h> as the driver doesn't use any OF APIs]
Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig      |   10 +
 drivers/clk/qcom/Makefile     |    1 +
 drivers/clk/qcom/gcc-nord.c   | 1901 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/negcc-nord.c | 1987 +++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/nwgcc-nord.c |  688 ++++++++++++++
 drivers/clk/qcom/segcc-nord.c | 1609 +++++++++++++++++++++++++++++++++
 6 files changed, 6196 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 10c74db7e072f560f4bc26f81b4378034d1f9bf6..87efdf67124b3e1c2b6c5b976ef404aaa2ab5c23 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -145,6 +145,16 @@ config CLK_KAANAPALI_VIDEOCC
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 
+config CLK_NORD_GCC
+	tristate "Nord Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the global clock controller on Nord devices.
+	  Say Y if you want to use peripheral devices such as UART,
+	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
+	  of GCC, SE_GCC, NE_GCC and NW_GCC.
+
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 1a7ff1986b834f48dbaa2fd8c2559f0046ea7579..397261e9e387b4a1612296822076c1c001787ad7 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GPUCC) += gpucc-kaanapali.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
+obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..ab24ebeadbdd23b2094d915bd8a8c83ae91e0e4f
--- /dev/null
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -0,0 +1,1901 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-gcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "clk-regmap-phy-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+	DT_PCIE_A_PIPE_CLK,
+	DT_PCIE_B_PIPE_CLK,
+	DT_PCIE_C_PIPE_CLK,
+	DT_PCIE_D_PIPE_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GCC_GPLL0_OUT_EVEN,
+	P_GCC_GPLL0_OUT_MAIN,
+	P_PCIE_A_PIPE_CLK,
+	P_PCIE_B_PIPE_CLK,
+	P_PCIE_C_PIPE_CLK,
+	P_PCIE_D_PIPE_CLK,
+	P_SLEEP_CLK,
+};
+
+static struct clk_alpha_pll gcc_gpll0 = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x9d020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gpll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gcc_gpll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gcc_gpll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_gcc_gpll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_gcc_gpll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_gpll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_gpll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+static const struct parent_map gcc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_GCC_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gcc_gpll0.clkr.hw },
+	{ .hw = &gcc_gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data gcc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map gcc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_GCC_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gcc_gpll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &gcc_gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GCC_GPLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data gcc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gcc_gpll0.clkr.hw },
+};
+
+static struct clk_regmap_phy_mux gcc_pcie_a_pipe_clk_src = {
+	.reg = 0x49094,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_a_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_PCIE_A_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_pcie_b_pipe_clk_src = {
+	.reg = 0x4a094,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_b_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_PCIE_B_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_pcie_c_pipe_clk_src = {
+	.reg = 0x4b094,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_c_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_PCIE_C_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_pcie_d_pipe_clk_src = {
+	.reg = 0x4c094,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_d_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_PCIE_D_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
+	F(66666667, P_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_GCC_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_gp1_clk_src = {
+	.cmd_rcgr = 0x30004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_gp1_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_gp2_clk_src = {
+	.cmd_rcgr = 0x31004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_gp2_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie_a_aux_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie_a_aux_clk_src = {
+	.cmd_rcgr = 0x49098,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie_a_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_a_aux_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_a_phy_aux_clk_src = {
+	.cmd_rcgr = 0x4d020,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie_a_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_a_phy_aux_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie_a_phy_rchng_clk_src[] = {
+	F(66666667, P_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie_a_phy_rchng_clk_src = {
+	.cmd_rcgr = 0x4907c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pcie_a_phy_rchng_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_a_phy_rchng_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_b_aux_clk_src = {
+	.cmd_rcgr = 0x4a098,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie_a_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_b_aux_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_b_phy_aux_clk_src = {
+	.cmd_rcgr = 0x4e020,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie_a_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_b_phy_aux_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_b_phy_rchng_clk_src = {
+	.cmd_rcgr = 0x4a07c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pcie_a_phy_rchng_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_b_phy_rchng_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_c_aux_clk_src = {
+	.cmd_rcgr = 0x4b098,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie_a_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_c_aux_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_c_phy_aux_clk_src = {
+	.cmd_rcgr = 0x4f020,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie_a_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_c_phy_aux_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_c_phy_rchng_clk_src = {
+	.cmd_rcgr = 0x4b07c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_pcie_a_phy_rchng_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_c_phy_rchng_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_d_aux_clk_src = {
+	.cmd_rcgr = 0x4c098,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie_a_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_d_aux_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_d_phy_aux_clk_src = {
+	.cmd_rcgr = 0x50020,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie_a_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_d_phy_aux_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_d_phy_rchng_clk_src = {
+	.cmd_rcgr = 0x4c07c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_pcie_a_phy_rchng_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_d_phy_rchng_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_noc_refgen_clk_src = {
+	.cmd_rcgr = 0x52094,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pcie_a_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_noc_refgen_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie_noc_safety_clk_src = {
+	.cmd_rcgr = 0x520ac,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pcie_a_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_noc_safety_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pdm2_clk_src[] = {
+	F(40000000, P_GCC_GPLL0_OUT_MAIN, 15, 0, 0),
+	F(60000000, P_GCC_GPLL0_OUT_MAIN, 10, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pdm2_clk_src = {
+	.cmd_rcgr = 0x1a010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pdm2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm2_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qupv3_wrap3_qspi_ref_clk_src[] = {
+	F(7372800, P_GCC_GPLL0_OUT_EVEN, 1, 384, 15625),
+	F(14745600, P_GCC_GPLL0_OUT_EVEN, 1, 768, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_GCC_GPLL0_OUT_EVEN, 1, 1536, 15625),
+	F(32000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 75),
+	F(48000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 25),
+	F(51200000, P_GCC_GPLL0_OUT_EVEN, 1, 64, 375),
+	F(64000000, P_GCC_GPLL0_OUT_EVEN, 1, 16, 75),
+	F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
+	F(80000000, P_GCC_GPLL0_OUT_EVEN, 1, 4, 15),
+	F(96000000, P_GCC_GPLL0_OUT_EVEN, 1, 8, 25),
+	F(100000000, P_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(102400000, P_GCC_GPLL0_OUT_EVEN, 1, 128, 375),
+	F(112000000, P_GCC_GPLL0_OUT_EVEN, 1, 28, 75),
+	F(117964800, P_GCC_GPLL0_OUT_EVEN, 1, 6144, 15625),
+	F(120000000, P_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
+	F(150000000, P_GCC_GPLL0_OUT_EVEN, 2, 0, 0),
+	F(240000000, P_GCC_GPLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_init_data gcc_qupv3_wrap3_qspi_ref_clk_src_init = {
+	.name = "gcc_qupv3_wrap3_qspi_ref_clk_src",
+	.parent_data = gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap3_qspi_ref_clk_src = {
+	.cmd_rcgr = 0x23174,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap3_qspi_ref_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap3_qspi_ref_clk_src_init,
+};
+
+static struct clk_regmap_div gcc_qupv3_wrap3_s0_clk_src = {
+	.reg = 0x2316c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap3_s0_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_qupv3_wrap3_qspi_ref_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gcc_boot_rom_ahb_clk = {
+	.halt_reg = 0x1f004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1f004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_boot_rom_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp1_clk = {
+	.halt_reg = 0x30000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x30000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp2_clk = {
+	.halt_reg = 0x31000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x31000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gp2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gp2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mmu_0_tcu_vote_clk = {
+	.halt_reg = 0x7d094,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7d094,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_mmu_0_tcu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_a_aux_clk = {
+	.halt_reg = 0x49058,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x49058,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(14),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_a_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_a_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_a_cfg_ahb_clk = {
+	.halt_reg = 0x49054,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x49054,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(13),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_a_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_a_dti_qtc_clk = {
+	.halt_reg = 0x49018,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x49018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(8),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_a_dti_qtc_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_a_mstr_axi_clk = {
+	.halt_reg = 0x49040,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x49040,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(12),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_a_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_a_phy_aux_clk = {
+	.halt_reg = 0x4d01c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(12),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_a_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_a_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_a_phy_rchng_clk = {
+	.halt_reg = 0x49078,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x49078,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(16),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_a_phy_rchng_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_a_phy_rchng_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_a_pipe_clk = {
+	.halt_reg = 0x49068,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x49068,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(15),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_a_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_a_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_a_slv_axi_clk = {
+	.halt_reg = 0x4902c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x4902c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(11),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_a_slv_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_a_slv_q2a_axi_clk = {
+	.halt_reg = 0x49024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x49024,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(10),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_a_slv_q2a_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_b_aux_clk = {
+	.halt_reg = 0x4a058,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(23),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_b_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_b_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_b_cfg_ahb_clk = {
+	.halt_reg = 0x4a054,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x4a054,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(22),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_b_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_b_dti_qtc_clk = {
+	.halt_reg = 0x4a018,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x4a018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(17),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_b_dti_qtc_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_b_mstr_axi_clk = {
+	.halt_reg = 0x4a040,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x4a040,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(21),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_b_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_b_phy_aux_clk = {
+	.halt_reg = 0x4e01c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(13),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_b_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_b_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_b_phy_rchng_clk = {
+	.halt_reg = 0x4a078,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(25),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_b_phy_rchng_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_b_phy_rchng_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_b_pipe_clk = {
+	.halt_reg = 0x4a068,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(24),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_b_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_b_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_b_slv_axi_clk = {
+	.halt_reg = 0x4a02c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x4a02c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(20),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_b_slv_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_b_slv_q2a_axi_clk = {
+	.halt_reg = 0x4a024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(19),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_b_slv_q2a_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_c_aux_clk = {
+	.halt_reg = 0x4b058,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_c_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_c_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_c_cfg_ahb_clk = {
+	.halt_reg = 0x4b054,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x4b054,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(31),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_c_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_c_dti_qtc_clk = {
+	.halt_reg = 0x4b018,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x4b018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(26),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_c_dti_qtc_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_c_mstr_axi_clk = {
+	.halt_reg = 0x4b040,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x4b040,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(30),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_c_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_c_phy_aux_clk = {
+	.halt_reg = 0x4f01c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(14),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_c_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_c_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_c_phy_rchng_clk = {
+	.halt_reg = 0x4b078,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(2),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_c_phy_rchng_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_c_phy_rchng_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_c_pipe_clk = {
+	.halt_reg = 0x4b068,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_c_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_c_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_c_slv_axi_clk = {
+	.halt_reg = 0x4b02c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x4b02c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(29),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_c_slv_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_c_slv_q2a_axi_clk = {
+	.halt_reg = 0x4b024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d008,
+		.enable_mask = BIT(28),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_c_slv_q2a_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_d_aux_clk = {
+	.halt_reg = 0x4c058,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(9),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_d_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_d_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_d_cfg_ahb_clk = {
+	.halt_reg = 0x4c054,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x4c054,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(8),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_d_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_d_dti_qtc_clk = {
+	.halt_reg = 0x4c018,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x4c018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(3),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_d_dti_qtc_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_d_mstr_axi_clk = {
+	.halt_reg = 0x4c040,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x4c040,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(7),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_d_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_d_phy_aux_clk = {
+	.halt_reg = 0x5001c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(16),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_d_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_d_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_d_phy_rchng_clk = {
+	.halt_reg = 0x4c078,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(11),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_d_phy_rchng_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_d_phy_rchng_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_d_pipe_clk = {
+	.halt_reg = 0x4c068,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(10),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_d_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_d_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_d_slv_axi_clk = {
+	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x4c02c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(6),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_d_slv_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_d_slv_q2a_axi_clk = {
+	.halt_reg = 0x4c024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(5),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_d_slv_q2a_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_link_ahb_clk = {
+	.halt_reg = 0x52464,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x52464,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_link_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_link_xo_clk = {
+	.halt_reg = 0x52468,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x52468,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52468,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_link_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_async_bridge_clk = {
+	.halt_reg = 0x52048,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x52048,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d018,
+		.enable_mask = BIT(18),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_async_bridge_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_cnoc_sf_qx_clk = {
+	.halt_reg = 0x52040,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x52040,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(24),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_cnoc_sf_qx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_m_cfg_clk = {
+	.halt_reg = 0x52060,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x52060,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d018,
+		.enable_mask = BIT(4),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_m_cfg_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_m_pdb_clk = {
+	.halt_reg = 0x52084,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x52084,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d018,
+		.enable_mask = BIT(8),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_m_pdb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_mstr_axi_clk = {
+	.halt_reg = 0x52050,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x52050,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(25),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_mstr_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_pwrctl_clk = {
+	.halt_reg = 0x52080,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d018,
+		.enable_mask = BIT(7),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_pwrctl_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_qosgen_extref_clk = {
+	.halt_reg = 0x52074,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(19),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_qosgen_extref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_refgen_clk = {
+	.halt_reg = 0x52078,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x52078,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_refgen_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_noc_refgen_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_s_cfg_clk = {
+	.halt_reg = 0x52064,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d018,
+		.enable_mask = BIT(5),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_s_cfg_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_s_pdb_clk = {
+	.halt_reg = 0x5208c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x5208c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d018,
+		.enable_mask = BIT(9),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_s_pdb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_safety_clk = {
+	.halt_reg = 0x5207c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5207c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_safety_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_noc_safety_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_slave_axi_clk = {
+	.halt_reg = 0x52058,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x52058,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(26),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_slave_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_tsctr_clk = {
+	.halt_reg = 0x52070,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(18),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_tsctr_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_noc_xo_clk = {
+	.halt_reg = 0x52068,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d018,
+		.enable_mask = BIT(6),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_noc_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm2_clk = {
+	.halt_reg = 0x1a00c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1a00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pdm2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_ahb_clk = {
+	.halt_reg = 0x1a004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x1a004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pdm_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_xo4_clk = {
+	.halt_reg = 0x1a008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1a008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pdm_xo4_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap3_core_2x_clk = {
+	.halt_reg = 0x23020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d000,
+		.enable_mask = BIT(24),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap3_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap3_core_clk = {
+	.halt_reg = 0x2300c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d000,
+		.enable_mask = BIT(23),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap3_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap3_m_clk = {
+	.halt_reg = 0x23004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x23004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d000,
+		.enable_mask = BIT(22),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap3_m_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap3_qspi_ref_clk = {
+	.halt_reg = 0x23170,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d000,
+		.enable_mask = BIT(26),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap3_qspi_ref_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap3_qspi_ref_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap3_s0_clk = {
+	.halt_reg = 0x2315c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9d000,
+		.enable_mask = BIT(25),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap3_s0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap3_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap3_s_ahb_clk = {
+	.halt_reg = 0x23008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x23008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x9d010,
+		.enable_mask = BIT(15),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap3_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_smmu_pcie_qtc_vote_clk = {
+	.halt_reg = 0x7d0b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7d0b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_smmu_pcie_qtc_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gcc_pcie_a_gdsc = {
+	.gdscr = 0x49004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x8d02c,
+	.collapse_mask = BIT(1),
+	.pd = {
+		.name = "gcc_pcie_a_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct gdsc gcc_pcie_a_phy_gdsc = {
+	.gdscr = 0x4d004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x8d02c,
+	.collapse_mask = BIT(5),
+	.pd = {
+		.name = "gcc_pcie_a_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct gdsc gcc_pcie_b_gdsc = {
+	.gdscr = 0x4a004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x8d02c,
+	.collapse_mask = BIT(2),
+	.pd = {
+		.name = "gcc_pcie_b_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct gdsc gcc_pcie_b_phy_gdsc = {
+	.gdscr = 0x4e004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x8d02c,
+	.collapse_mask = BIT(6),
+	.pd = {
+		.name = "gcc_pcie_b_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct gdsc gcc_pcie_c_gdsc = {
+	.gdscr = 0x4b004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x8d02c,
+	.collapse_mask = BIT(3),
+	.pd = {
+		.name = "gcc_pcie_c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct gdsc gcc_pcie_c_phy_gdsc = {
+	.gdscr = 0x4f004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x8d02c,
+	.collapse_mask = BIT(7),
+	.pd = {
+		.name = "gcc_pcie_c_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct gdsc gcc_pcie_d_gdsc = {
+	.gdscr = 0x4c004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x8d02c,
+	.collapse_mask = BIT(4),
+	.pd = {
+		.name = "gcc_pcie_d_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct gdsc gcc_pcie_d_phy_gdsc = {
+	.gdscr = 0x50004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x8d02c,
+	.collapse_mask = BIT(8),
+	.pd = {
+		.name = "gcc_pcie_d_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct gdsc gcc_pcie_noc_gdsc = {
+	.gdscr = 0x52004,
+	.gds_hw_ctrl = 0x52018,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x8d02c,
+	.collapse_mask = BIT(0),
+	.pd = {
+		.name = "gcc_pcie_noc_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct clk_regmap *gcc_nord_clocks[] = {
+	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
+	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
+	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
+	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
+	[GCC_GP2_CLK_SRC] = &gcc_gp2_clk_src.clkr,
+	[GCC_GPLL0] = &gcc_gpll0.clkr,
+	[GCC_GPLL0_OUT_EVEN] = &gcc_gpll0_out_even.clkr,
+	[GCC_MMU_0_TCU_VOTE_CLK] = &gcc_mmu_0_tcu_vote_clk.clkr,
+	[GCC_PCIE_A_AUX_CLK] = &gcc_pcie_a_aux_clk.clkr,
+	[GCC_PCIE_A_AUX_CLK_SRC] = &gcc_pcie_a_aux_clk_src.clkr,
+	[GCC_PCIE_A_CFG_AHB_CLK] = &gcc_pcie_a_cfg_ahb_clk.clkr,
+	[GCC_PCIE_A_DTI_QTC_CLK] = &gcc_pcie_a_dti_qtc_clk.clkr,
+	[GCC_PCIE_A_MSTR_AXI_CLK] = &gcc_pcie_a_mstr_axi_clk.clkr,
+	[GCC_PCIE_A_PHY_AUX_CLK] = &gcc_pcie_a_phy_aux_clk.clkr,
+	[GCC_PCIE_A_PHY_AUX_CLK_SRC] = &gcc_pcie_a_phy_aux_clk_src.clkr,
+	[GCC_PCIE_A_PHY_RCHNG_CLK] = &gcc_pcie_a_phy_rchng_clk.clkr,
+	[GCC_PCIE_A_PHY_RCHNG_CLK_SRC] = &gcc_pcie_a_phy_rchng_clk_src.clkr,
+	[GCC_PCIE_A_PIPE_CLK] = &gcc_pcie_a_pipe_clk.clkr,
+	[GCC_PCIE_A_PIPE_CLK_SRC] = &gcc_pcie_a_pipe_clk_src.clkr,
+	[GCC_PCIE_A_SLV_AXI_CLK] = &gcc_pcie_a_slv_axi_clk.clkr,
+	[GCC_PCIE_A_SLV_Q2A_AXI_CLK] = &gcc_pcie_a_slv_q2a_axi_clk.clkr,
+	[GCC_PCIE_B_AUX_CLK] = &gcc_pcie_b_aux_clk.clkr,
+	[GCC_PCIE_B_AUX_CLK_SRC] = &gcc_pcie_b_aux_clk_src.clkr,
+	[GCC_PCIE_B_CFG_AHB_CLK] = &gcc_pcie_b_cfg_ahb_clk.clkr,
+	[GCC_PCIE_B_DTI_QTC_CLK] = &gcc_pcie_b_dti_qtc_clk.clkr,
+	[GCC_PCIE_B_MSTR_AXI_CLK] = &gcc_pcie_b_mstr_axi_clk.clkr,
+	[GCC_PCIE_B_PHY_AUX_CLK] = &gcc_pcie_b_phy_aux_clk.clkr,
+	[GCC_PCIE_B_PHY_AUX_CLK_SRC] = &gcc_pcie_b_phy_aux_clk_src.clkr,
+	[GCC_PCIE_B_PHY_RCHNG_CLK] = &gcc_pcie_b_phy_rchng_clk.clkr,
+	[GCC_PCIE_B_PHY_RCHNG_CLK_SRC] = &gcc_pcie_b_phy_rchng_clk_src.clkr,
+	[GCC_PCIE_B_PIPE_CLK] = &gcc_pcie_b_pipe_clk.clkr,
+	[GCC_PCIE_B_PIPE_CLK_SRC] = &gcc_pcie_b_pipe_clk_src.clkr,
+	[GCC_PCIE_B_SLV_AXI_CLK] = &gcc_pcie_b_slv_axi_clk.clkr,
+	[GCC_PCIE_B_SLV_Q2A_AXI_CLK] = &gcc_pcie_b_slv_q2a_axi_clk.clkr,
+	[GCC_PCIE_C_AUX_CLK] = &gcc_pcie_c_aux_clk.clkr,
+	[GCC_PCIE_C_AUX_CLK_SRC] = &gcc_pcie_c_aux_clk_src.clkr,
+	[GCC_PCIE_C_CFG_AHB_CLK] = &gcc_pcie_c_cfg_ahb_clk.clkr,
+	[GCC_PCIE_C_DTI_QTC_CLK] = &gcc_pcie_c_dti_qtc_clk.clkr,
+	[GCC_PCIE_C_MSTR_AXI_CLK] = &gcc_pcie_c_mstr_axi_clk.clkr,
+	[GCC_PCIE_C_PHY_AUX_CLK] = &gcc_pcie_c_phy_aux_clk.clkr,
+	[GCC_PCIE_C_PHY_AUX_CLK_SRC] = &gcc_pcie_c_phy_aux_clk_src.clkr,
+	[GCC_PCIE_C_PHY_RCHNG_CLK] = &gcc_pcie_c_phy_rchng_clk.clkr,
+	[GCC_PCIE_C_PHY_RCHNG_CLK_SRC] = &gcc_pcie_c_phy_rchng_clk_src.clkr,
+	[GCC_PCIE_C_PIPE_CLK] = &gcc_pcie_c_pipe_clk.clkr,
+	[GCC_PCIE_C_PIPE_CLK_SRC] = &gcc_pcie_c_pipe_clk_src.clkr,
+	[GCC_PCIE_C_SLV_AXI_CLK] = &gcc_pcie_c_slv_axi_clk.clkr,
+	[GCC_PCIE_C_SLV_Q2A_AXI_CLK] = &gcc_pcie_c_slv_q2a_axi_clk.clkr,
+	[GCC_PCIE_D_AUX_CLK] = &gcc_pcie_d_aux_clk.clkr,
+	[GCC_PCIE_D_AUX_CLK_SRC] = &gcc_pcie_d_aux_clk_src.clkr,
+	[GCC_PCIE_D_CFG_AHB_CLK] = &gcc_pcie_d_cfg_ahb_clk.clkr,
+	[GCC_PCIE_D_DTI_QTC_CLK] = &gcc_pcie_d_dti_qtc_clk.clkr,
+	[GCC_PCIE_D_MSTR_AXI_CLK] = &gcc_pcie_d_mstr_axi_clk.clkr,
+	[GCC_PCIE_D_PHY_AUX_CLK] = &gcc_pcie_d_phy_aux_clk.clkr,
+	[GCC_PCIE_D_PHY_AUX_CLK_SRC] = &gcc_pcie_d_phy_aux_clk_src.clkr,
+	[GCC_PCIE_D_PHY_RCHNG_CLK] = &gcc_pcie_d_phy_rchng_clk.clkr,
+	[GCC_PCIE_D_PHY_RCHNG_CLK_SRC] = &gcc_pcie_d_phy_rchng_clk_src.clkr,
+	[GCC_PCIE_D_PIPE_CLK] = &gcc_pcie_d_pipe_clk.clkr,
+	[GCC_PCIE_D_PIPE_CLK_SRC] = &gcc_pcie_d_pipe_clk_src.clkr,
+	[GCC_PCIE_D_SLV_AXI_CLK] = &gcc_pcie_d_slv_axi_clk.clkr,
+	[GCC_PCIE_D_SLV_Q2A_AXI_CLK] = &gcc_pcie_d_slv_q2a_axi_clk.clkr,
+	[GCC_PCIE_LINK_AHB_CLK] = &gcc_pcie_link_ahb_clk.clkr,
+	[GCC_PCIE_LINK_XO_CLK] = &gcc_pcie_link_xo_clk.clkr,
+	[GCC_PCIE_NOC_ASYNC_BRIDGE_CLK] = &gcc_pcie_noc_async_bridge_clk.clkr,
+	[GCC_PCIE_NOC_CNOC_SF_QX_CLK] = &gcc_pcie_noc_cnoc_sf_qx_clk.clkr,
+	[GCC_PCIE_NOC_M_CFG_CLK] = &gcc_pcie_noc_m_cfg_clk.clkr,
+	[GCC_PCIE_NOC_M_PDB_CLK] = &gcc_pcie_noc_m_pdb_clk.clkr,
+	[GCC_PCIE_NOC_MSTR_AXI_CLK] = &gcc_pcie_noc_mstr_axi_clk.clkr,
+	[GCC_PCIE_NOC_PWRCTL_CLK] = &gcc_pcie_noc_pwrctl_clk.clkr,
+	[GCC_PCIE_NOC_QOSGEN_EXTREF_CLK] = &gcc_pcie_noc_qosgen_extref_clk.clkr,
+	[GCC_PCIE_NOC_REFGEN_CLK] = &gcc_pcie_noc_refgen_clk.clkr,
+	[GCC_PCIE_NOC_REFGEN_CLK_SRC] = &gcc_pcie_noc_refgen_clk_src.clkr,
+	[GCC_PCIE_NOC_S_CFG_CLK] = &gcc_pcie_noc_s_cfg_clk.clkr,
+	[GCC_PCIE_NOC_S_PDB_CLK] = &gcc_pcie_noc_s_pdb_clk.clkr,
+	[GCC_PCIE_NOC_SAFETY_CLK] = &gcc_pcie_noc_safety_clk.clkr,
+	[GCC_PCIE_NOC_SAFETY_CLK_SRC] = &gcc_pcie_noc_safety_clk_src.clkr,
+	[GCC_PCIE_NOC_SLAVE_AXI_CLK] = &gcc_pcie_noc_slave_axi_clk.clkr,
+	[GCC_PCIE_NOC_TSCTR_CLK] = &gcc_pcie_noc_tsctr_clk.clkr,
+	[GCC_PCIE_NOC_XO_CLK] = &gcc_pcie_noc_xo_clk.clkr,
+	[GCC_PDM2_CLK] = &gcc_pdm2_clk.clkr,
+	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
+	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
+	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_QUPV3_WRAP3_CORE_2X_CLK] = &gcc_qupv3_wrap3_core_2x_clk.clkr,
+	[GCC_QUPV3_WRAP3_CORE_CLK] = &gcc_qupv3_wrap3_core_clk.clkr,
+	[GCC_QUPV3_WRAP3_M_CLK] = &gcc_qupv3_wrap3_m_clk.clkr,
+	[GCC_QUPV3_WRAP3_QSPI_REF_CLK] = &gcc_qupv3_wrap3_qspi_ref_clk.clkr,
+	[GCC_QUPV3_WRAP3_QSPI_REF_CLK_SRC] = &gcc_qupv3_wrap3_qspi_ref_clk_src.clkr,
+	[GCC_QUPV3_WRAP3_S0_CLK] = &gcc_qupv3_wrap3_s0_clk.clkr,
+	[GCC_QUPV3_WRAP3_S0_CLK_SRC] = &gcc_qupv3_wrap3_s0_clk_src.clkr,
+	[GCC_QUPV3_WRAP3_S_AHB_CLK] = &gcc_qupv3_wrap3_s_ahb_clk.clkr,
+	[GCC_SMMU_PCIE_QTC_VOTE_CLK] = &gcc_smmu_pcie_qtc_vote_clk.clkr,
+};
+
+static struct gdsc *gcc_nord_gdscs[] = {
+	[GCC_PCIE_A_GDSC] = &gcc_pcie_a_gdsc,
+	[GCC_PCIE_A_PHY_GDSC] = &gcc_pcie_a_phy_gdsc,
+	[GCC_PCIE_B_GDSC] = &gcc_pcie_b_gdsc,
+	[GCC_PCIE_B_PHY_GDSC] = &gcc_pcie_b_phy_gdsc,
+	[GCC_PCIE_C_GDSC] = &gcc_pcie_c_gdsc,
+	[GCC_PCIE_C_PHY_GDSC] = &gcc_pcie_c_phy_gdsc,
+	[GCC_PCIE_D_GDSC] = &gcc_pcie_d_gdsc,
+	[GCC_PCIE_D_PHY_GDSC] = &gcc_pcie_d_phy_gdsc,
+	[GCC_PCIE_NOC_GDSC] = &gcc_pcie_noc_gdsc,
+};
+
+static const struct qcom_reset_map gcc_nord_resets[] = {
+	[GCC_PCIE_A_BCR] = { 0x49000 },
+	[GCC_PCIE_A_LINK_DOWN_BCR] = { 0xb9000 },
+	[GCC_PCIE_A_NOCSR_COM_PHY_BCR] = { 0xb900c },
+	[GCC_PCIE_A_PHY_BCR] = { 0x4d000 },
+	[GCC_PCIE_A_PHY_CFG_AHB_BCR] = { 0xb9014 },
+	[GCC_PCIE_A_PHY_COM_BCR] = { 0xb9018 },
+	[GCC_PCIE_A_PHY_NOCSR_COM_PHY_BCR] = { 0xb9010 },
+	[GCC_PCIE_B_BCR] = { 0x4a000 },
+	[GCC_PCIE_B_LINK_DOWN_BCR] = { 0xba000 },
+	[GCC_PCIE_B_NOCSR_COM_PHY_BCR] = { 0xba008 },
+	[GCC_PCIE_B_PHY_BCR] = { 0x4e000 },
+	[GCC_PCIE_B_PHY_CFG_AHB_BCR] = { 0xba010 },
+	[GCC_PCIE_B_PHY_COM_BCR] = { 0xba014 },
+	[GCC_PCIE_B_PHY_NOCSR_COM_PHY_BCR] = { 0xba00c },
+	[GCC_PCIE_C_BCR] = { 0x4b000 },
+	[GCC_PCIE_C_LINK_DOWN_BCR] = { 0xbb07c },
+	[GCC_PCIE_C_NOCSR_COM_PHY_BCR] = { 0xbb084 },
+	[GCC_PCIE_C_PHY_BCR] = { 0x4f000 },
+	[GCC_PCIE_C_PHY_CFG_AHB_BCR] = { 0xbb08c },
+	[GCC_PCIE_C_PHY_COM_BCR] = { 0xbb090 },
+	[GCC_PCIE_C_PHY_NOCSR_COM_PHY_BCR] = { 0xbb088 },
+	[GCC_PCIE_D_BCR] = { 0x4c000 },
+	[GCC_PCIE_D_LINK_DOWN_BCR] = { 0xbc000 },
+	[GCC_PCIE_D_NOCSR_COM_PHY_BCR] = { 0xbc008 },
+	[GCC_PCIE_D_PHY_BCR] = { 0x50000 },
+	[GCC_PCIE_D_PHY_CFG_AHB_BCR] = { 0xbc010 },
+	[GCC_PCIE_D_PHY_COM_BCR] = { 0xbc014 },
+	[GCC_PCIE_D_PHY_NOCSR_COM_PHY_BCR] = { 0xbc00c },
+	[GCC_PCIE_NOC_BCR] = { 0x52000 },
+	[GCC_PDM_BCR] = { 0x1a000 },
+	[GCC_QUPV3_WRAPPER_3_BCR] = { 0x23000 },
+	[GCC_TCSR_PCIE_BCR] = { 0xb901c },
+};
+
+static const struct clk_rcg_dfs_data gcc_nord_dfs_clocks[] = {
+	DEFINE_RCG_DFS(gcc_qupv3_wrap3_qspi_ref_clk_src),
+};
+
+static const struct regmap_config gcc_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1f41f0,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data gcc_nord_driver_data = {
+	.dfs_rcgs = gcc_nord_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_nord_dfs_clocks),
+};
+
+static const struct qcom_cc_desc gcc_nord_desc = {
+	.config = &gcc_nord_regmap_config,
+	.clks = gcc_nord_clocks,
+	.num_clks = ARRAY_SIZE(gcc_nord_clocks),
+	.resets = gcc_nord_resets,
+	.num_resets = ARRAY_SIZE(gcc_nord_resets),
+	.gdscs = gcc_nord_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_nord_gdscs),
+	.driver_data = &gcc_nord_driver_data,
+};
+
+static const struct of_device_id gcc_nord_match_table[] = {
+	{ .compatible = "qcom,nord-gcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gcc_nord_match_table);
+
+static int gcc_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gcc_nord_desc);
+}
+
+static struct platform_driver gcc_nord_driver = {
+	.probe = gcc_nord_probe,
+	.driver = {
+		.name = "gcc-nord",
+		.of_match_table = gcc_nord_match_table,
+	},
+};
+
+static int __init gcc_nord_init(void)
+{
+	return platform_driver_register(&gcc_nord_driver);
+}
+subsys_initcall(gcc_nord_init);
+
+static void __exit gcc_nord_exit(void)
+{
+	platform_driver_unregister(&gcc_nord_driver);
+}
+module_exit(gcc_nord_exit);
+
+MODULE_DESCRIPTION("QTI GCC NORD Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..1aa24e2784e536e6b6e76f488abd0e2fcc435380
--- /dev/null
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -0,0 +1,1987 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-negcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "clk-regmap-phy-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+	DT_UFS_PHY_RX_SYMBOL_0_CLK,
+	DT_UFS_PHY_RX_SYMBOL_1_CLK,
+	DT_UFS_PHY_TX_SYMBOL_0_CLK,
+	DT_USB3_PHY_SEC_WRAPPER_NE_GCC_USB31_PIPE_CLK,
+	DT_USB3_PHY_WRAPPER_NE_GCC_USB31_PIPE_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_NE_GCC_GPLL0_OUT_EVEN,
+	P_NE_GCC_GPLL0_OUT_MAIN,
+	P_NE_GCC_GPLL2_OUT_MAIN,
+	P_SLEEP_CLK,
+	P_UFS_PHY_RX_SYMBOL_0_CLK,
+	P_UFS_PHY_RX_SYMBOL_1_CLK,
+	P_UFS_PHY_TX_SYMBOL_0_CLK,
+	P_USB3_PHY_SEC_WRAPPER_NE_GCC_USB31_PIPE_CLK,
+	P_USB3_PHY_WRAPPER_NE_GCC_USB31_PIPE_CLK,
+};
+
+static struct clk_alpha_pll ne_gcc_gpll0 = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_gpll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_ne_gcc_gpll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv ne_gcc_gpll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_ne_gcc_gpll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_ne_gcc_gpll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_gpll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&ne_gcc_gpll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+static struct clk_alpha_pll ne_gcc_gpll2 = {
+	.offset = 0x2000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(2),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_gpll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map ne_gcc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_NE_GCC_GPLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data ne_gcc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &ne_gcc_gpll0.clkr.hw },
+};
+
+static const struct parent_map ne_gcc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_NE_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_NE_GCC_GPLL0_OUT_EVEN, 5 },
+};
+
+static const struct clk_parent_data ne_gcc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &ne_gcc_gpll0.clkr.hw },
+	{ .hw = &ne_gcc_gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map ne_gcc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_NE_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_NE_GCC_GPLL2_OUT_MAIN, 3 },
+};
+
+static const struct clk_parent_data ne_gcc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &ne_gcc_gpll0.clkr.hw },
+	{ .hw = &ne_gcc_gpll2.clkr.hw },
+};
+
+static const struct parent_map ne_gcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data ne_gcc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map ne_gcc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_NE_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data ne_gcc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &ne_gcc_gpll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map ne_gcc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data ne_gcc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map ne_gcc_parent_map_6[] = {
+	{ P_USB3_PHY_WRAPPER_NE_GCC_USB31_PIPE_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data ne_gcc_parent_data_6[] = {
+	{ .index = DT_USB3_PHY_WRAPPER_NE_GCC_USB31_PIPE_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map ne_gcc_parent_map_7[] = {
+	{ P_USB3_PHY_SEC_WRAPPER_NE_GCC_USB31_PIPE_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data ne_gcc_parent_data_7[] = {
+	{ .index = DT_USB3_PHY_SEC_WRAPPER_NE_GCC_USB31_PIPE_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static struct clk_regmap_phy_mux ne_gcc_ufs_phy_rx_symbol_0_clk_src = {
+	.reg = 0x33068,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_ufs_phy_rx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_RX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux ne_gcc_ufs_phy_rx_symbol_1_clk_src = {
+	.reg = 0x330f0,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_ufs_phy_rx_symbol_1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_RX_SYMBOL_1_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux ne_gcc_ufs_phy_tx_symbol_0_clk_src = {
+	.reg = 0x33058,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_ufs_phy_tx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_TX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_mux ne_gcc_usb3_prim_phy_pipe_clk_src = {
+	.reg = 0x2a078,
+	.shift = 0,
+	.width = 2,
+	.parent_map = ne_gcc_parent_map_6,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_prim_phy_pipe_clk_src",
+			.parent_data = ne_gcc_parent_data_6,
+			.num_parents = ARRAY_SIZE(ne_gcc_parent_data_6),
+			.ops = &clk_regmap_mux_closest_ops,
+		},
+	},
+};
+
+static struct clk_regmap_mux ne_gcc_usb3_sec_phy_pipe_clk_src = {
+	.reg = 0x2c078,
+	.shift = 0,
+	.width = 2,
+	.parent_map = ne_gcc_parent_map_7,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_sec_phy_pipe_clk_src",
+			.parent_data = ne_gcc_parent_data_7,
+			.num_parents = ARRAY_SIZE(ne_gcc_parent_data_7),
+			.ops = &clk_regmap_mux_closest_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_ne_gcc_gp1_clk_src[] = {
+	F(66666667, P_NE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_NE_GCC_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ne_gcc_gp1_clk_src = {
+	.cmd_rcgr = 0x21004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_4,
+	.freq_tbl = ftbl_ne_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_gp1_clk_src",
+		.parent_data = ne_gcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_gp2_clk_src = {
+	.cmd_rcgr = 0x22004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_4,
+	.freq_tbl = ftbl_ne_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_gp2_clk_src",
+		.parent_data = ne_gcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_ne_gcc_qupv3_wrap2_s0_clk_src[] = {
+	F(7372800, P_NE_GCC_GPLL0_OUT_MAIN, 1, 192, 15625),
+	F(14745600, P_NE_GCC_GPLL0_OUT_MAIN, 1, 384, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_NE_GCC_GPLL0_OUT_MAIN, 1, 768, 15625),
+	F(32000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 4, 75),
+	F(48000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 2, 25),
+	F(51200000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 32, 375),
+	F(64000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 8, 75),
+	F(66666667, P_NE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(75000000, P_NE_GCC_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(80000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 2, 15),
+	F(96000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 4, 25),
+	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(102400000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 64, 375),
+	F(112000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 14, 75),
+	F(117964800, P_NE_GCC_GPLL0_OUT_MAIN, 1, 3072, 15625),
+	F(120000000, P_NE_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s0_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s0_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s0_clk_src = {
+	.cmd_rcgr = 0x3816c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s0_clk_src_init,
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s1_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s1_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s1_clk_src = {
+	.cmd_rcgr = 0x382a8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s1_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_ne_gcc_qupv3_wrap2_s2_clk_src[] = {
+	F(7372800, P_NE_GCC_GPLL0_OUT_MAIN, 1, 192, 15625),
+	F(14745600, P_NE_GCC_GPLL0_OUT_MAIN, 1, 384, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_NE_GCC_GPLL0_OUT_MAIN, 1, 768, 15625),
+	F(32000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 4, 75),
+	F(48000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 2, 25),
+	F(51200000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 32, 375),
+	F(64000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 8, 75),
+	F(66666667, P_NE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(75000000, P_NE_GCC_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(80000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 2, 15),
+	F(96000000, P_NE_GCC_GPLL0_OUT_MAIN, 1, 4, 25),
+	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s2_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s2_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s2_clk_src = {
+	.cmd_rcgr = 0x383e4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s2_clk_src_init,
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s3_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s3_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s3_clk_src = {
+	.cmd_rcgr = 0x38520,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s3_clk_src_init,
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s4_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s4_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s4_clk_src = {
+	.cmd_rcgr = 0x3865c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s4_clk_src_init,
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s5_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s5_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s5_clk_src = {
+	.cmd_rcgr = 0x38798,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s5_clk_src_init,
+};
+
+static struct clk_init_data ne_gcc_qupv3_wrap2_s6_clk_src_init = {
+	.name = "ne_gcc_qupv3_wrap2_s6_clk_src",
+	.parent_data = ne_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 ne_gcc_qupv3_wrap2_s6_clk_src = {
+	.cmd_rcgr = 0x388d4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_qupv3_wrap2_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &ne_gcc_qupv3_wrap2_s6_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_ne_gcc_sdcc4_apps_clk_src[] = {
+	F(37500000, P_NE_GCC_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(50000000, P_NE_GCC_GPLL0_OUT_MAIN, 12, 0, 0),
+	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ne_gcc_sdcc4_apps_clk_src = {
+	.cmd_rcgr = 0x1801c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_sdcc4_apps_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_sdcc4_apps_clk_src",
+		.parent_data = ne_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_floor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_ne_gcc_ufs_phy_axi_clk_src[] = {
+	F(120000000, P_NE_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
+	F(201500000, P_NE_GCC_GPLL2_OUT_MAIN, 4, 0, 0),
+	F(300000000, P_NE_GCC_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(403000000, P_NE_GCC_GPLL2_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ne_gcc_ufs_phy_axi_clk_src = {
+	.cmd_rcgr = 0x33034,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_2,
+	.freq_tbl = ftbl_ne_gcc_ufs_phy_axi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_ufs_phy_axi_clk_src",
+		.parent_data = ne_gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_ufs_phy_ice_core_clk_src = {
+	.cmd_rcgr = 0x3308c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_2,
+	.freq_tbl = ftbl_ne_gcc_ufs_phy_axi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_ufs_phy_ice_core_clk_src",
+		.parent_data = ne_gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_ne_gcc_ufs_phy_phy_aux_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ne_gcc_ufs_phy_phy_aux_clk_src = {
+	.cmd_rcgr = 0x330c0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_5,
+	.freq_tbl = ftbl_ne_gcc_ufs_phy_phy_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_ufs_phy_phy_aux_clk_src",
+		.parent_data = ne_gcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_ufs_phy_unipro_core_clk_src = {
+	.cmd_rcgr = 0x330a4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_2,
+	.freq_tbl = ftbl_ne_gcc_ufs_phy_axi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_ufs_phy_unipro_core_clk_src",
+		.parent_data = ne_gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_ne_gcc_usb20_master_clk_src[] = {
+	F(75000000, P_NE_GCC_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(120000000, P_NE_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ne_gcc_usb20_master_clk_src = {
+	.cmd_rcgr = 0x31030,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_usb20_master_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb20_master_clk_src",
+		.parent_data = ne_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_usb20_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x31048,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_ufs_phy_phy_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb20_mock_utmi_clk_src",
+		.parent_data = ne_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_ne_gcc_usb31_prim_master_clk_src[] = {
+	F(85714286, P_NE_GCC_GPLL0_OUT_MAIN, 7, 0, 0),
+	F(133333333, P_NE_GCC_GPLL0_OUT_MAIN, 4.5, 0, 0),
+	F(200000000, P_NE_GCC_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(240000000, P_NE_GCC_GPLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ne_gcc_usb31_prim_master_clk_src = {
+	.cmd_rcgr = 0x2a038,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_1,
+	.freq_tbl = ftbl_ne_gcc_usb31_prim_master_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb31_prim_master_clk_src",
+		.parent_data = ne_gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_usb31_prim_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x2a050,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_ufs_phy_phy_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb31_prim_mock_utmi_clk_src",
+		.parent_data = ne_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_usb31_sec_master_clk_src = {
+	.cmd_rcgr = 0x2c038,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_usb31_prim_master_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb31_sec_master_clk_src",
+		.parent_data = ne_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_usb31_sec_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x2c050,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_0,
+	.freq_tbl = ftbl_ne_gcc_ufs_phy_phy_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb31_sec_mock_utmi_clk_src",
+		.parent_data = ne_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_usb3_prim_phy_aux_clk_src = {
+	.cmd_rcgr = 0x2a07c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_3,
+	.freq_tbl = ftbl_ne_gcc_ufs_phy_phy_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb3_prim_phy_aux_clk_src",
+		.parent_data = ne_gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 ne_gcc_usb3_sec_phy_aux_clk_src = {
+	.cmd_rcgr = 0x2c07c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = ne_gcc_parent_map_3,
+	.freq_tbl = ftbl_ne_gcc_ufs_phy_phy_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb3_sec_phy_aux_clk_src",
+		.parent_data = ne_gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(ne_gcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div ne_gcc_usb20_mock_utmi_postdiv_clk_src = {
+	.reg = 0x31060,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb20_mock_utmi_postdiv_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&ne_gcc_usb20_mock_utmi_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div ne_gcc_usb31_prim_mock_utmi_postdiv_clk_src = {
+	.reg = 0x2a068,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb31_prim_mock_utmi_postdiv_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&ne_gcc_usb31_prim_mock_utmi_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div ne_gcc_usb31_sec_mock_utmi_postdiv_clk_src = {
+	.reg = 0x2c068,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "ne_gcc_usb31_sec_mock_utmi_postdiv_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&ne_gcc_usb31_sec_mock_utmi_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch ne_gcc_aggre_noc_ufs_phy_axi_clk = {
+	.halt_reg = 0x330f4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x330f4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x330f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_aggre_noc_ufs_phy_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_ufs_phy_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_aggre_noc_usb2_axi_clk = {
+	.halt_reg = 0x31068,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x31068,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x31068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_aggre_noc_usb2_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb20_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_aggre_noc_usb3_prim_axi_clk = {
+	.halt_reg = 0x2a098,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2a098,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2a098,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_aggre_noc_usb3_prim_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_aggre_noc_usb3_sec_axi_clk = {
+	.halt_reg = 0x2c098,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2c098,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2c098,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_aggre_noc_usb3_sec_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_sec_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_ahb2phy_clk = {
+	.halt_reg = 0x30004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x30004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x30004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_ahb2phy_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_cnoc_usb2_axi_clk = {
+	.halt_reg = 0x31064,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x31064,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x31064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_cnoc_usb2_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb20_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_cnoc_usb3_prim_axi_clk = {
+	.halt_reg = 0x2a094,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2a094,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2a094,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_cnoc_usb3_prim_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_cnoc_usb3_sec_axi_clk = {
+	.halt_reg = 0x2c094,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2c094,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2c094,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_cnoc_usb3_sec_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_sec_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_frq_measure_ref_clk = {
+	.halt_reg = 0x20008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_frq_measure_ref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_gp1_clk = {
+	.halt_reg = 0x21000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_gp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_gp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_gp2_clk = {
+	.halt_reg = 0x22000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x22000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_gp2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_gp2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_gpu_2_cfg_clk = {
+	.halt_reg = 0x34004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x34004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x34004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_gpu_2_cfg_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_gpu_2_gpll0_clk_src = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(19),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_gpu_2_gpll0_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_gpll0.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_gpu_2_gpll0_div_clk_src = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(20),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_gpu_2_gpll0_div_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_gpll0_out_even.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_gpu_2_hscnoc_gfx_clk = {
+	.halt_reg = 0x34014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x34014,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x34014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_gpu_2_hscnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_gpu_2_smmu_vote_clk = {
+	.halt_reg = 0x57028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_gpu_2_smmu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_core_2x_clk = {
+	.halt_reg = 0x38020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57008,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_core_clk = {
+	.halt_reg = 0x3800c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_m_ahb_clk = {
+	.halt_reg = 0x38004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x38004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(30),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_m_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s0_clk = {
+	.halt_reg = 0x3815c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57008,
+		.enable_mask = BIT(2),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s1_clk = {
+	.halt_reg = 0x38298,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57008,
+		.enable_mask = BIT(3),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s2_clk = {
+	.halt_reg = 0x383d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57008,
+		.enable_mask = BIT(4),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s3_clk = {
+	.halt_reg = 0x38510,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57008,
+		.enable_mask = BIT(5),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s4_clk = {
+	.halt_reg = 0x3864c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57008,
+		.enable_mask = BIT(6),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s5_clk = {
+	.halt_reg = 0x38788,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57008,
+		.enable_mask = BIT(7),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s6_clk = {
+	.halt_reg = 0x388c4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57008,
+		.enable_mask = BIT(8),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s6_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_qupv3_wrap2_s6_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_qupv3_wrap2_s_ahb_clk = {
+	.halt_reg = 0x38008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x38008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(31),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_qupv3_wrap2_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_sdcc4_apps_clk = {
+	.halt_reg = 0x18004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x18004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_sdcc4_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_sdcc4_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_sdcc4_axi_clk = {
+	.halt_reg = 0x18014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x18014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_sdcc4_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_ufs_phy_ahb_clk = {
+	.halt_reg = 0x33028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x33028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x33028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_ufs_phy_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_ufs_phy_axi_clk = {
+	.halt_reg = 0x33018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x33018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x33018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_ufs_phy_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_ufs_phy_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_ufs_phy_ice_core_clk = {
+	.halt_reg = 0x3307c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x3307c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x3307c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_ufs_phy_ice_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_ufs_phy_ice_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_ufs_phy_phy_aux_clk = {
+	.halt_reg = 0x330bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x330bc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x330bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_ufs_phy_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_ufs_phy_rx_symbol_0_clk = {
+	.halt_reg = 0x33030,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x33030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_ufs_phy_rx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_ufs_phy_rx_symbol_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_ufs_phy_rx_symbol_1_clk = {
+	.halt_reg = 0x330d8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x330d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_ufs_phy_rx_symbol_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_ufs_phy_rx_symbol_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_ufs_phy_tx_symbol_0_clk = {
+	.halt_reg = 0x3302c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x3302c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_ufs_phy_tx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_ufs_phy_tx_symbol_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_ufs_phy_unipro_core_clk = {
+	.halt_reg = 0x3306c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x3306c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x3306c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_ufs_phy_unipro_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb20_master_clk = {
+	.halt_reg = 0x31018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x31018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb20_master_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb20_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb20_mock_utmi_clk = {
+	.halt_reg = 0x3102c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3102c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb20_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb20_mock_utmi_postdiv_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb20_sleep_clk = {
+	.halt_reg = 0x31028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x31028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb20_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_prim_atb_clk = {
+	.halt_reg = 0x2a018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x2a018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_prim_atb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_prim_eud_ahb_clk = {
+	.halt_reg = 0x2a02c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2a02c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2a02c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_prim_eud_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_prim_master_clk = {
+	.halt_reg = 0x2a01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_prim_master_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_prim_mock_utmi_clk = {
+	.halt_reg = 0x2a034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_prim_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_prim_mock_utmi_postdiv_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_prim_sleep_clk = {
+	.halt_reg = 0x2a030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_prim_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_sec_atb_clk = {
+	.halt_reg = 0x2c018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x2c018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_sec_atb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_prim_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_sec_eud_ahb_clk = {
+	.halt_reg = 0x2c02c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2c02c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2c02c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_sec_eud_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_sec_master_clk = {
+	.halt_reg = 0x2c01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_sec_master_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_sec_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_sec_mock_utmi_clk = {
+	.halt_reg = 0x2c034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_sec_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb31_sec_mock_utmi_postdiv_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb31_sec_sleep_clk = {
+	.halt_reg = 0x2c030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb31_sec_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb3_prim_phy_aux_clk = {
+	.halt_reg = 0x2a06c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a06c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_prim_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb3_prim_phy_com_aux_clk = {
+	.halt_reg = 0x2a070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_prim_phy_com_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb3_prim_phy_pipe_clk = {
+	.halt_reg = 0x2a074,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2a074,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2a074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_prim_phy_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb3_prim_phy_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb3_sec_phy_aux_clk = {
+	.halt_reg = 0x2c06c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c06c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_sec_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb3_sec_phy_com_aux_clk = {
+	.halt_reg = 0x2c070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_sec_phy_com_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ne_gcc_usb3_sec_phy_pipe_clk = {
+	.halt_reg = 0x2c074,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2c074,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2c074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "ne_gcc_usb3_sec_phy_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&ne_gcc_usb3_sec_phy_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc ne_gcc_ufs_mem_phy_gdsc = {
+	.gdscr = 0x32000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "ne_gcc_ufs_mem_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc ne_gcc_ufs_phy_gdsc = {
+	.gdscr = 0x33004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "ne_gcc_ufs_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc ne_gcc_usb20_prim_gdsc = {
+	.gdscr = 0x31004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "ne_gcc_usb20_prim_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc ne_gcc_usb31_prim_gdsc = {
+	.gdscr = 0x2a004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "ne_gcc_usb31_prim_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc ne_gcc_usb31_sec_gdsc = {
+	.gdscr = 0x2c004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "ne_gcc_usb31_sec_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc ne_gcc_usb3_phy_gdsc = {
+	.gdscr = 0x2b00c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "ne_gcc_usb3_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc ne_gcc_usb3_sec_phy_gdsc = {
+	.gdscr = 0x2d00c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "ne_gcc_usb3_sec_phy_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *ne_gcc_nord_clocks[] = {
+	[NE_GCC_AGGRE_NOC_UFS_PHY_AXI_CLK] = &ne_gcc_aggre_noc_ufs_phy_axi_clk.clkr,
+	[NE_GCC_AGGRE_NOC_USB2_AXI_CLK] = &ne_gcc_aggre_noc_usb2_axi_clk.clkr,
+	[NE_GCC_AGGRE_NOC_USB3_PRIM_AXI_CLK] = &ne_gcc_aggre_noc_usb3_prim_axi_clk.clkr,
+	[NE_GCC_AGGRE_NOC_USB3_SEC_AXI_CLK] = &ne_gcc_aggre_noc_usb3_sec_axi_clk.clkr,
+	[NE_GCC_AHB2PHY_CLK] = &ne_gcc_ahb2phy_clk.clkr,
+	[NE_GCC_CNOC_USB2_AXI_CLK] = &ne_gcc_cnoc_usb2_axi_clk.clkr,
+	[NE_GCC_CNOC_USB3_PRIM_AXI_CLK] = &ne_gcc_cnoc_usb3_prim_axi_clk.clkr,
+	[NE_GCC_CNOC_USB3_SEC_AXI_CLK] = &ne_gcc_cnoc_usb3_sec_axi_clk.clkr,
+	[NE_GCC_FRQ_MEASURE_REF_CLK] = &ne_gcc_frq_measure_ref_clk.clkr,
+	[NE_GCC_GP1_CLK] = &ne_gcc_gp1_clk.clkr,
+	[NE_GCC_GP1_CLK_SRC] = &ne_gcc_gp1_clk_src.clkr,
+	[NE_GCC_GP2_CLK] = &ne_gcc_gp2_clk.clkr,
+	[NE_GCC_GP2_CLK_SRC] = &ne_gcc_gp2_clk_src.clkr,
+	[NE_GCC_GPLL0] = &ne_gcc_gpll0.clkr,
+	[NE_GCC_GPLL0_OUT_EVEN] = &ne_gcc_gpll0_out_even.clkr,
+	[NE_GCC_GPLL2] = &ne_gcc_gpll2.clkr,
+	[NE_GCC_GPU_2_CFG_CLK] = &ne_gcc_gpu_2_cfg_clk.clkr,
+	[NE_GCC_GPU_2_GPLL0_CLK_SRC] = &ne_gcc_gpu_2_gpll0_clk_src.clkr,
+	[NE_GCC_GPU_2_GPLL0_DIV_CLK_SRC] = &ne_gcc_gpu_2_gpll0_div_clk_src.clkr,
+	[NE_GCC_GPU_2_HSCNOC_GFX_CLK] = &ne_gcc_gpu_2_hscnoc_gfx_clk.clkr,
+	[NE_GCC_GPU_2_SMMU_VOTE_CLK] = &ne_gcc_gpu_2_smmu_vote_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_CORE_2X_CLK] = &ne_gcc_qupv3_wrap2_core_2x_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_CORE_CLK] = &ne_gcc_qupv3_wrap2_core_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_M_AHB_CLK] = &ne_gcc_qupv3_wrap2_m_ahb_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S0_CLK] = &ne_gcc_qupv3_wrap2_s0_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S0_CLK_SRC] = &ne_gcc_qupv3_wrap2_s0_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S1_CLK] = &ne_gcc_qupv3_wrap2_s1_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S1_CLK_SRC] = &ne_gcc_qupv3_wrap2_s1_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S2_CLK] = &ne_gcc_qupv3_wrap2_s2_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S2_CLK_SRC] = &ne_gcc_qupv3_wrap2_s2_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S3_CLK] = &ne_gcc_qupv3_wrap2_s3_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S3_CLK_SRC] = &ne_gcc_qupv3_wrap2_s3_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S4_CLK] = &ne_gcc_qupv3_wrap2_s4_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S4_CLK_SRC] = &ne_gcc_qupv3_wrap2_s4_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S5_CLK] = &ne_gcc_qupv3_wrap2_s5_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S5_CLK_SRC] = &ne_gcc_qupv3_wrap2_s5_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S6_CLK] = &ne_gcc_qupv3_wrap2_s6_clk.clkr,
+	[NE_GCC_QUPV3_WRAP2_S6_CLK_SRC] = &ne_gcc_qupv3_wrap2_s6_clk_src.clkr,
+	[NE_GCC_QUPV3_WRAP2_S_AHB_CLK] = &ne_gcc_qupv3_wrap2_s_ahb_clk.clkr,
+	[NE_GCC_SDCC4_APPS_CLK] = &ne_gcc_sdcc4_apps_clk.clkr,
+	[NE_GCC_SDCC4_APPS_CLK_SRC] = &ne_gcc_sdcc4_apps_clk_src.clkr,
+	[NE_GCC_SDCC4_AXI_CLK] = &ne_gcc_sdcc4_axi_clk.clkr,
+	[NE_GCC_UFS_PHY_AHB_CLK] = &ne_gcc_ufs_phy_ahb_clk.clkr,
+	[NE_GCC_UFS_PHY_AXI_CLK] = &ne_gcc_ufs_phy_axi_clk.clkr,
+	[NE_GCC_UFS_PHY_AXI_CLK_SRC] = &ne_gcc_ufs_phy_axi_clk_src.clkr,
+	[NE_GCC_UFS_PHY_ICE_CORE_CLK] = &ne_gcc_ufs_phy_ice_core_clk.clkr,
+	[NE_GCC_UFS_PHY_ICE_CORE_CLK_SRC] = &ne_gcc_ufs_phy_ice_core_clk_src.clkr,
+	[NE_GCC_UFS_PHY_PHY_AUX_CLK] = &ne_gcc_ufs_phy_phy_aux_clk.clkr,
+	[NE_GCC_UFS_PHY_PHY_AUX_CLK_SRC] = &ne_gcc_ufs_phy_phy_aux_clk_src.clkr,
+	[NE_GCC_UFS_PHY_RX_SYMBOL_0_CLK] = &ne_gcc_ufs_phy_rx_symbol_0_clk.clkr,
+	[NE_GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC] = &ne_gcc_ufs_phy_rx_symbol_0_clk_src.clkr,
+	[NE_GCC_UFS_PHY_RX_SYMBOL_1_CLK] = &ne_gcc_ufs_phy_rx_symbol_1_clk.clkr,
+	[NE_GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC] = &ne_gcc_ufs_phy_rx_symbol_1_clk_src.clkr,
+	[NE_GCC_UFS_PHY_TX_SYMBOL_0_CLK] = &ne_gcc_ufs_phy_tx_symbol_0_clk.clkr,
+	[NE_GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC] = &ne_gcc_ufs_phy_tx_symbol_0_clk_src.clkr,
+	[NE_GCC_UFS_PHY_UNIPRO_CORE_CLK] = &ne_gcc_ufs_phy_unipro_core_clk.clkr,
+	[NE_GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC] = &ne_gcc_ufs_phy_unipro_core_clk_src.clkr,
+	[NE_GCC_USB20_MASTER_CLK] = &ne_gcc_usb20_master_clk.clkr,
+	[NE_GCC_USB20_MASTER_CLK_SRC] = &ne_gcc_usb20_master_clk_src.clkr,
+	[NE_GCC_USB20_MOCK_UTMI_CLK] = &ne_gcc_usb20_mock_utmi_clk.clkr,
+	[NE_GCC_USB20_MOCK_UTMI_CLK_SRC] = &ne_gcc_usb20_mock_utmi_clk_src.clkr,
+	[NE_GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC] = &ne_gcc_usb20_mock_utmi_postdiv_clk_src.clkr,
+	[NE_GCC_USB20_SLEEP_CLK] = &ne_gcc_usb20_sleep_clk.clkr,
+	[NE_GCC_USB31_PRIM_ATB_CLK] = &ne_gcc_usb31_prim_atb_clk.clkr,
+	[NE_GCC_USB31_PRIM_EUD_AHB_CLK] = &ne_gcc_usb31_prim_eud_ahb_clk.clkr,
+	[NE_GCC_USB31_PRIM_MASTER_CLK] = &ne_gcc_usb31_prim_master_clk.clkr,
+	[NE_GCC_USB31_PRIM_MASTER_CLK_SRC] = &ne_gcc_usb31_prim_master_clk_src.clkr,
+	[NE_GCC_USB31_PRIM_MOCK_UTMI_CLK] = &ne_gcc_usb31_prim_mock_utmi_clk.clkr,
+	[NE_GCC_USB31_PRIM_MOCK_UTMI_CLK_SRC] = &ne_gcc_usb31_prim_mock_utmi_clk_src.clkr,
+	[NE_GCC_USB31_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC] =
+		&ne_gcc_usb31_prim_mock_utmi_postdiv_clk_src.clkr,
+	[NE_GCC_USB31_PRIM_SLEEP_CLK] = &ne_gcc_usb31_prim_sleep_clk.clkr,
+	[NE_GCC_USB31_SEC_ATB_CLK] = &ne_gcc_usb31_sec_atb_clk.clkr,
+	[NE_GCC_USB31_SEC_EUD_AHB_CLK] = &ne_gcc_usb31_sec_eud_ahb_clk.clkr,
+	[NE_GCC_USB31_SEC_MASTER_CLK] = &ne_gcc_usb31_sec_master_clk.clkr,
+	[NE_GCC_USB31_SEC_MASTER_CLK_SRC] = &ne_gcc_usb31_sec_master_clk_src.clkr,
+	[NE_GCC_USB31_SEC_MOCK_UTMI_CLK] = &ne_gcc_usb31_sec_mock_utmi_clk.clkr,
+	[NE_GCC_USB31_SEC_MOCK_UTMI_CLK_SRC] = &ne_gcc_usb31_sec_mock_utmi_clk_src.clkr,
+	[NE_GCC_USB31_SEC_MOCK_UTMI_POSTDIV_CLK_SRC] =
+		&ne_gcc_usb31_sec_mock_utmi_postdiv_clk_src.clkr,
+	[NE_GCC_USB31_SEC_SLEEP_CLK] = &ne_gcc_usb31_sec_sleep_clk.clkr,
+	[NE_GCC_USB3_PRIM_PHY_AUX_CLK] = &ne_gcc_usb3_prim_phy_aux_clk.clkr,
+	[NE_GCC_USB3_PRIM_PHY_AUX_CLK_SRC] = &ne_gcc_usb3_prim_phy_aux_clk_src.clkr,
+	[NE_GCC_USB3_PRIM_PHY_COM_AUX_CLK] = &ne_gcc_usb3_prim_phy_com_aux_clk.clkr,
+	[NE_GCC_USB3_PRIM_PHY_PIPE_CLK] = &ne_gcc_usb3_prim_phy_pipe_clk.clkr,
+	[NE_GCC_USB3_PRIM_PHY_PIPE_CLK_SRC] = &ne_gcc_usb3_prim_phy_pipe_clk_src.clkr,
+	[NE_GCC_USB3_SEC_PHY_AUX_CLK] = &ne_gcc_usb3_sec_phy_aux_clk.clkr,
+	[NE_GCC_USB3_SEC_PHY_AUX_CLK_SRC] = &ne_gcc_usb3_sec_phy_aux_clk_src.clkr,
+	[NE_GCC_USB3_SEC_PHY_COM_AUX_CLK] = &ne_gcc_usb3_sec_phy_com_aux_clk.clkr,
+	[NE_GCC_USB3_SEC_PHY_PIPE_CLK] = &ne_gcc_usb3_sec_phy_pipe_clk.clkr,
+	[NE_GCC_USB3_SEC_PHY_PIPE_CLK_SRC] = &ne_gcc_usb3_sec_phy_pipe_clk_src.clkr,
+};
+
+static struct gdsc *ne_gcc_nord_gdscs[] = {
+	[NE_GCC_UFS_MEM_PHY_GDSC] = &ne_gcc_ufs_mem_phy_gdsc,
+	[NE_GCC_UFS_PHY_GDSC] = &ne_gcc_ufs_phy_gdsc,
+	[NE_GCC_USB20_PRIM_GDSC] = &ne_gcc_usb20_prim_gdsc,
+	[NE_GCC_USB31_PRIM_GDSC] = &ne_gcc_usb31_prim_gdsc,
+	[NE_GCC_USB31_SEC_GDSC] = &ne_gcc_usb31_sec_gdsc,
+	[NE_GCC_USB3_PHY_GDSC] = &ne_gcc_usb3_phy_gdsc,
+	[NE_GCC_USB3_SEC_PHY_GDSC] = &ne_gcc_usb3_sec_phy_gdsc,
+};
+
+static const struct qcom_reset_map ne_gcc_nord_resets[] = {
+	[NE_GCC_GPU_2_BCR] = { 0x34000 },
+	[NE_GCC_QUPV3_WRAPPER_2_BCR] = { 0x38000 },
+	[NE_GCC_SDCC4_BCR] = { 0x18000 },
+	[NE_GCC_UFS_PHY_BCR] = { 0x33000 },
+	[NE_GCC_USB20_PRIM_BCR] = { 0x31000 },
+	[NE_GCC_USB31_PRIM_BCR] = { 0x2a000 },
+	[NE_GCC_USB31_SEC_BCR] = { 0x2c000 },
+	[NE_GCC_USB3_DP_PHY_PRIM_BCR] = { 0x2b008 },
+	[NE_GCC_USB3_DP_PHY_SEC_BCR] = { 0x2d008 },
+	[NE_GCC_USB3_PHY_PRIM_BCR] = { 0x2b000 },
+	[NE_GCC_USB3_PHY_SEC_BCR] = { 0x2d000 },
+	[NE_GCC_USB3PHY_PHY_PRIM_BCR] = { 0x2b004 },
+	[NE_GCC_USB3PHY_PHY_SEC_BCR] = { 0x2d004 },
+};
+
+static const struct clk_rcg_dfs_data ne_gcc_nord_dfs_clocks[] = {
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s0_clk_src),
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s1_clk_src),
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s2_clk_src),
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s3_clk_src),
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s4_clk_src),
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s5_clk_src),
+	DEFINE_RCG_DFS(ne_gcc_qupv3_wrap2_s6_clk_src),
+};
+
+static const struct regmap_config ne_gcc_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf41f0,
+	.fast_io = true,
+};
+
+static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for  ne_gcc_ufs_phy_ice_core_clk and ne_gcc_ufs_phy_axi_clk */
+	qcom_branch_set_force_mem_core(regmap, ne_gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, ne_gcc_ufs_phy_axi_clk, true);
+}
+
+static struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
+	.dfs_rcgs = ne_gcc_nord_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(ne_gcc_nord_dfs_clocks),
+	.clk_regs_configure = clk_nord_regs_configure,
+};
+
+static const struct qcom_cc_desc ne_gcc_nord_desc = {
+	.config = &ne_gcc_nord_regmap_config,
+	.clks = ne_gcc_nord_clocks,
+	.num_clks = ARRAY_SIZE(ne_gcc_nord_clocks),
+	.resets = ne_gcc_nord_resets,
+	.num_resets = ARRAY_SIZE(ne_gcc_nord_resets),
+	.gdscs = ne_gcc_nord_gdscs,
+	.num_gdscs = ARRAY_SIZE(ne_gcc_nord_gdscs),
+	.driver_data = &ne_gcc_nord_driver_data,
+};
+
+static const struct of_device_id ne_gcc_nord_match_table[] = {
+	{ .compatible = "qcom,nord-negcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ne_gcc_nord_match_table);
+
+static int ne_gcc_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &ne_gcc_nord_desc);
+}
+
+static struct platform_driver ne_gcc_nord_driver = {
+	.probe = ne_gcc_nord_probe,
+	.driver = {
+		.name = "negcc-nord",
+		.of_match_table = ne_gcc_nord_match_table,
+	},
+};
+
+module_platform_driver(ne_gcc_nord_driver);
+
+MODULE_DESCRIPTION("QTI NEGCC NORD Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/nwgcc-nord.c b/drivers/clk/qcom/nwgcc-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..163ab63c872bc7d5132d68bf0ec3e05f5814974d
--- /dev/null
+++ b/drivers/clk/qcom/nwgcc-nord.c
@@ -0,0 +1,688 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-nwgcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_NW_GCC_GPLL0_OUT_EVEN,
+	P_NW_GCC_GPLL0_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static struct clk_alpha_pll nw_gcc_gpll0 = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gpll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_nw_gcc_gpll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv nw_gcc_gpll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_nw_gcc_gpll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_nw_gcc_gpll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_gpll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&nw_gcc_gpll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+static const struct parent_map nw_gcc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_NW_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_NW_GCC_GPLL0_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data nw_gcc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &nw_gcc_gpll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &nw_gcc_gpll0_out_even.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_nw_gcc_gp1_clk_src[] = {
+	F(60000000, P_NW_GCC_GPLL0_OUT_MAIN, 10, 0, 0),
+	F(100000000, P_NW_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_NW_GCC_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nw_gcc_gp1_clk_src = {
+	.cmd_rcgr = 0x20004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_0,
+	.freq_tbl = ftbl_nw_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_gp1_clk_src",
+		.parent_data = nw_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(nw_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 nw_gcc_gp2_clk_src = {
+	.cmd_rcgr = 0x21004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = nw_gcc_parent_map_0,
+	.freq_tbl = ftbl_nw_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nw_gcc_gp2_clk_src",
+		.parent_data = nw_gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(nw_gcc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch nw_gcc_acmu_mux_clk = {
+	.halt_reg = 0x1f01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1f01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_acmu_mux_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_camera_hf_axi_clk = {
+	.halt_reg = 0x16008,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x16008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x16008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_camera_hf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_camera_sf_axi_clk = {
+	.halt_reg = 0x1601c,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x1601c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1601c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_camera_sf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_camera_trig_clk = {
+	.halt_reg = 0x16034,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x16034,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x16034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_camera_trig_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_disp_0_hf_axi_clk = {
+	.halt_reg = 0x18008,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x18008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x18008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_disp_0_hf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_disp_0_trig_clk = {
+	.halt_reg = 0x1801c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x1801c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1801c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_disp_0_trig_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_disp_1_hf_axi_clk = {
+	.halt_reg = 0x19008,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x19008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x19008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_disp_1_hf_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_disp_1_trig_clk = {
+	.halt_reg = 0x1901c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x1901c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1901c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_disp_1_trig_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_dprx0_axi_hf_clk = {
+	.halt_reg = 0x29004,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x29004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x29004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_dprx0_axi_hf_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_dprx1_axi_hf_clk = {
+	.halt_reg = 0x2a004,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x2a004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_dprx1_axi_hf_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_eva_axi0_clk = {
+	.halt_reg = 0x1b008,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x1b008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1b008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_eva_axi0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_eva_axi0c_clk = {
+	.halt_reg = 0x1b01c,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x1b01c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1b01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_eva_axi0c_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_eva_trig_clk = {
+	.halt_reg = 0x1b028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x1b028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1b028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_eva_trig_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_frq_measure_ref_clk = {
+	.halt_reg = 0x1f008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1f008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_frq_measure_ref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gp1_clk = {
+	.halt_reg = 0x20000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_gp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gp2_clk = {
+	.halt_reg = 0x21000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gp2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_gp2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gpu_2_gpll0_clk_src = {
+	.halt_reg = 0x24150,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x24150,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(6),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gpu_2_gpll0_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_gpll0.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gpu_2_gpll0_div_clk_src = {
+	.halt_reg = 0x24158,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x24158,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(7),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gpu_2_gpll0_div_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_gpll0_out_even.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gpu_2_hscnoc_gfx_clk = {
+	.halt_reg = 0x2400c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2400c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2400c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gpu_2_hscnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gpu_gpll0_clk_src = {
+	.halt_reg = 0x23150,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x23150,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(4),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gpu_gpll0_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_gpll0.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gpu_gpll0_div_clk_src = {
+	.halt_reg = 0x23158,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x23158,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x76000,
+		.enable_mask = BIT(5),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gpu_gpll0_div_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&nw_gcc_gpll0_out_even.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gpu_hscnoc_gfx_clk = {
+	.halt_reg = 0x2300c,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x2300c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2300c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gpu_hscnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_gpu_smmu_vote_clk = {
+	.halt_reg = 0x86038,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x86038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_gpu_smmu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_hscnoc_gpu_2_axi_clk = {
+	.halt_reg = 0x24160,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x24160,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x24160,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_hscnoc_gpu_2_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_hscnoc_gpu_axi_clk = {
+	.halt_reg = 0x23160,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x23160,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x23160,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_hscnoc_gpu_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_mmu_1_tcu_vote_clk = {
+	.halt_reg = 0x86040,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x86040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_mmu_1_tcu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_video_axi0_clk = {
+	.halt_reg = 0x1a008,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x1a008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1a008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_video_axi0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_video_axi0c_clk = {
+	.halt_reg = 0x1a01c,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x1a01c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1a01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_video_axi0c_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nw_gcc_video_axi1_clk = {
+	.halt_reg = 0x1a030,
+	.halt_check = BRANCH_HALT_SKIP,
+	.hwcg_reg = 0x1a030,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1a030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nw_gcc_video_axi1_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *nw_gcc_nord_clocks[] = {
+	[NW_GCC_ACMU_MUX_CLK] = &nw_gcc_acmu_mux_clk.clkr,
+	[NW_GCC_CAMERA_HF_AXI_CLK] = &nw_gcc_camera_hf_axi_clk.clkr,
+	[NW_GCC_CAMERA_SF_AXI_CLK] = &nw_gcc_camera_sf_axi_clk.clkr,
+	[NW_GCC_CAMERA_TRIG_CLK] = &nw_gcc_camera_trig_clk.clkr,
+	[NW_GCC_DISP_0_HF_AXI_CLK] = &nw_gcc_disp_0_hf_axi_clk.clkr,
+	[NW_GCC_DISP_0_TRIG_CLK] = &nw_gcc_disp_0_trig_clk.clkr,
+	[NW_GCC_DISP_1_HF_AXI_CLK] = &nw_gcc_disp_1_hf_axi_clk.clkr,
+	[NW_GCC_DISP_1_TRIG_CLK] = &nw_gcc_disp_1_trig_clk.clkr,
+	[NW_GCC_DPRX0_AXI_HF_CLK] = &nw_gcc_dprx0_axi_hf_clk.clkr,
+	[NW_GCC_DPRX1_AXI_HF_CLK] = &nw_gcc_dprx1_axi_hf_clk.clkr,
+	[NW_GCC_EVA_AXI0_CLK] = &nw_gcc_eva_axi0_clk.clkr,
+	[NW_GCC_EVA_AXI0C_CLK] = &nw_gcc_eva_axi0c_clk.clkr,
+	[NW_GCC_EVA_TRIG_CLK] = &nw_gcc_eva_trig_clk.clkr,
+	[NW_GCC_FRQ_MEASURE_REF_CLK] = &nw_gcc_frq_measure_ref_clk.clkr,
+	[NW_GCC_GP1_CLK] = &nw_gcc_gp1_clk.clkr,
+	[NW_GCC_GP1_CLK_SRC] = &nw_gcc_gp1_clk_src.clkr,
+	[NW_GCC_GP2_CLK] = &nw_gcc_gp2_clk.clkr,
+	[NW_GCC_GP2_CLK_SRC] = &nw_gcc_gp2_clk_src.clkr,
+	[NW_GCC_GPLL0] = &nw_gcc_gpll0.clkr,
+	[NW_GCC_GPLL0_OUT_EVEN] = &nw_gcc_gpll0_out_even.clkr,
+	[NW_GCC_GPU_2_GPLL0_CLK_SRC] = &nw_gcc_gpu_2_gpll0_clk_src.clkr,
+	[NW_GCC_GPU_2_GPLL0_DIV_CLK_SRC] = &nw_gcc_gpu_2_gpll0_div_clk_src.clkr,
+	[NW_GCC_GPU_2_HSCNOC_GFX_CLK] = &nw_gcc_gpu_2_hscnoc_gfx_clk.clkr,
+	[NW_GCC_GPU_GPLL0_CLK_SRC] = &nw_gcc_gpu_gpll0_clk_src.clkr,
+	[NW_GCC_GPU_GPLL0_DIV_CLK_SRC] = &nw_gcc_gpu_gpll0_div_clk_src.clkr,
+	[NW_GCC_GPU_HSCNOC_GFX_CLK] = &nw_gcc_gpu_hscnoc_gfx_clk.clkr,
+	[NW_GCC_GPU_SMMU_VOTE_CLK] = &nw_gcc_gpu_smmu_vote_clk.clkr,
+	[NW_GCC_HSCNOC_GPU_2_AXI_CLK] = &nw_gcc_hscnoc_gpu_2_axi_clk.clkr,
+	[NW_GCC_HSCNOC_GPU_AXI_CLK] = &nw_gcc_hscnoc_gpu_axi_clk.clkr,
+	[NW_GCC_MMU_1_TCU_VOTE_CLK] = &nw_gcc_mmu_1_tcu_vote_clk.clkr,
+	[NW_GCC_VIDEO_AXI0_CLK] = &nw_gcc_video_axi0_clk.clkr,
+	[NW_GCC_VIDEO_AXI0C_CLK] = &nw_gcc_video_axi0c_clk.clkr,
+	[NW_GCC_VIDEO_AXI1_CLK] = &nw_gcc_video_axi1_clk.clkr,
+};
+
+static const struct qcom_reset_map nw_gcc_nord_resets[] = {
+	[NW_GCC_CAMERA_BCR] = { 0x16000 },
+	[NW_GCC_DISPLAY_0_BCR] = { 0x18000 },
+	[NW_GCC_DISPLAY_1_BCR] = { 0x19000 },
+	[NW_GCC_DPRX0_BCR] = { 0x29000 },
+	[NW_GCC_DPRX1_BCR] = { 0x2a000 },
+	[NW_GCC_EVA_BCR] = { 0x1b000 },
+	[NW_GCC_GPU_2_BCR] = { 0x24000 },
+	[NW_GCC_GPU_BCR] = { 0x23000 },
+	[NW_GCC_VIDEO_BCR] = { 0x1a000 },
+};
+
+static u32 nw_gcc_nord_critical_cbcrs[] = {
+	0x16004, /* NW_GCC_CAMERA_AHB_CLK */
+	0x16030, /* NW_GCC_CAMERA_XO_CLK */
+	0x18004, /* NW_GCC_DISP_0_AHB_CLK */
+	0x19004, /* NW_GCC_DISP_1_AHB_CLK */
+	0x29018, /* NW_GCC_DPRX0_CFG_AHB_CLK */
+	0x2a018, /* NW_GCC_DPRX1_CFG_AHB_CLK */
+	0x1b004, /* NW_GCC_EVA_AHB_CLK */
+	0x1b024, /* NW_GCC_EVA_XO_CLK */
+	0x23004, /* NW_GCC_GPU_CFG_AHB_CLK */
+	0x24004, /* NW_GCC_GPU_2_CFG_AHB_CLK */
+	0x1a004, /* NW_GCC_VIDEO_AHB_CLK */
+	0x1a044, /* NW_GCC_VIDEO_XO_CLK */
+};
+
+static struct qcom_cc_driver_data nw_gcc_nord_driver_data = {
+	.clk_cbcrs = nw_gcc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(nw_gcc_nord_critical_cbcrs),
+};
+
+static const struct regmap_config nw_gcc_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf41f0,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc nw_gcc_nord_desc = {
+	.config = &nw_gcc_nord_regmap_config,
+	.clks = nw_gcc_nord_clocks,
+	.num_clks = ARRAY_SIZE(nw_gcc_nord_clocks),
+	.resets = nw_gcc_nord_resets,
+	.num_resets = ARRAY_SIZE(nw_gcc_nord_resets),
+	.driver_data = &nw_gcc_nord_driver_data,
+};
+
+static const struct of_device_id nw_gcc_nord_match_table[] = {
+	{ .compatible = "qcom,nord-nwgcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nw_gcc_nord_match_table);
+
+static int nw_gcc_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &nw_gcc_nord_desc);
+}
+
+static struct platform_driver nw_gcc_nord_driver = {
+	.probe = nw_gcc_nord_probe,
+	.driver = {
+		.name = "nwgcc-nord",
+		.of_match_table = nw_gcc_nord_match_table,
+	},
+};
+
+module_platform_driver(nw_gcc_nord_driver);
+
+MODULE_DESCRIPTION("QTI NWGCC NORD Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..1aab0999de4dde7262bd694f7d7f955b2a9cb66e
--- /dev/null
+++ b/drivers/clk/qcom/segcc-nord.c
@@ -0,0 +1,1609 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-segcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_SE_GCC_GPLL0_OUT_EVEN,
+	P_SE_GCC_GPLL0_OUT_MAIN,
+	P_SE_GCC_GPLL2_OUT_MAIN,
+	P_SE_GCC_GPLL4_OUT_MAIN,
+	P_SE_GCC_GPLL5_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static struct clk_alpha_pll se_gcc_gpll0 = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_gpll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_se_gcc_gpll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv se_gcc_gpll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_se_gcc_gpll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_se_gcc_gpll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_gpll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&se_gcc_gpll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+	},
+};
+
+static struct clk_alpha_pll se_gcc_gpll2 = {
+	.offset = 0x2000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(2),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_gpll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll se_gcc_gpll4 = {
+	.offset = 0x4000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(4),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_gpll4",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll se_gcc_gpll5 = {
+	.offset = 0x5000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(5),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_gpll5",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map se_gcc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SE_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SE_GCC_GPLL0_OUT_EVEN, 2 },
+};
+
+static const struct clk_parent_data se_gcc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &se_gcc_gpll0.clkr.hw },
+	{ .hw = &se_gcc_gpll0_out_even.clkr.hw },
+};
+
+static const struct parent_map se_gcc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SE_GCC_GPLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data se_gcc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &se_gcc_gpll0.clkr.hw },
+};
+
+static const struct parent_map se_gcc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SE_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data se_gcc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &se_gcc_gpll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map se_gcc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SE_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SE_GCC_GPLL5_OUT_MAIN, 3 },
+	{ P_SE_GCC_GPLL4_OUT_MAIN, 5 },
+	{ P_SE_GCC_GPLL2_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data se_gcc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &se_gcc_gpll0.clkr.hw },
+	{ .hw = &se_gcc_gpll5.clkr.hw },
+	{ .hw = &se_gcc_gpll4.clkr.hw },
+	{ .hw = &se_gcc_gpll2.clkr.hw },
+};
+
+static const struct parent_map se_gcc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_SE_GCC_GPLL0_OUT_MAIN, 1 },
+	{ P_SE_GCC_GPLL0_OUT_EVEN, 2 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data se_gcc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &se_gcc_gpll0.clkr.hw },
+	{ .hw = &se_gcc_gpll0_out_even.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_se_gcc_eee_emac0_clk_src[] = {
+	F(66666667, P_SE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(100000000, P_SE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 se_gcc_eee_emac0_clk_src = {
+	.cmd_rcgr = 0x240b8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_2,
+	.freq_tbl = ftbl_se_gcc_eee_emac0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_eee_emac0_clk_src",
+		.parent_data = se_gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 se_gcc_eee_emac1_clk_src = {
+	.cmd_rcgr = 0x250b8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_2,
+	.freq_tbl = ftbl_se_gcc_eee_emac0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_eee_emac1_clk_src",
+		.parent_data = se_gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_se_gcc_emac0_phy_aux_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 se_gcc_emac0_phy_aux_clk_src = {
+	.cmd_rcgr = 0x24030,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_2,
+	.freq_tbl = ftbl_se_gcc_emac0_phy_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_emac0_phy_aux_clk_src",
+		.parent_data = se_gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_se_gcc_emac0_ptp_clk_src[] = {
+	F(150000000, P_SE_GCC_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(250000000, P_SE_GCC_GPLL5_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 se_gcc_emac0_ptp_clk_src = {
+	.cmd_rcgr = 0x24084,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_3,
+	.freq_tbl = ftbl_se_gcc_emac0_ptp_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_emac0_ptp_clk_src",
+		.parent_data = se_gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_se_gcc_emac0_rgmii_clk_src[] = {
+	F(75000000, P_SE_GCC_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(120000000, P_SE_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
+	F(250000000, P_SE_GCC_GPLL5_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 se_gcc_emac0_rgmii_clk_src = {
+	.cmd_rcgr = 0x2406c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_3,
+	.freq_tbl = ftbl_se_gcc_emac0_rgmii_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_emac0_rgmii_clk_src",
+		.parent_data = se_gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 se_gcc_emac1_phy_aux_clk_src = {
+	.cmd_rcgr = 0x25030,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_2,
+	.freq_tbl = ftbl_se_gcc_emac0_phy_aux_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_emac1_phy_aux_clk_src",
+		.parent_data = se_gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 se_gcc_emac1_ptp_clk_src = {
+	.cmd_rcgr = 0x25084,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_3,
+	.freq_tbl = ftbl_se_gcc_emac0_ptp_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_emac1_ptp_clk_src",
+		.parent_data = se_gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 se_gcc_emac1_rgmii_clk_src = {
+	.cmd_rcgr = 0x2506c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_3,
+	.freq_tbl = ftbl_se_gcc_emac0_rgmii_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_emac1_rgmii_clk_src",
+		.parent_data = se_gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_se_gcc_gp1_clk_src[] = {
+	F(66666667, P_SE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(100000000, P_SE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_SE_GCC_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 se_gcc_gp1_clk_src = {
+	.cmd_rcgr = 0x19004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_4,
+	.freq_tbl = ftbl_se_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_gp1_clk_src",
+		.parent_data = se_gcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 se_gcc_gp2_clk_src = {
+	.cmd_rcgr = 0x1a004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_4,
+	.freq_tbl = ftbl_se_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "se_gcc_gp2_clk_src",
+		.parent_data = se_gcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(se_gcc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_se_gcc_qupv3_wrap0_s0_clk_src[] = {
+	F(7372800, P_SE_GCC_GPLL0_OUT_MAIN, 1, 192, 15625),
+	F(14745600, P_SE_GCC_GPLL0_OUT_MAIN, 1, 384, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_SE_GCC_GPLL0_OUT_MAIN, 1, 768, 15625),
+	F(32000000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 4, 75),
+	F(48000000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 2, 25),
+	F(51200000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 32, 375),
+	F(64000000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 8, 75),
+	F(66666667, P_SE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(75000000, P_SE_GCC_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(80000000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 2, 15),
+	F(96000000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 4, 25),
+	F(100000000, P_SE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(102400000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 64, 375),
+	F(112000000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 14, 75),
+	F(117964800, P_SE_GCC_GPLL0_OUT_MAIN, 1, 3072, 15625),
+	F(120000000, P_SE_GCC_GPLL0_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap0_s0_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap0_s0_clk_src",
+	.parent_data = se_gcc_parent_data_1,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_1),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap0_s0_clk_src = {
+	.cmd_rcgr = 0x2616c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_1,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap0_s0_clk_src_init,
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap0_s1_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap0_s1_clk_src",
+	.parent_data = se_gcc_parent_data_1,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_1),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap0_s1_clk_src = {
+	.cmd_rcgr = 0x262a8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_1,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap0_s1_clk_src_init,
+};
+
+static const struct freq_tbl ftbl_se_gcc_qupv3_wrap0_s2_clk_src[] = {
+	F(7372800, P_SE_GCC_GPLL0_OUT_MAIN, 1, 192, 15625),
+	F(14745600, P_SE_GCC_GPLL0_OUT_MAIN, 1, 384, 15625),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(29491200, P_SE_GCC_GPLL0_OUT_MAIN, 1, 768, 15625),
+	F(32000000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 4, 75),
+	F(48000000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 2, 25),
+	F(51200000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 32, 375),
+	F(64000000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 8, 75),
+	F(66666667, P_SE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(75000000, P_SE_GCC_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(80000000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 2, 15),
+	F(96000000, P_SE_GCC_GPLL0_OUT_MAIN, 1, 4, 25),
+	F(100000000, P_SE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap0_s2_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap0_s2_clk_src",
+	.parent_data = se_gcc_parent_data_1,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_1),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap0_s2_clk_src = {
+	.cmd_rcgr = 0x263e4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_1,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap0_s2_clk_src_init,
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap0_s3_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap0_s3_clk_src",
+	.parent_data = se_gcc_parent_data_1,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_1),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap0_s3_clk_src = {
+	.cmd_rcgr = 0x26520,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_1,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap0_s3_clk_src_init,
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap0_s4_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap0_s4_clk_src",
+	.parent_data = se_gcc_parent_data_1,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_1),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap0_s4_clk_src = {
+	.cmd_rcgr = 0x2665c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_1,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap0_s4_clk_src_init,
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap0_s5_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap0_s5_clk_src",
+	.parent_data = se_gcc_parent_data_1,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_1),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap0_s5_clk_src = {
+	.cmd_rcgr = 0x26798,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_1,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap0_s5_clk_src_init,
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap0_s6_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap0_s6_clk_src",
+	.parent_data = se_gcc_parent_data_1,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_1),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap0_s6_clk_src = {
+	.cmd_rcgr = 0x268d4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_1,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap0_s6_clk_src_init,
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap1_s0_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap1_s0_clk_src",
+	.parent_data = se_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap1_s0_clk_src = {
+	.cmd_rcgr = 0x2716c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_0,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap1_s0_clk_src_init,
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap1_s1_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap1_s1_clk_src",
+	.parent_data = se_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap1_s1_clk_src = {
+	.cmd_rcgr = 0x272a8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_0,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap1_s1_clk_src_init,
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap1_s2_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap1_s2_clk_src",
+	.parent_data = se_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap1_s2_clk_src = {
+	.cmd_rcgr = 0x273e4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_0,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap1_s2_clk_src_init,
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap1_s3_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap1_s3_clk_src",
+	.parent_data = se_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap1_s3_clk_src = {
+	.cmd_rcgr = 0x27520,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_0,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap1_s3_clk_src_init,
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap1_s4_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap1_s4_clk_src",
+	.parent_data = se_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap1_s4_clk_src = {
+	.cmd_rcgr = 0x2765c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_0,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap1_s4_clk_src_init,
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap1_s5_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap1_s5_clk_src",
+	.parent_data = se_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap1_s5_clk_src = {
+	.cmd_rcgr = 0x27798,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_0,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap1_s5_clk_src_init,
+};
+
+static struct clk_init_data se_gcc_qupv3_wrap1_s6_clk_src_init = {
+	.name = "se_gcc_qupv3_wrap1_s6_clk_src",
+	.parent_data = se_gcc_parent_data_0,
+	.num_parents = ARRAY_SIZE(se_gcc_parent_data_0),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 se_gcc_qupv3_wrap1_s6_clk_src = {
+	.cmd_rcgr = 0x278d4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = se_gcc_parent_map_0,
+	.freq_tbl = ftbl_se_gcc_qupv3_wrap0_s2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &se_gcc_qupv3_wrap1_s6_clk_src_init,
+};
+
+static struct clk_branch se_gcc_eee_emac0_clk = {
+	.halt_reg = 0x240b4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x240b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_eee_emac0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_eee_emac0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_eee_emac1_clk = {
+	.halt_reg = 0x250b4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x250b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_eee_emac1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_eee_emac1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac0_axi_clk = {
+	.halt_reg = 0x2401c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2401c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2401c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac0_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac0_cc_sgmiiphy_rx_clk = {
+	.halt_reg = 0x24064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x24064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac0_cc_sgmiiphy_rx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac0_cc_sgmiiphy_tx_clk = {
+	.halt_reg = 0x2405c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2405c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac0_cc_sgmiiphy_tx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac0_phy_aux_clk = {
+	.halt_reg = 0x2402c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2402c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac0_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_emac0_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac0_ptp_clk = {
+	.halt_reg = 0x24048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x24048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac0_ptp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_emac0_ptp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac0_rgmii_clk = {
+	.halt_reg = 0x24058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x24058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac0_rgmii_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_emac0_rgmii_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac0_rpcs_rx_clk = {
+	.halt_reg = 0x240a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x240a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac0_rpcs_rx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac0_rpcs_tx_clk = {
+	.halt_reg = 0x240a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x240a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac0_rpcs_tx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac0_xgxs_rx_clk = {
+	.halt_reg = 0x240b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x240b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac0_xgxs_rx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac0_xgxs_tx_clk = {
+	.halt_reg = 0x240ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x240ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac0_xgxs_tx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac1_axi_clk = {
+	.halt_reg = 0x2501c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x2501c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x2501c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac1_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac1_cc_sgmiiphy_rx_clk = {
+	.halt_reg = 0x25064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x25064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac1_cc_sgmiiphy_rx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac1_cc_sgmiiphy_tx_clk = {
+	.halt_reg = 0x2505c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2505c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac1_cc_sgmiiphy_tx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac1_phy_aux_clk = {
+	.halt_reg = 0x2502c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2502c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac1_phy_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_emac1_phy_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac1_ptp_clk = {
+	.halt_reg = 0x25048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x25048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac1_ptp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_emac1_ptp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac1_rgmii_clk = {
+	.halt_reg = 0x25058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x25058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac1_rgmii_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_emac1_rgmii_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac1_rpcs_rx_clk = {
+	.halt_reg = 0x250a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x250a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac1_rpcs_rx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac1_rpcs_tx_clk = {
+	.halt_reg = 0x250a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x250a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac1_rpcs_tx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac1_xgxs_rx_clk = {
+	.halt_reg = 0x250b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x250b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac1_xgxs_rx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_emac1_xgxs_tx_clk = {
+	.halt_reg = 0x250ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x250ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_emac1_xgxs_tx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_frq_measure_ref_clk = {
+	.halt_reg = 0x18008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x18008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_frq_measure_ref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_gp1_clk = {
+	.halt_reg = 0x19000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x19000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_gp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_gp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_gp2_clk = {
+	.halt_reg = 0x1a000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1a000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_gp2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_gp2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_mmu_2_tcu_vote_clk = {
+	.halt_reg = 0x57040,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_mmu_2_tcu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap0_core_2x_clk = {
+	.halt_reg = 0x26020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(15),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap0_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap0_core_clk = {
+	.halt_reg = 0x2600c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(14),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap0_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap0_m_ahb_clk = {
+	.halt_reg = 0x26004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x26004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(12),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap0_m_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap0_s0_clk = {
+	.halt_reg = 0x2615c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(16),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap0_s0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap0_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap0_s1_clk = {
+	.halt_reg = 0x26298,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(17),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap0_s1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap0_s1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap0_s2_clk = {
+	.halt_reg = 0x263d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(18),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap0_s2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap0_s2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap0_s3_clk = {
+	.halt_reg = 0x26510,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(19),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap0_s3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap0_s3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap0_s4_clk = {
+	.halt_reg = 0x2664c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(20),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap0_s4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap0_s4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap0_s5_clk = {
+	.halt_reg = 0x26788,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(21),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap0_s5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap0_s6_clk = {
+	.halt_reg = 0x268c4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(22),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap0_s6_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap0_s6_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap0_s_ahb_clk = {
+	.halt_reg = 0x26008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x26008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(13),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap0_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap1_core_2x_clk = {
+	.halt_reg = 0x27020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(26),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap1_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap1_core_clk = {
+	.halt_reg = 0x2700c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(25),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap1_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap1_m_ahb_clk = {
+	.halt_reg = 0x27004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x27004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(23),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap1_m_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap1_s0_clk = {
+	.halt_reg = 0x2715c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(27),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap1_s0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap1_s1_clk = {
+	.halt_reg = 0x27298,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(28),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap1_s1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap1_s2_clk = {
+	.halt_reg = 0x273d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(29),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap1_s2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap1_s3_clk = {
+	.halt_reg = 0x27510,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(30),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap1_s3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap1_s4_clk = {
+	.halt_reg = 0x2764c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(31),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap1_s4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap1_s5_clk = {
+	.halt_reg = 0x27788,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap1_s5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap1_s6_clk = {
+	.halt_reg = 0x278c4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x57008,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap1_s6_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&se_gcc_qupv3_wrap1_s6_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch se_gcc_qupv3_wrap1_s_ahb_clk = {
+	.halt_reg = 0x27008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x27008,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x57000,
+		.enable_mask = BIT(24),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "se_gcc_qupv3_wrap1_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc se_gcc_emac0_gdsc = {
+	.gdscr = 0x24004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "se_gcc_emac0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc se_gcc_emac1_gdsc = {
+	.gdscr = 0x25004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "se_gcc_emac1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *se_gcc_nord_clocks[] = {
+	[SE_GCC_EEE_EMAC0_CLK] = &se_gcc_eee_emac0_clk.clkr,
+	[SE_GCC_EEE_EMAC0_CLK_SRC] = &se_gcc_eee_emac0_clk_src.clkr,
+	[SE_GCC_EEE_EMAC1_CLK] = &se_gcc_eee_emac1_clk.clkr,
+	[SE_GCC_EEE_EMAC1_CLK_SRC] = &se_gcc_eee_emac1_clk_src.clkr,
+	[SE_GCC_EMAC0_AXI_CLK] = &se_gcc_emac0_axi_clk.clkr,
+	[SE_GCC_EMAC0_CC_SGMIIPHY_RX_CLK] = &se_gcc_emac0_cc_sgmiiphy_rx_clk.clkr,
+	[SE_GCC_EMAC0_CC_SGMIIPHY_TX_CLK] = &se_gcc_emac0_cc_sgmiiphy_tx_clk.clkr,
+	[SE_GCC_EMAC0_PHY_AUX_CLK] = &se_gcc_emac0_phy_aux_clk.clkr,
+	[SE_GCC_EMAC0_PHY_AUX_CLK_SRC] = &se_gcc_emac0_phy_aux_clk_src.clkr,
+	[SE_GCC_EMAC0_PTP_CLK] = &se_gcc_emac0_ptp_clk.clkr,
+	[SE_GCC_EMAC0_PTP_CLK_SRC] = &se_gcc_emac0_ptp_clk_src.clkr,
+	[SE_GCC_EMAC0_RGMII_CLK] = &se_gcc_emac0_rgmii_clk.clkr,
+	[SE_GCC_EMAC0_RGMII_CLK_SRC] = &se_gcc_emac0_rgmii_clk_src.clkr,
+	[SE_GCC_EMAC0_RPCS_RX_CLK] = &se_gcc_emac0_rpcs_rx_clk.clkr,
+	[SE_GCC_EMAC0_RPCS_TX_CLK] = &se_gcc_emac0_rpcs_tx_clk.clkr,
+	[SE_GCC_EMAC0_XGXS_RX_CLK] = &se_gcc_emac0_xgxs_rx_clk.clkr,
+	[SE_GCC_EMAC0_XGXS_TX_CLK] = &se_gcc_emac0_xgxs_tx_clk.clkr,
+	[SE_GCC_EMAC1_AXI_CLK] = &se_gcc_emac1_axi_clk.clkr,
+	[SE_GCC_EMAC1_CC_SGMIIPHY_RX_CLK] = &se_gcc_emac1_cc_sgmiiphy_rx_clk.clkr,
+	[SE_GCC_EMAC1_CC_SGMIIPHY_TX_CLK] = &se_gcc_emac1_cc_sgmiiphy_tx_clk.clkr,
+	[SE_GCC_EMAC1_PHY_AUX_CLK] = &se_gcc_emac1_phy_aux_clk.clkr,
+	[SE_GCC_EMAC1_PHY_AUX_CLK_SRC] = &se_gcc_emac1_phy_aux_clk_src.clkr,
+	[SE_GCC_EMAC1_PTP_CLK] = &se_gcc_emac1_ptp_clk.clkr,
+	[SE_GCC_EMAC1_PTP_CLK_SRC] = &se_gcc_emac1_ptp_clk_src.clkr,
+	[SE_GCC_EMAC1_RGMII_CLK] = &se_gcc_emac1_rgmii_clk.clkr,
+	[SE_GCC_EMAC1_RGMII_CLK_SRC] = &se_gcc_emac1_rgmii_clk_src.clkr,
+	[SE_GCC_EMAC1_RPCS_RX_CLK] = &se_gcc_emac1_rpcs_rx_clk.clkr,
+	[SE_GCC_EMAC1_RPCS_TX_CLK] = &se_gcc_emac1_rpcs_tx_clk.clkr,
+	[SE_GCC_EMAC1_XGXS_RX_CLK] = &se_gcc_emac1_xgxs_rx_clk.clkr,
+	[SE_GCC_EMAC1_XGXS_TX_CLK] = &se_gcc_emac1_xgxs_tx_clk.clkr,
+	[SE_GCC_FRQ_MEASURE_REF_CLK] = &se_gcc_frq_measure_ref_clk.clkr,
+	[SE_GCC_GP1_CLK] = &se_gcc_gp1_clk.clkr,
+	[SE_GCC_GP1_CLK_SRC] = &se_gcc_gp1_clk_src.clkr,
+	[SE_GCC_GP2_CLK] = &se_gcc_gp2_clk.clkr,
+	[SE_GCC_GP2_CLK_SRC] = &se_gcc_gp2_clk_src.clkr,
+	[SE_GCC_GPLL0] = &se_gcc_gpll0.clkr,
+	[SE_GCC_GPLL0_OUT_EVEN] = &se_gcc_gpll0_out_even.clkr,
+	[SE_GCC_GPLL2] = &se_gcc_gpll2.clkr,
+	[SE_GCC_GPLL4] = &se_gcc_gpll4.clkr,
+	[SE_GCC_GPLL5] = &se_gcc_gpll5.clkr,
+	[SE_GCC_MMU_2_TCU_VOTE_CLK] = &se_gcc_mmu_2_tcu_vote_clk.clkr,
+	[SE_GCC_QUPV3_WRAP0_CORE_2X_CLK] = &se_gcc_qupv3_wrap0_core_2x_clk.clkr,
+	[SE_GCC_QUPV3_WRAP0_CORE_CLK] = &se_gcc_qupv3_wrap0_core_clk.clkr,
+	[SE_GCC_QUPV3_WRAP0_M_AHB_CLK] = &se_gcc_qupv3_wrap0_m_ahb_clk.clkr,
+	[SE_GCC_QUPV3_WRAP0_S0_CLK] = &se_gcc_qupv3_wrap0_s0_clk.clkr,
+	[SE_GCC_QUPV3_WRAP0_S0_CLK_SRC] = &se_gcc_qupv3_wrap0_s0_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP0_S1_CLK] = &se_gcc_qupv3_wrap0_s1_clk.clkr,
+	[SE_GCC_QUPV3_WRAP0_S1_CLK_SRC] = &se_gcc_qupv3_wrap0_s1_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP0_S2_CLK] = &se_gcc_qupv3_wrap0_s2_clk.clkr,
+	[SE_GCC_QUPV3_WRAP0_S2_CLK_SRC] = &se_gcc_qupv3_wrap0_s2_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP0_S3_CLK] = &se_gcc_qupv3_wrap0_s3_clk.clkr,
+	[SE_GCC_QUPV3_WRAP0_S3_CLK_SRC] = &se_gcc_qupv3_wrap0_s3_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP0_S4_CLK] = &se_gcc_qupv3_wrap0_s4_clk.clkr,
+	[SE_GCC_QUPV3_WRAP0_S4_CLK_SRC] = &se_gcc_qupv3_wrap0_s4_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP0_S5_CLK] = &se_gcc_qupv3_wrap0_s5_clk.clkr,
+	[SE_GCC_QUPV3_WRAP0_S5_CLK_SRC] = &se_gcc_qupv3_wrap0_s5_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP0_S6_CLK] = &se_gcc_qupv3_wrap0_s6_clk.clkr,
+	[SE_GCC_QUPV3_WRAP0_S6_CLK_SRC] = &se_gcc_qupv3_wrap0_s6_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP0_S_AHB_CLK] = &se_gcc_qupv3_wrap0_s_ahb_clk.clkr,
+	[SE_GCC_QUPV3_WRAP1_CORE_2X_CLK] = &se_gcc_qupv3_wrap1_core_2x_clk.clkr,
+	[SE_GCC_QUPV3_WRAP1_CORE_CLK] = &se_gcc_qupv3_wrap1_core_clk.clkr,
+	[SE_GCC_QUPV3_WRAP1_M_AHB_CLK] = &se_gcc_qupv3_wrap1_m_ahb_clk.clkr,
+	[SE_GCC_QUPV3_WRAP1_S0_CLK] = &se_gcc_qupv3_wrap1_s0_clk.clkr,
+	[SE_GCC_QUPV3_WRAP1_S0_CLK_SRC] = &se_gcc_qupv3_wrap1_s0_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP1_S1_CLK] = &se_gcc_qupv3_wrap1_s1_clk.clkr,
+	[SE_GCC_QUPV3_WRAP1_S1_CLK_SRC] = &se_gcc_qupv3_wrap1_s1_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP1_S2_CLK] = &se_gcc_qupv3_wrap1_s2_clk.clkr,
+	[SE_GCC_QUPV3_WRAP1_S2_CLK_SRC] = &se_gcc_qupv3_wrap1_s2_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP1_S3_CLK] = &se_gcc_qupv3_wrap1_s3_clk.clkr,
+	[SE_GCC_QUPV3_WRAP1_S3_CLK_SRC] = &se_gcc_qupv3_wrap1_s3_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP1_S4_CLK] = &se_gcc_qupv3_wrap1_s4_clk.clkr,
+	[SE_GCC_QUPV3_WRAP1_S4_CLK_SRC] = &se_gcc_qupv3_wrap1_s4_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP1_S5_CLK] = &se_gcc_qupv3_wrap1_s5_clk.clkr,
+	[SE_GCC_QUPV3_WRAP1_S5_CLK_SRC] = &se_gcc_qupv3_wrap1_s5_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP1_S6_CLK] = &se_gcc_qupv3_wrap1_s6_clk.clkr,
+	[SE_GCC_QUPV3_WRAP1_S6_CLK_SRC] = &se_gcc_qupv3_wrap1_s6_clk_src.clkr,
+	[SE_GCC_QUPV3_WRAP1_S_AHB_CLK] = &se_gcc_qupv3_wrap1_s_ahb_clk.clkr,
+};
+
+static struct gdsc *se_gcc_nord_gdscs[] = {
+	[SE_GCC_EMAC0_GDSC] = &se_gcc_emac0_gdsc,
+	[SE_GCC_EMAC1_GDSC] = &se_gcc_emac1_gdsc,
+};
+
+static const struct qcom_reset_map se_gcc_nord_resets[] = {
+	[SE_GCC_EMAC0_BCR] = { 0x24000 },
+	[SE_GCC_EMAC1_BCR] = { 0x25000 },
+	[SE_GCC_QUPV3_WRAPPER_0_BCR] = { 0x26000 },
+	[SE_GCC_QUPV3_WRAPPER_1_BCR] = { 0x27000 },
+};
+
+static const struct clk_rcg_dfs_data se_gcc_nord_dfs_clocks[] = {
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s0_clk_src),
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s1_clk_src),
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s2_clk_src),
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s3_clk_src),
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s4_clk_src),
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s5_clk_src),
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s6_clk_src),
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap1_s0_clk_src),
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap1_s1_clk_src),
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap1_s2_clk_src),
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap1_s3_clk_src),
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap1_s4_clk_src),
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap1_s5_clk_src),
+	DEFINE_RCG_DFS(se_gcc_qupv3_wrap1_s6_clk_src),
+};
+
+static const struct regmap_config se_gcc_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf41f0,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data se_gcc_nord_driver_data = {
+	.dfs_rcgs = se_gcc_nord_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(se_gcc_nord_dfs_clocks),
+};
+
+static const struct qcom_cc_desc se_gcc_nord_desc = {
+	.config = &se_gcc_nord_regmap_config,
+	.clks = se_gcc_nord_clocks,
+	.num_clks = ARRAY_SIZE(se_gcc_nord_clocks),
+	.resets = se_gcc_nord_resets,
+	.num_resets = ARRAY_SIZE(se_gcc_nord_resets),
+	.gdscs = se_gcc_nord_gdscs,
+	.num_gdscs = ARRAY_SIZE(se_gcc_nord_gdscs),
+	.driver_data = &se_gcc_nord_driver_data,
+};
+
+static const struct of_device_id se_gcc_nord_match_table[] = {
+	{ .compatible = "qcom,nord-segcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, se_gcc_nord_match_table);
+
+static int se_gcc_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &se_gcc_nord_desc);
+}
+
+static struct platform_driver se_gcc_nord_driver = {
+	.probe = se_gcc_nord_probe,
+	.driver = {
+		.name = "segcc-nord",
+		.of_match_table = se_gcc_nord_match_table,
+	},
+};
+
+module_platform_driver(se_gcc_nord_driver);
+
+MODULE_DESCRIPTION("QTI SEGCC NORD Driver");
+MODULE_LICENSE("GPL");

-- 
2.47.3


