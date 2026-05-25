Return-Path: <linux-arm-msm+bounces-109635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCJlOGsuFGpgKgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:11:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1AF5C9BCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15CFA304339A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861CF37E2FE;
	Mon, 25 May 2026 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGi2RGmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2GsTHYK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D85537DE80
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707254; cv=none; b=aFN8ZuvOu9url76IyDUrrted+5rGbdSD6FUm9fpKgI8Je0nRoB7oRKlVw+EtpGwjhSpU58sIP/qQEU/zOjuWynGt5V7oE+37frsytKLnEetwmyTJJk5tiZgkU6K+mpa38rBQX+NtXegaHCZ6FJfJKVeCYMQU3yvBosJoU4W9abg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707254; c=relaxed/simple;
	bh=Qj1Llq7OC4zvhr5rArx3ZwsQHeqZMEqHrESIwOmoW9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcsLM3B+mY1GXBoAMMW6sLinYdE7IqxkbiMSiLlzK5WN49CDN+O3xAltCGft0URR4uC6BsHel5pUtRUjqozHV8kAqBlMHTM7cDKtKNFFIPithztWaTDkAN79glVdg0Vs6b9icj4mKdAARjfBTdpP+Eyc3D1yi28gZY7GDbau+7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGi2RGmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2GsTHYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9celo1802339
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5NQfF+ZUa2lq7+ZRulYI6A2
	NsYPt5ClBqhGGJ3BoYU=; b=kGi2RGmBw1JUMOoGdEou6hvnPDbPITcGo5Mt/uJu
	CRBahgR1LKFIrw/sgAokxejEB+4OK7Wsu4gDmyxuLP3N++LW/9Wm2s0DAAX+xQGH
	qGXzjDboMFXCPairiM9W8UsJbigEQORV2O1mAD/s4lKSe8UXgXvmbxa07kE0xOXV
	Q68r6KwQkuZo17+sV8NdI+9ZQn7QcO226pjtD5ENpz6qKCahEgUQLTYzVienfz0H
	8nfGnQ8pAcoTEWijFzl9EYYXwwkPURTZ9R8nBnnWithSIdpZrHt0Am3BVeS12VSo
	w7ZZKSCNEF/cb0ZVSmLJrH5vyCOnq3KO8MclI+P/e7zHtw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqg9pg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:07:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63309595daeso14915136137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707250; x=1780312050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/5NQfF+ZUa2lq7+ZRulYI6A2NsYPt5ClBqhGGJ3BoYU=;
        b=i2GsTHYKkpRGRh0EhGCqa5ttHIUzhVqZqOVQyg3O2CizbXTThjXo0YQMt0k1nvFc1g
         UU8gdPPNwhEqXRwM2Eo2A7SGWjr0Kxn75L1eVayWtWZVq75KtKKUFehJmNvi8sbG14Bo
         48UE/eoKvcZZ7yJGV29VFqnywKp8/YC2ZsSUn5FfV0Dg20vMPHeGRfgN1s9wq7NVMaSh
         K3cKf76wjcROSatgEAQYmDylFfgdl5DymurI1vbFv66LIYMrDm7EB2tWETV8N+44WLs6
         8AmTQ5WuwdJD88hFTQhgrTH/RAZzoWKEQ+eNOD+Rxor6K5yMYlzA4SC+808bmdymILRV
         8h8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707250; x=1780312050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5NQfF+ZUa2lq7+ZRulYI6A2NsYPt5ClBqhGGJ3BoYU=;
        b=EAAtq0c4u/zHaxUYvhr1YXf2xx0mmsxq/qi4vN3pVPZZLpPDPEvKqQX6BOUpEB94w+
         8Kpq1nQzqsfYCDwfs1r2rukPFH0Tybfdvu8F4mbYDrLvnVfJXRrB2gCAXJwH3V65xRYS
         +u55lxebXNbhDH/CLqNYWXS47LGo/hchY/qZnDfmri2/HY31cvXvIpZlMrnFJtedYO+4
         EZNdolNImpy1hP0dcRlj84e3WTikDRuYWMbCvNLF7jwDPxrXaBSzG9OSuPIP2qOj/OJs
         pDqjP/8ClEBh/hIxXj1SJkneVaVyh4jveV2iBNgbRaegkI7y02CB5kBEOU3gFBnulpft
         bPTg==
