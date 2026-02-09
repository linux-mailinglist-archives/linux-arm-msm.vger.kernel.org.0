Return-Path: <linux-arm-msm+bounces-92192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDsWF7Q5iWmW4gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 02:34:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC82510AE15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 02:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DB45302C304
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 01:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B43F2D5C8E;
	Mon,  9 Feb 2026 01:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7Uli7I2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OzG3Fzvj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A2A2D3ECF
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 01:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770600765; cv=none; b=HqaHSWL1wc88znVlMdB/VVg/AKlNnOo14WKPPvq9qdzbsnJhVXFL1TqsTlRPVc2iJLTojpS5nT1d08aE2yyBBkiy5o9EtT3UMmW9wOpz0puJXgMn4bTpu8gjKif8z6AYiRcbBj8KA/iXR5LRhflrn5/Pi/SELaulsWspO62g4I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770600765; c=relaxed/simple;
	bh=AguPyjryJFtRx2eaJbYNMbx1txjYcA3Blb6q3wboAz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+OgLpYV2PBVYoSlIr1HbHgY+BJ/oGPMrK2dp/R4LkJyfLoJjZfp7uWqmHY7Gm5uJ+Fxaa1vCVGJmHPdZoIT8nqNf852eejqvh4NLN13oDd3ZXMVdzpXvcnQZX9rRscUzU+4ls9GW+lDe7E86qlywUhNpocMWNX4BL+44dr3zGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7Uli7I2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzG3Fzvj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618NaF7h1795731
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 01:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=; b=S7Uli7I2MnVM6IDl
	R9gSScAmQwZQxBYikujVR6fv+vr1VUmkoiTmujEu9nWROFhS0JI/p2vOmhuh3Mms
	RN2WWRgIsbjomptrDrm5M/ympN3Dz/lID1m9/p+qEQ2PdYR7ze/lw+IVwR9MiGsA
	0PPQ50KfXZKumZHwSb3qQbEH2mcrze2S23t5T7hUdys67TUjIXcKsdnudw7Zp7++
	J1jNsHO4DurhkZQ91CFU9EPIMFTjgn0SgQDbr8Fv1wqiY3rKgwwf/hU2M5Z54Gen
	mGqVeUPPRfezqV+jHTIhc/FWeTXqOUgAlP0DVOeFeX6k2G09Ka2XlAkZy7Ecb65Q
	KmE+zg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xccu7a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:32:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70a62ca32so1169816585a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 17:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770600764; x=1771205564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=;
        b=OzG3FzvjoabiJG7I8ZzpyZ+dK2nhE+85B67hM9CM+rz65ckW4+KX1eMhP5IVzjj9MA
         Vru5Gvwm3umzTGBbmgx1npooO3vvWWbHGcIV4yPcj2wqO43jEb9FAJsSXXW0nct6U94H
         fom/aosvDfVWug5YqviPtiWT1EMPLW294aqnHvkXJvWhAyslgG/3Zb2HgAb6DbWTHtJl
         1rdyQRlxlgrY4V1dRmS9ktx9LS8GnB0qCHE4/XB0tmKbwEBTGPO5lL8oL2zr0gdGsahp
         ryrYW7XpY7KX3tcNmFn1RcTvbZVSvDqugJfj0Syj7U5hAu/soEqaWjSmygs+Ccesco2c
         swLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770600764; x=1771205564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=;
        b=kidH7i9ChS882jQ0ruFwceVh4yKwEK3Y3VpTvDRaFWFGkf+5JymliChaSVQF7ySWfp
         bCKxT4dwaS0V86pUPgUtP6uEtQ3HFKwIL01J4yuFY/GHiFGpVc1sFPUmgpYC4GsvwKfq
         Cab5u1/B10GNjtUaTG4B2MxwjOnCzsovvO6Rchi2zzCSPvywRwpXpx4ScFtIWl5zHi6Y
         3oSmKAtggizrZ+cao6wnoA8zNphPnFAJOyfiMziYsu2JZzTJDQM3ZQz4TGi0bHIpw9SY
         Bz8oZSZJssYQ4ExontReBMyVFHvWy7mGCojxXTE14HirfSK/84aBWdd1G8AhwtOcH1Qj
         SPfQ==
X-Gm-Message-State: AOJu0YzXiYT2mNx0uQAD5Yct05gd238Z2RGA4ueE/CLqDdXiUB/FcNoL
	WHOLucu52AyQrGtd5MRmXhV0LMAkw3ALxsXoZdK7kqS6sfJgt+VxqUAD9YQJTItN/Rda1nNUmey
	U2+mPdMux3fCNwRm7Em7zSkwivVTQVBkNcPeSv28Kp9dyoQ389uuZ9GUlanLWn3eKGmLf
