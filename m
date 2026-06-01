Return-Path: <linux-arm-msm+bounces-110620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBNBKyCgHWqncgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:07:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F0262621562
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9CBC23014B24
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 15:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C1E3D7D6C;
	Mon,  1 Jun 2026 15:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRqFYGB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amJsCmDn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4233D7A10
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326274; cv=pass; b=LfncT+aTf65wDYEzBW5Fatau+BrOFDTR6XqzfnxXP3EdkBoERev77jc1h9G4Z23dyb3YKHpxHnmY5/wUyURjHWMN/7/CAEYcfBJCmxFqRH3v9tG8tPykRYX3fv0zWbhGmc59AWY+3qeXADE4xZoIaD4ymC+qrH67rXKY5EPN6CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326274; c=relaxed/simple;
	bh=Mp60gJ55zo9v3Xom2jfl8sCdLl+dNBb3b7eef/UakmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OaQVy5IKHdIs0Rq7T9GQtOyGcRfmXLbO8vHI4n345tn2A+wk2JZb3EBWQamANtOFODa3pnO2pp59oYBMAKsyYZcuxy4R2rKlBMzs0eqDA7PKDKYjYW120EoJA33qzemjTBng7EKPMASc96M0PvZBbShlMIk0HSJHJ+SJhFalcSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRqFYGB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amJsCmDn; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fT2h1258371
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 15:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TniDMWPlC5wJVCKXeX8vLCzRav1MdaXlzFFmaU889I=; b=YRqFYGB+4FypsnYO
	TRl3tBiMCsYeT4GesNcXs3gpR/la+dLrGP5tmmOOc1htBjljzs+so4Ngq4r+u0ny
	PU4zWUeRpSbzURkIu7RJGCUB4ABe/EZlZYyDsgVSk2iZZMuAcOezY20zBHb0X9EY
	+/FHTa8uISnaO2D4O/lsz6LgNZ8TOgBDIHa0riODqBMdEAnNVvmx7cyUc79S6mih
	u9Wpxmi3XjejkVAi2voS11s88885vR09F2TO1EvbyroGvidLYa9+4EK1k9XgduRQ
	czdcT34xqcDy65IguEqXl2LjAx+Tp4PkCcVP5RsESoORjmJ9r3oVUb9pbieuyuK4
	TbPbRQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sssk1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 15:04:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914d0312a2eso925832885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 08:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780326272; cv=none;
        d=google.com; s=arc-20240605;
        b=SGSWcZOSgN96XHZuBSReyB0B/0gvMLpKTEVeOfrdd7ujnNP3B1OE79117o+AxQfr38
         sKnRt0JaThVj9KXH5GkmxA5gEBkW1GcO2VpsjYtZ7qzSiQjyMtqAlaI+eCVLP2Y7nRdu
         S1kKRRpOt1kXohzZmdkDIN+V8Aa0AIJCStEMxgGWnnLgcEKw4bpBJlqLRRUXP9IDMG6f
         DonV4avPOLffBg4SW1FRtf2yOSXC0z9LwwPqtpVUxZOdm6Pxt9MS99tSkDx+INYUARnh
         sTOpLgeDljLi0VoG768RuPeWO4JuPt2ol4gBUf6JlNyoTmHMwaGuaeCkUGXb38o+Hx5v
         c9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6TniDMWPlC5wJVCKXeX8vLCzRav1MdaXlzFFmaU889I=;
        fh=jIjrGuqn80+kfwkd+rn756CTklXnRd3tHybXoMy3woY=;
        b=heo7nmBKIxay/9sU3Z6DTQF4HlUzBNcccs05mALnMXgUXXVAO2pKFTQ+3FGtZCfThI
         zAgL8XJGoHZg0N2aBPolQ44nrvSDK0ErMgr0mu+FJ21iI9pmhuKKcDvodKCWBBUwlVgm
         HDzwBA9YspI2hFjU/g8U00/uh1a0WSChD9sgm75TOk37BSbbhGgvrf+2AGsky1WZAmLc
         c4Gu0LH+kKKPB0lWd/qlqCQ8GosdWbQpUCYoT1iN9o3onx4M8ynnlzFmc2BsNVJae3uF
         /Dneh77NTLaNWY7cRe1tfHTPQNHzF/nWpFr/JIY7K2QyV71A+UVsF89cZ5ie/rcTsRKg
         d64g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780326272; x=1780931072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TniDMWPlC5wJVCKXeX8vLCzRav1MdaXlzFFmaU889I=;
        b=amJsCmDnqKN05q6OstVd08lQerQjQNn94+wVmyRHZc9HaBsjbCqC7FCgy1b96PsI0R
         LhEL0moTyWkGI5dwE6qh+rw6mkDE6kUU4Q/0scr8jZzMGV4R3FkFCo3u5fxxx5XE/9i8
         UjhPLcajR5d9rPQ/HGke0Fe10yXfQfNRCBjx4V8G+J4gzatByvpTv5K8MJQcbhBohwXj
         wpF113Kf+3Nj1bkMNxlGJ4uwLJlXN9+zIhUNIPLVIHcxohCJHKjPr3xQbeNuYmn/BwIo
         uPAkk+NB422o5fK6LPYTElwx/M3CE+geTanR5gBOCrVLG+0F+EhnU3g88jZIofKzfiQX
         Xwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326272; x=1780931072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6TniDMWPlC5wJVCKXeX8vLCzRav1MdaXlzFFmaU889I=;
        b=C0obnk4EcP4mWuKJ1Z5fUAsFVf9b/fW+aH1XNXG/BdI2jXphar40WX2GJLOYyV5ank
         05pOqcRx8gtlqUpz/mZJbToA+OPcfKR+HluKzlN/P5G6qBAlsU8vLmamy9hU7+o00BGm
         oT1JkcfPcAZsx80cvExEf4rcRs84lKsGAUqzb1E6OqRSv7E+kqm188A2NmE0ao47avCE
         bZnLiJZGYBrpGvLaECPFWRu34kd1DXcIZWbr5IxATUBKg68lu4XBnoVeKHSBvpbQJPIP
         I0xR+v7PeeqjZLIU4nYB8u/SVOXgy/O+pufPDt2Mgwb6Ycw/bR7ESHH0BxHr2FyDo4Uu
         D1gw==
