Return-Path: <linux-arm-msm+bounces-103957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oqe2K9d/52k+9gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:47:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F2C43B7DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FFEA3032053
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 13:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D993D7D66;
	Tue, 21 Apr 2026 13:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Isx/N7YF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSqfNBpa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CE03D649B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779153; cv=none; b=uO2KHPQGoI+j8IpSq3TKlJCvRUl/se0269YwnIMecfyvZTPZFpW5hdcbL7liyNQFDx1koZjJHC5UyRjamDQon8Cu79pmosyLSP2ro+z+6rvTAVxRaR12QAmkWJFLtBjKyhz2KEJ+ifXxDZkESeH+OWKzTh2XDkGHn+k9BL53qeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779153; c=relaxed/simple;
	bh=S6jjTCleNcu0vIG5300IM3tNAZH+zNA9zUPQ/TtZft8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cl3Mqm4jhvmO7s5PdvDJ/zpAu2OivrHZnu2wXnGj0zEzT/E4hU6I/waDzrybE8coKkLmv9YQxDp45+GjCiM7C0b6NJak0wKh/F3hCfwMILre8RXTGyc9JPqvP4Pb87rbCCqMxHRI7s8Y92mg3OAea2YYY3w3NcvO56l2PVelf/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Isx/N7YF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSqfNBpa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA6Cch1834900
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MaY8gk1+nT5Irv6Rp1dV//
	vIVI3CF6bXwRK5agblBYQ=; b=Isx/N7YF/96UiWalIUU5uQ+LMqOmhlofja947r
	sNqI7iB5+biMFXg5uSyyu46nm//jJUJWSJiZqoO+w1q61swkOiSa7MaZ3heFNK7s
	kbndAAxZLmprcYnLTczaFg2GnSnD14Ki1ESVIp/uMSFTBUgQwizSv7pQZx3QNlh6
	TbkEqPf5CHS8nt52kRhh0XDyDgKo+SVwU1ZPznS0qhPYYIT57NQG7MU2a7rg3+bJ
	/0eaBpZ2UpO/TIGi7Uf/Rh+hZnx+dPOWOtLur6SuhElrLMfa1G7Y+ag/kRRrKuZr
	JQwhyoLU3Y18UCk4opeBZ1nVXsnV950P+cEqjWMaS7L8wGBQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp76grqcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:45:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faf1ecd1dso16318721cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776779150; x=1777383950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MaY8gk1+nT5Irv6Rp1dV//vIVI3CF6bXwRK5agblBYQ=;
        b=fSqfNBpavUn9F0J0US0NGrtCNOlTR2n2QYtDFPTULbMEwlF4wHZNHbHX4sMr2rCeWr
         LaiKplLemgYP5MG6iDf15/AUwDyaI9j6e3ZWYrW1aAq53CttiSHjQweH9efwIQV5px62
         AdpaOZhfeCtSYw5G51+Dgnrpl2qxv0jAVb05oQ9qPwPdbCwSYiS7QS4VwDOB+lc3Hb4J
         l2XDXyOWK9POSCA9UL24jkJO6Y/bRO7yIA0i5z52Sf92wIrM0PicYzTIEIvOsGswpxtn
         gMqZxdduKYSYHq7egnhyl0C1slCG5MnEBytnYrtxEy6N7HIq2LJFcmpSsbHKqCNw0k+R
         CJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779150; x=1777383950;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaY8gk1+nT5Irv6Rp1dV//vIVI3CF6bXwRK5agblBYQ=;
        b=WLEQ/lMdrVpiFhShoeNsEwcJ8rsp5iANiigu4SKJcQM67Y5eYMS0K5k0QkBS+EdmKH
         1COqnfSsddHtmo3Ex/b49yO9PvTHJncDjn6Itu6EeLkZYGSd0BvivvS+p/4U95QgHeWJ
         o/60yet4V36+//XULTOxhNJivTHvsBUgwkPRDSmSY17nAHTURpB00s+Kr5ok8lbrJsqg
         dxitthijJAfawCbNv4tKyeP5HZ0PsMvWiUoIexBkqK2VGd/gDugACn7DGdH0u5jKyVmR
         slBxHN8vLVtG4U71tJSTgzUnawuLNA+o3FDjnwvL+GNWo27FuUunnClX+4wPfHBgWOF7
         3pGA==
