Return-Path: <linux-arm-msm+bounces-101987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC/LDnTx02lxoQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 19:46:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D368F3A5DD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 19:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A241300831D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 17:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D37138B140;
	Mon,  6 Apr 2026 17:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9EfWLpQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4CwLXv6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74BA38C2D4
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 17:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775497584; cv=none; b=lCmfNNLBMMxWmmYsYmtFzVV4947R6LdDATf6VWeONFY/sVti8R4t/+T16CThp/HobyIGxjNwMilNEfAm6lh9XHtQSDlqDP7RilX0Sem03MqKcZKCf/21I6+P4mZBFCu8B2zl537beVrXeCuk+Z/IAM5xBAMKOTDz1BrwIqEwxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775497584; c=relaxed/simple;
	bh=PynLxP5rCPT1Ir/gqujTBnjrcsbrRcKsNcfGkWgDpB0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N6w58c4yletve0IMt3B94q99R+kJpc1ElR6MRYBXAGzdwGteAvgjvWIe14rhVMxqSJ/dZYNAqc9SD/AYsUzbrkvFWxGndz5X68595vY1bUv0Y46BQ2rWmi0yYpDZILqznrxDV55YSR9t0Bk9FN4bYqm1AulGF+uVsJ/FB4pT6rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9EfWLpQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4CwLXv6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636EliNV1151694
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 17:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Fob01FL2VysW7c0z3j9b1qZPozqNeuhvhc8
	RWjOUpm8=; b=b9EfWLpQfZeW8THyIK8LD6oiSnWX5koqYNKa/FiMtZ9eXkzt8YN
	PxNtkIdPd3sDNjMAsWILT3FW1mmOwOkjfBg0X9cz3l6kQlMZQ7RfR2Wbj301Gl3w
	gQZGfns5jSDBsmuh1XPqJro/7s1p2KxlGw78+xOTTJ/aG+cbX6Tkofflo7c62yRp
	4wjb6k8RuIyRpFfriD3Fq8SniZ9SzZ/K+ibjVy0AAO5q2rhEgW4I4NNz+urbSBT3
	1ar79gYHHdIhaFZy5VORXWGDo9FQMHiWC6t9hhk0T2kQgXzfJ6WRJ85gC4QRCBCF
	ZgJJb3YFMBtXg+whunrDRSp1dCOeaGpX3wA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcewerkv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 17:46:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82ce0a9e125so2510707b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 10:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775497582; x=1776102382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fob01FL2VysW7c0z3j9b1qZPozqNeuhvhc8RWjOUpm8=;
        b=F4CwLXv69avrAXFnzyi3VNA32jXQ//LYsR28301KGyrPMEFCw7Hhs5ghzHHu7W1jZu
         UBnY5yqC/9Bg+f+N3/JZmUUBDt0vCf3G+hufmvpPLqHgL1rUYGH93HWTE9R59hWZDCJH
         X7Af8Dq/OVKInI4WTbQt/aTrmBELWPODni5R1vLOom3u8i+J417TqfjDfCdBy8/CI3YT
         md6lPRbhEYaX6kqGLxSr25ImiGP7+Isli7IL/Iew38WIjfj3Ymm4KZU4bgZQb5YLT8oC
         RVAOgjN/WsPe5QnqyFdGS6T7i+klvZoL9ZoGrkYRdEbFmPvceG8mBUmUbz5Z88zvkzlg
         OZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775497582; x=1776102382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fob01FL2VysW7c0z3j9b1qZPozqNeuhvhc8RWjOUpm8=;
        b=EhGN21PG4W5MMYxpl6mkfMfQFbaVTzCOeU4IdFO+f8H406GJivaz/QMsYG305cB1Oj
         0deAB6HvEDvI7mFkCjKp6m7yLOM3gTwyvjGj5na4nPgU2Pe+9KQSvdprSA1/Hl0yuZRo
         9TgFCDWOteX1eojHPa8+QVYZk1A+1witVeq+19JpAPks+2CWXXn3m3g9oDlk3RpORedh
         WVOD1/pntKIyYEpLhhxik+IIGts3wyNMAId8wHArUao7uNE+0kZzgKVGPEtnfClRRcAz
         nuufW3S9pUd8uVpNNkvTWsA2436UVmKiSAmo4JS+f0V39JdG+4OZHnFHH3ePMMerusaK
         m9Ag==
X-Gm-Message-State: AOJu0Yx6TiTZoV5sV0O7SzWIcHQsTtrIiTlkfIzPxICw4NSlqcrmaT//
	yjqwPf9q0jAVlJEQodPpvXc7j74DaVhuYkQTJ3g9dX2Y4LF/sDabbIl33uGHYo4FCdyOGEkulvi
	8PqKkilEie79ChaCtSi53fJfmmOz+Q/H9+n7uGTG6+1viqJF3z/MDxqV/cN0EmeWzSsVE
