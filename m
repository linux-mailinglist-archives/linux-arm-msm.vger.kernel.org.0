Return-Path: <linux-arm-msm+bounces-99086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCeeHaKVwGmxIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:21:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 083292EB72C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17F4630104BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 01:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F5A1EB19B;
	Mon, 23 Mar 2026 01:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEbc6yNI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aFGgrArH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2501EFFA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228877; cv=none; b=bKDNM8IwCZTBQ8hj43bwCFTftcctFbO5OWjBxdF9LYFHopcltk3ka8zogyy5UPnXI+6oIt2R1HakeE0uscfGR0cfqesl/dZ2u4KfImIGfx+9reTDZVmypzTEUqnoouoWi6B1Wuug4WxsinnBxeJ70M7CYSFQcZmAbHgaBGdnL1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228877; c=relaxed/simple;
	bh=UEe0vwuO9QTMhJ+apyvAG1ylenYlKwpsikwaza6PkzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GEUxy+c7bl8hBHNWWVRD5PubcFihF158d7RrXEtT5iFOmfIlJHHtK6ckkrpd7ukGQHN+ANwIXmxYFUt3qt4rXl8pttd3OuESVNTkQAQRhBse2SNIZoZ3sl0fY/BCWXRHHHUEf67bjzDESqppgpd3FtHmJGzx55K63aXCnzSa1i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GEbc6yNI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aFGgrArH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7DAig3432230
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZwej5J0HsGjk32YD1iTf42gcAGVYbdXNhluCGR5uwU=; b=GEbc6yNI/4enFFEf
	IsQPPzTdIq1WNHKsaDw5n7ry1jV+956kLZrqkIl+cUrjgGhzGbphOrapCxfwkoYG
	YlEcaICXcb6Vc2r7N524CXUGdK7LUZEeLVOakO7OJJTtGxhxxsSjSSs0liqQiUrc
	1LqgsCQ+2nMHMtANGkd/kcrPYpT1NVoTEhxomJpPIUJ0MGgKnneBIxcedaL7A9Rq
	LSE2xJYNDr4F/PUgcakkGjPuUN9AZxbt4mzACKLSE+XDTcpYR2IRYFjVr2deUaxk
	hPPqQlcDloXxuL62CWaKErpCJRD7cK9dPqc/zDI+0+zh1OkWgWdXzLNiYkS7UTob
	bctQFA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rba3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:21:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31cff27fso21177851cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228875; x=1774833675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZwej5J0HsGjk32YD1iTf42gcAGVYbdXNhluCGR5uwU=;
        b=aFGgrArHVRbOFDtu6r0ih7rfXAE0rPY8JHvjhTAOg2vBdbDHapCqub5YNUZ9MJfzNN
         6O75isW8NWPCD/HHyRPVf4cUNeAZ/dh9eaKRJSnbCNCDk6C1G/LUNy3FLT/R3PihGQJs
         RvUN+3ano9HRMnj3TEWkvR3xPkXm1XvFyMPxs91nhsLivy1TQiW5awSEDsdBiyAA66dP
         MvGjo05c6K8n6JgYekaZfzoX2j4/AT4zCRIsGsnRmlxj1Ltm1+FNOErg8y8db9XLavsu
         xOylbO+FXiITvGeTA4+aPVix2V3k+xXkOBT/SgIwzhfUJ5gr4/03U5XNSuiE72SEG70w
         pGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228875; x=1774833675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WZwej5J0HsGjk32YD1iTf42gcAGVYbdXNhluCGR5uwU=;
        b=lmhJiARRfev0J18ihvCmolBMcLpcts9v2HhOaadOBRu1VGWdxSEo2/vsHtbLK60s0k
         iDjEaRax59Uk1VCNxYQ+V6FXGtsW9UYAW0IApf6EHKw08tikte9+nDN4XI9fDR5vDsUE
         fEcSVah7ki3aD6qNoKTroKRVyMyCxx1H98vQrCLVqTgmpVVyYwqUnWprKot5804MaFdE
         IkS7YyXkx6+vdhP5hyR7SiSmLuWThVFfXyNK9LhbYOIHWIeTetKH9lmEo1lit/GEvc6j
         LTz/sl+tdeWHXuxqfdAEi++Tdj/gpN8JnTJKeAbxBUuiFbgs9uXOgBLUWFcfFLSwUQ19
         2YyA==
X-Gm-Message-State: AOJu0YyO0Mlqd2nor9h40T2ie8/sbaYGf412TrTrHiIEm9Kx8LoFEIKG
	tlL9jrO+WWE/ngwftYkinQVNaQYsbOOofsvUCtjKJkgS7G7I4/GU463DlaA4xfbabvQO9AnswHn
	IQ5C3HTWt7PIrG4FMinCiUglaLpgvBlbDgoPlic126Yc/1GMWv+tJsZtZmobZ4kULlX8N
