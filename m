Return-Path: <linux-arm-msm+bounces-93240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAi5LQL1lGlzJQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 00:08:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 463ED151B57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 00:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7580C3048121
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 23:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43A4306D40;
	Tue, 17 Feb 2026 23:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HuknjF3p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9Lkq1uL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5052C326C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 23:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771369724; cv=pass; b=col6ykPBTA3aw+tL4iwCid/3PujifLvl7uuUmAaJWKCfg5Sv1MscNqtqNjbDo5bMWsM2FkWXje00ccpxgPK115MykRsZ173EUozc5H3/zfvV6snkuwf+uRrgLSZPOd2xSCuSoedSUmyc1XJaHHfFXXmBHgwZ13nwFbBBKAbRcQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771369724; c=relaxed/simple;
	bh=6r2/HzRW62rdPF5cC+mjlxhbT1Nklrv0PUlJYmr1Rys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pl63muDrGvFZ8WwGARd1Ni9UeXTLwSTVLQkE540sBBrDdrXRZEjDl2IGzXREmQYDTkI9kRgb+XnsUJI7Czdik5wRdz87MOkeb43xh/586UCG3mwWIXhB9pCPUwcrPxK7zYlr4GXbx+LJHFnhWzymn0MtOGmU0+rI7XpIwNIgAHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HuknjF3p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9Lkq1uL; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HJ7KLd1942820
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 23:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=LnanU8PAYceSWKBt+m+SEdZEojtqeWe2NeYl1HwNokU=; b=Hu
	knjF3p/1KoYNLudzRm1VJq6Qb98csFwOfWEvCSnXuCqjNufsBlkJm3+2mxD/v2ch
	whEkYmMPEwtsXK1jXmT8+4N2vN70jd8DPvPE1hzRvRfh+SofiMA8iSBWtmhZwEjc
	tOPtphayWdDEkKX124h4tlQqioSmbmEll1KepWceEek++K6vs5hSFfpktBRExeku
	dKfIfXITalCkoTj9ReZr/EwgxuqnVZhBo0d0081OQxuQqWWssrimNVD3PjkMFBuc
	th1xKaUR72JEtC/Vby1YGo1amsHnQ0vl1YaIHdnftPFoBTnasenfDnshzaugG6bZ
	RsNJde9ZmJqUxP5TQbJA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g29h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 23:08:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba87c0e198so3952467eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 15:08:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771369721; cv=none;
        d=google.com; s=arc-20240605;
        b=GqB8Z+KTTA6XkaGk6BcwCCW/zKMjXrG7LKD4O5X9luE5XXthCvGoUZY/4ViS2zPR0W
         xudKeGcmgETIfhgwiSTKVV7Wat5YH/l8FT7YdhA0/E0SQ+vuuFPi3lTWsVjuIbij6hsr
         B86HepQksGzsak7O44Ea1guFc/LXItssicWSEEvfDY0ZeKH06iZQJAsQronR8tfG+u5g
         u1JFWHC1JrnlGxsEZ0lavdRSBdigg7IOUEAMAdGaghJbs7+SaAvv5GOCFvqLan9nzRx3
         NQZfMva9rkmV2nbNrHuxLiWlfFBiApkmv71fWVLr7jhOXpz55r6d3ItYXC/bPYO95AAg
         fNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=LnanU8PAYceSWKBt+m+SEdZEojtqeWe2NeYl1HwNokU=;
        fh=N8BE/MkVAeXC3Cc72ZE6vLFhGTi/3JkVPdF711htwaw=;
        b=GRagAGlbNWPA1cz9qYXsXljMpuJxvsumAU/QFlEkixF/5NzoBTHq+7WMGNAyu22agV
         KvVw8z9f41J/lX0jBvAiQwJh8BNSYd94mezsFMFQauiYcnReXo34we/DD5wdJym/gqHV
         MXiznoST/ansYqznW0W1q13n4FbkkR/CI7HNZJ5wjIeDIBnYwHk1HYSg4Cx3J8zFhC/r
         rDSUQWS/syQpHxeI58K2OQ0GHXYJ90/rdTOFwxHkLvokXg6UdF4h5fILDpYirennsrl/
         DwPGXTGFXHvkNJneb4MVUTfc5V9oDhZ7BwXkIXgzfOtuvLX9mPkqk4btmZAYZiVKPD//
         79TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771369721; x=1771974521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LnanU8PAYceSWKBt+m+SEdZEojtqeWe2NeYl1HwNokU=;
        b=B9Lkq1uLHa62QMlZ/LtHvo6ea0AO1Bsw2kpNh/u17QzTU/aGE8tE3JMlqw+cywn9mN
         HkAta8D5NYiOFD765aoj7TAhoI6ZEZky8b1JYNZOL6ZlzvTOiOwK/NNFvEe1Xc+rvCV2
         7z+5U34UwNar2ixLMXaIXjbDtDA50bxj9eoAjsSAQiIBN2Yn++2yqq8GLNg516dJ0UMa
         zzrtjCcALgp7hg8oAnVXheg1JyKsQa9Jfd4d1JLN2PVw3VD01vE54kHy4cb4VZs0+kdo
         XLusLaeO+aJNR8Lqx4ysg+Sz051DRmjP0BpAdnP51T+O/EqTBC+DlmP5s2TVsxQmcX5M
         weMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771369721; x=1771974521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LnanU8PAYceSWKBt+m+SEdZEojtqeWe2NeYl1HwNokU=;
        b=XP6P4pymQIXBrcPoouHw7gsxPuD0ppsCiCeGX2Y77mndwwpfez+BEru/0BMuVx/2MT
         4ra9hdFPBJrfJErlTxoz30PDtovhg1K8Rwx1dedq8BaeSg7VcB8NWNg8rUVoUU3S7KUK
         7oAA2jCmkCR6CE+J+hbhIFBeDvsuVp1cy8eJLMLp7uGJ4gUQWajiRVJU+D3rT1m+XyMY
         68R4tC7zgJAWHfFbYUHSwxTpXNttp7LZeUNxPJ5/zz3cty5cyU/AL4FD3PpJaTh/ILFN
         onQzVz8Bz7sQ9GLWXtpEKNYJKU8rkipSs5PlwNrBLIHeTp31tOvRF1ONWCZcjrq7X38q
         qTfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq/4/9nDmWC0mzxcgO/nfw96CeWYegQZjE+QrjzWYIYRPBpKZ7ehfkNxKEVm8Q14wCUwd4ipL7JMum9CID@vger.kernel.org
