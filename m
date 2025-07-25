Return-Path: <linux-arm-msm+bounces-66681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ACDB11BEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 12:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5DBEAC2410
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D352EBDFA;
	Fri, 25 Jul 2025 10:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="haLl9Imb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54202EBDD5
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438134; cv=none; b=kWiyt2X6LJEEpjo7FYs6w7ErTN9ImkuviUw3ZKhWTjvt1PLJa2BdrcrkNkLHHPIcmfNz/p2mvDzN5Z5TctSKPkDriSY6tSTk6bOSut2YI2dk0+UZ0BNAOWmQOQuqmEPvkLBpOtz7VlMJbGxWNdATUU71J9lKP2IIIo8Zj+TTMLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438134; c=relaxed/simple;
	bh=xKQ+/Rx/dzM6RV6e/DwULemIMqUa7j0+N1nJWqQg93c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MlViQkX9h2dSHBNM1pL17880CkN8Dpzsqb0VumSTXvHNbIUsZ9J6HThy8FckEj7GnOT+aA3+GNoltmN/gKxE9AHpOPqMaB78NdGJ3kraX+4px4DbHKDKTjGnR2pFWIs+PWAZZZ1wG46Bob68ealyqmR/oWGIVq7Ojk9ZFafAd+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=haLl9Imb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9A4Bm018082
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Txr3kBSGXuJ
	M1NcPlL0RigHdmQCDNw7+9K0Rj1x3VAA=; b=haLl9ImbzgXKYq/6fRYTzUnyghW
	wTNkpUdG+3EAaaiGR3ISGOciy87wgq9dK8gpiE11dpuObxFt0grW7DbzZJdUrYRa
	iGlbk2rIsYWN4lOUB/E4MPJBLJVTYOWn7Ti6BEVHvLUlbJUiaCHBNeGDPAs3fOxW
	G8HH22BP2D0+JCZqIa9mS6c+2VhIDvUDolg3CKajjkub/DHJOU7M57RJfiTmjIZz
	3cGYzNoiVW+fn2CakPdBLJvAzwsJ4SjfSUy8+4MkSvJinqRhKLO/aBsLZKh+mmNX
	nYtP/IScabGOXj1HzORlssL7hrF9ySWYyvsn0zIiWD71A8hZHjREKq4lirA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2s1nnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:08:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23638e1605dso15260425ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 03:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438130; x=1754042930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Txr3kBSGXuJM1NcPlL0RigHdmQCDNw7+9K0Rj1x3VAA=;
        b=AqVfQHUO0sl2Tbp5mKeJviIvMpUEYv072PcjvsDYNkN6z61LpKwvGBeCfkE1BV8+MB
         HjAnnXxi0rxXsldvBO18YCn3R7mwEhcQ4xwtJGreWOPPY52dKiilSLz1uNIwUJ1DAp/c
         R9IjlByGIGP78bSi/0afI7LvwaxUIqja/poAg5pLp+zSSGTCWDdhURJ7+AV1gxT3ZwIQ
         /8/nPoBsTNJot4P7CeAQgV3GgiDD8lrHCZqIPsMMXclhq3bZU8GaDoeg9E61/6ANNpOs
         0sxhRJNHGHu5jVF+8VYs1ydd0ekK30GAQuASAafIMRbYuUyWzRSm/O0PhtalUUyQDVhs
         /eew==
X-Forwarded-Encrypted: i=1; AJvYcCVJWp1KWLbrIBj9bSJLLsfgI930LnI6dOneKURYFsdgHXwSgWmK+UT1Vl2MipBGDnEAf97IWVG4+lTZ5jCt@vger.kernel.org
X-Gm-Message-State: AOJu0YyefqDMxEE8GLkHdEBuQw+se2d49qtWQ6seY9Tk9m18v/HfE0xE
	FZIQ2Q8WFQIwsv/0LF2aUiVr7ORNoKgekGHNp9OhXZvMWqCiZ2g88WW4WdJXI2O/m70S5bhGiSU
	74S0IvtxQxItrEt88DNgFKhlflPWX0PChJzjjKiQ0YZfGu/njVdsXDBji4XOsh/5tMttY
X-Gm-Gg: ASbGncs5neJnF9sK/j4p4f+1fL0EwWCR4vWi4K6CLBm8iGYB33aDh67ZcP8hoAykCWs
	i38bIAwlWDmoF9jWIIHphRLJDpYHlg4CAzm9LPnn2ZGVjG3OrzXc+d+d3JRBK6pgqxkVXsllkRO
	eW33bQGmtexDl6FdmiKGsbXCX/5ZJ9ADp+2nvOTpBYj7/TW1jXwyc6XDlRz4ytYEYeUUGpDcOUy
	y8yb3laf9jpodkVipR0nSWr6M1QwBXfo9TgWtTMWMfC4CcMe0nMP5LxMVHubY8TwreT593+2381
	+Ut7d/XdlBkipaGr+AhEtPPZE9LQH56XWOjJFf9gdF8+Hj3313ZbajFnxhZa8/qXgBdhl+IeO8p
	ExjGsssMH01lMZYx6GMM=
