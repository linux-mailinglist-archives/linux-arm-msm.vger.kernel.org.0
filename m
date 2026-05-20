Return-Path: <linux-arm-msm+bounces-108662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHD7Nl2CDWrUyQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:43:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6365458B00A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 400F630DE6D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFAC3CCFB0;
	Wed, 20 May 2026 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyXTwlq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApF60oeZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC5B3A4F51
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269969; cv=none; b=BaO7EgMD51ckngWavrVxkD7yfzflHjRY9CJBHz3nSXHRM02Oea3W/Vlg/3cYtcRd6HKAYWoKix7ScHR48o82ThsTydni+5fxCMgZbkS19oCrcqs6YzvmH8VxxUd8YOHEBwxzvS9tmsthVtZWuOusWFzVDP02qJ1VkQlLGKUUxqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269969; c=relaxed/simple;
	bh=nyUTaJzP8toGAdl8HalTJ9lS9wZuuQpE6XykKghAhR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=An9VHTe08+uQ1UzSlVE9SLay7oVxRwSPd/lOFjTjA9vEgthKHCBUtxqwRKFU4eURpa2CrnOKI1nxtySP9utUQoxN7XN/EncTvTcKozxIOth/tJmTTvY3NIFc+o/x2V3/RuTCPs9iSU30vxI40ugtULsAle45r/MQ/v6RplkZ1TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyXTwlq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApF60oeZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7EOZb341538
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RzwAq0zllA/
	1JavPJ3XlwFBcA15VZo8BZL5M1whyRJE=; b=YyXTwlq+7GbDNph5kyfsirCTIjN
	AYOykHnXxzu4KIBbjP2r/Gh+KsCWh14kNgVKxNBlWczX9/6YX4jl2wmwhjU1o5F/
	We/jXO2G1Xyazce7dQaNSFlbiGbjs0h0R+Hfw5x3sGTm8Q/zDnsXLgu86UxzDZ/l
	X8qDihS01AU85KFXVFVbXDjCH74v4gBs7hcIshzO4qmP0Nj3OsLx9VYDF+QJSWXo
	lYc6jQKv1tl+JFC49o3erl5UYjm6+tAaxHlCXVigHvh+y0X2Zhr5aOa39U8AoRNa
	XZVKfGauHoniTSJZP4H9QR3L3L+njrXgcA1taBLRscO5WBJep8tKVbdi70A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3vc2ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:39:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7aba0af02so45093295ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779269961; x=1779874761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzwAq0zllA/1JavPJ3XlwFBcA15VZo8BZL5M1whyRJE=;
        b=ApF60oeZVkJYBgpQRqAQ/iicNBluyKxCPfCVVWe1fQ/jPc2T1woqAYMNoHN5AJAH7F
         RR6EOeqfg7cpI4WfXEeybGYv6aw5kfL0UxE2GHnbpvL6F1E0yoiUHJQkJPEgicaM1oXW
         D5bY4FAL99b9eXNEbFwzKL5Eeqo5i3KPISvxMSMhs8n5hmidw+aWKwNmicQ8zUyvHkgV
         K/arwZHMy5ncUQcQsjcxyKPcFX/+J1CdC9nch6nLJuV4bFoazvYwp/s44ElxscoPCtMe
         mmMIrl8+9ytygJOKHFV9/eK2HTYN1OnCe8VcUZI0PvC8i5x5CU2n3nNWCmK49uzSaTY9
         Nk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269961; x=1779874761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzwAq0zllA/1JavPJ3XlwFBcA15VZo8BZL5M1whyRJE=;
        b=A/X9sgozHLenbs9hURUDG7EY8GmuvdJgAYNzrV9EH0n2+lvccV9AwFUKW95raJsNsc
         zkwPH7avD9HTXb3Bn5nlVFz7MT+vIjyjkHc4a2bokARRAYfj4fXcQ9ojJ35q2CghbH/m
         4CUlNMeXqJVVMY8pnRHjsLua1GHKdR/6boZgxOi9d5yY56fMuD+Ylj+UyBYuXvfpCedI
         ZBfNGZi4l4gNSqnOPQ062DzAkUMnpr/hdThS18VaslsvIMNNVumf3/UW4yH4JSUmudpE
         +998cCl8oRmD7eKtaGPU/3dbb3wyHDlNo5pWc6NTonVllZjyUGJ2snEIw9zBiSS0iU2m
         URWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CHyQYQ81WWFDbcmeCB46H305UqkAGmimnOoxhH3zjGCC+Z1ABaGs5bkgCFtjluG77HRqBdIAFjIaxNyDE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/QlaYafvg48XYCGs9EgxMab9+pn8aw9pkneBi4oysmwiQy115
	1gYtd4V2LlxImPHxJfIIqEhenuA3WFmsf38wOhcmvrpssgu8ku4UQVAYWmNrjeDJDiMoWJyzXok
	75dVMts9cUax28JMj6Aby13I0YjMyd1oGvZx+E4sD5Li5rHI+VNn6yf28G6RdaqvGSkgr
