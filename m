Return-Path: <linux-arm-msm+bounces-110550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOJgA6dXHWpLZQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 11:57:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A8A61CED6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 11:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DC50307400C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 09:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DD5399364;
	Mon,  1 Jun 2026 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DbacN/i3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGi8AQME"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F43E396D36
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307224; cv=none; b=LbNNkqxupMTV9PPmyGwc9W4VzCuEPxCPq+m0HU/hW9005RvOtywiy/VeNrl3EZh8WlVfv/+jRgJh/TBMWiqhee/B0zqpJFj2ef0AGKpHlW/eSbTHnfTEUHR2jB5Ix82zhUHbmF18k06AXE18R/Ip16McU1YHZ8tjap4mnT1pGlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307224; c=relaxed/simple;
	bh=h4yLRvqGyQTl6OR0GngMd/YRroUj4EhJo0XPHba7d0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGYjq+pJI/uYG+M+ByyLLelbJ6na2Ai4JTAQK8HL+yRGRLdSQgOvPNmpS8KCUsHsfo/Q4BFVibCZxYw07Gnx6jbl1p7z7ZxAyCAqUSBQeAXMGKNEbTFoYBTO1KBAvITBodeV+ZMSDkb9Kw5WC0aRkK8FP+ysDxMFd/SBG7IVe2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DbacN/i3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGi8AQME; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518btWp696762
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 09:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=; b=DbacN/i32nHCv76p
	CcTtvGE5WRiPZvdQsMnzBqqyBcIes7Y785awJiz/7bkY1JRbZByFoGS9X/NaCkeD
	RDarenEiOYz+t0oIZ1eohicKGtRHTA62Wp0FfS8UlRLwoAWSIBLATFDS2EmABKyy
	5Qys48JivQRqIDKHh3gVhYByFbkAeqV3VMVc5rcmQQUch4ox/MQuloM98rRbguKv
	eBgkwKe21gm1mN0scSh7gLCfOhz1znqCIxi8UilJyeUgLdkz+0GPR+tudehQjv+x
	ZoiO8eVQghC0E+pcBIAJHp6D73GN6vSViYchXXJhI8PG2jcQjhobQVV1MKj7GZtN
	EVuBkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7ff0v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 09:46:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517480bde1cso14962121cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307216; x=1780912016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=;
        b=YGi8AQMEOe12uqwKC6ocED5Ofd9Eqim4Pxei+/i4cUIZbWKf+JuFR1i0gnFP6+kJzA
         zGoRqMYUcUgFO+WucTO5exQajLNlyN1IhE1AgEw4B8qthSHA661ixcQ8lnZiXUI9xvDe
         43J3vWAA77mwfm3ws+218FFYbI2/3+OCrjueanuXbZ4riNTtMgtdd43BA7c6LEMfqY/k
         4Vg+knnXYLq5aLgipb/TYAlNNtzINYGtcB6ZhrV8Oe0l8aDHLgvOISnwn3jTI/v5bDQG
         wTWQHKC/18zLBUvUjEbJ59ZtN/yuw03iUIoBqYVs1+Ok53V+fjNz5VOxetATPcTcghqx
         l6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307216; x=1780912016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=;
        b=r+NiR9DjAvtYrYZY5IhMQ2LHM2geFKGSuxL2j94D32BGLk/KjtgPNc+Z3R2tojBwhb
         X7Kw5U0EAEnspddWgRtmNZQoxlQu2zHuLdtQUSisxmfBixCV4ROzRAwrxVUiFuvxQK7W
         y4bS1SGpfnuVDrcoyr9RjYeCBngulxdc1SO8MIPD/+84JdnfEhP/5KVVIxZHAL2Ij3s0
         SFhL9EDtCD1AuX9A0QfEaM7HOMS/fhrEnL6qXse3diC0JjK+mCusCLhnfFqJLeOkCRFw
         imNeI8BSt58ISO20oMZ/wRuDpjuHJiSvba12C/N/0WPdGN3TzYazA4KlZG1t4LCUWLil
         5T9Q==
