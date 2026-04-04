Return-Path: <linux-arm-msm+bounces-101765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBfPHILf0GklBgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:53:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219339A9C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2667F30069A1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 09:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183D33AC0E6;
	Sat,  4 Apr 2026 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neUEVRnR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSJYVYcT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547EB3AB286
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296284; cv=none; b=K14oFx52C7VijkPlIZ61aV1e9ggi6xGU/OT1Z6kBG0dRYlp/QWM3vC7o9Q23b+ZbvUXnyjJcUzeTO88d9HXjFDnW7d5dJroBwvrhNWykkskq0nz0veqPeAJaQYvQ92hr1TF5kyv0D38V+vB+f71n1TLGBWMQ89AWbnMfABVBXnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296284; c=relaxed/simple;
	bh=OeNwcRlQgwAI0BG1pAZa7ppViI2dy6Ooi6YXKdcsrkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=COdwXo95g+jAwo1lE8hBwL92QSYqdmKFRpMlIVKJtiu75Du66BUUXlaDBI9Sgqs+78WEItfxRQnySsElu+R5SBbfCGWcbnl5wlAESnNmZwTzjCqJme1y/KL6tPdAx/eWuPNLq9sQ8hKrxP2P42LHE753ot1gptBR0Fah+A7B8/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neUEVRnR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GSJYVYcT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63428iwA2408396
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 09:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byqd4nCWmFMyUrN2uTmzw7uUAwnY+j4PHal/eEl3wN4=; b=neUEVRnRW69uJFfU
	fSqDhOB6m1XTSGyk1UnKxcnfo8VIrUIWvpGVqVmez7hHIHcyVTGVkV5kgcXQeRyc
	SxFdnfkqLzlAwXCgtzCgySrTuGowr5lAWwZtpUg5/cpHxal/sMSfLRG2vDeVa6I8
	xr5TBwCcSVIxMrw91yCmTkJGWhsaH73oOCUgugh+7Vif2e7i1lqx7OcKmsuRGU8U
	odZxSutlYiZnNYWhgabUTF/3z45o2RlMyHXz5NQNl/nTD0dwWMyT/GdwkAEFEh7i
	/73zy4E8ZPDHvZqImaRo7OQU/3WkAR7vtGeAuA6NNV9+0wiW6rGulmJbmK+ldl0X
	wBMdDg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrgqd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 09:51:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50917996cfaso84484341cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 02:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775296281; x=1775901081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byqd4nCWmFMyUrN2uTmzw7uUAwnY+j4PHal/eEl3wN4=;
        b=GSJYVYcT0KRaVZUNMwAwJEyz05gkZisdqXd2+uxoVXQBaKpM+gfTfmDuod6HTpsZAl
         hpUdUAvuozmUEuFZHLGj0OJzc+2hwdfKFET5niG/O35Z1eP8djbmx7kY9GzWrhI+Etgp
         8bFw4yGnI9eYZ1RXr9McLMSnErTQBn7VoRAVETzIWD+9Giasbymb6RPIHShIAX49wnGh
         Ivjp6yLff9t2fKPg1VvviziyJf4WoTqbIxGz4P1JD83bVZOW49/X6e5BusoPI79n1XeB
         PDbsvT78GqwylSlctHMcCAFZdeXPyUvXFYzAV6fbxhV20a9zqq3phBlD9ucQ1c2tmeXc
         IanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775296281; x=1775901081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byqd4nCWmFMyUrN2uTmzw7uUAwnY+j4PHal/eEl3wN4=;
        b=iLP2+JSzFF3xBBS5IejEfRPzn7VypIyQe291IYKOxqhxpUJ9cWVn4jeknBd6396vPk
         Sk5ouJpQUAZFR08ugd1YrVgGjZivdiiradLTcv0+yjLrn8fQW37pUYOUJScPSxjYM9q5
         x6iLsQe9afKq/pY0jbBgz7ZwsfLxPUSaWMqSfCDISQLgSIrcJ96goQXkd5dYZfsNm858
         6vNgSePcWBLAnSvxaF46QGRAOofgGMRJuNbWJnQZFi3rdMuXZy0rze/uZvu/zZH6O9IO
         Lu9AR+rT6hmr+oGR8DaFooGqcmttm6w+CzRp+xmQpdIuhQudmzn+nuWwlJfl0Ig0yj5+
         em7w==
X-Forwarded-Encrypted: i=1; AJvYcCV8msCeUjbe28Ooh0GsdDDtxUnklodU0yTdqToqAf7BXpEbg5dLrR8lgz/qU0xA1z0Orkdto35ncWx6WROE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+CdBGrFCO7tpftkivX8MFW56TtUnsgFlzOgwi4XbsU1l6hBAa
	YYIf7bj5QOgnkbkOqlNLWbHQAgq5zbnBqaA09JKd51WqmKA7TpyctCm/tzuQ2V7XM02ONkEyUC/
	vcLCUA5K4GDHpK+PBxJCqnyTnvu/MWkLyRRHZytHi8FYNzDC8j1gZuJMVXpOsVtiJuuV8
