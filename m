Return-Path: <linux-arm-msm+bounces-118232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uHDuB+rCUGq24gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:01:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C8A7395FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:01:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=drQdye0z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WbJgLcS7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118232-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118232-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB61B30753F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C37B407CE5;
	Fri, 10 Jul 2026 09:57:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8933404BF3
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677477; cv=none; b=LMSElytgdB+bcNE2tFaM/a38tU0NyZtrvlMwqL1xKmQu4bpIU89YZPxrV3w8fuEga9fxATbszDO5iSJxTUISW/e+OEmFKV9pHMfPCBnkc0fcNuQVLbmfsFZcQamEg1Z3kPwxVVUGJkta5q9Ic8tevHdOLZdMWBWk8rFfR/RJs5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677477; c=relaxed/simple;
	bh=8JpUJth9XTvH2/KUENAtj9vpf8EiqqScCzN/6TvG46E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DVH4u/PK9vwmAAekNqs6c5dnyrVRc8JR2KPnWxxVlUBF7yMTeFLSTxGzNjz/Dqk1fqa9279XU6TvXtpDCwQyD3YjAtohiH39BS1Zt3jy+ViGEp2HrESWPLenRZ4L0xmzBpWKI+wuuPZ+3dm7C0sDGpRzPkl4fqfXOb9zIBzwO3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drQdye0z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbJgLcS7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eKMD190769
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L/+fhSSKhqNyPBIhKtJ3rdCectIRZdOdeDVvpYe5lcc=; b=drQdye0zyYR6/ADK
	eR60QZa7r+h5eWK8gLYEiTp+Om71n1v+Pq0B1n+psFTOnW336SERmkLoUkmukSqM
	stLkpzbs70Kv1wJ8ENJDyvS4IroFhm5204VewBqk1VH+roQwVH6pqsKTx1MTIJlk
	UYZHQVxH7BG8/6b9dOm/dMnRCkkNKs1O66lUiexHBuVodg6AIpKWxRGf8LKMGd76
	gUTKQFOQNmoVz/qiQbw1WolkOJUllEW9VWGeR3gXzPqMn2T9Df7hGWw63Se1URA6
	ecXpjcSqU4SN/QUe6gZqfsu3EU8aie32TihzR29lTYYTpg7JU9mHHV+x4X+EGr2Y
	l8APDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n1as2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1852a86fso7932081cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677470; x=1784282270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/+fhSSKhqNyPBIhKtJ3rdCectIRZdOdeDVvpYe5lcc=;
        b=WbJgLcS7eW+jP/21gcjR/0ZsyFQ1z+4OSqaUq34tt6yiT656lQcFE1ZSaxDfk+0WUW
         BVTGS0kxpVDzStHCMuOu7+LxxmfORyDGsaAd8OuPN1W515eNQR5i/PDGBLqkuZblvNFj
         ZG0tVlgPXFTttJ4KNcTiv/k/e/sM8S+1xfI+wq8OeRyfZL5vAf8Ek5/Iq53P0FSxAbNL
         m+IIFr47svXKFGR29iPtqIADjNJM7j5syHXAWXn7qXqP3TGoFXoVWVmus11P+31J6c/Z
         bWbbf+AXXpKo6pC/BTewxzmUc5yrD/AvDFBZybw9GCr7j3Iwo7uACf4/G/F0TlHjXDZT
         i1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677470; x=1784282270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/+fhSSKhqNyPBIhKtJ3rdCectIRZdOdeDVvpYe5lcc=;
        b=Kxrh9bGEYlIrHyR7y6xuQ5nrEXKtpXL1M4KcrTkQI2NwxcxPuf4nWEUfGryVJO7bxY
         w2aJYi4R+x/wSWk9lCWPbPkyA5mqtlf8tM0Aw1//EborWAc3E64AZPAU8ofaHMOAxawo
         KFxEWSlyU5bTlKGw39gbyfrUIVlfJB8uZPuadhut9b/5l1RciPYFbrY15giQaBmDIID2
         EIPNKJzDs/SGkmLM+LKGtWgQ7w4rXemCZ1oaLHlXNOcKaDBdZGvv7pWhQTRQdmpnKTT8
         ZFWGR4D5cYzE2L3Ps3XNF5vEWvLaEPatOur8marp8V5gF7PlkuEI8bphPKK40JM3Tb3A
         kqPg==
X-Forwarded-Encrypted: i=1; AHgh+Rqt5pTHhpqL7gkB5Wza3U5yXROXcazIt51EHD93b+RjV4QNmvjP9sKl6Z8B4bSQmOGy8/ZHySfD60NEL6iB@vger.kernel.org
X-Gm-Message-State: AOJu0YxvIC75+Y72eeyJ1IIixvZiR97zAZtRT4uJT9DDdyYu0GateVSj
	5WjqvqmIsNSPqDeRTfq+uKeXje7/U0BEm0buP+7WviIYZnnP9Uwne0wS8hAFOxtU0j581QxfMAc
	229TxYnZEzxaqJlyb9vwRe0khrfqoLAxHkaQgO7jTiapAwUmxgh5xEnL9PXIsnFGnRyRy
