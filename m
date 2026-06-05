Return-Path: <linux-arm-msm+bounces-111320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /EHLNatpImpmWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 08:16:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5239364570A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 08:16:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aoGQOPX1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZT5lN+qV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111320-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111320-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B686300E145
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 06:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C383988E0;
	Fri,  5 Jun 2026 06:15:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BFA24A06D
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 06:15:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640152; cv=none; b=YvP/Z5vDptGhknCUnuUaRKup5fcpb3o3O5LMO/CR/o0QifWyC0ljuJoO3VRj3KQTVHMBuLmfKZpdS2nI1fiwCqoMAzDVUP5CsrxoZgZYVp+vWt0sPO7lHCafdsxkjU7INiI1gVWWy1V540GIkUdt71Kn+jYWhcm4TwrDC2HK9cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640152; c=relaxed/simple;
	bh=pSy7JRWjdIKY9QJsH/r9lB8u5WNj2J0RqLxTKweYghc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c34baLm2kUg0k7dW4zw1dap69JKGC3tSIWIriTTJaJb6hDkuuS62VfOYGV7kzNaVij+2NLmDLjyZxqeUdoe/HkSTBb2+131aIJrLWwjHW9YYMOdIjFmxX7yMB6+7wQC6WMIN07hLW1j7exAPN4jQwT0narU/KU1X4SoK6TZ1Vik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aoGQOPX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZT5lN+qV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654NMBnq1132266
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 06:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTVXLo0+IK26zLaAI6u3FwvMuaye+UwKCeJIu/67bic=; b=aoGQOPX1CZXa7kHv
	bvzNtNdlHxUuNyGwkoxPhmpRyiJoRvM4UtSLVM20rj1rRcnGezPSE0+9GrD1IzQX
	dw80ZRT9Cey98emJkUZXIFj7bhqffId2p1/ofZ0A9QUTYViImSnjCjWdOLnw3gx+
	LUWo4wGOsUpnL8fvoSxVqU3lGixLw+ODbYhbIY6ujCqLFEVVY/Fv5M2xRGKLQESl
	Fz+Oo4CseqCJuTph7VDspTOf/4LiaPBaeU0gAoKQhgTeSzdfSBSOEaF1ZXQ1omgz
	2dED5I7D0IesJHGfM9IAK92hakDDUXN8ont5a+/yxqzKM1nkJVmpLn7UYv1wa1fM
	AnTwqg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsn0wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 06:15:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0532a6588so15232315ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 23:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780640146; x=1781244946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTVXLo0+IK26zLaAI6u3FwvMuaye+UwKCeJIu/67bic=;
        b=ZT5lN+qVLkFZUFqt3XDn6Aa3IgJ9a3D6GX/q2C/Q3LGSXkgmdcBEYx9VupVLVRjA+3
         LesOL+3QFsyqUwBEZnLvhIFJZdEIGKdLe2MzeZ5vcF/X4uCyCWPKGUZ7l4X+7fG2J4lT
         rwnt1wyBPNqE4lBsiJTBbIu3clABbI9U309hCZxgKnGoHaQuHHmkglVZAhT+wjWEoi4f
         iyG7cRGsjxQlvOOAriepohmA/foKgQ7XdTPaQOrlgsOrkPSZhmHqfMNP+3XTCusH0Kiw
         YY79qHR/60UY7k+aQu/nag+TNh0R0Og9U2avtHWQuPog1kFw2r+AXSQHK2MIOClCRMuN
         DPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640146; x=1781244946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTVXLo0+IK26zLaAI6u3FwvMuaye+UwKCeJIu/67bic=;
        b=DTjZWD+6hg1UW2Yv/k8YqairIPf3LRucDK8XZXmRdUc9udq3Tyb9EHuLEJ4rIAtOsm
         5VzEUNOto6Hkkqa86t0DmDK3dmQfujdf8XtmCwmRre44tQM22/ZGS2sQulw8yaKO/wow
         rvYUraphTt39M/X85w1X8UpCupU13BjWK4YOoQsnCkrWsZBFhssJ5hLrlkMJQ7KaN3Kj
         bgpEPOJxNHXcNNMRIu9ATHaXcHnLtR5lxNhZKr9NO14gBUHrpwx7NKNF9X7z84oE7APz
         iXs24L0RNTKZjqCC2hYgDjSZ5S77EkmOZEqsz33lB4Rb6GL+gYtq1cGkvtLOHU86kLQh
         nn5g==
X-Forwarded-Encrypted: i=1; AFNElJ/re/qd46BxA6duMTpTGNv+ldcUfIozRaA09mrU4UV6Pj9ye/ryLIB/iauSuy2l34c2VdY/iftge5nMXSau@vger.kernel.org
X-Gm-Message-State: AOJu0YweaZVBiP8bIADCxXvdHrkpvCNG2iCDjXa9ZyybVPODbqk2Rqcf
	+p1ocod5FVEBk+algaerwr+ozK9wNEuSDA/lqwXeVTr9Nd3WbTZF8y8EfF/Ix6vY04oww5+tcZZ
	56upukR0Jkvg5K2gnLZqBx6pF4Aq1TN4Q5VdUm5QmOzUAEo/hVTfRWCk4cP8D+uswXzCo
