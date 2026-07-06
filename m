Return-Path: <linux-arm-msm+bounces-116797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EbLSGEGgS2r7XAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:32:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AB47108B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:32:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k1bMyFha;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Slmja+cz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116797-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116797-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CC8E300FF87
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FE942B75A;
	Mon,  6 Jul 2026 12:31:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95045423783
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:31:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341092; cv=none; b=sSsGrPeR3X3HoIH3tPiPRzUKx4c11YrFge2j85QyIxrLBzqjZsIl18x1l4y1E/4K4JFdQs/o+Ilq/F+ilpfKpWPpp+UGjN0DX1VIwWI28jSgPaevX/naLLYS+jnBke+gE5u/s5ndWesHLrIbkXzBRkGx/oP2f56b3ipqtliES7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341092; c=relaxed/simple;
	bh=UHo4xkxhXu6Z76ttNH/JDj+16srAwL5/DttG6yBH1yU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bZYGRKGbD1UNi8aomoF2nT2D7MfXLj/4tZyKXFXJx/NyeydTfK+eNyaGIRHJ2Tm2QUmhq2uOAwZDQ0EvAcpVfgATQMprz98NlB2pii/PemXA2xFfuwMOxOw6PkzDwabFHFOX8KcJ/preyuyn8TgjEJGgzSSxelQnIRJ17c82Ics=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1bMyFha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Slmja+cz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax90M391072
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ookh1o8hZ7t6KURFUreTDn
	sNzX4fHQw5h4RKrUfnpoU=; b=k1bMyFhaeNA0HQXVjd25ZIZ53XVKWYoTFB2vSU
	Vx8Mumswd6Nh2S2yGUPlG7S1EvQEaHF7UuA9jXzsbJBsS5X4vRf8UAM9nFJStZSN
	UEi9JqElqlzW23NpdR7cX1FgZoSbE84YQCP3fbjfduyGW6fXJlKZmtjraaPiyXvj
	BlPkgaFo8iqiy9HLvittPIl8ht6wdFibldQmuPM09AYE4fdNClY75BhbbvA7Cqn4
	jZQg809xrQ5sSZ3/T/r87piHHOlaCyOmboijYMChvRCZFglxBQE9c5g4SocNUauG
	6pcuwyRzBUsTyfEaO2KThAk/TZNWFvj9/+2oY45nXgZ/07eQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrpwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:31:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737435677d8so3417826137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341090; x=1783945890; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ookh1o8hZ7t6KURFUreTDnsNzX4fHQw5h4RKrUfnpoU=;
        b=Slmja+cz51j4UhDif1T+07KmFrSAiB/L8XuCkKCy5nCfk91mwWjBoD72iZHnZBy4ex
         D3FEkX88vuMSMqYaQ4YzXpxO5go3OhDtlBIX1I1/jlI2+Q95ibVr0P4wazq2R+/PiNj+
         R41HqCSm5uVaYNyyXNYF4j/WwgCjy5kOA1c0x6CQyQPwzchYkUSsyIgFLJmXECv6XEM+
         JH0HhjbTlb1shKux1cEFRPeEN8asFxFTcSeR+wUCKVfQBYd5dDNffCmVSYnrNhjWRSXq
         YTB4m8w6smGeBg8z+9eTE9TcdJRAq7yT9o2iTBGDWWsHCcmxEPfh9+ZrfnXFdBV/zVgO
         DF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341090; x=1783945890;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ookh1o8hZ7t6KURFUreTDnsNzX4fHQw5h4RKrUfnpoU=;
        b=JsliP2zth39E6hgdFIBNgYFEXqP4hF5jz7Wb3w8SB7QUlqZbeDuP7SL8SNmoMa/CDb
         /Q4RvwT/aJCtcw60L8C3KhWp5N2pOkUXjiiQS+3nDSKM/dWXIhEJO1oP2sT7AonWxtjt
         cUfSzrrT6wutHqorl8jZ+5YB6MXkuue0XHZBhgih7c+DIoipzTTEk87eD77XrAc+I9i3
         WCbeEAELaK/Bu7f7ZEEauuhFbjv3sMzlaW0Jd8UwTXaKW/db13NaB8si++mnu0oPZHUk
         TpYZP3GTIkJqB7Xdmb0KHxizVNQNowRIsK5N4/cJ7x5K27Pc9LvfoiTlnL91BHTXXqHS
         H+NQ==
X-Gm-Message-State: AOJu0YxHoRYTjZP5wp7yuQuCtiL5g98OCXWWCj6YTUyZQZrG4HFIoMii
	Biq8XXZQfx+ZWJa+kqaEZ+d9SV8WCnSr7nOenQgJGjj3Q93czoJJASVsQszM2KRO6JPsz5rfgZV
	J53+eMm9jxEpBDfgE6D75hkEHYMnwjqVcfNZk+30nBI7DJqMepWLROLaa+J8VpR4WEWQ=
X-Gm-Gg: AfdE7ckBmw29HJE9sLdA0t6Y1xhtfJDdoC2xgsFCVQDInlGoySCISByFGPb+qQuS7K4
	nXLoNvptkgH1u8eDAH6V/cqSh9Kx9NMKFVvqb3x8xhg7pb7mtrOYr79edRsE8MptdPhRRTQaidK
	glPBrvPU02vdFkPie1V34BiaQV5IazptNWGXeHAWRK9mx29hAgeiobQutLNl6fH4j7hNFyL0YDX
	cCLBr2dtnlh/B+5j/iz3xUW/YW9pwCojxzndOfEJIR4Y5hMl7Xr/dyrX01XUAIsqy4YLSaLfSyr
	TG6bOkydV5wYufiUXw+zIOCCcSCk1GRpx5svSBw/ROD5pU2Tp/Oi/JwA0GjdqyuPDANx/MZTrOI
	kSJ4FddLgBXnDrbCMjT5qBOwWmgZz5CKfYKbKyPjw
