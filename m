Return-Path: <linux-arm-msm+bounces-94391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNABE3A3oWk1rQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:19:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4711B328E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B54AF31883E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCDA3DA7F1;
	Fri, 27 Feb 2026 06:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TKVwr3PR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OVq81ErH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A6D332607
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772172985; cv=none; b=UY+D4xd3Zd+wIN+GoSBIf3hcsvdwikT+1zWrhpiKD2ya3FNTnshlGu0DbrAty/2dOgv35hgy/UosddAd1lG8G5mIes7Wh8UFxnVpWAAHmhoCJUeEOXhSs898p998t6gMJVOzR3XKyvSd9CNf5LjfgBjhVXkUw352JbDQaX/nrpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772172985; c=relaxed/simple;
	bh=vinpJK3AdlE6QuECVjsA4xyKYusB2fCdpA1B0h1Sv7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X95OncwjE1JvZETf1x8yNfdwwmnQf0n2bnDSdDBfIsMUVMbo78+2ZSY96jm4mfzRQ25FCK/W6DkyAe6fTvhWTuYMu8r1uetM8XUIvw1NHrSut6BSsz+fN/3JLrkDvwUlW46BEvG4hqWaJwFffz7VEJQEewC9IgjSdq2hPtkooBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKVwr3PR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OVq81ErH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2JxaT1873163
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iEGuO6CekKn
	dAjKBDhzD10xpNyXSXQXlYftFADS5L1E=; b=TKVwr3PR+4rYKrj9N375Qqj5Fvl
	7XFiw9n8j8lj+CsfA1NchYFEInJ+Ji5zUG3zp5rqyyYmKWLUOUEu96WP3H9yusyO
	p3lTQtUEeyHrPvJePux75XDNOO/Jzp911ymEPdWoVp9G6wIqMsFk7v39xPriraxD
	+OgJOHLxq+NqRt68Qfwok2VlyG46e5FPOyTkZWsbrUip/4mqUIeT2X83TGMNoEbS
	kwUZQj/iNQ/0IMU6tDQaz3Ap0Ce7WbM5eLxP+LYD/6p5068R3hprCXqiBEMXIxiI
	j79DY/cqhMCsVgt1ySy0PznwMJ901tnoAm+qB9AS/miDe8K1bS4I+AHT5Lg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuytstn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aad5fec176so15583035ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 22:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772172982; x=1772777782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEGuO6CekKndAjKBDhzD10xpNyXSXQXlYftFADS5L1E=;
        b=OVq81ErH+rZSSv7Lr/CDZE7Bz0XHHJ+Q4y4uVBa0CnXOexTb2/OX53Vt35dkVZBWX0
         SAUiEzvGvdBKEh1RoNR8JsHURuJNHDDmHxXJNMC04gf7BXmAP5eG9lDp9ox6fCYeXAfA
         WK6gxlodGkQTBwyKM1+ruEh8gTdAYgBueROZLcQ3WbIjpvLfZFRBHpUXFmURyXPUT3Yg
         excwo+xouqVuAnBFBXuRDKIWykb4ildsWHtBLCE53+hd2Xr8tjjW9D/N6Y7SZ0oT4mKO
         hWncXdaO1i4el/WYVHlPobfoWJtQ7FbpeEvH4THDwZ1SMat5/1+MdhPBAENiKm3/nAR5
         IMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772172982; x=1772777782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iEGuO6CekKndAjKBDhzD10xpNyXSXQXlYftFADS5L1E=;
        b=cKvpxI7jvmMr963gjokrv9GBZ/ZBm/QK8sBOKSd1sU/MmtNpZM5xV65Sh0o55eFX78
         8ASF7BJPbzmPF36tE8nKBsmN4zia4LC05Hm0TzJx9v1l9dN1tKwkl5trifIKYdUYIgh0
         mDqmn7H/9E4AjTbxAc1X/6UKtSRwRjzvV/21b5v7sv46ikZJ0XjUxWNrWXA2Ik0PlVbm
         EO8/ZCfXCTHc29r5NuuQbGc20kczQJHvqFii4/Ylr4nh5vUlmblXi28O7WpqJhqZpj/q
         Iim5FPmnCt2hk+J+hrq2s84rXXo1u5aljSyoclQu0DmCfbvMM2VoPzQ6ZBjSIi6P9u6G
         xIfw==
X-Forwarded-Encrypted: i=1; AJvYcCVccDNUczz/f+n3W/u9sMyveQKJYkzgYPORO5KBlON6lZQzpn5U2K8wSRnvbCrcD3FkXJm2EFwSBs/jBEVF@vger.kernel.org
X-Gm-Message-State: AOJu0YyahTYSuBNmyKoirkuzI0cycVjnuHwegm3/vqRNcAQ5qrBDKkEw
	RmQDdANEkKSEP252X7EnNqflvUoRL8Wgmis03LnF0Ky79vdf3pmolnvd26kRpWLPCZ/r9cUVTa0
	ynvc3JXEa8+zobLvWrz4+X2zAOikdEB8y9nYSvJ/NTxMbd358c8/vNoH9X491lHoZzzKL
