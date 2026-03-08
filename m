Return-Path: <linux-arm-msm+bounces-96080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM/zKJTPrWn/7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 20:35:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10095231F9F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 20:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D46383012C78
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 19:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECD0313277;
	Sun,  8 Mar 2026 19:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qn5FjJJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwjzFy6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D732A346AD6
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 19:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772998484; cv=none; b=WfRbJD6dSSTpaYecPQvUPLnXuG3CNDyahdKlsrGYnvxGm0VI5QuPPwI3A7+N2WkO8oX4YiPFcikRr1hXcFJykbdxpvRIeBEVVl1NffrAxOCh1IxAg7EUgSDnzfjSpGHr+veEGPjd0PY+kDz6LlRUIAwm1BoRCFTQlg1HjzYAhw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772998484; c=relaxed/simple;
	bh=3avIlJbMDFNjbAF4EZH2qiDihWj2kJI0TqNMamuXzQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gcjy/BjGgf5GO6GwwvthrkuwrvYTasXMwpdJB14RcyPyU9owcmBC01LlI7DZOuM2dc81bC2jMofAqaqiHoElnYxyPrVmapHPNHF1ggKQwRbqmnSmEvWxuzLjn6s66zQkST+FCbfP9sAdAVfTRlzBrJ6BoNrSSFuV6YFODrX5tHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qn5FjJJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwjzFy6R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6283OAGU224227
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 19:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pdnRU8Mu/D+Ngm/KfTZjC7mxZZbYL4Ii8ecgzHXdwuA=; b=Qn5FjJJTz3lhNSgk
	g+Xt+RefjAhFAGk8IMl3Nz87OMmFmqqVgGIlvCDYIYsIZ1R9wj2wP+84HY2GztvF
	F/FJSoE9BKC5iNrQxU2X1FnZiI9puYMJpYY2zNAl78Af4GzVoOgCfHARbzlpOL4Y
	tgqBoXCfvtz5rONb4E/I7j3AGf4MOeDtq/csOfsp4e3+F5hUoS5c14HkA0wJNNXK
	XL7vSzDw2uA2UJ6HwJDSJj9mYD3ZllkH8AmHZ7XJK5C+z9R9z7qeOSuv/QiNZisk
	i6ko4i8XVHP3aWdp5x21ymdYEDxk5bJUWXcNsLn/QWRrGC0NptqHrLYvkcd0LZrQ
	D1wT+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbbg3312-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 19:34:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829a535ad7fso6132137b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 12:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772998481; x=1773603281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdnRU8Mu/D+Ngm/KfTZjC7mxZZbYL4Ii8ecgzHXdwuA=;
        b=FwjzFy6R/jpuw2CNTypcu5KfjmnLXelo7BXtjHhT7KPk6gutng05NHkNL7fiSom3fj
         5VmAK/4DbTVu66nWU5ltjBQprwVC49MoFntiXor+6BVQAzhSKUHSVUuSnM2EYTjOfGMc
         0saAcAjW1XzfkjdO1zwxuLQbp1cKwqe7xFeK+0LMmz2MCPe95GBDADkhskEX46SldGzC
         rjW5ugbRM51TFz53caATxgWEZM1hob2ka+wTxJ6My5kWHLwaIK9E7VRcmZMELjBU+S+L
         tQpk/BW4sN/nJ8GHAyM5u1Fu0umEOTaDB7Azd3yWMJnYYASgWsM0Uu2q1wEYgkunp7VZ
         zJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772998481; x=1773603281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pdnRU8Mu/D+Ngm/KfTZjC7mxZZbYL4Ii8ecgzHXdwuA=;
        b=S+rxJnFT381X2YddOQelOqCwWnyUsF6WJDUOsC1ozpF3OgMIjR6dazy85nI0whUVaj
         l+ewCAzMEHk3s8tVSGIxrlQjeMjSeERDxAXglOYxBgirLqCB5J9MUAwevuYwk+RR3ZAV
         knrQlV+egQPXTKIhNdpfzvt6fsjH5+lBZrlVmQoIVRoF0PYYudhnRB9yO96E5Nu/v1vR
         vz7lu6AZ+aYM/wpIqOla6buQZtGyj4CraXSuaoA2SVJ6dIS0oCzbmQF7cXNXhnzh3k9Z
         hoLOh8Qee4r7yMb9N2jHzjADZO+1SB3HzJ/5MgA+yTYUkBsdK6LIYX/UMlTyjsCEdqQQ
         Ap2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyUAQT+0tlrI2P9+zEkY0MlEIIfCoNVnkzoh7ZJSxobd8p10EFAHOwh5BI3T20jSczdLUxvhh3c5O2vHKz@vger.kernel.org
