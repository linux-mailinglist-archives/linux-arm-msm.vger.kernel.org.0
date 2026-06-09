Return-Path: <linux-arm-msm+bounces-112213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +EBuGJ0uKGrW/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:17:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7398661A27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:17:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aglvGCQC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K1zDCdPp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112213-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112213-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A814316B11E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31FE46AEC2;
	Tue,  9 Jun 2026 15:03:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E76A44B666
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:03:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017394; cv=none; b=sRCT229YUfpPfruhJ8q1DD5YXsVf2eifpvar6fP+EPYvry/UGSjfw1HXgKoTzkJdLd39ls5ECrUA8uHDW9Lkh4PfK/ay6PrDw8xPZjjayFiOXuIQfNbmEK3/uT+R8/4p65GJYLtKBGHlOB+qn3R6MtHVrhgx3ebBhtSOkq2HUUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017394; c=relaxed/simple;
	bh=MIqe8qokVa8YYJZkAkG1yXNBwKSVJLC1luMdgyTvEI0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dpP6ZClBHu1IWJwzKOG/A5ZhqJTmPHxEZJsICgRJkrhdkbeU1B3bvTbOciQjuBUv0Ck3Lb36VMKQFhh2oKwvFg+5U/umNltzC0npDMRwG9OuHmecZFEXgc8sP9JlquEQ4Wfvq+q1qFdsNi0hTNz9es5edS9PuLmENbOh08/iI/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aglvGCQC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1zDCdPp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClK5b652200
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=88cwJVjL2lnzu2cVHtBfD3
	jOAXqQUPFnSKVzm/xtaEI=; b=aglvGCQCGidI5XCIJbp+GZNa1nQ1FJjU+LP7vo
	wQ7+ec43PuohSglEXOsgxFAGBOPD++z69+aTRHyvHVI4rHMq2ev6ZkOtzqjZnoFe
	p2uG4BPfUjDe+JA280ag11U5PJa30CIYH0Pu6cUZyK+vrqlcLur/lT3i6mZSkqyN
	3VuQN1thZ1eRFN2EAN6NQ4s5MXhXRK0WcaCebhHRknwZh9jvupER5vrVoRcb8/Rr
	jsmjA16PMwZHUZ+/3Yd24fA72VMFVPpRkKF0HOgWpo/uZIyH7Kxx6DGIjEDkifDg
	k14dXD2Lsu+jw2UIW6tyimzvbuC8LHsNNFgawH5faXuZhgeg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0ssyjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:03:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842208d5b0eso4113559b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017392; x=1781622192; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88cwJVjL2lnzu2cVHtBfD3jOAXqQUPFnSKVzm/xtaEI=;
        b=K1zDCdPpx5HCvLI3wcM6ECX7uzfONXHoOC50i4cW9zgHJmDHvEWqjSJz7nZxAOWYoL
         obNCTBIDkRdyVZGywMC46KgEFKlIempPoY1i57CU8XPYeQBQFx2aWQGwnlx+fp69y0HI
         MpLJCblF7ZoZy8IQ95wZmsmu9MEiO7i1ylMHU7yiQEYXc8a11sTXxszciqQXZZnwzCZX
         fa2e347uUjDOej3XTrXG/n/wYdJzTL4SUK9+PpVQ7CbxgGeJwWMOiNFXQZpFFqpd9Wct
         DVfnDfRE5Qp4R6ypqR1DuUDkSciybH2THMYANgpx4XzC7oKOBnWmXzRiwKY+Hwti8eWR
         VSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017392; x=1781622192;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88cwJVjL2lnzu2cVHtBfD3jOAXqQUPFnSKVzm/xtaEI=;
        b=b0ZaFT8g2yqxZWGCXJJv0hmcweTvBnh1CY6BUwpt/4u5igJNVG2VoZ1MdXuyPbk/mq
         xO7PsBSCN+sAkoXT5cVQHXp+71/wUev/Z4STodMJ75N0aBSToGsww/XtB/haAauk132m
         yUHDyTIjgoZaGAOg0QPLIW2XkOSUygktBBnJY36XdEyFpUvSx7HNTuQva0w2I0X9yrlV
         jzHnNUs9jlKERVOIVTlcypOJU377bQpjzNFSky2Tb8SsEDwfA5M7glongCSKR0I5Y+Sz
         Nn5BxjFvFs2ZT+lHkqJjTqqAXh3V4vZKeiXDzc1YzNArTRbCCB31XH2yb6NvsLjv3r2i
         JXNA==
