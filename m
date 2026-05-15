Return-Path: <linux-arm-msm+bounces-107890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI/jFU0OB2p0rAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:15:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C76E754F484
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C671531DA5B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D87480DE3;
	Fri, 15 May 2026 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLs0ry31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFHPxhDH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5626247DD78
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846384; cv=none; b=lnNUHEfGIlLfDwNprhHYI5V0mJg4WozrlgsTE7pyrDfG1fTnEPmNAVIqiji/y0aAeaQdqjek8BTM3bd9YtFyrL9QSc8etdR1h1RvtLTSx8lf0d7HbU8BGGRCIDzc6tWN4gKVgm0jMeIuCpenZWl0jHsv0qfB32iHYla4OSQyVDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846384; c=relaxed/simple;
	bh=4istmFzgYlfp+3pK/b/yydNyM7TS9776WXEDwC5EuFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j8OYxQ2fLQmPGhHPdYbWxvaXX76utCfn1c5+43onoc19mPpHzkxNsOiksvldXt3IFGqp6Z/vNlUFvZI0Uq++C92DjRHEq3k70WEaoRSoibjxRC/zSWEDEj8NBY8G+cZKNGggHjLzc1mqGKSFN3xEZVTOMyNtuIweX/ApKr0YjOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLs0ry31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFHPxhDH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB3Rqp4008241
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PyB0x6EOpIHgSsxeRbOJpjE4kVYxEcMju2rDUiJC128=; b=OLs0ry313uuzKwkW
	lIIgVkjVQBYeYx+AYz03YaTu+3iLmP3JpKF0ymImYC7u1+mkokhTWfe8pGJI1iBU
	qPFsn3XraFKYUdfIHqLJIL8eZLoHTlZkx38m7uuhsj4bkxnSKtT73u9H7h/X8lS8
	OGPbYTHv4LlaI9Js7qlqlr6tF1WH/KtzdKX3pM9IZlmYijqffOAx1QbuZ0wionZg
	x38Y9ph1/sJFYxVJ5twyALZuJposXIDkvJa66jibr3zOhgYQd/RtmcutacUBI+Eh
	GyBqQqK4mxn0F8TJSQFe/zuOWU38ge4Z1wCIwWlT8Nr6B623d8hN6kQgeuswy3no
	RNDsPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su591-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:59:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f13da9684so85678211cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846379; x=1779451179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyB0x6EOpIHgSsxeRbOJpjE4kVYxEcMju2rDUiJC128=;
        b=bFHPxhDHJxxf17VAhWBA3OFvfHbSJn1mexh2cSqgXXPjK7i5zm/Eow59bFssdChAYt
         WrgAKUXOOXcItIOiOtYgPrK82kjbEWSpUYPjUjce4sR/c957h0P0f+BLvpPmCV4S92zN
         uA/DRkrRZW1EcTX2k/L7xLpJZehg+u3cD9csxliNx3ASNG95vnWPFB4Wc0Q5V0JS9Nlp
         3GBSjg8rULlJIEcs2MSBccAVoao+t8a5dfnJWmKTqR6wSmi8RZQ+JKbfeBHMk6JJtqgg
         80FOf/UMe4AI/G7ERcPiB0gzcxP86S369EE74+zlJ8ySO4RspGcXEAHvLs7vucmxvzO7
         B3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846379; x=1779451179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PyB0x6EOpIHgSsxeRbOJpjE4kVYxEcMju2rDUiJC128=;
        b=axMGfwN6nq4Pki5JtZklegYLjXSrCiSsmuglOCoUj0q3MYKhxfxnkFQ59fc7OQDD9m
         VddaoBYt1iyxMkF/+UJW2PDFlML2LN4wxkOZ+SFfxTPF1B+FcUOZC0zxQlruLLzf4O5v
         i5PuE37Ui89jjL3JQVnPDojlkvPUK7TNdVY5ZT8tskGwAx1MpwgetyLeTDlhRCfJpkXE
         DO1gQgDkBRckSF2OvPxjOwyszJhJGZ6DeLDewhL1WGBvrzvxK0CvSsT4/M5PgFJpcVoL
         6mN/kO/LshQrIDpgSbmdKwYWs1qkhPYNkyvWq9tcBRffzBlP8EAgYoizKEWfGb4Nh/ZE
         fVWQ==
X-Gm-Message-State: AOJu0YwFf24xqwGl62ZQxEO2PXubzmlj+ql0n67UqIpNH/O4KCXmmjP3
	fTXETTvb+T6cgZUf4/HEHulnhkQEizro2KywPIJBLKKvvwGubHxLTZpdA5aKnmA+b/qoIeOavCL
	1j18wXahR/4JoTDLx91TZu3wSMVXwcsSoAkv+itY1se9kfZzy75XYGRsah5MyYCWo307Fciz6nN
	C+
