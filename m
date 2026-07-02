Return-Path: <linux-arm-msm+bounces-115940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DywFJwhCRmrhMwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:48:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 625076F6297
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:48:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k5FpqsZJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KEfb8a+O;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115940-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115940-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4D53301FFAC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFB23CBE6B;
	Thu,  2 Jul 2026 10:46:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681C13BBFC1
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:46:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989197; cv=none; b=EDFSJ5D1/4Ysg1dqsbQM2H6f0fnr+VXQwS3Qzg04QQq4ST/+xeRaVlAw27v6ZmW5IdEG4qvwCzvdWzbzuSc5MOVHsgfAWMfvctA+SsOtqxxfNZTjEs/z+fWMxDBM59AYb2M6j9X4mduB7vosC78IO9Ek6/2hVET+GrUs8+WinKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989197; c=relaxed/simple;
	bh=mh5EHmkfn+Hckeu/ga+6Zfj+PX1LbiyTWZjnRAILnCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXzm640SZyRLHHXeYZxAkSjw0NJx0rhoBb88m2pEyiRXgNP3u7A89pHF8U4/Dz12/gC/SAWLLEzS9/NjqXyYXJpLm6GZ+xksBD2lZY2ZfC9+Wl0DV1QGlTZ8b88EUeo5UkYdBdKh7KlL27IUp+ho5IkUrzK9NExuLD7X53wqOPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5FpqsZJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEfb8a+O; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628sKEv4172138
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WzcL6bqjKCQ2yH1CTUP5oKTLu2gCWJgGGyQKXMvuqS0=; b=k5FpqsZJ/ul9VIdn
	MS/ExLfdrIu6kqgYNn79L58nooAp35PFbE2pSFIciwHwN50Xd0HbtCub+OE2k9mM
	2qFE4lAZb2imrPSZs8RdEnnf7CqrU+IvkSlWWM2OVCVIVPIIaBFvvKn2UHlB3mZ/
	YiyuGgqriNu/zKaPHWaYKykSyaCR/6q70El3YyKU2KfnTRSmJkTWKEh5PaPp7G4X
	+atz6T3tEB9TX8YVcabtXEL6fP/vK50px4OmWNecr+YA8SFtZH3sWlkl5xOCdJ33
	PVvF3F/ZZLECVAZir16LM6rqDw5zBmxOjge3VviZiraH/HdrWdne1MiAfAHDRQl0
	2rSg9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwre3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:46:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e538afe65so189644585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989194; x=1783593994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzcL6bqjKCQ2yH1CTUP5oKTLu2gCWJgGGyQKXMvuqS0=;
        b=KEfb8a+OoAeh4QyoGcHyrZ1/wrPYax1n4qq8mjJRlfxpdjW1ZXkvFGjVyatoKbL2UF
         wary64vlG/oU2OIUrDK+ltbpj1gyCyMwqlcAJlqt7rOBef5uU7UDUY3jdOIxVZDBoniR
         4dUDIjvGxiamjtMFg5WkWXIuaDAcrZVVORQSlE53B/BcA7l95NBJ0/CSrFQaWtOFu0Eq
         cV9f+RxCxBWM7JNrgPDXty+IYueA7IfhWgyApcNAUVWsaYqQClK+xUKfy2n0ftpd0dmn
         GUeic7WSMMXOvv0OYlcwAKfWEhr07wZc2Yp0A4AjT1gQAjcUv9V1rQcBX9ALOYH63rSO
         DyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989194; x=1783593994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WzcL6bqjKCQ2yH1CTUP5oKTLu2gCWJgGGyQKXMvuqS0=;
        b=eeLjijS2RnE0BG/GsKP/X9/7rmZxfv1zWM/62N9gvAmI8Tb8PaIrqqsNli8j79UrGC
         prln46wDsuayO18v+9gxwo1vXqs45lkFKG/2prk0IY5ixk6mXT2E7skKnYlTaSDJ5/Pn
         FwHvgnXU00+itWafJ9GFXS8Yh2zSnpl/8W6jN/d7j80UmQNdTbGaFXvA+8pxshLs/W6i
         67K9YkKc5p4kybxXWsVIyiAELDkXiM2Y0GVWO7f/iV13YAVXs1Agp+Rzeqi2t8eKxZVc
         /m7PHyWlZ8StP29ATewwgfu9nFNyZbmxJegw0pHfnl4A1WZ5tNC5dnHRTGQGbDuPB/3H
         ZpaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+OuQ5JxJeNtSHCYnzubbiFV5dQJwrgAtWGWMScDR/3PkEz21HREsPx8lTxzMJyloe5pFfg/CjI25auXKI@vger.kernel.org
X-Gm-Message-State: AOJu0YywYabfyCG9ACz6Ejd+vw8zHHDYxC7LQWL56sJ4u7lKkXWbtW6c
	aO3W+BaYcSAfdjX5fEnzmocPv4VQwiIFbXVyrN/LdYXbQnJMRDIDt33z6mz8lFbHVJjN/sCo8dd
	tPUEE5NVmecQ3o7U97Z7L+r6LMt8ZbWKjFCWeGgrI5/iktpJ/62SlAuDAxArcHQIZxmEb
