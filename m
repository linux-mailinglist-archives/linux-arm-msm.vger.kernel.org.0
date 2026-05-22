Return-Path: <linux-arm-msm+bounces-109238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHYAJHgtEGqSUgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:18:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1ED5B1E4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7EDF307D419
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2ED3C7E1E;
	Fri, 22 May 2026 10:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZMJ1SOi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9lTXUJP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D9F3C8C47
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444778; cv=none; b=ZwGHVXVir7ls3e6NGdVMldG2mM3elAooA/RMBXclQClzYoiPlg0Arkvqb2lRl3Wnd2WQB6s5DXOajIcngRaye/163HQRjgOj5WA9LoM+W2vGdYwYrUq1W1nkzlSL8mx5jNTum1g0FCqt1WOo1CceU9u1mGwC4qEknJJuaQ+v0fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444778; c=relaxed/simple;
	bh=GnY9q+Xc2Y+VqHrDqGOayOA+eKomJ1efauJwSslPH28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYmcnBNAxoMN+0r7JHyv5aRc18lQwLXPLSm4afCkKfRWSpUrFPyOdY6Ms5MXvS+wPXyncX6irx6jtt3LKa6jOHYFjRLp4rwhPrcXmTfLKkK+IuePmCpUDkCWs3uN7nOQUMk7/KqEvY2VqcHfXXgQQ6rI/w2CrSdy3Kh47fMWuTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZMJ1SOi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9lTXUJP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6lqfu1298254
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=; b=SZMJ1SOidQow36VO
	OmfNAX/lI/DPOfz4E1kbWdZb+QV76/Qqi9IBNmAhbtB7Hk7BRGIN+kyAeN9T0sec
	Qft7KZdza78Kf+glrSj0oRC9UOCWmhIujnxfnimp550FN4Rj+iOSKFZGNRkpw54L
	Xu8A+eACHkIogqYmc9aeJ2nF/Qtlochx8Dcn/KL935vFcx1VJCdaiu6IJJKpD7vY
	FJDPItryyTHcNER2akP46kPAkRgOfWZPnWslxEQBwQAJBxJkuYnSJWUfpcawHvR1
	v/ZiWePBSyL9JvR8OYXUStgoZPJPW/Tca/RKDGv4EuMuXDJHKYohFwkwUNoqsoAw
	PzEcPQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0afbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:12:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c82c935e048so4874451a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444775; x=1780049575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=;
        b=T9lTXUJPBl/kuz8eVu3cLziI7pW2j8iLfefPhzR/hCpHqi/2yK+E+Vlnt/d05fEoPR
         A+eqMMbyT+ZkTirXQx3hXKf3yWgQu+MueTuRlLCMNSHjfHU3fl+ZyYPK3ZZdU/m8gK7r
         kYj5OMzMKkN7zwD3wGh2NuORx/ve7au8NiApQpBkpxNJSVnrlZKYrQZvNsydOm2GEbjK
         pG+L6Go+tFg8gdzwIoQ2qDznDGdMCwMJUP3j76/Mi1zpbNbk0u15Wt0Hu4XSG+dxTnR5
         RdDu1qtVx94BHotvqc9b6yOnbL3kdyQY9/Y6D58xVtkb7AA8K9bHWCAW4tDEz/zi25Y1
         hM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444775; x=1780049575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=;
        b=pva1XKrkDn7U4PO0/VJzDUp9DIn2m//eqD+6zKMx5nSGbLLmGRDumum4uBm6LVkf2l
         hHbS30GlBpROFZM4hr6rfw6SPRnwBQx4uUxHaDAaD1l4qYhlzY5fTPLwNqXsIJpzRjnv
         8wffHv4gqSAYf0gjAXv6AsqxyXqILgUd0rqiwk+u2GQcIJp944klSQd2rk1ccAzx5yZM
         g+z0AV1xwVnJ4Xwa0TnYZs9nW+MhdhKB2fyfgKSzwUQ+rcMnsmOJOnlcj2nLspBLJx8T
         7Dtg6GyI7rvDo9WZNcLp5F8pLI7GJUqZrbpZdH033zyS/5nPju8VIMCq4yjB4l0SK/QX
         Fasw==
