Return-Path: <linux-arm-msm+bounces-94857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLLrC3NrpWkaAQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:50:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7101D6D2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E32D303B154
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A663590B8;
	Mon,  2 Mar 2026 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eypjoJ99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wu5y/lhY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EE13563FB
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448587; cv=none; b=qSVTXA2MalibxxBGpTnhx/hkifvCoDZyvbRy6LzA33iWFs9efwh/wy+C4gLSRUftHWNp+OYAdZPCvITe6ABTbAUseR9JPbLnScGgJ8uZAQKWFI2L7X/9Xf3DNfSO+hYUMIvbEmtsiVVLoHLWkOE01oR9xqB7nKOb4zZtsI4WElw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448587; c=relaxed/simple;
	bh=mfM49L/JlScpAh1lc54xaOqcbMJKZaGfYSNwP9nyX3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=geuJax4Od/sEgthBtqOzRet2tNlPTIjz7DfQ38sPMDhowo78AhsY88tGhtAp6cok78e5esiCOwh57kRrDEEBYGkS699pqizYZkveZvVMKG1E3y3pn2hSElPoUGb6qOPSf2FPYCBm3W38dy7f7YzX/hMZxIaDq9Nj4XIZJ5MbBL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eypjoJ99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wu5y/lhY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226hBKp2504642
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0apK8FaEc2TmE79ix1tcZBYr5HjYS95uAnJxvBt9u8=; b=eypjoJ99/d3m/sQh
	stSQWc9+K8/8zThn+VYW3AaX5nIfxYtWBCKBsbFEzebg0hQ5zKFLRpZDUftH2Ys8
	XGEZhiGXCZoNpiumxEOvDbEohmuR9t1kI+xO5JWYUYkVJ3ic/621UHPS8iTUCGH+
	jNWwzFbBqwSsPj05OqV7Ok4feeL+pKvKxYPo24/WOznhDoBu0k0uQLPglaYODOvF
	zldvNJeEzb3HTr9RfJOZ/pUk5ycak5SJavjRHY9rWOGIG33mNdaWK1Tqu9BfDqVi
	gegqYEToTM5kwg2f9oG0MmSrY18+Q4QD86wZt6thapkLcKLDxDwQY2VXlhTB6P5d
	PPN78w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5herw4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:49:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70f2120583so2492250a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448585; x=1773053385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0apK8FaEc2TmE79ix1tcZBYr5HjYS95uAnJxvBt9u8=;
        b=Wu5y/lhYUipP1mT3fvSQj2EocdO7r65lGzNIVoISxIKgx8LRWLVX+M6ZSFBKcLjQ8n
         ykY1E8E8Q5X90jcSfGPejeHrY8n+Ix7OG85G/O52UNw0l7hmK+146mPxFAkFHBWY6Z4h
         hJHgH3x0PEQiHc4ordeOr7U79k9G9gD8ezsN+wdfX6s9uauSd4Vvp6D4tenizopuGJKQ
         6toZmWDlG3wk1CGov7LgYNGEu9dtCjgMJkNg8oqNX4/3VyA39HRVK14uWmz7A8VE2Fzj
         JyPCbisHcWuuhKxi6zUjDsNst5C9fVbLrCnfYRb1M6Ct0CY3osJJkHF2Buvw4CYJLDjB
         YFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448585; x=1773053385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i0apK8FaEc2TmE79ix1tcZBYr5HjYS95uAnJxvBt9u8=;
        b=Sro2BT1qzOTPtS7xeFfueHL4+iIrYqXHQ5cTQD0UfQ9Mi+yeSZcalGs6whCnDTKCxG
         DvTzazNT+YA3TB8hIDcBhrmRFepguBHpSaLlelLUuAusf+ppS3i4g0u/HFFAuHD2XcBH
         amSEYO8fRhKB784bG/H/x1JgOmAORXzEykJZ+wsTGK6gPrhL68+NrdFL1UCZW0rFi5kU
         kWKQWlKdrm2XGe21ErpFKhepbCvi52jbkX6+g/use6NrCGwMDhOgA6BeeLEIj20N6TOE
         5uISHW8H6ripcw363VNKnBeQbjmm1p5uz7IL8PIQ+qpGOM+ougdOq5K6JboBn9oQenwp
         X7Mg==
