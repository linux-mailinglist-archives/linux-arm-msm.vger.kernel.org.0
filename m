Return-Path: <linux-arm-msm+bounces-96206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP0kJGuormkFHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:00:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC52F2377B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52AC03044B82
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAAF393DC3;
	Mon,  9 Mar 2026 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mu1i2n/X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gl9EICug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FE03939BE
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053827; cv=none; b=UUibGf4aKGCl+b12TBbbQJevIY1Lgg0C/rs+1Pbhv2r3sjrG/j4Of9Trw2ShrP3Uh8KNFXFvlDEn4f5n/x+ptN1eBtH0SRJA20cICrrIvUwbLUtpESS25ojBJLmSCT7SftqljI2GzWll34/IjM3+SC1pXMROCAPQWzNPr1SGGug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053827; c=relaxed/simple;
	bh=EoCXFpUebrCB3eLLljmtB175b7eB89tb2C5XolScFBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qNI1lFoj8HsxHZjzRM/mR93E6sY2OXszXuFH6CzCP4d5iL8XKN0Glid/kcpVCFJYk4ug0Q8PWK6LGyiGHoQSwm43i7s71B6SNT3W56jnNtbnJVRBB16i579OH/Hz7vrlhyk40DCyCoU+fLtX8PX2R4xyjXBD9L2yWLw1Odi3jzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mu1i2n/X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gl9EICug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62981e9f233691
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 10:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDiLwnIohKXOcQY98meskBFzx6LAACu/bhd80+16XyI=; b=mu1i2n/XLzVAkAvC
	lQZ00jDPlSV2TZxUILbgEbZuP9RgEaP17+7yNbd+jB3Ny93CaOUQc4cntmanfjmc
	NMAFPeI5Cq5sa9C3gLIs6Ztk3RCkjJnvjfVVYn4UFkKA5QKCjbrN4uDbsq5bS08G
	FBbfyHi6Uag34/wrxVS0HycO40NiYYncn9IBOtEobImMg8BGdfk4kRgAFBNtEYCc
	YkndZOgif0JvOJw/TF/82rL20yj3ccSWZYIHn5Sij1QHEXkmTCoFX+nIa/LVKw4u
	DoetLbQapV/dpq9OTIGhLY3OeHLGLUF0dP/KppcUtCwwJKCRjoFKypX+jRm7X2GI
	6kDU+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vd2tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:57:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd80c4965aso89361785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773053821; x=1773658621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDiLwnIohKXOcQY98meskBFzx6LAACu/bhd80+16XyI=;
        b=gl9EICugrxIBz2MBHdJGcddXR6xaPzr5dYHmsSTrLSRa+FDgx5hAzYQml8Icl8+KJO
         z8OlibI6PuadMrz3gKvId9v9OCGYuGW0xQ88K5oxp7AFfW0tyyeqCBxl9JMZtomYhiSw
         /k4imDPAFVm2DtxWN+veIbgNbeNdFQCViR+Rn0kO2poFvMdyjG456S2MtiiHftU8PJoc
         xMhUQVmTrUSfVKObDWPT6bnKQLJey/pqe7+5gft+c20Nh/W6oG1f1+uWHY4WGsdVfU4x
         te7SQUD/ZQgi3FL+2BjEbMpzIZeCk3JItqDHkB9/X4TPMPPOjp9+FJvZCs+JqfgtRKNs
         qydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773053821; x=1773658621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HDiLwnIohKXOcQY98meskBFzx6LAACu/bhd80+16XyI=;
        b=cRXnnUAoc64LoM5Y/WJ7r+d771s5at7iikdNHp4GbIlZva/E/hWbhrwbp83wG8RtV5
         wotcfh/qeopcSsY2c2eRI+JhIGJoszNSXUEnDvss/QCSBnVjBBivWLZliqLiB22IypkO
         6MboUWxnKMsBXUyEbOrQbOpIvN56hFydUWHL+Oou34kqeKzjib0NVz5JC++9aaVEG8Hk
         TCZ5wkwFh5qubsDTWJHCkMru8as9fah3SILsevmGYjzxlfRc3lovaHWp+BuIKVjc1LqN
         aEohq7EkJMfp+eFGl9bFdPbTqvuLSEiL/0d876ywGWRK4p45NB67NL84dFrfARSea6xE
         9uDg==
X-Forwarded-Encrypted: i=1; AJvYcCXrih0kpsdNJAC+UEidK9P18h/3+zpJivFrW8wbwBaGO4GVKh4Qg5gojR0KZDhtN5z98sUDiIo6hhjzrQ0n@vger.kernel.org
X-Gm-Message-State: AOJu0YwmkPVdgkjKphUXNZc8ThW6e9fnv9Z6lI0ymwvuiNEt0Lnk/zeq
	gRpYC/AIXyvYVcmaOWkC9ERd/pLGkkVC3LUbjOIUS/P8/5x3TC7dNC5e8p2QBgoozW4QUCCYmBg
	L2M6sIUTabmHEUup91g4MiP6UXk/jwCrE0MMDC/k9j/v6124HP1VdtNAuqaPZLgxxxfNl
X-Gm-Gg: ATEYQzy2q/A3ZI+6xLOBsBy43qKwece6KVTX/T4+gU15JBIWkGVrRSAeks6qAjJba3m
	AibGb9uWIrxheHzixaj28x/xfs9goC0wXYg1j9UfwIoaoB4k91GDQlxhwTeZAJx3jyRp8MmoGQe
	MX8CIBclnD8dXQcaj6UsZzJ4+Nw2sETge6m3ohEIZ54cIg2gKjlWGzd07eVkD5WaPu/qBXFt3P/
	90lW80Is6EOm3wZH0mQtCr8pYWmEXpelLqRdQb/64it/xocjD4UW+5N/zyvLllpJhGccnupVK8v
	h77k3FZRThnrh/CSmn054c2cJc4Mdu5VC2UjBmlVvsIHZ23vDArt/DA6wrcj5iMv7Nlf3Z/5WSE
	PPBtWj3s14MOlGitW10mcqpJ2TNqnxA==
