Return-Path: <linux-arm-msm+bounces-112816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m+ghMbYaK2oE2wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:29:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A26E6752A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:29:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RfqH4yUx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iqVBp2Ov;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112816-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112816-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDB04318555C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506C93B8BCC;
	Thu, 11 Jun 2026 20:29:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1D03DCDB5
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:29:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209780; cv=none; b=Ie63Z0kMGJJevqRHht0DII1X5BAG7Zn2ad70iSHiAcEsJEyek1DeL62zSsyGNzY+vZVwX2Wl3YyMJgRIkyirE1lvD203MZB8T3TE6WobJX4jAZkmybSX0N3rbZd//58uG+LhXLmM3j2jEUwcl5gfkAxLrz7kM9eXkXbRa8AsIU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209780; c=relaxed/simple;
	bh=m+/eIP/iZqCQ25AHq3ghtjO6/bympRBRl/5in5GXNYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYnnRTmN6J1a7/9f2J4OOPaJyhJ4lCmeQR90d6ympVYX4TLBye+0CIhnZvanKPwv7P17ezDWee79lT/AedrF9UKRXROY8nVmE0rCrP1q+nQtPpR97opDHKLn3opSAPkqfBgWW0R1OB+I/YxIIDHM1N/17C24gVpftDL+JqpuPq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RfqH4yUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqVBp2Ov; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3ICJ4109891
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E+n6OykwlWa3y9hV6D4SEm/4
	WsH2rqp1lyg+6Q6ORg4=; b=RfqH4yUx0e3iufatKRmceB9KDLqFY5qsuDp15f7F
	8hQRGCQf09WBsz9jrbPYBtI3PrYMtT0RI9dKFrIQ1EGei+wkBL2/UwdarRFmOeNZ
	TCArQru85AsxRiGSLfhOKfbv+46NdM0/FgOto6t9pP0grHAkpST8JNQJLuAOYsqo
	LPNM9BbVJqQ0WM0Ub8XBifiBzqt7jHJ3QwUdwEWhu994gYs9EDgAkeez7APbx0SQ
	WiodBQ9LvmtaHk3VG2g4UM8VKuOTAHUZfT+E3Pxr/LFc0KdrqoYqQW6Ge3IljA7L
	JwkvLJSLAPnBCI61U4v3FG5E3WcaMDDRQsyMOW8Ua59m+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014h8ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:29:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5179e5ba14cso2654481cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 13:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209777; x=1781814577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E+n6OykwlWa3y9hV6D4SEm/4WsH2rqp1lyg+6Q6ORg4=;
        b=iqVBp2OvDy7ObHfMWYs2mOzlOHIpl2hRZ54RKe+JuEq+mdq8LlulSPohcW2JaGGoWI
         Q/ZY4dg9FtSgw3oEEdaFgHPLUEipFGnrFBT5Dph4wVSYtBZbmRooSdmJUu6DJyxh45YN
         x3SFohkwvmIRen2slcUeJD4cXhkl0owjEoV8aSbeG1Tyo6OG8/MSZR5IEfRbKR+1T5m0
         sOqJO8/MkARBOeNkALBfPGiTylSU6WqHUuM7lHTSxYYdQWbKtwC75KGEk9BG7MHD9PLX
         v7UBCGPkPNRmx4ZmSbHlCvjk7Ge2RkDxNlS4RnUN63PRV/V2/gaX/1R8xzPqjiw6zoZ1
         k+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209777; x=1781814577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+n6OykwlWa3y9hV6D4SEm/4WsH2rqp1lyg+6Q6ORg4=;
        b=OiiWOnXP4/rejgIZJVFFxkPwfK7plbnq5TcLtqi/S/N1qXf8fDSDJbKjxBWXTlM+ee
         G0l4hl6Ylula8flfZYDBOmUYDIWuGcnsoyUCMz2z9IkCCE//Gw3loyE+d4y04lVzNMAN
         fo376DWvpf2BFai2sBMXSHgFPsTCOUrIITkFskc3s2TGfoA6jk3iGS5ty/sEohsJjA+F
         EUbPTiGTuKrcvK8V8uRI+VWNFo8WO8Xj1OgT9Ws69jWCxQ+f7un13WD3EdKom4XH9Mob
         MQ8UCJhZJ3lVV82RI6rJD9tk01LV6xdOn5Uqchy8mqhwxGG0rhDDoQsDHxuNVIz9Sxcs
         rcnw==
