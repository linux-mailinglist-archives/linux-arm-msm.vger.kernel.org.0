Return-Path: <linux-arm-msm+bounces-103221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK0/Mj2W3mm0GAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 21:32:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 178183FE078
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 21:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0129A3066452
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7373E14E2F2;
	Tue, 14 Apr 2026 19:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdITEKKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJIs85ZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE686238D27
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 19:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776195131; cv=pass; b=rhyHsxsknJ+slPF0MgzIgphH1GyTHkl055xTtBIzwx2fgViSnKX06Ke8hdX/sG9n7mEW90QNMgjuxJgF09JqWz85AWU9ePDRtYZTBtDCUc+oAHBPc+CP8UCMpOLYlm1/3qRKDF2/zJaz7aN4xj3ko+qXO9WNX9ylnHqkDA/qW/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776195131; c=relaxed/simple;
	bh=KWNMLGggJeuxR4jnVaz8gmRT7gwcKbVgVXE9kPT73kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WU/pgSyZ0v0sEHm7UkW6lNA55yqdIW1gMiD88C9ZhLaeoagpWoKpnpQ6U4L1mnE1w8aoYXAick7HXgTawQA7EwsDFyokxd8Sw4U8va+vywuurdosEgLCWjSK/h16RxzdOI1/unHqbcIqo1PgM6xL9TSo//4zAZXcd6OFU9i+wvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdITEKKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJIs85ZO; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHbZYd3126753
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 19:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lnM01/HINKWExKWtn+/pUMhXJKImwAV4a6Gn+hdsK4=; b=QdITEKKGye5FHEEE
	7sbHbKlHsxRvKCEODbqmKWPIuHQpCBC+HAdXHX/Z/jZonHSDAFpGlXjS3+kV4Cr1
	etn3iXmUBwcdRwfVb4b/FFUR0SXc9nnbxo3ljQXr2YP1Qhg/dWs6JlNGvk14GiBC
	Bj6+3RQd6X7L1cK6ftgliCnQrnvojtljgxx/GxBfCvO/qqTJj4HFVkBYSfM8lSbL
	aZBrK+fh32ppYE+p6kFihIgg9TS8yVccMbpdOyu3QB4e46umm927Iu+syiZrq0zg
	kSe2EfuAwYdHaXEQwzJrKZ7545aE1idVelzpT+bWJTyY/kcjzD53zehhqebLMy4V
	2o5/JQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56rcdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 19:32:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acafc224a8so70975536d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 12:32:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776195127; cv=none;
        d=google.com; s=arc-20240605;
        b=Wqil+V22hP3T2cRM5pCNCOv4ZcU7Ycn/Zwj//zBTGhLNrVB83dJ6GfBf1gsZrWByuQ
         k5VjUKLCfgyrp2RDsTX/fMt5iIJ0H7HpDekrzuhfYSvLVgeYxGORyz8VfbFgp0DCYRNI
         TnyCvNf58sFZEtKVxnSzxeU3VXTVRYFBQfjGmGrqq0h0yDzg4AR5S8L3lIQus8D2SFVb
         26hD2CHWZTpeLixk0bgmUZwEy+SCmz9UJ5DDLx4tdD6N54GDRy9a9muq9oiW2Nfxp9Kt
         GhI/bnEvtoi1b7YIcMIOs4oZVI1owaJ07Vsw/4gP7gXDA1+ihD+coESZm5StjKngoeI9
         DXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lnM01/HINKWExKWtn+/pUMhXJKImwAV4a6Gn+hdsK4=;
        fh=Gg8XTF75wasMjOACloiGRbFy5PGJm0DnU+aJbm3RlRI=;
        b=Q/0WV42J1mja5K4yIm6jIvJThvlvixQGGkTiTmu/+Q5vvjsk5ZoxNSxf2o8QVua4Xm
         F7j1H+ghMVBQODaeWKGOscRna2FW/KIEo+sdz/P1lBcYiduRWJNem9VSTQE74eoKnSOp
         VMrXLvekF7LZ6tq982eXWd9ikcq1TBfA6fMd7zj1BKjh25Rz9wSRMYNCu4TwO2Bnv6oh
         ciKiSMFO4obpvGHIicA5r/5NyPKoq2J6Aia3ZkxFE3KQUPIeNfvM6ywyAwU/2PDa+iki
         jtVlyl4q58yKaCFfJ5OnHa+PNK7xswoxgTwvlhLFlvzGIb853aAjBcZTN8rs7h8vDZj/
         pmKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776195127; x=1776799927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lnM01/HINKWExKWtn+/pUMhXJKImwAV4a6Gn+hdsK4=;
        b=JJIs85ZOOMzp0UU6vZSnc3FZtWgsC6fjvzfdB83aQPDba8WyUnFvfssikUFRapvobh
         6wxo5aRRKZulJYCHtpVxGPts8g/pmAM5HVsTmjpd1T+aUNqzaAv7/FhaRYjqyqwIlbkF
         s2tptdHp40u2lx893tmayHEAM/zUBDBuAfLASboY8Nn7hD3nKBByTH3DiJqhoeM0QfHg
         +lywopnzqpxsN6NrtkhgKpnzo/HYvFsClJFE9OdkXInHKTxPE5p8kBeHiwB7zedP+xA9
         8xg95fODBa5F0wrXK908kgyXnngp0iXzO8XrbuZUcrR/R+n9h4CLkFsbXFIRdiYBVdx9
         L71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776195127; x=1776799927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lnM01/HINKWExKWtn+/pUMhXJKImwAV4a6Gn+hdsK4=;
        b=CaHdLlnr/wJojjahUv0ij28PFfUd7pADAf4jckdymKfcg2DZeJzV6gj4d4LJX6Hq9e
         bED6Gr4asqrMgsHsp0yvWeUxCHkJwrjX7NuMhjCDmE+znB8AQgBEbKo7ZxcRpn0A/3R6
         AOSgSH1/3iXHEmQYG7UWVgxMObuU1HZFif+imsRo+KUuXjlsjLFZRlqYZw1jDcQqG7Yz
         017U5Vf/u5pRq/TfxNRb9RC/zpsjcHYnm+/iyNojosBdwR2xDCWvqSMsHvNqyO81qBPS
         Qu1CCwItNQeM6+P+zhNwWZQcAl6/9JhylSLqGZLqnFcHjxiX/ema34JcIX8WKUMdfrcD
         xsVA==
