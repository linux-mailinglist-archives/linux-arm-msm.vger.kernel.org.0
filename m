Return-Path: <linux-arm-msm+bounces-107045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF7SHTrRAmoNxgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 09:05:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7330A51B72C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 09:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 347533003820
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 07:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73B9379C4A;
	Tue, 12 May 2026 07:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGKbzafZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etSLxejc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EAB3672A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 07:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569507; cv=none; b=F1ABQLYTToFOkvTixsbxQBGdjmXAPK+7ydbZBEbAlqlmxIhY6DNZzsbtfNy4+8yLACv3ZsRXam3kBvysEvaU9c/sn+6RD/ggwdzSs0s2RFGDjb5vZ/SS7R2hNaRbEvxGI8Fh+Jg03xxVFC7PpqpR1MED4bvgI6yHx3nId3iHFlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569507; c=relaxed/simple;
	bh=3uXfmbzUS9NvAeHKvCpU9UZ0aQY6rnUGZ81s5p69bMk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kCsJasRK6ydLCeZUbEtTgg6Z4D3MuT7508eNxPvndbdxM8Ce1AgN5eIrYGKWXD74f4aFdtreA9mldukvkUeYPiqUAWHItiNEiUZTpcVcwivRzQzDX8yADw1yCgPlgJzjy6gSpyijCUX7MPypm6sPljiVD72mkGgp7TI+kpWcM+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGKbzafZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etSLxejc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5Amxi2803828
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 07:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GRFzOTE5kNwfoKKeGN+Dum
	JgWdvZjhQApkuIRVwGXX4=; b=TGKbzafZK2g43npIgGUCAHdc9IUnHL1PNue4Kt
	O6mPOhaFH2SdOwnilvKW+GnvkXl1yg6OUGHQi3zEd9w+hyKB4SjBLqpSPhpF4iHA
	0DxXyqj8kQ9fhtyXagzQQACC5Q81y94Eovo27BrzmoU3YRhFrwjdvhWH8RV2iRn7
	POEQyY5Clu5Br1e4Ei8i+UvxolZoucrKA4N/luC9eTx/YTfiA+NEE0IyLALILxip
	0s6ps5/azuh1cH2YL9slEOeMXH6Dldt9gpEqS5qXXBMNKhNx86WecQOd7xsdW6jV
	pDo6LK6JHv8bwXP3wla7J9c9icpmNa49HBgMM/9nY0xJPpeA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv3a09s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 07:05:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7948640854so3108211a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 00:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778569501; x=1779174301; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GRFzOTE5kNwfoKKeGN+DumJgWdvZjhQApkuIRVwGXX4=;
        b=etSLxejcBl5JXSz44zLnIuL6tWOWzyp9THd+nqh+URo23qN5T3+aHY/yf0KHZrldI4
         C/ZrmoyMvS4EsSwb9/VtnGNVikiXAAiRxf505lWu997uFORCm3e1nTeBRAzIzgoMzD3I
         2oaRcuhOzNdd+QYxBs19Vr7Jg3SdmxCPfzLtWxvguZ9aEEYz25L9YNXwEN7w4bCIySAb
         tIU8U45JBOip2hl3OutVh/AVMeheFpeTLqj1U3IFCt8v+MnZURa2JIpmjOjAHMclaH5j
         iJB3TLHMKzpynqllE5MsxU5caC0gI+ttcxAY27ienhjn7mcOjFs8IGmYdzXoQyBEPu8C
         XStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569501; x=1779174301;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRFzOTE5kNwfoKKeGN+DumJgWdvZjhQApkuIRVwGXX4=;
        b=mhgMI/q2C6MwJMiCehgeYoYoR8MbPSznLFL/gDf0by2vSJnZO9tSxtAWCwoiEJAjDl
         7ya5cx2RId0VGjVgmZLVJQTNEkDaHGQjeqscTtfNSC0pgJyb39X/4MFtNyIaHAog6i6p
         rLdwrL0Ea/F80p6Maf+BSRL7rOPHEi/RMvxfqe8v3lAASPAWBcxlTOsh7ofhL0qoGUfD
         FYYmdsJTo+hM/RoJYMvEiQ8FRXW7V0umcbMSM1MDe1+i4hr3m6ruXXGc0+0sJjcdc8Nf
         J5haVVPlgt1iTG7Tb1FgJm4V9RdqyBsaeUJN53qelC4Gy+lD9ZqT6wWNpefPLZbk1IHj
         NV1A==
X-Gm-Message-State: AOJu0YwKiFXQqza8d6YW4stEO9ajmpN8TyyKz3J2lqqsSI4HdXuY631b
	AyYBc1jogPvjtub28MHUoqoQxICr2x44VyHYuWDMZhS+jUUZKbMgJuaNdTwMSwbfTOD9Ge0RXcX
	WqBbPi1HIcIwhc48ueLVMStNt8aYL9OZdEWhV7VjsnPSjnr8Aw2wWaFxvKM5zzkR6E+yU