X-Gm-Message-State: AOJu0YwZsOdWmQpX/wmTWDXtRyB9l7/M6ilupSdb544cRTVFQdkNzhLH
	883VNAFssfi2SHEHVZ9GQkoQtDe1IknbotnORBM9if/x6FClaSc7DBGyU7742FcMkPxX8PAZ2d4
	dBygd1La8Pwv4xoRfJBDiqAuX5ITbAWUByQEGSLHEvnyDacPbQV+bLXTCv7sJg7YS8GQs
X-Gm-Gg: Acq92OHqKEnnNOj8AD82rOd9NZaKRzQZA/2Oz5/0PxeqA4/+VdubUdHfw8WUwWh7V+3
	1e1eOoiHoexq8PB3D85f6rb664iA045jZSC7YhiyOeFCmHrCMFtlZ/Zczn73B++ePJF3Ec9JC5l
	oga8fAlxmGpTjY+WhlYGFI1zRp8yW85Yyzwxz1A1lGiW6vVk6Uzy9R5x6ZFsTMUcdQtPx9OT02+
	FSGU3M8gz0DzOryXLMhTYpegEFzz5qLjyzUbAGzikC+WlcrcvM0hOBArRIDWoKJSdFM3mzjd41A
	WPUYp13+vM9+9C7kdLmbcTEdq0QZMYe+b7Lg9N2sAoDV/0rYR3Paq7DYVmTRcC22HnwoIOfByAC
	LGxUgpOmA3hzh+M3O/TDcDo3WcWZVeAe5qticR33WthlG+hYf1ofForVhj7OY7W2jDo5RnVm6ZJ
	sNtlSAP6P/7hDNs817+HAPRlA0UXvkFh8fJybrZsLhB+r79g==
X-Received: by 2002:a05:622a:8d09:b0:516:d678:5337 with SMTP id d75a77b69052e-5173a821e2bmr134236601cf.28.1780307216121;
        Mon, 01 Jun 2026 02:46:56 -0700 (PDT)
X-Received: by 2002:a05:622a:8d09:b0:516:d678:5337 with SMTP id d75a77b69052e-5173a821e2bmr134236281cf.28.1780307215680;
        Mon, 01 Jun 2026 02:46:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:46:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:46:49 +0300
Subject: [PATCH 1/7] PCI: qcom: fix parsing of PERST# in the legacy case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-sm8350-wifi-v1-1-242917d88031@oss.qualcomm.com>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3338;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h4yLRvqGyQTl6OR0GngMd/YRroUj4EhJo0XPHba7d0Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqHVUKNC5BVKIlAxG4zUjN1XbSLdxsoCvWpGVK0
 0z1FLVXEJSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCah1VCgAKCRCLPIo+Aiko
 1W2gB/9Lau9+SFtTwoD1zoNdYwiTI7GJ0lR+ax0a5pUBEy7TmQ0zNhZbFGW7c9a4fX+LSd+hFwh
 8CQaB+kBl00XV7DyiCrsIx+EEJCh+n5cAepVIzn5Bm04TGrvR23SQfvZMtM61bSLX8Vi6LRO2Nd
 pnTfPqkPaeTKKJgXg3niJAfs42itlwqbsRppDov4fZBOuV//WQ4Dx+YJlORsNBNZVgo0aeOB7U2
 hpmAgna2xqgW15xKGR1B6dJpRFQI8fbO9Ptccp15mmy8Ymgyb823NdcqqCaFPx+zM0XYUrJRPvi
 TFwJfZyqnkXRSiofCiNz4Ho3rsc6VC/Ysc0ymEXwjTgxuwmR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: dtYhWSlPPNtTW59s6htv-tV5PFB8aqBm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfXwSR3aS8O6qAh
 zzoyry99pvZjZ5G6eoZpxc3rcDPmpetEBMEYClnLOjm98g+f1GPn05Yulw3bbBlcqn0rtdt3QSG
 eo0CwjTyrO534Bq6QulZU41IWZSqhVfGHP/cAKBz3oGACKbcXPYamixjbbs00KNWypuWUCQ3eoe
 US+YP8asdXMrc+j4iUt4wMEWxj0E5j+yjbxdeEdAtvjvhrOG4YuFAzQbahRsQ0lyPR4AoTY1Hux
 Rx/lMyqHf64a32i2tX6yDtwtoVT0liCVTf7HdPBbAIi9K6svJI+5B8lUKeXaJoFyGQEumzFbOSh
 amOK2dtEwAGdbW9boB239CW+0pxSKUAEjsYjbqZquebwuqYFNVCddtYPV/vdjSRaJb+xyU3eLo/
 r3aNB0kt/Doc1NRN5F8GZfllpPsXai/kENfbtwH/bdQeNgrVp9t6DXJOaJEiaMVQRPDy/28e5eo
 vrZB6ngBjZr/bLOAulQ==