X-Forwarded-Encrypted: i=1; AFNElJ/djDifuovx6rv6D8ubWmgsB6J7VxecmgYVhHL3Zrt9J1IcVRkwJbG5PdPN+dMb3VkT3NS5JSrlK4+NGvyr@vger.kernel.org
X-Gm-Message-State: AOJu0YyEHYdNcHUwkkmFgZENft69WFIfBlhTp1PXNES60W24r0BFinxY
	JixKe/khKTOOlaop5MGy3fswNv5qPNmlnYG4lZroMDvXhXkQ/qVpXF0U0riQ22zmg6tiqLHOO6B
	zcLoBQeSprNilIt1twU+LROiyrPOJLk4mJjZ+TU5sodbJfn/ZWjcpNWv3vrzcm8bXIXhlCNoqak
	fphusM5b6rFSuprrw7j6HhG8RoVzB6pS6PACWEKMu4Oo4=
X-Gm-Gg: AeBDievO7njFN8lUqX7xoOmnr029XLGfeiixoH1qLMRVrGhaPuM1yRc5DBDB/0UTwlN
	0AzEKudAH7t8jjhNFrQpIivQ4eD+GJcPauZPgPqc8fXrVVNzD/Mt5TTGMRvaCjG9zq1RAAMZmio
	D7F2xX803oosnox5+fzM5NJYSxs5F7IcXGVrnAkp1PeSHLJnOIJK6X9TMvUC0oTH9QRRK6lu9Jd
	vLZIyciYBsOBNlR1v2uwrZPIHbBpoAE48xcGz0=
X-Received: by 2002:a05:6214:8012:b0:8ac:a6f7:8a71 with SMTP id 6a1803df08f44-8aca6f79755mr152462406d6.24.1776195126925;
        Tue, 14 Apr 2026 12:32:06 -0700 (PDT)
X-Received: by 2002:a05:6214:8012:b0:8ac:a6f7:8a71 with SMTP id
 6a1803df08f44-8aca6f79755mr152461776d6.24.1776195126382; Tue, 14 Apr 2026
 12:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
