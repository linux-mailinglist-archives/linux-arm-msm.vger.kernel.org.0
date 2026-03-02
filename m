Return-Path: <linux-arm-msm+bounces-94858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDfEH5trpWkaAQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:51:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D71D6D81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E71D3304435C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395BC3563FB;
	Mon,  2 Mar 2026 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7tR3bi5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QpDWJvUs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7F3359A65
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448593; cv=none; b=kKTvLvUyyaSDw6td6qOraDBbCV1KxvwU37mWHhNwj6Mhf5xpAIn2z5fkf51hwoom3oJbwJtCsJS5qmGzfYslpkhIQPFmgh20rvn2QumQHhSGNL9L4Qs4WDyMhpJnKHmTl2IqP3DXK0ktd8Dz2H5d6vjZOexQfedgjMa8EUR7H/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448593; c=relaxed/simple;
	bh=tV2XKwtZB21b/+DGFlVdQBnOLHKaB8Bee2EUNXJwBb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dpgoq6ATGuovTAZPppqZ2KLClVhX2B23ylpsjTCLG5y7Hv/JI/n3akQuZLh4/1SqU5Ai26DhwVw82OnbKMGAk90pL5/fhkWaHXevUCHS9hw3K1mUHIlWgJj2ty8Qdgs7zhMBT2zu8O96eZhRLUxQUbKGAPIdNBWMEnk8U9siEQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7tR3bi5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QpDWJvUs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229JXK93741797
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1iZsdguDErODmBIQ+5meyHtMgbiaL6kRcm9eWC3B+M0=; b=N7tR3bi5aTTbex3N
	1d/VEdOMvGltqw9SluqlBHJ60MHqzWGBNWW+YYQDFaWIsCl5sXQsJnMjElpdXvej
	md1uVC/XZhRKr5QpYWcn1BvcVd7P8THXc/uKjHiFukOh7J19pdCiObuko4hfddAv
	o2giYjdWlXrfgx8sG9LZJ4AdVgppTsAqbr8jyHlfEqiRUMeigcQ4aqFJ9DKzgBIn
	yZFbkTjoxK+qKvt8g9RTTZWilKvkkdzLV6JoxS2Y6bGOLtZ6s8gfa/+x8O8Uy2OC
	+Edo03efNLth57vAPlWGcPEfaY77pz3os/yv3OBiSn+2MJ13hJKwVQoM2iECXbZd
	tfAw3w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trgamm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:49:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824b42b8a81so16741022b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448590; x=1773053390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1iZsdguDErODmBIQ+5meyHtMgbiaL6kRcm9eWC3B+M0=;
        b=QpDWJvUs3+gvS5wKYvwJ3v7o398bx86vgManFKjg8rHyz6/usEgGKB8jHuDAmC+ubN
         ODSluNPnZpcWNOfnOTE1vMijIng3ojox+FEfuubN4VCPWqrexaocFeA6YPNrNQIt6tB9
         SiFgYB87vwgY+gxE/9fZrO6ciOGYeKeBAf70BuHkJvA6oF11plc+A7rNFErsXuIH451n
         W4a8ObUreGm/9Ks1VaxeiCtHGZ4Otoo2kz9kxNP4SNzwCr3FEkAKCld7CcFFX+RfQk14
         1EO5FA7QS47qo92J7Jm+0ScbntxZrS4pg8IeHYkNWTPbjQUR3uClPSKrbR7F4csvsqpc
         MJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448590; x=1773053390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1iZsdguDErODmBIQ+5meyHtMgbiaL6kRcm9eWC3B+M0=;
        b=tO36zeUBs8QaI7jigysE8CPpfHj6fWWFh83Nzn5IO+d95Lf0A5jtCjLaay0j9EClIW
         BMX3hQKa/1TA/UoOwGhOZfiyXoZpWB2bV+h5KkU/t6KnwjO8aP8lzP/gBjrffkEYOuRl
         ZYGn2usnfK5rLpiFXxovHaGgZe+qYxLPpqBbenw79hgBisUIxKSHSAElMcRvAi3LyDIE
         m5psx6u9cR4Bz+iNiHBF9P5Q0Hf5p5xmOirr6As+JDOHD0fZylnZMlSblSUhmrLQ8CAq
         GJmpk+qqgQYYtcG1Dnoe0GOf60AVm0TaU8+7nc+6fvAB+a/fPPy/RAA0/OElgEGmI2oV
         NJBA==
X-Gm-Message-State: AOJu0YwdVzoxs2KNc84c2vJJzsZ3ePkdnZ7zZyYYieBoi21jaZiavAEk
	J72LLVe2drH63d8fCZMruKY/FBtmubUqq52nVPUKTyYsBeWPr2qLX7d8SMYrF6nmLNc9DKXr6IP
	j3vXTzyNFK7URAV1vcuj56dbmK7PyrWWPfP0PEDB+Wf/a7by1G0/ro5QdqG1U6QDo3GnEIkvBpI
	o2
