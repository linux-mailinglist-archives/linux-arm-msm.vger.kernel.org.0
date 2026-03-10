Return-Path: <linux-arm-msm+bounces-96405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEbEDmlgr2kDWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:06:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CA7242D5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A28613010708
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB1E3A8F7;
	Tue, 10 Mar 2026 00:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAld0740";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZ3TesTR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759932AD3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101144; cv=none; b=TPPiQ5wZ/LyaZo2FgUtPMgtYJIgK6zLJZOO6Nk25gDj1MpMK8hXeK4CV2XhZw1yRv/kfqIvAwZhGR+RJj6HWCeQatgi3jS5pSHBFtSK/ls8nc3FVzuu6P83HMj5XuAAuVKIUDetooXwcZOz5nhg3TTjcjdFcpBX+d55rW4rbSaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101144; c=relaxed/simple;
	bh=T0/65QF3MBJJQP31ZApZm/ZsPyO0vYsXp8Y6HM9btnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhjfDyEBZtEZGea+SHBek77WMOYCHw9Ixq7K9l5AD0UKos7qGih+wugca8QTBr5YBRhhQSdm/fDXlwyCrxkXw107E0InoYj9B8dvzdF7zQbbUo68WW0AKfga6HvV8cE3OD9ZbRUOEde+UD/mQD+Ms0HsNf3e1gxYG8H4/RXo8bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAld0740; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZ3TesTR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBhhr859180
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J5CmMvftPQdRpm7qJMkIbf75
	0JXDyx3tsLWdLk1U9gU=; b=aAld0740yTZ9VG9QfBPf2t95d9Rq13GKogiQTT9O
	YVNYct5kxhrYkFEjXZYiFCXdTWtOqdWX1fz7RdBAaZpaRKHCl6JBvyjwJDw0MExq
	MPLnp0N/nfdlQ7ofieRWP8DLgYGP2IMwPo+ClCXdFtKejxMmF2wPfi/eF8L2ZXc2
	qoMiU/Z28kEbDdzdvme029wGhnBwWs2kX4Bg0SRNeXuQsaHYpoqZwqzIgFowJJdZ
	tVDW/ZSRUhTYKr6CE8vuazziYX9UBcvpmd4i2BwtT9oluohV+EJFOGZXe5yRmbmC
	RF0A28dCIGQZsp3CpyRpHss8KBB6rrl42C6MgloXox7vzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbssv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:05:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7f6ac239so1269462685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101142; x=1773705942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=;
        b=BZ3TesTRoSwYwlNTy3PQYXDgaqwYFryhYolXmEb8MGn6kFstA4er48Mf7xvo/kHopa
         bMLpDQKe+41lXFiBwGPCT0Cq1jQiEgdhk320TVlAN+JEFTqw3nuMDpgP4bdr1CVLpyyG
         ZFIdTrP1fm6yKi+EIa6BZ/PJT8PiD2Lqi5RZAUJOZs9iRQuxqMCRZdav32yjY7Kj9uJJ
         ZJfDGljm3WiYofaZ3cQA2CZZA925CrCzmhWIREM1nLiL70UcVJvC/DO5QOqWjHHTAJE8
         FVmiOWf6oKnTmzYleLRgpYX6G2CLwBtPU2J4C906sBxQL7b99SXe4/yg/2IwroCsOduD
         84dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101142; x=1773705942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=;
        b=qsIr7swEIbT1K9QgVPLLNmsvOOsZOK8UuGo/UoTM1tHEk/uvUseqNcGxeCK/yXYoFz
         rSU1pJ5c+0ibisQ6LZicAxz38ay8MObOqTUICnx1WM4ngR439l9vXorJsYSJ3c+v74GF
         iosJ6BTj+UmAZQesLyDOSRolc9M9SgPC8xSvPlLwJ0CWAbL7jY6ZUKsMK6ZEUj51zKiw
         JphR8KJrchudYMhjJy5rfMdRpPxtnqQJMVetXkqcM5dfdfep8HqM1BFEs/UozLM61apC
         PEy5QCHKZSfGzkefy9fGLVhuQvnShVcLmLbGUAB00XN1HkS0ZNMl6QRKmiG0jYyMlhrx
         37Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUh85uryWztkRiOdMgoXAu3loF7NjY7bru61aSa9RqmL3Sc3/aQGLykCrF75ZqUJbeGgTG7lu9Sf4HK0hTk@vger.kernel.org
