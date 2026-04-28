Return-Path: <linux-arm-msm+bounces-105089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J8qI1Y08WkgegEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 00:27:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F394548C93F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 00:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1649B30538C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCD837F728;
	Tue, 28 Apr 2026 22:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWhHrLLh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNg80Azc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E82C37FF4B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 22:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777415240; cv=none; b=jj3V2BwecIn7jDKL7Fq7zRcn2z2VZ7GM2rNpxzit2O8yOS94ZOVqcPoRkIxQ2qGBXnAzTwNlipYYo1I/bWH/tZW15FV1kPzksgqRFRGsYwdeY6nuSqipOz/6WxYV3COHreCT6V/qeEJnoucDzJuwJlp69FplvaaIgHY6Dw2Wi6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777415240; c=relaxed/simple;
	bh=cyLOsLgGfSGowoFphzYRttd2N3m4js1yllACGjnMxes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZSQNK3COn8p3YGrkaYE36HyUE6F0flo7coXUfmQY6Z7v+gHh8X+VIibHf+X/TwcYF/lmuP4q8SWtHsz2N/g9WRXE5bApxrTnIKq3kD6TF6cO5w+gpD7fYmT/W5z/HAmXcvCpEgs0GG9KVC//Ab8K6xNuTo6X1LI+RlD/6qzP3Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWhHrLLh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNg80Azc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SHZwBk017736
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 22:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Szpc6Yl0LjGdXx3qms5W41
	EcMKh7DYFZcHHau7nipaQ=; b=aWhHrLLh6y6BgigN52tud95MUNxt7q3HYol0DI
	ZLcr+eJpvyq14t37z7dsy8GTB5MFRNrp1PXiaEZWTF42K1nMxpu7bz0kjf8+Qspa
	ED+d/uLKW81y+6+9RDacG4obWP64jYpq5EeV5h1zfwoOeP4DCFhBzraIfT39Fi0X
	SKSTH0wh0j+BtSoL55PPMx7YbHZbFISvdAZDFskayTW1yup+ZdP6ppUV0WIFQay6
	Onl9RDZ/W4MtXU2Azh1rkWB4vxf1M7PVXXgKHxClfvhKC/5lXZHzCtj9qYEbNXxA
	EKg9ta08oWos7j2FZWMdz6/MSNTfbo+fCn9PzqUV6btwdUxA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1ee8vru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 22:27:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50df4c130dbso10580651cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 15:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777415237; x=1778020037; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Szpc6Yl0LjGdXx3qms5W41EcMKh7DYFZcHHau7nipaQ=;
        b=UNg80Azc7ZYTwPIwk9UfXMyglkNBDwvS+kFf7RHfOLKKF3Dt7mOj1baHy39xS4j9Q/
         6lFPoPAqAhAWpUc34QMpE79B3Do5Yk2NXupwjDRftVZqkgjp5KqPaNAO9Nn5PVWsVXT/
         6I/h8cJ/MqSDJkbPvW68QVe3Mbtd1N7aWufwbMfM/Y2+t/HPKTch67luyrmChoagowA5
         D3o5X++MlrZZW2c8o4CuNYCtf2mQtoEA4Uw+BQpmZ8ulFDhnIjWEnxEUwsu+8fI8h/pc
         1FwAgtFjRxwsbMDl8OC/SCQ2YxmjT8xV2cbHhTdThdiIlTiphM5pEu1CMk2zmjM69OS/
         5eKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777415237; x=1778020037;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Szpc6Yl0LjGdXx3qms5W41EcMKh7DYFZcHHau7nipaQ=;
        b=YVEx7CIB0iQa5XxlUJxOshGzszpQmtQ6RSAqGpbtY8YwAKG462zBG9cTN+nG5RN8yo
         uGAOkyUHXnUsiT74xUN5d95MUJ7kLeaUv0bpiCoDwMMUTRWDUNDbw0pYTKuOFShZH59z
         BbNYz1LPVRCTl2hR7WMmyebLT269dL34TeDRS6q20cILaOSBHLQKcfUWZFmybSsUQnvF
         OAlNtxpqPq7homo10utU1wjw+F5SIUqtZhbzyYLuWT43ZIdicLDqJhi4Ad1W41rX/EMO
         lH/1Vthqt2wQ63oRfyj/S/huh8xBSQd5umK0GyyDbsMGq9R2Kj+9Aco3Nky1JzHscWdf
         DBWw==
X-Forwarded-Encrypted: i=1; AFNElJ88M79DhWexoQO7g9DiVQrTGxYRrFS2FEcgrP3D3T5KPxsBq8RWwka3sMBRhAgz6ZWZ/VFtiuI+Xp5vmBEr@vger.kernel.org
X-Gm-Message-State: AOJu0YzAJTdXvYKr92b+0IhGh0zvqsnEWQWCCZ5fX148VrLwjdx4N7lz
	Qf7BwcdDb5Q4kYrcMBm9/mum2i424KXhRr9tZXExTGqr1ReDySfh4OvqHUH4l/BBCc8Tclyo283
	rAG8TPZs9dvLfZF2LnkXsU0vp4cbBHRB4OpbP5QSyYubJXJTvwciCghnriGzzIEhxNT1c