X-Forwarded-Encrypted: i=1; AFNElJ96aQ70QCqm3XP9HGe+mbcAxZ2ESAuBTBOPzEDyjupTVsYA9XrdRVHi9uY38KJkNJy/Nw0HEEC1MHxxeNXu@vger.kernel.org
X-Gm-Message-State: AOJu0YyHCqg36a3KwqNMUjgiujopd2chs4s5A1tHXdvvZ26Kkom3gHsw
	fTp+KSmBig06X6SXAK/yXbUSIjCm3B0tG7NjLtCd/vi50RxBzqKsb1EW54OWgcX5NcSDdV0eG8m
	Yyh8yVqq4KeCZMjM0JuBr2MyST/984NAoun8taCak8RfhVJgSb1UC3WkIH8qVz1YqR045
X-Gm-Gg: Acq92OEsgF8wYEpDcnrQOqz087YFfjguu8vLCEEB6Uf71PW589LrCzXseccE8Ds32Pz
	EHLELt2DN+sQDsCHKvHxqLIGq3N4IacSyRm60qldhKrMIf1lZhseZvLtPdcLHpXkHELgIl18myt
	Y2AyzIHDI4Jmp5/cByr64OJ+LWCPmwoalE0vYypOJKKfkFZMTULcppWi2AVNmV5JOuiKVz3xXQ6
	J40ZhMoUgJ8J5PhzCz0F+hxk2cXGYaynsrQ0ylLkayRU8S8m6bQm0pBDmd/0uYJemAw1hPtkAse
	s9xfS24AwR0FDMIGaLAT8MVa1IIUgkt4fjaX+YzPHLGaCf/fVYcAUq4IByGw0T48kviVAUVsqfn
	fYOHsQAL6OhBbdA1Ca/8DkxESlk6eTly/POFgsGuh4M7C6MoFgBHFx/FVvSLf1KO0NLuLMLbDkS
	ps4grhCzrHHVssqUXAG3cwaGrrUyWJ8tASCx4=
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6780133137.27.1779707250299;
        Mon, 25 May 2026 04:07:30 -0700 (PDT)
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6780116137.27.1779707249899;
        Mon, 25 May 2026 04:07:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf96b3sm2600950e87.80.2026.05.25.04.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:07:28 -0700 (PDT)
Date: Mon, 25 May 2026 14:07:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/7] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Message-ID: <bnwy2srhmflo7drgavqonka7wrzbiwas5xjbabei2b6wfzci2b@62pkd4dr23j5>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-4-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-4-a1d125619a5a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a142d72 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 1oJnxgsZL4eNc289CbUA1wjfGKBfdssm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExMyBTYWx0ZWRfXz5x5ToixvQ7w
 vh/hMv/gO0v64cwdjsOvHPJTAwc3NA7FiaOyO9E34OE40VHaWyDU0xAMBrTJs+SL6RcwJy5k3lQ
 VhuBnv3v/Wr0cwNmfS2uGI+F+0vYI+LYvCol5UiI6PBP2TjKO14Wy6UTVs/CigkVkKjX0xstk6H
 MG2aRCs4lJ1Uewn0JQQOpLtsh/OmEakDYO3jtrgcIPdL56a68W81tGz1OaM9OHg7AgbbkDhrPRx
 jd+JJVxjL8RaDbnCjAAPPIVN1j+ARQ0dKjFu5qR7YYN3RsAf51DIat7oVz9cS4Twf2x9OCP/pYt
 VsW4FlgK6ff2+qyZXYsbBQdu882UzdrhC+9enVywyT+ubMUjbxJCDn6o5Yl1pBBWqqlojy6UlXX
 djK/6E3g3apmELCF4+uDwO/uDnlh1TwaPu3zEIFk7uTbDUdaaZvR71uWJOgSbjnGhtZYrwcy1R1
 smiqiV+1doAPf5IxtBQ==
X-Proofpoint-GUID: 1oJnxgsZL4eNc289CbUA1wjfGKBfdssm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250113
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109635-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A1AF5C9BCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 04:16:06PM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |  10 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/videocc-eliza.c | 404 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 415 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

