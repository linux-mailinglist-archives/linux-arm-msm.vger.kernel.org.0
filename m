Return-Path: <linux-arm-msm+bounces-106953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKGSHsDqAWpHmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:42:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 311D3510678
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6002A30B2345
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CC63FE64E;
	Mon, 11 May 2026 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rrh98Mne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOOcO67R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E213D47A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510235; cv=none; b=u0F2YdqmjTGPw6oDZ/CQk6xHUapd3/1w8S/lkH8jSZpfZ7zeMhtpkVfMLX4FabR78JLPw99MMFl/MlMDcX2sALDr9LrfXAHW3IY/STyagd3BemKGZBKaypwntDJx3QuAdCc9WlY40GOaJn2aDRZf+XAfsHfJM1tikwYqnMHWV+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510235; c=relaxed/simple;
	bh=p5Kug1tNLTgkIN4VM5MK/PJ60rtDv5/qU/L69mB5lIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SnrtkTPz0XXaVeXq+K6mFkvEKQaMVO9xfJ87Rs0FmJruJMa+xN0CN5xweOkRYC5Atjyp92dzR1tAHc8fC7pPux7CtXqo4ikP6+91p8wydmRDB2QA611bVgu/dHgMaoZIUmndX4Vq4p9ab9n0nkN/XFz3DIVSDbrI39uTvaNc78g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rrh98Mne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOOcO67R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BDC7k91258491
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HULKX73qzdciugZvR3HKlS
	qQjAScB/2pEIkvEnaSpo0=; b=Rrh98MneRojJoTERz62lWZ30sCZKINFg0qgPWf
	Cd/7vM6h+Rk4bIFztJlrgqy7n9f994HKe/ATF67wDo6XSUoXas+FAC1oq5Ukti9c
	lXpTjI0t9KnEnBQi/s9TghtZcaHOdM/6CEtkfWH1wT1wCeaOOxuH0TqhCWcED9r1
	XSiNKAA+g0KMTxT2r7FtI/5NKP6Rjw8fArjkbadXbPig6Q7FaGh0sh+opuMj8sIr
	1BV59INPD8cs53HgxR1qHkAqJ5/FaCI+RyG8VOlDsNfTtqNSHTReoHuU9iBtXPmi
	MJoPx2FYWJ++mYBG5xaU7yU+JsvNhbS1512jHXOMR5kXwzJg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag21mue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:37:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso4277499a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 07:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778510232; x=1779115032; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HULKX73qzdciugZvR3HKlSqQjAScB/2pEIkvEnaSpo0=;
        b=iOOcO67RRlnoWvpHl82Acy9F4TBvv68Pr+zlYBMi8pRTol40tp59qxLjoZttj7JY99
         wF8SyTk4Y8+lelZMA8u8XAfL6r7lnVXBRyHz4FI9/N9Slavh0OhkBZRWeAwIr/uLL+I+
         ZWzc2uSirX8QY7mxBwBUCgNDOJMhEhW7Pr0WdMXijzYomVHMokuweMrjkvxq+bYCtO8B
         I7X7cQzP/z870tOUTemnt85HvV9EhZ0foB5MrjwmJY7SGAvT2q6qXJ3g/ldwh5PKMyDK
         wzf4INwCHApfhPd5bcyBvahO11ocH+TqrEt+XEo9ptVAUS7KS2zCP+NyROxgAev6JUq/
         MgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510232; x=1779115032;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HULKX73qzdciugZvR3HKlSqQjAScB/2pEIkvEnaSpo0=;
        b=JW5zk67mvs53jBHgPagGmOCPv/IOjki9+BOofkpWU64IR2nSJnIlG4K8duqwd+0yHO
         yYSb1D+jj+j1yb/vB1s/ifAmrmfmR+U/978H4vY+e64AYpWYQX6ri+Z5odqItO3zuprs
         GbUeuMDbw3bNjrwgbH+CDiiXDXaGDUsHlV1emFmtFKqvE0UnLe+N8GaTWl2xByNoLE9r
         GM4BsUcrghBmBV+Hd5TFlHxWujcYS++GTvtndSVql+snSyxVa+hBb1X9OCUYOSKbjex5
         B/5O59sDVB9PtuWLu0KyTfJvefJFvEY080t9AwzlxdRxkubQnNy1qGJe3VjuBzLV4NzK
         gFug==
X-Gm-Message-State: AOJu0Yw950shZ2Piq2TfW1N9AzRza9v2l0jPrbvn0jQ5YLJbOMuEL/Q/
	IXztHXO7Hr6nPEin2H3mnDmy2vg/tpvTkkiO2R0SR0+Qzqzg6QUYszrrWpiz9DWrgyRcMDJd14H
	YGHsFCGX+J9+7z1iWxh90Kshj6fB/NorZkIcwma9of51XMsOzhsSVa3aX36II6Vd6Slm/
