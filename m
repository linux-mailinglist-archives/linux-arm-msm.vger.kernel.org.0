Return-Path: <linux-arm-msm+bounces-100619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBIcCw5LyWntxAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 17:53:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85390352B72
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 17:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83425300BD99
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 15:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA84B364937;
	Sun, 29 Mar 2026 15:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ghppxhz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qy4CqwGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C3F36D4EA
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774799480; cv=none; b=DerJRh1yXeJ/Ew+LYOtOsCJuA3dLrgrH1EI3cHbtjPBAHe25FtjqTo/5yCXcCaUWEDptmMaRcNQ3TrxyIILukVbsYm80exfxzYBQq1WMW3jJ0XOjqwRZ8hLHZVM6lndpKGwk0b1HRm85+dVfiWQfLdJAQ386OAxY84yQsJtdTjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774799480; c=relaxed/simple;
	bh=2eJkXHOIbbRbu6BB4Fzky2gcZpiRh8tGPD3ppZUZ9Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAVbJXNqePZPik8MzIcl59r3pyjdYakhsZYD5guKb3brHUbyzD1UsybVbaRdhxV4tSOkbYTZpz8iJ3JqUzppyiX59f/9ttzb4TIAPYbAsbYA8g/DMyHGn3a0Q71Oth+DrrJfKYXigmEyqeIYnA6pAep2seJd7U+eNyKXNqe2mLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ghppxhz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qy4CqwGI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhoc8581263
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 15:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+XFKuPsubpCNTnF1xZlcgXY3
	EdV75Y5UQd0HC6KEMlA=; b=Ghppxhz0cewlrm+xU5N73BddzzJzL4zFWUnQgLaZ
	oV6UxWEEcMyQzO3IueRm9Jykw0oT3RhXG2qZR/KJh0naNjrbkV3KmoI4A2/IvzNQ
	RkQtm6dZqEhq7Pd614O2jlBZZtNsGicUYPSXdT2yHUquemPargpJM8cIPxPuRQjA
	ZcnW5QOobeilIxQTpP0Sw0pedHSMP2iaVYhIUeNTf+wlVi5vFOhaM1bINHMZFlKa
	iEocgYF1/ihFECxwyDGhSOb1T9zG+omGxteROAm8kdig6bv4aWquA3Qn6+7dUyp1
	kTeeu8ILtECPH+yf98EkbQnl33dKmvv/oCddauwRZO06lg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqk9bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 15:51:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50925fed647so121181901cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 08:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774799478; x=1775404278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+XFKuPsubpCNTnF1xZlcgXY3EdV75Y5UQd0HC6KEMlA=;
        b=Qy4CqwGIvKlNiegYOxaI7zH6/u8+yCtP0UtvWMM66YR7StfxKkg9ezE4zPtJI97ca1
         Pem7WGMr12wk0lYkIc5EIVI2jXiau/rm0jQDNGIpeP2pVOVkndr5AiRDcpTCmOA0vurp
         xTnCXojODkaqZVNzjZ6V724mj4fy8k8fSoMLvdJh5T5car4X8oayvYiYsQjSdLUeK7Zm
         esBCONyOUicDFtYryOrZXgxVTpoSOST5IYkWm7d59ayzKnHxfRKdqQP7UG+1QO9GtXiq
         qd0Q7H2LtEiLdBRlqUzOpxJnNtlesMU6tQCi/0CkvNmYNytWnccsRiKd7d73MqLobZoM
         +Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774799478; x=1775404278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XFKuPsubpCNTnF1xZlcgXY3EdV75Y5UQd0HC6KEMlA=;
        b=d/t1fq7Rd4AOGCwG1MixBnniapNkXIZyJb2NT8zsSPWJy9NlpPYeRutNtDzFhsKOa2
         bhqOwUJGLAjwiiLfvIWltKKmZjPENpa2dVnsHLgveGdOj/Detth+TPs59Qq2sEQCQdXR
         1QxNiirJ2g38x60tjXBVdK/vEAs0DFp8S4LGc62gOr6pIno5cTJT8CzNUImPg1SZ3Fuw
         TLWexwR0AaVevgeANJSt8gFxkH+4zGbyjygUJbglAAewAsWPV+O3wsG1GWU6wKVKjlTw
         G9acHZw3AaG0M5gDj/OhLb0MevrlwogI9HvFgQpXJltPfDMZqZVxMDkuRmbnIvTiqd8u
         Anuw==
