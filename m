Return-Path: <linux-arm-msm+bounces-110908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UbZEI9PYH2r9qwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 09:33:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C15176353F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 09:33:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kBuLX+pW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HGMkRA6f;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110908-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110908-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5504305B300
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 07:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174B63FC5C8;
	Wed,  3 Jun 2026 07:14:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A689F3F9284
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 07:13:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470841; cv=none; b=Xfoe5BeVn7xdAehq0QXVDtR0g4QZ+LQMccvaouJcqff2x/9IOy9t3rhOwu7VOQFrFC6/Bzd8UH6kqPeMfj/FP0gsynnDjwF7z6olDBjT3N11298jwOz3GuwLF/xV7igh4xq3Obn2BvvMImGdnlqD9ETN41zSWXSuQdzl2+c8jUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470841; c=relaxed/simple;
	bh=Apl5n/Pzjd9vmSQSRMgkpTLVqhSrFq2QSBpaHbx7a8I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JZ/N1dlkpqbabDU+/ZxvfyGSLpGR4aOrwL0LpczNNWJ/+mJ349KJ1F68oqBmKLZhDArUK3/CjslX6m127B3D5cAbr+8aQ4GE28lWBqcKfVfAmVUbq8uAQEGlOazTb31rlyDfR1ae3Wu4mvX8BjeN0Lmd6aNYXQRus8kfdx78gjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBuLX+pW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HGMkRA6f; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RPMP1848420
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 07:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a90V1I1+DRANjjP0Y4PAIs
	EY9nHVftwWmZpEDYnlklE=; b=kBuLX+pWYaJODgNPBQaQuHB4h9D/x4GNB5grET
	aS0VYppmZ9NM5T2jQ3MilDj/uPWDeheHshsvCcmqAxn2XqctjV0pe7C7gKAurCk3
	AveUvPBtHda8UHWP6uwTwChCxJfupMjGmJp8BNbIF4xXxK5y78Bo2Qe8IGlu95zy
	VW346GYSYoRSsokJPcYqFLRh38B4tNkheZFt95JYQ89wN3a5O9kMkmS8WlDy5jhl
	VEpc5iHLAYwNrnSFWdGNo/05AdDAKx54fpXXbzfclf93Afz4IQuCTz5n0DOMEpCn
	7V9+wCorH4hX7LXV87P6aZSS0MyP3L4HEfdn9HZKwWZr840A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsu15mnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:13:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso36284225ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 00:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780470834; x=1781075634; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a90V1I1+DRANjjP0Y4PAIsEY9nHVftwWmZpEDYnlklE=;
        b=HGMkRA6fptVmaGQEz/c42gfvsFK+4NGtQs8UJawrrm/AwSgzsVJzQHl3M8dUCl27WH
         wH5Ys/hczVAM85E4jigfrrmqyoM6ewKhSA9kZp38YE+meijEQjBtLU2cNAhC8QNAhFfT
         NRLQxjwpKZU3nyxImToalL536dI3VOF8m499n1QkABn5UY93zCWYLJAI0Rnx4QMlpGFq
         pJWa56BjOp/XZpXyB4o542+p69o6Q8LbXUo1/MZUwL7y/rqHNxDTcFEPJwliwCei+8OT
         11HNMalOSnw2j6NfRN6x+Tl8c/TxjceTB/r3L/0+WVzoh3kIE9tlSpJPgT0StTNZsgk3
         IFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780470834; x=1781075634;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a90V1I1+DRANjjP0Y4PAIsEY9nHVftwWmZpEDYnlklE=;
        b=QjsRMmVsuII2mxiZMF5imskHkYxcqZxLvsALH1veAtIQsh0VPp9ttAySpentdXrlaI
         4nZXYTIMcQv12FJfZTEOjSY/rean2r+GoOsPx9GkT5zAF30M/pSHHgKQOFtA3Okpe5hM
         ozXZ6ZMd1V7ydXHqMISO8Q8hSZ4eu5xtEL58VN9LlHwn65HFoDWQulXOSoKHVvK3Rqm3
         tD4Es2+3QpPa9+imiv+oOvunYH7EFP16sBYX8Gzc8U7p3GzjT9NtMyRKcoZnPQpn9xQp
         GERb+c8gOqd5sU5sfl0W/+8RsSr1n5xdQoi6LGwEIItwbTjKwMqqYUukR0PEoN78MQ25
         XgCQ==