X-Gm-Gg: ATEYQzwNpj8gf3xCU2SMniyy2TPw8/bBFjIUTaN8oAK6ut0We+hjMMII8Al8tJkDoPk
	YBHlFapnMwOw8pvzd+y85h9whxvtk4kYsULCCiNWONDE7xlYhjTC1gv8m9MzdLgktTk975PrSYT
	3mpQrrmbd5PYIFgPq3BxhZbO+NqJHlLTqZNmhG3XeRAJrczdHE5mmMXzPBhUqRlSpbktVEbluHI
	oo+ZZFrS5Pc7+r9TqB3SK+ZNFqcCnRJ7cTBKxNGXkkkfitXUca4zwPdWTHQr9uXiYpeJ6P6uYBv
	zmNkkQimMxPhYHOiq9zPw0svFk1snHA2LPtnA1iVRYuE6aPr3Rkm3yep9kacFGABWQhg0tZv+2J
	muWLkvYbCUKsjlo8xk0bMLYPIG1agAHiYBsQ3gU03bBVgdMUvGkxuz8FOEbqdDBCaN6u0HhdEOO
	i5WGMD+/B7pebcY56/U1o30fJWyhH9zEClMng=
X-Received: by 2002:ac8:7f54:0:b0:50b:37a6:4f0a with SMTP id d75a77b69052e-50b37a68c6cmr159900391cf.57.1774228874761;
        Sun, 22 Mar 2026 18:21:14 -0700 (PDT)
X-Received: by 2002:ac8:7f54:0:b0:50b:37a6:4f0a with SMTP id d75a77b69052e-50b37a68c6cmr159900231cf.57.1774228874336;
        Sun, 22 Mar 2026 18:21:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cf9esm2108092e87.82.2026.03.22.18.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:21:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 03:20:59 +0200
Subject: [PATCH 3/3] soc: qcom: ocmem: return -EPROBE_DEFER is ocmem is not
 available
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-ocmem-v1-3-ad9bcae44763@oss.qualcomm.com>
References: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
In-Reply-To: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UEe0vwuO9QTMhJ+apyvAG1ylenYlKwpsikwaza6PkzQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJV6wZQG9IeCuG02S5X/96bqTli4qchnKjM43
 gUpxPr3hUeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCVegAKCRCLPIo+Aiko
 1XTwB/0aDfenlYeLU7IKUGA4rc/scQgvSdTYjBLWtAhcPrvouPi+h6ORgGEiPe4EhH7bZD3mNux
 nm9ecVUVSNvXSvRosvOJnvhj94iBBSDp8lvINCU/ZOzRWLET76TyBXxZNBPN5QLP1mZcuBqyxbk
 Yu/yG+CFca/7ZG2BnpW0gMqjbD9/2sVvAxzv6IBKg0QzAazhmolXsGCuLWvcZun1OdN9moSxfYO
 rQEskzTaJ27YaanoLa66wslKgsRGNMY+jh+x6UPZ6HLxP7EylaRzeXyezNrLv+ydyyVHi4JYrx8
 sEvRFvhRd+DjPEZ8RPRd+UYGKIVAPoq+BN+Qg2vYWH3bIC89
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: d-mMYqglgHvFUk93qTN82VPdXnKj1mBM
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c0958b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=L7hVWDwwpjkKPWMWytsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfX1nzLnrV0q88L
 +/MAwnBhxYGXeLHCh4kkKWe0mM0KRd1h2c0yvnzc2P0n5Chprp+LUxWGT4OfxISw/Tbmn0sxZBJ
 ZuWaIIcIpuX94XExrz6HaQCtDtuljmJBn5VDobzkq/SzBgSrFL4wgDzA2zlrKCGazDA0cT8p585
 4EiGPJyjLS3/gylVAeWmMLrDmTFyb3iSlGbMipnaWJJZNcdArU5gLNXim7PHVntZyvaFB8sYXsB
 6LoNHop9T43sTUDLs3zZgOyGKpC7S1Vgcv/HU39orOhVg6XLnSSqJ6UyNeB2DtoflRQlaV428On
 BeodJDi32ayd+mShQyfCBx5MnCePUk/7G7U1jfYRzcMNzA+5VRUHK68HmkVtdCWbBmBlqHIogJK
 5Isg3Gn2VkPqMEotWqMKswncv3cdTdQuuwV+F2276WQArNcpBX+WBrhaoXKtFtFwLreijfaRZ+5
 YB98NzZ3pyIGIA6iL4g==
X-Proofpoint-GUID: d-mMYqglgHvFUk93qTN82VPdXnKj1mBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230008
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99086-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 083292EB72C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If OCMEM is declared in DT, it is expected that it is present and
handled by the driver. The GPU driver will ignore -ENODEV error, which
typically means that OCMEM isn't defined in DT. Let ocmem return
-EPROBE_DEFER if it supposed to be used, but it is not probed (yet).

Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ocmem.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index d57baa9cfa03..c35a98984acc 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -203,10 +203,9 @@ struct ocmem *of_get_ocmem(struct device *dev)
 
 	ocmem = platform_get_drvdata(pdev);
 	put_device(&pdev->dev);
-	if (!ocmem) {
-		dev_err(dev, "Cannot get ocmem\n");
-		return ERR_PTR(-ENODEV);
-	}
+	if (!ocmem)
+		return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER, "Cannot get ocmem\n"));
+
 	return ocmem;
 }
 EXPORT_SYMBOL_GPL(of_get_ocmem);

-- 
2.47.3


