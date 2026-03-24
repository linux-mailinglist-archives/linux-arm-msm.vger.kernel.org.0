Return-Path: <linux-arm-msm+bounces-99677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKGbEV6Pwmn/ewQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:19:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A1930931C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CCE830D5AD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C51B3F8DEF;
	Tue, 24 Mar 2026 13:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3al6l9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLwmNrZ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28393F8E0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358033; cv=none; b=kR1JlR5zEB8xJIuBP7mn/wsQN3Ri1YvUt2rlpLf7poDFJBCvN/Go805m8HTtcbbon9SmbSPwcbzSj+EeK56EB6pm6BRwjGkDS0UXnMmmp/RmJPvtGI+qgkwX5i+zNF+hXnBdvP+bdvsoEFmj9214gAMipxRnFQZaJYj6/Q/fdFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358033; c=relaxed/simple;
	bh=XDvvASnCtgHIU18wQG3gP7ai1EVs7srYXyVWBWRgzTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ndOFK2WiXwb6ecgBz7jV8ywcXQfNZROzazdbNPZyUi8liWI+d6d8fKBakdlnNVUjpL1ARnbk04S3aVABO61S+5wlCBL3QoN1yk6bO/zOiQzMVsDl32jyQiTticT4SpbyUO8oEp3xnWdiyDrwVNeLwfxnSmQjDju9PPZ0eXg4Ydc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3al6l9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLwmNrZ7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9wVmp3039725
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rEqaRn/byj85uTd+j53pd0KBVIryH/O+WbxUbn1SKQg=; b=I3al6l9NiM4e+fHP
	L6LwxsLiRc8CsCFrIyaBHiIPwdXguT8I63e2fjLhaH8WfXxIwXOCMh3tZ3F7kIcN
	i6Tmay2KkIq10KZkszoW/r2kv3l+E3OropepaYwCggsMyRgTQS2zBQoIulP1zmRL
	cUp1Jzc7ibrNeSpTSDpKdSXhJ86Jj5NfhCkL2mZF3W9btaWwG1q+77tmygEa0hc/
	24fydG7PdBtq4YSzMouDMqeaKCLEmExbwdWAXNk65Vimxjk8AgGKhnAowaU+qphT
	qiQggua6wuM1YMzmQGFo0nqiIZQ0jQojcAZBW0XGZldWWTYHPY/ZTY0g2mIcI/Si
	QnTM9g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0gq4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:13:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c675116f1so1061276b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774358030; x=1774962830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEqaRn/byj85uTd+j53pd0KBVIryH/O+WbxUbn1SKQg=;
        b=cLwmNrZ7/fBr5prb4gLPssk0t3bHKVHeW5pnYW9b/c0bWNIxG0vn/JkSFLCbuVDbh7
         9HEj8iPubg0C1XTPt+1q7FWfSvb/+22EuGx58KV/cYCoGYQ++YWWJF1hx+zy5Ju5ICFB
         1lWjv1+vMDpTI42SU9QNzCkHrDU1TXxpuihQZjnBqvKnUD9m62nuv3cIEVoOeAdUJMGe
         De1P4A76eZsPnGPgd+uxygZZrlczcHWHV2IRTiGPhTzNzFd0KcUBDDYd8l/ioFmqn6/R
         ZkOL6hYIP7fdnnq3WuTlQ7VAZEodEY174g50+zMLrsrgYO0PP1n5gR3PfQxUdEHVkXGx
         01Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358030; x=1774962830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rEqaRn/byj85uTd+j53pd0KBVIryH/O+WbxUbn1SKQg=;
        b=B8ghNFermHrEX42Y3XWIB5dCnf+T4NmSqzcRsugai1gxh8pENH6aNYjYEuUUZAgHu/
         YHUJfB6NnX9ARmvmyTOjE48UHdTfz07tVJONlK/icZxk8e8jP+8P2mBRvK0ckufNqVXV
         JT45UnnYS73S4xFruOyvQuC/gSlclNXWCrTaygfpYs467QQW+tftqiv9dOvv0BXcFOsI
         SqgSYuiC9LsVR2SqLGGmIHrGDssZ2DB2eU+rDZ5PkDZRnZ+MLmnxc8Vn7lymRQO1yXZz
         0ySUvHNBvL8F27c3t60sAMcCCX2DmMMpy7dQlT++g1R5xhUmrFjMy/TujewQbO0Za7Dh
         dDcg==
