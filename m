Return-Path: <linux-arm-msm+bounces-118753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AEcsNWfUVGrGfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:04:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DA674AB05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:04:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ATI9jp4Z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hribDZEO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118753-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118753-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC9A530449E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8B23F660B;
	Mon, 13 Jul 2026 11:58:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A3A13B584
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:58:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943911; cv=none; b=K40LpLdbORpZqKu6SIxV/HPU1lUcv6iw/04WcErECoRomleqjY04AdQCkFx+MWokUr7cQTwAYirxpz8sVcfJIC/kzD0JrQ0CVsT8D64GpjkVnaCQF8Jn0CRZzDSYaylPOcqJCGRPdEj1LElK0i5TR21p1u8ZfIVYm5PKi7J84uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943911; c=relaxed/simple;
	bh=sT38bhRjWOjfdjgeqQAmE55i7pDR1ODIXujcQKTrYXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m29Q6pdPL7tRI5hTs7Tqzm/DC2lErk5kMdJQziM+/HW+n56ZGsTtX8V8F9Ul6qc7MDyMmmgLpl7I9zioNjSsImjvyEtHwjzpXCHVeMZiUH5ZSRGi3G6c7pXgQTajgAPysqnv4C4GJgyr7EipsWvRByFvLn3HlP3aApsOG8OxCZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATI9jp4Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hribDZEO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9ui361089950
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaXmFhfBKuGEAAuHt4MFeEPEkTShnS0CQLRSXab8O8g=; b=ATI9jp4Z6w+G4JQh
	WVY7KWuyroHXna46KmfiNMp9o6C2fWryNubMAoEaylH10pGipJs1aKelZWs3WhQH
	HhUjeHVkXYWk6QJot/nZ/W5wj7EUCqHlh9nJRLg9Vd1QMSuGXI4fbZE2KFiH16Jl
	8MNkpBddaxrvcxppsUEFAgGDxivgGiN3O5ZwlnvBilft8b62ecOlrEui1s+KEAwt
	sFTsFWC5zdDg3xdqYK+qTZL7Ej5QQmj66r1DGqCJNw7EpOYPPykkBWAi3UeF4wlZ
	yF8sZgnTAoWMpSaXObWfoYgWTK60p/Uuc5ELCOD19UDAxhx+rkMp2EHT4Oa/Hbd3
	Zpx0QA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4re3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:58:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381250979d5so3520766a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 04:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783943907; x=1784548707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaXmFhfBKuGEAAuHt4MFeEPEkTShnS0CQLRSXab8O8g=;
        b=hribDZEOSwHhzNZhYHk4EXAmEVV2YenfS3pO/QIHcTwiczTgfUvAgBzL00I1E9i5A5
         p03jAYqH7ifSIdRfjHlyGB7PC9X7VcvyxVqeqTbufEBt9irpC+W3D48ISBPpxdAUzVpA
         wRJbUuPeNn7NneLawfuO6x3Vptr12iE1x18T0Jpx1zPYnxTXXT17A/ZuoFZRsOgqEOHw
         tJ8JNVSJYVNAzfGv6xnUbr7va1ovkYCPkpxgQr3qhpg0fJpzhlPKBmnNU2PbPFlln/bw
         tefcVIQpZ1+w90DtfpVYnolYLpgAs/vQVxhtjBRhlcMU1PxcySEL3zbDGE7Hz7pQL714
         AZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783943907; x=1784548707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaXmFhfBKuGEAAuHt4MFeEPEkTShnS0CQLRSXab8O8g=;
        b=exn88SkzOP5/ahi0BzxJk13ae6HdaFQGta/Yz2bgd/Jj3qPvn2WeeiGeuJUa2CcdBE
         kZuvfl2q9/5Ns6plujKS+5F4ILVu77zUPaf3g/omIqJl0feE+1uy99ImciTa9Y8m9ujo
         NW6VUmkmKlGwvvogm6GCHJLAS8uewDHqC9JR/jFwYM8Dn7zd9Ak7MsDb6Pka0e6dsKKp
         42UgC29KSPuh8XV569u/rSSRjl9r/GhtlMs+/W7hb+/lwIe37AxjhdoJAVHSMO1AkKY1
         WYVoa5v4gu2l/ABHVtshRmj14Exa6b2o1Xc9yCdPDkncbZXt9fOO9tSb3uS0L3t2ni/l
         8bpA==
