Return-Path: <linux-arm-msm+bounces-112853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kkc9NguyK2rEBwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:15:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CBC677239
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:15:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TGu8hlJ4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hyIkT550;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112853-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112853-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F68432D48E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B213DFC71;
	Fri, 12 Jun 2026 07:11:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650713DC4C1
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:11:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248292; cv=none; b=onHuhmAMJf9CWWhbkaAM8uKi6XWYQehh1DnGCDgaETn6F5+o86f6A6JRflpbLu859ui3PDghmyOXl7R5eRFiOuOeFVNSWKvyuGzVqAb0xZ5AFkHTZ93x1VczAHXMpHac84VOsZft9XP1ZkqPy81+LMtZHhh41UA86JvYH+v+cHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248292; c=relaxed/simple;
	bh=F+L6o6Tr4+wSTemLWchDyR6SdCI9Noc5GlbpDkNWfpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5nkasyTfRK9czCjoWIVOnZVDGX9qUKuFBA64FU+z+1/RBEdr+KLHgb+JCRx2S3Gtvs6d77Fdhot/Ypp5DO4ub7nJwThlYhbgba+KS+Gv8fFFz+LOVdn4awh3sSLV/QzYJB4lmk3Y+N+zLJtXlLShqBDpwOohxUiVYGfiXbbZDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGu8hlJ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyIkT550; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BsOD2534066
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sgRxjNUG7aBzL0yQw8/6avKR
	8LOtMiVPpCqbd9rfu0U=; b=TGu8hlJ4+AWlsPwF81/bDqSYT853ut/uuVsNkDtE
	TAy54zGaPsO5NajMyiDFuAiKir1W1NvYXyh9M5Xd8kOZ0A/wyoszzbDt82RVBoMi
	KNj5ZAYIxIxV19PwHIgMmuOVS8P8xzc/JUWL+89UpS0Z13AiAI3Jed/3WLW7NQHJ
	QxEJBGQhRAUwoafFhqOcCvdC2vgvshSR7KdEzZTXi9jGzWamyhBs06o7F6+rnz2p
	NGvi5XKF8echIbhMQnw6xUyIvnFRARFGI7eEnEJ639SjbPddeVXLMLQwaKBXFqT2
	dJt7nNxArsabCQNuRvPiBFnrWkmnAi7oW8SvudxMhRNjyg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u41xbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:11:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176cc5bf2aso7950171cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781248287; x=1781853087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sgRxjNUG7aBzL0yQw8/6avKR8LOtMiVPpCqbd9rfu0U=;
        b=hyIkT550VkgTNR0z58SzqTCwVGcX7z1UM3bkgtR9uki/wVXLuZ/aEfDryHd6Y26Eyi
         /JJ4mjjfzfcF67FyfetgOy/dnoKyY6bb8bqO03QWp9g8IA2mTXKH6tSQxYCsYXsKnTOh
         ROwLTrNyKGZLc6XLkE5LJ7EbbdLiV3RfljmqSLku6p2Km9cuSKfWuAf6H1J+CHo2QIq6
         UHeWm6O2PzhfNpmXLMyj/zx3a8hDxKrSpoFSV6GF3jZli0z14idclQk5MrPwlA1fabWI
         zO7lGETZb2qxqkh1PuF4pC4m8mZmGJSFwZEXEL5SRs9L3uC8VE5Mn/qH9n3068Mw/r7U
         E3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248287; x=1781853087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgRxjNUG7aBzL0yQw8/6avKR8LOtMiVPpCqbd9rfu0U=;
        b=X7b/QiUHyV6e0+eQGVjnmzbGUkuX5hDlr0ISwXMOxcAs9jGRRdaHIBxI5zbxGH7Zko
         jFBn8ugGCOZYvW/JFzyLmMccrM+a9kJN7XaaIyoY+sSD9sfdRaiitbjIZ9oxhxpiOfui
         Aebf+++q2t4m1ucpGQVm3mR5u49DfvW2rdLZtUMYpV4vUT+ticgj7XTXEJY8kV2x39ep
         mmnCK/lg2NwdlNyjnNeluyzThPYi/X0PcuxqD4Q2G9UJvhdkY5mPonl3E3tLhJwfHVLF
         TzBXaJjmoAsazoOMjcc1wSWdrVgsz0/QNhHbnESjlndCf+2zC86V+to/ERExu6GQ87+S
         7nvw==
X-Forwarded-Encrypted: i=1; AFNElJ+Qg/JofuPJDKTPSjV5r44vDGiSFYy7BGIyXLzl5oDoArUvYWPVDgvJshvcz/STTJhV+X6VQ7XC1op10Q3O@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ocbBXT9TD0Ot/tYQ07KZ3R+S4ADUUlsXYEyK4uBX7B7dhuhj
	0XwRhEhUGa3xkqW0bV9tzSm3WiRR1WGeRqtc1Hj0bwEGYqx96m+ctxPpVluANSvXxvFdJlRLKwD
	KDGxOYpO+fsQ/VrkzLQf3nlNBodh0QkJ47MmIBYYmS626Lipg4h4JcDLGBWIcUXqiuZvX
