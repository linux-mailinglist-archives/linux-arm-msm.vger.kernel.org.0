Return-Path: <linux-arm-msm+bounces-108636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJf6Is9qDWq+xAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:03:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6A1589558
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1D1C3023D93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72A03A1E89;
	Wed, 20 May 2026 08:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwDPonQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HhxDkX4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B73346AFB
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264202; cv=none; b=nzk213PTRVif27UZalMAxeBkxf2lyIDOg6EgJSU56dLQu6ng4yELFMjmTSEmUsVOVIRh15hn0r2IeO41VlJfLwZVEUgWZBB/K0UnvhI7uVLyUAmh6oxo0imb9FPu8jwBgqFrzOkNJ8k4K3UneDnAm6X/tH1eSFxzmCRa4P0532o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264202; c=relaxed/simple;
	bh=iNWcrRc8U4lM1k8ax/30YJhUEnlFBubqUx9ZeFn1nFA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SM6OHNTK38hbbf8F84jD3ZID07tvwy3tK2htSU/YZa165oAUAoV1pO55KZCJfT7ZZLkKFgqx7Kh2YHo44kE/aB5L6FWj7Xp4uppJw7LpZVxKOZSj7Ft3s/yu/9Zuq7W7Bz/QO4dvDJ8bMX6/WNuOuFJ19OT+7SZX3ffjCQiBXtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IwDPonQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HhxDkX4N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6wC2x1963038
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jlSKfthX4HPtf4+kK54drZ
	mQ19Rqg4gAjCsyLiQCKHc=; b=IwDPonQhvvyJevlabHcwTTFLwsVT53P8rB5/He
	GSbTKmyCQP2enzl7cpF/ylHVoFR1Dc+5Dgy63LdRTa94Y268kiNDo0+ZTMRCrbLj
	yu5FljcIumMIitp/eqh/tq1iEFeSj9DHbnCY6Fz3AwDn849V/hdhG5rAYd3uiDqW
	tLvlBYSIcXUSEP9qn5wi9efTksX6t4VVJ4tQAxnl3UjZjxKcpyOuCX+fb3ShyU6V
	N5TtgidypoPPwsxQuo2+umOShvr84ENx8naZUrDzkYYQnvZJ57LRpJKfl0lU6uri
	5QBcvkMTo+NlmplyHVjNV7g5djtTk0Fi8GMQO4i1+yccPtZA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3ngd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:03:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso9055217a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779264197; x=1779868997; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jlSKfthX4HPtf4+kK54drZmQ19Rqg4gAjCsyLiQCKHc=;
        b=HhxDkX4Nd9gFFNgH0iIKH8HHg7Vga+anHwB8PhJGwIvzOa/PiKUw5GbqAGCIEBx0d+
         5BxnEN1Vdz9wmb1cBvDbmDOs9ENtE+t/9eKrY+fWw1pumnnLxQt0Iw+oTjAFnNoMsO6h
         9C4wprp06R5a5OYDBu/VSytvJe4Md0sl8tqLBdTV4H3c8iok8TJdOhABLig9/jEqlIlB
         0ufEr9AaFRJYTPzhOmYg0yPP9XBUNOEDm45Iq+WMJwcv+W6L5bT1XZXfD1KXI8Pe+Jnc
         VccAT//OFW9Wi28S8NTjczWKFSz65dV91sWV0FAQU8Bp+8tm7iCtPaBdqSaeKuDoSU8X
         NDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264197; x=1779868997;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlSKfthX4HPtf4+kK54drZmQ19Rqg4gAjCsyLiQCKHc=;
        b=rhqP8XXOLIXYf4x8u8Hr0Yvr59U0+GlALqe7KBOS9iy63NlEb10JWmLrvz9D6lTWZb
         DQ0QSX2OsDkIehGqWOhbBrAhVwR/6zOMoyxXFzOu/oaDY7kvfflONA0gFphdYf7zlK9r
         0IU4oCEN1POSuc5GDTAc6MbqaU8awMkBFr9X90k3YrNgU8+qvLAN1Srb1xkcJgcmdg09
         rgXLy+cROxr/8dhJLIFoifj5cK5u7kmPB/wBUl/+GsI0pGJ66+IQsizScCD174QjIndV
         cXoCmlKJvVr0m2Qw1f4Uf7ydNMeTyoIkYnLfNp2VaE/2BZwdPWvo8vapo9gc7cFNmmOk
         eIjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Ygo4ksXZn/3/U9y0SjTQ7nJQZcGqNBv7dIYuVGkEZF6q2DwKYlC8jvzKugzyS9pbsxIry1Al5bDySaozJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4tVHMZmwPvigKun3D/DxGBNWW1FsLqOyKbxxcFp+devkivxLT
	GtTE2F/DJJLltfvmhg/ftdfcDN7CKONXH2OC8bt1wNCIkkr/ol7M710G5eynyufkOY6Ms86QGlv
	3hhNb8PrUB0KryHl6eqkbs8BlKzMmlO2LVQtbA/UVhREcrSnRerH+Ie0GZGrgRzVChEdF
