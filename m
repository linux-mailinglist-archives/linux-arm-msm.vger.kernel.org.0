Return-Path: <linux-arm-msm+bounces-102456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLufG89u12k5OAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:18:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7385A3C85BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 77BEB3038129
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E773AC0CE;
	Thu,  9 Apr 2026 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXp4xk98";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1q3laSz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8798D3AB27C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725918; cv=none; b=cZwP6hbCm/xVcQU99KtSoduUJLJsgFbuB7kIv7JUw7UNJyfvRyiDwPLPFtUGCAa9FHiwTzm6ek5xIgziWLjKoTMHHhrq3cahg3cQJhWJus+qVTwSAWP61hLcpM/rfndtnC/q/oOdSMVr6/wdaG8Rpskw0ChBejjJTVfcrdgu+fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725918; c=relaxed/simple;
	bh=qPUTshov07k/lbxm/T6PG6DAKvQamQk4TOLHjx7qqUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWWhNCBZeJisTvzB0aHIyUFBqZnI8R1bAU/lBGz0sLu5o4MQdXHn2OBg+XMjwVvQgPRgLDbynQeSyrwyott+2NsuFbeOWzN+ovKCAhgUCLSH9HOKoS1w9LX8iyLF3PUxOYLySGCKNlbfe2iHIm/cIRwAw1CvVcv3cL1QgyoWEvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXp4xk98; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1q3laSz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63957Rbn4107832
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qHpe0KIy+zS
	dDhQ85kEJZ7WSydqJVoSsCMAF5mksiQk=; b=CXp4xk98dN9zuCslAFROIcmvGre
	1/wxFDiMbaWLYEDFD2feOW8PymfMBE+k30tRgXh9r27K60QAagnU0qJSUcyvlgmf
	fMEcKj38vXALZX1ce4BdIlO1KA7G8jWFeD8/lrZUpKIpZtWx2iBuj1x1my+2vfSU
	kZpD4pYSUKdy7wHic5kajWOQXvRzfzpJCwYi8iV+VuxjyY6coCSCcDR2GbHpl6ds
	Z/de8qGzorNiidrkHqf5JJX/GdgvH5yfFQxmwJsQGtGGIS44r8tm49gNf4n8xubR
	bn3bvqIT3dzbQVpyFEwBOY1XYzz0lsl+ciSanxYu+8i8xCIt24iMq9E2ufg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddxhaj5cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:11:52 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c282d6d32so2808903c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725912; x=1776330712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHpe0KIy+zSdDhQ85kEJZ7WSydqJVoSsCMAF5mksiQk=;
        b=E1q3laSzDAgRRIqgSLRtJxcwJw7eNb53XNJQd7O6j1XQFhwjGgm2aCh7ehejeuTkN8
         X9fyQt/pB21Vyxpj7+zyxYU339FmiZt6fwHO/Q1I4Xmu5Dsr7Apd9ATyHQrZRiX+LfXJ
         0X+FWf6ROoN6O5IO52P/8gkMPn260p3krRZpnfWWqxpiSgnUckxZOCmGXdRZ2xA8EGCp
         4LvQyXhI4ou72KOgp3RFdfTWuo88McwhatPC2am26DP27m1XLtG+2vOUeinazUGqwr8c
         liBt+unN0NZ68wrlDd2tAyctJqvaj94Tb02d8bbB8tdurL5HL9vjLfIdf0TMXXdfPEbK
         JM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725912; x=1776330712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qHpe0KIy+zSdDhQ85kEJZ7WSydqJVoSsCMAF5mksiQk=;
        b=dltRxrJod9IRGJS9agfEt1texivlDOKqx9pDxASAsdnigOVsU0R2rmQI9GyHGSzwqv
         HVeuiqgHC69fzmcGiabVI+LfJSIWQXAM/ltsldjnutVLY5I3Hvkp//+FUzEm0k0evGuh
         QgD49xyMZSK4lM+TBYYLqmWq8bATkKsOnQQllIvwtcJZ7cqQMOFA2WxT+RhowiD0JHFk
         EarcFElRCi3iWbMtUJCR9IZBpP794Ibe02kJpJMaugZLvf3Re05kP8tu2II1DQeUQCng
         g0BJBlz8xcWu8QKTb+72BCGa0Sx0kbaTtzyhZ7z0NbzsvX33bxWr/hLlPs77h/CS8Wq4
         lnug==
X-Forwarded-Encrypted: i=1; AJvYcCVbiTJ2WWCcKbqxoSJpOTp1bcsSBoT8Z/IkjFohoHE8eYRevUTpZwxW422AXt53acb7qrzyYyC6wq4ietRK@vger.kernel.org
X-Gm-Message-State: AOJu0YxxZQ3yo0o7SrgM2LD7XPx8UJFwXAaxASrOhT0zcT/+7PLXu5XW
	GkDKwqW8s1jo8LA8l6VQxRstAvGf2pVsFZ6Pzo0cGVba4SgctmXqkXLsoaRyoTtV+LquU5WfRXm
	z+AOFRrE4ybH75Dz/fl6EMDOsFinVVIo7Z7GXW1IX3mEL2CWKzuVJfV/vur+IaebYbvJ8