X-Gm-Message-State: AOJu0YzkQOdx6JxUGoU7qlX0h9Uzj1vpy1shIbaXGF4BA2GxnHMH9p8T
	9eBmjjEfczqstSeVcBqyFae5JgFL5uIJ13AXPZyai7z1qDudJ9snyGIOPl9u58smxrd87TBJG4f
	lHTDxFah5wxYB00aGEwVtQ+4oIrPY1/mnGIkhoJy5icaeBAbSAiXdR+z+LvUBlvCcAHYqt7g97M
	Bgqefe2oxySI8F6E68xQEJxdPYEvFlfdG0QP0EAkZeLYtIZiFeIZM=
X-Gm-Gg: AZuq6aLw4feGHM5AU7i0OPYPAGjTk4nOYdXQkK8Z39KFAGk5GTb4uJdajGOp9XDbydC
	yytTOGG0b2+72PFbNnG64nim1CMhELPARtBCVNZj5JjeOgYn7l5C3vykh6STZjwcdwit4Jn2SWa
	5GeFRFB3n/hS5l1M+I57Yw2DMf3wghYEZDiL5YeUOw58yJDLMbb2gsJZ42jxfRVybJsBnROHwYB
	KYoGCIrds5s9Uso52VBkEvh0mxUCIz+oRl/zg==
X-Received: by 2002:a05:7301:1688:b0:2ba:7ed9:1565 with SMTP id 5a478bee46e88-2baba125906mr6788242eec.36.1771369720919;
        Tue, 17 Feb 2026 15:08:40 -0800 (PST)
X-Received: by 2002:a05:7301:1688:b0:2ba:7ed9:1565 with SMTP id
 5a478bee46e88-2baba125906mr6788224eec.36.1771369720229; Tue, 17 Feb 2026
 15:08:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
 <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
 <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
 <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com> <iqg6jpq4i3olwugnlnsczisbrbysxzik6otby3pgkv5uqsez3f@diwpjgf26mk3>
 <203f6f63-e81d-4db5-8ede-ff6695a847ed@oss.qualcomm.com> <i74iyesupz2elaoefyn5s5r53op5aifftcmsgktk2pyghozvwx@usg4hp4wrtug>
