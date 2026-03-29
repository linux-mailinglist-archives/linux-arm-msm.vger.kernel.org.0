Return-Path: <linux-arm-msm+bounces-100569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LQ4EV10yGkNmQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 01:37:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9318D350584
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 01:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3BF03099832
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 00:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C221C8604;
	Sun, 29 Mar 2026 00:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UerhJMKy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZpZSIpwP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9DF191F91
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774744426; cv=none; b=Eh4uOIWuepipk9yQTWc8DeNJUHvALBm2kdayfudzgJxJ3+pCuKOf6DyGqgYcK+QhsIrItn5bFaAQpOwK35OM7UTG2Hzbd+WhIEKgGMB+1YYNiGaY0mYafQPmBmo0KZW7wLmDpCmAEod9M5UpTGSMwb8UpLUrfxAmLXzRLS9A+VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774744426; c=relaxed/simple;
	bh=mN2B8mMErlly0rhOY6EnYewAknm6tdZRVcCuF6xiQiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EXIjQffDUDlItjEktCjHeaE2fmDfa6QT3W6OWGnlBBoD/zTyMvFiCLZjZI3TOuSJ1fyoVLzteq8Uw63Hc/ddpNHRFK+OPjcOU+rw8nJAZZ69jMEAmKJMT5zXUu2hOJw8UtBBgJso/dhb9QEgvaMPNnDQKWBBtGALCKr6IM9x2nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UerhJMKy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZpZSIpwP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SMLm1c3291583
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X3roVKO9HbGyFQCP9qFC8PS8kvPsGONebIVZO3TAK2Y=; b=UerhJMKyi0elsyWB
	R+rxT5Awo7FYJHsFGuGZ8SAlTNJjyzl49aFFHe/Vv5BKPAUM08JMzKI6M4CCrl4i
	Y6eyZA8m4nBP7Sx++n1GQKemVHbcau+SmfDHndobEU+taC+BTQkuiYGpzsRLeJJa
	h4mB0Eb3fOjYB/HBu1C7Xrw9OsJRrSInJR1dtD7WCZXl84Z+y7HltgIm8bwCWmvj
	5xi6Nhodj5jlk7Q8/zGrgBTYnEZO7O/UPW884fpbmkh53DnDe5HFkxWcIFdLbxlG
	Kb3wAVqq4UKV65q5CvRSTPEAOhyWXPnf60/+WX5Jm0peQj8vy1kxi3suYwRrMScA
	i7JWMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqhxa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:33:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfdc479f68so379927985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 17:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774744422; x=1775349222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3roVKO9HbGyFQCP9qFC8PS8kvPsGONebIVZO3TAK2Y=;
        b=ZpZSIpwP1xI23iaArca3chNJlMzxO0m8zZrCv5D5spsIEcoJQCSo8oFNUp3EOMpTzx
         nNlwSZxVmXqmtvNxktmSnUejgBmjpHr+2wMge2mtnnCvR1Mm6SOrGGJKfGrHl8aXfOVB
         /jZHDEiN87DzsywQpVGdPSTSeFLR9t39P/WiA5uyjpz4ZLhbl4fpVENTaJsY5pqBsnde
         qQwM+7gk97cSwiAV56dOR1vIUWAuNgk0E3dHGAh4whS2Qm3MPrU+jc3ZI1MH7VJNke7d
         QSfjbm35U8l0peEURFx+BYjSLUv8IzqbsxRgRydu2XP/XTuddiQIn7kfugEBOTsQgEPz
         sKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774744422; x=1775349222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X3roVKO9HbGyFQCP9qFC8PS8kvPsGONebIVZO3TAK2Y=;
        b=i0KAII9X0FZNtwwjJ3/yQezQfH6hI7ODSpR5qy/rbOyD1Ekv7EmmL8EfzhhcNWTb1K
         BVHwsVJ6joMfpTdww5SB8QyhM/89o63moWfU8uumwsoVl2I+xj7Arnvux3P00Mjc/T6g
         P8ZKQCETirqAPF1U003JsoHxe1XitKbqqInTZcVrxIA7cQrpQMNUSA+9lBIDd1ja9ufV
         jj6tRSxI4MXklZlMna8ZjTtbsex0NWTWuL8GUZAbsvlXt1g2rzPWxkGYx7ThjtyqZXDN
         xIKBcuFXcJ+B6PuAb+wI3Q/Zi5KmsvAduUYmQEoBjQAt8QMZ3ja3WZmXqIeRvqZrsXxu
         79mA==
X-Forwarded-Encrypted: i=1; AJvYcCVIfN07OXABnSRSpcup0XlDQ2EjnpQxKgYx0Hczd31fl+K88ABQAro5BP1KLGgEpgKRneZEiH7vDk6kDZrQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzXCrHxP32/JYyD0ZgNfLP76QQbfg9UKOybgDdfdGMzCIhvLffo
	z7A9koK52fYolc7xocwM9y5kRkrbwxkWXf232F8rV7ANt+dTHxlthRzZ7YGQdGTiHGT94rvpfXM
	u9V12zYKP4FPUSJ3sFc2UMQ/NWlcY+Jg5nH2Qr9mywpnNhCOU7BmALltgR4ardpgnRRGi
