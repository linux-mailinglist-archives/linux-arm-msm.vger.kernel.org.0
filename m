Return-Path: <linux-arm-msm+bounces-102310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGfNKBoo1mnqBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:04:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F41B3BA3EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F288300DCE8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 10:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783283B637E;
	Wed,  8 Apr 2026 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5a+CiVG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsAW3peb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0503A1698
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642635; cv=none; b=JQydU/y04d5F6cR1f9uT82VJSH7sGapNLhDT/aKgXb89BOsviaMGCNc/soWXyKFwOWk3aORKLwJAWFM4mpV4QNzmMCTni85WtY9jc7JTrBk8z81mF3uTJ1kOFhqML4IDX04UlxeUH05J7D8RvrYOCheaksqYt+pEMN9loqf30TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642635; c=relaxed/simple;
	bh=k94qEoqP6LeaqMjZ56JkwcDL9Caxb++/1ywGR2aNrcE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KO/MfFgMSbjPbMl0dn6OJ5kVvjpyOdV7i9lU8lPzCicfjVrU9JJ56X06qKiea+xYKeL1AkQefkQNF1UNkssXQIKMsTUqzOyvyP5Ngt+jYn+zhXFxZUx1FBESOb8PkLKZ/kgkyzwgWijD8gHgXVBQywAalQ5T6wejlYow2dWthOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5a+CiVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsAW3peb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387jcwN1259362
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 10:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7S+jIsI8IolI8S/0NzS+SU
	gTDKQIENCfMEWeyQ17RZs=; b=E5a+CiVGxDzyfBjpQZeW+h8coO6mDpkw3C4VLr
	Il7IruwRRyGVifBF2tWEIh0RITVBUh7wynkqqBDiu0qvVthDXizphb40Z0fXg7l1
	4ePD+LWpuMLVmio17YTK1QVRNMPOyHYbMWFwoed9dZ4dSV6Mg9UfbYAstBHh0LrC
	ZcRfFoLo3Ctd4aDMK0HXfG7wz4TO1bUEzKb0WISeGCY/qyVcs8KZiv5bhjTW+QUi
	MjqFoHQ/Aq+Lu9LM0xUn0dFnnR/PTKUZzQwF1+yIbkQFbo36+N0foO3Q1elT13BM
	ppen4soBoDXUil18hOzE/8lDj63ocv022uBlYiZUp66jejBA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttt0qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 10:03:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76fe944e6fso2183402a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 03:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642623; x=1776247423; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7S+jIsI8IolI8S/0NzS+SUgTDKQIENCfMEWeyQ17RZs=;
        b=WsAW3pebq2PHl8lUA6Rep2AMMJvNex+3AhplJiFVEOWNTE518MRge/hAYnS0kzzpHw
         4/L98bJ1SlkJaxmoY9SRyNY56161x1feGBIK62eXzHepN09ivBZAeVUzO26vvCuDOv2/
         tW6m2ImbtU+mp9x3FGqDUXMfRw9rmBsiICHlr2NmNyhhwD3nPpsPEr4SJ8uTlT1PsgGe
         5dOYB7N3Xy9XiUaZWjfPb0Zau+76i29KerJ9+hCorJaJTnxJKkHw+dlfZZ24skXyR0aE
         820mGIp4oKs8By7Qs7JeNxFEy3gAYLPxzAe0jH8JR3y7utLOpyzPqQXlZB2Q3fgmgrEN
         Y+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642623; x=1776247423;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S+jIsI8IolI8S/0NzS+SUgTDKQIENCfMEWeyQ17RZs=;
        b=lVESc8UMzDA1XJxX3FRR2zq+xFLOfO/8jrUTYlNhh6xGHGdHCFggBWbFl0Ggtl3SoJ
         fyQdsN0SSgsFNk8ps8Kba5+7uvGsRrkxvikMt66WEmuwyaXLmr4yCUTUGekf6ZX2pFmF
         KRsP8Yud5US/IhJbsi4hzf93MhtRHBb5Bvhg/r569JvJaCTHPH9qmYAGTH2UntndW0o1
         0piYJj7Jy02LaCNT+zTZge29Ho251L3BHG2uVvmsYu9vcwqn7TDRAYHo8rUCg1ew3I6q
         FtqEpYNoFyn5xrSI2UPEKTwJjL5Cy7V7G0BuJ5jj489/X2m6vLI26V5BVzTadR4/XTrk
         f/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXOhhN1e9VR9DHurxaDlpMTpTPmta4WM1BaLGOffKrVkdhSwnEoe/hD02TyG/rOs+O15pAONVY4C5+zZLfY@vger.kernel.org
