Return-Path: <linux-arm-msm+bounces-96283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0xlHJZDgrmnsJgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:00:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 128B423B28A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC8F2303FAEC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 14:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E309C3D413D;
	Mon,  9 Mar 2026 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M1S8Ukre";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZ6EY317"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78793B9613
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 14:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068243; cv=none; b=Ei2U33ffyj0xZCMWut3Z6PioRh7ufxANbL1aEV/00rWyGQ59wiDvSaZmpEgb9Gx8ej/zCx78ChmF+O0Zojg7BqQgYs21UnB+hngCZHBd5zXDlon1kL7236Rq6JE5FpeXJVhAuwA8qMOi7JDx9SlLXzKqaoNueKhLtjtHNKTSGlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068243; c=relaxed/simple;
	bh=7H6VIANZ0RBiB1A06Gz51f9HR+VtPArCuF/8iXBh4dE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l0BkI0PTiic9fA0TVcbwv3bQom/EFpTLqY4N1Krk8V3U/1pzgd/6Izqv7tyQ1w5Iz7Obz/m50LUvlMLGG6vLAy3qn9S8Wk+ABazou4bDmB8rpUy1RJZ4SepWsvjDf8DhrrGEJKWNQehojT9k3wnGLJ4SRfc2LCQ9umP7W8o0Ir4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M1S8Ukre; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZ6EY317; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629A6cla2195081
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 14:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p1TmyoKW1BJ9Ss0vjcXvLu
	OeGHU1u5Mvxhfspyg0i+Q=; b=M1S8UkreNngysQwjdwKxmwbm6I4iVRQvct1sT+
	J2vsbfkLAAyX9pth6EjG/SvkroS5Dv7mLFLMdr7VkApJAc3fgiPTwgMcOkdIR9lu
	mVZSG0TdgmKob9YZxTuQIFnQ26AasStfNsWVdUbft/65v2I0qZX7LchDgnpRKgfK
	ztPMFQiLgnBlZdc4PIIo6rz4L7rcrVbpGeLKUfomUig9oje/2sBemTWumrp6RghK
	jA5/O+Y3YsHr7GXc9Ue/FwjrVqn6KuIGsokihgFfCr2Qyw9WcylL8xKHCD7QWoU5
	c+TZUQeA8cJC6Ze0HR+lCveUSnjuFgF9h9CwomUh50S130CQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5u8w49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:57:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899edf01747so618610616d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 07:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773068240; x=1773673040; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1TmyoKW1BJ9Ss0vjcXvLuOeGHU1u5Mvxhfspyg0i+Q=;
        b=cZ6EY317OqEIPEgoTXpcLDX1EWfeN+8/AUjgIwlTjVowv4uwblnJwojsIgyG8CLTnl
         x1uiPg9Ei/ZvxixRzzOxhYIPlonqg6f0XeP9BKxRB6moQG/YcQ9Umi1zqry/SW1vc385
         wiDDOCytiUfxfRiloeut/R0ba4yGH/JlXlQ/l+6Ov+NUPgGqRut8uTMmTr9C7jUdMIqU
         uWK5tgxFbhsbbOukH8F79/7aDEP2zs3sykraAAlw2pne+OQ+Dm7p8OZjofbzIhyTlWcM
         RjgFXGM8aqdccQtH4bpadbySX2lO7HSMbujvmKsAI6I4DspNb75ixflXheSYjr/LG+kC
         GyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068240; x=1773673040;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1TmyoKW1BJ9Ss0vjcXvLuOeGHU1u5Mvxhfspyg0i+Q=;
        b=SK+JHPaOn46lLHw/PMUKxcRjv/Ar84JssX3lFLPMCbfK0liyh8YBWxRl52gqZJEqSs
         VpyQp91BR9z1dfa+UKdWcLsHJ9PRPyqtLDbml/HjKD1ireax5ux5QZ4hEsjx8Bzlxd33
         TrtPCu/1uT/GANU48tMo9WGavCjdhqSRlOj11P0dkBC1Gs11GgFlQnSx4xMC5ZB5ulGs
         k5iAPldNVtZ+MErAM3A9qPMWXo7uETCs6ftFyoyGuS3+UYPyLIvxZX7rTS3GuAIa5Jm8
         SuCL0b6M/6jvrOQwXajY38zwhtLjfiiOOMr8gb7idUGc3ayauwCXgL16S2pPbIwcvqms
         tPbA==
