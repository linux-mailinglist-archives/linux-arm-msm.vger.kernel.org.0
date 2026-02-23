Return-Path: <linux-arm-msm+bounces-93676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLNKLFFEnGmRCwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:13:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54789175F24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BE8D308267B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3655365A1B;
	Mon, 23 Feb 2026 12:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K8g3z6r3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSfynZTt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF1536604B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848496; cv=none; b=iQ4tEq9VIBzKD35nwUH9iOL/NNMqiin7+8r10vaukLPhm18UDgHiLooImXf2cXTrISlcbU5XEX9YQhKBPpb0zNYDQ8LrpyhckqYfgYwP6dWAo8KvnWV3hmUvYJxyfqQdMGDC3tvnE4LUtW/Rd78TL/G3U9inbFpRicez6rxKhSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848496; c=relaxed/simple;
	bh=vFx3zcq+G1obITePSUcons2gQA0eqU0zhiapnZAxazE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcDwaMeIOzNpQceVjJR59Z6Xep9HyXuVoRWa3o2oyx+fqIYoCnn/u+vkpteYvyhp6UH+H7DD+aVR3Gv3C1ViNR78cIxZfqZTn/Ft3oOW9A3535lrz/7bcSqAR/EYUYLL5TNWHT8UTpwgnk8FHzdpFblitxGabSgSXbp7i/o7Zhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K8g3z6r3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSfynZTt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYBJ2561292
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/svfk13y7ieSR4ljEyX1tQi0dsjsat1uLMry8M6o+zk=; b=K8g3z6r3kLgozE6J
	tTdfjOOhlrL9y/PtqmKS1nizlYORwqv0hqY4WiZQzxPj73tGLTlqz1WWdW8tJkZD
	WRE/3QMsMm0c6uNAIxHSx6Z35z8b0wjh/zItH5FlncxwbuyBMSu62/pBXvnnf+ik
	3lfiTB1AdMuaztODkCpq0vfb5PTQ1AoZxtiT1F2UO1Lc55KBWtn5R7iPKO+c7vaT
	8B+2IBTNZN/FJAqk/p7NiR5d3acYjqcGGPzUwOLGoHZQ3cWAaRFxHjM2oyl8Q+be
	zSiuyxDThgC4Aw+TppTcOpTpTt4fKYJsTwwlNx6g2iqenMEZoA+Aeh6LrDspdDeE
	jdDwQg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8r881g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:08:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so6573692985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 04:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771848493; x=1772453293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/svfk13y7ieSR4ljEyX1tQi0dsjsat1uLMry8M6o+zk=;
        b=FSfynZTtLKqud0gD6SWC24BsxPHurLNGVToyo9pM7oUQkz1acbRyMOog32tI48RmPb
         3WHoElP9ikDkrKFIZd/mXXIT69dEwfRCBPsRin0HhKwnsZP133kSgE5o/F81AkOkfpyR
         sKZaHvQr576vdp9YX0lhBvg+s3JfqHIPGTnChAGRgUCVkezNMuOsfkX6urtT5sxVzd5/
         kYhKa8DWDXJ2sGTbeKl/lBaux9RNeOOyVJmEwdzPi2ApgwI22jexX1FJWV74mxa0LTBW
         N9etJqgcOxkoADV78DBzBcMZ5IEfmgTZ16Zz+puCxmsCA1j0XKRzKmGKhydEBaFh4VC9
         XTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848493; x=1772453293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/svfk13y7ieSR4ljEyX1tQi0dsjsat1uLMry8M6o+zk=;
        b=JOMTJ1hMxNHK9GJ3pztNhjQWJOOa+poCUGMASlfgyeZMsjUkCRd/uRJ4NwildmrfWZ
         431vVm42w+1vuy/d+IrTOy2bDniEE3cN7z1t1W8Q+D08MhLr5vqeJEoyPae++rr/aC67
         4dT8f0F87+MHD5445GkayqdQRmmWWcixfTZv8eEll5kYzNQMfrIJcBRnXChecsueNSeP
         c/W03JxLGosKYHP4272Rsz7tcbj+kw0fGPMhsP67h2ivHUDAnHCzPy/VF8XmiemY2iTk
         oU2BYgIX5mxxh4jXqL/ReV2L77c7tSJ7NPEzoVDj4VUIUwZCiMjKnqa9cxKW1Q+9ryKt
         daPQ==
X-Gm-Message-State: AOJu0YxuRqgfQgdEP+EMoNLcXRlY+WxuDqZK47jhlwY5EOf9BXhDzbLX
	tZT4Tz/cH5PzSzJNec7K4lufJi+wV5hoPCuI3ctDvMjtzXKMRMzj5bntcNrntQfb/bbGAu54q2C
	Sb3DCC2jnCQoZhP8R4UZTdQyN4pIg9jP3L9rI9C3v/Aoctq5c4wREilNp8HTFBNowfumd
X-Gm-Gg: AZuq6aJQU8TaZFSPcVYI994E41HuCCfyyyYskQbAe1EZLBIPJ8C9THzlXpe3/Gz2upB
	YquGpMMr+GtEwRgiz+posnnuKAybebNMsn+YQWvO19GNLUt0zJZdjmfEK7MHwvdMiBdI5/CeqGG
	WKXLVuwyNwiQa9aFMUHw/dA9HCVyqZb8/uCvzbyMkosczf1O/wEWtzrP+394rXbKWK/ManPdQJ/
	xI2twIRFauiGwLx6JFy9hGTXr2Q43fnDmLsbIj9cFVD/FQngq1BkK+i8oQTLlwVDkkRU45eiBac
	1QSy2ACR0sUTQ4xezLAJT5U+qH9dLylduDTeFx/hg1v3eAZQZW4xpbhc+DVIAtd8wk2bFgAq0Kc
	GBGU/HHapqX16Al2RMaFQFsnwsnE16g==