X-Gm-Message-State: AOJu0YwI0DpezM/MWgYqDYt9qB2LQPzeYFkVmPn7YvqPopXaKBo5ltCE
	tCjHr1OteneKBlbFnl6XPiN1YMZOU6WIbRjWEolaG0HxYv/I2oenwr6S349xIusEU5aXDpLqjhF
	54f4rszoTCVCJcOqUqLxh4/cvoURIBjAWDdYJpbgYwuvTP/wKxd6OfmbBAvfz6qHXD3O/
X-Gm-Gg: Acq92OGZAvFd4DfGBMmxZrcayCMxvPRrcuBpQFG4WflIQkAVdzrhPjlPijuk3nEPc1K
	0RVzX8n2IEcD470xifBw1P7pVKrv237HScDelDfLm8Dt0Pq8IW/1eSj/JDcfuy9mCuWalF+Hlb7
	QvJDelAPRwpT4lhorEypjDeyN9jxOszUIHbUgzBBICy7JSV5063rpnnY8o2bZCa2HMWTxQYZGZn
	0KW8lD6+KtJI1lh3KmW2LzLvNMgcmiHfytoQeF0WPA+QX/hPWXxzT9fvjGkV/DHAZSqsSurK5rN
	lzKM8UdwgvKbcUeuGTfKr2lWPX8nBxCXeO4BzeNeiDCgQIcF/oGoLU28etmsn7G7LGfBownZW8E
	cm7wIAWqp12fOPwEJXaF8FFPa27hkYzqMSo4QOWg/eO9aP4UqUDSv4maki3AKYi+mGaY=
X-Received: by 2002:a17:903:2ac7:b0:2b4:6d92:b002 with SMTP id d9443c01a7336-2c1643aafcbmr22605125ad.37.1780470834373;
        Wed, 03 Jun 2026 00:13:54 -0700 (PDT)
X-Received: by 2002:a17:903:2ac7:b0:2b4:6d92:b002 with SMTP id d9443c01a7336-2c1643aafcbmr22604615ad.37.1780470833821;
        Wed, 03 Jun 2026 00:13:53 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8429fsm17249725ad.18.2026.06.03.00.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:13:53 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v16 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Wed, 03 Jun 2026 12:43:11 +0530
Message-Id: <20260603-parse_iommu_cells-v16-0-dc509dacb19a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfUH2oC/33QzWrDMAwA4FcpPi/F8l/jnfYeYxRFlldD2nTxG
 jZK3n1OL83B2UUgIX1CuovMY+IsXnd3MfKUchouJQH3shN0wssnNymUglBSOaklNFccMx/TcD7
 fjsR9nxsgrQ+uRe46FGXuOnJMPw/0/aPkp5S/h/H3sWPyS/U/bfKNbEyAjpiJLMPbkPP+64Y9l
 a59CWJBJ5BrydckkIUipyIhWoTQblGwopStUlAoiBzRkuRW0RalVpSu3geqUIEpBi0tM/otSj8
 pI9sqpQsV0Stgr5yDbosyK0qZKmUWKkgVATpHevNX9klZJauULVRno/cYDB+4Rs3z/Ad2ByTlf
 AIAAA==