X-Forwarded-Encrypted: i=1; AJvYcCXMNkwIXco+V//kpGdky/Zxw3Ms0vYShRzkTyqjMFj5EYU4XOeZF257hDzCA3BJ5mHAaWAlC8hKaIFAOmFD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+voiedBUWpstz0b4F0ste+b0LBmg0DoHBBvuunQaLYp1SElaY
	3/rVN7KdyIcubzDwXFE6p6LnwkMY9Q5Q+7OwZMtTs0O9lcFtBe9KLQIH5+Rn60CpqsvEjP4TEMZ
	QB8o/IMoghr0ikXZJufQ9WeTOMaX0yQMg5+fzb3+d3wpiAJrcjtqP8CoDySw9TL7A82YT
X-Gm-Gg: ATEYQzxyoOpI5szLT12cnoVDX1dVusAwZ86BorA+k+cheFgYMU0Uqv2i4ffdnRfsSSF
	9+DIZlgDGuCDa9U0BIrG+2Y5WtBwVBB9VVNmAlPl+pTmTkT4v3Zr3AX6iRtYLqQZ+HrrZu6yHSE
	HJqvKHRK7QI7HHmTYwC8DpEsStHO2vQvnjHPyhdqHk7CJhYvcoIvPxxFKnzK95ngBMCJrBWyaXR
	frMvSzzUx3N7PM3QxMOgRzQtxD7rC/B1u4P246yQf44yj7W5CIf6UG7s/Js3u240bDocQ+SzhA6
	qcX3iWEwZHq1qHkttmBpHQ/SyYTEFvKTK5i6LW1r8ETXG2NmjBydUtCmGt/Enm6BKVn+efaOHrp
	kfplk8kv4G2ICNBZevQVf3EiEANOMnQ==
X-Received: by 2002:a05:620a:470d:b0:8cb:e00:8c0d with SMTP id af79cd13be357-8cd6d4a701cmr1429335485a.74.1773068239945;
        Mon, 09 Mar 2026 07:57:19 -0700 (PDT)
X-Received: by 2002:a05:620a:470d:b0:8cb:e00:8c0d with SMTP id af79cd13be357-8cd6d4a701cmr1429331185a.74.1773068239329;
        Mon, 09 Mar 2026 07:57:19 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm29906008f8f.5.2026.03.09.07.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:57:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: glymur: Enable SoC-wise display
 and eDP panel on CRD
Date: Mon, 09 Mar 2026 16:57:12 +0200
Message-Id: <20260309-dts-qcom-glymur-crd-add-edp-v4-0-fe4e33acdfb6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMjfrmkC/4WRy27CMBBFfyXyuoP8yKPJiv9AXcT2JLgNcbCTC
 IT4904IiC5aurE80p1zZ+5cWMTgMLIqubCAs4vO91Skbwkz+7pvEZylmkkucy54CXaMcDT+AG1
 3PkwBTLBQWwtoB+Cq4fTHssg4I8IQsHGnG333sdZx0p9oxgW5KPYujj6cb/azWHSLU8ZLmb10m
 gVwIKVSFpURKLed6+vgNz60bLGa5QNGYwv1GiYJ9k7KuskzNFpvfYyb41R31HDY0LMi1ROp+D9
 IRcjUiqYxWtiyyX9BXtdEAh4nin1cY3qmXiV/Zr64TFFDnIbBhxFyUejclpYraao5ZT+Pd8dIW
 Ty66SRAI2rXW9e3EQK2YDpvviIUPLXcGI3YlHeQriPCMrQbq6TH0wj3AHLa4PoNIL2FvEACAAA
 =
X-Change-ID: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2475;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7H6VIANZ0RBiB1A06Gz51f9HR+VtPArCuF/8iXBh4dE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprt/Kg3FdiXk9XfZ87bNltr/lYQhzGJrQ/aSrD
 DxFdCpo3zKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa7fygAKCRAbX0TJAJUV
 VpTjD/9APV6vq3sdhIX6PW99Jkx1sMgG8h9bMo4uNJiik4gB26Rt7UHEWajzIjBNeBQIqgriVrh
 zYxzlS6JCw0YfCb4E2zAJabUY/OfXMXYYRs588ZktN0Qu5H2X+ePSWGr21yvBVIQXHRxHzIfQfH
 CggcZOgcv+BN4MGNWojBLMVfGE5y+ScKx8AZLusF7ZiFc0rBuHp8Bhh2KmSW5uTZ4dZ5cIaBjRa
 hpATNF9CEmZZZSHOf5CX1r5Ur3R9N6O2adFjXv5UlAZgu7AklVL7sNgHy5gUE/OKlpkxUqkbgM/
 lt02QK3C7Qsfj1YYDp8Q0ayFIl99Ot8CLgeVUprbbOvDmdItw1dpNj+hxC+tR8zTgs0l+YImL2D
 Usl+cDapEZezPcifoOmd2qjC4o4TQpgZQl9btIP04T62I8yPt9ase8N/9u4Ci9xPOqwHT6aIZbr
 /c+i2/YG+rqS+H5YXxfNDiMQwEpvZcMX+2aoR7KZGwVT64qgaAr02Oqk7HFn/XDjXuKzhazt1Uu
 DU8PKUWQ0/ypD81qj6cQfc0QzMVgk413FKLPH/zCsWyzUpDx3FtQqXde5wG+yjeyxqMrAbgPOXL
 lrRmEh+FAhZnX3vTrypeJ0pOSix1UxxEnE0STIpsMEfRU3CnZtQtuB/SV+OT0jqw/N0pBQpK11M
 SpjTalkaL98ezkg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: uQ0il_GuRw0Hb1VktUbkprVyENF5nefe
