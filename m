Return-Path: <linux-arm-msm+bounces-109062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LmNG4AND2p7EgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:49:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C62F75A6451
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 221123127853
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2633D4120;
	Thu, 21 May 2026 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0rwvwAq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBc703VD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B2D3A3830
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368223; cv=none; b=Qs25F603MexYZ3NSMvVMKUkJzlqkJwM7OY626WWXz9UqhN/PITgfeRdGZHzKmDviZB1Ao8H7rNJU41rEl2vsb5+/1DwJv2C8VIA9d4LFVuCdDH/cOPte8Hxn2HMnGcLBa+fRw8bTwpH0CW1m8hcz1PIgibdEnCdBmYF6n3pQx5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368223; c=relaxed/simple;
	bh=5/2BYjXjluc8EIuTVwI/UNkQU9qRZBXpI4urNoHwCAw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eAgfmF8nlUVfsRyNEF5WwvoxtPiULVlGty3nt2ww00e3bV+S7pg7kGHYzX9MSfFfC22RlQrDzsPqgY32nfgUEiqmSnNPaXQSBVf10kOwoSPh8fvk/DeiMSDosF8ZKc1sf01WbY4+F8By0mS8TaBWwiTJM+/isrHZw0Dib19nYRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0rwvwAq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBc703VD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99jj93343452
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=piaeLJyu++WVR0SFsnTfn4
	SSjmjG7Pb+pUvnQO6EiOQ=; b=X0rwvwAqKisht7gptSDWXp0UW0GtMZ444zkaBh
	0CTWo44j5eoBSnCDBNeY6tr1TPOcBXkyR4IMDBKtGxkzCfQuIjS3McxALljMe+iW
	4a8kuC7foVQrIuQlK3HQvIU/AhoXxIrLyoeMdy0Ux5S1dfhpo61rQTul9cS6T7aN
	G7s9jUVXQbSAOGljv48TjodyWHWR2+TFS+oNjKYX0nV/2RNwivr5cCI6bCocsNyi
	QIZxhq+s+LKGI6X+MlSf/w3El+KjHjkRjq6s/rsVWRtxUV/OsIdz7W1CJpoW4Y1U
	MuvfWo3i0EzHwPT0KTaLOlq+PgGSl9qprOxSUE2kMK3QqlRA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahscd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:56:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8292e18166so3124074a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368218; x=1779973018; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=piaeLJyu++WVR0SFsnTfn4SSjmjG7Pb+pUvnQO6EiOQ=;
        b=MBc703VD/MiL7sx7fbd8+pAyAJ79xrXPEAvoFV5ivTPVdGEqR8CMi2t47+EXa9zTH8
         bED0H18m7WzoN4Hz//rxUsZATVUa8wWgzHkuYWPcUprf04kKAmOHbjZCsUFEOohAXlkM
         MjApcGKq8BhK5fvMGW3j20HzvXcDFgS3wiZKzgI5n7+1iidiaaIW5gxXj0+tVyYcf2jj
         STWfGzS3zXyHBhKHv24ngiKMVDWlHd7ST7Rv7/ENltGps4mVRPhCQf3BNnpqvnWFlAv4
         mg1W1gQyIkp6gfKVLmnVHl+QKLgWPl/MhU0KCpdsyjzviZiuNx4NPO4CH0YZ5VT/w44T
         QB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368218; x=1779973018;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piaeLJyu++WVR0SFsnTfn4SSjmjG7Pb+pUvnQO6EiOQ=;
        b=XCJdwl1gbDLVMhLPsNpTjwpIFrXaCS7RzcmGHKvrhfLRayvguRl1BO0CTll/XKPy1V
         Un0tDqi0AIHXVn680+dNw5fZuc9WaR/WH+lVMq7pWoq5Nr4DzrDRL3kpaO4xB53OqMyC
         qYLDB49q2cPSG+2N4xtAzakt2BcWzKdNCU7E51EIycarCZiEux+h0MuRXSq+LQJXEmqa
         owzJ+aXny2rWzIDzBQGD53ecWiXj/z5gn4Dz6Ge0fMWJNWdEJhC7u79S1WDHQRqc4uFW
         PSLZN0t6ijRtEmMbbFVcKKkGFRrIXreAxm4P8Wz/DKdEkieAQ57a9pb709lTqVFHprx8
         QQHg==
X-Gm-Message-State: AOJu0Ywab+44VRMSOw25CaWtsPB9Olb1KA0jDVeT85ZcVAVoeDoOHQrc
	rDYzB3CW2s2IPKj+C5yVaxgzezZdR/zOnmy//X337yFrwwPyRzGdw3gLny5Dp30cICeC7s/Ygg7
	Ph3Kqr1KCDzpO59FjV9W/VJY4btesoGSyWXWkc5MhK4A5vBxKsNbWNrWrsrF/+KqAK7rH
X-Gm-Gg: Acq92OHCDQrFIJDfACVuKtrOIReeocRy6b8YxMjRtfBd32T0CxT4EiWAc92cKjZ9QT8
	KRnzaGVkrJwlFkXSJplrv3QPNZpsfKbrQGoeOeP+LQME65+0TO72Rel4X1LvZOa3uLBYgYrNMRI
	ybFI3Mja3AZ87cx+/0InsTrIrhlhrBP3zkrA7ihiSumEG7rgu5FaEmMtHXL5O8SB2B10FXA162O
	TcFHdIk1vmFnHIb0Zw9Vg60T7sdBdipdubkfjdYlt4leUZGi/g9+NYDUsQkbbw4M3kG0fdWReiu
	3inHpgV8Chsi8gCPW6g+R1WnEAejHfQ/j9hJePRiIQNth55QY+5UhsZdV5t7W9s+/PLRojmC5lF
	M98EHEZKB32gQJaLd/swcngTmiLfbKO8Ov2mPt4eD7uk4zk4m0ogjJsMC