X-Gm-Gg: AeBDieszR8mGikvwz0PMKr296n3hEAke1/Fv0rp0FBYA7L4lY2Hckzhoxe/81MXspL5
	zRxZ8crcakwgtXlPlpYYGo9qfwzdpJ9poIVVFyeQTNWkje0aY4zvmk8lB3o/DbZmiDiR3ByBsvz
	dsxKBTg5oLJRXg36ewHqFpvnGSAs8OwAj5ceYhlKp0oHvTIkFJ8GXXuow0gZh78zTy5/TMXwmhb
	T5MqOxLLNu2WP7FTaQp5IvR1F1tB8dU+o/v9lPl6uGgQrRxzJD/YOg9FqQR39qHg8oip7HS8oSJ
	ZqRegbjMfph6Eofi3EIuuhtpjIgUIpg1mtF6EM9RxSQvLSH3TlZ8BsuhMiRwUpT4xyF/vC/vcW1
	WGsBelfa+r/EQTNf4XVykpYbtumAj3+P/9eRpV4GVAGp0aCJs2RvroNDZMJ8=
X-Received: by 2002:a05:6a00:4c16:b0:82a:78c0:6b75 with SMTP id d2e1a72fcca58-82d0dbabb59mr13611630b3a.44.1775497581604;
        Mon, 06 Apr 2026 10:46:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c16:b0:82a:78c0:6b75 with SMTP id d2e1a72fcca58-82d0dbabb59mr13611566b3a.44.1775497581013;
        Mon, 06 Apr 2026 10:46:21 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5f1dbsm15227400b3a.27.2026.04.06.10.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 10:46:20 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add USB support for Kaanapali
Date: Mon,  6 Apr 2026 23:16:10 +0530
Message-Id: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OMnUSfUbvrrip-wb7jJY6VnVAiGAhWtb
X-Authority-Analysis: v=2.4 cv=E4nAZKdl c=1 sm=1 tr=0 ts=69d3f16e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=e2oerLy2phWMOAZZ7F4A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE3NCBTYWx0ZWRfX3qMwi/K/71WI
 GML75aouv6449c6l2cCBnaIlwJaY50lgP5xlz/iKF43szwDV8X5AOIDdW6kY3EDPBb4VGWETUKe
 Xk2AwGzR4Vlal+TFeXPaI0yXPKJbL772T+mgtm5sG3xcHYY78INt/1K19+4P7Q7NUTdoY53Gs/L
 TvcGFnfsHr2GlwvILyidV39kpzB/nnh1YwSKRb56npJA6ka67jgXxJ0FrNKp9RAiXMt6idZe8rI
 CmzlpP0I/F5e6cHZEjHlcmzLC1rYy8ky5yDbTvkpwZ29rP7NlwT3AFqG/EDOhTlR6u9ArKdWMfH
 gbkTqwHLlew9u9npd8+brTyh1fWEoCnXmJ2LESDmcRKnrVm8S2RE5MIBnmnMlDlcpsrZSky00Nw
 5CkFg69DPY+KJJSMQu3eOiKBwHMW0U42NDOzbQvIGA+x3FRof0LfTjkiH1LQXH2N5h9EDK7IJ1n
 HVFyMDeDvsEAaSOxdog==
X-Proofpoint-GUID: OMnUSfUbvrrip-wb7jJY6VnVAiGAhWtb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060174
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101987-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D368F3A5DD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the PHYs and controllers used for USB on Kaanapali SoCs.

V1 of this was a consolidated series of many functionlities on Kaanapali.
The first patch is patch-6 from v1 unchanges. The second and third patches
are parts of MTP and QRD specific changes (patches 14 and 16) and commit
text modified to indicate mtp and qrd specific changes are being made.

Ronak is the original author of the patches. Kept Jingyi's and mine SoB
(with no CDB) since we just rebased and send the patches in v1 and v2.

SoCCP changes [1]/[2] are needed to get ChargerFW running and receive role
notificaitons and enable vbus to test host mode. Since the SoCCP changes
are not yet acked, I enabled only device mode for now.

Changes in v3:
- Fixed repeater label in platform files
- Fixed commit text in cover letter

Link to v2:
https://lore.kernel.org/all/20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Sent USB specific changes instead of all MTP and QRD specific changes

Link to v1:
https://lore.kernel.org/all/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com/

[1]: https://lore.kernel.org/all/20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com/

Ronak Raheja (3):
  arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC
  arm64: dts: qcom: kaanpaali: Add USB support for MTP platform
  arm64: dts: qcom: kaanpaali: Add USB support for QRD platform

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  27 ++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts |  27 ++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 154 +++++++++++++++++++++
 3 files changed, 208 insertions(+)

-- 
2.34.1


