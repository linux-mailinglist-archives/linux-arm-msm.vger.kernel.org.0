Return-Path: <linux-arm-msm+bounces-117876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vQ/ZHVJOT2oIeAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:31:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CA472DB7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:31:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PM6OnJot;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QFb68wOu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117876-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117876-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B4F23051944
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B043E0080;
	Thu,  9 Jul 2026 07:29:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D663E0098
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:29:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582197; cv=none; b=a6kF+9MVoZ9CLAHgr7B5MIhbtGaV/mTrgPyOt7NkBWIlaiuDmquu8cFrY8/LDIJWWyjnBwrSuxjjhe4TXnvq/nCXW2NFNVkdeZm2IoP8DaCSwhoL/4HF6JrYLdULUNhfYZlOshqnmADDkfqp76UUX9gZFzSsJw2xQEf8/8tO45Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582197; c=relaxed/simple;
	bh=OyZcDfisQ7Y03Tga3N3GCuQdIV0fLv/dNHzOc2IqdHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddcReXDTNSzJH0wf8BSux3dtP/xVnZVvBhWW6XIlcpAN+EO0oqbgG43iydWdrwUmDgOYHQRXMOTG23zqv6hDjGPA0GZDjwrPcy4huAUZge9y2tNaQRwzGRbiUsoNe38G4H2iTnTVx0lg8PMFSWg7/g64rAkxryPZief7tncmwWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PM6OnJot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFb68wOu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669618DW892153
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SAIWzkhO1FLpQ+i7r/tKtt/ZcJ0vBvJSb0SWQVnfJ8=; b=PM6OnJot10VdgJ6L
	E5QcPHu1V0QlIzMIHYiKkbhLh2YD5CAdBlZZaf835fckTm4pQIzNR3rzEgKNWxz7
	putFCodKHEF1VeuQKP717iVxflN/xT+5lYPoUMUY0Y3KJQ478osl3L0V8BJL6Idm
	CuqlGNv1viLA08sqjM8gg3HgA5agNG9qEfZTzE8I+NvbbEfJIiV9Sv+6OGLSPfu9
	HRSqsCUhW0kVUuuSqSz5EguB4vkIJ9vYg/71xTAjK9JvJF2srGv4lz0exkQE10YU
	zWf9fmWlFaqrTVMdoFBoSiLJfQRPoQD/OSrNlEwZX77CbZniAoCtlDECqv/9VMuM
	+wvcCA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvtc6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:29:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8486482e30fso22301b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582194; x=1784186994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SAIWzkhO1FLpQ+i7r/tKtt/ZcJ0vBvJSb0SWQVnfJ8=;
        b=QFb68wOunuamu1vfWF1gzTLC+G8XAlOby8jYccB0U36S+QQAPwT4a33495+0utO07K
         hyc/RhbSC0mSpjTqqwgGA98dhA2pK6wdB9Gw/JFRMvETkEE70sj4EXUT0axbjx2ye6kF
         M3O7NQMEhQ6EBcxRxUbSh9Xy1lIOU5Yj2iWInrJo3Bml0IM+1ZENWYWIWDI8HMBvR72r
         LWfBfAAP5rV1BzBAXJJAoUEacJ9rTNPMikuPkHsLImNlmOSXXwOM5pHs7xTI1gF1ed6+
         1cKW6iXjkOHiU3K6SPpXV12rJ9xFrqYWly/Lcp5I8DiZzwBClwIgSpR8EcECvwZAd22c
         /5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582194; x=1784186994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SAIWzkhO1FLpQ+i7r/tKtt/ZcJ0vBvJSb0SWQVnfJ8=;
        b=efmz//KljqJEFUSS6arWtrOfFtDarFoDoPk9fIXC7vdewSpXDjZbm8rdGc+J3Vg+rl
         rLMEVlMn2pIvuMWGS3j8A2j8FBFeJn6bUtz69lZ2/MsrXBjgAXBHaUN072rB3vUIhWR6
         a9TjXAmOFFzOd9Dd4OJbl8RNpxFEqs9+XwPzn+w2YEv7WlD1N1eHp1hz0HPPv0zuEzZI
         r4f/8Y8FatFplFAPDL7UAUGOQXHqLnFannp++aLPXBZZpb+vcbsKHtTYWOCHj+IAI4fp
         93EhV037l6KEeot9V17yc84mZWPYEMcTdzHh+4cRuOTe0uuI2ojSx63TQOqXcSB1m8QQ
         +kgA==
X-Gm-Message-State: AOJu0YxZU93XUfBn7aBBf92drCUx8ZgxzgL6Y9PeoSCZvW5y3s9Sx4kd
	jipWYDMi3iGQuJVS1DgDjbq76svhDZuKta/jVRLSpFalrTM8ynLHBaWof8wAmVJUxVxhpuAQfby
	PmnI5M0hJdTZicVScE9N/mVHC2UmRlZK3XQ3mdwrsWPJUtTZYMkJnUgm+dxD5E2YKomrD8d2JkE
	fRiHQ=
