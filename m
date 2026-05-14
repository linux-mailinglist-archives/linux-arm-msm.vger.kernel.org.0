Return-Path: <linux-arm-msm+bounces-107633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMNjF/DXBWqacAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:10:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 994F2542CFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 54B60302C612
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2A43E51E3;
	Thu, 14 May 2026 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJiTEgzL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZaQ50cq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551163FB040
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767561; cv=none; b=kPbQSoq5joGlXQSNP1xkvi+5S0TM1dbRMMLfJ7F8M1xxu5UEM/UhypskqiTd5K3oXoeQDHTQQZ7Toka2ivmxky6zRt95lcpr1MB+5aByivpR7oYig/EUOcSRF+bX/YbcxXSkJmoiIq2V8TMVZA2rMmkJ/lQhk94CnjwuWva7D2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767561; c=relaxed/simple;
	bh=YYCazvsWH0u/YKpV8nDW8hI1WmtLQ0wKmtu7MfpUyw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uY+37ynm0wZrsaGS97akVg6XsZ3865Q/gXXt3w8Y3Mn1ophbNL+ZCZIMjNjkb0DLeuFAdrMRJ6sBIWQWqvM6l31Hf9wScqRXBe2HBYEB5SOFXlmklx5aY60k4eqLaZFavTXdcjz77dLDo19ziSz0On2VDVeFJLJbGn2BitaRqxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJiTEgzL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZaQ50cq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBecS83891454
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPRbwdC9a7RlxH61dFg47VuFdbqRKCRaZ74wu5DF2go=; b=pJiTEgzLuxGGzOWJ
	hNl58XbN/nvd2Ng1cvDrfedAFw4KVNsgzv/kdVBzKcoaQP6zY0/KviVlPr7JFlqK
	6f5Ok9f9Sv7JGBqreEtWXpmr1lrq8ozep2hHS+gTDvXwYgv6gb6Azw8ken+sWLDH
	8VhsXi8E+4E2Aslh3iaikqCN/OkTZx3kU6Vs5Kdzda/JiyKaIdc+eHmcbozr8CX7
	jf3PSf12ePkJeTl4//jomsffSK1mVEuN1HNA6RuOkGzh4JJpGr5ESMnyLDD+RxkN
	NDcdFrcgWKC2pTIC87X+4ka6RmJKrCM6Ei+Ukkiney8Gku0Eu933uKjX8rZd1TCt
	f8t1Yg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tv9y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:05:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365faf6006dso9449759a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778767559; x=1779372359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPRbwdC9a7RlxH61dFg47VuFdbqRKCRaZ74wu5DF2go=;
        b=CZaQ50cqDnXobYkGhD90N7NQz0YqYqKnRml7ZogDeWyqHOnEtuMtP/u3brZpKgKIAM
         Y2GqwVv/0WXNeeITKaywDKCrEsI3pEiuFIDuJ4jD+hlBzeuJv+kuNUnOSoUfGyjDYA+h
         k+GG2JWHaSUmmGngx07lpL8VWw3/D7STaGHrQxIRg7DlmeMmEvnymSFvbnrCJX5ukXh4
         um8V/7lucAQv6bvYp93GnVeaU+to9vFWm1mwBiJeCvR4sJBkDo7G2jreJ3s32VvC/tgx
         24tsrllysbd3w1xy9zf6BNBiPRsEPvzeeNd9v+4UD/8tKqeF0JUZHxHr1Pg6G8nB+z8B
         HRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778767559; x=1779372359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bPRbwdC9a7RlxH61dFg47VuFdbqRKCRaZ74wu5DF2go=;
        b=rA7Lq3A6FCs722xREBIpiQWeQRjDkxB0HYEGBOb5JR65T14a60OaKHrufuxd6xrXZV
         neko+XcM3up5s1f01iBsMpCFe7Xhrz7DaYQvdiT6192t5gQoZPpFNeGATbUv+28xW6Um
         85dnsKpfZuQKA/FNB+L0F7skAki3S6YaglvQCYjPCe4bbk6K4xTP4ykFQ6iqIMOTeLjz
         V0jQrmSW6unrAUYuetBmS+z11c1tE9pOTKhkh6A7Kny7jbi7sjriLYc7Hw3+HLFdZaHo
         LP3AM05DF8vGhPtsKPi+VhNiu/aE9zACNTEbzwOgwEaZzennO4gEYASjCufESXUW6j/R
         3EHA==
X-Gm-Message-State: AOJu0YygcwR8MpF+ZRX6c5HfvHQRuNXcoTi8sh3Sort+ZtxIuRFW2n18
	hyyNuogzZmrKkjnf6aYxyRcHxm0TFripWm6EH/zoXFnx16PfoCRljJ8SEp5DAe67RenIG1tzvpr
	NS/J+DZC3A5p6EE4P7XKnqHVlE/Q4IldBZfDKAltjnfln0JlV5wfdCAusX6qpifqFIDWeB3TE16
	A=