X-Gm-Gg: Acq92OGT9g8b1m909/0nzoR9QUizODPEDfj8LPIr59h+lKsOntYYiVt8XzDl7G3No/d
	QJEtiZOl6GXd+DyY5SbeVwrQL8mmhmgZ3FfBTaztEIWRUwQx75ie6naBTzTwqUP2Jx6xJcH58w+
	L8GQTTdiXQw2SwKzcaTD5BcX+4Pp9Q+mWKUKObwhd2KslGiVxGLqisE5RTT2G9PgBZ2mJFLr9qU
	9p4rPaSDVsYmO8pdwJtKUJL8BZ0VFCrxEl4vCpdMWR6hy5fJQc40StUX+Jr+Qawg+jpuXxCRk5r
	lqo3yg7ZkGKrJRQFXejSzgFO7Wmxa5Sls1qQsagkj9mKh4foF6nEsZjpiLeySe4JTO0adXGMiUi
	cEzwVX8r22dAYsE/1zlZ+6BhZtic+yWMpHvNj+/XXq6/6QBkWXlqSWbm+
X-Received: by 2002:a17:90b:5904:b0:367:d850:6a5f with SMTP id 98e67ed59e1d1-36951c9f53dmr23576104a91.25.1779264197107;
        Wed, 20 May 2026 01:03:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5904:b0:367:d850:6a5f with SMTP id 98e67ed59e1d1-36951c9f53dmr23576055a91.25.1779264196495;
        Wed, 20 May 2026 01:03:16 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517aa6f8sm20889290a91.11.2026.05.20.01.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:03:15 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v15 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Wed, 20 May 2026 13:32:39 +0530
Message-Id: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ9qDWoC/33QwU7DMAwA0F+ZcqZT7DSh4cR/IDS5jsMibetoW
 AWa+u+ku9BDysWSLftZ9l1lGZNk9bK7q1GmlNNwKQnYp53iI10+pEmhFBRqdNpoaK40Zjmk4Xy
 +HVhOp9wAG/PsOpK+J1XmrqPE9P1A395Lfkz5axh/Hjsmv1T/0ybf6KYN0LMIsxV4HXLef97ox
 KVrX4Ja0An0WvI1CXSh2GFkIksQui0KVhTaKgWFgiiRLGvpkLcoXFGmeh9goYJwDEZbEfJblPm
 jWt1VKVOoSB5BPDoH/RbVrihsq1S7UEFjBOgdm9qv5nn+BdtGt/ExAgAA
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779264185; l=11180;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=iNWcrRc8U4lM1k8ax/30YJhUEnlFBubqUx9ZeFn1nFA=;
 b=07EsmYfofxVCPU2Je9T3PGCZ5cjU9kJe1yL3BwAPeQsdVaBtAkvf00Fj0WfbPDVAxb2jPyVks
 h1aA3AbmsLXAN617RCr+2eG6fvYxmLMaxJPpDY0VZEobOFwGPKVdK0C
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-ORIG-GUID: PS5X4w-J3fLXZWl-QMuuR03PZuTBW2Lp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3NiBTYWx0ZWRfXwYBJMmafNduT
 7V0zeYNoigXoF6fa8k2YkzeQIV9PkwqHVGxNcpotmrdpOeUWE3Pp/zrKuUh1BDYSvN+kWhlZAM8
 xeJ3xkEQ197L87rZULFlItu0X2OPGkkwpFDVYpoRcd7HbToLn0Q/rGBtG6Uj1WI4g8sOuP45ePe
 tc8b/YyalZ50T4IE77+EIZTX9gy0CtmKs3vzZCCDw0vm0LFaajwE++83BmYFC314Jrm1ysTfbCF
 dRHPJM3S45ROt3R6AOj6KSOnHLVqpIG/XCyYN6Sbru4pD4cEfhKeaLwrkLYdQTbvB2ACtgRplzD
 s5ciMIXEEi0i0H3+gmKlKf8ufjq23YbiovyQYFOD4r7pufPHzmQ0htXXrimb/n4g5yc4OfINTqK
 vnU/mYdXk0wCiP/AVfCNWhyS6AJx8AOV6OcxLkQjz02ptUATUdwGsc9nDiazlZvPihHVEvIS2F8
 35bXLpzUJFKhJLjRuaw==