X-Gm-Message-State: AOJu0YyPKrhv8l6/o5u9QWIVH/iirW5Z4lyeda4lazvPEA4SwNX7BjVG
	Xe+VzPgANh4NVfQP/Q1bLlaokupGDf20qdPkk2CBlylYl9L33ctnGa7CVZXZml6w3Tu9wkJjt8c
	sAgDavMHFA7KuDBchqBenAo1LemFWvRESN4sxrpzGIRgg3IMumcnAkyRI16RFa72IwuHK
X-Gm-Gg: ATEYQzx1axHGSUtfwEVJbOjOhALRU4Rh4mnOgnPVPSvK7nkbtHfXcRwW8l/ofvfR19M
	egl9GelnUzHaFzQb3dcRJtDssyJC030kSf+/k/7k81iS6MGhsmndQG+lvHaNpgspO8hOA67Nha/
	wBL5gTYs8pLPzAkXWbJE99FKuAoPWqGCdH5EV1Ee327SBm9IeIGp4dq3WbYlYZzDOJiHn2YpKes
	GjPIsNkRVf8RPfRTcRGTLA3D1p7BPCI0HqYvYPV7O0/3arRsEz2hS3eikcpZfPNbcnfEU96omzr
	iQVEcRSx9EltvbWqb+ROHeHCnIkx3hwof/S1HAEEU/QzrSOpQs0jNsuT3lWP37XTq6udyq851hk
	jCJxnpNk+QEsxI8iRjUQgTkqGadXQ/nyzaVlLP3Rdg4zofGERB/dlFROkBQ==
X-Received: by 2002:a05:6a00:2316:b0:829:8af4:5eb0 with SMTP id d2e1a72fcca58-82a8c237c5emr12621839b3a.26.1774358029853;
        Tue, 24 Mar 2026 06:13:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:2316:b0:829:8af4:5eb0 with SMTP id d2e1a72fcca58-82a8c237c5emr12621815b3a.26.1774358029198;
        Tue, 24 Mar 2026 06:13:49 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be3396sm13517528b3a.27.2026.03.24.06.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:13:48 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 18:43:18 +0530
Subject: [PATCH v1 1/6] spi: dt-bindings: qcom-qspi: Add QCS615 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-spi-nor-v1-1-3efe59c1c119@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774358020; l=881;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=XDvvASnCtgHIU18wQG3gP7ai1EVs7srYXyVWBWRgzTU=;
 b=OX7GwMB8ytt0dtJvXV0wUQx5YuDNMf+K4r9bFaR5vowtht27lFOdDO2pe2+d9Alj4CMcZ5bNI
 yVv2VDbNFRIBIpYPv2lvfvJZWjU71kdUZ2iA6p/Q8H7aDOwy62P7mW7
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfX8nkspUDmaVq5
 Z20brzq8s2zNgmEWMZqorWVLmE4Ry5DxT8sMMJNPtZTn0+njyWqpCleE4+OCpnmfav15y1qaYOW
 73FfCJGjGpMY6WeZRTz9dtbYeoj5hPryONXGZkw/+WZqr/aQJ/s9tpjCVBCQHB49AyNF04IH1xg
 NR7UyoWlMwHbAzuOutLXtX+OEbzuOlsyBalOT7XcLLyYYwQdLCkKiSd0tbgdWcN/kUdT1rjHWmX
 Qnup0U/AVz3dgtac0BJNQAvTfU9KAGU8bfiQiyTjLNtuJHkstn+hiK1KPbDyKTIPZhbbYB+VBFq
 hNJzl2vTvnKNdQJizKoy6GpU6WBsUfbshWx9PKHxQGa3GQRgtfP7XCtvWWZ8DNf650BjhjYvugZ
 U1joAJumWItS3gjx1W50hkfD5fvES+IuzVBX8wPWN5sL8OS4nyAUE6mjDI0GU3YVyo5Sz6K1/DQ
 /lr8RhrpdvnpO6BcoXA==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c28e0e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8vX_xI0UiRE_Tro4Z8AA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: UzY4cf0I-xTbOS-1WZgF-OHPkiF6-AQ6
X-Proofpoint-GUID: UzY4cf0I-xTbOS-1WZgF-OHPkiF6-AQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99677-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70A1930931C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the "qcom,qcs615-qspi" compatible string to the Qualcomm QSPI device-
tree binding to enable QCS615-based platforms to use the existing QSPI
controller binding.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
index 1696ac46a660..d9aac33b695b 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-qspi
           - qcom,sc7180-qspi
           - qcom,sc7280-qspi
           - qcom,sdm845-qspi

-- 
2.34.1


