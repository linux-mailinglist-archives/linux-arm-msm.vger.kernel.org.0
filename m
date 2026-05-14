Return-Path: <linux-arm-msm+bounces-107620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC6aDPrUBWrxbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:58:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C9D542A99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DDF31303B2F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B38407580;
	Thu, 14 May 2026 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oo+4HLbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XXi+aA2U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4133FA5C6
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766878; cv=none; b=DFPDDVf6hhQLck96/TeyVAd6QQInXivcEVFUAtYkazEVL7KBpo5kqtmgfUwi0ivhykFkrcucySoxvO2HiitORaPRpweQVZCy3ZjEyGsn1/csWOwoObUmRjEHBbv7tOhpSb+JWDw8hQSdQEMMgJ8eSFKJ3aCbXJqKvaWmkXViUxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766878; c=relaxed/simple;
	bh=FeSIeLtwPHtV3crN/baz0uL6JwDaZ6Z09/0Oo0Aqg0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJ2kuPrI3/R3Ue3l1NB4JLQXu9gquPiZJNgWIRuPOl5tBd+qQG0Wget9lfEZoNxfNK+UPsMx5o/tKEhmtB41sMoFv//6cY0C4jerUZGoCtAIKnPq/mzi3NmTVRjKxOntXa4YDG0NJr/Y27kQVwIqEhmUr5anVgylztTncCeN3FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oo+4HLbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XXi+aA2U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeRP91717761
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G4XaXcL5iagjxARaQ65zFOGZrx+dExH/+9U0Fh3XgWI=; b=Oo+4HLbuUWALgCAw
	dFkls2FWpDklkxdLrC9aUTq0zG5FX5zH/KGgw7KkSd2O8tJIuOFMHsvtqEAiTMWW
	9Uw0sDQJOKW5w4xURP99BlU+E0P7HxJ4KBj9r1IQVbTIKzZQIElkjuSBzv00aDW/
	CbfQ7AuvMCLs1T8Ac5WJ4pCaI6uLxtIw5NRxn5D9c/jYAQdP+A5pqA2K5B6xrPuv
	V8HHVsqrAhSXGJFodoh/eUpStKu+M3IxOYe/Wau9YjeGcO4Vt69xK3gZgDA6l07f
	GG6lxnJjJCzY1eKRe2pzJffRgR6rGSYyPeIvE9Rez5CODf7kTSQ/NzeU1YzXb9R1
	CcCcnw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7hr4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6313c9d983fso3378576137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766874; x=1779371674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4XaXcL5iagjxARaQ65zFOGZrx+dExH/+9U0Fh3XgWI=;
        b=XXi+aA2UNSm6aANbh9WSJy+xNAXBWeHL1tZQ3zJj/9XmGTCKOQC9e1g0HFZbN69tm5
         23j3xTmxUQ/RVhG7YNnIteeFQyHVTjUWt6zhAVyM/eVKp4P7PYQYDCtZW/7TuiMMU4om
         WoYkStU0RrgmnRM8XgaXYYcE1PvGnE38UX8eIb4Zv910fQ0fEbOZiw17oHS0yO4cGAhr
         jvotHf15lqxjPVETD+5cWhy4fCNYyoIR59nG3o/wz9+beLQy/IwQSqbP0NwN+eTlbl0t
         sw2G5coW8qAVrgC8ZM3NxlR8KPqgbbuIoa4p8B6TgXWUT2ISwWuZAnesVuHtMi3mv6Uc
         28YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766874; x=1779371674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G4XaXcL5iagjxARaQ65zFOGZrx+dExH/+9U0Fh3XgWI=;
        b=e8BsPBhe9ISxujCDIYnbWoSxr7BSD+CUUyXTd+uaxwj0X2AUl0+RsQQcXpbr4zu4l9
         LHEg2Nax8O7GnIhqIxPfL3LyYe7N4UYDiwAA5gCTz65VUabPfiLz91zlApTboHmXuI2m
         EOBSeCXoDTYv6GXr19hdk/OaqGBIcxPLI/XNcl/JDfKNvmHS22LIHRpyhkgOHRvPhdfn
         jvyme2qQjH1ejSJUldUq1XTD6k5kyNBrZ4TMKMY3339GQeJM4V/rhjzwC9AQU4acncjf
         Ba1sYGdDDwcJ+w4F7ELaHf9wBzK6dYKB1x5y1YFppYUyXvd0QhTECbRnn/nrF6pxPU/7
         4K1w==
X-Gm-Message-State: AOJu0YxY+zz/PEBNgYVZPZhc1BkzIx0xi9LUlKOa4RhlrdOqsD01SBUk
	aDgKzqFgbbZGjOG4L/z4t9DO10JNqgP085TRwITrBPi9QzQJEowUjeu8y50KbajPgkz1Gn+H+u+
	WZOoJq3D0531+rtJfLvVJCWDv68ReTfgRx/XgN8q/Q5pZ0HJxDuIqpezDLjZjAMqEW+Zr
X-Gm-Gg: Acq92OH0PKSNZFebEOamg/5wu/ttaTDvzd5CYGC04jy4CyO9rZP9fwD+BqC1vMmGwLP
	5n1vHt3uwotaFG93cypXg4x9h8QsaFQvprwweiryJ2g+wlxIMcDbm0GNyTWXxrkRSEwVSEr1M7A
	9LhzTsixdEuDWGc7iubAkm0bTWG+osT32ncnNJs1D+Tqf+5UZtdzzpBOmebSIUjxTWfz+KTer0m
	ESFE9OsY6OpRiwzg2WaOv7SQ7iFv5Z8dugGJK3dIqdriGOml5fXMB+op9y7QoL8WwF4vmWjvWe9
	rNLxjxEHibh4cfMAhmh34T/K3nY/b+BNiky8Ypd6vu8rEJBal3ix+Kgw2etomi+dSNcmOgtMVZb
	WT4f6KN+uexGYycyAQhFRBmxdk3kvQQ==