X-Forwarded-Encrypted: i=1; AFNElJ/CJzw9Xnbl7W8xfXcjcwNV1kJ4K0kBNOM0oshWXiz8oUl+pVKXOXqrjFwmlFcLI1XYw3AIhDfRsqz8vTQC@vger.kernel.org
X-Gm-Message-State: AOJu0YzNxIf1eket6nTC3oBmO+C7HJMM+c/zM+T8xcGZEnQO7ptbatwJ
	5WDKJu/wJf6dt6+J1yTM189FhuNcW4rd13MrynCWHEnG/05ggUHGPSweGLEtkPKaFfFSRGWHI8o
	OJ387Ddv0MqHieEmoVU4ZrZP8J+6ieL/wwtqGtFImo+8QNa8yA/w9FT9aZWfaLKBekLYB
X-Gm-Gg: Acq92OGjHA9nxthydbp7Twdzqu52NFaT4BKG6hm4vQ/8iIAqZyVDYwomLqKnNBzUV4U
	Hnp+5802xUyt67+TRjVeuJ1p7OzElYCJku/bxGHwdbj1P1txCFPLTKtqr1DoIesNONI7AFFK97k
	Jv5UUPFEdk5t8uDtDh+69rXYwEOCZfLKSEZEYOdmcMye6LjiSU+IxKSWaO8CPs/y3zdMsF6/6G8
	vnSZZ32bB+ErL3gEJMxHMbHVbEC6TIx86x2zjF3a9hyoi8PIpf6P94bmrXGDgxtcims+qF4ocsI
	X7bDqEaHkoxKcLV8rrsYqjA0BL49/TotSFowUbWUutQ3ITeiB3Y+bCxVUibP3rrjYBXytsqkoVB
	Y9LuqpY3t3fwd8oSDcCxFubNKyQTZ3Mlf/RPEd581UGSAinmN4xDWofmN
X-Received: by 2002:a05:6a00:1946:b0:842:75d0:7e88 with SMTP id d2e1a72fcca58-842b1064cc1mr22480505b3a.27.1781017390620;
        Tue, 09 Jun 2026 08:03:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1946:b0:842:75d0:7e88 with SMTP id d2e1a72fcca58-842b1064cc1mr22480295b3a.27.1781017389562;
        Tue, 09 Jun 2026 08:03:09 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:09 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v6 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Tue, 09 Jun 2026 20:32:51 +0530
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABsrKGoC/x3MSwqAMAwA0atI1haK1qBeRaTUGDXgjxaKKN7d4
 vItZh4I7IUDtNkDnqMEOfYEzDOgxe0zKxmTodAFatSNGoziVW5nt80S2YgKDVFZjcZhU0PqTs+
 TXP+z69/3Ax0TjeRjAAAA
X-Change-ID: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MiBTYWx0ZWRfX0ubCkaTB36vM
 QzKl2DTJxkm9p//a26ooks49Q5bEwmlg8D+n0diU/s4WRf+MMW0eN9XL0ChexNXrnauIpiShWZ0
 y7u8sE2wadOlrE1f/5Ql44YC2+D5VQF1AeiJ3YkHRoaMeaqoZxLy9RkT1zWtLE4OJuLG+/fbG5j
 sYXIBeDMwFe7LEZg81vSMcKnYiwtQsxWyQvnFVtlGZKzWoUhJ7oqxphUEvJJpVzHBEaCByL59FY
 3/xG2os15Cm9K6PKNj0A/oo8YlEe+hAQaWchjx9hsTAISGq2IFbdMlZ44LZ9EAX/zMYMyluIP1k
 MHBX1v+Jhttnwi07ZsbYyuno7Xihv50M71BeX12jvLSFZWrS1fW+zwmGW+85ZMFh6Q7DOOElpNr
 V2CVxI3JMKrn898cGmuANKzxdghQdCE4Sgh/IoXbfRS1Q/b91w9f/BuC2DLa+4dToxQqDWty+Dd
 F8SD7/jQsqEbHByKpOA==
X-Proofpoint-ORIG-GUID: wWQ70_IosXfur_TGNWeZHx2COlL9unmO
X-Proofpoint-GUID: wWQ70_IosXfur_TGNWeZHx2COlL9unmO
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a282b30 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8HYrQF7E7KXWYYjJzRwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090142
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
	TAGGED_FROM(0.00)[bounces-112213-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:taniya.das@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: C7398661A27

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v6:
  - Update device tree to latest linux-next.
  - Update commit text for no ABI breakage for VideoCC and CAMCC
    binding [Krzysztof]
  - Added the RB-by from patchset v5.
  - Link to v5: https://lore.kernel.org/r/20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com

Changes in v5:
- Taken care of comments from v3, v4.
- Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
  as required property in bindings.
- Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
  bindings.
- Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
- Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   12 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   10 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   61 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4666 insertions(+), 4 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


