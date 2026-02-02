Return-Path: <linux-arm-msm+bounces-91549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHuVEF7qgGleCAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:18:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EFCD00CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDFF330F3BF8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 18:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575FB38E11E;
	Mon,  2 Feb 2026 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4G3lYw6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLyZ0hGg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D942F38E113
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770055875; cv=none; b=OtWWHFV/r1vkTOFCNypD/4PV20u8/Vvl+Rn9+mY8SA0OBL5OT7QZAhprvthFxF6H3ktISuw0m4er4MdiYZc9JyaAuB09ihdxFndwbbnl6JnadNwisz2/lqKQQNW8EnpF4mprsx8crIoS0kyhNoDKzR4Um7T5ozZsj5Ah+rAiym0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770055875; c=relaxed/simple;
	bh=DPNtWNLTVP+6P5jhcLAx/PljFfhGLnY7YS6kOhJTTnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PNmmnovLEAqnfdM03BdbaEEJ4Vi//EXQg5L6xgPtRrhWhmP+shwWRJhaGQ75E+EBaVEv+6mBTX1w/DFpY/HEOwdimNAuAkd6vTsaKh+YHh3GQFNIDubjMYEOuJ/SHFHJ1Bg3y9vF8V/fqrcHshGaj+hNqUoLhpUsRJJr4yw9AKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4G3lYw6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLyZ0hGg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CJSJ72884359
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 18:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+zueoamhT95
	ZEtnejExAs2CCJUW74T3ofLGNMnq2YoY=; b=I4G3lYw606NdMT2w8j/+K5Nn37l
	jfJ3N7EmxCYfdaKgQ082tHm8xoWRH4F4UUl3CYPnUokhA2M3VQnQtpoOe3uoWrZB
	j2YijPNZhjRU4wYDnwe76JTB9hamHcVhV5BrR5A8ZD0FlXp7iy0GlKC35MMjJ/KR
	7H5qoPGMb91hDYl/of1ZgofcaTsKAiejb6XSY3MdBDpOF4qxuJae0wcSDjA+fac1
	QtuF29kzXofCSKdOB1j8xr+klDYfu7FVuR5YxZmjo8qIflXCQ4I744m7QdhxqZtn
	KVhY+rGShoiLV8HtVXLmeQu6u+HcKh69jpZu17nMKgoKFMgyyPsmxJMkt4A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3h4w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 18:11:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f5381d17dso3766640b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770055873; x=1770660673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zueoamhT95ZEtnejExAs2CCJUW74T3ofLGNMnq2YoY=;
        b=RLyZ0hGgL9aZfbo3dARZEEIV3PC8sAl825BySTL5kYp0T+wVg4G9LJqW3+ZavycbaR
         efXeY4pMYY+/wLqy+eErk4LnQU4VzlzVKhMnRBV45vdR4Emv5vE3x0h4L6MYtLwD8WgV
         olkjE/nDM93cvr5HUPbIjOqjoherKexJIdYA44qyaw6+5jd5tdGFkOxtbnnWasd+1h0U
         FQ8KyaIHfV1OxsccJzVkDQpLiG151DaFs6CG8bZAKOJqwH2CVuUbh4RX+iS02jy3e20q
         BSwcURLbvfb5qiBEUGy639scvTQ+0TuetA7l3H+hxLjmrJOGebLs9oYQ2CHYJUGWpiuN
         0oGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055873; x=1770660673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+zueoamhT95ZEtnejExAs2CCJUW74T3ofLGNMnq2YoY=;
        b=grvbYTc7nV+T2rH63iHCBZoC4oKE0WjCpwqFaXhBFpDPlTn4HVtTYkRfye+py1zdYq
         mYaSCpkUnzveDyeHIAZHTRvNMsUQZnciCtMEx6OEayYqbMC50Vg4F0ffxqqJ4NcGhJGO
         Zh69cdQgIJcyMMVGugeIgKXuCFTdbnvGZvHCkl7YAV/UQsvY1kiyCLiATzbfWQTKzdv7
         zaRqzIVy1WZm7C+YNAhRfj4kmh951gmzq8kZh2cpgug1JFAIYdRkAq32fCsYt/We1of2
         3j2EmMEQEnEEtbE6XR2UpRIZ77VpnUkm1JJ++189AjqE1lFdavCbWHP9GDyxk4DxGhFq
         4Ztg==
