Return-Path: <linux-arm-msm+bounces-108354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OcWG1kFDGojTwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:38:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF09F57832A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 896E7305F0E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51D139099C;
	Tue, 19 May 2026 06:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dX9UOg9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aFMWV1nF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6403228CF4A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172540; cv=none; b=MMu1mSkhxYs3ZbLFCeacQUoV0LtniP3sU2eFDoEyXKH80KexT9s8KT6xqBsk9hwINZtZ7gfsrL4VuJJteqLm0q1I/dfwZnc+tXvssVihjR5zcMmi19yf2ZhV5ESDswXdmhp7/j07HBgBftSIEJZuJgX6/2Bd9n02rLcfkhdil3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172540; c=relaxed/simple;
	bh=yX1PEq6+u3liF0g1QBiHsM+1HQ/wuFQsjt+XR4j5MtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozpghHYyRZcCIXpJTI05reI93F36JD9ieX3vMAfrd9/+fQzAuL09p8aaf/BTQjabPZr9BNawkIGbmyv5V5omzxm6Lny6fEg9PnrChg2nCorg5AiVbs1jf9gY4+mL3NPXLV7Qm6U2uar+z7tFdK2EQt37KMQOv3NcM6aG4uhv/oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dX9UOg9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aFMWV1nF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5GHok1252027
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CMm6miRDtCo
	nBCii9eCSN/fChmidDMiVAp1SA8CHD5o=; b=dX9UOg9/QlpMegev4lgifuBlXVA
	DZW2Tz90OG8Rzl5lg6NuFTgpXO+0kQBcRe/AL5MQSsyx2Jw5xn0biUqsL7McS8Bs
	Lrq0y17VH5VSdBpfxooOvfe9VXNEWpcAUwjmm4nT9oQEyisERYq6c/hOctxj8SzG
	e4HUmS1fiRoyb2mGoPT12eW/Yj3j09AmZfxkVMW93hdIymDlF+QCIrTpR349FXSE
	Aa9OmFpQULytJ1Lw9tIjivRlQXWLou4adLuzOk/lvBAokE8djB1+W+n0V8OLW6z0
	FGZh2lfoITWudQGllJvQbSoP4p+8m71/8T8Q7ETNgBw20vI5fM6VzG+e4Og==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0krsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:35:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f1383b7439so3187815eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779172538; x=1779777338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMm6miRDtConBCii9eCSN/fChmidDMiVAp1SA8CHD5o=;
        b=aFMWV1nFDnAzbYlDuX9A4/Nrut0/VrBH4j2OwxQRmLnIase0/W3jtSLH5oF5HFP5Fr
         469qwdjv4sDA0/5TtE/sVP55lO9YJ3FirF/qpmJ3PAof/oJf/AVvViCh1kzgPoz4XZTk
         MwDfMuwMcqB12dqBVHVnL9Imhsk0z7K6+KPyv56Ra5a803qdbx4dFn7w17XRPtdzf9Yh
         P8a2aBKlXrnCarNIwsyCovMHuDFVUlhdCwxmir/oz2Ti8u0cAr2y4JbIZ5qjKUJs9YDN
         AtyTCbz/8lz6KnF8ayuPeRB/EoJpvS9PQ7BhdfHvYTsvhQ7O6OEQaUf1Alsh3T6sQEoI
         e+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172538; x=1779777338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CMm6miRDtConBCii9eCSN/fChmidDMiVAp1SA8CHD5o=;
        b=hnWVjVIZJ68ThTe5UY40XDM3ABx+dIb4zmHfJkIt1Jt8XWR96OGs7f43fTirEQZ4Yk
         FJnRYb6Zha/kOTiHxxc7edOCpz3II33Hsnvp7KGNsJ83lKZiWWipay1hpXEfXpxjCPA2
         Wyespt1IBoQNJfHWXLpmQEm5ichWhw8CjI0gzeVOrQS8K8CCQiiEs0/HEBxUBMznks0m
         6MCiBo2qmHd97NoZiPaJaediJb3QRN5UgU/GAahWAvD05w68d6sfY2zUE+aU9M8u+E9i
         Mx1pZfpbNVSWyuEoIN1nyWVPD7AL5neTlJLlH7/OhcpK6Dpc7a4eQV6cUmX0eGeEtnf2
         NIIA==
