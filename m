Return-Path: <linux-arm-msm+bounces-107791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UF8nH9X5BmpUpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:47:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE854DA50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8EFE3000FE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CDF4611CF;
	Fri, 15 May 2026 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jysB++YI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grulyFCs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FBB4657DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841992; cv=none; b=mRP2Y6ks9CStSk6jO+NKnXNYJZDo6pi8peaaOtmsqFO60dCSky/W+3a6CTmbcOuBECNc/VEyS9I6YqfbUMdJp0T7eeP9Am1tIx4Bg7rql6lsPn51o66wzNRgpkyGpnd5pQNs0ye5zCEwr7GFrdekrUETREVV+xX0kkMqYtfzGK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841992; c=relaxed/simple;
	bh=wMUv2/vsDA9bEMUw/tVu9wXRo/rcLzGAUiB5vdQjm/Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tj+D3LoypX/xB0brzouTsEpDJ8xaeCZgsitsj2nHukoT/tJujmqkw3+/zCbYVVxwl6WC1KwN0wl34aPpWmAb9hcloNf+j9Uq6AKnwLFe5ipgwQz7QzzqzbV52gxl4TQ8e2Fdde44oAQ3rLuaNULmbx8jOCK5+rbjWGOijYCkgmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jysB++YI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grulyFCs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5VYmr3200085
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XBHTerfjmV+1YAC6GpRFKu
	v6kE7wy/lSovkWyzSWvKQ=; b=jysB++YIDrt78BuRdhn8gRSmZRBLVioHkiYKYE
	da1/34YsCzJ9Gg4SrzmvB/8XDR+FXfL/4U4z5o+ysE2EHApV1ZPBKBQsgmNQ9Pbh
	ZaCNVjHdrpA9wpHCXmCpvpxXifUct9eS3rlFJex8BszS7qSK94SCbj40SvlQqdzl
	nOjaydbNxf4RS6xUcAniHaaW7opkEBCdngx0XJTSjJTsYJv16qc3cFC3Dc85f2Vd
	cEjC1tCJILuzD1dVF/Ddmxc+W7jkQMM41RqQmkbzugSVdS0HDFLRYhAsRpXBkT4V
	FfOKClBIdY0O7XNKHacrnPdl6JR6o2gnn8M1krFBXxKo1l8A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtunn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:46:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9fe2d6793so168048545ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841989; x=1779446789; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBHTerfjmV+1YAC6GpRFKuv6kE7wy/lSovkWyzSWvKQ=;
        b=grulyFCsOm5L+H5LU8GaP1MpuKTTSTfOt4k81TKs0ihm5P2HW1BddZ+ipHFrOY747+
         LczWxdBJrVllrfwZsPh7uBa9qUDLlKT1vXhAC6xkaPiLEYjz1xR9Fg2CNMlmS424KFi3
         JQ8t5Zamej+jxJkQaiYrkgL68RKeKksSJw0kZG94U+dpPhHY2Js+6T+wWv5o/Yzb/cL3
         FpG4Sghi6L8uvIHQgKCiTyiNHnrW050gl/AVQw0olV//LUvQe+roDTEaX5YLqbUMwLfK
         kbKF4peC3FjzHeFu8Wu6dQvEBOhQDfF60F+RNfHOxjI/6JCL6D/jy57cpsV3EC4ixyvI
         45Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841989; x=1779446789;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBHTerfjmV+1YAC6GpRFKuv6kE7wy/lSovkWyzSWvKQ=;
        b=bkD+xdyUHE3xNP2w+WNOUq2idrFWT6K7Og1O4wzmOPpJ9DNZzjNo6QD61FUyLr5Aus
         5TY/QG++4q/y54Jle9w3uFim3OfIZ5RCyhumk1hrI2K2bYv9aUZHWB5EkHpSOTRFrdnW
         x2QxsDwdZNacnWD5dlled4tQcFLd4ZHSwKI1DA1e8c1uLFP5EFIkrZ5RYV9O3+ygUBz1
         MhaPrjg+4Lem7F3I8sEoWTQErv/Nm7t0VqhMUGgzLRxLW4KBDdLuhWzyt20DUbNBNHiX
         DefbzTOBuK9/D+VIz5vrCfYgzrZthPxawdsYaGncId2/wanKKRwntssA86nxh7DHr3ja
         gu2w==
X-Gm-Message-State: AOJu0Yyfxpc9oxRx/m9SSMomFrxK1C5TUzvSLxq82y/uP+dkv38/W3rs
	oIrnewD9padBqnTu7VfjlMFmXtTDKZeFyQMV5TaLqJKcPWrwehdX6L0eNhMBBoF2LhZbON8SeAG
	k6M5/dlMwH8/ck64jEzLPbIMbhk9Br5qJbVG0OvnvRlp6QCaum9B3ba6USFell5RA2wI0
