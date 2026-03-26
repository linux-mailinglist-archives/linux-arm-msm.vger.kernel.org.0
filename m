Return-Path: <linux-arm-msm+bounces-99987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA9gGveSxGnH0gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:59:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB5632E1EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A4E8301DBBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 01:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB6D38E5EB;
	Thu, 26 Mar 2026 01:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WwBkdG+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FsGH+u50"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB209224AFA
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490355; cv=pass; b=RfmaWP2lTPa5mbB7eDM8mav3rrIZ25Cibvru4aZZ98jtOp46bS1fUUCmmU9ja915ptM2ILXR2ojazK1zn272rv4pXyhCAoBjZWgusBF/j8VvKPNyMGNs8PeHojJfBLt/9kbYIaC0x3KU0NTEmWiWhOwiI0GLTVEC31AxcchUDHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490355; c=relaxed/simple;
	bh=DFDO7VGoKhW9LibtcXJDRr/OcOi2kDPvbAzGM7JHtTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKbJKIP761Z5fZH89EDyZXXvte6UFtonjjjkDNgfIg2yqc6bPNLoUXM4tZgSPkf+4DbxxU/2WsaWJIyu7QpDO4djFxbHfgrmCqWUeS1WssAYBNHV2Mha8JtO6UIDkl+rIkfjUtFxMDM7MxgmN94sXjwOfF6WvCcIwhZNoeEotrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WwBkdG+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FsGH+u50; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PLPDgg1061708
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jPgKrOCs8BV3rkHFf7zJrMHg
	/ajlW1vtOsuJgIMhY9c=; b=WwBkdG+bMNAv1+H4wYjSz+Puf4Hojd60sfYMbVLz
	6u7s1GcBAeZuf7rFY16XZRNNen6tUahqZmtZfxf58grsNZS90izuJb9GyiJNwA6l
	jyUtMU9c9gJrXpHrck5QXhLaP9mrc528Jd9uoA8GdtA9jR7E81ExXKHhYrVut73E
	4cXbuRf7ecmlOPp97UnydVYHUSGS0OAIeX3tJ/pfwMRH6KAgVVPs7d2FLHk+1Ddp
	FBl4Fp4U4exKCbvqP+V60vrbx6Lk00MyWfKihdu/ceUYWdPEjIB+Btbd/DQ866/+
	+Xeyo29QlF7hT/ik0vreVZ1XWS/2CHif9EzUZjwWwX9YSA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qksrmfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:59:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0601ff3d9so7254955ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774490352; cv=none;
        d=google.com; s=arc-20240605;
        b=PoMpIHacB8GAnMK4es4h+l7SOtarhAAbmhdkvsELSrteJSKHsUIRXyq6829GrBzyF3
         qMzzlMlXyRY7Iw0OVku5wYU6Ts1xi260c/Bp/usYZjfEcOsD4jbJXHapbErJCMsCFreN
         LXsFklvBBjf/r8BoYq/m6o/oNluk85sQ+L5nxcm2QUaCScevdUE0gnMHeY1eQKfGyqji
         3fgN13FfGlkNpjC6cZ3LaImkkwTiuzKvB+LEiJzDMCFWswf4gQXrpQUOExRvltTZeq5z
         8+KGmOgadxySO/acqp4wK+posexgWtzayV7r+y93P6i7doqAoIHfW9CDAJhp/BBR27rD
         Qd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jPgKrOCs8BV3rkHFf7zJrMHg/ajlW1vtOsuJgIMhY9c=;
        fh=QuxO9Gbgm4n+XiwYrNOA4tzcFHZvVSzeO05woDtzhNk=;
        b=Zh8Z3VqL91adn+HIbso3Ckgx1Hae+jCA3x3I1vcYmcGvmpqmj9NUtRs+kD4vPB9lTD
         /pPGm2O1jrJF2RieF9FgFZ8JcS7CIXaDYfHKdSyWEa916+1Eo/BBY/kyjiKysTuyJUfO
         iM93Dbf0gYi4yNKHYQn+3oSWFgn168a1NBeYF8FqH8S2MqiIvv7bXLRUZHmnoJcIMRgQ
         h7BYr5qQgmq0cj0Bs93kzAeKa2dXv1rc+mWfCRhErLVzgAVNO+qNKzibHJ96QeJrN8qJ
         6ZcKRrCdngjTr4yrzHXiE8dzgPcPWvlM1FhTdwA+OqWf6wh9xOMJsuwsLE0E2/WQSvzS
         rSHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774490352; x=1775095152; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jPgKrOCs8BV3rkHFf7zJrMHg/ajlW1vtOsuJgIMhY9c=;
        b=FsGH+u50H7hDfd5eY6SMzZf2ZvWyoVTnMNCWjJPTLS3kggeS/gFVcJBGGv7yziQsyS
         /i6d8hUCNePgWlYN7hb7tHmM7qW204DP/QnUdjnLIqnk/uyeTcrkOZspBM9SE7n77Fc8
         teBXf0BBTs+xTbv6mZBB527yG3Dw00KW4O1XrMifTRStePSGj2lATMjVECwswLN+l5XT
         apKNXqYLhwjZdLf+4yLkWcy/2Pwt7749+JZrnLITEEPo8EPEtCKl5HzZOfiHBhaN+4ha
         sPusz3Rg2PTtRTOPzoxQnmhxvnlfrz4sYKGx7cSz07nWGF7SMyV4kTb9Go2j48HizDj6
         OKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490352; x=1775095152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPgKrOCs8BV3rkHFf7zJrMHg/ajlW1vtOsuJgIMhY9c=;
        b=hlumOFZDjdFSfFJHpDFtarMwvZ1Z5EoZAoU+KnjGDAPWAxVpAE/VFCSEQD/LiPsqRh
         OTHilnj9tR+hu+xkCkuv0NmRjLieUe+wmahNC/gTzq0lRnGxvV/Y8bo+voQR5CpYWXB6
         8sUeFyxQJ+gYqsMdjn7A9HRzoTEawZFlZ0/60MexokmW1S3iBFqEJewQ+3AQFuW2XiGO
         EnugNeSfTBEyRReQIWn2p3yMSwKbstsixA9WQ4GinJVylb9vT4IpNZSslXPFzr3IrR4T
         ul635+eHJa1KTfpOvo8KOI8UwQULCaDFAgsjZgAngysXsKvdGC4Vgf3aOGqnQdIk/azB
         7D/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXb52fFiPDtPVZqN7F1vF7M4hD8CgbOv6WH6S72hmTzx1w0e9TnwO+RnaMATjxHWivIxbDKI2vcPCLGR9zj@vger.kernel.org
