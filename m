Return-Path: <linux-arm-msm+bounces-115304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 64QpDNtuQ2puYQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:23:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD646E1172
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:23:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MRF8yas0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZCc4aLK7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115304-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115304-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E6903017BB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4FC3876B7;
	Tue, 30 Jun 2026 07:22:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9856337E2E5
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:22:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804179; cv=none; b=FmoQ8YMZNx1uCuNcs6m8e+f9i3qkPEe6DbTEoo+7UBjMnzz+Ud7y+ZtNTrwNuR5Mji0x4wvCuIETWd1DALFqJasVFYilKqAHA+CTDAr9dUjNa29zsBnJB9kQNdSkitQMCl+UaawGNVDCGkZOKP9Diakqo5E/glYtCLK2wBr7MsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804179; c=relaxed/simple;
	bh=LISlRcfKm3g4YXZU2nLP8QOghv77ebuR79OjXXjCvPM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NfNpzHvF/kEBLZu+gSSWm2IV6pqeCv+8QbQO/ubr8PJcJHzd/xFncVtv72P4i6mK8//w7SbhIPGQ5DY8p/uh90RAv/77N2k7oeEQp/245rAmkbzjUADB8uP3hibntdZyII93w0vxco3C1f03mkmZJ9lTU3ZXK1FXnFQgjxrXc5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRF8yas0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCc4aLK7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CIoL1055974
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rT2vbwcNUEl9FTDv8LclD7
	W+3Yr6xVMKM9m1hLL8j3Q=; b=MRF8yas0eYmsKenS/iNnpQdIEiaGVK4vJR18JK
	H9hzSJMi++cSYSyhmdJq+vvR7RTvoV+xGMfWtw+9PDH+i0bbZNzNr+U4wrwQ6/a5
	scVxywYCqreOssOUrjkFdIHH4N6xhyPvHxhSgMT39C7SgqYehcqZJvJ4acChUiQ3
	JZ0R0u5po+f4w2i+uCVbTD9Al+8edjh8KJNlDsSJvzZGdtTjEQa/fY7u6/bQDBwX
	QuRP/6ms53IWjkJaBMsCqRFpPRI9DOtCmvQ7PDYbZ14IpaX2ExfivApB5WnrqEat
	DKmLSafOB/OM1r1fhzBwWKWTBGEcMUJ6keuDAcgtpNHk4RAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46860srw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:22:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92da6f3cc81so627083585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782804176; x=1783408976; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rT2vbwcNUEl9FTDv8LclD7W+3Yr6xVMKM9m1hLL8j3Q=;
        b=ZCc4aLK71fbLfXid1JkKtvsXr3OmoQzr+LLk4yAcrPCN4QYE+EsuEbG7Y/3JWj/gQj
         WZ65wrFRET+kQ93KvOFXdVtKFe9ffJbjvou2KbInnqNcOhP0rAIsMlfgqBtBw4MP3dpb
         ZoMRgjCou15CWYJ/UQ/hv2DJn73TbeFI01JwbGo3SqdcVfaz0tjuWJlF8K6I4L+KHGUi
         tJcDy0jOcSxROuL81NX6o0slRgtO89QSJfGcZz3jWf201udSVmdOyFfpHW/WTeUJ3SBh
         ZyV8RgIMzyNloprXZbfsUJ0JF8bRlhpbHhMqHHRHe6LSSqnMLLfu4CtEX0q2ikXNt8XN
         I1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804176; x=1783408976;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rT2vbwcNUEl9FTDv8LclD7W+3Yr6xVMKM9m1hLL8j3Q=;
        b=Pl8oblaBEPEnX8SAW0YKAb/LhZ1TXj+XxD299///0W3U5+Bj43BkH54xTEJN3v3qtA
         OL42DNAVQWpKLLubxaEwAIqQqBC9awo3zMrlhv5A3agc83gzV4/+nOdir9oztC4Zqwk0
         HGm3RKi9XosAteYCZIHRM7Plmj9NbszSCwzNW742IfQnEfytpgx7mn2JB65qYcbSPUv9
         6RKrqbAdDEXtz8ARURTKIByTIcObhyukjdqpxMuXjqBJYvoNgh0aq9HDH8n5ujmz7vWS
         UhbkbpK5cdIUO9UTF8bLA1D2tIs1nsrFEmW1jQLtH394jtmlKKh3TSLkBGYyuPqxIMtb
         H1Fg==