X-Gm-Gg: AeBDievOvAunyvef9dUBQsSISBOT8JZt3ifFFS7Ladj636XHNBjL/IDpqMEYyRqlqti
	sswhJA4UA17NtHTfHxMxaYVPT07V61I03NwC+zTweH8O+TtEj1wMWx/PbNMJ+mOk6MXgsVnREAv
	0NefZy1AlY7OItqBP2kmH5OZlYi2r+tvA0ur2QxSD0cK46evyKbI6FWf9RP3Nak/RdjGqAiqH2Q
	2TpQaSZ+RZjU6I16l2RiOOTyq/qPsYbNOw9lilllqjavI/VsLNl6x3/8DCQ8Ki4Dhd6OkxBlwYd
	5A3jRCzJ1a2l379Z5uyg3Ka5k8uO3+U/zBBkN3Td5MVcR3usgencO7CyBlce+DhXT+mqfNziBet
	tjA1vGF8rMFnT7eot0/PX+KRROUprTl8t02qLuw8ggYt4t93O5u7fHnckkTFdg9sZ1gmWP9x2LX
	Pnqkd9cA==
X-Received: by 2002:a05:7300:a10b:b0:2d1:d434:d005 with SMTP id 5a478bee46e88-2d1d434d88dmr5799251eec.20.1775725911534;
        Thu, 09 Apr 2026 02:11:51 -0700 (PDT)
X-Received: by 2002:a05:7300:a10b:b0:2d1:d434:d005 with SMTP id 5a478bee46e88-2d1d434d88dmr5799233eec.20.1775725911028;
        Thu, 09 Apr 2026 02:11:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:11:50 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/8] arm64: dts: qcom: Rename lemans-auto.dtsi to lemans-sa8775p.dtsi
Date: Thu,  9 Apr 2026 17:10:54 +0800
Message-ID: <20260409091100.474358-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tZGNUhTjcaOQbtrel9m0kXOPggb9Y4tJ
X-Proofpoint-GUID: tZGNUhTjcaOQbtrel9m0kXOPggb9Y4tJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfX+3PhrPwAo8iW
 irrDYkCgc5cBmipMvO3Gsp8yLS2hAffVFu9ejJjZVEV9KLnvggp3v92ZfS1RpQB1q0tZeVTeX8b
 mYvq9naBoiw0zh8tNh483mwy3mqcK9T7O2pTbh31YIv9VUlfZqz9f61nnk6D0OCL3RSWsxD+vee
 iEWuiLhxvXSZVrlQwZMSKbW42zPXXexlIR6PtOftvd9Ap020wyaxbJXhOWxjLIPPizNtuC6l3Zt
 gh6F5fdyTRqqzZQmUwE02gx2k1VFRHOWwYjvs0LslJN5/t4yN+mMM4s/RExoGd5i1ZXeKW9b/GU
 4dndh92E/J8uF9BCXYaJd91zv6PVuv8xUg0HufJIvHNPQ7kokKLOP7pTm6X4Kz/WRkPbct6ZShz
 hNhFchDLxklzyhAP38J7VGdHvHrMCNU+vggrFjyEvV2akGWHWEWd6T7fxMnpJL9j60C5GkUzmkd
 3HHQP+OTM5fHQZJa7FA==
X-Authority-Analysis: v=2.4 cv=BefoFLt2 c=1 sm=1 tr=0 ts=69d76d58 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=qgi84oEYZtV-hQa44IwA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090081
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102456-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7385A3C85BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SA8775P is highly compatible with IQ9 with only some reserved memory
differences that are currently accommodated by lemans-auto.dtsi.  Rename
lemans-auto.dtsi to lemans-sa8775p.dtsi to make it clear this is SA8775P
specific rather than something common to all Lemans based AUTO SoCs.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/{lemans-auto.dtsi => lemans-sa8775p.dtsi}     | 0
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts                    | 2 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts                       | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm64/boot/dts/qcom/{lemans-auto.dtsi => lemans-sa8775p.dtsi} (100%)

diff --git a/arch/arm64/boot/dts/qcom/lemans-auto.dtsi b/arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/lemans-auto.dtsi
rename to arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
index b25f0b2c9410..7a33fa72af98 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "lemans-auto.dtsi"
+#include "lemans-sa8775p.dtsi"
 
 #include "lemans-pmics.dtsi"
 #include "lemans-ride-common.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 2d9028cd60be..436b0b1f3a63 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "lemans-auto.dtsi"
+#include "lemans-sa8775p.dtsi"
 
 #include "lemans-pmics.dtsi"
 #include "lemans-ride-common.dtsi"
-- 
2.43.0


