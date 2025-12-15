Return-Path: <linux-arm-msm+bounces-85227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56DCBD765
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 12:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAF82302BA9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 11:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC5E32FA35;
	Mon, 15 Dec 2025 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHKWjdkj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmPu/DRg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B3132FA1C
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797097; cv=none; b=mjtNvl5CYf6lc1+wKK5osGzh7mD+25K/MzRQMwed4RLzuTmH3miuz6cNltzPf5TZ6hjmKzCls8FGTMkbPiKeuvuPl3VSNgMAt5nkaGJv7wd9iVdnp19ZNhVDEKls6gXRIKCKl+sqYRdpOLpIZa0ztYFFeTZDLtz9nUkkQ1S2ZzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797097; c=relaxed/simple;
	bh=DUs4wJC+VDe1QuwgJs0TQdGCZpxs4c2W//GgpczUYho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJJuKb6Cy0431OzD5wfq2a7hB0B4jAFaIS1hym2QpqbS9WIjdUjCuYW6iXgR0kzjt+oJUzbuEa/LMNcDR2VOw3nnFJ8UJ5acAk3kwq8aNcfkiDprphFx6tY0uj+L611slWqwbiB0lvQrO1Z2UfiwjMLp9DH7emYreAWdpdKyruU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHKWjdkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmPu/DRg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFANrKt984993
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ffG3VR+qlMIzXuQA/U6HHK8nmsBe+hFJK9dh88LIiI=; b=cHKWjdkjB7mQZ87d
	83A0etNMLzq8sKdPDGgGstDQQXOUdD65B62vL8j1tNaqhRSWFj0kvzWZ39STuyZ6
	50e4kL3/KjEkNRPw3JFFDpVWgcPkrhjA+VMhge1uUtv4Pe0g+dTns3Xtrh/gNk1n
	zUAVx6bIa9eluY5thx4znkhJ3cs5LTqVgNRUf/9ck4uJ1Cb9qabFBmdk03VUoVZG
	6A69pkHovjyya0v+pjSKvEQZwzYtWLUUnXMrewcefhrue5VsOiHbc3CKgionR4xR
	JRrZNY+xM26v6NIDV6GWU/bAxSPjPQ5OkGoZvAO7tJwIs4iwQrYnUDo9enMmHaTj
	Ehd1sg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11a7v9wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:11:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7c7957d978aso3320388b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 03:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765797093; x=1766401893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ffG3VR+qlMIzXuQA/U6HHK8nmsBe+hFJK9dh88LIiI=;
        b=GmPu/DRgfWUp+IAl5f1D8ndMPixB86AGOm7uQhS+dEHhWZun7CuM6cytZgrMv2WxkR
         GAOHAwlAkNAg55TnGyIWRyjaZsN1x3UxG/FhZH4bklCfrMFTHSWOt2jp4wfdhLKCC1pZ
         RXhg3QvcU9HCUyfGzrZdlo5oU3J+WlU89cESxCtPk43XsYSpb3s7gA9ZGwInmxcOMMPK
         QGVn8xBzwA8gb+BAFMOEhHRWWg57UqEpNS2v8UBE35k95RM/FlnfjseRroM5kyxFw//6
         OrJHURIqmderVVodNkPkA+sXSMxMIRJRxQQuPdPGoxPpJSjpLSeBYDTTy3b6fo1XBUNN
         v9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765797093; x=1766401893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ffG3VR+qlMIzXuQA/U6HHK8nmsBe+hFJK9dh88LIiI=;
        b=pPX/4gRR2+bXxlA9DcfhMH2J+6Lei28cZTriFu9TYlqjlbNbswyDU0ruPktFS2bIqV
         ylCOFU0yvuydVJVRnsxKMwVVW4+ri9zdjOjUj+pvuWZmamiG4hptSteGYwIXt8kxGOcR
         8dHYhbBKj8Hdqvu89hWTRgFVcbkp6WNCH78VXj4wFQXkebxsY0cF/Fn/RjlX4Yr3lCGu
         1gGbzi9jpvoLVH0rsRcgdHLgFe3+mCMJ/Wym6p/ZzjS3jJQpjhb/7uh7+1OVhpp1JgKr
         0gO06726/LFcM3vbH2RA7wMiAidss4toJYx55Xag28KqDjUsOhQDXbGdwsxViBPNQYqU
         e+kw==
