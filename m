Return-Path: <linux-arm-msm+bounces-108038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJbyFivXCWossQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:56:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 014AC561C6D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66222301BC04
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 14:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7753A4538;
	Sun, 17 May 2026 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MeQ0PMjW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NApBtMWh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECD139023B
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029783; cv=none; b=VlVTLIpAK0qp3obaHR/3tl2IcVBKb1+mFhzaBwwJj1f1DvBsjxPJEtS0eYBOYMRks1zu1zGiwxXtOVlGYHPDghA/GYdt1gu+Vdjp8ojQJvkKULf5LZTjlKteK6jCac4sgTl83viwBXqEprrqYH6HsFG2FX1dNzyMz/0jBBAsGgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029783; c=relaxed/simple;
	bh=1gMhEMpU1ZzUZiCqxL+XRjLDw7RJHcJPeYe+z0q0hoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rw/wil5xvSE91POxOYYmr1kiRzg0dFLSC+6jBpJYPqkWizFaHF7SMOfc2rUx8OayfX9NHbaIBfdPYESfgz6lSxcHQYcbTtN0qRQk0Cz1BO37gP/fHH44h1W1oOsnIGK51sYcQE0HnmRCFulLpHlI/8QewhCbjECekqH3lKP+Eq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeQ0PMjW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NApBtMWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H7koeg2862982
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+Qdf8Px6J1AO8okt9+jSlwhHC8Utlm+FWTg2cSh1JU=; b=MeQ0PMjWCjHDsAAd
	5oy+Gxq+S9bN2n8Cv0d0WTUyfgyHA2GfmiPtuyVgYCZEn4P4UwAVCJryP5rRlZ2q
	MeUKEFSsPtLZq5Vtgpob9gkUqun8GUIDuThLfVFGXl1ElRKJwOxM5fvT8LS6/aOS
	UrxeOUfbZR6vSogYeXkiq6i71WmWjjdzCTzFaeepv2pdqtsj2gw5lq0RtGmg2QFb
	oYcvD7Ax7xxtidJB4H+CfoRzQ+liPqmQzFsNTXcrRoW68qiZquHUqfh2jts4sx0e
	GKA3/YsGvyq3aSh0HMpJNhgKDDWmH0IRW8HnZi8utd8HB+R1rYPu8F13PIWgB0Db
	p78oyw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7txq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so46869721cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 07:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029779; x=1779634579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+Qdf8Px6J1AO8okt9+jSlwhHC8Utlm+FWTg2cSh1JU=;
        b=NApBtMWhYLJCKBJjszskvNQUBpaAMEXnM/lWrgLw4YfBu/EQu4pRFVldAfFyQGiV2R
         63FTKrzl7JvPPYx/kkinwPspNkdNljVjzM3N+LfOO98F7k17PbF/+tN0WRgpAJAHuIz/
         z9ccrPidwNluNHnyZ25zS3W6NAuNRACA+tY2SXTrNzRNMV7rBP153/KTazdi4dzmSdld
         /025UtDOOSROd4cJ8ka1CQG9CIyOWKVFVszAGa2gBt7tnfl42IoVGte6FjjJ5R8djvLN
         LhG94SDtJiIkP2qLUve8P/6RMCmr/hLOjagIu4ds1SefzjNDk874QwfbVWlX1sZ+dBkE
         n1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029779; x=1779634579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c+Qdf8Px6J1AO8okt9+jSlwhHC8Utlm+FWTg2cSh1JU=;
        b=gGpotn95I4KBqS088XdFs4BA3ldJvTP8GV4OMV7Oa0UEvZ91yYetsEneHYV572fR8Y
         X5wV+Si0QGc5JkeTNs13HrVIBa68ZXbbAp+OguUlyS/XB8p6TkJVCPu8rk/cu9v7cIOw
         BjolefoC2xAyJWt/z2sE6fmHzxawbofkuh5dqrF8LcFtqCMxg5+iPqfgPwedivvwIIZ0
         702GLJKGPrl6D5IqV+AMsBjTwRLXg1XnaPGeOYS6CaMcXLnUoQw8moSn/4Av2w6HEQD3
         MHPIatnP/vW8ecfTIJMNE0E2d1JW091oA2DJRtTzsdgi2QMFtbtaV9J71V1um//ZQN+k
         OTMg==
X-Gm-Message-State: AOJu0Yw10camI6SBfEvRgEsRfvcWWpQoT4olH42eze8soTmBWFoQcR3n
	v4p+CNghheANdPd0L24/HkerzVIj7cc5ZNQW45JhddDhI1j2nkiNVEVYPYSHii1jkgb58QEky6R
	KqvLb9qfw8sWM/HoB9ehmy3TdWoRGFI/hL9i/PksaW0wbeAfb8Y0fRUISD3W3pQZVw2V+
