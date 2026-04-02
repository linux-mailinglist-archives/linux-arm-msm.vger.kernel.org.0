Return-Path: <linux-arm-msm+bounces-101537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB0LA8dYzmlcnAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:53:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6BD3889D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E902301C918
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 11:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245673DFC9D;
	Thu,  2 Apr 2026 11:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="amDYh5Vp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsdCVjyx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479916BFCE
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130344; cv=none; b=kSCkJEEThlFtsacHF4KAG0Z/YYIpNZOFdBnzAodM8reRzLh7m8e00gA4YzjbMJQelmZNvwZ07SlsXu/oQ7ieNm4X9Ba71iUzlNPVF70gp9yWxOxtXp6NODwG5dVUepuKtb9jd7zLx2N0OSdw83780FxQ0yGyVEuz+irFVWu7z7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130344; c=relaxed/simple;
	bh=QE38gDZK+HUt7WqeCx4YYalPwAyNS5l9JXKzbJf+I2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fA4fshsBiFTYjPLP9SHqJ/tI/aM+uhSxvjP3vOeRWZiTE5qoMc81rgqmnE0kDRcr6yiwd+yf3aFHKJoc5rDBmEyXQLTm9h02Ok+vlS18Y36K0VnajhYBCTtHPEQTMfG3XFKV9urhaEZ2SJ+zWgPyE7D07qeb5P5aV1uTVvaizcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=amDYh5Vp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsdCVjyx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328S2mD353259
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 11:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjwC/vhaUDCLhEP3xKrjmpFxosYiBAU20RYUklLbtgs=; b=amDYh5Vp3V8Lt4bq
	2nvUq32hgCxNtxzLDU86mdAnFQvkijQdNcos4CDGKGJZ32TNwf0CMjFtnHUI8sV3
	MYFsEFbe6S5v8JmEnwuCBtdSvnQ2ZwSnJjdc7mWB9ISSBOprCCSq2+XLsokG3HMs
	D/5OwxGv2VjFK5OTTkPFPVr32z8lnDfmYgERgD08WQj3g+x+miifhjgLuf9Wnst2
	OdqFyDECbxKMmJB1OGRR9JBN2HfvIYaXY8Yk4eApByvTvVS9OJU6eX5+PnT0lFdq
	oTlxvShpBbtCSRRHfkIpnhq8OrhnTq/QO/ndgUqIyCeFwdeCqg1zHbpd10AueQJH
	9p6ADg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myh8s44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 11:45:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093787e2fdso31824041cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 04:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130332; x=1775735132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjwC/vhaUDCLhEP3xKrjmpFxosYiBAU20RYUklLbtgs=;
        b=HsdCVjyxvinvR7bFdiBRpRM8SiHupbMtQjYWXxU5+Jsr0gbN3auwPk5AO1LVjn47B+
         7dUejXVk9EFz4y6AYlG8YUGP/KcOvELU0h+a3k/75v+KPDfTDlwKq0SSvef6Ih6A6FXo
         KQj/COjLF0QVeC1uvpEgXnKQeoFHr1ZWrbjNRdUKXM5yEgZX8RvdCF7EdUUxQ+SPVA/5
         CTI3gyBDdv5LHaote2hBcJdqCrZ52xzOrE9NKbjNwqn1KulfelgsZqPdZYd1mk9aS2D6
         cK3s6UhkpdnBAjMNc6VjPIueYP65pS0zHivONvvDSSMs1JOonqJeSGdt6Omq4YFM74XG
         p90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130332; x=1775735132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DjwC/vhaUDCLhEP3xKrjmpFxosYiBAU20RYUklLbtgs=;
        b=tTbKy1oyhMWablPovhHmORTtdwsn5uKVYodUYqhPEfETuWw0dhQUMCG4wrljRBeEyK
         lctsBnXaVQJucgNApmIEnZ4PigH8i2a6/Y0rH2h5fOGeApagXn5PcwqAKDE0Aq7ZJMwO
         x9XsYPR/YxLJbqa23bB6GsD8TY6qoA50+B+1/ITXxtOI25m5uMNFmdKC8FBdbCQpfrDQ
         eyS6qxmo05tQgX5DLQEltRzbrI63Kpef3/YNU/WHcdBJtZckshD5XUzOx/W0D4lLdv8G
         3jFZlyLwykazFsPv4C3YIP0f51Fq9awRQUJeC2DWO4Gad+qdjsx8akiIV1UjcvKGJVN3
         2I9g==
X-Gm-Message-State: AOJu0YzUmzvmwUpzmq9OCedQ3daCenR0lmXyPLE6LdZsOF9FUcgDTGUp
	SKq7fkHhQG1hDqUaIQouXIdSs6C2QnPOJCiRdJsNnmBUkOuP1Fndd8KrQ+E5hdTnvrxMwAECuvK
	aqfuTU8tte/uPvpkMjnkHZU8JAyGCTeLJmG9gVp5OLv3TRNSydiuGnKYiSF7iJ4hNfw99
X-Gm-Gg: ATEYQzzZbVuxI0zCo7HP4bZdMZ9vu/+ALAYGLu7yZpEkhWVoSWn7g+Io5enu1TgjWeS
	FLZoWVK1IEtjtrwZBI0Dy7HqMYjMCYTjlFtDH3L0NPigvTzZv+n6pAuoU7oCGItcE2NpBU5j2ab
	DVI5SUdeMHYBDIGqvH5ruwTjVMdcEIxe0+rYaIBY5gPhTMVzbf0HYe+bgKby5t9cDEzR0m5UPlE
	nySXVu8Ja3dpoo3P1gP/uCqdGE7iGl1YpOtlK4ZYjbAejcW/0FcniifZ6mCHQB+m4Lk/PVlQAIV
	s6gZ7YI3Yn7lT8uFOGNzi1oQwKb2XgKvZh49nDrq9CI1EwNWQpMiTjX5snk0GXdSHAgju3dVP3j
	eICCI9w6OgI7JlO4HyKqtP9JrkZFp+F0wSwWdBbI1CDSc