X-Forwarded-Encrypted: i=1; AJvYcCXMMHfSnZIcoMiCyIpHwts46wVNDiY/Cx/n7ilUVWTdEPXdXvKWdJRjq07EC22yLrcPSI3laX72QkayjrKO@vger.kernel.org
X-Gm-Message-State: AOJu0YzAihpuNu4Fzd3c11YYbqhzGN7j9kuTMqCtM1I+mXzJwagfspZG
	88HDUTZTvx7fqN0me7R+lj2yrhjtKWzN8jvHNuumvC8Jf9C8kcEqXf1EchCfCQgrwdgNThmxDI0
	uQpYX15FveUF8HWhZyHalYsc+xY1RmHti1MHxqrb9I6HE0xTtcyFECa+EuVshJu7MQXBU
X-Gm-Gg: AY/fxX4YoTwdCt1C0xjpFChftYm7FhO17L9pM9UsWGpBYY2CkY7rkE+lhTAjBIc1SU7
	pdn5j7drDbBL/EoNoAOTSeOL2c0ZOF4zFZIK1obhQxx3y3xgSygGD+dWTp50ZfeCrWcS8SOyRVh
	BCp3+EedFy7XCWX6YJpsr/Ob8qn7ufHET5x+4mpt/hdX5qu5E5PEy7WejKpmJe7G6SALuGLHSWd
	NbLJ/ZfbVdkWSXmRpH0vcRsVUL+y2ShEFHbB9dte4dKdUGFpHmbw+SrTsDTdI98SCcGNYvC7HGv
	imw5/dgY9mYqoAJO4yTkobUmgBZWKt3RrCUy11hP1Znt2+heV1RQtEO6GNPY9iiakmuUkGhckjD
	8ODklrND2JDRT45R+tV5qH7m6iJVYIq66K1qAfmsPW2OC
X-Received: by 2002:a05:6a00:420d:b0:7e8:4471:8d2 with SMTP id d2e1a72fcca58-7f669a9517fmr8364713b3a.51.1765797093012;
        Mon, 15 Dec 2025 03:11:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMAG3FqJ3rO8O/F6vgV20Uh7A7qwd0IDUFCE4AJkIO6SxD7DJFPLNODUpHPj8MI4zg4KfsjA==
X-Received: by 2002:a05:6a00:420d:b0:7e8:4471:8d2 with SMTP id d2e1a72fcca58-7f669a9517fmr8364684b3a.51.1765797092519;
        Mon, 15 Dec 2025 03:11:32 -0800 (PST)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2379e40sm12408918b3a.5.2025.12.15.03.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:11:32 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 16:41:05 +0530
Subject: [PATCH v3 2/2] dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com>
References: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
In-Reply-To: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765797078; l=900;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=DUs4wJC+VDe1QuwgJs0TQdGCZpxs4c2W//GgpczUYho=;
 b=+fdqUtJl468HYmox3ssrVw9vp/3lRX056AtNh36u3Vy3N1dkxQWuS9TMo9IMZ6xkbB71AWhsl
 JHQj/nwLhH7A+blW7EL0r0WRqfU1WTBZRpIy7ZJSi1OiTKksuabu1DN
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA5NiBTYWx0ZWRfX4N4SvXkayfj9
 79tEGs74aFh7mWBBSqMMtSTtJMTTPABerVwZndzraXmLgVYnJ+di4RDOco5WaXBjJ4syyxaoqfB
 ZtRov585P9cQN0DT0ehbpncZjO2HVD3ot7oPzJLpZ+YXanTPIJ83Psaj3viughf+URxG1G7eMJg
 Orl4F89mr3gatgNKgGoDlq116nQSUiOMMC4IiVGm/Fwv5+cqTpIWCB6ih+vSyoGyi828gIYMQg1
 Jrd+NQB5KmDh3wAAnOijEOkJAgu0mNkMXN/BCAiNLGUjS+OY5nzzGn2rgo5emXNHRgnQ+/eJ4y8
 GOPBsd6pCHAnp7/pxI1UO6uzTLF0sU2Gh3ZscXH1LPC/NAy+kp3H5wCYoYKNlX9NpangmNjnbD9
 7OT+nVLXlDnq+ulC1SCKbIdgJCCJHQ==
X-Proofpoint-ORIG-GUID: L0ZUEb_UhZbK9-YXvpluVX4fWzv7-HBZ
X-Proofpoint-GUID: L0ZUEb_UhZbK9-YXvpluVX4fWzv7-HBZ
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=693fece6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aS6jM6utL2cIvELFAl4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150096

Document compatible for PMH0101 Torch and Flash LED controller.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
index 05250aefd385..3bfa24ff58cd 100644
--- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
+++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,pm8150l-flash-led
           - qcom,pm8350c-flash-led
           - qcom,pm8550-flash-led
+          - qcom,pmh0101-flash-led
           - qcom,pmi8998-flash-led
       - const: qcom,spmi-flash-led
 

-- 
2.25.1