X-Received: by 2002:a17:902:f382:b0:234:b41e:378f with SMTP id d9443c01a7336-23fb309b9e2mr11944965ad.15.1753438130062;
        Fri, 25 Jul 2025 03:08:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElHL1J4HjZlxfV/xkGQlCThZW+w8mmt5K25h7rX8vHPVJbhFPxXe4QK00qDdLox5Muncmuow==
X-Received: by 2002:a17:902:f382:b0:234:b41e:378f with SMTP id d9443c01a7336-23fb309b9e2mr11944605ad.15.1753438129635;
        Fri, 25 Jul 2025 03:08:49 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH v4 08/10] coresight: add a new function in helper_ops
Date: Fri, 25 Jul 2025 18:08:04 +0800
Message-Id: <20250725100806.1157-9-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _QazrQVPwU-CH7NoXb9ebaeSdvo_jpzi
X-Authority-Analysis: v=2.4 cv=IZyHWXqa c=1 sm=1 tr=0 ts=688357b3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vagHEfzm_U2ljPniXDUA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _QazrQVPwU-CH7NoXb9ebaeSdvo_jpzi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfX7iLhqXIdR2nj
 rOeISS+DUOVJsHSlM0uNoZA0zxx/mJC/rWLZMaAA6A6Q7IBbTV138crr7o0e+VAXL3V2JtvNzxw
 8Am7TArmT1TW/i4179PpXBHG3Ez3JDcWdvZjlhK8Dw5qxYSdR63ec+TRT+uCmnDd1jsMyCteLxN
 Gop61z0MuNBqWQ8te+JsfltV6UGoKSu4YBizM8918ytpxdgH3SICwop2WzfD0E/FUMoDIRt+XvL
 uNOVMYx3TzhTBpPoBUfOiLZ9fGrqZCVpEHeGb5apLJL/RxCdhApF3MdbbHluu+3j0LBqMZG++St
 pxN84qarHYfM9rvdLL4ZTr8MF/wbwbSX3BeuELhFdssotx22atxTy7/DcHMlNHNnSmsAV+JU3V7
 AXslxT7vE/PyuJ5HlWPuGX2gN3h1xHHuN7WXIbWAFgzER3YpgdRlLtHhtKj1iSoZOah7CBAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250085

Add a new function to identifiy whether the byte-cntr function is
enabled or not in helper_ops.

The byte-cntr's read_ops is expected if the byte-cntr is enabled when
the user try to read trace data via sysfs node.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-ctcu-core.c | 35 +++++++++++++++++++
 include/linux/coresight.h                     |  3 ++
 2 files changed, 38 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 8fc08e42187e..dec911980939 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -234,9 +234,44 @@ static int ctcu_disable(struct coresight_device *csdev, void *data)
 	return ctcu_set_etr_traceid(csdev, path, false);
 }
 
+static bool ctcu_qcom_byte_cntr_in_use(struct coresight_device *csdev,
+				       void **data)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct coresight_device *helper;
+	struct ctcu_drvdata *drvdata;
+	int port;
+
+	if (!csdev)
+		return false;
+
+	helper = coresight_get_helper(csdev, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return false;
+
+	port = coresight_get_in_port_dest(csdev, helper);
+	if (port < 0)
+		return false;
+
+	drvdata = dev_get_drvdata(helper->dev.parent);
+	/* Something wrong when initialize byte_cntr_read_ops */
+	if (!drvdata->byte_cntr_read_ops)
+		return false;
+
+	byte_cntr_data = &drvdata->byte_cntr_data[port];
+	/* Return the pointer of the ctcu_drvdata if byte-cntr has enabled */
+	if (byte_cntr_data && byte_cntr_data->thresh_val) {
+		*data = (void *)drvdata->byte_cntr_read_ops;
+		return true;
+	}
+
+	return false;
+}
+
 static const struct coresight_ops_helper ctcu_helper_ops = {
 	.enable = ctcu_enable,
 	.disable = ctcu_disable,
+	.qcom_byte_cntr_in_use = ctcu_qcom_byte_cntr_in_use,
 };
 
 static const struct coresight_ops ctcu_ops = {
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 4ac65c68bbf4..b5f052854b08 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -419,11 +419,14 @@ struct coresight_ops_source {
  *
  * @enable	: Enable the device
  * @disable	: Disable the device
+ * @qcom_byte_cntr_in_use:	check whether the byte-cntr is enabled.
  */
 struct coresight_ops_helper {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
 		      void *data);
 	int (*disable)(struct coresight_device *csdev, void *data);
+	bool (*qcom_byte_cntr_in_use)(struct coresight_device *csdev,
+				      void **data);
 };
 
 
-- 
2.34.1


