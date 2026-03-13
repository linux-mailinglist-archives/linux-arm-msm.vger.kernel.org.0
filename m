Return-Path: <linux-arm-msm+bounces-97514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GL5D40UtGn2gwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:43:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA84E2841F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D3DB32BBDDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8CC3A8752;
	Fri, 13 Mar 2026 13:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXUsIZR3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A8mhq/RO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3EF258CD9
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408254; cv=none; b=Y3UByMybvUoUvfSyYrJL3k9bCt7dRej5Xk+isXXgySvuoePrCGYTwDYqCVcUI+3Uts3uRIUSUWwNmr/X2xnlfmGnvLuL4L+9rKH/563cCGHe5snHV2a6LD1gletfe/Cs2N/nVm0wLl/gwH6c6OhFwtt6IwK5Kvg4UCEZHNCiPIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408254; c=relaxed/simple;
	bh=CKRK7IHF5xkgJ9qxLQ6tNIenHnvl3emzF9jvCKyufqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q5cbTccp6g4DAlmzcwf2YI2zXUqGYRITFy0T6RzlwZV/XNnJhJ2vqeMcRdZBT/WL7Udx3rqCWPyUPonTqtez4lGWA0IfDGXohJK7c7QkHULLMd++q94V+Dv7v83nO8T3EnNUNaFfL03FzFOUK4E8uxT3Rs3sR6e6FIsTgTD7GTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXUsIZR3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8mhq/RO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9TqNg1499087
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhfddBzKukeR91KTRfEGgE/iuW4+lUb0Swo1LbjKEVI=; b=DXUsIZR38ixznBjq
	PLAy3cjb9LRskcpGqhI1NBgYVV8yAM2nt6sIPTbh0uUseOyAIUep2DjdRKELAF81
	ctiCyosVudd2hfbG8W2v9DssGH0wOHMj2wJS+zJ2q2T2SdggywdMT84kCypMEm9S
	DKrKhPnwlC6SywurrnayM2IXGGHW3l0EDAJBY1p+jhXH7VHpN/2UPEVmmMEWup+k
	mqaBZbFhNIDDfltSX2w3ReysGrcisdWH2e+T6b1impD0iwp7yXSZa3BJb4hm+muw
	vmFiN78IVRpudYOueO0UltRXneiotiBnFXK/m49yeG4+1pEChX3dS58WkP473MZv
	AjLamQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hgq3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:24:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7c4ab845so944792485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773408249; x=1774013049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhfddBzKukeR91KTRfEGgE/iuW4+lUb0Swo1LbjKEVI=;
        b=A8mhq/ROmbghU9GS1JnPZ2FD/axgQacvf/V0X408NqLjUpgi0QunB3K1kJyO7QIenl
         +xTQMO+XmQU9CRz5uBO4n5IpfrdYA7zqzJNyZlUeb1/3VpkdXNqR6shoBoxbOWwWluZy
         nt4iA7WPdJFRcLnWIu0jlntqJAGNelCGxjoBopY7BYvVETWRqCoJNBfl2dM+WcDVt8MB
         kOQU1SndJ3djs2ar9i4avTVHJAfShSkHRsLwiBtTwFIRDi0M8HvCEt0b/G0M0atC+u5l
         RYYNQ2zITBPo42cx7AQ/0/smwP7dCkUNYN95jfZPzKjpxKSvVqYaQLupFGZdGeD5MyeE
         fx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408249; x=1774013049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhfddBzKukeR91KTRfEGgE/iuW4+lUb0Swo1LbjKEVI=;
        b=fY7u+C+fTAzTwFb71ktsznTy+A13ocy2qXqbSgAQRmNxsm7i/D62X2pmyWW/iHE1F7
         0BBjh0SJxzrtRdSiDBPl6UPLUgSLd580cF56Pd+merZI83hDqV1MabOYWNp9iil1zJHl
         efr6jCE7JS2fdLjV2mLW0RHwPkxduGgKMqN/HjPqj7sCz4G3zpfvPs97xvrfiIVk7HIT
         rGfk8eyEBrRjFfSJHI7MDTmVctojRxpmnt5/6TupfPyvDv6CMrrk4kwsU4/R6XisArly
         yISWWV6n8no73wVWRY+H2yaJNdVsW+L0oYtPkxjtFOg/57M/etLUn+rvFEAqTuiqYhjo
         M1GA==
X-Gm-Message-State: AOJu0Yxt7GqZOGg8XgfL9nFuGMEPXJRrECqIqYu7a4n08RRujFU3id1m
	QpV3MP32lksVQ2NczTqdvAYcqb3KpuMGNpivZqjaaS1+cOEf1neW1vJ+cH/prSYrO+pa9Nxrvtx
	MLdbR3C167fR9Ow8SD6wuw10mtQTMYYh9JyuHix0ceyeOOQTZ39gx3HEh9p8dJkHYulq3
