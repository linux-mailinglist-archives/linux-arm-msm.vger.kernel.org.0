Return-Path: <linux-arm-msm+bounces-112793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m/kpBqgBK2qI1AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:42:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6DE67489B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:42:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=THsbrssE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G7RFR1KJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112793-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112793-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26CFF33E9989
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94EC94D8DAC;
	Thu, 11 Jun 2026 18:37:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7234C77D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203070; cv=none; b=AfnOPMiRnUzGXUGTsKOr+jiRiz2zQ1IrvScJJpDdDOl/J/bN/aU2enuNBWv/K75BFmSkRe4uceMlMCg4cBRMjLl19NQpDowOaLibPA4N/eKDi2Pc0IRs9uyBjTaXUwc6X1AjDmn+QswbDhpQeDVog1+5kGHpzEU6RiNdcI6UX6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203070; c=relaxed/simple;
	bh=JQf6FOaG/Vq86vxkcpq4Ux+LVaeDywLUVuBCL3uEng0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVsRG4ErzGc2Tr50ef0c1/lnnP81tSV2Fx228C7xnxQrqHcr4jz+2vbWK7UjQO48t1i1E7gbFtjqPB3pOVHFmQC/IBKsraiSanlBgQYhPK/cy4/zCvyJh3OvBjrNP839xA/k4mO7rumzJ4wca8iUQg4UXxX+MTK2qMtHdz8jgYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THsbrssE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7RFR1KJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIS4PR1433831
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	beS1a+gbhwow9EniREJcckpgB+TSN7Ib6jhzMotycJs=; b=THsbrssEx2QAUQoV
	rinXUVYsccewmN0Meth3D9ZoWwB11GGiBk4xo/5lz5Ue5kQ04de7MXEzWg5GeOl3
	lUMUpSAgYfBOm68beKb3jDQk/6LTgfXjacVAgJXZTJ+EqPeRvT1FMGv+579rSQI8
	YcxN4D63MSH3G84+PS0nqPlr74+2NZfTW5nfGcRkgS1eWlGwogZ6jqYJ8eYD6/3t
	AmYm9Kek13ZwAgTTj9pvh6pC1RLnCYmRTyhSRfT8ORiF+PbchoJ7JGQyniNihlwt
	CUb7aEwIPY2MtXvBxlry2UXzVeP43TY/wdal9tYzax05+bcido54KHzmftic0Z0E
	JhbpzA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7051n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84235f9b91fso135219b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203067; x=1781807867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=beS1a+gbhwow9EniREJcckpgB+TSN7Ib6jhzMotycJs=;
        b=G7RFR1KJpFfPpt+LZvdhLM1CE8KyWXhvw+bwbVD6nXOdQAYj/xhwkMOV/4GqVaJ1pr
         2pBljY17syUn+FiD6C3BwoDld3p64czLbA+ok9sBKl8TRVaZtjCZwXQ0f9Kcwq6DcCPK
         t+lEfx3/rFIunTlsnrpej9JN5E3twIeab3TymJZ5x8c3DryTK9VFdclKK3gbmMVtO7/i
         CAGKTQEPuacxcawKz0by5rMGjD3F3ml5xVEZnXoof6WBv8QpDTNBt1Xq1vDJaouEIOsH
         NnZlFqPM7gmRcZd54gm0a2/mx9+54VnltdOFHHL4vn6biKDNbBwOiJecT9NI5djT+3z0
         MSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203067; x=1781807867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=beS1a+gbhwow9EniREJcckpgB+TSN7Ib6jhzMotycJs=;
        b=A9WpIt98qod1sMe/89xi+a2BNBPYbqAJcgq7Vs6XeidluRl5gMCEFggti3fi1qBqeO
         N3ljlk/k9PLF/syw9Dihpczq1/Z4jlwTCoZb9rIWMl6Ps5erOpOMs3pQ4pxKTt3xRUiw
         IPyjuFKY3IQQxGnOh1jJ67uWp+nkv6cuwIqs6FLImPGa/nPsKmEfDoO7CO3GBLBmK5/C
         o3SvX2Jjgedi2JIgZ8oxC+pDG/mCoK2w2K6XDbljghopkMFeJqJstK3WoAao6llPLyRq
         JHZL+iGO0DIKeGDK6Site50KNIUuu3mn7ej2sNzVwhiDu8OOtuYLEucFYuMljSLSLRpO
         SMng==
X-Gm-Message-State: AOJu0YxqnnD9Pv0Ql2B3IcTwWF+XNlnKB/Tiad+wrxdXJxZDSGS7j7H2
	06EVWJDMxtJUdOj0z4iS7CkIVA7Xt5smqUZ+d1jAsnIVWdt9l/AalVcZeegyFzv6r+vypqKzIQ2
	zkUHhH8FcJAcNXwY6TxKjdRXihpDgiixSx5bXxHpa+Nvd2UO11VnVORP6jDD1TqvHdC33