X-Received: by 2002:a05:6102:5125:b0:73e:8694:c6da with SMTP id ada2fe7eead31-744b7f71886mr117474137.24.1783341089579;
        Mon, 06 Jul 2026 05:31:29 -0700 (PDT)
X-Received: by 2002:a05:6102:5125:b0:73e:8694:c6da with SMTP id ada2fe7eead31-744b7f71886mr117383137.24.1783341088826;
        Mon, 06 Jul 2026 05:31:28 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838e1980sm5252990241.7.2026.07.06.05.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:31:28 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH v3 0/4] regulator: qcom_usb_vbus: add pm4125 VBUS regulator
 support
Date: Mon, 06 Jul 2026 18:01:04 +0530
Message-Id: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAigS2oC/33NTQqDMBAF4KtI1o0k0UTrqvcopeRn1EA1NqmhR
 bx7o5tupIsZeA/mmwUF8BYCarIFeYg2WDemUJwypHs5doCtSRkxwgThjGBpzH0aSso4jmoO2EO
 Hz1zXvNZCQlmgdDl5aO17V6+3lHsbXs5/9ieRbu1/L1JMcCsM5aYySkF9cSHkz1k+tBuGPC20s
 ZH9qIrQY4olSiipWZqKFvSAWtf1C5N+igoIAQAA
X-Change-ID: 20260520-add_pm4125-vbus-reg-95c858c6ae43
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783341082; l=1904;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=UHo4xkxhXu6Z76ttNH/JDj+16srAwL5/DttG6yBH1yU=;
 b=E5Pma+rGFEINz9HLpoMbo0EAd+DLuN9X81OtAf1VoUueH7Z16wYQjXz/X+rB7MJ8ZxISzGriD
 5qBO6n28EahDBmiPN23EyCaBVxCGb2aG+XfGa6ajRnxWl0L5i4+41Nf
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: qcLW6xdxSiy7cqEDJovu5oaylr3xU9x4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX6StiS/lzdc3f
 82J+o+m1Jq/OSbZtcbh7lr6tvHST8Sjkc3LRguuOLWnEvq1y+ukqSszjIeEX0huNeJqGL3WERoS
 QYkdr7xCTSTA7EfrsUu+vGZKUcpeGQDfIAQYK2wuBhDdspBKDyzpv627Iy6rMETVvhVnXxzz4kb
 kBJKOoHw+LO0+4xWxM3EthmKCIWDAEdLqS3JhDFWxwP1v+Bbl1XsPkOw3TYYKA7oEdOAxIb/Lt0
 6zka97Ivb2Tgd5KxUv4iMICyN8chXbApwZMgBQlhU6yPpXxYiBroe+GWyUNrrJet5XiAG11L2JO
 fROvHkf6bnIY1fQ0aQvVkhewEzMSuwWWN4HQhX50jvRd/wekxP3IKALMrBJ3ElBKrLhbFTJJCqT
 97CYB4KJqelBgj5DDQl5HqX+Z1ZZd7qLZSCSZOJUeUv3UwXjl2EMc+ogL0Z9wSrQr5Kmm//DaIX
 fXZJzL2dXeHrxHbmTdw==
X-Proofpoint-ORIG-GUID: qcLW6xdxSiy7cqEDJovu5oaylr3xU9x4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX1GKnOIXM9vje
 zHsnlO5oLJva8r4VI0tqb/cameFrAqGj9m8KAZt/DDVu6a5npblDU/Ru+jAjYa4hKK5Ftm7zTNs
 Tei/ZNkxlmJ6zYCu6zRglJUw9pHQb3Y=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4ba022 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R4MlLg9bFeQ77G5B0twA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116797-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:rakesh.kota@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1AB47108B5

Add support for PM4125 USB VBUS regulator. Unlike PM8150B which uses
a current-limit selector, PM4125 uses a 2-bit VBOOST voltage selector
supporting 4.25 V, 4.5 V, 4.75 V and 5.0 V output.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v3:
- Updates the Vbus voltage min/max to 5V as per Konrad's and Dmitry suggestions.
- Split the Driver change into two part as per the Bryan O'Donoghue suggestions.
     - Patch 1: Add register abstraction logic + PM8150B support
     - Patch 2: Add PM4125 compatible
- Dropped Konrad's and Dmitry Reviewed-by tags on the Drivers change as I've split it into two patches.
- Link to v2: https://lore.kernel.org/r/20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com

Changes in v2:
- Fix the registers name and unit-address as per Konrad's suggestions.
- Use microvolt instead of microamp for qrb2210.
- Link to v1: https://lore.kernel.org/r/20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com

---
Rakesh Kota (4):
      dt-bindings: regulator: qcom,usb-vbus-regulator: add qcom,pm4125-vbus-reg
      regulator: qcom_usb_vbus: add register abstraction and PM8150B support
      regulator: qcom_usb_vbus: add support for qcom,pm4125-vbus-reg
      arm64: dts: qcom: Fix pm4125 vbus regulator compatible and constraints

 .../regulator/qcom,usb-vbus-regulator.yaml         |  50 +++++++++-
 arch/arm64/boot/dts/qcom/pm4125.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |   4 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   4 +-
 drivers/regulator/qcom_usb_vbus-regulator.c        | 102 ++++++++++++++++++---
 5 files changed, 138 insertions(+), 24 deletions(-)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260520-add_pm4125-vbus-reg-95c858c6ae43

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


