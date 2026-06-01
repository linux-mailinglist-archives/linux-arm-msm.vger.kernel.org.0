Return-Path: <linux-arm-msm+bounces-110556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGLRBDhYHWpLZQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 12:00:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6599261CF45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 12:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC84530A7C20
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 09:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107E139E9DE;
	Mon,  1 Jun 2026 09:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iq3Eq1uJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DC5cJxzp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B9139479B
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307241; cv=none; b=M/osVJ0c1ZcBRoVG1SN3As/Sv2mf9zkbocdT4ky0UiqNT5By06xd+6voYDrwkasygWLM3AE4BZvbTJUnPpLtoSPkQfCiHcUGdRLGQRHSRg+m51H3orXypyqCg/OvLm5DZDzgK2JpvayvC5e/UPRbgI5ouDafQRlV6LfwKtXC6JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307241; c=relaxed/simple;
	bh=p/vEWXfWcfITuHPO9mfDyXFqaiM3ASW/1cHspYUnUG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYp9xDeEY9qChWPTlo8lVE8CchnS3KaCA8gIGa6u+t5tFce0e1EeYnkjyFCpiieiSdK8FJj/6TqljRQiUJqBmcRMeuqFSn3SE2Q9kqB7gPVLJ/Hx2OreoLL0/kZMfYq+fxw20/+xzlHfW2WHoKWbQojTFni/DtrC2YizomeOB0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iq3Eq1uJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DC5cJxzp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518f7lQ2740402
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 09:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32iMDaQ3qO7lDTIoDuzY5zW3z4FbD3aMPXHmlVvtKpA=; b=iq3Eq1uJy5sqIyaB
	HEeTyGysoJFEbltXLV4EGShG2OY1eXw99X6JDSbw21wY57+Ry8w7iqhCG+9pc7e3
	WTNa9kgWHeLANCjlgSA1mPJQUkFMOPzJShC78ifs1DNraLkHfqEAVLiBMbtFVrCq
	ZPUxTEi1AVKlWjoHniamktcwbrcGahmyziNw/5CF6V68ltzeyxDo9VU7bydmkJGs
	dqBtOwayhiZokYmcjfP1rmTJ+DbSWLcZKPAR8nOfV4y6IDrpD68FV/UAsTQVp9ex
	zcGpwK3XS2dGoXKO+/0lV7vqhQ4y8b1210ygEdjfdIcPyydmQRfh79lAKR+taZiK
	LTRoAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqg97p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 09:47:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5175a1e32e3so13317661cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 02:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307226; x=1780912026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32iMDaQ3qO7lDTIoDuzY5zW3z4FbD3aMPXHmlVvtKpA=;
        b=DC5cJxzpfoU9OkAsznSxkLCkxCUYBpkbKuf0diLGmIKfo/m0zWvZZsxWc7f44wiliG
         VjG65yLGnhAfdC6pDSpgw1HOHCEnOkL3bjhEstYkh5ZWMi8KDQphDMT8SGzJt1IkZicK
         +7rI9JXXbl7T+3dkVMVYA+AnfNKtPE4L1Nsq2mdjvR/08CWbLL7V+q4pfcV+d0SuEbmt
         1TXGKON3LLU/3IFjn0LKDV+Neatkb0S8YZIUEJEaWMJH0rK7GVO7i7X0Y2ZyFL5tb+iG
         ifUU8OV3jnKom0dUker5OtTo6Zy0UPQiIRORXjwUgvEyCPInrMVo9C4X7jrqik4VBUDF
         fTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307226; x=1780912026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=32iMDaQ3qO7lDTIoDuzY5zW3z4FbD3aMPXHmlVvtKpA=;
        b=lrVgEQI5De5pTTA3NISMwC+GOSWt6kvPqclPpYV28J+novUe4WjxoGqT1FFp8Xld9A
         9Q5KknFA+AJPpyC3kG5KzSR082FwaTWcCDPy6QcOHucla4zCo17MWcrHOzKdneNO5P8c
         GBxqodgRsiiVHmDi0S/JyIspm4v8/fTJzQgtmO4VzWhDzNShWuZzFV4YlLP9NEqnPeOk
         PWAYfNdIIhd1LLRO84t9nZGh6dVDEhiMVMJg1/1e1fisqn+FEuPwC1vt0uU+duyrc+vP
         HikVxDNnvhYvtzKSKlc3CjyAt0MR9KQCW3R+76CLf3Au2jSkYYt5aI34nv3Xeox55oXH
         WrAw==