X-Gm-Message-State: AOJu0YzXhtRsCVl0XCLCHyxz9649/HUAMRB0k3k8eb0ZPNQAm4E6KRt8
	YEfdKJslB31Ool1ofohy3LdhyTkPaqLoV8ArKPkdUWqtoqz9nA/Rg/N2OQgEVLsLIebnpo8QNJy
	qCok7dMjNtCI+ZfWqjyID4J4Rw0RmKwlSj5POPb3n/BoWaYPnC+z5hrkSRhkduDBA5JCeKspD+4
	9v
X-Gm-Gg: ATEYQzxe0eG3e0whTgW2O6NX9hLj9OIL+XxqNUH/1BAzHO9dIeNFQyNlbjE1Ivf2czF
	3it7Q7hffJFhysIVPVvjDrZYq76gecrkACknALyJ1DIcxAePG0yzJroAz1X9UE6j55XqU8xFVKP
	T7xwbjnn+ukRrtDdUYiomljTPlFUbwHDI2K/Q74SJebg05GJhkT7PzOxAPREmt5Es68/49oXEkb
	KdLotdiHMv7PaZCT+us5DGR0gLlm0muGIHZWVl7sZdYXWobOowzlCajj7mDPNSDl+Etz6nKr4g/
	xE7bZotmFz7fkRjNILgOtN8nJEt/Jyjkwo7VK2f6PvkrpI8q5qGTGWjJFX0ByTeOj7268v+AJR0
	xwB8Hnnra8PQlZPD8WdC7WH1SRmKw3TSJ5CCmojA41T2k7QpsqGgM1Xx5JSY=
X-Received: by 2002:a05:6a00:b42:b0:824:9ffc:256c with SMTP id d2e1a72fcca58-8274da07aaemr10122579b3a.43.1772448584805;
        Mon, 02 Mar 2026 02:49:44 -0800 (PST)
X-Received: by 2002:a05:6a00:b42:b0:824:9ffc:256c with SMTP id d2e1a72fcca58-8274da07aaemr10122554b3a.43.1772448584299;
        Mon, 02 Mar 2026 02:49:44 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a054b49sm12225956b3a.53.2026.03.02.02.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:49:43 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:19:14 +0530
Subject: [PATCH v7 2/3] ufs: host: Add ICE clock scaling during UFS clock
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-enable-ufs-ice-clock-scaling-v7-2-669b96ecadd8@oss.qualcomm.com>
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
In-Reply-To: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a56b49 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-RVjIYUuWhs3u9hRN0oA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: CoZ391pjnX64Q2c7AgV-yL04yF0UC5Bs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OSBTYWx0ZWRfXw/g85oS2rbhO
 ySyqtkCr7QBNY9YnSLiK7+TtdZawW6C/kHeNfYodl4hte45DaB+BxKE5EYKsj3wNx3HXQiu9jWX
 HHGauoVUEpNAOgVFiUQAK0SYxt1klrAsf0vXbXneli//inAQlPczv2goNyLrimOA8rJBjPXfNOa
 1V1cEEigJOs38jsV+BnEPnn4UUqc9pS6CIrZ7vBDc7CgXKAkxo6qJ1PurgSVOB1+HKY+rqAAxUh
 HA7INB5srukdLCcREjcwYuZIST1HH/TJRNZuDi7GlMydEahdRNjBLwQSOG5kxG7B6vPI/8W4Cha
 UJTFM7amsV/koYdsvJ/yVHSXGV6dh2kr7VQMyfmo2uLA/nb8O3+mpRIZeleQaikbRjy9jz2d2qS
 XTpf6GpWTQqCQ0WZL5DvK3dUK6Gr15hkhckfUzAscEeMmjDjsKqgCQwL9h73NYKP0Vr77Dy8q5z
 +PSOEqoZVbu23To4mjg==
X-Proofpoint-ORIG-GUID: CoZ391pjnX64Q2c7AgV-yL04yF0UC5Bs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94857-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB7101D6D2C
X-Rspamd-Action: no action

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

For scale_up operation ensure to pass ~round_ceil (round_floor)
and vice-versa for scale_down operations.

Incase of OPP scaling is not supported by ICE, ensure to not prevent
devfreq for UFS, as ICE OPP-table is optional.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8d119b3223cbdaa3297d2beabced0962a1a847d5..776444f46fe5f00f947e4b0b4dfe6d64e2ad2150 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -305,6 +305,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -339,6 +348,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1646,8 +1661,10 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		else
 			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
 
+		if (!err)
+			err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
 
-		if (err) {
+		if (err && err != -EOPNOTSUPP) {
 			ufshcd_uic_hibern8_exit(hba);
 			return err;
 		}

-- 
2.34.1


