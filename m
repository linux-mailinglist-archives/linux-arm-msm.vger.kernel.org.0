Return-Path: <linux-arm-msm+bounces-89897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJsKKS8HcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:52:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 061A54D4B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A104BB2379C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086D63D7D97;
	Tue, 20 Jan 2026 22:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OojlrFUT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPUD/fck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9756429D269
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946787; cv=none; b=KjSOVNT7vGwBZwbEMO8HSBbVnziK7hJSRimSPbcMgoaaZb1duOzblF2LrCEy3fBrJO3dF6+LY4+xigaiAFIBysRq1Ot2aNHW2aU0OqRr3sXW2uZgexSxX2lDr9z8ceD6Yp1Z+/26PpQQyeyQl1q1Mm3JCuEdbQW/YYpzg4D5PJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946787; c=relaxed/simple;
	bh=rOZoJgZslmXUXLyWF+4vAn8VvrseOBKyOxW6jyGygc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WidAM7RS7wgDUzeOvGO5BqMkgdVs/8GLBF0mmJPjVN7oQZhX/y27l855NdehMrcE1F8qbPLgefHvKdfMxkc4Q692W7nbUmk1o8oep5M73qOIQMwDqv1DI6gW1rUFrpgSFmir8F3wg55JqO7hSuUco1dg74dL6l+TzMKEeriuMpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OojlrFUT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPUD/fck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KHIFSp668673
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aG6yLE+iMJcps9v9V3RlJvutgLy5xcCphtOU6pbn8jI=; b=OojlrFUTVPOkZSHu
	YisPKoO5N3VUJzZFZv0TQNuKnBKNYzscj8Hmv2aFPx4T33otI7UNzPWqkHwHN96T
	2kDbnCG6YOlbyjAWN9uG3fuYSVF9zYFuMA39N/eRWiGAyxI5I4GEqqFB7UOG6ysY
	YwC/1NKTuEAwRhqdEoEvNCvJur3D+82peKeoA/wiOA8F87iGdjA140zEXX8hSsTz
	pwwjVwYB5ikHeYNmquMicFLOEgzeWemt1uMSpaGfFSlqVTMPGliRV4KwkYDilEAu
	/QWPIUiLtVT4mA8aJeab5xqJrAB89DupQm8axOjtQnzXnQQHcvoMyHx8H+oCAKod
	wGeeKw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte04rxjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81fdfafe6e9so826824b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768946781; x=1769551581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aG6yLE+iMJcps9v9V3RlJvutgLy5xcCphtOU6pbn8jI=;
        b=RPUD/fck9wqLHbtG85x7JzFdA6NhPK0PT/dEVBaZRy/wGQC8xYi0gbSzaHPHJZaHFa
         xxLOaUokCKHhERxljyqK0cdouH6cfkz9XFDScoGd/Ey9aej5SI0wlkJceIqEmrNi8QwX
         f1WXKtHD8lpNYMlCc/VdmwBdmlbUitBikwFgLL8bIaEVHXR4kKRYmc+2Rr/bkchp/8Ff
         a8B1Yso8jcja1guZMa0tYbhB+F5FispAK0MwZ23xBw6j36j033su5/AxLrPVYgIrIZKi
         R3g57/h5NQS426Mefe5XvZ4zkvxlU4VLyYfloHcKirV3Ov1RXRgVTgJprHXCn5H590ZL
         n0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768946781; x=1769551581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aG6yLE+iMJcps9v9V3RlJvutgLy5xcCphtOU6pbn8jI=;
        b=GYMwhGxbGoY1x74QaViTELiUZzTJJamEIIJsUj0A5WSrHE4mJRg0tw77pkZn0rMv6j
         tUGPLp/5Rkz9wuTsTWMTmVIvMlMFEVbjnr25T02H/X0isthitvnqtkPVrXtxUpxcB9ny
         D0QeCKtFvcjtZhpChfsHqPFRTv0XlA/v5MDU/EYqZc0KHSjcFMvp3vXJ327RYivgjxvx
         baEZwcK7iewv07u5mFD+AYVbSkYoBjnaKePGYQlBcZyxTpp3fUxWPJTlueH8nFGPxUP2
         mT+Jhu85YY/VDRl1eAYqjrZnFB9CP0HBSJjFydEuf72xYFtzoD10cylxg7RUlGvMGKP/
         tGng==
X-Forwarded-Encrypted: i=1; AJvYcCUkF5g+0unUs42EeiDf7MXadOWe6b+PQDECL2gHWTZdHDTF8jqFeYhXwcjrxkwo4FG0WlcELXqlP68wiw/+@vger.kernel.org
X-Gm-Message-State: AOJu0YzTp8Z7DeZ5VUExy0Msj7RUSOOgMjcxx/0YAhgtpLslXN/q/Bcs
	COeSD1WZr77m9IBiS290lS/TwiLaHx6aP59JpHN9poXCs5kCAVF8OR7vL0u3H98knYST2v0HkfO
	cGi4ZZiF8ygsoZkkN3rT3upmvl6TEi8qkL8FBJqrFE9AQuDr3ixhNPTDuuk1s3Foqc700