X-Forwarded-Encrypted: i=1; AJvYcCUvetEV+rddOIfN2GlktFHUP7Jx5I57kwLVdvNXOIbQq65YBq/xL91fkq2pgsUMeQ2V/hFFMsc5GmScH77w@vger.kernel.org
X-Gm-Message-State: AOJu0YztafedWpjM4+LtSZy0MIhNTvIc5dsuUqoEcrZnJzc+YbjbNJD4
	f87tkSd1Z55cF5/PCw2/jMQMmycuwGqNW9QkxgFtMLmJXMUY1Sh8yq7nbKa0/sw8+3qZq6r4BoU
	Pq8hfwtKuTnxiOurIKN++AzXt58fxnorrIPhTw0w+C58Q6RyYRYL6ixzgcrTt87vSOBEe
X-Gm-Gg: ATEYQzzGz2YLWtB72LVD+HRx7X5g4qktRgNSCIO3imB3/0uRo+t5uO7aldRGZyBTOav
	pl1qUuKL23O0Amp9EeWpoFkctBviprAtjdB9LVcQCuHvUTG0LorRJe8yZrOSYoM2jWZ5OGxxxE9
	BVf5OjfOa/ukHLLflzg7cUiscuu2i1BP1G+va1HO5s3STxlGaTHahlESV8oU2zRVNaGuvB1nMZJ
	h4xBZuXSQiFLphYrK6M7BTXDE3hjy0zmrs/2EwbYI5xk5bWZtj2iIfejXdzSe1SbGVubxgVBYBy
	v5GTm5saW/oY9UFJmNBFjdouaiF5xMMRYwmGvY57WSX7efBWlxhIiS0ZgO6cJrc/0CH5ClEFezE
	rkIiWjhmHXgiIDHUS8CeXEsSDMfiMJLHVpKujjhS7v0DwTwnuZ9GP6TQaxPJvhG95nd/oHVmhJB
	Lx2ZhybCIPSkNAAu2vuyNw1ZeYJmSKULOCzU0=
X-Received: by 2002:ac8:57d4:0:b0:50b:69c2:b86 with SMTP id d75a77b69052e-50ba38b7f26mr125930411cf.27.1774799477705;
        Sun, 29 Mar 2026 08:51:17 -0700 (PDT)
X-Received: by 2002:ac8:57d4:0:b0:50b:69c2:b86 with SMTP id d75a77b69052e-50ba38b7f26mr125930101cf.27.1774799477136;
        Sun, 29 Mar 2026 08:51:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838b8db8sm9767781fa.29.2026.03.29.08.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 08:51:15 -0700 (PDT)
Date: Sun, 29 Mar 2026 18:51:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci <cristian_ci@protonmail.com>
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
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Message-ID: <s6kyh5wyamcxyd7xsbu5wrrpndpdb5xhxapmxze2qgblng5eiq@hl36nzg2lldg>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
 <us3ps4bgf5ekk2iudcgs2wa4b5qd4mzokec4q55pmhb6kvt6ht@qm4mmzdai2t2>
 <O7THc5h8ZhgzNpklYKTGOnEZKlN4BtHZHjKZt2KErekNb3E-hizt2dw7xuJ8G6giEyivmvC0f6-eIfCT6fJkUA7_CVQwhAktCXfBqAVV_Zo=@protonmail.com>
 <o2sbqzcix74u46g74sil2c3b6mgd6zsrmafesoqltfbbrzqhjh@uochk3so46yx>
 <VRCUEe2qHZa0a8HzVvhoRtAZyXO8pBU_l96B6U1kL5EFVSJyQBfYeKDvqPit-qpPRtIjUbtl7TH0JegJ7LXvctAxgyo50K6rTC5hwNjuV5k=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VRCUEe2qHZa0a8HzVvhoRtAZyXO8pBU_l96B6U1kL5EFVSJyQBfYeKDvqPit-qpPRtIjUbtl7TH0JegJ7LXvctAxgyo50K6rTC5hwNjuV5k=@protonmail.com>
