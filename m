Return-Path: <linux-arm-msm+bounces-116556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id goa5MHCMSmp1EgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 18:55:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3636F70AA21
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 18:55:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SVBzlSZP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Yg8Ieiv9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116556-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116556-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0DE9300A38C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 16:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD7E3009CB;
	Sun,  5 Jul 2026 16:54:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A35523FC41
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 16:54:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783270470; cv=none; b=i/fhBAklBlf9nPbtdGPZRmiM6FkC/fwfFaX/hwsuN6XmqiA/qvIf9CL7eQYhbF9ZOPTc6oEHk2cAlexPkpkX2o0Eq1r6E/VCoDZviytZXsBhHc5iOl9ssTH/U4hx5QK26N/BorF9LnBOeETeA2NzWhh/yB0apu8n5vYQ3sq4dDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783270470; c=relaxed/simple;
	bh=+7wdWExKan4dBAAPMYMsUwIGbTDsI54vr+pKiGN8FWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hRtioniy6UwenwzMh8eOkuwXRkZz0Ey/GjSDKj7hYOPlgvnQgfY7YDOsugQi98IpOzVq0aNozM3gFXy9i2kOxHxoMuA29N+7L0aGYsUdqfZ3yioAqv1vfZjYZHQ3RUpgzXOMXUb10WXQlnCks9hUn1My3aGKEnfDBJlKvEGeD48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVBzlSZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yg8Ieiv9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6659tTPa1248965
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 16:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bcGL98DuA12zHO/juB09q70kHJyhbbXB7bS1RIzVhwo=; b=SVBzlSZPcHJtmA2h
	AXMDPJYu8HggWxUlwWr2KkcOV6S7y3kvSfoEgHhfxY/X3z0KJnYAIlIM2eAh62Fn
	Xv9Yrli4ZSmuxnN5D5cbWxjh7IVieA9BL5IqxIdoRyQ3pKq7RYm/iJchmWyb9Mgd
	LdfmJpY8GQ7TLUk/k/eVKaPwA5frKL8ZxVYpCBLvRgP0UdK9EA9p+bNkTRE0C2C3
	iHM5XYRo738p0w2cj5O5AWXdbBxSYtIR3q4QHy/6V6hco1HoXNvp6XvjHQekEEov
	iPFXuPfTtC2xibb6MyCPqLRfKWoSvCstLjeKX0ULg6T0IAtLNpju/dPofHJfTRL9
	kRET6w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txejy5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 16:54:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8894570b58so1528606a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 09:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783270468; x=1783875268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcGL98DuA12zHO/juB09q70kHJyhbbXB7bS1RIzVhwo=;
        b=Yg8Ieiv9F+AsVbMmQ55TrVVl6mGznurehB+zhVcRmIHaXonFQbsRcO0EOtDtsLamMa
         oybizXMquRszv5rg9PvQeC66FBAB4Ogsak+xuFfkRdo+Ng14HOGZt3FsOUtZIQU0EkRr
         WjUArD8D/GLxwwC8Cjw4x2NysjIqm6hzSmAfHy+/a02YNyRcMnG2DEXfQVjh4/4x0B0e
         bBuQbTRyaj79vuaFWATsuy9RLF3RleZlpQ9fP3RZZlrPRNsJADh9mNUBHu32SEbcHWAL
         R/04gpiSbjdrmgfHrvHId09DCSk91b/0Pg7cKEKFMK3oBHh3DGfwxIqNWst6NaE2sGpE
         tcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783270468; x=1783875268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcGL98DuA12zHO/juB09q70kHJyhbbXB7bS1RIzVhwo=;
        b=Z33DQ1+DYgGFCZjaVKV4LHMtHaYpmZa/LcI6iSY9dgP6xRjkml9swq6I49TBh3yFNn
         3WCziEJHE7eXE5SQNhWtgPxVexLXtgo2jN21gDWBR7gOQBCzgVW/HUACsr+Lv/wNVSm2
         /ulN/M4O9DMn7himY2e3eQ9zObMWCu8b3jwzI9EtcNSGJi2VVCuePabs9GZgzywD6RrQ
         rpTzLSPqYvoldthOLeZfT9w6O4yBHcb/zYCFOpyZAwEUJmCkj1vOsJD2c7EwGB8Cd3Jh
         BxXLrKXAWg103smk2ie4UhhqNDkrl5M6zKenNrQb3SytjomPWeLPyH0b2Wj5qWAXRVTq
         pd2A==
X-Gm-Message-State: AOJu0YyzTYJr8fvopzEdsmy6FaM1hl205V4e7+LigfM8E8vSDf2POncO
	9iKMrmuhgHsRZBnYLx0XkjSK0Xa+Bkq6VxxozxXVMjmZEG3XO0HViRS21ZvZreFsv8TyXxEocBl
	/4N7cFPiDCGxaRIeH0CAmFw4cywbtaTC0laTjuAk49qBQpfJ7aVttVJVOAomIEbofqWxT