X-Forwarded-Encrypted: i=1; AFNElJ8/Wpp9UCnHiyNP+sk7gwXqJcUiPTkQh9AJGS7fh0ivgZ1PhJP5Hx9OVnLimKrC6AgSMMRnLyzjwOpRY0pK@vger.kernel.org
X-Gm-Message-State: AOJu0YySqM3FsT+attoIur2MloTXuWdlahglAJBFbCHbxCDYEYiJ1wbX
	uWxQ+vSXu8FrHAab0WuUALcF8mPOHmWEDZYE5WATMSaR61xjoYFM6jXR9XXJZlRCM1/eo9M0/lM
	nnCYnetBrP44vWVaiaHJr0VHD0ong8GMyAMwj4RnmpO6WcbcaDrYG1HYfKf+0h186AMy9hJT1Ne
	JrEiCGP9A4miLULNAKyaWyGCKd5PiwyxC8NeNW7mTgZgw=
X-Gm-Gg: Acq92OGyj5CVRVXg65g9es4GhzUQSTOmP82fCuWjzPxqHUfhVlWRZvWyZF7q+OAxnwm
	TRFMC8BD+l36IqGi2/s4QLEjqtsgNJcWB4o3QDo8YY3IUdvCfWyG03hcORLyjYyxwwi+VV7JVpY
	VKY+NtVa4Rc8O2FqvXTOLFxmjH6E3s2NTy/WLuWrGm+BnQiexXD2PMaZRjMunTTa6H30yk5VOq0
	AqQWGwJJOTMALhBD6zIqhb7Vr2WK3Ju+LnWIifW5GAu7db+8g==
X-Received: by 2002:a05:620a:6f05:b0:915:673a:61e9 with SMTP id af79cd13be357-915673a6392mr539173385a.16.1780326271709;
        Mon, 01 Jun 2026 08:04:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6f05:b0:915:673a:61e9 with SMTP id
 af79cd13be357-915673a6392mr539163785a.16.1780326271192; Mon, 01 Jun 2026
 08:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-camss-macro-v1-1-cabf1fb99241@oss.qualcomm.com>
