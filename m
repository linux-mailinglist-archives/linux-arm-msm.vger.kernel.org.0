Return-Path: <linux-arm-msm+bounces-94600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCksDfnoomlG8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:09:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B25221C322D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC1AA3059AE5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7115943E9C1;
	Sat, 28 Feb 2026 13:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3b5x5OY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iq6b+BfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCBD43C05D
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772284111; cv=none; b=FFLctKC+FyM75lYy0VxHOm4vOYo3lnlhjlZ5i488cMgGz6lg4fq1A2ghiB2DvGDpSpDjSuBwygaZ4lYmgxNguNWcV8P7pdR3n6D7SN2qieUVAuh0rkf0MVyCx93XZV3RdVEfaaKknUIoMHpXkvipSJJLsDP46xTljXbx6LZJ7FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772284111; c=relaxed/simple;
	bh=lQp1ObTSUl1IdKxZhheKwOCwEnEZPRpUPXwQVLuGhvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MigC9p7vnf0dseiNzsHBpiMfwAAefO8K4gOl1gsLzdJb33MYKIY3L6c8AaSnCqunrUo/9BJkjqWFj2INHQAxApLSfO2j8f0SsT0RwHnZwZQ2n98uifx612yLSMawUhNu/yw9Ng1hqmodrkjgzzyJyWxgCwU8r/Z/w1CmFauXwlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3b5x5OY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iq6b+BfO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SBu2Lu2351811
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8jm3GK7Gw/eQldHczWwGOOc2v4f3ZcVQ1chEjGMAlPY=; b=T3b5x5OYlgrI9Jpj
	nxgc0miz8rau1mrKcUW9WFiDq3KqbWpta8TzaezF2sq+rOiI60ExhkmL7cElwCpO
	XRJ0jUo2d0Fs4bEgUK+FsVmn/fsRryEr5hOpsuEbSNb7Snh3sYUSGMZpXOHSarl7
	iwZJdz7k5j29wMTLBFe6ojqYB1GmwreD0Y23FzmU4MaHu+WeMtsMfdryt13ssPK4
	qfPtUDGyWtdqnUc61XYQmVg50yqZtCyRoVIy0VdKWr0PckAcckIEKFlax8VPogU5
	G8YPQeUV1//hwMt9UGCaREf+L24SmFRaeLgJJofqY5QiuOosX+SIiIpXx7cgmDvw
	qmbBGA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg70uhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:08:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adfb6df9d6so202245085ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 05:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772284108; x=1772888908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jm3GK7Gw/eQldHczWwGOOc2v4f3ZcVQ1chEjGMAlPY=;
        b=Iq6b+BfOpdRLmOAqvOpCm0R+kvFlg8+LfvozDRWvgp4Y6ricQJEliD5sljWUhRFQQz
         4kTPz5Ywcx3EwIsrSz9RNu+5PQkzbrVuLCDQZYEnGqCcI51v3a2I4fgF6kKyK6jeXeKq
         f0Qj5qwSWAeSjtYEhuXlTL4dVt5QLuFm71jhzbJumgE7gDwaY7/12vk002BLzb84meN0
         xVgfMPvGyWIDMkVvzcEpcaxns8O1EWKnWYlJDY6eDk8AZABJRPV0/xMBBkpWRJBCErB0
         vTgu/0Y2UfpoZphVuoI9BhUfm7ou3byJGKs0E9Ge744+LYI2a/M6Zde1C8ueeoaDwtxz
         CUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772284108; x=1772888908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8jm3GK7Gw/eQldHczWwGOOc2v4f3ZcVQ1chEjGMAlPY=;
        b=EHGa23CUMDEwdd3uUWuS8VvvmvPaVQxwBBTGaLBGw/cu4X0CxzEDf96CvmnIjunbZM
         nO+lTI6ZHEUFOC0AuT0WSnt9NWTjpJXkCEPsFqg79DGiV5kVpoq0anU50zw65bD4Cfi/
         IlJ8ZjBcHhXP9wOTB1dYSZoDmpwkjFYeNvn6qryL6IqInm9sGhPYcjFyGxb19BxlIX2u
         DVU8SGIjYANbPCfJZNevOEghgec9i4tMHrXBj4zZnxjHysrRp4vcYpdpRBW1yoSKz189
         ZYXGfXWwhwOsiWCFyXqMdXDXOafFLK6vfAZxrTsiMAeLMIZYllCYwerzD+oeZ64UoQGp
         DWJg==