X-Gm-Message-State: AOJu0YzbjAqmheg3jS04hFA7f6Zbx6TEtOYc3PtUGRXZSAWpTfjHt/M1
	gN42eviJrvr8wN5Q1chKvIlUpQ237TQIVa2PHWjwNARlvoKnbABPM8cYXA8b6yM21qYnvMf+3zh
	XarE3FGl34YH1b0KPRpeR4HqMdXSVOCyabvLZAPn0ycGlD4KVMI1NRPu0+rhuVkHfzMOzOv7tGS
	1k
X-Gm-Gg: AeBDieuJpyEWwRv8hKVqQ6WmZjcBB1LjmOBZZN9E0L/6hK2A6rdZ7hBt1W7c341OLzk
	P+9FiLDk0WMa9hrc4YrYQlJSY6I0lzj+hsYuM6PwG0lxWx4MBp10MdjlQNGwCNDWSVNzxXex277
	hGKzo3FF11mG4P4IebOdAdM/VYxcg68kCYvi8ulDebaDW1QgRB7uskSr3YItSz1EibdtI1Elpeq
	b4Epo+U30bhzgthG0Um1qTeu0gk46VgJ5OoQNejAOcF0Tyl29aDPiOz5ZRnjIR3aR9oDjdRcsX2
	CvIcm3R4aJzXVbxG3/mEOGH+hIF8lnVCAvEX+4W17pkl2WpnuvHz7SvDjKNuoJNax+VvAYsY0tX
	6HGL8RHwIESdBvy7Y7dR18MfurFM94qpr4amrZjNB02AOOQuSGErODv+t
X-Received: by 2002:a05:6a00:3696:b0:827:2a07:231d with SMTP id d2e1a72fcca58-82d0da77231mr19594580b3a.17.1775642623040;
        Wed, 08 Apr 2026 03:03:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:3696:b0:827:2a07:231d with SMTP id d2e1a72fcca58-82d0da77231mr19594542b3a.17.1775642622439;
        Wed, 08 Apr 2026 03:03:42 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm25805584b3a.26.2026.04.08.03.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 03:03:42 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v13 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Wed, 08 Apr 2026 15:33:24 +0530
Message-Id: <20260408-parse_iommu_cells-v13-0-fa921e92661b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwn1mkC/33PQY7CMAwF0KugrCcoTkinnRX3QAi5jgORCmUSq
 ECod8ew6qKwsfQt+1l+qMI5cVF/i4fKPKSS+pMEcD8LRQc87VmnIA1lja2MM6DPmAvvUn88Xnf
 EXVc0kHO/VY3ctqhk75w5ptsb3WwlH1K59Pn+vjE0r+43bWi00asALTETeYZ1X8ry/4odydRSi
 nqhA5ip1MxJYISiykZC9Aih/kTBhLJ+lgKhIHJET4ZrS58oO6Hc7H9ghQpMMTjjmbGZocZxfAK
 rbA/VmwEAAA==
X-Change-ID: 20260301-parse_iommu_cells-1c33768aebba
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775642611; l=6465;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=k94qEoqP6LeaqMjZ56JkwcDL9Caxb++/1ywGR2aNrcE=;
 b=Fa93m6jMAv59XO0RGhV08H7u/lbeMgEu+VO89mYeYe9+udo03+OfW5l6aRjt+/+cujOgn9u6U
 /txq4POfFP1D4nQK6IieIAafLv29dRyBbPOkaAXwmZAh5zFPlwXVp/j
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-ORIG-GUID: LFQ8_qBI2ugdtImsKvSLWh4jHu_8DbdA
X-Proofpoint-GUID: LFQ8_qBI2ugdtImsKvSLWh4jHu_8DbdA
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d62800 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=qMDWySynzQg1s02BiloA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MSBTYWx0ZWRfX+/RF8gHv0GAI
 KUbjEEsXTg1QCv6nBS1nwls2dy188kuJ7oIreOgHLdeHQZq7C+XadPbVf+EqQJ0px/eErP/1A0L
 gMw2E/5VeVIAMrqPnw3fogqcPd28iGo4OKtjbZdvXGME3kFewNJTN8oCuYWjQI7xDo88ZmL6Hot
 YQRF15yx7e+IT5/s4pUzux3ySRIywoiC2ouUUN0n3NirF0rjeQbz7s2XRxJe6eN80wgtz7iC6mS
 Ov5lnxGAgBrKbEmS+JEXvw5sz1VM7BQakHwH04eqfQrMKwZjFdIgFbNP6MS58ESdvxHHgPfl+WR
 2OSdCiFOUJMwIk2Ou8in/mQKA3/WT7Txj7gu8wzKhRfMiJL7IzH3hGo6igJQlwMG4wqfWfQAJYp
 6jrUTdaBC82b5hqVgWBq5ZGIrumerGJCutJqJvAoRgRPlnsk+a9KN/vSnVkkyvkYd9b0xXmlkj9
 zvWN+tQJ1icdtlV8m/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102310-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F41B3BA3EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

