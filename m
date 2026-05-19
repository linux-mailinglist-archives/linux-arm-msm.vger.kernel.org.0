Return-Path: <linux-arm-msm+bounces-108377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OENXCsoODGqJVAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:18:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A97578D9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C6A4302F40C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17483D0924;
	Tue, 19 May 2026 07:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/mxW7BA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LEeM6pao"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7364E3CE099
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175084; cv=none; b=Rbfm/PiAv0YRCfNC/je8iyEP6Aj6IRDTZex8lCFktWLnXIR7yQuMJNt2ghdV3HgcxQuzojV+yiqQRmJDrZQje59bg1z7W3J0gHOVHYWi4qxqge03mABcAoIcGxcxmINUQ+FqlSq5AZPQ6H44EqY1W3gL2KQuohXv3RjPAM1ZCGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175084; c=relaxed/simple;
	bh=2+ohiWM6QpxsbHKc/0pOQCjMFZPee5qvnd02m3CV1u8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fP+Jj3t43tglM4XwwdtiIfZ4q1IxGPqhUyIpYAyw1PfasdlE/g9paMAU7sfjJ3O+QdeOeSEkYEB41mQqdc3/dw3O48546EjN51gSGC6bvs+N11X+3G8qGA/B+zNt1YqqhpmGoAg7C9rpW+mbdAAjfh4KdriUlkGYWf91e8iXSAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/mxW7BA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LEeM6pao; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4etqo1251904
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6aEEcPBvwTFw6YiB7MM+gIRmIZsHr5lGxet9W+OxrqU=; b=N/mxW7BA2/MI8hFt
	C2BrtE0s0qCSy/+i6o3ax6s6WUEufTxpFD/AeDi4OMCfslYNiQ9UMH0/hoMJE7YG
	pwruHJAb1otRgtUytvRgeta413piv5zhmrFCfbWFBvdFNB4HSA+Ic0dg3OVAOpZI
	AdyzC/zxAldWRNXDkg+OIrl3HFeANt/K74qcxZHTUAuA9XwIHBTpQmfqHJWohsRg
	3valXFeVWXoSkcCS92Yx/TZ8BHLlTy7v7Dk4JQaT428iG3QjYZgM7a0N5m2I65Vx
	XK/R2eqULBbzhzlOGTwE2hFhhx6bOLe8Ie9Li6ntdspriN3pCbuP5LJ3HAejyWly
	J2jb/g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0kxcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:18:02 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-132d631edaaso19885672c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175082; x=1779779882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aEEcPBvwTFw6YiB7MM+gIRmIZsHr5lGxet9W+OxrqU=;
        b=LEeM6paoYbgU0HRrOK5Vm9md1/QPjunQzuMEyBfDTipoIvgkjBDhSnxsz0346NPzXF
         5Hvko+SKk8YhrEc3jndqor4rV6W4XyfFGTUDOnFk9W2RxFNidbRSqO/5eQSjhDeac6Hu
         CTytR2SwiM4FKXvUqlS3XlTl0EcLgUDEFfguQw/dYpN+FnsxgUep/cWIzK0DjfsyEVq4
         P/u4igVjb6kwD1bYTx/f5wC9D42f8d/fe8G0WZKNQoKEHoe+eTENfoIw72EXp27XJJMv
         uSVVTh7fnZuBK7gX0BiD18Zb1N1F5b5n+DAC7thRIZQ7HBk576MmrtTUssoHxYqLyn6x
         +y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175082; x=1779779882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6aEEcPBvwTFw6YiB7MM+gIRmIZsHr5lGxet9W+OxrqU=;
        b=rULY9kLvJrlfgAVXckvCsHoi3BQdbyZDYIGFDV0EIaezAkiV9eP/QQeyoOolBSS7cd
         VGrigy1Ci2GKGAr3n6gGuONqVh49x7+11cQi9rSRm0TmRU2otzV7yE1Z4S0+BVndhoJ9
         W3YLTgyEaMcYoA+moODQoEXniYFe2zSn5tKBi+yf0mSli4/zi9JS+c/SvYH0zLU8R+8A
         cczANKQMgQjP/IT+D60uOMBPqoqC8Ruo8imAfB4QmxxKRAxEQ1SCqRYyR21Azt8XPIOC
         l+p7wP9AmxDjq/pnDXvuXLRrk7yGaDn//wzei/hArHiAXhS5YsrJaabEIuIIsQ9Sx6ra
         3rSw==