X-Gm-Gg: ATEYQzzB5Adl6OuXEVz9vcPq0KvzzyTNbkDxxo0WWz/MDj+FyhsCmUFlEUMWjoPoB3P
	TX76J/vRVTFyscrTJU+cVUzV0xyoL+tKPqacJi8B7PFbee3nXpD8N+WncNXMaUFcKCuGJCcTmEo
	TsuTWPOKIrz7J/Wgrxu2mUoWDXSVJVSIcoW9q3z81fcDwPe9IqECDhHHpvFJ0L0bvLVm+4ewWcC
	Dp6elOBxRnTNom8ZOVGmpY1UUv20I4oGpcPH+AvoL8cUfccVUEt7Sl5ct9PCDgwp7Wp1afaXTG2
	nziEFxjAV0KCdMOBUXYCJdj1u8YT/p7+D5fok6d4HNGK3Ln7X00YhaRJeSH/znQbbTvHfOzYexV
	Euro8dQNaXbwRAZLP8vGX8/Lh5ZQ=
X-Received: by 2002:a05:620a:1a1e:b0:8cd:b33f:97a with SMTP id af79cd13be357-8cdb5b4d4e0mr466305185a.43.1773408248858;
        Fri, 13 Mar 2026 06:24:08 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1e:b0:8cd:b33f:97a with SMTP id af79cd13be357-8cdb5b4d4e0mr466299785a.43.1773408248131;
        Fri, 13 Mar 2026 06:24:08 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19b936sm20294793f8f.5.2026.03.13.06.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:24:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:23:52 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: eliza: Enable Eliza MTP board
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-eliza-base-dt-v2-3-bd91367d860d@oss.qualcomm.com>
References: <20260313-eliza-base-dt-v2-0-bd91367d860d@oss.qualcomm.com>
In-Reply-To: <20260313-eliza-base-dt-v2-0-bd91367d860d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=12230;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CKRK7IHF5xkgJ9qxLQ6tNIenHnvl3emzF9jvCKyufqE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBptA/vJ4tRkTvZJVvEbCh0gxk8a9belTBL+fEo8
 Msv8FZueSmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabQP7wAKCRAbX0TJAJUV
 Vn/kEACv3FWIgpcDUX+zahWyivUgerzqRcLGfLW8k5126L4k8PB7vgEezs13YTWIaHvzJ6t0guG
 a3imNadlgel6Z2bAyLcNTki1FTe6xBwK9gBjw/R7iXpb7kPNmyM9bETxhqzFzEWeydHivAgbJur
 Nq18zchsU1AxfAthitLSbXuHOA2dsyDdzJdmnnzqL5JCqLBBEm1KbfoffLw0ZEhYl/HsqeGlkIC
 UtjqXDi30CEcVLFXU36UNHJRfnFXY5MaQaUNJ0VlrS4w0M76fB1bNRpUaa7cWgtuje5m9mhvoz4
 5rMJLj5pqFCbKngPk5hZ06KbULBoVyzHO1DnKUQ76qllaznBvSfr/mtoV0hRGpFhu4svTRoCqif
 hgIs/RYqHMlxu/eV502abT/qeXwiUv12GLXsUh4+5Xv0hLWQ6tRBLkXSKV32HlX9kCewEt5mgEV
 1FPp2RyzrB/W7HvQeCUgEgVVZSaaFwBCG6MQx8fyzz5tRA+YdmjUrBTVrnk98sBDgD8jEBKVWmk
 7yRKRe7oaNiLpo/0Y5aIT31vnTeX9p+tyZYxRszlcwic1iz20KXabBVuTzp6mA6gYdMAfSyZw2g
 uprhSk62tQwq6lfSkfehgFvgmvAJ7I0ZdcJlS3QWu005lwRMFv9OAdpPmTvXOxP2k+qyzH1nSrF
 FQeHdyTt7U3c0Pw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b40ffb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hvA-L96QmkH1ykFoo1wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8Hvla6Z4HNr3mwU-VBFG4bxPht4y8XgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfX/wwJohlsT0ou
 +f58ZezV0zBUW61S15dnys33oUnslvRC8xdgz/uawhBcV14CU+0rc1iROobDPcg0WJMy4o0YKu9
 5/UDW6B/dR3OrQJhPbLQClWodePKFWmRf+FCOWSkm7Qs38aOVvgsSpXEOe7j3M7zfzOdjvn1mOQ
 qhhoEvvRtz7tmQ8pA+1Tsqkc83DpPMq+d0/ECW11BRzbtUiwIR6t1bTWxEOFLRwTN4r2uo/0stI
 6gX+Ywy7CQqly9QAbO4OrvrLUMYXdx9dGaBEd/XYAo3+jp6KnGrJ9XTim36RrIvc7w9eg0YtrDW
 9+rcZZnpRE5U81y7yT9yTN+t+k0b/EPYSkZRjPZAifcGfT6EKZrX7ehAWl9sjmx6ciZ1FU66Z4k
 YMLHzgsd1AApf6x79QXp5HTcbNa8muboAJRjNwt4kYBurKbKgP5syY2T6mrb2v46W7vG5GJqlt/
 q4gZ1yB0DH64AWrN/NA==