X-Gm-Gg: Acq92OFQqek9US2ZAMROHVWnSJhGnG8JS3E1tSzfOY8tmpC3XGedNzFF3TGWA4qVb4v
	jTHvfPfYzXXlmb7UiptO7XTLLXetc3YfUlm7uayQ1/MTDdfxp5Lhy+BrvHSWIn+quTUqZ/2RvCd
	J+aeKNlWi8dJJpfU+0mCrnNxQi+JRiwL+ixgc9oilQIbyCijZZaajvohzSDtc/PtXQLgtRlMV7z
	+kB36vXqkAw0eKSMUaKThnUtW92TIxRpKckleNujvsnvG9VM3K75XgjNWbRJO2PwgVSfof8qa6P
	Lo3XO7hS3BLXk8QXMp5QHFh6izeCUk+3bX+DFeW8b04DJvZh1ss7P4aCrjvVLd7WB5N7T4li4RC
	f9V3KEKcoWN90i3SgQf63G6HFYhVDfQ8JDwYX8SXhi81oOxWkvAdjJGUb6lqK3ItAnfwGTeTnSu
	y+fj70VDhlg+RCe/K27KckEUJOjWxXMfA8Ot600s7CW59pKyyOGJ5xHdYT
X-Received: by 2002:a05:6a20:4320:b0:39f:2dd0:65d5 with SMTP id adf61e73a8af0-3aa5aa7a038mr29162292637.39.1778569501142;
        Tue, 12 May 2026 00:05:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:4320:b0:39f:2dd0:65d5 with SMTP id adf61e73a8af0-3aa5aa7a038mr29162258637.39.1778569500567;
        Tue, 12 May 2026 00:05:00 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267711b21sm11354488a12.15.2026.05.12.00.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:05:00 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add the SMMU and the downlod mode support for
 Qualcomm's IPQ9650 SoC.
Date: Tue, 12 May 2026 12:34:53 +0530
Message-Id: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABXRAmoC/22P0Y6DIBBFf8XwvCYDCIK/smmMwNCyqWIBzSZN/
 33d1th92Meb3HPPzJ1kTAEz6ao7SbiGHOK0BfpREXsZpjPWwW2ZMGASBGV1mG9aCujHmLB3uPZ
 5meeYSm1kw6U2FpUyZMPnhD58P6c/T6+cF/OFtvzu7Y2Et2Vzllftreyqp5BzOIQmxtKX2OcLX
 q81FRpY60SjrO3Whvy9d4cFpQdcbE69CZML07luwUkptADvfLfS/9n3p3kcl4Pl0lkQjmslYWf
 NkLG2cRxD6SrUyjFqaQsGqHPouZQeGDfGWy8NpwK0HxQnp8fjBwtSmMh9AQAA
X-Change-ID: 20260512-ipq9650_more_dev_support-b64369bce88b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778569496; l=1168;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=3uXfmbzUS9NvAeHKvCpU9UZ0aQY6rnUGZ81s5p69bMk=;
 b=3bDTcz8pVwr3q6uSpG6dAlW0GjKmjnV6MKvQSZ+VzRuZsPFcGot1BSAOAJ0/rswTacByI8RKW
 UZia2q5QxW5CwTLUCBIXnZ9FJwr87tV93dFcrgLUqCQbVgJNVBhNykb
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NyBTYWx0ZWRfX9TzL29HDhomV
 nBs0om9BCXqox3gHaB882PQwH24b8x036bGdJ1sq065O3oPxxLOuMusufMVK3/lCXd0VRiqrSI/
 FrQ3zzLjaU3ZBuyh6k7Xckm4PAemi1TYK/ysPUmWC4IhIk9iwCMmjJHdSnkhDoKlJfGkowJNbm7
 rw/C/DVlWxDyz9Rj7c8YqImmddgtxxJwayDyPCq0bAweknebRktEjviR/p2CDKUAUt9rMWjWMzl
 e9lg2H6ZDnk+VKwMwlt50G1z06R46vh8krSpivHVkVggmiFFUj17txqUZuBS3O2yRlYQ5nn6pDL
 21DIqUK/5zozh+t2TJYlpcAbVOJkYDRKUSEH0DU0L4FZy5nsHSr1spb/u2fYX7HuoMmkOIKZOGp
 t6QCvbydvHRh3JSOM30YiZBjMFGL/x5mjkQK6U2nqmagtE7Frq+UzgkIi3ZSRDrBSjWr2XAi7u7
 XrRjKszbI9z+hyXOONQ==
X-Authority-Analysis: v=2.4 cv=Kvp9H2WN c=1 sm=1 tr=0 ts=6a02d11e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=_3c_48eCv6knbha3:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=S4QRGENoijvoE2MVpVEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: JagufcQQbxJ3Q4RtBCNyCX3X81gOmePv
X-Proofpoint-GUID: JagufcQQbxJ3Q4RtBCNyCX3X81gOmePv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120067
X-Rspamd-Queue-Id: 7330A51B72C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107045-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      arm64: dts: qcom: ipq9650: add the SMMU device
      arm64: dts: qcom: ipq9650: add the download mode support

 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-ipq9650_more_dev_support-b64369bce88b
prerequisite-change-id: 20260330-ipq9650_boot_to_shell-159027d548cc:v4
prerequisite-patch-id: 16dd91c965e8c4e4c9da7c077f5f6e5f56624149
prerequisite-patch-id: c74b31333eccd4eba783b927b7eb0bdae27ec576
prerequisite-patch-id: 940367fceba083009275adfbf26cec848e676915
prerequisite-patch-id: d00248eca6cd1203ab16aed75a6932581d90321b
prerequisite-change-id: 20260511-ipq9650_tcsr_binding-70d665950fdf:v1
prerequisite-patch-id: 12a6b83739dd22ca8a25507dced2e56e5cd2fe4e
prerequisite-change-id: 20260512-ipq9650_smmu_binding-36dc05d39860:v1
prerequisite-patch-id: 92f58d1b58fd36313dd488d024e7deb95fc35ce7

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