X-Gm-Message-State: AOJu0YyO/a61n/mXr7D47NkeK2wPDZucM+0kmTwxLHN41o0HzRYvy8s5
	PdIeuYUMIExnZi2gAcu18cLRB0SsLAUmKrLzPDqhnQF3n9h2/6SadkJ4y8pDc+3i+6KI5prQJoN
	zIrRcwvKnS+6lR7wcReZgAOCbmQOGBnAx8NevFYtuSmk5r2ohKTVXbMdajb8V9Jv6CLCe
X-Gm-Gg: Acq92OHVdapb4MzV7M+D7imOoNreXhC0YMC0oCER50OVyAFcOdB5eIZBLwtIz0jYnUe
	6n+TS47lOGbnw28GryqZqFIJ6tpoiEJMCLlJQH4wJcMk6fhHt9mJ1y1R2uylb+1NUZy3j61qXb4
	3B1Eo0ibH3ZERYhwtAR10sLPxYExhg5dQAXrVpHumN6cDtXg6fC2UJp4mDKpUpXWm5Zxm7Z15Y8
	QtxvnbRchrA0or+NeoEOEhVWGXhjdSDfQN3RW+hx//S1OOyTmKCc4+8XtT/OG+bD/qPnfnG3lyu
	mkpdj8+GzOdafpKK+FUqXoS1HeQUsJUR/Rg+VBUaKIjpQ+zH50YNMvhvk+Cx5COIj9gjZQ14t8a
	ss38+KJEczku1yEcSvYNBLLD8bCbUZ+ffus6Nh+/fTjLGpKaDLw+xYtv49CW0eXrgy8Oq6oGalO
	ffmQYVvdBhsD2gfoCEHIuV0o+3pTV4Eg/cvQyB7JF3tsA2QA==
X-Received: by 2002:a05:622a:299b:b0:517:58f6:29c3 with SMTP id d75a77b69052e-51758f642edmr25765581cf.32.1780307226577;
        Mon, 01 Jun 2026 02:47:06 -0700 (PDT)
X-Received: by 2002:a05:622a:299b:b0:517:58f6:29c3 with SMTP id d75a77b69052e-51758f642edmr25765361cf.32.1780307226184;
        Mon, 01 Jun 2026 02:47:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:47:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:46:55 +0300
Subject: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6120;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=p/vEWXfWcfITuHPO9mfDyXFqaiM3ASW/1cHspYUnUG4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqHVULHknQTeqgXWLpTQtoBAPOcZ8nrUprloMHR
 HJqLRInYkSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCah1VCwAKCRCLPIo+Aiko
 1aswB/wLWeCDt7fqtyhpWQItLB5x948RgkF3AfS0s+K8vCNS5F6wN12TNHhnvx6N92e7SeuS4/O
 pbuLBC4kiL5kaoUWP2Y2zQ3KSWOUJWD+rWVtpA48mrHt41PQJIlx4L+YFCCLVPhZYsJwM9AsJFq
 0Z0rXdQuurtvBjuJbjkZEra7j+3bJMC6mOC+vkVWFisrSPB8txE20LJCRlZ+T8zT0MxTNw+g4Mv
 f9qnmUd5tW+23KQEPL/PK8+GbLTgxdPT7RqFbxhnPP+v+txO1Ku6VgmYnPSDBsruBI0FWtzcq3q
 EtcYzFmbprwQUCgBkP1sBKeckGK9uTFw4M3HA2jL2HVKUFn/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 3rY-1CPrxOvQS16I6QZS-ptvx74Yls8u