X-Gm-Message-State: AOJu0Yxg4ezt5h+IY2+mRCHTDkfGD3d8TtHV37PsCzwqKfesN9iqZAkM
	fU66yec22FJLRAY72CNz5yOan0xfiD50qJ8kNYgiwlXlJGBgx1ogpcoVmMJVdaBW8CuRTVSVU4b
	grCyPEk0fWJ1qPnne3OuCTmR/XZJonEiYNJ6FROC8uZTKMNE+U2DSMGSguwm+aVFS2/Bi
X-Gm-Gg: AfdE7ck5TwrgX7J6iV10e1EqPa+zy0lXuokc7KDMbU3OpGoNPSxwjwg7o8ItdqFf5Jd
	2wC0UxTtFVGZ7xtSGXjLrD7CwAMgy6x1p3E+Q6/kaHNYDloHXgb0KCbRncG+leLtI4A3KlaWa0G
	OOMKvGGjBb+Uq2Utshx7xGyadxKScaGUvB9mBK/+J8lx/lwt2EhYh9yrfWlzyTL7aX/RbYwwth+
	eS4k7DM/po0OjVUrMoDX0tMgF6KIlq+V488dba5HzISMHt2NLbxH6/eKLkgq8ro3QLoXdCoNwBc
	+42eC2Oqr/2oXsWx+I3DDzR3gVfHDuYVFYcFieF8saAZvaffmlnAlFYOW7IQp5VR8h8InFPv1aD
	QBL3Em9pX2URECXs=
X-Received: by 2002:a05:620a:c55:b0:92d:6961:9519 with SMTP id af79cd13be357-92e6249fe27mr419626585a.8.1782804175736;
        Tue, 30 Jun 2026 00:22:55 -0700 (PDT)
X-Received: by 2002:a05:620a:c55:b0:92d:6961:9519 with SMTP id af79cd13be357-92e6249fe27mr419623685a.8.1782804175133;
        Tue, 30 Jun 2026 00:22:55 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778fac3sm4718622f8f.32.2026.06.30.00.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:22:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: Add Eliza CQS EVK support
Date: Tue, 30 Jun 2026 10:22:39 +0300
Message-Id: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9uQ2oC/3XOTW7CMBAF4Ksgr3Hkvzi4K+6BunDsoRgIaTyJV
 UC5O05oRRdhY+lZM9+bO0GIAZB8rO4kQgoY2ksOar0i7mAvX0CDz5kIJjQruaJwDjdLfY+0c0g
 hnWi154qbDRe6NCTvfUfYh5/Z3H0+Mw71EVw/Qb8TEbohl/WvsUPAvo3X+ZLEp9+/0nKhNHHKa
 MW18dXGSgl82yIW3WDPrm2aIj9kQpP4D5klSGTI+koyme/3Qr2B5AvSbBGSGaoVmJpJabV3C9A
 4jg86cVkscgEAAA==
