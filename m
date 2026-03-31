Return-Path: <linux-arm-msm+bounces-101029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N3VDqily2mhJwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:44:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EBD3683D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E262C30630AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687283A783A;
	Tue, 31 Mar 2026 10:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpG/pmsj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvSzrIqb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8043A255A
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953468; cv=none; b=R7yW+IejyRttTRO80MiUq8erEaX1s7UcmUQHA9Lpc06yiXFSiEwqzlNxeYtcMJB/nuaAx9pfJuAJzkMoWZdHhPbZ+xNepGdf2qtjEd+ItS1XvwFhRPd5yjHSG7t5YNEnpdnYE8eum1cvkn/gqOT/Bn1RcRxXePw8zm76rtPAEBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953468; c=relaxed/simple;
	bh=HzZ6udZIX0qppZ32YzrIDn8RNYm4NIMigjlFPV3wD1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kh+nl9oymh2Ws5tIOyQ9MR2zNsHYNlT5KsUr97jSDJMU03QS7d9ldCeyKSJCkQYW4TX7i3vtc+Me2XaupODT1zKWiQhakm9ki9PcAeGSnW+iLUEXRJumPZ6Nhg+yaPp7VuGIwY59g7gGw/YWsgH4k7TDyCfYMKOvAHFT/M9HTjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpG/pmsj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvSzrIqb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8AvTS058081
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KFts4t4CJZXtd0nDtnnkMx
	cONPs+uLk8hvtA4e7+nA4=; b=IpG/pmsjzqM5bb+Vz6C/RxfqgiXn86wNhYC3Eo
	2dFsfz67ysdXmLVBZ6bs5MqCJakfpeRmGJBMpbRZXWA1PokziP6yg1YQBIASn4Qx
	bT75FAinc5wBOytCjq4dVrsMvKhoiOSVV648ywpxvGZoRCLupXUHScXFr77nYF4C
	T2IUHdBEcCiAbx0UY8VE8M8M/15Mr/HOpOjvTVVUCsmlLDChe0vxv6TzfsSvtlFH
	8TLzCglqM5/OglOpUZnXcxLIqMdZ/c5MmckjGo23jMLLG61URO6K5/zaIjdbXZv/
	mljaGdSEpvUR+r8/XPNwbPacnWikxEn9Rbm4+4DZ6FDMEtTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8ahkrm3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:37:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b3544bc7bso78450911cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774953465; x=1775558265; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KFts4t4CJZXtd0nDtnnkMxcONPs+uLk8hvtA4e7+nA4=;
        b=WvSzrIqbJG0xoLz1g2KbhUz4DLT7LIfdoIiBuEb2jnfcgU4QwlHQO25RmlPWUE4tL6
         cXoucZySovxllDYHagm4mjpKFSoTfNEQludjH2zLRXRbCRGsMROIh+NSdJHZFQSVMhL1
         4zJZZzGe3K2GuwRoQJ9GhrNwOXgiN63+Xg0cN0aRa9I3kGN8aR2sGa0Gm0rfX20mpr6M
         Ykt6AXG7MOB6C+PnOFjXpunazrLGdxhzhIQ7bBzJZRlppvw/2QAFSMqEKQtCvp0p5rf1
         Tczpbw8tuEVp9pfs+h5shBDdaFenxrLvYcEWpwV9q98B56UnYxvECeZYtU/r2zXAXqCy
         Cbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953465; x=1775558265;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFts4t4CJZXtd0nDtnnkMxcONPs+uLk8hvtA4e7+nA4=;
        b=rvdTnCEpYt59m253yaPdGCsS3v/KarUYg4tb/wiNglFYmFQNfqa3SgYuaoV1x2RLDr
         +W9e4iq47nEap+JWNAt9RHeOrPLEMLyyFdLuiKkAiMfYOKyrC8dJxb0p32fP5HBCSmPl
         aI8FhK3RMynu+PyOkR+xq1u1ZX+ahVPQGj+rkhwhQdnm3KMZ78JrdU6RpH42RSqrt7Bi
         inV1LvRfbfBvv2dpl0MUZX11CNhBQdRNKsP3ix3YvaHqhwa0PXbxh4acvOQ5CWfKm1Jy
         qp9Pc7YajYOFUcqbLK9rc+T+tjEojLSnk35XfFS/s4AC3+dOZRJgLeOcnx7lBkK/LYIW
         NRMA==
