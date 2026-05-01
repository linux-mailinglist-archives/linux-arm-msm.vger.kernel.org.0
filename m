Return-Path: <linux-arm-msm+bounces-105532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLq0KS/e9Gn8FQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:09:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AE24AE59F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3A233056EC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 17:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7EA421F1B;
	Fri,  1 May 2026 17:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loU/v0O0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B72mQwcw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F18E3FAE08
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 17:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655208; cv=none; b=ZHQlkHuiy7ibhF01ZPcfY19HjG3G176ZfrgGSZhfs2j9Zomhfk+EL+RNIrjXpiR3MW1A8rilL7emhXCrnijHMwig3WOJ+dtuk1To9pQZvT/NNFKVrkTC4VAvxhiiRxNJLqg1qYV5sLoAi8id9HiZpJzXgO+3ewv6XJFwt24anAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655208; c=relaxed/simple;
	bh=qsMJyaTk8HgUMp6PIBAKLauYZ+N5Wx0Hlr64l+0gPH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LvV0eJ/P67dmVuOJVXka6HzkhqEJ4ernqq/gFG9jCiFubyIgKCl0aQWSeHRZ6O5sGyg5IBKlKEUFAnrCmI0eCT71PxaiS7tSS/WSY9/fDCWhUlUMZ/4/qp5AY0l63d6BFjw2C1AFCyP1VeSKE3DwEOMYytr+cluNJykZPoj5QBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loU/v0O0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B72mQwcw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLjfx3938989
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 17:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WE94TFXH4kX
	yNBV49l2OPveZ6QXNRWCGY2DVlIlO5xg=; b=loU/v0O02Jz2CQtsLmIvsqPRIAm
	T08qeNlO2HCXUW3iTN+T/lmvauIKyhxerZV0GM3rjRSURMsE298VzLMW1ZBi/Wmg
	6aJM4KwT598cyaHKgE9K+kUvbrDz4lDRiZzSxoSpXVLYHjnwxqjcHDcKwf9DK5vJ
	WFUUgqLkGzWL7BsZ/yFWnbz2Vs9DUR2BTHC2gE6HczSzd3z4EWQebZqdnMcm0GcB
	hd2o6eDnipsywQ1pDXUCqbNhD+dBj6z0sLVFHQLihZpyVIGSZ5qdryznD7ksSoda
	j5l+h2GGw6dwMRDOqxt9RqgJbquQmZSwGt/QqZaiP8ThJmB1dEcMZAgbp2g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvtrn12nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 17:06:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso1731282eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 10:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655204; x=1778260004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE94TFXH4kXyNBV49l2OPveZ6QXNRWCGY2DVlIlO5xg=;
        b=B72mQwcw1rGqD3kVpnDBjVrV7gigwwchtZPJfh/unDblLHcyassvAkEh3DmnKAlxVk
         48sD8ua/qtIrxNkj3XdUmA1IVK2/XXShL4cVh5rZDEkXQ9gLyxZHXPgrxQU/uVNIFVxk
         gnAbuJyABriTp8PiogrCXKEE1LeCpzSgzLEmsq04kTE5SNVnU4/wJ+dwtPT2eCcRuPVI
         M5UQOnWIjVWgrFc/5WfZzvCL9x9aDBZesHSGI+zI7/PHamHyxgbJegyChcjRTfRC/4Tt
         ezgFVRLR8fcb/BuQZNXl5s//MS86h+p4QTZbiKHFwbi5ptzCRg8TDt0j7Qlk5oLM2oWJ
         1iTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655204; x=1778260004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WE94TFXH4kXyNBV49l2OPveZ6QXNRWCGY2DVlIlO5xg=;
        b=NrNNIX6iuJ+T7N6HIPOv1fqsawzUVDDTCGhUOLv+vKaxWfavbaxNxrY4sI4QsLhkkp
         tN+8zjMciiO8hUOoKvmR+BuCheolE92xe1FViyhj3fV565I3ctwe6X4r6Zaf2cr+YxPT
         ArlsIG5bTVMTSC42wYdzHM7c9FlzbSKQCHH4scv+TO4t1VEGm77E7qQu12XzmEN5YGz8
         GPGKADdrhn3kY/rY5C/00TLf0W3IOtXNULVtmJd0PICFtHfiyGY+5bHyJRWeaO+vq2Ir
         avul3HSSWpIlM43c9ZTJaN30jqZW0o+Lr6xn7XJBirrC/3shkRsj1zSJNMQ4pSTmyY3b
         H2ag==
