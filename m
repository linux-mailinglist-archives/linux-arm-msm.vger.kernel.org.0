Return-Path: <linux-arm-msm+bounces-102470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG78LRFw12k5OAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:23:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AD93C8692
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2B9E300D1C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8074C3B9DA2;
	Thu,  9 Apr 2026 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vnr7Gw4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1YIeI6Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481843ACA4B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726540; cv=none; b=uUTmCDDmdYqm9CUqal4uFYjG7e9N8VXxDJWTynC6/uZbuUTnPpcWJHFcZ9nvbt+oHiLJGUKqyHdzcRCdR1QcTdt7Up7MrBGcZK2rGaAK2mwDzSqJauBiL/gWir7iQBtv6HAbWxD6zQc+BGG0WTwTVtkXKsm6y2blHDRm4w/fK44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726540; c=relaxed/simple;
	bh=UhvS06E/0zxHH+6YzYwm2XqZemBnbJ44byW3vy0sff8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhXYXljLvI4y46aBgtP3bRYX6tzafJnfyU7mH5KEzk1ulaNsW1t0kSHgeyUNXzde4q0os3DzJkr6+v+McMTdRGtU7eOYd/4Ng3Zk+QHtd0uPYC+byRy031+0JTHdWeu3100VrFhYK0sUb/wdx/HpGMV0nLFuRp9ERW0d4bHQvng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vnr7Gw4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1YIeI6Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6392ux8O2247256
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=; b=Vnr7Gw4gJzMFp6Rs
	vuB9mR6UHq36tz+FqJ5cdv3XoyQOLXR/HW1y4wS7pHkHsVXNDIwH9YJzdKMeLGBz
	Bfyt5m4pUa9LMAkQ39kl26lZweml45QOleGkQquWqs/uI4mmo8FBt9+UTaZVPAXU
	PdhjEAquALL24A3mnDeBEt8g8QVsgiDN5mZ26+piNk+5hfOfQkjHP1Gv2BByDJVM
	Dh71r8XmvvflBhQS4lA4KyXFdgyFI493lmoi2CgMk2BR32wSi3IhJBtZz1gLcf8F
	j8/PE2chqbV5llmPJyzNtwZw3QqMjuPt0eUjmQDJ7JdFG0+1DH6+Mtn5D5wefIpT
	hzX3Ow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de3s6s91w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:22:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2471321dcso20282345ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726530; x=1776331330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=;
        b=P1YIeI6YIilJegxRvX329LWfEc8jFl9lgBOMG1nM6S8paM4D4+nPUyBQ1n/9RbPK3u
         d0Dc4PjIWMXJ7dbV7kDpcGbK4AfskjdiI01AUThxZhg8qQrRRSVoM4KtxBI1sa9UrY+F
         9YP/Jxj016IOP7wIz++t6YDrdw8bluGLFrLkn9evaUr4CHgBP/2iQKSZQ7y41T72mdx5
         dXew1/Vqq/ZF8MEM+Y6Du0+4q6FCK6Ude0N3+6ajENBaYLFc19HHbKf29AbNa+xWV9Ed
         mbsg7L5c9A1+CBDvut01w/wrZoAjX7Jssd9gRlPab6IpJqYaea2EsWP3co1Nw06KO1bv
         dyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726530; x=1776331330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=;
        b=SSRRir/gxPl6BkKJpgav71WRmRKYfL3xKGK56U6pmmk6gEimgDWODXS+morAAIzyXi
         HCV2YScWYgQoIlC2UEkIALNuliBDj1z7iT4kH/C+qjj3ApPYC7npoAvA84GQBep/STUW
         orQLuY6gDXPVPp5BjKrxTGnaggXvjEzpwiioMImT0vHHjghykZqetUqIxe6jk/S3EoFj
         boinUSHUeaQKFUGY9Y2L6MfG/LsdCYIiFf25McyWmH5lhbA1gbhH5P04ompJeKwBvc3T
         AVGWibpsErxLJ7k1vT6UN2GIKWE9wfXIWrjUbHxu4N1L4yj0Jb0ZN7zxCyTqFjRNaeIp
         YZlw==
