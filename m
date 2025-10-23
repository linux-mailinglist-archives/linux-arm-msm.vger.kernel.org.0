Return-Path: <linux-arm-msm+bounces-78539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6601BC00789
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DB5A18929FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A83530E828;
	Thu, 23 Oct 2025 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6yzip0L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E609C30DEAE
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215176; cv=none; b=f2MYov9rgh9B7V6GyFhvvWuzJZ7cutzqblu34hdrPh6pZN512yPX/ClvxwkopbtcQM+zVOw4NwlRUGCmg6hmVd07qPiU6eJvdn6LFwwhW+8QLIY5DeZ/wdByHFQCfRpiQyBACA2XHj2lz4MPX2QYrXoV6VyISzhg4fyn8v87fGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215176; c=relaxed/simple;
	bh=bilYqDTijOVI3Ym7tdbxk/7Oij4S7gx62HEm/BQXlfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vElhziTeGkzOvqWQNvd7ZqAqOI9Fu7B+RyuJnDw4+w0yb7VPAi9l3LzA2jQNeT/U7T98hwxh3on1anRVuYFXvcW0z6QUGuylWdHNyaJl2CC4TYbz2JzM6xYslPS40VhlNa/5uwd4H0EbH3j2L2ecmBd+spaGDXDv6E9gETek+hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6yzip0L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7x9SS019207
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q/jUAXEKNOQ
	5BE1XPscr9ID7DIaSGQKQv9C4H2dtDd4=; b=K6yzip0LtOg/vBX4h04eN0SVE1K
	6TYB/ZgJLcSFk24PlAX0oyfiBnKBJ3lTbZwBTd2DLUwVQZdxMa7VkE3uyiBE4nTe
	2sdMvHz8q6KySEQL/Tdypx0+3OHOAyV6OJ+d37j8+INTfQtKucxBLH5qW+DGJ1Pi
	Eu0FS2nXbKN6E5iO9j+WJAasHFG38NoJrbtSFU0wujldzmumMw81ADnCabo0zjV1
	7VCZQyD9lveQqjGpHE0BAW/sQsYhDSbdBNv3Sc/Dy7sijq+7FgifQ3d/qsi9PYKf
	F0Ta+LmwWRrk7htjMog9ofgNKV2GthyFvc43c31KnQvZBJ0thGS9eoAlmpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhyxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e894937010so18239651cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215171; x=1761819971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/jUAXEKNOQ5BE1XPscr9ID7DIaSGQKQv9C4H2dtDd4=;
        b=MF5Ba9Vy9znnPY1EbpyXGRvzh5cQFDz3LP7x8p9hs9+V3cqQePK/vDfulC4IjsRU2U
         j595WCMRxEdSdqEflLf6KO7jS3fqqzfZVLSOpk06DucnGTAKGx57WkFSYyI4QBMOmlFO
         ZOm6R+DX2YocDeQ9nrE6c/mDnGb2tNbhF5jvG0DM4ULjFcHzub51AwxwthhaNgVtMw/Z
         d5Nl94h8DzaKMhc8/Ponhgl7FJ57NULhU+HSvPBlo7pMFWdcVvEjM92hrBGPqy+0qMbZ
         fvdYZdFLfzq/3p1WMN0+/qweieCibWpAbApmbgeB1ssRgXwQolBWYkBgJ6SZnz+lkOzk
         99dw==
X-Forwarded-Encrypted: i=1; AJvYcCXVElp1/NZhF9wVq9DsVN2SP6s5rc+CocC6mPRQWQbJnZvpipcNlAEwC2FSBo3m6JJ5z5LbGaPyz//mRkIf@vger.kernel.org
X-Gm-Message-State: AOJu0YyPeE4W7G/pK/3cr2yREAyHgKfIaojfRCJtJ3g2XLax9kpogg4R
	Re3sVqcFAppyPXlJB5fsdKcjR/tRU37+3UZC5dwp2s4WIcfrw7UUzdhBHhdfZEdii+fOIBU+wuc
	lcV158csnwy6SoHvIt/gmvR1QszEW4kYUOVa10cyLeyJzQVI2oQuzhatYkGNm/Edi9c60
X-Gm-Gg: ASbGnctWloLub6rKqqPXzJOzpYlm7o8gf04iFMvalP/XzVt6Mc6Fum4CS0Qj/KkMcYV
	MwjuMiPPeZ4r3LBRE2DIkb0aMKmyC08xhiUu+D0etqNXlCmI3i9BaFRYa/JmVNgH6Wdd9+UXDlp
	DlS2VmfQqvQRJJoPvaKpJHK8TLP2QziVn25yXAKSu12QegkLEq8m5XB36CcpMAqPjvQILZrjJaK
	Cab5EzXJ18/iS/s7rAEl/XOKWCUGaGLTyMm3eS2qO0wCpB5vlDgL6PAQHA1FXeO7D2tZcWIVtDf
	FaO2k4zCYUrb/d1/wP9jOixHbHjApaGC9EhSvW20rFtJMoeldEowxcN7elbD7BSjlVLbzsOogHy
	5rJarsHlBu2RF