X-Gm-Message-State: AOJu0Yzs9Rx1DvR+OSoSO3VyxbuTHeZw5H6QIB8UUTQ3dEEodowqozfS
	Iib63Rxr1WzD6viBak4F45ZiBwHVUxs6E9dwSherLbjYQw63nd4jFGpl7OJNbCgvWaC2X8mB8AU
	aBVG+gaFaKyHU/48oiWrBA/UA+ccmhVZ1f3Mk05/QHt/CeAZFyV3sFEgrQMU2VDS03J3C
X-Gm-Gg: AeBDiesbLDFd7W0vQ66DDtmeRdLt4xF3GGGOfShxJ+kcJWEF8IKxD4ZWKGJsWZ983sV
	jXTZ/Y3KyKm4Nhx83QyxEErhEgEGAB8tyyi3ilv3RQ/5yPp9tHPmC6uaUB9/sFzBziQZsV2Fcom
	IIyjLlw5YEQL4I4ptdnhtes6RC/Y3B1M+qFvD5BDOQ4CVI/GpJ6JXhRAFDxjEBdRYJISYiQT6ez
	h5KMHFhEhp9a8RyfXLHYUYXs8YIkwq+yTbEgKYBb9S1jyrqfvH+c+d8Bo11ubLFlOKuMJ15mbwA
	Lj3flWkcSnKou4pkaYaqZdfA+s9RaQBJFj110CfCd79Ibt0LmQfAoehA0eDF+2GlBxmJL96AfH3
	8KayrDzjhIHUg3saFvNTJMQaSvyy3IfOiEDo1uHpxJbVEqw+iPEVVnrWPUeCwI2bQH/bHO+29D1
	jTpSzoUSvytw==
X-Received: by 2002:a05:7301:5795:b0:2ea:d965:a4b9 with SMTP id 5a478bee46e88-2efb7cd0f64mr98222eec.7.1777655204358;
        Fri, 01 May 2026 10:06:44 -0700 (PDT)
X-Received: by 2002:a05:7301:5795:b0:2ea:d965:a4b9 with SMTP id 5a478bee46e88-2efb7cd0f64mr98206eec.7.1777655203669;
        Fri, 01 May 2026 10:06:43 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:43 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 7/9] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Fri,  1 May 2026 10:06:33 -0700
Message-Id: <20260501170635.2641748-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zDp6_E9uhsBbch1VP6NCIdIDNNONZsmd
X-Proofpoint-GUID: zDp6_E9uhsBbch1VP6NCIdIDNNONZsmd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX+pO5Q07cGX9z
 9rrFoMBS79kGV7MxJ+Kb3yAi+bvZloFe3oGQBZry68A2fbbhHXBXYfb/XXbVVwMDm3g4xvg0KPf
 nFEmJlkP0ZHBAJ/eU1WgaJN9GkkTULxktsJDLQ3xPBpmpZ3lLIfNR4ipA2ancom3OiFcWigpQoM
 yVIyPQFJcLpqqtwmBqlCLCaTdU5YTvtjsUxBQ3OexFyejJGTlZs/5espKeBNDMaGOEvSog0y2+d
 OE922vg8LZY6WX8il0QMqKG5uNAPhX0fmoBeDoy2/hXGkCux3jbRVHdg/2+wKRwXBltBq8jd2hw
 fRLq66EzH1mr1wLKaCUGODRW1g2CFTxuEGDAqCvPOM349vlkjnryTMPWiuvmAPEozvaI/EhPRJ0
 NgWknWmdn2n1DWCI9jTbrgbLSIuiA3cQmxPBpbegS9D4W1oDudsFwE/ZxlxoM6pN/RICH8yruCd
 vjkGhxrqncXwSq/ZjEA==
X-Authority-Analysis: v=2.4 cv=KrZ9H2WN c=1 sm=1 tr=0 ts=69f4dda5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=oDIJ3hVRoRHbvujwG_AA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: 22AE24AE59F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105532-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 4734b6307a85..187cbffbab13 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -320,10 +320,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 
 	path = chip->paths[chip->port_idx];
 
+	/*
+	 * EUD virtual attach/detach event handling for low power debugging:
+	 *
+	 * When EUD is enabled in debug mode, the device remains physically
+	 * connected to the PC throughout the debug session, keeping the USB
+	 * controller active. This prevents testing of low power scenarios that
+	 * require USB disconnection.
+	 *
+	 * EUD solves this by providing virtual USB attach/detach events while
+	 * maintaining the physical connection. These events are triggered from
+	 * the Host PC via the enumerated EUD control interface and delivered
+	 * to the EUD driver as interrupts.
+	 *
+	 * These notifications are forwarded to the USB controller through role
+	 * switch framework.
+	 */
 	if (chip->usb_attached)
 		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
-- 
2.34.1


