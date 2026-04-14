Return-Path: <linux-arm-msm+bounces-103181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNayKGx03mkqEgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:07:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 004403FCD64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 340F1306BC5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6CE2DC321;
	Tue, 14 Apr 2026 17:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MK/W1e3m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmDs1Lgs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3680C2D97B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186368; cv=none; b=m9EMffc+LSteQiPISx+7b9Q1m7cOmzf0SeJCPMW2k/CjA95rfzYCz1gPlSmfefTSXN7bZrRhx4uqIBxQh8tT37+5G/oTDBBOeAPdIar/l5DCmJ+5J4+LkSsmdoSzReeRT0Oc/c6EsN3nFEcvhZ+APwLTrYwIz/0tLCK2uNO357U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186368; c=relaxed/simple;
	bh=iFhoWp8t+hLFi2XuWq+PBtpQUXPDodq+j+VervG4ajM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OdrjBhBquLXiLSCuV3JEyiKQ3umB+OuC+kt1yrhOGbdsj+1emiUqwy17CHyKIJtZTFMBdhtbKpOX3GnO6lsB9y7LuN+b57fokcfIeRs/Pq3Oju2ySOV1FU0JLKS/qY+9e46Z/Prxt1naSkHB9in6EZy13fnvz94mmAY8YLKaJ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MK/W1e3m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmDs1Lgs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EGr6P6030017
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XqllaDLxjnXgviZ2peQB8H
	g+mZU389CwQpc1LTm0WKA=; b=MK/W1e3mIp16ZzjZ3/8m2vC8Aknnaf3UJfl1GC
	TaosKLqnUvb38K3M+VzSWCN9qaZ0+ZIu+/YUoAcgM6NVn/rLcfwQncpViDxE6LRh
	4XnkDQ0I2iSj2sTBqjUIJKfIzApMMAkfaxLdgv8QRqS+stRvsDvikt/IEtMUUlIf
	pQqa+gdgwnv6JnrzzyRSjho8AlXLJWsqYUHe9wgD7lXCR70elS744iszJDHp5/UM
	QdMdFpiTRyF1CQMsjmsZ0/iVlQm1D4GBJPuAzZtgZBbJwKWFOEfU/yu9eVioEozQ
	cYytOWttODrqsUCcPGZCdae7Yx6ENK4v4lM3K+UpkGdcUDrw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhkgmhgyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:06:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d57516c889so852314485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776186364; x=1776791164; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XqllaDLxjnXgviZ2peQB8Hg+mZU389CwQpc1LTm0WKA=;
        b=AmDs1LgsPOU11SI4wKua03uc9dEe/RSKa4Roi10+/Odj8Fl4ZqmbuW9/aaUHjC8oq9
         IuK9bwTNP31VmLgWP5JMHOlGWaUoF90GsaUxS7XORCdsHxCU29Nz/EjEACXuYk0aHoEy
         G3cNetVVne+NzjncmG+eifsgxHxmhq7aNH9MiBo8PJ/jvLlU3vVQfUHxtjyCQTTur+61
         slCY07jMBaZ9m4X6RNvDofhezQ1ch3ecVj92DGhZCFiJxFJs9XUJQA6RftAHL7MM6Cyz
         CqNm6Eq1+VURnERoA8+VBR3R4RDJvePEczDnQ0tRgwCVO8W792eshELypHnenWg7Dvzb
         ZarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776186364; x=1776791164;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqllaDLxjnXgviZ2peQB8Hg+mZU389CwQpc1LTm0WKA=;
        b=iVvRgPjqzj6jMKCoza+Nz9HFityxCogpEWQkMzyr7kXj+vjQDbShqLZYdskWovHCVu
         oLMdul9/O/97eSjtJ/40b5L6kNtgtVaqp4PWqxtWHWFqWbs4nIji85E3qUyl3k2uoXT4
         VjWbeVjBxR2UOHm0wE9S5HKZAh2INXUmYUZtmdjqksmseiTHAvwB300exJgBbaEvdyiS
         tBK3Edeoh5MaX+A05cN+WuXN60TByZ0UC8rnDBz9QQZ9lDupaA7QZbIiWOl3jA690x9e
         t61PuD0OxIflDbbUPeAIxIwW7VEBqkwQLc9Da1LDS1/o0VAMoTty96n6aSvb/1bfBoDE
         S6WA==
