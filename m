Return-Path: <linux-arm-msm+bounces-101955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EVDAe+202l+kwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 15:36:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 593C63A3969
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 15:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1D04301349F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 13:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711B9288505;
	Mon,  6 Apr 2026 13:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqHiOgBk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UgVvw/Xw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906972652AF
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775482604; cv=none; b=DKKLdfs6AITkXyp5E5ZFJiGGtwJZJITjzq6SdcAlWgENjxIoQH2q7MlQn00H/UWp8tL7wQ3rrkTAENjoUquzuhE3t2IpcQN+6DP7V7dT3qGn8OzsFVhT+ZKE2yq4wE+mG9nLetmO6jr3/eEdzy+enZWZipCa7TrfiuuCh2oMkzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775482604; c=relaxed/simple;
	bh=Lv58i/3SsfM0bw3as4gXi6fzxDYm9GlG7i+Y45TCYwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YccZVXWarTC5Ei6VeWF4UZUKovbyFT3d5S+fwfroiJ6xe6+hTC53DRAJLPFKqlX0LpNRDrVA692xbjtPdH5MyGDFWcFV+8kvgUA/Zd7xBliYMkSkKoSX9suYB/Utua0Dm1tzMo7lV3BnnSiitsF90IiC3fh0+sMTgEeF4WbULO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqHiOgBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UgVvw/Xw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6366WiQe730097
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 13:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QQeww7QGYgNJDU/rZW/93R
	+9mEweDrvUfKnoJrTGYao=; b=NqHiOgBkC/Jx6PteZ0ycbvV9+vGqC9GJ2AIGo1
	+k2SZvskrqxfXR0fFUtAl228ngcpT4DffQggEzXkzmY+WGEQ7bFXY/H+Ua98Fm18
	Fmn1UE0D7Lu9i4MUn6FM/Ao72QKdLw0JuzvNcCu0t8z3RV5kZTgOnWWQNlfv4Nfn
	sELPkTDWmqQJPLzx6b/s2/D4e+epEu394XB43bZHY2O/YirbLhE0ka/ZU+lBXSWZ
	Uv2WaNFoh5DNBGm3upLnyI6n8CJ57Uj39Ch4N1jPhDaBX/tP6ZY+cfxqEOUasHqF
	XpqUHK1+waUnaq4lT2duMz8bWzdcENiXQ1oUDi6h6Zmi6H0w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux8d8e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 13:36:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b249975139so102574865ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 06:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775482601; x=1776087401; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQeww7QGYgNJDU/rZW/93R+9mEweDrvUfKnoJrTGYao=;
        b=UgVvw/XwRRG20JxdWY7TIlNZt6x8o6RJftKKt+OAPfBNA9fWhKF7IjxdAnGInEZbP5
         zMT31c/Rgqj2EJMX5j4/v6QCYgfHnmfhrFxT/xTtzHGrm/J1kkDPPUKXvztmcneSZ5iH
         G8mNJp5uYKfHnS0KP/56vdK61spROCc6WKjTj/ys6q73hLXHGCn3tR+yqDbn9Uuonc6r
         NpbhqYv8pPsDvU8Y0FeAxCinFTuI5xDYclFhixVbeUSr3Kx+8V+nHcIEzxvo9rM+AkXo
         wzK6rWz98k54VzntgR2icEahhYAfDKqFNBB6WhBY8qSoQILEDa9/tO13IeQRELLrtqea
         PGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775482601; x=1776087401;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQeww7QGYgNJDU/rZW/93R+9mEweDrvUfKnoJrTGYao=;
        b=AxHDFKk/F1UkoVrKCSmbH34r5RJg79Ew5Wp7BEZCWQoHV8BMqrJqlqhR+CPusGgbX8
         zNHZbxNQpV23+jZdrCc1hYOmV23RAcMNMeCpOBYNAZHuC/aE5l0vuNIKkUcvc6q7uuiS
         plTKUisz0tIbfb28x4i+K1OpY95H5d0fXykrHYbV5NxQE5inoEx+NtUt5mZaS7eDUWGo
         htxWJdWK9SAU2tuu7vHZ/sxavMXwGTvsNxK7+/eI7Is45oX8kooTsMpQF5D7KSjLEDa8
         WqPmwJZtFKDJCHqBvunYqWFrzw4uHqIBBGWoK2A/RtgUxHgwh1iulTZaFJNo2Jg1ChgH
         3sjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBTtvKiJy2LKKGSLadJ5sDXqrsCSnFXoi5sPs9C8mK+1dz0DJo8GD1qMXrYtUWaZ7ijQJ36oJaW1fyGaes@vger.kernel.org
X-Gm-Message-State: AOJu0YwaTAkmY0tnSsFT2KhcS2xNLx+o3/yqrcBkH1cYuX7Sy0Yyjril
	KZBuSyYyEwh5aQXCk1kYIYRsqinF389WrMTgpSnxU524mJrYbj+y3Kjgfyac56GAOMpGqpHmmPf
	U4Vq8GdxwRE65MaCd0G4LS+VokcLg24sRDNx2kBhH4+/7yfiK0WtRyAUusdfmRzqPWItM