X-Gm-Message-State: AOJu0YxWwPrdLUgYeZHhBkt6xgnML+zeUPG65aJPsZ5NmkFEVm6JtKHL
	FqVZoZxc5REkf3bqnFmkSMjOVN31p2epRMukk4S2C8A19kXAqHI8x+qA/UcZK3N49adHi06uDrk
	IjvHQVtSZgXXCF9GE72+Cro6OA1oU6XwMElhgyG5LpKga2mzvpXAIQQfztePjgDhbAzUR
X-Gm-Gg: AeBDiesq2QYh1Rfnus3jWwHNifrm5sBy4wYebllGOdul4bK1NzEtZH+2BR75xLA/1se
	Qd99g6y4yPHDE8kNSix9uGSKKmh2d9xSoEsI+4tF7whl7UlC+jZ0wd/tS4T+S3ils/q2EY6VdtU
	5d5zKF27A5JVlOaqW0sZo/5KAZkT6AgHUxAYlZtTgsfZF/c0I0RNjel5p42twE+yxCXbPyeDzBN
	CaTFgVQ5l0QGZhKspIlKT2jfxTtVlFxVq+NDfdsFQjyq++nteARaMEA4LnlvKURGdVoWCOf1rmX
	+KuaAO1X5pCARFYC2u38DnH7Cqf3t670WAbHA9GEAQ82wNqkcuUhmSKHz0M+TnizpVKTaosEZFK
	6m39pUnBQDpU4hVfzZtcR/CgI1mNVW/szPr4YSANmSw3+64FdQ/PD8MI=
X-Received: by 2002:ac8:5ac9:0:b0:50d:7c4b:5c5b with SMTP id d75a77b69052e-50e3682827amr272220341cf.5.1776779150088;
        Tue, 21 Apr 2026 06:45:50 -0700 (PDT)
X-Received: by 2002:ac8:5ac9:0:b0:50d:7c4b:5c5b with SMTP id d75a77b69052e-50e3682827amr272219551cf.5.1776779149343;
        Tue, 21 Apr 2026 06:45:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1249sm34508647f8f.5.2026.04.21.06.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:45:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RFC v2 0/3] arm64: dts: qcom: eliza: Add display
Date: Tue, 21 Apr 2026 15:45:27 +0200
Message-Id: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHd/52kC/3WQu27DMAxFf8XQXAWiVCuypwIF+gFdiwx6UI0CJ
 37QNpoG/vfKrtGtCwES5D1HejDCISGxuniwAedEqb3lRj4VzJ/t7RN5CrlnUkgtlDzyMBLvfXv
 l2KRvy0OirrF3rp8DKh+9saVg+bgbMKavLfiDvb+9stPvkCZ3QT+ukfvagP2UseO++0fNEhtTi
 R1lA3V8IscNRunAiehB1TOsOc4S8mx1TWNdQNTGqMrmGjVIFMGDUWVZ2RAr0BChDE5Wx83pnGh
 sh/v2ATlrVdi58N9bZ+CCm1JH4bR20siXlujQT7ZZDQ65sNOyLD+G7SCdXAEAAA==