X-Gm-Message-State: AOJu0YySDzqWT3LZyJycaICsSuztT0j++UbhumSdkxxwpvtmKVTpSVOR
	y15dC4x9zavtCgFxNjyHp863+hl/RgIiv+8IiVfPJ6Lr7r5rIKUw+N+giSw1GY+acvZ94WvaIos
	UAwoOCqMLfYuK77oRcLW1UusOEW027xsSPtKbFu6Y1CpJ7Ro9nFMUuC7/g80CMmaCZVqk5DaMac
	u6sXgnSnlihyBml8RiCfColOHuffvglmE19qQ4L6HrdYA=
X-Gm-Gg: ATEYQzwtI9VuzNXB+Bfn5jN8A/RrmafOsxrRdoockocCHwV2byPYHdVzYezZey/dvjq
	WeAxsXP/I6ieeGsTAlxOkRDb2g8P226jR2EWlO2Su2I4ujtKkNQxTdm3c2oKpFFzO7zxfTa+amI
	/W9DFVY5bS5VVOtY6iCpqNVtK/X+dWYcEa+pVdSEjqu+jT27FhTviE6f8y0WA5VoeCTyjrkoAAV
	nXIr2NgqqM2aVRZVJFx
X-Received: by 2002:a17:903:3c47:b0:2b0:6df2:8cd8 with SMTP id d9443c01a7336-2b0b0abe504mr63387265ad.40.1774490351609;
        Wed, 25 Mar 2026 18:59:11 -0700 (PDT)
