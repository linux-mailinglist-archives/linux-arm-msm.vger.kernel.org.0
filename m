Return-Path: <linux-arm-msm+bounces-104384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAR9F6AG62kFHgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 07:58:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A5545A1DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 07:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 269D43024CBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 05:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E763347BC1;
	Fri, 24 Apr 2026 05:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbUw84Gl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTjYmMPp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CA3346FA0
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777010272; cv=none; b=rPeLljxjoakDmjV62zz5/ffKVksPHVfohQrZU099+T4pQJEnk5RwXRqrwfrpWAyp+hQ5kfJX/ddiPEt5wDmZmUwOiLgwXrD03FqYv4fAyrv2YfPpkmv7/f3SsoktUcBhQuhi91MxUIOY2pzxMJRdn0EI9IaoBn9DwH2D8XKMFS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777010272; c=relaxed/simple;
	bh=8nGyFizj14lxyDF8HW6ac6/uoUdkikbwz0y2rpJ/Fhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FPxh2q6pFfFrcGBPp1dc2x1F/RsysjzJpBx0Hb2rv18MiL5mnTd9u2L7BfX7ly+NqNUrmgxcI9AjUghwpBvxSyMPEv2ZD0zn0QpyYYUZXOh5F2aJZ9Zn3j0vDzm4KRoNo5HaeXemrJZGyoQb5vBA6uo31LO0QG83a8IcPeTFfkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbUw84Gl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTjYmMPp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O4gwNG010073
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	muMUt40tNKB60YlRLz7cGJMkl7zWJcvPAhdHfJ4B7Zc=; b=jbUw84GlFC/3S6Dx
	oh7sJ04FqBBCxaOzvCIb/8duPS2GSX9jabQSXglozhM1edlHMhqg/UkDcHZK4WBw
	0TfgA3X+hQnIoztP8ouas3rPH6/hhRkCRDd+79EjpeXeS6Evlumyv5OUpLnE+PDJ
	vHdxODTSiZlPGMtt6mOfEyKKvqWNcGwGvwt5aZu2bFIdn2VkCTrk5RpMYU69zYwN
	+E4sytq7IgcGG/mQ/Lv9QqEPgCdeAxzDi2QwUbMN8StZN0Dsqm9gaLS5z7TFLdjU
	s3Vo1VkwFRQra3GfZa49CYxkAuGVlbQOuZsOR5/Ii7NCc3b3ETo/e5NXsvkfJ7bb
	2z9N/A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqk17brkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:57:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adc527eaf5so58809655ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 22:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777010266; x=1777615066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muMUt40tNKB60YlRLz7cGJMkl7zWJcvPAhdHfJ4B7Zc=;
        b=JTjYmMPpiDyWmluNvhksu6DUL07ZE/s7aX/rJ34X64I1HxXQWPVVSRuKTvvoQndZBm
         P4kZTdQUiXj+e5Gwzd8nTis2Q7uV/u/JBaBJ6tQIMlQ8urRVuYJJKf66/Irn6UAgEoOy
         tpYyranuIgX1rgM9k6JggR6B24Stz/Rs9GRtMgfJiMpHRVJKxlMt23oCFA5CFt9hp/uw
         YSj3X/BwYDJ0dhSJAKxr96i/GSepXwr3QjwULYQOVh/LoizqZI1Y7rhc3FwAVkcrIjzm
         S58UdPFCi9wlAqVqFJa9sP8ZCWEKutFpyVuzvyeFBv4kKfzIHz7GZyzXyV9CoqQuRqnT
         ptrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777010266; x=1777615066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=muMUt40tNKB60YlRLz7cGJMkl7zWJcvPAhdHfJ4B7Zc=;
        b=nJhvVrw2w23Ju0RG4cV53A9GNW5wMUaU6YBEfrkDO6atelxxx8j9Vqozdd5oWUBS/1
         MAemkyhbbQEGc+9Or/MHPeH/tDkISU2jLt0GnpPls+KqyIqJnGwrYnuYyJI9r0HH55hh
         4tKgy8Thfgxrn6C4nX2Z+5RxG8+kconkpDx5uD9FQq0nvt1WSqPKaWWB+gTZe9D/IaF5
         +7tBdz8pRrA5hU8VwuIgRVYItMxjR2C/ipdTxCy3osxIlBD7dhj+4cdppU2QE0AF/EH9
         pJ7HJAH1l0EsIu0HUDdOHylwg4ZvXHWhwnWGbr8tJS/nBbWsbMPynk3DefhKa/EbBVVD
         dPWw==
