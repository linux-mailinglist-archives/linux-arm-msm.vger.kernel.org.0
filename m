Return-Path: <linux-arm-msm+bounces-99682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDMzEOaPwmkXfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:21:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DE06E30947C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 91D7430718F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB313F1643;
	Tue, 24 Mar 2026 13:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRASGFuX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cC3RGQLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD7A3F9F59
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358054; cv=none; b=IIHK1AwpLg0n74l3MZqAJSQy2gZiGk6YqNVDawQDzr/wxCpnPEb2MgzRqUKz4E7VRBnhEUjbiPRR0JOAseLxDVt5LfuOthtXtda83FzS57/RklgxZ5QRjfsVwiwrS6ZKF9kMiTUXvtahGaf0ZiJRkQponUnxECHTq0IttCBnLkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358054; c=relaxed/simple;
	bh=J81J+LY4cXmCfiCa4VAaJsCHh1Rz+x6O0P/2zIEpnlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RzoHdwKjEpq57uqepf1i6ajTXaQc/YRY3ECTjqiI92FW/WlZRNdwOqw37emsLzVIgLHPxGhhxj9Tiy0wY7KOOiK49RX2SUGC2j5Vd+GJLZTOd4dSENqaMsdKB7gzr9cQ509DuAEJIAVJxCyN3rd2z+dDpzJ7/+6YPfPzXSz4z8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRASGFuX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cC3RGQLa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OBbfdU1293060
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6L8r7u3kRPBrzUycGNBvVmzelB/6ESNzHI9KDr8D5E=; b=DRASGFuXd3ppP4MS
	ewLmqstG4/Ue6l6HoHa7ByUDGOGOnbnhmHGbSQ6GqsG2lYyGVkgLGMxnYjGVtBAJ
	mB4bk3dORX/LSlKwPhdVXuVwkfXqvcx3sTbNiJD0zvF45PryJkrkY+vTs4iuv7bg
	ZRp7hueDGSTHBdydbR/V2X3NRqRDm+4ZCZUslEySteh+Wyf+Pbol4AX3/NS2bBtI
	iCn0h+ksJJu1hHF2DqSa2se1sWr+n4l7ocMUmgOPOUXBY8O7wi8cPdK6YDQJP9Wx
	uWQpmZN3QABCeGXbCiWjODg4XAFGsRvpacuLpbB50M8K27mdA2yuipCe7vtPZdUV
	pRBQhw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw40dh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:14:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c649dc145so368038b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774358051; x=1774962851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6L8r7u3kRPBrzUycGNBvVmzelB/6ESNzHI9KDr8D5E=;
        b=cC3RGQLaws0w63YHm/S9myKk1gEUToDWB+nZ0voUPCPJYYzPK2TNKm4C8NBaQWz6pE
         CV8atHlIWsMAdix3tRvopmy5r7rSVJatXtb0aHolsIVXlk/3O1pNyvuv+nc0b9livKH9
         m/sXQnWiJDCErmvBF8fZuyh4+An8T+4jtwkg2GL/MklhBInL8g5OzQcttnSR0VuiMV/t
         Mabl6du/tJCuXqf5x3wdrotygkFqfjNvIBnk70Lgg3saD50YG0SADU7XVB9Nbk7cnXAa
         8y34ZBQw0cSsJbQi3kOJWOWY2JXr5XasSlf9RtB0PlBLQQ86fEBxSmEChJZbMD3VSYrd
         PRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358051; x=1774962851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D6L8r7u3kRPBrzUycGNBvVmzelB/6ESNzHI9KDr8D5E=;
        b=MP6/O51BnUnjAgMP4p8aMfRSys/VUcjoj1wOLXO1zMWwlGwNLWmtPQGJXZ9BMQQ/ML
         TUQoOfUp/MWQFlfeE4CYXHdOaIM2FKbVSZsWt8LxK+/Ex9GKzui9HNlebbUX0rsfLQzS
         PUJ1DvS0XoUCXqufFw273wnt594hx97jqdgt5FMz3wW3f77Q6pbpqHrwt9x9weLVrk90
         bgQbJqFB7nPFnBzzNzSnyFebo9XzpTjDy/AB03OVHZ+xaAGbr1Yjjl/2NblRl+oLxah7
         QyfZR/JizWRzSDz3PSMPafhIayzvOU5bQu78cByZtQjV8dNJjr3G3JYMPj3m2C1NWT/f
         IUMA==