X-Forwarded-Encrypted: i=1; AJvYcCUq86rp/E+wFJz1hSHh7qhFv6xpfQLqyMGN2t2GrhjpFBOo5M+8EJw5uGGnMLHIJck1nPxep4s8NSLp/HHe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8TvbJkWYAledj7L2sh3Kk8g3FEkk4+/wuibwJKIfnEmrAnHyr
	lmKf0pfWFRs+ogZeKxKoWgZve+OuHYcgyZCqsjh/mqLxahOR2nLnLHxsxNOusobt1Jfa5sUmUqV
	s+DQbxPs9ICaGUp/p0Uha1ZACCMMpNDiYqgcqVd6UUJjH53xLdwwJP6yVC+++bYHWwhUk
X-Gm-Gg: AZuq6aJERrG8ZA4b1C98yQ2ga/jAHaMfIhoJk+yX7bboqFN7caRi4Rp4XdSjnr/zfJq
	gihDJrphPuOAw1vGTxPZpe7JaqMBkOb9n8OlUQhbDeP6JYpa9CTPEmCHzmpH6W4rYCdScC3qrCh
	trPSjI4qqM0cla0zVuBv516kZYxL0pZgO2qh35YHufPxdQZXdyNHdmuRcOLcZPwsr7U6XPgoBYN
	HlpboHbU/Yl3JpTZkJyMwpuYua/Se+L/I0D6APKKwyD5cNnzNs3MHwfvZUs+0Qtp1el0ozP8yFQ
	4HWM8bZTOJGaeTi0puqgDvLUzkcndHU5Zooy2QRzYIAnz1OKIMVuLb/Ji6oFbNzoJVlbjjCAu4Y
	Wt30QoLGz0lDXqiWIP4Pwi01V4QKUiH7aQoxh8xBXha4=
X-Received: by 2002:a05:6a00:a201:b0:823:1491:da10 with SMTP id d2e1a72fcca58-823ab643b92mr11767841b3a.12.1770055872584;
        Mon, 02 Feb 2026 10:11:12 -0800 (PST)