X-Forwarded-Encrypted: i=1; AFNElJ9Cl8vFkkGGel+QQRTQ+1xjLJLJYNBsxbNmLMiLAZvvuSKyz7rUuN5axhhrsMNr3crqErs47cZwX6yJXJMf@vger.kernel.org
X-Gm-Message-State: AOJu0YynH0U+dW7r1HjkpIPNm6nhsFFWmyED9kwJd3OkakfDyt80VsSv
	Fe+KajsVcXCCh1sgTnC6YEBTDzEZVZpPzCyk5DB6G76INYEj+3nPScCqN2bCsuITcH+U1d9Mr+P
	mN6ZAyY18w0LTvLwtwumRoCEihR9dd2Eoc++s3SvdsuZ9Brp+TUzdyGgYuQG97hxsz80x
X-Gm-Gg: AeBDieuBpolCdTSn7UWNrJlqixsagZmXj+Je6fGqcmCAhuVVxHvn+Wi1PPNzKaf03IZ
	AyCjneyoONcmEdQSOKRmfPj5gNkXorqUEI0fVY92teubHsKamrldkf4O+HarKmod+woZ1HPX6V/
	eeSASfj8Rtr3kWHoMF0RzcSm6fnSK0oyG/EUBqtvUuU/kxmgdPW1XmBBst92Oxb/4qJN0evSGHA
	7KXIWlN71BS2odN1uCD6gc27TbP4MJODHPylcCMZZ0ql1TSgSywB0kYJiWeybq8iBDWxzZWZgHs
	DTA+llhHFqFEUHkWlkwTU+YDysACMiF/jRQKsxtXo83yLqDwiFmVKTk5ryoyi9LEh6I6/phg2ux
	gn2ag6tylprpIsLvmSodYAF9kbTx/7JRxtyfbKRZ9ZKtbnfSyQ5+9GZjmvC28EMbLdG4=
X-Received: by 2002:a05:6a21:33a5:b0:3a3:2b7e:a4ab with SMTP id adf61e73a8af0-3a32b7ebae2mr4715374637.44.1777010265668;
        Thu, 23 Apr 2026 22:57:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:33a5:b0:3a3:2b7e:a4ab with SMTP id adf61e73a8af0-3a32b7ebae2mr4715318637.44.1777010265038;
        Thu, 23 Apr 2026 22:57:45 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79770512afsm17288101a12.31.2026.04.23.22.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:57:44 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:26:09 +0530
Subject: [PATCH v14 2/3] of: Factor arguments passed to of_map_id() into a
 struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-parse_iommu_cells-v14-2-fd02f11b6c38@oss.qualcomm.com>
References: <20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com>
In-Reply-To: <20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777010232; l=18518;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=wiBZojo0J7hwv8jza/KpZ8506QAT1cjvfjOKCApa6Wo=;
 b=dyovb5BdIrhkPQF+mCNMCfJmyuhdwXIWnaGvQc+aQdZ99bljLMJtwDkhvB5KUss3szckMv8f+
 cAYk+DkjlsABxrXW1TO23901phEgBZxg3zuTMcERkBMPC35ZqHH7vUK
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-GUID: WAJzCvo2vtOjY7beplnW3Sc0ThgxxYQl
X-Authority-Analysis: v=2.4 cv=R98z39RX c=1 sm=1 tr=0 ts=69eb065b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=YNKo5iN9BcXwmsqDYIQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA1MSBTYWx0ZWRfX53+12LH+KaHP
 29tJWfhL4svnxIUfrSJ/qfi/F0rbzh0ITjt/mreq6fZMrk68BM0Qdo2bggH4LJoGDpB0Ldopmfk
 61GLa54aPIvoOnH9tKveQmqDAQVBdHxVMcMTpnPvW6jHOoVuEyo+Se6yBpkpYi4Sb6gH68ZcHLo
 TvYAIBEWNYdl3mCXvWGDDpsW5r/zHYEB6ZZqO3unZiP5qknUOBC7+igeOjIqwIRRK+QEsBehy5z
 i9pOUpNDQPX0IB5pA78MBOaXR/Hl2BIXPJ61SRJ0oJf/H5LIZCv0elr4H481jUArxkrvDbKfHIv
 I8DpuMJlqFT0tiREgbaWBzylJU+ROo/jJUMpWvp5DtfhZV7R6X9L9OlE19CQArk5cD9L2J6EmOg
 KHcqg/qz8kLxh3WFcR8/LHpOVRThhiD1yzndjQPweLMO/xXJU34yWWXYiYBq0scwJx5iAefmUR3
 ZN0AwcpVvfUe44Zyktw==