In-Reply-To: <i74iyesupz2elaoefyn5s5r53op5aifftcmsgktk2pyghozvwx@usg4hp4wrtug>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 15:08:29 -0800
X-Gm-Features: AaiRm52D5WXYL-x3xfhCjoZjU7AnJhPRmHPHx2Ez5oMG6KajaDiqGRMsuv65CcU
Message-ID: <CACSVV01D6u1B2d6ipd7cuomOhE_iGDBF84V8=v7jcm_5hJ87eQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE5MSBTYWx0ZWRfXzTHyh2E0yNIX
 a5fF2atX3pWd+gBrasK91/XfOQGeMtpEMaiCudW//RoiXuwvLVsF+ozP7YAepM7FRAmjBRpYk/d
 43LwSoWsgHDIWE7ZbJFhZBnfoP1ZzJLYbGpW7lDbr1QahDXM/d/67nLsHp8TPQgbRbTgoTIpVQ7
 BwpHkuAXhmMaAg4EnnycF7JK/45v+b5nm+FSREd0A6LN8sT5fe860kmMEKHp8oJBGU/Ga0PMeuK
 MNn+axwUMm4oziA1EIWS+v1FNxpeKS8zgmp+1xlCgPXQpniFO5jjbztz7kNYJ7ZzuTBwFec5uYo
 PUDNS+u7mRW60uQbaLYiafiwMGwuQ8+VF/OYn7xbuflm4SRcOmNWTQ1Z89VI42QXi+1goRBZbdc
 whBiGJO962SBxXwYsDPFKwkcHsVBSK6rRyrhrVszF8QmhiyGAClkaNaEkFAokTFBl3mbbnnbPUA
 UYT6Rnu2e942nHTJpmw==
X-Proofpoint-ORIG-GUID: 7V55KfNd43447cVNP8R05r9SdbnQXjKV
X-Proofpoint-GUID: 7V55KfNd43447cVNP8R05r9SdbnQXjKV
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=6994f4fa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=-dl7yEjYuLqhyd9yoY0A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170191
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93240-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 463ED151B57
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 2:53=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Feb 17, 2026 at 01:59:48PM +0100, Konrad Dybcio wrote:
> > On 1/13/26 5:29 PM, Dmitry Baryshkov wrote:
> > > On Tue, Jan 13, 2026 at 04:31:15PM +0100, Konrad Dybcio wrote:
> > >> On 1/10/26 11:45 AM, Dmitry Baryshkov wrote:
> > >>> On Fri, Jan 09, 2026 at 11:50:46AM -0600, Bjorn Andersson wrote:
> > >>>> On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
> > >>>>> On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> > >>>>>> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote=
:
> > >>>>>>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> > >>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >>>>>>>>
> > >>>>>>>> To make sure the correct settings for a given DRAM configurati=
on get
> > >>>>>>>> applied, attempt to retrieve that data from SMEM (which happen=
s to be
> > >>>>>>>> what the BSP kernel does, albeit with through convoluted means=
 of the
> > >>>>>>>> bootloader altering the DT with this data).
> > >>>>>>>>
> > >>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >>>>>>>>
> > >>>>>>>> ---
> > >>>>>>>> I'm not sure about this approach - perhaps a global variable s=
toring
> > >>>>>>>> the selected config, which would then be non-const would be be=
tter?
> > >>>>>>>
> > >>>>>>> I'd prefer if const data was const, split HBB to a separate API=
.
> > >>>>>>>
> > >>>>>>
> > >>>>>> I agree, but I'd prefer to avoid a separate API for it.
> > >>>>>>
> > >>>>>> Instead I'd like to either return the struct by value (after upd=
ating
> > >>>>>> the hbb), but we then loose the ability to return errors, or by =
changing
> > >>>>>> the signature to:
> > >>>>>>
> > >>>>>> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> > >>>>>>
> > >>>>>> This costs us an additional 16 bytes in each client (as the poin=
ter is
> > >>>>>> replaced with the data), but I think it's a cleaner API.
> > >>>>>
> > >>>>> What about:
> > >>>>>
> > >>>>> const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hb=
b)
> > >>>>>
> > >>>>> I really want to keep the data as const and, as important, use it=
 as a
> > >>>>> const pointer.
> > >>>>>
> > >>>>
> > >>>> I guess the question is what are you actually trying to achive; my=
 goal
> > >>>> was to keep the base data constant, but I'm guessing that you also=
 want
