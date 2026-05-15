Return-Path: <linux-arm-msm+bounces-107775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HdfC4P3BmpUpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:37:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B88254D7AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3A1330F26FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4177D3CBE79;
	Fri, 15 May 2026 10:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byF+6sAb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LnsJ4mTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49693CE090
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840294; cv=none; b=JMdvVSquB1qVyClWed56AvAdgoDVfhagwCxbDqR9i3CmYtF0DBRcG+WkqN101WqvWG95L9fIyB2opLom4RJtZ6iVMxdjBxef9QU1u2jMs6cXCP7u3Vj55NNUaEwdfFirEK9bXQEs1hLZdkTVaEvIXfLv4pyC5aBg60zNAMGlRYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840294; c=relaxed/simple;
	bh=PyMk2dprZbVedfhATEqni+mUQmzwgIQHY3dTKszSu/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GyGjp43Dv4l8RpnRZ9UVQZYZuOE8bdUQpdrFwINL8mXnXRK5uRAXTdRwfmhuffDBlfTbGw8ZkL65mx+ic9Z0Z5LCr2cg5Q1H0r80QjesfSJMjJF8QOqVzXsmHL/kqoMnOGvgqX+cPrrT/S2l1OKggBN1m9znxOe92jYTKpEYW50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byF+6sAb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LnsJ4mTa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F59IuQ3797495
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nT5t1er0p9rLLgy+8jBKeUFHcjl1ZgR5BBhxorKvUYM=; b=byF+6sAbT1x8lsEp
	DoBLOZuw1ZZ+13KnRxF2uDc+TsctgOYFQVcg0BlLdG/mUin4tI6pMIUBjnsJJAvO
	PYQrFAMcYFkCBXYvLYwJTdprx1k16Y0g5Dy8gbFJt1wYGIt97dwAyx+0i49icIjc
	EIhaYrI3AmTdaxAev2Tzf/DdRuif0umiS7Y22E7cnvo5YzSx4YhejBS4ynubnXTc
	3u9kaiTy1EbGnQKISs8eE31JuwakzqoiTi9MH0GeelE+o+gO+4pH270wNIg9C/EN
	iiWkDMdnWeMTegHOVGJYWFPJPcOW2m7v/e2vF3hQfEXTWWQV9YcZ98tClJ4rVg+a
	8FnLPw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1strnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:18:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8353df9bc7eso8616430b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840291; x=1779445091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nT5t1er0p9rLLgy+8jBKeUFHcjl1ZgR5BBhxorKvUYM=;
        b=LnsJ4mTarEE02ut6eIatNIUjPfwSwAFx/UhmxEzLQoDArvdx4O+IUeE4WF2eKmCzo+
         P8PltQhvdAcjCOcHCsaRRzU+FJqPM0JSIbzLjKy9qK4zDHm+8BSaGOnJeDMig7fjbT8F
         +KdMjWxT6btPBaO4lljG3lRhRiHY6kORr6GL2YXlY3wVQqTAf9TJHCuRGUqFL2dnxtHc
         7FJVWF8cPMHUwBK/4CLn0vMEoRXoKKda583Nb+oSGxIeMow0CNKg3piAIMsvWKHVSIKg
         JrefMRbI8pcQdvjx9arJEoIi/H1A4CSm7MvaSbKK5e+Ma4RVHX31XHumN7oepI8hLeok
         gOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840291; x=1779445091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nT5t1er0p9rLLgy+8jBKeUFHcjl1ZgR5BBhxorKvUYM=;
        b=MKXVHqT+9RNBc1d5gO6UDcb45B49ROLN6XQ21/rWwGHvPpet33zHRjmFWvxQ91T3Vh
         gOr6/ofar2EsR+4ixdlqj93R9P1ewE4JSylIai2tvBJahQmsLv4S1DzGhlW11jNwRqg8
         k/2OyO3WEb3xl3xKZadUko4NLKZskqj297SzhWr++22HtUa26hsQ9/7H1I6x7xOe3+Wy
         mVJvRKO92PotZm7hZ3PRFeBQIRNUB/L8//21nIjVv0FmXyge8ziuqTvEfp0EzsZ9EU6o
         yEUYe+KQ3kdqmfT7V8EoQbtem9JRMrF8FF73iiII4ojL4bP0NClqcrcTmumG7WkKoa90
         wgyQ==
X-Gm-Message-State: AOJu0YxNqNxgNnbzkdUcIMfXelkfCdsznF+c0h2mUWryUprTzs0zojqW
	ENlqBWAJqvsLfU40MnWd0MegJqU69OaECzgXNM1FEBIzJIkuLVmwmufTvA9W9MG8BaAGc2TP/QW
	kuVfuBaUaPw+DBwh27h5URO4TkXZYLLN0ZgM6dkXrTho/XDr+quVPqf6UfKIbcoX58Lkn
