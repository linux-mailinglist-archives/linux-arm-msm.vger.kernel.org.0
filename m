Return-Path: <linux-arm-msm+bounces-112790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0SzzOKEAK2oz1AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:38:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDBD6747FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:38:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=myaG+0Qd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XLdLatAp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112790-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112790-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8128E3025F86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FF14C77D7;
	Thu, 11 Jun 2026 18:37:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A04F44A71D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203050; cv=none; b=Cy93utB+GE7CVfrAPVdEX+FDZxmIEJO1wiqxZNVPRESOQ4miDi66+qwlZ2br9FJFwvqW644xhx36EPZTNuAAGFARcdyPh08ggEYiiKn2PnJqUH0xTx1ah9AvTQ21Npf4VtfVvh87yQDKjUktJ48HuoY4nqOj2Nv4WYw9/o9fppI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203050; c=relaxed/simple;
	bh=5Xufs5yzw1meBpR74gkzyGtdf0gQ2cokHnunZolJSUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZSrHFxPhdAHosArRBKi/JXyAlORLp1UU+0h6TdC3C4X5Kv6dkVcWUibLgVg1cOrxqgXlRBqa1pt7O4gy7ZWcD4xF/62v9iEzlFRyKBnoW+tMQIIySFUnX1T8cdoyaFscNrFh7jUibPxeEkxpu7yZMcn9Y+DoKTRkfdWH4aVgEGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myaG+0Qd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLdLatAp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIS6Rj1433947
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=; b=myaG+0QdAH82aYHA
	T5bzdiBz1N4/ZDU9K56o31TCPDJW2W2jDAyu14JVpgUhN47kE2/SBmuWvcfQ0++c
	Qy2VFuWc44xxX82ZYWraTV/silo5ycrPtjoGXzf+V+MhArRjVA3+dyc/K1uv2ZBn
	80pjbr8Im4NMVrgWQysarliG8Ss462jGwj61LHgm3Am4lFgqZSioS96vd5ZvrYPf
	lgTZYlVkI/0PaUMCJgGhLYFQAhi+VCUSjwofLEtJJAU6fHkq8zGXwBRQsmvSJFgX
	5lJgNrNTcjOZWucIA862/rGuDHVCq/Vr2rCYrRi/4OzioIMx109+gvLiBjI9U+T1
	cKiHug==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7051k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84235f9b91fso135024b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203048; x=1781807848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=;
        b=XLdLatApSaYMw69BsBrg4zUK/3Y6tFH40JKiWVizB6lYP2kG83YusKZ1AOSdhDWX+z
         TlwBTPGKmd9JbD65m7GJssADkdszqm1/NQweaND076XKkrviWEUDgGZodRDGyFJVVSM+
         t6WAlt9A3hNMhs6K8YQDtlV51HRlpLb9gblbs8k+QP+JvghVaKghPESqpRLtklR3zUbV
         AF/+NAaTIQAaODgC2xtnD3Gs3Yvlyln06uuw+ERkxIEjk2Ouy7y3ceO8RyjxgirdX+Dt
         z9CTRpBImz0bDdCDO5qnW6JFUqn+mL8oRGwu/Rk02YlZ4vLCWrlaoatKTWSxkd83SXLV
         qB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203048; x=1781807848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=;
        b=Z/EV00joVFy+hK6l0sUagKI0/DGE1Ablk5gaww4l6AyFetSfuwasfHaYUmG2UA5oMz
         m5IssqRJ4EqNCJjDhbIJc2IML8EtjimPl74KPiQswjJzeabzdIP4QmPT56PxhRdpVuYF
         vDbjPadDEe0+O4Cg7XEmOC07EGsgxHHiUdMcrNFFdK4D1LtvUFMAck+ufH3jNjf1NiFm
         4vq4syip+B6+hz2VTMcfR0HUCwURyny+os/c70gbH2xnZAtvd5rby5Z6RW5eGN+gy208
         /XLjjbpI2KphEQRD4EB5KN1JGB2mhYZMcwcGEcXVEKd5mRcY/d9AQsvIIbexVm8BiDZD
         B+Aw==
X-Gm-Message-State: AOJu0YyXWd9rnetw3nYjMFqXSxMaWOZiuR1EYF35uORLX0kTUDqG8x5e
	oU5Xvi84fciWgK0ERJ07O8K3gHot1EcYe2GoIhM39HNbl9yGTNLwqFNtJhsplghqzs3yXE5d8HJ
	KYngSDVXQlmRYCBz1dh8C+So+NQxm5MX3JDPMaI1EJhbzYAuchdW9K33OkPjwSjiaEXm+