X-Gm-Gg: Acq92OFStWTJEtnc5Y48XKG5L2GI+pAUIbJneNSSt9gYorNOKBb40N/vO/Y+L6Qhftu
	qr/9vIvHLV0oi7R3wejERhKnrehvoAbmmpRLTg/mLGNbWjkepUU+/kX8uQUW1ubLt0iUwEFul4N
	0oS9RDYKhqNUAr2SrIzd5gPhdKvY/Erxr3OUkUWgbTvxs9cIDxG+DBqpK+lDCRJKgMG7NBrjyQt
	KZxSxTVujo2rPZcshWHvAOCT71R38VU6K4uwOVXnzf0g/trzLL1fpSc7VYUAobkBrnch3mY4D64
	hJPJf/N/XCXECQHWKhivX5h6idxjfyS/zWqNOqoIkEpUNmRTnM15sKPdfQY2Hak5lilFPG+pT5+
	rsutdN1TqRAZJFLDE8Hgwd6JIqBX1TlqZyn13xSDsaRRgItNVCG2K9NFsY5s0WPn54Pfr4KzFhn
	oYUOmACjn3L4j9cxP6dycF
X-Received: by 2002:a17:903:1246:b0:2c0:ccdb:e023 with SMTP id d9443c01a7336-2c1e83451a5mr21420305ad.17.1780640146459;
        Thu, 04 Jun 2026 23:15:46 -0700 (PDT)
X-Received: by 2002:a17:903:1246:b0:2c0:ccdb:e023 with SMTP id d9443c01a7336-2c1e83451a5mr21419945ad.17.1780640145970;
        Thu, 04 Jun 2026 23:15:45 -0700 (PDT)
Received: from [10.133.33.77] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa00b3sm75603275ad.32.2026.06.04.23.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 23:15:45 -0700 (PDT)
Message-ID: <b417d35d-68f8-4900-9a83-16c66983fdbf@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 14:15:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spmi: pmic-arb: Fix OF node leak in
 spmi_pmic_arb_register_buses()
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260604-spmi-bus-register-fix-v1-1-136adda83a92@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260604-spmi-bus-register-fix-v1-1-136adda83a92@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DxlrhXVaCcGPNjhYNM0_M6TaBFRLtm63
X-Proofpoint-ORIG-GUID: DxlrhXVaCcGPNjhYNM0_M6TaBFRLtm63
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA1NyBTYWx0ZWRfX2kiVVDq1iHhD
 +3V2SS12zGinBuOBl0hnw2sQ5JS5g1FgrvQFsE4iUio8YOsL0IqTRn3yElo0wCxabtmKl0Mvi2g
 aZeXEYBagMUA4HokpP6Vusm/kmKgW8S+2decWEl4EAftKhCscuwKqO+UXwn3fLJ9QqkUnTISa+m
 sD4okZj69nnYwB+b+kGJOPxq1C6Kk2TVW3j5At9IJ8OvZhZPdhO5HNlGPDdCEl8Zg5liDVHWdjC
 9xJXs5pWbQb+cl8iAUz+5DtKZI6kQBg5AFFRnPVFjs8LXzpaCvUyqGRijNO+oiyt4Jw8cZTk0vA
 qsjZsK7NA0xGaLzw97Pb9Vr3I7p8dkmfiM/8srPvxU0xg2DCXJo+Z3LgIu6lDBIHnrW4/7QSxXj
 Sm2pqr9p8UsEQLlEWK5woUBu88WVoODPH61UYgq4vLMtmH5WT8q+0eu/Bb5/O1BPC909m0p68y2
 L6ghOTIH6IKyX4rVBWg==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a226993 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_5OF2q1O2MIjwZNLnQYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111320-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:sboyd@kernel.org,m:neil.armstrong@linaro.org,m:abelvesa@kernel.org,m:gregkh@linuxfoundation.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5239364570A



On 6/5/2026 1:46 PM, Fenglin Wu wrote:
> Call of_node_put(child) to reduce its reference count when
> bailing out from the for_each_available_child_of_node() loop
> upon an error in bus registration.
> 
> Also, return 0 directly if there are no errors in bus
> registration.
> 
> Fixes: 979987371739 ("spmi: pmic-arb: Add multi bus support")
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>   drivers/spmi/spmi-pmic-arb.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 2e2cb4774103..26e804ad95a1 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -2055,12 +2055,14 @@ static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
>   	for_each_available_child_of_node_scoped(node, child) {
>   		if (of_node_name_eq(child, "spmi")) {
>   			ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
> -			if (ret)
> +			if (ret) {
> +				of_node_put(child);

We dont need of_node_put here. The 
for_each_available_child_of_node_scoped will handle the refcnt 
automatically.

Thanks,
Jie

>   				return ret;
> +			}
>   		}
>   	}
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static void spmi_pmic_arb_deregister_buses(struct spmi_pmic_arb *pmic_arb)
> 
> ---
> base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
> change-id: 20260604-spmi-bus-register-fix-dfdb94bf834e
> 
> Best regards,
> --
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 


