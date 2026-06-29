Return-Path: <linux-arm-msm+bounces-114932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bmSlHlQ6Qmof2QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:26:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADB66D82BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:26:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gILl2WvU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ABk99JrD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114932-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114932-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22380305A8AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106463FC5AF;
	Mon, 29 Jun 2026 09:21:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE373F8705
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:21:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724908; cv=none; b=NVS9tuHw4vRDDvQrY91AFTvbT6XYvzIlw+NcOmStbnnZLIjibCpYt6/zdJ6iFTbqGIOIBeubiK53EDzKKZcRktC3UF2K90oSlDoHzYq06mfEGEFW/R2Mp4NfJC+q/BLkuI5PkQpF2rGGSpZWX539mCzwFhUv2JbYn6JJm0pqmHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724908; c=relaxed/simple;
	bh=tEXdytwln3SqyuvYYX3Y04VgOf7AzAU5hyB3sLNR4xI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tf8jzzCu+tGW5CrlMzR0YHkY6yNcRSOPQI3MDn175hHRDJJjJ/T/UJEbB6P1sGE81bYV6oBhdogamcoCea/nSVcw5mTs1YOe7ox7CmJUXF3m/o5HVMsRgskrykxMPL1wDk2DYBmn8HRw3N1Xf//CsOV4Juj2D8BSOTf5J1BrRek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gILl2WvU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABk99JrD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6qwgx2076271
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NLDCIDvWiMtamq06GaZ8B9EiMhANn7gwMnT2WeVy/c0=; b=gILl2WvUe8GeJrsC
	6MbaDGsDZo7RyhRKQ18LjtvKhGl+0pocnpbs2QpXcs1rq0ndE99Vl3q6U9VB23/2
	9k/gnSjLUfQV56jKVjgaRfoxsBI7bb5xU/npa8h64nlVbOKKG/1GUac8MwWfRQvk
	zPZmvblblXeVxDzg4hXOrrRByR0B0Dc/pkMhwgSzvAsEOSSLadlx7LdzovYurWSk
	HiwXpOYpD2+2NgUKJSp1SayzhAHC79qpIQ0gyk9gS4DI8wHovRwMUkVLJWMmsarN
	d9o/+o1WE8LDTSSAZySbJIJIw+5+VraEf9kfV1al97eojCmTY6BdngId4AjkcIin
	g8GmKQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gmxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:21:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf599c27cso391261cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724904; x=1783329704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLDCIDvWiMtamq06GaZ8B9EiMhANn7gwMnT2WeVy/c0=;
        b=ABk99JrD663eQDlnoKUzAE2jNio47xOlZhCmD7L+oHrOdzk36T4Xupn7fmpMlXu5Yj
         GEBxsU5vuLriUOLLq22QAmuhKs5FYk9n+h2pBmSUsnx+CcMeLTsFxlgb2fRh6wmS4Fxy
         1tMjPhDGeehDgxZwzSH9v/RxIOVzXYriSkZFg491PYEfp6T/zkt1ymTjDUqrcwD4nQr0
         5uSKvw5io4G6chptsluvQF7dUWkHZe/W9CUe869IrDamlTkhvwPKYuou7HL74luYSBQK
         05DDdZOfIG0JoyF8sCi8V9KWagcnGMB7G2jfdXc1cGwUmvUUj3t/ZAOI3aZ6q2FFgTiy
         E8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724904; x=1783329704;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLDCIDvWiMtamq06GaZ8B9EiMhANn7gwMnT2WeVy/c0=;
        b=fkJyO9xcqpEIgEs9VSZLnwR7h7aagixcCgPH6nNv7uGL1LNWO8zs8iRpM3w28AN/e+
         llRTzwgPxLTBcZSlKdboZ+u0FZmg3n0zuZsqCaw3IEIdnPZUYH0DT0dFoIzdcvF3G3BQ
         dq9bU7cG/FKmPbdqiJQuR0DW0qwKTpSSw1XjPjgT0luozrsXKOG/ZmEtK+QCO0+D+TqS
         ibpx+x5wddJ2wBulaNBmZUSzQG7pxaK125E4kG9Vz6R4MdreHvErQ5jn1YbU1g7gV6v4
         roVs8F7hK5BCga4sDvs2d4m0teWemkv5Ht0qGzmfrHgwlKTjdjX3Gv67Ry27PaWlUga+
         2Ptw==
