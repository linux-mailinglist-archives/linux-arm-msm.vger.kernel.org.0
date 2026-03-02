Return-Path: <linux-arm-msm+bounces-95024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDNmOJXdpWkvHgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 19:57:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE701DE848
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 19:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D2BE30B84BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 18:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46BC361658;
	Mon,  2 Mar 2026 18:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fI/AtnIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRyG2A83"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10283382E8
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477725; cv=none; b=KDKVyxsAWCJpb8f55xi/nF3ju4LSSs4jUNsmk3K7CaKR+O03V+nwR9rdZYoaU+gBPHenQAPxfUF9J5oz/HJ+JCaKiL/Dp81P2AFuZ7OrUt5Yv3Xu8RcR6eg3HqGc4zxGmYo6OCr1s+XDul6s4fXmao2ReDUvdqPG9B5wSfzea9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477725; c=relaxed/simple;
	bh=t0Gatbd/4l9ldcYD8Tj4kalqtcuUJrjXQKYQ1vtwWLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoglHSxh5JGWJEYJdStM3pPTvhPjCf8AnMy1dq1AWFlXS7veCz066Q3d/LoWf/V/5/n6+mr5ElSOUOcpVaP2BiBb+4KiIReSM9/X4inx2TLGx+ZirP3cSp9EjtX5SVedsGjsQdnAOiPqyAabKEpZz6ZQfb559by3vSUcApa9zBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fI/AtnIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRyG2A83; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622G86Db3741985
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 18:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eo0jOLNntHF75zOXCqJK7491
	0uGs6J6K50zPUocm8lc=; b=fI/AtnIR+RDdovMqDsVX5yr5zhE4j0o9C31kTgiY
	Z5uC00xsHVGMbaL8rW7DNYFqaVKws/BiDtr4eAqaePRUwJ8/qs6p1uHCCQhXk1x/
	bAcsHhbEA3V7/5BYHFuoZIGsvvMbzlvVgeqOYoIE6jyBd8QtSlCM5jWzydAfefbB
	5tzO6Q7XY9zHk1sCIMqoQpjp5JImLeWMXuUQl647hbKuFs0wTabz6xOMRF+Xl6Hc
	Slyw8zT8XgAXz3q/8FoSLhLqK0HyUGK64502gA0c21YFfdEoMHZKDU0b6GXNe7Vk
	ElUPGQgoM19t8+TLrWVgtkZ6zXoZWa5G70/g/KlmmwBU7A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trhy60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 18:55:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ed6c849so143271385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772477722; x=1773082522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eo0jOLNntHF75zOXCqJK74910uGs6J6K50zPUocm8lc=;
        b=gRyG2A83/IXmMgmjPrmWiU3hs8/bUWbIII2OEmRpIN4j0a207RWZ3S/6xp9JkC7Nb1
         AGqnPtgPMB96lOS+Mkk2s30BS+U+XOBqA/4NBh6qC9ctM3IJFrIb/+KagsBUgfyaZrGo
         R52mddtCMXPfh9pvqR/nJfj5H5AxwW7lglao0w9Cy/UG8D3jl+ZjUz1miQ2p6bgHMXue
         iZP7a8egxXuSGfabA77L2QsuaQbK9rHFnJ/0fApemDyRfB4ZMZ65atPQXRpPg/e3yS/1
         LEYfWiptrTMZVb1IgOeiCHexjiTiCXBeTEOms5VDOnjSiPLTgeAUnVpXhdypXjrGllJm
         47HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772477722; x=1773082522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eo0jOLNntHF75zOXCqJK74910uGs6J6K50zPUocm8lc=;
        b=LWA2KVmke6gOkAVUW6zREhZzfVSXGSQ9amYVuG+Lww+qyzC9lAY3yk63r7nRMWyPDR
         26TyobK4UbVBqWBAR+e+FdGemgEr98s9tlMTkNQ9W3ITuRKlWKtQNXeOFoEyN7FAi9dt
         SU+3Gy6wNo7+Ivd3vbTs54woWYjKq+bzJTf3q/FL7lRNwXGhBwYd9fh9qgNdpDOX/vPl
         Vlh03LX5uOwPYGNKRCyYCcU5Ll+6cgjcLno0xfW75m3kjqkQnMXpAYrQT75hP/7Ln1m/
         CsUbLzU4nNMSCb1xShve5FpRr/3Oo+A/iYm5oPfO4+iLB5NrOs7Ytkzlr/s5cOOwgclV
         We9A==
X-Forwarded-Encrypted: i=1; AJvYcCUtaF5RIYKH4eZnLdyGF/Wegq5r+DraVFRbEzzBjvKtIA5eaaRckeS4N4MwehKeVxCdSC4pYRYBJMl/s+3z@vger.kernel.org
X-Gm-Message-State: AOJu0YwbK+YzckpO5AuCY1nIlfmJGwUXWyWGqYDD07ITzfiARZ6Zalet
	YqlTOiDFcfXKM+vWMvr0uCj5yNd7t6R+cjfRDHnh7J6TAl3LFfLX7wirzo9OZoBFygKGwy5JQ6f
	hLNsjCj9QoQdOOE1VedWmO67CaANwIKh/Od0N8zrUbM2W7LrRbJFZ937aEMw4DEscQ61/