X-Gm-Message-State: AOJu0YyZjpxTbV2YaefNoUex7dzX8gwnnjfPzmEbqgc8bPSiZ2QPD/Zz
	t+SxyooKAta0pHwzlEkYbJoILulufbXuzMpzGtWNaeZB0LxuFlDSsZdpnXMW2mtSP+cie9FZZMJ
	mGbmO5caEYHSmegHbo9XzpHdCbKEg8838aujPdwG9NjIIjffBY6zUqlep7socoHt493gJ
X-Gm-Gg: ATEYQzw9OQ9pJHbb74ap2KV1+rBhhkWQZfbFOlxLdAaOWcOjg1uGMD3832Cr/vzqC93
	Q24w54PYlPCof1Pqgk5t0KzovXOPL3OCCNRkdy1q/vD0uc5MUtNYo07hMdKV0WjT1L4rd7iRrkK
	Cn4h36Ac26YwkkDH1Hb1x2pWPGfQJGjTjbWzk+Y20U6NCy0n5vD5lQil1kpxULPEUIiza62qubL
	emtWZ+TVslKhRQXG74TygujYhiO2j+ZwU2lxJecZiU56N/0u9xzXg9vPXLhni6vjczkkqNG3gNN
	NdUq6vV+c/SaW5qpV0C3A6vqx8TtVbygk77OwayDAVNsIPQjHxei98g7xrQgtU7q2VxpHux9Krc
	W4PEzT/XCuKMIxcuMIxoAe+QgIKnPP9yblPQQGcVrX3wo97rhHvKgL+z+
X-Received: by 2002:a05:6a00:7483:b0:829:710d:a46b with SMTP id d2e1a72fcca58-829a2f7b48emr7158331b3a.41.1772998480894;
        Sun, 08 Mar 2026 12:34:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:7483:b0:829:710d:a46b with SMTP id d2e1a72fcca58-829a2f7b48emr7158286b3a.41.1772998480388;
        Sun, 08 Mar 2026 12:34:40 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4676593sm7818909b3a.28.2026.03.08.12.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 12:34:39 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 01:03:39 +0530
Subject: [PATCH v10 3/3] of: Respect #{iommu,msi}-cells in maps
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-parse_iommu_cells-v10-3-c62fcaa5a1d8@oss.qualcomm.com>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
In-Reply-To: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772998436; l=10158;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=Y3y9pnEGS/egnRkn7PRxW9/ZOSrIlXJJq3NDQFYUkD4=;
 b=JZchFxd3ySsovmwflK1CY4cBpmFZDZuap26lOuWwIhv+ZaGNWH/gkD4Mmfup1E8EbC1OrXdH4
 VkkiDPdY1+8At/dTkuN9k5uBn4Rr7Byfuai9q397xPmXXKr22BEBwBT
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-GUID: uIH6P7IWRX10j6i3FVFOcbHX9PzKqDSV
X-Proofpoint-ORIG-GUID: uIH6P7IWRX10j6i3FVFOcbHX9PzKqDSV
X-Authority-Analysis: v=2.4 cv=SumdKfO0 c=1 sm=1 tr=0 ts=69adcf51 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=wJGdY9mNwEi-N7fqGJcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE4MSBTYWx0ZWRfX5VduQgvuI2/j
 5PavuhHo9cFHtwReycnBn0kwgre/z7GQne7dHF5CR2eXnUZnZU+/O0d9tupqSkWAoEcM8RifMcf
 cvnHvmfGMYITlvXof9ZgowoEidoCQc05bbCDrEGwaOK6zSQPiGn313nZ0V0FTGlxbCjWir8BmjA
 57RCGG2e0wpPFZg0ZraF3v5+QV2ejJhO1CVM8lc2giQVX7+5ma7IwtgE49DED71Vnf6Dw+IfYad
 B2vcvbZYLdkr8L0gP1d+aZ/4/Gw7jUGpFbhT2DUn+bwKJmsJejkksID5Q0Rgaq0aqoBedJl9eNC
 8kr5CC7zFe5G6SgNMAKxxpK2ywVJxxi/WTJHCGAL6Fql705ZV+iu49KKjpUu7T63dshA24LYLaN
 Da+dhnteLl9MCibXRsS6LtD9pYac+0SYTqEZqAr0mhGzwwGCDDY40zL/5bAitjXn+/vKu2sLVat
 uc4EEfSNbzv/vefkiKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080181
