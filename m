Return-Path: <linux-arm-msm+bounces-102988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD2aJKky3Wl9agkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:15:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8E23F1DFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A641307E1CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F963BF688;
	Mon, 13 Apr 2026 18:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ck3NNKY0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGjeGdJk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63F1361657
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776103736; cv=none; b=ifZ6E0nF5lfi17eW5RaNE+FAsN/PH8mb86U5ajSTdMgf2TR/ltWZdgju6NtLigyPHqQgwEFjZZ77LDwmp2DEqm5cueU4Khdp4JPI8wy0thU5N/rDJvPwBps0+GuUbwZMvxGAfMvAHaRbfXPSAFN4vVCBhbDg0468MtbQXOppJvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776103736; c=relaxed/simple;
	bh=U3T4ZXp5e++JoPuyi/hPI5ZTFURW8q4HjEGmc3O84Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EObHM5OOZTt9XzqnBxaK+A1bh5HGf+qXvgxEwbQnuBe8eCrrjSLSGDPaQTG2v3y6dLUi9Zbt1aMw2arGwEJO49SS3Wk0FIBVS87+6vFlS1PUSn/CZqxp/cYwpFrluR/16BHXBD8SJUYBjKKYIqM/82XtR6TvFBunvr37VP2JXec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ck3NNKY0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGjeGdJk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DEDKwV2556543
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y6/UGo3lt9u5qAMJxrpInrrd
	xkbpYE578zP9W0JodsM=; b=Ck3NNKY0LOiue+NyiemdvWJZzBgdHE6yJDpR0f0X
	e2jO3YdvKbhbOxWPIr0RrOCGMTdpz8RLVwOy3wFvuD6duQrWo+dGgB66NQc/PwkR
	CFBY+K13fho+B8hzSL1cJKu3+ud4pR/HzTjA19CGflJkeWkz7Yx0qbdqQZ6ZxYGR
	3UQIAxV5fCbFLtCh64TxFtOzX4DuFGCEUV95SE2Zmk6FAzbA0H7wc12prPmLb/A8
	FBPI6tCtSLCozpnxwYEx2XtkBoPrAvSpuFlyD7twI0kuhaDtWXsk06OTB/wCJJhN
	qLVBZemwci/2x5/o2aBYyfjvZ5JF1Bq01HQrNGFV3tfdCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh22f8vsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:08:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4b81c632so48361891cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776103733; x=1776708533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6/UGo3lt9u5qAMJxrpInrrdxkbpYE578zP9W0JodsM=;
        b=RGjeGdJkb7Oz9Ms0ctxTkD/BdrjfBqpsRTYBT8rMyo4eAi+AJSknh4hIcy41+5KNXQ
         b99TvthCcywuWkeIZq7B2D1PWVfB47FkXcasjTxLabmn+tqnWcoofmMyDrzslzQioTni
         UOqj/zK88HQOlhwYHhmExH2XWWA4/TySHb3RRPiE38AktwFViwUwKLc9NYGFmaKDexco
         Wf30tiyFOtUnqnLZHR1cZ7GOuZrvnNMuS2k9JaGj8BHUnyfP1Wa5xC8R5pGudNr7LsAq
         am31oPybA8+12+D10OzhdMH5Av33x16MdztPLpot9pmBGNhebkUtympN0XtOSUnlk18Z
         ZtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103733; x=1776708533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6/UGo3lt9u5qAMJxrpInrrdxkbpYE578zP9W0JodsM=;
        b=tMoxqdZAdkvpEuCNjpk1l3Gi7Au6HqedNzsfvYaCgZUqsA9UkEVTE/8oaYFChRgEK8
         7L42bCCxI7/hJgU/ioy8GioFajr/RVlIHFJmmdyGjOkIVH0VuIUF0nbeTHjVGXpyOqFe
         mE+iwly+hK++ohcN0tObeVOXugJModYb+DtKazZY8MfIqLk65dDr/XknKRFxCxlp/Cvq
         c9MnBLMY3FevhubfM0qZGHuNWBbDZTWoFqDk9kCacZ3QfhwOutd3EMa5qzVU7KNk2NHp
         8T1tOnXpwlLPC6BoneeoJu3xw7m/Xyzc0viTBd0K1bVIrWjCaEfGtPgvQEJIWCZkc44N
         8gsA==
X-Forwarded-Encrypted: i=1; AFNElJ8zCVWySVX7cIL1r55rpvEZomUT1ZW2trQbnl8PNF4deWSHmNufJ728zsdmgcEs6ThFpBgx7f0DXQ++ja5R@vger.kernel.org
X-Gm-Message-State: AOJu0YyCH2ircWbbh9JISNCauvGL4wEyKqiU5GH7kL36eQzk3MnNWJ/L
	bklefr2xfs0CvA1VMZ3Wl7zAbmh//92qq/z8qvNNE7SuZ1zcdxgY4hjuJxsfft5+jfNRDMKJ5oZ
	m22JQfmmL6veW0Cc4qacbi6ui2r5L8WZfC9tmaI8EuFBzDApPyH94WfvueLaLoePIWUHB
