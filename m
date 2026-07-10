Return-Path: <linux-arm-msm+bounces-118224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sYo4MtjCUGqy4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:00:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 230037395F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:00:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=imSWQRTa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PyUzAL8E;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118224-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118224-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 816CB3028B15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7607F3FD97A;
	Fri, 10 Jul 2026 09:57:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4ED3FC5B2
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677457; cv=none; b=Lhog4wuwdnc5JG+Yu59HPm+aY6wpABEuPF7X469RL9o7VmvqglA5TXmAxHqHu6UHEOiW0Tm0h64Qz+2ZJL+i8yJjsmApTHK0zoqNjFZyucIesIS6S5HUj1lhlXhLT36wM5bpnjc6Sw1r1ov8Rk0gfceZBNfUBOZCqtVFvq6D2ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677457; c=relaxed/simple;
	bh=KEpaGYLJg/HFUQ4VCnAAAa4/K+FU5Ww1paHM4mUD9UU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+9Nb6GyD/lrriZy4+Od3dGSAxB7jpJTKxdAziT8d28GDNElmchR38aIvh+ZkZjSbx5hlaaI6hU6+RKrD82dc7Qn2BMRsv807tMVbNAY8sY+bonQsPezHmal2+1AoeY6J61Jc77vSucXv4sngEcdHDHF1cKjUYuYvSP4fi0t4gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imSWQRTa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PyUzAL8E; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dWoe4194179
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=; b=imSWQRTawQRpzQNc
	mwknADJeEsLPlR3YFJePXgE+g2CgMtH6PhCsxzYu6wd7US5Nx69vYJpoMoZIt7uZ
	ydQPQQXaH/36mm5o6bTGsw8RUMelB+QtP0+646R8Ysv/anT/JPfsEa0737vDafR/
	syB4JF2ODhttzmyxQ3Di+cAOryTXkiWl9jzHpF5QjWvMjYq8d18bipucQBiO4QXq
	0/z8fwx0WM/zO2yfbM64iDJba7CvX7wwnV1nt2CO7N6/4YaKABMuRBFTcfCWv6GR
	3v2NzycAq7TJgQrJlyycdYS46QCtw9/euhWSr4U6z2bMuYovgX8AoTDMyNXYr6LY
	lNmHiw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24uqcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fdace20927so8311096d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677454; x=1784282254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=;
        b=PyUzAL8EIpQpen8yYLJsDoF02JJal50kHQNDPB2OcRPVu05MZE7R9bztwGQBeONOxc
         csbL2jAtLCSZInY1AxxdxfPDBd3SOQxp+qFtG2SU9oz5xPK7Yv+aehkvGTdbdbF919ka
         FEjRcHkNe6tnLvxP2XGKf7x0bz8+haiHUyTOsjJ/UsW46ByTS5OMf69J6SeRric8AziM
         rO0MO1Yspkxgdx7M6qEIUKyJJxcoKGA+7ifO8HSWmdNxE1H6ZhPmHL3NlNLUIqo1koxD
         6KNqEE/wdiRhGE9QD7yI0UzLiCQiQlmrYN0bTKO2p9xkkGgSop81JWwbMSqTzfFjrexC
         dp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677454; x=1784282254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=;
        b=n18P5FYtx9/J6CE0mMY7xsiavqlRv7G5xvcf+gTDhA3OnEUfuuztMvfvsCDla953mp
         4aH2leLWR/f27HpHqmkkhO6o7/OyLq87JGna3dkKSmU71VCrddX2XVIKchPLIW2XQGrk
         QiYIpbxifS4R9hdM33MH1okdJtvl6hCgG7Q8aOp5A81q9X/bMQbi2wSEHned08SbTTXt
         NSw7BIGEZ87gTIhYm6253cx+KsxVJt2j2m8mdiqz22K5Y1lrePpIxR0ZOizVG7VPOwrd
         TkS3dnE/8L2Jr9JDcdEYrJBJ9Xv/DyweC0vKJdrzsgIKRj/ls0uJOPrstj0aWuDi3cSA
         Vtjg==
X-Forwarded-Encrypted: i=1; AHgh+Rpjs9NZAzMPehK/QgTFm/2y9DRoDR8fF22qpaXmmVpGS+6KbACr/PKMaz5znL/3u1cdYS/tX8QEaAU4Q+Fk@vger.kernel.org
X-Gm-Message-State: AOJu0YxL4giIpsKlgXZSBgjLMhNb91SmQm1w/QS17BEAzQ1qxcIL/hFr
	arXxULLcaNGISUIlSJVdg2kIS/LRfRqYAAtbfIfwKAX3HFNRd1JKeLDTsizd9r0FcgWOvQ9DB7B
	30JgEX9ZV1EGY9WJ8aEtzyKacUSEZ24WgYgPs3AWTxdMg6Q6rO6C7M06RK3cXS+KgTJsld0vd93
	cAOWM=