X-Rspamd-Queue-Id: 10095231F9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96080-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Robin Murphy <robin.murphy@arm.com>

So far our parsing of {iommu,msi}-map properites has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use in being able to map at least single
input IDs to multi-cell output specifiers (and properly support 0-cell
outputs as well), add support for properly parsing and using the target
nodes' #cells values, albeit with the unfortunate complication of still
having to work around expectations of the old behaviour too.

Since there are multi-cell output specifiers, the callers of of_map_id()
may need to get the exact cell output value for further processing.
Added support for that part --charan

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/iommu/of_iommu.c |   2 +-
 drivers/of/base.c        | 129 ++++++++++++++++++++++++++++++++++++++---------
 include/linux/of.h       |   6 ++-
 3 files changed, 109 insertions(+), 28 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index d255d0f58e8c..a18bb60f6f3d 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -45,7 +45,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
 				     struct device *dev,
 				     const u32 *id)
 {
-	struct of_phandle_args iommu_spec = { .args_count = 1 };
+	struct of_phandle_args iommu_spec = {};
 	int err;
 
 	err = of_map_iommu_id(master_np, *id, &iommu_spec);
diff --git a/drivers/of/base.c b/drivers/of/base.c
index b6e07c5fe715..9c44eb6d445d 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2096,16 +2096,46 @@ int of_find_last_cache_level(unsigned int cpu)
 	return cache_level;
 }
 
+/*
+ * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
+ * specifying only 1 cell. Fortunately they all consist of value '1'
+ * as the 2nd cell entry with the same target, so check for that pattern.
+ *
+ * Example:
+ *	IOMMU node:
+ *		#iommu-cells = <2>;
+ *
+ *	Device node:
+ *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
+ *			    <0x0100 &smmu 0x0100 0x1>;
+ */
+static bool of_check_bad_map(const __be32 *map, int len)
+{
+	__be32 phandle = map[1];
+
+	if (len % 4)
+		return false;
+	for (int i = 0; i < len; i += 4) {
+		if (map[i + 1] != phandle || map[i + 3] != cpu_to_be32(1))
+			return false;
+	}
+	return true;
+}
+
 /**
  * of_map_id - Translate an ID through a downstream mapping.
  * @np: root complex device node.
  * @id: device ID to map.
  * @map_name: property name of the map to use.
+ * @cells_name: property name of target specifier cells.
  * @map_mask_name: optional property name of the mask to use.
  * @arg: pointer to a &struct of_phandle_args. On input, @arg->np may be
  *	set to a target device node to match, or NULL to match any. On
  *	success, @arg->np will be set to the matched target node (with a
- *	reference held) and @arg->args[0] will contain the translated ID.
+ *	reference held), @arg->args_count will be set to the number of
+ *	output specifier cells as defined by @cells_name in the target node,
+ *	and @arg->args[0..args_count-1] will contain the translated output
+ *	specifier values.
  *
  * Given a device ID, look up the appropriate implementation-defined
  * platform ID and/or the target device which receives transactions on that
@@ -2117,17 +2147,19 @@ int of_find_last_cache_level(unsigned int cpu)
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       struct of_phandle_args *arg)
 {
 	u32 map_mask, masked_id;
-	int map_len;
+	int map_bytes, map_len, offset = 0;
+	bool bad_map = false;
 	const __be32 *map = NULL;
 
 	if (!np || !map_name || !arg)
 		return -EINVAL;
 
-	map = of_get_property(np, map_name, &map_len);
+	map = of_get_property(np, map_name, &map_bytes);
 	if (!map) {
 		if (arg->np)
 			return -ENODEV;
@@ -2136,11 +2168,9 @@ int of_map_id(const struct device_node *np, u32 id,
 		return 0;
 	}
 
-	if (!map_len || map_len % (4 * sizeof(*map))) {
-		pr_err("%pOF: Error: Bad %s length: %d\n", np,
-			map_name, map_len);
-		return -EINVAL;
-	}
+	if (map_bytes % sizeof(*map))
+		goto err_map_len;
+	map_len = map_bytes / sizeof(*map);
 
 	/* The default is to select all bits. */
 	map_mask = 0xffffffff;