X-Gm-Message-State: AOJu0Yw1ojEnrGN+ThJOiiMtcBqWUqeLVHLHcbECo4JjtzWJGEUrVgCM
	wZUYMkvmhdGNOzDQnQ9YbmxfBYEzWpglFPTB2VJdQUewJhXviW+kHsNpTtHu1K1FlI0LShAg3BV
	ZD+ScpWh64mNRlM92YlPtR+ebEC3e4FqP1ULc+e5ML2RCr17iZdXZcRWlg1z3hggqwPSL
X-Gm-Gg: Acq92OE4L2r08J0+hPBI8A5pgZewS3+9p4NxncQxUpOo5qTp1rDS/r6BgD4/UpMWa24
	tOlDqAvm0+bp3Z+1uQ5LrxsJO8B/KCER6/g0hT0froUn5WJEZJg6agFlvu0UATMLHKgi5HtOYdQ
	pSHJGn0Rlp3Kb2oMzfAYvmuEQnAuiTjowiM5tzHl8JuxlBlfsTNdBpfS16ypltuIk6a/G3cLMbn
	aFCbU0LY6tdC0FHrvJeCtvFxhcBRcHKF4Pi0ilwqe7FqvsRaEWDqvHxqWyUE+TG0hCJV6wRvbei
	4lkblhdovY43BujXjU4/mP7EVVUbusi8f54KWbMApgb6Ip+A1DnrYwJ1XdED6lXQs0rQOZZ2g3t
	cA4XrWZcunXcNmRjLwdiiOwY4T4XhnETVU+S6PCmdAoGzFQ==
X-Received: by 2002:a05:6a20:7283:b0:3a2:f05a:795e with SMTP id adf61e73a8af0-3b307bc9d78mr6490722637.3.1779444774623;
        Fri, 22 May 2026 03:12:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:7283:b0:3a2:f05a:795e with SMTP id adf61e73a8af0-3b307bc9d78mr6490689637.3.1779444774118;
        Fri, 22 May 2026 03:12:54 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:12:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:41:59 +0530
Subject: [PATCH v5 3/5] arm64: dts: qcom: glymur: Add GPU smmu node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-glymur-gpu-dt-v5-3-562c406b210c@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=2464;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qFdQhBrAHggcU0GWES+ohMA4WsH2wnpDPMNFqXrANzE=;
 b=yNzqUhOCMXQvxrRtd7kxvs7YMFtzu8GiAVVxvYNsil7K96Pk0pY01/RxIvWewjoljNJUYvNeS
 3lRjHziweCfBb69K8ZhCLsCORtTB/RODIjYmlA7lEj942QbUt4Oh06+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMCBTYWx0ZWRfXx+L43QQkU651
 HTwSA9VpHjaIL5o0/yXVG6iaiTyBlPfXEnlQoiX1HzW7Dw40y7PnpUC4U2tnxj1o5Dz9ikA7O34
 v3mR3lsYp21XdGfhHV+vBOJyn6K6ZzIo5mCdlGgVjwfn3AfHLKeAlEfOMQI1I8ZsZLNP+Q0To0B
 Hne7SIU5TG7X3hx5ft7KDYVtVuaK/ix/5AgdtHOI71I25aNwW8vnTHJ0ycs6ZQxz/SIKZRstGMT
 ZYL3pJHKQJKr/OA7ErXi1iiU4exvD7UxK4wlO4bhIhfCsaExMXwmWDjj+yHu8yauDz8lu9QKafI
 VHycjLTV5T5vCnHxKq4nbqrUelxxGMLLnZS2NUF8YOUasWK+hUDl+TYTYC5mKx+7CKf96Ocvciq
 LS51t3A2I/eYfw/XF3kJmQHG/w+8DfeP7jrsyIr60BLTfrTLgR6QJOe6ByzYQkvSDP5QA1IZDeq
 6YdDopTbYHBsWTnNNcA==
X-Proofpoint-GUID: rN444cb5VC64VrUli57gKKtWR2Gk4oLi
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a102c27 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: rN444cb5VC64VrUli57gKKtWR2Gk4oLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220100
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109238-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC1ED5B1E4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>

Add the nodes to describe the GPU SMMU node.

Signed-off-by: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index ed9aac42fcbf..5e76a0d53f01 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3729,6 +3729,44 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,glymur-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		ipcc: mailbox@3e04000 {
 			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
 			reg = <0x0 0x03e04000 0x0 0x1000>;

-- 
2.51.0