X-Forwarded-Encrypted: i=1; AFNElJ8PMgclgzMbk0YuRyjlS+V325S96jRl8eiKU0fqMPckr/xFstOKISg+ZbvbwzOtNuxeaKkTEYlF7TICVbpU@vger.kernel.org
X-Gm-Message-State: AOJu0YxrKZiRyTZruMLcJEVMcJ2wCaDCLWprANvqLAYkolwNIBhTzKiJ
	tExbkEb9ZEDylLPhe3N9UbfvRvadJdd9Dik0GGlatL6sPEtxbp4RmkMHLkLkIBdpKKbDIF79dl+
	FBSAsHi5fHcrzqGQ8RQuagjgroupHwnbaUEVLDzgk0n2sqXfKM8Of5AEb1zB9MNzTgFn4
X-Gm-Gg: AeBDiesSLP/U6oULbKsLGqOF2D7kZWDUO7dBgcw64xyXAWQqDO9VRtZQVAoPXdpV1xo
	6Ka+xxlTh1/bSYd6RtZm7RegqSN7rvkAY5LoaWxyWw8XbeqwipogwNAjn5ZAsDw1VOzzfqvFLZj
	JPBjPvhNTdzqDTAKNlUPb17wpOKVyQQ+1fBZKgUmZEDnsdifU1/MZXqsyUNewFp58TCQnLf/7Aw
	IYIyKOmIDi1d+t7/fsORMD3YY4XFi+3kfWp0Y/JhJhrsvCt83L6m26GE1IM8tM9uqP+HA+mSSM7
	XKBBXAhkbJNKtOy3Aqta79KuYeICh1rswpBjEM9vJN8lywWgrpPAp5OsK84CAbJc7c8VQEJ3nvF
	XzjqHTX/YOB19PNDRmiOMCNvfMwEAhjAiwDo=
X-Received: by 2002:a05:620a:3710:b0:8cd:9231:8b51 with SMTP id af79cd13be357-8ddcd022ee1mr2630341285a.5.1776186364294;
        Tue, 14 Apr 2026 10:06:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:8cd:9231:8b51 with SMTP id af79cd13be357-8ddcd022ee1mr2630336285a.5.1776186363741;
        Tue, 14 Apr 2026 10:06:03 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8de6553c460sm1184916185a.43.2026.04.14.10.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:06:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 20:05:51 +0300
Subject: [PATCH] arm64: dts: qcom: glymur: Drop RPMh CXO clocks from QMP
 PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-v1-1-ab12d77c4aec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO5z3mkC/yXNQQ6CMBBA0auQWTsJrUUbr2JcYDvQKqV1CgZCu
 LtVl2/z/waZ2FOGS7UB09tnH8cCcajAuHbsCb0tBlnLU62EQjtl7Ic1zIyWY0JOwaFZIprhiR3
 HgK+QklszNuoodUNCt2cNpZeYOr/8Xtfb33m+P8hM3wHs+wcoYHq7jQAAAA==
X-Change-ID: 20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-543285e18a78
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3220;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iFhoWp8t+hLFi2XuWq+PBtpQUXPDodq+j+VervG4ajM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp3nP0rRwOtTerIJIVf6qBvPB/i9ZjLBpRXmDlZ
 me9H0cfGtiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCad5z9AAKCRAbX0TJAJUV
 VvUtEACZ2JKf8kIY1lgRSGhbUeVmK8nsmjM6AuZaILcgp+YpNAfqmpyC0NcDC5xS6UvDrO5JZf3
 cl/EqQUqkfkUEkpaklVPrD7Xcw9QVfNzBRuATYD9OwTqUNp/p1dxXieN5c2rJ/MFhHx9b3C9PVo
 3rerR8Onj6cbO81thisn+ds1rbpuRqyNObml2O2vziOWAOyh7QqljJqtRfu8CEbduB5tmYK0Hkb
 jqlJksJcrHviLmboLFy3ctqYU5ORZAdZ5kMMeGWLFOLk2bEtFfruTXSER4n1RSE0EVdDsUHYERA
 C10ni30vrPzurZlQ0PO20D/tFSSX3cRgE2Gijh43HsIFSrNfj6ueW614S10BP709ZI/duTLF3NI
 yTVZB1OAWenV29mTvP57GjmdRuvP9c1GLnxHyC6ALFV8GHVabdu/0LcLyZZMOGPYFFJUZjSlX3T
 r7SdtJFsP3lMVRuaIe28yrcNMr+/+Nr3/+yDNJbwHwrAsSxilJJmTGJct65nm2jwI4BMFNxywIf
 dDRxXaGbktRXL0L0bz4uWKqRfrY47VjARcqKYhSxOF/xgZzkPKwDbeknrj2QORKSUruRBYAQuLj
 LpPZIJjE0YRsTM4j9cIjM8eJ3a+Ho5zB3wnB7eqhKsTk0GVeJGE7YRsVbSSifPLTgOKu2rraoTB
 qq84KS8KeXDzHhA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2MCBTYWx0ZWRfX0jLh4Vs8mDlq
 q+LhnN2v9UkzyyiE0H4KEM2AtvnHCDa0pgmvVg/qEeySyS3iwvqhpOFoN3FyTcXB7+fanzrn0BW
 39qyCVPT7MeWPCAwJkW20Sx+a90L5az7k2ZCM0OoYhyclrFw7OSUsEWitYQh+/b8QfUyGpbsEsZ
 8A5Ycp42dFxzZ5Z77prujtkJHS20EYQkC71rK8FnnOEPOU2ch+eqDK/p55NdzfRicNmEkCpjzPn
 GW7xtCfwplJ1rjjPyt4l7gjB99M3mX8W0iAM3MeQyxRiGj7HKmPReE67FQ9Dq8ZfwHqA0UOvYn/
 FeOL5lsQwtlduKOCn5sd/f9zPC8lW9JKrjousIT/ZBXYqACSwm66cgZNqHDJYkbRqVkcFj0umXe
 +838M2j/oo44tq8ParxIa3XO5i4eaj/sEPAGsodrLAiKFy1WG38YBFfLKe9UhmkbToLPvbVZiYO
 0st3aa7ZkiOOE3qTAUQ==
