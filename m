Return-Path: <linux-arm-msm+bounces-112418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5Oa0Js1KKWrOTwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:30:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9893E668CFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:30:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Gdl+QQck;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ji0WEdwk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112418-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112418-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3BFB630D93CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E48C3E3D94;
	Wed, 10 Jun 2026 11:16:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49345392824
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:16:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090191; cv=none; b=V4BKRtHHFU7BZxENmgh/MGj20OA2V9Gtj8xLyj6mlpFaX2G+/RHAXenXH3/GLJfJHD5dB3R0OhxrPwZcZ+zimp1cb2C3hksxOSHa+Lhp0/iUa9yg793NpaLw6egf6AmWElyNZoBTZoPgsy6zc0q0Dlc8Cl0Jh1rcdQsg/OMBFAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090191; c=relaxed/simple;
	bh=4WDV5seCuPIA18LhoD+gkqw7LhceSzkXx6aeBeoVft4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kHE7VNE/gJrvyOunR1CUfloje9s6Vk8jCABxIR2zOt9sRPnVmdP6UZgJB6VZFBwkqdm2EL0pMDoGtuhzR99HFHHge8K7W8GRI/ieD4/Gee714Ptf6lozNu1uEclc3K6Zq21dp5/hRcLD7meevRm/cVUIwyTQCrvhjec3vn6oY5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gdl+QQck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ji0WEdwk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hx2V990993
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UKEhKACBQ+XYELhW5r0yrk
	+kReOQiMsbSr6+zXFb6DA=; b=Gdl+QQckbvPoEslLSIkqylF0roChBdwwyquc0s
	BWjb8uEfCjagg+xvYyh5w2ikjY0+Uy5kLDLPKy7USqDxcwJUEGM9vF9f4FmSaFib
	rdxb/lVhBv4Y0P6BnonE4s7Cazybfy3lazWA243Cr9Y8T/j6jswSQ8Bl/0b/SlDN
	ohjn1MlXilfTi/8Qgg87lSkYpOKg5xlCDxwIzDvFoXN8K5LYVtgKTALvBA51OJQn
	IfjRRsAE+rc2M8+2D3V8qKMnmGeDsImE+UumtdHbNHSe7No3haOA9611sWLR9KWX
	DYg3aYeY5ea+GVzO+OKKjo83MY8yJwu+wmFfCFT5ysR8EmfA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg1atx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:16:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c858e0cbca3so3512580a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090184; x=1781694984; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UKEhKACBQ+XYELhW5r0yrk+kReOQiMsbSr6+zXFb6DA=;
        b=ji0WEdwkmnkCxiQKwosC9VZLvnCJW5Tl1ZLYnmQlFFfk9xVzmk24G6wlgG5dCalSvf
         ZOmkV7wq9DaukBK8rsiO99gHjs0RULOQffyq7X+jparzAmZNxyTgAojA/2x2d1Q6Pqv3
         VHR1rWbXN0XnHblTQ8t3er1UOROWtr1p/8yggBazTBbDgPuWf+ESvcs+UfPokINq9+2Q
         Ozk7MDgjMRzGBGi1MKbIcoBp3icTR6UafSLcznHyOR3oZ/P0VckPJSp/7bONVMMghVlM
         n0Bk9AuCiibV8HcIz8x4bTP6wgKHNMormNvK2JvqZn1adK82SsdouVgD1Sa+/8t648xB
         ky3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090184; x=1781694984;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKEhKACBQ+XYELhW5r0yrk+kReOQiMsbSr6+zXFb6DA=;
        b=KHgRrfC2VENk5ky2LV0bo2lMkkRvI9zBt8+TJAA7K+I2CB/ozzw8suEeMQarapc7mC
         v2RguzGbIWEO9fVKkl9VIa97sJ0p+duq/x+7qY4RER75CVT1c2ESsGbRPaoYx7mJDHUr
         y6xxEZfWX5oEoQsJsrj/J/w2KkYRNtA9qWJWwrZQIbvcWhTsK2AAwpwUXblqptJCUYvb
         8hjr8iOCHonDaFfHplgKrkHPCRGTYzRgCcexK2vRwJO8I0Omr30U4Om3xCykY1/Lb+/q
         cEWsUvShN0WqmkVrww1o6dFjDFFeogfq2Xy0pKKJnKIICKjVmBHWhrzva4SDhN+lEeKi
         Kc6A==
X-Gm-Message-State: AOJu0Yz7loZj88AHaBUB3rD5wojz97IyMqXdRaWIhF8VAVrPjXM3lUmW
	TSggpyp3ODHfG/8sMj3AGuD4CSoT07YRRqIoeYHfbeFnyCtdJV+3pFUP9icVLq1UG842wKtZdz0
	vhOZZM1OCuOM0/RszCjDHIez/wlTGMg3AKK8arWDnT3osik5TIxjQtA8Ifx2mRKImLFMl