X-Forwarded-Encrypted: i=1; AFNElJ+cnvWFrIOUC9hnJxN7Hct/nz1coyUs169nYf9z+IQMqj+DxsQll4YSkvjrmxjwbltye0JWsZYkOM14HSpn@vger.kernel.org
X-Gm-Message-State: AOJu0YysOd4w8yvNzGw6VVxF4Tbz0aFjPsVA23ajeH2tW6yKV5gb44Oo
	u480ci0TKZD4X49cpC+HoYvzBCi95YE1kVgGax+jKtV8Q1em/yneOGhrMotvAH26Lu6s8dMzVOp
	JgZEMNHnX3sEJObXS7CmfzWRkLqwGk09ulsW5qsPNWNhDKksnnfhgn5rXdLhygAbhsvhm
X-Gm-Gg: Acq92OHAJHXePkSi2CvsjNL/8DCWpEKL80WL5yi5NuS9DYovNOYSnyd45x+361VPZYA
	bGRkxMN9P8L8cS9JcMhSbqnIiOD3uTMxiN/GQw67pve+Mkr7YfoffAhP5qNoAIX10AHJJTDaWhk
	D0q4qY15U4Sk7Jow3M4H7qdIu0ywV4TUVn5y+SME7KqZcWi65ztbJQJFooAJD8J0rFc2t4Ff3mL
	EghYPMfuQAFEVdmaIq5A8FW9u89pwtk2cD7VUyhCDs7YPEY1sfcg1TyGUakuA32vf4CNjq1b4Vr
	/eAcxx7GEzYbim08NCB0YyGcj2CIcyY1pCvtRVd353/lYFzsyS2+a1nI0iTA2txL7YYs/S8gpj/
	8p/kLo5V7TwcdJHkEpE2HeQpOMcUijkgZ5lGIL8Dlib4Vkym0SB3YsdUvDo3SNPC4PQM/7d3i54
	q4COJFxQ==
X-Received: by 2002:a05:7022:ef16:b0:119:e569:f874 with SMTP id a92af1059eb24-134fffa80b1mr6635378c88.17.1779172537929;
        Mon, 18 May 2026 23:35:37 -0700 (PDT)
X-Received: by 2002:a05:7022:ef16:b0:119:e569:f874 with SMTP id a92af1059eb24-134fffa80b1mr6635372c88.17.1779172537325;
        Mon, 18 May 2026 23:35:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm22614537c88.5.2026.05.18.23.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:35:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/8] soc: qcom: socinfo: Add SoC ID for Nord SA8797P
Date: Tue, 19 May 2026 14:34:59 +0800
Message-ID: <20260519063505.883379-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MiBTYWx0ZWRfXwCoOdO8azSLQ
 bGrDxF/y0yCc1EMJXggrjANbdKqJMo8mDejuK8hciGjJNx9P8f+4bdxBz8KDY61zJB/fkt0pgh6
 4RjfyIoSIeTDwen0u2x/sZtLYYPWnQKILpxOkcu6Ki0fumIhr3jqPOeS+0U0+Pm/n3g7pKQ9gEr
 ZJCBVaweAJsSWpZYJwjadn0p3T8rWg6LhfWlMI3SGHSmgqoXOk0nOwsHf8Ha0Mswywrv0ad78rM
 dKO6v9qjG3CNJgeECQDY/XM/zfi+YJDceDJzC3D3Bcn6FhIkMkkGNhxJszcqydlJsRSc1YkeLFX
 m8KJAuiuIIaE4Fgf1olCCafvSmHP+KBU7Du6d2rqYY6gHh55besyhA6Q6Hc8wAeU3mlqHXuUHjG
 6dsPKfWhBjj7GcEx8oICKLpAcjOLbKnYzlufx5yO2HL4B+tLITgMkPQguSTudlcAWQvQrLbX6KN
 qG8JimpqyUoqOWMtR7A==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0c04ba cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8lSouUAgmXO8ZBFbqGgA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: VKW7SLHSBU93w-RHu4g-w6CUMKVc4i8z
X-Proofpoint-ORIG-GUID: VKW7SLHSBU93w-RHu4g-w6CUMKVc4i8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190062
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-108354-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF09F57832A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add Nord SA8797P SoC ID to socinfo driver.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index ef7074930a55..5c8bd29dfac4 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -535,6 +535,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
+	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
 	{ qcom_board_id(CQ2390M) },
-- 
2.43.0


