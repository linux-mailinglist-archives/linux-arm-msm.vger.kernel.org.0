Return-Path: <linux-arm-msm+bounces-108669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Hy+GGWGDWpdygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:01:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E258B409
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01FD831069C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A743E3D170E;
	Wed, 20 May 2026 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvXE2y7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCXgKyWu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E9D3D349A
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270884; cv=none; b=jbu3v6M8c2rT9qwqCFrMR/LeXNyWROV2yy8WTzMcw/YcLin2CEScch1P+TFU/vOgPXw33cl+O0RVdGYTVg0BzCMNtt3yyHVeWh8XljpqHcF2/4OsPpztpVWJj4GUsHYk4nzj9mX54itmxUcKTz7xWZ/ir4AwgEt48DzPjQGTbAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270884; c=relaxed/simple;
	bh=Vj4+oo81rmJlqOMEGHmWK78WOY1h7oRumK4LiWBULcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q6DkeFChWBHlG3dcjaRjLNA5NT4X90H2/i86dk9aJ47gTPXdsNHXLIzi7Cmp/stUROAXHUy5jF5sStlf60xe0niYE8LyIlZjl65FGAcPcJ9JzFH6DLeeM+eJB6KeTgTx+dIMJRw1mwSC8A22tfjouvFrjn8lWk0YxG1/U9JkSZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvXE2y7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCXgKyWu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K76SAD1953952
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ka61IIK+ns+3eFQU2HkmKW
	/PVhZJfUX5hk+AG1Fu9I8=; b=lvXE2y7wNFmuXASdy8xKPX+g8s+ASfU2P5CN92
	GDjrvgIR+LB/oyj/7GOk7ihSkVh8WFtIrmdecBvQ3s3cdzW8kC4ankoQncYJw6sl
	q9WMy3ip8fVI4bO/JRiHdrvR5fTVQLuYPa8rtE9UolBj4k7B2Z7LrfgNNPTUWpB0
	pidxHdaOxcr2Br8ZLtMoen6oYXhzBtg8/Hvp2h37cvA4lyP/d/VF3htyEyXvSVbL
	VPPGq5GurXjdy/fuh6gocdMEL44nLLIpfSMq9s/T4e8KOh1CYoYwi/3zpamsg0Hu
	PLZqUj8xOtU6WLm9o5e3buCsYl2BTJifS0uStkJVKrVcR0xw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xv5s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:54:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fbc49bef6so94298341cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779270881; x=1779875681; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ka61IIK+ns+3eFQU2HkmKW/PVhZJfUX5hk+AG1Fu9I8=;
        b=cCXgKyWubsOAd+t5rTua0WJTG4Ep3X15kDkp8Sj5iUmzOZusHZZhER6eMsFggYvlRf
         x+QZmykWxJ/SfqGc9gOgcSWBykKBVrbAKSeZzmF4GMTNYUTuETNguORN0ik0wPMzAv4A
         dNK1oOp9+WU837elcJVT/HPso+XGGL/jh0cdPUroQQvSYiID1Yndcg9BODEG1lFdbCWb
         7SyrxKr4J3NIrXJrkQV2CN1msM5ebscPpW4CnTljSrQj3SKq9X7XJ2vp5hGe2yRLnCuJ
         9HojEQrQNQ0VmhjvFLJS4oXdWsqMCz7d/Wr4cmYlEOICGHbZQmY56ngpL9zSK0qP/Iax
         8Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779270881; x=1779875681;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ka61IIK+ns+3eFQU2HkmKW/PVhZJfUX5hk+AG1Fu9I8=;
        b=sGm99+FyPL3a8/d4E0juVVUNdBID0AYUoFzqGP2qhScacz4tVhw+oL9VVkmvGtl8xj
         vjIz3xfZ74RixolJ6gMrDNHoXiS/CA7xQYcM8LCkqGM5pCmoKiPKEEMfG3LdokiSFR7Y
         TCrZh31Y2YoprNNxVuI2DIdmB6hqNEw5oCqZDm3zPBiHcppHBTfR8lg0I6OCnjd+HLWP
         5jNWJKuoCVFG0NchMPCi/WgTRZjejh0eHBKThjB0fB3g+KNri44kJhQlBLI7o9Hx3HiH
         KjFp2XCksszhc0//AUx3GJ8jWtRkX2stVSbc6MprQo81l/dkBkfp0gbKDmSOrN131guL
         cqjw==
X-Gm-Message-State: AOJu0Yyo2jY/D4EIndznynQNPsRTtWPzazylhm9VGHNAYCHzWztJLoqH
	G5fvn8ZDR7R4GE5FtWL56xXcNxaLjND5rFbjikuQAYuVOrp9+Wgq35mRSN20aq4Ftg/vqYZTMjj
	6og1e1i34PpAt2B2cO61FWIl0DIWsuoJ5l0BCBVHYchtCGRpjrSJL8S7AH40NcQQHOVFS
X-Gm-Gg: Acq92OFfVUxyhjZuClrBYIGBGoM5fuq3TnAH8TvThOTR4nGU2d/skRRZH9mW/7kN1V4
	rpy2meK4bCPc2yhc+VqUgK3tuGhjcolpNsSLNPRPC6uZELrBI4HMgg9H7gqbS9mnq+445mLlKoR
	VfSTWPTyTPTXpi8sWYVb9HhEiocEHwT4fK/m26r7MuUbolJ+SWbMoSjoH7pb5sUFwCJ1rX8jYyM
	9fD1XEw3bXy2qzuhexCvh2I3c7dJHfmiSLZg2/m3LKm0qZvh63XVnlzt7CXcZcw3XoSFfL596Oq
	i7DcCgHs1a2a42a7OG9BDBMolu4/EIKWIGHYfBjtpnQeUZQ92eGkzfQZ5phoECQMk/aFJ7cfUg5
	dWYh9EWlBbj+SA03TppgOE00R39iGdnU9YKi91qPjVX1vn8qpl4frfUNgpxg4HUJpdMswbAHdDm
	2PWz9XfaMasIBRxb2Dy4jgtiTz2Yx4c0Zlx3o=