X-Gm-Gg: AfdE7cnqDiEXHWa8kn4e/LNt/bkWJTTYwNkvBMCZQABHVEXJ/O2qFFV9xNUm/oCXH1e
	ABLgrGUtn/q0Ny6E94Gnc8rVrBtQJpPax85rhOSV5kgRWmcayPdS8IyUR2Aee/k0keXtvXf7bXh
	aleqdNhz6ZEd7a+QUaXuH7C4AC7hHwzP9afbnhuL2gKEicQzigzMoNMOz/oPeMvijR7wczx9H4o
	3Gxm+kVbjhWEIAWGIKBNk67TeI7JIiIA6LX2O8pwzn0eKLgXKTB/mnpB7RmppTjjj93orwcqgpz
	xv0AJRlCifXCfi0mdOTh8XPFOFaEEQwRYC1iGlW1KUVnvi8Vh3G0sxRpydUX/Nk5Ue8uHXA76Y8
	8Lvr4vEAnRYrEYfHcoxJ0/JmyMt5J35WrnP698IgnSLqvQ/6YblC5cam224hjLbqQR6F76N8xSK
	Lj3372pP6pufng81h8+drmlHewe/UpAwc5dBBQ1TDTzFcnlS5EQWoBh1GawpiuS90/JaP9cjQnr
	pXFH5FGBFdTml2gi6Gx
X-Received: by 2002:a05:622a:114e:b0:517:6435:c4ce with SMTP id d75a77b69052e-51c8b3e2e3dmr114665051cf.49.1783677453736;
        Fri, 10 Jul 2026 02:57:33 -0700 (PDT)
X-Received: by 2002:a05:622a:114e:b0:517:6435:c4ce with SMTP id d75a77b69052e-51c8b3e2e3dmr114664921cf.49.1783677453240;
        Fri, 10 Jul 2026 02:57:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:27 +0200
Subject: [PATCH v3 01/11] Bluetooth: hci_qca: Add M.2 Bluetooth device
 support using pwrseq
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-1-46253587af64@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: ejJnwTJ-6eJEk2VKHs-vPiZq-ZQyxxNJ
X-Proofpoint-ORIG-GUID: ejJnwTJ-6eJEk2VKHs-vPiZq-ZQyxxNJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX1TVbpx8N/U85
 qSDM20CeKUvE3+mPkaG+ylQ0J+iIDRZd6XUR/NOVvd7HV1RZzrYQdgYAWnck94xJ34axtZ6xvh7
 boFO32ni+BDf3+86ZG5H2Xyrxllcd98=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50c20e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=14bN-6-z4zEjTU3E0XQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX7Fc1F+76u/tK
 ZRPMxCrvInfmJwhc8cxhC130NOGEkDvWCXpEKYh2rWs2ujlROa5dOHxqO1mg6Cj82XAmF+dMrwX
 +8lpKm6V3eNatnbizKaNha2k5MrqpBuGKhRs2IMpfG1NfVOf274BVXqrQQLUi34mjRfrhOG6i8/
 DxVRXWUHjTbZF6RUjFYuObWQ37900BuMUPs62pDP2O1Xe7H9UNoIWAshO3gEybPTdv8Xw3JrsAx
 6CNBJ9o7ueKbTo2ulOkxgZQY6Ixjx6bxTbvf6WzvNzXNy57VuJc1rwYnH7C/NT1Y+7BXF+rLVm+
 SfVBHFIrMTOo1nwNOUuXwsaNCwYoP5bEeHmUY0+1KXjrVOGWRrhn08v2T4twGOcFXraRMUNWg91
 TsLSqHFVCSnSQJZ28uNr9ZU/tVm8QnOg8xo5+Y5gEsOYsvUyggg0Qix7QPQjJxRoqrno7iswFPh
 g6Djdg1S1j8M5210wbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118224-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:wei.deng@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 230037395F1

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Power supply to the M.2 Bluetooth device attached to the host using M.2
connector is controlled using the 'uart' pwrseq device. So add support for
getting the pwrseq device if the OF graph link is present. Once obtained,
the existing pwrseq APIs can be used to control the power supplies of the
M.2 card.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 2444471956197bae62a1c4c3a776c5591780ec02..135c79e696aefe2b37ee7a7a668715360a1e2d75 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -26,6 +26,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/pwrseq/consumer.h>
@@ -2445,6 +2446,18 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+		/*
+		 * OF graph link is only present for BT devices attached through
+		 * the M.2 Key E connector.
+		 */
+		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
+			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
+								   "uart");
+			if (IS_ERR(qcadev->bt_power->pwrseq))
+				return PTR_ERR(qcadev->bt_power->pwrseq);
+			break;
+		}
+
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the

-- 
2.34.1


