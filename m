Return-Path: <linux-arm-msm+bounces-96837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECHVMObgsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:26:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C600B25B8C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79454302CE1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F5536F414;
	Wed, 11 Mar 2026 03:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="apZPe43U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuEbkW8b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A15346777
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199434; cv=none; b=L90p6ej6gcbaz93KPaeIRH+j+cyisKPCNEXBGPhYd0uU4xRwyNV75+l5/2P3t+35ZgK6jApWswBrj9PexeL19p9EBAJ9GWd0I6L4cTdrpCEcUIbzsHadkuGJSgLbvleuRZcgxRdutA3V1sOV2F/TsFLUFRD+NIzQoYPX1TaRGxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199434; c=relaxed/simple;
	bh=Dp+N+Bk8UMYAX+OsWFRzXnJ6xbH9DAMBa3dOlN5rF0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WGZFZjhPpmPpYH2FLcfTS/3rRiQy/EXjooZ0vzwPmNCBmlXjef5uMveD+WlBcnuAGX/ZXpHRdG9HX0bxakFKaT1V/1f3a3QLROraBm/ofKM5CVwPX87+SThcYoYai9+mhmRSfjJ89nKVOurzGKFYza3eqSh0OCWdvCz66usTsWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=apZPe43U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuEbkW8b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIe6tT3295301
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqyKT4W/cNuaTzUqSFqRUV1yQx0wbYgJqqv8//555T4=; b=apZPe43U8Pl8U+mL
	ydHIqqJCFMN8yvkO/KJ6xKxDyqHqu2tSIqLZWzg4u337h/0mZIu9Ln0/7X0csQJy
	6c7cCPUVd5lGX8pNCGwe0SccSjGFIHMUa2eGeXkv7SQLRlgKo8PgyGMgi+Zluvz3
	rO/1Xj8umhM5QPFkc1AjwtosG2I2NxPu/sIlP4pm6T3YUdwXwt0xLgTlfYyzVytF
	Qa0C2CiTFb4VWSTv+8dttX/aLmfNqvyJANkTQPTugLP4yEAr7Jotkn4rRBvXZyAC
	8INrGUgs2W7KHh7+2Tv3TToZWjUPBuoTYMsMf3P7GegmpFmRc1mV2OCMA7/ZLY3+
	5lJ+qA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1musdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:49 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94de7380eeeso10323671241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199429; x=1773804229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqyKT4W/cNuaTzUqSFqRUV1yQx0wbYgJqqv8//555T4=;
        b=JuEbkW8bQsjI/ZCG3D8dSGcI6ff+aviN8s1Eu4LbXTKiqxH1WIH6lkb5odUHY0sUzz
         4EhfeWEFxl4eqHOJPRV4bhZfcvYbDOf1JxdYpjwKven6oPe7Gn+l+S+enmj33EbSHIn3
         6STIaAkQ4DK+729w1zhS9SzbNp/pD4v9NkQH2zIXMXDEigQTwOEhawY+mm50/3xEptNa
         6KlYyuveez7wI4x1lQPXnPGDsDuFttRuI24aeB+NUwHt0IrubszgYFEpsCuhNVqbp/p8
         vmFmi7+0MQAA7n7ptnd75wKjZLeQ5GOsrGcuIjAkc9OE+BoMRuaHN0kD6AXBM/yjqs/y
         qObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199429; x=1773804229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jqyKT4W/cNuaTzUqSFqRUV1yQx0wbYgJqqv8//555T4=;
        b=NdGA366Ze8oiig9dVBNzz+jnJtQcmyQnaaI3fvzvci+Nq98A18t5DWf5MOl9KbacyG
         g9UYcAJNiq9TEDgEC3hILjA4Bx+FfnqhSm/M8F/lvE0g2LCT6aki0+6UEPNmCFKV78Zv
         kP+iQ4QmOhFEBGJCCBxSSWPd/g3NfN4YtwYzfH9dGEA3us/tFz1Z7x9sBFYJLAfKMhAF
         0dRJwSlQJ6F/QpmcosRcOy9gZGjz2hTgPKwqEzYu0m7KlfO3rPtkqbz0hiDTcDsU6tZG
         BzMFPCk1YNFiW1rNCko6UdzHvDrdcB6g5BHgSQ8NchXEwbxwsVWAIKQ819sDqqEuer+L
         mCJg==
X-Gm-Message-State: AOJu0YztYbg2PqR7LQzIMmlp0gCaoYdeFqGEf29kcBQl9s7vePaGjKGW
	ouZ+ZaDSn039fUtPD8mgkA0C7puqymyWQtY8JrQfsgzwMBxr0z4vs825wyyi6r3Oexjs8g+eMXq
	MMxH4FIRoXT57zSNhatZbvS0qBzKe2uw0ImjfCGxP/km8E6J4MSdSvMeU0EXVUtsSO1Ps
