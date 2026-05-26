Return-Path: <linux-arm-msm+bounces-109823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL83MR2dFWr9WgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:16:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A567E5D6374
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4134F302762A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119943FD131;
	Tue, 26 May 2026 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDOAI/V1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gk3cyrUJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB8E3FBEBB
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801097; cv=none; b=bcCUImLmEkqyJ++AFJMId1gDWSDbOwrGToKo1sp45smZizldqLis+iT0I2lVwqJwAdSPolLQFeE2IHmalXscdNDoiPdOEmEVVUMKbR4sTvsvpr3Dulc2Nc2myWOBli6WDLTxflPx+fW3rOUh0lY34t6hG9VEyAoVqIhcAvxYKcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801097; c=relaxed/simple;
	bh=bxwOj+1r4hE0BIdCr6O2vUvIE65d0GfBKW7+Xew4ns0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvfUlfGPtCGdTMm1yGvmjOmVOS+2wVHYYmG5AA8hlqNusjxKj2bPytsOx9XZ1YsC+S/yrukasjuk8IQS/gpn7gLkbOa+etqUb3bn5gyPtyIm6W8Y7+RZ3q40pHcULSDZc2owBcmOOBIuz663mTnwSYEUQe3D/aYAbzKwUjcn5nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDOAI/V1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gk3cyrUJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsXxT1430495
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=; b=PDOAI/V1AKIUSIf2
	8LvaPFxs17fPgR2zWuSNdcb52ZTD7gi2jw3ii9z1SM41iXVk8OQRCO2FQ8q+SCR5
	/JtflcFoClrGzQmpfoYS0ldnVSFWfiuBacXjOhhagtO3maaNOe1M7d4zUOs8ZS91
	kavXyaLsQB9MFi43fZT5WgWWEtTwgvwSlQoQQ4XI+ACQXYpWsi/f1B9vEVPrVQ2A
	a34h7/8I5jh5U+cF03+RU5qJoMWZ83H76KJNLuPc4Xk+bFRanecdzOazy+2CYEIM
	uvhPz/zOxWKEOIgbwkrD9f56P6L4eCuTSvqn5h3N4stymJ1FC05EUDPwCYYkObuA
	6CRf1w==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv52nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:35 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e64c83e5c1so1156524a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801095; x=1780405895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=Gk3cyrUJO0YjRjrjoHWvyDOzMXHfoFlmHDVTiPLpf0CkSIbx/aYYSq5pwYIvaLjp66
         u38dwR2697GWy+9GtzuvCah94e1Vr5gy1jryK/MjkjkOnomWB/zzMFwVVLwl6FW9TjPG
         Kp7iFYIm4UWriWQRf5SkMtea0L7lTMqRWfiIZTw30HxGguDRk1+dYW+dLd7NqTYNJ9+X
         INbk8PiPvGAWluKj+8BMOy6lap0/95dZbfOm3I2NwBo09wGdKpjHSNOfoSYCOVQy5Ykj
         pBsd4caG0izV+/f8jcg3Tr49WCtQ6nL4QjZrr7w1D9sP2ZjbVtdyo8W0ad+fVIqPQ38P
         y/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801095; x=1780405895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=XJES4rhZE7byzjH3R0ial5K4wK87DFmmy0RSWS3MMo4jjP9n1BGMLqS57v6sul9d+D
         o5CcDwl9RiPRsmyxCpiml/iVRZMycn3O5DN2ckVLln1MosawxTB+EFlaHEdEYH9VET/o
         jc7OMJpJ7YDgMBXfpiJwWgT3NUzBkJN64y565VxKlSgeBf/Qua9Bn0FBY4Kb+Q6isNf9
         4NGayYBZA1y4uopXC/Opog+Qw8cl0ECQVL73ESKGcXURc0nUc58UyRJK2OiPufEecORZ
         ggB4DbWMpzb1R368i52OSKxclRoBO/9psXoub79aU1K5DhZiTLYFWwZNw+xnCd5o1PC/
         CMiA==
X-Forwarded-Encrypted: i=1; AFNElJ8jF8sR9o0KBPybMjOP6tWwCSIxvQzx6jOJpj9tPGBn0Xd145Ih0L3PBAyqszUJWIM3FMrBA7IbC43uljb1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6lEraOh9sDkJeyBMU6Ebb8NI/5r1Hi2vjWMwGKApQksGgNsEM
	7QGIOSm9Fsn6/fQeXAeNXWWtA/HMOsqGFVPZNBOsA1VEp5rzmQOhsuRCL2Zao7CMuEbIT3rSll+
	jlGWxjOM1GMkQJuvhe3tHR4GZZswZJev2I+Gi5XGkWdR2VwnpB6r+DTOZqA2YuXBIJK4y
