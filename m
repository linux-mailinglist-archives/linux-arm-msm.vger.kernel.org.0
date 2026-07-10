Return-Path: <linux-arm-msm+bounces-118228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nabaFUDDUGrP4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:02:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1BA73964F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:02:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GMR9edp4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N5lsTuVF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118228-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118228-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84C54306643C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B183FC5CD;
	Fri, 10 Jul 2026 09:57:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE84D3FD156
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677469; cv=none; b=lOVk0xMxMIhhY7XJL/jLgHgi/rnbdofa9UeBIuYTWIKXIyh89Zu/fvOMNwJe9+FT3bMF63By/LrWkImfv9vsQFKB4XTNX4rvquCICEcGVMZcMME+GFPuW2YZyEFwZpxaHU5DB/Wo7Rgu6YkGP/UuMk3alAjU7kyJvAYzrNuDcAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677469; c=relaxed/simple;
	bh=7I0RHdk3qWyJVFH388ZwLbLetJ7qn/3xCwzAVbmebN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TbwdvQchCumqFVaI1z60hEq9dnMwuKPopcdU0W/MzgL0W6j3p1zyEHWysLVpew7MZURDE1q4+QznFw+Pj/150XQQgvtpxjVRdq6I0bQtWuUJ7CG1PqNwCZ8//eWU5EzuLu0E8xCWpL5r3dRdgniqo/es8goQUaE2KQ6IYeUObjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMR9edp4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5lsTuVF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A9ThH4391398
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GW8pkbZvfYORJjmA07dNF76DD9uMqzlV8iaeANQ36+M=; b=GMR9edp4MEDRJZ3d
	eefnwfkR+g07cZAGReOZ0R2RW5AXUSz3E0WrR7XQ/vsYDCkQWqrYaX5k25zDHyvA
	UP8QuxYnWrp15YFPdGb1JaK1fJK30PX2gHZIsFAPByTMSLbFLi7Qk6vWfshIuSgg
	VCsLeDYBYFjRvXe6aSyyzN3O28sJTpshEOOXrHOvPQ/6avygar1zLHeScandaO4N
	9sl+zVyEzmWe6lgGp16+A/mT5iysCDAm/YWqdaPIfWjaSEzcubYt55MzAhRmW1Mk
	nhyDg9ZtzMI6sM2lluobJROKOeoDbsZq6i8g8o5l9b65dgluh2EPCx52jsGQKb0m
	duQ9BA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f83ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so7221841cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677461; x=1784282261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GW8pkbZvfYORJjmA07dNF76DD9uMqzlV8iaeANQ36+M=;
        b=N5lsTuVF5QT24cUfIAsvdKWTqTWkmoWTsWqbu5LPXSzzfTNBRSzcKCI6FA0d2J3kr0
         6sB2yg9d14TzGufEwAKyR5cKggRMm6lY4Rbk7dGXjdyDuNnz0/djGs1o1YKLPNwnAZd7
         9mDLrhpfA4z0RxVVqVj6bih2EXcKDHkUgtbjJuvCtgd9FwQie4hipyqywuOGUl2kG75S
         HrFJaz6SEgFlAmYnnqZTbRX5osR5HCuvdIlAb43JzoiFbNsHheOLjCXMzfL47NXxQH3D
         krm0eHVw0douH2qWm1R5hkmuwKv6g801OXeAapCNB+ps96L7vEzBWkCYIcBqz1YderH5
         x6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677461; x=1784282261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GW8pkbZvfYORJjmA07dNF76DD9uMqzlV8iaeANQ36+M=;
        b=rABR7f4pB44kz+fMXPfz6G0CEzec9XBYNRBUlYIOQdOY+K4G7xUPXaEUXAcCIBo76v
         WxDwoVnIgfWPl92ZGekVE2pDiF1/h+hkNp+dyg6bHUolwwa9sRCUiKS4TEc5HklSRNWt
         IFKlw6Np8cU2QRjl/jIC2IKex7nxz0mATg55PQ/duz2i7y1e4mw8a0cg4EvuDa20Ax1l
         1r0Z/MoXaLjWHM7Pdi5yanxPGblcYFRvM9T9VnpIcPm3mnmQIhXNG7adGd9fQDuGh3Mw
         5lmcFeRE1i+bAozwNk6yFZ1mXcTq8uvIefIwGldoNYP1qIzftxJNMJciTD14NHnQIUrz
         SW3g==