X-Proofpoint-ORIG-GUID: WAJzCvo2vtOjY7beplnW3Sc0ThgxxYQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240051
X-Rspamd-Queue-Id: B2A5545A1DF
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-104384-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msi_spec.np:url,iommu_spec.np:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,nxp.com:email];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>

Change of_map_id() to take a pointer to struct of_phandle_args
instead of passing target device node and translated IDs separately.
Update all callers accordingly.

Add an explicit filter_np parameter to of_map_id() and of_map_msi_id()
to separate the filter input from the output. Previously, the target
parameter served dual purpose: as an input filter (if non-NULL, only
match entries targeting that node) and as an output (receiving the
matched node with a reference held). Now filter_np is the explicit
input filter and arg->np is the pure output.

Previously, of_map_id() would call of_node_put() on the matched node
when a filter was provided, making reference ownership inconsistent.
Remove this internal of_node_put() call so that of_map_id() now always
transfers ownership of the matched node reference to the caller via
arg->np. Callers are now consistently responsible for releasing this
reference with of_node_put(arg->np) when done.

Acked-by: Frank Li <Frank.Li@nxp.com>
Suggested-by: Rob Herring (Arm) <robh@kernel.org>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/cdx/cdx_msi.c                    |  7 ++--
 drivers/iommu/of_iommu.c                 |  4 +-
 drivers/irqchip/irq-gic-its-msi-parent.c | 11 ++++--
 drivers/of/base.c                        | 68 +++++++++++++++++---------------
 drivers/of/irq.c                         | 30 +++++++++++---
 drivers/pci/controller/dwc/pci-imx6.c    | 32 +++++++--------
 drivers/pci/controller/pcie-apple.c      |  5 ++-
 drivers/xen/grant-dma-ops.c              |  4 +-
 include/linux/of.h                       | 14 ++++---
 9 files changed, 104 insertions(+), 71 deletions(-)

diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
index 63b3544ec997..6924e07c7528 100644
--- a/drivers/cdx/cdx_msi.c
+++ b/drivers/cdx/cdx_msi.c
@@ -121,22 +121,23 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
 			   struct device *dev,
 			   int nvec, msi_alloc_info_t *info)
 {
+	struct of_phandle_args msi_spec = {};
 	struct cdx_device *cdx_dev = to_cdx_device(dev);
 	struct device *parent = cdx_dev->cdx->dev;
 	struct msi_domain_info *msi_info;
-	u32 dev_id;
 	int ret;
 
 	/* Retrieve device ID from requestor ID using parent device */
-	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
+	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &msi_spec);
 	if (ret) {
 		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
 		return ret;
 	}
+	of_node_put(msi_spec.np);
 
 #ifdef GENERIC_MSI_DOMAIN_OPS
 	/* Set the device Id to be passed to the GIC-ITS */
-	info->scratchpad[0].ul = dev_id;
+	info->scratchpad[0].ul = msi_spec.args[0];
 #endif
 
 	msi_info = msi_get_domain_info(msi_domain->parent);
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index a511ecf21fcd..a18bb60f6f3d 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -45,10 +45,10 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
 				     struct device *dev,
 				     const u32 *id)
 {
-	struct of_phandle_args iommu_spec = { .args_count = 1 };
+	struct of_phandle_args iommu_spec = {};
 	int err;
 
-	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
+	err = of_map_iommu_id(master_np, *id, &iommu_spec);
 	if (err)
 		return err;
 
diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
index b63343a227a9..dd5f84b6470a 100644
--- a/drivers/irqchip/irq-gic-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -152,6 +152,8 @@ static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
 static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u32 *dev_id,
 				phys_addr_t *pa)
 {
+	struct device_node *msi_ctrl __free(device_node) = NULL;
+	struct of_phandle_args msi_spec = {};
 	struct of_phandle_iterator it;
 	int ret;
 
@@ -178,9 +180,12 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
 		}
 	}
 
