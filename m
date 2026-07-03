Return-Path: <linux-arm-msm+bounces-116294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7zo9NLGaR2olcAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:19:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B68F701C10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:19:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KMlYijpz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gNL9ciib;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116294-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116294-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B656B3061975
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 11:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E2E3C060B;
	Fri,  3 Jul 2026 11:14:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C632F3BE636
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 11:14:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077245; cv=none; b=DWMCPx2AOROszWQduZYaAYcWQ05hC54ncutGmReFO0AYebPqgBHtnHn3fhYR0qd5zuOs9gXBsg/pwBm2f8Ug0TpyfE3D4upMkeaKxJ087XuQKrJxlvAZxTFKI0aRXXc7e5f6Dn+zp0V7Rb3mPlhoty18pMbRVK4gFuygbI/Nk7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077245; c=relaxed/simple;
	bh=athePAx7BbOFVZ19VFS2S0g/Z8cfkap7sP57WV0yZNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TfeJyxQwOB8w2PkgqaCcQgRgRhONv9m2xFyz5c/Cir5lRpgeYsLpOwK2iIqTrlU/4ZtrQ56hDDLG7zpRqBs8oqixsTaaViyJYAOo5hdX24SQUvmgd2OQAqkOiJuVJGm6G3tiZW6l46NmqL9GmtbDZ1GcmX3cIyGVTm5sjJ/LIHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMlYijpz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNL9ciib; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637ZgwA3410056
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 11:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	naSIg8io1zjzPWn86qy18L8LbP2gted8xk4qZdDvsRw=; b=KMlYijpzAzgJaakC
	TSu16+nVawbb8/hm8ECEMecFtyydvCpYNTs/NXLa0qs6khNtTWXMz2MbSeCvuGZJ
	JluKlTBH9Wzn7FN6eMkLvA3B+ZtSrrabfN8jIkSgKXjhFyLOeRIvkIlHLXZ501BX
	COFHwJcPL+3Kom5UoJ7vVVV7fQqPIq07hERKXC3BrCxU85c49upruPPKeO8CS4bC
	cX6nJgFHp3PM8zPxcSMrGO1ATiIKib9OxVwSMldBrP8jM++mlxRausaIidJlO4zf
	0B29CHFVkynM1kbXsHihP+E1Qv9vcLqkuF4J3IwTqm0AlrJL5IIpd3nG2yRtmHc/
	E68e3w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u30sx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 11:14:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847a483ea41so619010b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077243; x=1783682043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naSIg8io1zjzPWn86qy18L8LbP2gted8xk4qZdDvsRw=;
        b=gNL9ciib7d+kI2WB3vXXpDJHaiYjePPZcbfM3MYxbTbXi3g09X4UTpzp2VVIt9H+UI
         OGF0dsYcViPDXt43lOj70baYahsduAwI4DQStJKJPRgcFcgTsGQTgrSkdgntFyGgyN02
         Sy6YcnUce0OM6ei6tTW1IBbUQlj6tEjLQ6dZ7WAnobDcjfkzX5RXZ0y8e//VulVjDl70
         tlW2LNuJ8iF3Z/Hjge5phB+y4LUHsmwcLCOIDvsSQEODxlr8lt6TD9VyvGMoUtdm1L4f
         AJD7oeHTNDK2liY44b4/jDyX0e5R7xrqv7kXmzSDREAfXqS1oUyzpWoUIcjptzBu0tTi
         YbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077243; x=1783682043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=naSIg8io1zjzPWn86qy18L8LbP2gted8xk4qZdDvsRw=;
        b=EhGo4PEX0duZ5jKwSXPNqUDl/8HkVro5nGFDIVfvU+1xbY1DpYYlGF6xwaRRk6jX2V
         TVb29WxFYY1dCb84TR9VUVLwybUCLEsQhYG29c9dVfnt2l59LhXRZ/oew38ongcVmfvE
         J5tS/qMcp+VH+oDJrNOux+bhr6A35nJbL49Xe8Iju83OzLiQQ2weswq0RvgmfOstAYLK
         i7HuR1LEnU37HhmrU6EVWDA/boVYNVhhxKcR1XYyzWw5mawRJX5Cp8LClAh4JjjyX4GJ
         CwzsvPDMBvRfD5dBZZ80r3NWpUhvXcpjUEZBILWbYICXxzaTu/K5IwsQOKEhjMlfTdN7
         kXdQ==
