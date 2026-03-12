Return-Path: <linux-arm-msm+bounces-97241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPUyArvAsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:33:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD37272AA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F117305BC96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51913CE4AA;
	Thu, 12 Mar 2026 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhY6ts+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="daC4EILN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FADC3C73E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322210; cv=none; b=epq9b3ea6r6auAettkVPjo20HYBUFwapYW44ercuzzG8RnpqgYufYN5hL1FjffborosjeGfdKFgG7APaSh0893pkDBHr5yAtd+ExlXXX+isLJDk2/4aIYXxma4+jDPcOWYO3bFfFl21sjMwFIS47sFzIN4i05Uk0PCL2NXwJCnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322210; c=relaxed/simple;
	bh=Nxn0ECja9MOevPIO6hY4R3LL49hKUqZQoSFEB/QFA80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t67yQ8RVKr+ocs9zN3k3TAm7i7lPwUHgHuOuqiDuWPBciWw8JAVZtZ0DDWJ6dgsXFzvqWY57CYVJ2UMN93MB/QJtS1UgGShJx2gQ6YVjsnIiL64FhH0bL53uX2WQvFHr+KUE0DwAlfUAq2iErCi81OwccI9K+XBRRuFQlmi8qCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhY6ts+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=daC4EILN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CA4lWI1756251
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGml7biXVVWjOOR6Y1Gdb7Ld32RnBgrsNfRj6o0i/eM=; b=YhY6ts+Qkdwhw/Dk
	cJpeM8YDspD5JZ9ozkij7iRc/SaojpmJ6MxETPtVGCx8B1hSeYimaLFNejUjsryp
	biEtdi4IqSqpzv4rN2vlDulDc1hexMwaGHuAfLZhowDfjb/wPyEOy57Jfv7gIZsM
	mCErwm/NVxCWVlhfMQcqABYB/9JX6vEURkRH9uNcQyu9A9QlwlOxkUq4M1mo97YZ
	Fp7GJRe95uArqnBG+j4yw4zQyDqhUWWynVemqRDeXK1n9/O4UVDoE8Ys5WQjNmAj
	xq0OpLN7s/6MIu8LF5us29w9ExUuS4ADqks106Dt43ICSumARy9Ee85djW4wKoxz
	PC1Tsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53j6w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb0595def4so831209185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322207; x=1773927007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGml7biXVVWjOOR6Y1Gdb7Ld32RnBgrsNfRj6o0i/eM=;
        b=daC4EILNrfs7WEYYIhWzb3cKURJ9RKa+6GAo7uVUJV2/8HOu6KUoputLixRa919g+V
         mt1UZBTjY70PRYlkDpE6VSaRD6At9r06cbZOtTo8TdZvR2S4hbkcfGgz/k9YEYJVWRVZ
         9RsF22Gt/FfyNCe50hLjsdZ7ktNo4//GFpBFMry0OXvyef5Y0F0efElsumO+e/RDDW63
         ifX/8MGPinmghEGDWf/x00AhSg7uhBLHwDvObm73pK5x2rwZgHRq+lj2CduDdU/rs82I
         yLmA9j+Sq4eOTyscM8N6Beb/tg1/Y7R9+cyqZeDqUyu/l+NSNnL+ahbMR63Fx64SsDkS
         sllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322207; x=1773927007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HGml7biXVVWjOOR6Y1Gdb7Ld32RnBgrsNfRj6o0i/eM=;
        b=FMifp7I2ketrHyp7LDPbWEP1Y+GQziJZFiooU1GzdIeSml+0H7X8Anh4mCyrKQU21q
         IOIA4jfI9sLQCYR5A/7StfsYP/vdYiCDoHLHE9m+Gu4npHs8SRWLsOirpdM9Ns0PCjjY
         n0hhVxJ+xRYVvUAOpsQoZrmrlWE/Zl7PxzwQB3YDYVH1XfqM1VPT0D3XHVW9rPAHLjM9
         5rgDbXA8T8kqkoVl8DPhqQN9L6q4Ob5MYdOadF2OrZ4KtP2WnSoAO/e7lG9UtSckA7Ai
         I81+/zP2A6qx3VYPldgcE3DQjv092kkwKOdKXlaRjmbAO6SMkxHi57swgEiFbIGfFvuK
         346g==
X-Gm-Message-State: AOJu0Yyw2ZG5g4Y3p0+PFNmsy8W/QcVzh3qMxEK/+3sNOYlRx0PT5ke2
	ZneWcLixoFJiHEkCxH7MGrjJsgKkMahYWMlPa0Rawa2R/vT+nGvHjDOhBKs5mH2hFxoZDsmRi98
	qVywVF5LEXzvGoY0+3IR7O+ApGjkVA6E9cbBDcbTtuZEc2bipcAyksCkYMYsI34IZtJI8
