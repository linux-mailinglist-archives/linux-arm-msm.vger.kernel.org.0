Return-Path: <linux-arm-msm+bounces-96077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJkjF0DPrWnz7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 20:34:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E475231ED2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 20:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69861301467F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 19:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599EA393DF2;
	Sun,  8 Mar 2026 19:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iz5I4QQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yx/0Jqkv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443B7313277
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 19:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772998452; cv=none; b=ggQw2a0C0m3GmC5cN7zPF2UxXaTPpcRYVQrbbau1dWZc1RYGbkoPH4D7SqDVfC3DY6fF8lMbwCoNYd5BtlLI8jM9M90NuXsIblFomGqoT09oiR3gilT+dBew5RVHOrM615XKEGqcZn6I0XSQh5XRqpP5GnOfrX0MEuTYRBpwCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772998452; c=relaxed/simple;
	bh=PtTdudtjBZ/xPMrnHDRK1H9Z6n/XjfTDJSglqtupcDI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cJFfhfDWg4gSQLGW+vEku3tdDuigNMBsFBIkpH77dIfwN6tiputAFG6D1U82S5tYKNzX1dH4C21tpCglf+1SWp4T1vOpcQnoBDc3WIQ7A3vIJK+mCqxJanWj3/EOKf97lL/ZATRxkwB2VhEDvbn/7bMb9nEc1vRzPYLqdTYyddY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iz5I4QQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yx/0Jqkv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628HtgYC2411971
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 19:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DNMdCDB4m/JS2Eqb4Zd/0G
	6oEd9rQSbuN+RA5pJMqjw=; b=Iz5I4QQh+5X+EdI7ZbWYkCwMd0XsXKEgZSSk7u
	fZ9Y3l6+S7LKgAOi7D3AfsdoMASdDUtGTK7RZzHvs5t01JfUzEaojPuJ6bMc9ofc
	2/bd2VGoUOQMpwJRFzwOorskgCxsdkMtTQplIHuOzWjx8AvvZ9lxxJMGtGLNxgSn
	anN7DXhtVfkGW27Ex2TmfG1rL90bMyaGXdzyW12WT3YHHeNaHtVQP07xfglcjK+U
	3Hq+dgArnD8ScoB11PW9t66PZ9SMoa2utjEkZ1vtKayFBjoNbGSTSExpPj7knnQH
	KyxIdiH5oJAi7giVdLeW41AZ3NV+Hguvx/+DxBT7wj64Xk/A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxu27s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 19:34:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bce224720d8so6236821a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 12:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772998448; x=1773603248; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNMdCDB4m/JS2Eqb4Zd/0G6oEd9rQSbuN+RA5pJMqjw=;
        b=Yx/0JqkvQUSPveBKs3O8kovCl+BlxHe8F5WqxoTpKnUsLilouTgezVJ08H8cw8W5kD
         VnSdufS0GclvmSvH469bjGCdfE9ym08FvZ9K47zvQjX7Y2vg25BcxhoxIAkgLFHeLVlA
         NDNSY/F5H1B2k5uwCGfPopKWwxZlFP0Gwh36MNF8p4rmY91IBV0auVjs9cs9ctonrCwm
         5gwDsWLmtMlJ+v/4NvLh0Q2cn0p7P0UPkV/P7LNsB0UqoOp+li6bgE53yrgvnlE9OUUj
         TF2w3g/tzSgSrl2pde2hSj3VTJJyrZRc/IMqzkmeytLkJDmxBK1n35kGimpHs9WffewN
         ApQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772998448; x=1773603248;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNMdCDB4m/JS2Eqb4Zd/0G6oEd9rQSbuN+RA5pJMqjw=;
        b=vNhe1V5Y8jcdztvaxzSY5FMopMMIs4f2ACbOxKFAbIpg4qsMF2GfOwHIlgQKqrjQja
         phzHyGAC97sslwrywf6e2L18A97siOfELtzS1WxYhCbNM4irYcEUfpSMiGYJWFT21riN
         ekXex6NH4MaGeODA8oHJORkRJ7ZF3ZV8F+7Hks9gUKlV4cfIcYaaQemomCfTJrxsQHR9
         jU5cUBasfkKxJdVUf5votCAJET5UfQZJS8/2SeXvoe7y8UoTF5cSlaBTq8PWk9h0xpjL
         dv8lZF+lTJogO25X1owUe7WQpo29LmH+IAZos7M0ikYHHJqcWrRQchojiCOEKGjAGg2g
         IHFg==
X-Forwarded-Encrypted: i=1; AJvYcCVmeqCf4Uq1dZuu+gU6rdFOnFY/OGIB/Pm47n8stP2gAxgTheQqdQ6BzY1Vcy3NXMUAVy2M2nTavF5ObrUT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0uHfjQRRHQ/PwNHFCi5LQ9BZY7j61hBca/a2mC0/5/BHlTuye
	PznTlhuu6aAQgFH1W14bgUVBMw/B0ZpzFs8VPA8pe3GqkQT1OTeUlB70fyWlMuuCagKFogqlXr+
	qD70JC8HaiQeDHZwz4CpneG/4uG3oD9MrK45bkdd3SwCTp5uilTk42OkOrsNqN1FsR/9L
