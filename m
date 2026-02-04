Return-Path: <linux-arm-msm+bounces-91743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CA8ZFsyagmkzWwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 02:03:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E433E03B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 02:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FED13121DA9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 01:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C553C26F46F;
	Wed,  4 Feb 2026 01:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFsNTKZ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRnSdgyj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1996B2522A7
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 01:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166809; cv=none; b=LiaS5Et/QAYWG1Z8dG74tMjWRYd73h32dCg8M0HSMmDUqMdZ1z/MIWIbMqBQY3yCM30rGTtybQLUeBN5tJK/qiE0ucItDZJpvsMHzfS+SCHoQ/9/rEA6Gvw53k6RMFVXRZuArAZg7wfGre6bBj9I/uLISAZSghvNyLJT9edlkuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166809; c=relaxed/simple;
	bh=8xvpoZBcwaB5XEQ8fd9wbf7am8qskE/GNdqJO+VC6E4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QG7MxwhBNl/ZjvsjVIDtBkqzCFNu7eYLodUB5Ralxb89npgfcR+To49lonFXK0vrwWIEvvga0gCkbCBO/c7ASL75sHRuaT3v1+PpY7bZ5HZaN835iYe+SJ7xin11EPZ1Vn/j6MN6vgDGEqMMZfmhImmHMmrYVWdeuGitlwvxy6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFsNTKZ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRnSdgyj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613ImKLa2732622
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 01:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ce+ofkwDb44AUy52OKXawE+oRbp/+IIXGPOlNxXAeT0=; b=SFsNTKZ1Sg0jUIYm
	ces9VYwnnTdfuJQxsso2STOuEIEG6eLIfZ2XxUtks4PDNrC9YAKhzgzT0alxdLzs
	8yA0kiflHcseX6Rc+NMMQr94Ji7/offHlcdIAM5ZunpXQciJAYpzB966lEx/3rk8
	3JvZLQ5szTZ9o6V7Ny3Uc39Pgp1ZeK0c4JFGjOQH7d4416/CZJ8wW4cxDYhQwPAm
	swh20HujtkT+JQbui6PRq23d3ycPemLbeUgEoJKid8r5NhY61QQ4rbo31+sMp0Fb
	ouXWkhPkxYIri3PMGyXwOR5oaX+CMGEFADjQhNowMBDbvJcOkE/ICgij/nETWCkX
	ezCTsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exjjs6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 01:00:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71156fe09so560955285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 17:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770166806; x=1770771606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ce+ofkwDb44AUy52OKXawE+oRbp/+IIXGPOlNxXAeT0=;
        b=XRnSdgyjvE/WhtLpNkaFgJSmsSI1jEHN/GkBSx5vMcp6Q6f2R7QhfUhInA9vosqbH2
         qEaIfpYnSlCbV4yZLrk2oJkaqWys2z3gduNCw7MbJQQdmuj7wCDnSQBws/jfD5sWV70X
         47b7HdJGHoHttOQZsqMaprIHY+z3zyKjcHuM6JFLEspmPWUbJrWNHP7tBTDQpTUJ0wjc
         IHIV46384IqD8fHcxWQIjkwr/85Zzyi2Vd9/0iaoCvHaPALRPZcsOdHw6T9zhKRygy6s
         xBGyGQhyFL328hd7blEw4kLT3z6SBLwX0WNmwjau3Ja5ivT/2YGBUHveYcdyUhh4h65v
         6LSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166806; x=1770771606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ce+ofkwDb44AUy52OKXawE+oRbp/+IIXGPOlNxXAeT0=;
        b=fqoEUjsOJZ6JqLWZWm1JL8mCC9kn4jDbwEHn0ZPUuCrbODvtGJZABdRpn9bAwEhx8s
         GJVjDQqVbblXrxQ/bTw4uwy/icpbvwiBCWXpFG1iDASWKquG0H5ZTy7JCFmzWls+oA/r
         aj0cTb9oKFnaU4bldgZ27IsC/cAxGtD/KfT6UWgZNIk7//zOefzpzTXruRdPpHDH61ZT
         88x3xeoHR/1+pkaTwvo4OgemIwy1EbJM6eVDiQtMzqTzgU94BA1xrCNSIMvBDnjBtg1D
         IWAC3RPSeoMqWzbJEVYb6BCJ+DoNs8fhksJhe/UrA5kFWnAPJ/0QGTEgYxmOxU3okftw
         S3JQ==
X-Gm-Message-State: AOJu0YyfBskwM+ekAjtZbgHSMT8J9dQ4Yb/dyGKfn6Ayqh4xuzX8pqSP
	Hi4KcPuYl3Zp99D00CK4IOow1JMpDKS/FTHui2WvGmXHgajaC4XTt8YZ41ZmnqWN070RagHeQFE
	JU6V3uhcrafIqss3GCkf201uDzKLk6mGPYf/vprQFhsCkpmag5P3NAjPO2rA0bXoZlhgs