X-Gm-Gg: AfdE7cl6BQTEXNcg5VEcOSnmbWRs9Gattbv3nkq7wUikdPV/gzbWrnaylrJiit/OnES
	4VrQQiO66pk1kAZqUlK8I+pl2at5gcCdABtDO9V1mWmtWJj4lA0nfgVjJjF16Fah4vfiyx07kdv
	w+01NRWo6sPwTu6FeEPyF/v7hHX8c/U/l8bXgKiM5XZ2o6cmDtyUp8OXTG66zbZC/p8ey/zw9HV
	NkKeeYUmdt0s3SxsakxMYN0nHCJm//npNXhyz1wp7N7AvTj8rcO+McynGcogOxmwMBtdQ9XOZYD
	yGuLTQzSMfvr0UJzmgWlKywZDbSJoDXlMTUMOpDSQ3/s5zSuADwsWXwzLtUMw+/v4VITAx/sFlq
	+UiELozr+u9jnDLBsgwrKMBdbw9Iyz3L6wZiKEv/rS2+usJrju+CY7E6aUnrUovyEhu/bceotc+
	ZxBx4mHlSnF3UvBYlcryfNy7o/78Zpj0d+x2/NDjaX+exzQcpYSsHCxmxORE6QMhFp/Tl6uA/9C
	vbfx3lOQXN8rdn42FK0
X-Received: by 2002:ac8:5a84:0:b0:51c:1967:5091 with SMTP id d75a77b69052e-51c8b3b4c44mr119708621cf.41.1783677470051;
        Fri, 10 Jul 2026 02:57:50 -0700 (PDT)
X-Received: by 2002:ac8:5a84:0:b0:51c:1967:5091 with SMTP id d75a77b69052e-51c8b3b4c44mr119708391cf.41.1783677469579;
        Fri, 10 Jul 2026 02:57:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:36 +0200
Subject: [PATCH v3 10/11] power: sequencing: pcie-m2: Add QCA2066
 (QCNFA765) BT serdev ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-10-46253587af64@oss.qualcomm.com>
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
In-Reply-To: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfXxMJYCziSLY7l
 3oCd3mdK2ZL/O2iVnQ6VDq2A1QeqA5B6dUJm4DKRDRChOf7MvA33q7qmkDU3xwgMSf7/EnEuOZr
 ByUACljfJhr+OU6fclUrGXmq2qL8ACg=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50c21e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hhiJJhbhXc7jC-Wm4KYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: LlIw-UrgHciy2DSaGFMSsbFOYnrQLHn7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX0bK9nOyZGTq9
 zxxtFWfg+T95/HA+E+Zwi5el45V065bVe7wAfoetXZfl8xlCy5U0DyO7HmZKL4Lu0Mq8HyWV2Q7
 OHekAfABqzNaaXtxWeu1yqMG7OXj9fjLn4qO+VpxFgsC0BBgFrA9U81hnCBrETpcr1D99W/YJpl
 G9cTap7kawbUOREg5B5PTp9q3C/NenjUE5VlZ+58PXS2PJrWfLMsynBsLlUr5HxJKCFXB1rx+bL
 t3HMaf1GeLoY+ZECVisml5ob2d5E5UwHZZZX+ZAS+ARB/+g8mSqHJCl0DuTzxicusIk5nLyO7dT
 CbFZdc9v4ZnEYOCqQa035aH9npNJ/4uXVtsB2wuuQi5ACUThxmuysrN6T8mWONlmNMSuXIZERwr
 BUCc/ok4HGQdunTUdXk+VnQ32m67Uq9USaICXRzR4Ej3Jf9jxvuw1GWEkp0PK2KRm3yRubLDlvj
 uBTJkM9b06LcU9WTSJg==
X-Proofpoint-GUID: LlIw-UrgHciy2DSaGFMSsbFOYnrQLHn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118232-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 89C8A7395FF

Add PCI IDs for Qualcomm QCA2066/QCNFA765 to the M.2 serdev ID table,
mapping it to the qcom,qca2066-bt compatible string.

The Subsystem Vendor ID (SVID) 0x0108 distinguishes the QCA2066 from
the WCN6855.

This allows the pwrseq-pcie-m2 driver to automatically create the
Bluetooth serdev device when a QCA2066-based M.2 card is enumerated.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 4bcd5078609da1be966ab30c73cffae5e578934f..5004e70ebbfc370823098ff6df7b79336c1e6063 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -216,6 +216,8 @@ static const struct pci_device_id pwrseq_m2_pci_ids[] = {
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