X-Change-ID: 20260327-dts-qcom-eliza-display-64de3cfc8a50
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=S6jjTCleNcu0vIG5300IM3tNAZH+zNA9zUPQ/TtZft8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp53+FG9zVJPsvJNyWMb9yfDf3z0QTIY0vNtZUV
 nCUKKum4LiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaed/hQAKCRDBN2bmhouD
 1ycFD/9WnWVsRHzA0cyhGYOgifx2ICZTvWJ2SmJl0Wy8vdZEBEaZ+/0aXdpAQWYT4guvjuMXrUm
 G7r6SYsxZGF1o73uQx6eDCQ2Opw2u0DEbgXNZJhKTS3hJ/fm6mlmXo9Rlk9JWzEYnGm8JtaYFo2
 cop5wP2ZWb08lB1C6YTmwcirIXpbyTAMLHTHffYHs6Xr7MoWBCxx6wz8N1XMkwQuHMZ1eSyErD3
 A5u1dq++/UYimYsXR4apZOUW0ASvHRLnRLolt09N3vJZfN354eI/F78HcDI1isNhGKuFprGWJUh
 GP5Oy+5ArPnqMwyil86Ij+Tq5oE/+x3NP75r3aUASOU/C71KfrN+nXOBfOK/fBzK7X+d4Zo3Fqh
 j5PIXPBL/p82A0ySa1S4xHcXz1cIVIqZrQmZ3TQfrZHos1B0Ves3PLihzgevo1ZVkIN2cc/XB07
 0oYOeslYh5KoBSgsrVE7vfNC9pKjrPD4mKWgmGgg+RCZOlpcMy8nx8tSDXsvxbbX644oMjhjqvl
 JqUY7W9z+J+++podcOZv3Jnmt0aN+/qaCk0AbMq0KXuoJDCwA6UfoIzwx5BOBAMBKhJEY2e4egM
 MQJcRFe7ePMEWdsgQAYJEsZ2sLqrMH+43/9RuPcgVyJG0cTt8CAkLcOhM38lP6kkSh2ptEkyG/S
 K03w+o69rnplecQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEzNyBTYWx0ZWRfX5MRVW15d6NAV
 a+8TjiMncSQHUIhir8jTEEmt6Nuzzm9eb6rKYio8XCcSnhNSR0p5CZlz+Ipp0xe+52+BkNBv1PK
 n/I4GDLf7/+G3/F5AvKZKik9DNbtx0S9eWVvHs8bFn23oWY7jYrSrvOqw/ZRtRjhbwezrZWjMN7
 0hU8xxtkkjOSK4iRdoN+hvEIkA9hzgvvvsSl5P4VW+sCE1i7y6JW+/HfhNplpLHbPjcblMVA7LM
 zUNrqchoTYPRVwZInVkWWTXTNuvBPK/xtUsv4W0gWO13uh9i9hD+hIjFqfmVsvrr5sFIEnZ6lGS
 1zvgWju1bpYSK9IO1DNQDCp4/rspZ9MKiJd651zaCxtA36rAJauGbExkKxPN1n95dZDD+UwSx6T
 iupDvLR7fwPSR2uSVb74CZaRQzUvprbDIqxZmx+D7JT/YyYHbDna2Wpozw+V5Msj1F/5wajqZde
 nbxoZRYdcr6SruAMLcw==
X-Proofpoint-GUID: NT7b6eMW7RndLosRbNg6M5_Kx04J1RNg
X-Authority-Analysis: v=2.4 cv=crWrVV4i c=1 sm=1 tr=0 ts=69e77f8f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=gJVpYn4Q5hzjmsZnAZMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: NT7b6eMW7RndLosRbNg6M5_Kx04J1RNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210137
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103957-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16F2C43B7DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dependencies
============
1. Depends on USB patches, which are being reviewed, therefore marking it
as RFC as it cannot be applied.
https://lore.kernel.org/all/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com/

2. Bindings were mostly merged, except change to SM8650 DP bindings
   here:
https://lore.kernel.org/all/20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com/

Changes in v2:
==============
- New Patch #3: enable display port
- Add tags
- Add CX power domains
- Implement review:
   - correct address ranges for DPU, DSI PHY and DP;
   - add DP address spaces for P2, P3, MST2 and MST3;
   - wrap lines

- Note that DP will work only after adding USB mux, for which I have
  work in progress in github qualcomm-linux/kernel-topics.git, branch
  early/hwe/eliza.  It depends on unfinished I2C support.

- Link to v1: https://patch.msgid.link/20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com

Description
===========
DSI panel and DP work fine.

HDMI is not yet ready, because of lack of hardware with HDMI (work in
progress).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: eliza: Add display (MDSS) with Display CC
      arm64: dts: qcom: eliza-mtp: Enable DSI display panel
      arm64: dts: qcom: eliza-mtp: Enable DisplayPort on USB

 arch/arm64/boot/dts/qcom/eliza-mtp.dts |  71 ++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 444 +++++++++++++++++++++++++++++++++
 2 files changed, 515 insertions(+)
---
base-commit: 1f68839a688f612e0dc183559adf9161f15db297
change-id: 20260327-dts-qcom-eliza-display-64de3cfc8a50
prerequisite-change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13:v1
prerequisite-patch-id: e0744310fa58e080587218e62aa6686ed841689f
prerequisite-patch-id: 1b4e40eb33adf28c8b6105f25f6636f82239a962
prerequisite-patch-id: 4671af784a83f9ce69cc2c502912698476ee7719

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


