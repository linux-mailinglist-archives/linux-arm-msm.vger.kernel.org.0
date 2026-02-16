Return-Path: <linux-arm-msm+bounces-92897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Gv+D53UkmlMywEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:26:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9483914187D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B213B300CE7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 08:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113442DCBFD;
	Mon, 16 Feb 2026 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIQUSO/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uwc6Mqpz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61FF2F9998
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230357; cv=none; b=WqH6rof4d9x9a9KLyky8zo0NIeoQwTTPWod+cxwGkFISonbjgdbMOXAwMYbdN7Gv0YLwuMA9LtHp2Y/TSDleapO7Uo6BFC4/w9Ha5ZfCSJG71FWG/Z8LyX0YcTFOjAOGP2+wj2kV+lylbsTUAWh5Ik2m3Hr7kLiHb71EHSKWPlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230357; c=relaxed/simple;
	bh=NzF+WDHxCpU1oeUmmfs2CJ6xVBU7X5CPijriyvKKfco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CQZrtUo8iaX8GDzEJzcdvnovjGNnLj46GypDk0UvjyzOndyU2NMMZ0VZxx5qclfZiflnqTLNfm+wGcLsDUq2jMgrZIhBj8g2YLdWDgUGqpri4iChi3imgZ6EL9pjXjxf5L4GTPuSGXBzqquIbvv+QHvohUZITy9d/8XoBHLUsLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIQUSO/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uwc6Mqpz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G1M44v1895765
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wJ/8mlkR/dC9d008RZY7dk0kiPHhuZAbrLZ
	/LRhi1wE=; b=jIQUSO/l06fAJ2o2hU6H9rpcg/BhCpgV8N5stMYdzJs9I4g8YoR
	+GJxqCpLhyz2tZ5jF2fyuItLTkPbe+l34ZSaiwpPa3UYGn14xL8rpAxsocZYQ1La
	fetb7UTvKoj9qiaG53YxLt1skbys5W/XjF/BivXkFMmZtorMSjd/uipvAe1fBUbR
	sSUgX/ElS3nKLpA75Fi6IDlbBXd03PweM3ddahbmH3puWwe/u/KTovnSq/Yr6qfY
	BsPIVFu/bYrjLmSITm486+3TddpWyGNTMO2VWakeTx4lpTgiabyDj+/O4kBqHu58
	h74YtMfa5jFkdDzahByxeLyeJ+mhRPNx5yA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caedpc5hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:25:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a129cd2so2039786785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 00:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771230354; x=1771835154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJ/8mlkR/dC9d008RZY7dk0kiPHhuZAbrLZ/LRhi1wE=;
        b=Uwc6Mqpzv0dPi10RG3WpOFyZfLx6vkhNr0+O07kj1kAzDOg+mQn0+hJyRaoUF1gd05
         6zxXeFGDZL3cuAq4o4gtOTJVE9CZRC/hZU0+elxJ6M07Ms8G3as+UY1PbFEH7ARtdwRN
         FBDk3qYHFBpGFWDGxjXsxaTcTvOX2d2jbxwstMh3tXOX3IyEG8+1SgAtUsVZAzcTGV7v
         3oVrPveRmK5Xmyv1AjcISL4Buhzfp24rbGGgFNFfrh9lO0bFpQ8918CXIi9Su3H2QP7t
         zCJUAJ18YVJVJDVoI0fKlwL/y8tFRnub5lRvOuY5eMLr7Erd3xF2v8Vul/Wcnz1W37Fw
         FEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230354; x=1771835154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJ/8mlkR/dC9d008RZY7dk0kiPHhuZAbrLZ/LRhi1wE=;
        b=Fl4xK/pzUh0M8ay4zZr0gDyNXbC8DleHLwmeKT92boS5Q1OY5CpWzJRZfyanfaldhj
         SBYALQUi1HKY1CTzl42Ka9K4hTpKPDMO1y5xA4FesVYJ0lk0M+aCoXFYNy0ysw3oUzv2
         JgtmF/Rg6/Cvx4eoMdbdxVZRVOGmorExN72muRyyBjfIPbgbA/XXGy5veleShG4iLRGA
         N/M3E1hmEx4P9ro3N+9L+YE/0sHZ5eujSLL/Z+6MMXY8tFc2XLtuVHAs3++1ghQPAp8I
         vtW690CjJ7WXsWWxixX0JsMVUyzvdxBBVE1zJhfgYqiHjEN/b3fHr29juZ1nYEZXF83U
         c1gg==
