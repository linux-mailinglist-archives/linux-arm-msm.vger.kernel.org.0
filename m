Return-Path: <linux-arm-msm+bounces-90434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FQ7KID/dWmMKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:33:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B8A80433
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A92E030428B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 11:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0E031A7EA;
	Sun, 25 Jan 2026 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XaUMeMpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vb4baClw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF9731A54A
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340627; cv=none; b=WyBhO9TQsBfnZ41QKSrM4oxY9vSlS0a71tQkW76o7vNEHn7ct1t2ocLXlghFlnfH8kXfIVe8A4Cm93XVSJNSwi4qkPXuPr1czqYWKc5g7lhmpPfZbtGtRepgudQqbVcJh25CWZGWWaS6G6xAj/pgS/SPR8/1Ui0ne+l7b/ESaY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340627; c=relaxed/simple;
	bh=vCjp6Otef/xE5vbuvwNoduQVTq2eHsexFqb6kzgabfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJ0vPuK+BJZ4sDOcZit3D5yrhu3qovdd0cTKMXVQxnqsTZIxCrOYhlSdLX+Zsph5uTx2mmahnFbJhLKR843eT8HvsRiRMfDQ6+/kXwAV9+TeQzfbZRqkTO8pj73xO02FtmEBOdaHTkmcCCTU5qPZrtkEJm/11+ix724bjKn3W3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XaUMeMpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vb4baClw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P6GrrT2888366
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXzLPzKJmMMfBleWuh+IFIAqE4Ffe4ls9p1aUztqIUU=; b=XaUMeMpR90SZTHdW
	kiMEOE7kQ6uiI+6u9E/sOXjbeFSoV807stnOdr3EbZbr1sFWnPF3U/Zbh8xVwtLc
	iJgCkhH/9HoeGW/zncbR9HxX3An4EHOWgDNSe8mS5PXHkMQJVFKAUOpmOtdXblgZ
	5ymmMkiMsq3RtSH5JzVf1xuToVHThDqprVVVTrE7uij+Tbi5QTSk9vcTXaVqDlR9
	e8gSrKHXQl1ooYTEZh7GL6Y3zByf7N75ZAvmXByuuqNPTNenryAAG5FyWiuvp5i2
	Hw+/cx88GB+8eXTBOPbHIlTp/R+G84ftDWETgfW0e1s36G+nMwefozTsi2ZHVn1F
	fmdN1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qj0uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6ae763d03so375642885a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 03:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340622; x=1769945422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXzLPzKJmMMfBleWuh+IFIAqE4Ffe4ls9p1aUztqIUU=;
        b=Vb4baClwvmSd4hRTvRsUuEXvjT5/NdKNjeVzHDNkGeo3jO7YwYbIz+e5ItVJRybimS
         Cv4J/XeUum4ifUc+/GzB4Ns1/CsK3wXIcNsE3TF1MCm66B5N7esnUM4iu7JxZC8V+UdQ
         xmc+5kf9k+mBeXJp6yTibeMkzqtLnTUQqmKsVmP5NNE+OiOq7pe+ltenAnT+cTCR6MaR
         AdvBd+LNmzBS3t4Wb3UFvZ7etEE0xT8s1SABRK5KT8WxJ8+TwIOW9fVuFYrI2Oykx+oU
         FgSmSucSl0xxxxNs756O1Om2m7lvemKRkOSC/ikFF/DPwbVniuG3z8CeZKjpvybcqbb5
         RmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340622; x=1769945422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JXzLPzKJmMMfBleWuh+IFIAqE4Ffe4ls9p1aUztqIUU=;
        b=H92n4jQvrw/U83NcV/gJwv8oCxOloa6aJxlG1YxJzHVhV1TpM+qzHwzbEwhHoS++9N
         ZFA/7lV+a7NDbBoWbM0jPQXsFZ9WNl/pR5r7TSy9p/zQKHR0JTUq4jtE+Pz5saKT91fB
         nD8pnDiv1X0atBKd0+i+6vfNg7757kM8rKmh6b5hzLKrPCU+BFVRiwseZeZ7O3apO8BO
         r5/P8hd3f6FHvFH48Oqd9KZGTs4BNohNeBWL8zc/K/KRfcznuXZ6mSlILiFsqMikb+oR
         q05gw16HVY41550pQMss7le+YkD6BPzf+PNkuBFDCZ035lfRTiHqzkVECKs2+uOxU5zl
         Vp6w==
X-Forwarded-Encrypted: i=1; AJvYcCWm2z4kdvrKlaIW5u3hwHauzoVszZAhPw3k6qON7Scbx9B8HBMmsNINmBJZPqBqOOkxeqiVmrANZciFYOYP@vger.kernel.org
X-Gm-Message-State: AOJu0YwaOA0yr56JlH2AfMxVqeEvQth1IteamFbTkK5d6DxAaVf2wuvc
	xqk17G0oUqH/fI5grwSrrkGPvDr7zB+vtSbnfu/6vXbzb86185431bYPSKXuodz/C1N9ICtf84X
	7BJ1+mOWF0QalD8vqTyc9AvdpfRW2w53zIkw9TpXX2p05Agj4V26LhWAiFOTghrz+UsgmGvtGtC
	xV