X-Gm-Gg: AeBDieuIa8lBzvyxXWSov9mykBfCBIT2azfohYOQRStMjPFVl/iFVjafovVbEomif62
	WFdFCI5PkTNxvZZEb8tEXuMJK5DQEmxQYzzpfFz6OkNqMwLcl59OoVrdc/nFQungtJK6h68QlIO
	kPEDhyLRcZkRx9apK5oImh73ZJYSoMJ+tteklMcSnOB2pZ1XPktacYjlaT6GWiRh1ITB3xeuYt2
	FnRhWR7PHK83sYPUw5J552PsuwPf/fxWoyRVqYYp5BXCAryQ8Oudqhka6TNIliF3CWGws5DenwM
	Npa2Hb8QXAdEs7g/Np1RNIdpomrPl6n8Le5to5bxMapJvRpOfmgj/UQ20WoOG/flpPQOsg/O7Dn
	jerDXkReNd0vlaDCZKX7up7w0QC+CWZYEny3eAPTIbiygZrfTP1hH/bAqjrQNrj3Gp9P8Ybtwkv
	o6NYnMtoK9bHsJt3Le9JFJazC4wj4UV8DWuaNvAE/tjZtlcw==
X-Received: by 2002:a05:622a:111:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50dd5bea3admr221653461cf.43.1776103732929;
        Mon, 13 Apr 2026 11:08:52 -0700 (PDT)
X-Received: by 2002:a05:622a:111:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50dd5bea3admr221652731cf.43.1776103732311;
        Mon, 13 Apr 2026 11:08:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3fc9e668asm827776e87.26.2026.04.13.11.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:08:51 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:08:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Til Kaiser <mail@tk154.de>
Cc: andersson@kernel.org, linusw@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: ipq4019: mark gpio as a GPIO pin function
Message-ID: <yvwne6bgbtofqrkb2rl4akv6uzqp4gdg4gug4dfsncddibvxek@mm6losfiwyup>
References: <20260413135234.4067548-1-mail@tk154.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413135234.4067548-1-mail@tk154.de>
X-Proofpoint-GUID: m7b7fTxeqw06AC3ZxNbA7r7Db3YhLIMs
X-Proofpoint-ORIG-GUID: m7b7fTxeqw06AC3ZxNbA7r7Db3YhLIMs
X-Authority-Analysis: v=2.4 cv=HKXz0Itv c=1 sm=1 tr=0 ts=69dd3136 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=fUG_z5zisV57Vfcd-u8A:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3OCBTYWx0ZWRfX9drhoz7fD9WE
 ssARDKKGr226lhHUCEGbTIFKnCJzT8jUPhEGCizc1IVqADVgl8DYZLEaSJB/FI43lbOs0UE6TkU
 P7ZoclmGNlRDqKZgdkj9zLKY8kq6dcuXT+ZCgPeaBV1OcFYyNBg5GTLxnPBxYqs9ZDBJ6i03Gp4
 KtW+u+dW/RxKDkWBEFw0OHgQTZPv4V3jU+hWek3zsfgaEKispyRaqVv0qr+fm8x84ykNI0wJlUX
 5wjygMwi4okrDayd5FUsDO5MvZ97N88QieGEejiXRLhKMQNzAMkv3ImaRsyLuCDoNo/Z7ELTwJW
 gu9GG0olii6vZHYiwBpxaiw3MoSOF13Y/oQn2LJ8z2SNnR0VAhep7JSQXdqxlBP1ApvhQ7/ir7h
 XNv2TFNCvONN0fI/TNPkNg412sYDDl+XKtk55NXH/LmsMr//SNP6OeGfIwpiWLzs8klEbOGv+NK
 x2JM6E51N40OqdFQDng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130178
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102988-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tk154.de:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2F8E23F1DFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 03:52:34PM +0200, Til Kaiser wrote:
> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
> 
> ipq4019 still describes its gpio function with QCA_PIN_FUNCTION(gpio),
> so it is not treated as a GPIO pin function. As a result, GPIO consumers
> can still conflict with pinctrl states that select the "gpio" function.
> 
> Add a QCA_GPIO_PIN_FUNCTION() helper and use it for the ipq4019 gpio
> function, matching how the msm-based qcom drivers handle this.
> 
> This allows ipq4019 to keep the GPIO-related pin configuration in DTS
> without tripping over strict pinmux ownership checks.
> 
> Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
> Signed-off-by: Til Kaiser <mail@tk154.de>
> ---
>  drivers/pinctrl/qcom/pinctrl-ipq4019.c | 2 +-
>  drivers/pinctrl/qcom/pinctrl-msm.h     | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

