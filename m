Return-Path: <linux-arm-msm+bounces-97257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN9zOBHbsmlMQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:26:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2F7274637
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 748BE30BF43D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 15:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1587B3BED76;
	Thu, 12 Mar 2026 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEyMxS3/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSnxSRz2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BD33CAE7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328480; cv=none; b=urSmpqpeZq6GABOgQkJy1d4fNzIgQeiEIgUV6fK87eA4rMulHUB0CS0GSqbBB7q7S9/u5fjx6Nu10BoGoGrdepaYmPit/CLavE2JLy2x2ULMmzaooCv3YhZtZ4P6YtJ0nx96SQA5p0tUQ37vISl0Wcc6FieF46NbK2vA4rxNrKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328480; c=relaxed/simple;
	bh=mTjFk6KOaMBMq87MA10P12S8qaWmDd4rtJ3bM9RgiDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sr61iBaHDgbpBe8ARirC827WgGcWx3s872q/ir1eEZR/eDThnjJpN33dqGGXjSF64V29U7tSj31AFLL8VJ+urwFgXznwb9q8/i/VwCfLqlFPG83xdDKwRBxREUGqXftM8aRbhEUapS7S44dkT/FYk89qvynLMO2jCBjoHVCed9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEyMxS3/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSnxSRz2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CCDGRf1594038
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1JeW1FwTx312O5D5qOp9OKot0UGrGXbzMBGMBxniHg=; b=pEyMxS3/ozfklaH1
	FM1AH5ErG+l7bj/nyDgN5iOmONNoGiQuJ9i2ZLc7ekw6ktY+6Dg2FIDMc4qVM5vi
	AbI9fO1bO+/4JJi4GVTTNmodrnhqYW8iw5MklUGGRt9w2OAsHFVRVf4rMH68LJPg
	KHVD8YbSUGkbBWgP66zLPFdGGlocENZ81RiPp5rynBOfVnY3qQkK9Ac0a+YOT+Ix
	b25WHs+hqg2UA16buVuQ97PRurIH9Z0MjQoJYQGVA5nZwbMAn+HUTU03quW0IuT+
	QV8cuMlGl68gb+MvaRiMfkozoWQHAgY5+br6VxBodKDeBM2Tnz1NYlL3hG7rirVe
	A/61Zg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvq9x7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8b37d4b2so850591185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773328477; x=1773933277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1JeW1FwTx312O5D5qOp9OKot0UGrGXbzMBGMBxniHg=;
        b=XSnxSRz2rJ1BBhalSS3XYtUk6syNptQ8RdSAvF05aNPSlTk2ffQmqeAazW9Qh7V+rR
         1aESf6cDOMXnEVjGD3FomRHDKhpWLfXCXNIt0y+R+MB3JgCRwMasGlw1S9XefdXGZ6Ca
         5ipOc7+776nG1qWubiTVt1uIPHaqsO6JX51HTIzqlnmsiv6dJAvm8WTeae8EGQHRmTUc
         r7PMhEUUrTUH0wVqYcxIe0hCt1nNF2utZ6oIs1gHSCT2S5bvkX00+2tbkRxlrVPG5vnl
         7mf6hzdwvQSc7Rkn7Jmv0rm3saGiCSdYHuKvUw8eljQsEBcrSOxVJhKUk0PxWCKR+4JH
         1scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328477; x=1773933277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R1JeW1FwTx312O5D5qOp9OKot0UGrGXbzMBGMBxniHg=;
        b=nsvaR1zLcV4nxEyLoFzfPfl8znZK13q/TnvjjHQl9vwOHbCpjVhS8nWzqplEMrZgvr
         0wbZzouLMzr2ACazGCX740IF4j3E8YuTMsPLLmNTtAMbAW47w6i6uwofs8KygxOtKhtR
         EqpDeqt2iCfljQYKh1fux5sHjsW4hapU6n4NjHxhhJ4hmVzdVuJWM7pS/GZMaCBmY904
         MflZsxX2V4QLRBoDrdZL3AziCITiZY/YxFnVCZCHK8Gblsi62KN97K7cUcqYP0Wx4d4y
         lR1jXGLeJZt7+pV5RcTjvTRtWqAJE81A4eC8yVRjox2s+jtiEOYZu8E1P+lGBjTnEt53
         0uag==
X-Forwarded-Encrypted: i=1; AJvYcCWDuOPDHGhSkQgTFr9DPLoOa4Sdguy594cuZGTFRW6Ok9NhjuXX2fS163cg9gNeJcs/jvyErW2cm+RGtIct@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2rCntyAjF9dmzfqgINKupB1nB5CBxvhC36lPX1eFk0ykrKrkj
	DkSO7BDtWuZNKNziB0KBiW6Yb55ci8BFLe+C+xdMI6MIZEzTSPhgCg4JW/8NU/38NCj2yxS9Drm
	iMqIb0ngFCE1+zCKe3PnB4N2TXS28U/tV+oTrQHhF57lpbpd/itlQItB2Q8R0ZuiHQ3UQ