X-Authority-Analysis: v=2.4 cv=Y/bIdBeN c=1 sm=1 tr=0 ts=6a0d6ac6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=tA7aZXjiAAAA:8 a=7CQSdrXTAAAA:8
 a=8AirrxEcAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8
 a=DBfv99YmAAAA:8 a=JfrnYn6hAAAA:8 a=cWRNjhkoAAAA:8 a=vIDDpPC5oxyFppbewhgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22 a=FO4_E8m0qiDe52t0p3_H:22 a=kIIFJ0VLUOy1gFZzwZHL:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=sVa6W5Aao32NNC1mekxh:22
X-Proofpoint-GUID: PS5X4w-J3fLXZWl-QMuuR03PZuTBW2Lp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108636-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 0B6A1589558
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

V15:
  Address Sashiko AI review comments on v14:

  Patch 2:
  - [Critical] pci-imx6: pass &msi_filter (not NULL) to of_map_msi_id()
    so that of_map_id() returns -ENODEV when msi-map is absent, preventing
    the '!err_m && !msi_spec.np' path from incorrectly returning -EINVAL
  - [High] of_map_id(): explicitly set arg->np = NULL before any bypass
    path so callers can safely call of_node_put(arg->np) on all return paths
  - [Medium] of_msi_xlate(): pass msi_np directly to of_map_msi_id() and
    of_check_msi_parent() (removing the local_np/np indirection), and use
    'break' (not 'continue') when msi_spec.np is NULL so that msi-parent
    bindings are still checked when msi-map is present but has no match
  - Guard 'id_out = msi_spec.args[0]' with 'args_count > 0' in
    of_msi_xlate() to correctly handle 0-cell MSI output specifiers
  - Use of_node_get() + unconditional of_node_put() in of_msi_xlate()
    for clearer reference ownership

  Patch 3:
  - [Critical] of_map_id(): add 'cells > MAX_PHANDLE_ARGS' check before
    using cells as an array index to prevent stack buffer overflow
  - [High] of_map_id(): the MAX_PHANDLE_ARGS bound on cells also prevents
    integer overflow in the '3 + cells' length check
  - [High] of_map_id(): fix misleading bad-map workaround message from
    "assuming extra cell of 0" to "treating as 1-cell output" to accurately
    describe the actual behavior
  - [Medium] of_msi_xlate(): guard 'id_out = msi_spec.args[0]' with
    'args_count > 0' to preserve id_in for 0-cell MSI output specifiers

  Link to v14:
  https://patch.msgid.link/20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com

V14:
  - Updated Patch 2 ("of: Factor arguments passed to of_map_id() into a struct") to
    fix below two issues in of_msi_xlate() that were introduced by the API refactoring:

    1) The refactoring changed of_map_id()'s dual-purpose **target parameter to
    an explicit filter_np parameter. In of_msi_xlate(), this caused
    of_map_msi_id() to return 0 (pass-through) instead of -ENODEV when a node
    has no msi-map, terminating the device hierarchy walk prematurely before
    reaching the root complex node that has the msi-map. This broke MSI
    allocation for PCIe endpoint devices (e.g., wcn7850 Wi-Fi on ARM64).

    2) Additionally, fsl_mc_get_msi_id() passes msi_np == NULL to of_msi_xlate(),
    which would dereference NULL with the new API.

  Link to v13:
  https://patch.msgid.link/20260408-parse_iommu_cells-v13-0-fa921e92661b@oss.qualcomm.com

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
To: Nipun Gupta <nipun.gupta@amd.com>
To: Nikhil Agarwal <nikhil.agarwal@amd.com>
To: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Saravana Kannan <saravanak@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
To: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: iommu@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: xen-devel@lists.xenproject.org

---

To: Nipun Gupta <nipun.gupta@amd.com>
To: Nikhil Agarwal <nikhil.agarwal@amd.com>
To: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Saravana Kannan <saravanak@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
To: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: iommu@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: xen-devel@lists.xenproject.org

---
Charan Teja Kalla (1):
      of: Factor arguments passed to of_map_id() into a struct

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

 drivers/cdx/cdx_msi.c                    |  10 +-
 drivers/iommu/of_iommu.c                 |   6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c |  10 +-
 drivers/of/base.c                        | 227 +++++++++++++++++++++++++------
 drivers/of/irq.c                         |  25 +++-
 drivers/pci/controller/dwc/pci-imx6.c    |  55 ++++----
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  32 ++++-
 9 files changed, 277 insertions(+), 99 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