X-Gm-Gg: AfdE7cnOM2q7Viizb4K4JoOAT22aEX37/LIfPMn6hjGL5GFNkXyLyosXPgBiRaGeBbj
	vehFon7y2jAHU5bcGJzGQ1CsFO1nIpd4DnS9OgE35H9yUU7CB+xFZdyjmvAQV0x41kPlfsMyK3G
	Xp9g0+rNXtOcDbonAPDSj0DALltA4MW6kEeCCodciA5BumJNxAdGA9hOpMUwEjC7WVQ97g35IWC
	c16Ar9Hkrk8aMKkHhVnWovIbJo75LbFlYKVjp4I6/aQW4jQy4S+ckIJ+aRYqB+li5Riy9UbIFK9
	3dEW2HMuz6txgebBEvo8qc+s6v3vlqTtfF6ucJOTwIh/AlXQ/WXqZeCQKghKbEFZNTij4wgsNf7
	BW0eCtMiyFbdEtbPf7peA1a+gZRV8lA==
X-Received: by 2002:a05:6a21:4ccc:b0:3b5:52b4:87a7 with SMTP id adf61e73a8af0-3c03e1ff338mr7092255637.6.1783270467839;
        Sun, 05 Jul 2026 09:54:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:4ccc:b0:3b5:52b4:87a7 with SMTP id adf61e73a8af0-3c03e1ff338mr7092182637.6.1783270465702;
        Sun, 05 Jul 2026 09:54:25 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3a9341e0sm38253593eec.12.2026.07.05.09.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 09:54:25 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 22:23:34 +0530
Subject: [PATCH v3 2/3] iio: adc: qcom-spmi-adc5-gen3: Remove an
 unnecessary print
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-gen3_adc_tm-v3-2-ac62f387dbce@oss.qualcomm.com>
References: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
In-Reply-To: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783270447; l=943;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=+7wdWExKan4dBAAPMYMsUwIGbTDsI54vr+pKiGN8FWo=;
 b=3RwmjgkTbbosm+RA9fwHMFB03JeleNEddXPrhgA5fuHKbu69n7qr/zoopsBgm7eXGUOZKOv77
 Mgz/+KLp3BLDgjT06jhQQVsUJ1DnafRaD8IPIxDURVA3RyuIVHh1DeK
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4MSBTYWx0ZWRfX7ZoDjn6ai7Se
 KIfWa7Igx/87tPB8CL+UbS+xNCzC7pb4HcPrDx6TSKgnmT8zgPxlkC8FIxLNWxbCPalQkWHifwU
 kfEzs1fdToPB/K2qtSqPvNI/RFUErTI=
X-Proofpoint-GUID: 07zGawOUA7TeuiKrO-sHQ9kU6ani9N2s
X-Proofpoint-ORIG-GUID: 07zGawOUA7TeuiKrO-sHQ9kU6ani9N2s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4MSBTYWx0ZWRfX2yztA9fpu2VC
 co5kllXVbiBmCWKbVFPWR4Vc4daQK8cl5fbWyLnDLwbfeWIxLQklk9CXCfQtzv3bOdK3A+r6Arj
 8O5Dwc0/CNfCcTGGDQVZhS3P6ofkYcXCJnujQo1WE4Ar0tyPb84fW96xbxH7S7I0biO3cZVLw3D
 zJvC7Gr5gJ7mU4FQN7wAxAqa0Ix3+EuXaY4yDYMZwiPkBAgW9hijSl4YsVxRLqq6g4Xxf0bNIl7
 gdBxJ/PwiT5Xb6CV1HtPjKkl5mtJR+sViZY046ljKECQEj5Z3jWLpbVLOwQGBa4rJ14oypd4pYY
 Z7Qi/EEE8hSRzTU/3pJetIZzZZgI8ZY91Btb7HPPuTbC+kYGUhMdFD58KMeQoZCt1Zqk3/qaon3
 Xq7IlSyB5YYrYdYgw+Md3fUKVN4d2v1GxtVv/m46BwD4M+6496BFF8IKqk6A3cyCRwcTrY7PxGS
 6oFDQ2vLie7ogTMHNZg==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4a8c44 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0GHOkdmGqssP-iJ1QkcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050181
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116556-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:jishnu.prakash@oss.qualcomm.com,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3636F70AA21

devm_request_threaded_irq internally prints an error message using
dev_err_probe in case of any errors. Remove the error print in the
devm_request_threaded_irq failure path as it is not needed.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c1962312afcd..74988040e6e5 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -793,9 +793,7 @@ static int adc5_gen3_probe(struct platform_device *pdev)
 					adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
 					adc);
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to request SDAM%d irq\n",
-				     ADC5_GEN3_VADC_SDAM);
+		return ret;
 
 	ret = adc5_get_fw_data(adc);
 	if (ret)

-- 
2.43.0