X-Forwarded-Encrypted: i=1; AHgh+RpkgAa3HkrUbI8tUGZ30GF6w4FTGo5rKu4wb4XGpWuRvVclOaJ624DO/f/czPToMI3RIAG0HeMJnk827VcR@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ3zt8JBOMda3Ykox6o14ExoPPPllku2jYkvNQFbCcP7tdTDmi
	DGwrLt7S8oRn4hNBvijFgRwPBrU9BxNlMA3Rkrfz0zsBuzguOYGpoSpkpaqZWTCYyy0E/XbC3fa
	So1h3grwfMs0rVn9K77YtC7FjMBRCVF2277Lx1KHtWQ8Hc1kaKprXNz7epyPNaP890S/N
X-Gm-Gg: AfdE7clAeMaDjHEJWNoybicbf0uFXIbAMf+er6zV9LwjmYbdkJxZpuyuAifz+5gNezB
	rLAH43WRzXJFXf5/9xt8xoLThaQf5SLriLFUVN4kzdJBu4JSP+8eBx3YyYcABkLm+KKj/n1ECRX
	lKx0ILzj01e8P33lZi2vmepuWfPdyGnT6eTUY9Es2g9UuAyV7T6LHW6rP842AxgSbMIb7ZgGNdt
	4RueeMdrsJC8HYegkb/D2+luqLx/ENOvm49ykqbYHJj6qn6ZjYRj/z80wX1Ox0XND7n5Rur9et6
	wFFPbAMTz9+pdk2sO8jCMpCW5p9ETcWpWlP/KuOkmfOyf/lQBeSlLQyyyJ2paWcPicuCOVhg0qk
	aVLKsFXF2QMXG9WQgwI2cX/zfcPUsyxR9HUNPCMrDZ225gvc/PbzelqtT7QNu0ZHRwd00PstcAx
	wG/LgUnAQR9q1ZD08d+Gc7w4MRHhCPoZ0E4L8ISOPWimFi77LfyioX5BmkHD6ooBr8fGtjJyN1l
	FsiLXCPOotBAYxiZ9Qi
X-Received: by 2002:ac8:5956:0:b0:51c:7b12:5fe9 with SMTP id d75a77b69052e-51c8b42893amr134253261cf.85.1783677460966;
        Fri, 10 Jul 2026 02:57:40 -0700 (PDT)
X-Received: by 2002:ac8:5956:0:b0:51c:7b12:5fe9 with SMTP id d75a77b69052e-51c8b42893amr134253051cf.85.1783677460461;
        Fri, 10 Jul 2026 02:57:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:31 +0200
Subject: [PATCH v3 05/11] power: sequencing: qcom-wcn: Report power
 controllability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-5-46253587af64@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50c215 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QWuo0IUDA92h_ITipQ8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Mez_dgjRp8v-ynHkeLDPoyJmekEzXBKU
X-Proofpoint-GUID: Mez_dgjRp8v-ynHkeLDPoyJmekEzXBKU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX3nJziqwrPVD/
 uZtUMzjKUfnh5turLbt8OdvHR6oRZu7RHLGQ3eQqDNoPbN2ikjseX5L7PRQQp5L7HETMxJayej2
 s5djexlP+TpbCUypU4oFPtyfHd1iZtI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX4/SfB3iG0miI
 SstQTIp1Kc0+0zhcoi1efFoCP/SMKjaDABaAJ6chm6DRhGx1QxRID+RW98ajvnhBXAwM4d2CAB5
 +lhuIAR9rS4WbvYz0+YY5Q6thNpv3QvHOIfT4z16zX2U7RNg2uqlLBiquThjXzHhzfnPcZUfQ6L
 8flR8UPJdepnHWP2w3fjwxZLjpBtH2UL+6utB+OMVRg7dn6jK0zBCjdsIv7CvZSgYYwyAMCEQ/4
 Mf0VZkjF3zA2VQdLHC+yXfNACM/ZVFT6WQvxK6e9Nlq6eH480sHwKN9nZTMIXWGiOlQKOvtSb+H
 MwtVNb3xZTMEb7QOgzw32tcfOxxXiPHq8BOikVutNa0+r5sLPz2BdVNeBew7BzvE6OrKJG/w4cv
 W3zOkAuWeqjbCnNzWoYx7XStVhhW+TJX4vfpBVnAFZFKD6FiVqEE73E4AoHTBhl+UHRAMC5wShn
 o6ODZ2nnOiszcmC/A7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100097
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
	TAGGED_FROM(0.00)[bounces-118228-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
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
X-Rspamd-Queue-Id: 9F1BA73964F

The "bluetooth" and "wlan" targets drive the BT_EN and WLAN_EN GPIOs to
gate the respective functions. These GPIOs are optional, on some boards
they are hardwired to an always-on pull-up and not routed to a host GPIO.
In that case the corresponding enable/disable callbacks are no-ops, so the
host cannot gate that function's power on its own.

Implement the per-unit .is_controllable() callback on the bluetooth-enable
and wlan-enable units so that consumers can query this via the pwrseq API.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index b55b4317e21b626e050e022648147770ca7f386e..d5c9b734b0538e209734e15980ff2877ef5a614d 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -184,11 +184,25 @@ static int pwrseq_qcom_wcn_bt_disable(struct pwrseq_device *pwrseq)
 	return 0;
 }
 
