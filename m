Return-Path: <linux-arm-msm+bounces-96406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAHWKcVgr2kDWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:07:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A0E242DEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4F913075F82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C66126F0A;
	Tue, 10 Mar 2026 00:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH3i+5Hm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lz7hMBhX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813F93A8F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101200; cv=none; b=K79r72CHuwFxd1TZavQ501UorfJJAQLAIklnnggNIdaHeHzFtuBhxS89X9VuebmgZXTqRAHEiSmthLGXOqG0zIOFde3rI7i5Fa/kpOkgzbGckvBcArUA2JTJouptD19gifGhWw6gue7zZVHgAdy+L2aSXc+p9FgP21MjdVAfeA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101200; c=relaxed/simple;
	bh=tUmt6OxyYKm3dZ2u6t/zmku4MTRZYJky3GUiLcfgz/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcCndDXPUyN1WoBk0roskaBrho/xtJ1CMhO1+gnEcnUzAN9UstPfOtuhr0mXcabkyBHk3uhKM+3TZwN4L92ocwysbupehyy55nj4n2X4c7vDVolQvZTyYHMWfhgccK0nmlI/5gY+QBjSffTlHmMoPQqqQCyKX1ak7A1P48y+0V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH3i+5Hm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lz7hMBhX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCNMB2428827
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hhzas3m6jtpCWQCVIcrAsr4W
	EI6JkmKF0k2Y62ZMW8M=; b=RH3i+5HmDrcWtIsbYsGLYPAucQJ49p5jSFCP1XK8
	cmD1TTszcORCF20BgNAuXaMv/jJiLRErS8OSN8QmqlCTHyPy1z+QkEdtxohyjYG7
	A2mADZnPK9mA9JpXvpYpZGSIN7dK+BD6vZgH+2IvNkfpcXulgdym5sqCTauzjtkf
	vtuiyUTc65s3tMmjbV0vaKA2UBoopnEDP+Wh4kABNLM7l2sm0CNYv97yvtbjRe+8
	S+oMT8HwInm2qtDIf1ZRhXBmNqquWgIRW4C+P3hXW2N0zjD2euQ9JQXbhB2aEC63
	TEvjc5oqXJ7b/UHtcEB1uZLhcWij+XqY/Bv4WDu7ADTmvA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1eksdh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:06:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7f6ac239so1270063885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101197; x=1773705997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=;
        b=Lz7hMBhXTcTAhut+tWMjq23JjIGrRVAj6Rwy/noN8p1xxb7jhb5SwVyDGw9z+3Hp59
         3X3LwkcAUVL9UAizuXmoJKhB3+TKeFFJHOOS9SqpJjVQ0YSOA/XjHtwSHxruxuKthPJL
         AoTDbyQh9UyVfUeUcO8c2tpLMxp8K5vD2uzDYWSyISP4bNZTE30q/N0CD1TRg16Ugc3H
         rYzjTxphR2PiThhK1SXaMD81PXGZQXkN/dGf6tkQh7KO0KExg2nlAEbNzHlKNN+6/BFI
         ++7CdmSnmAeFUYh6OybHOmJaUPaBn03nGQwRBYR6HXKqI1okFEz3VTkVsTSjRJHqv3Zd
         dz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101197; x=1773705997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=;
        b=ETUMu2ayYvLgdytfYtdwsOtGn53gGAA8N+Nn31eIIiJwNmOgNp+CTCyb5JC6SI7+y5
         CU6pssV91zOiKfFwNhDnEPvVwzqQwhe06ZHBzPKa7bD57Ko0G2xmcnzFDzbFEmPMfpa9
         sqwcZg2YpexADzY3IvpV8wkWYRxc/NR/l6N55PL2Ska7p26WshKBlSn4yjAWMgTRn/fs
         TiUCFqfIMQ+jYqNU4rsRc7SWoNkcqIQ1z1RAP9LGiJ7Yx3Sbn2iNlwSRUBQ2VGShcCdM
         dpsHQlsn5CXIXJmcMu3tZOrOTMYQtNQNv0P4Aw4IszPfVDseENHOJFan4Xn30KtT5eCn
         wRIA==
