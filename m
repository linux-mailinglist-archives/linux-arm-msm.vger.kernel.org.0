Return-Path: <linux-arm-msm+bounces-119259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1ZBEAvWLV2q7WgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:32:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F1E75EB67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:32:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c5LVJonV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="XS2PDl//";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119259-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119259-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10D523057CA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925B941DEE5;
	Wed, 15 Jul 2026 13:22:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD2D44682E
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121769; cv=none; b=PpBs2mB3hm+Sq/cexxSyGfOQ4MMP0b9AsWjFILzH/s1bAj/sPgxDn0gkfKA+UVgiTvOq2NOZj9lC45oNRduxY2/BVdrO37v5p/s7f08UD8+9orCjqtmm24z92/DsJoxRJGpshDTkdudJ7uKcSfSBhCSvo2V+tUflAp6kpQVj4Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121769; c=relaxed/simple;
	bh=cg4ahNzE7EQt88WAfbItzJABYeWdAiELXb1PCGpO5bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oBZZUvumCMVbkQmPXAnYJQDEgueSJiUxUcVgwUzeAA2jWwr5IE8J4HF03ReF4SF9JC4LaZwY8qAGy484OgyBFcFFtk3nnYnI16/Uk1ODxekCOxjx+kbd6SpcaEL2juQCXxDRvWvp39W/37XKTR/yIFePCmhvLq23sOtJYtosQzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5LVJonV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XS2PDl//; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcpgd3339097
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/yefe1MhwuWOpT6zu4e786DStwawUL0hTuo8YbebGdI=; b=c5LVJonVPU0mMecD
	/WHmpoUeNr0LXxecJa3S+jIfeaE9FeXAimWffmVt0FrG307JY8OK3lJx4gM91gni
	A3PtXwGXvya703SVSXSUctpEPXT3PZrXglqzb65OUHx6TMnpMm7ueBifuf5FKfR7
	OwVTd6LYmtNEwft5OMTUO+5Xqhy4nrZ7a06fDykl2OUWHm2ktVRlLBYuZpPGMydj
	TKrUFHbx2W063JrR8jFQr4JUIFxc1fvLX0sW65w7zOhcYVa1KDNGZJIDlfBvZXRW
	w9jnNpazlC7qQYgcMkf5+afG8Eq9o27tAkrSRJJurKzEpAmmhnYIqDyq3IwpgeHh
	BtxwLw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mkvc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e56b2b350so1056546985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121766; x=1784726566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yefe1MhwuWOpT6zu4e786DStwawUL0hTuo8YbebGdI=;
        b=XS2PDl//mptSHL8tW02FNpuh4F45RW4yTqNMmaEAI2hnWeBHwUTu+6Rqc5AE0vZuVl
         i1C20nlfECWXVESbvymJlYqTtOtQY/55xkaR5ISfLCskff3RYEOu1VuaX7A3iURb8A1Q
         oQaBl+joJ9DE8hbgkOu2R3A6lS/TCww4Sy0zb9crIjxA2BZ3PbWt7cJtAG1SraGUN+6j
         PKKitoKl2aXKv4V63f4IT/hVyunJptNw9Q4/HlcA6j9ynYVBgix8yMtR+1o+TWUELlvw
         jjCDGsIt2uJEqegSqvm2M6s76+GTQzAPMMd7jgflyRLr98lT92v/kqtrXY2GLl7R1Vb/
         +P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121766; x=1784726566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yefe1MhwuWOpT6zu4e786DStwawUL0hTuo8YbebGdI=;
        b=F1qi02zqu9yEhptBh24nAVKdDTzrUQudECrT/7GkTVPDZh6481Kg6DoSXL+rGexBqt
         USqC+jpchxLOTpkVYwdySJqow+TI9J2ljccb2oM6UaMRIXY6h2m2bWT3si09SwlJsiFm
         O1TkB1gIJo1M2P+yO6NjrGm4zzmV2G0OzjVOaChfvNpbjFr4fi0/m97ENyir9r3ePUeu
         MFNWOkT/baoakMs1xzIZUMoGGsRBLIFZe3xPbkB6ZR4eT2x1F/8/gHtMVSJkZHh1R4NB
         XREoiJJ8/GowEWSWQ2IHo1Zb8xyGYrgNQI5PnVTUdaB/Dj9vYET6G6zoNmbYy2xW4Lr4
         Qdsw==
X-Gm-Message-State: AOJu0YyL+4h1dJPrcST7Jy4sKMX3j8EM5usbWV1U2J8t+vqW56ADvbHr
	VQ+uMVb+lo/wEEe0f5ohz0jAcGgtHVBzMVpzOz7UgFzNNJdI8FqwcNpqI3+LZy99An9IzCJWm5d
	FQE/kugkc0oOSsHNip+x2ypSQshEr/4dJw1ahokKq8M+JWRTzi2g7wN0ZLFLfyomI6T4G