X-Forwarded-Encrypted: i=1; AFNElJ9xzBWJqBgF11WEVWX3rniDoRnISINEW4HBJqj+VjRZ6J2D/IWcRPHEdSZkD6661bSp4FzFP6GvxZa7uG9j@vger.kernel.org
X-Gm-Message-State: AOJu0YyoTg8bxhmipfgNP73RK0sQtLnPWKh9UjGnG3jtKrO+JcNXgP52
	iUPp1NTIf4vZb3xucM73S1H6BTDKX9xpLf8M7tU8pTSGzI9n3FFSduatPtYVQukMgH4DrJkrP5M
	lN8CPOjC0akUWJb4scEU1flOfO7V6r9LdtF7Rz7mO1yngAYkNycCSb0mM5pU1dxTHsTgE
X-Gm-Gg: AfdE7cmS5tTI/Qj4C1zh99loUczhYWb/4a8RoBJsyzi37e+1gn3nxtp0gpe8RVCbA5K
	4vmwad5DD8H2mhRAhdJKY1P0ZvUXHGTj74UYn7YqW6EkoVcgrAi9pFXt9YxZm5sc71aWJ3yjFhf
	Leh257Z1ZrcVg9n6Ip9MZyQP7oJDdpVfCMTdTcN8umWrX40sS9VmRptm6U48vEz9zyLTOeKsBpp
	Iu0Z0GTnaXOLKiP+4A/YNKkHwR+0xvT7svIWhSpqxrGWtj7WClsXPvHZL3XDThvZKqf2qd5wRh+
	0ZeMnnAs6KvCqvkZ1OgqIbxJuEIxiHYctPi/rzfJOYQP3DeWnbmY4bN9QNGDsc1KrJaWzVNzEFb
	c3Yc2jyQAcC5VtVcV8TCTnfZVC+eOCA0i9Tw=
X-Received: by 2002:a05:622a:1813:b0:50e:6311:7380 with SMTP id d75a77b69052e-51a72831d5cmr155231001cf.6.1782724904310;
        Mon, 29 Jun 2026 02:21:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:50e:6311:7380 with SMTP id d75a77b69052e-51a72831d5cmr155230661cf.6.1782724903818;
        Mon, 29 Jun 2026 02:21:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c127b7619afsm29219266b.4.2026.06.29.02.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:21:43 -0700 (PDT)
Message-ID: <8fbbe66a-839e-4099-991c-f5b2868f03bf@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:21:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk
 register and parse_dt helpers
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
 <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
 <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
 <ol436i3oqgdns74dliw72qns22gqfgygm6qkz7mo4g7oiywlsg@johrhdyv4rqx>
 <ahk57lEoWQtkGsJt@hu-qianyu-lv.qualcomm.com>
 <1bbccb16-b91e-4116-a4cd-213a46978fa1@oss.qualcomm.com>
 <akII/X8OWO5XN9Gw@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akII/X8OWO5XN9Gw@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX5Op8ne3ATTXF
 WmvOtjkI5zbs0lqtCEA6Y2aSI/6TZyQ9Lv4xyJ0k5C6m1xRbmAj7mMGBclavtteXH+mAuySVymA
 UFPyz7wyvV1c+zmSb26yv44WtFl701U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX4sRNyXqZgLkB
 xIvhHIuyMet4aQ3ka/p5Z+R0Tbm+GOKAfb/LOM/A+NkR6dam7kosdgEPHuLj6MTfEioc9z2Unho
 EcYS0DQnhiDtSUv6gDZS0s/3QKJ+z/dPEOez3ur0uZuP0GI2isg9UVT8Bhsle5fQh9b8WbarlhK
 VTpWeB6Gfv8/+ElY0LXNEJU0w6Jvr2loMBJ03+6UKsPDJ8mDkRx1pBcd3/vrqHYVTwUsiTx/c06
 JsdJLLyrIHTShOZ8/vfH3hGbbQ2oaQi1j9+/By5NS2v3YPsAEDQjxcmxZxrOQZsMdfKq/Z3xglt
 b5aq7oiih7913R8094E2h6AKht+TNykblkjQAtbszAm88XtVSxl9xM2gcJ97qeeU/3nJcn52LiZ
 Eo2O7RX/XyCRuAoxPkd29KX6n8SvqW75wn3dQPloH/stiOR/rE3G9rVFOGAQ8pfoTJ9Gq+VvJRt
 8Ps6FhNmzOFjCYC6Gww==