X-Received: by 2002:a05:620a:190e:b0:8cd:8ce4:c0ad with SMTP id af79cd13be357-8cd8ce4c8cdmr199055985a.22.1773053821410;
        Mon, 09 Mar 2026 03:57:01 -0700 (PDT)
X-Received: by 2002:a05:620a:190e:b0:8cd:8ce4:c0ad with SMTP id af79cd13be357-8cd8ce4c8cdmr199052285a.22.1773053820893;
        Mon, 09 Mar 2026 03:57:00 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada3b43sm26169971f8f.13.2026.03.09.03.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:56:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 12:56:51 +0200
Subject: [PATCH v4 1/3] dt-bindings: usb: qcom,dwc3: Allow high-speed
 interrupt on Glymur, Hamoa and Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-dts-qcom-glymur-add-usb-support-v4-1-6bdc41f58d18@oss.qualcomm.com>
References: <20260309-dts-qcom-glymur-add-usb-support-v4-0-6bdc41f58d18@oss.qualcomm.com>
In-Reply-To: <20260309-dts-qcom-glymur-add-usb-support-v4-0-6bdc41f58d18@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EoCXFpUebrCB3eLLljmtB175b7eB89tb2C5XolScFBU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprqd1aqqJKIRh+N2sgZHRqrHQi3HjJu70xF6WF
 GHqiz8d1zKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa6ndQAKCRAbX0TJAJUV
 ViwOD/0VWHfA76EiN5qNwYEuDyT1o+xqk/dAWpq4qBIfJzmkQZIaLxgZ8bRb7x0pyr+1zG19m4u
 2INmhHoN/Xk4zin8UklIVhZjcOYYuAJkKwDkv8syVV8TAcfD4AcFDT91B/Nht+MScO8Knwgrrvp
 PCcuGAdI9nTpYzzJzLgjMSkI0K/Iw/I9HCeoqwWyoG9Ficw597aV+IOe6xNlCu1p0zVR57CxHfD
 867y4uHG1N/L+AW3wFprCUm8sw+/DexlgHC/vWgcVTmJvikZrkWryXHVp+mnHlkYlw+ikPhVX0q
 tl20eVuPjFHpSR8imd8sT090or0FjOdZ/bqsp/MgyG/WBCxsJ7OjyssduM5SpDjXK4R3lvmpdFv
 FJFqj/DysU9LhBhjCTpAKii072zYxZa2QPRzOO345Ct0SWipmKSEbs3kO2rAPjvEV/aiXUg4GBo
 aiePWPS2PHkM/lVpp2IyEGs3D+VjuQVIsNYH67gWU61EoM01ldyY1mt6jmxNqLiaM8zunOLjf8/
 M3Nr09otXH+DLLxhzu13rpWME7oEcm8W65Gc/lfI2cU6eX68g/Qo3pSKaCwvaYguz9hnL5g6g9d
 sypbuoM/UXZaeJHgtvke1jigXbeE/1t7sflYe1CktzkmJvleeaV4COOHvK8d4pP+H8/usYs9Dpg
 Ig++UWLbMp/3sxQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: BEkI6bDB4g9FY4GKBas5Z0j7JKBuoc_J
X-Proofpoint-GUID: BEkI6bDB4g9FY4GKBas5Z0j7JKBuoc_J
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69aea77e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vx3hbeaYKRubAM7LXykA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMCBTYWx0ZWRfX86dGljP1M2jh
 +UvEuc0cDvLi4JpRLW3oi/F5RdFCLuRVht8wSrVUrSpoISaRm6HWCvj9JIDbl5nJO7UJJQTo68N
 UjKmMIyitZnqFoqaaYTwyA6i6JJN3kx8avaNZqu6hGBRJFg9ExsZGwyQrz5MSGOf3vX4ctkImyf
 Hhq6+tktIOfqZVo4Or9Td01eiskYLfq6eJasss9kPm/iJfKCICgs1RrgqquhwaHoHABQz5yBRFS
 KRGFQSgKVl1WVw2Pz63h88Hdy5KbBxb6x/xIVGnG3isZOwa99+nWa6J6F9+GQ/pggBZzTC7Mn47
 FlwwCVqHiOPKy1MD9b9unbyRf2Ner9N6UTduzipEn9M/DKiG43d4ABTpam3YArThDofAeqvUd+a
 nSITdKw+QIeVqTHKXr6OcFYhMEfZDlnVSTA/J0N4++1XDsvQkUFdIovgj3FdUe06ddLd4OytTVj
 o7B2WMWZCqtX2upJ/6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090100
X-Rspamd-Queue-Id: EC52F2377B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96206-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Some of the controllers found of these platforms can be tied up to a
single high-speed PHY, basically rendering them as USB 2.0 controllers.
So in this case, the interrupt to the Synopsys DesignWare Core is coming
from the high-speed PHY, so allow the interrupt to reflect that.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 7d784a648b7d..f879e2e104c4 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -500,7 +500,7 @@ allOf:
             - const: pwr_event
             - const: dp_hs_phy_irq
             - const: dm_hs_phy_irq
-            - const: ss_phy_irq
+            - enum: [hs_phy_irq, ss_phy_irq]
 
   - if:
       properties:

-- 
2.48.1