X-Gm-Gg: Acq92OHgJBVSz70CzZaDqdzm6fp4PG7p68STKR7eiA3WNgUZ1EIhheEsKJgtMFY03h5
	2Pxz1l927DhOtEDh3USAVZik7mfB0COutO07oYAe+cQnUgWuZR6hQcBdFMvxgfB+tk0urkgjADi
	aoXFWhrKGRZh5bwNxw34KMlIbdkQHGG/vmJPHz0og//Zqkb29wp4m7Hb+xmu3Zeu+5aRDrX33la
	2XMc9sVaNTYAsWHjOFTIhXdA+zgUmCTTZBJvAzwMGNJKKALcTVcPmM+OPst7gY2IyCpwOdpzAoU
	r0t3gj9cpiFyQ8Hv4EyrSq5WOtyGHHfZ2OzkstX/oTrRZJjIXzh/Ud+uozcXtdmJ17AFVW+y/ei
	5PzFoVZ22C75UcHtCUFbfcuQTi5aJIaN8oVf14+08HXA5w5Oh0bE=
X-Received: by 2002:a05:6a00:12d2:b0:841:89a4:5f86 with SMTP id d2e1a72fcca58-84337076084mr4736764b3a.21.1781203047501;
        Thu, 11 Jun 2026 11:37:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d2:b0:841:89a4:5f86 with SMTP id d2e1a72fcca58-84337076084mr4736731b3a.21.1781203046852;
        Thu, 11 Jun 2026 11:37:26 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:26 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:06:58 +0530
Subject: [PATCH RFC 2/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-2-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=1852;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=5Xufs5yzw1meBpR74gkzyGtdf0gQ2cokHnunZolJSUI=;
 b=+3Ngf+LV00R14UIA4JhwZPvyrrFmhJx5fnVfVR/0VJFRrLoTMWjRw63LOhmMfCcRp1SypJ3B3
 GPEOoANmNeuDfd0CuXaKLK5vO4xXckMQdUVk/n+kSbWk0jfFTEb6Ddr
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: b_t8J3g1_ariJgCZINbil6jSYhuSC3nm
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2b0068 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=K6GgjFCvg-rKmMkbl2QA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX5Y6/+6t/IAh8
 kQf+lFfDjvIAQtWGgvT8zlV6QljvTO+qjT45yhNwJk5ihb/dCBlRPjiOqMcBvA+Ci3xzKFl5X9Q
 EQ9OfL0n79AaIhzbbuI0V3emBcs7x+hnT1+c3Fffb+eXwOVacfMaMO2E0DIqspDz5u7l7ailCYX
 t4Ew3vwjboyKsUfZg+JvMyKuziOEgJwKF0ADm2ghcNA0/ZjYQtFoQ2lUf8jDwhBWvlW9BIdddzj
 Qh1p9942QrV9/K7Om5U1W3j2hKU9BEBd9YmYYSZ/eggjKcxCtuvrW9g68cXrIdXiIo3f6c8iCLC
 IiSSF5qs/ChuMaKuuVaIRrcKfzSiReS3S0pWsHY+4+xzAqoX+fJ8LEfNLZ0UmL9p/RAF7xACp0m
 DYOauG+klQcdXYDBmRLmR1DSlm1eYnR9FxNgKDJHC5aOKqyHc1PK8Wzaz+v8qAAOQkR63WF4NvS
 9fNT0foqUiifBCcE3OQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfXx3ojZ4dq2RLz
 IhBXmZe4RWlv11wki9g6gZFD63UNiLgxia6l3oUmWcBe9FlOuVmfIeeIQ+H70D/rHlCp5fs6bZa
 Z8ir5HR5QgSCZlutyuCZJ+iv9TVnSMo=
X-Proofpoint-ORIG-GUID: b_t8J3g1_ariJgCZINbil6jSYhuSC3nm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112790-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mohd.anwar@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BDBD6747FB

The return value is never checked by its sole caller and the speed
validation duplicates a check higher up the call stack.  Convert to
void and remove the dead code.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..44270c25d874f72e7f971757fec659d36468c315 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
-	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
 	unsigned int phase_shift;
 
@@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
-	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
-	}
-
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
 	if (speed == SPEED_1000) {
@@ -479,8 +473,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
-
-	return 0;
 }
 
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,

-- 
2.34.1


