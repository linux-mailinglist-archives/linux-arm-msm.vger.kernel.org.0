Return-Path: <linux-arm-msm+bounces-56019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20386AA0268
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 08:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C8E2465E32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 06:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C302749E1;
	Tue, 29 Apr 2025 06:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVy0cjHP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DBC274654
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906822; cv=none; b=pj+Va2176r2AqI1ce8IP3sKwk75wqGhQq853en2/dcmTLHaXlSpuRVoyWBa4MpggMT76wk6YTPQlAfiMoDHhwbVJm7JJ1i69LOtZBjQCmvcUTXc3KjhVvjkw58Az4G+XXNhuoHtttOVaaFtbGXXLYr3ht7a7MF9/83/vl+y0g6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906822; c=relaxed/simple;
	bh=jFBkkTZSAMc8YsW5eR17yaZHeNm/0DGHN2MFjL1ufWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1GEv9jtTlw8oq1wM0I4uH0o3LjhEJXZsyaSuIdc+glSQLpOyy/GAUMncHCEgsRZFNfNmAiEWE4W+mDdcJO1k4a55GqsXx3GZ9T9evqWIWb0GwDU+cqtNfr6nMMlM5FBOA20yWM7m+PkeaEkyXV62G5Uk0noTYa3Kj3Vmx/Kqg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVy0cjHP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq4fE024687
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tluKXCMaC5kMOu8ljoIfLsf72OuKjTNKaAhw+onm69U=; b=CVy0cjHPv3Zr2qaf
	Y+ZYOFhfBxNo77Y4SZCjSzR70EWrwd5eMxTNdDvBq72VomkAOI9/s8nTVCqYl+vr
	GKO7tHkNDe08BEqDIFHqg+Jk2INqyc5v1jkuO6ozFw4NrdCC7hv0uuKFINMD6Sk+
	BV9//jH7cenb49NC7bQ21xqtanpg3zLjq705iiHC9GKOMA4XehXsy0pUW9cLreEu
	LNBiJe9dy0iS0gttCSqRcONQ363t6ZrHJYYB8vpo1XTbX/u/VJg+A/KSttpARnnX
	HiNEe8LAWySAkg+ygDmBRA3uldMTSyvvlP17vJ9RbmV3pwc4Rlf/gbB1lbS1EpaW
	J5RZCA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqkm21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:06:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-740270e168aso613782b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 23:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906817; x=1746511617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tluKXCMaC5kMOu8ljoIfLsf72OuKjTNKaAhw+onm69U=;
        b=lnMCI5KlyrFnBYJIWzxo+eWg4K1yFkOFpiCbTLU0hU2+BI7lUsoy2tj+AZCuoICrye
         LdHOP+vHXJfaudXhDKExk31lAn1Qi3kiTgMwxELOoh0htc84pYOEkCU3/Dq9o0e35k4C
         4oEOT4D6Nv+FylT/0rzr3t2eD2hEewNRZ8P68FuPE+jvaBQdvBJjE5ua4CxDXmlQpCN4
         huXZjCI262DGJpadM9KLCvNKiTbjXmpDLvj/lf/edSM/EMrWhEVs5fiU6QS8VrG4TUmb
         qhfd1aJxPICQHhbKGdxI2cRoLMD6Cv2+85rHolmruot/sM/rJjFUVXpbgbn83c41wRJk
         621w==
X-Gm-Message-State: AOJu0YyrP5tbwhM0PT4AU+eys7x5j50j8TjqvAEgjzcimFo2TBHapH6b
	zFBoK7PWzJohbN9LOKEar/vtzKAOp8nwoUxEQBnX+hOO4TKL/68jFKHBTQkT+H7DxK3xKyKR3PS
	v1AMSIi3tizXwH1oEKF5AN+sCFqY0H3l07GnG30WHpT4gpJdONb/kXnlARnu3+GM=
X-Gm-Gg: ASbGncuFVgwWzHuF8xgGgr5TZubEEFTriVR+zixOa8KkEh3wb5GiW66joOUdVhjY4Sh
	R4YCpU3gqkqi0uoyuUvHpsvO+UwC8dJrFIqv+dEj3GpjJTIhVApPOGdOhzVpX08UuyflDiq+ebO
	ApEFyEWvQx8n72pWtjouZ/MbpaJmN12EnjWJ5XSaWuedVNEqF6SAi2mZhePkYm1VBXJuL0jYlq2
	toHyl5nw60JKZ0VvNM3tenqtmF5ovcoNW3WqrC4IM7M7Fv9bt3A/iXAGl5xrtLAOE4ZECwetsNo
	80IUEZuPlguC0drSA9v/LpVEfa7VMfawXBoBWcAkKpBfu4bf9o9dGYQNe+Ws9NzGMtLgiQ8=
X-Received: by 2002:a05:6a00:2883:b0:736:8c0f:774f with SMTP id d2e1a72fcca58-74029565221mr2187778b3a.22.1745906816674;
        Mon, 28 Apr 2025 23:06:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg07otcOVfNPJ8y+U5whY82XEhwy5M5k9eRX8C8wg/VMa0dKjj+wgL5TymAJ0tRCcizjOWNQ==
X-Received: by 2002:a05:6a00:2883:b0:736:8c0f:774f with SMTP id d2e1a72fcca58-74029565221mr2187751b3a.22.1745906816303;
        Mon, 28 Apr 2025 23:06:56 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:06:55 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:22 -0700
Subject: [PATCH v4 01/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-1-6a143640a6cb@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfXyJrrhNAvu4rt jtUwIgLhMu11PxLWr4VKSvnyZnIV3MV2D1v/UNwj5WGSz2eKNHrCSN2HTF2Q4zSlQ3E6e76Kw/V gitN4eiFuKxX1ltcaasjs6/vYJZW4KyakGd5XBJjpRqG26kKflCzCLOyrEeVWsKldrSg7S57bt1
 vLADtHUACoF4fxOsj8FsTPpwG2vqy7OQaCJ4Ay0NxRyNhrUMz/dToq3wwyN3Hw7QscEP+ISRLYE FFl0/tygraFckIk9gIQiDXe/xaF8YRVCrl/o+Oq2i7k+7Z8Dg/TnPRB9jpStdC8uDW36JVshpx6 mRO4zGBOPYgsisOKD1KsI0oi2qe6dmJvZTO3g1HHEkNVam4KAka6sEQuq7UuR7CuoPU2kGIK7Gu
 OkwDLqiyw/jlGvcYdDWrSAiUmcvDEQMf0OWfBSHYmYOH5d8ECJNDdifbbPx6i+9SdiVLOk0a
X-Proofpoint-GUID: zhWQ5wczp0F_ND5MkvbybZ3KdsKjR7jJ
X-Proofpoint-ORIG-GUID: zhWQ5wczp0F_ND5MkvbybZ3KdsKjR7jJ
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=68106c82 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..24edce4cdbaa 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -888,7 +888,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1


