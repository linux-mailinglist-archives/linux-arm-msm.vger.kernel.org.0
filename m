Return-Path: <linux-arm-msm+bounces-101430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM48KgoKzmkwkgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:17:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A8D3845E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 722813071ED3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 06:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CAD137CD46;
	Thu,  2 Apr 2026 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpkiiCCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BX8jSw47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE13A36B067
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 06:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775110576; cv=none; b=Qhug34tD3SXGJa70E1wNvxnpaZqpp2h/3eivkPt0zDbqdAqga1PyNq556QFZurShort33X1a+LNN/b0uQ6/9kENIGBi5ZMgOZUIAULUpK5fSv+MhYXMqmC9jAmegxHYJAWiIXeJiizMe9OtN2k0WEpbG/ArzvBrj/Haz+qbk/qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775110576; c=relaxed/simple;
	bh=Gg5vcc/3RVUkhCzfHW9ClSxYoLFdUKduZUXpgADLaxk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZvekmuXTLYfUpg8aduK3gCfsD5r0JE30z2GPO71VIeLIEUVr5bpR7wSf4q8KzSNrgaD/c5dYthMQj57VF6dlOe1bhvt4WnyfTmmYgINqneJxSnhoXermaMi8Z4ib8bzTsDVLEBlATJyvNd48NfMFA409WkLRTv6lXX89mzEet0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpkiiCCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BX8jSw47; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4KvA548150
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 06:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mPXcXgDL9LwDyWtOO4mR1I
	5ylhidkezebiRyWUGe/Dc=; b=mpkiiCClfhcAZN65/rew0mZFXobfwL5wza81m5
	XItLq9DnoTd8W63BrJ+/Q25LEt6KVwXL9ObeoEGTDNGf9rjbtqhdRygKfkfbvYCR
	DdAt7knuBEY+8OPTMKGswo02BMF6NVk5F4D9darb+WPhoyvmM+pdEkA0Z53X42eJ
	TPZBBH59zQSawhS1ihSnfWbzUZBRvq+qQOATD1i2W64y4RksgPcqvA0RN+bLHtV6
	XLVuxvMSRFlOh2EuB298CD065RWJq5vQuH84ixpA2375wHGIHBcppIFsD8liGZVz
	2JMee+yMU+vVpn8XkMR8/QpDygXi6TgMbXCm5cVNoYdvpg/A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d94vvk7tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 06:16:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249975139so13486995ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 23:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775110573; x=1775715373; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mPXcXgDL9LwDyWtOO4mR1I5ylhidkezebiRyWUGe/Dc=;
        b=BX8jSw479mjGmzMDKFudN8Rz1iiXrOtUCIU0YeV3XcQqZ6Gbp1jjNfuUlMwIjtwUYE
         PQtvOJOCQcoj6hT0SdABcbF8jMwxYhdg5jM0MawbH+RP1Zf7oR+yH8cbTb0jcP60ZOJT
         gj5njttYrH03lGGHFp2PntobDq2FzY4iKiyKTM5t949ftcIFlj3GjbvhQWoyv5h2nBtm
         BvT4kZHWLj4/3ZUEBuoYV5/cNYJkgeLYfxa+Arf5LZplVB7WFLNN9zfCarbkm5WMUkOn
         1EQnEG3U1KRGpKccsUzukYrZ5OgqNa7YQgbCRNzbzJcIRebKN6ZvD7gsVv2DaiuZulha
         WN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110573; x=1775715373;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPXcXgDL9LwDyWtOO4mR1I5ylhidkezebiRyWUGe/Dc=;
        b=jsyxyIgiCnLvtElrQq/EU2G96uVKhyHspDiLVT3115snwxX+jbBS/9ehqvBMXA4c8D
         D66TXUnBP5/LP11lwWNNg4pUcbNsJjJYbHNcCAC7fnvP4IsWg2kYMp9HJiiw/J/6UiYr
         wLLmHgADXVGybNDbrRv8vAkCDzdCXWXuNXY7rZW0Rk3gk2sXBl2Gh9IfqGAEI0in8aaw
         6T67u9tEE9RL8k+5UTaOCqiJdbtcjqgQXwhV4MoRVMFnZvMmZMWeEV0JXVHucBXAx4eW
         JWwLX/MEJGt5hqju1j4/12OFzeWpN+8KKmB/yUffNCJJCpUOxSDDaeRbicAwcn4zc1gi
         TCeg==
