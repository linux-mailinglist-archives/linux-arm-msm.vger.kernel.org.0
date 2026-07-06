Return-Path: <linux-arm-msm+bounces-116993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M6vmKTXrS2p5cwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:51:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6470F7141B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:51:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="PhfPQC3/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NyMjbkY0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116993-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116993-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76C003021982
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 17:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FD43BB117;
	Mon,  6 Jul 2026 17:47:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9184B3B8958
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 17:47:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360039; cv=none; b=rPuaJsu7OtC1t9+6N+MKh0ukVhwF6ShxJaX2kktVk7mbl5xIfOhmGdb2Ow0zis8uOdUV+n1ahNn4jJeRD8AvLOiP1wgitAPWzpYocDBY6xY9YvNQQ0gSY0PC/aFrEg7FENZ2HnuXlD+Wzzl+Y/zmQYbdOh5WM1P3uyt78EfavOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360039; c=relaxed/simple;
	bh=5bOmYD47KumyTOb+Y1qYhZXDQ6MEozeWdEp60mgsnpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeO/fQisrBejY5ATFHF6PF5xnZXGG+mHo1GtzxK7sgW4JmHMGszdSF5Cv3NkNvp4fEJx0xkoSPpcJNE36XDuTX1W1cTUXNDYWPc2GJqoUA6o+LJd/Owbon4PxM+niBBOFsWgCmxAz46CFCkGiNrOWdT4h44P897Z7m1VqmLrxRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhfPQC3/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NyMjbkY0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FsURs1049946
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 17:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=apmFEM59O0B61gJ5WxH6Ae7z
	ChxrAAcQn15+cvRZUhw=; b=PhfPQC3/q9NiNTgCQvS1BiHAdQ8HBNaOXp5VPl1Z
	J82gW6T2BnNDO2cMfYvSJci955vGMEiY4Tt3NbL4hgjlIc5kPcQioYOl/tz0Hsh+
	pvqvsxTv0pOCaEDc+vwhEGcHvt0U8lJ1LG7dMM0V2PvUy8woIG+EpNrMDCZZydcd
	WuuHNvvUNI1KvaWm7zQj6ztz2DIbXPjaF1PZHMOa3dintSRMwMoUJFJHUEsrFNJx
	y3ARG47UrJ2rghFb+DOydUsWspQzZlwSbfFnhx34+qIY0deFjjiE6Wu9bx7i0lqM
	jCz17NaUvpezMIKQA20EoHD0cweURIhUDNoyXqgmReBvGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw0hhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 17:47:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e66f9e2baso333975185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783360036; x=1783964836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=apmFEM59O0B61gJ5WxH6Ae7zChxrAAcQn15+cvRZUhw=;
        b=NyMjbkY0FapE+sQkOAkx6As1D7z4KerhqY7GM9Qy63Ytpoip9EIKz9yF+rHCPIeP9T
         HUCXqw21tf7qmz5okYfV+11z69umw70WAXDpBTR7/j9QV8OBW6WPfAhWLxNpmoQcIHu6
         pnrhHgg+l4SSt3AhaXchuJGVC4zh6EUBBNB+mlGsc+TeWFzfl6IN7MNcuZ2IRoP8jwAZ
         oy6ujKJxLl2XnV2ZkGMDy4jsYkZLSuLEc+CjSBaTek1RHrfa2hqrzYuBcSq4qz66asre
         C5AsBCPmuU6T4sCUmlppq3ErFxbNhkMm0r8XGyoC2t7E6baMzYk5qSzrQTW8AdIf2AFw
         9Few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360036; x=1783964836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apmFEM59O0B61gJ5WxH6Ae7zChxrAAcQn15+cvRZUhw=;
        b=JfbYK+QB/Sxb+a5HHvU6oX2SQRVg4+7rpQloRRnPiXvH2Cw66Ul0IQXSLfCqSeqJzk
         DFfS+CkBpjhaEMwcGZ9r0OXB/5FzUhROVV7mr/gizGEApe46dFZ4zkkVn1JyZRZ9riLV
         HWNEQxBSaUZI8iNlSNyhsHmoNhjc+eVLDGUE3PbQFV5TxIvp2d9jUBGFTB1nnpGi5mRb
         sPZHyeiNrHYG9O8plJMfTay9eKy5Rlt1iqVcdpVwk0W/Lwko3CxKXm8a3mQrDQ1QKnnc
         i+Pkw29fvindiqMRhNFhSAVMMEpDpncUjiIAXDuCh2tMUvGVbw8X6SXp4pmASRuREN0R
         G4/g==