X-Gm-Gg: Acq92OFIfXfEc/iJ+cEarJOaRRO/523BNAdtSC8px9a7uscbmBXznPVmKtUVUO/YIG+
	6s2meO2LtiIq7ewd0bSxhlLNyziWWD4PJtKvVv9bV7xonQF6vtluWxalpwdO11smpj8ft72v/6N
	F3VbiT2Xl8f3ZGXy164dvJvUeI/S4vh4WulwX5WPM+5yakd23FPSaFkjH7jsGGOmWu7UrT9L/36
	2nikqydfh+c2mcLR/tA1MeuJbttlfYq+FqIQ7eHVKb+C/v9n+Pr+tR2aB637ZqXycwCFG20DwtN
	N386Sf1omqSXOia5jpjo/P0CQzD0jiXopWbrhaPUirpsS0V+r2v5GEuzKy/b4y/gQ50N9NPpZ1q
	Ujrh2HP3fPnS+bRT+160txF94NtsAv9+wHfFtHxLOLy9+e556Lk8=
X-Received: by 2002:a17:90b:5645:b0:368:119b:be07 with SMTP id 98e67ed59e1d1-368f3e5cc58mr9421988a91.18.1778767558500;
        Thu, 14 May 2026 07:05:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5645:b0:368:119b:be07 with SMTP id 98e67ed59e1d1-368f3e5cc58mr9421942a91.18.1778767557982;
        Thu, 14 May 2026 07:05:57 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36928a8c1fbsm1502813a91.4.2026.05.14.07.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:05:57 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:35:30 +0530
Subject: [PATCH v2 2/2] soc: qcom: rpmpd: Add Shikra RPM Power Domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-add_rpmpd_shikra-v2-2-20bbd37592b0@oss.qualcomm.com>
References: <20260514-add_rpmpd_shikra-v2-0-20bbd37592b0@oss.qualcomm.com>
In-Reply-To: <20260514-add_rpmpd_shikra-v2-0-20bbd37592b0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767543; l=1635;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=YYCazvsWH0u/YKpV8nDW8hI1WmtLQ0wKmtu7MfpUyw0=;
 b=hRf85towWi4TbgKAEmV7/RXaHl+yBGZ17GTRjnmxA/Hk8PGSuk7zj4BFm1NFohf9FAqPoVpOo
 gS5hgt+pFTpBaT47m3UJAKilUFS7iy4G46SLRGbDcpcRAigRRXqndSr
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a05d6c7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ykd6rPgU8ptz3_yXT8wA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MiBTYWx0ZWRfX3oGu/CXY7KqP
 j6jp/Ph1nhisRySi+XGIqqTAd1WIFi7qxNMwIEn4Kvdljw2fMs3Id5LtdAs+P42cFjolHADMcio
 MNg1DJJzEnFWbXSDK5zG1P6WZEJWJ7ic4Tsl4YayNNCy3ikHR/pb/CVSLxkgGjxvLs8tq96rF8u
 xiEnXUN38VY3m2O4mLdgxMYPdCVPXnvapXlRalBV7XIyl604kAzRqrVq3NJ2JmmweTZjKEB3Kb6
 9KGVeZ5vfZQ3JTGw/1Y14Xytfj9oUSmgKgQgZWbez3tNYSpFyczn07aVwMWaXpFhsO2j4u1Xhb3
 +CC+1yfct7kqXW8EfmPIcXvTp4Q7aZNUQQudtLwSw6EHGUbeUX+cM0NKBGJvv18poJfHv/b8rFV
 gVMQaR0zWbWRfEND9e3FOknJK/4iYVhWyvY8q9aLqxU/kktsQ5JZkHPAlcpABMYbIruqZ69D44Y
 APcQcgIy8p6hp2qViuQ==
X-Proofpoint-ORIG-GUID: uZfKvWX61J8I2NOZANTvwxuAwiqqhS9Y
X-Proofpoint-GUID: uZfKvWX61J8I2NOZANTvwxuAwiqqhS9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140142
X-Rspamd-Queue-Id: 994F2542CFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107633-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add RPM power domain support for Shikra, reusing SM6125 power
domains with RPM_SMD_LEVEL_TURBO_NO_CPR as the max state.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v2:
 - Collected Reviewed-by tag.
 - reused SM6125 power domains as suggested by Konrad Dybcio.
---
 drivers/pmdomain/qcom/rpmpd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
index 15a11ff282c3f86b1e86c6604d165e297620f6cf..5f55fc791131a1675cbc1941b90e5dd07ac59cca 100644
--- a/drivers/pmdomain/qcom/rpmpd.c
+++ b/drivers/pmdomain/qcom/rpmpd.c
@@ -895,6 +895,12 @@ static const struct rpmpd_desc sm6125_desc = {
 	.max_state = RPM_SMD_LEVEL_BINNING,
 };
 
+static const struct rpmpd_desc shikra_desc = {
+	.rpmpds = sm6125_rpmpds,
+	.num_pds = ARRAY_SIZE(sm6125_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO_NO_CPR,
+};
+
 static struct rpmpd *sm6375_rpmpds[] = {
 	[SM6375_VDDCX] =	&cx_rwcx0_lvl,
 	[SM6375_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
@@ -949,6 +955,7 @@ static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ .compatible = "qcom,qm215-rpmpd", .data = &qm215_desc },
 	{ .compatible = "qcom,sdm660-rpmpd", .data = &sdm660_desc },
+	{ .compatible = "qcom,shikra-rpmpd", .data = &shikra_desc },
 	{ .compatible = "qcom,sm6115-rpmpd", .data = &sm6115_desc },
 	{ .compatible = "qcom,sm6125-rpmpd", .data = &sm6125_desc },
 	{ .compatible = "qcom,sm6375-rpmpd", .data = &sm6375_desc },

-- 
2.34.1