X-Change-ID: 20260301-parse_iommu_cells-1c33768aebba
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780470825; l=13317;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=Apl5n/Pzjd9vmSQSRMgkpTLVqhSrFq2QSBpaHbx7a8I=;
 b=QFGRXpY+qWmK+T7ctaWDbrINLCs1a9+0pUeDE1gl/BFcv55CiE90+ngTegwN4D1pcQzq3q59E
 NMVAa6JhzU8AzrSXEKGgT9s2yVMyWrIE5DzBeuN0+uwPYqDe9KB2fVF
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-ORIG-GUID: ykQdS7q63fdHd0pcpNa5F-3P3P-Q1mJD
X-Proofpoint-GUID: ykQdS7q63fdHd0pcpNa5F-3P3P-Q1mJD
X-Authority-Analysis: v=2.4 cv=MKFQXsZl c=1 sm=1 tr=0 ts=6a1fd433 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=c92rfblmAAAA:8 a=bC-a23v3AAAA:8 a=zd2uoN0lAAAA:8 a=tA7aZXjiAAAA:8
 a=7CQSdrXTAAAA:8 a=8AirrxEcAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=DBfv99YmAAAA:8 a=JfrnYn6hAAAA:8 a=cWRNjhkoAAAA:8
 a=HuIPyozGVqDkMI16_zEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=kIIFJ0VLUOy1gFZzwZHL:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=1CNFftbPRP8L7MoqJWF3:22 a=sVa6W5Aao32NNC1mekxh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA2NyBTYWx0ZWRfX+5607AzzMbXq
 Zk6KPv94x4+c+KPb5xRHIF0S4vFf+NSeYp0AlXt4Bes7U8WdNZuhakPibgnz3zk/bGWlE9NDpYz
 FambEM2j3n4eTSii2z0tS9EAFX3U7DxiaMndVAYcpk4DUUNDaxsDJHtQHAZMo+J5XC72jRCuaM4
 /EUeUG2P+ZEfOBWyiPrORWjYat8qa05QNg9vHD2SHuz1cNifxBg7xtrBcH1zY4iX2KiZa5IlxDG
 C9z/48xErlksnSpHLf41b0W1mJbrP/Lq/fj8xL4bpqnvlG/TXTU14bj9T4I1LqdbxJ4s8zk0J5m
 BKL5Rf4UaOKnhFqaNFITFjMfrH40pyHL87GWKY9n1Y8G2mblil467wCSObURYOovVf2R/l0x8Up
 mMuIYbJatK6nxpfnOOpyGUHQAyJlZJcxqgvKb4iYsycdSXN/zQWsgboG5sYLyWWOa6ng2BW7hga
 mV2HhkI40UqOl19BCAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110908-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:lpieralisi@kernel.org,m:maz@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:vijayanand.jitta@oss.qualcomm.com,m:charan.kalla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C15176353F2

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

These changes have been tested on QEMU for the arm64 architecture and
on the glymur platform [3].

Since, this would also need update in dt-schema, raised PR[2] for the
same.

[1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
[2] PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184
[3] https://lore.kernel.org/all/20260515-glymur-v6-5-f6a99cb43a24@oss.qualcomm.com/

V16:
  - Patch 2: Fix potential NULL pointer dereference in of_msi_xlate()
    when msi_np is NULL. Guard the of_check_msi_parent() call with
    "if (msi_np && ...)" to handle the case where the caller passes
    NULL for msi_np, as documented. Reported by Sashiko [1].
  - Patch 2: Fix OF node refcount leak in of_msi_map_get_device_domain():
    np was never released after of_msi_xlate() transferred ownership.
  - Patch 3: Default to 1-cell output specifier when the target node
    lacks the #iommu-cells/#msi-cells property, for backward
    compatibility with controllers that predate the property
    (e.g. arm,gic-v2m-frame). Reported by Sashiko [1].
  - Patch 3: Add !cells_name to the initial parameter guard in
    of_map_id() to prevent a crash if cells_name is NULL.
    Reported by Sashiko [1].

  [1] https://sashiko.dev/#/patchset/20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com

  Link to V15:
  https://lore.kernel.org/all/20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com/

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
To: Krzysztof Wilczy\u0144ski <kwilczynski@kernel.org>
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
To: Krzysztof Wilczy\u0144ski <kwilczynski@kernel.org>
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
 drivers/of/irq.c                         |  32 +++--
 drivers/pci/controller/dwc/pci-imx6.c    |  55 ++++----
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  32 ++++-
 9 files changed, 282 insertions(+), 101 deletions(-)
---
base-commit: cdf5682bcd98422242d95c4e6c10f9c38bcf56c7
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