X-Received: by 2002:a05:620a:199a:b0:8ca:44c8:3540 with SMTP id af79cd13be357-8cb8ca8c41fmr917869085a.64.1771848493534;
        Mon, 23 Feb 2026 04:08:13 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:8ca:44c8:3540 with SMTP id af79cd13be357-8cb8ca8c41fmr917862585a.64.1771848492914;
        Mon, 23 Feb 2026 04:08:12 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3fc12sm16522603f8f.24.2026.02.23.04.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:08:12 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:07:56 +0200
Subject: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add Eliza RPMh Power
 Domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-eliza-pmdomain-v2-2-23fb87eb70ef@oss.qualcomm.com>
References: <20260223-eliza-pmdomain-v2-0-23fb87eb70ef@oss.qualcomm.com>
In-Reply-To: <20260223-eliza-pmdomain-v2-0-23fb87eb70ef@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vFx3zcq+G1obITePSUcons2gQA0eqU0zhiapnZAxazE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnEMmgc+LSgjrrCwaLVdCWvsqig0JuuSjhArRS
 ir7yqGuePiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxDJgAKCRAbX0TJAJUV
 Vq8PEACs6VK2c92PkxYnOLsfBky95fuRGU8aKBAe23RN0TREi4nR/UKx7QfVXdsgx5Slm/+zgkQ
 Mg72mwuAJv3fqNJTIlEVAz7epRmshKeq9bjOxFnE8sKwf0l29it7X7EacDKMAYDvpa1/bSboJA3
 Rlhw0jeIVXwiaO7I9vyjNpQAr3rtiZ5aZIeE1SfYDnrcSUc8CQ3GDay7HsREW1000fSLxKAgwcN
 Dx7SLVTgV277CwxReopPOVEaQg1RO8vgDQqT3JKsacqSEEZpijx3PNtypcOVVeSg1XzX4GEoSCD
 AXC8yfQVbn6uQUmgSbEj0+dtVlh6Ou35THUSixV5J9kEpMb6vsLmiFE1yMjPX8dkuDYh9LVFDTh
 KxMEIuHW1qs8yp4uG4R/Me2ZdaCABQ/ClQdyYNevMMfHSSlnjlMJv5WeRH8CF20AsLAgJ0lEHMm
 0iAGcAlegFcMlpWoVRfkeVyvtmfTxC0IVJUcIG0pAOZnStt7dow8iVF9vb3rmVa1olpJMM8Sqn9
 nDxk/qOiL9zxRdM3kLUhXbZjNdBhJbgULe0GQsSh0NUsX5oQoAfB6wj/rDn0FV30DJA8ZMJw4Kx
 DYPn/Sy/XpwgSgUDDwtgjwpFO6H7Gr9OiiHLGXU4CNMMp5ALMJNiuNyDpQUHiyV6GVK6IEgLu/q
 e6al2wjhA48BI6Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: wrQu0GA-gBax3sucgdThqINN_f29gR9L
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699c432e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dWhSLnTLbNPvjsjzFE8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwMyBTYWx0ZWRfX10qjlqL3qg4p
 VNpCKF/qdbXIdtKTOKrvQjPOa7Uil+vcSZ7vfTRGJC80S6niDsHX/WA24eQIJRBwNNbZR7T4Jbr
 Po3rPFtQ2rDqeMBadUbjvQ9/E9tKD6zEVlvAOVO1aFHVRumXWrKSZ4X7wKcyL/WhP4w6P2drWkv
 fz3zo39yWRnOsN2dqYEsEyoJCZAfKxL/Y3yyu8L3Y4gyNZoNC6UvMfy4wCqn9UcmrbELBYHdy7L
 LerB/jSVNOHmK7aiQFQaXwKO9+Opi1xlIs2LugXM4zajP1KOCU/h+wheabcqi7m8z6BAB4INDK2
 pY/ETg+3/KPVJiQYW/RYrGtKG5W2dH2xWZMY6MvvZXNR8rPzjrStjy74V9F1qy8dEZZomx6CA5p
 2V/Xj2x3QrJLtFxuieosanCVvAJsGSMDAN6ab1UgzHaGnqvxCmoSeOlKWec+i3DXT+HZWkaqZ1+
 bjdzAEZ7ipgL3wuDh7A==
X-Proofpoint-GUID: wrQu0GA-gBax3sucgdThqINN_f29gR9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-93676-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54789175F24
X-Rspamd-Action: no action

Add RPMh Power Domains support for the Eliza platform.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 19849703be4a..89d9c251df38 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -217,6 +217,31 @@ static struct rpmhpd gmxc = {
 	.res_name = "gmxc.lvl",
 };
 
+/* Eliza RPMH powerdomains */
+static struct rpmhpd *eliza_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_GMXC] = &gmxc,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MMCX] = &mmcx_w_cx_parent,
+	[RPMHPD_MMCX_AO] = &mmcx_ao_w_cx_parent,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_NSP] = &nsp,
+	[RPMHPD_NSP2] = &nsp2,
+};
+
+static const struct rpmhpd_desc eliza_desc = {
+	.rpmhpds = eliza_rpmhpds,
+	.num_pds = ARRAY_SIZE(eliza_rpmhpds),
+};
+
 /* Milos RPMH powerdomains */
 static struct rpmhpd *milos_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -795,6 +820,7 @@ static const struct rpmhpd_desc qcs615_desc = {
 };
 
 static const struct of_device_id rpmhpd_match_table[] = {
+	{ .compatible = "qcom,eliza-rpmhpd", .data = &eliza_desc },
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },

-- 
2.48.1


