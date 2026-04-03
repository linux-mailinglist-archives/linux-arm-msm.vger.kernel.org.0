Return-Path: <linux-arm-msm+bounces-101597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBI4D1sNz2kNsgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:44:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E40B438F9E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4331931057F5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 00:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0944823D7F4;
	Fri,  3 Apr 2026 00:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yc42GMmm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fe99twii"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701A9267714
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 00:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775176580; cv=none; b=gk3mH37bhksWhnSDV+NY/7L4OghKt8dEnfBVKlnxjacQynEUUUKCgLcli6q6ndQ/is1yZQumvCw06Q6I57X0HF+XIvjw6On/ytvP5VzgdefHPSV9T7SJ9pPCrULJoRSAPamMnJbNhSHotn+wlUv2JU/MAJgxai1XOUy2MkeDJ40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775176580; c=relaxed/simple;
	bh=DRT2gIEqEs+RAsIvgPMQRwWOyVMEY7rMCZ4VlFwdz1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YSvNQXKBKT1I0rgF6vUPu0rHeNBVe/Uc/KlRMfkq5PS2tKgE5kSywoPICUuv4baN4QUy+WhT6iWdrXFBPSGOnA0LcK6MeEuEg1wCMr0zMUkh5DozzBLgu+MWfY+moSgGEN4VZwF+idjZVv65MfGsWfUAaXEARGgANeUZkVq36HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yc42GMmm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fe99twii; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632I2E4d3772552
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 00:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zivnovxSu9T37vh7fCot6swCASthFxgNrxcW8uiHS4I=; b=Yc42GMmmTzaKkNeI
	6U9kvCP20m5K6sXNuPCO4cH51sjTNnXzbteWLb3rBZMZvaeFDnTHXjVeaNhNbiSn
	zkaf5MT7yYT6/S4chbq5XtjhsFmcr+RuSlXlM2++VlYOaSDZXvRQUF5rnBb4F/Nx
	9kPxHFuVE4k5Gj4VECyadn3JU2gaEAIDmQ6MPS4Qd0W7Zez4zNaGlQF2/KYqdJa9
	Qti+ctqSrZILpRmhYwwfSsOUX5+Uqf1OKGBpM+qV6c8wra2tzu/kKy7qEjd0FZfQ
	6pXolpth2YfD6G1eWdfWTOGl1E/6Dv4MudO3iRAJrviNpdJZ6QAYHiKM5TrrrywH
	BvhWrw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs1022-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 00:36:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-127337c8e52so1074303c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 17:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775176577; x=1775781377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zivnovxSu9T37vh7fCot6swCASthFxgNrxcW8uiHS4I=;
        b=Fe99twii92Kn6QaSPWstvE3oAY8/nbez0Pkchb2vOTj9WeiL+1bEskBnpCjQYnLJwV
         iaacFDpIJ6eTvEz0PhiTD6zkFAxpRx2PN9Fg/pD+YU1fLaKi4s3CzBZZOV6z5YRqaB6s
         7ta4yYVo0lMszb5cwn7zMT3t/OxiRQnykph78p3nU1JGWTpiODKZRP9pBFCNyTuis+89
         Cv+6N5pFaLpnR8zYyHSm+oDEWdr3Tj+S1Ss9nlEO6chELVSKzmzfsIzKNrgxewrCvRla
         343fRaeJtQxLKmzoei+Hbgk2i9dgyd+ukN6UtWky4qILfI6otB0UYdzLcP6L/M5AGH66
         S5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775176577; x=1775781377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zivnovxSu9T37vh7fCot6swCASthFxgNrxcW8uiHS4I=;
        b=UdzWR2o8medJ6+d6LiP6bI94iquTZoNwXXeI9dvOeSm+5Xzl0dgPwC46Z8qAVGVwqg
         zHywkLG0Au9cAkaG8tz5rvmDst698MMx7nJxzGybF6c+lvmtdPYJgzp5HvmFyS4DFwHh
         RT3Sl0yItqkIjvImAIHVWgegeEaTDsPFURDmOIfjXgXPP2TELbLjFyk3sXQIaeVpElm9
         z+nQ+U1j9kuKjPvGbirQabPcW3ivoWNjt3SgpXxWt9UUP6Dr94CfYkDkRpvStHeuA0I1
         TuWuxsgSZEEtepi9Tz2z+NZPWsI3XPvcWGz26w6Vcae0fCvRmqwH5Su+7Wlk6ucMfjxu
         5q0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuFm5uo/5HddTEajb+y0DxMrQbY9o4KxDRsTeUYd47hZuI9qg005tJceUwpShQ+x5Of3NFJi/QBr8ZdEbw@vger.kernel.org
X-Gm-Message-State: AOJu0YwNs8cb4CDPTFGndtnCpuh30AS3BEYr7OM16N80L+6OxBKxteBG
	FiBxjkLz106UhhPh3pRbRtBRqXRDDaH07QYLI/bhFV7CVrzbCZOUXSK8smElqWOPkpBalmDq3/O
	41OPpOrHRJefoMnd5exzTpdWTdbIA4VuNUpwyFtjeAk/0NB7oOzUuJXGjgGmyaU2CdRaK