X-Forwarded-Encrypted: i=1; AJvYcCVj/PAP3yL4IppJiUobOs/RQI5Enw3dvE35PMomOZwOvAkzazlepUSBKQ2CdeEFZ06NUjxib6uf4wV+tA+3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6P35QoNrZQ0vwW3WKnHgenkiqnxddFsCjbGzTSj2QoG4H0/K0
	GzMVoSGXvNjAxKTT0pLpaAr56xz3YqlWxEU+Tdn+5Z2nZy0K0tsURem+wHhbUsQyVHg8LDtkKzy
	aGn3Tr1ScEKESkApeCSZ01LbBUYW5+jdA3e6RpoAXZo9t9VSXoJ+Guo0f5PmXOFeWW2gU
X-Gm-Gg: ATEYQzzIqLjm0KzJedSmqojDc/h5FDrGXOHmo0w+LjS6uZsCWncnZ57azWbxOs06lUC
	njtJalSfjfd5k+GutarwoFUgV7GP9lQ1lRH+R28BJGOjaI6er03TkQJPPnxCVUdW1sYsQiNmhNW
	ikHJT1HS9Vta92s+kptW6OaDcAxMjVDINaoa3pAGiPH8x0VCcfKdxLptwFZsgNo1L5qiRBEgdHM
	Ye12QOlLuDkEfIcZBj8sehDnQGogDsFfoF+liIm5xbRj/vAOiRMrr6EcyDDTUIqdkqlBM6yEtD1
	gcukIMND2/3KCf3E3Z+VnY4K+9TA7BUBJdOnFIg8aIioPqw7qv+oM+J6KJZr3cjAJWUQkVH+6wK
	/r6fvqzM85/KB978sgHNPmxvMJdqbhR/4UfoadLdNwFgECIOP4epLRT/GnH5sUV8cl2CF5MV7L+
	jGrU+oHEh4kOjgOF89oUHPeYKjduSM8dV4lok=
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491596685a.78.1773101196839;
        Mon, 09 Mar 2026 17:06:36 -0700 (PDT)
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491592585a.78.1773101196256;
        Mon, 09 Mar 2026 17:06:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d269sm2464700e87.84.2026.03.09.17.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:06:34 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:06:33 +0200
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
Subject: Re: [PATCH v1 5/8] slimbus: qcom-ngd-ctrl: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <6dvg5nev7sbqyfhmzgw3oln7hb4b4jlw2yhrskrcibdscoziox@hir4jpjcrzey>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-GUID: ahCBaj-2akA5yGxTuYx32zN5JBuD9w0Y
X-Proofpoint-ORIG-GUID: ahCBaj-2akA5yGxTuYx32zN5JBuD9w0Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX8oqWu4VrSaLT
 UufqXV0nmk+z+UpoY6HlvmundlXSx8foJ/0NWH/dLOBMBsa7o694VZasenI5kVm11/rTMnMWpI4
 VibjkeWsZL6oYfXCRkpz9AFXgznxSFyuBOyWbrT5FJJfN1dnggZvEynIBEDhjqx6UAJ0eaisJcs
 5FZciRB31kuM+FgXuEd7mlVr4+nFX8rli4UF55KN9Rb3Te4JuPkBQWP8t/j5/s9nDHtNL6IEEFq
 dVRpr+spzw9o7V4Ng9qEQqb3pPn0O/TLoM3XbFSLWWChBXBLOWAKhAgBfX43VhtxhpaRPy1nZy5
 NkN81FOoy91aSavdPp/b9jot23r/Z+L2RdX10e1JprXnGvPpDi8APB5KfOXPvzCQTaDgPNSMtGO
 J47eqgkRS52A4xLAM0d6XGsn6ZTZSRTK8rJWxlNU8A6YtcPYTAQFyPiVKbATkRTm9GhYxFoPQIU
 8yjp3s5VvBaBipF75vg==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af608d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ho3SWJPnPTLIVTUpvTwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-Rspamd-Queue-Id: 48A0E242DEB
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-96406-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:03:34AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