In-Reply-To: <20260601-camss-macro-v1-1-cabf1fb99241@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 17:04:19 +0200
X-Gm-Features: AVHnY4KYMxjyyMWv1Bu50VoFEOCEofBd1PrQpAowlfJQ4fix9OAfbKu1CK-FZqc
Message-ID: <CAFEp6-3a_ZRvCBiATwT594KOMH3DOMoQA_=qj0WW7iiZHTWABw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: csid: Consolidate CSI2_RX_CFG0_PHY_SEL_BASE_IDX
 definition
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Mt-54l3OBL3tjf9anYBxs4hgd53yc3xZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1MCBTYWx0ZWRfX0rswc0Ojs/eK
 Ysecm08NnA47HZeSoPohS3yx2i7P5ESvxSXuR9+4xImE36KEnV5A+Iy5V6oIGcSCXxIeAto8Y++
 B8QuBpLMkoAltSi0A6IR8Dy7V3h7FuJWuKpkI65oWfNDmSdXccerRthihy8z7qSlYvkXyXHvYL8
 i0JgSYdkZgTKlyLLqeYnElZP9HsUw6xdqnZGqCqi1FHJQhRPKh/fI8GyY/77ZeYt7tJvhThYCjK
 sM8C5AskmeytX46sM+qUso4UY9Ktit6Bq89ys5ZYixi4FGxvpbb09wvJ7aFLDOoef6+H2NeMWXO
 pxHsRossHtJ2KsFm2dA+8HyRCp7yCE+nGt7fRT8G1/pUBZ6C0vLt4eAWr5YIoZ/wNINmXI67Gr/
 hTODwiqaUh/llp8btKnE8seSxH2PSrErm1Z9U7i+x2Mz1bxc2iIHwH7EgAR2iMXmA1uqTgUiIOz
 9m+wabHlMa/TOG1uvNA==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1d9f80 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=Wyjbxgov4yX43DM-SYUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Mt-54l3OBL3tjf9anYBxs4hgd53yc3xZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010150
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-110620-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: F0262621562
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 4:44=E2=80=AFPM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
> camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
> header. This eliminates redundancy and makes the constant available
> to future CSID implementations.

Taking that direction, I don=E2=80=99t think this is the only instance of
redundancy, so why single out this one in particular? Should we
consider one-line cleanups across all similar cases? Also, other CSID
drivers follow the same pattern but use different identifiers for that
define (e.g. csid-340).

Also, introducing such low-level, register-aligned naming
(CSI2_RX_CFG0_PHY...)  in what is supposed to be a generic
CSID header doesn=E2=80=99t seem appropriate.

Regards,
Loic



>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
> Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
> camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
> header. This eliminates redundancy and makes the constant available
> to future CSID implementations.
> ---
>  drivers/media/platform/qcom/camss/camss-csid-680.c  | 1 -
>  drivers/media/platform/qcom/camss/camss-csid-gen3.c | 1 -
>  drivers/media/platform/qcom/camss/camss-csid.h      | 2 ++
>  3 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index 345a67c8fb94..bf7164085ddb 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -101,7 +101,6 @@
>  #define                CSI2_RX_CFG0_DL2_INPUT_SEL                      1=
2
>  #define                CSI2_RX_CFG0_DL3_INPUT_SEL                      1=
6
>  #define                CSI2_RX_CFG0_PHY_NUM_SEL                        2=
0
> -#define                CSI2_RX_CFG0_PHY_SEL_BASE_IDX                   1
>  #define                CSI2_RX_CFG0_PHY_TYPE_SEL                       2=
4
>  #define                CSI2_RX_CFG0_TPG_MUX_EN                         B=
IT(27)
>  #define                CSI2_RX_CFG0_TPG_MUX_SEL                        G=
ENMASK(29, 28)
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index 0fdbf75fb27d..da9458cd178b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -105,7 +105,6 @@
>  #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)     (csid_is_lite(csid) && IS=
_CSID_690(csid) ?\
>                                                         (0x34C + 0x100 * =
(rdi)) :\
>                                                         (0x54C + 0x100 * =
(rdi)))
> -#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX  1
>
>  static void __csid_configure_rx(struct csid_device *csid,
>                                 struct csid_phy_config *phy, int vc)
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index 5296b10f6bac..059ac94ad1be 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -27,6 +27,8 @@
>  /* CSID hardware can demultiplex up to 4 outputs */
>  #define MSM_CSID_MAX_SRC_STREAMS       4
>
> +/* CSIPHY to hardware PHY selector mapping */
> +#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX 1
>  #define CSID_RESET_TIMEOUT_MS 500
>
>  enum csid_testgen_mode {
>
> ---
> base-commit: 697a0e31ee66f5ddb929c09895139779fff33f20
> change-id: 20260601-camss-macro-3d40c4d4e90d
>
> Best regards,
> --
> Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>