@@ -2153,27 +2183,69 @@ int of_map_id(const struct device_node *np, u32 id,
 		of_property_read_u32(np, map_mask_name, &map_mask);
 
 	masked_id = map_mask & id;
-	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
+
+	while (offset < map_len) {
 		struct device_node *phandle_node;
-		u32 id_base = be32_to_cpup(map + 0);
-		u32 phandle = be32_to_cpup(map + 1);
-		u32 out_base = be32_to_cpup(map + 2);
-		u32 id_len = be32_to_cpup(map + 3);
+		u32 id_base, phandle, id_len, id_off, cells = 0;
+		const __be32 *out_base;
+
+		if (map_len - offset < 2)
+			goto err_map_len;
+
+		id_base = be32_to_cpup(map + offset);
 
 		if (id_base & ~map_mask) {
-			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
-				np, map_name, map_name,
-				map_mask, id_base);
+			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
+			       np, map_name, map_mask_name, map_mask, id_base);
 			return -EFAULT;
 		}
 
-		if (masked_id < id_base || masked_id >= id_base + id_len)
-			continue;
-
+		phandle = be32_to_cpup(map + offset + 1);
 		phandle_node = of_find_node_by_phandle(phandle);
 		if (!phandle_node)
 			return -ENODEV;
 
+		if (!bad_map && of_property_read_u32(phandle_node, cells_name, &cells)) {
+			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+
+		if (map_len - offset < 3 + cells) {
+			of_node_put(phandle_node);
+			goto err_map_len;
+		}
+
+		if (offset == 0 && cells == 2) {
+			bad_map = of_check_bad_map(map, map_len);
+			if (bad_map) {
+				pr_warn_once("%pOF: %s mismatches target %s, assuming extra cell of 0\n",
+					     np, map_name, cells_name);
+				cells = 1;
+			}
+		}
+
+		out_base = map + offset + 2;
+		offset += 3 + cells;
+
+		id_len = be32_to_cpup(map + offset - 1);
+		if (id_len > 1 && cells > 1) {
+			/*
+			 * With 1 output cell we reasonably assume its value
+			 * has a linear relationship to the input; with more,
+			 * we'd need help from the provider to know what to do.
+			 */
+			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
+			       np, map_name, id_len, cells);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+		id_off = masked_id - id_base;
+		if (masked_id < id_base || id_off >= id_len) {
+			of_node_put(phandle_node);
+			continue;
+		}
+
 		if (arg->np)
 			of_node_put(phandle_node);
 		else
@@ -2182,11 +2254,14 @@ int of_map_id(const struct device_node *np, u32 id,
 		if (arg->np != phandle_node)
 			continue;
 
-		arg->args[0] = masked_id - id_base + out_base;
+		for (int i = 0; i < cells; i++)
+			arg->args[i] = (id_off + be32_to_cpu(out_base[i]));
+
+		arg->args_count = cells;
 
 		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
-			np, map_name, map_mask, id_base, out_base,
-			id_len, id, masked_id - id_base + out_base);
+			np, map_name, map_mask, id_base, be32_to_cpup(out_base),
+			id_len, id, id_off + be32_to_cpup(out_base));
 		return 0;
 	}
 
@@ -2196,6 +2271,10 @@ int of_map_id(const struct device_node *np, u32 id,
 	/* Bypasses translation */
 	arg->args[0] = id;
 	return 0;
+
+err_map_len:
+	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(of_map_id);
 
@@ -2214,7 +2293,7 @@ EXPORT_SYMBOL_GPL(of_map_id);
 int of_map_iommu_id(const struct device_node *np, u32 id,
 		    struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "iommu-map", "iommu-map-mask", arg);
+	return of_map_id(np, id, "iommu-map", "#iommu-cells", "iommu-map-mask", arg);
 }
 EXPORT_SYMBOL_GPL(of_map_iommu_id);
 
@@ -2233,6 +2312,6 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
 int of_map_msi_id(const struct device_node *np, u32 id,
 		  struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "msi-map", "msi-map-mask", arg);
+	return of_map_id(np, id, "msi-map", "#msi-cells", "msi-map-mask", arg);
 }
 EXPORT_SYMBOL_GPL(of_map_msi_id);
diff --git a/include/linux/of.h b/include/linux/of.h
index f50d7a3a3b28..953f2dbe0e86 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -462,7 +462,8 @@ const char *of_prop_next_string(const struct property *prop, const char *cur);
 bool of_console_check(const struct device_node *dn, char *name, int index);
 
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       struct of_phandle_args *arg);
 
 int of_map_iommu_id(const struct device_node *np, u32 id,
@@ -934,7 +935,8 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 }
 
 static inline int of_map_id(const struct device_node *np, u32 id,
-			     const char *map_name, const char *map_mask_name,
+			     const char *map_name, const char *cells_name,
+			     const char *map_mask_name,
 			     struct of_phandle_args *arg)
 {
 	return -EINVAL;

-- 
2.34.1


