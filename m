Return-Path: <linux-arm-msm+bounces-91740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B0LAmiagmkzWwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 02:01:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C031E031F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 02:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34BDB30EE185
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 01:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D45C24677B;
	Wed,  4 Feb 2026 01:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OY3gMuzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQug+om+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DFB23184F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 01:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166805; cv=none; b=hEYxTG6wLo2eC69h+e6c1xcj39PJ8+tTKW+W9o++kMH077T1K2+dFKrylTHbNMREjx8A2jY+btsO7ie4lILCKN1SktCvRb1XjqT6gzqPNlabdcjTD7h008pYJzr7UpcWBOVXgm3hBAfITRut8lVRInn3kIlK5j4jCjXaWTxbgek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166805; c=relaxed/simple;
	bh=VfRuUvDLNQGtvgiSr1eaiBtwpSSv6JIHemxucUr//rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t62TNAyceCiRQxzw1DHyVg4qBfpxz279lrzSmyThvHOT4rb8GcWikqf9KEPrCNE/VHhgFBjNqUadkidx70fYEb/3Vv0ba2okD/7WrQ1qzzqsOOzBexXvvnZOhjTDK4FmuKr1gJRJ3T/ezEZElB4WtwT8P/n881mfKcIBh1ePDHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OY3gMuzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQug+om+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlwsW2154686
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 01:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=; b=OY3gMuzml7IP7Qkq
	7Qk35TR0FHXAcYO36NxNmTrj5PHeUa8DB8m8Q93kXbn7oyafYiWmhhWKuRr+uR8z
	mO+UzSblYNS/fGhxWzsFX48oipYfbOvs0946FK+aiczLZ43doRUp9TFd6HadVTEd
	VWtXjDu1PwnRINwtRzJ4htsofspTw2Zrn/MttPoOKfYnRjv6Qir7/nMa8082D6AD
	0zlfhwB+DWoD9KHfMuVmVyjq7N+RoLNizJE/ZUfoYokPmowky1dDZMYXz/Jx24Ok
	r47MJUMP+bnKge6g18MXHnCQ73hfMfVXJt0ON2a+QVV2wv5xEhORNck/23b7ssHf
	pkEZWQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutjwwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 01:00:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70b4b53e4so2755051385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 17:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770166801; x=1770771601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=;
        b=CQug+om+6ESlEAFBfG5iWjX75Hc7w2MLeENwElaVbwJjg7xRxFsvqP3OnHJcFqfOmB
         L9QV88OZi1pAw+S+gsieovqZLvSk8D4GRn0cZR0dQ5nokmbvqkjgoqRWCgwUQHVLFxvx
         usP/4KRyLSknIiwhoDZyhvFdbJdxqeGf8J2JLWsE64yu5I3vsSQ8euqs6kEFrQnVMqdy
         yUE9wi2AdXaxBtA2TrYlQ6OWA8BFj8YJuZlfHBWB+o4Pq2lm6k3DYGAKaBmBhW2XX80c
         YUxNYU2vf5fpBaIaWj8YAucp4xKsv9QeQZdOhUPpFma9uPJubHs4AJlBDVqYisAD4j5Z
         U/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166801; x=1770771601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=;
        b=DcxyM5wo8qRxN6DBBU/Idg9xwOL+jP7HneGzITj4sAJjYsMr2jS+eprYelmc2c8SqG
         hWFfbZHD3Vg2rI/4I28ILGjFcWCGrA/OaNH7W+r02sE7FhX5DCI5pHkV4apMk36l6fna
         REh4aSkIiEeQM1fBvceRd3kpKTSBi7op+YNUcLmVhZRLL5Skbzqb4mX4OC6TH7IHXzsv
         EK+AVhLkt8PrnhJ7WM/eHobPAPlWDyB/zNZm6mlBNka/dUsRyxDTtuowBOOmFNVYz5zF
         W3CSZ7HO9J5JH6Os1dlgdx7z0a6lcBCs+Iyq5/74b0W2cmL37rq/2DXINDbdzsXOuGO6
         Z7pQ==
X-Gm-Message-State: AOJu0YwO7ZLrrvOFt6bPHYDtv3oa4g2imI6HLBfwybIW7+GEl/o+4U41
	wOuqUKLJJzsgYKkVPJwEnxRon/S+e7kcTNSQP0lOwFNZdq9aSO2OsK5YR4QITIACF+e57aMzIsw
	S/walGH2lfQCH9+b9eRsH8vCO9vStpv4RM0bBcU9LAGink+H1yXzH+x2fdUAZgGvpjIzn