X-Gm-Gg: Acq92OFj9MDkY5KUqvVRV5sGnL5HvBGZaoJNh6eFeXiwkt4yVeyMjyiExekR9lgbeGL
	MO6hS0MZ6JwQuJNALq42nPK/1nMdVWk7Cp4EsZnnZRVLQtQxlxWh/EvXmgUG3EFAOo6L5/xg9M7
	azH0+0xPQ4K+59IbwveHEiYejC5gjWmgwKEFcygRh4wLf1BMa6fBdT+Fq7fskWMFkLcd5tNujt2
	1roEvX1Y4d4UpKCSxRv87LOekY0Wn9v9JSjtPFkw454x56gEtHRKN2vuuHianqBsUrb0RIDFxG+
	UGKMCFz9xpBy+A8WrOKp/soNS7hyfGY3bAB26OAzwUnW7NGh3Bdbrq0b13k37vlDaee7K6C1EZn
	ZzxRt7UAVvV+NtZ0qzpZS9QZKsxjcVmiqydaRuRt4x6HTK06JfrI=
X-Received: by 2002:a05:6820:4c0b:b0:696:1262:2ac5 with SMTP id 006d021491bc7-69d7eb32a22mr9146008eaf.2.1779801095093;
        Tue, 26 May 2026 06:11:35 -0700 (PDT)
X-Received: by 2002:a05:6820:4c0b:b0:696:1262:2ac5 with SMTP id 006d021491bc7-69d7eb32a22mr9145993eaf.2.1779801094678;
        Tue, 26 May 2026 06:11:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:56 +0200
Subject: [PATCH v19 08/14] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-8-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qxst61jdIT+8Ht+en2AytpIG+5WhKs6TgGXh9cEYbqk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvwlwWuPPOocJK5HTgo9RXGebXz1TH1fLJDZ
 zRrnPDCeUeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb8AAKCRAFnS7L/zaE
 w4J4D/9TZ8zl+AagDemgV18CxEwlfF5SmO5X5h9N+TTNFeKXSps3Y65GYLhqqOcDTwQ9yafpTQo
 KslC9G7SJjpvzgeNNc2wTbbg6CSoLLgcU/+BZ9aBBUqclXF5KYZkku7BhnlA08xrcEP997eICkl
 fs/sGTC+6k/jVAe7ECWAF2F5HFM7yLvmqrRG99CEqe/ALf2yPaUvxFUUm9YAb56si7pAwpRnVNi
 Jh0g+2REUzCY5DaxJ+ZIBbX3PdDnnrnB6guGPnXEGiDZo1Y0vU3zjZkE6rSBez6L9wksn0tT7lr
 M8uM3wUPXFpgXqJM6sycWYIora5fV37jTMvt3Wcehn3ZR5CBwXxv9gj/KHnD1WR7oiciKughspM
 u9OzucZa544EBjJDx4vfMpaEvl8CTJhnAX+r6i4mLpJMyuU6fMrlK0vxuCovpLxezrvCMywAM/f
 pftFIIt6/7wETddPCn9EJoqeXw+AH+T3K2U9QSZyioq2WWQHRET99cOe8gGv4tjcQx4pPMFS/aQ
 1KtXTttCSCGY9C69bDcp0AV1JBJKBZoAqNhobsXE1vEccka1CoK4tvm/AZDfpCsIc+RWRk1s1MU
 AWpLZ6pbXtgTIN7LxL7wtShVZLIN/uMKbkwIR4+hsQJV+nDyNxSxmtzGmyDq+wtPiUWEM8U3+xf
 F5T6OyqVNo46OTA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMyBTYWx0ZWRfX7GoZ8b0koY50
 lmdve5KdTA6jlOWiFTzCkrj0RAVkdLJwOoNyp7A30sYvs2OG0nTVr8x8qtTdnjY5u8kDzF9hp30
 OECFMTIoZ0N3kzLXO29/6XurMM57WeZjcQdVlYAFablBP3KR+MZPKQalr9nA0TfG4IPD+AgfKNe
 0bvZ8C96zKBkI44y5x1c+OkxSdcGNyAk/b6CdDa14gtzeWcVQwOygA0nwl5oDwAizzQZmDJwkiy
 7Yg/kpuJYTtOj0ahzFx9WbVChjTFkS295H/0EZNTslKcozS4OmvQuNHvDEiDM6Z4y53btXMq91N
 VmLFyh4jX45yQ+/mNm+e63jEDxoa2kEX8HXTp2yFZebNxX3QEyLYbYMPSKroXlXycuCasCrRsFw
 v3o2+H5i4j2lG7oxDyBVWriqiS0056lSD18sEki+ZabJZL8do3OIQ3sotYF/y1ilsXEIYusMLpU
 prG4yKkmUWmGbapFRmQ==
X-Proofpoint-GUID: QAJSSQTzYbbmY-2yb-5q1sjbmriSa0yh
X-Proofpoint-ORIG-GUID: QAJSSQTzYbbmY-2yb-5q1sjbmriSa0yh
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a159c07 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260113
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109823-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A567E5D6374
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index f671946cf7351cd5f0c319909bafd87e3af701c7..ad37c2b8ae53a373bb248aff06c3b7946e8439a8 100644
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


