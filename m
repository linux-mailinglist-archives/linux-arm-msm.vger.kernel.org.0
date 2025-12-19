Return-Path: <linux-arm-msm+bounces-85817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F05ECCF4A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5088C301A34C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5BD302767;
	Fri, 19 Dec 2025 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDIoAg4C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Szd/7eu1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97FF3019A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138918; cv=none; b=YzzcCUOBdcL13BI2kcvD7UWH58yUUSj/dzDPv/MU50lLQZqhShTw6hbn+7P10rdoqL2q1HhEcoC0UBjx8/x/34lp2W3e8j9cxLelMFpYq0FJqYkisbpyBch/dEqdjjCQf2AK8nnCeHz5HCjEk4gXRYg/YOv4OvUgQPjNWFvt7nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138918; c=relaxed/simple;
	bh=D/DbbvsYNV6WfJJN+Y3qtsfzsdueJP3Q7cdgK44aCk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cV0Nz6kBCcfLDm5PEBMvcHAqZAyc6YNsRkmoCsCEB0qCjq4W88ztS2iYpf9JCUqlz9OLcpzthtRbY8M9NcOLobqBVwVOnLL4Smrfq4FCteVOyLexsP3xgMI4UU6O5LfrrNu/tZdBmmBgMV4pM0OnnsdGVXfAliP3o/A3U8CodtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDIoAg4C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Szd/7eu1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4bwhQ3975443
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=ZDIoAg4Cc6xVpFhw
	Btnbxl/g+ye7C4oWpu41TA7qnrOPbGWtcnDqsNDMPp3wVlAqbDdbdWGyiMA3YaHb
	ac42bjAMY2hW/hHq8bUJAuE4NhdolIh5DxqlA1M8TwB7OAP6gJyb2tPzrbfWZVaa
	+UEKtbHKX+t9JZl6yBGBtlb9STQiYn8K2o8+tQBeNGlMbcK/McB588mGbVBx9RMr
	SPZgN0nnigIgP0rIAUv03Q90xBVypBQsSH02vv3kZcxiabEv1V4y+L4u7WQEpjS0
	k+nqJnegjjyT++1Sm+Sb4ikxZIvL9br7XV3ryae12abBYDqWVQ9Qe2JNbZjSilXv
	0kxTpQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fj69x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4ab58098eso19695451cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138914; x=1766743714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=Szd/7eu1Ye+znIJdTDyfStdw3G+aPgvI91udf69G6NbzpCiDSFnJttfl3X81fo5KIx
         Za76cuUxoIVgWJVfabIw5gJm/Duz2/7jgYdijnwgPpZQcABMe8CZZMW8JYf2J8gVjkpz
         Ws0j+kO70Jh5GLsBapH8uDwDDEeBypBHF6n/NpiAaWmen90jwQJCMEV9NKg6ODx0csPq
         sQD/i3Jvv5QUo+xKMeRzK6q+FxKUippC+hpKnqdtpMQGF9ecX+bI1fGv5tog5uBAF0vv
         4Dc05nT5HOBQNo9/58RjJnotBZ9Rjym4Tp9gKiAxS/WecAyis1S/ZoNq60MbCU3lOosq
         Mb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138914; x=1766743714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=EHr4LBkts6kYZec6NT+LCU5oJNl7TrdpwnrQIsH/mkf+EOlazeEhuuN2epfEXgB/8K
         cZmIr98OAOvxhD5XN211gY6g+Ax7f8hgmH9GW2CnrzPpu2h4DKZbiT1tQewVD/nEo99K
         tDjEsmywKnGgxchp1kOwf65CR0JRezzCXtJyRftO2cJbOos5h+FxeBwxTk/NDzIU1mKC
         YPRdIs+li5SwKRTexmw8wi2N8N2GRJEDQi/y73gcQ0pWbhRSM2JjPbimHNyi+t0NC7f0
         EOnURMrSi3gpgUDrcK0+XnAxANECxCS7K0Lat2sECwEwNBojK/gtDKW7ekjCJ+dD+8zi
         28mg==
X-Forwarded-Encrypted: i=1; AJvYcCWsLjmy30AMbQjV3EXaq0yo12g2b8vAZ+yYXmbstvS41TkmdMsj9w/oS3FyeA9yXcv6yeDpz2n5XR8gMmjj@vger.kernel.org
X-Gm-Message-State: AOJu0YziPRENbU67VPq05iy2ALjmpCZxQVI8jMpM1YxflyHev3554wNU
	RibuqQq+RqH9L6gIhp0QFs9kTvbux3faTDm5hp1+3lr4ZQKaak2E7r8u5tdfgoWHFOqQPtSK5RT
	iPxjNFOfqDmHEvIkB7YkY26/ignr7Lz3OlbHKWQZfA8irDcxJgfZszDqmV+c1RB0zEqdh
