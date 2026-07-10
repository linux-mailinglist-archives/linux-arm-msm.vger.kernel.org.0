Return-Path: <linux-arm-msm+bounces-118234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6xEPO2DDUGrg4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:03:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9467E73966B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:03:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ozl487vZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WA0rlals;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118234-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118234-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED7F73093E0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D22240928C;
	Fri, 10 Jul 2026 09:58:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CA640627B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677481; cv=none; b=oDH574dcNqOMAHytHQRqA+I5jD/kCdtMVAcsjeJWBwXWU+jEYweDABZ4hxk3HpbrC1aqkisMexTcGNXy1i6ZtZbcMimuiuo/wCY2pQ0Tw6giSymLM6MaYVS0m0JKtR07M1t6Mk6YyNh1fGm0cu5+2whlZJoZAM4Ve5ugMiSataE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677481; c=relaxed/simple;
	bh=6pXYbq0cnSv0KPQPpczNz5p2DBipwsIgwwH6Bmrx3y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7kwcnelHPjFLDPg75XscyrxfdLaBZmHeCWdvBq4zkMIhB4rzJyx96/Jv/wfkKh7/C/8x/Bcaottu3A1SO5wiaIhEqOC5SO0geJ++eY23t9ItmY0261uyffCaTWzPrb1+72oNrYOi/ylnuOg/eCR47w1o2YfMRV61OM5JFvkDAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozl487vZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WA0rlals; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dY3L056516
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Vyq56zyV3kK/hWlhQpFe9/5myCJg+mLyuzZJXrDJPQ=; b=ozl487vZanGltMn+
	QpHgalX8RBnW6jugZr+4QR1ocqaSsPjHS55sxqaiRDh/3Z5mdW+Kr1N003XRGNwY
	tZnj7UUur6r3c0NZxInCQiJAJMc4dTnbz9Wgc0/wLSidN1kwA53A5hkAiXQ6N66y
	6EtyJ6C72Ww9kQPEv3C71mwt8C+YZDoH+693GWikPE0Dlw0BaZmrnc9THC794Jiu
	uNEYTtip+GZphKsdktaSSa/T2pxeBy0zxZjVrUrqh6hsjuPz6IxHRj8dNSCE2bqM
	Z8DljmkommMI518uUh6ryj06cMuopd0ZVvdSf/T1ZC2mTS55ifRtaIbQyNtot61Q
	U4hEzw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwtafr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso4897221cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677472; x=1784282272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Vyq56zyV3kK/hWlhQpFe9/5myCJg+mLyuzZJXrDJPQ=;
        b=WA0rlalsrE78wUgu9Y70T8dGyKZblV4tF8kxsU8TgTNA7dhymQRmkFHqgJ/R4iOp8B
         lbpvB2/V9KhjQeKj9B8G+rxUTZwysMoUfUdu21YJBJqBpTINCuOKLJ+nvpBJt5soJsGN
         iRYl9dvRXQ8xLXNQNePqtiG8gXSBW7FbECk8Xeoh+n+O1VkPFuTPqkR6cC9bL9DWJtgm
         F5RCZr0M8Bc/8iirsrk+Xq8ZGrCEt37VAXNy8ACHCpmPxDb2yaQ575rcS1mAoX4R2sY8
         wBceAijLIub1QJiNvCQtNyuxULQC1oQNFtbV3I2yV9XMymXR7DwTHPdiMcJ7wC/tjXu6
         BIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677472; x=1784282272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Vyq56zyV3kK/hWlhQpFe9/5myCJg+mLyuzZJXrDJPQ=;
        b=D+k47goQxFjUQDu4JqNFoHKCEGc9Ffk+4PqR8etcKf9K0m/DASR5dJ45LFpIh0d+p6
         /iR8b9+2MdTcoVCZQlF+8gyxHqQXNc43XCpYjGbw2hgwv7rW4pODJ/EGOcDjM8Pt7NRL
         vcZ40REbAAHnRWmAShIFL9budHTRsT33mMbXocCnRFUr2c5DudMtZCEYDIAYupAjj7cG
         hQjb8SpmsV3rFZIPTgUImarjubZAMmcycnW8+fMSKO3Cdp/0CmUlPTZXZHK9c37xR/jr
         yFv0ca0+YLnunl6YTAIsZDTLkna/mDquez+EWERRqIUISRRcI1yV7KkXUfdFiN8PjVdc
         sCRA==
X-Forwarded-Encrypted: i=1; AHgh+RrO78bhwytEw7URzB60iuF7eJS+zWb2gPv+cuNhEMMzwDgMQikMV1B6GeiePfKfpUI5RixyFF17p7Jj5uBW@vger.kernel.org
X-Gm-Message-State: AOJu0YzvCk4tvV8r/PZsTQOzxHYONcMcs6V9T36JBwGH1R/MGRSu6DWy
	1vqYBf50jONrhorYyjB74tVwikllIwmx0voLeHOLVxJpqsFJBWXMlAejcawuOC+yZdIRt8qDH+2
	6xQkBqfaL8FyvJC7u4xmRwLaONeb1YM1ftYlvUecXd2ZR6qfyPod1fYNVF1NMtY3IVfIsZQ+FLn
	k7yCs=
