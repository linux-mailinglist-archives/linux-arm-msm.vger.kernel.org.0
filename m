Return-Path: <linux-arm-msm+bounces-96724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIdbFd5DsGlLhgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:16:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C917254711
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C689B3167254
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C84B39BFE1;
	Tue, 10 Mar 2026 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYYy3y17";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LLLi7ZP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1523A382D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157495; cv=none; b=oP8fhZPFfz8BFyEz/awj698Ex+4kOPMfJukCyqprBdCIkawnH/F/lV0ydnMM8vbAnXGL5GwJBUdMFh2I5OrSURcZiZdxqAph+9iEyVI5dCTRU4Dy4SfpctwtjE2kyCveyXwvjM2WDoelApz6iroAc2XB+g66ijhq9p+eJh5FEQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157495; c=relaxed/simple;
	bh=Nz1LGAzCKnFnAcOBVZfb8slxeQc/H+JbDOJrfn5zCw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=llASlDRBeStRvKrDHfDtlz7w7roCz/V6Cjp2aWVkH9MQvxOy52X2velynpZUv4E4kFIwTVSj/H8EuhQAPbJsGCg6L4JFrL9mI7g96mTJxmk+SrZXXK1kcqAvl7ReW9tdofYIS/1//qDmUUZnEpnIfxymmaDj+dewz3HuUgw96Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYYy3y17; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LLLi7ZP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaW9T3417129
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=; b=oYYy3y17oSxaar98
	oGDG8PFTvxUWuVDN3Qb2C61Fw16gcQGPq+hy/9TQ8SqWe1tmvv5INlkcyQbrRG74
	0QkOEaxDRLd1AzYgKTw4jKbcI59uy6Nbvnn27f6IsKZJ/5H7MeOxIDczLIPuLuWb
	otDHwnvQeo56SLdkglIR1+84GrtDjBdov6Q+ashzk55P1pbBR/d14imzxBIxIQSt
	EagiQnxMlL0IBBaSFRftI2XQY3/wbKOflqb8n05wBjha+VvOsElfVJ+fxdZHZG8a
	PfSy5WNI+F0YlEjtlsA4fecLiVrMbu7g519RaYR8LPnzjFhCZRNl1jOVkmp8glHa
	1ewelw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja290j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:44:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77bc8186so3321701185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157491; x=1773762291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=;
        b=LLLi7ZP2B1PVaJ87dP/Rk+h3H2aZ3+Flt34qeE1rodjvL1u0eLICPy+GXQXob9Acby
         rEd0CXaPiW7O/2bqNvVkPPtnttQzLFIeozYlEfgi6Je5FIC8y86OPfWh+QFp6BXwFkJ9
         TpuDrRZV4SwFNu5hniDW9bhT2fYsgMIbSSYlzmqCDTZiO4aA8vh1FddtR9pJOIXS3+ms
         8hiLl7hB7ewWKxUS4MniLJUbffHgzN5sPL6/EhyIV8fNt+d4RSrQKdOsD4Wqh9FZf+/8
         gWXoXr9oejRsCYutPDfklLi44PtVHjIn1q4c7FJMQyfjuM7E8+yIBypROs1A9FcKLjts
         t45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157491; x=1773762291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=;
        b=Nq1Fxyr3YI0GL09hNQFb1zNc+JhynveNKDDZPQFJ5HQNPGbkww6316+hPwL5P0HFfn
         ERnNwLIblvE250v605yoZ/juXtu7hzFfwXEn7/UzPAt1dysMh1u0hYZshUdmF4sl+r2E
         IJeTT7uyj+P4x9HNC8vID0PaKBlSNHkNkDyY6WuH89Uyc0zwSBNkbdJBoaHrjxK0BmiF
         qZg6xv25tS+ruADbu2jZmw7lKHi+2Nk+LkfG/vNfowIV86o0AegSewefR8tLBcCMJl+a
         9+eFtY9YywjI01Z/0TT6N5rT7hUfKncekoQQNg2DSXbD3ky4Y3klNMkZ5SCH/1DrvClc
         iSDg==
X-Forwarded-Encrypted: i=1; AJvYcCVz0amfq7TgWFaNimV63o89qtPsJJ1N2w5wys/f2QzlbF6rTyNFhf7wOJ+WYI9+iUKIW1SE8ZgyqKrP7xx8@vger.kernel.org
X-Gm-Message-State: AOJu0YzOYqEh046RuZgAATHfMRhUNLf0T4nUknmnSjwWCcHgyGhQZ6pp
	D4ZkqI392+EN23QRnGXGwkXdQVFFPZ4DmJsHQm1RH5P+UMk3j2bCyfRs1s2RReJQyMN5sCFw0yN
	cyPPGtcvJquFWQeAS2OWav8Wk0ITUpttQUL6l97FJW+w01Fr8nt+J87zSroC59s9rm8Cl