X-Gm-Gg: AZuq6aLLOLYgOP8qTXXcAF9a4hMKE6I2PxXezMlHDEdWAi21/NkgneU6b5n4ZN4Pwus
	153t8p8J35BxHeS49IMdI72DkSYbWsr9iiDVAgTkaDG+ykyEgkCW+SZeyaqj3tyC4MRiDjap3nY
	FRCumMkFEM8cn+tnWPglwfEBNPlE9w81oenHigKMsmE7c3fCLUyD2fMhLyV52u6GBDMGi0FQVrB
	ecD7AiYk0lFmaaGuJZ7MMSEPy1FKmmZ4DXn6Ip1GlT755NQtcZv36Deklj1EYi+R1dcejjy+c7a
	fvJ2ejujT4hxXQJNVbGt/oKaCWwMeqhva+0DSFbtPa4eFOku0Mswap3Vy5BLZ8QKZqeQraGhPHY
	VLobwVepvsWnWqyiSzD/ldOkBAXp3+ZFzhe2v34SL88EDrMhCiYEDeQTBfgczA+ydB6rIogjfmI
	m6SpeaIDerGjLJQQu+3Fi3Pa4=
X-Received: by 2002:a05:620a:4148:b0:8ca:1107:1214 with SMTP id af79cd13be357-8ca2f80c8b6mr201842485a.7.1770166801360;
        Tue, 03 Feb 2026 17:00:01 -0800 (PST)
X-Received: by 2002:a05:620a:4148:b0:8ca:1107:1214 with SMTP id af79cd13be357-8ca2f80c8b6mr201838685a.7.1770166800833;
        Tue, 03 Feb 2026 17:00:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff563sm253405e87.1.2026.02.03.16.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 17:00:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 02:59:51 +0200
Subject: [PATCH v3 3/7] media: iris: scale MMCX power domain on SM8250
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-iris-venus-fix-sm8250-v3-3-70fa68e57f96@oss.qualcomm.com>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VfRuUvDLNQGtvgiSr1eaiBtwpSSv6JIHemxucUr//rw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpgpoH69jYaMl9aHZSebvqf/7+KmmazX16JJBMf
 XbNTMQ30MmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYKaBwAKCRCLPIo+Aiko
 1fQyB/9WdlqfncSawuaEvQr/Y7vMSJ30ptCp+Q6MnsWnr3cxm3NiMiQkGgL4VGujh6za1/xN22x
 kwdizN2RrU+oihEl2FipMI877Fdq52jPDC//ieT7UCIF+PA67GtQPnDGz3mruvvDS0nj924uzEK
 /0xMiLULGUL2uroIdK4T8V68/zT/RYU9xKUNNQWJK0zcSWmZWSsfk0uYz0EztJQEp7FlScHEXGo
 19xZQdUA+Rhb6oD0bmv7kFAXs9XN9pVLfue9YtssMiMAMzXQVc7TfBeJ3DkkI0Tj34j+nPbM1wu
 U/Y6ohg3d3XQ3c7LCUBMzj1ydPICVugRCWj7NXhvR7cPOYfT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNCBTYWx0ZWRfX+JVAjITBDBMF
 kV0t1RHPaYCdEwe97gqVr+GObBaYTfZ/6kpXsJq2T0OifboO0JRqttNB0UBCdMcxPusrKgMThZ2
 oHthMZrDIdqwr9mO9vsw2B8TIGhQ91WZPP//dKqiI6Gp1KruG6q+SqcQaEta+wGZuRDAjYQ1/3D
 xejvAsmYcUk8JuRQL7+tn+HMOc3jVZ/IaeKvLVm+UriR4kLPCPlETNfnpeBAJkrR7gdK86TjfFM
 SGQJDchqYmHkvEVVKXEecsOhiUHB34GET5pQYdY3gYfHjtd+WncVkZeeQiibqyDTUTU4lJUgFit
 V+wWFkvE/+l5skQA333no8y2IQJAe43sHSivH9osi7GSPzOpWMx3j9ktbdmo86/s2aQDVIRlxbw
 V15UEpcG9nXZwHRo+L78JQ4UeXpk8O39nx3UxFkk/aMgGYjGnsqqW8Lfpdmww6uGA1Q1Qh9SOz8
 xulprvGDblpmHMQqG7g==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=69829a12 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_hdJGhFWpaytJYYtlLsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1f61e4AShZdg9AQXJf6g2y8-pj4CVbEO
X-Proofpoint-GUID: 1f61e4AShZdg9AQXJf6g2y8-pj4CVbEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91740-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C031E031F
X-Rspamd-Action: no action

On SM8250 most of the video clocks are powered by the MMCX domain, while
the PLL is powered on by the MX domain. Extend the driver to support
scaling both power domains, while keeping compatibility with the
existing DTs, which define only the MX domain.

Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
 drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430e..aa71f7f53ee3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
 
 static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
 
-static const char * const sm8250_opp_pd_table[] = { "mx" };
+static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
 
 static const struct platform_clk_data sm8250_clk_table[] = {
 	{IRIS_AXI_CLK,  "iface"        },
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 7b612ad37e4f..74ec81e3d622 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
 		return ret;
 
 	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
+	/* backwards compatibility for incomplete ABI SM8250 */
+	if (ret == -ENODEV &&
+	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
+		iris_opp_pd_data.num_pd_names--;
+		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
+						 &core->opp_pmdomain_tbl);
+	}
 	if (ret < 0)
 		return ret;
 

-- 
2.47.3


