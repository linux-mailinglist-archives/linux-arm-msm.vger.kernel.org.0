Return-Path: <linux-arm-msm+bounces-99835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePwGL97Cw2kVuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:11:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 841FD323A62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8718D3066327
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C599E3CBE62;
	Wed, 25 Mar 2026 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiMEGExk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THyf0NoK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA96D3C9ED9
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436954; cv=none; b=kbyd9nNgbjVuDs1zb06J/W9agSvRv1//8qWkFLJHDqIDspV9AQa+z+THy3C7m7kiR8EZEiMSzB7ynp3Na3uDuekzVN8rcI51zLKSOrqUAeTj6EpZ8nsNGpAX1w2ZdyTcdGOYF2EtxDYRNWiN6tFrrK68qIxLt3rE84i7MqSO+Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436954; c=relaxed/simple;
	bh=b8dYo16XmJ2xon8GV97URYfm4xZzwK4rrsPqdHa33Kk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eyhdum0buN+fx9KbTUgP+yTzPVtFUQVaVOHR0V73lSKoM10ueSYqNpFtsxxtm/VPPPgEFl344F3Sna+7YccRCjgw8Q4t9DLIevIIxemsGSGFkX1EGE2OOonWI4rp2avIg/+rgweIc0MSpK5nHXJEDmO7yyAd3KjTZ0yVwFes8vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiMEGExk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=THyf0NoK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PAQZsJ2884887
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0xsjrEryjWzRb9dOuIF+d8
	yzYCspWSHX+0TlzKhGxRo=; b=TiMEGExkVM9gpL8cmTL1Y1MM+EHGdJ2UifJ7G9
	+3eMUGbdKh5bKay+aRyF7hZyOgk2/v+Ic8E2ObTbeV+5jRc5ljbjfAM366mDRq8Q
	p/c6wKlT8DwRmmdjtytX4aZYLV7FsCQbrWiFiGIpvpHTlh5XQb3KFsSTaCfYpqqM
	1rCSphJtlm6zmKIuCrM6PhQAdSYH04ZNY7qyz3M6fxBj7kufweRkpHTvNuLf3B1e
	yNKDTM6ys0BdHBaZOEU0o7H9qmFXjVMSR5+KcOCSliemYOsSFSJRINAtb+096EuP
	x2tFAR5Nr6nKw8fI7XAcvpCn1JBCNK7ldq+j0SS2gOpp6XTw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dy4g518-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:09:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c245a88a5so717653b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436950; x=1775041750; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0xsjrEryjWzRb9dOuIF+d8yzYCspWSHX+0TlzKhGxRo=;
        b=THyf0NoKQV8fIpL1qc362hzjAXzxHrmGY5vSVM6oyv3phsd1VIOOopuQJP1KLaksLi
         iThCSSDHyjDXORf+pL2h17lqos1gX0fxEwETNfHiOD6qagKvTFBVX9CRTBhM8FZF1tNK
         lvCUfBIrqqTtExItIqJpKugOZe7jmR2nxhqqKB/Zdhhl69ZE2KSlXRMWtZMIsdKDrb6H
         +nnRAatZEAPvMnLBhIlej1spLS4EvHF4aWt6yxpP0AHoAD58UeokAuS/KAyiL9m6A9bV
         wvgnBsJyppFLwn3USHF8GrJFiK8u7CUu5NDh05PQ8vMMYIOHLydW9JKihx6p0l/tgQ5Q
         iulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436950; x=1775041750;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xsjrEryjWzRb9dOuIF+d8yzYCspWSHX+0TlzKhGxRo=;
        b=AoeP/gQGL2jNzxgfU2+cat0Cb2TzmeXPjjYkhJsGSe1eOqtQOAyhABpTFQRPWvaXTh
         llQxj4A6K1z0jCbdTu7bpkl9jt4jUPGwQqeK4FQpkAnBgipTEg7jbJYFbbLBOpq3R4z0
         WjOAmJmPDWMFwLaJ3EycAl+ztLrUCBvgpKnyYmbP0zjvF3lGunhCSLnbBcWS1FrWS4Jt
         t2j6safLJomLbggzwpQtQWAkgsgQy9YFSj3eCwPkNXicpjfF9i+sMqIY4ZGwxoLMXVU+
         KnDI7r726lA25v+QRhMe0vSgAhxgzdt/5Vbd/BhWiclaPNeOdqFlWmq0NkMrm2oLqvaK
         ewyA==
X-Forwarded-Encrypted: i=1; AJvYcCXDV6eUX2ayDdOZB/+rkyDb3mFxBiEMyj28NyMUdHqIS8XKRKhvxefV3EVvI8vfZBvfA5+adZlfZf6lj7Uy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk+Q8z99qa8ffxkumyCI6EwwQPVuIgjfweuvxD2JHDGJOngrqO
	AIWBMZctb2wLHq1XQ84TaPIQizG7h9L8fS6rgYorfrEufOdgua/+92gpHwg819IvoSU+zjXWHVV
	3rjWmqG43E/7bZ4k5P7GgzP/FB1bYLFaAlu1j1InSEyOlRGlbh4kvHy7K2UeV2VOQXPCq