X-Gm-Gg: AZuq6aIPpeLlRZe5drNS4Q9cjHyFIAR1FVY7rskCnJFJ2MxIl8QgavrnKRx46HmHkLy
	6/OmBj5grQ5Xf/ovK3eqEzxKeRn2VRlrcStlXQiY7Xz+aOu1stt52N/t+3vlHeC7jSnHdSDkAF9
	ohorqbVv37WAfBpt59W4zUJplmTJDySn21a4YgaQbVlq8n6VGWV312h5DdLwFAKuc8jAvonhAdw
	r+l3Gkk8FWPsYgNtHnuTmjIsyshh5Y8jebwKMIb1RXN7XghKka6GEE/lnifhIcTWM6iNxyreImK
	OgJZuRA2kXmp3QysKtnvwyX53c4p5GDH6VwsDj4JauLIIFhMw+MyHMU/liKVC261Gmnr4Z9Trpm
	tVObUhZ5e086/68pdNZG2621dB0RgJ7IEn/bId14pU20t2kO5i4QypJrK9omn5oBApHjMhQMOms
	zaztrQ79ceG5rNMaMJjzboH80=
X-Received: by 2002:a05:620a:469e:b0:8c6:db7f:d4f8 with SMTP id af79cd13be357-8c6f9565e95mr156279085a.18.1769340622136;
        Sun, 25 Jan 2026 03:30:22 -0800 (PST)
X-Received: by 2002:a05:620a:469e:b0:8c6:db7f:d4f8 with SMTP id af79cd13be357-8c6f9565e95mr156276685a.18.1769340621720;
        Sun, 25 Jan 2026 03:30:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:06 +0200
Subject: [PATCH v4 4/9] media: iris: don't specify min_acc_length in the
 source code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-4-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3117;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vCjp6Otef/xE5vbuvwNoduQVTq2eHsexFqb6kzgabfE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/dUSxAP7UblvRb8kGWVJzqs8Ocmet1os/n
 4l7WYzjvrGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1UQhB/0SdagutS0t8C4HAwNbbEbmfVRmSBvi7KeOdANOhfifoGEYcJhf0NCoVJ0o7Zpq+QCcfwT
 RqNqFHyNatMyikz7X+AbeH2PZWC1mcQ+zDMrH+4kiEpcERHEsIhWkay2vihuYye4hjmEL1Y9Jbi
 +hC7FB1FwdAa5RltdrpCu4e0fMQf3sQOoy9iuXRqZbvc6umprPFNCFRHSuc3vz/j7w/EZ7O1xcj
 lZY6Sh8U9Ppuq2w81+JiuLNPCFuBtAh/ot1/wzFQ2yuf8wCs5KbVr0Wo2C4WlUhY82NItnRROky
 uKYbzA46dT4TKAb0Xs5vhyK8a0EaoTDkyWl+EMjZjjEPuL02
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: u1pxTHjkE_a4m3G5pz8SSxumykuAaNm6
X-Proofpoint-GUID: u1pxTHjkE_a4m3G5pz8SSxumykuAaNm6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX0ACftPXq27Mo
 TQR+UjRrRfR/xCpBKpO1N+f1L7Z1NTRNAQA8eWPVX6rcbY9SBZRkjbWiL873F9WFTDtr+rTwPOi
 /eNC0ZrrmZU8hu9geIbAG8RYg0oKbYnHzvPFjm27et8yPK/+QTpIh0hXxSsknbRC38xLNn7U32I
 PfxShsfAinUaXBKXaVWr/zqo+I1ad7Ou0cs6QLBiNdf3UZqQkrXs5+xLkSr3IG2kfBdzVr8e/pH
 +k7Ejlx51zRMYMbdp94q+gDK2VYb38cGIRHsUtbyoehuCtmbipMyuQM+80IqU1qxvwwYdmytQ7X
 AwHw0ookbL8uJkuAsRmhgB9Cw5Ek5Q0CJo4ioWquHlLJkTp2WmCLKI7rtdMNolCV+jbmQ7sWbc9
 Iueuo8tmucFq3qHnFs/9Pav/KKUiWbCh2wJWPWq0E9Bwpqli+Jz0bE9/uDowQgGSTI4hKcT2t/B
 y7G9fRFrTuRt8JsooRg==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6975fecf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qS6nuPEoivtXufaKKhMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90434-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04B8A80433
X-Rspamd-Action: no action

The min_acc length can be calculated from the platform UBWC
configuration. Use the freshly introduced helper and calculate min_acc
length based on the platform UBWC configuration instead of specifying it
directly in the source.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++++-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index d77fa29f44fc..aa4520b27739 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -3,6 +3,9 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/printk.h>
+#include <linux/soc/qcom/ubwc.h>
+
 #include "iris_hfi_common.h"
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_packet.h"
@@ -120,6 +123,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
 
 void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
 	u32 payload = 0;
 
 	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
@@ -146,7 +150,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->mal_length;
+	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAL_LENGTH,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..08a9529e599b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,7 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	mal_length;
 	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6..01c6ffa7e084 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,7 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.mal_length = 32,
 	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,

-- 
2.47.3