So far our parsing of {iommu,msi}-map properties has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use[1] in being able to map at least
single input IDs to multi-cell output specifiers (and properly support
0-cell outputs as well), add support for properly parsing and using the
target nodes' #cells values, albeit with the unfortunate complication of
still having to work around expectations of the old behaviour too.
							-- Robin.

Unlike single #{}-cell, it is complex to establish a linear relation
between input 'id' and output specifier for multi-cell properties, thus
it is always expected that len never going to be > 1. 

These changes have been tested on QEMU for the arm64 architecture.

Since, this would also need update in dt-schema, raised PR[2] for the
same.

[1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
[2] PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

Robin,

Could this series be pulled into an immutable branch/tag, if it doesn't make
it into the v7.1 merge window? There are client changes dependent on it,
So it would help to get them moving forward rather than waiting another
cycle.

Thanks,
Vijay

V13:
  - Fix bad_map handling in of_map_id(): 'cells' is re-initialized to 0
    on each loop iteration, so the !bad_map guard was insufficient, cells
    stayed 0 for all entries after the first. Fix by explicitly setting
    cells=1 when bad_map is true on every iteration.
  - Collected Acked-by from Frank Li.

  Link to v12:
  https://patch.msgid.link/20260331-parse_iommu_cells-v12-0-decfd305eea9@oss.qualcomm.com

V12:
  - Call of_node_put() unconditionally in imx_pcie_add_lut_by_rid()
    thereby addressing comments from Bjorn Helgaas.

  Link to v11:
  https://lore.kernel.org/r/20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com

V11:
  - Added explicit filter_np parameter to of_map_id() and of_map_msi_id()
    per Dmitry Baryshkov's review feedback, making the filter explicit
    instead of overloading arg->np as both input filter and output parameter.
  - Removed of_node_put() from inside of_map_id(), making the caller responsible
    for reference management. Updated of_msi_xlate() to properly handle reference counting.
  - Collected ACKed by tags, and fixed minor typos.
  Link to v10:
  https://lore.kernel.org/r/20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com

V10:
  - Move of_map_iommu_id()/of_map_msi_id() from include/linux/of.h to
    drivers/of/base.c as out-of-line helpers per feedback from Marc Zyngier
    and Rob Herring.
  - Add kernel-doc to document both helpers for discoverability and
    usage clarity.
  - Fix of_map_msi_id() wrapper and all its callers (cdx_msi.c,
    irq-gic-its-msi-parent.c, drivers/of/irq.c) to correctly use the new
    struct of_phandle_args-based API with proper of_node_put() handling
    as per feeback from Dmitry.
  Link to v9:
  https://lore.kernel.org/r/20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com

V9:
  - Updated TO/CC list based on feedback to include all relevant
    maintainers.
  - No functional changes to the patches themselves.

  Link to V8:
  https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/

V8:
  - Removed mentions of of_map_args from commit message to match code.

  Link to V7:
  https://lore.kernel.org/all/20260210101157.2145113-1-vijayanand.jitta@oss.qualcomm.com/

V7:
  - Removed of_map_id_args structure and replaced it with
    of_phandle_args as suggested by Dmitry.

  Link to V6:
  https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/

V6:
  - Fixed build error reported by kernel test bot.

  Link to V5:
  https://lore.kernel.org/all/20260118181125.1436036-1-vijayanand.jitta@oss.qualcomm.com/

V5:
  - Fixed Build Warnings.
  - Raised PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

  Link to V4:
  https://lore.kernel.org/all/20251231114257.2382820-1-vijayanand.jitta@oss.qualcomm.com/

V4:
  - Added Reviewed-by tag.
  - Resolved warnings reported by kernel test bot, minor code
    reorganization.

  Link to V3:
  https://lore.kernel.org/all/20251221213602.2413124-1-vijayanand.jitta@oss.qualcomm.com/

V3:
  - Added Reviewed-by tag.
  - Updated of_map_id_args struct as a wrapper to of_phandle_args and
    added comment description as suggested by Rob Herring.

  Link to V2:
  https://lore.kernel.org/all/20251204095530.8627-1-vijayanand.jitta@oss.qualcomm.com/

V2:
  - Incorporated the patches from Robin that does the clean implementation.
  - Dropped the patches the were adding multi-map support from this series
    as suggested.

V1:
 https://lore.kernel.org/all/cover.1762235099.git.charan.kalla@oss.qualcomm.com/

RFC:
 https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/#r

Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
---
Charan Teja Kalla (1):
      of: Factor arguments passed to of_map_id() into a struct

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

 drivers/cdx/cdx_msi.c                    |   8 +-
 drivers/iommu/of_iommu.c                 |   6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c |  11 +-
 drivers/of/base.c                        | 215 ++++++++++++++++++++++++-------
 drivers/of/irq.c                         |  11 +-
 drivers/pci/controller/dwc/pci-imx6.c    |  34 +++--
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  30 ++++-
 9 files changed, 242 insertions(+), 84 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