X-Gm-Message-State: AOJu0YyDLTLNHuieMPSYX0Nr8VhUn85fQKA6DcflULAlcVd3AHdHHESx
	rGQuSrD6Sh3tPbYg6KoESBgjUtivOYYQ0aUTciUGHyeL2+bTbUdsUiELrFrpGmgGyke/hitQy98
	fVn96arfDjd2p+dhUy6KDunhwFX8Swe7+B8uCou3x7IqVsx8o5jePvahPvdv6/7Is9tU9
X-Gm-Gg: ATEYQzwMH2ojY1IlBtGDHUwPpiMUHDQosSCF5ooYV5zAjMq2oPwKHCBKGxAQ/0ERbMO
	UhNmIo1Rz3uK+76qNeqEG7RBacBWRx7cQb95HqXRh/33thsrdaUtVE/no50/vz0YhL2Qx0/sLQm
	4LNn/1d8/8DwkMeDO/fJJZuIEdnxaycIDou7HOBhTtJ0XN0MNZ/B6VM7EDjgWpMHRBie/SrcSp1
	hyv0I/B4BjdmtAhvvB56LruhN9yNbMBflMqB83QP2hfhe1T/oqboM6sukL4pQU1hhJU+8i3QYtn
	Q5pOOGMHQbIpu7su04yjYtIU0nazmUAS+3qSIWAzu/W4eNyEao3rF++iD/Ulu4cD7b2hFGv5f0Z
	RVuDVW+z9ZHUZZlBJtuaHRqAfGHJH2ou8+VBWiwNlpVhALwA7QG7/MmNlQg==
X-Received: by 2002:a05:6a00:ac8f:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-82a8c35cfb1mr12912729b3a.30.1774358051056;
        Tue, 24 Mar 2026 06:14:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac8f:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-82a8c35cfb1mr12912697b3a.30.1774358050541;
        Tue, 24 Mar 2026 06:14:10 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be3396sm13517528b3a.27.2026.03.24.06.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:14:10 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 18:43:23 +0530
Subject: [PATCH v1 6/6] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-spi-nor-v1-6-3efe59c1c119@oss.qualcomm.com>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
In-Reply-To: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774358021; l=1241;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=J81J+LY4cXmCfiCa4VAaJsCHh1Rz+x6O0P/2zIEpnlo=;
 b=s2as4jZb/if2POrhGPP6bsTXfyAPk2SizEeol2/Y4TkuVyXAj4YDqafcBA2ytSSCtp3JipvP5
 zK0i/PhqDyfCwW7sYlONDOqJt4FvUgAWnHr7EmM4BSlYGzWxQINSqi8
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfX1LnWopKYvk1R
 uUJ8BpeCqZUEzin1FWLG/Xx5mjwyV61Yr313A1rv8JbMg2PjD92fGuYhNjWMIxVuQV0RQIyZB/y
 k9i4ZH0021ykwR7AdaLgUDgWy+wBKHRebHCJnj9h46ZuN0bC4nFPrnjmtsjFOPXcQl+MBYA++HS
 4cQQw5XRfTYZxkYBJpDi0U74jOTFfKctk1JN7qS2cJmNPAv4D9jFH1NDLdTXAp3/C2lgn8jFtoR
 LdjEQt1/87eSnsaxkH/XQq/MqqLji8mK3AOfCo0owFbbD2IAlMbfJEZ+xgpIh62U1Dk8GxufFYZ
 NBhRxocgpoccA7HQflS/+K3dGqEZ6Iu34PntjiOGmUzjet/QQfA66R33Y0wO9fAJf5k0ni7aMoG
 0JsPrKg0HsCLHaX6UX5I+UyNtXWeKjDH8WJ4CzfvaGYMtSSj7zdaAm4Bw7eAYzjMlsgj3RkJTBM
 /50DP+Nvx/x0B9y2vDQ==
X-Proofpoint-GUID: i8i6ZufQW9Aj6yHBBLkDbDHlFXCRjrrj
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c28e24 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=L5xbH5DL_T0GcX1SYtwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: i8i6ZufQW9Aj6yHBBLkDbDHlFXCRjrrj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99682-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[88dc000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE06E30947C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without this path, the interconnect framework cannot
correctly vote for the bandwidth required by QSPI DMA data transfers.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 45b9864e3304..7093b39e1509 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2864,9 +2864,10 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&config_noc SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QSPI_0 0>,
+					<&aggre1_noc MASTER_QSPI 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7180_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1