In-Reply-To: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 21:31:55 +0200
X-Gm-Features: AQROBzB_zqoJ98z82D70XjchR2wbCQsqzrKE47oy1E6g3QZfASfGbshTwGg4bp4
Message-ID: <CAFEp6-1+TeEDodfMM+ZmvGOwxr2sQa5pJ9vuk+h2WWPtkMvVXA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] media: qcom: camss: Add PIX support for CSID/VFE-340
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LuiiDHdc c=1 sm=1 tr=0 ts=69de9637 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kfigPR_gXQGDb6zMejoA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE4MiBTYWx0ZWRfXwqvJ/JEMV6OG
 faEdIMmpC8GoFQeSMQni+JsDhbwVSLqCgx/L1DduTfjDIAagEZbVnQJ23uV1BK28fRpRjcFIxOr
 o3lBv0fO4zmOlDFsEFCJEkCrrn8coB6divc5BI9W8b5lTm+A+PQgpTlbnRFkvtvEvHoTtUygbIR
 mYZGtGAhzWl5ksFfL1srEXdLdxD6NEBDPTsY1ZVtOcypfq9tilluyGXS6FQfM/khsLybbb4N0uq
 o1gU77xDK+R3tjzuS2QgdMXpzpJxjt0sT8Zu7bNRu58KzFvs62g4CtEy2NQ5NpMSRuYCwZqBhi+
 oZVZgE6454vV2vrolmEZ6ytp2Ws1j50lvpZ/Ibb/K3bPFVQlzySiIdxufMS8VYTWSXlLlf5IjtX
 V7f8DmS2D1jNN1PlysLXhaEhRJMLqYnggvDrZt+TfzKShxAMIZ3icKVGdQkzSzXCm+4S5t+/oWJ
 g5pzuC0akmMqBmI5i2w==
X-Proofpoint-ORIG-GUID: ZMbuzYnAxkE1uIRy2RLvH-PxlzD3VPQe
X-Proofpoint-GUID: ZMbuzYnAxkE1uIRy2RLvH-PxlzD3VPQe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140182
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-103221-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 178183FE078
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Tue, Apr 14, 2026 at 8:52=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Add PIX-path support to the CAMSS pipeline on CSID-340 and VFE-340,
> allowing frames to be routed to the VFE PIX interface and exposed
> through PIX output devices such as msm_vfe0_pix.
>
> On CM2290/TFE, the PIX interface includes a minimal inline processing
> engine, which we will be able to leverage later to export statistics
> needed for proper 3A frame processing. This also fixes the PIX path
> not being usable on this platform, as PIX routing was previously
> unsupported, causing frame capture hangs.

I forgot to mention this series now depends on your CSID/port series:
https://lore.kernel.org/all/20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel=
.org/



>
> Changes in V5:
> - Rebase/Move from en_vc to en_port
> - Use common __csid_configure_stream for RDI and PIX
> - Use bitwise | for packing vfe width and height config
> - Simplify vfe_packer_format, no error expected
>
> Changes in V4:
> - Remove unnecessary boundary check for wm-to-client
> - Remove stray \n and fix commit subject for 2/5
> - Add proper define for PIX pad index in csid-340
>
> Changes in V3:
> - Introduce what PIX is/means in 2/5 as discussed with Dmitry.
> - Fix patches format/encoding (proper ASCII)
>
> Changes in V2:
> - Fix various typos, extra spaces, and reword commit messages.
> - Split the CSID-340 patch into three independent changes.
> - Make VC/DT-ID configuration explicit in the CSID/PIX setup.
> - Add the csid_vc_iface_map helper to retrieve the interface offset
>   from a Virtual Channel (VC).
> - Add cropping configuration in the VFE/PIX path so that it
>   respects the crop parameters defined in camss-vfe.
>
> Loic Poulain (5):
>   media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL
>     registers
>   media: qcom: camss: csid-340: Add port-to-interface mapping
>   media: qcom: camss: csid-340: Enable PIX interface routing
>   media: qcom: camss: vfe-340: Proper client handling
>   media: qcom: camss: vfe-340: Support for PIX client
>
>  .../platform/qcom/camss/camss-csid-340.c      |  83 ++++++----
>  .../media/platform/qcom/camss/camss-vfe-340.c | 152 +++++++++++++-----
>  2 files changed, 156 insertions(+), 79 deletions(-)
>
> --
> 2.34.1
>

