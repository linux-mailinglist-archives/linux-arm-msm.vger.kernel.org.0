Return-Path: <linux-arm-msm+bounces-108070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOABF/oICmrqwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:29:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 066E15631D5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98A423006B62
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 18:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73E63B7B79;
	Sun, 17 May 2026 18:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Te4+IUwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cb9OKLrj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93070286D4D
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042453; cv=none; b=bjc4kCGc90lb3D9aHPUoU5Hz9z4xG+lhJy14CHr3XqiGewSu2yCbd6z7PEXbbxTrcu1mkum4NMU65L+wFrPt5qlMZHMsNW8fRG/sPBpWSvadLa3gdowql0rdK5zyruRVc/jFphpHeeiXyaVh6GG7H7XSquhfHAleZTa8gDLM9bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042453; c=relaxed/simple;
	bh=2ZDNlYVmlLZdSWfLY/UOa8sd5nzN+jLOhR5L1W/oMSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Coe4l5Z6oy7hVLbuD3vAY1s+ZuAVGWc+mkEVn5rdDC6hZz1gcVVdtxOQiX3Rfy61wVG8QVV4rC2qiS2YQ3cQKalbP5MZHU4xb8CsAPo3WXl5m85Cfmp1qGnK6EO/OU536yByh9fPbBTpkNtUVTGeZ52tq2He9dmYSCrZo6WOSHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Te4+IUwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cb9OKLrj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HANBrO2216526
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tvhDypip181MgNE/FhA+175W
	lWlikDmbimHRzVl1gi8=; b=Te4+IUwNEZ8mjptcl5doMThT/IZ5OfCftPbljn7o
	WyLt8v+uHRJurmB0v1L9RjfXA+7bmCpp/lFNsrNm/Jk5PnDIqcuOKzkAuR422K1f
	qV51fLJ3YIajYBuIgSlrQE4wxkuDXP9i3ZcRiIPndJntNTMhVJ0kOyIxd4iWaKQK
	Zd2rAtLieoTC7KbycK+T12v+P9OC8di+OwDGexoWC5YXAuNSeeAXeIVCXRzfc17I
	xVL8QEqTHJA9hPL2SxKJxiWWxuqfv8qwnaJTNGHQGH7daiAXUO2B7lKscgfTxpm/
	nHyfPALNChkGQg2T/uZmZNUHzPBrdDrM63d8dRcp0O5i/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7u9b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:27:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514551d5f2aso72425541cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779042451; x=1779647251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tvhDypip181MgNE/FhA+175WlWlikDmbimHRzVl1gi8=;
        b=cb9OKLrj0jUcA5FOgo3zN9q7qXWoimALo2XuoRDaykVS5rk+MDMDebx9tH63d8k9lQ
         KlGAn9WxpuEOvNsoFRPYxLMf0KBSyRgupCuQG7Du4fWGZyf/zTQph4liqjRReKD/TNJ9
         ynw0rkKN7Yyo+yuv8tYbYuuLJCkK0eLQ0pKAk7CRLDKWM2J4+SUoJjr0BsTLuKZ19/X7
         Plohge0LfXZv6fGTBu07fDr1j2ofWJ6QJkfcdoYnDJUdO/luGIUJSNndXcWwzecUjOsj
         TbitKUJtnnVD8v6qP+J7H09QFqz9nIh0xuMGINV3beYHpBMXcU8oFCPdSnG1KbLAL5sX
         sRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042451; x=1779647251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvhDypip181MgNE/FhA+175WlWlikDmbimHRzVl1gi8=;
        b=BNMeQuFlLLlBs/eLCPl+WIkWPvgBoIcPw0GkgJ2UrTSYVJb9CRQeXH4nHg1Pp6HTbB
         e93bTSkblavHh70GORVRJGqIhQ/2oL56obv1GSBOcgNk0ojyTg9QrPVuTncs0GXX4M1R
         pBJgDiatkoHFTTfZa2GDuwyPn0kjYqkg87DR2wsrg0HuVS+xWiB4aj2rq9bzzLVAo6zg
         99kfkx5Hsf6bwaVHJKq3j+SB1W+R/GB5Hnu6sTIdegmebRl1GF3q/FfUsrVFCPlmFdE6
         cZizwTlS7eNdswuQFpDqEMDNX4Jzda+hAKCL+j0+Dqwz1tdimWFCJLIbscsmhcrh+/KR
         0mYw==