X-Gm-Gg: AeBDietKNPFzDeTZWw0zcZU3coN1p27vrTxYyNtSpYGEyMGHxx8Ti6nDEpSrLD3QXHe
	QCBcWBOYe9gQL6fhgEcOkxD2I8P/mcd0cQqaPJZ2SmIU7TARggv7mrtkDlDYujwrAUmj2TOZqVO
	5JlDVS8u19T9YIA//mRsuKpPBD8+1QZX7/BMX21Fpcn6V1ywbdJTgBcFIAOb3Rn51vjRC6Agidl
	b0S2Cloahz/LqrDtghM+5zfjX4zFocQ7oiOlaIHOOiSd08ew6i/BifKEMj1QkZIgoRJUOEA9mzy
	PZ4BNYuiQZiFFrnE057rnPsVkPHQHRylq8I4wtoKdOatJ+gpwmCRFGEBHg2PUYfsSUWd6TW3y5C
	qvLpEkJ6tXrqVzsPAc+23Y1En0NkLuPQDYeBmJwKfxiVV
X-Received: by 2002:a05:622a:1a86:b0:50d:62d1:c3fa with SMTP id d75a77b69052e-50d62d1c974mr89291291cf.2.1775296280782;
        Sat, 04 Apr 2026 02:51:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:50d:62d1:c3fa with SMTP id d75a77b69052e-50d62d1c974mr89290931cf.2.1775296280296;
        Sat, 04 Apr 2026 02:51:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm24098466f8f.15.2026.04.04.02.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 02:51:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 04 Apr 2026 11:51:03 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg
 warning
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-dts-qcom-w-1-fixes-v1-4-b8a9e6806e0a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=983;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OeNwcRlQgwAI0BG1pAZa7ppViI2dy6Ooi6YXKdcsrkQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0N8Lk2Wd2Vds5fIegMO6SFm+Gtz25G1xBPLpS
 +F++phK7s2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadDfCwAKCRDBN2bmhouD
 1zdVEACO+1qTT/XUzfQBdb5oYUMX12zACfQAFHCQD4pMaIA26UjfbvQ0PmdyXIAnC1G7LA4Pvu4
 pvOf1WmEWSf7jb/mOK8JqxP/CbNRw9lvqpyoUQaz7LQcGHDP8tOXHUH3+v3/zA8cqVNG/CSnoYa
 ewb4eXzoaLFJX1lDWlkHIHt2ONLTt4VXkeEHBHNEb7Sx0iR/fv/kXfyeILwd7bdBze5yaOXxiNi
 4oYh8uHW9iNg7h2ajRRl/eTe4OuKsf3lShCbtUBFOk0Ioj5fZJ6joYmRYyqVgUKBJ/7a1kkfjIJ
 1DEejNfVMTxrYdomIbU6CvZJy/CztMGcw0rpHGZJ5/ecW6+XLD0yS86D9gSuNMB3IrVIibR8sDX
 1MhETd0NmFzPqwW3paCEp/Ta8SZeiR8IzYnLb9iCg+Y7cGkKBWZYBxh7rtZ0jf43DF+oRxgSgTx
 oUZKA2w0lFCTuHSwgnyqdB3m5PWvLWoNTcrMpTwx1CLKg4OSTmF9qwO4Eqm4Tweii8QKkCHuKGd
 WDn5QT9lBiKwgWAkGAVaWJRHCA8DBNyw5hytIRJZMYkkdAXLPiQilCOXijiIRn8kCzhJj9JYsuo
 nLyB40FstDAMLBM8nkC8NUQumQu0cdmT7QUImKq7VesiKhZV3pj3pe6iJqQEGFs0C4ewWJmNQZ3
 RE34XBES9ycbNhQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d0df19 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9meie53SDYsjhsWzb5oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: h7AigUteaAsDq3plNu5oqPNPbdFZQNSd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA4OCBTYWx0ZWRfX1twz33n/8JA0
 ENTuHZN5m+2TIXkzjN7JDm2mv9d2HkZLy2+ZnJSkwebHZYbkMJfajzELKJ56ifS9+fC14h9xTSE
 xBzJnqMkPXHIxs03nslb0F7/6Nv8ZUN6++y672uM9J+aTb9vzD2s3yD63HZovvdpq1cNaWSW7wU
 1SU/Pe2xxJ8qbtorKrPW8eUAuAHlcvP2Tw5lBru7hZeuVctYTME9jH7VjFYx7+Igj2AbG/kRBHt
 I1Ptvbymapd1Mu1525GcJwY8lDTU7lGHnYBleaJi8Yn84SVtQnAvMZLodro7gOoQPm57fvyJ8ZM
 k2VT0PI/yacXFRKinCZL0CB47p47bfxHaUcdM0rgjn8++ARhrZWcyUbaNzLwMgYQrdpTHUMz0+h
 B9VzpTDIieRwKVcC9LZJ0UCAEUJCUg59jaRGkRaf5RC0OBODZubJ/E/HE0cQvC4XzxiERhTFRzZ
 q6zqYSTRc3fi9/1/h5Q==
X-Proofpoint-GUID: h7AigUteaAsDq3plNu5oqPNPbdFZQNSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101765-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,88ed000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6219339A9C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the unit address of phy node in Qualcomm SC8180x SoC DTSI to fix
W=1 DTC warning:

  sc8180x.dtsi:2650.31-2695.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"

Fixes: 35e3a9c1afce ("arm64: dts: qcom: sc8180x: switch USB+DP QMP PHYs to new bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index f45deb188c6c..e87e82fa73e9 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2647,7 +2647,7 @@ usb_mp_qmpphy1: phy@88ec000 {
 			status = "disabled";
 		};
 
-		usb_sec_qmpphy: phy@88ee000 {
+		usb_sec_qmpphy: phy@88ed000 {
 			compatible = "qcom,sc8180x-qmp-usb3-dp-phy";
 			reg = <0 0x088ed000 0 0x3000>;
 

-- 
2.51.0