X-Forwarded-Encrypted: i=1; AHgh+Ro8Df3eSIyYi2jMXFKfxp9OJEjORucWvAn6sYOlMq6SRI8j0rV3R0VEHkAi0AZZTOl/EuCXzWokD6m3f2Ns@vger.kernel.org
X-Gm-Message-State: AOJu0YzRwUKRa7o8Ub6b7IsbFaBQbriCOXWYbAjaVkbR8yz/WmhfHyxw
	Ea1c9wi2Sb6GnI755+uHprc1RbFAvUURJUPJyonuSF9hTP4fibut0g/caG+JQloe02Cq4wor/yn
	7llH2r2MGjCPGz6I809xkXUjV1tw4bDkC0Kr8o7zOiWfZDSddh2A3+1LLtFxqsY+rYAGO
X-Gm-Gg: AfdE7ck2eS15z9QoS3h7js4GODptNYHEYt+j2q31u4Z74XspSe5ZGix33wbF5msjOC2
	BBVYGaT+Zuwn4NFIQYWiJKnvCAGVbBt/olJCTwwrhorxs5kHjy84o3QhL7KE7WG1YshHP43L7cn
	KnS7Y2KnA8xmFTmGNpi88jVYsJjEkHJvnq2tHCepqKDOn4fDwa0QbUdvWUGco+CBhbaD4Tvigbu
	F4WQAydcou4TkH7VssPL0e0NehPhUXCPHUIkRJpz76WPulIqtD5G3cIt9l5z3l+Cc6xQDvs7SAW
	0hoaudkCkFTVajK7FgSl/H86051ss+ECorBlASrzRygenp80uh4PFGk/aAMYWuexamhzmSJ4rQ/
	ZMndF/DVWV5tN2pPiaMxjGIi++1+/o1S746GYhLUWMZgQtWQQtmlIiPwiZ/1jGUQ8XKN/BdQMPk
	eoV1MydoJA9rOebx+JY3lrixCQ
X-Received: by 2002:a05:620a:4412:b0:915:b852:4361 with SMTP id af79cd13be357-92ebb4d57d6mr203282485a.20.1783360035765;
        Mon, 06 Jul 2026 10:47:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4412:b0:915:b852:4361 with SMTP id af79cd13be357-92ebb4d57d6mr203274985a.20.1783360035123;
        Mon, 06 Jul 2026 10:47:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ae5c8ecsm19731901fa.35.2026.07.06.10.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:47:13 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:47:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD
 device type constants
Message-ID: <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3OSBTYWx0ZWRfX2cekuGCyr/PK
 PpYvJTbX6WmXcIoE6v/IZYTvQV7JKaPMMnL5UbMR6u5WN0kfjNSIVfTbAytMiZBQSsQQ15tfZ+9
 98xQMmDGvc1b1QtUYG2cJSNQkyxNQ7s=
X-Proofpoint-ORIG-GUID: L1SMJeB8RXVLxbqcYNa8T0_VDDPzXxo5
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4bea24 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2pRoOLr91VfmbNnP4VsA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3OSBTYWx0ZWRfX59KFWnadxT6J
 KRHqPLZx7r+Z5sGMPGsFtORUcqO2Gpf87AdmzYy8uP2+LuqeEwlyg5BlWl6D7uctpEL9NH4GTnU
 0CbdavbUtTyfk8aSqVZq+NsEbtycnMQmA0sB+zEwV5vlsOPdCOJucT4YJYrZd0WTTqzg9/SAxFn
 HJ1bi0kGdXwGlvG6zt2rzJR8aUmhzSf+xJ5/s85RROGPkSrbLwicQV38k6ej/a7UUWZXJgdEQ92
 7PJggqjh6X30B7vnzUm3lrrZAz4WW3YPcmEJYgS02HiVLqHrV/newb4rFqv/vXGEZX1oKuYagXq
 51G53Z1X3ub06KZ2SBjksqtTuX87u7BLx1WkberMHmgozMsuVjtTsAxU07XxnQ+jW07fhfgHTus
 p+o5Vo0gnztTRkf43u1YUGayRpKzgCH+FFyZ9pjAI6au39kVfR0Q9uIyLU//i2qVleyVmoTFp2c
 DwqKePRwBPiz2nwOFtw==