X-Gm-Gg: Acq92OEGUiFSAtJwU54ZTMJIwDiXqpJuIE1FDmHi6263OrK3btp3NlnHU+woJ0InYPn
	5abiqQkpxNo7VVWgyMAHQAzOjoM4a5zkY4CIBEm0CA320YCpF3sqoQ8kQx3U0YsjWbbaSZHJ9ZN
	1wjS3/Rv5fIO6Vyf6WHO3EF3YvZ5e4cdHSqJIn8NuIsuaBdFXKNf2K1Ka0OYjfZ/TBZdQqZneJB
	+ydhFUJu/x1jjV5ooUw2GauB4HOB+jh5cYs0olw3euO9dppSgAJDSbeJnVsqGf8k+/75MW8k6VB
	MDxVMSJFsUNVkNbeLObubPH9tHsxFXSn7/hFifsMq3uFoZaMX02je4fs3xwV0qotFxcLXj0UcOz
	eVO65sgWKVNaVHvXsTmhMEyN5YdcGvizTTKXvyhTExtUEJZdVEPatYKPMlrkfkW9PrRpO02XrNs
	Fi3IBQlcwAxMfsyyLpZH5fhv44Sp+7j90NnRLTveE5JOMtOg==
X-Received: by 2002:a05:622a:8584:b0:50d:83d7:686c with SMTP id d75a77b69052e-5165a1dbf16mr38135571cf.31.1778846379277;
        Fri, 15 May 2026 04:59:39 -0700 (PDT)
X-Received: by 2002:a05:622a:8584:b0:50d:83d7:686c with SMTP id d75a77b69052e-5165a1dbf16mr38135191cf.31.1778846378773;
        Fri, 15 May 2026 04:59:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f119ff4sm1295651e87.20.2026.05.15.04.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:59:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:59:27 +0300
Subject: [PATCH v2 4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=828;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4istmFzgYlfp+3pK/b/yydNyM7TS9776WXEDwC5EuFE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwqhgyjGcOUdnXQeB8rPm5DVKtG4TYF/bI77Q
 Jd7IcpPDgCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcKoQAKCRCLPIo+Aiko
 1f9AB/sHGp8Fg4pArnx1Z42UeNufrImX2xjfVXT962V2SMk65s1WilAknp5tUJ9RtY1KYzdgbjV
 25FawYi+rWFGICj2KMRukrh01LnEkpnEl4k2jcfqy7Tnnt2y7pw9MTrwl3ZdxN5H79cx9uLTzD2
 U3wQvx8iL0BP7U44cskyT5ik08dl75ruzE+Sp3ZSiXHYJ6uR9I7L6thfAcbKTeT6bvwBgo3O0WQ
 LbLbIVolnnqkWaCe66FZjRlk8JwcBPTIEAfHccJFL9CAMgFmcQXFbSw/7GyH8fumldztPXrzmrc
 /aZz8ZxmCRCD/G7fw19xOf0DUxSA8pN+2l3SC+Q36m6KN5do
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: IY050Fo1eESVe3s3DDTJ2NRg_RbOe3tR
X-Proofpoint-GUID: IY050Fo1eESVe3s3DDTJ2NRg_RbOe3tR
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a070aab cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=gWtj1UajujENYCbeQTwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMCBTYWx0ZWRfX2Z+AxbwBIykL
 8zM3zUQUquhmdlfe/uE43rzU7bVCfNm5Gk9uhqcgMXF52DCDpNAlEyiPX+EyPxIGo1frgeIIj27
 gYHnqeq5w5YmrDae+kVb5wM1IH2UYEsvpb8HLmYjWyuYdooRfJn3Pnmx3EuGfV1HEF1CTxhAr34
 rsokw/82W01h0+pXi6hQOLUIxAoez8ixUB0GP9ABMNnGvvCB8/N8Uj7E30aaR1wUT2kg8ifY1+Q
 jOmWbD2uE8m5UsnbPb48dKCghKxjKCzcYAl85geRA3aOwuNZcycrGeZgPysHq3/c3H+7SnnZWe5
 JkE4ICwwgTFuU9H+ehEN7NIzj7vSgiaxFua2s0OJrJvO6fxZHX5upWdYaCVeDa4YMeHAhJhBDMl
 T1ZWAi1sj0AbGU3yGAmsSB04h1oTFWHOhD9RYBqtrRKfi2h7y3tttw2UaiIOae+gQGIuEfc2YX8
 nFxkvthiAqqaL7CXfNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150120
X-Rspamd-Queue-Id: C76E754F484
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107890-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable the Venus en/decoding device on the Qualcomm RB2 board. The HFI
Gen2 firmware for AR50Lt platforms doesn't work on RB2, so fix the
firmware in the DT for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1203172729fa..a6236b09cdbd 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -739,6 +739,12 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pmi632_ss_in>;
 };
 
+&venus {
+	firmware-name = "qcom/venus-6.0/venus.mbn";
+
+	status = "okay";
+};
+
 &wifi {
 	/* SoC */
 	vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;

-- 
2.47.3