X-Gm-Gg: Acq92OE+SQ++VZkgSc0JI+3eQiLaXbTFklrmC86nnBu1GW0oTutjsbTePE3xlCXPGuL
	K76fW6Mfj3weRof86vry3DNOBCCSLiiDlAjpBd5PuhR4/yGkceimz3NUZ83KGAUsjQqbk8kTZWu
	1+N7R678ICuhOFOzesunjAuYJ93a43gnTFmgCD9WKvszTAZhSDU2q17JZJA9TSukZ37REgeq9eG
	zD52EAfy96soeHWVSaRaKe6s407ZcUwVHCSHK4EeTwnFhxJeWHEpXd7+ZVVjtgg5v+/FLh4Dmu/
	RtGFcRQmz/9R5tyvZFCi+CxsG5OXO9tOtRj9yUU5GthnNb2mSLmK19iD74q1VzUaGXw+wY+a2aq
	NtzJnavqaJeHzv7ooKJv8MKbvwG08K/QRHaBHQdoF4w9neDY8HRmC9Wg9tlQS96lredUovkd+Zl
	+FV2SAJLGF7BKMPoVHdhPkXXDD/9/YYtE8FMiSznvvt/V91VKQklVGdu3OqlHGV9Q73kw=
X-Received: by 2002:a17:90b:2248:b0:35f:b348:63e with SMTP id 98e67ed59e1d1-365abbe373cmr25939271a91.9.1778510232363;
        Mon, 11 May 2026 07:37:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:35f:b348:63e with SMTP id 98e67ed59e1d1-365abbe373cmr25939220a91.9.1778510231745;
        Mon, 11 May 2026 07:37:11 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367bcbac3b6sm3059935a91.0.2026.05.11.07.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:37:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 20:06:56 +0530
Subject: [PATCH] ndings: watchdog: qcom-wdt: Document IPQ9650 watchdog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq9650_wdt_binding-v1-1-d2779e756bf7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIfpAWoC/yXMQQqDMBBA0avIrA1MBIfaq4hIk0zsdJFqYlUQ7
 260y7f4f4fEUTjBs9gh8iJJviFDlwXY9ysMrMRlQ4UVYa21knFqqMZ+dXNvJDgJg0LyDRlyD/Q
 WcjlG9rLd17b7O/3Mh+18reA4TmOUN453AAAA
X-Change-ID: 20260511-ipq9650_wdt_binding-06f96b6d80fc
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778510227; l=1074;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=p5Kug1tNLTgkIN4VM5MK/PJ60rtDv5/qU/L69mB5lIk=;
 b=ku2iuQdaoyIH56leKRoFmsG/f+nB4AUsdzOR/gXGGTMazNIg3fpjYwO9GSSyk6FQ+Uz/X26Pz
 dWD5rSIa13vC9IwF+qQh4aDGYwPl5E4f5DCb0v4zGPHdvkLBiFlSpDZ
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: a-pA0y2sGH7EDQSZEfN3rTtPGxGNGttx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE2MiBTYWx0ZWRfX3GPjGonCZIJ9
 GZwFOJTztXXXPZnIurUWWSFJ4Z0//363nPHAt9/CFd+PgpSU6tLE/ZOD+d/TNqccE6+meh0KPBX
 5jTV1BZare0xhfFz5rbSvRizDjV3Ln6IxWgvwQiF+QS+3El48k8SExPtSmcmfG/cCQanD4P6a5N
 3RWnwqjMxrjsS5bV6faMm+B61SCoocVL0JwuJhJ94nStNt3WNpSqWPFccrk48EXgoTqZCokTh1J
 iHnEoNd2NeF518OnV5MB+2LYBMshbQ0mFc/iL/cgaev1khowVWT3iWBl7caSnNKOouHluvb/mhX
 O727iYJTpE6eM0PnpOuUNPn5bgveyGbHMAzhSo4UAp85oaFSBTSoBF23+Ipg419zEFQRpUMgL4c
 6rMyAy/opUDLysU9GP2oe+JcV2UmU1tW5opXQGB8MHleQlKgsa6mXbLiBvYM8DH7eCTQ0vtR4g3
 1snRDw0ffNNngNrg0Fw==
X-Proofpoint-GUID: a-pA0y2sGH7EDQSZEfN3rTtPGxGNGttx
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01e999 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=w4RUFeMe5Se8zSgF3B8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110162
X-Rspamd-Queue-Id: 311D3510678
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106953-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the watchdog device found on the Qualcomm IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..54b2378525c0 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,apss-wdt-ipq5332
               - qcom,apss-wdt-ipq5424
               - qcom,apss-wdt-ipq9574
+              - qcom,apss-wdt-ipq9650
               - qcom,apss-wdt-kaanapali
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq9650_wdt_binding-06f96b6d80fc

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