X-Gm-Gg: AZuq6aJ0jem6SwQ2oft9iOkz44/14SWX3MV3yqHYhQGI4HjB9Aqa6eyGi9ivzmePPA4
	q9wl4omXTeyDzsf/au+vZx8ovlrT2r5SjB0EpipmYBeQJgvom+IgCnfwLiyPEqQQK01NziiNIZh
	awL8NZ0+4Cpi7xTU1YwFVEydYSM0BYAZElQhi43LS8mpyNA2chEKmhlblkXxwBYphOUZyX+s4he
	5Av4hpCfGOTEcn2WtNB+yHz1oxccQscgSK7iC8grpv+gFapL5fRbS/UZ7ZKjx52+jGBaQ6Dho9F
	L0Hy91d3fvV9UnpVF18aX7XFyL6c3hhb+hDOEjGj9+n3GtvZGtYLt3zJ3fcH0K0s2qqJukNzqzR
	c9Z/IvKWYU9Hmun4idh8/wCgOrtJVkckpHiHSHRcESkArcy1MBlq9OPIaKq0JAmMxkCJrWnPlTP
	bUxxJcBml2Iq/cdTmoF49kYfQ=
X-Received: by 2002:a05:620a:d84:b0:8c7:eb5:8528 with SMTP id af79cd13be357-8ca2f83a844mr199417785a.1.1770166806448;
        Tue, 03 Feb 2026 17:00:06 -0800 (PST)
X-Received: by 2002:a05:620a:d84:b0:8c7:eb5:8528 with SMTP id af79cd13be357-8ca2f83a844mr199411585a.1.1770166805883;
        Tue, 03 Feb 2026 17:00:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff563sm253405e87.1.2026.02.03.17.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 17:00:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 02:59:54 +0200
Subject: [PATCH v3 6/7] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-iris-venus-fix-sm8250-v3-6-70fa68e57f96@oss.qualcomm.com>
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
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8xvpoZBcwaB5XEQ8fd9wbf7am8qskE/GNdqJO+VC6E4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpgpoIiliQCHBS41LWbVO46HJ+9YkHzvwGO0Ae+
 y2qqPQY3k2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYKaCAAKCRCLPIo+Aiko
 1dGIB/9P+DKxN07RhkSeeARLygGwsImpsDAmJNjA2+sl733FQDQbzPnFiHIz4y7qztaU+XY1D0X
 CDkPkOvQTMldVT0TEVjeta63QPY8pyDC9Dx1WXmQXlN84XLGqMlBEU5H69t8q5yisvKD+Y4Q19a
 a9cAyTA8+1S9+u2jnQMDG767zVJ1Em24d7zR+e+N2H3uhEX57nP4rvylviZ39ylCxtWnq77sGd9
 eyWODvJTQuTu+ehnbREiKqBfKCWGGig2lWrlrWAFg2Oq08nGSXioYx6peYAzi3elOgPsr4iN0Ve
 u9UcBJeoACWx9TVvv68mdhAWXgUP+zZ+wWgwHQnf8zG+AE+8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W8c1lBWk c=1 sm=1 tr=0 ts=69829a17 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tBOqMctlXquWO7Kigf0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MrPuojcHlauJRQzeu28NknAub-L--qBl
X-Proofpoint-ORIG-GUID: MrPuojcHlauJRQzeu28NknAub-L--qBl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNCBTYWx0ZWRfXzNs7FgRrPuKp
 buGZiAOv7A62VcNW5B9vjdclzhcKYVZ3R4QNvAY3dPXvS57EiJNKCra7CIIYeDXinTXySrURxTJ
 v7wTvPqUGtT2jM9BBBYeT+0eCuNZTBRYrDMf4bnNp/4YZELSxtzsPL8Y4ahH6/Syk6X7BT2Fee4
 oUSNv6Uy5wjMB3ifZ7Y8egQKXD8f4TNUUAa0KX/nZV9BvxGd/Ybll7h3BKYs13xmLFaa3H7Ljvb
 pmNnmZ1Na9SkjnNXGjbJUEpxZSE7bcos0x0Jj5hLqdhv17mBIpcqsIHewscxvYp/DIU9eLg1BIR
 oJs8pTWqf/W6k6l1Jm0Loxkxaedd5yc7ypcFvIME/Drwsr6dlpZZMUTM+bkp8hya5GrDxqaHfST
 Q89Aab3BVJjZ1/P1ked1f2Xlb3e6XxdNeHHX2O5dHqy6AweHvJV1JcbWvTO+UWNRv/Hx1o5YXeT
 1sjl72CdGNrR+a+zh6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040004
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
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91743-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aa00000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E433E03B4
X-Rspamd-Action: no action

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but,
strangely enough, using MMCX voltage levels.

Add MMCX domain together with the (more correct) MX OPP levels.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 980d6e894b9d..d8be5c1add1b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4321,8 +4321,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4348,22 +4352,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3