X-Gm-Gg: AfdE7cnLcl/+H57dnCyvywVgnWg6MZrBTT7wUHjFAnllmYU/nVlNSgRITutTBGcBe3V
	d097p8KypiC7Bv7Hl+uAeFmX/QUyXVVSEo7SHE1eDS756W9B6CKq5UG1B1MdcdJgF5PRubTSmeu
	9WQW/0qnPP/Ob1LSEfuZNDNREn0IQjKguMtUzlQZ1KzFAb2Fd9p3L4jpbbNSk20GKHlRjeoL/I6
	CPVb0AP+q0vbu7lilyluCOEYXduX3gj8wc5z2MHa/sL/8FIGl/1GauLpSdYi0TVqWb5PXV3OEvU
	AtgJ60tt+TtP1N+v9e8bP440Rv5mCEEbsDCqf6DqQ0hb7aPF+a8em4XsKFXsajde68rFwW8GKmw
	otMQ72NeLHCSK2QajhsWhHxuwkX88TR0lht7z5mEFByeJoQMEuPGiS1Q6LpgovA==
X-Received: by 2002:a05:6a00:17a0:b0:845:e40b:dd58 with SMTP id d2e1a72fcca58-84856048ed2mr1603264b3a.7.1783582193873;
        Thu, 09 Jul 2026 00:29:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a0:b0:845:e40b:dd58 with SMTP id d2e1a72fcca58-84856048ed2mr1603245b3a.7.1783582193462;
        Thu, 09 Jul 2026 00:29:53 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d44d53sm8167222b3a.38.2026.07.09.00.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:29:53 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 12:59:41 +0530
Subject: [PATCH 2/3] power: sequencing: pcie-m2: Match WCN6855 and WCN7851
 UART BT variants by subdevice ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-fix-hamoa-m2-w-disable2-v1-2-5e725091266a@oss.qualcomm.com>
References: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
In-Reply-To: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>,
        mengshi.wu@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfX57hsrwHAMZg/
 pE2VHcG2DCRgmO/aX2b9EPKiO6Z7FsAFi7n8paB/YF5tQzOlxl5aGnYZvyDq5h++VKWnkJewxXI
 Zgxk99fHIxWk7929j2ghIhkmuMBTMz4=
X-Proofpoint-GUID: -ld7fnyUWEpb-07gQch1JRNWiJ9C6xIy
X-Proofpoint-ORIG-GUID: -ld7fnyUWEpb-07gQch1JRNWiJ9C6xIy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfX09xiWtSPL7PP
 OpBRXLm9DdufQZCsIjpb1NHTf1tQxO3/Il2zhVvwSDeHaPQcfau752nvrxoj2sMjLA3UG2Rb4F0
 jsA0wp5VaeBOuvvpKUy0Xx8br7xg3AuBDED1KR/JiNQGBX1GDxGl5nbZ8BWRJb8p6UwLfEeItfv
 JOJQtaGXQf/sYLgh7XMubPstw3S0qHVA2AqnYcXZp0P0HBdtzH9JJ9zghQcH1nnnm53SgONAzTs
 wYuar5CNTGWAqhlT3vwYDy1tL6DgIsK2Xp+r021ci6StAFFXKfRLgWWykdLLjq0c67g5na+wVsS
 y1Gu5Mgv6gQFBIwC77nUCDG0H9uaRACZPfC4wTjoTZk3sXaTvdtvNi6QYyLnzMzeQBiSDN4K7fc
 2wFK/VKUjuhsz6tH6NaNLSKDcADuGuA1Nt2VOXW66kNV4djjdrpJ4NbjGoLMMO27RXs4Bn7QxDh
 h+/hmuOzljp4dw+URIg==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f4df2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=718rDa6z-us7KMpumiEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117876-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wei.deng@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07CA472DB7C

The WCN6855 and WCN7851 combo chips are available in M.2 card variants
that differ by their BT interface: some expose BT over UART while others
expose BT over USB. Both variants use the same PCIe device ID for the
WiFi interface, distinguished only by their sub-system device ID.

The bare PCI_DEVICE() entries match all sub-system IDs, so both UART and
USB variants hit the same table entry and trigger UART serdev creation.
For USB variants this is wrong — there is no UART BT interface on such
a card, and the serdev probe will fail.

Narrow the matches to UART variants only by using PCI_DEVICE_SUB with
their respective sub-system IDs. USB variants no longer match the table
and will be handled separately to deassert W_DISABLE2# for USB BT
enumeration.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 83fe6a1396bc..cf51122d54fd 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -191,9 +191,11 @@ static const struct pci_device_id pwrseq_m2_pci_ids[] = {
 	  .driver_data = (kernel_ulong_t)"nxp,88w8987-bt" },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x1103, PCI_VENDOR_ID_QCOM, 0x0108),
 	  .driver_data = (kernel_ulong_t)"qcom,qca2066-bt" },
-	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103),
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x1103, PCI_VENDOR_ID_FOXCONN, 0xe105),
 	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
-	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x1103, PCI_VENDOR_ID_QCOM, 0x337e),
+	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x1107, PCI_VENDOR_ID_QCOM, 0x337c),
 	  .driver_data = (kernel_ulong_t)"qcom,wcn7850-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1112),
 	  .driver_data = (kernel_ulong_t)"qcom,qcc2072-bt" },

-- 
2.34.1