X-Gm-Message-State: AOJu0YyFieuLbbUtA1wYIpd3gybfzFeeo346JWSS1sVvSiPGjnSN50kL
	7QwohzuIxRfbiFwvYXZhbKufrQ9I7t2LXudIai2gJddCpxjBmkDWfT159AG40m/xDf+7vyQqCQ9
	FXLP3xGbPynHEofbRvWBRy3yYAo1GKVHouCbgAS8Ru3kJjvSKYe8gqk6PtzBMOOWGazQR
X-Gm-Gg: ATEYQzwKN5AMwfMvbaSWKoZMG7LI+lMzSFGSN0W6oW0ABluAVsDO6dqrLKLBkP1aKTk
	OVzf6/W8DIG7rPNeUOYhQ2Qny4e0U3o6WPHY89mNwUploSEzKFHVwXClLoPARG0OMeFPnbWoSDp
	pIBHfj7QPCAIIPTm3zV4Bpc9ojoWt52q2fnIWUbnKHv8GJu9yPzlQVkk6GcSaLHsxTO95z1a/Lo
	0WCGgmPPLkbBVeHugxGb3QtFMB2V9W3NH0g7VY+FCm4qN48hcrfVIGbbqbFMzhnjQXLkxCcevjW
	0/boz7uRqNFJnUQGutj0AWH/Yg/NeFbHViZAm815dZhvrxM2+KFx6Yl4PjG+OKHvJf1zKCszmz4
	6tToVU64S20JN4R585RdMcX6zLYz9AIH0R6DQP2X4L3ToKNPew+HHscv6kRQAUgwSpXpFDAOYgj
	vsYLNokOdZKJgMTOnIxoRyLWWlhKyAqQseX70=
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491283385a.78.1773101141858;
        Mon, 09 Mar 2026 17:05:41 -0700 (PDT)
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491280685a.78.1773101141400;
        Mon, 09 Mar 2026 17:05:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e051sm2527439e87.57.2026.03.09.17.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:05:40 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:05:38 +0200
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
Subject: Re: [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI service ID
 instead of defining it locally
Message-ID: <uc3jucz5fafdy3d5d4vtykozt5kqfyeax55nb4yjj36vnyxdtw@uwabt65hakpo>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af6056 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=4Fe6SZaiIdGEmwW3mTUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX1zRfbRqnPtA3
 XW0sqMCAdIu+CcCcj09GHzNTlqUgZHJL+cFffIawZYOKR80WehkNg2UinoqxKAJXks/81wln7LC
 TcClSzhMuAdL9JP8GM0EvG+Jh5eU4pqYLxrmzhaYFbo6MBlM/NgSovM67sabpXxBfPbiP/TZ3BN
 TvrXP7+t2xZp0s75RikxlI479hR0YUMHVMaPMtM/wmJFcF4Z7KfzXkGxcWqMC0p/+5hLkefrLan
 t5QcZE0NVxIck/DOFMw5BVhseRq6/Kj+MULhdeIYgr4DsUntR2J5UECew/s4B6rmI4GC3KEbzZY
 wwgc/4Z2qso5RpJRw8ORWQE1wn3oO331O76mshfDeOgTl4N9E2xN2XjqhufG5C2QmcLqanE35qx
 7+AeNUhN/Iqteasa3iiCvsWZK6uV2yCVWfaODbhF3atyNEaeT4FdRZv5XEZOuJtWQgljGcsbDob
 rbh1d1b1CMUjjCYTVIA==
X-Proofpoint-GUID: 8D19K58_iIh3_LKJTdUwF88DjAbzzxXt
X-Proofpoint-ORIG-GUID: 8D19K58_iIh3_LKJTdUwF88DjAbzzxXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-Rspamd-Queue-Id: 69CA7242D5C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96405-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:03:33AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