X-Gm-Gg: AfdE7ckpw9rl3dE8pZVQxm22k+FONROillL74mi2+3cJuBsChUIErsfk0WNwziNXn5A
	qX1f7qjfDQvancyEx9Ugnh/lrkBqb4JLFmTbQCtdtRpD4KZBCOelSZCyQNKA5HaldbdCcXsW1Cb
	2i+YMCd6iUzJ9KvpIw+GkZ0TGl+f0HKSP3a/+PIaPJLZEGZgqz6eLmC55NmRP/slWeGdWrzZKoz
	izERfeVXdx5MbwoFexY0QqsHPFieRqVVevZMLfa1ExlG7iijfKLQhaNqmTRHNcPrs0hHEYhDbX4
	IJfhqUpaYm9EmBS1CUQ1ofak3z5Bu5+NUyrNzUQO+55gRymZzXjtEBFNy4eAx+6FzQOoL235MFV
	9dxImxIsk2xCntTUpZgyoK4bUyWAbU0T7oZz9G0r/1B6eKPqPZvBTXTxYPEi8U5+GLdjCyvbcf7
	HD4MznY6opHPoXq+hcDI9WcqIyfiL8YtnrA6f6+lVXXcKQIGnZiVSmRSwkEYbhiG4=
X-Received: by 2002:a05:620a:284c:b0:92a:f65e:1e95 with SMTP id af79cd13be357-92e7825b261mr707542885a.21.1782989193447;
        Thu, 02 Jul 2026 03:46:33 -0700 (PDT)
X-Received: by 2002:a05:620a:284c:b0:92a:f65e:1e95 with SMTP id af79cd13be357-92e7825b261mr707539285a.21.1782989193046;
        Thu, 02 Jul 2026 03:46:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b5ae4959sm109689666b.0.2026.07.02.03.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:46:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 12:46:14 +0200
Subject: [PATCH v2 2/4] power: sequencing: pcie-m2: Add QCA2066 (QCNFA765)
 BT serdev ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-monza-wireless-v2-2-7b56e2a6a6d4@oss.qualcomm.com>
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
In-Reply-To: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 968hChtEpTN_bwowiebUEflZZmoI0g5_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfX4WOhw548tumG
 eEpg59uZaGwbVmlz3Ho/+1S0S3UQ1Ab8q/9MG0DcBHLPXsH1dNL8UsohgXyj4cKtKx8jIz4plb+
 9dY71//FIJX8zpgSVsqzW3mFfzd7pChXQu7vMVqTReBGESn1ROjEnXPo24IiagLoQv4AQ6oiOmV
 PqEwBKZ8qeCWoB7M5LXVdH47Ogwy+Mj9+L0x2jurXZp+I6vRZ47w4TUd47/yQMDwjRdVH0I6MkM
 tbVypZqgTNBJILYd3GiM+gN2DWdLFq8DfnGfDAkFhn7JHnLZkCeOLBsHEBMQFjKIeo5LOa05lSR
 vvGdLDgG+PzoyblAUwp2p7BMcLfPFI4JjB89o/IQiOIPim5qp6M8WMUqwpi5SPu/ANZKnm28B5q
 kN6xxQxbI95LKTY/N3Kok5DNQxweek1QVh5COAKjbzRwFDBiPfrZ5Mj8z3yiH6qL6af2b5zscGe
 pD6TnVnfwo9YYKv1JmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfX9jfi6jkJFw8l
 rPYR1rZV5iybMgY90NyYeUV2Qk9oF6+lEr2vr2TBqhViH7l5khQavPCupp+BhjfXaezzEtSWBRv
 ZJ9cgFJil0du9jC/SHFncjcaijF/xoU=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a46418a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hhiJJhbhXc7jC-Wm4KYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 968hChtEpTN_bwowiebUEflZZmoI0g5_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115940-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 625076F6297

Add PCI IDs for Qualcomm QCA2066/QCNFA765 to the M.2 serdev ID table,
mapping it to the qcom,qca2066-bt compatible string.

The Subsystem Vendor ID (SVID) 0x0108 distinguishes the QCA2066 from
the WCN6855.

This allows the pwrseq-pcie-m2 driver to automatically create the
Bluetooth serdev device when a QCA2066-based M.2 card is enumerated.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index e3ba9169144dabbf0c553c0a4302c3b511fcaaa1..7cb455569d8eb5da12e46606d9f25bdaeb8a128c 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -190,6 +190,8 @@ static const struct pci_device_id pwrseq_m2_pci_ids[] = {
 	  .driver_data = (kernel_ulong_t)"nxp,88w8987-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_PHILIPS, 0x3003),
 	  .driver_data = (kernel_ulong_t)"nxp,88w8987-bt" },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x1103, PCI_VENDOR_ID_QCOM, 0x0108),
+	  .driver_data = (kernel_ulong_t)"qcom,qca2066-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103),
 	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),

-- 
2.34.1