X-Proofpoint-ORIG-GUID: 6N5Oe8naS4rMuKP1Cv8GkqiUuDXlCSdz
X-Proofpoint-GUID: 6N5Oe8naS4rMuKP1Cv8GkqiUuDXlCSdz
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c94a76 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=j0FgyEIfbjhtT0SB758A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyMyBTYWx0ZWRfX5ZYG8IPtsObt
 vdDl6CKjcwppmwb/6tZot1F4V8Nej2XNDko/Yr0UmGcj1AgjR1qhgslvH7tNslBpfNYGSgQRhZz
 x/na05LtpOAUnUnkvjXE2WUMKU+R0lcJBXz4ygMsNcL2Jg+lN2q/QggQ4Zo2eNObYbauZgaL2+9
 +leF8llxrLzkf1s3QgDpBn2yGl9sL4v1ha/BOU51FThwgRLuQmAyrGt9Eef7oUdv2CQEnjINcQH
 xPCloLd5rLrErv9m5hwmQ+C1DDNFHZl+zCIcs10+bE/aq/Y7Lc8eOluslsIebvM3c11kS2Qu3hp
 zfVkf3H7IJYvKy7PIxQGDpGPEapCQD+qNtIQYxfbiOvF4WjYI7nPourMDNWj3Ra024fP87a/Lxb
 fcJm6J/D7TZGtXwIwJdwcOdG8KhLIzqd2gnSTl3pKP1qDeoaWDevD70XuNC9PkO6R/jY+IRVog9
 rdpv61OGruR9wAitQ0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290123
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100619-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85390352B72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 03:26:48PM +0000, cristian_ci wrote:
> On Sunday, March 29th, 2026 at 12:12, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Sat, Mar 28, 2026 at 05:30:53PM +0000, cristian_ci wrote:
> > > On Friday, March 27th, 2026 at 23:57, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > > On Fri, Mar 27, 2026 at 03:30:49PM +0100, Cristian Cozzolino via B4 Relay wrote:
> > > > > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > > >
> > > > > Add the description for the display panel found on this phone.
> > > > > And with this done we can also enable the GPU and set the zap shader
> > > > > firmware path.
> > > > >
> > > > > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > > > ---
> > > > >  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 73 ++++++++++++++++++++++
> > > > >  1 file changed, 73 insertions(+)
> > > > >
> > > >
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >
> > > I wonder if I should, instead, edit the compatible property by adding a
> > > second string (for the fallback), like this:
> > >
> > > compatible = "flipkart,rimob-panel-nt35532-cs", "novatek,nt35532";
> > >
> > > and, therefore, add "novatek,nt35532" string also to (patch 1/6)'s
> > > bindings example. Let me know what you think.
> > 
> > What would it mean? I think we usually don't include the IC into the
> > compat list for the panel, but feel free to prove me wrong.
> 
> I've noticed use of that in this [1] patch series but I don't know why IC 
> string is used there (in the example) if the specific panel string (the 
> first one) is already defined in the panel driver.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20251001135914.13754-2-caojunjie650@gmail.com/

That's why I wrote "usually". In the end we also have several
(unfortunately) panel devices which use IC for compat string, etc.


-- 
With best wishes
Dmitry

