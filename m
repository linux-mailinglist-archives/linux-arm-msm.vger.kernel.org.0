Return-Path: <linux-arm-msm+bounces-116292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eQbhHI+aR2oLcAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:18:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D3F701BCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:18:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nHXwZyYq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Yn8ErU8J;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116292-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116292-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC60030534C5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 11:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C18A3B71AC;
	Fri,  3 Jul 2026 11:14:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29703B95EB
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 11:13:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077241; cv=none; b=XMdHSwNtdeCyivyzr0qIQnhxk4tXVxmBVgKrU7RU99R4MPJLpcpnRTnWF0U/z7P56becaORaF/aNrVJajTH/vEdLmUf8MEr8NDZwrESzEJ2cKB8Lxy4g/Oo8+3zJ3YlJRKzW9XlZ+T79M3cJ8Ye5o1wNinJtNJCU+7QuJrv0oqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077241; c=relaxed/simple;
	bh=eUR1ZhMyDA3A7UIWzFyJqoSdZNJXxJylHr+xBgv7EEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpO8mqfo08Hr3MGEn8sYIFfEJuVK062mbwsdTErN7codjvBmYAyKh4NEZIMkLRi35HnYfvRA5N5+nST3xqRDJyafaFKfAF0SFhWnAqUyIK0yNqySF6cVZcnu9kAMu4CVCZU176RyICY5jKZYEzjWhiZuDo/amY2U8bqWqxkafvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHXwZyYq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yn8ErU8J; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rZSL3136094
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 11:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tb/arBz5/zJZCD+IeMFyoWBOsYq0JoqUHeSRt4cbXiY=; b=nHXwZyYqZ7ZyZozj
	PhsIo0k13FKtALYVq8J60JFLXvqtZ+ptfRnl7kuPv1II2vrJtNBhhsVYD5iea1J8
	mTDIBiAcYIiK8KZg1SYvR1uuqBhrZki6pKayNFu7cLcaPl/Yo2hlp5gj+HIv47jU
	MboSZ5IqCwnaJpvtngZUVtiMjWmbytCeYAKkRhuXiJd/N+r7yVErv8HANF8c6AYV
	XM5IovbwvrAhQHW7kWPRYuVPVPepFYwtbRB5rLuwumkOMd7GKxMoqvR+zoUOvi/F
	JalDf14AfXWhLPeT7+Z/UTzi4fzgVTD5upfUQXd3z8eJKOnQUf+tPHIaKHluTrH1
	PWPfSg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5a0gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 11:13:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8479cc04d8fso809052b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077236; x=1783682036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tb/arBz5/zJZCD+IeMFyoWBOsYq0JoqUHeSRt4cbXiY=;
        b=Yn8ErU8JeQvDCAaoxBN1PPTPx2uidledldRHctAnHU5uk+iYsIci8Ij0eQuGLfUL5m
         bCKXBfHE9VOqqpN8iRNHNtqO6IuMgHAw1CdpOa50+YpjCEDM5PEBi0snsXEPHGej/EeQ
         GplEUn42zjZ0dEQG9ZV12RRiy/OeCGrtQ8X5R5gKInngvL/kXDVPtGW+cTr01nyHzimw
         SGaS2HIVIcZWKJwdHLmgknHqK89WsP9ZQvOCEltjBkAwlOjG0QiaEiLfG6JlBagFpxyO
         5tGHuZo4e7q9tnq71VoisM/4mt1E9dX0XDD9l+eMvDnl8O5C8oTtFeBjHoc4l3OZtFiw
         s+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077236; x=1783682036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tb/arBz5/zJZCD+IeMFyoWBOsYq0JoqUHeSRt4cbXiY=;
        b=Wpjc4IOm4CiJCZ7D2vU5yXl0aAPZ6PB24vOqPMufIREsgo20Z4OiEUT+rfucbwRkD0
         dnRDlBkHLm2SDlYFjonretVxHdH1rtklB5Isj3mEi62RKV/xhMrJOOl4N7RuGxg4aZmW
         2t3WthY8Gm09gKzITKcwq0SSKZ5gBu3RcJUGRsWWU0oBOzLj99/AY1QRGTShGi7MLwR/
         aVScxYw2mVPrNdx1Xy5T99Z+ckqJA4M5oDUgRkRnbDwxjqbbu7cDuidZH2o2djIZnBsb
         BLmFYeeImXcykGXWtsrY913Vl0bOaOZ5HNzeCnWj49DrBs4Jy/LX6sAQwoXEzNc1o8AJ
         XlCQ==
