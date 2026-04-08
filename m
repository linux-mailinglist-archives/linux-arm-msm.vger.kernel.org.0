Return-Path: <linux-arm-msm+bounces-102351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INH+FI6N1mnzGAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 19:17:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A78BD3BF617
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 19:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43D0F3027B6E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 17:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2413D75A1;
	Wed,  8 Apr 2026 17:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMBXpyGx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XzWuq3NC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4FE3D6462
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668514; cv=none; b=gYuppSp+W6h4O8+zqhtr1YR1C3nm0/kFbJmHRjW7t5h9t5ePQfOtPK5h+J9ZCXgNC3VFJuIH/bYjMSDVTBrvkoiUM0PXib5xW0OniWEqF9OGMw+ZPBiVFiGYHGkDJgZJa+V6gnny+vGj/LLc1xQzEEPTmpGveaGfnNz7DZRB7zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668514; c=relaxed/simple;
	bh=nh/U9xN6LkQ/KvTu465vaWXNTfMFIKFvmSb75M2Id90=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QQ4XqR+INvKFsJWSOq5UOwaGPqrkXzM3ohSpElSZ4zTA/FSLGi1f7pRhvK6zjSw5siF9tovEaQLW5rSFDFwqEYB4h9org9wMLk/6ntlPycMvjqXcV5lYjB/mDwwTbw9+AxmsqoOUcCw2hc6u08vi+uJ3rQemH94FY4lE2r15Jl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMBXpyGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzWuq3NC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638G4lOd2845979
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 17:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eEX0eT0+9Pfr6i6e4HPyfeGdSAUc+2Nxl9Ny4Lo9MeY=; b=VMBXpyGxVNWwe6oy
	18Ef2/MGEVePa27+QQ3YRBkIFvhUPfQpeEMHsLNwG3C3u+D5tDBibQ7LwE3QPh7S
	zrI7iOEsCKey/VhkfFnWr/VWWW0nFZ4Gae2lTwH8f4P3k5GcneQ85znvPzzBFfEa
	lPl5hg9qEc90RpASLMzjApxmTfL41IAt5PM4rW5aKL0Z7baJ0OzbXdDrILCN7P16
	sFVbNVKosp+CZnYwQqBSWG8CFeG1m4f/hAQj6BuVoHrRrbmwBkjfc28v+/s7RJvO
	Shs60masP6S+2Fhc1HPDHrf4fuLmWNQ3N2kJ8eeOwvJ845GPM/XChT+gbQbwJh6t
	j7aiug==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt7hg8jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 17:15:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76fe944e6fso200685a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 10:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775668511; x=1776273311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEX0eT0+9Pfr6i6e4HPyfeGdSAUc+2Nxl9Ny4Lo9MeY=;
        b=XzWuq3NCB5SeLDCoV6DRmcejRK6V15W0p2bPROFdoVHdvhGR0gny60wX971LOqLLn3
         CpgcH4SfmPhM2NliWOXZC12/L3GRBZ+WbdWpy1WmftH8/8HIbVlGDvEvXI9y37+0uCST
         TzH/+rOoYa3r9/CSmkvDTkMjiN98zcCq89cJdyws8kJNpJQ6xKuNDLqRxEK4YzP88FEW
         zzw/q2BF4/wAyjhVOnSm27hVUlkQ18ZdfvkOUKzwGEBk5v4fQaFd/JPyiIQkR8nGCCFM
         RlCH6HlxdpzJCx7KzIzNyahe+NnSAzBZXjQyrxH74SHbhZZUBH5FTeFPVVTDnJK+46ZA
         LEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775668511; x=1776273311;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eEX0eT0+9Pfr6i6e4HPyfeGdSAUc+2Nxl9Ny4Lo9MeY=;
        b=Ka92pkadXiwLbHQ6E2d0Q8CyPi5gqaP7bL1keMAsNhXimLbAWw5Z1AHCufXEIM5xfu
         WLFlj5dc30730bmiY9a/ERZQxFFdyqzJ2pZXtuDcOUAsWcsuMbtV+O+1UvzevhRGbiQg
         ONxQbaD7QxCpqSSx+NUpWNtQX/smsnKTbbJYAv16iimyvt2E5r4TCwOP/wjeZhI/Hg7d
         NkiqA6//EGtzZOqUZqBeNXQ3NwdaoZxSDv7zjQPE/fQX8nX51ar3M92g27yeoQt/mKQs
         mBPpjJ65kdP31LcKGkS43zIwbL1lYZ4pHis5o2O2Gi9l2Qo7KLyc+Lf/9NVznhPgzqIQ
         6X9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHplGNRuBFBqJGH8pbKFF0f4989q3kqyr+m0rjKpbAPKhsmC3RA5vo1RrpVFeyDizEolsNLfkAmCduuI6u@vger.kernel.org
