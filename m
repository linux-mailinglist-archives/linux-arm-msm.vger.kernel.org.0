Return-Path: <linux-arm-msm+bounces-116904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nNRZDmTQS2oJawEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:57:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F90712E66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:57:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o65x5f+4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a676ZJbM;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116904-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116904-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B5EA2B178A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5BF42643A;
	Mon,  6 Jul 2026 14:40:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D969426434
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:40:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348852; cv=none; b=s26/PCzoL0pBvN+rcPaDwVhoV/1mMev8xELJnsTQlNPWzkQjsjpIKtKBpkSiiCmwh27XkSGDI3FkxsIRzm6WF4xRNNXhehW/Rc+tVJLGxYJslAbLAW3uJnuMepkv2h1pmndn4Ln8uAXUv+YMBrp2A0hAa5apBQkblh+OSqgTElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348852; c=relaxed/simple;
	bh=c8ATsYZUarDFeBqoYlDvFG/Y5KQ0FdsdVPsvH68dptE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8Xq/4pyUavJpp72F7/0Kzs271qwFAFBiX/BNSrLGcX6bkCcaGv6inbIUrJDbX6cQt0bPfd8mQx23SaNDk0fbGgrzx1g4JbDFHno2w8OZtTC/261NqDhF7jwuO377tmYZVfeRphXKToRGkT9zQs/mhzbjkIzp1ovFs3SlRNTsdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o65x5f+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a676ZJbM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE8Hq616510
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1YXelcpMQyjjqfxAH5A3yTNz
	T1Wua4sYEO1lqx6kVXs=; b=o65x5f+4NZPanmYwqNS94I7vdzPdP9qW60/M3cVn
	os1yKG92mdOmzrsV+lhvRobK2pIITSb9mGgYFcXeKzMei9fVuuencaFw4tiBpW72
	y/TPARkcA+iPAdnx7Tg0SzYfH5VTjIrOG/m1IUM9+NgGgOf6OOKoq9CfNedxO774
	MafP6ONjIAvAWS6emjWRLzReOssZuhk1Kq6Rtl1rRxdU8yuVvty3153HfT3hJecg
	0n7JtbONr046VR3i9jcOwSGfOFGVyLMYHjZvzVq3Z6kpYEXASDynkcHcHGRHnZJ6
	6Lb63vHqd1kB3ugvhvBXM8oSFb3k7BzbpXaRNQIunClPrQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxsuxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:40:48 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-969330d8ba1so904406241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348847; x=1783953647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1YXelcpMQyjjqfxAH5A3yTNzT1Wua4sYEO1lqx6kVXs=;
        b=a676ZJbMRPKXCiLxKweawh4RKZFRhFFSO46ciP4iBvbenxdmr41YePBvLXytbkSTik
         kUqCh7gc++hC7K00vXS0IAmkSOM5lACPJKA9knXgJfF+bZ+66vtNYSXNdTL9ULjmIYD/
         fmNFw/zrK/WoDQUvIMQ4mMe1KwkqqVA7XkjfZ8SdKV/bF+81TQtk+AmHrx00yB77k25Q
         Ck0isJDOb8rrJSMNAKtfZ2K2eaF0HGdsQ6ri157rQaoP6j8xSriBrm5f3p23yj8jhSly
         X+uqyLfxc6OOvYGi4mEkJYIZieaAMSFvRAtQARdNdGEq0wxr2C8Fq/Ofqkhkv5PT/npO
         JNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348847; x=1783953647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YXelcpMQyjjqfxAH5A3yTNzT1Wua4sYEO1lqx6kVXs=;
        b=NDlYy47Lj0R04dFugvErIa80gmZPBR+KKbyhxMCSdnjUo4GheOzq/5eLh8p3n048BD
         o/kkXebHeEuDHb6FHOedcxvb5mBG3gXsXAA2ieJ1jVDMrr4izXiPtbRDVPaT1Cy55H5m
         +BJa/IdQBTIV6tT31rWD4WaTtbuWW7uB6AMLpuji5/9moeHiRYKCoobcKkOcI0L8bBUw
         Mtc6JF88J3+2b0ps/BeuhWuDuFg92Feyv9ExUxrgS63lXS86ywbNUQwwxLHnPHgo9Riw
         HbObv7ha1VzQX1PVoLjrytmUP9VB30wciYfLhvtzumIgvgPVVkA8ltGeBEWkrZmDgb2K
         Y4MA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6zfyl2jw0Yz1eQ5TNus4IN9nemWrudTA0LfNZXbSw+l1h5+qpQHlvJdzXhVMqVYfTB8Yz9iCj8VwOwZ9/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2t9I4a6FJEsYmz96q7vHD+Mam1B6ak1GWXuxxOWf6RrNeUcbb
	Do8sSyJTtogr5RvVlFhnl8VzERk3QAHYpJ9abBOK6ZMfYlr1IGAi67vDZsC4wgkDzYiTPmXfdaj
	234aurBwVZ7V7Bfeq++OOZXVGqOhXw5d8x74hO5Z5wWiXlABQA4FHDoFkSEyDrMUK9OzA