X-Forwarded-Encrypted: i=1; AHgh+RoESRpJaCMBwLCrsM0bgMMEPgylTi7qgSm1ZdnqznnjKlaTtiYnkSNZal2AoVfWGeEku89ZeqyfN9wutX8L@vger.kernel.org
X-Gm-Message-State: AOJu0YwGN3Bf9qgtDwLYInG1lENOdV0sD78mKmzG7VqtZjLAdKK1zZjx
	YY+KV3RxUyY5+KRt39OnH+Zx/kFhaoAfhDFWinTSOxYpqwv+sP5kfK6T50m4rvXrQkMZa3B67QD
	KVHj5EZDxJXTs9yi7RRDnnKXD0scYBO/QDURiT2NJy6q5zJoJ+mohojHqa3Sf2iiqc60=
X-Gm-Gg: AfdE7ckxn1h9QYn71F73ngD1Wq8I1Ep5auS6br5VLgBLm9AfaX059D/td+yYkYBXs+Y
	BPJi+vhZmReje1nmICylbmpW7vQSr+bgwH6hyXPQXVOGIhFbOpYxam4Hww2jqydHiRSErJVbo5N
	eyjwpqiXuqyVpYrHu9AvsXR10NHLnUUwGaVxONhZCoVnyQdVJv6mMP2SDGR1daZmSBQ+KLkuWCA
	Ptuvr70QJH9p5thDX2N5UAVacKj8kI8t7GE3TpXxt8Rkrjm/ITcHAUKPkN8cbkinfvzx0Y6qugh
	goVvUrJhotdYLTWb5xeYx89NeWgiMaYelBmt0KKTAHWIiEpTlBz5kJc4eqLsiQCmOrrt1PO8fa3
	WVNB2xWEBZYILwIf59bCwy1RSYbZ4wApALfJqfQN8
X-Received: by 2002:a17:90b:3d92:b0:38e:bfe:81e3 with SMTP id 98e67ed59e1d1-38e0bfe913bmr1051362a91.8.1783943907409;
        Mon, 13 Jul 2026 04:58:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3d92:b0:38e:bfe:81e3 with SMTP id 98e67ed59e1d1-38e0bfe913bmr1051342a91.8.1783943906917;
        Mon, 13 Jul 2026 04:58:26 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm74546638eec.31.2026.07.13.04.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:58:26 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:28:14 +0530
