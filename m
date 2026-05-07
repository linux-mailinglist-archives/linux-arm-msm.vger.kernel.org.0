Return-Path: <linux-arm-msm+bounces-106277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLxmCqE6/GmUMwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 09:09:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AC34E3E39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 09:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 189183012EA3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 07:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C8C32779D;
	Thu,  7 May 2026 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N45eEQEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdtfTSNW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7002E34C140
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137703; cv=none; b=PpCklRShSIvgKoZi0EtTm+X3xbySajWnftNz8Y8inGHL212FJpj8McJnk+UUtJXRzSiNlWz5pMBxPBoUWGwyCNGAk5mXR0nyhgog4uiXy5zEjaXCWDXwYCk5MpBMUazxhpGx6+Z1oss4iRFL3tu/DWXiro/p90JWxxZQErgWef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137703; c=relaxed/simple;
	bh=4Ws36Kh4YBbC0ww0Jy+xw/tAJtFPBW16pQwGma9xSls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V/o24ZLQ4ROi7qipPHxg6CRFOIeAynaOXXU2ZjLXrkXpW4cL6xjC2r7uEvWhYYvEhf6LfqY0GzxKpMux1EYYQVdmPxfjnmMjk5mjYUpKHvxow6DG9ct7vJt/3236fDiwAp+2W1D+XkHatHSdjqRiFjr9FA3xGJWbg4TFWdXrjXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N45eEQEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdtfTSNW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647446af151128
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 07:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=; b=N45eEQEdw9pIS0Z5
	eUD9RVMc0SyCILgyB6fbwC7ZrsGaFqryR5FkjWvSZnwXBYVq/MU+iB01GgdvT7Zd
	CCX6sy9vYjHvVT9UzeYXKoaXPZ9nqAJ0O3iI5UTV2kp+w95/BZ6k+AqYlZSfzYdo
	84pYPQgqpjJJuEjm0+b5nLvOiOdb5auu1FurC/goDLhu3StJLCu5aMeBUjEutX9r
	yv0gX5D3H+fiG6mSYOGPx/P/E16Re3yP5JK4hmx9K8p/pYtlFdO893yzCfo23xDX
	BNqgTDT08cemH5rw3H1wheiQJwcWRlHSJlrK+i4//SlPJ8VByam+r2FXTUnSks9B
	G5UyMw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctrkvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:08:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d890580e1so7927751cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 00:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778137701; x=1778742501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=jdtfTSNWujwtlsFQ37PMZBiFjSxXsuN91b4dxj4Eopg4q83CQLePZnBNI+1Yp0iQ7E
         zRQZ1Ebw0ttHPuhpXDZQLE1vsucUgsnqqBOBO23FzIRkzeFCdtT6EBDAQy2CQozVAzq1
         hoicPER8peWzJV1rkoA6i61P3YjgjDixiOmy9n1k4AtydXfS/isjlGUREOJ78UdPR9vy
         dtLCAGqK5YBRku8YlF1TX2GEcp7Cs2Cj5LBhHUC2ACpD+2aUTnjA+p0Rx7cb3/Co0uNd
         xIlx8n9AfxyjySfU3+bt4ixs3PGFGgXWChIRwbmQ9Jw3rTLzdSCxz2gYo6FZytwZOq4Q
         tYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137701; x=1778742501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=caTjNhD9DZg3vOYEREzXmDPM2/OWQRfhWqjpcaQo5ryKbU4UMVeVBo7h89sk/schMU
         JJ7n9qleRHerZGKAXofgbWrLUyKXgrryKLIO6FBoDTHpXykWddMrEUfRngUz6Qsc22bS
         KBrxs0WkzoLk3bBsE0OU4zhTBbSY6n09C50oR+Haadq6iAVXESNgPlVZoo3RAbgljqWZ
         oK7zvWfUZsXInt+ijacbvErxd3+SkLDT+tA6u47NcEy/+An4QFQ2Sa0oZDIkxN4/ETQ0
         8WS/3B7/bo1kec5QWtHcY7J7/dNO2r6eu8lwzWbDJEox1lrPvHNfTGYQH9GFn6aFs5QV
         VS1w==
X-Gm-Message-State: AOJu0YwO9M3bfgr4EGN/OGcFvZ7aAAGNkPCYUQ8tgDhgeo/lgauvABHd
	HxqBJRRUkhhip7XAEZE1ZDvJfHtoWiXqQSUoFX5rs1/mHFhTDGU4QSVipj6CPf0Aw2aD47KZl/s
	JhXAEz2Hrf+YIkuKSG1KdauFqzUSjXfU4+v1ig0Z8hggT3azY4Aj2ayUjxq/Vs+iPIDSz