X-Gm-Message-State: AOJu0YyUCnj5zgftj6XIeekV3EcajmEm3NhoCnkd/ogGVA15ctU+O5cQ
	TSP5XyTC2LJJR8kkJvHRWI22B/8ErVceevSBol7x8j7rBNdI8DD9hU7n8yBf4mioDzNuAuC3qOZ
	p8QRlaL5kyEMUYXxxrIE7WpQRlbFo/yq9SuWcEpxtU42hZxpSadN4AbY7f0P1DcbWuE3U
X-Gm-Gg: AfdE7ckXVBu5ADhITO/frCJLNUWYO8TP9gtIYrCSkIYGQ+XSRyCUyLJtWYk1Thr8aKi
	CUsFuf1bq9MO1rqiU0+oMknuZXXUFEe7q2Zol+7S4+RMf5jdFhPd1FtLZDya94qz1MHAzJeinPZ
	8tXoGwnIsI85l5z5HvFNmWDugGt2C7rDgu+R70zWVcumOs8yBW+yVf/xtAVM1joO+7jhN3aFws9
	EbrA3BbD3DtX9gk66HRwSSbniNEUWasWJ+zw8XsO4bXd0C8/y8qzfU/NfY+Ia4kJoqoHDEWu682
	3FqW3dKoTNLO6zPP1hHUcyNMyWsJt9/VTU2h+jcjJvo6yrYCHHnPrvXWnK+EFv98mH5vdzE8BUK
	yVp8RdYJs6bX577axmL01ic+OxvtKcYFrnwAEGfVK
X-Received: by 2002:a05:6a00:4516:b0:842:5a8d:303a with SMTP id d2e1a72fcca58-847c0950567mr10109295b3a.37.1783077236071;
        Fri, 03 Jul 2026 04:13:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:4516:b0:842:5a8d:303a with SMTP id d2e1a72fcca58-847c0950567mr10109262b3a.37.1783077235580;
        Fri, 03 Jul 2026 04:13:55 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2729490b3a.33.2026.07.03.04.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:13:55 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 16:43:41 +0530
Subject: [PATCH 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra_stats-v1-1-0aa0ec1fa83e@oss.qualcomm.com>
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783077228; l=775;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=eUR1ZhMyDA3A7UIWzFyJqoSdZNJXxJylHr+xBgv7EEM=;
 b=pIJKPuGZA/eZG7DyeW2qWQF3Ho7Bc+k1kONKvATjRrf0dFcCI/C7bgqRzL8MytFqxI+ZFKil7
 kku1rDB6QvJDObCwYqhUvZ09361baGKtvgUdkI0EZBExbv0VdGXvVL0
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX7orlneH1N9rl
 fLaqrdcywKTeJknlJr7pEAzHX+dT70/ctvWO5k3UMLnzWw0ogLyKcrG80MDqx93IWh+GgYsh6UU
 wMAeO66vgElsL+KGOHVDqtKAz5/FFCw=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a479974 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TNscMaw5zNdbRDkxZCEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 0-Q7XcK6-ffMzrDeN7vYj8XlGIgK002I
X-Proofpoint-GUID: 0-Q7XcK6-ffMzrDeN7vYj8XlGIgK002I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfXwOHCYPC5inSU
 UO/2BUTsW44xJ5AkEKQFalWtxiZ2ek285/KJ+i4mIy9hjAE2K+TLzA5ZsP5UCFgzytuZBkInLYG
 pVSP2c6cwmtVwoA8bN9YQL6jGvu41LH0e2rD3AdWUhPE4uNy1dmWtM7WcM9toGbQ5VK3dLKKdOG
 RvYhrlFaQeXWT1G1stZA0MjxfjCxEhRbMt6jguZQ4YDeQY9wJITjQaK0YbSkG+EGZXxC0N/utul
 /ggrkASFQSCzn4cqw4Glpi98u76QCGpgrkkcNAxroQXvn+cn2V3jRicMIjLiw3F71A4Ee4vqqBf
 PXRfQj1/P3tjzf1+1yDxXnmjFEMcZdtnydi+eSHqnFfbkJwpyIHSUaId3ffPVWoRS7npbUyIstY
 IWgZWsKhCO9b2e9XkslAzttiy3tdH6YXyBHhCqepnqP7ykWe1DZx9CwixBBfP/lYIToOVWpVtAT
 WGtkEKoBZisbRRPKkRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116292-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6D3F701BCE

Document the compatible for Shikra.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
index 686a7ef2f48af11a0e63904ff979e40d7538de65..43751115c5b4e2943c93d37d3e27c839b4057529 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,msm8226-rpm-stats
       - qcom,msm8916-rpm-stats
       - qcom,msm8974-rpm-stats
+      - qcom,shikra-rpm-stats
 
   reg:
     maxItems: 1

-- 
2.34.1


