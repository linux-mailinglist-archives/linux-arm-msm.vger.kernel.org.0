Return-Path: <linux-arm-msm+bounces-95300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCPCN6IjqGl3ogAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 13:20:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DFC1FF9FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 13:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47B083047BDD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 12:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE82F37F8A3;
	Wed,  4 Mar 2026 12:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FNipxwmR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPLgMYwP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9732539A056
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772626750; cv=none; b=dDeUF8vPVEX0NCyh5B9tCt4VF6LXoxXCxHH2eoCnyLaAOJg6uQ19kQW5NK9jhTnoAyWYkGkPUJL+YOG8zafo8OOSDpFUQh96unLvC71nI8B5Cz6poehC/EQO6dbDvv9HdHVo69zbxIjXOxUdu6R197C4IJWK12ZD9LXjFRntgfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772626750; c=relaxed/simple;
	bh=uDyeW1xDHKAVVTn8tKC88jlYDnAsMDuTF6SIjgt7eLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyVjM8yQM+r4hCTwF2flNmNUSsI8O6/LHNKYWcps5jsSs5+BSCOu/nzLOMLfVzIMXQyrGPhwRx1fxFDkg1vad8QscswsI4Ortcw/gs6Ux7bwaIRewWGmQy7l9d6xhb2uw+vpBGmFNm5Ns1RSQ6iGRgICwT38/gam4BTJ7VsYGTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FNipxwmR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPLgMYwP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SkXG1073075
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 12:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxsB5NCYJ9Wco9EkS82OhpVjd4FUOfck6CfUcK9bWk8=; b=FNipxwmRoZDqij/1
	gNq+1TLME3dHhg342F64Rh+fXPYNGsS8N3uzJM8pGNiMOs2XETbyEqOOEyDT4GlG
	KIGY0PRuHdQW9dLfUaxGmYy3T0g0eh3Rt6vnFRU4zdMH5yBpjyOxoxC0fsVJGq/u
	X4Osm1dqzhGIY/J0DX1DHiX6nXroA6lHvo54T19UDXdbDxaDtLJJDBYtySroiLh4
	7WLj1ZqV8lsCOkmLV1YV3vTwQpDG4SRjcIS29tc9cxZ4qAFeX2kVH+OwAkGLaiki
	xdLc89Hd4jhSLzzahmXKOihPwGCDCk2OJla4boH+JBIHVlkFwJ7aUlF4Y7ovDvcy
	YsCjYA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfhkv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 12:19:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a01982dc5so17014186d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 04:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772626748; x=1773231548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uxsB5NCYJ9Wco9EkS82OhpVjd4FUOfck6CfUcK9bWk8=;
        b=gPLgMYwPLOMdVy0x7Jg5d6E93tmMal/8EhOPEetKaitE/oqComI8lJ+d8hQbydrI8P
         NzTGlWHTNcMUq+8FSGeN3l2jpe5oRcmPLpeC6TvBF0CtrkJ7HXULjaN+o/af/4tkxwAh
         x2DqvcYXqIN5t+TSAwMB5G0HORjlzDHONi7UB06PUYsizQBn8RmkFrLwdAtL3uMW+ecv
         ajpF9tsNKCzQIiqHZ0u6BijBvnni75XXFoYyfwUvxpNjH8nCl/9OAtTAxnLJCyEEUjTn
         Cexn5mhTCDYNAwf+84iRa7a59FKkKspffm4gGc6603VyEUq5tTG+M1vVljKDHQTIccJh
         U0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772626748; x=1773231548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxsB5NCYJ9Wco9EkS82OhpVjd4FUOfck6CfUcK9bWk8=;
        b=Y1rRBKexD1ZHqRYTzBR3sPIvKwPiiwBej/snkyAAdMtvbXd4J1eIGOeND5NQb4P817
         5FzJaiWahJJT+S55+kn+Ltd8un65dsODTphZqvwX4vo0lU7g3+JUAumA7kNoOc60jwuV
         oOE8+wFGJ6pYlOZDc18WxC8UxDzOj0DGvs15EhDZBcWn+StFe5Sz6yni2kDsBxaKzSlF
         Y4BQbDJIcTH4LXU3WksTwWKlAHCDaP3BK6Hm89az3TI4HRh+V4wo2BHdPUfCo7Maq8dY
         HM7IKZuoLB+VbUXmlHLnsgaUSFY2yyckLliz/b7amcIxmXnd3osOdmpj/3v73rdSctKZ
         LQOA==
X-Forwarded-Encrypted: i=1; AJvYcCU4tV5b3CYU4SuYtqhvgObYR/FzZ58AKVILCB9waQOo5zyazAhR7eHpTXAcmqi9iPWGHr1UsV396jn3mdzp@vger.kernel.org
X-Gm-Message-State: AOJu0YyuHmB8yRIOfVDgzmk+tZvpC/+mi96qEuVO5ANLkOurQ9cC6nNj
	pTjYJkpjvOmXToSelk0jTU/Ss3euISFdX5X18G3OXisLeH5ziFP9Mp9LeW6m0kFvvqhGRuU74m+
	heBsJ7jFblJWN0IUBdksHPRfCtxCX9d42MiYygratlMTvVrIPN8Ra1q0AKgE42PxL7fM1
