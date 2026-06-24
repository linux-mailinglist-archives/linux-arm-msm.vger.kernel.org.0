Return-Path: <linux-arm-msm+bounces-114403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id td3qJKUsPGrKkwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:14:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F9C6C0F09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:14:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lg57O58U;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CUoyzjSo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114403-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114403-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09F213127FEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D48F34E75E;
	Wed, 24 Jun 2026 19:09:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6853F37268B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328195; cv=none; b=L3KQkaVx7nHdNwO5+2KB0yfusdzjaNhyPvT9v6MmG8BBSRAhg022T3jcmBgiNCBZs0O92FQcDgPYP0O8XO6Rxi8jFkjbBwOU7WluExhkWR0jsqzDZoYolwRQ4JDI6HaKxCBYdkr1Rzdn+hEQ0ttBVgfYSc+qWmCkoQ0cyrpS6hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328195; c=relaxed/simple;
	bh=EjjG9uuZ18434Z0RkOsgtZXR6MNgb5E28wxf+aLVEaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sb9SSvVY7/wcMjpEVuDYqQ6SUvq4Vw42Os/eBHVSIbdyuvbrCazSdkCOkY7YQit6tWDG72tN8H2MPXYVO0kvDFKlmpTjj18Dmgn5tuokfKlujqRYH6Y9e7EWvylDvkCXCx9a5AA6vgEoZnJhzekmCo/C5JZ2IR+OiYFByzdAP9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lg57O58U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUoyzjSo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj1P1978214
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ULdsh5tb4p4
	rfzFEsYW+kqHFfBbm7/GT404amy2Ackg=; b=lg57O58U/0aY95t5GECFcjp78M/
	yBwQ/UgPrriFKq4TXI+8EHvEliS+imZNYqv7ncgjLBZhxWypQY8ysDzxpWj+kbtf
	fwiMcqfKZlLnkT3eIQDg9Lp5w6U6RNaiygT9UzTfZePDjzeQypdg7UWASzlMd2r3
	5B4EBoPn5wiAy+qwY9bclHNIsaE2yvvyQu/S8DmxOqHRveiqrrFfDp2bjmklviuw
	Jj7U0VUO52UgZlnzkeoXlRweZNzpEeY/GjHzmADtqSzqoTqxcTJ53E+X56nuFlSO
	FTpqbL5tDvk0jWQD7ba6k/OTs+tyKre9eyRAZjE0bN1mgkPJiHBsknKFd8A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqpau9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8421ffff8a3so1597667b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328192; x=1782932992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULdsh5tb4p4rfzFEsYW+kqHFfBbm7/GT404amy2Ackg=;
        b=CUoyzjSowI7fDOG11uqJlLL41I5LDEwNe7YmV+O3ZoOZ3Zw3onjdMFEJnQP2NoBm1B
         FkAX5HFeoX5icV+XWq5X1YQs6PFLTFHUSZYH+UajrNxuIKkMgF/W5zPjWq9GwO0I4qEG
         OmekPma00zq3Yjh58/iWSv89cgERh7KtoLIU6Il/0nGGnTLzHQpqCp+Rmnl/OCcIEfvW
         gNaosc2TRuk29tK/fRvfjnpsTekCfTD+4D8yNjAPUEQFh5FczqmkFU/6ZP9doS7BNWwG
         L54E6ykBXsrLSxvcUlJLRClBOkNxajj7FSxxGqJ04UIuaUF/Nc3atFwzWbQG9skZhJ+f
         CNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328192; x=1782932992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ULdsh5tb4p4rfzFEsYW+kqHFfBbm7/GT404amy2Ackg=;
        b=EMzYVFJWkK/hawe5WvbYVK2wU0eLf1DAL65mevrnuazcbkGPD69EZLwwgKB0vUBbra
         xEetxW4Fo6PwJVP6CzMs3YAPMjMwwLka+duKHzNn6LY2FYpSSJGKK0V2YlbbUvgYBwFv
         gSDXdG4i2IAiMbmR7q6ktFn82B3dqw+dVnkYzoLWGvEqt42TBjTSRW6gvD/IrUfdqQh9
         IEK+iufF+JZXn+oTiZ9XTnaquLOowa+I8BP20fPVslX0FjnAbO5tJMMxDG142RvY2BWg
         dW6uMOrFXepuak7HGmD8Etsp0UVi/ZSKBzP7CqkZyJjzPeHue9ADiKWzebSsukQcgrcm
         o8gg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6M8Lh9/VymcdOMsx2CngX+ret9KVwTn99xTtAlRskUiLoQVA61bA35UDUoa42EOoofXaDS7v2EOSzukQL@vger.kernel.org