X-Change-ID: 20260514-eliza-dts-qcs-evk-7f1419812659
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2468;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=LISlRcfKm3g4YXZU2nLP8QOghv77ebuR79OjXXjCvPM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqQ27BJC4V6wk3zn0VqzRjJIEpSATOW6TlOM6hl
 uGYrTMIcQmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCakNuwQAKCRAbX0TJAJUV
 Vv60D/9aMsXjTy4JbSJA6+SjGiE4VsK4WgR7OdAEdrI/nWz9RHciVInN6Hez+WD4kiL93/Iv3sT
 35TuuS8cP5vcXTysBheDkEDY+Irm999GMFHuEvOnc0hPmF4Fh5P9Bis6LbNNYx1xsQ0ELozok5B
 iA+hUPLMB26B323R6Z0Ag3tuQVzjwlh0DuTOBtpxd6zkIKa8mzfz3r9d695/aC5zBeILwATzfeE
 ei+/IrQgKw8VYRzSv2y7KNWrS1JjfBrem1+wutqRhP741WyzZzMnoUgz3v+jfdSDUdRuGFOLhFb
 I4uTP9qXBFjmNBfPaLTmaMRUjOM/xrYxWPJ9csWgh6vJzMOq7AO7MYZlb5JIVPpmR1TilfnpDEe
 CXb1pSG/N8xUD9xopEnfaa9uxWXPFEhXrRxbxEP6m1V/yvsGYeODvUpTO5k4X1yZCpr2ZWvKxOH
 smeKwjL0CsxvijG+G8U2NqY/Gol6/ViiUxroFnPEWTl4e5/40fTBIRAs9xGoJW8uA+d3wWkB1CT
 b040J/FzCl+MlUC/ZEhhNsj945fy2K3ZHI/FehPOekj5/Lg8TPmR8skzkvDZ1MwJ+WdbUnvHxVd
 Mogwb9bdfXKaXUc+mYcrv52EOYSaY33FBDm0PytrftUjVM58ChQFA32KlMtTaHL2SEsm8XrraaJ
 o75WSz3IGvJCJJg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: jqezNfM5Ogj_fjYHzkMqdnDL-phyGUmQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX1iXJfW3MFWX0
 q8DLi/N5eAoSiHmsJdxIyTyoGOoKc9VVJhl+hdXn2Q1y4drtKtc94j4LQEtgMvtf5pwa15xUhcZ
 wcj2/HbpSerDdW0DbFDIUXsYnnwNdwYOEJI/W8fY9zuugmNBq5klCkUJ7YOavNVUMc8jB1pjrco
 4JqK5CSee9xfR9pjnHtx5KKUlhYbtWfr30085QwabYnLhiDrHhPFLKDshr/k94rRuJm5FER3JU/
 77htxjff8jNEsJ/tbuhOk+E4wXs2IeYsb8s9A5Vkqf2d4PBlDknGBsM/YAAtoxOrV6GPUimf7JT
 0aLRjEvBdc7xQFX/G3rpyPY7ZVsTk+7onpnk+78eRggBFtWcORm7uxemSQCpgeP5SN2O2dRG8g6
 IHvrJ8UtFvVvt8aS8VJLcA2P/CnMoIKTTkFCCma6P/tb8j/VxE9vvX35jgzPX8bcWqfEq9OqKjw
 u4aNpV3IjeA0AwZfE+A==
X-Proofpoint-GUID: jqezNfM5Ogj_fjYHzkMqdnDL-phyGUmQ
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a436ed0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=2gOZN8e4eSpdJFbEdPsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX6uOY3KihJQKw
 GreX/L8Q62glr9NPU4FE1eN5GXl6wrbkEZSZzxhYyydbIG5wzQ5EKNIwoSF+I6l8nVv9CzMeUaE
 LRbfXUfKSBpw4vuWSxQxawPgyK81IJg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115304-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFD646E1172

The Eliza EVK platform is built from a reusable base board and an
Eliza System-on-Module. The base board provides connectors for external
peripherals, while each SoM variant provides the SoC, PMICs, LPDDR, and
eMMC.

Add support for the CQ7790S-based Eliza CQS EVK. The series introduces a
CQS SoM DTSI with the board clocks, PMIC regulator supplies, ADSP
firmware and eMMC wiring, then adds a common Eliza EVK DTSI and the final
Eliza CQS EVK DTS that combines both pieces. It also documents both the
CQS SoM and EVK compatibles.

Do this in order to be able to boot to shell with rootfs on eMMC, on the
Eliza CQS EVK board.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v4:
- Rebased on next-20260629.
- Link to v3: https://patch.msgid.link/20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260608.
- Moved the gpio reserved ranges property to SoM.
- Picked up Krzysztof's R-b tags for all patches.
- Picked up Konrad's R-b tags for last two patches.
- Dropped all dependencies as they have been merged already.
- Link to v2: https://patch.msgid.link/20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260519.
- Added missing qcom,eliza-cqs-som to the EVK dts.
- Added in the bindings patch, as that should've been part of this series
  from the start. Also dropped the CQM as support for it is not being
  added. Also reworked as Krzysztof's suggested. It was initially sent
  separately here:
  https://patch.msgid.link/20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com
- Link to v1: https://patch.msgid.link/20260515-eliza-dts-qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com

---
Abel Vesa (3):
      dt-bindings: arm: qcom: Document Eliza CQS SoM and its EVK board
      arm64: dts: qcom: Add Eliza CQS SoM platform
      arm64: dts: qcom: Add Eliza CQS EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   5 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts      |  14 +
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi     | 394 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi         |  20 ++
 5 files changed, 434 insertions(+)
---
base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
change-id: 20260514-eliza-dts-qcs-evk-7f1419812659

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


