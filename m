Return-Path: <linux-arm-msm+bounces-111649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6TZeLBc2Jmr+TQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:25:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3776526D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:25:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mON+fA88;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UxPvFmhE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111649-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111649-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91E35300D686
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 03:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C7A348C42;
	Mon,  8 Jun 2026 03:25:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA59231F988
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 03:25:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780889108; cv=none; b=UJj/zUebZA6hJ9PYCjkP0XdO8LdYmrzlsU2RyKyQPP3UTnnRJwsLCz+blUFvGYVLcdI7SzUOT7Xd08GJZ4maNYZCdEjEuCkmfX+74OBMFAAfyO0i6dgQrpQIiryxdW19t0QhN55zKv994m9CgnHb9OTq+VJfDfRziwnnipw1D60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780889108; c=relaxed/simple;
	bh=cIP8qGyldrzLbyY26AN8T0kjp4+Kch7+F/Z/IvDPgec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3eIrzl6ZwaEILjD09j1+CeAYHQJD4L3r8FQwMVYFoH0WKpIL2xpUx7mueXpR3P2kgx/O71qqioXSIEeMA5ZjHu0t6ZrwuSQJOt9jvHSbWmEvgj9yDJnCOdw42T781m/mlpCGoorxLqPRyo6wPbGqyutZHcoapvDycCfRhhOJzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mON+fA88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UxPvFmhE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EVFi1575805
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 03:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S1Gtj67mxN2Td3MIMGJweGLI
	UloxP09bVvVNW3Kq2TY=; b=mON+fA88bwSrkByqbj95Gimpq3a7v08MrKyoXHpN
	P3ZJyHld1BTUnxGwndVx+jMq6BfeQMlBq+J/MlxfgN7dpAwwmJzV/xGQl0+Lb1Gl
	dklXBNlqMC+fXYOOFU/+QHQNhgKsC3xaUbJSJP8UwScx0pOkuw9LKcNH991HxTyI
	k1xoFCl6DtJVk1/jPHaxPpa6NGyal8FUkTvwTeqdYTFN6BzDtwiljJVR8Id+aQVx
	RSre5egCcv6OIRjJc3etw4XqSD25AxBjm2M0aswrGoOARUOeZLxbnM/6RcaY4W3d
	APbGad6ypzMPnYOQBsj7eWwv1DvIEImBRmwnpkkZWymfOQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1dfka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:25:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfc719d238so1691065137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780889105; x=1781493905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S1Gtj67mxN2Td3MIMGJweGLIUloxP09bVvVNW3Kq2TY=;
        b=UxPvFmhEWaLrLY/HAO5TMvjdd/Wk8ajdwfBm0077IUH+RI2PYiWey2cQnGvlp3BTm/
         wix7rqcETDuszMLu6R8gxZE1mSbM0PldaVj+T0Fxp6L9X2RclKtAn/+AgKxcNBtJ0yBM
         kEjH1DdZvULziNh2eiMzg3bJgd88DT58pP7SHJIeCd+CF6aIGP4zBxoJjGqeN9gOFQE4
         KBz1tGlLGZkAjWSASljK0vIvaQQuXJ2rplUypOehhyNGaxtT7uTp1UfLg5CY2W48q7QQ
         jq9CQa1Ze5zGUgnFjOAQXoPjcqHJ96G+mtBE6wSLyijpai0yn6G0T+Ye5QLqZNpKQsZb
         HgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780889105; x=1781493905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1Gtj67mxN2Td3MIMGJweGLIUloxP09bVvVNW3Kq2TY=;
        b=pu+hAK6syNjWpsOpcQudxy21pE1Jifpi6IFdbMWeXpecpaNKutwuy/fOdiZfzjTmRi
         A0mjzOjAY/sL3KV30vn5aIvdtgRCwwBoKORK6WJ4JXnBRK5FGePjoJIsH8djH8QGlotQ
         XKgMJADq/U7gmvIpGve6klD8UBr2p/2j7Qc71n73nr+rDl5Je4inY9z8Kppp7TyIfqr7
         M+20Gku53Lqf+kbvXtFMl7Krn1x5PQRXEEPWlUrfcCyhWnFaAz0m+MaUYAwJz6flqemg
         yewDBd4cO2hwSFjzNyK7NvcomzXJkiJgAjO/ENL49AaumKaGmiRIpi2siiHc7Z/oK1Uu
         h4vA==