X-Gm-Gg: ATEYQzxHK3hXM6BaclJ1qPeFeQfbKvAonABjygViSdRUNiHZZ9gXUCzn9CTWMsdH4yT
	eju0qFhIECvaTgkQinXyrytDB1XFwksdz6L3i0vdffB/JEo/8qzhvpPFwmbNA9Nrft0p8DUU3Vl
	6tY0l8VTsAids8UAcDnuzTYYpUtmF4u4t6PD1vHGbDIywTAxh1i6i7M/nwleQhb1SDbShVmmxts
	rEfAS/xpZTpAZ81JQ8A4guHnXK0sxFgRaGEAqOxAms2zuUjPV/+CxZCj4mbwqkkW1hCNx/KRO2k
	dEBC4OwWLCM+9s/YYGmyN6bxaYNQy2sKSFOhHoj9wl5DpIMVngwYfNOlxAYbVPuXXbIyj20FtaV
	dKuVwKQUBTOozF7oBo1OlD7U1q1EgpMYLxR0IpUM02pwtdr5sxD+4sSE=
X-Received: by 2002:a17:902:db04:b0:29e:76b8:41e5 with SMTP id d9443c01a7336-2ae2e496c4dmr14976575ad.30.1772172982170;
        Thu, 26 Feb 2026 22:16:22 -0800 (PST)
X-Received: by 2002:a17:902:db04:b0:29e:76b8:41e5 with SMTP id d9443c01a7336-2ae2e496c4dmr14976225ad.30.1772172981546;
        Thu, 26 Feb 2026 22:16:21 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a043dsm64813025ad.54.2026.02.26.22.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:16:21 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
Subject: [PATCH v6 04/13] soc: qcom: geni-se: Handle core clk in geni_se_clks_off() and geni_se_clks_on()
Date: Fri, 27 Feb 2026 11:45:35 +0530
Message-Id: <20260227061544.1785978-5-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bJIb4f+Z c=1 sm=1 tr=0 ts=69a136b7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=fzsqq50RfsZR9heXkngA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: YlfxqaY38kPZ2Op45hwwemMyNn1dmNPy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MCBTYWx0ZWRfX/WDp0fHfGYdK
 HCBG9QaUrY3KUt81/BauVRhmQIT/t7N1gaQThEfOX/Nz0Hhu3vrfygQpB/obFiLoj/GNDPSkT35
 zYUlKtRBuHW8C2ovLk+Nfk28GXWRhLUwSx56XySviD0fVp/9M02zPgsoBGHa41TZitG5YjEHxn0
 EY6xl0mA/JACO0igbXk2TYQ/iAVBopPz27DR30dbGBC+DjrQ09VQXoqsXjH8jge4S+27FYIpFmE
 dcj8Mr0IeaxljSOQkcmcB4BZch8ryMxZFOqf1oIg+Kx66kXOx9vJG5Qqn2itwDL1aI0c/q4vBG9
 +KdvKdedfKvGibSZYIagZz3wduSCCg4D6CXjwJhD+9DzaUkmPyLlWfqCjGeFT0wpQ152ZWo4COQ
 FsxDdBrxE7RHxUVGLwcqyYzRIZQMDZAutWQDux43ZD9Evc4ENvLqN2NFbl+4TNUM3Bu0U4PlE13
 4kOjxZWozJzUqb/oh3g==
X-Proofpoint-GUID: YlfxqaY38kPZ2Op45hwwemMyNn1dmNPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94391-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C4711B328E
X-Rspamd-Action: no action

Currently, core clk is handled individually in protocol drivers like
the I2C driver. Move this clock management to the common clock APIs
(geni_se_clks_on/off) that are already present in the common GENI SE
driver to maintain consistency across all protocol drivers.

Core clk is now properly managed alongside the other clocks (se->clk
and wrapper clocks) in the fundamental clock control functions,
eliminating the need for individual protocol drivers to handle this
clock separately.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v4->v5
- Added a Reviewed-by tag
---
 drivers/soc/qcom/qcom-geni-se.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 75e722cd1a94..2e41595ff912 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -583,6 +583,7 @@ static void geni_se_clks_off(struct geni_se *se)
 
 	clk_disable_unprepare(se->clk);
 	clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
+	clk_disable_unprepare(se->core_clk);
 }
 
 /**
@@ -619,7 +620,18 @@ static int geni_se_clks_on(struct geni_se *se)
 
 	ret = clk_prepare_enable(se->clk);
 	if (ret)
-		clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
+		goto err_bulk_clks;
+
+	ret = clk_prepare_enable(se->core_clk);
+	if (ret)
+		goto err_se_clk;
+
+	return 0;
+
+err_se_clk:
+	clk_disable_unprepare(se->clk);
+err_bulk_clks:
+	clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
 	return ret;
 }
 
-- 
2.34.1