X-Gm-Gg: ATEYQzwtn7A6zuyRHfKT3WhE5wPGcG739DBwKVkeF+PTxU7+W0eBHm+sTLlTF3EpSR3
	zqtHOj1Qx6qCEKOW6aWiIG+KXYE35bJgRm1W84gquRLtZOitbLyAnNIhBas++M7miGbdwpzMHKz
	KtmMKF33Z14f9L2CFz0QnWc7Mu31iedK6fGDLREQlNBSQsrZaOV49U/FLdTUTU9PvtpzhuECi32
	w/9Nwy8+cnetDG3RLFRyXjoYJsedPF8iAMdN/c/fMAR9aKLd0XvvXHN0/e+f2mHfe0EvDiZbrlr
	PNNyo+/lXhqhwdNyRwdvKhvS95jt3F4Rm/XKtxk58GR4rpkGTQOLZRaQ1qE/Ih9HlwaUmIyu9in
	VgZAeMESzBGRxhh1YQXn8Bal3z5YqtReMmon9NJELv/VgslL5B7e4P9mW2sDSzVwakzYGDgQvRE
	Iku9g=
X-Received: by 2002:a05:6214:4c84:b0:89a:c:97cf with SMTP id 6a1803df08f44-89a19989f7dmr14654496d6.1.1772626747778;
        Wed, 04 Mar 2026 04:19:07 -0800 (PST)
X-Received: by 2002:a05:6214:4c84:b0:89a:c:97cf with SMTP id 6a1803df08f44-89a19989f7dmr14654246d6.1.1772626747219;
        Wed, 04 Mar 2026 04:19:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b93c7eaa49dsm274435766b.18.2026.03.04.04.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 04:19:06 -0800 (PST)
Message-ID: <0a703589-48cc-4717-a629-4424ff55b7bf@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 13:19:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Move pipe_clk on/off to common
To: Val Packett <val@packett.cool>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260228220634.22778-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260228220634.22778-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kZ19rhx5MVqPgBRHhIlNpPcY8sahidHb
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a8233c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2YwZb52RRteD79CL59QA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA5NyBTYWx0ZWRfX06xJeQ7ZbSei
 dY69dbSagS4Ukn7LwCnkTq7C+QkIH5bHFRvu1rlVthMJjoGSI9M6YkAb3ewE8t40jmFSioQuXX0
 n8vPdgZ0/1Y6TUgJleaFfOdzFvs6p7nmp6zGJkNJwqOW8p1wkpQ7mh1UE1dy8fxI1Inm5Vkh0tT
 XjJnkML2yr/jSVREgEs4FPA9U8YvK4wQlU+MSc4VWuXxxPcJ7SUM/9VUJaVJGLj4oQJil//AexY
 MXevOaV8YX/4dCXgsdQfUCxfJDrVDdViCNJBSpyVymYExjAqFHohni35byUA7sVm21tJlDPNJqi
 wtKXghbaprY3NNmEWyILl7vP7/pqQRoi0j96C1dFHchxZdW3Youse7svof+SMCoChETybj9/GqA
 qI8w/o46jAMnr1t9eywEzZeItHOxtCcpgOyHKgSIa8GHrokY2Zu2DqwEXbk+mZ+oDDYadOGCnI8
 vBGMgqy0rCTu362+YbA==
X-Proofpoint-GUID: kZ19rhx5MVqPgBRHhIlNpPcY8sahidHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040097
X-Rspamd-Queue-Id: 43DFC1FF9FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,packett.cool:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95300-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/28/26 11:05 PM, Val Packett wrote:
> Keep the USB pipe clock working when the phy is in DP-only mode, because
> the dwc controller still needs it for USB 2.0 over the same Type-C port.
> 
> Tested with the BenQ RD280UA monitor which has a downstream-facing port
> for data passthrough that's manually switchable between USB 2 and 3,
> corresponding to 4-lane and 2-lane DP respectively.
> 
> Note: the suspend/resume callbacks were already gating the enable/disable
> of this clock only on init_count and not usb_init_count!
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> See https://lore.kernel.org/all/389ca5d3-a698-4dac-911c-39ba057e3d17@oss.qualcomm.com/ for more info.
> BTW https://lore.kernel.org/all/20260205160240.748371-2-loic.poulain@oss.qualcomm.com/ helped with coldplug.
> 
> v2: Reorder disables as suggested
> v1: https://lore.kernel.org/all/20250927093915.45124-2-val@packett.cool/
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 93f1aa10d400..28428a8d1192 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3691,6 +3691,13 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>  	if (ret)
>  		goto err_assert_reset;
>  
> +	/* In DP-only mode, the pipe clk is still required for USB2 */
> +	ret = clk_prepare_enable(qmp->pipe_clk);
> +	if (ret) {
> +		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
> +		return ret;

I didn't notice this before - please add this hunk

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 28428a8d1192..cdcfad2e86b1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3695,7 +3695,7 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
        ret = clk_prepare_enable(qmp->pipe_clk);
        if (ret) {
                dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
-               return ret;
+               goto err_disable_clocks;
        }
 
        qphy_setbits(com, QPHY_V3_DP_COM_POWER_DOWN_CTRL, SW_PWRDN);
@@ -3756,6 +3756,8 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 
        return 0;
 
+err_disable_clocks:
+       clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 err_assert_reset:
        reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:

Konrad

