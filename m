Return-Path: <linux-arm-msm+bounces-101762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE1FNFbg0GklBgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:56:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 337B139AA8E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CEF1308DD4B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 09:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451053AE1A6;
	Sat,  4 Apr 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvEcxPAB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0EFV8Kc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712D93ACA7E
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296277; cv=none; b=LR8sLQGtELWKzVR9guHPZyXPI55ApHoEPStscXi7O3/ZBfRP0DaNVnL8RJaot288RGvaE0OPZzUmXNgLMoVbR2f4x4/OJu9H3z96LmM7suHfO5BjXujt4N3XOe3DC1p2Ue82C5s9tKFArZKIiN7gbeWdoF+Tqo20KPGA6e5rJ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296277; c=relaxed/simple;
	bh=LakCWVtxNOLPB28EcYypJZiFEzPKCbvPJSUDgkRUcNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ID/gM6CJW9wTYAaACk2KUpYZGRPPBOQFDOKxKublPWM5Gh3ADYh6u+Zhhne8ubnzWsG2IjwXFjGGzNThwR9Hc/TeahLh5w0NPTrfnG1Iu6oKqiBAtH1Z0Lkry+h8J7h+OtZufTlzBDcnJqDWf0072ey6nEXBmfGn31GgMdXGN4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvEcxPAB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0EFV8Kc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6340JaYA1309160
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 09:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cd1QHQCciOtgXW8uIyPAZq9Kf8JgqbUGNJB+IrxHiZM=; b=pvEcxPABfnxQgfAI
	bSucIx3oiSWKQ+4uzheBREM+6JpEhhVx8BzVV9MhthTPmHb2qc2qhW65F8jmS5Dj
	Les8l4xNt38dDd6qCCnArVvRaG252OsIdEdhGgn5xVy2Npq6PW3fO8gdwNCLZGUe
	zXZFJUCFa12JM+lsrw/cTty1mu12etSE/1CSURaeRX8bcQHzliXJxTHiIwnhyV5o
	nKIChSJhUh8zMzbs/tizQSb/JZ/Z7OFs9FoeMevlviisaIYFLb2haYpjlQecLa+R
	ZIn2hiwN+aBzvICJ45tfMc5ENot1zVBESRBQcsigFrMhk7CfPBllEurT7GAx0DU4
	OOePaA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mgu4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 09:51:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50917996cfaso84482071cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775296274; x=1775901074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cd1QHQCciOtgXW8uIyPAZq9Kf8JgqbUGNJB+IrxHiZM=;
        b=G0EFV8Kcqgo+pXTkMoFQtu/SoXieJV9A9S2xAZl3eAniGP0QgTzAxm7KAdGqNOQM6N
         nZEuHkqAQV49LTIXg3JJhwZ3a3RtomBvP5l/UdpsbYU47VCor4DOjGYJk8L6N+koPEdH
         LI2KubA93TdKW4L9diGPfKy6o/ZRQp64Ap6J6Wbg+E3HZo1KeMNLhFLiQttc8ZmM3J3G
         hfvJzz/p5U/eLHthbGUY2BjKlTT/0F66qepk6SprXRkjAy8tE7mb90aWWPyq/9GeKohy
         1uJYuUDTzd/0ids8V1glH0mjSnDoRuZMEMtXWevRT3/AQ/nT57Ixsxkg9ldu0bRLc7k+
         QfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775296274; x=1775901074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cd1QHQCciOtgXW8uIyPAZq9Kf8JgqbUGNJB+IrxHiZM=;
        b=sk9eK9XG35amiUB+GRClWOEYWvQp5PFbWqvvEQgfflU/Z1V7X3tyneTfE0+pEHjlAa
         0KYiv12q+SDa5v21lpXFZRupJ/ixnEl15klA27jitCw6XNnm+TdIQMwlikwd2SSGiilP
         qvwspn1K+pHPYvaYLoj+5Me9Y3FfrH4Z2Ru9Pdfp0CQ8diyxH/KeAi3wY338ezeWpyXo
         1eizqxAkQNsZ9ygA4D3Vb0zmPVvfik2wNOsD4ph6CHvXl7aJXwkqMQYkc0TeGBEWOnRE
         DxN1WI6GX4qXDXT5rUo+t/xvvNiv09yiCVqY8rfWOVPXqDoE4ZQDWg2zb7y/D4SYxJ/L
         CRFg==
X-Forwarded-Encrypted: i=1; AJvYcCXWTakv7NiR4R0IrPylDidDeHYNEIAo4hy4xgdBSNw7OT0BaR273jG1HqUZgVsYPhbVJZDR3NbsQQkJ+b/C@vger.kernel.org
X-Gm-Message-State: AOJu0YwwiUewUOT/aBWw8xufORgSaWHr3qxfVYCyav2Ek+sziEKS9m+R
	kKUUfTpZsajjVyqHOZZZ8lO1igSZV/+GM4M3oJuoVHZmz0jYtsaxfE86OdFWy0+vqEZ+RcEyaqR
	y772KLvXVetUP5p8G0Hx60W/+oKjzii1NYah4D1hBbtGvdKsJO5uhYJUdaz/GvcqHTlvc
