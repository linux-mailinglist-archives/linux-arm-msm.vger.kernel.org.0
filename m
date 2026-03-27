Return-Path: <linux-arm-msm+bounces-100491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOP/M9QLx2k6SAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:59:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B23634C2DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5DD53028675
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEE339E6E4;
	Fri, 27 Mar 2026 22:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3RUMpUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlE1sF8l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EA336AB76
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774652337; cv=none; b=SbmQc00RZvEMySPw9tndHkI0ZI1ZTkv9FdwiDUzBN+Bp3D/Jat1w8iHklH2KPwS0dWkP+qggTSAOR/ZGrTudvxpxiXHy5iNT8sG4AiEME+1PPWGmGEQouamfpV/lA/frC5zhp1c6olNOrwEU8cemeVu7I6i0mF1DQJc2bsrqLYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774652337; c=relaxed/simple;
	bh=mOzK7YXq1NAAIWkYQZTgBV/ApYcbFSPmYUFy2XqonT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwXFb6H2MgrJja4LJHXhlbbjoKyPLh2UPlGGEv+jFQvjz3fyRCpCBmpcB4v0RmLGgADxh3zVBtVVfhS4IrSYip7UWbV2XDA9F1FXMxrJOGY8bFxGlXHbtEFiiR0sHJbZH7Ypm7G/kikIq5prG5SysqJlNfuFIjpWr44vwFJefl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3RUMpUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlE1sF8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RLg0VU2239231
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0HasHbQ7U+CmeckZsO+aDEKW
	CrV/1CPpy5fZ05F1gXk=; b=T3RUMpUSy2wWFZf5tz1/4GjAtSbNtg/sWrNJ/uHY
	yDAFhfuQo2WfR2fz0VzRBbMcSxFAbe5HXJPftZgfPJgFssqzkpmOas6Biqj6bmoA
	025lGTQxcTevlltWgJgDPiERPWLwhG7Hd/ozvVloxwOpPLz0ozPteKitD2YPfYfc
	bSV4tSLyXKBndBidGo+N/HseYyvhB4zjJkyT1k2TT+0wOGmBcv9mm7kUm0vu8ybg
	LBcRlzpf5za3+a+tsLO3bVFJUhOrKKm7L0mvxZKs6G1OdPfn6IIpMqXL0mJGC+yS
	IUs4VVNZ9wlCjAMtuayejU+jzjx4IRcK3fSN8SYBqirP7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vvv974g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:58:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso119293921cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774652334; x=1775257134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HasHbQ7U+CmeckZsO+aDEKWCrV/1CPpy5fZ05F1gXk=;
        b=VlE1sF8l9/IgmaszERxqGQMZJNuz4n/38IUDVuLjD6K4dp/Pz1gWkvbDTbJZ2X2FxX
         9Kc6SsLw6kw4pZ/UTzqCU93F3jRX3DPcs798kHHNAZypr0Vu0ZOo60niNkbZsbXZ3Kpc
         +iy3v99/AKdlvHkyOnTGFWiDfa3PZGXPVsM4Ld2zFKgyOj9U/oiu2Cpg+iX7TcHET7qd
         4M7e1aK0Vrvg6atd6HgIJF8RDWi/Ob6capRARQcVsC0UPRlvlqGdN4PsTxYDzs4ocafy
         8/wo5LjY8vI265k1kyE0wwBU/go9z8Al/Tkkaef8dgrJfjbHzoMrAsChE9iQMmxOcskL
         Tk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774652334; x=1775257134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HasHbQ7U+CmeckZsO+aDEKWCrV/1CPpy5fZ05F1gXk=;
        b=J/eWr+iJyrdOWP5E62cSaZgFpudOk9kBH68eOzxRxrUJvT40ZKp0IZxY2py7UKUSQ/
         geEBKY0bLimYPCgbhsdvw+ZfL/rymh0nTkkVas75mrkrXhrqHeTkUy8EVQMq0zRmGYJh
         b2K1YXww//mkHA5XGWUXrRgpbWABHuor2H/HfCNr4bXregLHk08p293HTF/nDJ06f16P
         tApSGnGguCXkLmfSHfUX8Gw/WcrfoViaP20NOo83wTIFTU0aPRvZcPpDxV7+ty9rSseW
         P0gfA0mLOzXqAyEohVnmNp2ijxNUZDv6TpXA+55iPfDJp9ni8d95QjuHjCuVyZMcW+//
         S1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCX4U9azciHx/Bfvtn1hqfLtbowT/ivCH3FK3VxKSg/ukWgoJ7WsKcicLOAXHzfuZI9/DnMzafQOskRIf4V3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0flxV27nA/h9dh9ZUg8wURJmJO7URG24FjXuTqvkUpthRMFm2
	+5PPglHiwItn4FJdlJv8TTDig4G6Xat2K4yy8XsQtUqjT4++L0HmESSL8ubjNBQH2y0oLz7BdoI
	MCVJMT6ivzCo1kIeUZFXg/3Ze168xupWJj8aLpoGYrdyiFZ19219wDP0/Ke5p1LKB6WWt