X-Gm-Gg: Acq92OHpC4Y89KpWFetzymC7q5DrKrNftGLnHtOyxl1e3H8IHM6+9MBVYiBfy7K7W+D
	jZ/rSQeBk5Y3s6F4LPaK/R3aSbtNHHSLqOs0mch06+rMY+tURqgYGDJGAOn31/CbuktVw7ncECo
	nUvEVkqDXmLW3jfD9L2kBq1fAG5vJgbixX6yA/Z2l4CVmhg4AC5CiYgxoWd8K7SLjVGz0ZtAh0a
	HdAw7kyPnHB9pM/qdlzbb/RKsHt/O3WtfgtALwGsJFj+JrCzFdspZ3B3Thr7mOML/VPbchzNS+R
	vuOColn/Xfm0kSf5kEm9PgQwdjRMN3Ero4SOCGKskyOD9+qigw1Aohv2G0U/tiKtYttiP8h+nt9
	m4EFtitbIJWYsGztGi8uA496hNs8kKf+xu4wPXnXC4vG8DcXHxTDA8FTBDxQxcVRtatSc5LdbBV
	hehym1iEWHWxi45pmgfwfQuWlEum/zQInscOk=
X-Received: by 2002:a05:622a:4886:b0:50d:a987:89b2 with SMTP id d75a77b69052e-5165a0df3f9mr162160471cf.31.1779029779292;
        Sun, 17 May 2026 07:56:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4886:b0:50d:a987:89b2 with SMTP id d75a77b69052e-5165a0df3f9mr162160211cf.31.1779029778875;
        Sun, 17 May 2026 07:56:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:56:08 +0300
Subject: [PATCH 2/7] arm64: dts: qcom: sm6350: consolidate IPA properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ipa-loader-v1-2-3c3764c1b4a3@oss.qualcomm.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1gMhEMpU1ZzUZiCqxL+XRjLDw7RJHcJPeYe+z0q0hoQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCdcN6F5eGbMPnIKD+PuR/CWSPz1HG+5QrgjKF
 tDCY+hJZ4GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagnXDQAKCRCLPIo+Aiko
 1YvHB/9KuXhtwivjypd6J6c/yKcNLT0Jsmma6nbR2cXtwPj+Z4WtK4wN2LncFM/l7rIeNJ6KMhC
 U0NdK2Nt3dbIRg+cy2ySunFpcBvmHzaOWQ+bWt9Nd8vaDRDHaoAbN3FPIz9SuFvffyIiphNW/u+
 8F0bB/EZKsDepYslfIh+BinvtVZnpvGZrBb4mimWS2WHZVeYrw2eac9dvPTzicrsln3bJKTDfTZ
 8Dd2sPe5B6vG2/o3p2QTQknIEK/OKjps8VKKxtlaIsS3FSMnNDUqWaKP4CuEVKMVYtlac2t0DML
 j9T8mVfxvTRQkcy2ji/Q9yMHIWAeLTxtOzGEQ0fBUSHT6dam
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MCBTYWx0ZWRfX7KuyTP6oupzR
 Eqh9DehgP+X9KNeOTAB8cnNCECFhK/kjjMgdOQGWhLjjrrowHJougR7txoGPbtW9eRwVLmziZdk
 4a3GJhJTaOyz7ix7cb46jT1m1het2yaPnSEhYla4Lp/2EujazFcU1qbjmkdSCqhbrI9PLK0OMbF
 VuBhmOqqdugnRztFQCl5Sl+MYHkP4HOGr2a3BwBtai8a+cIZMrpacoySqSnmRWjhOoTZCRltncF
 Xjiq0yoSmxtIS7JwKASlXsl/3ik+S+TRZOkjpQybb5AgPLmkDuxF3CKKdy5xwmtgBNwvl76wcyW
 /IHqW9jBhEbxL+0Im+ZqsgL0Gg6sFVnlI9fUpBJghIarJKLQjsQ0P+ddglq6KgXQajlkN/IV/NJ
 D5DbW9ATrJ0SLRi5bPsi4iY5gcXB83ngxiMom91/Nuzn8DHxZODPHoIw3BojNsPczDFgd+MbfdX
 w+Se6dj8gqb6BxEHCQg==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a09d714 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7cce5ovKcg5WMCfKyUgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: N41sfHXYYF8zxe6tkdYi16wDASxA6S2e
X-Proofpoint-GUID: N41sfHXYYF8zxe6tkdYi16wDASxA6S2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170160
X-Rspamd-Queue-Id: 014AC561C6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1e40000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108038-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Move generic IPA-related properties to the base DTSI file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi              | 3 +++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 3 +--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index d6adf68563cb..5d2c1d4977b4 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1307,6 +1307,9 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&pil_ipa_fw_mem>;
+
 			sram = <&ipa_modem_tables>;
 
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 3964aae47fd4..086840f04fd1 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -711,9 +711,8 @@ vreg_l7p: ldo7 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&pil_ipa_fw_mem>;
 	firmware-name = "qcom/sm7225/fairphone4/ipa_fws.mbn";
+
 	status = "okay";
 };
 

-- 
2.47.3