X-Gm-Gg: ATEYQzwIbJn41qGuSxeqRtyZJ8z7RhkdQLfZ3zeF5emcjIf2RQJbwdv2ikLTCHXoKUe
	QCyLv3HDfn16C+YXNC5huJvXoC4qPEUI4EUlGDVJX97B9PqG8GJ+08Z9tNKnpSiJGBCuU4H344z
	2d8RvLQqB9/6gZAc2fyP/U4lt7bl6hUkYXeNzyLqaUlxVfTmJ4WIOSBEnwq9h0i/TZ5FLQtv65m
	/Q9vpZAP1ha8S7oOb7ZPJrn5GqTBzk7m+NzmXGfk+pfcf5DF1MLAi4IJJV7BT8td3sB7UOLQl/s
	SAtT21wMa1pXPcDicxeNsCy6Bte/8hFBHPKbqpvwGtbMgc/zy4hvcAP2egN6AoXSDYzLPAOKl5y
	SIPAwtdHA4o+LzEKc/65v15gpvlbwBtItDliQcXsCCWORp2Env5EepVh49Fd2YYqW60I35subxf
	TjrbDD+lDKuu9Cv/Qoz+sYa5wfTMs4Maw0aRQ=
X-Received: by 2002:a05:620a:1904:b0:8ca:123e:819c with SMTP id af79cd13be357-8cbc8dafbb8mr1531677585a.35.1772477722001;
        Mon, 02 Mar 2026 10:55:22 -0800 (PST)
X-Received: by 2002:a05:620a:1904:b0:8ca:123e:819c with SMTP id af79cd13be357-8cbc8dafbb8mr1531673885a.35.1772477721408;
        Mon, 02 Mar 2026 10:55:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12357abb7sm67896e87.46.2026.03.02.10.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 10:55:20 -0800 (PST)
Date: Mon, 2 Mar 2026 20:55:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
Message-ID: <7qxmeky3gwuk52v6pfbu6oqto7tblbjgcfy6mdpm5zssn37d64@vailzpjqpwpw>
References: <20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com>
 <8946c2fa-7b05-4f58-a11e-fa077dc0a267@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8946c2fa-7b05-4f58-a11e-fa077dc0a267@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE0OCBTYWx0ZWRfX9jUhiZA11E8U
 Kop7y5Nb3s0/GBz6qeAVjfE/+MxJGA6ptBp86CsB0s4sdmOMdIJCeWpirQVkqWPKMz45af5I6Jr
 SSxHhXZLG8G9blTHj9DWH1GUUkmBpkZIikbPX565Scp/Y28ZvxbGlbla7ZmQiQoPg/ESg1uJEoS
 EGV3t8jzL7OVLu+BNj1gry6lDSFObCU0jj5k88kE0VttMr2xO7XTEXq1UEdHMAkLVKw+mAOG2N3
 KJ4orLMj9f3SnpFqaZhOBFu+T1xfZwAZDku94liDj8UBzAL9gvEt/7Q3yHUqWUocMEF03reOdhl
 lREzv7NJ5PkWFDkyul3NlvYtxOoMA/1MhRpgz4WA9mHyDG/3lfxMnN0zF+k30PT0aKHJISYrGeL
 AimQBySOCSiyR6kT91Jx7rcnA0weCjxr0GrXAtGbSrnf5zReNw292B8oEz/0UWN5TSGp5hkOes1
 ZVio6PhCLxupJHi/FCA==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a5dd1b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=usjzoXVxuAiFj7vtq0gA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Zi70VAmrvXRAOrVC4WeV658SwOusmCCO
X-Proofpoint-GUID: Zi70VAmrvXRAOrVC4WeV658SwOusmCCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_04,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020148
X-Rspamd-Queue-Id: 8AE701DE848
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95024-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,quicinc.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:42:32PM +0530, Akhil P Oommen wrote:
> On 3/1/2026 12:03 AM, Dmitry Baryshkov wrote:
> > Due to the way the DDR controller is organized on Glymur, hardware
> > engineers strongly recommended disabling UBWC bank swizzling on Glymur.
> > Follow that recommendation.
> > 
> > Fixes: 9b21c3bd2480 ("soc: qcom: ubwc: Add configuration Glymur platform")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/ubwc_config.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> > index 1c25aaf55e52..31e0d55c6d9e 100644
> > --- a/drivers/soc/qcom/ubwc_config.c
> > +++ b/drivers/soc/qcom/ubwc_config.c
> > @@ -231,8 +231,7 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
> >  static const struct qcom_ubwc_cfg_data glymur_data = {
> >  	.ubwc_enc_version = UBWC_5_0,
> >  	.ubwc_dec_version = UBWC_5_0,
> > -	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> > -			UBWC_SWIZZLE_ENABLE_LVL3,
> > +	.ubwc_swizzle = 0;
> >  	.ubwc_bank_spread = true,
> >  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
> >  	.highest_bank_bit = 16,
> 
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> 
> We need a fix on the gpu side to properly handle this case. I will post
> a patch.

Ack.


-- 
With best wishes
Dmitry