X-Received: by 2002:a05:622a:2294:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50d3bc8d625mr95626081cf.41.1775130332042;
        Thu, 02 Apr 2026 04:45:32 -0700 (PDT)
X-Received: by 2002:a05:622a:2294:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50d3bc8d625mr95625591cf.41.1775130331630;
        Thu, 02 Apr 2026 04:45:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 13:45:14 +0200
Subject: [PATCH 3/7] dt-bindings: display/msm: sm8650: Correct VBIF range
 in example
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dts-qcom-display-regs-v1-3-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1752;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QE38gDZK+HUt7WqeCx4YYalPwAyNS5l9JXKzbJf+I2E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbOLSQAFWp8Gr8PlfUDlPv2N2JIbBreG4suU
 r1DrEbDCzKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5WzgAKCRDBN2bmhouD
 1ybUD/9dwNBOTsmtrmq33APJ8aDMQgbCwksTIvbY6DI6oY7e0sLHWp/u5gov+jxraVUXbTPcuLz
 dzmsG97gUWM+XDuThzHaLByHAq6WzRloR4WMbrxv7R+vHSKDO5fjB2HqqZnKNve3Gao3lhDIIWY
 cjBDh+pWx/gZ7T11rZO90kIvwLsyd/7RyxI4VwyYhZCC5hpsPx+mkg+NgJp5gylhTg/Lofs2tER
 f+AWIe+qm5dcaSovTqisKz2n5Yyc9f1F9+iXbFjL3iPBJBmojQtHEoXDwVNNh4USNuujCq2pl0T
 eHwjTxUwa6Gtl4vtmtgaaIwP8r2kzl2rfF0u32rlPojCR2t7YD8REgjU2gpcoO81xysVtM61FFz
 RURkwsoRIcGz2FknedRWm6WlOEp1qU6NTB/ZROiHbVx8Cg0OuIVBtLZk3EAMLwlQEA/esROeBTo
 raTv/eA2DQhEMufhJ/29qklDgFC1+IYJH6HXrkFCfg0Q5ZNmA5PuEV73IOMrdKS+8QZebJzwh7k
 qV2ZHrNT0Afvx1T3fRZGJO1gUt75thTZcnsbmR9D22aHpBhTlgBhxkLc0LXe2Y9bThfPA54wP0S
 QTDZhwMgUC3W2wgeHUkZjnCuLn+FglrpN1UNIzPIx+eF7/tTzfRXfRpX0pupqdFdHMM5SmaZpV9
 G1Kgj+AsY4syAXw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: -kXuCrSeW5Rq89aZc1nxVKmX9SJKFIC0
X-Proofpoint-ORIG-GUID: -kXuCrSeW5Rq89aZc1nxVKmX9SJKFIC0
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69ce56dd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HWmKLdpjvklgZKno_vkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfXxyLhUlLiWBgr
 m/uEnJZrPyqaFEu5pqxC1CSZ0Fc3hEZX6p7YJr3chYJ5/4XL9IRH7CieAWJ4IKWFEEYXRL/TYku
 ORbyKGLi6EczW1tWYLx5XdBhz92PLFheU5skU5QJhO2jqkcuCXlhU9dnKAZKdkU99NPGISBBFER
 U0jll0wB0lDob30w3MJb+w94H6FDrzpOrHszwkDxCgNpj6Fddhlk3Lr6Af7wg4E4/p6MVpaZj1K
 O14gfibxVQnQueEon4zTB7TetTjTimV9XiN6jzK+136fO1z+0J0jLSbDpP6J9zcR8G0GmjZmgb8
 XRx6tYtkFZm2i+aPB4HiYaj7hI2/Mod+Gd4QU7UjwuzDT+l6WIRDjRsMm+BhdD5ErKd520yKqcc
 wlZ/o2mQriq36C/e4R462Ksi00zDJCjSaB/H6EaxPebUnC9Gz2viDoP9nC2l6W7VVIfYNPbmhSi
 subBHXLOr8Yx6TD6ICw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020105
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
	TAGGED_FROM(0.00)[bounces-101537-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7A6BD3889D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VBIF register range is 0x3000 long, so correct the example.  No
practical impact, except when existing code is being re-used in new
contributions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 2 +-
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index dccac525d202..134321b50897 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -70,7 +70,7 @@ examples:
     display-controller@ae01000 {
         compatible = "qcom,sm8650-dpu";
         reg = <0x0ae01000 0x8f000>,
-              <0x0aeb0000 0x2008>;
+              <0x0aeb0000 0x3000>;
         reg-names = "mdp", "vbif";
 
         clocks = <&gcc_axi_clk>,
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index a1c53e191033..0f7f79527748 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -112,7 +112,7 @@ examples:
         display-controller@ae01000 {
             compatible = "qcom,sm8650-dpu";
             reg = <0x0ae01000 0x8f000>,
-                  <0x0aeb0000 0x2008>;
+                  <0x0aeb0000 0x3000>;
             reg-names = "mdp", "vbif";
 
             clocks = <&gcc_axi_clk>,

-- 
2.51.0