-	struct device_node *msi_ctrl __free(device_node) = NULL;
-
-	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
+	ret = of_map_msi_id(dev->of_node, dev->id, NULL, &msi_spec);
+	if (!ret) {
+		msi_ctrl = msi_spec.np;
+		*dev_id = msi_spec.args[0];
+	}
+	return ret;
 }
 
 static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
diff --git a/drivers/of/base.c b/drivers/of/base.c
index ae04487bd614..b3d002015192 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2102,36 +2102,37 @@ int of_find_last_cache_level(unsigned int cpu)
  * @id: device ID to map.
  * @map_name: property name of the map to use.
  * @map_mask_name: optional property name of the mask to use.
- * @target: optional pointer to a target device node.
- * @id_out: optional pointer to receive the translated ID.
+ * @filter_np: optional device node to filter matches by, or NULL to match any.
+ *	If non-NULL, only map entries targeting this node will be matched.
+ * @arg: pointer to a &struct of_phandle_args for the result. On success,
+ *	@arg->args[0] will contain the translated ID. If a map entry was
+ *	matched, @arg->np will be set to the target node with a reference
+ *	held that the caller must release with of_node_put().
  *
  * Given a device ID, look up the appropriate implementation-defined
  * platform ID and/or the target device which receives transactions on that
- * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
- * @id_out may be NULL if only the other is required. If @target points to
- * a non-NULL device node pointer, only entries targeting that node will be
- * matched; if it points to a NULL value, it will receive the device node of
- * the first matching target phandle, with a reference held.
+ * ID, as per the "iommu-map" and "msi-map" bindings.
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_id(const struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
-	       struct device_node **target, u32 *id_out)
+	       const struct device_node *filter_np, struct of_phandle_args *arg)
 {
 	u32 map_mask, masked_id;
 	int map_len;
 	const __be32 *map = NULL;
 
-	if (!np || !map_name || (!target && !id_out))
+	if (!np || !map_name || !arg)
 		return -EINVAL;
 
 	map = of_get_property(np, map_name, &map_len);
 	if (!map) {
-		if (target)
+		if (filter_np)
 			return -ENODEV;
 		/* Otherwise, no map implies no translation */
-		*id_out = id;
+		arg->args[0] = id;
+		arg->args_count = 1;
 		return 0;
 	}
 
@@ -2173,18 +2174,14 @@ int of_map_id(const struct device_node *np, u32 id,
 		if (!phandle_node)
 			return -ENODEV;
 
-		if (target) {
-			if (*target)
-				of_node_put(phandle_node);
-			else
-				*target = phandle_node;
-
-			if (*target != phandle_node)
-				continue;
+		if (filter_np && filter_np != phandle_node) {
+			of_node_put(phandle_node);
+			continue;
 		}
 
-		if (id_out)
-			*id_out = masked_id - id_base + out_base;
+		arg->np = phandle_node;
+		arg->args[0] = masked_id - id_base + out_base;
+		arg->args_count = 1;
 
 		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
 			np, map_name, map_mask, id_base, out_base,
@@ -2193,11 +2190,11 @@ int of_map_id(const struct device_node *np, u32 id,
 	}
 
 	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
-		id, target && *target ? *target : NULL);
+		id, filter_np);
 
 	/* Bypasses translation */
-	if (id_out)
-		*id_out = id;
+	arg->args[0] = id;
+	arg->args_count = 1;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_map_id);
@@ -2207,17 +2204,19 @@ EXPORT_SYMBOL_GPL(of_map_id);
  * @np: root complex device node.
  * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
  *      stream/device ID) used as the lookup key in the iommu-map table.