X-Gm-Gg: ATEYQzz7f5m95cRuwB8EsZOn4CJsM6YAEvo0zXCUq8UTEjy0VVphYMdZXdV1U9RRtyM
	fStDqkyWvhnCQIl6K7DotZ8R8AofWip8SS3mfCvYRkbaMIVLGHxNCwwGvV98bc3vfnPT27NxHLb
	T5tFD+mbeeiGuZW2D9FIEflrKa92SuO9d2HUeXuhjc1FUjzPfySZsJLmjGW7NuvMkgEEycl5IEf
	gYrziWsIWaW77vEm3J8/xYPjo7FYoFeAY/l7S1xb0Rdctji7kWpsb20tPlC00EBlwS1liZB+3AT
	CdhdTKSaQb7JkEp1bqXAkOISkDMArJM3dnzCdxehNeNc1b94RjTCE+UwyCUsXepHZy83yh40ddx
	+4oOrU/KbH/AcoVmldZzfnt1uRpzKpozsb+LfPJ2INIcmCPW5kgGkTEjBczIAX1p7W4S8s8uNkA
	==
X-Received: by 2002:a05:7022:221c:b0:128:d438:cad with SMTP id a92af1059eb24-12bfb74c7ecmr646169c88.18.1775176577417;
        Thu, 02 Apr 2026 17:36:17 -0700 (PDT)
X-Received: by 2002:a05:7022:221c:b0:128:d438:cad with SMTP id a92af1059eb24-12bfb74c7ecmr646148c88.18.1775176576915;
        Thu, 02 Apr 2026 17:36:16 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm6290550c88.0.2026.04.02.17.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:36:16 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 17:35:22 -0700
Subject: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add power domains for Hawi
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-haw-rpmhpd-v2-2-2bce0767f2ca@oss.qualcomm.com>
References: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
In-Reply-To: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775176574; l=2519;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=DRT2gIEqEs+RAsIvgPMQRwWOyVMEY7rMCZ4VlFwdz1I=;
 b=/Me+lrh5aFjWOFlNIOkr9UVd2ZwEogonrnK/9OFGRG56CyynREsMhJlMa7cHVPnVXPUO6mEMO
 JCbVaDvISNVBcCnQ/tgpEv/VlZVyO9QsdkxUNoc6WC842w3Euxb+7nP
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: Pc-shRjo6-91l0RV6RPfadbrtNMS2tGm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwMyBTYWx0ZWRfX0uavLrgv7RQX
 7Q/+Yj4K4Oc+weEY+6M3CYMB8qXeOMxdy88gKpd7SP34mlvHGSZKYQ04xs1n7h6WSDL6IX9KfCv
 QuHijFfm+pkXO9H3Ik07wctCPzdq8WRZYyp+xLbsiTptxDhcnx2kr5yvZpgjupHw/SZVzcVJCvu
 RMAoemfEA8o5SCWx5yTdfA+nCoePevz6Af9t2jhx3N/bX3bj8d4U7E4A49Mu6tNIIzKzR31CMgS
 MLCsoaIiDvrhG4LYvQYpvN/XGj/CVzkT3tQiv7ltr+a/GGiFLn+TmAMsyxVb78JxTaFJlc/1ZIa
 nRWRphnSrUtZY19qTwB5Xac7y7LFIXvTNXV5K5HlJy2Q0fGHljdAGjE3rWG4VkjcuyGseG3jNso
 1RJV1PBrLE/jMaJYqoFlGK2OCHhKPRLPqXYiDzyLDIcSd8hhIF+JJuB7tVhuIj5ZQahlkLC3uOR
 LsCHmpZLKGgzhYbuQ/Q==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69cf0b82 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dVseYE-P37VojbQfzSsA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: Pc-shRjo6-91l0RV6RPfadbrtNMS2tGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030003
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-101597-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E40B438F9E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the RPMh power domains required for the Hawi SoC. This includes
new definitions for domains supplying specific hardware components:
- DCX: supplies VDD_DISP
- GBX: supplies VDD_GFX_BX

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 19849703be4a..f5ae2a63765d 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -102,11 +102,21 @@ static struct rpmhpd cx_ao_w_mx_parent = {
 	.res_name = "cx.lvl",
 };
 
+static struct rpmhpd dcx = {
+	.pd = { .name = "dcx", },
+	.res_name = "dcx.lvl",
+};
+
 static struct rpmhpd ebi = {
 	.pd = { .name = "ebi", },
 	.res_name = "ebi.lvl",
 };
 
+static struct rpmhpd gbx = {
+	.pd = { .name = "gbx", },
+	.res_name = "gbx.lvl",
+};
+
 static struct rpmhpd gfx = {
 	.pd = { .name = "gfx", },
 	.res_name = "gfx.lvl",
@@ -622,6 +632,33 @@ static const struct rpmhpd_desc kaanapali_desc = {
 	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
 };
 
+/* Hawi RPMH powerdomains */
+static struct rpmhpd *hawi_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_DCX] = &dcx,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GBX] = &gbx,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_GMXC] = &gmxc,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MMCX] = &mmcx,
+	[RPMHPD_MMCX_AO] = &mmcx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_NSP] = &nsp,
+	[RPMHPD_NSP2] = &nsp2,
+};
+
+static const struct rpmhpd_desc hawi_desc = {
+	.rpmhpds = hawi_rpmhpds,
+	.num_pds = ARRAY_SIZE(hawi_rpmhpds),
+};
+
 /* QDU1000/QRU1000 RPMH powerdomains */
 static struct rpmhpd *qdu1000_rpmhpds[] = {
 	[QDU1000_CX] = &cx,
@@ -796,6 +833,7 @@ static const struct rpmhpd_desc qcs615_desc = {
 
 static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
+	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0