X-Gm-Gg: ATEYQzyu0YFC4sGP7oQjdmHqbvL2tfh7IjVmvr/nKHiFyfdmS2+Mi2lncISLi0pix4f
	efu6iySKOFVL0I2AEfPPIIeePMUkKdTqJn8R/fBFwNx6tyn03qZbomEkTXbArdgr65MSD5z53jk
	ngpgjPKc8qOClOdVnX2dzriiZDDQJBdfUwU82jdvPQBlGWy47exzu26mpyhyh3trYXh3SUR6C3y
	z+0geSfABpL6nufcomLBmxbN6xFqd01bMdkVyrteyCSrdDXVoLD7aoQPKNp18MwBalp1J3qa2f4
	SrUl843D29aef9pHee6iaU0kcHYgjwtRAhlVydMKwtJA5RozeCoDXhD+sLc6BYMS33xuzuvIzPZ
	twNyfF+CINA0tR0vvp/cVwvKrcxzbXXlKpUxaQ8Jv4SRDPK/YyK7kC70F7bBKigzhzOyLAXednr
	VtQTQXmRQEQ7kgyDjyULctfqcHxeFKmxYEx0w=
X-Received: by 2002:a05:620a:1a01:b0:8cd:8ad9:c893 with SMTP id af79cd13be357-8cdb5a0c4e4mr10810185a.6.1773328477272;
        Thu, 12 Mar 2026 08:14:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1a01:b0:8cd:8ad9:c893 with SMTP id af79cd13be357-8cdb5a0c4e4mr10804385a.6.1773328476806;
        Thu, 12 Mar 2026 08:14:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm972822e87.61.2026.03.12.08.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:14:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:14:27 +0200
Subject: [PATCH v4 6/6] arm64: dts: qcom: sm8350-hdk: enable Iris core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-iris-sc8280xp-v4-6-a047ef1e3c7d@oss.qualcomm.com>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=745;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mTjFk6KOaMBMq87MA10P12S8qaWmDd4rtJ3bM9RgiDA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsthR+y8l59vgGUWHuGgy3TGzaOOvO/O4CwZFf
 rrmpZ++bz6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabLYUQAKCRCLPIo+Aiko
 1XDYCACAG/uHintZytAkFj12t48m8uqZeFxTQ9SMM5Y7CdAyWziP015QGO/COjVelquG2unL4X0
 4GGMz/UIhskumGJaNDHmRUKtVowWyu2nCkk/4Y/6+C+y1ia7Q1qIny8z/Z/7gNO5qjwuZR9LcHw
 6Q2ZJalbhY/s1xwP5H+V41Biml5CTfoeEeghoN/ry9jX4SG730xsp3B1JtqoDcLMq7e0bYlw3ni
 NNE1nja3IyvWvA1Pk/ibW7D08r/CNOhY/GaakvV/mcGBoAfLWIIU/WjjTUclOfYLVqaxFRZV9tK
 gYHbwgHVdksFp9IL7vSWrawx0IqHMa9FyT1d5xO9C3fhBDha
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: PCvy7OeYZA08COTHkzEf9uywQuG7zpM1
X-Proofpoint-GUID: PCvy7OeYZA08COTHkzEf9uywQuG7zpM1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfX58d+TrAPzHKa
 8KZdA7L5emhVQ1MNxdcZY4vkXY8ASMm2lRYPHjwj4hmIfLCtXoJlpAUI5RLl4chCir6d4hCWJdc
 KtznhuR6CZpDi3ORZfo6w2liPToPmPMOnIxaJbmF2Hp5pNVIFBPXFcfTF19HHEq4bifqUcKCzD5
 2NaHSfVzk2F456QJyuIwme+IV1owNkZQp4aTz+AahlsqCBZ8U1I/+c9SiUAAIAtzfrHm8XfErBX
 +qXAFE2GzzwyQzxCIXxSLlafBtakSxxtSVrxVgJnklTp/kGWMku49GTRTk1c1dFRnF3XWZdmjzC
 uCqRgY5RmNCyk0Gec5BAlvB/xbv6EUrb/LhIpqvv/tCyjnpDVWt/R6BhKOKEvVlWbT/JEMj+6Sa
 bv08dOc1tW3DRU8wX79z5dsXm4PDJDKnnulY2nmIQyoqWOtHUYdfTuDCvPdaAAxodFjQ8wbMgS7
 d8Szk2o95c91GmX7Fvw==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b2d85e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6kKVESMuOeKZ7y-A11oA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120121
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97257-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E2F7274637
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable video en/decoder on the SM8350 HDK board. The firmware is not
(yet) a part of linux-firmware and needs to be extracted from Android
data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..055fc8ade85a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -472,6 +472,12 @@ lt9611_out: endpoint {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu20_p4_sm8350.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.47.3