X-Gm-Gg: ATEYQzxsVZh2fvrJ9KJMhftmoVnQEwWWSCq6jCDoL5E3HPvhtIesji2G7CaEwMqk0x4
	vKmOdHyJgna8dK99/MCZ8SP3XhfTS4xu8KaN2v/qdjmsxWEuhwOnbwJzMifu07WrLnKaEO0o0KM
	EwNxYnQDZ4o3VA2puicpN2G7/2Y0Gne4C7hLJN6BCLPfENQlB8YigikYYlxi24qR2H5QykIPQGp
	VQPM8uR9yO/rvul4PWDp3hTPVTQXh8qxN6Zxrgno9qy885gGUuMz3Ii1K2NdHAjn25/hBWvxRKB
	bH4CcnCMGOl++wgUh/tGXmq0l/OzcE0TGUovAoZPjwxowWaB3ntQyWG2El9/rb/Du58dnESpJb3
	v3KwTO+YBsrLBihzIEv2ioamq7K/2gGC7+9jih/XEKRek0icVCzd/n7du
X-Received: by 2002:a05:6a00:1787:b0:827:2ee7:baaf with SMTP id d2e1a72fcca58-82c6d88a70emr3157409b3a.12.1774436950323;
        Wed, 25 Mar 2026 04:09:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1787:b0:827:2ee7:baaf with SMTP id d2e1a72fcca58-82c6d88a70emr3157358b3a.12.1774436949724;
        Wed, 25 Mar 2026 04:09:09 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040da7besm14615911b3a.49.2026.03.25.04.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:09:09 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v11 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Wed, 25 Mar 2026 16:38:21 +0530
Message-Id: <20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXCw2kC/33NwQ6CMAwG4FchOzuygiB48j2MIaUUWYIMN1k0h
 Hd3cPJAvDT5/7RfZ+HYanbiHM3CstdOmyEEgEMkqMPhzlI3oRCJSnKVKpAjWseVNo/HVBH3vZN
 AaXrKC+S6RhHuRsutfm/o9RZyp93L2M/2w5dr+0/zpVTy2EBNzEQZw8U4Fz8n7ClsxWGIFfWgf
 qVyTwIVKMqTlhAzhKbYoZZl+QLpzPWgBQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774436938; l=5530;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=b8dYo16XmJ2xon8GV97URYfm4xZzwK4rrsPqdHa33Kk=;
 b=J08zhEYoQn9e6bd4Kdzzm/0wjHfQUzVEJmTADcUj7e0wpazI3gC2Wl0RNNsNRBF8E/PVwFYJS
 bUPHaafLLEtCBMQtzU4gcpBawAiyPFytdIVdxsjxMVtFcpymsXi/9KL
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX61MNe1xTt1BE
 8vFr9EkgoeZ3HOMNuewmhYSJKRWcXnAz2nCFINOhJ/Kytq+kfmlBWtUH6EQ87bBKLSl5l9p3bxe
 Lgiw3JOnghF2WipaOrnUiI7dMuty4MG4nl/Y31KDblisip2SiIyVfBMqxZ4EKL/wtd3XKC0eRs0
 GAShEzvLtpETieIsVokXMBYz/B54+TOiRWBgt5ArW/ZiJf4mQ6XTk6aLe9vFIRSJshv0QQ0zmN8
 WyaTy+IrV8L4OvHUFbebF00bjQyIlPOavmEDKapujbE8cEmRLIRQoUIzr8vnH0to1ZcPtO/JiM9
 q0dCVoijaaU6ST1YAik/e+JtN2UrpvYJWfSHOJA0geevmHzvEi5yQ2QvM4cjxgZYuZ0Kmyre1D0
 4+UsrrghDB0eSv3LiYoJZ5n0KHEien+JN7BRablUJctM9zBt+yc/92wgJ1b0LHrpyVaRP6iMeDH
 LN3NnhhfvOCmc+S5pvA==
X-Proofpoint-ORIG-GUID: lqzq_bNlisEU3k-84ub5aYe3yO8CUwrf
X-Proofpoint-GUID: lqzq_bNlisEU3k-84ub5aYe3yO8CUwrf
X-Authority-Analysis: v=2.4 cv=eeUwvrEH c=1 sm=1 tr=0 ts=69c3c257 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=w9jVfKxUgDq0yQD5sDkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99835-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 841FD323A62
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
 drivers/of/base.c                        | 213 ++++++++++++++++++++++++-------
 drivers/of/irq.c                         |  11 +-
 drivers/pci/controller/dwc/pci-imx6.c    |  18 ++-
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  30 ++++-
 9 files changed, 237 insertions(+), 71 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
-- 
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