X-Proofpoint-ORIG-GUID: a2nKP8v87gp-ddVWXUbnoj53wl2dprDv
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a423929 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OXfuQhhJyhkMGnq2POkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: a2nKP8v87gp-ddVWXUbnoj53wl2dprDv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114932-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0ADB66D82BD

On 6/29/26 7:56 AM, Qiang Yu wrote:
> On Tue, Jun 16, 2026 at 04:05:43PM +0200, Konrad Dybcio wrote:
>> On 5/29/26 9:02 AM, Qiang Yu wrote:
>>> On Thu, May 28, 2026 at 04:48:24PM +0300, Dmitry Baryshkov wrote:
>>>> On Fri, May 22, 2026 at 04:27:35PM +0530, Manivannan Sadhasivam wrote:
>>>>> On Wed, May 20, 2026 at 07:25:01PM +0300, Dmitry Baryshkov wrote:
>>>>>> On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
>>>>>>> Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
>>>>>>> under a single DT node, each requiring its own pipe clock registration and
>>>>>>> DT resource mapping. The current helpers are tightly coupled to a single
>>>>>>> qmp_pcie instance, which prevents reuse across sub-PHY instances.
>>>>>>>
>>>>>>> Refactor __phy_pipe_clk_register() as a generic helper and reduce
>>>>>>> phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
>>>>>>> qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
>>>>>>> mapping and pipe-clock setup that will be shared between sub-PHY instances,
>>>>>>> with pipe clock names parameterised per instance.
>>>>>>>
>>>>>>> This is a preparatory step before adding multi-PHY support. No functional
>>>>>>> change for existing platforms.
>>>>>>>
>>>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
>>>>>>>  1 file changed, 44 insertions(+), 32 deletions(-)
>>>>>>
>>>>>> I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
>>>>>> end up having too many single-platform, single-device specifics which
>>>>>> don't apply to other platforms.
>>>>>>
>>>>>
>>>>> I don't think that's really needed. This shared PHY concept is going to be
>>>>> applicable to upcoming SoCs as well. And moreover, the split won't be clean
>>>>> either. We still need to reuse a lot of common logic in the 'phy-qcom-qmp-pcie'
>>>>> driver and may only end up keeping very minimal code in
>>>>> 'phy-qcom-qmp-pcie-glymur'.
>>>>
>>>> Then splitting makes even more sense. Let's not clutter the existing
>>>> driver with too many conditions and options.
>>>>
>>>>>
>>>>> If you are concerned about the file size of 'phy-qcom-qmp-pcie', then we should
>>>>> move the SoC specific 'cfg' structs into a separate file as that's what
>>>>> occupying majority of the space.
>>>>
>>>> No, it's really the 'shared' part.
>>>>
>>>
>>> To confirm, are you okay with some code duplication between the new
>>> Glymur-specific driver and phy-qcom-qmp-pcie driver.
>>
>> That's a necessity, to some degree. See e.g. qmp-combo and qmp-usbc 
>>
> I've already prototyped a separate Glymur driver, and it turned out better
> than expected — there's actually not much duplication. The parts that do
> overlap aren't fully identical either; they tend to diverge once the
> Glymur-specific handling is factored in.
> 
> Currently, I meet an issue when tesing the patch, and will post it after
> fixing the issue.

Good, thank you!

Konrad