X-Received: by 2002:a05:6a00:a201:b0:823:1491:da10 with SMTP id d2e1a72fcca58-823ab643b92mr11767801b3a.12.1770055871972;
        Mon, 02 Feb 2026 10:11:11 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm17476780b3a.40.2026.02.02.10.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:11:11 -0800 (PST)
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
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
Subject: [PATCH v4 13/13] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms
Date: Mon,  2 Feb 2026 23:39:22 +0530
Message-Id: <20260202180922.1692428-14-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ugvPqYBVPiLhg1WpNWNyQVANA6ieRMW1
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=6980e8c1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zgZzUwpPmSg69XYvEVoA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: ugvPqYBVPiLhg1WpNWNyQVANA6ieRMW1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0MiBTYWx0ZWRfX+B3DZcNeOrcU
 /DbatPIpfhtOSDPb5uizBKAQVnFhJjcrDp2zRoLszU5oSmNLbRueWswOWLX0jFuUyanwJDtmGVL
 Hvg4nNIZSGq4dFZtwrUfvx2WLEbtZBM4OzO/RJN2PaLywc1gNiVzuHjofbfAITmFyt6QKdUjrs9
 rF9hR9DI8caO4i+SUIiL25TjcnHT/Wv3g5DRoBUMUmSzjKBYPhQ3RC6FUOmHfxZRlTEMyIFffo/
 uhUvLk9TPqwIP2KybpLzLcEzU6HDyAb2rntWK1Ltt0KO/0kdqi/v6tBa+zrF0DZK80tfzOtQgA7
 lpTz1QyOU8WECoGkosxOHwSC4HdZi55S6GFXzV1+TzSh9zEeecccrfYWOiPF1evulICQMeRY2hN
 7DyYp5dx6ByLG6WfgrMb67nre4WXkcMh7qXLaBT1SZ1S9z7cvYkXYS6tTQn9vCfd+VwX2RcqN85
 t3+tdU4YgvgxaqbIzcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020142
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
	TAGGED_FROM(0.00)[bounces-91549-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: B5EFCD00CC
X-Rspamd-Action: no action

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

The SCMI performance protocol manages I2C frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate..

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v3->v4:
- Added Acked-by tag.

V1->v2:
From kernel test robot:
- Initialized ret to "0" in resume/suspend callbacks.

Bjorn:
- Used seperate APIs for the resouces enable/disable.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 56 ++++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 8fd62d659c2a..2ad31e412b96 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -81,6 +81,10 @@ struct geni_i2c_desc {
 	bool has_core_clk;
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
+	int (*resources_init)(struct geni_se *se);
+	int (*set_rate)(struct geni_se *se, unsigned long freq);
+	int (*power_on)(struct geni_se *se);
+	int (*power_off)(struct geni_se *se);
 };
 
 #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
@@ -203,8 +207,9 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
-static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
+static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
 
@@ -217,6 +222,7 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
 	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
 	val |= itr->t_cycle_cnt;
 	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
+	return 0;
 }
 
 static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
@@ -908,7 +914,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 		return ret;
 	}
 
-	qcom_geni_i2c_conf(gi2c);
+	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
+	if (ret)
+		return ret;
 
 	if (gi2c->gpi_mode)
 		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
@@ -1043,8 +1051,9 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
-static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
+static int geni_i2c_resources_init(struct geni_se *se)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	int ret;
 
 	ret = geni_se_resources_init(&gi2c->se);
@@ -1097,7 +1106,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 
-	ret = geni_i2c_resources_init(gi2c);
+	ret = gi2c->dev_data->resources_init(&gi2c->se);
 	if (ret)
 		return ret;
 
@@ -1156,15 +1165,17 @@ static void geni_i2c_shutdown(struct platform_device *pdev)
 
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
 
-	ret = geni_se_resources_deactivate(&gi2c->se);
-	if (ret) {
-		enable_irq(gi2c->irq);
-		return ret;
+	if (gi2c->dev_data->power_off) {
+		ret = gi2c->dev_data->power_off(&gi2c->se);
+		if (ret) {
+			enable_irq(gi2c->irq);
+			return ret;
+		}
 	}
 
 	gi2c->suspended = 1;
@@ -1173,12 +1184,14 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_se_resources_activate(&gi2c->se);
-	if (ret)
-		return ret;
+	if (gi2c->dev_data->power_on) {
+		ret = gi2c->dev_data->power_on(&gi2c->se);
+		if (ret)
+			return ret;
+	}
 
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
@@ -1215,17 +1228,32 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
-static const struct geni_i2c_desc geni_i2c = {};
+static const struct geni_i2c_desc geni_i2c = {
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
 
 static const struct geni_i2c_desc i2c_master_hub = {
 	.has_core_clk = true,
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
+
+static const struct geni_i2c_desc sa8255p_geni_i2c = {
+	.resources_init = geni_se_domain_attach,
+	.set_rate = geni_se_set_perf_opp,
 };
 
 static const struct of_device_id geni_i2c_dt_match[] = {
 	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
+	{ .compatible = "qcom,sa8255p-geni-i2c", .data = &sa8255p_geni_i2c },
 	{}
 };
 MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
-- 
2.34.1