X-Forwarded-Encrypted: i=1; AFNElJ+b53h2twt+vN0gJ/okdjk1/QRpkXyG7aMQ2g/PTsym5dHo95LMCzYcGIECp3uD+jI2u7J87HZAtJHijC80@vger.kernel.org
X-Gm-Message-State: AOJu0YwndouaGZCSJ8kYNS1/bCi5L0UQw908B53gCNt15h1bh/WpLhLu
	Zpvgi3JN8v5/+rfVizYWvOpT41HSEkuD/k+L8OLaAOmHfYcuK15batAnKn1h6FZxEVXmGACI3jA
	U1ID90bGp7qiUwgE5n4TpFonmPVW5lYetexTZqWXgQZNJGsOt+mcCBdePQnr8FR0x9uVP
X-Gm-Gg: Acq92OFc+t/BH2avcEvjAUHoa2Kyjx6MXzEzC15nIpJinR18FiSNBSycgJt0H6nRLgO
	hdHSkKlTcJvkX5Bjkjc0IGVr7GiBghNVuoJuUDkGeG3ZJovSbjCgRU74EwQPvUqVtt1SnXIm5rU
	VJyDhB+h9pd2m17HOjxPYnCWwTKauEYOVJpt4TtoYpK9MH3ytBz8H0VIOteFvh6cPqngIlE0SWf
	BXhLMFJDdbjbtuukaTtMmnsLgIT7ZtyUlAAKOIb9qxPHahMM0CJVugg21fjpAveFTwqnldMsDuU
	+3AnVi4Fxpu40DPguY4u9FnKI6uuwaz++I6q45ZfUAuotjcME41Rykf5X/4047aoaM7eVJ2i/6+
	UC7EOtBGYRlq3GFT+jec2aebQQcwAT8SMiB1+DI2czdJR8GV1/JDU5uPQ2A/xYrWRbVhqzQVKqo
	AksB9voWrECjcqoiEM+rQTNTAKliJT5VSy/T/2EfzLkNLuOQ==
X-Received: by 2002:a05:6102:5cc7:b0:631:ea6b:23dc with SMTP id ada2fe7eead31-6ff0294a36dmr6193982137.2.1780889105041;
        Sun, 07 Jun 2026 20:25:05 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc7:b0:631:ea6b:23dc with SMTP id ada2fe7eead31-6ff0294a36dmr6193969137.2.1780889104627;
        Sun, 07 Jun 2026 20:25:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b04esm3574585e87.40.2026.06.07.20.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:25:02 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:24:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: andersson@kernel.org, broonie@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, drake@endlessm.com,
        katsuhiro@katsuster.net, konradybcio@kernel.org, krzk+dt@kernel.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        matteomartelli3@gmail.com, mohammad.rafi.shaik@oss.qualcomm.com,
        perex@perex.cz, robh@kernel.org, rosh@debian.org, srini@kernel.org,
        tiwai@suse.com, zhoubinbin@loongson.cn
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: qcom,sm8250: Add QCS6490 RubikPi3
 sound card