X-Gm-Gg: AZuq6aKXGS+HBZ2cxGF/qKTyhKn5v0NG2L5oRKKaweQX8m8r+pJiFmj1Hnf7KL7wYAy
	p9v3IL49eAi8EAVPuJBgR3WqB/N+SPTwzk7psIg5C5RuvhwnOapbS+cOnpjNq2snpnuV68FGYFu
	6FggYQ7P4AyRaG0isYS33WvE1Lzz++fZnbEAGR6M5hHuS1bxXSmJQyExDgXTX7+E1dSkE0Z9K3S
	oU0MbO3EpTnxR8CeNA+mo64pH5zEJIWK9/kT/V8ykaosuVUTtTchWcFKqndVoNvJpJWtQgBTKav
	IMA9E+2gwd7GsDuWlUHIltDpnBy9RwQMdemS0d4X5Ji3uHCWyWiIIA7I5SECR4E4vMrbwiKjrrd
	wpNRBT0PQYHjNTMJgHi/76ia/n66LkfmR+w==
X-Received: by 2002:a05:6a00:1743:b0:81f:31c3:2e38 with SMTP id d2e1a72fcca58-81fa17a0472mr13858715b3a.19.1768946780642;
        Tue, 20 Jan 2026 14:06:20 -0800 (PST)
X-Received: by 2002:a05:6a00:1743:b0:81f:31c3:2e38 with SMTP id d2e1a72fcca58-81fa17a0472mr13858695b3a.19.1768946780157;
        Tue, 20 Jan 2026 14:06:20 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12b30f0sm12867088b3a.61.2026.01.20.14.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:06:19 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 03:35:52 +0530
Subject: [PATCH v7 1/4] arm64: dts: qcom: talos: add the GPU SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-qcs615-spin-2-v7-1-52419b263e92@oss.qualcomm.com>
References: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
In-Reply-To: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768946765; l=1901;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=auGzOt6EwZwwOo/iQK/twL4Y/TItrT+w7eLe1hI4xbQ=;
 b=INpKM61F6lNusR29d4hLWQMtrqGVGwx3XbgDAKwYw0FmRdESF+NrTtBQkmuVPBLdd6CfGyg0g
 ilOGDMYijygAzpb6DI12T0FNjYhmr9Ihjd/kRwDo2/Z3Ko2O4c+aXgv
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfX16+t/iF1PWzB
 V9cMDUZMfFuC3Rpl6sJCUrwdaiY73b6U7Cmng3RlhfTT51bbOlj194sbjER/UKhuYDC4SUAdaxr
 TOL1AkVOKLFVsElGwv5wkSWWiO18JyfJq3ttzuUCHQkId2fGiuA6XYlGJXPNs1bpfByxIkSFCZp
 sYjP/VOXMspLM2UExD58c88sOleEuuCNcLeMOZtDmpy2coqwjXHDGTd0IYnYUKiKedvGb1pJT6B
 vcdmkdoS5Hh7vOI1+pEJ4dI9+uNkT00WklIHgSXt/2bfoDQ4XwWRFbcTrpc8u4tAYl36d6VQ5ar
 1Tew1gt6zPBdKmnesXWv9P+R16OhXl5V7Aiok2FTy26FPKW2x/QhSZwK24V5lyX0/JIM3XIiFSv
 LxLLKZSExzhQfuetJAHDzOOfGuQon7lUIoD/7ZLQIjwssLu53dCwkd30FLKMpSsD5Nc5keu989n
 kIdOGpZR9yk2EkLVLjA==
X-Authority-Analysis: v=2.4 cv=bZ5mkePB c=1 sm=1 tr=0 ts=696ffc5d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JGD8hGu1O_bieXV6s3eyYKt0OefFF4op
X-Proofpoint-ORIG-GUID: JGD8hGu1O_bieXV6s3eyYKt0OefFF4op
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200183
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-89897-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.77.170.208:email,50a0000:email,0.91.149.80:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 061A54D4B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for Talos chipset.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 88980d8c3ee3983fb56b2ccd170fdd41b22c222a..9495514dda1a32e21f53f4afca677dc13fd9cd5e 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1843,6 +1843,31 @@ gpucc: clock-controller@5090000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@50a0000 {
+			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x050a0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "mem",
+				      "hlos",
+				      "iface";
+			power-domains = <&gpucc CX_GDSC>;
+			dma-coherent;
+		};
+
 		stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x06002000 0x0 0x1000>,

-- 
2.51.0