+static bool pwrseq_qcom_wcn_bt_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The Bluetooth enable is driven through the BT_EN GPIO. When it is not
+	 * wired up (e.g. hardwired to an always-on pull-up), the enable/disable
+	 * callbacks are no-ops, so the host cannot gate the Bluetooth function
+	 * on its own.
+	 */
+	return !!ctx->bt_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_qcom_wcn_bt_unit_data = {
 	.name = "bluetooth-enable",
 	.deps = pwrseq_qcom_wcn_unit_deps,
 	.enable = pwrseq_qcom_wcn_bt_enable,
 	.disable = pwrseq_qcom_wcn_bt_disable,
+	.is_controllable = pwrseq_qcom_wcn_bt_is_controllable,
 };
 
 static const struct pwrseq_unit_data pwrseq_qcom_wcn6855_bt_unit_data = {
@@ -196,6 +210,7 @@ static const struct pwrseq_unit_data pwrseq_qcom_wcn6855_bt_unit_data = {
 	.deps = pwrseq_qcom_wcn6855_unit_deps,
 	.enable = pwrseq_qcom_wcn_bt_enable,
 	.disable = pwrseq_qcom_wcn_bt_disable,
+	.is_controllable = pwrseq_qcom_wcn_bt_is_controllable,
 };
 
 static int pwrseq_qcom_wcn_wlan_enable(struct pwrseq_device *pwrseq)
@@ -218,11 +233,25 @@ static int pwrseq_qcom_wcn_wlan_disable(struct pwrseq_device *pwrseq)
 	return 0;
 }
 
+static bool pwrseq_qcom_wcn_wlan_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The WLAN enable is driven through the WLAN_EN GPIO. When it is not
+	 * wired up (e.g. hardwired to an always-on pull-up), the enable/disable
+	 * callbacks are no-ops, so the host cannot gate the WLAN function on
+	 * its own.
+	 */
+	return !!ctx->wlan_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_qcom_wcn_wlan_unit_data = {
 	.name = "wlan-enable",
 	.deps = pwrseq_qcom_wcn_unit_deps,
 	.enable = pwrseq_qcom_wcn_wlan_enable,
 	.disable = pwrseq_qcom_wcn_wlan_disable,
+	.is_controllable = pwrseq_qcom_wcn_wlan_is_controllable,
 };
 
 static const struct pwrseq_unit_data pwrseq_qcom_wcn6855_wlan_unit_data = {
@@ -230,6 +259,7 @@ static const struct pwrseq_unit_data pwrseq_qcom_wcn6855_wlan_unit_data = {
 	.deps = pwrseq_qcom_wcn6855_unit_deps,
 	.enable = pwrseq_qcom_wcn_wlan_enable,
 	.disable = pwrseq_qcom_wcn_wlan_disable,
+	.is_controllable = pwrseq_qcom_wcn_wlan_is_controllable,
 };
 
 static int pwrseq_qcom_wcn_pwup_delay(struct pwrseq_device *pwrseq)

-- 
2.34.1