X-Gm-Gg: AeBDietIEDlUl+8GYS9BBcr1GPBeX7gY58GUD8l4QSJNGe/ae6v2Y0znPZUwgwatkup
	mCbXJ4VpnkTLwV9unOeKvaXysgzVndnStnZrAug4C+8vORmKQzJC+imR76jCpHHFXS+WPIsKGTu
	PxVgc72lhWKZLHIJVqZyfFhBR+/h2Enm1gdje2dqMSWeGL8r6q7PnTV4iLsO6mByKsUPZ4XcDwr
	eHsf1TEqZkZ3y3lJZ3vr6sWqKa1eFHLeh5Ttf5nAXBt/TabrOUH9mpWiYGYkAGyE+14/jPxb8O4
	DiAmiMpfopeohhkKsGEo5QSB5WfmRcOWy/LOauyuvUyvOKdzc57UD4ibabUZ6zGsYAGte4eA4wi
	t47GL/nKPg/TTgh367vMnDr/KXH1tFf3zdA7AJ1RGXVLPQ1l18oi6mUiQOE1hKFD9xJt/JaCySa
	2RdTBtI1NE4X5VZ264oUCgBfRyuJdCYntnkFxK+Xh1Cw2JyA==
X-Received: by 2002:a05:622a:a13:b0:50d:8903:ae6e with SMTP id d75a77b69052e-51461be03e2mr99847001cf.5.1778137700693;
        Thu, 07 May 2026 00:08:20 -0700 (PDT)
X-Received: by 2002:a05:622a:a13:b0:50d:8903:ae6e with SMTP id d75a77b69052e-51461be03e2mr99846661cf.5.1778137700205;
        Thu, 07 May 2026 00:08:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm4296784e87.43.2026.05.07.00.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:08:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 10:08:09 +0300
Subject: [PATCH 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for video
 GDSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-sm6115-v1-1-0b082ad8eea8@oss.qualcomm.com>
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=712;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Ws36Kh4YBbC0ww0Jy+xw/tAJtFPBW16pQwGma9xSls=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DpgMRbML8GFqypvwXYiYitpkAtVZv8+fXRXb
 Vd5Ftn04PeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw6YAAKCRCLPIo+Aiko
 1a/iCACMJACnilb3n03uyLi6TaAfrxpc/UBFCt7wVt23e+9UMHZ2+vsiS8SpgAMdRbEl0l3X6Ej
 +yLxQc4j+o1QSqHLuMBViP31wuIwjf0i7zUG+ZUWLQ51uQwC9JIrZ2RdH9dpPFooFnhcu+1wwXH
 Hnuy0o+sxe8FAwecQpF+Np4OBLQ+/fZMgXa7zxjvNqxUFq8ht8qkbNpPhfQzEBfOzGqQI5yDAoP
 CpOehfpO21GfxTnHBgg3e8qVyXq876Z/p0eKkfvWq+nrS4O2qFSvtEnk8KLYxbWWu/2lYoZhoZF
 BI3zeLED3xsdSQF2tkd7OfkJ9gaqW/6bWUTuPodn1PDMj+J6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc3a65 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KOvF56qbc03BBMn0VcwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 5_L5Ff39KeaBu-JCAwVxTCkLq8vdX0_h
X-Proofpoint-ORIG-GUID: 5_L5Ff39KeaBu-JCAwVxTCkLq8vdX0_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OCBTYWx0ZWRfX6qtGn4u/MkqM
 Qo5ssz4xYZo8fZ1SAt02RDMgwOFXAgZwlccWoyV3TCyWFANTKstMQCiMam43Vorxp2/f/huxaGX
 5eDAMO/cBvfOi9OZ6NniWrNoanxlkZNScKxEo6kF46smVj1EZFW75cy7VxRbnV1LL1i7Rj7p8/c
 CQIL9ob0P5rOw/lHPZr9UhrA1L15GqOPnTCkNVoAEtNqkD4XAS4GqumEjEdQ9DK4X7rLo3h8JCZ
 EF0cOHWc9iu0b1nnwRz17rhCcUSTW42ny7pgcjyfgcqWHfYqB8I5ar/uH3RYPoONtaIwAGerE7b
 Le3gytLBAy/vipsp3Ag1K5VphSOggX8GePW4qmVVOW4vKmLCGEWJ/B9zICgi1rplCC41u7aEtUP
 ObcpSxKW24HbSul0SZZp/9J+KDUhK9WjrDTZYajazdzYPWfTvjFy0bh4N9CenmoEbk3LFpDtDnK
 l6fgmnJeYcNkZu3vE6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070068
X-Rspamd-Queue-Id: B7AC34E3E39
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
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-106277-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
the video GDSC to HW and SW control modes at runtime. This requires domain
to have the HW_CTRL_TRIGGER flag.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm6115.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index 4c3804701e24..c5251aff9886 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -3218,6 +3218,7 @@ static struct gdsc gcc_vcodec0_gdsc = {
 	.pd = {
 		.name = "gcc_vcodec0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.47.3