X-Forwarded-Encrypted: i=1; AJvYcCXIdtLxMqdEyJ1KXcaCy1Se+nH087TO6yxUNPByepEPS211UzUSEmlgG+jDdl53azHWhnFdPFxEVb3B5Ext@vger.kernel.org
X-Gm-Message-State: AOJu0YyyZ9df1MH3cxoR9OFtAIs5TkMXnx81s0JsrPOiaQfzI3gQHUZG
	991gIYNF5KrFyCOJiFjdinrQsaDi85m2iBs9We3keyq+iZhp5IcmAwcOcb39sWEXOFlWPhjsK21
	GBt0btaZt7UFsBwZcSBn4qfedhpO4r3OeHHOWpiwn/7rI3N+yks8pRLwF+HjYYFrED1k5ceHU0p
	53
X-Gm-Gg: ATEYQzwvq9qTM+DZR/D3z82tEY9CbOwXDIen3RAvSyTZGIGzg8SobmgNRndjUth7yoc
	So6jERy8mPcilQHWa+JceOnLawat4DmvG9hlEy48Acwv69L7yFvWYak1i4Ui/Tg0tIQMlOMYQuq
	vowqdnY0Q3LRiP0N3+9gNn+1an2fPEWePY8hOV7EL4vLOdCGAdLOuT3CdbAedP7he9V7sGMDaJ0
	YgI4keUI1QNDiCMXlSd1EY2J2AGgE3HrFckK5xNS3/coOKIhnfOvq768VNRG9p8Hv+y4SATd9Ez
	X5Vmuc2QezDmytEdOQtgoguzEzuSq7MoJjJnuzjl8/+k8mY/ChYjYPzUrwWDqcfeBgfCJCNNOu2
	ZTT+ZtuBiy3ogYHZ5xIEkHOJ13L+S7okJtY6SxQMfG/6y15i3J12sJwOdcyRlCiSUpOWOQNADr7
	pRZhRp5iie/RG4s6Xz7ngNkh5SIC/N6XyqzX0EGoFhe2qu+9UP4OPzS+aB
X-Received: by 2002:a17:902:e885:b0:2ae:4150:3118 with SMTP id d9443c01a7336-2ae4150338emr11939575ad.12.1772284107984;
        Sat, 28 Feb 2026 05:08:27 -0800 (PST)
X-Received: by 2002:a17:902:e885:b0:2ae:4150:3118 with SMTP id d9443c01a7336-2ae4150338emr11939265ad.12.1772284107501;
        Sat, 28 Feb 2026 05:08:27 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm83947035ad.50.2026.02.28.05.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 05:08:27 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 18:38:05 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: ipq5332: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-imem-v3-6-20fbcc1a9404@oss.qualcomm.com>
References: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
In-Reply-To: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772284083; l=1187;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=lQp1ObTSUl1IdKxZhheKwOCwEnEZPRpUPXwQVLuGhvo=;
 b=1JES2V8t5HxhQPDHnQCCBDHqkJ9nffzLzOj1dHGXJ7tNJvqnOdZ1L6dO2WjghZalUyfEg/ZaO
 vMXpTvn72/SA/19b87pd8YiwP0D1EyDSZ27CAtcTayMUb80JJfFa+Sm
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: bJmR7RNi2zgooBeOJsVL8kLfF-7T6-Y7
X-Proofpoint-GUID: bJmR7RNi2zgooBeOJsVL8kLfF-7T6-Y7
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a2e8cd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=g_gtcTFTaut2jdyMrvoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyMSBTYWx0ZWRfX+kK9ZGUzyqvF
 ijHpTGV9PFEh2fCE/WfI0fR7O4nUQ9Z7KJNoMleRhl4Su5ngt0DuGJIK53nCSEkY8X/PZGeV1V3
 PcLb2Lm8fchQ/RDoEdQLX7qeMMicnZiLLWeUc+0mvO+hYW9e7rdl3wbGWxVzaRQLOiOlSvZq9x6
 DrVlveh7ocr/8RA/MB1cKFe/+p9SIseUAXLWe74x8yxxWLV4Ztt14wBzVaEeJpA3STsMl1X/Olt
 EbpPrNiSF+ipGxTOYxIMFvvctocG12PFsuVPni2QCEmOmN+zdN+bSyJ60AwpLX3fLZnMhgHYh1r
 4B+GsoBVpdHYM0AQQE188lmbmhHtHU528NIyHLACWYJ9v4yHP+JRtUFBQsVRY718cZ22ZS2XgOW
 sXnqhTCa9VkDAlJMuyS0cInn6wq3Jp+LmHpQ/R21837GILMzfZmGXRKPGCKI1XRJa+35sebte11
 YDF258UxXsjHVCmSJug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94600-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,8af8800:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,78b7000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.131.57.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B25221C322D
X-Rspamd-Action: no action

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 80KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 45fc512a3bab221c0d99f819294abf63369987da..b5f87db419fe7c1cecd05b5a85745cc3971028e4 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -423,6 +423,17 @@ blsp1_spi2: spi@78b7000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "mmio-sram";
+			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1


