Return-Path: <linux-arm-msm+bounces-107241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH2gHOFGBGp2GgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:39:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B178B530CA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1CE4310113D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 09:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4214B3C276F;
	Wed, 13 May 2026 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+PA+g6d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HM60E0Bq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFE018DB1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663913; cv=none; b=bJSuz1w1pkhwS+mvQCo4qy6r+aI36JytiU/FdTcZFIH0eqhKi9sAOmnaljm03Ey/YpXCmjG5wENSLvhQHvmh3G3kvCYVWUhy/+/bKE94RDrQQC369VXLm+CbI2ZhQGvyTrMMxhjNnAeZHMSVSHKsN3Sn/q+etWZ+Q4nkhUxmeN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663913; c=relaxed/simple;
	bh=2Zh5k+DLGt7VRStDIeT4h2LiVS0Y1AAe1E5X3c7lSgY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ik1CO2xXwjVutKuLNMNSXEcEY82QJEkFe0ZzDCZuinTg/wazwgsQLlmVOeq5RnuXWW2CWj/1y9Rhph36mvJ5FWD++Tt+y4LjaDeYI3UemwLrqRRh1JicssIWt/kJR70U4Jb9P1+LNYE/0lfZCz4HL9W4hSMB32fWwsQb1X4m97k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+PA+g6d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HM60E0Bq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pBxD978175
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n2RWTMFaMmQxa3FKJ1jC3T
	erKQ5KXqsJu9GEAsheNvk=; b=h+PA+g6dt2Ty917xYAhgYpONJfxCGs/NLHsIj4
	DmsJR9FJFAOigtxU6Nu/Pe806ImxogILRzUPuOmtUQedHe4mcyYocfJNLIJzR3kS
	QLdL63oBbBAPUvm5B5lELmMUcgsuUvlNRnEn5ArzBuVQnPjv8GjKu+3hVlDkysLx
	y4nYA6kUyVSez9Sj/Ri0+K4mhyPdKNaSUzahNHam8LY8HHNBbEbo1GZ/G6iwbwIG
	kwTwevyjzQWChAms+X3MWi/Vwfp2GP5I3YIKKXCJcOvoMpP+lA55g7ook2lyRXWu
	gJMxRus/nR3NExIE9SPfvb42+98v4Vx7LzEqhMyrX20VVrvQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9uje4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:18:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b220c72bbso124927321cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 02:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778663910; x=1779268710; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n2RWTMFaMmQxa3FKJ1jC3TerKQ5KXqsJu9GEAsheNvk=;
        b=HM60E0BqyamlM8PVA9GcBmno1+F7qiHdAAKqE4Mawvn9KWSPLQVAcaAmu5UzPr9dKe
         gYcXHLHkDgUGrFy7T/SA/TU3mdASIDA/jeKU5RStvlnOxTqBBIbMBukaVtBiK/vDe9Wq
         sS2/d8RKZ1pK2rjuF5uOa1iC3PsKQJ0K2+JUaeFDAAgA15oFCiDiswqbItpvyHHkeEPH
         ceHzyfMeACq3h/Gv2qYbR2uYCBYHNqAQy/NaWQmc+dCouTzEtGCOD2phaJhcLQkFeB8K
         bkknv9K5xiplo/ZCPAk9NsBft1yKBYN76E6XrPqB33eGfKnuW2BlFaado8U0TyouxlED
         NrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663910; x=1779268710;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2RWTMFaMmQxa3FKJ1jC3TerKQ5KXqsJu9GEAsheNvk=;
        b=Fpob/ZAJUjsBi5gFngerERxQJNYwXCszLbg8L+prLer5Wl0AOEXoQVzdAdZafzc397
         FI+J2jirwVqpWr1SP1ADNANk7gByadNwjiyZdKWJ0125fi2xOGLIRq7F2pULwNEoaLca
         vub1sxyOyAIjkrTDuEG11JQLUps+ttSIA33PFRmHimkvK5F/K4S3R26ES4OHlwMFKGNs
         PnNlDeWJEEInGtcobFS2doYcl4KnO9aK0M/Ay6j5Xaz0LpnEQCz5uLHje2644wKIDtU4
         K9sZ2r4xgIAF5T8/WAtA+xkjrQaNIfAmwkuo6c8wIfePTM1NX4gRHr9YSc6XlbeLSuDQ
         ckDg==
