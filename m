Return-Path: <linux-arm-msm+bounces-90307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MaKITpAc2mWtwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:32:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7775573691
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E76F5300D24D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 09:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCF935DCFD;
	Fri, 23 Jan 2026 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GUyuQBKB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRt+xBbm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F0361668
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160715; cv=none; b=Kq264XrBycCXVIeSrMNrcVktJzwn927tvaXSd0ebBNDFMG/DcWbMfta/VRajoNLLELe8ctO5WnvLucBIJFipdqZIEFe9yqbjI7iyee1ojm5Ruymp0ne+fi6+uV0AFHSiN5VK56lxN3+yej68UPo87isoga4mIav9nVffUt1WsXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160715; c=relaxed/simple;
	bh=LAdtpN1rCikqAOAR5EK+0Wp5HeQ/8qzoaZ/iaXhGfFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V9kuKlRFUslErgyo9ABUE73O59bavxPg8CRHNQbJEYFLl588rIfl/s/6PyqA32cu9ZheW+bF2O/RS+J+IiYoGXDEgIElMUSuX7iRih5CF+1GwONHRBQlMgh2/0VM7jP45SRr6MyEqtErWLXoa9Cz1yKmnZOGHW71xwa7TYdLa5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GUyuQBKB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRt+xBbm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6pTNc2908962
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 09:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	26CDK72HEOnmUsZ1CXy1/05/oLpi5raMr9WBDPBMZ7k=; b=GUyuQBKBtsywwiSU
	R1OwPXA81vidDquGqqc28No1zzt67cVhsgBYp2pCqS9pfqgkULNner+r+hB817tG
	EYcSBfrlnwB49/42tOhjioOI+F64teuAOEUVcNI10lgBcw3D2oAxFfdxtxgz7SfN
	uYKcMGab6GlKl9wD5NgmD58lb179KAkvVMcLRX1gTjkK9+3PNUVzcs7z/J3jaIZg
	sjxjwF3FLLRhGB/vjiCA0YFJzM3cXV4xxATTVthnybzHIySwKD0LPRdYuzNwnLVM
	V2nR/ELYU3+1GXzsarPhdbq++Q0Cy1lWqFZYsgEJEIBRTD5ihz5rPOaSoAVge8ge
	6qs6Qg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buvs1t199-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 09:31:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a5bc8c43so552257185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 01:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769160702; x=1769765502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26CDK72HEOnmUsZ1CXy1/05/oLpi5raMr9WBDPBMZ7k=;
        b=cRt+xBbm3pM1SRIk9kYNM1W9X/WSF/Ury95PMCX1O1OCV+EW1M5h+A1QoRBlYstQGQ
         9yL7USz/IdZvi+wn70+of4uApJdIt7zF1ceKWh30fbo3PDjotcW60BPo3/wShGvq3GGR
         n6exb+hpXk59oJCu3SJBAlzyw3nZVcUkjcDSH/AsQk/CfT7V0De17OuCA4plNOeKTWVb
         gHo3Fl9CXetlsymKsQQUP6CbTx3EuuOr/7ciJfUh2t6+KBtwPPq4PxzihtZJNJVX/dW5
         W2OPr65bk0YKbxuefxv3VmxfuyDwem3eVrqu7z3pTRIbWCMSPwCSdpR2yofD4UvEnhwE
         EELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769160702; x=1769765502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26CDK72HEOnmUsZ1CXy1/05/oLpi5raMr9WBDPBMZ7k=;
        b=Kxwf0Jeidubi0ay3J6RNPC51McgmLY6EQDap3vx1J3bSySzfJVrngrjPi/Mn4pNIUu
         Cso+qTfjlFYzb1vbh3a1EFhmCd1iHOMz4oexm5/+reDThXkAc5bA9GyYDwhSw9NMccEM
         vZslY1OQiueC+MeAs0jLNnjjSgoRKKgTxpMMRC+acj/zsCyGzC7Uv9rj3spqkdZ+j5Pd
         hGSUNCv2p/RmWpAWFdDh2hOuzechNNrTUN/yFAicu8NwMHprCnLZn7iA79JnmnYsUJ3P
         kzM/9uH71GcNJAtfR+asF27OjCZu/i2qHRw0Wk/DTt1XVlSvdGn6WiwPe8sqeS5bFo/n
         /ELA==
X-Forwarded-Encrypted: i=1; AJvYcCVyZYtuUXYCfwhbr2C029ZWB3ljUd03nhfc+jFJojWhafXXqieslJ6AckFsL1ClIKblfz7QN/nRZZLdaVGu@vger.kernel.org
X-Gm-Message-State: AOJu0YyI+NpOcKKO4KELu2HRku0HAfh4Iix3qk8uDXTk2fPJDruUdlFU
	i1PGiOG44ZLphFHTbtvlLobL3eqnYyEeGgAytpti0JKgfofUbtBj+VQwAmEaBlnZPTK5CUNrSnA
	qpeX30WkkxhiMO5sLuIKHUvcGz4ydkcbixLMl7xR6o7rMcadXeRcXo1UOUJ8OWJQ4Ihvp