X-Gm-Gg: AfdE7cmGpe6qUH5QfsWc4c8PDYeRfbIJ+NwDHZDygcGdCcbJCU4j3X5sWxwKBjjX3Rl
	pXDO8pajr0p8sDbcNvJddM41Ql+1AGNDv03OHWdOtD39zaEL3o4wbU8Dn+WzWbZgWcWDn0K0ChH
	oIkbgsc2tsoxPL75x25lcYv4ToI+Q2Jr1VWUsROZTDsuP74eYmDZSI+E9pfQeCCXlGJcCFMFnbC
	onswaCISHkH7VKkqTyR+f2ulaB08yQRE/4CDyaaN2tzxe1bZZa8W8rBC46QgT3FuOgtlsYflIL8
	96SeSS/yilmQOOrAhbh1/o+uWfAuzw9elXppKwPAgfu+fDFZVIbkEpLAxxlRxTQ1kTbuj5utTMH
	sVlnxlMeY4UXXZhauFwxJHAJAqyuEPdBubVsmoxJeKbRZZ3ZLQoMYepbSry1M3NnNXrvvgkspe5
	Slk4hpJycDM+zwGg2Amp+l+QnB
X-Received: by 2002:a05:6122:219f:b0:5bd:c11d:ecd8 with SMTP id 71dfb90a1353d-5be8c624393mr453065e0c.1.1783348847426;
        Mon, 06 Jul 2026 07:40:47 -0700 (PDT)
X-Received: by 2002:a05:6122:219f:b0:5bd:c11d:ecd8 with SMTP id 71dfb90a1353d-5be8c624393mr453050e0c.1.1783348846933;
        Mon, 06 Jul 2026 07:40:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f908sm2893565e87.8.2026.07.06.07.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:40:45 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:40:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: camcc: Add support for camera clock
 controller for Nord
Message-ID: <bokzk3fqi4mvlx5bhbmrkeqc6rfjpjmcuswdkji5g5si2x3lxh@ryshvgru2mzz>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-4-bae3be9e9770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-nord_videocc_camcc-v1-4-bae3be9e9770@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9Wa2-8I8Mib4k7h-ekbBOT5t6boFQWBA
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bbe70 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7Mhvcmd6cMb-wOCvpSkA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0OSBTYWx0ZWRfX6ShWJh2PDf7A
 4egepzseIAGQd3RRd6WOxp47OJj1ox6x01O/+CZowBhFJW8mAOwSAe9x3xY2VyfJiu17XyaxneC
 qouT39DfBBcYqUBKrJvMKLfXK5/wbCg=
X-Proofpoint-GUID: 9Wa2-8I8Mib4k7h-ekbBOT5t6boFQWBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0OSBTYWx0ZWRfX4BQ0YMtURHUE
 4qa12IRcI9ER8loTd5OFcg0z7L86xi4x43YNh5/9Dnd3SjznZhBXCpb3FwpTvkq6BEdNqUYc5Tv
 nxjymMz/726rTmKqskQjMpmLhTHezOqijnC4vsBQGcMSfDoAO/OGL5YuXUHcu/oH9k9MNGt2Fr9
 XPTWR3O9YXvQKysmUwrdpQIC7HaXso1M8eNZ4SCFRmZ2iwdUwBEeTVogCdRPAB4nCfQlncJefxW
 HYrHA/u7fii+7tKF22AXUM8AFiOe39mY7wSObaYzVrmmJFV2qPtzI+J14cYVqXFpw+u2JeUK6VR
 WddbcNpGjaJFyVsIBbyvHxLBBP5ulzbxVo9jQY/obGEB/ZEqjb/dAFefQ0nYG67zYwOKMHLtQjk
 7BWISpsiHpmRRBZEVS4pe9MEMKs4G4JO/KwAKZLhe/M6AE922/Ibq3+kS5K3R6h8Xoiqz/AnvB1
 d+Gig7+XTxgVH1DTkRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116904-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_jkona@quicinc.com,m:vladimir.zapolskiy@linaro.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ryshvgru2mzz:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87F90712E66

On Mon, Jul 06, 2026 at 02:27:16PM +0530, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the Nord
> platform for camera SW drivers to request for these clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |   11 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/camcc-nord.c | 2941 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2953 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