X-Received: by 2002:a17:903:3c47:b0:2b0:6df2:8cd8 with SMTP id
 d9443c01a7336-2b0b0abe504mr63386895ad.40.1774490351133; Wed, 25 Mar 2026
 18:59:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
 <20260119-wcn3990-pwrctl-v3-7-948df19f5ec2@oss.qualcomm.com> <a75f80bc-d2fa-41f6-91aa-8252fbb415e6@ixit.cz>
In-Reply-To: <a75f80bc-d2fa-41f6-91aa-8252fbb415e6@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 03:59:00 +0200
X-Gm-Features: AaiRm515yskxcvd1wtiR9718njLTgP_TuNpDNdd4YtWA6E6jp6B_uzG9KDE4-bM
Message-ID: <CAO9ioeVLy_Uzn7L9MyET5wg8CMR132+Dda5JzjdAB=6vz2NEMg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sdm845-db845c: describe WiFi/BT properly
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>, linux-bluetooth@vger.kernel.org,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-wireless@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAxMyBTYWx0ZWRfXx1fFRzWKAvD7
 YRQ+pfVtBPNX/Iz+zNHu839vZbSzRAsKBxMk9tO9vTdANWY8V3bp3afGRnyg6kM4JZTFp8YxYOQ
 B+0eAtGzh8UlYdfDPrH7A12/2WJ2fO3+dJlAYNbsSPn47/UnstlDJr8+seEozNqGOpxxv1+xGGD
 4ZFhjYUH7e0YOar6AzmVzqm+vpbkeOmhDiVEPShLMYu9jCz8VegDL9qWs4f1kz5ej+ZbRcWspXq
 6YZl8y37nUL12abXaxFglM5TKJIbMuGwLCbWGjg+BPthMfVT/eOqevbNnFzS+pCi8s/2pVbFbQV
 qIjTOkR2EHa/3a6qEToBxLAaiTckYEPqpto0gWryM12yDt++E6hG6VJmrWMWErY3DEtcfX0ImMc
 hLjZ+H+FgLl5uQYYD01ktcUch1L3RlDjdtg1+6DlbBf1griI1oL89l3bSJYxkWTwXat4M5pLS5x
 KecsWy9IRKdLOLG1HEw==
X-Proofpoint-ORIG-GUID: jvlMzXDj4tmBkZc9Xr9igIH5hpcRC9VJ
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c492f0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=l3dzM3eKOFk7Ec1IfqUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: jvlMzXDj4tmBkZc9Xr9igIH5hpcRC9VJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260013
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99987-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,quicinc.com,chromium.org,lists.infradead.org,oss.qualcomm.com,holtmann.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 0BB5632E1EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 at 02:02, David Heidelberg <david@ixit.cz> wrote:
>
> On 19/01/2026 18:08, Dmitry Baryshkov wrote:
>
> [...]
>
> > +     wcn3990-pmu {
> > +             compatible = "qcom,wcn3990-pmu";
> > +
> > +             pinctrl-0 = <&sw_ctrl_default>;
> > +             pinctrl-names = "default";
> > +
> > +             vddio-supply = <&vreg_s4a_1p8>;
> > +             vddxo-supply = <&vreg_l7a_1p8>;
> > +             vddrf-supply = <&vreg_l17a_1p3>;
> > +             vddch0-supply = <&vreg_l25a_3p3>;
> > +             vddch1-supply = <&vreg_l23a_3p3>;
> > +
> > +             swctrl-gpios = <&pm8998_gpios 3 GPIO_ACTIVE_HIGH>;
>
> Do you know if the GPIO is common for whole sdm845, or it's only recommended as
> reference design, or nothing?
>
> I did test defaulting to GPIO 3 on Pixel 3 and WiFi works as before, but since
> previous downstream kernel didn't touched GPIO 3 at all, I'm worried about
> toggling unrelated GPIO.

It is an input-only GPIO, but nevertheless, if you are not sure, just skip it.

-- 
With best wishes
Dmitry

