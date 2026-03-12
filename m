Return-Path: <linux-arm-msm+bounces-97255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEIqHmLZsmlDQAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:18:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC5B2742D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90A7230781F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 15:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D113CAE6F;
	Thu, 12 Mar 2026 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmmBoa8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DRUqKLFD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1193C9EF3
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328478; cv=none; b=hr8RcqcqxzWHB3wvVZtwvAoAZkwFoNJldmMbMcsTi86rUJM61nRstDl6Gc711X3/LhdmpFf4e6WRtqOqB6h5jI4sW10FxMU0LVXmNDm3G7kOkwLTkmtOKDEUfIoNfqdREyjua8MfFcHatt/Rm3AdC3TuujCgmdsvekJ8VLiFuCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328478; c=relaxed/simple;
	bh=X4cDjWA8XAFt7fsNjwtDKumSnpdsAxkUOQlbbaRz5zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C7Ir71KNO8IpoEqBQBZZKysnFFQejMm2Gc0JXL/B4P2ctT/lTyzvOXzM1Xdr80fqnb+6lhkGg5kIPck6dodQECxL4fPILQZLZFPW56fCOWXe0OTIt65AZT8pKz+OXHyiKm4dmDrDaQrW82z7bFvj0Xd47IkJP+w7kXBmQQq+yhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmmBoa8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRUqKLFD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9kmdA588071
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pWL3fiXA9Fa8ntNChjGkVhOjIJEz1gSYeB7nZbS/3d4=; b=CmmBoa8sMZ3bJUva
	OaHd+G7y+KVjdgtBklNTj6dQF76OhSz30HAdS2DpCK7+dV1hSm0Ve3eltXSlInEP
	bM/MHkKW7wFTH4DKQbGQHZdU2TpxtEsqBkZniHSuojimzYKFDmLN1FewieQTHLoU
	+wkrBd7Phn5kbXQnLUtPiPB08MqQVkHtVVpwGK3Z/1WZigndDuucbhlNFDL5X3Jo
	exiGrQ47h/uDt2RoIASPQ/0hNlsU2Cp+jUW2NNcCJ0Pb90gOdLCV7Ud3EDw1qzwR
	yMT7ygZXGVcXJ1tU/S41vtQGirkBIXGa4YghBxB1HDHYSfLbau36QIjwaXtHPmdf
	bgl6tg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q2jgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:14:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd77e5e187so583166685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773328474; x=1773933274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWL3fiXA9Fa8ntNChjGkVhOjIJEz1gSYeB7nZbS/3d4=;
        b=DRUqKLFDzStqiuJEYafwwxPRFbNG3QSJrGyrMVzAQiN6gWGz+Jx88FqmyIXIFgpHbP
         K3AcvvcvFZqt7B6ce7k+nl5AiVJI8fOEyFwsGB8JukWDwfGom0fju1Z9FKJ+tM0CayJL
         NCe4IFQDwfs6sm/6f77GWt4NyQhXJHW8TLBPXPsSAMRM2JkalHkcTJlTcIXfDvmh2X8W
         jKnpkj1c+kkTesShFbajBKNaJcOmTlIM22VsW8PY0dQj34PoOsNHwEV9oyvKNjhPRrMN
         KRxNLQKurhO1WYnTqIB1KOUCIQ1uWD0YWTSADRJ9h5Rc7irSUqiTbRccmJu1ev6dpg5Z
         lSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328474; x=1773933274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pWL3fiXA9Fa8ntNChjGkVhOjIJEz1gSYeB7nZbS/3d4=;
        b=mrAY9VQ++3ZLlu/xGnitEX5EJtIOblw0LOlix2DKk9jVRtDE1KKi7zpk0oLYheHJIS
         hIxU53D8nDABUoo7Ifu1G+NU421AaZFJe+5kxovxjHG58MQbc+eVugQ0RU9X0hkGLhdW
         8EloV8rY6ggXAR4ewGv/ZJmX9zh2p0oU/fHy4G02hZ8WAWOBe1M7vB1d1WlHBCkqSySO
         YRh+og+7a2sJJsYZIrYqUAl7crxY03jblWN8taDHJnWQVU4JuLz6Gi8c3CWbVCGh8STb
         AWW94qjhXRu+P754RHLTc21W7Wd42X2LTRhhdRwgP/xpyeZM0+CrRctu6ZXXLrhUHRmm
         ILcg==
X-Forwarded-Encrypted: i=1; AJvYcCWVuMO5sFPvWwdPQjHI73eHg2ExS7kknF7dU7f4sQKJW9w04GFOZwdvX8zj8Okt1E7Vm7wY4jGjrDrevC5C@vger.kernel.org
X-Gm-Message-State: AOJu0YxM0c//hNQgPx9O8YF12CJ8nZ04ywU+6tXa0dvlu6olkRH03unw
	+YOsBofKKTp5JosKyIZvgpMKCn35Wa81Qemd3UoQRSNn4BUQhpF1JhtNwXlCB0s5fWwtfNAz6QA
	TBfb+QWwS4tgWr1XETDTY8FQEG/vyoajbB6IWIY9stPsRAMGWGjSGbbBp6SPyTt+CNOzJdl841a
	tTy2o=