X-Gm-Gg: ATEYQzz+MxrTWJC11b2q/XfMh57PvSe2rn7ntSdhvFzzNZJOqdq9FwaQFpIXUkPfvk7
	VISR4Crq9tqtnVu896XWRchj5D6IvhIaetmjSAHWUNS6wwqps/+kaKRDZtSNllxIy8oyC0XhTSN
	Bod3MjEIl87qogVrE6gzmTO+6x9VTFbH3c0bGzLHMQSsiCtu4ZroPUAIAjtmcZ83oJ50nNFrmhN
	r4wiJ9v7Ao7sVVQTIOdRY4QuvYEANHpeVJSg2TWPF6eaOaAN4kIKJKvu3ZGk9TH9D6umLdXMlRm
	vdthaKxEaeJrgaqX3HbWOR2cy6GfF6YoTC4KGNay44NJgxRAhnaexStCVPVHxT2vh5Ww+m3NJTt
	/gbpsI5X2SekVf2BoQCaZ+xEVY4ANgl5EDoDnQijuN28CDxtue7o05u+m6QhRK8FcJ2V8xicL/K
	gyeKTOriccv2iSsd08+TyecvGQyKK64/pM2Xo=
X-Received: by 2002:a05:6102:510e:b0:5ff:dcb9:9222 with SMTP id ada2fe7eead31-601deb2b6a8mr492832137.7.1773199428952;
        Tue, 10 Mar 2026 20:23:48 -0700 (PDT)
X-Received: by 2002:a05:6102:510e:b0:5ff:dcb9:9222 with SMTP id ada2fe7eead31-601deb2b6a8mr492816137.7.1773199428587;
        Tue, 10 Mar 2026 20:23:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:06 +0200
Subject: [PATCH v2 12/25] drm/msm/adreno: use new helper to set
 ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-12-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2707;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Dp+N+Bk8UMYAX+OsWFRzXnJ6xbH9DAMBa3dOlN5rF0s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAeub//VZeYzLSiRPsy3mVca9T9Lf20GUVzD
 fwQSSSdEbmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHgAKCRCLPIo+Aiko
 1dkPCACrAf1IYYTZl95PYbR0Onc4NkkXHJfcQjbyO47fcf5qTMXdzfZwaRwV5yHQ1sprgXpISkm
 lWmS7W32c3ibD5JaHltliQFkt0eukwfZSBku0+DRfkGRjLiv/L3D2Qllo4FvYzVoe5Wr4c0TqPY
 61Bu+tSP/Pgzbvpivu4Cojejo2nRqgiv7h28/yzvoo8Z0zKNOhSf9d+tn8OsgVpjNjEi2dSzZ0F
 S3TT436BdQFY4fBVhUJyqCVfMYL3gJcvkPIuoNqViNikfVggmMau9g4DC+nsDw3DTAL5P3EoJxH
 LnidAB5JalxfOl6WwpZmBJUC/O95iPLOQKkoCvrUBUTtm0Bg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b0e045 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=0JjmiBfSQHijSEXDZO0A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: -cUYzxCQtR-eb8RS6hzcpJkdVQXyQPV4
X-Proofpoint-GUID: -cUYzxCQtR-eb8RS6hzcpJkdVQXyQPV4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX9OCRQ65/I93P
 loMmkYIJAvpCpbxTiQQ8N7meiSmlgTFNLPwg/2zwKu93mScYrxhFZ/Nlq8ZBqkRw0cMTWPSvEpk
 IcYjY9tOMjyzxBZsizB7ItoAApsFLxtYpA19O0s2rQyL4mhXkWIyAeXkRgaG3YTH5oTICOfqQ6H
 p3pkiGh25/LIgTCP1v4pH1dZ7oxPzU9PRZm5FTD1jvZnbCtGY64BDfADDareYJblBk6Ija653Ll
 WCbWo+c2wBYB/9i4JqDcfNG0VB8l7KbSEhLvlQv/79U1jhNRg8FpAiEeT1Hp8AqObp0k47VRgBb
 7rwW2Xr03eVXc3FIQF4PXiJfFEluzkA52FTSxTPRZqf7HFNhBnCISWsAXyT8tqDJszJnLaGTwep
 MMdwi6JN0WScY6DdiSULbi2jK662A1FRSBLrbm/lVa1bMm3rGIBRWVQHMo9vJ6KZo7xPdujuwvt
 zHa1vgG4lQxUhoExRuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110026
X-Rspamd-Queue-Id: C600B25B8C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96837-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 56a820ffa613..7be31de3b525 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -741,7 +741,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	BUG_ON(cfg->highest_bank_bit < 13);
 	u32 hbb = cfg->highest_bank_bit - 13;
 	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
-	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
+	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	bool min_acc_len_64b;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 6dc1d81fcaeb..680f0b1803a1 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -265,8 +265,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->ubwc_config;
-	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
-	u32 level3_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
+	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
+	u32 level3_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL3);
 	bool rgba8888_lossless = false, fp16compoptdis = false;
 	bool yuvnotcomptofc = false, min_acc_len_64b = false;
 	bool rgb565_predicator = false, amsbc = false;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 4814233d8dba..cc21b41cae26 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -432,7 +432,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->has_ray_tracing;
 		return 0;
 	case MSM_PARAM_UBWC_SWIZZLE:
-		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
+		*value = qcom_ubwc_swizzle(adreno_gpu->ubwc_config);
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
 		*value = qcom_ubwc_macrotile_mode(adreno_gpu->ubwc_config);

-- 
2.47.3