X-Gm-Gg: Acq92OEWZrFK7lksziWJ1Qo/JlcOeQe68BtpV1qcAbVp8j+g/6Pb9CnbCMTOUNONCgf
	AYAplGapidXmDWsc7dKESJZeavPp6bKiJrgdmIObLzu5Z7y/lRqZhZiMNLpX+bxLP0G0ouU2e/1
	4gR9SSzpibrABPu+L3e0iV3e0Jqqa7PKpHN4C3vXU2AwOr7pJJINb10hEcw4F2dWGqgnukT9cQA
	xIfjbjZuux7obwaOageE1B2gaIRbkV9RkhO+B+EDd+hyhShuomnM5KL1XyfayMEVrzasc12IGqP
	g466OfUJL8Oi9k0w1kIARQokj2DYlFQk0TuTBD+Q6MO3FHjJQ6r5CRMaruuvVkNcOPlR43bHA/W
	cpgipXxJ4ASlabN9j8fHDjBCzqMRSgATtpmvJmsnrse97J4duvu0=
X-Received: by 2002:a05:6a00:ad0a:b0:842:57e8:1bdc with SMTP id d2e1a72fcca58-8433690d21dmr4523503b3a.18.1781203066689;
        Thu, 11 Jun 2026 11:37:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad0a:b0:842:57e8:1bdc with SMTP id d2e1a72fcca58-8433690d21dmr4523453b3a.18.1781203066140;
        Thu, 11 Jun 2026 11:37:46 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:45 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:01 +0530
Subject: [PATCH RFC 5/9] net: stmmac: qcom-ethqos: add Shikra EMAC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-5-f0f4a1d19929@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=2407;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=JQf6FOaG/Vq86vxkcpq4Ux+LVaeDywLUVuBCL3uEng0=;
 b=cRNGFK07xiHzKlfJ26rgcNf8d9si3vcKtY1yMqoX9jY4Tn5HpHhsmYACoJajUnoL17r7m0Iuj
 aj7mu7h5iuPDFJLzcuqZgYVRtp2sNTuFVrYtAGZyIEl1l5ab36lm3PZ
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: 6r2P7AYKQAMvo7vc3BB61fR3WgbZjsJb
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2b007b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Mwvjr24TsYbRRF7WmgIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfXw9Rtencv2ZcX
 b4cFRelw8eE9xNcKKKLSNfJ+19VWqM07YTarsg3dC696WCvmzVz3nCzfwNMdl/qM3b2IBOHTpfV
 mUjw4qKVnJA+S7Va6+o9Weim+v2as0Suq97Zb3J7liqrnaXACPeBbZxLWoSi86dO2ku4UAAZIDu
 r/t6uFzwLgDajsfeu8L1sbmM5zckb9w4POG/sMmTCvpp2yp4xjD9Y2S7IRK0/cINE5aZiNOEuJQ
 nvp5EanKtX3//1aAzASwmDZly2VH1ycGw8+LvN0AQn3md3ISOx7R+diz2oQsarBXUltYszSCch0
 Avgdf2BukVMnfZ5ZUvS+7FTbrzmGY6Lj2FirWs7HOLw/amXAAV8oryGxHGizyKrGkq/MGrJqqdL
 Cm43jmBjfIkF94j9QGeLal+BjJsbqwnEKg14upNBqIaCYMTnnmTEgI5FxSE+nfDt7J/X+36a5Cz
 gN9RwU6eB3uhmoQ5IqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfXwYH4CLyTG06u
 cQy1EpXeQ6d2HOSewqIBXG0cMO2ldzT5wmdFZtFBIcAUnHBxAgW+yYF0D42JIKah9G29JRN+oVj
 9TY7psQLBhN62et6TSwGUrY/sLnmnFU=
X-Proofpoint-ORIG-GUID: 6r2P7AYKQAMvo7vc3BB61fR3WgbZjsJb
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112793-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mohd.anwar@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 9C6DE67489B

Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access and the 36-bit DMA address width.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f4d4b419a76277cc6c56f03bb10d883cd4dff424..59fa8779e4e4628ae585dd5625168fca824662b0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -326,6 +326,36 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_noc_clk_cfg shikra_noc_clks[] = {
+	{ "axi",               120000000 },
+	{ "axi-noc",           120000000 },
+	{ "pcie-tile-axi-noc", 120000000 },
+};
+
+static const struct ethqos_emac_driver_data shikra_data = {
+	.dma_addr_width = 36,
+	.has_emac_ge_3 = true,
+	.noc_clk_cfg = shikra_noc_clks,
+	.num_noc_clks = ARRAY_SIZE(shikra_noc_clks),
+	.rgmii_config_loopback_en = false,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -915,6 +945,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1