X-Gm-Message-State: AOJu0Yxns6qp2CT8IjfCkfsGKL19E6yEQTzFHoXqO4crRAO7I3RyAYZW
	usZKcFE3LCUStRqIOKDPpXt0i/jfKZOPSh+21HpE5YdXGkCmahwOSoQaXKNu+Yoy7SY/jw6N/+y
	L5hUZieklDNc8RjsWbYL4Xi/SSFTEB9XbIS5fmjBA02LbcPsVZ/Yk3prQ130W/9YjzPSF
X-Gm-Gg: Acq92OE0GLzCuxg46qvTVXG1O6OfrnoYLkwOJLm5tb+f/DyesfbJpWrlPnoyEItUuxq
	4eSB6MPTnd/Ygk+RRYayb7QClidWJUcZKatyUrs0kPhKjdcj6s1qdYqIm8V62A/4155e8eOe/KA
	RRbqI+Si//MCuycTvL1Rq7LDDPOUIlKzug5JI9lSMJOG/PAMlSmqcPaQtjsa760X18y1AaoMrM3
	BVmx+6diPIK/SCFO63cgWg/iDUgIkXUDH+NEkGDrVVWRawfWB0why+6HQMJcqOhsVhrOmHyiDEJ
	/RLjn7dpdrsdIRrHRyw0nXeolOxv0EQC2880yz8UPrWNQq0B6m4KQmkSGtSRSUx3wDwti8waC6D
	J8TnfE+rdLTarnMsYrdOitTsBhX/5ZA==
X-Received: by 2002:a05:622a:5ce:b0:50e:41fd:52e with SMTP id d75a77b69052e-5162f58fe0fmr31070861cf.37.1778663909941;
        Wed, 13 May 2026 02:18:29 -0700 (PDT)
X-Received: by 2002:a05:622a:5ce:b0:50e:41fd:52e with SMTP id d75a77b69052e-5162f58fe0fmr31070491cf.37.1778663909410;
        Wed, 13 May 2026 02:18:29 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6cd75sm37827620f8f.16.2026.05.13.02.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:18:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: eliza: Add ADSP and USB support
Date: Wed, 13 May 2026 12:18:18 +0300
Message-Id: <20260513-eliza-adsp-usb-v4-0-839936e89aca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANpBBGoC/3XNwW7CMAwG4FdBOS/IdkIX7bT3QByS1B1BQFndV
 kDVdyftNA3BkCVLv2x/HpRwk1jUx2JQDfdJUn3Mwb4tVNz64xfrVOasCKgAY0DzPl299qWcdCd
 BO64oYIAqolH56NRwlc4zuN78ZOnCjmM7KdPGNklbN5f5Y4/T3i+Oj3iPGnTpPK0wMEE0n7XI8
 rvz+1gfDsvc1PSjpz9lBfZJoaygYwi5LLxXLxRzpyA9KSYrhc1jR85ipH+UcRxv2CF+OlEBAAA
 =