X-Gm-Message-State: AOJu0YzbM9fg73peUVs6ze78NRpFeREhRtZ3RZfc/s9E6Ieor05IcoT7
	sVcQa+NKQCUcB55hpQeqUNLaNBuDlGnLdx08GOdnxjG/tZ+HBVrHWftJnOtrWXlBYK4PNQ8A4qE
	lMF1uIAfV8uYMy/3JSZBhw4gADOa00ioubkkoOjMX3QCRcUF/n3uN/h+WuH+2BlkYe0X0
X-Gm-Gg: ATEYQzzljyzu81tUBs0znPvSiu/RKbZl1F7VU1vGbus7JvrijhsCS3gjwFU5m3abyTj
	r+Mrx6Q2qSoWYjkUq9JgV4i0KiYS5mmdsGpEaROIX7LTVey6CkUMb2i66qkMc28+iW7Il+kdJ3C
	vJHUjqiySnm46R/+M9sVvEpCgfgnBWVPs2DK9/jX+V7SNxh9apVXwqABodoWOi0kPJoTUtYYbV/
	KM5L1MRjxeuhjqAomTst1/y/zaPv00sKHk3HerzlWc7JYGQU6CEtP5T6xFdTWogsE3zlKf8hyC4
	Q0OEEx4CuRuJyo6HhVHc7uj++Gyyhlkxzra1Y015lswCr94bF/R6dAl4vVtQnmnea1hKOK+zBFu
	ryoHsm1YF9FFYWb3QVNp+JKX2QDIaow==
X-Received: by 2002:a05:622a:4a11:b0:50b:3e4d:7ff4 with SMTP id d75a77b69052e-50ba3918815mr247941301cf.35.1774953465333;
        Tue, 31 Mar 2026 03:37:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4a11:b0:50b:3e4d:7ff4 with SMTP id d75a77b69052e-50ba3918815mr247940701cf.35.1774953464589;
        Tue, 31 Mar 2026 03:37:44 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887eb5aff3sm34178175e9.15.2026.03.31.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 03:37:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: eliza: Add ADSP and USB support
Date: Tue, 31 Mar 2026 13:37:21 +0300
Message-Id: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGjy2kC/yXMTQqEMAxA4atI1hPoD4h4FZlFW1ONiCONiije3
 eosv8V7JwglJoG6OCHRxsK/KUN/Cgi9mzpCbrPBKFMqaxXSyIdD18qMq3isKBqvvYpBW8jRnCj
 y/g6b79+y+oHC8lzgum5k/GsjcgAAAA==