X-Gm-Message-State: AOJu0YyUSOkILhruy0Vp/q31kqJF2ZnSLyseHXylJFRIk1JOu/T6t5hD
	hrUFts86ywWqjzJTsiD+ku79L+6pe+R+zap+K/fX2IyY/oBrEWAT88/bofqLHRSoWeKWNJlQz6C
	pOJGwlvlOujBt6h8XQvsCm4Hvg2CI3XPEqraBk+MgMfA9D46x2IUO4T5yXnaPblW8MpiQ
X-Gm-Gg: AeBDievIRw7AI3Y7Mschlyw0DaRNrXilRozZLfgrRrsyY9HMAsxe4yV9MRk0N+SJd9G
	1XDQ9gAIpU/vig+FjNz6n+Rno9Pgq66GwHuwOkIQ7OLfwTzEDEsP3RH6FJf6SiVGl0nuBOAsU9v
	Eaw5WuCbuXUBpUUYpmNEcM9lIiHNoRTWEt5BZxBRr/PcLaF38g3S2z1X0+nLQtYh/HDEITe2Jqn
	PRO1j8oZA5pTlGLdnHLlz6frTFXBTrG9ZOEM/19m6GarqoiHPpKvUDaIGhjMaw/jbFzfd2rEGjd
	Qu9+TdKdxFZqRv5Bsfguzz/JErqokTCAOLD8aov0AGL9omT8aS9A8UAeZslGk14oJMkS6ceku3T
	XE931XQM/3hXUiHXyswY84bNJYbSqtsUNIx1s3HIGt7OXpsAJtmmwIostuC6VQAtEj3Lx1Ukkf7
	sa
X-Received: by 2002:a05:7022:6ab:b0:123:3488:899f with SMTP id a92af1059eb24-12c28c2d224mr128623c88.32.1775668510836;
        Wed, 08 Apr 2026 10:15:10 -0700 (PDT)
X-Received: by 2002:a05:7022:6ab:b0:123:3488:899f with SMTP id a92af1059eb24-12c28c2d224mr128609c88.32.1775668510171;
        Wed, 08 Apr 2026 10:15:10 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm26103624c88.0.2026.04.08.10.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:15:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        David Heidelberg <david@ixit.cz>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
Subject: Re: [PATCH v4 0/3] ath10k: Introduce a devicetree quirk to skip
 host cap QMI requests
Message-Id: <177566850912.1322920.17816533595535960130.b4-ty@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 10:15:09 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=O5IJeh9W c=1 sm=1 tr=0 ts=69d68d1f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XIgAiO59-CApRadi8WAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: fhtjsDFMwyB68u2lHMLLNGJZ8fmg8oYV
X-Proofpoint-GUID: fhtjsDFMwyB68u2lHMLLNGJZ8fmg8oYV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2MCBTYWx0ZWRfX3cw/jP9KHNxR
 WTl5sJhR97Ekq/UDJqfOSfEkQvMHJ/xqA/oNBQegQoB6zEt3AxesPgH0fkfOY7H56u/KV7W4JC9
 XByk8orb+6U5+gFzyu0bvglMSX3lD6bk5Dna2oR03KR5AQbhvDBmG0uFfdNGdScyCDPKrVREPGT
 9i8syNtQoPeua0qdDj2e97yX/U/B9BmAOB3V/0Q/X9M3EflhFKY+qWhthReXqt2fM047EFUi1o7
 1myxriYZ1WCnJqGTFK0gdtnqEgPrk+LV9eBTkmtzuyXPRdLgm4WRg/zRcahZYEYvp6fEaGDWjOy
 hqaSuX/JVvCNZsNMEquNhJqswwnV9rEhF/qKZ8LFnWM+yyHyW5kE0Xo6SpgFQys5YT5Gk7xirMW
 WV+3StZGmU2YZsYp6O7k+W8LAslKoAVzYzJV+imPaQlWu5bRCaQnUc/X4G36Rn3qx2REkLr+DxG
 ciFGo6f7hvNGKIeMbbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080160
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102351-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A78BD3BF617
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 18:57:14 +0100, David Heidelberg wrote:
> This quirk is used so far used on:
>  - LG G7 ThinQ
>  - Xiaomi Poco F1
> 
> I'm resending it after ~ 4 years since initial send due to Snapdragon
> 845 being one of best supported platform for mobile phones running
> Linux, so it would be shame to not have shiny support.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: wireless: ath10k: Add quirk to skip host cap QMI requests
      commit: 3d7640b6c371a1795e6d9580695d20caf16be9a4
[2/3] ath10k: Add device-tree quirk to skip host cap QMI requests
      (no commit info)
[3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk
      (no commit info)

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