X-Gm-Gg: ATEYQzxKhMDeLhpxWpjllAIE8yoLtGa1novls1NwsiGBwd6ll+wRfDVZVFpBQsYp5ev
	LDO5yRHfhS4W0azff2byI+NYJx+sK9fY6B1wlibYB6N2PP3ME0cmk5DQ/nrlj50zWCOio7Bk1ME
	lY+Ofng6ESQabSA99dlPn42KQAfdrIrxlYKWJIPWYInZibq35Ip5xphqeij/IhYdZ9VykKZGfUy
	Z1bb8XpgMApbPHbo7h67CgoY5/EpXr1CRI6FSrx0MsWcBHkDi1Deq11wiZelOcQ+DOJjVA7ruGg
	lRzHR5+lGPpqm0n8JCS6Q65owf3eqDVdSq2b0HFW+mLbK0h63wa/lhZDmDLMzWCgFVtM/gRBoOy
	DxRxxe5YpdbapVuFxiRF9OHzraUa8tiNMlMUtt9c0zQy5qLhNBgNJ4E21
X-Received: by 2002:a05:6a00:4b53:b0:829:6f9f:ea3b with SMTP id d2e1a72fcca58-829a2e3d086mr8046022b3a.20.1772998447771;
        Sun, 08 Mar 2026 12:34:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b53:b0:829:6f9f:ea3b with SMTP id d2e1a72fcca58-829a2e3d086mr8045981b3a.20.1772998447234;
        Sun, 08 Mar 2026 12:34:07 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4676593sm7818909b3a.28.2026.03.08.12.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 12:34:06 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v10 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Mon, 09 Mar 2026 01:03:36 +0530
Message-Id: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABDPrWkC/32NUQ6CMBBEr0L225KWKgpf3sMQUpZVNgGKXSEaw
 t2tHMCfSWYy82YFocAkUCYrBFpY2I/RGH1IADs3PkhxGwPIdJZrq42aXBCq2Q/DXCP1vSiD1p7
 zi6OmcRB3U6A7v3forYq+Y3n58Nk/luKX/qMthdLq2JoGiRBPZK5eJH3OrsfYSqNAtW3bF4mVr
 Ue6AAAA
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
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772998436; l=4795;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=PtTdudtjBZ/xPMrnHDRK1H9Z6n/XjfTDJSglqtupcDI=;
 b=EBb8Dk6BIlgjCH0Fqcmr+R/Zem16FjzSLlrw2KGhDvNxeYgPJwLHInLgJNWKtbmBgHLkCc5NK
 xDxh7Np2VUaB9ZsluGW3jBruuRfE5BZGHAei8UQe3BXzG9rX5bRMd84
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE4MSBTYWx0ZWRfX9tt0wndyETyK
 UjWZ6ucYLsePSAgw/KqYWeR7juyUUT7dxpIW0njSr5tIWXP/AQOZlNFF1lhLJf61glvkSCIKL7F
 0snSHbXkajCiz5Bn/NRK5MdqQAt3s4QyNh2t6Ei5X2UjudDnMYzhK+Ffc9/BwH9V07u9hVZQZeF
 LFTBmPOTTsqcs9YyfmlRp9k+e/MjXdMpnJqnB36NCZIQ7vTxkR0w9RLMt3WDcYT+tzgqvglkoEo
 h5NnRvUAdGjsG/KNKeSPwLj+o+z307iIky/YM6+yPMfeH+FPeiGF/2C4EKutJ/WvlrrVYYkHg14
 oqSZaJ75EOxLf0yp6q74ICQFLhezzJF+IwTcyq3hfaZR3MT+Bmtct7qVCjzQC8D5+G/oRtwP6B5
 91YT3o6iiBcPvoDJ3kCv9lUWfz8ROWP/AH5xB1XQL03p5pN7OYD+oRZo/f5stzVbTU+X4CSh6ZT
 JD8NmoYd7FmpfcUXQRA==
X-Proofpoint-ORIG-GUID: HnmnIxiLBVm8nGiGp9jB15gi2HLucUnI
X-Proofpoint-GUID: HnmnIxiLBVm8nGiGp9jB15gi2HLucUnI
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69adcf30 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=hUMMoPFcHhpVZiwYRzIA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603080181
X-Rspamd-Queue-Id: 7E475231ED2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96077-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

So far our parsing of {iommu,msi}-map properites has always blindly
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

[1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/

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
      of: factor arguments passed to of_map_id() into a struct

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

 drivers/cdx/cdx_msi.c                    |   6 +-
 drivers/iommu/of_iommu.c                 |   6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c |  11 +-
 drivers/of/base.c                        | 202 ++++++++++++++++++++++++-------
 drivers/of/irq.c                         |   9 +-
 drivers/pci/controller/dwc/pci-imx6.c    |  18 ++-
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  28 ++++-
 9 files changed, 222 insertions(+), 69 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
-- 
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