X-Received: by 2002:a05:6102:a50:b0:631:3bbb:f268 with SMTP id ada2fe7eead31-6377422fe0fmr4152547137.23.1778766873610;
        Thu, 14 May 2026 06:54:33 -0700 (PDT)
X-Received: by 2002:a05:6102:a50:b0:631:3bbb:f268 with SMTP id ada2fe7eead31-6377422fe0fmr4152466137.23.1778766872945;
        Thu, 14 May 2026 06:54:32 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd62dde04sm27798165e9.2.2026.05.14.06.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 14 May 2026 16:54:15 +0300
Subject: [PATCH v5 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-eliza-adsp-usb-v5-3-a21056ffd892@oss.qualcomm.com>
References: <20260514-eliza-adsp-usb-v5-0-a21056ffd892@oss.qualcomm.com>
In-Reply-To: <20260514-eliza-adsp-usb-v5-0-a21056ffd892@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3068;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=FeSIeLtwPHtV3crN/baz0uL6JwDaZ6Z09/0Oo0Aqg0E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBdQMKgzeJbY56lATFWo+VBoVTzyF09tPm41L1
 oDeRVWhCK6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagXUDAAKCRAbX0TJAJUV
 VtK4EACkDwrcdCRQU+omOSEDxc+WGli69YHtJpxuJrijEUuBZBEpnKYq498UpADJTFt1J81d7BT
 Rs2M8fO0Qyds7rCM4JXuijlZmwGX65MvhIyDj3T2PgsN1Rp5CwxcZRxDy+4F2uWBlwcu5FQTPak
 EB8zpz02HwhSLnYErAlomYsgyQC4QqN4txyHFIyBBLwbZxCz6nwM++6+Oo/m0VDD+9bqiQanzye
 2QgB0BL2EsJY7vxl6oUCOfXwCa8GVaun2PkV75NaevtFW2hyhZkVMexv4fKLTTkHXwWOGddOjvL
 fueAmFekJU2Z9OwbRrD0I6gGZZkGiZiSTDGXwTuqPp78TBIujvx1iP0LUyyPqkT3TawUd8EzKDM
 2VRdDqARM9eRXcqM94OI5/ZaIPxebzkkl+m1oD/wKW6KRX/IN80FNqeEEvacVgQ7QGKX2Angjvc
 hLxNIot+rIsOor5zNwnTQDxGevl6pVC0Y/5F/MfKJs9H0kXLa/d+tLPcR7E29IyQ8dqoMQaj+p8
 2Tx92ILSH61QvllPqPc+l+IwtRMhcehlGWAB9gPPZgmd6pYRZYJ3TGHul1wKI0a87clS3RQKvnz
 f25e3ohQ8Goe5QK0cRArlZXR0+VgANH3sMfw+Tx1Mz1LheNHDH8rOIMvRmKD04rzKlipJk/PAQP
 rd6WGRpCh85/1fg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: LyU3EbXjk2uKYUPBBGVCRnZzmfYFzrOX
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05d41a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XerPLwBTpPCFuubScswA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: LyU3EbXjk2uKYUPBBGVCRnZzmfYFzrOX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfXwtwjFw1/i5IU
 joqPwBxivy9kK/ubitbVeN6301rm7BaNn9EIJ5jOcwso3fH3teJ9hS9bbwaINIaS2EaJ3wvUSLJ
 g0OAr5OCmVj/VtAKjkKCJIM3wp+FD23KHnt0amAm0IBdi6G8Iiasi3T/RHywb0+T6R0sGR/3SXN
 I8kjUkCyldNrGFKfnLOwLUmN3IdNfOB9H0lV+7aF++bLxquU1ASGyWkt47NlwjJN6kUXqgXqIBC
 Z79VB3FGpxzsUzFuqvkGq7n6OKyb3+JxjOjm8QBw5GP1rqQFVnNbc5zrcY6Sb2W67veUFd6BAK3
 ctHTamxPtpabsYtxJ+hw9LmkZk2cgmjIfLeVmLUVTheMkQJ72++ditvcECTQ6i7B+zX++u1JM9K
 s+zkD5ss4bKJFZO4InbKEiboBujS6eJGuQ55o7k3byJwTlSGdF66FeMoB2U5vW/sfglSB5pzgkS
 /W9aSC7kk+Meq5+rNZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140140
X-Rspamd-Queue-Id: D5C9D542A99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107620-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
routed through an eUSB2 repeater provided by the PM7550BA PMIC.

Describe the port and repeater, and enable the USB controller and PHYs.

Also specify the ADSP firmware and enable the remoteproc.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 90f629800cb0..3e41c95edb28 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -6,9 +6,12 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "eliza.dtsi"
 
+#include "pm7550ba-eliza.dtsi"
+
 / {
 	model = "Qualcomm Technologies, Inc. Eliza MTP";
 	compatible = "qcom,eliza-mtp", "qcom,eliza";
@@ -54,6 +57,44 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,eliza-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 122 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -376,6 +417,18 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */
@@ -405,3 +458,31 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb {
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g>;
+	vdda-pll-supply = <&vreg_l7k>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l7k>;
+	vdda12-supply = <&vreg_l4b>;
+
+	phys = <&pm7550ba_eusb2_repeater>;
+
+	status = "okay";
+};

-- 
2.54.0