X-Change-ID: 20260330-eliza-adsp-usb-8ef2b1b0fc13
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2625;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2Zh5k+DLGt7VRStDIeT4h2LiVS0Y1AAe1E5X3c7lSgY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBEHeAS4QiVDdiACXRSGniTydACY3E6fDYPQ+J
 tHzJ3BXs7OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagRB3gAKCRAbX0TJAJUV
 VgXiD/9gZIV0eeQn2yXCEpgAXCSsPXEpSkrCazBun/M7A/JvbnDKl4TXdTIKF1rWmxQ+bEoLpBl
 UjZ2o0FXzq3gyhyiwt7LyE+Qh9pAeofBTLsyhHn08JfUQ91B+Jegs+ZK2eaAiFn3aA14LZAsnTh
 TEJtyupAdx+/Gz+AT63OIA3RxFUJn8bM4EMKSBzy/HFY2kVm3gxTE5ux7LSBaUa7nqFr6lw6jKs
 Fu2VNWr7U1J5QRqRjB/8ttiQ0crq3W1xB6uy1Ii0Zu6AFllrPskKk3be3spAUlGRX67eJqFYP8l
 b1cTGgOQrCGj7B3XzgAyXNoFZrM9ndaLCo1epmEKZwV3qEf8BJHkjKMq6QzL5Up2DO1JWoEMtsz
 1PQjpSRYmOhqIIu409cPyfJMjggb0n8q2zsLd8nkHp8cQfsz2Zo5SfcaK71fUBp80ic9hnfZKjK
 WT4eSaJcLOutvRpzcHeLq/ibPeZnm1yhyKcBgW0Ec8rej48VLOVoUdZ0VSAktcQFepQzN/Or0Q5
 u7pir2UPKdVGv8bJhxsR9GGxfuzK/6kQ9Uxh9YPxln1Uow+nPIroNZel2engOQiEUweRAvVAsVv
 9W/xrtA7g3frxAXG3ag65TlKD/xC7kicA1ilu2VJuO9AWWlY3WnfoZN/SxWp2gaedizOFxcQwH/
 LOHsYM0CXyYoCIw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA5NiBTYWx0ZWRfX1iUf45xoGNty
 aTT8B4rp/EZbNfoe3Gx6pLtenBb7T7ylyuANdbBeZiyoMXmOPAEw6dOxw9908EV/YRNCCOQcquT
 yhUpxH70kZrHp9PhA2Z9lq9DWbF2Mlsp7yrPQQcj4E5ojWXX0K/gHcMeaGU/wyFjIenAiO+fj67
 4qiLHfUm0CenJ2m46inZTDKZPQQMb4ACjbSzSHGxPrPLy/JFwWhG+kYfA7G+xvNETbH/cOTYB88
 3JVIHpUe68hqNi+nbvIgx/iLExpRjv1D3jCe2/G3yIYkEk6WB/nWGPeICTIqvu5QWs9H0+V4p8v
 mZTLYW0XX135k4lC6AxVNj7VfUPu0am3+OglEjKjIzPkYY+jMBJL6z+JoKo3n6CU7kE+RqlMhUK
 XgejUg/R6rCAY4gwJgHi5qY7rHcFX0aGJxShW6t1FGBoyCp5HTReuH8y9S+8cMARRi6wGp6ayth
 W/HsROxYT81ZEW3GDRA==
X-Proofpoint-GUID: x32EevfaCC5JBxphDaFCXsRre56qVI6t
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a0441e6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=v-TjB7A8gc_t_YAPOJ0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: x32EevfaCC5JBxphDaFCXsRre56qVI6t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130096
X-Rspamd-Queue-Id: B178B530CA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107241-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds the ADSP and USB related description for the Qualcomm
Eliza platform.

The SoC dtsi gains the ADSP remoteproc node and its communication
dependencies, including IPCC, SMP2P and the AOSS QMP channel. It also
describes the USB controller, the SNPS eUSB2 PHY and the USB3/DP QMP
combo PHY.

The board dts then enables the ADSP and USB stack on the Eliza MTP,
including the Type-C connector graph, PMIC GLINK integration and the
PM7550BA eUSB2 repeater.

The following patchsets document all necessary bindings:

https://lore.kernel.org/all/20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-qmp-phy-v2-1-849c4de8d75f@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-aoss-v2-1-c3628ca79a25@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v4:
- Picked up Dmitry's R-b tags
- Replaced PM7750BA with PM7550BA in the commit messages.
- Put one entry per line for the repeater compatible, like Dmitry
  suggested.
- Link to v3: https://patch.msgid.link/20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260508.
- Picked up Konrad's and Krzysztof's R-b and T-b tags which I forgot
  to fetch from v1 thread.
- Link to v2: https://patch.msgid.link/20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260430.
- Changed the HS PHY ref clock to TCSR_USB2_CLKREF_EN, as suggested by
  Konrad.
- Changed the HS PHY VDD supply to L7K instead of L2B.
- Dropped the dr_mode property from the controller for MTP board, as
  suggested by Konrad.
- Re-worded the cover with more info and updated the bindings required
  patchsets list.
- Link to v1: https://patch.msgid.link/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes
      arm64: dts: qcom: Add Eliza-specific PM7550BA dtsi
      arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support

 arch/arm64/boot/dts/qcom/eliza-mtp.dts       |  81 +++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi          | 261 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi |  70 +++++++
 3 files changed, 412 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