X-Proofpoint-GUID: 8Hvla6Z4HNr3mwU-VBFG4bxPht4y8XgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97514-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA84E2841F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MTP is a one of the boards that comes with the Eliza SoC.
So add dedicated board dts for it.

The initial support enables:
- UART debug console
- Ob-board UFS storage
- Qualcomm RPMh regulators (PMIC) and VPH_PWR
- board specific clocks & reserved GPIO ranges

Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile      |   1 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 407 +++++++++++++++++++++++++++++++++
 2 files changed, 408 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 02921a495b2c..e4dc0aab3bf6 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
new file mode 100644
index 000000000000..e7b564281739
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -0,0 +1,407 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "eliza.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza MTP";
+	compatible = "qcom,eliza-mtp", "qcom,eliza";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart14;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7550-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3b>;
+		vdd-l2-l3-supply = <&vreg_s3b>;
+		vdd-l4-l5-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s2b>;
+		vdd-l7-supply = <&vreg_s1b>;
+		vdd-l8-supply = <&vreg_s1b>;
+		vdd-l9-l10-supply = <&vreg_s1b>;
+		vdd-l11-supply = <&vreg_s1b>;
+		vdd-l12-l14-supply = <&vreg_bob>;
+		vdd-l13-l16-supply = <&vreg_bob>;
+		vdd-l15-l17-l18-l19-l20-l21-l22-l23-supply = <&vreg_bob>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "b";
+
+		vreg_s1b: smps1 {
+			regulator-name = "vreg_s1b";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2b: smps2 {
+			regulator-name = "vreg_s2b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3b: smps3 {
+			regulator-name = "vreg_s3b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4b: smps4 {
+			regulator-name = "vreg_s4b";
+			regulator-min-microvolt = <2156000>;
+			regulator-max-microvolt = <2400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b: ldo2 {
+			regulator-name = "vreg_l2b";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b: ldo3 {
+			regulator-name = "vreg_l3b";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b: ldo4 {
+			regulator-name = "vreg_l4b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b: ldo6 {
+			regulator-name = "vreg_l6b";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b: ldo7 {
+			regulator-name = "vreg_l7b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b: ldo8 {
+			regulator-name = "vreg_l8b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b: ldo9 {
+			regulator-name = "vreg_l9b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b: ldo10 {
+			regulator-name = "vreg_l10b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b: ldo11 {
+			regulator-name = "vreg_l11b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b: ldo12 {
+			regulator-name = "vreg_l12b";
+			/*
+			 * Skip voltage voting for UFS VCC.
+			 */
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b: ldo13 {
+			regulator-name = "vreg_l13b";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b: ldo14 {
+			regulator-name = "vreg_l14b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b: ldo15 {
+			regulator-name = "vreg_l15b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b: ldo16 {
+			regulator-name = "vreg_l16b";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b: ldo17 {
+			regulator-name = "vreg_l17b";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b: ldo18 {
+			regulator-name = "vreg_l18b";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19b: ldo19 {
+			regulator-name = "vreg_l19b";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20b: ldo20 {
+			regulator-name = "vreg_l20b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21b: ldo21 {
+			regulator-name = "vreg_l21b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22b: ldo22 {
+			regulator-name = "vreg_l22b";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l23b: ldo23 {
+			regulator-name = "vreg_l23b";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s2b>;
+
+		qcom,pmic-id = "d";
+
+		vreg_l1d: ldo1 {
+			regulator-name = "vreg_l1d";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s2b>;
+		vdd-l3-supply = <&vreg_s2b>;
+
+		qcom,pmic-id = "g";
+
+		vreg_l1g: ldo1 {
+			regulator-name = "vreg_l1g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g: ldo3 {
+			regulator-name = "vreg_l3g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmr735d-rpmh-regulators";
+
+		vdd-l1-l2-l5-supply = <&vreg_s3b>;
+		vdd-l3-l4-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s1b>;
+		vdd-l7-supply = <&vreg_s3b>;
+
+		qcom,pmic-id = "k";
+
+		vreg_l1k: ldo1 {
+			regulator-name = "vreg_l1k";
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k: ldo2 {
+			regulator-name = "vreg_l2k";
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <969000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k: ldo3 {
+			regulator-name = "vreg_l3k";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4k: ldo4 {
+			regulator-name = "vreg_l4k";
+			regulator-min-microvolt = <960000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5k: ldo5 {
+			regulator-name = "vreg_l5k";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <931000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6k: ldo6 {
+			regulator-name = "vreg_l6k";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7k: ldo7 {
+			regulator-name = "vreg_l7k";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
+			       <111 2>,  /* WCN UART1 */
+			       <118 1>;  /* NFC Secure I/O */
+};
+
+&uart14 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l12b>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1d>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l6b>;
+	vdda-pll-supply = <&vreg_l4b>;
+
+	status = "okay";
+};

-- 
2.48.1