X-Gm-Gg: Acq92OHo1P9gMtkrWNFDu90YRi1LnfacHLonQ4UFMS4m/04uRP74pe8t3M6ig8/ahE/
	Or2FklmdlsQIQcB08m8fvpdqhT9/WDjTvohOLqfJEwRXVZs8qkAPFKeDPfHXt6moRfLu8Vm63Nq
	VI10uTiuExr1Sj5xuico+QvrYfP3F8deeuCbztmkgPnRU8YFkKuehkTMylNNvpepEwkAP6aL04a
	2F1H3G6lBQHQpBgyjAJ2JUqqIu7Z3+iXLeVSsKLa+MZL7uDV9tX5By8by7T3jALu/mHa5SqzE8J
	rV8CDoTMAxQKBMyale3pABxjhtCwzKwa3tXi9myiKTrHS34HJE8fu0knvxVDuUDgHGs954hCtV5
	wdG/enBQBle75iTx/9Wq4qp5blQJmvnQmNDv5uUhH967ZT06LqS+z7Ptp8UWKVcYvhV6kBF/F2S
	t/ckTUN67U+jQf984F+WLvbKVXaVgfHdKoXdM=
X-Received: by 2002:a05:622a:1191:b0:517:5b2c:6aae with SMTP id d75a77b69052e-517fe1de684mr18947801cf.13.1781248287485;
        Fri, 12 Jun 2026 00:11:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1191:b0:517:5b2c:6aae with SMTP id d75a77b69052e-517fe1de684mr18947451cf.13.1781248287053;
        Fri, 12 Jun 2026 00:11:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7333sm281464e87.52.2026.06.12.00.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:11:25 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:11:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] thermal/drivers/qcom/tsens: Add support for
 ipq9650 tsens
Message-ID: <yi5jzdqmmynosrfdkdwz2btesbkyv2vwpkwvpf3yyp3exavipb@2z2gvgg6p5p6>
References: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260610081241.1468507-3-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610081241.1468507-3-varadarajan.narayanan@oss.qualcomm.com>
X-Proofpoint-GUID: QoD3ndLY6wI7hNtmdIX_Y-7tr6hForr2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2MyBTYWx0ZWRfXxLRSWGCOcmw1
 1aKvqqSvTtl3oF15ANCKfeyj1Eud8BYICD7isrr2vq0OYoc5VXaZXVneeJSaMNCi9UwXaY3Sp0E
 i1KqRU3Rn2EeIh0rVkBbuJTIwlrpETk=
X-Proofpoint-ORIG-GUID: QoD3ndLY6wI7hNtmdIX_Y-7tr6hForr2
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2bb120 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Br5ujosB-dOo-FGV42YA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2MyBTYWx0ZWRfX3+O8gAME4J77
 5nVuco2QZXFf9eWGESN1QdqC2ETqX32P++bee0mA7Qxzi822Z23AV8oikbKOqGuLLmyjzR9dduV
 5naByoO18IwJcOa3kZ4RrWbLtmwXWFxbzZlU4yIbs8mDFdUBu2Dd6MnLkpPyn1XWaNtz75XXtpw
 HtqyQpX5WppUGl6Uy9VME8C3TGoCrig6ITccTLa9r2/xCeQhs1fAQZHiKEiYP2ecjobzLQB1LFO
 t38XOsiZhuzL7XiGET/bgh+3O0XDKD7wHK7g2iA3ovCCc9y4t/hGiQ2kb5JCxfP+GWZXaQ+WRJm
 T/jFzm9sYlI6n5FnEINgP+HxZ7q/b9+SlWtS366T1n89MeqnUJ8PGgUjs6o1bAk+CFmed0J+gNc
 Aqcoz4fvBx+1tlV8RD2xnTS/grMWOnv2cFu7MJc3C0bQm86+Km9os3wlWNj/RFXG0ehlDMyf4oR
 CmdrUuC+LCDo+0a0X2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112853-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73CBC677239

On Wed, Jun 10, 2026 at 01:42:41PM +0530, Varadarajan Narayanan wrote:
> ipq9650's tsens is similar to ipq5332 tsens but has different number of
> sensors. Re-use the ipq5332 data for ipq9650 and modify the sensor related
> information.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/tsens-v2.c | 8 ++++++++
>  drivers/thermal/qcom/tsens.c    | 3 +++
>  drivers/thermal/qcom/tsens.h    | 2 +-
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