X-Received: by 2002:a05:6a20:430c:b0:3a1:90ef:7e46 with SMTP id adf61e73a8af0-3b308859fb0mr3466666637.33.1779368218424;
        Thu, 21 May 2026 05:56:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:430c:b0:3a1:90ef:7e46 with SMTP id adf61e73a8af0-3b308859fb0mr3466631637.33.1779368217903;
        Thu, 21 May 2026 05:56:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85198f508bsm357984a12.20.2026.05.21.05.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:56:57 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/4] PCI: qcom: Add link retention support
Date: Thu, 21 May 2026 18:26:32 +0530
Message-Id: <20260521-link_retain-v2-0-08ed448b081c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAEBD2oC/1XMwQ6CMAzG8VcxPTvSDmTgyfcwxCAWaYRNNyQaw
 rs7uHlp8m/y/WYI7IUDHHczeJ4kiLMx9H4HTVfbOyu5xQaN+kCIpHqxj4vnsRarWiooRVNmhjO
 Ii6fnVj6bdq5idxJG578bPtH6XZ0cCcs/ZyKFynBuCq1TbLPryYWQvN5137hhSOKBalmWH9md+
 8StAAAA
X-Change-ID: 20251001-link_retain-f181307947e4
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368212; l=2776;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5/2BYjXjluc8EIuTVwI/UNkQU9qRZBXpI4urNoHwCAw=;
 b=EOSZDRFne1tilI/fYA+ZUVIeA0W/JA7+2Mrt2wzPNN41PyaduACfm5ow6izeQ3wbs4Un5xqeu
 6+6WRklFAFACnMq0cwp0OlHO6NGAzqqZebY9N9n7KcWnkMY6+aBd3yu
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMCBTYWx0ZWRfX5KpwDHJ9dEGB
 DDWxM0JcpL4psvBRgqP3iqpGyYSCtR865dgE3vRrzAgzr6dZjodaCCY+56c5MY0xrLTmMz60HZX
 xdslOmmGJnkWb5vk5apaWzntYwLDY5OFIYEtl8FYj/DeaB3ENJZwdwL5JnSbTimB8yC334mxLmS
 D+CiwGg+WM0zD2b1UG2Uikeb0CT0ZP8JjmRV3S/AQQSKMclGLlw2qtCdvTsKvlbVK6Nj2FNbEJ3
 jzdbzJWTllbxw5MAsazL6ZRcpcaYEoYF+S8CTYshJjakF9tunqN2MdqJV0RuDD1btBJJMb/eG6x
 kp19Tq/MkYf6lATHuwmllrFBFVv/1Z9HnmfsA+HkCUJLe1BfNjVdJd5Gxxt40B5V0+FLIJFaE5K
 z8Vj4Dln2B7UMt0x0djxvlgnl0I1u1Ma+JNJEo7fmF9+OowniTGTocspimsmgaya2hGxMrJptPB
 hh94tzL1NJL0+E2fAWQ==
X-Proofpoint-ORIG-GUID: kgzbKaeiwXPNqntWg_iAsgo9Gq-OlqHu
X-Proofpoint-GUID: kgzbKaeiwXPNqntWg_iAsgo9Gq-OlqHu
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0f011b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fuwIWhs0SkhWFt5P5XoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210130
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109062-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C62F75A6451
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series introduces support for retaining the PCIe link across
bootloader and kernel handoff on Qualcomm platforms, specifically
X1E80100. The goal is to reduce boot time and avoid unnecessary link
reinitialization  when the link is already up.

We are not enabling link retantion support for all the targets, as there
is no guarantee that the bootloader on all targets has initialized the
PCIe link in max supported speed. So we are enabling for hamoa & glymur
target only for now based on the config flag.

If the link is up and has link_retain is set to true in the
ithe driver config data then enable retain logic in the controller.

In phy as we already have skip init logic, the phy patch uses same
assumption that if there is phy no csr and bootloader has done the init
then driver can skip resetting the phy when phy status indicates it is
up.

Problem:-
1) As part of late init calls of clock the framework is disabling all the
unvoted resources by that time and also there is no sync state to keep
them enabled till the probe is completed. Due to dependencies with
regulators and phy, qcom pcie probe is happening after late init which is
causing the resources(clocks) to be off which causes the link to go down.
To avoid this we need to use this kernel command line argument
(clk_ignore_unused) to skip disabling clocks as part of late init for
initial version. Once it is resolved we can avoid those kernel command
line argument.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Rebased with latest changes
- GENPD/power domains are not longer getting turned off with the latest
  kernel, only issue is with the clocks.
- Removed the patch [2/5] PCI: dwc: Add support for retaining link during host init
  as we are not seeing much difference with this or without this (Bjorn).
- couple of nits in commit & prints (Mani).
- Remove skip_reset for the long term (Dmitry).
- Link to v1: https://lore.kernel.org/r/20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com

---
Krishna Chaitanya Chundru (4):
      phy: qcom: qmp-pcie: Skip PHY reset if already up
      PCI: qcom: Keep PERST# GPIO state as-is during probe
      PCI: qcom: Add link retention support
      PCI: qcom: enable Link retain logic for Hamoa

 drivers/pci/controller/dwc/pcie-designware.h |  1 +
 drivers/pci/controller/dwc/pcie-qcom.c       | 74 +++++++++++++++++++++++++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c     | 31 ++++++++----
 3 files changed, 88 insertions(+), 18 deletions(-)
---
base-commit: 8bc67e4db64aa72732c474b44ea8622062c903f0
change-id: 20251001-link_retain-f181307947e4

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


