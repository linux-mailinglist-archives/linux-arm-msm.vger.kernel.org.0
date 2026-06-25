Return-Path: <linux-arm-msm+bounces-114494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4b7rE675PGoXvQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:49:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAD06C465B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:49:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ZH/8Masl";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M8KuPN5h;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114494-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114494-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 472F430B9469
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC093391846;
	Thu, 25 Jun 2026 09:45:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C08C37C910
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:45:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380705; cv=none; b=Nzgpz1fCS6tHdnD+8On56bxRL1alRsh+F5XvNfnmBI1TCiiDRb5YGTTf8GWhwzDbYJjsE0XhLxKUfCOO5y4h20f4Idl9jNkhTbIq+izs8q/ZEYQr6EyHN63wZ6+jwYIovVEknyGMpnC6woE3Ys3OKPohfEJemjTG6e9Bplq49U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380705; c=relaxed/simple;
	bh=F5nM3FlwZYDKnOGWPYZGOXg2YqjwjAbihstfJXm3/W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IuHydZs1jD3VMjX3mAubdyF4IgtXDeaag15kGQWtjZTQ33ppFKjfeaK/PkAodaUlNsHVTYh37+UDw2g0t+pFhI97MsnsY44/eTOmNReJH+LNAxnxwxC6RbL+ShOSBWsb2jgy4PfNSz7T/nCGq6Nh988XYJ3Tv+hY1/eE9UYJ4us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZH/8Masl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8KuPN5h; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pG0v1629559
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ivuYEVZhvcJXkA99iMNtvpv02WP3n58ss4Dmi+Ix2bQ=; b=ZH/8MaslC3JP5Ps4
	GuYvxyoxNIJUqyxvdXkzb3hB4lsc2GVM06HMlBNEuIFonVF2+PioGCqy19D3lM6C
	oeHfRvtVncB9/qo+C/9+uAJjmzrE2jdtD4Mm5SOnpjWVqtaebqZf6HMvmQakTFT0
	BtXA73iume9KSv3k4m994Vay/ifM9EmTYxhMXfHcEZkgm9TiGp5d6fMaPufnKCeM
	4a6FOCG5SAel0oIlsduC1SlkM4LS9fU7YG+pesl5jfdIgFKTThaP/15M301Nq8pK
	V1cEF+onK59DUUaE6u5xjP2CPdJy6rsZs5Vp4994UcZVOgl6qEEfhsBRjV8ltZEH
	nuiUUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q16h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:45:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9158ecbfbc2so19982585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782380702; x=1782985502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivuYEVZhvcJXkA99iMNtvpv02WP3n58ss4Dmi+Ix2bQ=;
        b=M8KuPN5hxwIIqRJN6Sx8OR1F9TFpWxlwuFVDRy9fVZ2lmgMWmY4UrenpiLaHKlUhDm
         kTNELXf3lcH277EWdfS+yhZZNLGiPrajiT3ZyRDcg7yfZDBQNS8yLJ9EQVMyaUbLWUrl
         Yc2fK5H0AEd1NbFNAAIoEDSVn0jcdHQeC2LH0MzEn1d4BRg/7S9o+GlHAugUsKOiT1bw
         e+EiDq8bR3NIkxukHD7ZRoTPV+9UrEd3N6mwe7FpGMrFNH8/NuTn4A7O30JMxDEgI8+K
         hc3VtbdG/COIaRM8MsGYW1iEcbS+6x2j3ToRDJQty8XkkrFOZYZCthgFNeqhpqbkDNCj
         it1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380702; x=1782985502;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivuYEVZhvcJXkA99iMNtvpv02WP3n58ss4Dmi+Ix2bQ=;
        b=W5mOcoBGlPiCg1+ImhY0OBAoNdHepE2OlkGalWIdilYtNS2owgKohEp1+AsXCorfuk
         GcIkbar2fCsW0BEf62METEiBYvWVt/mR51xZ1BO5vwhBKEVhiHlBBHuak1mvDgGWPHLC
         0f95IJ34qX7d9vPFC2bFS6Zkp1Ymv4uy6zpkuI0O8vgT7nlqqwoVkcBZ881klRKXCd6B
         0eARm6tkjPFFihPunovmn7FtLnpAQ7V1wI81p9WbRYLOH9eMlaK+9jvx0RE3YnnN0/ad
         oMaUsfCxmxUoZHoCcRpl8SGXLjYjIDJztEFPfwlDOK3n5GfryDtj163ZEvyins2RE+7q
         MSRg==