X-Gm-Gg: AeBDietsEt23wdug3qp5GX0RsBs6ywjfcX8IVHIsr/ub0J1UKipAF1NZVdlm/FbXryy
	JLjxzbJmvn0q0+qqr435UZrg7QFx8/yWCO7PYdYco3ytkEt5t8DUyvmQXudszaLOwG3J4NKYAIs
	jyseB5WB4K0zYi0zjOzBDgR0yIaLYbXA8JK9F1Lj067pHuNyfDv9Lkwd7l49dvLkaM3nJT9vZnx
	JxfHyhMkDWHx5wRPbbFJcWXWspSSJDzIafgv2jWIuiXipq4s5+jIg0AueRXRrsPI98IpQEMHgLk
	n/G2yM2jXkmnW9VUiWNjO/WnuJ4pAhjO4oVd6ztbiuhYatsCa5yKzk1fFIfRQYC8JsMR8hIaida
	ruRNOPwj4Pt+YTjZuF1F43L4sbTRbJeU7TEIbqz6TBloPQW5JTJFmb9nWaLdAfkyx5YvZnwRAnd
	rz1KQQPPUNX3FF+f1y7vs0PW2a4ZXuy99Fh750GIS94z+tTQ==
X-Received: by 2002:a05:622a:246:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-51019a4281amr12598641cf.14.1777415237566;
        Tue, 28 Apr 2026 15:27:17 -0700 (PDT)
X-Received: by 2002:a05:622a:246:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-51019a4281amr12598281cf.14.1777415237059;
        Tue, 28 Apr 2026 15:27:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a6e340asm72787e87.15.2026.04.28.15.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 15:27:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 01:27:12 +0300
Subject: [PATCH v2] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-c630-fix-idle-v2-1-ac867dad6f21@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD808WkC/3WNwQ6CMAyGX4X07Eg3cFFPvofhMLYqM8BwBaIhv
 LsDz16afO3f71+AKXpiuGQLRJo9+9AnUIcMbGP6BwnvEoNCpbFUJ2F1geLu32nfkiCHRmrpSjw
 ipJ8hUrrtvlv1Y57qJ9lxk2yJxvMY4mcvnOWW++eepZBCnR06UyhNdXENzPlrMq0NXZenAdW6r
 l9B8B/pwwAAAA==
X-Change-ID: 20260428-c630-fix-idle-ed0a161d4050
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cyLOsLgGfSGowoFphzYRttd2N3m4js1yllACGjnMxes=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp8TRBPaGoo/TV+pcINI9T3vP1ezeSN5pHIZbmd
 1XbLraVjuaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafE0QQAKCRCLPIo+Aiko
 1VBsB/9aGD6rtYcWbMEwXflPQ8XbsvOYdFYAeSiiGCZem4N8HCYlk4PITu7Vi2I2SUiEUl9M5ck
 D5SxwzrmD+PRW4Ezm4yDJFMQykepJcz3mGxNCEVOyssMK6jvTazzJQx4t7WwR+TNVvTUSaSkfKr
 piDv2JxaA/l/NU+WEcKcFzJtFEsPUgWObf8xC+xKKszsk3NGUIcDDdX1hoxKfRNAZuOCt8P1XHc
 LiI3GYjQ03j8Otcmq5/TUY3kF7OGvs2Ykkw970wawUzuFUJ/rWnJH3xNAV1Oju5FfU1A4nTkSp2
 As6/YTuoq6l6+7N5lP52VBdOBm/h6F3vjKavUZ+/kvZf3/UP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f13446 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=z-5OR1w5r7U-zSIIpooA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDIxOSBTYWx0ZWRfXzu5I7pjbpNFB
 ZGV3wwyiJpE8hA7pTKwxS3tmNNeicc9s7shfsC3c79psGbVAqgudulp1e/Driwy7E+OZURYhlFV
 Be38DJtYW0k5itFXYNzmVRtzkZCzrz71MKVTjgKesOAO/FJckExazdLnQdrHBbkthgmUKAe6+h6
 gCAw7gWNM/QSdTEZLO8HxegkPEAJ2l9Qdz+5bZ+WV+tb8SxG75Oc2CTV4tCRa0prc1sLmj4Ub2T
 k2cqExl6CsMJ9uL3Nto+eMxrya/sYq5RXERHRQvhSC6VSTI9g51PzzI92Nx3PmID5I/2sOzjFDY
 5DjG6KbiskLdTDujX9MdqxC2a9SQugKp9iy/gSPtpo4PfKqxm2A4q9TZ8ZM29FVbOfI6JyQgX+w
 +aOBg9l5Qu4uEtglK9b8EPOV2wYhzJIVp3gmiaylmowjcm7wXTn0I6SnVuSZKJSpvMiuZXg4bZL
 6XrPuXCBx762UmNRB5Q==
X-Proofpoint-GUID: GHWiYARSC5EjuKeh5FCGaQKoZNLNsTrs
X-Proofpoint-ORIG-GUID: GHWiYARSC5EjuKeh5FCGaQKoZNLNsTrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280219
X-Rspamd-Queue-Id: F394548C93F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105089-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

With the default PSCI suspend value for cluster idle state Lenovo Yoga
C630 isn't stable enough. For example it might reset if display device
isn't probed early enough. Drop the bit 0x4000 from the PSCI suspend
value to make C630 work in stable way. The bit was found by
expertimenting with the cluster idle PSCI value. Most likely it results
in the less deep sleep and more energy beign spent in the suspend state,
but it's better than the non-stable system behaviour.

Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Correct the bit value to drop a single bit instead of changing
  multiple bits. Expanded the commit message to explain the change.
- Link to v1: https://patch.msgid.link/20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index e41200839dbe..8cdaef5360d1 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -347,6 +347,10 @@ &cdsp_pas {
 	status = "okay";
 };
 
+&cluster_sleep_0 {
+	arm,psci-suspend-param = <0x41008244>;
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,

---
base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
change-id: 20260428-c630-fix-idle-ed0a161d4050

Best regards,
--  
With best wishes
Dmitry


