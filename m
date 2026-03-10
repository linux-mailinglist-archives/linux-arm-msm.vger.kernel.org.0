Return-Path: <linux-arm-msm+bounces-96657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLs4HAcosGnYgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:17:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF580251ACF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E01032C530F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868C03C13FD;
	Tue, 10 Mar 2026 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgXmuw5W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NiiotG21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4697A3C13E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148137; cv=none; b=Q/CxkLWJhu7wO5n2WgPGltHK1mm2H/0/XQJKL3Aw/00X309HDJ+CZ2qDTVxhjKpuv2Mk8pGVcMNsBHTd5dtJVwF1q669taC/9I1dhDauxUPS/eVeiIl6w26qYTyyNmyfhyVSuLF12IlSRv85OPDIuzB/q+6NdHmrDMXtbjCzzig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148137; c=relaxed/simple;
	bh=NtcdSk88BKcoUuSEgQ7ANChf8JUpRkjMKRnf41qlwQQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H/Jw9+gmmr3XgzX0LVSOyIqAO+YeyHzFgYGvMNtkSo7haqG4GO2wx+mG0kGberUQRHPJuTXTuxS4U/9vC64nBZ+NouG+fzc0zDUDLHH/Mo9iYI2GOYGbfmYilPvNx3Araf/yLUIzoyR8B1yCdXgyKvFfS3vm+14AQ2CHkylJn2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgXmuw5W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NiiotG21; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaRr7024059
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GJoUNi8c7hktkRLka81xcI
	+/KfX3Puz4ayjXVRMmwqc=; b=MgXmuw5Wfz2lr8VlMoh9iFpQ/uLQ8Kl9Kmb1Qj
	ny5PktKtkK+9Iv9s4gbPps5spX8zoM8tvm5r75H0DB5MX1zpI5HoNnY5ZJv5gTuY
	JLNK1k7gb/vXJoI0luDRA6EUFQdQjlAGORshwzuYD5+Nzn9CthLaDK8PsBLqQ+zv
	hWQ5JzdXoZxFNeqYyIweYruX7MDe0bELg58NuFEcLvALD9n4PqZoHVhdzwsl1bzl
	C04bI+pP5TedTq0LexwURZkP0jcA3yxusw2SllpEorvvcjbnEm7TZnk3kI9Lz8UZ
	gLrDRYcM0x7EwtlWlfatBQVdt0PMiD1iQpZwvQiG6M1eFkLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5ngyx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:08:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd83cfb36cso1653654385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773148134; x=1773752934; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJoUNi8c7hktkRLka81xcI+/KfX3Puz4ayjXVRMmwqc=;
        b=NiiotG216f/sYN+T/1kZGKrh6FhbIiMBTxojIny2sr7PVgnMDymq/Oq0p3A6hNMUUs
         YKbjoMYHIkZZyjvczV2lUBgEdJzygXqiABqIt0E7HkyDVBmTCV1zoHYOFqzMIDpysAB7
         D6Qrsvn9oqdJUAnZjtqvDyhVQTIToVkRfdS/zl3Lj7i8w4lgKn+BiFNgPpnHktvjgpQa
         pHK8B9vF5CzUJ8A4I4+C30OrECgtXCu2wbB1ZwAPVFbC2rADyLkPQgfPdU3hCESUKTnc
         2jjSME9m0RNtdOftRln56hxLkDFnywN8+dEmzNYjpSkQFt7Cws6I27XGOwq48iU1IaiG
         M2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148134; x=1773752934;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJoUNi8c7hktkRLka81xcI+/KfX3Puz4ayjXVRMmwqc=;
        b=tpMOuNGnGqPy3Tt3kLYBzgUVjolw41mKtEyS9lqpoV07GYUMfdMI4LgD/Zh8TEm/Tt
         FEsMLDqkyLRDPeuM587BSW3AJHNwLQsVjbZKoAbKohbbrEllxoihqzPikF6YGTpIVu7p
         iMf8p8p6kUpBVFSHq1XndfFtgLDL0Q3+Wn1lOU3PuM7/Z4GdpouW4r7WphHX6EM1rBpp
         TFH8tb/QbZt2FN94V59S0aN1dgDMveK9E2754fSSP9WMD6REHaov1lI+xhk3M+tzTsZ+
         WYxZtVbNQJJ/p7uWAQQcvP83DwmmTlhHo7JHUoquQxdsoDvvDiaaosF+E9AifRsMCCkj
         mIYw==