- * @target: optional pointer to a target device node.
- * @id_out: optional pointer to receive the translated ID.
+ * @arg: pointer to a &struct of_phandle_args for the result. On success,
+ *	@arg->args[0] contains the translated ID. If a map entry was matched,
+ *	@arg->np holds a reference to the target node that the caller must
+ *	release with of_node_put().
  *
  * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_iommu_id(const struct device_node *np, u32 id,
-		    struct device_node **target, u32 *id_out)
+		    struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "iommu-map", "iommu-map-mask", target, id_out);
+	return of_map_id(np, id, "iommu-map", "iommu-map-mask", NULL, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_iommu_id);
 
@@ -2226,16 +2225,21 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
  * @np: root complex device node.
  * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
  *      stream/device ID) used as the lookup key in the msi-map table.
- * @target: optional pointer to a target device node.
- * @id_out: optional pointer to receive the translated ID.
+ * @filter_np: optional MSI controller node to filter matches by, or NULL
+ *	to match any. If non-NULL, only map entries targeting this node will
+ *	be matched.
+ * @arg: pointer to a &struct of_phandle_args for the result. On success,
+ *	@arg->args[0] contains the translated ID. If a map entry was matched,
+ *	@arg->np holds a reference to the target node that the caller must
+ *	release with of_node_put().
  *
  * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_msi_id(const struct device_node *np, u32 id,
-		  struct device_node **target, u32 *id_out)
+		  const struct device_node *filter_np, struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "msi-map", "msi-map-mask", target, id_out);
+	return of_map_id(np, id, "msi-map", "msi-map-mask", filter_np, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_msi_id);
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index e37c1b3f8736..4040467742c4 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -796,19 +796,22 @@ static int of_check_msi_parent(struct device_node *dev_node, struct device_node
 /**
  * of_msi_xlate - map a MSI ID and find relevant MSI controller node
  * @dev: device for which the mapping is to be done.
- * @msi_np: Pointer to target MSI controller node
+ * @msi_np: Pointer to target MSI controller node, or NULL if the caller
+ *           only needs the translated ID without receiving the controller node.
+ *           If non-NULL and pointing to a non-NULL node, only entries targeting
+ *           that node will be matched. If non-NULL and pointing to NULL, it will
+ *           receive the first matching target node with a reference held.
  * @id_in: Device ID.
  *
  * Walk up the device hierarchy looking for devices with a "msi-map"
  * or "msi-parent" property. If found, apply the mapping to @id_in.
- * If @msi_np points to a non-NULL device node pointer, only entries targeting
- * that node will be matched; if it points to a NULL value, it will receive the
- * device node of the first matching target phandle, with a reference held.
  *
  * Returns: The mapped MSI id.
  */
 u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 {
+	struct device_node *local_np = NULL;
+	struct device_node **np = msi_np ?: &local_np;
 	struct device *parent_dev;
 	u32 id_out = id_in;
 
@@ -817,11 +820,26 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 	 * "msi-map" or an "msi-parent" property.
 	 */
 	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
-		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
+		struct of_phandle_args msi_spec = {};
+
+		if (!of_map_msi_id(parent_dev->of_node, id_in, *np, &msi_spec)) {
+			/*
+			 * Pass-through result: no msi-map on this node (or no
+			 * matching entry). Keep walking up the hierarchy.
+			 */
+			if (!msi_spec.np)
+				continue;
+			id_out = msi_spec.args[0];
+			if (!*np)
+				*np = msi_spec.np;
+			else
+				of_node_put(msi_spec.np);
 			break;
-		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
+		}
+		if (!of_check_msi_parent(parent_dev->of_node, np))
 			break;
 	}
+	of_node_put(local_np);
 	return id_out;
 }
 EXPORT_SYMBOL_GPL(of_msi_xlate);
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index bff8289f804a..c0544d9c0921 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1137,30 +1137,32 @@ static void imx_pcie_remove_lut(struct imx_pcie *imx_pcie, u16 rid)
 
 static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
 {
+	struct of_phandle_args iommu_spec = {};
+	struct of_phandle_args msi_spec = {};
 	struct device *dev = imx_pcie->pci->dev;
-	struct device_node *target;
 	u32 sid_i, sid_m;
 	int err_i, err_m;
 	u32 sid = 0;
 
-	target = NULL;
-	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
-	if (target) {
-		of_node_put(target);
-	} else {
+	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
+	if (!err_i)
+		sid_i = iommu_spec.args[0];
+	of_node_put(iommu_spec.np);
+	if (!err_i && !iommu_spec.np) {
 		/*
-		 * "target == NULL && err_i == 0" means RID out of map range.
-		 * Use 1:1 map RID to streamID. Hardware can't support this
-		 * because the streamID is only 6 bits
+		 * "iommu_spec.np == NULL && err_i == 0" means RID out of map
+		 * range. Use 1:1 map RID to streamID. Hardware can't support
+		 * this because the streamID is only 6 bits.
 		 */
 		err_i = -EINVAL;
 	}
 
-	target = NULL;
-	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
-
+	err_m = of_map_msi_id(dev->of_node, rid, NULL, &msi_spec);
+	if (!err_m)
+		sid_m = msi_spec.args[0];
+	of_node_put(msi_spec.np);
 	/*
-	 *   err_m      target
+	 *   err_m      msi_spec.np
 	 *	0	NULL		RID out of range. Use 1:1 map RID to
 	 *				streamID, Current hardware can't
 	 *				support it, so return -EINVAL.
@@ -1168,10 +1170,8 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
 	 *	0	!= NULL		Get correct streamID from RID
 	 *	!= 0	!= NULL		Invalid combination
 	 */
-	if (!err_m && !target)
+	if (!err_m && !msi_spec.np)
 		return -EINVAL;
-	else if (target)
-		of_node_put(target); /* Find streamID map entry for RID in msi-map */
 
 	/*
 	 * msi-map        iommu-map
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index a0937b7b3c4d..c2cffc0659f4 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
 {
 	u32 sid, rid = pci_dev_id(pdev);
 	struct apple_pcie_port *port;
+	struct of_phandle_args iommu_spec = {};
 	int idx, err;
 
 	port = apple_pcie_get_port(pdev);
@@ -764,10 +765,12 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
 	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
 		pci_name(pdev->bus->self), port->idx);
 
-	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
+	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
 	if (err)
 		return err;
 
+	of_node_put(iommu_spec.np);
+	sid = iommu_spec.args[0];
 	mutex_lock(&port->pcie->lock);
 
 	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);
diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 1b7696b2d762..2aa1a772a0ff 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -319,13 +319,13 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
 					   struct device_node *np,
 					   domid_t *backend_domid)
 {
-	struct of_phandle_args iommu_spec = { .args_count = 1 };
+	struct of_phandle_args iommu_spec = {};
 
 	if (dev_is_pci(dev)) {
 		struct pci_dev *pdev = to_pci_dev(dev);
 		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
 
-		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
+		if (of_map_iommu_id(np, rid, &iommu_spec)) {
 			dev_dbg(dev, "Cannot translate ID\n");
 			return -ESRCH;
 		}
diff --git a/include/linux/of.h b/include/linux/of.h
index fe841f3cc747..8548cd9eb4f1 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -463,13 +463,13 @@ bool of_console_check(const struct device_node *dn, char *name, int index);
 
 int of_map_id(const struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
-	       struct device_node **target, u32 *id_out);
+	       const struct device_node *filter_np, struct of_phandle_args *arg);
 
 int of_map_iommu_id(const struct device_node *np, u32 id,
-		    struct device_node **target, u32 *id_out);
+		    struct of_phandle_args *arg);
 
 int of_map_msi_id(const struct device_node *np, u32 id,
-		  struct device_node **target, u32 *id_out);
+		  const struct device_node *filter_np, struct of_phandle_args *arg);
 
 phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
 
@@ -935,19 +935,21 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 
 static inline int of_map_id(const struct device_node *np, u32 id,
 			     const char *map_name, const char *map_mask_name,
-			     struct device_node **target, u32 *id_out)
+			     const struct device_node *filter_np,
+			     struct of_phandle_args *arg)
 {
 	return -EINVAL;
 }
 
 static inline int of_map_iommu_id(const struct device_node *np, u32 id,
-				  struct device_node **target, u32 *id_out)
+				  struct of_phandle_args *arg)
 {
 	return -EINVAL;
 }
 
 static inline int of_map_msi_id(const struct device_node *np, u32 id,
-				struct device_node **target, u32 *id_out)
+				const struct device_node *filter_np,
+				struct of_phandle_args *arg)
 {
 	return -EINVAL;
 }

-- 
2.34.1