X-Gm-Gg: Acq92OEi8C8ryRV1+qUR6v1/b/DIzclT9Wf9PT7WWytrDXNoOUo1mYseB6DfUj5egaO
	vn+CQ/8kInkKx3JZRzhpqVkCpjtL6G7BBbo/C9t6QZ88gv81kFfw/Djm/gMYXUJBopoNqzRXfiQ
	48q8F9gq5TrsDQTXE5oiixbP6Bh8dOEPJmmA2aU78+fGhH15TrrM//UVDqjGYW7uRq/Hdf9KlyV
	pt4KzJ/H7LHdzxOjOM3D5hgP7G6hPdBm42CZcE9ce9biII9dvRXrTcEHkZcebNB1M+w2YPHPy9w
	E6RUdB84cLt9GAq7TyE7Og2ZV6rHudvU5L/sxdU8J22eG4YjvM1R3/weKI8YKZCb/+ftBzVdHh2
	cLpJDRnygFhOuYpomVQL1cC2KLekviKnFpF71wW0MmOaewpeEGxhHClfUrKHLZMn+q58xCgIdHH
	RV5r8M3OuosX1RazdR+/UKM6x6AsA+rxC3yu9nPBnu33MIAy0mWapn2W0Vlzi9ng==
X-Received: by 2002:aa7:8895:0:b0:82c:2555:b9b2 with SMTP id d2e1a72fcca58-83f33c4d954mr3987180b3a.10.1778840290742;
        Fri, 15 May 2026 03:18:10 -0700 (PDT)
X-Received: by 2002:aa7:8895:0:b0:82c:2555:b9b2 with SMTP id d2e1a72fcca58-83f33c4d954mr3987150b3a.10.1778840290339;
        Fri, 15 May 2026 03:18:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7c74fsm6878482b3a.49.2026.05.15.03.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:18:09 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 15:47:59 +0530
Subject: [PATCH 1/2] thermal/drivers/qcom/tsens: Add support for ipq5210
 tsens
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-tsens-driver-v1-1-015ca76f1418@oss.qualcomm.com>
References: <20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com>
In-Reply-To: <20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwMyBTYWx0ZWRfX7NsSWIgR+wbi
 eYTcPrXULAersR3SciAqJGDAvDDpfnCdrU6IStNpuQqt9eJ+IU8SM4QGWAWM1Xy/KE3bmqOgOoS
 fz2CvqY/slvd9Vloa9JRN/KNLqZtW+stiIPNCAmuisr4AqLi2k6nRM+Eu3l2hVNjqpIeLn5JlWk
 5NpnLr46eenz45exN0eLUGBjlns+zhNA1/lecWj5MCFWpHm4G9xDyB6TMl/ghivuh5ICbZEfUh4
 i1NJ8JZeRKWnzCiSRJCmvaAQ5FYxJgJmuqxfx3EEqc+vGHNjLdxuP5gn8SpnekHepqy0HeTKRd1
 XBHxh/e8Ijt0dUTr2b3UcTF+j4CMtouxcdNNJaMGd38EAm2q9BvHjnbnL5gPv9LB+MpqBDiOB5K
 eZ1SEjkE9lMoiIojrlhKh6THPdYrtvN3XeDET3yu1UprOCX5v8NuooXSlFPJmweqXSXbWyT3S8i
 NqMVNdslOM8Z0Ky7Tkw==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06f2e3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PQ1O5FTCzdL5xpSpzfIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: -tixOpnPxB7YBFaxdbeTeIl0R0iaq2c-
X-Proofpoint-ORIG-GUID: -tixOpnPxB7YBFaxdbeTeIl0R0iaq2c-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150103
X-Rspamd-Queue-Id: 9B88254D7AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107775-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

ipq5210's tsens is similar to ipq5332 tsens. Re-use the ipq5332
data for ipq5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/thermal/qcom/tsens.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index a2422ebee816..c0c7ecdb9c2b 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1110,6 +1110,9 @@ static const struct of_device_id tsens_table[] = {
 	{
 		.compatible = "qcom,ipq5018-tsens",
 		.data = &data_ipq5018,
+	}, {
+		.compatible = "qcom,ipq5210-tsens",
+		.data = &data_ipq5332,
 	}, {
 		.compatible = "qcom,ipq5332-tsens",
 		.data = &data_ipq5332,

-- 
2.34.1