X-Gm-Message-State: AOJu0YwiUxNqTB/iwLsDK1AAnEhuwgPxwITTEt7QOn5KM9e+u9wpSq0F
	NShLa78BJM5dGNXrg0I/pN9HMyvNZ8+cgzOunjyb+O+wjMJorfH6SDAICNCSSiEiamuK9e7IWpx
	QqEu3y0rIYt6IZZ8PeTHlGEtp1FKvTBg5X+sKWr+VR/Iwi4dK4dE3Fzf7novQKtn7NVdh
X-Gm-Gg: Acq92OEuERpvzo/oIvdSvCexxB06Gk/c9SZaouXKIr1qZUY/Qy+MrRD2JG5RmKNMds1
	ZXdAyctvH/6xSkjVB3iNeT1ir/7q+GE0ifsK6iAgqLywhZ3jktGi08FtRA23pblgBkrAnTMxMVR
	tS5lqnaGGQI/NNceCj5hJjoKPfkeo8C1ya936takTu5Qls3cpKLM12c92HIb5uJFb8C8ADEhpdG
	UlHVdMz7FNdakQC9+5uS2nqv/En27pFCwXi5lPUE+rz7Ts4Z4m87Inp+vQvUfg/vJLZe28RM5gT
	tqJW07v07vt3rH+k4JgnEXUN8GRg3mmwhayTSCJ36H8O8bv2s3BhFFEumCmwC914owRzLD+FOHF
	q4C6rTMXRI5b0xMg8ohQGHjDFkceZ0Xc0QmaaTvmA2c+sfBb/OpHyvsCXuvetVVXEJ1EwAUViOI
	f9
X-Received: by 2002:a05:7022:6b9b:b0:130:9b78:b17b with SMTP id a92af1059eb24-13504a4fd4amr7714777c88.38.1779175082272;
        Tue, 19 May 2026 00:18:02 -0700 (PDT)
X-Received: by 2002:a05:7022:6b9b:b0:130:9b78:b17b with SMTP id a92af1059eb24-13504a4fd4amr7714741c88.38.1779175081597;
        Tue, 19 May 2026 00:18:01 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23323747c88.7.2026.05.19.00.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:18:01 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:17:58 -0700
Subject: [PATCH 3/3] arm64: dts: qcom: sm8750: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-pakala-camera-v1-3-b6d897864916@oss.qualcomm.com>
References: <20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com>
In-Reply-To: <20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MCBTYWx0ZWRfX7IWrB1dkwSoN
 drG3A8QynNv+aKVt4vLUsSrmEtTrNJ1UiUhf9lPKXAWnYOvFJaEcyDgGMr4YlALr33dsTynEA5b
 R8ujrkf2kNYlSjNST60bNJBbquRjUsN1qfkH/4XHqgIqwed2967DZpBIglgeePKkk9OWApcazrm
 5hUNW8HZfuAI3CYRDAveyPaZhOxLDAHBRrKR+Z4I4Onnw7bydkNtnx/KpcNp+/ZnaaJiIHO8nzI
 yXzyp0uTMNQ4L7ZIpq6jLw12Pn9he3Z1HXsp/Poub1JJAjrPDdxJqNas21p31aFX8CThdWJjm4r
 mAPAe0guaEisvPklrinY+gb7Xmyo6js8yYrbhO9taKlR/AXsjsWqwFuUM2TCX13AacYe6bg2zGO
 MU0vutmSphzEHbtaL3o7v9lx5qc5TI+HTAWGEM2n+Ow05iSWgviImSS+3WpQObUQPMCTCY1kzi7
 WYznfkvQpvzZ/pqmMHA==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0c0eaa cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ze2PbGEXSmdAYQ4Rbr8A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: aPavUItDXdnS8ExieHgrGO8LTZg_HQhT
X-Proofpoint-ORIG-GUID: aPavUItDXdnS8ExieHgrGO8LTZg_HQhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108377-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99A97578D9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Define pinctrl definitions to enable camera master clocks on SM8750.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 7570189fdb5d..84ab550db2f4 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3894,6 +3894,62 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam4_default: cam4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam5_default: cam5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam6_default: cam6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam7_default: cam7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio113";

-- 
2.34.1