X-Proofpoint-GUID: 3rY-1CPrxOvQS16I6QZS-ptvx74Yls8u
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1d551b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=o9ryCBrv46mMSQ48XGcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfX++qRdR1vWHr1
 MAVup7xr829HG+38cFbJYe+dR9kkqM1w1sFASooWy+YJrP+XYpP2W8synEKkgHCMospAGfKmkdR
 VYKkC9m8rNG49mZKJt2mrTgjXUs4OdWWgdKtUYwvkObolUAh9g5ww8q7Uw0RKiCfL5+aLzRo+8Q
 UHWGJgGtHgkMHg/AT8kyzNmUe81DLHXhTsQGLoYpqYKIPrGnT0XjiVJac1scW+lqnISuGntQuhs
 QkKP3PjHMW2U6RzrJjJGFTDeBS+tj5m2uVap7SKoMnImLv5zhkSvRoNrBTQU4KGuY2AKEBgr5eU
 4AK8B98Pr2qDb6VrvOcFFSR35sj8Re5mxV1UQMztzXakZt+bHdm9RELDvzFwBhqJX8vwYtw/Uyb
 5noXnrWI1nSq8b2qq2jqv1GkhDU3LbtFHi7va7D2HdsN+ik9ZJ3687nb38ERcml+WTY21k+aDpO
 t8Z29Myp2D6J3SW7gkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010098
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
	TAGGED_FROM(0.00)[bounces-110556-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 6599261CF45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SM8350 HDK has onboard WiFi/BT chip, WCN6851. It is an earlier
version of well-known WCN6855 WiFI/BT SoC. Describe the PMU, BT and WiFI
parts of the device.

The firmware isn't (yet) available as a part of linux-firmware, so it
was verified with the firmware files from the vendor-supplied package
(wcn prefix was applied to Bluetooth firmware files to make them follow
upstream driver changes, vendor provided hpbtfw10.tlv and hpnv10.b06).

Bluetooth: hci0: QCA Product ID   :0x00000013
Bluetooth: hci0: QCA SOC Version  :0x400c0110
Bluetooth: hci0: QCA ROM Version  :0x00000100
Bluetooth: hci0: QCA Patch Version:0x00001017
Bluetooth: hci0: QCA controller version 0x01100100
Bluetooth: hci0: QCA Downloading qca/wcnhpbtfw10.tlv
Bluetooth: hci0: QCA Downloading qca/wcnhpnv10.b06
Bluetooth: hci0: QCA setup on UART is completed
Bluetooth: hci0: HFP non-HCI data transport is supported

ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x605fffff 64bit]: assigned
ath11k_pci 0000:01:00.0: MSI vectors: 32
ath11k_pci 0000:01:00.0: wcn6855 hw1.1
mhi mhi0: Requested to power ON
mhi mhi0: Power on setup success
mhi mhi0: Wait for device to enter SBL or Mission mode
ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x6 soc_id 0x400c0110
ath11k_pci 0000:01:00.0: fw_version 0x110c80c8 fw_build_timestamp 2021-05-25 21:43 fw_build_id WLAN.HSP.1.1.c3-00200-QCAHSPSWPL_V1_V2_SILICONZ-1
ath11k_pci 0000:01:00.0 wlp1s0: renamed from wlan0

For the reference, the driver looks for the board data for
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=0,qmi-board-id=6,variant=QC_8350_HDK

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 126 ++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 4973a3eb11b5..8e35216e4272 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -115,6 +115,70 @@ lt9611_3v3: lt9611-3v3-regulator {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6851-pmu", "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&bt_en>, <&wlan_en>, <&swctrl>;
+		pinctrl-names = "default";
+
+		wlan-enable-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 153 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_s10b_1p8>;
+		vddaon-supply = <&vreg_s11b_0p95>;
+		vddpmu-supply = <&vreg_s11b_0p95>;
+		vddpmumx-supply = <&vreg_s2e_0p85>;
+		vddpmucx-supply = <&vreg_s11b_0p95>;
+		vddrfa0p95-supply = <&vreg_s11b_0p95>;
+		vddrfa1p3-supply = <&vreg_s12b_1p25>;
+		vddrfa1p9-supply = <&vreg_s1c_1p86>;
+		vddpcie1p3-supply = <&vreg_s12b_1p25>;
+		vddpcie1p9-supply = <&vreg_s1c_1p86>;
+
+		regulators {
+			vreg_pmu_rfa_cmn_0p8: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn_0p8";
+			};
+
+			vreg_pmu_aon_0p8: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p8";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p8: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p8";
+			};
+
+			vreg_pmu_btcmx_0p8: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p8";
+			};
+
+			vreg_pmu_pcie_1p8: ldo5 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo6 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_rfa_0p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo8 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo9 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+		};
+	};
 };
 
 &adsp {
@@ -373,6 +437,13 @@ vreg_l7e_2p8: ldo7 {
 			regulator-name = "vreg_l7e_2p8";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
+
+			/*
+			 * This is used by the RF front-end for which there is
+			 * no way to represent it in DT (yet?).
+			 */
+			regulator-boot-on;
+			regulator-always-on;
 		};
 	};
 };
@@ -499,6 +570,23 @@ &pcie0 {
 &pcie0_port0 {
 	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+
+		qcom,calibration-variant = "QC_8350_HDK";
+	};
 };
 
 &pcie0_phy {
@@ -763,6 +851,20 @@ &tlmm {
 		"HST_WLAN_UART_TX",
 		"HST_WLAN_UART_RX";
 
+	wlan_en: wlan-en-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	bt_en: bt-en-state {
+		pins = "gpio65";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		perst-pins {
 			pins = "gpio94";
@@ -815,12 +917,36 @@ sdc2_card_det_n: sd-card-det-n-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	swctrl: swctrl-state {
+		pins = "gpio153";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &uart2 {
 	status = "okay";
 };
 
+&uart18 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6851-bt", "qcom,wcn6855-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &ufs_mem_hc {
 	status = "okay";
 

-- 
2.47.3


