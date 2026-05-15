Return-Path: <linux-arm-msm+bounces-107796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIRTDEICB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:23:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D29E54E565
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9862F30335AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B649046AEF4;
	Fri, 15 May 2026 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CE1/2tgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adFkljcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7647E426697
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842073; cv=none; b=oOEUyzK3qDe6LHHArZHMMnLxAdPC7nCENZHbQ3nubMHzFrolorwCm4KXbIczN8kOZArZcUJrp/ANNlagxQ4RV33AtcMNfhULkYd9lMfJGvsk38LU+l0gEZau0uXjd4CK6Zowq0vtAtLqeuiMYVOWCZsuHh2eD0IKHagi5o3OWxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842073; c=relaxed/simple;
	bh=RijDqSjfKJNIL2BYqA6ow9Z5hjliiMofsCwqL8Aqnyk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HkwQRXdhD0oTJN4rQ26zwtuHUzV70ptgNqIlHWWDZLDUy2L2x41yVTskv/Bxkoib0odgTn8t3wj/Bs1QOwIiU7/lzN9ODdpTaWljoCvsfQFV8cFbLBoAOBVBIC8MTMBddPzN5a/yLQgc7t2mETrXkYXVl1r2N7vgZDGLybjldGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CE1/2tgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adFkljcG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9Hqr51715145
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H/XXsyRxgO0llNZtCTaH5Q
	dQ6GC0REVLGnyPyOphXoo=; b=CE1/2tgHEt2G7N/4gq2ywgMg2/ZZOrHf3VAgSf
	IEpkbXyv51RylnXz/PT5dJsKdWxw04hniMQDH9vycr49ahGfAFjUU8vPAtcch91L
	XmfwKtvMNU3xOLHb590yB7LR5EBBTm3XylbsssbgsToi4HxaW0R7kuqwSmdYSIBJ
	pxPjggOfptSgZnm2azUIXCDnOwzozd5KGx/kYD5ctJcUFrhv8RUYdgns8OvRWlgZ
	b20ytJhNC6mnjc//ADbaqTPmY8Q1g2SipzoUDIQFqi33wMYlEHxMgJRP1VA06iQA
	lP/+29ztZw3GhARRZKsBqb3K1okWBmhMxDDw24VwdH5gJ2+A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxspek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:47:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-835444b6ce1so6396788b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842070; x=1779446870; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/XXsyRxgO0llNZtCTaH5QdQ6GC0REVLGnyPyOphXoo=;
        b=adFkljcGjWXbAFcGHxlIgshfTwtrMMYgpXt9tfdJepdIinPYB5gpldeJb0AJBk7s4g
         ELDLuNrwBEpbshZqemLzXj0iYN09owmQ7XLdBP5tktxIk5rys2+oi/0/+2+MWfEYcBrm
         MzWwPinnivVxtiapqHndJSyGA5ZOXV9n5TaTszDHLt0wQ/F2rn/klZO3ebkURglEM+Cn
         9zUA+xREGsMYYOrlZt2HOpXNRudQ3WD1jxC+ZR4uMXakXRjQyKokWYMBRm1AZ0aOggk1
         jW+5QvaLW2lxT6gepmVH2Itt/Bu9OPMdYxQSozlLvgvXqzfG90R7crPO1s8VGmSTcABe
         1x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842070; x=1779446870;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/XXsyRxgO0llNZtCTaH5QdQ6GC0REVLGnyPyOphXoo=;
        b=lHciT6ObAB+Yup0gzxBsKQrcn5tEld0J7oBLbCXL/sMgymqQqvcTEvjKaULlpg2hpe
         AHjstPYhTQnY4mDJptnV8JbRA2z/wXYpuROBa7Us2qUr2F1fc39pxZDwoUOgFcFlH9pc
         jAi9FVJn/QWSl9bSS5AumvY0Q5RSEoFS1SNxrPVgOVSGhMWKQPaPeJNHYQjVMTxvAMip
         n8UhiUWXx64X8WCy8xWTf8gKbBKco45xzkaSUZbCUheC/FA/o4m8cBzOER6p+a4XFCdF
         QUi2U5argfFgMYNrWuGUJCIo6pOiBf7xIJMTN9jmc+ng//KA8A+KCTzJ6BDoxk+xCusP
         mk1Q==