X-Forwarded-Encrypted: i=1; AJvYcCXuRevUXf2Y075wM8mIW5b7EAYvqgg603KRVBOomXV8POePgYZJ9ea2LeC031CjNzc42+/XmUx2pzTnxjih@vger.kernel.org
X-Gm-Message-State: AOJu0Ywal30LU0yffZTUGihkEChKbxzdfr1YLRWhDtxFRFWtgR1JS20m
	r+y3UdwjtAK5E5Mu+cLJOxQeEz0NyrfaybV9cwpaeFQZsz8Fxbwle+FuzmUO9FSd6IXYk/87s8U
	wI5GEZhr8CcVFqF/eiS0MdYPN/uR675T9nFNgZbmUU+gevP6u50s7cneSwt/NYGZTd+g9
X-Gm-Gg: AeBDiesR5Kxypoe1oKNoEou7mF6hogCTFOk+qUIfuvcaWzGHGESlDSKsHcwwxuyWWhF
	NaK5pUQb4cWPl59cA+hhnKYDOjxrRp8nLLnTKXJaXJvBzdesDFRsa0ZLiCOVZqdA7U2Wxlf9daY
	jWISnBasGF+uL3S4Tx5kKDCEc+YOPt7MZFaPc1p9t/AUYZ+077OSERZlhNApNUpy/MeFLd8RqXB
	+PutyMEnPWBYBjQ8vol6iUkpPTe5oLM4ZpaSLnRQf0TsMDCAlD4yP+HNvNtxj97GcAeutiroIq7
	qlJOmJWyREE8VBAS6gbDHNPWIKeUnb0jW7BbrmTEiJjfRfAYlzc+7ncB2MiHaFk5COk+MHkQeHN
	6mXUfpmYr7LHR+HVDToHcIeA5JZuKSqAG1TPa280/baPonbguS5tm
X-Received: by 2002:a17:903:1ab0:b0:2b0:59fd:bbe5 with SMTP id d9443c01a7336-2b2818280d0mr272631865ad.4.1775726529699;
        Thu, 09 Apr 2026 02:22:09 -0700 (PDT)
X-Received: by 2002:a17:903:1ab0:b0:2b0:59fd:bbe5 with SMTP id d9443c01a7336-2b2818280d0mr272631465ad.4.1775726529244;
        Thu, 09 Apr 2026 02:22:09 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:22:08 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:51:09 +0530
Subject: [PATCH v4 7/7] arm64: defconfig: Enable VIDEOCC and CAMCC drivers
 on Qualcomm X1P42100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-purwa-videocc-camcc-v4-7-5a8e5f2dd4b2@oss.qualcomm.com>
References: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
In-Reply-To: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: oKPq8FM37xAkh6UGmchBS6hxE6ntzCdn
X-Proofpoint-GUID: oKPq8FM37xAkh6UGmchBS6hxE6ntzCdn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfX5kXlA9OZDCNF
 Rpp2ydb+w+BMN/pTjADCKoNFsmqV5yFlr74QaqrVFA9I6UzzYT85TZ1N8oG07cQ3nLLeDvUYzG3
 ZELkxY2UR2EC4JLluTI+oo7Bq9JgITlmAK1jcIB7zp0zMPerI4Xn6uB/Jtv78yjfTHxgfnPk+DS
 D/xQhAxE7Apr9aXzMh0YClOx8htb8UYGkisvpYgIwW8B8oSt4ZCpzdKqYRVVNF9UILfQ7+FW6Bd
 2XzUNm+xGi69bSnLGdlhLABdJLtoBBzlmwVxm706j93nrs3enk3pegMU2Zvs5pfciXj3pGMEDmM
 3T6LJ6rb8Br0Fm88CmW7S3B5rrNub9pjCbcr5lE5s2Oaq3IBi4sOZuAY7xGoJLsy8cmOT96G39N
 phc7IkT9gQoMym4LSuuBtOr4U5hEojjiQbvhnsziuqxn2vFICrbr4fq6cjuZUodeLqGruT6tLa4
 LI1Y8w02g91CpWJSypg==
X-Authority-Analysis: v=2.4 cv=TZemcxQh c=1 sm=1 tr=0 ts=69d76fc2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102470-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99AD93C8692
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable video and camera clock controller drivers for their respective
functionalities on Qualcomm X1P42100-CRD and similar other platforms
with Snapdragon X1P42100 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e44e83bc57812aaed21bff1b12d36ae4a373ce11..44dc5da9805ef01b30c39ad2235f9d294515b360 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1492,7 +1492,9 @@ CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
+CONFIG_CLK_X1P42100_CAMCC=m
 CONFIG_CLK_X1P42100_GPUCC=m
+CONFIG_CLK_X1P42100_VIDEOCC=m
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y

-- 
2.34.1