X-Proofpoint-ORIG-GUID: AXxtmNMCHXZim9b2mnH1lJt-n7N6v1jx
X-Proofpoint-GUID: AXxtmNMCHXZim9b2mnH1lJt-n7N6v1jx
X-Authority-Analysis: v=2.4 cv=HJLz0Itv c=1 sm=1 tr=0 ts=69de73fd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ub0iOiB/G/eXZwGovfl9ow==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VDcxF29oq4lNwpj1WL8A:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140160
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-103181-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fde000:email,fa3000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fa5000:email];
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
X-Rspamd-Queue-Id: 004403FCD64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Glymur, all QMP PHYs except the one used by USB SS0 take their
reference clock from the TCSR clock controller. Since these TCSR clocks
already derive from RPMH_CXO_CLK as their sole parent, there is no need
to provide an extra `clkref` clock to the PHY nodes.

Drop the extra RPMh CXO clock inputs and use the TCSR clocks as the PHY
reference clocks instead.

This also fixes the devicetree schema validation, as the bindings do not
allow a separate `clkref` clock.

Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/r/20260410145205.GA554754-robh@kernel.org/
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..82436984485d 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2314,11 +2314,9 @@ usb_mp_qmpphy0: phy@fa3000 {
 
 			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
 				 <&tcsr TCSR_USB3_0_CLKREF_EN>,
-				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
 				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
 			clock-names = "aux",
-				      "clkref",
 				      "ref",
 				      "com_aux",
 				      "pipe";
@@ -2343,11 +2341,9 @@ usb_mp_qmpphy1: phy@fa5000 {
 
 			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
 				 <&tcsr TCSR_USB3_1_CLKREF_EN>,
-				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
 				 <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
 			clock-names = "aux",
-				      "clkref",
 				      "ref",
 				      "com_aux",
 				      "pipe";
@@ -2482,15 +2478,13 @@ usb_1_qmpphy: phy@fde000 {
 			reg = <0x0 0x00fde000 0x0 0x8000>;
 
 			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&tcsr TCSR_USB4_1_CLKREF_EN>,
 				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>,
-				 <&tcsr TCSR_USB4_1_CLKREF_EN>;
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe",
-				      "clkref";
+				      "usb3_pipe";
 
 			power-domains = <&gcc GCC_USB_1_PHY_GDSC>;
 
@@ -3750,15 +3744,13 @@ usb_2_qmpphy: phy@88e1000 {
 			reg = <0x0 0x088e1000 0x0 0x8000>;
 
 			clocks = <&gcc GCC_USB3_TERT_PHY_AUX_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&tcsr TCSR_USB4_2_CLKREF_EN>,
 				 <&gcc GCC_USB3_TERT_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>,
-				 <&tcsr TCSR_USB4_2_CLKREF_EN>;
+				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe",
-				      "clkref";
+				      "usb3_pipe";
 
 			power-domains = <&gcc GCC_USB_2_PHY_GDSC>;
 

---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260414-dts-glymur-drop-rpmh-cxo-clk-from-qmpphys-543285e18a78

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