X-Gm-Message-State: AOJu0Yw4FSgWgBmjYVdjsxp7Gx5pAhu+3x2UYG4yRpLZWxHyuOkgvldx
	5tDHq/FMAkoVUcgSTYdzC6u51gczK/sg21U5yiDR2YUdbMdXlc07aKzWqQF10dAAExQoDrP1A8g
	3alnXEi2qUBfskfEm15zaULy0LVSG7lmqP7TonkyJJ1rEJRcYGe/Hshu5p7esRqeb/VVvOzy4mC
	Dm
X-Gm-Gg: ATEYQzxkRvol7YrZxC98cas51oF7nF6BTE28QcVY7xjpCsUVYbFeGOLX5wObXvYHODp
	kirVyPQEtiknLkTG4n6fhJ/CVand6COme9GzuzJdHr+hvhbebqsCHo0AD7y37c/2QlkKdj+uMHx
	9V3zwFyk/zIFGyqr2Tgo/W+lHxrkkPELPf5W6KafCoJQVgnIBacQIru69eWciBLfEDkm5CD8GQs
	5e9GEpAVOivrLjGcSy4DmXj9QZ6J6fy1Chy6Em9qzLc8vUSpLdVI9jhUy+ihCBwkoFU62bGJGiz
	tK1MwqAu/STl2lWLrf8pEhqP3LqSxo+sKoGYgixTSTtM+EvEQqygabbkb57uk89omFbwARxkjjg
	jynLL3jBCi2n+LAglJt6Qvkp61q5vN5WlHhhCjQb5h02C
X-Received: by 2002:a05:620a:1375:b0:8cd:79aa:693a with SMTP id af79cd13be357-8cd79aa73a3mr1014018685a.67.1773148133887;
        Tue, 10 Mar 2026 06:08:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1375:b0:8cd:79aa:693a with SMTP id af79cd13be357-8cd79aa73a3mr1014015085a.67.1773148133406;
        Tue, 10 Mar 2026 06:08:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm99472385e9.9.2026.03.10.06.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:08:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RESEND 0/5] arm64: dts: qcom: Drop redundant
 non-controllable supplies
Date: Tue, 10 Mar 2026 14:08:43 +0100
Message-Id: <20260310-qcom-dts-supplies-v1-0-5071a7052ea9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANsXsGkC/31NOw6CQBC9CpnaIcsSDWtlIa2FloaC/aCbAAs7Q
 DSEuzvhADYvef8VyEXvCM7JCtEtnnzomWSHBMy77l8OvWUOUsiTkDLH0YQO7URI8zC0XEVpVGG
 10spoB9wbomv8Z998wr18lLcrVKy/PU0hfverJdvdP6tLhgIbJWpTFEedN/YSiNJxrluOdikDV
 Nu2/QDA2eEDwQAAAA==