X-Gm-Message-State: AOJu0YxqiR6AkggcAV67Ut2Gu9gLs302AxY88vtw68IwXQFHbRJSKibD
	l/r0vxh35N16k6XgK9Rr88Chd+h8krSfQ2uOzoHCUlXkOVebSbwcyZwpmkjYskEey4pNfLT3YaF
	Ih2g2YUtS2DhI0YjUSDY6j5yyBdYSiMNzrb9wnx5QNZKFi94LJ8wmwkQLgrWxWA7ff9XpWXW0aA
	Xo
X-Gm-Gg: Acq92OHJ6PpmQR4BC2/Yc8TDh91hQmwcTN4tEB7+iz9t8GojEWkY1t8RxzSTenFdUfM
	UgNI5vcauDjOImaovClBibDKrDoZcL39Mlh/w/o+8z28deqV9M14UIm+LfxfibehjCAtri5JUG1
	nT7veV02/dlKLpjn88GAJyt/WBaL+Ly+cNnN5LdWEh4+ipmdPSiR4Ycvb+H0+fSYKS5XHMj5fAc
	xXsqq+XiTL+q6qeACY+ZDkFahekJ4d/TZmBqaPR7J6ItZ9sWjsn3pqoBy6QvAkZLLytMZaMG0PK
	k/S7P4sUnOEYnLRg/iseA2smZXsrI74kLm1s7RChVG4yGmGFaPlfszvbT24yWjJi4U1oTYjJttc
	w8flFnMUlwx+Ab0VYQ8VKZ4FdKHHm9xu/gFWdKkRzLPsGNQHupSaKuf2dRq2xV4WhOi5/YuO2PI
	OiEcRBHFYRVgrg67Peh0OJHXh+rxs5tH0FAvRu76nBTBSEC8lQf04=
X-Received: by 2002:a05:6a21:33a3:b0:393:74ed:7de9 with SMTP id adf61e73a8af0-3b22e66471bmr3673857637.3.1778842070098;
        Fri, 15 May 2026 03:47:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:33a3:b0:393:74ed:7de9 with SMTP id adf61e73a8af0-3b22e66471bmr3673829637.3.1778842069588;
        Fri, 15 May 2026 03:47:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:47:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/5] Enable ipq5210 USB support
Date: Fri, 15 May 2026 16:17:41 +0530
Message-Id: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM75BmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NT3dLiJKOCjErdpBQLU4NUw7Qk45RUJaDqgqLUtMwKsEnRsbW1APe
 eit9ZAAAA
X-Change-ID: 20260515-usb2phy-bd850e1fb3de
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a06f9d6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6L2eJvA39pK3U4l1HDAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: -SRiTUASAqFZ4cZ0_siyUw7NJsKP9Wlo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX7CUa39weHyc+
 8SyZyaVfB7WtpWNSkbdkG0a15qzoN114iCyXKuAXU5y0KoDqsnKPlpPS1otfLVPs6oZQIMXSw60
 Fy6gjpO2c8jt06wkIhVnlNElmIi85wu/HnMRDrJWTeAfu4EC2G1CePmx5sSuQZ1QF09kyDskgQQ
 2aBtCX2+uDtRYo2wATkGEV9ClC4Nf5clb/hmmCe7GxryDf0U5KYb1AcZr68APdwbIe1w83BX5rQ
 rhxL1b76wnY3PX3GTxM6YWJCMbI4GNhibwkU9qdnP4q7H8W0Qw1KeP1/njUkpFfAdbPKbZlQrBe
 iClMx0M5rU4EL+f/UK013Mw0NYNCPrUkmd3Kj4YdmUQDeTsuOZVhv3+2dGv6ROiKU4JehNyUTaJ
 nSaPWkvp9+4lp1DyudwB490Dsawcm+Y1l38S3MhO2z+GFydqvn5q4T/wupfimLokYK7qP+6yZsN
 0o1mjloACGNmsBoo4SQ==
X-Proofpoint-GUID: -SRiTUASAqFZ4cZ0_siyUw7NJsKP9Wlo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: 2D29E54E565
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107796-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The ipq5210 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
can connect to either of USB2.0 or USB3.0 phy and operate in the
respective mode.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (5):
      dt-bindings: phy: qcom,qusb2: Document ipq5210 compatible
      dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3 PHY
      dt-bindings: usb: qcom,dwc3: Add ipq5210 to USB DWC3 bindings
      phy: qcom: qmp: Enable ipq5210 support
      phy: qcom-qusb2: add QUSB2 support for ipq5210

 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml              | 1 +
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        | 1 +
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml                   | 1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c                                | 3 +++
 drivers/phy/qualcomm/phy-qcom-qusb2.c                                  | 3 +++
 5 files changed, 9 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-usb2phy-bd850e1fb3de

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