X-Received: by 2002:a05:622a:30e:b0:50e:5cc3:6f3a with SMTP id d75a77b69052e-5165a07df9amr339060221cf.26.1779270880852;
        Wed, 20 May 2026 02:54:40 -0700 (PDT)
X-Received: by 2002:a05:622a:30e:b0:50e:5cc3:6f3a with SMTP id d75a77b69052e-5165a07df9amr339059981cf.26.1779270880378;
        Wed, 20 May 2026 02:54:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39588750063sm27747751fa.24.2026.05.20.02.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:54:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:54:37 +0300
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: add rmtfs node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rb3g2-rmtfs-ipa-v1-1-8b3942ded279@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANyEDWoC/y2Nyw6CMBBFf4XM2sZSQCO/Yli0dYpjUh4zxZAQ/
 t0qLk9y7rkbCDKhQFtswPgmoXHIUJ4K8E879KjokRmMNhfdGK3YVb1RHFMQRZNVWJd4q0Kj66u
 DvJoYA62/4r07WBb3Qp++mb/BOC/5Kh0aOCuo/BgjpbYYcE3naCUhQ7fvH/kDbx2iAAAA
X-Change-ID: 20260520-rb3g2-rmtfs-ipa-e41e93f5047b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vj4+oo81rmJlqOMEGHmWK78WOY1h7oRumK4LiWBULcQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDYTeYRxXiFKatYpSg8wFiQMqrBiD2jQp465/3
 cS1NVzhwn2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag2E3gAKCRCLPIo+Aiko
 1X28B/9Ll0yM/1m7vl9i6TpeNuzy51v5aTc/vkTSqZ8hF1ZgeioVU4JojdNuvuY9xRmQ6DnVXjp
 XvzdJlJ4p/l221LwjfiGGzv637cUAJnnMxbPnrO/geWzXhGZCj9UWgXo8o+Jlm+PZvSdmdsgiZt
 JVsUlGtblUFHf84WUHoybrfMUTUrA9/Gyd2GhaGcgONa10UpW2ff5CSIaKtAnG87t6ZGsDEYmxc
 M4a8TGKTKpgy7HzEZax8CH4x6iYKeL28yIOP6CUBquvxi6THW5VYsxmHEA+4hIj0nZK8R+4hgbN
 dI/bbsPennWTEAq+JhZZJehehWdtcoc0xvZr6WoHVqzqQmlz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0d84e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Z-PxJsM1GSiCisScR-AA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: eUCKENGYTT0X73C0lA-r96dEkhvL6QIb
X-Proofpoint-ORIG-GUID: eUCKENGYTT0X73C0lA-r96dEkhvL6QIb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NCBTYWx0ZWRfX2CPerVy90eC9
 nojpGikgmfsDNV8kGY/EcsfGKzrDOB/6aHxDUbt8O4M9PThNNzHEcqv5Wo2M9gVItkEYzudfGAZ
 ONbcLUFQMbiDEwDtWAYkrS/tn4f/uEFs5r+mg8INzrCP0Hx33Y3bq+uq3zWTUeqQ5EOiK3LU3Ps
 0vNf/YlE7DUA7Op1iyJK44CGwXF9OoSRvJx+zjgjwcn7irDni8Tpdq5JmXFJYohbJ2A8YZ81oKA
 9LV7XKq/maNOzxCdeZcKSkagdDVmGLMcmeJDXSWPZvLSR/cesgL/mBeUat0Yyy4caBkFoTwETn9
 gZm3ffmhWX7dQuPI4DYp5HGpN/+opnhBFrW9C4BoHNzERxumeDFY/ZQJ5l+tETeWIuvYWRMPBbT
 A1whKdMWoq4nGN1lmBP1hxyQjpMAdN4pkelpZtuoEt7gfR3qFift/UbTxLJLEisAh0WjTZnyuZC
 5jEWg16ncFQo+xA+ZMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200094
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108669-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,f8500000:email];
	RSPAMD_URIBL_FAIL(0.00)[f8500000:query timed out];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C6E258B409
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Downstream kernels for RB3 Gen2 don't specify the RMTFS address, instead
the kernel is supposed to allocate rmtfs buffers dynamically. The
upstream kernel doesn't support dynamic allocation of RMTFS buffers, so
use the fixed allocation. The RMTFS node (and corresponding interface)
is required for the modem DSP to work (which otherwise would crash).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index ceb68a890bf4..37a3b51323ce 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -165,6 +165,15 @@ debug_vm_mem: debug-vm@d0600000 {
 			reg = <0x0 0xd0600000 0x0 0x100000>;
 			no-map;
 		};
+
+		rmtfs_mem: memory@f8500000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0xf8500000 0x0 0x600000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>, <QCOM_SCM_VMID_NAV>;
+		};
 	};
 
 	gpio-keys {

---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260520-rb3g2-rmtfs-ipa-e41e93f5047b

Best regards,
--  
With best wishes
Dmitry