X-Gm-Message-State: AOJu0YziSh/09sqZLGV/eb3uqejaziwcfyqyzzEvpmU+6XwG0N/TICcW
	L2CcTlo0S1KjBxNrTQPx+R5+s+ZFUIJUMsgw6MjuTNljjvFB+M73dBaq6egHn1w1oTWR5dkP92Y
	cJR7AA6sFHJmJ2qdzhixDc7MY2V5bWbOYzkpWNlPDHCDSii3Z3oh8CWDJdop9xFNcOhBb
X-Gm-Gg: AfdE7clcSKRRSr4srj6Nakfbs0Xpse4SE3X/kSmdmCd4wJy6SOLhTbzqBPuNrFila6w
	cKyOF/0eNXDGAXUm12B0EiebVjlTqJbnKtw/o4EgBukqvQBQZcmNRPiVWAtV3tJLmkORSwo9XqD
	QMIH4HtQt4rkLhOKdVpkeIJ00+3q2040wB/70JWrCu3EXEYEp8+YQ3AsnD0J3op8xx5pKVHtb3x
	ZULeCI4J9pn1qZ4TsGL6nWDUIy99rsTslHhGHbh4uFyy+wHMcANyXL2iyViRk78XP7gLp941k7C
	4J70EhL73pX5hV205u3tq+giu8TMfAE94ETUQ/6+UxzF8trmw5+PcfKnZGYnmZxXf2IAWmXnbXA
	E82Yi9HV2+rljaokzT/Ij6Sr5AIgvODLPI0wAqg==
X-Received: by 2002:aa7:888e:0:b0:83e:e897:a394 with SMTP id d2e1a72fcca58-845952108bamr10208896b3a.7.1782328191520;
        Wed, 24 Jun 2026 12:09:51 -0700 (PDT)
X-Received: by 2002:aa7:888e:0:b0:83e:e897:a394 with SMTP id d2e1a72fcca58-845952108bamr10208851b3a.7.1782328191039;
        Wed, 24 Jun 2026 12:09:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:50 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 17/19] arm64: dts: qcom: sm6375: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:28 +0530
Message-ID: <20260624190830.3131112-18-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yZ0fH80UOFkmPlEQ5OeTejRevGJK6l57
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXwq7O5E5xeSmn
 LBhTss9D3ICeMmSOQFOpVoRtDvbBwt1XFUleTzoNOklaf8P0CKO6DMUeBm4Q+LgALPrIFjcw5Gj
 t+fjtomqv1d8Z5xI+ZnaFhfWPK6XYHqgMq6s1isycdkA91nZKif6c5OQy37yEz1fR6zoMtJhWcF
 zFzFEz0yBBs+qvlSqPeOLBQj7Jt/ZAXur32BtCSm/6NsFW9Lwkn/fwbeCxkR3ltH+eRvnar2Tur
 Fz4/7yZZhfmlZfFbuzCSyj5hojIG9jXNMY59CStX+qbBbG8sMadbrP+E6wc9Z0IyqGZy+YSbPsA
 +YTDyL0IuKxn+B4r2M6ka4bFUhsKxi9nVrdzNop2aypCw5ppFQz8nM3XRNCgQ9stebn660qZCoF
 m7go4oB71sjqhB0OhAEKShYBe7Kamw==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3c2b80 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ih2dppi7jw4BXePuyMoA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX+dJMjLGSG/H8
 teY3JHRaYRH8c6qFx8VTbHEPzHBi343U3E6PUq7JzijQqrhqMN3rOogosxEABEcEHWe8IO3yYap
 9iChB9CdFouIvXxhWI/BMWLR8OU8nzU=
X-Proofpoint-GUID: yZ0fH80UOFkmPlEQ5OeTejRevGJK6l57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114403-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50F9C6C0F09

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index ccf572bb1549..71a228597093 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -307,6 +307,7 @@ scm {
 			compatible = "qcom,scm-sm6375", "qcom,scm";
 			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
 			clock-names = "core";
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -1645,6 +1646,10 @@ sram@c125000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0