X-Gm-Gg: ATEYQzzvK66LQHdKPzMAof5ZBpy6/TBs5T1vToRRBB+2MW67DnJJMWeakbCkQzvrXdc
	R1LaHVVqeWpltMhzqGUmoz0xCC/ITw7LH7q9kvFi17ZO256LqE88go1PU+k93LIMD0h6914dQ3E
	tdYR2C+E6a6jRiksajr3KoUEQiXTLApTyqEAuVQ+6vtLKbowWFSRqMlfICIgbRj0Xwi3PyrMMA3
	IbVpN3NtIKq+6n+v7cv0wnyiTaVTAl4MrwtYb8axll2DpnNXGjHgTUvBnYyNVZ6F7lQX9O//7dz
	4Dr0Uqr2leQp3wBVpiNwu90R4/pi3lM5jKEPQOOARCThgI31v2Tozn+twq7qI+8pcrUC5t/1wOI
	Pb/9j7Zpucb7yJAy4g7FnhLimo5NaAlDhRExrbxDqSsocsBBQLXLpP2QCnn8=
X-Received: by 2002:a05:6a00:3390:b0:824:9451:c20e with SMTP id d2e1a72fcca58-8274da3a28fmr10253605b3a.59.1772448590371;
        Mon, 02 Mar 2026 02:49:50 -0800 (PST)
X-Received: by 2002:a05:6a00:3390:b0:824:9451:c20e with SMTP id d2e1a72fcca58-8274da3a28fmr10253596b3a.59.1772448589947;
        Mon, 02 Mar 2026 02:49:49 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a054b49sm12225956b3a.53.2026.03.02.02.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:49:49 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:19:15 +0530
Subject: [PATCH v7 3/3] soc: qcom: ice: Set ICE clk to TURBO on probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-enable-ufs-ice-clock-scaling-v7-3-669b96ecadd8@oss.qualcomm.com>
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
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OSBTYWx0ZWRfXylq8GojmAlbl
 2gDWibQ3laLguKgkp3duL+dByUdzApwk790gtS3REmWOvRpWUnk+TyRbe+ZIuz/wpopBZEa2yz/
 skSXuNBi8/agXm/MhEjURjOgwwXZ08yt7+V0D14GYnBNYEVfi0vWfjG8b3k+Efk78y3Pgc7+s1w
 yZqpJ5vdE/Z1vrXliLmSOZ9JXmP09VB/uaJZgA6BxN2hhEC1hkAAgDtLwhyNaQVgXkfyQK/DUWF
 iK2VI7659crgeQqBc0OKbCyzOWQTNPhF0pp3v+MKzqYEWaQDU34VuKr/eWzZ1OlJ1J5DzdtWUDV
 1Dlkh7HMenuOo6E5xhfuy0uHwOptAKk+xWXZ4BS/NJyyKavLGWz3GdHmRouqcosqc/qTaxvaFkW
 W9y1MuEt/UHnz4Ns+Chhrj4ilrYmgMScSzkfJW2oG7X24k8OoNk63pBeaBW81nF3pnlIVZVHd4Z
 mU5oVjOlw6WS2jhkDKQ==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a56b4f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=u1bwIIJuvd_SIhYoViIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: goL3pFZTvvXENGenhiDL_ocsbaC5hiYN
X-Proofpoint-GUID: goL3pFZTvvXENGenhiDL_ocsbaC5hiYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94858-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:~];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 424D71D6D81
X-Rspamd-Action: no action

MMC controller lacks a clock scaling mechanism, unlike the UFS
controller. By default, the MMC controller is set to TURBO mode
during probe, but the ICE clock remains at XO frequency,
leading to read/write performance degradation on eMMC.

To address this, set the ICE clock to TURBO during probe to
align it with the controller clock. This ensures consistent
performance and avoids mismatches between the controller
and ICE clock frequencies.

For platforms where ICE is represented as a separate device,
use the OPP framework to vote for TURBO mode, maintaining
proper voltage and power domain constraints.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 7976a18d9a4cda1ad6b62b66ce011e244d0f6856..e8ee02a709574afa4ebb8e4395a8d899bf1d4976 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -659,6 +659,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 			dev_info(dev, "ICE OPP table is not registered, please update your DT\n");
 	}
 
+	if (engine->has_opp) {
+		/* Vote for maximum clock rate for maximum performance */
+		err = dev_pm_opp_set_rate(dev, INT_MAX);
+		if (err)
+			dev_warn(dev, "Failed boosting the ICE clk to TURBO\n");
+	}
+
 	engine->core_clk_freq = clk_get_rate(engine->core_clk);
 	if (!qcom_ice_check_supported(engine))
 		return ERR_PTR(-EOPNOTSUPP);

-- 
2.34.1