> > >>>> to retain the "const" classifier in the client's context struct (e=
.g.
> > >>>> the "mdss" member in struct dpu_kms)
> > >>>>
> > >>>> If we're returning the data by value, there's no way for you to ma=
rk
> > >>>> it as "const" in the calling code's context object (as by definiti=
on you
> > >>>> shouldn't be able to change the value after initializing the objec=
t).
> > >>>
> > >>> And I, of course, misssed one star:
> > >>>
> > >>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(u32 *hbb=
)
> > >>>
> > >>> This leaks the knowledge that HBB is slightly different kind of pro=
perty
> > >>> than the rest of UBWC data.
> > >>>
> > >>>>
> > >>>> You also can't return the data by value and then track it by refer=
ence -
> > >>>> as that value lives on the stack. This has the benefit of making t=
he
> > >>>> lifecycle of that object clear (it lives in each client) - but per=
haps
> > >>>> not a goal of ours...
> > >>>>
> > >>>> How come the ubwc config is const but the hbb isn't?
> > >>>>
> > >>>>
> > >>>> If we want both the per-target data to remain const and data in th=
e
> > >>>> client's context to be carrying the const qualifier, the one solut=
ion I
> > >>>> can see is:
> > >>>>
> > >>>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> > >>>> {
> > >>>>         const struct qcom_ubwc_cfg_data *data;
> > >>>>         static struct qcom_ubwc_cfg_data cfg;
> > >>>>         int hbb;
> > >>>>
> > >>>>         ...
> > >>>>
> > >>>>         data =3D of_machine_get_match_data(qcom_ubwc_configs);
> > >>>>         ...
> > >>>>
> > >>>>         hbb =3D qcom_smem_dram_get_hbb();
> > >>>>  ...
> > >>>>
> > >>>>         cfg =3D *data;
> > >>>>         cfg.highest_bank_bit =3D hbb;
> > >>>>
> > >>>>         return &cfg;
> > >>>> }
> > >>>>
> > >>>> But we'd need to deal with the race in cfg assignment...
> > >>>
> > >>> static struct qcom_ubwc_cfg_data *cfg;
> > >>> static DEFINE_MUTEX(cfg_mutex);
> > >>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> > >>> {
> > >>>         const struct qcom_ubwc_cfg_data *data;
> > >>>         int hbb;
> > >>>
> > >>>   guard(mutex)(&cfg_mutex);
> > >>>
> > >>>   if (cfg)
> > >>>           return cfg;
> > >>>
> > >>>         data =3D of_machine_get_match_data(qcom_ubwc_configs);
> > >>>   if (!data)
> > >>>           return ERR_PTR(-ENOMEM);
> > >>>
> > >>>         hbb =3D qcom_smem_dram_get_hbb();
> > >>>   if (hbb =3D -ENODATA)
> > >>>           hbb =3D 15; /* I think it was default */
> > >>>   else if (hbb < 0)
> > >>>           return ERR_PTR(hbb);
> > >>>
> > >>>         cfg =3D kmemdup(data, sizeof(*data), GFP_KERNEL);
> > >>>   if (!cfg)
> > >>>           return ERR_PTR(-ENOMEM);
> > >>>
> > >>>         cfg->highest_bank_bit =3D hbb;
> > >>>
> > >>>   return cfg;
> > >>> }
> > >>>
> > >>> This potentially leaks sizeof(*data) memory if the module gets remo=
ved.
> > >>> Granted that all users also use qcom_ubwc_config_get_data() symbol,=
 it
> > >>> should be safe to kfree(cfg) on module removal.
> > >>
> > >> I really don't understand why you'd want a separate API for hbb, if
> > >> hbb is already available from the larger struct *and* if a driver ne=
eds
> > >> to know about the value of hbb, it really needs to know about all th=
e
> > >> other values as well
> > >
> > > Please take another look, qcom_ubwc_config_get_data() is the only pub=
lic
> > > API, qcom_smem_dram_get_hbb() is an internal API.
> > >
> > > My goal is to keep having UBWC db which keeps const data and which wh=
ich
> > > also returns a const pointer.
> >
> > Right
> >
> > So if I understand correctly, this is almost exactly what I originally =
had
> > in mind in the under-"---" message (modulo having a static global ptr v=
s full
> > struct instance) but I failed to express that I wanted to keep returnin=
g a
> > const pointer to the consumers
> >
> > So in the end it's
> >
> > A) int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> >
> > vs
> >
> > B) const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> >
> > I think the latter is better since we won't have to store a separate co=
py
> > of the config in each consumer driver (which the SSOT rework was largel=
y
> > sparked by), essentially removing the ability for any of these drivers =
to
> > mess with the config internally and make it out-of-sync with others aga=
in
>
> You have my vote for the latter option.

same here, B pls

BR,
-R