X-Gm-Gg: AY/fxX5KPbn8oxsJRVsqMZJyiyA+q5ACXiOj6+uU9IUgUhu7U2L++rCghiNoVljWTgS
	mm29EEQVBTtCnom6Kn+odaQT66QwAYig/L4Fp1mtWpEsKdn5AbFQm9fBXar0Km6lTO8P2SOkUcb
	rfqATpca0EdbdwN/y+OAfq89d1h8L9FwANl1L9hB7zQzMhY9ttryWBMh3OTHRSn/Q3tPV5W9zc8
	lge4D0abR7dmeDU/TssiYijbjQYpwZmYSJGim4ftZHcRNI/hSjWBYKBbcE2S21mKGvlocPGsYaQ
	pPw6f9Cu5jiLVCAdPq+TPcfBO+szK3ggl/mH8DOpghFG2FZUaX3EqZUMmqth/D5+9DHVIwp9pAR
	qnZBJ+m4PAvvWvWsUqnbnvUx/5KAUJFRRqpbCUA==
X-Received: by 2002:a05:622a:1146:b0:4ee:3e74:43d8 with SMTP id d75a77b69052e-4f4abd752b8mr34646461cf.38.1766138914095;
        Fri, 19 Dec 2025 02:08:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETiUyWjk72Laxdo1Vk6nOQPiwxV9KFZsPrNPyv8M50TH4aZslHUQCws2mR1FSndQbsPgKHlQ==
X-Received: by 2002:a05:622a:1146:b0:4ee:3e74:43d8 with SMTP id d75a77b69052e-4f4abd752b8mr34646161cf.38.1766138913566;
        Fri, 19 Dec 2025 02:08:33 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:44 +0100
Subject: [PATCH v10 05/12] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-5-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SMWOwwGJxSzHnqJ7yBoaojvGxwV6GTuJEaiwl2WXaqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQR/MRuqHz4YHU9TEMN8SBEr98n35SSm14FR
 aNGRXRJQEqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkEQAKCRAFnS7L/zaE
 w72MD/9EkEe/K9FSAd92hRRaw77bZNUMabNTVrznwnoM/8Pl7f4xOFCUWphhGK3X/72hrAg7vLy
 SEnzXTKn9wKCGiOvapvxRhoL0QRufeXLpKYdxPm8iglsh2Qhn8VWj4hp0j4DX0jwRxtiN9qXdqU
 VlctspkyIq/+sHc4hdqsuq7pgk6+hxMt1NKsQJASXDPyjj7WunZKoF7Ch/vXvr5qh9otUS1+6gZ
 /xk8Ihm0srAYCo3SLVjIggbdhFsQSRxznES2nzRwpmAk/W1Fmj+yX/rvNe+W7hXAayDw+wfg6bY
 5qSw3CY6OorJaWRE44nIjbT8jtc0JBbj1GQYC/yjgvW06SaVALiXPwtptUwczpyz09hEdKnMO0K
 LmXZl8+KZwQHSfPes2ovo07fBflzhO54O9Ds1LVr/5vpPk09gV0ogSqSsU91IsSceMbR+17Hu8v
 bCVPXPOAORcELLx7tz50ZkMS0Z5Z8VgjD4GSRFfo9rGam7qq2FAA7eH/wWR1VXTvvCuq2QDvf/g
 S8/OIgrVrMoNCjBqoAkmAOMKryGOkSE2xJcYB9iaYYNnzmttJNE2db91TbE2aEc/oD1Vxoh1GPD
 FzU/i8AdptZ1r1KRQraIiheo7EJTk/L6qTBTnmGSPqaNQJcsUIJ0QiH01S+ndtMAw0m4MaGaxrW
 UgLNEvLbhjn2frw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=69452422 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: imWjo6HnUVLW2_shiNGWENhWAlNTow4e
X-Proofpoint-GUID: imWjo6HnUVLW2_shiNGWENhWAlNTow4e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfXwJbNN3JhvLBG
 WggYvQd4cjJ8rF7Vm35q85ckWlAj5pH2JYYpvFhDVrg2KJeI5xEqVFyXJtVaFFC35G9eUR+cntD
 tqCAg5yxwd1QerWV8HFa+GgpGd3FAc3XsvafcVDlSqtKghsWynsqzTQc8Lil+raMpAFSgmnCh7P
 Su/DPgX4FlxGElUfmxWUTH8Nib9fbs2PAHa49xdd7Pf1uPskpqQwzfrKkyqt97iNN5HNSfTFX5K
 sqwIdJ4H5yPInOhrMwhoY+o57CBGVKQ2RSMfjObWjqFo3WgjQafV/jaQXV6L8jrvTe2AqR9sJBC
 8HjXTmHqNAjW6aVzdg1S5ZaHB8mXiXaZhP/YERWRed77AuNWMDvWzko+Pch6yC0Mzw35E/q9cVg
 IHkPNLsMDcdP6OnUZFkNOz5Jl7HriS9mOorUCqh4pkh7BGoYODrSVw71oKs7fAArqXDj86cr4UX
 WWQD7pLIIocZa+JtNDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..65205100c3df961ffaa4b7bc9e217e8d3e08ed57 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -13,7 +13,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3