X-Gm-Gg: Acq92OGjL8O5rxjDSPYjtbyIvYIPeo3HlsHI0SInTSCziRFkmEQkUNa1s4wWrLXHwHV
	thoNBco+hFgk62HJluaXTglwil6y0kLgc/oLqB8lD3Vs/NFW8wTqIHFo4gZFbHl0pCLT3lDjF/M
	75lAtag8oaKayX7Sti0ii97Um9USkJl2hn+IKSCeCe/CZe1gRxb6/PVQ/SJOAdM0gMstYPL7xHK
	wK1Xj7QRrP8TEg8ufIt62h/1SFPpssFptEFYLHQNxVTdJYhkoGED742Dr7L2imZTFmtys/lW3kO
	HiwBLdkR/16j84VixpiPM1MuXeYVW/V8i+eUW2ZXx5nyv7z6eYP3da95wiU1l7vCflf/+CKvGii
	yDE8/m62Ubl8qnxgRl/hZ7R7S3X1q9of8d3WAlzGzUUcWJLNLyA==
X-Received: by 2002:a17:902:b181:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bd7e862606mr167294785ad.1.1779269960985;
        Wed, 20 May 2026 02:39:20 -0700 (PDT)
X-Received: by 2002:a17:902:b181:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bd7e862606mr167294695ad.1.1779269960550;
        Wed, 20 May 2026 02:39:20 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8baesm217052215ad.47.2026.05.20.02.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:39:20 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] usb: ucsi: ccg: Add support for CYPD6129 (CCG6)
Date: Wed, 20 May 2026 15:07:34 +0530
Message-ID: <20260520093902.2064730-4-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qJXDaeF-hW9cG-15urXiarcqHzCg2rV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MSBTYWx0ZWRfX4w87OfrJ7TS5
 XaG6lOGHsC9B3aYW9U8QOXGSJhEQQPlUPbRnN1JNRkB2ssXG+ipkxVasXvVQfep6pHoyjh7Luv0
 j9h0wE44AlZ0M2I7b698w4ORgs0s4hwzBB6f9fxQcWa3Dxt1Ru+qzb/+MzhuTEk5x+/BEcPiBls
 HFSLpLB3Z8rxUw9luMPSsB1aQABKWnXCqNIjxXMhn5pGfZNtjb4etcwOl5VJwat0/VPKgwefNi7
 kkxA7nKo+7dCs1WDZmBt8pAD9h1cFw/C5MlDUYAO7C+5hHJtC6E79Sh392AbqP2C6UhdaWM2P1d
 /AvwngclUjk61PwbkhwstGTO22aH03fO8fP+7gbz4djGfvRj3Fu5LJ1SEQlcns1WzXAKPYXesi2
 2eIk9Cp5P2UjPQ89/2nUqLGwalJhy7mBAvCo55xt7LSZtoVJwUgoU6v7u54g/pYRovhMk8aU9rH
 9dm/oBzHvrBTkU707Ig==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0d8149 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=0svvs9ifJEUDWjkQtegA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: qJXDaeF-hW9cG-15urXiarcqHzCg2rV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200091
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108662-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6365458B00A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add "cypress,cypd6129" to the UCSI CCG driver match table so the driver
can bind to CCG6-based platforms using this controller.

This is required for monza SOM USB-C support.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 199799b319c2..0695ce348135 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1520,6 +1520,7 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
-- 
2.43.0