X-Gm-Gg: AfdE7ck1xQJyGJzYLr9JNxjmWBYeNMdipJGjbRGdeASGIiK3GD1YVg+NLEllxO+awVa
	LBvbBC0/kloQLUlQ8oZojXvXXpz3acg9FdmVJOa62T1B+w685rKvMw9l/pzNBHJ3mTUaOWlUHVs
	g8bpFJg66PFXgHUzzDKDkMyDyKcldc+2Vg4KPYK11rKceQfZAz2zS33nk2F5eB4bPW35PAswBtE
	A2EE5DLzvCw2UbHEvD6MCZJY5GNq1v+Oc9rNGZ3wYWVXxKJsfnEmyy8vLgIA+63kterXNZ9eqcM
	LbY+EH8HPLTfzhhiP19wxFUVrSe37b0nDx5gdjXDQFMdXQnlrXmYzPv1ww1tMH38CAOAhrtugqG
	T6fS7V3wOeh/v0Dr4huwp6hQdvpx/WSXPkCF8WRA=
X-Received: by 2002:a05:620a:3911:b0:92e:68f0:1eb8 with SMTP id af79cd13be357-93096375b1bmr276808885a.59.1784121766556;
        Wed, 15 Jul 2026 06:22:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3911:b0:92e:68f0:1eb8 with SMTP id af79cd13be357-93096375b1bmr276804085a.59.1784121766107;
        Wed, 15 Jul 2026 06:22:46 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d6a77csm1773676985a.45.2026.07.15.06.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:45 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:52:02 +0530
Subject: [PATCH v3 3/3] irqchip/qcom-pdc: Add puwra compatible for PDC
 secondary mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-purwa-pdc-v3-3-be08934dc916@oss.qualcomm.com>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
In-Reply-To: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784121746; l=1015;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=cg4ahNzE7EQt88WAfbItzJABYeWdAiELXb1PCGpO5bs=;
 b=Ak/AeE2kqiDyqgHKFdDDyN9F9Ruke/ofJBgZuKziCza99ngYwqJ660IEQDRosVPmXkiTmrgbR
 6Is4Jatu47eAhUggqdTnqwxHIttJO2CZRxy0J/tp2g+BWvHlkvsgcbA
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfXyaSnWHIvHtah
 EOoIXgPzBQDAifiFmWj9NNWCeNWeeAnBo8bjHJSWySMOznEjrg01+y6AgTEXytPgJftVixV6/t2
 QwrDmsDm7ycCpiB7FRfgGNRlEUWvUrDr2aKxyXyYCdBCXoQMIaGuJwTF4zCdKPH+qEILe820+5+
 6nT06zAmkqYRvLl8DhgAjKN7fwNIfYQaGF8atmy3F/ak4OLyQIqftN+6UnQG3bI065c2eZP0d1u
 cVMyGetCCnIKa+HXPORCcwmaXDnYNk+Jg5gY7blDNp8NornfdvHB45NViAqUTTRMdUZLcRyOnPl
 zNlVuXHJN+SORhVb3UEIwcXAC5SP1l16NXs8L+00NCqZUgUfmIrTXQ94CuRZy8tdJmD62npWIO7
 B40mCXef+z7JVbLAWBu+TR7sGbCqS9cYYsfQBqinxC+VWm2N4jA5dvUth3AXmi4IKYEdUtnHlBy
 UTxuFoiSD3G8q40DnUA==
X-Proofpoint-ORIG-GUID: OE9cOmx-ZakksY-eXceQNVqJ-9gsiLzY
X-Proofpoint-GUID: OE9cOmx-ZakksY-eXceQNVqJ-9gsiLzY
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a5789a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PsF74K0pJtfrG51pEAYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX5ff7XKRfmQhU
 vPBvNCKoHakhUQftgCRwMnrRDM11dvZENkbYgJPS4pR5x3vyzzdwi8YivBK8uNZ59cn6acotfQq
 W7FITkdLS64RBADbQtZ61t/kf61doUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119259-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8F1E75EB67
X-Rspamd-Action: no action

X1P42100 (Purwa) and X1E80100 (Hamoa) shares the same PDC and windows
firmware sets the PDC to secondary mode for X1P42100 too. Add support
to reset the PDC to pass through mode using qcom_scm_io_writel() similar
to X1E80100.

Make sure x1e_quirk to workaround a hardware bug is set only for X1E80100
as X1P42100 have this fixed in sillicon.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index ce6d80c7f17a..29025a212ece 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -715,7 +715,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		}
 
 		pdc->x1e_quirk = true;
+	}
 
+	if (of_device_is_compatible(node, "qcom,x1e80100-pdc") ||
+	    of_device_is_compatible(node, "qcom,x1p42100-pdc")) {
 		if (!qcom_scm_is_available())
 			return -EPROBE_DEFER;
 

-- 
2.43.0