X-Gm-Gg: AZuq6aKSr809gqwhkfX2zqKhoYVMNDer91F6LdndSIPtthP1uBVv1mG93sChcVZA8Zp
	Y3/D+pz/OAgA+Ir6RvKJkPoauu1ByTvou2PkyGZbbDEd9pRDmU1ddQ/WNZm2cecuI+v4EhuYinV
	Y3Lagav1f8J7++zrZ2Q8YYc8UDyrHP5bjQa8177N9GSQmlDWOpbjIlNQYPW9sYwokbkTtRJ1dK7
	95SpjB71iV3Yz5GfUT/EbybEpDjtY3RMcudjrK6KYMSPhpVSHCC3cMM1DeGz1xx+gNcbFi1vefh
	PQ59mu5UnZJHcv6sUD4FORTJaPDSpQFiJ+P4bSGpI1OiK2szF7bdghvl4HZ47VAU61nWGgBli9K
	dm0NoueDECokM7UpNZ09K6ghKlnJ4khXTNB5zjx4=
X-Received: by 2002:a05:620a:2a01:b0:8c6:b001:c1d5 with SMTP id af79cd13be357-8c6e910a7dcmr53105985a.5.1769160701652;
        Fri, 23 Jan 2026 01:31:41 -0800 (PST)
X-Received: by 2002:a05:620a:2a01:b0:8c6:b001:c1d5 with SMTP id af79cd13be357-8c6e910a7dcmr53103085a.5.1769160701228;
        Fri, 23 Jan 2026 01:31:41 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1c86:c19d:d843:dd83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c30293sm5717115f8f.19.2026.01.23.01.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:31:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-ide@vger.kernel.org,
        Frank Li <Frank.Li@nxp.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: (subset) [PATCH v6 0/4] PCI: Add initial support for handling PCIe M.2 connectors in devicetree
Date: Fri, 23 Jan 2026 10:31:38 +0100
Message-ID: <176916069326.12678.16550242235025273411.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260122-pci-m2-v6-0-575da9f97239@oss.qualcomm.com>
References: <20260122-pci-m2-v6-0-575da9f97239@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TyRse7XFLTVvOPOwYPxT5l3nAqqCyXWY
X-Proofpoint-ORIG-GUID: TyRse7XFLTVvOPOwYPxT5l3nAqqCyXWY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA3NSBTYWx0ZWRfX/zzJ+ebmAEDw
 a1EYpF3T7yJ895XG7mg7OgMtxZ419HaZaI99Q3VkBY91jPTOY1WaRpG+gEEHPc/onXtDQZ82zeR
 KmkPw1ga6kv6t98oUohwofuvCkQC7VFLSOfghHCzMmGwiQp8Fd/Pg9gcMXNgBS8fNi68/iOtF8z
 QY1xk37C79Rv31242CScBdjZ4o/sGM1DBMwoKtpevN+2U7NHLgnuPpcbsUmeJxXYa4z5QEtbz+G
 onD03MAP/1dfGeb0chP28qcP7FmT9Jd46h/bIDsEGkack8n4mHglXNrrPHlCul4Sok8gQqSznL3
 HUHyj2CME8cnlU+58j5rdKLLDMELs8VJavQwTuXX211g3G6tLtNEIjFWUmQIzKsPNI4CKr/n0ba
 k2uoBNFtnUCxfr/IAmQ68ukgwJyRVr3aGJZBtAxhnmrMUd3g+u+0G+ZRKAECUtjUBvYMW+AwFYl
 4d3+cgTLhncShnC9AwA==
X-Authority-Analysis: v=2.4 cv=faSgCkQF c=1 sm=1 tr=0 ts=69733ffe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JrKmLYXSX60uSqAbQrQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90307-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7775573691
X-Rspamd-Action: no action


On Thu, 22 Jan 2026 22:46:50 +0530, Manivannan Sadhasivam wrote:
> This series is an initial attempt to support the PCIe M.2 connectors in the
> kernel and devicetree binding. The PCIe M.2 connectors as defined in the PCI
> Express M.2 Specification are widely used in Notebooks/Tablet form factors (even
> in PCs). On the ACPI platforms, power to these connectors are mostly handled by
> the firmware/BIOS and the kernel never bothered to directly power manage them as
> like other PCIe connectors. But on the devicetree platforms, the kernel needs to
> power manage these connectors with the help of the devicetree description. But
> so far, there is no proper representation of the M.2 connectors in devicetree
> binding. This forced the developers to fake the M.2 connectors as PMU nodes [1]
> and fixed regulators in devicetree.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: connector: Add PCIe M.2 Mechanical Key M connector
      commit: 926194a6675a9cd5943f85820508648b74669fc6
[4/4] power: sequencing: Add the Power Sequencing driver for the PCIe M.2 connectors
      commit: 52e7b5bd62bab3851f25d8b70ad7eae9e94aba60

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