X-Forwarded-Encrypted: i=1; AFNElJ++kBilFtWzMVVPK8RQ9lrDCaJIr5f7OhevFvcxAj9Jv40MBsk+eaWOh0SGHouSa43at+geRIwTpqGRLSJV@vger.kernel.org
X-Gm-Message-State: AOJu0YzTvN9kQuAqdLPICuxlbOasc41IbgMGgApzrd3ioLHFQFLj2m4x
	gEFaRhm6jIqKBQu8xHnP+8WlQz/zR4A6joFw2DdgAKUNlRTH6/aiT/uU3gu6At4tcqzjX6myCZz
	X+LPMchJrfYfDqQxxZzsZ1wcuXLtfWtFrJL4Cp9rWwRhou3/PKM9nQUnWk0Zr91XiI6A1
X-Gm-Gg: Acq92OFgpPdUbZf6js6rBPUdvmFB6jFOsGLaGfBLIOkC1eg789UGTys96PSh/+N2p3I
	KhPq8KZstl34gdxEBx+96hwtH75AwEbsXrrqmxyf2Zwp2UZnvqwfy5c8SdW+ChZo4+qmhKC/ork
	3jfk/wKq9fGuABz0OpNW63DafqAtehsjlnclI0ND95Hj52Rk9BMjEou2vRxnoaCR1vD9GH9v3pM
	fL7ohRYMrUhUFMtJLWTfPvNgw05c6WeZU6tulG0G6MlAPmTgzQflW0j3DqsiUSIBWhoekRKTkXO
	pP2/Q1++5Hk6HgcZPI1+hvaRAP/D4nBd04TTFaCbUeyGRubU984oPesmtNLfZdN/emJ3rv1bZ4M
	80RUwA097i21NIggRGo3h4r2ugepyAfRxSRFpXSgls9iTlDGLkujBn237+WsURp2CD+uWzn7eTe
	hfx3pt/POrZ9SvrPPSz5BZuRTOMppJBKNlMXe6mtOzNor45Q==
X-Received: by 2002:ac8:7d0c:0:b0:514:5d88:8296 with SMTP id d75a77b69052e-5165a20a2b1mr164230391cf.52.1779042450913;
        Sun, 17 May 2026 11:27:30 -0700 (PDT)
X-Received: by 2002:ac8:7d0c:0:b0:514:5d88:8296 with SMTP id d75a77b69052e-5165a20a2b1mr164230081cf.52.1779042450453;
        Sun, 17 May 2026 11:27:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164ccd7dsm2854539e87.67.2026.05.17.11.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:27:29 -0700 (PDT)
Date: Sun, 17 May 2026 21:27:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konstantin Shabanov <mail@etehtsea.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] firmware: qcom: scm: Allow QSEECOM on Honor
 Magicbook Art 14
Message-ID: <ajh47mdxlgk2dmedqa2a25yk7dgpesjxi43yaw6taukpcikzsp@c4423vzm5v6f>
References: <20260515172926.16597-1-mail@etehtsea.me>
 <20260515172926.16597-5-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515172926.16597-5-mail@etehtsea.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5OCBTYWx0ZWRfXx7RilDOD9gy/
 uwd67YMaub8HQcXrVEsSc6L/I5SmKm1ERDkWIcUdksM7NJ90oHVbAuC+qahOzJ7TT9LdUjSwDIW
 dcFIbyJWw/tGwKUXkLBPzcc1Z68r83uaiIK9uCU2R5UEGzpnLhl7oLMY2l2fB979mqVsBcnaEtM
 uvQM8qfuph69C17//LN8pPvBL8SR7MTUCLCDZryg6COLRyLixpffx3Uzvx+Dlblg+psUU4ODr6j
 enhxsL5SihYdeb5i/Y5Z3hqrwk994azrxBtk8luwEWu1HHo9xKhxpWwLpdCUHctTNinr/9X+2GH
 fLBejRQL5M/5qjg0bh/Wso0MEg7crhiXuvfEqg3Rlfyh9rhcf3wxXfalE7eRTREJSpscxHMrOPM
 ungrHAuuOZVs1oOoaoQ2QFpGmxL8swKCwKcROM6n0vT75zZRgkTMfFT0UW6o8tLPhH0FW9rmHYY
 gbVTaIMg8cNhLns0MiQ==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0a0893 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=UEEIgp7Q3dRGVmyLxMsA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: x7v9iHKyPoGpj907q_bImLjAXPXDCIyK
X-Proofpoint-GUID: x7v9iHKyPoGpj907q_bImLjAXPXDCIyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170198
X-Rspamd-Queue-Id: 066E15631D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108070-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 12:29:26AM +0700, Konstantin Shabanov wrote:
> Allow particular machine accessing eg. efivars.
> 
> Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