X-Proofpoint-GUID: L1SMJeB8RXVLxbqcYNa8T0_VDDPzXxo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060179
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116993-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6470F7141B5

On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
> On 7/3/26 17:42, Dmitry Baryshkov wrote:
> > On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
> > > 
> > > 
> > > On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
> > > > On 7/3/26 7:03 AM, Gaurav Kohli wrote:
> > > > > Add Device Tree binding constants for Qualcomm Thermal Mitigation
> > > > > Device (TMD) types used by remoteproc-backed thermal cooling devices.
> > > > > 
> > > > > Qualcomm remote processors expose thermal mitigation endpoints
> > > > > through QMI. These endpoints can be registered with the thermal
> > > > > framework via the `#cooling-cells` property on the remoteproc node.
> > > > > 
> > > > > The QMI TMD protocol identifies devices using string names (for example,
> > > > > "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
> > > > > `#cooling-cells = <3>` requires numeric device id in the form:
> > > > > 
> > > > >     <&phandle device_id min_state max_state>
> > > > > 
> > > > > Define common TMD device index constants shared across currently
> > > > > supported platforms. If a future target requires a different mapping,
> > > > > additional target-specific constants can be introduced while preserving
> > > > > existing DT ABI.
> > > > > 
> > > > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > > > ---
> > > > >    MAINTAINERS                                 |  1 +
> > > > >    include/dt-bindings/firmware/qcom,qmi-tmd.h | 20 ++++++++++++++++++++
> > > > >    2 files changed, 21 insertions(+)
> > > > > 
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index 57656ec0e9d5..ffd85fd1dd80 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -3410,6 +3410,7 @@ F:	drivers/firmware/qcom/
> > > > >    F:	drivers/soc/qcom/
> > > > >    F:	drivers/watchdog/gunyah_wdt.c
> > > > >    F:	include/dt-bindings/arm/qcom,ids.h
> > > > > +F:	include/dt-bindings/firmware/qcom,qmi-tmd.h
> > > > >    F:	include/dt-bindings/firmware/qcom,scm.h
> > > > >    F:	include/dt-bindings/soc/qcom*
> > > > >    F:	include/linux/firmware/qcom
> > > > > diff --git a/include/dt-bindings/firmware/qcom,qmi-tmd.h b/include/dt-bindings/firmware/qcom,qmi-tmd.h
> > > > > new file mode 100644
> > > > > index 000000000000..73efecef0f3c
> > > > > --- /dev/null
> > > > > +++ b/include/dt-bindings/firmware/qcom,qmi-tmd.h
> > > > > @@ -0,0 +1,20 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > > > > +/*
> > > > > + * Qualcomm QMI TMD (Thermal Mitigation Device) cooling device indices
> > > > > + *
> > > > > + * These indices are used in device tree cooling-maps to reference
> > > > > + * specific TMD devices provided by remote processors via QMI.
> > > > > + *
> > > > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > > > + */
> > > > > +#ifndef _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
> > > > > +#define _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
> > > > > +
> > > > > +/* CDSP thermal mitigation device id */
> > > > > +#define QCOM_CDSP_TMD_CDSP_SW	0
> > > > > +
> > > > > +/* Modem thermal mitigation device id */
> > > > > +#define QCOM_MODEM_TMD_PA	0
> > > > > +#define QCOM_MODEM_TMD_MODEM	1
> > > > 
> > > > What about the dozens other ones that Dmitry's laptop reports?Ri
> > > > 
> > > 
> > > Thanks for the review, Konrad.
> > > 
> > > We are only defining constants for the TMD devices that are actually used
> > > for thermal mitigation on the platforms supported by this series.
> > 
> > Why are you using only those TMD devices?
> > 
> > > More constants can be added as needed.
> > 
> > Kodiak is one of the supported platforms.
> 
> What would be the benefit of having more than thirteen cooling devices
> declared in the thermal framework and having only a couple of them mapped in
> a thermal zone ?
> 
> I agree there are more TMDs but if they are unused for the moment, why do we
> need to add them ? Can we do that incrementally ?

That's what I am trying to understand: why the implementation uses only
the selected two devices, if the modem on Kodiak supports others. How
can we find out, which TMDs to use on other devices.

-- 
With best wishes
Dmitry