X-Gm-Gg: AeBDiesTb4ncSv9q0Woa+dbcm9KCUPZAIYxCtF+U/eDDHJwi0h1YLQ5GL1hOcpHRK7f
	vVMPY5cr02m7n6cvnaGsyOrD0grbSFX6FPowYx3r2feYhYp+5Tuj75ChVDd7IVXp3t0VmxO5tHi
	d+OYpkNHaCLXkGOW1AHie7HdznKURLHUWX1gg89z8j49g0EkVyl3YfykVKu/30WqF4UJW/dK4LI
	Pp1buuz42PEzDxVUhRojYSyHTfrUER8lJC83u6xLZnZ6Q/Rv2BdaN58hwcCKTOQnGM/4DthlPsh
	m/oj3gShQTDgH1guSuuUh9GkEX1nMHioAmWXGG3W4TloOLb1s4JVEOUduhOtEQIO7KQ6kFnrmMO
	qXOBj6Uhqd5yV+mfCK9aJes8RaXtieSj22ofp6MEnnq6q
X-Received: by 2002:a05:622a:2508:b0:50b:33c7:5d97 with SMTP id d75a77b69052e-50d62a8d033mr84037481cf.37.1775296273849;
        Sat, 04 Apr 2026 02:51:13 -0700 (PDT)
X-Received: by 2002:a05:622a:2508:b0:50b:33c7:5d97 with SMTP id d75a77b69052e-50d62a8d033mr84037131cf.37.1775296273433;
        Sat, 04 Apr 2026 02:51:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm24098466f8f.15.2026.04.04.02.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 02:51:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 04 Apr 2026 11:51:00 +0200
Subject: [PATCH 1/5] arm64: dts: qcom: glymur: Fix USB simple_bus_reg
 warning
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-dts-qcom-w-1-fixes-v1-1-b8a9e6806e0a@oss.qualcomm.com>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=931;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LakCWVtxNOLPB28EcYypJZiFEzPKCbvPJSUDgkRUcNE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0N8I+47EOZcoo3l2aMoTYORMcEcQDgdNNp5Rp
 uQJd7DguiyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadDfCAAKCRDBN2bmhouD
 1xPJD/9LADqZeiFhBC5DM0KUyshmjeJ8/rxC5lnAxMm6UYhev6HIhW/LGQnBLHI6hCOFz1+X9hD
 OL5H2oxNCk8bNA15FH7CwQev2v5JPngkhN2yD5ACtJhqzXmJmCaPUE931xxTH/DL3JWohDmm+Js
 5wSWt5ZW1HKYRQc3wPpmw9deCm9u7jM5qp7PZJ3sU/rmsaFsmg2dAx5ALx8kOlqOE2zkS7ITBnq
 nGI/nD+n/AedSkiy7WUMUcDV8lgshMgUy2afrQLEiPREcfv0Z/C3J8m4ipUMswxBC0RYpD6K4jJ
 589YLObopTYgTwXFZQbLh+qkojBDxufYrPXllkcJgkj+VCnqDeTO7U9ax7BEyn5dNteIbYQnrPF
 s/ydNQysuo4fmNjSoPrzN2GpYtfCQ3YFDz3QiCTKpXtgWbFvcBmp8VFa0wpRoDv0osMUwYDSyd8
 B1QztopuZhKFrh5wyvtmlRgnx6fEDoBYQ9tmVUU80mMmRrp0oQLi0kIePVO5b0Q+IaoKxkN78bh
 LmA5FZeD4RxJURuH7LJAMLo6+vOtPPc8aSbxT9ZBy2aTJV/gN8O4aas3Pdo1ewd4CpZQQ0LdmS0
 kfQz10di9+PeKMSZhpEVaI37zW4X4RwTqg9M0sn5BRSM3GJpew+M0xm1EignNASkzxmZGZ5izrh
 cQd6uUCOiLCo2UQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 5RvfS-3NO0Fa_BMvxCWawtgibJhkr52d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA4OCBTYWx0ZWRfX4T4JJjPgdQt/
 8mXfM3GuU2exdb2Aq+w5ZKsDrx4SfQGNoxwf8iEeqLmZuM6rztZeng4TcwT21YXBVV+XwJZiD+v
 WI19ehNE3QYG5/Z6UV+aiJP66YJLP++BScJwVfw09oaCSrwagtpSf42Ufz4MPJa6swJh2iTlwgo
 azBiWJE1AoCmeINHGs/eRNZteJm+VREKNgR8G4TbnCxJrHP3CyJsv7HpWuBJc/rTrWU/KyUuQXw
 /EFVuLaLlyNmdXvjd9vVAhW0E8aOosZI//LFwdvXcXB5uu3i/AwIq+pVdDSAfIIutLkzBEFsvge
 BPMLvE+ZYnK/YXw5u8jqTOJQHUzgU19xof629mpEP9yevi9LrFwOQ2RmtyWhc8YcgCnC3v+D7Ee
 e7E8lmejG6sUlP5HBifVb7i/eui9s7k93LZ2kt3SqiXmn81ExKxmZP7G4/NnD4c+X1FaL/2v/I9
 p+pRMmAFsfLkJUv9xyw==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d0df12 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9adxwUlGMSoq6VjUhU8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5RvfS-3NO0Fa_BMvxCWawtgibJhkr52d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101762-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 337B139AA8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the unit address of USB node in Qualcomm Glymur SoC DTSI to fix
W=1 DTC warning:

  glymur.dtsi:4027.23-4093.5: Warning (simple_bus_reg): /soc@0/usb@a2f8800: simple-bus unit address format error, expected "a200000"

Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..3389103408b6 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4024,7 +4024,7 @@ usb_2_dwc3_ss: endpoint {
 			};
 		};
 
-		usb_hs: usb@a2f8800 {
+		usb_hs: usb@a200000 {
 			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
 			reg = <0x0 0x0a200000 0x0 0xfc100>;
 

-- 
2.51.0