Subject: [PATCH v5 1/2] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-add_pwrkey_and_resin-v5-1-3bea476e1453@oss.qualcomm.com>
References: <20260713-b4-add_pwrkey_and_resin-v5-0-3bea476e1453@oss.qualcomm.com>
In-Reply-To: <20260713-b4-add_pwrkey_and_resin-v5-0-3bea476e1453@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783943896; l=2486;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=sT38bhRjWOjfdjgeqQAmE55i7pDR1ODIXujcQKTrYXk=;
 b=xhZaSCR40tr3xKCV0IHWfew6V97K+9crC/HzyBEmirpN0Lv55CNSQcWJj9WJ30mCJI6dwSBlz
 loIX53kRIlRAF8jHR2aShiRuQFgA2ZRReUqqMDtYc5J7XznbV2iMJZu
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54d2e4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=s_ZZa6GQdcgv8AlZDVsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyNSBTYWx0ZWRfXzHw8PjxzMptO
 ce9v5k3PNb1i4L82lnT1SCK7+6VCnNVPWALzHbZHOICs+wknp/gN4XtMae4pSH/DZqMFuYiSq4M
 Z9yPZCBmR+3WuQKbEsSMEljAP5N+DZA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyNSBTYWx0ZWRfX22p50sU/Plqr
 KkLEpfvhgnMoIj5/Vgx3z4GtimKOdcDpWgCEwGe2XuaumUnOO+Tm9vwKO1UCu515Odh787YPai8
 d44m78mOJvTspj228yiZzn+kJVGyEDqPIr0B0q9vVGoV34YJN/gdn612208LNawF+SVEDWHTREy
 T42z02JC/tTj+yVj/6Y5S3+v8MDUIRLJfNkZcqDPpalGWkzII+Lx+TiGaatr29dOjAiG+qcL6JR
 YdUyxv+bggaeqaOyy+pPtgM+nNWgA/W+ULlIgHCCaDV17TBXLC6NBdVQ1Wsv5PlSEjGtZPlTeQP
 Dpcc2OHQIYcf3iPZjFxKNc73YhDn2BrTd8z88czOJDZ/SiEkN0uXxD5e5TppkVFKO7x+66hzbo1
 Fl1Hw158CrONrW/XveDhTdIVEd9TWd1HtH66xYdxyAi7UsJzmKV8Id/20VuR/XJLVDE9JYJvz6L
 OeKInbkuZTSxxDSH3cQ==
X-Proofpoint-ORIG-GUID: zedvKIx3GTWNDa9OexlkHiNi1P58nHXm
X-Proofpoint-GUID: zedvKIx3GTWNDa9OexlkHiNi1P58nHXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118753-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rakesh.kota@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45DA674AB05

PMM8654AU is a distinct PMIC variant from PMM8650AU despite sharing the
same PMIC subtype. PMM8654AU implements additional registers added to
the "hlos" register address spaces, so add qcom,pmm8654au-pon as a
fallback to qcom,pmk8350-pon to distinguish it from the baseline
PMK8350 PON implementation.

The GEN3 PON peripheral requires two register address spaces: "hlos"
for the primary PON block and "pbs" for the address needs to be
specified to facilitate software debouncing. Set minItems: 2 for reg
in the qcom,pmk8350-pon if/then constraint to enforce that both
address spaces are always present.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v5:
 - Set minItems: 2 for reg in the PMK8350 if/then block to enforce that
   both hlos and pbs address spaces are required for GEN3 PON peripherals.

Changes in v4:
 - Remove the contain for PMK8350 and new if:then for PMM8654AU as
   suggested by Krzysztof Kozlowski

Changes in v3:
 - Update the commit message.

Changes in v2:
 - Introduces PMM8654AU compatible strings as suggested by Konrad Dybcio.
---
 .../devicetree/bindings/power/reset/qcom,pon.yaml     | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
index 979a377cb4ffd577bfa51b9a3cd089acc202de0c..09eea48c709e5e42c45c1949ee1d06298dea1f91 100644
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
@@ -17,12 +17,16 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8916-pon
-      - qcom,pm8941-pon
-      - qcom,pms405-pon
-      - qcom,pm8998-pon
-      - qcom,pmk8350-pon
+    oneOf:
+      - enum:
+          - qcom,pm8916-pon
+          - qcom,pm8941-pon
+          - qcom,pms405-pon
+          - qcom,pm8998-pon
+          - qcom,pmk8350-pon
+      - items:
+          - const: qcom,pmm8654au-pon
+          - const: qcom,pmk8350-pon
 
   reg:
     description: |
@@ -105,10 +109,9 @@ allOf:
     then:
       properties:
         reg:
-          minItems: 1
+          minItems: 2
           maxItems: 2
         reg-names:
-          minItems: 1
           items:
             - const: hlos
             - const: pbs

-- 
2.34.1