Message-ID: <kdebpjrt3japoyilb5hx6o4k6ne4yqovaiso4i2jslbdviu567@7mffm3yjadba>
References: <6svyrusik3lljjvoo7c27b6agr6ipivjxzeyyo6z5va2qaiatg@g4l3vcrns6hj>
 <20260608023555.3379028-1-hongyang.zhao@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608023555.3379028-1-hongyang.zhao@thundersoft.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyOCBTYWx0ZWRfX+gSxZsRkOXRk
 MGVSqNng5+XKYEh1bKqUK39z7r/4Dlto2sIBV5759t1dkipjEoeC+0BSPZw3xxGiex8x7+T04Hl
 4YX/sZHsvn8eGrcV9vlcd5Z6ILK2QivUInWsUeYmwV1g1ZgIokyJlTQ06yd33UXlHTMJNxptfH/
 7IWvbM9DoShvqp2pvodDR+VOSIGi91VzsuAbKMDH5Sw1pWtD3IDzVI6ocY8fjZFzC8ngFZn69Pv
 29b0bkbBYDMvYiF0HvHzi3kOU3A3DxpiaOw9C7zhWZjKMN3U6mUmQV9PABGgU1qLNRv4H/aBVjo
 t5xfvcKu0wtZs7LDZlOAaG48rUa6nERg5dBogDauDJvM56VHo9HKB1dnR3LkRHvPYEWzAuJdyOs
 FCQNzicynDkRl8b5lzBTCsJK9TmU+x1wo9xuFAAMPoHUS4uy9j+55B6aROY3Qj/9ofQRRs70hTp
 QXCetxBGCGOI5pEl/1Q==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a263612 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=Wdb1h0LgAAAA:8
 a=EAk7pkoZnyjZY0a2vHsA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-ORIG-GUID: 8t6BSH7cXwYl1rJLqGgS5sdoNzhhMMtY
X-Proofpoint-GUID: 8t6BSH7cXwYl1rJLqGgS5sdoNzhhMMtY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080028
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111649-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:andersson@kernel.org,m:broonie@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:drake@endlessm.com,m:katsuhiro@katsuster.net,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:lgirdwood@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:matteomartelli3@gmail.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:perex@perex.cz,m:robh@kernel.org,m:rosh@debian.org,m:srini@kernel.org,m:tiwai@suse.com,m:zhoubinbin@loongson.cn,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,endlessm.com,katsuster.net,gmail.com,oss.qualcomm.com,perex.cz,debian.org,suse.com,loongson.cn];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,7mffm3yjadba:mid,thundersoft.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B3776526D1

On Mon, Jun 08, 2026 at 10:35:54AM +0800, Hongyang Zhao wrote:
> > On Sun, Jun 07, 2026 at 02:58:18AM +0800, Hongyang Zhao wrote:
> > > Add the thundercomm,qcs6490-rubikpi3-sndcard compatible for the QCS6490
> > > Thundercomm RubikPi3 sound card.
> > > 
> > > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > > ---
> > >  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > > index 15f38622b98b..d95e072fab25 100644
> > > --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > > @@ -48,6 +48,7 @@ properties:
> > >            - qcom,sm8250-sndcard
> > >            - qcom,sm8450-sndcard
> > >            - qcom,x1e80100-sndcard
> > > +          - thundercomm,qcs6490-rubikpi3-sndcard
> > 
> > Would it be better to follow the newer pattern and define one compat for
> > all Kodiak platforms? Or would it be possible to use any other QCM6490 /
> > QCS6490 card as a compat fallback?
> > 
> 
> Thanks for your review. I think my commit message did not explain the
> reason clearly enough.
> 
> The RubikPi3 compatible is intended to select board-specific machine
> driver data from the sc8280xp OF match table (added in patch 4/5 of
> this series). RubikPi3 needs different configuration from the existing
> QCM6490/QCS6490 sound cards, including the ES8316 MI2S codec clocking
> and headset jack setup, so using an existing compatible as a fallback
> would select the wrong machine data.

Yes, it should be explained in the commit message.

> 
> > >  
> > >    audio-routing:
> > >      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > > 
> > > -- 
> > > 2.43.0
> 
> --
> Thanks,
> Hongyang

-- 
With best wishes
Dmitry