X-Proofpoint-GUID: dtYhWSlPPNtTW59s6htv-tV5PFB8aqBm
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1d5510 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A_p6hzaB3oH8elZwPmwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110550-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,oss.qualcomm.com,gmail.com,holtmann.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68A8A61CED6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit deed8aec62dc ("PCI: qcom: Handle mixed PERST#/PHY DT
configuration") fixed support for the "mixed" platforms which declare
PERST# pin the RC node and the PHY in the RP node, however it also broke
support for a majority of existing platforms, which declare both PERST#
and PHY in the RC node, because now PERST# is first acquired in
qcom_pcie_parse_ports(), which then returns -ENODEV (as there are no
PHYs in the RP nodes). Later qcom_pcie_parse_legacy_binding() tries to
acquire the PERST# GPIO again and fails with -EBUSY (as the GPIO has
already been requested).

Move parsing of RC's perst-gpios to qcom_pcie_probe(), making it obvious
that it's shared for both cases and skip parsing it in both functions.

Fixes: deed8aec62dc ("PCI: qcom: Handle mixed PERST#/PHY DT configuration")
Closes: https://lore.kernel.org/r/gieaybsg2ckxpctvqj77nlwu7utama2yeyvebkonmexsxrra3v@v3fobqasxnmy/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 11fc60489892..7664c7c28c0e 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1907,15 +1907,6 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
 	struct device *dev = pcie->pci->dev;
 	int ret = -ENODEV;
 
-	if (of_find_property(dev->of_node, "perst-gpios", NULL)) {
-		pcie->reset = devm_gpiod_get_optional(dev, "perst",
-						      GPIOD_OUT_HIGH);
-		if (IS_ERR(pcie->reset))
-			return PTR_ERR(pcie->reset);
-
-		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be fixed!\n");
-	}
-
 	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
 		if (!of_node_is_type(of_port, "pci"))
 			continue;
@@ -1942,7 +1933,6 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	struct device *dev = pcie->pci->dev;
 	struct qcom_pcie_perst *perst;
 	struct qcom_pcie_port *port;
-	struct gpio_desc *reset;
 	struct phy *phy;
 	int ret;
 
@@ -1950,10 +1940,6 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
-	reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
-	if (IS_ERR(reset))
-		return PTR_ERR(reset);
-
 	ret = phy_init(phy);
 	if (ret)
 		return ret;
@@ -1970,7 +1956,7 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	INIT_LIST_HEAD(&port->list);
 	list_add_tail(&port->list, &pcie->ports);
 
-	perst->desc = reset;
+	perst->desc = pcie->reset;
 	INIT_LIST_HEAD(&port->perst);
 	INIT_LIST_HEAD(&perst->list);
 	list_add_tail(&perst->list, &port->perst);
@@ -2107,6 +2093,15 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	pp->ops = &qcom_pcie_dw_ops;
 
+	if (of_find_property(dev->of_node, "perst-gpios", NULL)) {
+		pcie->reset = devm_gpiod_get_optional(dev, "perst",
+						      GPIOD_OUT_HIGH);
+		if (IS_ERR(pcie->reset))
+			return PTR_ERR(pcie->reset);
+
+		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be updated!\n");
+	}
+
 	ret = qcom_pcie_parse_ports(pcie);
 	if (ret) {
 		if (ret != -ENODEV) {

-- 
2.47.3


