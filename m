Return-Path: <linux-arm-msm+bounces-99713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LegGALJwmmIlgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 18:25:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFFF319F79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 18:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F3C630353F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C813FF8B0;
	Tue, 24 Mar 2026 17:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQ3a82on";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLX87btA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735A405ADF
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372513; cv=none; b=O/rok2UjvyRjPMSxpXwOt8P7wqjG54P+aHZ5ykHpHcLD/U41fjdUr+itwmlf8Ff8/rkqyf+KZ6txnJgEI2fMcyvdhaRxLxZ2ta8KQyzKhYjvJ6lS00gcOe9j8qQQyPTHxYlgde05dEEVRPWNpGJ26BZKXjup2oa2XNxkjgmnTeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372513; c=relaxed/simple;
	bh=elcjAGgBfSB2eK5i46MrikjW09yfu61j3gVBRCZFVj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SziHJsrdj4a8ivX9s493qqvajSgNZpqmTIAPar4vu9xlvzIBCUmjTMr4tH+gKrPTNtik+6jZWy8pGE2CfROlKj5WlXLGjgkkkc1V0gDWja7SLy/YioyLoc3RmnYM7nJ5QdKJZYYpWneCPwNymFs1nuWFubkS0vqdUyVCnTw7sk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQ3a82on; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLX87btA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OGwTES1291512
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 17:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GAY/DB2LGB1XO+H/PRd65O
	pufWi8BTPk74E448FeXtk=; b=FQ3a82ong11iD0AnjTxMTHNJTQgavPOGZZy7MK
	GvoS1zvofiyjLNFUXh5SF0XsbjvXPx/eOKB6l/wygxTEvUExs1f7kvogsWGKHy8q
	ueYMdeMR5rNddgPgq8Z3IwN5AleikzKfRalQk8kGgUoi6PskMYvs0Cdw8kcu5I51
	9F5ZBrdNnKQeR0cIzpraPMzfXf2ocYBPc6GFZcTdn9VigXXLSCbtcMY8DsRHHbiN
	XXHrvQTXFuoeQ/zl1tra8bEL8Jnrgxyb+wbs6spIjX4CF5jSKDkwcWy9pGVJzBm+
	YjhJfOr38H93jVRQcacLMOiPobtKk7VsQYfJ37deKCR4K2Ww==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw41dtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 17:15:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0d15416b3so21472913eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774372510; x=1774977310; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GAY/DB2LGB1XO+H/PRd65OpufWi8BTPk74E448FeXtk=;
        b=gLX87btARWd1sNyE4sO7dSNOPX+7gzyih+GscQR6/FveAXDIe3C0Plr6LI3lfusoHB
         hiPIT7xSUzz6J/NsBC83rUovmibNyEaE6cjaNcD3akwOLJPjXgwnn4tGmNH4aDgoorkz
         u59SWO6/Pqbf0FTJm9dvQnesEFh1HdPTBXtf+DC/tUg1pqRgQUSjfN0wsMxXmUtuuMH2
         PfJ1ePZ8gngkit8zfoM+ati6xBEwKW1CNHOZb2e5DE1GjIDGXecMpByfdYACdcOIpXq9
         nd69D7jgA9j957DOQMHTPqCCG0BqdQczdUkIz4SFu4kseZAK8ONeT61P3H4k6qGPk1sm
         aaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372510; x=1774977310;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAY/DB2LGB1XO+H/PRd65OpufWi8BTPk74E448FeXtk=;
        b=J1DeJylBYGFxaXk9yYsv5NBpmcJlOT4uAJJLppiZXzwak8vGmQHULZTK3TYa+UMmxK
         3mwhHDnpB2feU30cyb3z9coqP1w+pB7Di14z6lxa+seqUgLRKYUY+DKyiM0z42Tb4tTc
         Dei+JhY9DWHIXF5MazVzNuGj0ZiVk3ApLNOj4zP1oZfuXRJ4aXnr+73wsySR5UMzM+Ui
         gsbOUBNEikXyPTHbEQs7TvH+6Zn8BQoVEZs7Od5/SPemOsCklIXXKqJtIek3n85zTrGR
         9F70KdTDwr3j5kGPTgqhGiiMoFZQOlHZZCj4i2Z8el6xuKfpzv23W1rEvQylnS8ILMjF
         ZNiA==
X-Gm-Message-State: AOJu0YyvElus0qpp/nbK8e+xt2QjyDAqnEKibbvixPZWH2u9k7t6UBQs
	FrSLNnQnNViCitScDXifkkNiPnZ18lmyQXFP2Tn7TiFrvwHv48XVlLjy5soHdwGBV9s4t+oQltD
	jheGUAakgh0sgNG9D6LKRxePcsAm/eHX9rhwfTmviKNhMgKQf0HSTEriQeZm5UROVc86j