X-Gm-Gg: Acq92OGApBeo++6qaNVUJxe5p6TmFlTHcb4jPdlpMfAnAMd+sN0BEkwLrS3EfXd0gWX
	NgEQL7FgqPG2R+WDOGgCCcwEdmutl5sAg6xQD0hjqEmqZ/u7eh0fqoCiFOjPqDuUvIOic2hyy+f
	V/DZ3ocrjEIVS5Fb34ehdhE4M/Xx9xeU2V4fw+08b8vcxkQomdyU0KaUsOz7XvhuNy7lcCsD+KL
	NWQ5z7g9nGRuaSlQyJVZBv4E3Kli6acIbt2p2Atvj5WYFDoLwjLflOfDjbFWUQsegkfcsEI0k4L
	vzEHD5Xjus1AfL1KXTtpHTbrqB4X7lSUi1VOExAVKLIVLO2g093LsB90Nj44HcUQej/RjbUrkM/
	Sj5UgSRJ0PByy9TcmlvCqfaKZwoCjg0dKm2Ep7ZU0VEvHpPAsprDVX8mSQQ8LGZzg0Zq7AxQqs2
	252ZNrLNJA46FQISUy0QHZc12w3bolgnn+/qOV8NoS6MlVuzXrjKo1B2GijpaEmw==
X-Received: by 2002:a05:6a21:6007:b0:3b3:1b38:d9c3 with SMTP id adf61e73a8af0-3b4ccd1f39emr29940024637.4.1781090183651;
        Wed, 10 Jun 2026 04:16:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:6007:b0:3b3:1b38:d9c3 with SMTP id adf61e73a8af0-3b4ccd1f39emr29939985637.4.1781090183250;
        Wed, 10 Jun 2026 04:16:23 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03498csm23896099a12.1.2026.06.10.04.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:16:22 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Enable the QMP PCIe PHY present in Qualcomm ipq5210
 SoC
Date: Wed, 10 Jun 2026 16:46:07 +0530
Message-Id: <20260610-pcie-phy-v3-0-334011b378d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdHKWoC/2WPy26DMBBFfwV5XUdjD/jBKv9RZWEGu4zUBLAJa
 hTx7yVkU6mbkc7o6j6eosTMsYi2eoocVy483nbAj0rQEG5fUXK/s9CgDRjwciKOchoe0vtEyas
 AOvVil085Jv45rD4vb85xvu+Oy/spulCipPF65aWtgrMWbY0NpaCwTp56IuNNFxAc2Mb3UFOyW
 vxt0lZHj0bVkokkT3OjFUgIHWDCgNFhuyrxih+4LGN+HMNWfeT/37BqCdJhRw6i9SmY81jKab6
 H71fN037EZdu2XycCpfMmAQAA
X-Change-ID: 20260609-pcie-phy-99fcf91a02fd
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 5hCRbtYw9VCBDsOVEAISneBfbwXROvru
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a294788 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tBHTsUc4uvt9YXz8l1EA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfX8oG9ot4j8JMF
 ryKkqtEv2Ol10Ck/doAMtMFgwm+XohtvOx2CvUEx+7h2Bab5kTW1Sr14yxFCvNwkHC8pXGvNode
 /q1QQDj4CBeyCC657CUO4k34B4RT3Qvl5PFkiv+/H49pWvSYT1YFBU412ASDx0WV6kgKqUX3Ny/
 mWUyWVDO22UZ+7dyQEqy6FecP5l7vl5xZwv3rDLnMFNphVFkUwERGomD8of6MaTfrsYqpHLN7gF
 w6GpKcAoOFdJFmspq8JQHzyO7nmGFllgqICR/GUWUR+kFCma2j3CYpz6GN0Vc5l7GpooNW5R09g
 S/iqUplzKXq5J1lAOAJzlSvG8F1BmItFA867oRL0DQ/ac1GZhQ3MnLmWkhjg5hwAmwEyShrypGM
 ILByCp4pOenzLO7waAqNZKJ2t+BFmdY7oyZCbdkyxR8POVq7Bjxck2lgCZQr6a3sOTCAHfJ1rW4
 3vfveDRrxxydPJ907ow==
X-Proofpoint-ORIG-GUID: 5hCRbtYw9VCBDsOVEAISneBfbwXROvru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112418-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9893E668CFB

Document the bindings and update the driver to support
the PCIe phy present in Qualcomm ipq5210 SoC.

v3: Fix commit message for the bindings patch
    Remove unused tables from the phy driver (ipq5210_gen3x1_pcie_ep_tx_tbl
    and ipq5210_gen3x1_pcie_ep_pcs_tbl)

v2: https://lore.kernel.org/r/20260609-pcie-phy-v2-0-83bc80e79fa6@oss.qualcomm.com
    Had incorrectly made both the phys as fallback. The single
    lane phy is standalone and double lane uses ipq9574 as
    fallback.

v1: https://lore.kernel.org/linux-arm-msm/20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the ipq5210 QMP PCIe PHY
      phy: qcom-qmp-pcie: Add support for ipq5210 PCIe phys

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 129 +++++++++++++++++++++
 2 files changed, 131 insertions(+)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-pcie-phy-99fcf91a02fd
prerequisite-change-id: 20260514-icc-ipq5210-0ab03f3a3e83:v1
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