X-Forwarded-Encrypted: i=1; AJvYcCUEjtizaX1SqBB07PFbKMdnzYnACjfhk/xJhtUQnInWw2EdoY4c22zrtwQu9UBTVGW2PTuYKtdKoRLU6o0O@vger.kernel.org
X-Gm-Message-State: AOJu0Yze3Qe68+wokho6HiNsoF+NN9GJU0y/wMMQYNU1LCM3CLpfknwn
	Yq3ogkvdqgw9LuABHrk4P33FcDxikPKQEcfj4zeOXTXPSI2iBtIgVwCx6FdHDapoZo+YC7ubGyO
	8KpLhrrfoNKCwJRujoQqusSjLTkIBthDLMndXQeJgNpbFY0lPvUwGcj6ang8Wx23U3KLF
X-Gm-Gg: AZuq6aJGPmNn2pniJZqARKyNw8PrqbLQ8GnLskSNClaN7BQaadvnvrdMEMFTTAr50Qm
	eefKJR/2P2oYj7omcw4glri7qSDlEsyth285hshz81N17KsxuWgw5j3yobxz/cBl5BSKM3retGP
	1fNX0GhFLiJXtij831uqZT+Mfa9ZbQcD6I+lfzoPOmD8F2qtmJlUowcj03sdj4G7ieRdK6LxVvb
	GJErdNpOhmlxtojtwk6C6OZDKZZPLk8BnTK3h6EW+FuiNylg8eN22W/dIYaXY/0rSH+NYSgiHcM
	selcfQ+bvQ0BfWJ938eHsQgn0q4KMCy+xiNxEcp7TPJCwjIimN908W0+tgKNOYVA+Cdvy38Oew9
	8qbKY5R8ofuChvNczs/mu/O1HGRbJJkW0Ys5p1Q==
X-Received: by 2002:a05:620a:40ca:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cb4acd53c8mr836348085a.45.1771230354289;
        Mon, 16 Feb 2026 00:25:54 -0800 (PST)
X-Received: by 2002:a05:620a:40ca:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cb4acd53c8mr836346685a.45.1771230353877;
        Mon, 16 Feb 2026 00:25:53 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6b563sm25775049f8f.12.2026.02.16.00.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:25:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: qcom: sdm660-lpass-lpi: Make groups and functions variables static