X-Gm-Gg: ATEYQzytvNVntvm62VRL9nVtnNrxhZHgtdULACKf8R49+dMFA9OTYjvo/RXJJ1ekIXs
	NbBqzv0s0vedY0kwqg5ltsFLpnSwZ0dJyPeTbErmXP58S8ZWzA/7xAlLuPXZyLkMu1fbW5VCxM+
	6ZRSn2T/Q3xT22vJ6QVt1pxPxHPyltNfe4hbYFDLY6lB3RO/CZ8sGj0Up5U4c1Dlisk3dt/ns+D
	/BnzlYZLYqJCOhE8nqIAEIzVW/GrWzf4g/bW376Dis0CmpPa3cklLwCntoV8OgsaNjwfrtqm20k
	5aiOIB9M+upyfqNyubUfdg9qKPkZFu/h53oDjj2+rIGgbAPaN+V16JeLcwmHPDk4Dn2j5/KckuH
	jwEAJwlJOt0GyKSL42ch9ShqxpwHcsaocrBlMkSJ3994DdBHBPhKJ408ImUddJKjNexWgY9d6jn
	YUiMjJWQyTf4OWveSgasQmPKb6K506y1jueNw=
X-Received: by 2002:a05:622a:15d5:b0:50b:2c9f:dee4 with SMTP id d75a77b69052e-50ba395cdcamr100299431cf.52.1774744422430;
        Sat, 28 Mar 2026 17:33:42 -0700 (PDT)
X-Received: by 2002:a05:622a:15d5:b0:50b:2c9f:dee4 with SMTP id d75a77b69052e-50ba395cdcamr100299191cf.52.1774744421873;
        Sat, 28 Mar 2026 17:33:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83892035sm7024731fa.22.2026.03.28.17.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 17:33:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 29 Mar 2026 02:33:07 +0200
Subject: [PATCH v11 06/11] media: qcom: iris: move get_instance to
 iris_hfi_sys_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-iris-platform-data-v11-6-eea672b03a95@oss.qualcomm.com>
References: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
In-Reply-To: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9259;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mN2B8mMErlly0rhOY6EnYewAknm6tdZRVcCuF6xiQiQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpyHNIDSW7QX2wf7VS3h2WorT7dRZsvw80vUJIJ
 8htp/EpmrWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCachzSAAKCRCLPIo+Aiko
 1eFMB/493MO7NlrCAl7SIz1E6FjyaC/lhLerN3LObuQVZH+8lFzwAga9DTV3EsZBZw1BjvPrwLY
 bBqsJmythX2nFPcPGI5opis/CEW/FN4M7mNLUJVfwZEn1rUWiWTwuGrQIVIzonqflArhflaQcTS
 8WXcWrWwzQE4lcz10btpEI8VTAEjcrzQkKqfHOXay18av/glOp+1WYfkavoQKUWRXQ1YYTKU3fX
 pEoG3u+A4Pys4gSeyUGzuJKIAkubH1j4KOzhBFrxEYjQHF8WNrx7HtalpWl3cwDobpx+aHyGHtw
 GBtoa7IjtpnwnPoq0VmNNcmwMopxjvvXizIpm+Af0JvtJ3kx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Rce4T-1PjewFZhYjmOlIPsTlXjrfyrOA
X-Proofpoint-GUID: Rce4T-1PjewFZhYjmOlIPsTlXjrfyrOA
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c87367 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=2oeCRJBNelE_HTcD8YQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAwMiBTYWx0ZWRfX2Zh8DHX/PAzN
 vsZ+tzgunOQ/FlxcmiuF1BaUUfYDb3m36TCPXYR5prUGtHvCPdwOMqj6Oeo4GDgcidtf/PWLWe+
 n5XY01Bg7aQvx+HNmHFYM9Yykn2UzTaFx7jlP7675ygyqWxaAY+SbrP0EtUoZM6r93j/vo/RMWW
 fCIgTlvuje/OIMxRRQoh7wSFROAUItz+V+4W5cFfSlnqKp4prgGcre8ail1LGBMwF4CjCPzx8l2
 dXcHVogAJQTv/JqtdgUJTZ4KwR1Yh2drKsaIVwmxnetFDeloRrYMKtEF+V+2trIqIacNR9+IrC3
 xXBzplfbCnf6SIUBZ/BcxB6OOdKDQ0jKAARBk8e1YXzyYRcXSJkOGuTzOxoHLZjxHjGMz3kpdOK
 nx57qABd/AMjZmVUZBrMQXRQPKaCyNS8oONB1iV3h+eCva53Tnp3GPoH7nsHzbjGsImhzpXwTgs
 wrAgzMEvq8ArtUAzbOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290002
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100569-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9318D350584
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The get_instance() is a callback tightly connected to the HFI
implementation. Move it into the new iris_hfi_sys_ops structure, merging
all core callbacks into a single vtable.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  2 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  2 --
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 28 ++++++++++----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  1 -
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 30 ++++++++++++----------
 .../platform/qcom/iris/iris_platform_common.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 --
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  4 ---
 drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
 9 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 9aa84a1d8f95..a27447eb2519 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -112,6 +112,8 @@ struct iris_hfi_sys_ops {
 	int (*sys_pc_prep)(struct iris_core *core);
 
 	void (*sys_hfi_response_handler)(struct iris_core *core);
+
+	struct iris_inst *(*sys_get_instance)(void);
 };
 
 struct iris_hfi_session_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