X-Forwarded-Encrypted: i=1; AJvYcCXUSoh0NO3e0w3rpADXaOTQj8Md7Cce27ni2gVcPv9fauLDB0TIqNvrhy1ZTlSkIdn10gNxBL5hO93zCcHY@vger.kernel.org
X-Gm-Message-State: AOJu0YxHxr67xZEv7w5KtRRKEvdNBv+0UrxzzEXmx/4BGLfXFD9PFzyL
	ZEp5/3UruIWEO1jl4DqwWSX50mGv8WSXplfuF2YsfhWU37VsIuusCkp9FezMTu79z75UnpVg+nr
	7iZNGBFBaxrNFzubZ4Vj2FwIpKNrhdqUAM7+wgcXI/ZDiz29pO1pa/Bt54Z1mEBcyViyRCAynYP
	yI
X-Gm-Gg: AeBDiesS2rOrxPAAOsevqp6jOfMsZ7MaHqnQTwzpRBuMDTCqmLaB0QQoCzANfUkyU02
	8euPlsj1eUwIQAFehYw9Xt1YYXLhQf3liE1sKZQHrkAF5yLpZNctIMuWT6XSjz111Ze6YDw8ibT
	B0TTGull/vQtyPbK9G0acL7CZeCmTmcELAZByysX7MPQpdSOBhmeanSw3IhQtgYl1byu/NzzWuX
	KiTjnikmRVz2+KRk2ec2VTcY2iJsZHIAH0IYdDUmRU+fS9LIMt/UGmS917EqMpZL4oZYYoKOd3b
	E+VzwqcVRACgXaLBae+2TuKjpjGJIrZHo+a3q0gms1wwI/rQHU9DtEY6tmr8s/kSofXykuNwhxS
	d06ICKWsYVvo+S6i4435PrjNK+NO0Vbam/PhPb6f4sYI/BIP9PW4q
X-Received: by 2002:a17:902:e785:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b269ae0363mr63090845ad.2.1775110572802;
        Wed, 01 Apr 2026 23:16:12 -0700 (PDT)
X-Received: by 2002:a17:902:e785:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b269ae0363mr63090645ad.2.1775110572384;
        Wed, 01 Apr 2026 23:16:12 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbc58sm16538615ad.78.2026.04.01.23.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 23:16:11 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/4] Add camera clock controller support on Glymur platform
Date: Thu, 02 Apr 2026 11:45:42 +0530
Message-Id: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI4JzmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwND3fScytzSovjkxNzkZN2UVCNDcxPTlCRTiyQloJaCotS0zAqwcdG
 xtbUACmE4v14AAAA=
X-Change-ID: 20260401-glymur_camcc-de21745db58b
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1MyBTYWx0ZWRfX3GqeuXawy4M5
 +hvJDQJuMY5hfk/oXQht4nSGDCEvCZhsB3BlPZLZM+XUTzcBr0kJtbzBr+twS5il+jKudsjKz1V
 j6h9qNq9ZRoMJAc7yTa8wYxfMx/hZwuxg74KNWrqesiRCaw1GR0si3f/kwM+D5BQTdcpILat8Nm
 oq+glr+Dn0VC8wCyONkARo9EtgawUtlA2u/kU+XEXz2GkFaLjJvXnpOHnrElfWsQY9vLJbQaM9A
 EViBYMfQdr/7JbUwZE/8szQUuATijqH/K7gl7nPeKwhy+BeF6NNpsWpXdIJBNLJL9ss4mOak+CA
 ekmW/FHDi/RftmPHVo79YQRVfLp07svOZNVpJiQiQhNwEM+HyCzCLDJUD/JxnOi6b4+hkNL0W60
 ykVoJdyrWD+dBOgNqAUUoHHSt2//ENiagKXBuLAxNeTv+ZvHNqqtD70xR3lE9MEIcKZLLuVSGGb
 ffxNTKx5yshhLqq228A==
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=69ce09ad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HjKqFMqo481W0hlq81sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: dJa4Xl0DfrTmRw0mcjS4Esvu4ByHKvfy
X-Proofpoint-GUID: dJa4Xl0DfrTmRw0mcjS4Esvu4ByHKvfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020053
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101430-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 42A8D3845E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (4):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support
      arm64: defconfig: Enable CAMCC driver on Qualcomm Glymur SoC

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   16 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 7 files changed, 2433 insertions(+)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-glymur_camcc-de21745db58b

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