X-Gm-Gg: ATEYQzyj+rDVwP3bkS84BhmO3/uWB+ak9Wr/LX2MG1yudy/6JsYxx1bq0tsfye2/hpH
	yKCpBBTCoX04QS+Swpns1kIa7py88CkTeKTHUCELBL+rJu4SrQbwTBeE/8qevxJ3Q7UrVmLyphn
	dGqT+W5smhf8MM8xuiwMeEmib1bnF//7vBsrKmp/XY9uvuLvjdMVpCrsHN6pGlivCPyJmuxUNk0
	owOJtiJajGVYzAriweV233ySc+jaflRHH91Gvt4LWT5KVe+j3fHwOtBeIS8mbu0toSBNoHUMPcY
	gagK/RSfXmXTXuZHy2cdpJeUBiT4ZIHF89nwm9JapmiVMs1WCUhjFoI6G7XL9WMG9KcqZeXJKm4
	9Sn3owBfrcg+jb+ZQSD9pZ1qE3zgxh5A4GQ7vkr7qhvfz8CFg7X3V8W/Tmxej0UO/4XQbxV3v/1
	uXD8+SMKJ9mQ==
X-Received: by 2002:a05:7300:4302:b0:2b8:6a22:6d52 with SMTP id 5a478bee46e88-2c15d4a8564mr66271eec.33.1774372510001;
        Tue, 24 Mar 2026 10:15:10 -0700 (PDT)
X-Received: by 2002:a05:7300:4302:b0:2b8:6a22:6d52 with SMTP id 5a478bee46e88-2c15d4a8564mr66254eec.33.1774372509271;
        Tue, 24 Mar 2026 10:15:09 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17a7c1sm15961099eec.7.2026.03.24.10.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:15:09 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:14:57 -0700
Subject: [PATCH] soc: qcom: ubwc: Add support for Mahua
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-mahua_ubwc_config_support-v1-1-037d35ff2317@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJDGwmkC/x3MQQ6DIBBA0auYWZeEDsY2XqVpCMKosxAISGtCv
 LvE5Vv8XyFTYsowdhUS/Thz8A3PRwd2NX4hwa4ZUOIgFfZiM2sxukx/q23wMy86lxhD2gVaZfD
 l3tIpgtbHRDMf9/vzPc8Lc3vCJGsAAAA=
X-Change-ID: 20260324-mahua_ubwc_config_support-2c3a27d80d3e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774372508; l=1186;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=elcjAGgBfSB2eK5i46MrikjW09yfu61j3gVBRCZFVj8=;
 b=hzfx6FHMTDqYVwCzaYHfSJSltPj5Qp+bT4i/6HrC+iDBxiaM99zc0nBXRlcJWpdwqXiAljm+6
 X1yvy6mVr7WBqs4fptbT/LTfy+9ytmpLqJDJOnTwd0lzQc/DC47wzzx
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEzMyBTYWx0ZWRfXxeGkZothmNmu
 iWhXF2H1exTHXNwYuuz2uyuUvYhvlI5Adendf/v+qRoE1ubVOB+8dzEeJ7CYNOzu9RDW6nMN0Ak
 j5soxBVfB8ZTNNBfCWIOwitRIsRcKfn4fKgBmtUch1NG1H9YtI+sSEnepDRyy/jx2CXv6as+kSu
 uAJ6MQOGw+K6esf158AHN3xmhptYcxIIKdK3xLdyjD4VberMm9rXqsG/Bkc2knuBkI1zWZykkiM
 35sAZ2tTuAm+0YXVJWvcGmQBf8PjjRLJvt/CXe/wNpCxiPyWxJlQ2zXRsv2YVEH6DbM7Bw/Ll2Y
 coGiPcQFXplLAyvDd4TBLwedGrdrwQWGsQzntK3TH+ZzQf2lQyfJxtMNBUA2WBuJ9yKLoWguzDG
 YL3QPNxB+y7eqRRR0QYzLIXVY3kNz7iwVPe0SwuFZ/ncYqK+MEBXvDgZSdBPCzmaPIznoDVeFZj
 M19mdlN3fAoiX2epu1A==
X-Proofpoint-GUID: qP_0rSGqdbuN8xiJAQTWkTH0NbuqsvhP
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c2c69f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iGPLG0OxmQVoqJxMJMcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: qP_0rSGqdbuN8xiJAQTWkTH0NbuqsvhP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240133
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99713-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4CFFF319F79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mahua is a derivative of the Glymur SoC. Add the Mahua compatible
to the UBWC configuration table to enable support.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 8304463f238a..b1a25657144a 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -245,6 +245,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
 	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
+	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260324-mahua_ubwc_config_support-2c3a27d80d3e

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