X-Gm-Message-State: AOJu0YyKiJSIaSW9jobcwqiQqEwWJSJBbuGf5dfKT8f3g4lGCL1ujdRc
	3PEfZloK0e4GxJ6jAE8CUqQTSLb8kWUe6wpUTfVBXId6PDE9t+sdxeFW8Fm/nv6NCVzYM1b6P4k
	Gqpaikm9sHUG6kWWDIr+S3YWfkwJhGcY/Hl09QEXwqgjOw/+dHEEueo5iqsAPloUJRqAt
X-Gm-Gg: Acq92OG21WaHniM/uMGR9g3AXQOuw/icVTnuObd/0TZlweUZgdXaoMehe1UpZ9Ptaxo
	0NXjGq8Lgg5nvVd15C0sF5dvPr35+B8wL8u23DRZBEOBU8nWK/CmnVadwnJP1ytPp4UDCZzCIB+
	4eVTbPjUMUbUaYJTDDQgBEs7l1D2n8MKqoP+gXt13QC8j7lttyx/CJzJpx2r4oOvu8rOGHN00bb
	RrBITvmIDOlbCQl340HBzJhSXy3H+mrH5VxfqnUewpC475+Mx2+5fAuWO6S6MAJI/numOyfKRu5
	uF4O8ossfzNWsDibCwd62VsSCcwB7wNOfKS4H5rEz/6tSjy4//8OXl6qtSrl21GBa16aSoRGRR9
	ok3OZJIXoNG6mRFIbExwvjUzUV47c3P04vTRW6Tnm2htEMFIcL7elZqjhO7VUzfhi+vPo4msNNf
	qos9tXFxVW2Tld0kaPvKGDIIbcwQN2gJGjdI8=
X-Received: by 2002:a05:622a:1449:b0:517:6631:101b with SMTP id d75a77b69052e-517ee262cb5mr67946591cf.55.1781209777190;
        Thu, 11 Jun 2026 13:29:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1449:b0:517:6631:101b with SMTP id d75a77b69052e-517ee262cb5mr67946101cf.55.1781209776626;
        Thu, 11 Jun 2026 13:29:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cd8deddsm120009e87.66.2026.06.11.13.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:29:35 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:29:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support
Message-ID: <o7bgynyqnp3qyiakwckhm2d45zoxdrcqdsruy5huuk2p3itzxu@s4ceq37y22n6>
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
 <20260610-pmg1110-gpio-v1-2-a9c50cd8b5d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-pmg1110-gpio-v1-2-a9c50cd8b5d9@oss.qualcomm.com>
X-Proofpoint-GUID: ASjIBLAJef7EavgGu_2SbvQpXg4GL6Vc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNiBTYWx0ZWRfXz/uEE/ZzZV/z
 /Lq9Cbr3RB5f2ILsCblcMCGr/eU+jjUAYie5HLczxfBdjchkbXRUORxI0GnYH/pxcQMmyvdxhXM
 fG5w+hWPjD1mlzRG5fCneI7vtgO/cLw=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2b1ab2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=cwZfksdCj6gr6i6M9HUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNiBTYWx0ZWRfXzfUNUlI9y1kj
 JiKJuQAeU4/tTmP1p4I6igPV2FrJppoN3ZUmU2ZvVE1ngsOAvGwuTdnTps54nSQdSjzp0p1bGXy
 nZmNnI1OH7wSsCm/5VahbOMUf4uXPyPdWHTmZrbiXKAlyVEu8eK3inmY+fturFhTcMXgjTthvWS
 Jsg2j2rW2WkOZfieeAVJcw+WN+aPiAPzJyTS1BZCQMW3MqVIL7nWBlFFRXNqLNBd/sCOL+vRJQJ
 WTj+HnfTiaJR3Ae6eFfD5xTuyC/qUtwimktZ5OYem/4WA4DqBYxT4BqdKbFouGqNAzXbPFOeJLp
 0n7wmKEvrEsgLmko7bhBKzs8SHqxcsWUVmwngyNwfHt7TdrejvR/TkxsaIxXXHkD+DlkpeEjNET
 IJPGTLZsUnI4eAJYRZrroUIXNxb47kGobMQ4Ao35ytDJcybpcO3iONzXVm76VI4kULyNGSrAokK
 luNWq6Y6rbQFxGdIafQ==
X-Proofpoint-ORIG-GUID: ASjIBLAJef7EavgGu_2SbvQpXg4GL6Vc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112816-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A26E6752A2

On Wed, Jun 10, 2026 at 12:05:47AM -0700, Fenglin Wu wrote:
> Add PMG1110 GPIO support with its compatible string and match data.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