X-Gm-Gg: ATEYQzzVCQBmvIqhEXZQ/3q3ZxxDXWLLCDJKIyBRdjahTA/m4AJ4hXTeRddOQ9dnN7J
	Pqu6VYgxxIFpmh2g9uMYIBiwaFPLL5yNphbqm2ha3t+b5xJt6zKlCjyfy5mbCUcs0rWxn7Dslzw
	1lRFzf17cZPSIIDdxUfLw5IEFGlILAxb4pSnkhvXVGd7S2Zg4n+CprRseqHOThJkKC1Z9l33h8J
	C5+NS3xS7Y0bEB0dG8M6LCTBeYWifzEiRzPqLTBIkqYCEBIAlM+bbknyTEeU82ad8oaT6ftJ9n6
	zwXdoQJeQ6ojZcELDnupnQy3vtlWvq/seopCiixMClQRxqVXYrR96p7VaeH0uW1K3d/ze3s5OYt
	s2rTxrDJRAndZFBqsyJKB0DON1iypIQRAN0beS6hv+1vQPKGYU0DEjABJSfL5wlnSgzVKoE97FE
	oF7zeq/uadgCCytZk5vURv7HQpXOY7789px2c=
X-Received: by 2002:ac8:5a89:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b994a2ef2mr90546521cf.23.1774652333897;
        Fri, 27 Mar 2026 15:58:53 -0700 (PDT)
X-Received: by 2002:ac8:5a89:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b994a2ef2mr90546351cf.23.1774652333475;
        Fri, 27 Mar 2026 15:58:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f431dsm72435e87.10.2026.03.27.15.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:58:51 -0700 (PDT)
Date: Sat, 28 Mar 2026 00:58:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 Hall sensor
Message-ID: <skmtzw4acdrlovne6jyryurxnxwlgieqtztygzt6u4i2vchtez@edd3a4576ecb>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-6-06edff9c4509@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-rimob-new-features-v4-6-06edff9c4509@protonmail.com>
X-Proofpoint-ORIG-GUID: K8XffkowDpvNhwhVlq2C4oU9AEluAQN3
X-Proofpoint-GUID: K8XffkowDpvNhwhVlq2C4oU9AEluAQN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2MSBTYWx0ZWRfX/ueJJf9mKciJ
 LU+B+jQCbceMyBpy6tvKQU/Zv3H1Bmcnc1UO9xagy9ZXm7mP/d4V/o623vKwVAlrTaUvEFhGaIv
 xZFVH7vRgkqT48cuxoIryPOs2CQ6bma7eYIvKqgX58icMmTgQgQoAY/GvRqyUevQsyeIQ2XQkUz
 Yrgp9BcKHRo+nTxMY9TqTi3EGJL8Sc4skiwdW+bAfkVZCbrs4B/ZnI28kxGJXhfC/HhcmSDkT4P
 2tLCtjGWej63oKwHKWHQ7837Lwn91vNHraWk91keHKyhChj1UPPn1R3LHBO5Ysk7S+tW5G88HwP
 xZoV2NjdMtJedaPUa8abUIZ8OMDfhVnNHfif4rH3eN7bdahAFfQ4dF2lV7G4D4UduQvCQ8CzV5t
 lZjp1j1ui6n8Y57IPNmf31iL+3QY5mzY9PmuQlUKbhwwz1LV4tDl6mXJXDkgWvhF25DZoRQ8FZ0
 BJcqkDjb3ubegeGj2eQ==
X-Authority-Analysis: v=2.4 cv=PL0COPqC c=1 sm=1 tr=0 ts=69c70bae cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=wzU05Ad-4HqZ1xQACKwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270161
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100491-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B23634C2DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 03:30:52PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Enable the Hall effect sensor (flip cover) for Billion Capture+.
> The GPIO is mapped to SW_LID events as in other qcom devices.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