X-Proofpoint-ORIG-GUID: uQ0il_GuRw0Hb1VktUbkprVyENF5nefe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzNSBTYWx0ZWRfX9/IJPExHtFSm
 EmvUHli5o1iv4TiAPmbIeRmzhoRKg7CE9jJBH6350K2NL7tbKXihepWhr9fpoDpRLmGXuUv6tg/
 j7lcLH18ltjm2bma3ovDf69odjeR8tIp+V6wGOTHb4SwyAPcATiY17MBQhIhwDomGzyWvzmlhz+
 zRXvHue2dFUCCycChmf8S9e6ILaClEVepGMSkfR20S5P9DoQN4cilg65tx/kXUhc8UKlJBLzh5W
 iZ//CMv3XCrxfK6fQ90k4iksR4jt25lCHga1QyBnfyKNOPfPpI11xeeGSAq+8Sb5z3NIu6NLA9Y
 KU/RpKNnxAWD12jkpDA9rUsvf6jDmglM+HaNl3CT3C56xe5KX6Oqto3V5Jod3+geU9SAuivSdUQ
 +l3TT83HWwq9Bu/Vjsjg7pZJLtINRNdXVNxGZSqmj3hGhd1FCpVFYbqCE4i/LQuQRyAtGq4lJMI
 jV5uXhGT7PfWQ1QQRbw==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69aedfd0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=PbHErJ4ZefRVaExvjxYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090135
X-Rspamd-Queue-Id: 128B423B28A
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
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96283-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.942];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Start by describing the MDSS (Mobile Display SubSystem), the MDP
(Mobile Display Processor) and the 4 DisplayPort controllers it brings,
then describe the PHY used for eDP and tie up the PHY provided clocks
to the Display clock controller.

Do all this in order to enable the eDP panel the CRD comes with.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v4:
- Dropped the RFT as now this is tested by me.
- Dropped the 192 MHz OPP from the mdss_dp0_opp_table entirely,
  as suggested by Dmitry in a discussion off-list.
- Picked up Konrad's R-b tags.
- Link to v3: https://patch.msgid.link/20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com

Changes in v3:
- Fixed opp table according to Konrad's suggestion.
- Added missing reg regions for all DP controllers, as Konrad suggested.
- Fixed all sizes of the reg ranges.
- Replaced all 0s with 0x0 in all reg ranges.
- Added missing clock name entry reported by Dmitry. 
- Link to v2: https://patch.msgid.link/20260113-dts-qcom-glymur-crd-add-edp-v2-0-8026af65ecbb@oss.qualcomm.com

Changes in v2:
- Add missing PIXEL1 clock to DPs [0-2]
- Use the same opp table for all DPs and drop the dedicated ones.
- Drop the extra compatible from DP1.
- Changed compatible for the panel to samsung,atna60cl08, as that is the
  actual model.
- Link to v1: https://patch.msgid.link/20250925-dts-qcom-glymur-crd-add-edp-v1-0-20233de3c1e2@linaro.org

---
Abel Vesa (2):
      arm64: dts: qcom: glymur: Describe display related nodes
      arm64: dts: qcom: glymur-crd: Enable eDP display support

 arch/arm64/boot/dts/qcom/glymur-crd.dts |  71 +++++
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 466 +++++++++++++++++++++++++++++++-
 2 files changed, 529 insertions(+), 8 deletions(-)
---
base-commit: 5138081b838d92e1bfcddc7b72b9215cca6e83f0
change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750
prerequisite-change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v4
prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
prerequisite-change-id: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9:v4
prerequisite-patch-id: 64ec868b066c682f08ff9845e4507cbf7f8f671d

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