X-Gm-Gg: ATEYQzzx1XZbn4rNAMf0ewrZV6P+jk4f2jh7XxQq47Khszcetxzu3RdnJBdsbvE1opz
	X1da7ojEHRatf+PvIHan+zdMtism8DGRGgKJM//W6p7gdlRM+oH5MNf39fGzSiGzWT3fZ3qMyw0
	wPUmZHak6X24uylIFIFcUQQyQtZb/WNW8xccy+hNe33tZ2NFAqjzJEDyQcpaI8uSfdqtYXv9SkQ
	cxtg2Xt2NTtyxRTHGG7bkPlMnlaR0WCsvGUw9zgr2F+b31oB6aZJRhECt/1eH5kF7Z04aLJg9Bb
	zCagz9rTd0uAWqnvOV7uPMNk5o36Z249zbJB1CfZ0dp8yj2rZg7jp3yoJYCxYZAn43yHcQ9/beM
	ub3AxVE3kKfKF35gCYX5EdWdhMxAnok6XeF5VoaQ5ZPH7Y8u6d3SA
X-Received: by 2002:a05:620a:c0b:b0:8cd:8142:b7e6 with SMTP id af79cd13be357-8cd8142c5d9mr953921885a.26.1773157491454;
        Tue, 10 Mar 2026 08:44:51 -0700 (PDT)
X-Received: by 2002:a05:620a:c0b:b0:8cd:8142:b7e6 with SMTP id af79cd13be357-8cd8142c5d9mr953919085a.26.1773157490964;
        Tue, 10 Mar 2026 08:44:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:17 +0100
Subject: [PATCH v12 03/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-3-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3724;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/m906drTofLPxOtAkNVHVDE5jDZx6cmoeu2XGgbJbDs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxh7N1Y6/LUAB6rgMLQBy2fmGegjB73+f+XS
 H6XeSRAqhyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8YQAKCRAFnS7L/zaE
 w39cD/9RqGzG4curV6R3EtnkB/vfAOAeR08inkMvL+GQu7VsjMxlqeMX9YSZ34C9Upm9RsD1AUe
 k2aEYMRTciSiVvt69uB+Cl+UQGdTuilEJYYGC1R8BF82fUZ3zC0Gl9RPqP7fb3W+yEWX/T79V8g
 7PNuTgJArE3aeX0BJAwP+n+ieUFaWxrFHQsS0K5W60blO7wLoi6dxR30oXs/HauH/hk5lYTcK9/
 07NgugUXc/+NCtEBTQqj9/GJlfha/ChE841UGpEderEXy8kImPzUpY0+OgEKcfYajJ/Fb7yJRqJ
 vbAqohB4e+3bzw+Zd4ASagZ32iHInCV3qQBWUWfgKn+Djxhzcnhb4wlw57uJFz4cK9UhynQ80xE
 vGlPXjqKn1aJ0+4imN6USi5O6IEmxW4yaB/aR/+o5TQAUQ4InecZ1MQXlJyGfnutxxxsTV9jKVj
 XhCeOmkVwk7bMojrim+tiBCtgF5rn86bJ6R+6dAjt7KVaaRzqQkwRTEtsFNSgZlbc0cs4M5iHka
 89rk4jkCkz7xtCLDVOYsD9bE317ofSsMSej0LBvRxWygChlJZVGtpMpg/JGMpt1PLKq5oaricR7
 yiu1UcJGSmBZNOYwGTZ2ZMfBsJzyoUQmqfIziE4m2LDTMeqVbpqRiSFXFrdJ3Q+J57Z92Ld+JpZ
 oJUgYOZmN1GG1GQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b03c74 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: LJELAHoEqiPTi-IjTmMKi29el5XuwJWX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX6Cz/GWI+uNDv
 M+OVSldqbkeuRr80bEl2YNyF4bToBysHYsLHCC3vXqdgCufober2UIm6CBh4hmXVIZDu/3t9MAn
 2XcArPwGgEuxAvUQOkld9Vwx5aqKC3fMNdrn5xf7U4mm5f7u5beT3xhRiuTi5LE5boYjag+Rxk7
 fyGWMRmSKPHfYJgoSZdinvXLc2TrAjE1APqkRPP+TJYUk6+KvmqoDTL+zQYIp7BuCVo4M7pocFf
 8lyg59PsvlVS1I5hIWxHSFPUA/f9QweWQ/uv/URK5wCzW84IBA1pmat47QaFMAqJUCEj+8InEGa
 udx0oRG2YWI//7iIPqUnYiYLnZZyKUj0uwmhAmiCuY5S6BXdd5FXB+gRWrx0Zsak+L6YlXKqbym
 Ap1DJ3aMYtZkN+vOSKhWtOI96B/BbAqDD2QvPavRvs7XKNs+f+HwX1nmjH/HzlSgKvzl2T4N5S4
 PGQ9yM0pbq5uqjLF2QA==
X-Proofpoint-GUID: LJELAHoEqiPTi-IjTmMKi29el5XuwJWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-Rspamd-Queue-Id: 0C917254711
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96724-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index c8601bac555edf1bb4384fd39cb3449ec6e86334..8f6d03f6c673b57ed13aeca6c8331c71596d077b 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -113,6 +113,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -142,6 +146,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -171,6 +179,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -200,6 +212,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -393,7 +409,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -411,7 +427,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1205,9 +1221,9 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
 	{}
 };
 
@@ -1231,7 +1247,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3