X-Gm-Gg: Acq92OFx9e+Fn3zjmK0twcjafyfd5WwuLbXlQ/smzfRAX5Ec+mnIGr/DBHJCg9Fg/jg
	F0Pb+FLfyXrNcH7JG3XMbgFfgPm6AXO2nXyqb9aWAHruub01mvxRkc9IsuWXESjbf84IQDEXiGP
	N/OVsVtNF/8aiI6mul1OgcjNwn53URRy9By0luKjIXrJPbXHVyutpW/zj+19Dyfjf26J6DsOU4u
	FADKIKiNDc45nIm5iSzz0qC6kVt9B537GkSJT93ylPL9V6thzJy3g9KrmuhObZ6JSRr6NodpIOB
	PQi48eNGI9IfVfUBz8iAkFPCg9xTN/C/YURVRFxw7uzRlOd6im9aMZ9tS2u5fOQOX27N10OzmcS
	vzkzCHAuArJg9Kth9Xno9qT7Qiwhr60GiyFkyfLNzGoPmQl7XsMqecnw=
X-Received: by 2002:a17:902:ca93:b0:2bc:eea4:83c3 with SMTP id d9443c01a7336-2bd7e87d79emr27810775ad.25.1778841989501;
        Fri, 15 May 2026 03:46:29 -0700 (PDT)
X-Received: by 2002:a17:902:ca93:b0:2bc:eea4:83c3 with SMTP id d9443c01a7336-2bd7e87d79emr27810405ad.25.1778841989051;
        Fri, 15 May 2026 03:46:29 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2dcsm55839755ad.13.2026.05.15.03.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:46:28 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add support for ice sdhc on shikra
Date: Fri, 15 May 2026 16:16:02 +0530
Message-Id: <20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGv5BmoC/12NQQ6CMBREr0K6tqQtFMWV9zCElPKRr0K1H4iGc
 HcLxo2bSV4y82ZmBB6B2DGamYcJCV0fQO0iZlvTX4BjHZgpoTKhZcKpxZs3JVoox4a4zmthUgV
 JelAsjB4eGnxtwnPxZRqrK9hhtayNFmlw/r09TnLt/eT6Xz5JLnglq8xCvRda5ydHFD9Hc7eu6
 +IQrFiW5QM7aBYzxQAAAA==
X-Change-ID: 20260513-shikra_ice_ufs-59d0a42e3482
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06f986 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=GDFvtG6j3FZufZSdgfMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: bPiIlYpgRiD_VuiwFcfSlvoDZsRWcAdQ
X-Proofpoint-ORIG-GUID: bPiIlYpgRiD_VuiwFcfSlvoDZsRWcAdQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX748QO1fkdRLt
 10yJ7ztM26LDewa1qM8QOAPpOmQaFfsMK8GPYUgKQnTH6X4DrkGOKHBcssEOYEeafem4HZDG4VD
 FKHQrnh4FPj/nR34CmUDpos/6EZVcuJ88s2CmVMPfOwEykKmUpOYHjXNLttigcWI9jDXX5cRT7e
 dgqIo77UxWhaQAvBkxfBBqAIeP+8gUmDdsWZyFQalIatsUc/ytMZC3JpXhyEz2IbEHuNylee9XR
 yqrKQwmna0tHzqDal8O1AFpxiOgL/XC133+pmOZ8YM0+nU0gKHYdVoCGEDsI8UThbrkdvkzVO5+
 yKsHZwPMYL0KVishIqJil9ItG0ZFwhNGfevez4bo9OyRYdeBUV7Ck4vVd1jr9Zma/mwT6KDN2aK
 HPsnSuD/A2HHDyo+7jz5ossnys3EX6SzsRVdyii2XuKKbv5Ft7nJdqjgbHPLHKeR/lVpM0rYO/g
 RxU2uIltGHOfU7TUeMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: 21FE854DA50
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107791-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This patchseries attempt to enable ice sdhc on shikra similar to other
platforms.

Validations: 
- Driver probe on bootup.

Dependency on:
- https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/
- https://lore.kernel.org/linux-arm-msm/20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com/

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v2:
- Reword commit message for patch 2/2 and cover letter.
- Link to v1: https://patch.msgid.link/20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com

---
Kuldeep Singh (2):
      dt-bindings: crypto: qcom,inline-crypto-engine: Document Shikra ICE
      arm64: dts: qcom: shikra: Enable ice support for SDHC

 .../bindings/crypto/qcom,inline-crypto-engine.yaml           |  1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi                         | 12 ++++++++++++
 2 files changed, 13 insertions(+)
---
base-commit: 7e247866bbe72314f68036d5171c1af354ccdbe8
change-id: 20260513-shikra_ice_ufs-59d0a42e3482

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