X-Gm-Gg: ATEYQzxesPiG3EWncXKhiRVrsBOcaWbGMKrWNPuqmfKbKj/6Z6OpvqnpZfodei4wN6S
	YI573anajsO3p/4CUVym43NPRIezsPV5osb40+yZZ5UE7k4RMMpu2cgQdTWMSDb4E4Dp3kB/F11
	FZrF0yj6i+qJRyVcwI2mN74HHwR3KmqK4DmefcdKN9VGY+NljX0x4yt3EEk5YJPLsBwRQMF5pvC
	grBc0r2wRAPfq4Pj48Z9bqpzWtVIEW2K3Dc4rD3RHm6oGM6aic63R0SJhWH51OZI5D3cUPidh7E
	RydNSKO39rMCr+SfNggMpkgtif9h3ftjvbA9/YGTjKW6hRyjBEwnBY14q8J6HIaULolZyXhZ29P
	IvK4tVQ3wpeCroUoylDKFoOtKczXN9CrG58g7+SFKFhCEoqND2350z6oETkpFG1/GFQR1uketkP
	6BIi3d3fvFpwveKkfaFZc33bS1mt1/vH4nhuU=
X-Received: by 2002:a05:620a:4008:b0:8cd:9aba:f5fa with SMTP id af79cd13be357-8cdb5b2486emr5084485a.42.1773328473939;
        Thu, 12 Mar 2026 08:14:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:8cd:9aba:f5fa with SMTP id af79cd13be357-8cdb5b2486emr5079185a.42.1773328473338;
        Thu, 12 Mar 2026 08:14:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm972822e87.61.2026.03.12.08.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:14:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:14:25 +0200
Subject: [PATCH v4 4/6] arm64: dts: qcom: sc8280xp-x13s: Enable Iris
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-iris-sc8280xp-v4-4-a047ef1e3c7d@oss.qualcomm.com>
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
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tNlTLOlCvqnTauAmRZZ8XPo/dz1PdM/NDbJfDYDq45A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsthRRY+bhDvcACRrzx8yoBASgNjQt8b7Nsmor
 kaboSwwrZaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabLYUQAKCRCLPIo+Aiko
 1TilB/95N35HmLGggxXxeKDmXXT6y3f+rMGDyd8mhZkf84hhMDZ2hUnWfDI7t20z45G5Jte1clY
 /ZLNKYKuaaTCDhEg2AIrgUxYJtUmf2BffqqMCKtB/TP0IHPIkkRrqq3vrjw5FpEFdm/i7UVuzG9
 fHaqI/OBnbzmQu/N8DCMUNKvbT5tDlwoi5UkWxKMROTA+yOQtI0XX8YCBIOun4x8zkPi1Hsvhmi
 YnehHP1qOmRzDDjtO+8xFCNAQJf+SIxncNWdBBSyv6Z/779kPO8ROEzAi0Q71e+7hZa0yaWi6Gp
 FlD6ONaOngue1Xp43gPvvCtCsu/QnErMhfkpLnioEaHrlj//
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: rqZj42vb1TAPURQHtYjtTtL0d0ZPkS_L
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b2d85c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ie9TG8L8bN-JZtJQupEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rqZj42vb1TAPURQHtYjtTtL0d0ZPkS_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfX95L0lrvrtxRb
 Bp/SS2B7aVX0F4xDLMX8Kh2tN2EkusjSDJlfFCcLcSazCGvHDP3Q+bJW5pCEm8KM4O/iEKc0n97
 BYebw4MJv87T0rs6rCTqI1DMsGLPJkg634v2Z9ja264K5WdHGbsUyL9d32oy114BAvbruXqPV07
 2AjA0b9uO78u4env/MmGx76UXIvLFxzBXoQHEdafnKI+bHgQZi5aCoZLsj+xBzbo5v6XAaABvI0
 fNJTT0/86g0nL5533ftNyKVCTRkjztTDlP5D1oqG/TcaFTPR8uhYzOocwJqOmFp2XKvuvckOsT1
 CTMY2futWiTeoy7MY3PxegtXpvlmN2iDI3vTG4OZsDCYDfEh4ARQrN0A+kmnFvWtpRewaS+S5aJ
 L3P6fZfErfPtc6F0vR9rK+n4q7Fq3l2ngWhCEZfYrj1v0ZPWOf5EB0SLpH2tGBCY4UWp39l4urc
 qjAoF7kbNIQN3DQzc8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120121
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97255-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.68:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1EC5B2742D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Iris and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..0eab03495b8a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -932,6 +932,12 @@ keyboard@68 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;

-- 
2.47.3