X-Change-ID: 20260223-qcom-dts-supplies-2c98db9b9cbe
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NtcdSk88BKcoUuSEgQ7ANChf8JUpRkjMKRnf41qlwQQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsBfeY3FbqfTAKq/kuUe8+9Pw7gom+RBsPLc/B
 dO4yn0btiaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabAX3gAKCRDBN2bmhouD
 12CAD/0ZC9G4Lf14c4n1UR2+Y5mxE+C5KYm0NhNubFo/7Q0DWUe9GJy7VCNQR1rNRBoEIqz+3oV
 q9jeyERsU8EqqedVSxSo+oIE8WBj7JWxJ11ii5b7+MoBWsItOhBxWEg7de34/ek7xUud0eMiVGo
 FJYOCLsED0JJEfZ/SoAJe8vq+3AIP16lxhhgVKaeWH8vo6jJOaAMiLQTMQtZkgbA7qBnKDbkW9j
 PjvoDTfBL7pftJ9q7Zepyqrmbm5bC0VYl39hszhkXPjeoUAKO5M39midAFM8OgfWBSGER5DWTlA
 TfKxqY4MZlgytdkgKmE1Dx/xEzJODzqy2RPZobS8XmG5YQY5ZSSNjguhI1/DJJukwJ8Zi+WtwJ7
 C39ziuW3Ka13Cg50MqvSOKzwkoZmtklAnwbrZLWsYuNoqt1XcW6dNPo2MB6kVdpjPly9wqLPjq+
 fnrbOgkDMocOVW71ll6W0UMMBChrwWX8iXjuftVCbM6Ps43ZK8GtYKIpu2Mwavag75MjjRKSCok
 R8vyzwiZYnHlmGGK48gr1Lx3kPGv78EtsSDVUWS3cCrA/FOKZtOlQZqT59TmqVCrXLJVpZCyHtr
 4p7MuFwzbypzMRbp0SUxU/uw0mCfoFFZgES2zOYqqIgGiu4paR+cLX0QTVN87a4Lrz1ruheSdga
 bldM+Hk9M09QsCA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ihBqzpIVGKTOxNgreWxu3_zdlzjiYoBA
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69b017e7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=-3cLnZj8YNrZoULhp2sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: ihBqzpIVGKTOxNgreWxu3_zdlzjiYoBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX27huBnd9i/yq
 e5lsxyBhWu82Pg5WdALAlIeKVzWgTKnFzbrvn/geillpMQv0gFXsPOVCrpkLk4JmhT8LlnVnQxE
 1cMJWIw7M3V2xEQ7eD0SDlZOwnfozYu6xlqxA5rqt7/mj4p8F163+Sco07FR8PeV67TOJX4ds0b
 cj37HJN8P1jFdFNVPcZVzhpmoHZRlRng8jNsWyI6pF0ZI4LLVwfxU8uOdcm/hpQdWQF+5fHbFHB
 H250J5cODJlCZc16gMt6UjEYX53UTolHQc8vgZdymNQ3FIk1fl3+yrWsab5a0r6swCkuKq/uKVO
 aWhOnptKoDHiurA4Wc46l9uU2cxTO6Wpy2jedStGK5J8dAEKZqBZbynWbjPMHO3KeipeXBk6mCP
 6pU6timQ0HXEe/upAk6s9+Hv8OXZi3OggfT5P0cjGbfo+pb+t/Wpf97e3itap8fdSOZ7gUVsQ8/
 6V3V3+q8apwFXYs/pBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114
X-Rspamd-Queue-Id: CF580251ACF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96657-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Resending with tags
- Link to v1: https://patch.msgid.link/20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com

Drop completely redundant non-controllable chain of "regulator-fixed"
supplies, which serve no purpose except growing DTS and kernel boot
time.  They represent no added value and because of being completely
transparent for any users of DTS (except the bloat), they should not be
represented in DTS, just like we do not represent every transistor
there.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: dts: qcom: lemans-ride: Drop redundant non-controllable supplies
      arm64: dts: qcom: qcs615-ride: Drop redundant non-controllable supplies
      arm64: dts: qcom: qrb2210-rb1: Drop redundant non-controllable supplies
      arm64: dts: qcom: qrb4210-rb2: Drop redundant non-controllable supplies
      arm64: dts: qcom: qrb5165-rb5: Drop redundant non-controllable supplies

 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 26 --------------
 arch/arm64/boot/dts/qcom/qcs615-ride.dts         | 26 --------------
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts         | 45 ------------------------
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts         | 45 ------------------------
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts         | 39 ++------------------
 5 files changed, 2 insertions(+), 179 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260223-qcom-dts-supplies-2c98db9b9cbe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