X-Forwarded-Encrypted: i=1; AFNElJ+WiardvlFDqKuusCtZEoDXFRQLZMUv3GsabkYD+aZEyE49gqg9zDe/gkPpZaCoPVIEwjPM1CsSsSTUhQQ1@vger.kernel.org
X-Gm-Message-State: AOJu0YxODb/mqYBSNCkiunhvwR0NozgEs+hl7cxZkw+EhrGnHXFRyFoR
	PGLkU1iqb9l9ZtZr9lPMsuF0mgkYXJ066iiCx3VUFFTZDalkwznF4pTXBL5cZ+yVF+EOOZNSnIT
	gHUpzAKhaph76nKrOgoQarqCJeFMjeqCdRaSOLoJ0LUj8TKeeAAJtH0dr6OzPgBBHjCA+
X-Gm-Gg: AfdE7cmt1jPyBjKQevws0DR+UC2nuRy/udRlVXv2E3mftyFnxg9KdQSqAQZf8rBK5ie
	2sBGwuXtLkzpkrADdNwPz4DL+iXqTvVISMOlUGPhkVvJfV06Psuo8d1PgmH/lxckFwbASPd0D6y
	MQUjOjLPJb+28cE865IndKmeM78yKOrEbmH5F2Quw6g1UG+Dk67zE/K4n8b+Bcz8Ir8Us/4v5OG
	VACeKa/Xg/Kw3cfQPb2ameHwWjovYMXSvIxRyRQ1ihieRi+RmynHGXn12GD1Yfc36L4iTdQRwOB
	8evT5sA3SZfvQdfsvLwJ9PTWWZTWvTy0xliveFn2Tjza53pvZcHcVHQCuO8nMc+Rtc9V2hq8pxT
	IHtp7zxyh3nr3XZneyiApu7O6X7R+m0/+wGA=
X-Received: by 2002:a05:620a:444f:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-9293cae6ff4mr142422285a.6.1782380702536;
        Thu, 25 Jun 2026 02:45:02 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-9293cae6ff4mr142417385a.6.1782380701715;
        Thu, 25 Jun 2026 02:45:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbec0d83sm140298166b.55.2026.06.25.02.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:45:01 -0700 (PDT)
Message-ID: <6d8ee022-770c-4125-b1d8-b8a020bf63ac@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:44:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] clk: qcom: convert from icc_sync_state() to
 qcom_cc_sync_state()
To: Brian Masney <bmasney@redhat.com>, Saravana Kannan
 <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-3-15f82c64d95c@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-clk-sync-state-v2-3-15f82c64d95c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: s8WjNPso5L5sgcZvMzh1E2uwcpljqOdt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MyBTYWx0ZWRfXzqnYvxG8QVzP
 dVJQ1AouKxG7C27/e27eMAVD8mUKrIVurY4GxXuXm4CETlKY2+TzRHW+vC0QyjrXpYCfYrdJK5J
 B4YDRj8hEqchf5w1Fkw/tzuTFoDXspI=
X-Proofpoint-GUID: s8WjNPso5L5sgcZvMzh1E2uwcpljqOdt
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3cf89f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gxl3bz0cAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=cO_c6q5x4vnfYnsnJKQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MyBTYWx0ZWRfX6tR2jzRk8dIS
 M8y+1YW8vjyt5raGfEfG/lrIQMZSMziDhEqQLIK96zUzrdSBhoNUU4U8iALMYFttXIXyBX25jkI
 uU+y0lmAZyRynmz89bheatACTaA08dZaDIe96TFZhArmLSlp9DbXvkkWYvVdfvo74gjrR+DytUh
 UVSPoDqRrEC6QlhRPNcZ8gd0t016dywjabhbMdJDiqPgNLIY8eOA1ZHCedg5gQGKa2+qBp7+ay+
 soLCIawjOiiX3JLKHht3W3861gR6bAwUmWtIf+S5tA+Et1137VmCtupSUU2JvKUwr+E0JnjalEs
 zsZjjMeuBJb5tv53bVlKiFn2utr7tTUhSp+kivsoM0JCOuGotn9UdW/FVAfRDDCTomEKPuaA4Gh
 LlMntBlJAFCC/pFa5Tl/kThBMyhq3QmEiBynC5xaSoBkIsMuYCJUBtp/tdKw7ovdxEcLxxodlFN
 PPmj9ViiNs4A8nj7U3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114494-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oldschoolsolutions.biz:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CAD06C465B

On 6/16/26 11:09 PM, Brian Masney wrote:
> Convert all of the qcom clk drivers that use qcom_cc_*() from
> icc_sync_state() to qcom_cc_sync_state().
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