X-Gm-Gg: AfdE7cmJRcLIQ5jESCyUUBHwLoSG+XgdThCZR62l95MUhKjssoN4q2AFa604XewIeq7
	fMAjv8SQ7htjepx+2IHW2GfVXgZ/fYPpR8CUxtoOWodhJNC2CIZCwiDbml6j9hVARmwY/6jdobE
	g3oMgG62LrkwF6jzC5/mbSYgNvVSQML7hZ+iOzbYZXao1MUN0n3U+rx4zjp0wx4ovrNxx0wUcWN
	tTccOiFUbbRWn5jwIt96el25Ye2YWQiaT/cDpxsvOEd4Mz7jZPfA+MripODIiXlBkF1UBjl3MIf
	Us8i81xO9CawIMJw0sJNhJoVGo5tEBD3EpuZiujyuhrSNFy15X/lmWT2pmUcV9uupLoYyk/lCr6
	fFtGMBPtBttMX9/rUvwnSljq561/TPPYGom7C56z7lnG+ecqjldLfSbAijQ2C0hITn1rzywh8f2
	Df/uGo5R7sdralcEn8DiRR0qask2c2CH5xKdn3vxuZfIYGWybnPToi46AVxUJxW1QLxduVo5Ao4
	g3+VyGoBCKXNHGjGNyM
X-Received: by 2002:a05:622a:1195:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-51c8b3ffca3mr110162111cf.9.1783677471879;
        Fri, 10 Jul 2026 02:57:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1195:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-51c8b3ffca3mr110161911cf.9.1783677471489;
        Fri, 10 Jul 2026 02:57:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:37 +0200
Subject: [PATCH v3 11/11] arm64: dts: qcom: monaco-arduino-monza: Add
 QCA2066 M.2 WiFi/BT support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-11-46253587af64@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a50c220 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bVgCuXkIXrEOrwzLefLWgbVOMQ-PWZGg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5OCBTYWx0ZWRfX49qN0Hau0o9A
 neevPdiLnr7J/gLGsuFwGPdNz4iw75qO6UX16sTd+pp7wfZ7B1n//W7HOYHMW+SQ6pZs/hbEEzM
 UEXpym+gz5BoBvQrgn0ovPnx8HSGH4I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5OCBTYWx0ZWRfX8fWj/pbUB+zQ
 /Mc1KgT8VaNBvztK+T943WDoQY02pVEoPZK/Tf2h1yF7ZjejkbFgQiI++9WzyCWncC2vzzUl1ih
 PEgzAopPVaJOZfiqEAtbH7uYlksgwGkfG/IpuOuDGzLTGF+Ee22IYQbQkh6ixkBKWuOtSAOjWDk
 /48acqs1Gx+Fr9O7zcY26rEwA4A8G3fU+emJQ0b48KXHQnQFKb8jzo4w3ZM9HH2lhVZsKVLoUfz
 x8WzF0LJr1EZmqXyQUW60/r0YRuFOj4POmfTksX8CmOirenzmCIwr5fdj4ZPWcT17D+h0TQZQL4
 i9xBcdZKoH5+6Fx0s5jLldoLJ9rz9wRO7yXo9WkdkuqI7EBpIrPQBRYWLo/aFNdek1EbMlevyky
 GPTF75Wm16k8A+LGiexx2/pU63ziiiiFk+Po1nCGtGrNDGLVMmY8+Fb1w20hIgTfXi2I5zdhUex
 pEngCK1Aa+ODX2FHj7g==
X-Proofpoint-ORIG-GUID: bVgCuXkIXrEOrwzLefLWgbVOMQ-PWZGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100098
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
	TAGGED_FROM(0.00)[bounces-118234-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: 9467E73966B

Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
Arduino VENTUNO Q board. The module is interfaced via LGA and is
compatible with the M.2 Key E.

Add wireless-lga-connector node using pcie-m2-e-connector binding,
connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
the Bluetooth interface.

Add pcie@1,0 downstream port node with pciclass,0604 compatible so
the pci-pwrctrl driver can acquire the power sequencer and enable
the M.2 slot before PCIe enumeration.

Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
(gpio56/gpio55) used by the power sequencer.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 64 +++++++++++++++++++++--
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index f67a554adf956696aeac2348e478dbd0b74f0e62..e3d3d68932efff494f3c7ab96d75869be24c4a94 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -155,6 +155,40 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	wireless-lga-connector {
+		compatible = "qcom,pcie-m2-1418-lga-connector",
+			     "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vdc_3v3>;
+		vpcie1v8-supply = <&vdc_1v8>;
+		w-disable1-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&nfa725b_default_state>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* WiFi/PCIe */
+			port@0 {
+				reg = <0>;
+
+				lga_pcie_ep: endpoint {
+					remote-endpoint = <&pcie_bridge_ep>;
+				};
+			};
+
+			/* Bluetooth/UART */
+			port@3 {
+				reg = <3>;
+
+				lga_uart_ep: endpoint {
+					remote-endpoint = <&uart10_ep>;
+				};
+			};
+		};
+	};
 };
 
 &cci1 {
@@ -409,6 +443,22 @@ pci@0,0 {
 		ranges;
 		reg = <0x010000 0x00 0x00 0x00 0x00>;
 
+		pcie@1,0 {
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			compatible = "pciclass,0604";
+			bus-range = <0x00 0xff>;
+			ranges;
+			reg = <0x020800 0x00 0x00 0x00 0x00>;
+
+			port {
+				pcie_bridge_ep: endpoint {
+					remote-endpoint = <&lga_pcie_ep>;
+				};
+			};
+		};
+
 		pci@2,0 {
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -501,6 +551,12 @@ max98091_default: max98091-default-state {
 		bias-pull-up;
 	};
 
+	nfa725b_default_state: nfa725b-default-state {
+		pins = "gpio55", "gpio56";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		wake-pins {
 			pins = "gpio21";
@@ -544,10 +600,10 @@ &uart7 {
 &uart10 {
 	status = "okay";
 
-	bluetooth: bluetooth {
-		compatible = "qcom,qca2066-bt";
-		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
-		clocks = <&sleep_clk>;
+	port {
+		uart10_ep: endpoint {
+			remote-endpoint = <&lga_uart_ep>;
+		};
 	};
 };
 

-- 
2.34.1