X-Gm-Gg: ATEYQzyIYhPEsPzb96EA4YmQCk1R1j3Oqgwe+tU1yC5Knk3ZK+NiyF9xdwm2/jiuZ71
	W1HGFVMRgm/xRjf3nPGelxLFmsCrmFCp5Vmxk8E8TmOzm2i7OPWb+qsFwZuDsGrqIhzGkoqiPgj
	hvvrMLstqCfjaW1T5BYwZDOVj43WvQ9W+TZCmASoIlfGMGoWZp9oFeUQhGHooThqxCcyO7m1rSL
	x16kQlQGvXhHja2CUzaVRf5rnFtmlGdluiRLztajFNjkqd0yel0XsXZ4Jll1+otEQHB9eephrdX
	bG9SzAXus4SO9jq5w/x/0+x8HSBYPm0rcVJCXmqifZN0TK0//GlvZtXhmUfjBKpZbhYBwzvElg1
	iZNgs0ytM8CwUagu9Cygbsz6R31wfu8BSimuqdI0cYGt+pYJr8sRTxeeepPW9yewRC2skuZre8w
	GZfPwMyKFZAiAaXMFnhRNXnZl2nHxc0sewhTI=
X-Received: by 2002:a05:620a:298a:b0:8cd:8ce4:c0ad with SMTP id af79cd13be357-8cdaa84c2demr403217785a.22.1773322207315;
        Thu, 12 Mar 2026 06:30:07 -0700 (PDT)
X-Received: by 2002:a05:620a:298a:b0:8cd:8ce4:c0ad with SMTP id af79cd13be357-8cdaa84c2demr403212385a.22.1773322206855;
        Thu, 12 Mar 2026 06:30:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:30:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:42 +0200
Subject: [PATCH v3 21/27] soc: qcom: ubwc: set min_acc length to 64 for all
 UBWC 1.0 targets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-21-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Nxn0ECja9MOevPIO6hY4R3LL49hKUqZQoSFEB/QFA80=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+3byjVkNF3y3+4p3LyoypV4BXqUSQ8HNv8i
 i0jXZ1Z7rWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/twAKCRCLPIo+Aiko
 1X/rB/98/Et8LZv7iT0r5hUpUVKze5Hwk4RvgpuE135qe4LNIXOyyXLVVtvTmw27099CiZOqkJM
 nJbzHxTW7/If+0H+yQE+XVIcCdWawVXAaImmQIpSAkOeG4vnoHE/OPqdRlq6koaAPTcmY1qa8Nc
 9lMW554ta1i2lYklFFEXOEQXWXqDG0no7CxRkg8J4Tw2Ymwv2J0MBkWVenAYiXUedOj9fDSPcbB
 Wm1dfdpQsMkmi1ExiycJi8Dm/O348VRVDSpiSg5uJzDHqL5+ubdid8aC1ywwFUkfa1Az0UwjE9Y
 ZUR5FNOsxqZRtDuzw2trWXC1kU+zwo8MFMmrGrdDlLX6R7bM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b2bfdf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=5ZsywSmvcCt_NWGkcqUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfXz3GZMBMZpzzK
 HPpwmdnmA/+n/thPIj1Rslp1sQ/3ucd3J+qdlOD3qFd8OhxLJOwqDUa8MRS5tALZJWlKJtcvxM4
 KZIxLYOEdDmisVRwtReyYgGXxsF3JeQkrzc12cgLzmAzzCAL/onVVcYuAyPRWnKjkMvtD0jJXQ2
 Ur8JCxC9f3+ZeogpDtvSRs0hJUQjrkO3m20aKphdWbo5QXHvU0ynDZZP/jQHItAj/W/2JQ3wNsA
 fIqBwJtvoeS4y3xEyAE3MCeGhltlVzmoYTW4zqO/YyyCVBfUWyWI7KCSTpEpRYAYRETjuyMt1aA
 IThgLivKMtzZvJlpmewqPWG70UIG5+Z7hQj1eEroSpyqB93+cS8RnFcqlSxXeiu9Krx7Ioo4Tk1
 lP09WxoxjTFoU3mH5OEmM+PGDijNOVea2Qvu2SO9a2V+y5q+rAU3q6s1lNtmJgKwInn+qDjNcqq
 6eno+Tpfu5x8D2F7+nQ==
X-Proofpoint-GUID: 01eCfro4lUZoBok_QaSrxyKbsc7IPMXz
X-Proofpoint-ORIG-GUID: 01eCfro4lUZoBok_QaSrxyKbsc7IPMXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97241-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAD37272AA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the documentation, the MAL should be set for all UBWC 1.0
targets, no matter what is the version of the UBWC decoders are present
on the device. The helper comes from DPU / GPU world, where there was no
separate bit to control MAL before UBWC 2.0. As the helper is now being
used by other drivers too, correct the helper to return the correct MAL
value (Iris doesn't support UBWC 1.0 devices for now, so there is no
changes of the behaviour).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 83d2c2a7116c..0b5aa9d0343b 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -75,14 +75,9 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
-/*
- * This is the best guess, based on the MDSS driver, which worked so far.
- */
 static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->ubwc_enc_version == UBWC_1_0 &&
-		(cfg->ubwc_dec_version == UBWC_2_0 ||
-		 cfg->ubwc_dec_version == UBWC_3_0);
+	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
 static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


