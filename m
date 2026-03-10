Return-Path: <linux-arm-msm+bounces-96402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C/BKwZgr2kDWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:04:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE21242CE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:04:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41C6B306CC1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BB3262A6;
	Tue, 10 Mar 2026 00:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nZkP6IpY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HL136g9U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8A0173
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101054; cv=none; b=To5Q8yuqlkMeid4eMyj9cYo3cpDSik90WAEekDkCtbCJr7JbG5eyhOpdloOh3lXi7L2yNaj81fge43Tayx6NOIE2EPa0r+t40FWfti46zJXx7B/UksDDvivjMqgJ5ZGlrH3oVsN8g7/axMdizxKesn3Zk3DfTuT3MOYiykJqcTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101054; c=relaxed/simple;
	bh=VQWCIUrbKweKNWorNf7KFwPTbOnRWvHmue3DUd7hCW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgTkXM0kOrC9OixD2PcE0n9tfe12YVmaA+gJ+tCLPBsryTU7UA4AZwVXEV/2lWF/NTWPAamdyVtFiXVWXbihBvRGlJPWvOxwyg05QPXpYsIt/pf87mLhEW+VEwvA0IDtAcveS5YgyJw4vIj+3fdy/1sMlEcMAd9Lb0ZBSswQyEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nZkP6IpY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HL136g9U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBoFE859679
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDBB6MSWvIU+uCb142BM52FL
	425T3hgvc07Yy4sfD2U=; b=nZkP6IpYkgOyZjCtuUwwRI/ObSj6aw7Irq10/R97
	PPiuu9fKLJwceK/Xpa/ltlNYRujyeGcThKXjnd1ZPj5BOWnCNOnOT+tuwIqX/9kg
	KPHv56GsLwKOToA1ScWSDHUqqWofqSFma5li/xOf+VFsbJXzKPscn2meX2n5aZsf
	XtSa6ak0iWjrflH7/qf8aiyE2D1I5OaO4RYJrfzuX/e3VtNDkNowVusVOqEC87Nz
	wJ5TX8ER5EDtnxm7bXTGnP6qHbg93W0JM7UpnEpZ2OW0EXBM4a3Wqe4flApHSn5I
	uOLdhni2r/07ThP2hR/CEJLCeB4ZAOY0/M80kRu9WTivcw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbsskn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:04:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77502295so1441654585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101052; x=1773705852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDBB6MSWvIU+uCb142BM52FL425T3hgvc07Yy4sfD2U=;
        b=HL136g9UKbHSedrtjUerN3cCib9lfxyUL+gVy1If8gubrc5bFeDRE9KktfjMH8KeDr
         wUitAU1ORz6QySSi2SvmBdOq41kGbOdWSAb/iHbt9/gmHJ6kijPybCcrdnb8yUwV1Cna
         g3uORZV3Hc98o8ZbXAgApWj3gxm18s0szdrQ5567FBaK557TRRWDsQwUTggUaCaCEF6V
         x7UD02LMSFvajQ3bUccJXPlkqxbCtDWcKdsgjksy+Bc961OrWXNjszzx0hviwvyaGwmm
         Hr8p4AQrzW+FCgA9WlHoB5wpaKbK2KWI0ZfXr2TPdhUf/vOc1OjKusRLptBT62qLXm4c
         U5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101052; x=1773705852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDBB6MSWvIU+uCb142BM52FL425T3hgvc07Yy4sfD2U=;
        b=Rap7d0xLNb4rP1NY7iLVrqg5B2pAXs8YNwtFgE6j11oU0e44sQZ2Ag2GWz7OjtiNrd
         qluiPOBJtfOdV42Cw0Wb+LTD8/gm+JWKP5/m/zNg7riorAnxvH2dF5n7vpfr5k5lnwZB
         5epyt2Ei4XKkSKZ+AdGyrnXMEc7Zy0JXcHvIbAipdpZUxblVoqnoR9mV3eygbcMn4Fno
         YEWtkEzeCh+So0HjUmnY5Rcwa2saoB9yQq5KYuIwDkWSgrwsGmmcbxqrW9zy5nkVB8XJ
         parl1ng3DPYrKmD6Ktz1mlUMeBo2WxCNZ/6AXlNiOk5PZuynkSFOlMdyjkCShxCUtC4w
         4N9g==