index 38e9d262d7df..c37adf65055a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
@@ -7,10 +7,8 @@
 #define __IRIS_HFI_GEN1_H__
 
 struct iris_core;
-struct iris_inst;
 
 void iris_hfi_gen1_sys_ops_init(struct iris_core *core);
 void iris_hfi_gen1_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen1_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 26b7feb05d15..0017ade4adbd 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1076,6 +1076,19 @@ static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_close = iris_hfi_gen1_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen1_get_instance(void)
+{
+	struct iris_inst *out;
+
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->hfi_session_ops = &iris_hfi_gen1_session_ops;
+
+	return out;
+}
+
 static const struct iris_hfi_sys_ops iris_hfi_gen1_sys_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
@@ -1083,22 +1096,11 @@ static const struct iris_hfi_sys_ops iris_hfi_gen1_sys_ops = {
 	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
 
 	.sys_hfi_response_handler = iris_hfi_gen1_response_handler,
+
+	.sys_get_instance = iris_hfi_gen1_get_instance,
 };
 
 void iris_hfi_gen1_sys_ops_init(struct iris_core *core)
 {
 	core->hfi_sys_ops = &iris_hfi_gen1_sys_ops;
 }
-
-struct iris_inst *iris_hfi_gen1_get_instance(void)
-{
-	struct iris_inst *out;
-
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->hfi_session_ops = &iris_hfi_gen1_session_ops;
-
-	return out;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index 6cc6d9890c12..21ab58e0aa84 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -36,6 +36,5 @@ struct iris_inst_hfi_gen2 {
 
 void iris_hfi_gen2_sys_ops_init(struct iris_core *core);
 void iris_hfi_gen2_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen2_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 0c98d680bf09..639b75fca1ab 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1315,6 +1315,20 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_close = iris_hfi_gen2_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen2_get_instance(void)
+{
+	struct iris_inst_hfi_gen2 *out;
+
+	/* The allocation is intentionally larger than struct iris_inst. */
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->inst.hfi_session_ops = &iris_hfi_gen2_session_ops;
+
+	return &out->inst;
+}
+
 static const struct iris_hfi_sys_ops iris_hfi_gen2_sys_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
@@ -1322,23 +1336,11 @@ static const struct iris_hfi_sys_ops iris_hfi_gen2_sys_ops = {
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
 
 	.sys_hfi_response_handler = iris_hfi_gen2_response_handler,
+
+	.sys_get_instance = iris_hfi_gen2_get_instance,
 };
 
 void iris_hfi_gen2_sys_ops_init(struct iris_core *core)
 {
 	core->hfi_sys_ops = &iris_hfi_gen2_sys_ops;
 }
-
-struct iris_inst *iris_hfi_gen2_get_instance(void)
-{
-	struct iris_inst_hfi_gen2 *out;
-
-	/* The allocation is intentionally larger than struct iris_inst. */
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->inst.hfi_session_ops = &iris_hfi_gen2_session_ops;
-
-	return &out->inst;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6b76a9046f9a..d1daef2d874b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -203,7 +203,6 @@ enum platform_pm_domain_type {
 
 struct iris_platform_data {
 	void (*init_hfi_ops)(struct iris_core *core);
-	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index dc74da04771b..9925a893b404 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -333,7 +333,6 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
@@ -385,7 +384,6 @@ const struct iris_platform_data sm8250_data = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 19e99e1c2aff..10a972f96cbe 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -907,7 +907,6 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
@@ -1006,7 +1005,6 @@ const struct iris_platform_data sm8550_data = {
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
@@ -1100,7 +1098,6 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
@@ -1196,7 +1193,6 @@ const struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 7e03d63578e1..ecd8a20fedbf 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -156,7 +156,7 @@ int iris_open(struct file *filp)
 
 	pm_runtime_put_sync(core->dev);
 
-	inst = core->iris_platform_data->get_instance();
+	inst = core->hfi_sys_ops->sys_get_instance();
 	if (!inst)
 		return -ENOMEM;
 

-- 
2.47.3


