Return-Path: <linux-arm-msm+bounces-112969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +0HmCkJiLGoQQQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 21:47:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB3D67C2E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 21:47:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="eKH1+Z/4";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZwW7wPLs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112969-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112969-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05AFA3471E6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1820B3A3E91;
	Fri, 12 Jun 2026 19:44:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000853911C5
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 19:44:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293470; cv=none; b=brvExENPwjMZh7eYG5ijcgPKTKeCG3s6ux3up/EXEFhpXPQWg0Md8u+lZ5wyNnXc6kvSaARz9gZKppQUOpJLooYxm7vp1cxa2kxhV5bAdzsYvd6n8QIIIvV2tJvo4nHxyEgVtAw1Sbat+h9ugUHUUIsWAU780u4cFU0qpyxiZwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293470; c=relaxed/simple;
	bh=aUUiq+Iduw1k27qHCGXJ7Idq+dfJ3/r0NyLUI6TSCPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f4vwul0MuYEqQgWewpGTNtMo2JZKIqDBDAi29teR1tCMicnzdSesHqoLrdRiO60ZpW0+gd5aYsk4M5NB4JxziVjreUryAj7SZrdGzLUvsqDlwGoLOE8SFypxBWftFFBwsGjiV0XH6+q6zRgLxQRSHy1K5r3idf+GjI8RudAr3WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKH1+Z/4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwW7wPLs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGV6Gg047201
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 19:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EB02umt05Y6
	14wpjp/AnU++dEKKady3nd9BX0XrwaCU=; b=eKH1+Z/4b/kBmG58mdpHBiUxNgO
	ypg3BfPj3TcTytK5Oq4RzrDW3NfvLu0eZ4LiwfJjuZSdJsp7EOBrpTPz5r9RHH/T
	uKK48YRRdOedctB/Uxb54jcX6RifdI9c9yeWjFPTF01e0IdS8iZe/Grk+fGUzaRu
	oL2qEgGicYuGfVGhDbFqaYMbJcQl5zD0etli0pCpWnVAvjcTLlri5RE6MV08dp58
	udoEsoNt0J99TPBtu/wuHgYdMKqN3HWgUltz41Ye+q0vaoUODWsG9kd2oEShiet6
	pmRaWd9zVy2ZdsQkCvqR3SZs7tydfY49rJodycrY9jAkhjLHAcdn9h9Ng5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u44856-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 19:44:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915757be497so184679785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 12:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781293466; x=1781898266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB02umt05Y614wpjp/AnU++dEKKady3nd9BX0XrwaCU=;
        b=ZwW7wPLsgfH+8h6poYqgxiur/wLCg/2eLhspUzxWJaA6JYB5SEuFJIweJEwwd7tk1h
         0tHVdCBgKlbQSHXDiuzudUF4VLJaoTSx+ZgQPTMjva8LrVjoB7v7wdKrbOlj6Xrtmkw0
         KcAWiPu8D95BG0bxMtihqBH7iasse/7aeYLV3wX4hmMsVFy/GhHY2DE7fYnOJ4ZlprvM
         MwgGoNGUKsnSm3prVvb+Guh+TPkiILSJcur8v5IRreU0J+O0kvhjd9wTz0cinURaQKwI
         2g3ro6kggrx7BWPOIJsrz2VLjxxpRHfxewxl9cYAc2KbXNuu2rpZ8vIJ1BnFniOrI4ro
         gMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293466; x=1781898266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EB02umt05Y614wpjp/AnU++dEKKady3nd9BX0XrwaCU=;
        b=Z1qP3nL+a92kB3jqBGX49bgFpMrlBcKENYUQKjP949/J4eeY3YAJzb62XN75cTIFi4
         qhB4JO7tYamiyPdDlzFTaryNgIyURoFntreFAEN87ZH/pdCPNhrKx+plVBfqXdDmRRnv
         i+44ic+H1Rr4AZOX+XrgPPP1IvgEQA+Xhf+b8+xsXkD79bdXXP0+3NPfBoaAY7PoHsL0
         Kscek/VI8Al/tiU7tAzpPWhulTHya1GaYeZQxOEpA8pG3ukMpM1HLzdxIb/Cx+lowau2
         AkoasiWqjU2gQkz6PXvb+Vo1vRLfkhEMbvOUuLM2AvPRSyBdL+dtafGNaB8/ijYgLzDO
         SDQw==