X-Gm-Message-State: AOJu0YxiMd9a2HcOuvoKf5+bOdggOqmpt2XXyxkSql3C6oJ/np+uzFib
	bOjmiqfLkkdbnLDa748f4LkVW3sY+Bxplvy+bfo5Q+3xlrQDdUhXUGzQ4pD4VFACyDOyVtBpvqa
	egzcL2WObIh5hrmXv48G73TvNqSwUgA8a/I0KCk6xcVHJiZjEA0OsrPl+oOKtFgOH5Ral
X-Gm-Gg: AfdE7clX5ADkuQjCnDqAahrRbD4jChtLjlj4VYyoDp2uKVnhGVfqgy2YvYuujIjfEy9
	q5kXoXYboGcp93zlP34B9h4NYUi6jE9Mssom9a1MJ1jRUiyReaGg0BuxPQkg7L8aGXfZXpccwff
	6c8FDAKLCK8D6wycrK/ffHOT2jAyApFaEB1A/rcW+NLHeOHz9GcOPEiq9leB+wrLp0EZHUZwNlf
	HjSyYkgpmstyNRVoeKViiqqxwsNuhdLmvfZ7FF07B3FJ83qGNASnS57KHHPUix4eMRAvmx4/l3t
	izYuaYIEfaqXFrXLLmLdPOHXGRdlzSYHoSvo8dRN1yFjlAAOhLsgB+cjUFmurdXCTtSi5Nzamcp
	mokFtU4+VIUJ11tpS8vIkcHhTmlnCir0O5IxTKKur
X-Received: by 2002:a05:6a00:760d:b0:842:dd4:d9e2 with SMTP id d2e1a72fcca58-847e14f59b3mr2779347b3a.0.1783077243353;
        Fri, 03 Jul 2026 04:14:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:760d:b0:842:dd4:d9e2 with SMTP id d2e1a72fcca58-847e14f59b3mr2779320b3a.0.1783077242798;
        Fri, 03 Jul 2026 04:14:02 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2729490b3a.33.2026.07.03.04.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:14:02 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 16:43:43 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: shikra: Add LPM stats support for
 subsystems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783077228; l=715;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=athePAx7BbOFVZ19VFS2S0g/Z8cfkap7sP57WV0yZNA=;
 b=RmD/DRfXmIh+8TwRhLoAhTzFg+FKcDblRfvOB5Ui6u+/re3j6WpiKjDsh9R7Tjm03VOc7GjEv
 P3JrbNddiMOAl/7Di9+VePazVp6TQj6TJ0Qj5YvcVeCP1Jx+Ynrjbmd
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: rfRCVLiyBifu28mOV4uWoT41kzfeTEPW
X-Proofpoint-ORIG-GUID: rfRCVLiyBifu28mOV4uWoT41kzfeTEPW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX4snBVLjZPDIW
 ZXdj5muueIVoszxJasA+332dsg+Zu+6du5GCuK7ooxp6mHhZcjTRSlma/HV7pOGyfUsXdvOsKn0
 /Bgm80EovBrBuyD2HBDPSfVJoWAxT/A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX48lZYHXAWN/Z
 iM2Dhogst0KTWxeQn/0WmSSR2EhwLQrg8vmyzDOb4stt3N9E7kFJNu1Z0xhjN2If6tS7R4pNc+4
 rgVcd9CGsy5koxIjB3fTya8BpVEZVgJC8DTpyXH+d3zG8BVimtpYEneDb/KqHa0bnPnpCPmTRF8
 ikOPlpCzQNTURLKGpkTzLMqQKasWrqwbefWlJBVDWMGuHck4qE8opowmeJ9ZwqVFWLoY48AED/g
 gmU2kgJa6mMqTfWZMkmaiDDVX/6ZDu3Z9TGkUa+Rdk+L1yl9HMrsrkBRUcS/2sJdy+2IF6y7MLP
 D23cl5wCLk9YSZWSZDn2r+tLtJBItSbP18wvie6C6mz5rtoK7yiOM/IVNst1PRjJsri8QKeNP3C
 4d+Rs8e5YYkrJUWXa8CoUy2MR8NZcspIJtPuBbKceZGRWv83/kDW4JQQ9zKVou74YE8eBZZxG0o
 Gkr82m7S0GTpXOHgfOA==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a47997c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DU1Wev2QKLRUMiDuaJkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030109
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116294-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 5B68F701C10

Add support to display subsystem level LPM stats for shikra.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..53f40283a3b70bccdc510716b39251d377be7d24 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
 		};
 
 		sram@4690000 {
-			compatible = "qcom,rpm-stats";
+			compatible = "qcom,shikra-rpm-stats";
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 

-- 
2.34.1


