Return-Path: <linux-arm-msm+bounces-69699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A01DAB2BD72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 283801BC7045
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95ECB31AF1F;
	Tue, 19 Aug 2025 09:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwgMvqx6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E65231A050
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595667; cv=none; b=uqnOUDz7g7mmUPprukce3/zbACrMmvnHSs7dZkY4IGufqo8Vv9Z0iGiJskl1Ww3o30ey9o2ns4MISbI9ve9i3bECt2rn6q9TJGYDwgi9mX5bn/OhSD15vgmokL6OTQ+4kkqW5la+5Ao5ONVvkoTtqBgd2F5x4jkXAGmswRQeOUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595667; c=relaxed/simple;
	bh=mQUBUhTJIkEVd17LK62zreRv2cywfgL18mzSnA6eK8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4gJnGtUQTnBZsnZX36k3jFn79wli4rJaEw6gwqkY7IfyLv3FVJ/KhtAHsunlDCm+gk20+gkAQT7wyL20IkYLMvNykD6zWamMfUQCR0OwJyeE/+RT98fpTJwOy9dFdTr/w+pbByTAtKJsoVJ8J/tmrrUBeE4dF9o2nsO4b6vOpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwgMvqx6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90d2p032436
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CyLYEil3TgY
	GIEbJLbRwKXtE0JhM9xLvHblciK6/Lyo=; b=PwgMvqx63YPuSxOJG+FYmgYCFMb
	sff3WprLut+iB4k4pW3+74b2MH6T+igimwSvHFuEcm9p7phUiCwBgUoAMewk4W71
	l/vqjaTii/wAL5HzLQxiIKXAYUrsOtYmJEl/RarK1r3mNDeBWBwEyabeJlWWD81x
	xQTCUqiVG6EWMKAN/iQ4N8plJS1/17b0KwnZ8bNjfp64a7a5zOJfy4/RQzAIT5ke
	oq+GUs0qdyLEMBKc/sG1WQjLtuZsEkkjeTmhs1V7m9rvgfEWkkVgWlut3C1rCEMO
	jqYqourv0VccXMGMoJL0Nt4pLYJWMBKigEoprJbb95/VzBY5gHd/xSb8r7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ug1hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:27:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e870614b86so2050971585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595661; x=1756200461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CyLYEil3TgYGIEbJLbRwKXtE0JhM9xLvHblciK6/Lyo=;
        b=E7Pkflx5pAaxaJ6dAwdOdkg19pNc8Ia5DeOBDiUF2gzrRtN0takKUMcBHXfAI2kK0h
         8G4JwffDwVAncdYRMp7WZaioseL+1sO/t4maY+4QY6wqHOtMrpcP/69awRQ2choMptrQ
         6u4YpsQ+hoh8kekGM0J6KH/gmO8zz74NbbqaiE6QlNWvJuGp8EV0n/mCFIYPqATdLjqT
         6swYWu2dX4gJ61cEYOcLmVKfLIaKTNXuoW97qbSztwasTMWrAPVAQbbVfIWPcAw4tcDg
         w/0iubf8rzCWVa03akRXZ5MzxcMNN7jr+57b3sYjVb5hdE+Q10HYxwhHmACnDIgVhlUP
         Q2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXAmRVtyZGGrWTqGQseCmwt6ckeGG/Yg1H4/mxlx6DnfiDVpK8FCnYKuLK2dnuAL24MVZEJUtB2naoGbIpX@vger.kernel.org
X-Gm-Message-State: AOJu0YxqdtIlE1vryP6nL5Cg3duH9FwPthDHgYMElUW/+oKs6YRcWhBj
	gyXxrugxEwOaC+20C1CIXNs5oNF5LP1d1izU+J4ut0Q2kCawE5ZoaEp8yDDKshGKSNlGj00jGzZ
	/VqT/rA6MLzacMVpLgo88CTYLguG/PBs1l3N9il+9LryceKnhYATBdjwUBQ6pnTq38zwOMUhV2W
	hk
X-Gm-Gg: ASbGncv28l4EhGi6+EFRWA2HqDKAAdWD3F6k8m7e/35bxkAOeOwG9ZL2gN8EB78s24n
	6uCy7RXCC3i9EdMQf1PaKlB1pk+cf81vcPLynO0isA4ZObwipWl/v8IaKZQnXAT0jLAu1gguEAi
	43WRIX9Hv3BICIn8L3f7POTqP7U20+gm1UXrV3pAZ9bKWu0AskXaGBdaG8tTvb7AE3G614AUGTn
	tkVke+wUAOr3QhBDaTB+stwK5TnDsMMxKXUi9yGcOKSvTx++p7dHv7QuudaTLXHZas/uvoUjGJf
	KO3tqHFPcFkv1SgeMxc6nrwmBUK9foMqpKfzdjefeOUFjb7eNxAKhg==
X-Received: by 2002:a05:620a:318d:b0:7e6:93bf:994c with SMTP id af79cd13be357-7e9f3361692mr232234285a.38.1755595661328;
        Tue, 19 Aug 2025 02:27:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1TjeG+Qnr0RzGfLzCytOelnNfUVpxdZzDk0Sv5IjBfeYEtkk+eUnZHC+HPE6u1SpsAIizbg==
X-Received: by 2002:a05:6214:c28:b0:709:e1c3:cbbd with SMTP id 6a1803df08f44-70c2b63c5bbmr17392576d6.21.1755595619040;
        Tue, 19 Aug 2025 02:26:59 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm2942284f8f.48.2025.08.19.02.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:26:58 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/6] ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
Date: Tue, 19 Aug 2025 10:26:50 +0100
Message-ID: <20250819092652.1291164-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819092652.1291164-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819092652.1291164-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a44391 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2ggkzc9sqBovd5WwaRoA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yu4aVtjAvezk5pk06bcQLvuODLaBIj7Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX4Wux7gTrMpTv
 N4WuX53zHxv0UqSp1DoiogsU2zUKm+2ly2T+GqvTP2pHM53em75i0lo+NffzUJt/urU3oGCzyrQ
 /L2IF/RKjDDmq9zLUsr+BPv6CfHkAFjz0oHakvVdqhLW/PzIwDkv6/1AilfwxaDt7S83BHQ0eDW
 SryqPJgRkLdf0s94g48Kjbvint8VzInyTpw6eTXfDNq6trz5OCWL4LpSfZQZuJj1QgCn3vTkhyh
 MDmXDXvjFvyhXhjZ3zQP0XMvvUYdEqOdbkkFqj+155rorA2/+iD6C7WNC92IYcqW+N45uQXbEc2
 VHw9arxw1UcSEE78mhDrB+R0yprEQqXgMT+rR94uBLi3Ehw/18vSAeWV9o872gx3u/CrY2hTXQY
 BzlxK9gq
X-Proofpoint-GUID: yu4aVtjAvezk5pk06bcQLvuODLaBIj7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Fix spelling mistakes in I2S_INTF_TYPE defines.

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 617bda051cf8..efc918452e2a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -462,8 +462,8 @@ struct param_id_i2s_intf_cfg {
 } __packed;
 
 #define I2S_INTF_TYPE_PRIMARY		0
-#define I2S_INTF_TYPE_SECOINDARY	1
-#define I2S_INTF_TYPE_TERTINARY		2
+#define I2S_INTF_TYPE_SECONDARY		1
+#define I2S_INTF_TYPE_TERTIARY		2
 #define I2S_INTF_TYPE_QUATERNARY	3
 #define I2S_INTF_TYPE_QUINARY		4
 #define I2S_SD0				1
-- 
2.50.0