Date: Mon, 16 Feb 2026 09:25:50 +0100
Message-ID: <20260216082549.32853-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NzF+WDHxCpU1oeUmmfs2CJ6xVBU7X5CPijriyvKKfco=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpktSNrMqp9EEc8GAD+/JqmwlRKKHoJs2WbCv8i
 tT1PaOUY1WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLUjQAKCRDBN2bmhouD
 13QnD/9fm/vOeabTRa9R7KRLz0lwf7nx1QAQIf0NM7ZnQvl7ZPTLgbFoFIyyrdGy5680JVfxUcK
 P1czkWvTcHxJ8IQPQhW8BtY7OYE9+XjKGShfWE1VLwFt8IAi6/FkhCb9E10cJCKbqfbxPwuP/+j
 pBReQB/BJ3zdg0Jz/REgOci8++CoLa78xLp8XMRJhcEsEdS/rSP83IRiMalkmotB3KlIuNFdoRm
 ROFlOyCkAHWdPP2JNL9SH5I8wx2ShoCgtNbThS5wAA4KKhFfIlFVtfG2M62WNO0FpQ3WtN2EsgW
 GBwZ7FZTDdJFb37KcZB935+KqDqXfcg0RSTNxfdHltVrEnJenKqyD9jF0SkvjzLIfoih6OVFY4M
 AKZvUxFgMFS4DTj7e2H+Gyufl8vyh6mgNAq2iCEvmZlBicdF1pWsteCktjN6XJ9H1t0BvrAa2tj
 0w+4gCY/YK0Uc8LjnpVTbIkrPVqUirsp9CjU6UhCA9mvQEEJ7Y+FnBBHwc+E4bCHHaCjIRtmtXY
 Pc1SiD+hB3TN7zHuLXSAeSw4xZG+MoVSg2jL4MZfbPmhx2aUCnU7GVH6g2/VRXQpxpk4NT836zu
 joAliEkOiZa2ISqZubYmZ/HJYrelHNxZhDG0tOSmXJTOdkKJ1iXuoGcJBXi/3D8WKHcSgn6ho31 KNyjSlsRhQgbUhA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA2OSBTYWx0ZWRfX04ebF7lfXwFf
 7WFpnsfl/E0UozG/7a1SrZ3QzwVwIlWe7F52XQZeDPkDcyokC40mP2C4UXCYtC5GL9ys5trIbvZ
 rO6YoLOfXou1iJXL3bMHaXaTn4YBkq9hhJJWvqDgDTbN+ghLzYQ6GiO+6/ydOJ4EXGLRDLqD2yU
 e63sWXjws1RCyz4xfTfe624IBVbuIveMkgmkyzMUpIfddebOgn1ts6FLMrniC0vYxIEDidotxBP
 TRNzEzc+LVqsQEmKFV1pm2cY6Si0mGkkdNH2PIcWur042Fg+LX/V1Ez9YicXPJUe1eStUFw+/Mt
 NdeiXhTLxovaR2iVWlEjwfUPkNzleh1kyYHy7NHEG1WPoUMT1PdHGIpjHpL1lFKDIGfA0zl+jEe
 RjKpfBo0Q5XjOiCmA5AZpzS/jyjmbJ9Bvb9ZnMiKzBcTU9xVVEmQg/pHC6AXCAuEgwFtVrH8b4P
 R84OozoL5uH2Wd3W0ng==
X-Authority-Analysis: v=2.4 cv=eK8eTXp1 c=1 sm=1 tr=0 ts=6992d492 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=xHQ7LX9FiyoPxv88MD0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: D6fRdewAr7wsMBLIsJBPPFjGOOQfSSEg
X-Proofpoint-GUID: D6fRdewAr7wsMBLIsJBPPFjGOOQfSSEg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-92897-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9483914187D
X-Rspamd-Action: no action

File-scope 'sdm660_lpi_pinctrl_groups' and
'sdm660_lpi_pinctrl_functions' are not used outside of this unit, so
make them static to silence sparse warnings:

  pinctrl-sdm660-lpass-lpi.c:79:27: warning: symbol 'sdm660_lpi_pinctrl_groups' was not declared. Should it be static?
  pinctrl-sdm660-lpass-lpi.c:116:27: warning: symbol 'sdm660_lpi_pinctrl_functions' was not declared. Should it be static?

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
index d93af5f0e8d3..65411abfbfac 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
@@ -76,7 +76,7 @@ static const char * const pdm_clk_groups[] = { "gpio18" };
 static const char * const pdm_rx_groups[] = { "gpio21", "gpio23", "gpio25" };
 static const char * const pdm_sync_groups[] = { "gpio19" };
 
-const struct lpi_pingroup sdm660_lpi_pinctrl_groups[] = {
+static const struct lpi_pingroup sdm660_lpi_pinctrl_groups[] = {
 	LPI_PINGROUP_OFFSET(0, LPI_NO_SLEW, _, _, _, _, 0x0000),
 	LPI_PINGROUP_OFFSET(1, LPI_NO_SLEW, _, _, _, _, 0x1000),
 	LPI_PINGROUP_OFFSET(2, LPI_NO_SLEW, _, _, _, _, 0x2000),
@@ -113,7 +113,7 @@ const struct lpi_pingroup sdm660_lpi_pinctrl_groups[] = {
 	LPI_PINGROUP_OFFSET(31, LPI_NO_SLEW, _, _, _, _, 0xb010),
 };
 
-const struct lpi_function sdm660_lpi_pinctrl_functions[] = {
+static const struct lpi_function sdm660_lpi_pinctrl_functions[] = {
 	LPI_FUNCTION(comp_rx),
 	LPI_FUNCTION(dmic1_clk),
 	LPI_FUNCTION(dmic1_data),
-- 
2.51.0


