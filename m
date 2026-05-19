Return-Path: <linux-arm-msm+bounces-108453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDAvMOFHDGoMdAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:22:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8DA57D780
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01E90311721F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21293BCD2B;
	Tue, 19 May 2026 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKStaL56";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUp/ns7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B316369D6F
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187698; cv=none; b=N6iVqLOaI3CUX4vqQVWUhFRL3nI5otG6Yk7NQ3+Tgd87wB4eLbE1+cFXLjDFdFBnNV0rI3BnF/nkbz7nwRgNCcHLbbs0fsP7z3yhFkPNIjQ6dc1h67W+PAWvIhGCrcNm7DD9YmV3Cv6APs8Y2bEw98MOB/FU9AvSzG6i+RCiQOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187698; c=relaxed/simple;
	bh=CnlNaW03KiTGxBA6okSwBVqha/NCGg0XLOqtGZiiryQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXz5Ud2M6UzNw+/uOT8vwwHhm3tIoHVHz2/4yfz0D34gTwiYG2E1pJDrz2toER3prr37VOXl+LVcvvvfv7Fw9YF7egNr+N9cPeg0aSljHpFtIhuxvxLW1T888a3Ca7/XwABXB6/b7pfTNmonH3OSZEOmflha1MlA9LBO3l2128A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKStaL56; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUp/ns7d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8F3dp1146368
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TC8FAZVWJ0CMZhTEfR47NNtJ3GnYGqJbIGdm9BhCskI=; b=KKStaL565Dqenl82
	go+g8TJpeD+juwS4Po+Ql/AwMSjtMuXQbIoJdki+GaOrMMTqmeYfll5mx+mupWoM
	PvGj8HjwJx5aQ+ZsWbiL+nzIAFYqHka0fiskMKTr9klpeKs56Wad8KD0wK5qaq7n
	SECK9YhRUWbnzeTV/DovMSci4AaqIWNrRlWJgx7VQJRuDRujJHhIUiCQHxjF1eyK
	03HivID8wnHWTF+OS+UU6Bo+S5kseL5Hz8orGzGEH9dABkVWvDC6qi7nmGSDdYDe
	xFDnh4K+CYqZtkt7TSBUyXn8hkIpy3AlRntcKLttfw/8u4Z8nuNviYabQEHGZSSs
	+f2Ucg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7ej370-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ff0bef198so99788301cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187695; x=1779792495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TC8FAZVWJ0CMZhTEfR47NNtJ3GnYGqJbIGdm9BhCskI=;
        b=DUp/ns7dKpJYrXcPuZc12xfQ4bI9CnAlFmn9p+V3YQjsYiUcbUo5Ss0GfbVZkVnmCV
         bQhtAqhE0EwoDRnBTVEorGtUiMXkMrF7WV1l6m4DPs1+lUm276kZrKrTR9jhkMpol7jX
         DFzfSfZ3quE9mKRbMpx1X5vUaXah3UHk/S9u5V3PKPdAbSAtaRbVu+CFViv1Sf6SfjGn
         hvbfgOXkD8R0oyTT7nTLhEWpeDdIUFMayqNrB1/V6I92BDBB54vsKyV6uJEdaBH+msMW
         omETpjgc9ej6aPg2q4/1bsvkgRDRVnZIlB3wHpO+kj9OBnlwsECJkJWtlWtZSe/As3xm
         +8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187695; x=1779792495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TC8FAZVWJ0CMZhTEfR47NNtJ3GnYGqJbIGdm9BhCskI=;
        b=Yqc3pGDZ5Rat5moDRqlbjHcxqQKxS87GwQKE81HMeXZM5OEqnIMwTktj8Y0D425kkp
         PPJiXszNEXIn2cI5XdU5iXsaKdVznyvlFVaa3L33Tg/v7WlyN/ckSC3CjbbhIVoEX8/0
         QhQrek9yJTqrffk2pvQxWC0Ou0e7et2cVguEBS6QMDh2S6gRW5twW8TMOdcfO5PiQinN
         vWxyChX+m1FyemiX0TSEULQGP5R+zVXledDTrGjnyWT/t1FyVD5fASIJRF3laFfZC8rT
         OQkSzZTxtKZekIoxmQcuGRyzppyviKCIq0w1uttNb8gFFiAS2j8lPmOUXY5mpmWfQ3nY
         9SLg==
X-Gm-Message-State: AOJu0Yw1vsgkrCoNUgbbZHXQ+cVjZVcB5KyREWh/JBpv63ItFjnnxTG/
	Lxm6vacJjbneRnY+bdmlwvU0HqUAXQUPx2jyxO0AcIJuPQQ2ZR+HZ3JQG8c+sUI/5ni8gU/u3Av
	am5OfyOK21T37JwJK0KQdJXq+0CQUOrjRVlhbM+IeBNO3f3emXagaYtvRMZ45cnuDEulv