X-Change-ID: 20260330-eliza-adsp-usb-8ef2b1b0fc13
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=HzZ6udZIX0qppZ32YzrIDn8RNYm4NIMigjlFPV3wD1Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpy6PtcHDwk4QtDAuxp8kNuuW5ozZI0FrTJxa0k
 z2LKPUYHOKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacuj7QAKCRAbX0TJAJUV
 VjIfD/wPevrmH/ODAm5hhDSSl3Zz+aJpwVFD2Kf6ktwmsMgLSP8FLgJ1rVRNrXEeLRIC+Xu3ALn
 XJrrwXoQzQLS5q7PPzFqU/wKLKz3k8w7hFVvt1PE9zTEojt/c926LC+dVo5NKP6Dtq1yYNCtrsp
 AFmXN19rsNzVCX7HJV6I1N/shX2y+NsDPgI7/KdCMFt3yVKuSGZfixCdAtdMZA2V4swGW9wRt7b
 vLtQVNLbs6+STLVq2EglmxgVYSerCmtVwDRkGk9cLdVonQLmXaGUDGh26pg1GC4Tpb7L/AICsF7
 7++53Lm+5XHwer8RlyM4GBoMX2McxsDbTu40wMgrxYmLcQ3CgUmPon8hrYcvYMNLpkl8X2UrbK8
 2UpL57wMKdWAE/lRcB+sl2+lHPGBzX+XC14mO+bkvOPwoM88JjGflcBPsp53WkiGcKVeZ8iDIJm
 5X7A/OGlHajxnezgxPfoi1pzynw/T414XykWFhshnW4o2lrjIhv6JozMQJhwCW9S1xyxIW4DcAo
 e1swwkf6qegt4D46YrHSgeD32yF6lhQlXaAvE4SzRqQwxH16vWdyEgi3gOJapeDHuZnQIcUgUrl
 FKwURzkA7fD8GZmIliMWvXveY5q/NpmB5qm4QeJ622UXL7SiHuv+PLDj392gz2/eg5M0lDjZUvP
 KEB0+GI4vIz4jdw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMiBTYWx0ZWRfX2agDrzIeuy36
 ZKwIvsy6p2s1g7nJ1wkHN6aZLIlX3U5O5S8EICv4k3LB6tf0dse/v93vPQpCSWNt10VWgOVCJFu
 NSanpSAom7QBQDar3m3BnGVfA+odDtrZ/mWRJ0TiiOrxdIq6//BWck/bSWSPeNV+aLybqxpTT5U
 wKu5+imoWCI/G7OUlPNKkaAyd2ZUyygrOTPGrqIWaWtcdk3ZWGi09CJeZfZltzFiuo3zvcqk21S
 s4adcrJmenhqZ80Tl845IQNPoYc6cbx6boej7YQEYekqKw8+KSS9AIwcofUviDdwgxkQ3y5Uqxg
 Qu3WSP52Dk7JfHSyp0FioF6MkVOelzFSvjYknPbMb5D0saJp6bEfcgthPipdu33SZCgCOFp0Kqz
 AEmT3A/SBV2mc/Sul3qfM3pcIpj4J+Hp+F/fHfjJIHKLBdOkoLvewXnj8fUouJKetAc9KXeiXsk
 wF+RswI6vo9uML92Klg==
X-Authority-Analysis: v=2.4 cv=K4wv3iWI c=1 sm=1 tr=0 ts=69cba3f9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=54TDNL8im_h_8_rPNEkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: O587U1nktDywailcOcVauOmTBOzPerPw
X-Proofpoint-GUID: O587U1nktDywailcOcVauOmTBOzPerPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101029-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87EBD3683D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following patchsets document all necessary bindings:

https://lore.kernel.org/all/20260327-eliza-bindings-mailbox-ipcc-v1-1-3f1c89bdf72e@oss.qualcomm.com/
https://lore.kernel.org/all/20260327-eliza-remoteproc-adsp-v1-1-1c46c5e5f809@oss.qualcomm.com/
https://lore.kernel.org/all/20260327-eliza-bindings-phy-eusb2-v1-1-1f8a9ad6a033@oss.qualcomm.com/
https://lore.kernel.org/all/20260318-eliza-bindings-qmp-phy-v1-1-96a0d529ad2d@oss.qualcomm.com/
https://lore.kernel.org/all/20260327-eliza-bindings-dwc3-v2-1-28439482ebce@oss.qualcomm.com/
https://lore.kernel.org/all/20260327-eliza-bindings-aoss-v1-1-70df76adc69b@oss.qualcomm.com/
https://lore.kernel.org/all/20260327-eliza-bindings-pmic-glink-v1-1-f9a65495f599@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes
      arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
      arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support

 arch/arm64/boot/dts/qcom/eliza-mtp.dts       |  83 +++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi          | 261 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi |  69 +++++++
 3 files changed, 413 insertions(+)
---
base-commit: 5e59a51e3378f5d31e1f4f8efcb9763db3e322cf
change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