X-Gm-Gg: AZuq6aJSbQCkH2gbzXkFDfbUHoGErPu4oZxTu6YBFQUeMNT7UENxk64EOS1vH6QUPmg
	s+kFsRop0PwqxyUSbV4IHSsVgXZtjxO0yIy9KxlkvFvLE0b3emK9JkqpqdsJY17gxZP1lUeKrD1
	IBP+rOY/uSaYGDoqTsZdHcSs6ymqvmj4D5yjAbFrYxSkZ8cyId7pF+PyS2SP2BxBuS4QHDRJUyA
	kzjWN9n2kcsDpAqgfG0xfyTNdTiicQC7B2SiJ4d0T0DVvIbiDuBhHc87fzbyY3Cz2SkV9mp0SKz
	fZ2BWD7eDaV5Y+jtJsrHfRG129UOGw34qP+5phSrM/KnsNo1p7WvjHeAgafevGcTfgksNL8UWAl
	Q396wAzf7j/9yu9LOIZXYUEVluGovJ1lDn1p2CNjiYtQJN4IArdW2nEfQPUgreh6DpfVaOGpq8+
	3zjm0/IGLCrLUhG10g0M5FLEk=
X-Received: by 2002:a05:620a:45ab:b0:8c6:d398:4a76 with SMTP id af79cd13be357-8caefccac74mr1222188885a.2.1770600763830;
        Sun, 08 Feb 2026 17:32:43 -0800 (PST)
X-Received: by 2002:a05:620a:45ab:b0:8c6:d398:4a76 with SMTP id af79cd13be357-8caefccac74mr1222185585a.2.1770600763392;
        Sun, 08 Feb 2026 17:32:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm21688601fa.3.2026.02.08.17.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 17:32:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 03:32:20 +0200
Subject: [PATCH v5 5/5] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v5-5-0a22365d3585@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AguPyjryJFtRx2eaJbYNMbx1txjYcA3Blb6q3wboAz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpiTkmJsL4kleC5vw4uvTcTGmVWfWCZLGjjZJAm
 eOUhGQfU3+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYk5JgAKCRCLPIo+Aiko
 1XZpB/0RO0lLZwrCkx22/CU5SlJtM65S4vT7oHOjMXUyOjBg8+OI//S9ks5ykJuxJS0C/AlZkhT
 4f5z98h26mP7WtTcbQaBn25g6jI8V0YRwHdITbRCsKR7Z9KLvXpcfVNxhCUADKlBrNAnq18jxsw
 EFbc1B0xK3dy2UqpV/6TaCMzpNjXrPl5+DUxjim3c9Nek4h+59d3sWXWQIQMH1hDL+VP2/077NN
 d++1fXxwLxqpc6p0XhJnpAvqgNYJdOC0acn6F+8QJ4ucAwWBMHp6fHpBxJueQwntQCcPA4eQqYJ
 T+sMens7DH2nCftZZygSnWlt2DjRfDkRh30c24HODBAjBM7V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxMSBTYWx0ZWRfX1DFfbMGtnR91
 fCFIxYF/Pnd41mlnx03XuhCbqgWf2jfKDRx5pvuJG0HLgFwpNcRSmFEM9aGkQ9RlQI6byvtZ+OT
 YhfA075y4gSTcfzmLozpPb7tDdOPuf99ePXP9VlzGqmGB87MF7yWVO5ooc6SV+CKgSU2h3WlYWO
 1ImKCrtKW44be+c0FuQczBOmNcxonzEpgmvwXxUqsiv4dcjt2S5b5SbnSqffePL21xlwYJeo68H
 yNRucVY4a5AbwMFpZ1izstSa6XpTWCcFSR6HLm95CzL6VFrZ6iJV7hQcW8QsxX8RJEVUTp9d3iG
 JHQpxYPab6F15dcBaBGIeE1NOYWoOdUZxpuRrF6NaSItDzLO6sdRYZf16bvEijA4oIkYUmpkHxg
 0ptxFPTNJIlvsArvmPnOmwGM+SysDVy3+rFtT0tF8OrCrHwGiWZWvzAZKquSCkybpmxKwnkZJso
 PJum9QHTtxJa2hgC+Bg==
X-Proofpoint-GUID: KlXDZdKiFQLjM554KxNux-u8JwHKwV-M
X-Authority-Analysis: v=2.4 cv=ft/RpV4f c=1 sm=1 tr=0 ts=6989393c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=EQKuo8RqpatckOKiKW0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: KlXDZdKiFQLjM554KxNux-u8JwHKwV-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090011
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92192-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aa00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC82510AE15
X-Rspamd-Action: no action

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a1ab8c3c27e6..a80defcb29ed 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4350,26 +4350,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3