X-Received: by 2002:ac8:5792:0:b0:4e8:ac66:ee42 with SMTP id d75a77b69052e-4e8ac66f458mr252665561cf.27.1761215170595;
        Thu, 23 Oct 2025 03:26:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWFQYJgDTadBI0CLEt07gUG/hH7KmtA4wCHAIN4ey5J4mMmr8Q6aFMeRo7VX/EjbM4dYegVg==
X-Received: by 2002:ac8:5792:0:b0:4e8:ac66:ee42 with SMTP id d75a77b69052e-4e8ac66f458mr252665271cf.27.1761215169907;
        Thu, 23 Oct 2025 03:26:09 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 12/20] ASoc: qcom: q6adm: Use automatic cleanup of kfree()
Date: Thu, 23 Oct 2025 11:24:36 +0100
Message-ID: <20251023102444.88158-13-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfXz6eVaM3M/9Ja
 n+DCuaguSq0OckAMv9U6eBL9fqdDWVcao/62dxXc07lKEUNnkzL/AV7o6jxzoN5VwwQ1mYS2uZT
 QGHqZx/3qE8rWHqasSKLpthbva694aN4FFlJmF0PyFxp0+Yyq/xc1NWckLrREw7hdiMfMlgboFi
 U6alLKfqSW8dAEX+pPc07n8FP8i+eO/xkJuiYdcv1f/MJa26zeNWg5IXevmzDHR6gB4lhksPYk5
 0jPoldanu9EWfH0xAlrksZ216NSOlYMrg7V1/HIRHnngNS9a9X+Wqub8RTKa2xABup8yYcvhoR9
 XQzitn2x2xHhuh5nfQV65eyH4dDbFe1ZCgy2Dun7D8/vlEg/0aWizbxd/TpQk5y4NC0hi1sW8/o
 o5WTZUAmUAW0VsyfAxAZKATSbEAAZQ==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fa02c3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=EQMblWJGb8QQpEaKAwIA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: AwHDEGVVYLhPyCjIWZISLfljEzhnGubU
X-Proofpoint-ORIG-GUID: AwHDEGVVYLhPyCjIWZISLfljEzhnGubU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

Its common pattern in q6dsp code to allocate temporary buffer
to send gpr/apr packets and free at the function exit.
Now this can be simplified via __free(kfree) mechanism.

No functional changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6adm.c | 33 +++++++++------------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 75a029a696ac..0b8d06ec8b26 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -330,11 +330,8 @@ static int q6adm_device_open(struct q6adm *adm, struct q6copp *copp,
 	struct q6adm_cmd_device_open_v5 *open;
 	int afe_port = q6afe_get_port_id(port_id);
 	struct apr_pkt *pkt;
-	void *p;
-	int ret, pkt_size;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*open);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int ret, pkt_size = APR_HDR_SIZE + sizeof(*open);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -359,14 +356,9 @@ static int q6adm_device_open(struct q6adm *adm, struct q6copp *copp,
 	ret = q6dsp_map_channels(&open->dev_channel_mapping[0],
 				 channel_mode);
 	if (ret)
-		goto err;
-
-	ret = q6adm_apr_send_copp_pkt(adm, copp, pkt,
-				      ADM_CMDRSP_DEVICE_OPEN_V5);
+		return ret;
 
-err:
-	kfree(pkt);
-	return ret;
+	return q6adm_apr_send_copp_pkt(adm, copp, pkt, ADM_CMDRSP_DEVICE_OPEN_V5);
 }
 
 /**
@@ -469,15 +461,12 @@ int q6adm_matrix_map(struct device *dev, int path,
 	struct q6adm_session_map_node_v5 *node;
 	struct apr_pkt *pkt;
 	uint16_t *copps_list;
-	int pkt_size, ret, i, copp_idx;
-	void *matrix_map;
-	struct q6copp *copp;
-
+	int ret, i, copp_idx;
 	/* Assumes port_ids have already been validated during adm_open */
-	pkt_size = (APR_HDR_SIZE + sizeof(*route) +  sizeof(*node) +
+	struct q6copp *copp;
+	int pkt_size = (APR_HDR_SIZE + sizeof(*route) +  sizeof(*node) +
 		    (sizeof(uint32_t) * payload_map.num_copps));
-
-	matrix_map = kzalloc(pkt_size, GFP_KERNEL);
+	void *matrix_map __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!matrix_map)
 		return -ENOMEM;
 
@@ -515,16 +504,13 @@ int q6adm_matrix_map(struct device *dev, int path,
 		if (port_idx < 0) {
 			dev_err(dev, "Invalid port_id %d\n",
 				payload_map.port_id[i]);
-			kfree(pkt);
 			return -EINVAL;
 		}
 		copp_idx = payload_map.copp_idx[i];
 
 		copp = q6adm_find_copp(adm, port_idx, copp_idx);
-		if (!copp) {
-			kfree(pkt);
+		if (!copp)
 			return -EINVAL;
-		}
 
 		copps_list[i] = copp->id;
 		kref_put(&copp->refcount, q6adm_free_copp);
@@ -557,7 +543,6 @@ int q6adm_matrix_map(struct device *dev, int path,
 
 fail_cmd:
 	mutex_unlock(&adm->lock);
-	kfree(pkt);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6adm_matrix_map);
-- 
2.51.0