X-Forwarded-Encrypted: i=1; AFNElJ/Qe18C+pHSDopGwaHqseVflnWqGn8tBsfnpYgWuJCBIYsaNcnqcEqEs7cEMGoIQO4lO+2LG9OoZRukrIhn@vger.kernel.org
X-Gm-Message-State: AOJu0YwLGbgecyanPADF7ClgvqT3+9HBJzxNbHSTnNE+1crfO3n1CFBM
	9zHxUOKJ1uhNRAlAR+3vVCVG8WsH76R5cDVjy6mSA03fY1goeIMmxHf9S/10nBE15SrGHy+82NV
	8kY8SPLmJSogebdj/UWy1id3d9gM+ujHwyKpkptd6bKcHXhRK6JcQrybjDYvYhXeKoLLz
X-Gm-Gg: Acq92OHyYqh7ZAP5MY8HWhUkmZoEwRHno0l6QD2kdg158wi4rQRb7+NJD23Zb77ljwN
	hRaYZthh83dwGuwB23cjUQ+DiCS8XdsAQfVt4iIzTxnhXfrux6sw9iJmTVqInXqqxJodsakmkbq
	McLgbEwdTQpRO+ZxCb+w5YxsaZYG+FXUlL54lffu0QPFWmtG295N0WgsPENqj2QV/tsgIxbOzq2
	wtQFNpyNNMG+XUCKh3B/S2cKHBfJPxvuGE3heVRrMFB6i1b/BxLk24wSvWzLQCLhvjyAEb05Qls
	bRn9zTi2xI/h64lPWG4LHo9rx9XroJVeUw8HtxiU9ONj7hXSmDKP5HSyfmPtN35QLrrwImnHurb
	adKlEgw41SJsdOq2dPaKHrmEf/FlBVdckDnY633pWJ49Upw==
X-Received: by 2002:a05:620a:6409:b0:8cd:9033:1724 with SMTP id af79cd13be357-9161bc20a3cmr601091285a.9.1781293466383;
        Fri, 12 Jun 2026 12:44:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6409:b0:8cd:9033:1724 with SMTP id af79cd13be357-9161bc20a3cmr601086485a.9.1781293465965;
        Fri, 12 Jun 2026 12:44:25 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm138396466b.11.2026.06.12.12.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:44:25 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 3/4] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Fri, 12 Jun 2026 22:44:16 +0300
Message-Id: <20260612194417.1737009-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tMdkt9vrH49ynEqzQKZ4W5ixKalB6Tm1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfXydQbRGLwCFQV
 yM1Ctv4hdmlm5Pwi/WoKb2zdG+Cy4kysh0OziExjnNA0VH88ecv0H1tmNxP7oFWewmX0MAvujc1
 MxPWWSOh3O9wx0OTJPwmmoOctXtyxgM=
X-Proofpoint-ORIG-GUID: tMdkt9vrH49ynEqzQKZ4W5ixKalB6Tm1
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2c619b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YfY1aoyU_xzM63z2oOkA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX3X8lMwCt0jt8
 ZDdyJjoHD9SY3h6drtWrkPLvD/2y3rwjzCRsU3gI5GvNyu9xXVzCscALKh4jHWl0QfBla6JEGEa
 cdpXlg/Elid+URFnsk76KgA5xNHFJfxUExUL8TzLgoCZRMAFNiyRCT0bof00uf7/AG5rA20r2Js
 h1UPwPVE0Xzasmdy66mzOFf4quXtFVrI6x76SPaOsdswTeWcr7L8MCPxF+h/hS8EAGIMdK6KNrg
 nUAFHiYMzLAelGXcQ+nCq0UrTpWjEf7zrYApNLJ57NoVfI56jfBc8fMdE5Yd9zVwlBDX5b6/sxe
 CZNiFekj6Y50SP5xgJxDuWyHEY5XfZxaDkh6n43Gzq5pLttAdQF9ekKD3JRgtS5Wz+YxrAalrqQ
 A3ZX4dgeCBa/tWLQX0aaV0QWd1+q+Fh/3o2G6bH1nPYprC2ogzv/nEEG8A86dLUGv8TOvwjqrFI
 PliyVTtbBL8KVLmbgfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-112969-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BB3D67C2E5

Add the missing JPEG encoder hardware node in SM8250 DTS so the
new qcom-jpeg V4L2 encoder driver can bind and operate on this
platform.

The node wires the resources expected by the binding and driver,
including clocks, power domain, IOMMUs and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..081f172018ae 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4469,6 +4469,41 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		qcom_jpeg_enc: jpeg-encoder@ac53000 {
+			compatible = "qcom,sm8250-jenc";
+
+			reg = <0 0xac53000 0 0x1000>;
+			reg-names = "jpeg";
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "gcc_hf_axi",
+				      "gcc_sf_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "camnoc_axi",
+				      "jpeg";
+			iommus = <&apps_smmu 0x2040 0x400>,
+				 <&apps_smmu 0x2440 0x400>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "cam_ahb",
+					     "cam_hf_0_mnoc",
+					     "cam_sf_0_mnoc",
+					     "cam_sf_icp_mnoc";
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.34.1