X-Gm-Gg: Acq92OHuu7BcXZThqjgMWlc2NdboMyAy98cllpnmeKxzfAT/4dIg9BpzdYZ66aNRdDO
	iB1CLfIzt20PCwmq54377PlHJJ5BxzBe5oIkJXq6FphnW1lFShK7uEFNTkxN5hUSVCGa95Gejlv
	IeG/75nSRZnVzRGDSB6z8nJb4SO9RFJGhUSGAyYF4wSrr0e1Y74rMm4JCWsTCJU5gxEd/KjTvmd
	N0MZivQuBAm20+bcfGpvH0iGGia1GnTTZWPSdFkIqAeMY5nQkfqpSVfAG4t4Pldc/cDuXZiwtTi
	JWCT22fJWm17lgTIsg6ABIyfi9+tgotjD5rWmmlAM17SK5ALZJVcSTjg2yThdwzs1WN1OBqpxr7
	H3HXrijdl4EqbeIPEcZamDWyl+nJv5bJdSKMt5I/yCehbEclzgAkKfbHvqJGtJnAI9H9jtR43Zf
	tz4jGkw7PcqWXT/tCORGn0VocZ6c/Lh7Cg404=
X-Received: by 2002:a05:622a:182a:b0:50e:89e9:271c with SMTP id d75a77b69052e-5165a046389mr264847841cf.17.1779187695267;
        Tue, 19 May 2026 03:48:15 -0700 (PDT)
X-Received: by 2002:a05:622a:182a:b0:50e:89e9:271c with SMTP id d75a77b69052e-5165a046389mr264847391cf.17.1779187694695;
        Tue, 19 May 2026 03:48:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:06 +0300
Subject: [PATCH 4/6] arm64: dts: qcom: pm7250b: move vdd-vbus-supply to
 connector nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-4-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CnlNaW03KiTGxBA6okSwBVqha/NCGg0XLOqtGZiiryQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mi3KUau+FliRKwMuvZcpIaPz5LqeOR14bW
 5R6b4cnuKqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1UyeB/4pQXeLHUvkH4LmPgHo4ym6ZOknqm+33Xz4394I3N/Kqz/eqyaV0KULKE+GnYXSy53nSD2
 uFJ0iHU23n6Vyt9ESxiuLRNi+yktffKBTIjRtB5UxwZcttEFz2jvInJTcIpvjtpUY41lFbyB2f0
 bYyi81MpEbjK1EnAaDxnwIB9Ll4scEQ60WmmiVR/53siJ/WYVht2RAt5tEa4IyCM+C/kmc2lr9u
 ka8WzFUfdoCGQtiaA/uQOgpigPJhuVfwuzAJEcI6E4AecN+R2vFYTWMQyKnfTN+yo+hK5oYWtz2
 lnaFfhfmkSfrlH+S2yluWBA5mSePWeXOIEMOri6wviUW0lBb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c3ff0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=xYHdAnABRN2P05AV10cA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: cgXHoo9DIed5sPXKSnWO-VvHox0X-bOI
X-Proofpoint-GUID: cgXHoo9DIed5sPXKSnWO-VvHox0X-bOI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX97MCSrHNh8A/
 c+HqR5pNLqkz1HzrMs7ldcs1NMwNSKzu+Kjmu6bT8LvO/me2Bn/7fneXqm//AA9YR8orG1lKeMI
 3gNl3dSjcXnK+vlgIAsl1pRrL7A0SvnAGFe309TElURM55/s67zlsoieLpdkCc+nBLugoTP+B8J
 O9QJyoT1L3GFADbF7S5f9QFv76KWQHXY8Q2NB1EUBRkllCFwrPHEmE8bWAllNC4NoQiwaLP7aIW
 uR/EjZi1AGkt9JypZxgKRbjkjwQyzE2/pFbAecG/71dHMpud4tod+GzUkTLIb+lnK2nT8kaURht
 vIPdgsuVWmlTIXMBhXyAJq+d41DAxJXmgX3FiHWPZoThSzBCDvMchgsC4LOq19ZrpsgH4TrK9tw
 HOOoAm4MD58ojFV8xAWV+ituiOrxX3wISWaYDBu0aM4Zfi1l9gQTPtGthzTSvjgz5eTIWbCMeMI
 xf6w8Y9/FndpXA5aZlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106
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
	TAGGED_FROM(0.00)[bounces-108453-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,0.0.5.220:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D8DA57D780
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of specifying the VBUS supply as powering on the Type-C block in
the PMIC, follow the standard schema and use vbus-supply property of the
usb-c connector itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi             | 1 -
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 0761e6b5fd8d..43cab07126c5 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -86,7 +86,6 @@ pm7250b_typec: typec@1500 {
 					  "msg-tx-discarded",
 					  "msg-rx-discarded",
 					  "fr-swap";
-			vdd-vbus-supply = <&pm7250b_vbus>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 3964aae47fd4..23f950067a08 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -953,6 +953,8 @@ connector {
 		typec-power-opmode = "default";
 		pd-disable;
 
+		vbus-supply = <&pm7250b_vbus>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;

-- 
2.47.3