X-Forwarded-Encrypted: i=1; AJvYcCU7aspu27K26bJJHhv5ZFwd5656o9XwYMIVmlb2VG8ZXJmBySdijKXisP6f/BUg9XPqnt2ERgt/wWJsDtXX@vger.kernel.org
X-Gm-Message-State: AOJu0YxAnE5bupSR0qGVv6F0c8vavdmq5WtsitVJ1f8mxr6MDdUpw/P0
	sSd+DrAcKw0K994qpum3xwpWnt+5mZgUXP9bLsKJmn7/KyMsPniF9xrxgkw5TwyxlmpRLdcIm3r
	NqERs6JUSlFuoMK7FpmAxqJdbreJjbOCNIutYDFMEqbq+RZYPlKtE5BDk3VH7Hif5s9Yw
X-Gm-Gg: ATEYQzwbrCOJu0g4cNmgNexkmg9QHJL3ov473uLSfQuct4bY6S+qotjqZ6hbUHVJTRh
	4M+loNZPW2Cyq9j1fdepQ1BbygBcx0cKZEYEimu/ImQtG2p2z1q3kLrp4QA344xU40ekzhWhs72
	0WOWsk3GDHvVox5TH4YMV9z/klQzTkIud+KVfypBAhYPoUmnNJV/zRkFwcm0odY/pslsjr4INea
	lxoojsSaGncerGGQfceEp3CVeQvv/pYpWdII9yGf2SClMLfAhWJ7gKKRtZRzZ57lTSM7eElmRk/
	8s8gU/JmZXBVtTQ4bAbJf527lnnrD+/sTm0CtOn7DZIUrE3dyhZCVwxNjJW6FntzPm7Ux0Nl/zl
	JFEuGfaoYuzSbK3r/5JJnMwqwa7RMYXz/PP06dt6OeSYJvOoxuTh8GG4LbFN0QqguYRUwUAGm+k
	5f/rKyEL5xxZLElImvUG8jgvGptqStJsYwvOw=
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1634216085a.70.1773101051671;
        Mon, 09 Mar 2026 17:04:11 -0700 (PDT)
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1634211085a.70.1773101051178;
        Mon, 09 Mar 2026 17:04:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d085ee3sm2378748e87.62.2026.03.09.17.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:04:10 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:04:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
Message-ID: <3yzmnaovl5dwhxc7r5dr4pjrvcqpmlec5vrlzhnj2cnpobqpq5@uvfiuyakrg6b>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af5ffc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=cjxZHsy2hmLZGnxokmcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX5Hf3v5TnLd30
 lKACG4jZHs4gS/1KruUWtdDzu4EZ3rEyI5U8z67ecDz3XX6V3FpI35L60z/veyEpZQWCu0ZAaNk
 cAo7yvGBV+tS/SOntjsQ0ck4/c/EtGmdQHKax08AX7eM0nUfqOgbtU+3PN1n0XB1+zhTDRQUUGO
 UiWqB3glKt805xDyH05EMQ+7B2T4LYJM8f8FYoYTNJmpst3v21YFu/mINRnWI7/yfCm41OJ2JPS
 oGvE4Y4jBZq9liyfa4t5lCnukEMRUf2C+PEDvbCozMuyLZehh+NOk0JhZVI/9gUgjyuCJKbbhKz
 4nB3H4GfDvQMyh3w8n8BByCB1uN0RlxMS1wxgmR/atRStYrLrZSiTK8BfsazFwRrfgL1VYCbtSY
 Qiq5mHVOLfCNX4OwIy6sKz5tfsLbI4+5D5Fw3lrn0FTxw1r5eaB09g0As4tI/MlY69TZUeZXpul
 uMcYpuBpYaVqVs6F/Bw==
X-Proofpoint-GUID: Gbqv5RggTyTMTQfPRcxJb7TopmBWIzLf
X-Proofpoint-ORIG-GUID: Gbqv5RggTyTMTQfPRcxJb7TopmBWIzLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-Rspamd-Queue-Id: 1CE21242CE3
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-96402-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:03:30AM +0100, Daniel Lezcano wrote:
> The QMI framework proposes a set of services which are defined by an
> integer identifier. The different QMI client lookup for the services
> via this identifier. Moreover, the function qmi_add_lookup() and
> qmi_add_server() must match the service ID but the code in different
> places set the same value but with a different macro name. These
> macros are spreaded across the different subsystems implementing the
> protocols associated with a service. It would make more sense to
> define them in the QMI header for the sake of consistency and clarity.
> 
> This change use an unified naming for the services and enumerate the

Nit: see Documentation/process/submitting-patches.rst, "This patch"

Other than that,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ones implemented in the Linux kernel. More services can come later and
> put the service ID in this same header.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

-- 
With best wishes
Dmitry