X-Gm-Gg: AeBDiev3dtmO8e0UFPbcrFYlIC7ChBJQWAHO7jtcOEQsGb5mF14YyaHx8I6w6WVqjpt
	TZgzKKEgNNUCkBHLStglrvpZBXteMXi7maZi3PdYAzngeqD5U20EhNiso+PzygDn9x9Fl6tKRvW
	U4m+wes0OlwdD5ri2u88qyCoIlVHLC8puPaPOUHW+pvSTlUJelKCkkhQH4frNPV9KPl/kzoFpJ6
	3Vpa1wlHMc4pd01eJNprilBfFuqZuYPcJUD34mcYvcwrWnAUS41L5+NjmUHcwx+u+y/Mj9IC++r
	dzv4+cgaBbL7Me1Ocimsf8vC19bPnz0wIf2OCVKToPsU/x/+hXYZ6stM3/2XRD0qJztw7nJqgMx
	7eu2Dm0nPJ81NhjzHk8HllOHw9bppDE9NK7Q2F1eCq2nFbRc10VY=
X-Received: by 2002:a17:902:e749:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b2817ef051mr144409575ad.41.1775482601192;
        Mon, 06 Apr 2026 06:36:41 -0700 (PDT)
X-Received: by 2002:a17:902:e749:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b2817ef051mr144409105ad.41.1775482600468;
        Mon, 06 Apr 2026 06:36:40 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a3af9sm133535945ad.63.2026.04.06.06.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 06:36:40 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 06 Apr 2026 19:05:55 +0530
Subject: [PATCH] arm64: dts: qcom: fix temp-alarm probe failure for PMH0104
 on Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-glymur-pmh0104-temp-alarm-fix-v1-1-4441b7b01f85@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALq202kC/x3MQQqEMAxA0atI1gbSInWYq4iLYqMGrJZURRHvP
 mWW7y/+A5lVOMO3ekD5lCzbWmDqCobZrxOjhGKwZB01ZHBa7ngopjiToQZ3jgn94jXiKBe2lt1
 g6EPBMZRHUi75/+/69/0BLuGMwm8AAAA=
X-Change-ID: 20260401-glymur-pmh0104-temp-alarm-fix-72e6c1080d6e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775482595; l=1579;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=Lv58i/3SsfM0bw3as4gXi6fzxDYm9GlG7i+Y45TCYwU=;
 b=qrX/VysOGhciZX1HzpDUnOVR1FIPT1msani5LHCDYwyEPsSHERJhp7i9QCTRj0HVqFfodRO+5
 LGiF7JFvqOGB2L4QAy0JLY+19fe4JsZFWAyzW/IINpKM9SqS+TyWRKg
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-ORIG-GUID: 0HS9-z8a3ZzZM9_4xthOqtsEP71oPEWG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDEzNCBTYWx0ZWRfX0hZPIkIyFOd5
 xISLHNdKj1E48M+Zkx3V6+KUfP5oBcPhQRYmkA2RWBa2FljlYgQEfGFGl6zUZNMGmxphK8GO8TN
 onK9v3QGEHclr9k2QkcqhhYnTh0MXksCnZU0Qy2DWbr9tVOegd/ZmRJRF6yI20uhcJfG9KnJwVm
 qzaxObH98pVHTVQ3zgl1PH9RNMI9Kt6CGpZFwi/e0M7hUkdHWeEaZ4z3APnQuA2qNUSBnZtnm9j
 oquEx6LX5Tng19dDWsrbN/6pH3jfEUpX3RF1abJ9/sm8IXiru1QyILjFBJewJHXmIgmWSLS9rRR
 kmtoQg++613olipZd8tPM6k7giZiEi477UQamEcXPzUN0CVDW4dRUm5MNP+3gDGSbsqlGWMHoU+
 dc3Bbdk3D7rSmjDT0kzlT6X7cEdBniE5eKagaj8+miFmCqqiexdyzF/Ux3hTNreh6Zd41hC6aKD
 GUN/5mbfNgetS6Gc/6A==
X-Proofpoint-GUID: 0HS9-z8a3ZzZM9_4xthOqtsEP71oPEWG
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d3b6e9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nwn3hN-nbngWV12mDskA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101955-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.9:email,a00:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.8:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 593C63A3969
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The temp-alarm driver probe is failing for the pmh0104 PMICs on glymur.

[    3.999713] spmi-temp-alarm c426000.spmi:pmic@8:temp-alarm@a00: error -ENODEV: failed to register sensor
[    4.015066] spmi-temp-alarm c426000.spmi:pmic@9:temp-alarm@a00: error -ENODEV: failed to register sensor
[    4.033908] spmi-temp-alarm c437000.spmi:pmic@b:temp-alarm@a00: error -ENODEV: failed to register sensor

This happens because thermal zone associated with the temp alarm was
defined under the thermal zones parent node which had a typo (used `_` in
place of `-`). Correct the typo to fix probe failure.

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi b/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
index 7a1e5f355c175913a38d536a1ca13d870049b741..6b4747025b9f85d5fe58ee6ecfbe8d07b38d29fd 100644
--- a/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
@@ -7,7 +7,7 @@
 #include <dt-bindings/spmi/spmi.h>
 
 /{
-	thermal_zones {
+	thermal-zones {
 		pmh0104_i0_thermal: pmh0104-i0-thermal {
 			polling-delay-passive = <100>;
 			thermal-sensors = <&pmh0104_i_e0_temp_alarm>;

---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-glymur-pmh0104-temp-alarm-fix-72e6c1080d6e

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>


